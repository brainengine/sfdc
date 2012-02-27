@isTest
private class PPCreateAccountWebOptionsTest {

    static testMethod void populateAttribsTest() {
    	PPCreateAccountWebOptions createAccountWebOptions = new PPCreateAccountWebOptions();
    	createAccountWebOptions.ReturnURL = 'http://www.google.co.in/ig?hl=en'; 
    	
    	Map<String, String> attributesMap = new Map<String, String>();
    	createAccountWebOptions.populateAttributes(attributesMap);
		
	    String tag = PPStaticRes.CREATE_ACCOUNTS_WEB_OPTIONS + PPStaticRes.DOT;
		System.assert(attributesMap.containsKey(tag + PPStaticRes.CREATE_ACCOUNTS_WEB_OPTIONS_RETURN_URL));    
        System.assert(attributesMap.get(tag + PPStaticRes.CREATE_ACCOUNTS_WEB_OPTIONS_RETURN_URL) == 'http://www.google.co.in/ig?hl=en');
    }

}