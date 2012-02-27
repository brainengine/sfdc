global class PPPreapprovalDetailsResponse extends PPResponse {
	// Whether the preapproval request was approved.
	global Boolean Approved {get; set;}
	
	// The URL to which the sender's browser is redirected if the sender 
	// decides to cancel the preapproval as requested.
	global String CancelUrl {get; set;}
	
	// The current number of payments by the sender for this preapproval.
	global Long CurPayments {get; set;}
	
	// The current total of payments by the sender for this preapproval.
	global Decimal CurPaymentsAmount {get; set;}
	
	// The current number of payments by the sender this period for this 
	// preapproval.
	global Long CurPeriodAttempts {get; set;}
	
	// Ending date for the current period. Time is currently not supported.
	global String StringCurPeriodEndingDate {get; set;}
	
	// The currency code.
	global String CurrencyCode {get; set;}
	
	// The day of the month on which a monthly payment is to be made. It is 
	// a number between 1 and 31.
	global Integer DateOfMonth {get; set;}
	
	// The day of the week that a weekly payment is to be made.
	global String DayOfWeek {get; set;}
	
	// Last date for which the preapproval is valid. Time is currently not 
	// supported.
	global String StringEndingDate {get; set;}
	
	// The URL to which all IPN messages for this preapproval are sent.
    global String IpnNotificationUrl {get; set;}
    
    // The preapproved maximum amount per payment.
    global Decimal MaxAmountPerPayment {get; set;}
    
    // The preapproved maximum number of payments. This field is only returned 
    // if provided.
    global Integer MaxNumberOfPayments {get; set;}
    
    // The preapproved maximum number of payments per period.
    global Integer MaxNumberOfPaymentsPerPeriod {get; set;}
    
    // The preapproved maximum total amount of all payments.
    global Decimal MaxTotalAmountOfAllPayments {get; set;}
    
    // A note about the preapproval.
    global String Memo {get; set;}
    
    // The payment period.
    global String PaymentPeriod {get; set;}
    
    // Whether a personal identification number (PIN) is required.
    global String PinType {get; set;}
    
    // The URL to which the sender's browser is redirected after 
    // the sender approves the preapproval on paypal.com.
    global String ReturnUrl {get; set;}
    
    // Sender's email address, which is only available when you 
    // explicitly set the email address in the PreapprovalRequest message.
    global String SenderEmail {get; set;}
    
    // First date for which the preapproval is valid.
    global String StringStartingDate {get; set;}
    
    // Whether this preapproval is active.
    global String Status {get; set;}
    
    // Constructor
    global PPPreapprovalDetailsResponse() {
    	Approved = false;
    	CancelUrl = '';
    	CurPayments = 0;
    	CurPaymentsAmount = 0;
    	CurPeriodAttempts = 0;
    	StringCurPeriodEndingDate = '';
    	CurrencyCode = '';
    	DateOfMonth = 0;
    	DayOfWeek = '';
    	StringEndingDate = '';
    	IpnNotificationUrl = '';
    	MaxAmountPerPayment = 0;
    	MaxNumberOfPayments = 0;
    	MaxNumberOfPaymentsPerPeriod = 0;
    	MaxTotalAmountOfAllPayments = 0;
    	Memo = '';
    	PaymentPeriod = '';
    	PinType = '';
    	ReturnUrl = '';
    	SenderEmail = '';
    	StringStartingDate = '';
    	Status = '';
    }
    
    global override PPResponseEnvelope getResponseEnvelope() {
    	return ResponseEnvelope;
    }
    
    public override void parseResponseParameters(Map<String, String> parameters) {
    	try {
			super.parseCommonParams(Parameters);
			
			if (parameters.containsKey(PPStaticRes.APPROVED)) {
				String tempStr = parameters.remove(PPStaticRes.APPROVED);
				if (Null != tempStr && tempStr.equalsIgnoreCase(PPStaticRes.STRING_TRUE))
		 			Approved = true;
		 		else if (tempStr.equalsIgnoreCase(PPStaticRes.STRING_FALSE))
		 			Approved = false;
			}
			
			if (parameters.containsKey(PPStaticRes.CANCEL_URL))
		 		CancelUrl = parameters.remove(PPStaticRes.CANCEL_URL);
		 	
		 	if (parameters.containsKey(PPStaticRes.CUR_PAYENTS)) {
		 		String tempStr = parameters.remove(PPStaticRes.CUR_PAYENTS);
		 		if (Null != tempStr)
		 			CurPayments = Long.valueOf(tempStr);
		 	}
		 	
		 	if (parameters.containsKey(PPStaticRes.CUR_PAYENTS_AMOUNT)) {
		 		String tempStr = parameters.remove(PPStaticRes.CUR_PAYENTS_AMOUNT);
		 		if (Null != tempStr)
		 			CurPaymentsAmount = Decimal.valueOf(tempStr);
		 	}
		 	
		 	if (parameters.containsKey(PPStaticRes.CUR_PERIOD_ATTEMPTS)) {
		 		String tempStr = parameters.remove(PPStaticRes.CUR_PERIOD_ATTEMPTS);
		 		if (Null != tempStr)
		 			CurPeriodAttempts = Long.valueOf(tempStr);
		 	}
		 	
		 	if (parameters.containsKey(PPStaticRes.CUR_PERIOD_ENDING_DATE)) {
		 		StringCurPeriodEndingDate = parameters.remove(PPStaticRes.CUR_PERIOD_ENDING_DATE);
		 	}
		 	
		 	if (parameters.containsKey(PPStaticRes.CURRENCY_CODE))	
		 		CurrencyCode = parameters.remove(PPStaticRes.CURRENCY_CODE);
		 	
		 	if (parameters.containsKey(PPStaticRes.DATE_OF_MONTH)) {
		 		String tempStr = parameters.remove(PPStaticRes.DATE_OF_MONTH);
		 		if (Null != tempStr)
		 			DateOfMonth = Integer.valueOf(tempStr);
		 	}		
		 	
		 	if (parameters.containsKey(PPStaticRes.DAY_OF_WEEK))
		 		DayOfWeek = parameters.remove(PPStaticRes.DAY_OF_WEEK);
		 	
		 	
		 	if (parameters.containsKey(PPStaticRes.ENDING_DATE)) {
		 		StringEndingDate = parameters.remove(PPStaticRes.ENDING_DATE);
		 	}
		 	
		 	if (parameters.containsKey(PPStaticRes.IPN_NOTIFICATION_URL))
		 		IpnNotificationUrl = parameters.remove(PPStaticRes.IPN_NOTIFICATION_URL);
		 	
		 	if (parameters.containsKey(PPStaticRes.MAX_AMOUNT_PER_PAYMENT)) {
		 		String tempStr = parameters.remove(PPStaticRes.MAX_AMOUNT_PER_PAYMENT);
		 		if (Null != tempStr)
		 			MaxAmountPerPayment = Decimal.valueOf(tempStr);
		 	}
		 	
		 	if (parameters.containsKey(PPStaticRes.MAX_NUMBER_OF_PAYMENTS)) {
		 		String tempStr = parameters.remove(PPStaticRes.MAX_NUMBER_OF_PAYMENTS);
		 		if (Null != tempStr)
		 			MaxNumberOfPayments = Integer.valueOf(tempStr);
		 	}	
		 	
		 	if (parameters.containsKey(PPStaticRes.MAX_NUMBER_OF_PAYMENTS_PER_PERIOD)) {
		 		String tempStr = parameters.remove(PPStaticRes.MAX_NUMBER_OF_PAYMENTS_PER_PERIOD);
		 		if (Null != tempStr)
		 			MaxNumberOfPaymentsPerPeriod = Integer.valueOf(tempStr);
		 	}	
		 	
		 	if (parameters.containsKey(PPStaticRes.MAX_TOTAL_AMOUNT_OF_ALL_PAYMENTS)) {
		 		String tempStr = parameters.remove(PPStaticRes.MAX_TOTAL_AMOUNT_OF_ALL_PAYMENTS);
		 		if (Null != tempStr)
		 			MaxTotalAmountOfAllPayments = Decimal.valueOf(tempStr);
		 	}
		 	
		 	if (parameters.containsKey(PPStaticRes.MEMO))	
		 		Memo = parameters.remove(PPStaticRes.MEMO);
		 	
		 	if (parameters.containsKey(PPStaticRes.PAYMENT_PERIOD))
		 		PaymentPeriod = parameters.remove(PPStaticRes.PAYMENT_PERIOD);
		 	
		 	if (parameters.containsKey(PPStaticRes.PIN_TYPE))
		 		PinType = parameters.remove(PPStaticRes.PIN_TYPE);
		 	
		 	if (parameters.containsKey(PPStaticRes.RETURN_URL))
		 		ReturnUrl = parameters.remove(PPStaticRes.RETURN_URL);
		 		
		 	if (parameters.containsKey(PPStaticRes.SENDER_EMAIL))
		 		SenderEmail = parameters.remove(PPStaticRes.SENDER_EMAIL);
		 	
		 	if (parameters.containsKey(PPStaticRes.STARTING_DATE)) {
		 		StringStartingDate = parameters.remove(PPStaticRes.STARTING_DATE);
		 	}
		 	
		 	if (parameters.containsKey(PPStaticRes.STATUS))
		 		Status = parameters.remove(PPStaticRes.STATUS);
		 		
    	}
    	catch (System.Exception e) {
    		System.Debug(Logginglevel.ERROR, 'PPPreapprovalDetailsResponse:parseResponseParameters() : ' + e);
    	}
    }
}