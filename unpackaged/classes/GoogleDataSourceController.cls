/*
    Copyright (c) 2009 salesforce.com, inc.
    All rights reserved.
    
    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions
    are met:
    
    1. Redistributions of source code must retain the above copyright
       notice, this list of conditions and the following disclaimer.
    2. Redistributions in binary form must reproduce the above copyright
       notice, this list of conditions and the following disclaimer in the
       documentation and/or other materials provided with the distribution.
    3. The name of the author may not be used to endorse or promote products
       derived from this software without specific prior written permission.
    
    THIS SOFTWARE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS OR
    IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
    OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
    IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, 
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
    NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
    THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
    THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/* This class should only be used in the context of exposing Force.com as a 
 * Google Visualization Data Source. It must be extended by a Data Source 
 * controller similar to the CallVolumeDataSourceController. */
public virtual class GoogleDataSourceController {
    
    // Methods to be overridden by the developer.
    public virtual String getTableName(){ return null; }
    public virtual List<String> getDefaultColumns(){ return null; }
   
    /* Properties */
    private String ObjectName{ get; set; }
    
    private Schema.Sobjecttype ObjectType{
        get{
            if (ObjectType == null){
                Map<String, Schema.Sobjecttype> globalDescribe = Schema.getGlobalDescribe();
                if(ObjectName != null){
                    ObjectType = globalDescribe.get(ObjectName);
                }
                else{
                    return null;
                }   
            }
            return ObjectType;
        }
        
        set;
    }
    
    /* The main method for the page. */
    public String getResponse(){
        System.debug('#### ApexPages.currentPage().getUrl() = ' + ApexPages.currentPage().getUrl());
        
        String query = getQuery();
        String dataTable = getDataTable(query);
        
        // The 'tqx' parameter is a set of colon-delimited key/value pairs for standard or custom parameters. Pairs are separated by semicolons.    
        String tqxRequest = ApexPages.currentPage().getParameters().get('tqx');
        
        TQX_Status status = TQX_Status.OK; 
        String statusMessage = null;
        
        if(dataTable == null){
        	status = TQX_Status.ERROR;
        	statusMessage = TQX_NO_ROWS_RETURNED_ERROR; 
        }
                
        String tqxResponse = processTQXParameter(tqxRequest, status, statusMessage);
        String response;
        if(tqxResponse.contains(TQX_STATUS_ERROR)){
            response = tqxResponse + RESPONSE_END;
        }
        else{
        	response = tqxResponse + 'table:' + dataTable + RESPONSE_END;
        }
        System.debug('#### response = ' + response);
        return response;
    }
    
    private String getQuery(){
        // The 'tq' parameter is the user's query string.
        String query = ApexPages.currentPage().getParameters().get('tq');
        
        /* Without these commented-out lines of code, we aren't actively defending against 
         * SOQL injection attacks at all. The  point of this project is to allow users 
         * to query our Force.com data, and there are a number of queries that might require
         * single-quotes...  
        if(query != null){ 
            query = String.escapeSingleQuotes(query); // Prevent SOQL injection attacks
        }
        */
        
        System.debug('#### "tq" parameter: ' + query);
        System.debug('#### getTableName(): ' + getTableName());
        if(getTableName() != null){
            if(query != null && query.length() > 0){
                // Insert "FROM {tablename}" before the WHERE clause.  
                if(query.toLowerCase().contains('where')){
                    String selectStatement = query.substring(0, query.toLowerCase().indexOf('where'));
                    String whereStatement = query.substring(query.toLowerCase().indexOf('where'), query.length());
                    query = selectStatement + ' FROM ' + getTableName() + ' ' + whereStatement;
                }
                // Insert "FROM {tablename}" before the ORDER BY / LIMIT clauses if there isn't a WHERE clause.  
                else if(query.toLowerCase().contains('limit') || query.toLowerCase().contains('order by')){
                    Integer idxLimit = query.toLowerCase().indexOf('limit');
                    Integer idxOrderBy = query.toLowerCase().indexOf('order by');
                    Integer index;
                    if(idxLimit < 0){ index = idxOrderBy; }
                    else if(idxOrderBy < 0) { index = idxLimit; }
                    else if(idxLimit < idxOrderBy){ index = idxLimit; }
                    else { index = idxOrderBy; }
                    
                    String selectStatement = query.substring(0, index);
                    String endStatement = query.substring(index, query.length());
                    query = selectStatement + ' FROM ' + getTableName() + ' ' + endStatement;
                }
                else{
                    query += ' FROM ' + getTableName();
                }
            }else{
                query = 'SELECT ' + getSelectString(getDefaultColumns()) + ' FROM ' + getTableName();
            }
        }
        System.debug('#### SOQL query: ' + query);      
        return query;
    }
    
    private String getSelectString(List<String> fields){
        String result = '';
        for(Integer i = 0; i < fields.size(); i++){
            result += fields[i];
            if(i < fields.size() - 1){
                result += ',';
            }
        }
        return result;
    }
    
    /* Parses the query and calls the appropriatae query method to create the JSON data structure. */
    private String getDataTable(String query){
        if(query == null || query.length() <= 0){
            return null;
        }
        
        GoogleViz gv = null;
        
        if(query.toLowerCase().contains('count()')){
            gv = getCountQueryDataTable(query);
        }else{
            gv = getQueryDataTable(query);
        }
        
        if(gv.rowCollection != null && gv.rowCollection.size() > 0){
	    	return gv.toJSONString();
        }
        else{
        	return null;
        }
       
    }
   
    /* Executes a 'count' query.
     * Assumes that the query string is of the format: "SELECT count() FROM ..." */
    private GoogleViz getCountQueryDataTable(String query){
        // Execute the query.
        Integer count = Database.countQuery(query);
        
        // Create the GoogleViz data structure.
        GoogleViz gv = new GoogleViz();
        gv.cols = new list<GoogleViz.col>();
        GoogleViz.Col c = new GoogleViz.Col('col0', 'Count', 'number');
        gv.cols.add(c);
        GoogleViz.row r = new GoogleViz.row(); 
        r.cells.add ( new GoogleViz.cell( count ) );
        gv.addRow(r);
        
        return gv;
    } 
    
    /* Executes a regular query. */
    private GoogleViz getQueryDataTable(String query){
        // Execute the query.
        List<sObject> records = Database.query(query);
        
        GoogleViz gv = new GoogleViz();
        
        if(records != null && records.size() > 0){
	        // Get the list of fields that the user has queried.
	        List<String> queriedFields = parseFields(query);
	        
	        // Get a list of the 'primitive' types for the fields that were queried. 
	        // Assume that the order of the primitive types is the same as the order of the fields in the query.
	        List<Primitive> primitiveTypes = getOrderedListOfPrimitiveTypes(queriedFields, records[0]);
	        
	        // Populate the GoogleViz data structure.
	        
	        gv.cols = createColumns(queriedFields, primitiveTypes);
	        gv.rowCollection = createRows(queriedFields, records);  
        }
        return gv;
    }
    
    /* Returns a list of fields that the user wants to query.
     * The list is returned in the same order that the user queried them.
     * All fields returned are in lowercase. */
    private List<String> parseFields(String query){
        String lowerCaseQuery = query.toLowerCase();
        String fieldSubString = query.substring(lowerCaseQuery.indexOf('select') + 'select'.length(), lowerCaseQuery.indexOf('from'));
        List<String> untrimmedFields = fieldSubString.Split(',');
        List<String> fields = new List<String>();
        for(String field : untrimmedFields){
            fields.add(field.trim());
        }
        
        return fields;
    }
    
    
    /* Returns an ordered list of primitive field types. The mapping from DisplayType to primitive is static. 
     * The method uses a sample record to determine the DisplayType of each of the object's fields.
     * Parameters:      
     *      queriedFields - The ordered list of fields that are being queried.
     *      record - A sample record from which a describe call is made. */ 
    private List<Primitive> getOrderedListOfPrimitiveTypes(List<String> queriedFields, sObject record){
        // Use the sample record to execute a describe() call.
        Schema.DescribeSObjectResult objDescribeResult = record.getSObjectType().getDescribe();
        // Get a map from the field names to their SObjectField token representations.
        Map<String, Schema.SObjectField> fieldMap = objDescribeResult.fields.getMap();
            
        List<Primitive> primitiveTypes = new List<Primitive>();
        
        for(String field : queriedFields){
            // The magic incantation to get the 'Force.com' type for the field.
            Schema.SObjectField fieldToken = fieldMap.get(field);
            Schema.Displaytype displayType = fieldToken.getDescribe().getType();
            
            // Convert from the Force.com field type to the GViz type.
            Primitive primitiveType = getPrimitiveMappedType(displayType); 
            
            primitiveTypes.add(primitiveType);
        }
        return primitiveTypes;
    }
    
    private Primitive getPrimitiveMappedType(Schema.displayType dt){
        if(dt == Schema.Displaytype.BOOLEAN){
            return Primitive.TYPE_BOOLEAN;
        }
        else if(dt == Schema.Displaytype.BASE64 || dt == Schema.Displaytype.COMBOBOX || dt == Schema.Displaytype.EMAIL ||
                dt == Schema.Displaytype.ENCRYPTEDSTRING || dt == Schema.Displaytype.ID || dt == Schema.Displaytype.MULTIPICKLIST ||
                dt == Schema.Displaytype.PHONE || dt == Schema.Displaytype.PICKLIST || dt == Schema.Displaytype.REFERENCE ||
                dt == Schema.Displaytype.STRING || dt == Schema.Displaytype.TEXTAREA || dt == Schema.Displaytype.URL){
            return Primitive.TYPE_STRING;
        }
        else if(dt == Schema.Displaytype.CURRENCY || dt == Schema.Displaytype.DOUBLE || dt == Schema.Displaytype.PERCENT){
            return Primitive.TYPE_DOUBLE;                       
        }
        else if(dt == Schema.Displaytype.INTEGER){
            return Primitive.TYPE_INTEGER;                      
        }
        else if(dt == Schema.Displaytype.DATE){
            return Primitive.TYPE_DATE;
        }
        else if(dt == Schema.Displaytype.DATETIME){
            return Primitive.TYPE_DATETIME;
        }
        //else if(dt == Schema.Displaytype.TIME){
        //  return Primitive.TYPE_TIMEOFDAY;
        //}
        else{ throw new NoSuchDisplayTypeException('Displaytype \'' + dt.name() + '\' has not been mapped.'); }
    }    
    
    private List<GoogleViz.col> createColumns(List<String> queriedFields, List<Primitive> primitiveTypes){
        List<GoogleViz.col> cols = new List<GoogleViz.col>();
        
        if(queriedFields != null && queriedFields.size() >= 0){
            for(Integer i = 0; i < queriedFields.size(); i++){
                String fieldName = queriedFields[i];
                Primitive fieldType = primitiveTypes[i];
                GoogleViz.Col c;
                if (fieldType == Primitive.TYPE_BOOLEAN){
                    c = new GoogleViz.Col('col' + i, fieldName, 'boolean'); 
                }
                else if (fieldType == Primitive.TYPE_DATE){
                    c = new GoogleViz.Col('col' + i, fieldName, 'date');
                }
                else if (fieldType == Primitive.TYPE_DATETIME){
                    c = new GoogleViz.Col('col' + i, fieldName, 'datetime');
                }
                else if(fieldType == Primitive.TYPE_DOUBLE || fieldType == Primitive.TYPE_INTEGER){
                    c = new GoogleViz.Col('col' + i, fieldName, 'number');
                }
                else if (fieldType == Primitive.TYPE_STRING){
                    c = new GoogleViz.Col('col' + i, fieldName, 'string');
                }
                else if (fieldType == Primitive.TYPE_TIMEOFDAY){
                    c = new GoogleViz.Col('col' + i, fieldName, 'timeofday');
                }
                else{
                    throw new ColumnTypeNotMappedException();
                }
                
                cols.add(c);
            }
        }
        return cols;
    }
    
    private List<GoogleViz.row> createRows(List<String> queriedFields, List<sObject> records){  
        List<GoogleViz.row> rows = new List<GoogleViz.row>();
        
        for(sObject record : records){
            GoogleViz.row r = new GoogleViz.row();            

            for(Integer i = 0; i< queriedFields.size(); i++){                   
                object value = record.get(queriedFields[i]);
                
                if (value instanceof Boolean){
                    r.cells.add ( new GoogleViz.cell( (Boolean)value ) ); 
                }
                else if (value instanceof Date){
                    r.cells.add ( new GoogleViz.cell( (Date)value ) );
                }
                else if (value instanceof DateTime){
                    r.cells.add ( new GoogleViz.cell( (DateTime)value ) );
                }
                else if(value instanceof Double){
                    r.cells.add ( new GoogleViz.cell( (Double)record.get(queriedFields[i]) ) );
                }
                else if(value instanceof Integer){
                    r.cells.add ( new GoogleViz.cell( (Integer)record.get(queriedFields[i]) ) );
                }
                else if (value instanceof String){
                    r.cells.add ( new GoogleViz.cell( (String)record.get(queriedFields[i]) ) );
                }
                else{
                    throw new RowTypeNotMappedException();
                }
            }
            
            rows.add(r);
        }
        return rows;
    }
    
    public static final String TQX_REQID = 'reqid';
    static final String TQX_RESPONSE_HANDLER = 'responsehandler';
    static final String TQX_VERSION = 'version';
    static final String TQX_OUT = 'out';
    static final String TQX_SIG = 'sig'; // we ignore this param
    
    public static final String TQX_DEFAULT_REQ_ID = 'reqId:\'0\'';
    static final String TQX_DEFAULT_RESPONSE_HANDLER = 'google.visualization.Query.setResponse({';
    static final String TQX_DEFAULT_VERSION = 'version:0.5';
    public static final String TQX_DEFAULT_VERSION_RESPONSE = 'version:\'0.5\'';
    static final String TQX_SUPPORTED_OUT = 'out:json'; 
    public static final String RESPONSE_END = '});';
    
    private enum TQX_Status {OK, WARNING, ERROR}
    
    public static final String TQX_STATUS_OK = 'status:\'ok\'';
    public static final String TQX_STATUS_WARNING = 'status:\'warning\'';
    public static final String TQX_STATUS_ERROR = 'status:\'error\'';
    public static final String TQX_INVALID_OUT_ERROR = 'errors:[{reason:"not_supported",message:"The only supported output format for this server is \'JSON\'."}]';
    public static final String TQX_NO_ROWS_RETURNED_ERROR = 'errors:[{reason:"other",message:"Your query did not return any rows."}]';
    public static final String TQX_UNSUPPORTED_VERSION_WARNING = 'warnings:[{reason:"other",message:"Only Google Visualization API Version 0.5 is supported by this server."}]'; 
    
    private String processTQXParameter(String tqx, TQX_Status tqxStatus, String statusMessage){
        String reqId = TQX_DEFAULT_REQ_ID;
        String responseHandler = TQX_DEFAULT_RESPONSE_HANDLER;
        String version = TQX_DEFAULT_VERSION_RESPONSE;
        
        List<String> results = new List<String>();
        results.add(TQX_DEFAULT_RESPONSE_HANDLER);
        
        if(tqx != null){
            List<String> tqxParams = tqx.split(';');
            for(String paramPair : tqxParams){
                String[] params = paramPair.split(':', -1);
                
                // If there is a 'name' and a 'value', then attempt to parse, otherwise ignore params.
                if(params.size() == 2){
                    if(params[0].toLowerCase() == TQX_REQID){
                        reqId = 'reqId:\'' + params[1] + '\'';
                    }
                    else if(params[0].toLowerCase() == TQX_RESPONSE_HANDLER){
                        responseHandler = params[1] + '({'; // replace the default response handler
                    }
                    else if(params[0].toLowerCase() == TQX_VERSION){
                        //TODO: make in to a warning.
                        if(paramPair != TQX_DEFAULT_VERSION){
                            tqxStatus = TQX_Status.WARNING;
                            statusMessage = TQX_UNSUPPORTED_VERSION_WARNING;
                        }
                    }
                    else if(params[0].toLowerCase() == TQX_OUT){
                        //TODO: make in to an error.
                        if(paramPair.toLowerCase() != TQX_SUPPORTED_OUT){
                            tqxStatus = TQX_Status.ERROR;
                            statusMessage = TQX_INVALID_OUT_ERROR;
                        }
                    }
                } 
            }
        }
        
        String result = responseHandler + version + ',' + reqId + ',';
        
        if(tqxStatus == TQX_Status.ERROR){
        	result += TQX_STATUS_ERROR + ',' + statusMessage;
        }
        else if(tqxStatus == TQX_Status.WARNING){
        	result += TQX_STATUS_WARNING + ',' + statusMessage; 
        }
        else{
        	result += TQX_STATUS_OK + ','; 
        }
        
        return result;
    }
    
    private static String toString(List<sObject> sObjects){
        if(sObjects == null){
            return 'null';  
        }
        String returnValue = '{';
        for(Integer i = 0; i < sObjects.size(); i++){
            if(i!=0){ returnValue += ','; }
            returnValue += '\'' + sObjects[i] + '\'';
        }
        returnValue += '}';
        return returnValue; 
    }
    
    private enum Primitive { TYPE_BOOLEAN, TYPE_DATE, TYPE_DATETIME, TYPE_DOUBLE, TYPE_INTEGER, TYPE_STRING, TYPE_TIMEOFDAY }
    
    private class NoSuchDisplayTypeException extends Exception{}
    private class ColumnTypeNotMappedException extends Exception{}
    private class RowTypeNotMappedException extends Exception{}
    //private class UnsupportedGVizApiVersionRequested extends Exception{}
    //private class UnsupportedOutFormatRequested extends Exception{}
}