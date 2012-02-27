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

/* This class tests the GoogleDataSourceController. */
public class GoogleDataSourceControllerTest extends GoogleDataSourceController {
	public override String getTableName(){ return 'Account'; }
	
	public override List<String> getDefaultColumns() { 
		return new List<String>{ 'Id', 'Name', 'Website', 'Phone', 'NumberOfEmployees', 'Industry', 'Description', 'AnnualRevenue' }; 
	}

    private testMethod static void testAccountDataTableCreation(){
    	// Create our test data
    	Account a = new Account();
    	a.Name = 'Test Account';
    	a.Website = 'www.test.com';
    	a.Phone = '555-555-1212';
    	a.NumberOfEmployees = 1000;
    	a.Industry = 'Banking';
    	a.Description = 'A great company.';
    	a.AnnualRevenue = 1000.0;
    	insert a;
    	
    	Account accountCreatedDate = [SELECT CreatedDate FROM Account WHERE Id= :a.Id];
    	
    	String expectedJSON = 
 			'google.visualization.Query.setResponse({version:\'0.5\',reqId:\'0\',status:\'ok\',' + 
 				//'table:{cols: [{id: "col0", label: "Website", type: "string"},{id: "col1", label: "Phone", type: "string"},{id: "col2", label: "NumberOfEmployees", type: "number"},{id: "col3", label: "Industry", type: "string"},{id: "col4", label: "Id", type: "string"},{id: "col5", label: "Description", type: "string"},{id: "col6", label: "CreatedById", type: "string"},{id: "col7", label: "AnnualRevenue", type: "number"}], rows: [{c:[{v: "www.test.com"},{v: "555-555-1212"},{v: 1000.0},{v: "Banking"},{v: "0018000000WQ1nuAAD"},{v: "A great company."},{v: "00580000001YrssAAC"},{v: 1000.0}]}]}});';
 				'table:{cols: [{id: "col0", label: "Website", type: "string"},{id: "col1", label: "Phone", type: "string"},' + 
							  '{id: "col2", label: "NumberOfEmployees", type: "number"},{id: "col3", label: "Industry", type: "string"},' + 
							  '{id: "col4", label: "Id", type: "string"},{id: "col5", label: "Description", type: "string"},' +
							  '{id: "col6", label: "CreatedById", type: "string"},{id: "col7", label: "AnnualRevenue", type: "number"},' + 
							  '{id: "col8", label: "IsDeleted", type: "boolean"},{id: "col9", label: "CreatedDate", type: "datetime"}], ' + 
			 		   'rows: [{c:[{v: "www.test.com"},{v: "555-555-1212"},{v: 1000.0},{v: "Banking"},{v: "' + a.Id + '"},' + 
					 	          '{v: "A great company."},' +
					 	          '{v: "' + UserInfo.getUserId() + '"},{v: 1000.0},{v: false},' + googleViz.dateToGVizDate(accountCreatedDate.CreatedDate) + ']}]}});';

    	// Instantiate the page and the controller.
    	PageReference pageRef = Page.GoogleDataSourceControllerTester;
    	Test.setCurrentPage(pageRef);
    	GoogleDataSourceControllerTest controller = new GoogleDataSourceControllerTest();
    	
    	// Only retrieve the record that we've created in this testMethod.
    	String query = 'SELECT Website, Phone, NumberOfEmployees, Industry, Id, Description, CreatedById, AnnualRevenue, IsDeleted, CreatedDate WHERE Id=\'' + a.Id + '\'';
    	pageRef.getParameters().put('tq', query);
    				 	          
 		String actualJSON = controller.getResponse();

    	System.debug('\n\n #### EXCPECTED:' + expectedJSON);
    	System.debug('\n\n #### ACTUAL:   ' + actualJSON + '\n');
    	
    	System.assertEquals(expectedJSON, actualJSON);
    }
    
    private static String TEST_reqId = 'reqId:1';
    private static String TEST_version = 'version:0.5';
    private static String TEST_out = 'out:json';
    private static String TEST_responseHandler = 'responseHandler:myQueryHandler'; 
    
    private testMethod static void testHandlingAllTQXParameters(){
    	// Create an Account, so that we can query for it, so that we can assume the 'tq' portion of the query went fine.
    	Account a = new Account();
    	a.Name = 'Test Account';   	
    	insert a;
    	
    	// Instantiate the page and the controller.
    	PageReference pageRef = Page.GoogleDataSourceControllerTester;
    	Test.setCurrentPage(pageRef);
    	GoogleDataSourceControllerTest controller = new GoogleDataSourceControllerTest();
    	
    	// Only retrieve the record that we've created in this testMethod.
    	pageRef.getParameters().put('tq', 'SELECT Name WHERE Id=\'' + a.Id + '\'');
    	
    	// The bit we really care about: the tqx parameter
    	String tqx = TEST_version + ';' + TEST_reqId + ';' + TEST_out + ';' + TEST_responseHandler;
    	pageRef.getParameters().put('tqx', tqx);	

 		String response = controller.getResponse();

		System.assert(response.contains('reqId:\'1\''));
		System.assert(response.contains('version:\'0.5\''));
		System.assert(response.contains(GoogleDataSourceController.TQX_STATUS_OK));
		System.assert(response.contains('table'));
		System.assert(response.startsWith('myQueryHandler({'));
		
		// we never return a 'sig' value.
		System.assert(!response.contains('sig'));
    }
    
    private testMethod static void testHandlingMissingAllTQXParameters(){
    	// Create an Account, so that we can query for it, so that we can assume the 'tq' portion of the query went fine.
    	Account a = new Account();
    	a.Name = 'Test Account';   	
    	insert a;
    	
    	// Instantiate the page and the controller.
    	PageReference pageRef = Page.GoogleDataSourceControllerTester;
    	Test.setCurrentPage(pageRef);
    	GoogleDataSourceControllerTest controller = new GoogleDataSourceControllerTest();
    	
    	// Only retrieve the record that we've created in this testMethod.
    	pageRef.getParameters().put('tq', 'SELECT Name WHERE Id=\'' + a.Id + '\'');

		// The bit we really care about: the tqx parameter
    	String tqx = null;
    	pageRef.getParameters().put('tqx', tqx);

 		String response = controller.getResponse();

		System.assert(response.contains(GoogleDataSourceController.TQX_DEFAULT_REQ_ID));
		System.assert(response.contains(GoogleDataSourceController.TQX_DEFAULT_VERSION_RESPONSE));
		System.assert(response.contains(GoogleDataSourceController.TQX_STATUS_OK));
		System.assert(response.contains('table'));
		System.assert(response.startsWith('google.visualization.Query.setResponse('));
		
		// we never return a 'sig' value.
		System.assert(!response.contains('sig'));
    }
    
    private testMethod static void testInvalidTQXParameter_Out(){
    	// Create an Account, so that we can query for it, so that we can assume the 'tq' portion of the query went fine.
    	Account a = new Account();
    	a.Name = 'Test Account';   	
    	insert a;
    	
    	// Instantiate the page and the controller.
    	PageReference pageRef = Page.GoogleDataSourceControllerTester;
    	Test.setCurrentPage(pageRef);
    	GoogleDataSourceControllerTest controller = new GoogleDataSourceControllerTest();
    	
    	// Only retrieve the record that we've created in this testMethod.
    	pageRef.getParameters().put('tq', 'SELECT Name WHERE Id=\'' + a.Id + '\'');

		// The bit we really care about: the tqx parameter
    	String tqx = 'out:html';
    	pageRef.getParameters().put('tqx', tqx);

 		String response = controller.getResponse();

		System.assert(response.contains(GoogleDataSourceController.TQX_STATUS_ERROR));
		System.assert(response.contains(GoogleDataSourceController.TQX_INVALID_OUT_ERROR));
		System.assert(!response.contains('table'));
    }
    
	private testMethod static void testUnsupportedTQXParameter_Version(){
    	// Create an Account, so that we can query for it, so that we can assume the 'tq' portion of the query went fine.
    	Account a = new Account();
    	a.Name = 'Test Account';   	
    	insert a;
    	
		// Instantiate the page and the controller.
    	PageReference pageRef = Page.GoogleDataSourceControllerTester;
    	Test.setCurrentPage(pageRef);
    	GoogleDataSourceControllerTest controller = new GoogleDataSourceControllerTest();
    	
    	// Only retrieve the record that we've created in this testMethod.
    	pageRef.getParameters().put('tq', 'SELECT Name WHERE Id=\'' + a.Id + '\'');

		// The bit we really care about: the tqx parameter
    	String tqx = 'version:0.6';
    	pageRef.getParameters().put('tqx', tqx);

 		String response = controller.getResponse();
 		
		System.assert(response.contains(GoogleDataSourceController.TQX_STATUS_WARNING));
		System.assert(response.contains(GoogleDataSourceController.TQX_UNSUPPORTED_VERSION_WARNING));
		System.assert(response.contains('table'));
    }
	
	private testMethod static void testCountQuery(){
    	// Create an Account, so that we can query for it, so that we can assume the 'tq' portion of the query went fine.
    	String expectedJSON = 'google.visualization.Query.setResponse({version:\'0.5\',reqId:\'0\',status:\'ok\',' + 
    						  'table:{cols: [{id: "col0", label: "Count", type: "number"}], rows: [{c:[{v: 1.0}]}]}});';
    	
    	Account a = new Account();
    	a.Name = 'Test Account';   	
    	insert a;
    	
		// Instantiate the page and the controller.
    	PageReference pageRef = Page.GoogleDataSourceControllerTester;
    	Test.setCurrentPage(pageRef);
    	GoogleDataSourceControllerTest controller = new GoogleDataSourceControllerTest();
    	
    	// Only retrieve the record that we've created in this testMethod.
    	pageRef.getParameters().put('tq', 'SELECT COUNT() WHERE Id=\'' + a.Id + '\'');

 		String response = controller.getResponse();
 		
		String actualJSON = controller.getResponse();

    	System.debug('\n\n #### EXCPECTED:' + expectedJSON);
    	System.debug('\n\n #### ACTUAL:   ' + actualJSON);
    	
    	System.assertEquals(expectedJSON, actualJSON);
    }
    
    private testMethod static void testLimitAndOrderByClauses(){
    	// Create an Account, so that we can query for it, so that we can assume the 'tq' portion of the query went fine.
    	String expectedJSON = 'google.visualization.Query.setResponse({version:\'0.5\',reqId:\'0\',status:\'ok\',' + 
    						  'table:{cols: [{id: "col0", label: "Name", type: "string"}], ' + 
    						  'rows: [{c:[{v: "Test Account2"}]},{c:[{v: "Test Account1"}]}]}});';
    	
    	Account a1 = new Account();
    	a1.Name = 'Test Account1';   	
    	insert a1;
    	
    	Account a2 = new Account();
    	a2.Name = 'Test Account2';   	
    	insert a2;
    	
		// Instantiate the page and the controller.
    	PageReference pageRef = Page.GoogleDataSourceControllerTester;
    	Test.setCurrentPage(pageRef);
    	GoogleDataSourceControllerTest controller = new GoogleDataSourceControllerTest();
    	
    	// Only retrieve the record that we've created in this testMethod.
    	pageRef.getParameters().put('tq', 'SELECT Name ORDER BY CreatedDate DESC, Name DESC LIMIT 2' );

 		String response = controller.getResponse();
 		
		String actualJSON = controller.getResponse();

    	System.debug('\n\n #### EXCPECTED:' + expectedJSON);
    	System.debug('\n\n #### ACTUAL:   ' + actualJSON);
    	
    	System.assertEquals(expectedJSON, actualJSON);
    }
    
    private testMethod static void testNoResults(){
    	String expectedJSON = 
 			'google.visualization.Query.setResponse({version:\'0.5\',reqId:\'0\',status:\'error\',' + 
 			'errors:[{reason:"other",message:"Your query did not return any rows."}]});';

    	// Instantiate the page and the controller.
    	PageReference pageRef = Page.GoogleDataSourceControllerTester;
    	Test.setCurrentPage(pageRef);
    	GoogleDataSourceControllerTest controller = new GoogleDataSourceControllerTest();
    	
    	// Only retrieve the record that we've created in this testMethod.
    	String query = 'SELECT Id, Name WHERE Name=\'1234567890ASDFasdfQWERTqwert\'';
    	pageRef.getParameters().put('tq', query);
    				 	          
 		String actualJSON = controller.getResponse();

    	System.debug('\n\n #### EXCPECTED:' + expectedJSON);
    	System.debug('\n\n #### ACTUAL:   ' + actualJSON + '\n');
    	
    	System.assertEquals(expectedJSON, actualJSON);
    }
}