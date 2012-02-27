global class PPResponseEnvelope {
    // Acknowledgement code.
    global String Ack {get; set;}
    
    // Correlation ID. Used only by Developer Technical Support.
    global String CorrelationId {get; set;}
    
    // Build number. Used only by Developer Technical Support.
    global String Build {get; set;}
    
    // The date on which the response was sent. The time is currently 
    // not supported.
    global String StringTimestamp {get; set;}
    
    // Constructor
    global PPResponseEnvelope() {
    	StringTimestamp = '';
    	Ack = '';
    	CorrelationId = '';
    	Build = '';
    }
    
    public void parseAttributes(Map<String, String> responseEnvelopeMap, String responseEnvelopeTag) {
    	String tag = responseEnvelopeTag + PPStaticRes.ACK;
		if (responseEnvelopeMap.containsKey(tag)){
			Ack = responseEnvelopeMap.remove(tag);
		}
		
		tag = responseEnvelopeTag + PPStaticRes.CORRELATION_ID;
		if (responseEnvelopeMap.containsKey(tag)){
			CorrelationId = responseEnvelopeMap.remove(tag);
		}
		
		tag = responseEnvelopeTag + PPStaticRes.BUILD;
		if (responseEnvelopeMap.containsKey(tag)){
			Build = responseEnvelopeMap.remove(tag);
		}
		
		tag = responseEnvelopeTag + PPStaticRes.TIME_STAMP;
		if (responseEnvelopeMap.containsKey(tag)) {
			StringTimestamp = responseEnvelopeMap.remove(tag);
		}
    }
}