global class PPPreapprovalRequest extends PPRequest {
	// (Required) Information about the sender.
	global PPClientDetails ClientDetails {get; set;}
    
	// (Required) The URL to which the sender's browser is redirected after the
	// sender cancels the preapproval at paypal.com.
    global String CancelUrl {get; set;}
    
    // (Required) The currency code.
    global String CurrencyCode {get;set;}
    
    // (Optional) The day of the month on which a monthly payment is to be made. 
    // It is a number between 1 and 31.
    global Integer DateOfMonth {get; set;}
    
    // (Optional) The day of the week that a weekly payment is to be made.
    global String DayOfWeek {get; set;}
    
    // (Required) Last date for which the preapproval is valid. It cannot be 
    // later than one year from the starting date.
    global DateTime EndingDate {get; set;}
    
    // (Optional) The URL to which you want all IPN messages for this preapproval
	// to be sent. This URL supersedes the IPN notification URL in your profile.
    global String IpnNotificationUrl {get; set;}
    
    // (Optional) The preapproved maximum amount per payment. It cannot exceed
	// the preapproved maximum total amount of all payments.
    global Decimal MaxAmountPerPayment {get; set;}
    
    // (Optional) The preapproved maximum number of payments. It cannot exceed
	// the preapproved maximum total number of all payments.
    global Integer MaxNumberOfPayments {get; set;}
    
    // (Optional) The preapproved maximum number of all payments per period.
    global Integer MaxNumberOfPaymentsPerPeriod {get; set;}
    
    // (Required) The preapproved maximum total amount of all payments. It cannot
	// exceed $2,000 USD or the equivalent in other currencies.
    global Decimal MaxTotalAmountOfAllPayment {get; set;}
    
    // (Optional) A note about the preapproval.
    global String Memo {get; set;}
    
    // (Optional) The payment period
    global String PaymentPeriod {get; set;}
    
    // (Optional) Sender's email address. If not specified, the email address of 
    // the sender who logs in to approve the request becomes the email address 
    // associated with the preapproval key.
    global String SenderEmail {get; set;}
    
    // (Required) The URL to which the sender's browser is redirected after the
	// sender approves the preapproval on paypal.com.
    global String ReturnUrl {get; set;}
    
    // (Required) First date for which the preapproval is valid. It cannot be 
    // before today's date or after the ending date.
    global DateTime StartingDate {get; set;}
     
    // (Optional) Whether a personal identification number (PIN) is required.
    global String PinType { get; set; }
    
    // Constructor
    global PPPreapprovalRequest() {
        ApiName = PPStaticRes.PREAPPROVAL_API;
        CancelUrl = '';
        CurrencyCode = '';
        DateOfMonth = 0; 
        DayOfWeek = '';
        EndingDate = NULL;
        MaxAmountPerPayment = 0;
        MaxNumberOfPayments = 0;
        MaxNumberOfPaymentsPerPeriod = 0;
        MaxTotalAmountOfAllPayment = 0;
        PaymentPeriod = '';
        SenderEmail = '';
        ReturnUrl = '';
        StartingDate = Null;
        PinType = '';
        IpnNotificationUrl = '';
        Memo = '';
        ClientDetails = new PPClientDetails();
    }
    
    // Constructor w/ CommonRequestParameters object
    global PPPreapprovalRequest(String CommonRequestParametersObjectName, String SenderEmail) {
    	
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
        
    	// defaults for everything else
        ApiName = PPStaticRes.PREAPPROVAL_API;
        CancelUrl = '';
        DateOfMonth = 0; 
        DayOfWeek = '';
        EndingDate = NULL;
        MaxAmountPerPayment = 0;
        MaxNumberOfPayments = 0;
        MaxNumberOfPaymentsPerPeriod = 0;
        MaxTotalAmountOfAllPayment = 0;
        PaymentPeriod = '';
        ReturnUrl = '';
        StartingDate = Null;
        PinType = '';
        IpnNotificationUrl = '';
        Memo = '';
    }
    
	global override void setRequestEnvelopeParams(String language, String detailLevelCode) {
		super.setRequestEnvp(language, detailLevelCode);
	}
	
	public override void getRequestParams(Map<String, String> requestParams) {
		if (Null != requestParams) {
			super.setCommonRequestParams(requestParams);
			ClientDetails.populateAttributes(requestParams);
			
			if (Null != CancelUrl && 0 != CancelUrl.length())
            	requestParams.put(PPStaticRes.CANCEL_URL, CancelUrl);
            	
            if (Null != CurrencyCode && 0 != CurrencyCode.length())
            	requestParams.put(PPStaticRes.CURRENCY_CODE, CurrencyCode);
            	
            if (0 != DateOfMonth) 
	    		requestParams.put(PPStaticRes.DATE_OF_MONTH, String.valueOf(DateOfMonth));
    		
    		if (Null != DayOfWeek && 0 != DayOfWeek.length()) 
            	requestParams.put(PPStaticRes.DAY_OF_WEEK, DayOfWeek);
            
            if (Null != EndingDate)
            	requestParams.put(PPStaticRes.ENDING_DATE, EndingDate.format('yyyy-MM-dd'));
            
            if (Null != IpnNotificationUrl && 0 != IpnNotificationUrl.length())
            	requestParams.put(PPStaticRes.IPN_NOTIFICATION_URL, IpnNotificationUrl);
            	
            if (0 != MaxAmountPerPayment) 
    			requestParams.put(PPStaticRes.MAX_AMOUNT_PER_PAYMENT, String.valueOf(MaxAmountPerPayment));
    		
    		if (0 != MaxNumberOfPayments) 
    			requestParams.put(PPStaticRes.MAX_NUMBER_OF_PAYMENTS, String.valueOf(MaxNumberOfPayments));
    		
    		if (0 != MaxNumberOfPaymentsPerPeriod) 
    			requestParams.put(PPStaticRes.MAX_NUMBER_OF_PAYMENTS_PER_PERIOD, String.valueOf(MaxNumberOfPaymentsPerPeriod));
    		
    		if (0 != MaxTotalAmountOfAllPayment) 
    			requestParams.put(PPStaticRes.MAX_TOTAL_AMOUNT_OF_ALL_PAYMENTS, String.valueOf(MaxTotalAmountOfAllPayment));
    		
    		if (Null != Memo && 0 != Memo.length())
            	requestParams.put(PPStaticRes.MEMO, Memo);
            	
    		if (Null != PaymentPeriod && 0 != PaymentPeriod.length()) 
            	requestParams.put(PPStaticRes.PAYMENT_PERIOD, PaymentPeriod);
            
            if (Null != SenderEmail && 0 != SenderEmail.length())
        		requestParams.put(PPStaticRes.SENDER_EMAIL, SenderEmail);
        	
        	if (Null != ReturnUrl && 0 != ReturnUrl.length())
        		requestParams.put(PPStaticRes.RETURN_URL, ReturnUrl);
        	
        	if (Null != StartingDate)
            	requestParams.put(PPStaticRes.STARTING_DATE, StartingDate.format('yyyy-MM-dd'));
			
			if (Null != PinType && 0 != PinType.length()) 
            	requestParams.put(PPStaticRes.PIN_TYPE, PinType);
		}	
	}
}