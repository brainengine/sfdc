global class PPCancelPreapprovalRequest extends PPRequest {
	// (Required) The preapproval key that identifies the preapproval 
	// to be canceled.
	global String PreapprovalKey {get; set;} 
	
	// Constructor
	global PPCancelPreapprovalRequest() {
		ApiName = PPStaticRes.CANCEL_PREAPPROVAL_API;
		PreapprovalKey = '';
	}
	
	global PPCancelPreapprovalRequest(String CommonRequestParametersObjectName){
		ApiName = PPStaticRes.CANCEL_PREAPPROVAL_API;
		PPCommonRequestParameters commonRequestParameters = new PPCommonRequestParameters(CommonRequestParametersObjectName);
        // set request envelope fields
        setRequestEnvelopeParams(commonRequestParameters.Language, commonRequestParameters.DetailLevel);
	}
	
	global override void setRequestEnvelopeParams(String language, String detailLevelCode) {
		super.setRequestEnvp(language, detailLevelCode);
	}
	
	public override void getRequestParams(Map<String, String> requestParams) {
		if (Null != requestParams) {
			super.setCommonRequestParams(requestParams);
			if (Null != PreapprovalKey && 0 != PreapprovalKey.length())		
    			requestParams.put(PPStaticRes.PREAPPROVAL_KEY, PreapprovalKey);
		}		
	}
}