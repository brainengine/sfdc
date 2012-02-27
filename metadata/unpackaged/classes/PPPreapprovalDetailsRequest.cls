global class PPPreapprovalDetailsRequest extends PPRequest{
	// (Required) A preapproval key that identifies the preapproval for 
	// which you want to retrieve details. The preapproval key is returned 
	// in the PreapprovalResponse message.
	global String PreapprovalKey {get;	set;}
	
	// Constructor
	global PPPreapprovalDetailsRequest() {
		ApiName = PPStaticRes.PREAPPROVAL_DETAILS_API;
		PreapprovalKey = '';
	}
	
	global PPPreapprovalDetailsRequest(String CommonRequestParametersObjectName){
		ApiName = PPStaticRes.PREAPPROVAL_DETAILS_API;
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