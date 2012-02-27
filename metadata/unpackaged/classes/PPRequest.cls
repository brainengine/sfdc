public abstract class PPRequest {
	// (Required) Name of API.
    public String ApiName {get; set;}
  
    // (Required) Information common to each API operation, such as the 
    // language in which an error message is returned. 
	public PPRequestEnvelope RequestEnvelope {get; set;}
  
  	// Constructor
    public PPRequest() {
        RequestEnvelope = new PPRequestEnvelope();
        ApiName = '';
    }
    
	public abstract void getRequestParams(Map<String, String> requestParams);
	
	public abstract void setRequestEnvelopeParams(String language, String detailLevelCode);
	
	protected void setCommonRequestParams(Map<String, String> requestParams) {
		requestParams.put(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.DETAIL_LEVEL_CODE, RequestEnvelope.DetailLevelCode);
		requestParams.put(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.ERROR_LANGUAGE, RequestEnvelope.ErrorLanguage);
	}
    
    protected void setRequestEnvp(String language, String detailLevelCode) {
		if ((detailLevelCode == null) || (detailLevelCode == ''))
			detailLevelCode = PPStaticRes.DEFAULT_DETAIL_LEVEL_CODE;
		
		RequestEnvelope.DetailLevelCode = detailLevelCode;
		RequestEnvelope.ErrorLanguage = language;
	}
}