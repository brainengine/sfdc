@isTest 
private class PPPayRequestTest {
    static testMethod void testGetRequestParamsOne() {
        PPPayRequest request = new PPPayRequest();
        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
        PPClientDetails clientDetails = new PPClientDetails();
        clientDetails.applicationId = 'myapp';
        clientDetails.ipAddress = '172.16.4.105';
        request.clientDetails = clientDetails;
        
        request.cancelUrl = 'https://c.ap1.visual.force.com/apex/PayPalCancel';
        request.returnUrl = 'https://c.ap1.visual.force.com/apex/PayPalReturn';
        request.currencyCode = 'USD';
        request.actionType = 'PAY';
        request.feesPayer = 'SENDER';
        request.ipnNotificationUrl = 'http://google.com';
        request.logDefaultShippingAddress = true;
        request.memo = 'test app';
        request.pin = '123';
        request.preapprovalKey = '456';
        
        List<PPReceiver> receiverList = new List<PPReceiver>();
        PPReceiver receiver1 = new PPReceiver();
        receiver1.email = 'sonali@persistent.co.in';
        receiver1.amount = 100.00;
        receiver1.primary = true;
        PPReceiver receiver2 = new PPReceiver();
        receiver2.email = 'sonali1@persistent.co.in';
        receiver2.amount = 100.00;
        receiver2.primary = false;
        receiverList.Add(receiver1);
        receiverList.Add(receiver2);
        request.receiverList = receiverList;
        request.reverseAllParallelPaymentsOnError = true;
        request.senderEmail = 'sonali@persistent.co.in';
        request.trackingId = '34343';
        
        List<PPFundingTypeInfo> FundingtypeList = new List<PPFundingTypeInfo>();
        PPFundingTypeInfo fundingTypeInfo = new PPFundingTypeInfo();
        fundingTypeInfo.FundingType = 'ECHECK';
        FundingtypeList.add(fundingTypeInfo);
        
        PPFundingTypeInfo fundingTypeInfo1 = new PPFundingTypeInfo();
        fundingTypeInfo1.FundingType = 'BALANCE';
        FundingtypeList.add(fundingTypeInfo1);
        request.FundingtypeList = FundingtypeList;
        
        Map<String, String> params = new Map<String, String>();
		request.getRequestParams(params);
		
		// Assertion
		System.assert(params.get(PPStaticRes.CLIENT_DETAILS + PPStaticRes.DOT + PPStaticRes.IP_ADDRESS).equals('172.16.4.105'));
		System.assert(params.get(PPStaticRes.CLIENT_DETAILS + PPStaticRes.DOT + PPStaticRes.APPLICATION_ID).equals('myapp'));
		System.assert(params.get(PPStaticRes.CANCEL_URL).equals('https://c.ap1.visual.force.com/apex/PayPalCancel'));
		System.assert(params.get(PPStaticRes.RETURN_URL).equals('https://c.ap1.visual.force.com/apex/PayPalReturn'));
		System.assert(params.get(PPStaticRes.CURRENCY_CODE).equals('USD'));
		System.assert(params.get(PPStaticRes.ACTION_TYPE).equals('PAY'));
		System.assert(params.get(PPStaticRes.FEES_PAYER).equals('SENDER'));
		System.assert(params.get(PPStaticRes.IPN_NOTIFICATION_URL).equals('http://google.com'));
		System.assert(params.get(PPStaticRes.LOG_DEFAULT_SHIPPING_ADDRESS).equals('true'));
		System.assert(params.get(PPStaticRes.MEMO).equals('test app'));
		System.assert(params.get(PPStaticRes.PIN).equals('123'));
		System.assert(params.get(PPStaticRes.PREAPPROVAL_KEY).equals('456'));
		System.assert(params.get(PPStaticRes.REVERSE_ALL_PARALLEL_PAYMENTS_ON_ERROR).equals('true'));
		System.assert(params.get(PPStaticRes.TRACKING_ID).equals('34343'));
		System.assert(params.get(PPStaticRes.SENDER_EMAIL).equals('sonali@persistent.co.in'));
		System.assert(params.get(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.ERROR_LANGUAGE).equals('en_US'));
		System.assert(params.get(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.DETAIL_LEVEL_CODE).equals('ReturnAll'));
		
		String tag0 = PPStaticRes.RECEIVER_LIST + PPStaticRes.DOT + PPStaticRes.RECEIVER + PPStaticRes.OPENING_BRACKET + '0'+ PPStaticRes.CLOSING_BRACKET + PPStaticRes.DOT;
		String tag1 = PPStaticRes.RECEIVER_LIST + PPStaticRes.DOT + PPStaticRes.RECEIVER + PPStaticRes.OPENING_BRACKET + '1'+ PPStaticRes.CLOSING_BRACKET + PPStaticRes.DOT;
		if (params.get(tag0 + PPStaticRes.EMAIL) == 'sonali1@persistent.co.in') {
			System.assert(params.get(tag0 + PPStaticRes.AMOUNT).equals('100.0'));
			System.assert(params.get(tag0 + PPStaticRes.PRIMARY).equals('true'));
			System.assert(params.get(tag1 + PPStaticRes.AMOUNT).equals('100.0'));
			System.assert(params.get(tag1 + PPStaticRes.EMAIL).equals('sonali@persistent.co.in'));
			System.assert(params.get(tag1 + PPStaticRes.PRIMARY).equals('false'));
		}
		else {
			System.assert(params.get(tag1 + PPStaticRes.AMOUNT).equals('100.0'));
			System.assert(params.get(tag1 + PPStaticRes.PRIMARY).equals('false'));
			System.assert(params.get(tag1 + PPStaticRes.EMAIL).equals('sonali1@persistent.co.in'));
			System.assert(params.get(tag0 + PPStaticRes.AMOUNT).equals('100.0'));
			System.assert(params.get(tag0 + PPStaticRes.EMAIL).equals('sonali@persistent.co.in'));
			System.assert(params.get(tag0 + PPStaticRes.PRIMARY).equals('true'));
		}
		
		String tag = PPStaticRes.FUNDING_TYPE_LIST + PPStaticRes.DOT + PPStaticRes.FUNDING_TYPE_INFO + PPStaticRes.OPENING_BRACKET + '0'+ PPStaticRes.CLOSING_BRACKET + PPStaticRes.DOT;
		System.assert(params.get(tag + PPStaticRes.FUNDING_TYPE).equals('ECHECK'));
    }

     static testMethod void testGetRequestParamsTwo() {
        PPPayRequest request = new PPPayRequest();
        PPRequestEnvelope reqEnvelope = new PPRequestEnvelope();
        request.setRequestEnvelopeParams('en_US', '');
        
        PPClientDetails clientDetails = new PPClientDetails();
        clientDetails.applicationId = 'myapp';
        clientDetails.ipAddress = '172.16.4.105';
        clientDetails.customerId = '123456';
        clientDetails.customerType = 'partner';
        clientDetails.deviceId = '2233';
        clientDetails.geoLocation = 'USA';
        clientDetails.partnerName = 'Persistent';
        request.clientDetails = clientDetails;
        
        request.cancelUrl = 'https://c.ap1.visual.force.com/apex/PayPalCancel';
        request.returnUrl = 'https://c.ap1.visual.force.com/apex/PayPalReturn';
        request.currencyCode = 'USD';
        
        request.feesPayer = 'SENDER';
        request.ipnNotificationUrl = 'http://google.com';
        request.memo = 'test app';
        request.pin = '123';
        request.preapprovalKey = '456';
        List<PPReceiver> receiverList = new List<PPReceiver>();
        PPReceiver receiver1 = new PPReceiver();
        receiver1.email = 'sonali_1251967680_biz@persistent.co.in';
        receiver1.amount = 100.00;
        receiver1.primary = true;
        receiverList.Add(receiver1);
        request.receiverList = receiverList;
        
        request.reverseAllParallelPaymentsOnError = false;
        request.senderEmail = 'sonali@persistent.co.in';
        request.trackingId = '34343';
        request.LogDefaultShippingAddress = false;
        Map<String, String> params = new Map<String, String>();
		request.getRequestParams(params);
		
		// Assertion
		System.assert(params.get(PPStaticRes.CLIENT_DETAILS + PPStaticRes.DOT + PPStaticRes.IP_ADDRESS).equals('172.16.4.105'));
		System.assert(params.get(PPStaticRes.CLIENT_DETAILS + PPStaticRes.DOT + PPStaticRes.APPLICATION_ID).equals('myapp'));
		System.assert(params.get(PPStaticRes.CANCEL_URL).equals('https://c.ap1.visual.force.com/apex/PayPalCancel'));
		System.assert(params.get(PPStaticRes.RETURN_URL).equals('https://c.ap1.visual.force.com/apex/PayPalReturn'));
		System.assert(params.get(PPStaticRes.CURRENCY_CODE).equals('USD'));
		System.assert(params.get(PPStaticRes.ACTION_TYPE).equals('PAY'));
		System.assert(params.get(PPStaticRes.FEES_PAYER).equals('SENDER'));
		System.assert(params.get(PPStaticRes.IPN_NOTIFICATION_URL).equals('http://google.com'));
		System.assert(params.get(PPStaticRes.LOG_DEFAULT_SHIPPING_ADDRESS).equals('false'));
		System.assert(params.get(PPStaticRes.MEMO).equals('test app'));
		System.assert(params.get(PPStaticRes.PIN).equals('123'));
		System.assert(params.get(PPStaticRes.PREAPPROVAL_KEY).equals('456'));
		System.assert(params.get(PPStaticRes.REVERSE_ALL_PARALLEL_PAYMENTS_ON_ERROR).equals('false'));
		System.assert(params.get(PPStaticRes.TRACKING_ID).equals('34343'));
		System.assert(params.get(PPStaticRes.SENDER_EMAIL).equals('sonali@persistent.co.in'));
		System.assert(params.get(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.ERROR_LANGUAGE).equals('en_US'));
		System.assert(params.get(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.DETAIL_LEVEL_CODE).equals('ReturnAll'));
    }
}