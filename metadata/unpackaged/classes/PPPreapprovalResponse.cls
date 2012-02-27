global class PPPreapprovalResponse extends PPResponse {
	// (Required) A preapproval key that identifies the preapproval for which 
	// you want to retrieve details. The preapproval key is returned in the
	// PreapprovalResponse message.
	global String PreapprovalKey {get; set;}
	
	// Constructor
	global PPPreapprovalResponse() {
		PreapprovalKey = '';
	}
    
    global override PPResponseEnvelope getResponseEnvelope() {
    	return ResponseEnvelope;
    }
    
    public override void parseResponseParameters(Map<String, String> parameters) {
    	try {
	    	super.parseCommonParams(parameters);
	    	if (parameters.containsKey(PPStaticRes.PREAPPROVAL_KEY))
	    		PreapprovalKey = parameters.remove(PPStaticRes.PREAPPROVAL_KEY);
    	}
    	catch (System.Exception e) {
    		System.Debug(Logginglevel.ERROR, 'PPPreapprovalResponse:parseResponseParameters() : ' + e);
    	}
    }
}