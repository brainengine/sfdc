global class PPCancelPreapprovalResponse extends PPResponse{
	// Constructor
	global PPCancelPreapprovalResponse() {
	}
	
	global override PPResponseEnvelope getResponseEnvelope() {
    	return ResponseEnvelope;
    }
    
	public override void parseResponseParameters(Map<String, String> parameters) {
    	super.parseCommonParams(Parameters);
	}
}