global class PPPaymentDetailsResponse extends PPResponse {
	// The URL to which the sender's browser is redirected if the sender 
	// cancels the approval for a payment on paypal.com.
	global String CancelUrl {get; set;}
    
	// The currency code.
	global String CurrencyCode {get; set;}
	
	// The URL to which all IPN messages for this payment are sent.
    global String IpnNotificationUrl {get; set;}
    
    // A note associated with the payment.
    global String Memo {get; set;}
    
    // Represents the payment attempt made to a receiver of a PayRequest. If 
    // the execution of the payment has not yet completed, there are no 
    // transaction details returned.
    global List<PPPaymentInformation> PaymentInformationList {get; set;}
    
    // The URL to which the sender's browser is redirected after approving a
	// payment on paypal.com.
    global String ReturnUrl {get; set;}
    
    // The sender's email address.
    global String SenderEmail {get; set;}
    
    // The status of the payment
    global String Status {get; set;}
    
    // The tracking ID that was specified for this payment in the
	// PaymentDetailsRequest message.
    global String TrackingId {get; set;}
    
    // The pay key that identifies this payment. This is a token that is 
    // assigned by the Pay API after a PayRequest message is received and 
    // can be used in other Adaptive Payments APIs to identify this payment.
    global String PayKey {get; set;}
    
    // The type of action, currently:PAY
    global String ActionType {get; set;}
    
    // The payer of PayPal fees.	
    global String FeesPayer {get; set;}
    
    // Whether to reverse parallel payments. 
    global Boolean ReverseAllParallelPaymentsOnError {get; set;}
    
    // The preapproval key that identifies the preapproval for this payment. 
    // This key can be used in other Adaptive Payment APIs to identify the 
    // preapproval.
    global String PreapprovalKey {get; set;}
    
    // Indicates whether this flag was set when PayPal was called.
    global String LogDefaultShippingAddress {get; set;}
    
    // Specifies a List of allowed funding selections for the payment. This 
    // is a List of funding selections that can be combined in any order to 
    // allow payments to use the indicated funding type. If this field is 
    // omitted, the payment can be funded by any funding type that is 
    // supported for Adaptive Payments.
    global List<PPFundingTypeInfo> FundingtypeList {get; set;}
    
    // Constructor
    global PPPaymentDetailsResponse() {
    	PaymentInformationList = new List<PPPaymentInformation>();
    	FundingtypeList = new List<PPFundingTypeInfo>();
    	CancelUrl = '';
    	CurrencyCode = '';
    	IpnNotificationUrl = '';
    	Memo = '';
    	ReturnUrl = '';
    	SenderEmail = '';
    	Status = '';
    	TrackingId = '';
    	PayKey = '';
    	ActionType = '';
    	FeesPayer = '';
    	ReverseAllParallelPaymentsOnError = false;
    	PreapprovalKey = '';
    	LogDefaultShippingAddress = '';
    }

    global override PPResponseEnvelope getResponseEnvelope() {
    	return ResponseEnvelope;
    }
    
    public override void parseResponseParameters(Map<String, String> parameters) {
    	try {
			super.parseCommonParams(Parameters);
			
			if (parameters.containsKey(PPStaticRes.CANCEL_URL))
		 		CancelUrl = parameters.remove(PPStaticRes.CANCEL_URL);
		 	
		 	if (parameters.containsKey(PPStaticRes.CURRENCY_CODE))	
		 		CurrencyCode = parameters.remove(PPStaticRes.CURRENCY_CODE);
		 	
		 	if (parameters.containsKey(PPStaticRes.IPN_NOTIFICATION_URL))
		 		IpnNotificationUrl = parameters.remove(PPStaticRes.IPN_NOTIFICATION_URL);
		 	
		 	if (parameters.containsKey(PPStaticRes.MEMO))	
		 		Memo = parameters.remove(PPStaticRes.MEMO);
		 		
		 	if (parameters.containsKey(PPStaticRes.RETURN_URL))
		 		ReturnUrl = parameters.remove(PPStaticRes.RETURN_URL);
		 		
		 	if (parameters.containsKey(PPStaticRes.SENDER_EMAIL))
		 		SenderEmail = parameters.remove(PPStaticRes.SENDER_EMAIL);
		 	
		 	if (parameters.containsKey(PPStaticRes.STATUS))
		 		Status = parameters.remove(PPStaticRes.STATUS);
		 	
		 	if (parameters.containsKey(PPStaticRes.TRACKING_ID))	
		 		TrackingId = parameters.remove(PPStaticRes.TRACKING_ID);
		 	
		 	if (parameters.containsKey(PPStaticRes.PAY_KEY))
		 		PayKey = parameters.remove(PPStaticRes.PAY_KEY);
		 		
		 	if (parameters.containsKey(PPStaticRes.ACTION_TYPE))
		 		ActionType = parameters.remove(PPStaticRes.ACTION_TYPE);
		 	
		 	if (parameters.containsKey(PPStaticRes.FEES_PAYER))
		 		FeesPayer = parameters.remove(PPStaticRes.FEES_PAYER);
		 	
		 	if (parameters.containsKey(PPStaticRes.REVERSE_ALL_PARALLEL_PAYMENTS_ON_ERROR)) {
		 		String tempStr = parameters.remove(PPStaticRes.REVERSE_ALL_PARALLEL_PAYMENTS_ON_ERROR);
		 		if (Null != tempStr && tempStr.equalsIgnoreCase(PPStaticRes.STRING_TRUE))
		 			ReverseAllParallelPaymentsOnError = true;
		 		else if (tempStr.equalsIgnoreCase(PPStaticRes.STRING_FALSE))
		 			ReverseAllParallelPaymentsOnError = false;
		 	}	
		 	
		 	if (parameters.containsKey(PPStaticRes.PREAPPROVAL_KEY))
		 		PreapprovalKey = parameters.remove(PPStaticRes.PREAPPROVAL_KEY);
		 	
		 	if (parameters.containsKey(PPStaticRes.LOG_DEFAULT_SHIPPING_ADDRESS))
		 		LogDefaultShippingAddress = parameters.remove(PPStaticRes.LOG_DEFAULT_SHIPPING_ADDRESS);
		 	
		 	
		 	Map<String, String> paymentInfoMap = null;
    		Integer paymentInfono = 0;
    		Boolean isMoreInfo = true;
    		while (isMoreInfo) {
				String paymentInfoTag = PPStaticRes.PAYMENT_INFO_LIST + PPStaticRes.DOT + PPStaticRes.PAYMENT_INFO + PPStaticRes.OPENING_BRACKET + paymentInfono + PPStaticRes.CLOSING_BRACKET + PPStaticRes.DOT;
				paymentInfoMap = PPUtils.getMapWithSpecificKeys(Parameters, paymentInfoTag);
				if (Null != paymentInfoMap && 0 != paymentInfoMap.size()) {
					PPPaymentInformation paymentInfo = new PPPaymentInformation();
					paymentInfo.parseAttributes(paymentInfoMap, paymentInfoTag);
					PaymentInformationList.add(paymentInfo);
					paymentInfono++;
				} 
				else {
					isMoreInfo = false;
				}
    		}
    		
    		Map<String, String> fundingTypeInfoMap = null;
    		Integer fundingTypeInfono = 0;
    		isMoreInfo = true;
    		while (isMoreInfo) {
				String fundingTypeInfoTag = PPStaticRes.FUNDING_TYPE_LIST + PPStaticRes.DOT + PPStaticRes.FUNDING_TYPE_INFO + PPStaticRes.OPENING_BRACKET + fundingTypeInfono + PPStaticRes.CLOSING_BRACKET + PPStaticRes.DOT;
				fundingTypeInfoMap = PPUtils.getMapWithSpecificKeys(Parameters, fundingTypeInfoTag);
				if (Null != fundingTypeInfoMap && 0 != fundingTypeInfoMap.size()) {
					PPFundingTypeInfo fundingTypeInfo = new PPFundingTypeInfo();
					fundingTypeInfo.parseAttributes(fundingTypeInfoMap, fundingTypeInfoTag);
					FundingtypeList.add(fundingTypeInfo);
					fundingTypeInfono++;
				} 
				else {
					isMoreInfo = false;
				}
    		}
    		
    	}
    	catch (System.Exception e) {
    		System.Debug(Logginglevel.ERROR, 'PPPaymentDetailsResponse:parseResponseParameters() : ' + e);
    	}
    }
}