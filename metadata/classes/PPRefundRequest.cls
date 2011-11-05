global class PPRefundRequest extends PPRequest {
	// (Required) The currency code. You must specify the currency code used 
	// for the original payment. You do not need to specify this field if you 
	// use a payKey to refund a complete transaction.
	global String CurrencyCode {get; set;}
	
	// (Required) The key used to create the payment that you want to refund.
	global String PayKey {get;	set;}
	
	// (Required) The PayPal transaction ID associated with the payment that you
	// want to refund.
    global String TransactionId {get; set;}
    
    // (Required) The tracking ID associated with the payment that you want to
	// refund.
    global String TrackingId {get; set;}
    
    // (Optional) Information about the receivers of the payment that you want to
	// refund. If you do not specify any receivers, all receivers will be fully 
	// refunded if you specify the payment key or tracking ID. Otherwise only the 
	// affected receiver will be fully refunded if you specify the transaction ID.
	global List<PPReceiver> ReceiverList {get; set; }
	
	// Constructor
	global PPRefundRequest() {
		ApiName = PPStaticRes.REFUND_API;
		ReceiverList = new List<PPReceiver> ();
		PayKey = '';
		TransactionId = '';
		TrackingId = '';
		CurrencyCode = '';
	}
	
	global PPRefundRequest(String CommonRequestParametersObjectName) {
		ApiName = PPStaticRes.REFUND_API;
		ReceiverList = new List<PPReceiver> ();
		PayKey = '';
		TransactionId = '';
		TrackingId = '';
		CurrencyCode = '';
		
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
    		
    		if (Null != CurrencyCode && 0 != CurrencyCode.length())
            	requestParams.put(PPStaticRes.CURRENCY_CODE, CurrencyCode);
            	
            Integer rcvrCnt = 0;
            for (PPReceiver rec : ReceiverList) {
            	String receiverTag = PPStaticRes.RECEIVER_LIST + PPStaticRes.DOT + PPStaticRes.RECEIVER + PPStaticRes.OPENING_BRACKET + rcvrCnt + PPStaticRes.CLOSING_BRACKET + PPStaticRes.DOT;
            	rec.populateAttributes(requestParams, receiverTag);
                rcvrCnt++;
            }
		}
	}
}