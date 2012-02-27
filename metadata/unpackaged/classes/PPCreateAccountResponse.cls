global class PPCreateAccountResponse extends PPResponse {
	// A unique key that identifies the account that was created. You can 
	// use this key to identify the account in the GetUserAgreementRequest 
	// message.
	global String CreateAccountKey {get; set;}
	
	// The status of the payment.
	global String ExecStatus {get; set;}
	
	// URL to which you user needed to redirect to complete the account 
	// creation process.
	global String RedirectURL {get; set;}

	// Constructor
	global PPCreateAccountResponse() {
		CreateAccountKey = '';
		ExecStatus = '';
		RedirectURL = '';
	}
	
    global override PPResponseEnvelope getResponseEnvelope() {
    	return ResponseEnvelope;
    }
    
    public override void parseResponseParameters(Map<String, String> parameters) {
    	try {
	    	super.parseCommonParams(parameters);

	    	if (parameters.containsKey(PPStaticRes.CREATE_ACCOUNT_KEY))
	    		CreateAccountKey = parameters.remove(PPStaticRes.CREATE_ACCOUNT_KEY);
	    		
	    	if (parameters.containsKey(PPStaticRes.EXCEC_STATUS))
	        	ExecStatus = parameters.remove(PPStaticRes.EXCEC_STATUS);

	    	if (parameters.containsKey(PPStaticRes.REDIRECT_URL))
	        	RedirectURL = parameters.remove(PPStaticRes.REDIRECT_URL);
    	}
    	catch (System.Exception e) {
    		System.Debug(Logginglevel.ERROR, 'PPCreateAccountResponse:parseResponseParameters() : ' + e);
    	}
    }
}