global class PPGetUserAgreementResponse extends PPResponse {
	// This is the text of the actual PayPal user agreement.    
	global String Agreement {get; set;}
	
	global PPGetUserAgreementResponse () {
		Agreement = '';
	}

    global override PPResponseEnvelope getResponseEnvelope() {
    	return ResponseEnvelope;
    }
    
    public override void parseResponseParameters(Map<String, String> parameters) {
    	try {
	    	super.parseCommonParams(parameters);

	    	if (parameters.containsKey(PPStaticRes.AGREEMENT))
	    		Agreement = parameters.remove(PPStaticRes.AGREEMENT);
    	}
    	catch (System.Exception e) {
    		System.Debug(Logginglevel.ERROR, 'PPGetUserAgreementResponse:parseResponseParameters() : ' + e);
    	}
    }
}