global class PPPayRequest extends PPRequest {
    // (Optional) Information about the sender.
    global PPClientDetails ClientDetails {get; set;}
    
    // (Required) The type of action.
    global String ActionType {get; set;}
    
    // (Required) The URL to which the sender's browser is redirected if the 
    // sender chooses not to complete the payment after you redirected the 
    // sender to paypal.com to approve the payment.
    global String CancelUrl {get; set;}
    
    // (Required) The currency code.
    global String CurrencyCode {get; set;}
    
    // (Optional) The payer of PayPal fees.
    global String FeesPayer{get; set;}
    
    // (Optional) The URL to which you want all IPN messages for this payment to
	//be sent. This URL supersedes the IPN notification URL in your profile.
    global String IpnNotificationUrl {get; set;}
    
    // (Optional) Whether to associate the receiver's default shipping address with
	// the transaction.
    global Boolean LogDefaultShippingAddress {get; set;}
    
    // (Optional) A note associated with the payment.
    global String Memo {get; set;}
    
    // (Optional) The sender's personal identification number, which was specified
	// with the sender signed up for a preapproval.
    global String Pin {get; set;}
    
    // (Optional) The key associated with a preapproval for this payment.
    global String PreapprovalKey {get; set;}
    
    //(Required) Information about the receivers of the payment.
    global List<PPReceiver> ReceiverList {get; set;}
    
    // (Optional) Whether to reverse parallel payments if an error occurs with a
	// payment.
    global Boolean ReverseAllParallelPaymentsOnError{get; set;}
    
    // (Optional) Sender's email address.
    global String SenderEmail {get; set;}
    
    // (Required) The URL to which the sender's browser is redirected after
	// approving a payment on paypal.com.
    global String ReturnUrl {get; set;}
    
    // (Optional) A unique ID that you specify to track the payment.
    global String TrackingId {get; set;}
    
    // (Optional) Specifies a List of allowed funding selections for the payment.
    // This is a List of funding selections that can be combined in any order to 
    // allow payments to use the indicated funding type. If this field is omitted, 
    // the payment can be funded by any funding type that is supported for Adaptive 
    // Payments.
    global List<PPFundingTypeInfo> FundingtypeList {get; set;}
    
    // Default Constructor
    global PPPayRequest() {
        ApiName = PPStaticRes.PAY_API;
        ActionType = PPStaticRes.PAY_ACTION;
        CancelUrl = '';
        CurrencyCode = '';
        FeesPayer = '';
        IpnNotificationUrl = '';
        LogDefaultShippingAddress = false;
        Memo = '';
        Pin = '';
        PreapprovalKey = '';
        ReverseAllParallelPaymentsOnError = false;
        SenderEmail = '';
        ReturnUrl = '';
        TrackingId = '';
        FundingtypeList = new List<PPFundingTypeInfo>();
        ClientDetails = new PPClientDetails(); 
        ReceiverList = new List<PPReceiver>();
    }
    
    // Constructor w/ CommonRequestParameters object
    global PPPayRequest(String CommonRequestParametersObjectName, String SenderEmail) {
    	
    	PPCommonRequestParameters commonRequestParameters = new PPCommonRequestParameters(CommonRequestParametersObjectName);
        // set request envelope fields
        setRequestEnvelopeParams(commonRequestParameters.Language, commonRequestParameters.DetailLevel);
        // create and set client details
        ClientDetails = new PPClientDetails();
        // name of the application
        ClientDetails.applicationId = commonRequestParameters.ApplicationName;
        // add the remote client IP address
        map<string , string> hdrs = ApexPages.currentPage().getHeaders();
		if ( hdrs.get('x-original-remote-addr') != null)
			ClientDetails.ipAddress = hdrs.get('x-original-remote-addr');
		else if ( hdrs.get('X-Salesforce-SIP') != null)
			ClientDetails.ipAddress = hdrs.get('X-Salesforce-SIP');
		else 
        	ClientDetails.ipAddress = '127.0.0.1';        	

        // set sender Email == sender's PayPal Id 
        SenderEmail = SenderEmail;
        // set currency code - for this example we will use US Dollars
        CurrencyCode = commonRequestParameters.CurrencyCode;
        // set the payer of PayPal fees - SENDER or PRIMARYRECEIVER or EACHRECEIVER or SECONDARYONLY
        FeesPayer = commonRequestParameters.FeePayer;
        
    	// defaults for everything else
        ApiName = PPStaticRes.PAY_API;
        ActionType = PPStaticRes.PAY_ACTION;
        CancelUrl = '';
        IpnNotificationUrl = '';
        LogDefaultShippingAddress = false;
        Memo = '';
        Pin = '';
        PreapprovalKey = '';
        ReverseAllParallelPaymentsOnError = false;
        ReturnUrl = '';
        TrackingId = '';
        FundingtypeList = new List<PPFundingTypeInfo>();
        ReceiverList = new List<PPReceiver>();
    }
    
	global override void setRequestEnvelopeParams(String language, String detailLevelCode) {
		super.setRequestEnvp(language, detailLevelCode);
	}
	
	public override void getRequestParams(Map<String, String> requestParams) {
		if (Null != requestParams){
			super.setCommonRequestParams(requestParams);
			ClientDetails.populateAttributes(requestParams);
			
			if (Null != ActionType && 0 != ActionType.length())
            	requestParams.put(PPStaticRes.ACTION_TYPE, ActionType);
            	
            if (Null != CancelUrl && 0 != CancelUrl.length())
            	requestParams.put(PPStaticRes.CANCEL_URL, CancelUrl);
            	
            if (Null != CurrencyCode && 0 != CurrencyCode.length())
            	requestParams.put(PPStaticRes.CURRENCY_CODE, CurrencyCode);
           
            if (Null != FeesPayer && 0 != FeesPayer.length())
            	requestParams.put(PPStaticRes.FEES_PAYER, FeesPayer);
            	
            if (Null != IpnNotificationUrl && 0 != IpnNotificationUrl.length())
            	requestParams.put(PPStaticRes.IPN_NOTIFICATION_URL, IpnNotificationUrl);
            	
            if (true == LogDefaultShippingAddress)
                requestParams.put(PPStaticRes.LOG_DEFAULT_SHIPPING_ADDRESS, 'true');
            else
                requestParams.put(PPStaticRes.LOG_DEFAULT_SHIPPING_ADDRESS, 'false');
            	
            if (Null != Memo && 0 != Memo.length())
            	requestParams.put(PPStaticRes.MEMO, Memo);
            	
        	if (Null != Pin && 0 != Pin.length())
        		requestParams.put(PPStaticRes.PIN, Pin);
        	
        	if (Null != PreapprovalKey && 0 != PreapprovalKey.length())
        		requestParams.put(PPStaticRes.PREAPPROVAL_KEY, PreapprovalKey);
        	
        	Integer rcvrCnt = 0;
            for (PPReceiver rec : ReceiverList) {
            	String receiverTag = PPStaticRes.RECEIVER_LIST + PPStaticRes.DOT + PPStaticRes.RECEIVER + PPStaticRes.OPENING_BRACKET + rcvrCnt + PPStaticRes.CLOSING_BRACKET + PPStaticRes.DOT;
            	rec.populateAttributes(requestParams, receiverTag);
                rcvrCnt++;
            }

            if (true == ReverseAllParallelPaymentsOnError)
                requestParams.put(PPStaticRes.REVERSE_ALL_PARALLEL_PAYMENTS_ON_ERROR, 'true');
            else
                requestParams.put(PPStaticRes.REVERSE_ALL_PARALLEL_PAYMENTS_ON_ERROR, 'false');
                
        	if (Null != SenderEmail && 0 != SenderEmail.length())
        		requestParams.put(PPStaticRes.SENDER_EMAIL, SenderEmail);
        	
        	if (Null != ReturnUrl && 0 != ReturnUrl.length())
        		requestParams.put(PPStaticRes.RETURN_URL, ReturnUrl);
        		
        	if (Null != TrackingId && 0 != TrackingId.length())
        		requestParams.put(PPStaticRes.TRACKING_ID, TrackingId);
        
        	Integer counter = 0;
            for (PPFundingTypeInfo info : FundingtypeList) {
            	String fundingTypeTag = PPStaticRes.FUNDING_TYPE_LIST + PPStaticRes.DOT + PPStaticRes.FUNDING_TYPE_INFO + PPStaticRes.OPENING_BRACKET + counter + PPStaticRes.CLOSING_BRACKET + PPStaticRes.DOT;
            	info.populateAttributes(requestParams, fundingTypeTag);
            	counter++;
            }
		}
	}
}