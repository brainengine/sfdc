global class PPCreateAccountWebOptions {
	// (Required) The URL to which the business must redirect the 
	// PayPal account user during account creation.
	global String ReturnURL {get; set;} 

	global PPCreateAccountWebOptions() {
		ReturnURL = '';
	}
	
	public void populateAttributes(Map<String, String> createAccountWebOptionsMap){

    	if (Null != createAccountWebOptionsMap) {
	    	String tag = PPStaticRes.CREATE_ACCOUNTS_WEB_OPTIONS + PPStaticRes.DOT;

	    	if (Null != ReturnURL && 0 != ReturnURL.length())
				createAccountWebOptionsMap.put(tag + PPStaticRes.CREATE_ACCOUNTS_WEB_OPTIONS_RETURN_URL, ReturnURL);
    	}		
	}
	
}