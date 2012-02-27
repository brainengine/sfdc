public with sharing class Milestone1_Export_Project_Controller { 
    
    private final String ERROR_STRING_FILE_TOO_LONG = 
    	'Project is too large to export. Total characters must be less than ' + Milestone1_Import_Project_Controller.MAX_FILE_SIZE + 
    	'. Current export would be $1 characters long. Please edit your project and try again';
    
    public Milestone1_Project__c rec {get; set;}
    public Boolean exportSuccess{get;set;}
    public Document doc{get;set;}
    public String errorMessage {get; private set;}
    
    public Milestone1_Export_Project_Controller(ApexPages.StandardController stc)
    {
    	errorMessage = null;
    	
        rec = [SELECT Id,
                      Name, 
                      Description__c 
               FROM Milestone1_Project__c
               WHERE Id = :stc.getId()
              ];
    }
    
    public void createExportXML()
    {
        Milestone1_XML_Export_Utility xmlUtil = new Milestone1_XML_Export_Utility();
        String xmlString = xmlUtil.buildProjectXmlString(rec.Id);
        
        // Check export length < max import size
        if( xmlString.length() > Milestone1_Import_Project_Controller.MAX_FILE_SIZE ){
        	errorMessage = ERROR_STRING_FILE_TOO_LONG.replace('$1', xmlString.length().format());
        }
        else{
	        String exportName = rec.Name;
	        String description = rec.Description__c;
	        doc = saveToDocument(exportName,xmlString,description); 
        }
    }
    
    /**
    * Returns true if an error has been flagged
    *
    * @result Boolean True if any error has been flagged
    */
    public Boolean hasError(){
    	return this.errorMessage != null;
    }
    
    public PageReference returnToProject()
    {
        return new ApexPages.StandardController(rec).view();
    }
    
    public PageReference returnToDocument()
    {
        return new ApexPages.StandardController(doc).view();
    }
    
    public Document saveToDocument(String name, String xml, String description) {
        Document d = new Document();
        d.body = Blob.valueOf(xml);
        d.ContentType = 'text/xml';
        d.name = 'Export - ' + name + ' - ' + System.now() + '.xml';
        d.Description = description;
        d.FolderId = UserInfo.getUserId();
        insert d;
        return d;
  }
}