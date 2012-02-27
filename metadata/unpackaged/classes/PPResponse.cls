public abstract class PPResponse {
	// Common response information, including a timestamp and the response
	// acknowledgement status.
	public PPResponseEnvelope ResponseEnvelope {get; set;}	
    
    // Constructor
    public PPResponse() {
    	ResponseEnvelope = new PPResponseEnvelope();
    }
    
    public abstract PPResponseEnvelope getResponseEnvelope();
    public abstract void parseResponseParameters(Map<String, String> parameters);
    
    protected void parseCommonParams(Map<String, String> parameters) {
    	try {
			Map<String, String>responseEnvelopeMap = PPUtils.getMapWithSpecificKeys(parameters, PPStaticRes.RESPONSE_ENVELOPE + PPStaticRes.DOT);
			String responseEnvelopeTag = PPStaticRes.RESPONSE_ENVELOPE + PPStaticRes.DOT;
			ResponseEnvelope.parseAttributes(responseEnvelopeMap, responseEnvelopeTag);
    	}
    	catch (System.Exception e) {
    		System.Debug(Logginglevel.ERROR, 'PPResponse:parseCommonParams() : ' + e);
    	}
	}
}