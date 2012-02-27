global class PPFaultMessageException extends Exception {
	global PPResponseEnvelope ResponseEnvelope {get; set;}	
    global List<PPErrorData> ErrorList {get; set;}

    public void populateWithFaultMessage(Map<String, String> errorParameters) {
		ResponseEnvelope = new PPResponseEnvelope();
		ErrorList = new List<PPErrorData>();
    	
    	if(Null != errorParameters) {
	    	try {

				Map<String, String>responseEnvelopeMap = PPUtils.getMapWithSpecificKeys(errorParameters, PPStaticRes.RESPONSE_ENVELOPE + PPStaticRes.DOT);
				String responseEnvelopeTag = PPStaticRes.RESPONSE_ENVELOPE + PPStaticRes.DOT;
				ResponseEnvelope.parseAttributes(responseEnvelopeMap, responseEnvelopeTag);
				
	    		Integer errorNo = 0;
	    		Boolean isMoreError = true;
	    		while (isMoreError) {
					String errortag = PPStaticRes.ERROR + PPStaticRes.OPENING_BRACKET + errorNo + PPStaticRes.CLOSING_BRACKET + PPStaticRes.DOT;
					Map<String, String> errorMap = PPUtils.getMapWithSpecificKeys(errorParameters, errortag);
					if (Null != errorMap && 0 != errorMap.size()) {
						PPErrorData error = new PPErrorData();
						error.parseAttributes(errorMap, errorTag);
						ErrorList.add(error);
						errorNo++;
					} 
					else {
						isMoreError = false;
					}
	    		}
	    	}
	    	catch (System.Exception e) {
	    		System.Debug(Logginglevel.ERROR, 'PPFaultMessageException:populateWithFaultMessage() : ' + e);
	    	}
	    }
   	}
    
    public void populateWithCustomError(Long errorCode, String message) {
		ResponseEnvelope = new PPResponseEnvelope();
		ErrorList = new List<PPErrorData>();
		
		ResponseEnvelope.StringTimestamp = String.valueOf(System.Now());
    	ResponseEnvelope.Ack = 'Failure';

		PPErrorData error = new PPErrorData();
    	error.Category = 'Application';
    	error.Domain = 'SalesforceToolkit';
    	error.ErrorId = errorCode;
    	error.Message = message;
    	error.Severity = 'Error';
    	
		ErrorList.add(error);
    }
}