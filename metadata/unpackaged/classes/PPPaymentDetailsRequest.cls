global class PPPaymentDetailsRequest extends PPRequest {
	// (Optional) The pay key that identifies the payment for which you 
	// want to retrieve details. This is the pay key returned in the 
	// PayResponse message.
	global String PayKey { get;	set; }
	
	// (Optional) The PayPal transaction ID associated with the payment. The 
	// IPN message associated with the payment contains the transaction ID.
    global String TransactionId { get; set; }
    
    // (Optional) The tracking ID that was specified for this payment in the
	// PayRequest message.
    global String TrackingId { get; set; }
    
    // Constructor
	global PPPaymentDetailsRequest() {
		ApiName = PPStaticRes.PAYMENT_DETAILS_API;
		PayKey = '';
		TransactionId = '';
		TrackingId = '';
	}
	
	global PPPaymentDetailsRequest(String CommonRequestParametersObjectName){
		ApiName = PPStaticRes.PAYMENT_DETAILS_API;
		PayKey = '';
		TransactionId = '';
		TrackingId = '';
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
			if (Null != PayKey && 0 != PayKey.length())		
    			requestParams.put(PPStaticRes.PAY_KEY, PayKey);
    			
    		if (Null != TransactionId && 0 != TransactionId.length())		
    			requestParams.put(PPStaticRes.TRANSACTION_ID, TransactionId);
    		
            if (Null != TrackingId && 0 != TrackingId.length())		
    			requestParams.put(PPStaticRes.TRACKING_ID, TrackingId);
		}
	}
}