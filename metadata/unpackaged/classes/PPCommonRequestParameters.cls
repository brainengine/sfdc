public class PPCommonRequestParameters {

	public class PPCommonRequestParametersException extends Exception {}
    PPCommonRequestParameters__c paramsObj;
	public string ApplicationName {get {return paramsObj.ApplicationName__c;} private set;} 
    public string CurrencyCode {get {return paramsObj.CurrencyCode__c;} private set;}
    public string DetailLevel {get {return paramsObj.DetailLevel__c;} private set;}
    public string FeePayer {get {return paramsObj.FeePayer__c;} private set;}
    public string Language {get {return paramsObj.Language__c;} private set;}    
    
    public PPCommonRequestParameters(string name) {
    	try{
    		paramsObj = [select ApplicationName__c,CurrencyCode__c,DetailLevel__c,FeePayer__c,Language__c,id from PPCommonRequestParameters__c where name = :name limit 1];
    		// all parameters are required    		
    	}catch(QueryException qex){
    		System.debug('Error when query PPCommonRequestParameters object - did not find any PPCommonRequestParameters with name of ['+name+']');
    		throw new PPCommonRequestParametersException('Error when query PPCommonRequestParameters object - did not find any PPCommonRequestParameters with name of ['+name+']');
    	}
    }
    
    static testmethod void testInstance() {
		try{
			PPCommonRequestParameters k = new PPCommonRequestParameters('nonexistentname');
		}catch(PPCommonRequestParametersException ex){
			system.debug('here: ' +ex.getTypeName());
		   	system.assert(ex.getTypeName().contains('PPCommonRequestParameters.PPCommonRequestParametersException'));
		   	
		}
		
		// test cases for 3_TOKEN Credentials
		PPCommonRequestParameters__c t1 = new PPCommonRequestParameters__c(  ApplicationName__c='DUMMY-APP',CurrencyCode__c='USD',DetailLevel__c='ReturnAll',FeePayer__c='SENDER',Language__c='en_US', name='test' );
		insert t1;
		PPCommonRequestParameters k = new PPCommonRequestParameters('test');
		system.assert(k.ApplicationName == 'DUMMY-APP');
		system.assert(k.CurrencyCode == 'USD');
		system.assert(k.DetailLevel == 'ReturnAll');
		system.assert(k.FeePayer == 'SENDER');
		system.assert(k.Language == 'en_US');
	}

}