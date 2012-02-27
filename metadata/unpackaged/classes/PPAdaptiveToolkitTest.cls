@isTest 
private class PPAdaptiveToolkitTest {
    static testMethod void testPay() {
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        
		PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	baseProfile.ApplicationID = 'APP-80W284485P519543T';
    	baseProfile.DeviceID = 'DeviceID';
    	baseProfile.DeviceIPAddress = '172.16.4.89';
    	baseProfile.ServiceVersion = '1.3.0';
    	baseProfile.Subject = 'PayPal Toolkit';
		toolkit.BaseAPIProfile = baseProfile;
		
        PPPayRequest request = new PPPayRequest();
        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
        
        PPClientDetails clientDetails = new PPClientDetails();
        clientDetails.applicationId = 'myapp';
        clientDetails.ipAddress = '172.16.4.89';
        clientDetails.customerId = '123456';
        clientDetails.customerType = 'partner';
        clientDetails.deviceId = '2233';
        clientDetails.geoLocation = 'USA';
        clientDetails.partnerName = 'Persistent';
        clientDetails.Model = 'Model';
        request.ClientDetails = clientDetails;
         
        request.cancelUrl = 'https://c.na7.visual.force.com/apex/CancelURL';
        request.returnUrl = 'https://c.na7.visual.force.com/apex/ReturnURL';
        request.IpnNotificationUrl = 'https://c.na7.visual.force.com/apex/IpnNotificationUrl';
        request.currencyCode = 'USD';
        request.feesPayer = 'SENDER';
        request.memo = 'test app';
        request.TrackingId = '123456';
        request.LogDefaultShippingAddress = true;
        
        List<PPReceiver> receiverList = new List<PPReceiver>();
        PPReceiver receiver = new PPReceiver();
        receiver.email = 'manish_1250055563_biz@persistent.co.in';
        receiver.amount = 10.00;
        receiverList.Add(receiver);
        request.receiverList = receiverList;
        
        // Assert Request Parameters
        Map<String, String>requestParams = new Map<String, String>();
        request.getRequestParams(requestParams);
        String requestBody = PPNvpCodec.encode(requestParams);
        
        PPHttpUtil httpUtil = new PPHttpUtil();
	    httpUtil.createHttpRequest(baseProfile.getEndPoint() + request.ApiName, 'POST', baseProfile.getRequestHeaders(), requestBody);
	    
        requestBody = httpUtil.getBody();
        
        String temp = EncodingUtil.urlDecode('en_US', 'UTF-8');
        System.assert(requestBody.contains('requestEnvelope.errorLanguage=' + temp));
        temp = EncodingUtil.urlEncode('ReturnAll', 'UTF-8');
        System.assert(requestBody.contains('requestEnvelope.detailLevelCode=' + temp));
        temp = EncodingUtil.urlEncode('myapp', 'UTF-8');
		System.assert(requestBody.contains('clientDetails.applicationId=' + temp));
		temp = EncodingUtil.urlEncode('172.16.4.89', 'UTF-8');
		System.assert(requestBody.contains('clientDetails.ipAddress=' + temp));
		temp = EncodingUtil.urlEncode('123456', 'UTF-8');
		System.assert(requestBody.contains('clientDetails.customerId=' + temp));
		temp = EncodingUtil.urlEncode('partner', 'UTF-8');
		System.assert(requestBody.contains('clientDetails.customerType=' + temp));
		temp = EncodingUtil.urlEncode('2233', 'UTF-8');
		System.assert(requestBody.contains('clientDetails.deviceId=' + temp));
		temp = EncodingUtil.urlEncode('Persistent', 'UTF-8');
		System.assert(requestBody.contains('clientDetails.partnerName=' + temp));
		temp = EncodingUtil.urlEncode('USA', 'UTF-8');
		System.assert(requestBody.contains('clientDetails.geoLocation=' + temp));
		temp = EncodingUtil.urlEncode('Model', 'UTF-8');	
		System.assert(requestBody.contains('clientDetails.model=' + temp));
		temp = EncodingUtil.urlEncode('https://c.na7.visual.force.com/apex/CancelURL', 'UTF-8');
		System.assert(requestBody.contains('cancelUrl=' + temp));
		temp = EncodingUtil.urlEncode('https://c.na7.visual.force.com/apex/ReturnURL', 'UTF-8');
		System.assert(requestBody.contains('returnUrl=' + temp));
		temp = EncodingUtil.urlEncode('https://c.na7.visual.force.com/apex/IpnNotificationUrl', 'UTF-8');
		System.assert(requestBody.contains('ipnNotificationUrl=' + temp));
		temp = EncodingUtil.urlEncode('USD', 'UTF-8');
		System.assert(requestBody.contains('currencyCode=' + temp));
		temp = EncodingUtil.urlEncode('SENDER', 'UTF-8');
		System.assert(requestBody.contains('feesPayer=' + temp));
		temp = EncodingUtil.urlEncode('test app', 'UTF-8');
		System.assert(requestBody.contains('memo=' + temp));
		temp = EncodingUtil.urlEncode('123456', 'UTF-8');
		System.assert(requestBody.contains('trackingId=' + temp));
		temp = EncodingUtil.urlEncode('true', 'UTF-8');
		System.assert(requestBody.contains('logDefaultShippingAddress=' + temp));
		temp = EncodingUtil.urlEncode('manish_1250055563_biz@persistent.co.in', 'UTF-8');
		System.assert(requestBody.contains('receiverList.receiver(0).email=' + temp));
		temp = EncodingUtil.urlEncode('10.0', 'UTF-8');
		System.assert(requestBody.contains('receiverList.receiver(0).amount=' + temp));
		
		// Assert End point
		System.assert(httpUtil.getEndPoint() == 'https://svcs.sandbox.paypal.com/AdaptivePayments/Pay');
		// Assert Method
		System.assert(httpUtil.getMethod() == 'POST');
		// Assert Headers
		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-USERID') == 'S11_1251093592_biz_api1.persistent.co.in');
		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-PASSWORD') == '1251093602');
		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-SIGNATURE') == 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND');
		System.assert(httpUtil.getHeader('X-PAYPAL-APPLICATION-ID') == 'APP-80W284485P519543T');
		System.assert(httpUtil.getHeader('X-PAYPAL-SERVICE-VERSION') == '1.3.0');
		System.assert(httpUtil.getHeader('X-PAYPAL-DEVICE-ID') == 'DeviceID');
		System.assert(httpUtil.getHeader('X-PAYPAL-DEVICE-IPADDRESS') == '172.16.4.89');
		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-SUBJECT') == 'PayPal Toolkit');
		
        PPPayResponse response = toolkit.pay(request);
    }
    
//    static testMethod void testCommitPayment() {
//    	PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
//    	toolkit.commitPayment('payKey');
//    }	
//    	
//    static testMethod void testPaymentDetails() {
//        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
//        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
//		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
//		baseProfile.APIPassword = '1251093602';		
//    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_CERTIFICATE;
//    	baseProfile.Certificate = 'Certificate';
//    	baseProfile.CertificatePassword = 'password';
//    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
//		baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
//		baseProfile.ApplicationID = 'APP-80W284485P519543T';
//		baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
//		baseProfile.DeviceID = 'DeviceID';
//    	baseProfile.DeviceIPAddress = '172.16.4.89';
//    	baseProfile.ServiceVersion = '1.3.0';
//		toolkit.BaseAPIProfile = baseProfile;
//		
//        PPPaymentDetailsRequest request = new PPPaymentDetailsRequest();
//        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
//        request.TransactionId = 'PA-6R389498HA1768156';
//        
//         // Assert Request Parameters
//        Map<String, String>requestParams = new Map<String, String>();
//        request.getRequestParams(requestParams);
//        String requestBody = PPNvpCodec.encode(requestParams);
//        
//        PPHttpUtil httpUtil = new PPHttpUtil();
//	    httpUtil.createHttpRequest(baseProfile.getEndPoint() + request.ApiName, 'POST', baseProfile.getRequestHeaders(), requestBody);
//	    
//        requestBody = httpUtil.getBody();
//        
//        String temp = EncodingUtil.urlDecode('en_US', 'UTF-8');
//        System.assert(requestBody.contains('requestEnvelope.errorLanguage=' + temp));
//        temp = EncodingUtil.urlEncode('ReturnAll', 'UTF-8');
//        System.assert(requestBody.contains('requestEnvelope.detailLevelCode=' + temp));
//        temp = EncodingUtil.urlEncode('PA-6R389498HA1768156', 'UTF-8');
//        System.assert(requestBody.contains('transactionId=' + temp));
//        
//        // Assert End point
//		System.assert(httpUtil.getEndPoint() == 'https://svcs.sandbox.paypal.com/AdaptivePayments/PaymentDetails');
//		// Assert Method
//		System.assert(httpUtil.getMethod() == 'POST');
//        // Assert Headers
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-USERID') == 'S11_1251093592_biz_api1.persistent.co.in');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-PASSWORD') == '1251093602');
//		System.assert(httpUtil.getHeader('X-PAYPAL-APPLICATION-ID') == 'APP-80W284485P519543T');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SERVICE-VERSION') == '1.3.0');
//		System.assert(httpUtil.getHeader('X-PAYPAL-DEVICE-ID') == 'DeviceID');
//		System.assert(httpUtil.getHeader('X-PAYPAL-DEVICE-IPADDRESS') == '172.16.4.89');
//		
//        PPPaymentDetailsResponse response = toolkit.paymentDetails(request);
//    }
//    
//    static testMethod void testPreapproval() {
//        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
//        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
//		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
//		baseProfile.APIPassword = '1251093602';		
//    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
//		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
//    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
//		baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
//		baseProfile.ApplicationID = 'APP-80W284485P519543T';
//		baseProfile.DeviceID = 'DeviceID';
//    	baseProfile.DeviceIPAddress = '172.16.4.89';
//    	baseProfile.ServiceVersion = '1.3.0';
//		toolkit.BaseAPIProfile = baseProfile;
//		
//        PPPreapprovalRequest request = new PPPreapprovalRequest();
//        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
//        
//        PPClientDetails clientDetails = new PPClientDetails();
//        clientDetails.applicationId = 'myapp';
//        clientDetails.ipAddress = '172.16.4.89';
//        clientDetails.customerId = '123456';
//        clientDetails.customerType = 'partner';
//        clientDetails.deviceId = '2233';
//        clientDetails.geoLocation = 'USA';
//        clientDetails.partnerName = 'Persistent';
//        clientDetails.Model = 'Model';
//        
//        request.ClientDetails = clientDetails;
//        
//        request.CurrencyCode = 'USD';
//        request.DateOfMonth = 1;
//        request.DayOfWeek = 'WEDNESDAY';
//        request.EndingDate = DateTime.newInstance(2009, 10, 9);
//        request.MaxAmountPerPayment = 10;
//        request.MaxNumberOfPayments =  5;
//        request.MaxNumberOfPaymentsPerPeriod = 1;
//        request.maxTotalAmountOfAllPayment = 100;
//        request.PaymentPeriod = 'DAILY';
//        request.PinType = 'NOT_REQUIRED';
//        request.StartingDate = DateTime.newInstance(2009, 9, 20);
//        
//        
//        
//        // Assert Request Parameters
//        Map<String, String>requestParams = new Map<String, String>();
//        request.getRequestParams(requestParams);
//        String requestBody = PPNvpCodec.encode(requestParams);
//        
//        PPHttpUtil httpUtil = new PPHttpUtil();
//	    httpUtil.createHttpRequest(baseProfile.getEndPoint() + request.ApiName, 'POST', baseProfile.getRequestHeaders(), requestBody);
//	     
//        requestBody = httpUtil.getBody();
//        
//        String temp = EncodingUtil.urlDecode('en_US', 'UTF-8');
//        System.assert(requestBody.contains('requestEnvelope.errorLanguage=' + temp));
//        temp = EncodingUtil.urlEncode('ReturnAll', 'UTF-8');
//        System.assert(requestBody.contains('requestEnvelope.detailLevelCode=' + temp));
//        temp = EncodingUtil.urlEncode('myapp', 'UTF-8');
//		System.assert(requestBody.contains('clientDetails.applicationId=' + temp));
//		temp = EncodingUtil.urlEncode('172.16.4.89', 'UTF-8');
//		System.assert(requestBody.contains('clientDetails.ipAddress=' + temp));
//		temp = EncodingUtil.urlEncode('123456', 'UTF-8');
//		System.assert(requestBody.contains('clientDetails.customerId=' + temp));
//		temp = EncodingUtil.urlEncode('partner', 'UTF-8');
//		System.assert(requestBody.contains('clientDetails.customerType=' + temp));
//		temp = EncodingUtil.urlEncode('2233', 'UTF-8');
//		System.assert(requestBody.contains('clientDetails.deviceId=' + temp));
//		temp = EncodingUtil.urlEncode('Persistent', 'UTF-8');
//		System.assert(requestBody.contains('clientDetails.partnerName=' + temp));
//		temp = EncodingUtil.urlEncode('USA', 'UTF-8');
//		System.assert(requestBody.contains('clientDetails.geoLocation=' + temp));
//		temp = EncodingUtil.urlEncode('Model', 'UTF-8');	
//		System.assert(requestBody.contains('clientDetails.model=' + temp));
//		temp = EncodingUtil.urlEncode('USD', 'UTF-8');
//		System.assert(requestBody.contains('currencyCode=' + temp));
//		temp = EncodingUtil.urlEncode('1', 'UTF-8');
//		System.assert(requestBody.contains('dateOfMonth=' + temp));
//        temp = EncodingUtil.urlEncode('WEDNESDAY', 'UTF-8');
//		System.assert(requestBody.contains('dayOfWeek=' + temp));
//		temp = EncodingUtil.urlEncode('2009-10-09', 'UTF-8');
//		System.assert(requestBody.contains('endingDate=' + temp));
//		temp = EncodingUtil.urlEncode('10', 'UTF-8');
//		System.assert(requestBody.contains('maxAmountPerPayment=' + temp));
//		temp = EncodingUtil.urlEncode('5', 'UTF-8');
//		System.assert(requestBody.contains('maxNumberOfPayments=' + temp));
//		temp = EncodingUtil.urlEncode('1', 'UTF-8');
//		System.assert(requestBody.contains('maxNumberOfPaymentsPerPeriod=' + temp));
//		temp = EncodingUtil.urlEncode('100', 'UTF-8');
//		System.assert(requestBody.contains('maxTotalAmountOfAllPayments=' + temp));
//		temp = EncodingUtil.urlEncode('DAILY', 'UTF-8');
//		System.assert(requestBody.contains('paymentPeriod=' + temp));
//		temp = EncodingUtil.urlEncode('NOT_REQUIRED', 'UTF-8');
//		System.assert(requestBody.contains('pinType=' + temp));
//		temp = EncodingUtil.urlEncode('2009-09-20', 'UTF-8');
//		System.assert(requestBody.contains('startingDate=' + temp));
//		
//		// Assert End point
//		System.assert(httpUtil.getEndPoint() == 'https://svcs.sandbox.paypal.com/AdaptivePayments/Preapproval');
//		// Assert Method
//		System.assert(httpUtil.getMethod() == 'POST');
//		// Assert Headers
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-USERID') == 'S11_1251093592_biz_api1.persistent.co.in');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-PASSWORD') == '1251093602');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-SIGNATURE') == 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND');
//		System.assert(httpUtil.getHeader('X-PAYPAL-APPLICATION-ID') == 'APP-80W284485P519543T');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SERVICE-VERSION') == '1.3.0');
//		System.assert(httpUtil.getHeader('X-PAYPAL-DEVICE-ID') == 'DeviceID');
//		System.assert(httpUtil.getHeader('X-PAYPAL-DEVICE-IPADDRESS') == '172.16.4.89');
//		
//        PPPreapprovalResponse response = toolkit.Preapproval(request);
//    }
//    
//    static testMethod void testCommitPreapproval() {
//    	PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
//    	toolkit.commitPreapproval('preapprovalKey');
//    }	
//    
//    static testMethod void testPreapprovalDetails() {
//        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
//        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
//		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
//		baseProfile.APIPassword = '1251093602';		
//    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
//		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
//    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX_BETA;
//		baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
//		baseProfile.ApplicationID = 'APP-7AF51302JA1116120';
//		baseProfile.DeviceID = 'DeviceID';
//    	baseProfile.DeviceIPAddress = '172.16.4.89';
//    	baseProfile.ServiceVersion = '1.3.0';
//		toolkit.BaseAPIProfile = baseProfile;
//		
//		PPPreapprovalDetailsRequest request = new PPPreapprovalDetailsRequest();
//        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
//        request.PreapprovalKey = 'PA-6R389498HA1768156';
//        
//        // Assert Request Parameters
//        Map<String, String>requestParams = new Map<String, String>();
//        request.getRequestParams(requestParams);
//        String requestBody = PPNvpCodec.encode(requestParams);
//        
//        PPHttpUtil httpUtil = new PPHttpUtil();
//	    httpUtil.createHttpRequest(baseProfile.getEndPoint() + request.ApiName, 'POST', baseProfile.getRequestHeaders(), requestBody);
//	     
//        requestBody = httpUtil.getBody();
//        
//        String temp = EncodingUtil.urlDecode('en_US', 'UTF-8');
//        System.assert(requestBody.contains('requestEnvelope.errorLanguage=' + temp));
//        temp = EncodingUtil.urlEncode('ReturnAll', 'UTF-8');
//        System.assert(requestBody.contains('requestEnvelope.detailLevelCode=' + temp));
//        temp = EncodingUtil.urlEncode('PA-6R389498HA1768156', 'UTF-8');
//        System.assert(requestBody.contains('preapprovalKey=' + temp));
//        
//        // Assert End point
//		System.assert(httpUtil.getEndPoint() == 'https://svcs.beta-sandbox.paypal.com/AdaptivePayments/PreapprovalDetails');
//		// Assert Method
//		System.assert(httpUtil.getMethod() == 'POST');
//        // Assert Headers
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-USERID') == 'S11_1251093592_biz_api1.persistent.co.in');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-PASSWORD') == '1251093602');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-SIGNATURE') == 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND');
//		System.assert(httpUtil.getHeader('X-PAYPAL-APPLICATION-ID') == 'APP-7AF51302JA1116120');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SERVICE-VERSION') == '1.3.0');
//		System.assert(httpUtil.getHeader('X-PAYPAL-DEVICE-ID') == 'DeviceID');
//		System.assert(httpUtil.getHeader('X-PAYPAL-DEVICE-IPADDRESS') == '172.16.4.89');
//		
//        PPPreapprovalDetailsResponse response = toolkit.PreapprovalDetails(request);
//    }
//    
//     static testMethod void testCancelPreapproval() {
//        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
//        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
//		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
//		baseProfile.APIPassword = '1251093602';		
//    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
//		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
//    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX_BETA;
//		baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
//		baseProfile.ApplicationID = 'APP-7AF51302JA1116120';
//		baseProfile.DeviceID = 'DeviceID';
//    	baseProfile.DeviceIPAddress = '172.16.4.89';
//    	baseProfile.ServiceVersion = '1.3.0';
//		toolkit.BaseAPIProfile = baseProfile;
//		
//		PPCancelPreapprovalRequest request = new PPCancelPreapprovalRequest();
//        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
//        request.PreapprovalKey = 'PA-6R389498HA1768156';
//        
//        
//        // Assert request parameters
//        Map<String, String>requestParams = new Map<String, String>();
//        request.getRequestParams(requestParams);
//        String requestBody = PPNvpCodec.encode(requestParams);
//        
//        PPHttpUtil httpUtil = new PPHttpUtil();
//	    httpUtil.createHttpRequest(baseProfile.getEndPoint() + request.ApiName, 'POST', baseProfile.getRequestHeaders(), requestBody);
//	     
//        requestBody = httpUtil.getBody();
//        
//        String temp = EncodingUtil.urlDecode('en_US', 'UTF-8');
//        System.assert(requestBody.contains('requestEnvelope.errorLanguage=' + temp));
//        temp = EncodingUtil.urlEncode('ReturnAll', 'UTF-8');
//        System.assert(requestBody.contains('requestEnvelope.detailLevelCode=' + temp));
//        temp = EncodingUtil.urlEncode('PA-6R389498HA1768156', 'UTF-8');
//        System.assert(requestBody.contains('preapprovalKey=' + temp));
//        
//		// Assert End point
//		System.assert(httpUtil.getEndPoint() == 'https://svcs.beta-sandbox.paypal.com/AdaptivePayments/CancelPreapproval');
//		// Assert Method
//		System.assert(httpUtil.getMethod() == 'POST');
//        // Assert Headers
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-USERID') == 'S11_1251093592_biz_api1.persistent.co.in');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-PASSWORD') == '1251093602');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-SIGNATURE') == 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND');
//		System.assert(httpUtil.getHeader('X-PAYPAL-APPLICATION-ID') == 'APP-7AF51302JA1116120');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SERVICE-VERSION') == '1.3.0');
//		System.assert(httpUtil.getHeader('X-PAYPAL-DEVICE-ID') == 'DeviceID');
//		System.assert(httpUtil.getHeader('X-PAYPAL-DEVICE-IPADDRESS') == '172.16.4.89');
//		
//        PPCancelPreapprovalResponse response = toolkit.cancelPreapproval(request);
//        
//    }
//    
//    static testMethod void testRefund() {
//        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
//        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
//		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
//		baseProfile.APIPassword = '1251093602';		
//    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
//		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
//    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_PRODUCTION;
//		baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
//		baseProfile.ApplicationID = 'APP-7AF51302JA1116120';
//		baseProfile.DeviceID = 'DeviceID';
//    	baseProfile.DeviceIPAddress = '172.16.4.89';
//    	baseProfile.ServiceVersion = '1.3.0';
//		toolkit.BaseAPIProfile = baseProfile;
//		
//        PPRefundRequest request = new PPRefundRequest();
//        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
//        request.TransactionId = '22826050WW377444U';
//        request.CurrencyCode = 'USD';
//        
//        // Assert request parameters
//        Map<String, String>requestParams = new Map<String, String>();
//        request.getRequestParams(requestParams);
//        String requestBody = PPNvpCodec.encode(requestParams);
//        
//        PPHttpUtil httpUtil = new PPHttpUtil();
//	    httpUtil.createHttpRequest(baseProfile.getEndPoint() + request.ApiName, 'POST', baseProfile.getRequestHeaders(), requestBody);
//	     
//        requestBody = httpUtil.getBody();
//        String temp = EncodingUtil.urlDecode('en_US', 'UTF-8');
//        
//        System.assert(requestBody.contains('requestEnvelope.errorLanguage=' + temp));
//        temp = EncodingUtil.urlEncode('ReturnAll', 'UTF-8');
//        System.assert(requestBody.contains('requestEnvelope.detailLevelCode=' + temp));
//        temp = EncodingUtil.urlEncode('22826050WW377444U', 'UTF-8');
//        System.assert(requestBody.contains('transactionId=' + temp));
//        temp = EncodingUtil.urlEncode('USD', 'UTF-8');
//        System.assert(requestBody.contains('currencyCode=' + temp));
//        
//        // Assert End point
//		System.assert(httpUtil.getEndPoint() == 'https://svcs.paypal.com/AdaptivePayments/Refund');
//		// Assert Method
//		System.assert(httpUtil.getMethod() == 'POST');
//        // Assert Headers
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-USERID') == 'S11_1251093592_biz_api1.persistent.co.in');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-PASSWORD') == '1251093602');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-SIGNATURE') == 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND');
//		System.assert(httpUtil.getHeader('X-PAYPAL-APPLICATION-ID') == 'APP-7AF51302JA1116120');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SERVICE-VERSION') == '1.3.0');
//		System.assert(httpUtil.getHeader('X-PAYPAL-DEVICE-ID') == 'DeviceID');
//		System.assert(httpUtil.getHeader('X-PAYPAL-DEVICE-IPADDRESS') == '172.16.4.89');
//		
//        PPRefundResponse response = toolkit.Refund(request);
//    }
//    
//    static testMethod void testConvertCurrency() {
//        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
//        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
//		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
//		baseProfile.APIPassword = '1251093602';		
//    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
//		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
//    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX_BETA;
//    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
//    	baseProfile.ApplicationID = 'APP-7AF51302JA1116120';
//    	baseProfile.DeviceID = 'DeviceID';
//    	baseProfile.DeviceIPAddress = '172.16.4.89';
//    	baseProfile.ServiceVersion = '1.3.0';
//		toolkit.BaseAPIProfile = baseProfile;
//		
//		PPConvertCurrencyRequest request = new PPConvertCurrencyRequest ();
//        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
//        
//		PPCurrencyType ct = new PPCurrencyType();
//        ct.Amount = 100;
//        ct.Code = 'USD';
//        List<PPCurrencyType> listC = new List<PPCurrencyType>();
//        listC.add(ct);
//        request.BaseAmountList = listC;  
//        
//        List<String>codes = new List<String>();
//        codes.add('USD');
//        request.ConvertToCurrencyList = codes;
//        
//        // Assert request parameters
//        Map<String, String>requestParams = new Map<String, String>();
//        request.getRequestParams(requestParams);
//        String requestBody = PPNvpCodec.encode(requestParams);
//        
//        PPHttpUtil httpUtil = new PPHttpUtil();
//	    httpUtil.createHttpRequest(baseProfile.getEndPoint() + request.ApiName, 'POST', baseProfile.getRequestHeaders(), requestBody);
//	     
//        requestBody = httpUtil.getBody();
//        
//        String temp = EncodingUtil.urlDecode('en_US', 'UTF-8');
//        System.assert(requestBody.contains('requestEnvelope.errorLanguage=' + temp));
//        temp = EncodingUtil.urlEncode('ReturnAll', 'UTF-8');
//        System.assert(requestBody.contains('requestEnvelope.detailLevelCode=' + temp));
//        temp = EncodingUtil.urlEncode('100', 'UTF-8');
//        System.assert(requestBody.contains('baseAmountList.currency(0).amount=' + temp));
//        temp = EncodingUtil.urlEncode('USD', 'UTF-8');
//        System.assert(requestBody.contains('baseAmountList.currency(0).code=' + temp));
//        temp = EncodingUtil.urlEncode('USD', 'UTF-8');
//        System.assert(requestBody.contains('convertToCurrencyList.currencyCode(0)=' + temp));
//        
//        // Assert End point
//		System.assert(httpUtil.getEndPoint() == 'https://svcs.beta-sandbox.paypal.com/AdaptivePayments/ConvertCurrency');
//		// Assert Method
//		System.assert(httpUtil.getMethod() == 'POST');
//        // Assert Headers
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-USERID') == 'S11_1251093592_biz_api1.persistent.co.in');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-PASSWORD') == '1251093602');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-SIGNATURE') == 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND');
//		System.assert(httpUtil.getHeader('X-PAYPAL-APPLICATION-ID') == 'APP-7AF51302JA1116120');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SERVICE-VERSION') == '1.3.0');
//		System.assert(httpUtil.getHeader('X-PAYPAL-DEVICE-ID') == 'DeviceID');
//		System.assert(httpUtil.getHeader('X-PAYPAL-DEVICE-IPADDRESS') == '172.16.4.89');
//		
//        PPConvertCurrencyResponse response = toolkit.convertCurrency_PP(request);
//    }
//    
//    static testMethod void testCreateAccount() {
//    	PPCreateAccountRequest request = new PPCreateAccountRequest();
//		request.setRequestEnvelopeParams('en_US', '');
//        request.AccountType = 'Personal';
//        request.SandboxEmailAddress = 'mayur_karmarkar@persistent.co.in';
//		PPAddress address = new PPAddress();
//        address.Line1 = '1968 Ape Way'; 
//        address.Line2 = 'Apt 23'; 
//		address.City = 'Austin'; 
//		address.State = 'TX'; 
//		address.PostalCode = '78750'; 
//		address.CountryCode = 'US';
//		request.Address = address; 
//          
//		PPBusinessInfo businessInfo = new PPBusinessInfo();
//		businessInfo.BusinessAddress = 'My business address'; 
//  		businessInfo.BusinessName = 'My business name'; 
//  		businessInfo.Category = 21; 
//  		businessInfo.SubCategory = 31; 
//  		businessInfo.Workphone = '512-691-4160';    
//  		request.BusinessInfo = businessInfo;
//  		request.CitizenshipCountryCode = 'US';
//          
//		PPClientDetails clientDetails = new PPClientDetails();
//        request.ClientDetails = clientDetails;
//        request.ContactPhoneNumber = '512-691-4160';
//        PPCreateAccountWebOptions createAccountWebOptions = new PPCreateAccountWebOptions();
//        createAccountWebOptions.ReturnURL = 'https://ns-sunil.ap1.visual.force.com/apex/ReturnURL'; 
//        request.CreateAccountWebOptions = createAccountWebOptions;
//        request.CurrencyCode = 'USD';
//        request.DateOfBirth = DateTime.newInstance(1986, 08, 19);
//        request.EmailAddress = 'test_mayur3@persistent.co.in';
//          
//		PPName name = new PPName();
//        name.Salutation = 'Dr.'; 
//        name.FirstName = 'Bonzo'; 
//        name.MiddleName = 'Simore'; 
//        name.LastName = 'Zaius'; 
//        request.NameInfo = name;
//          
//		request.PartnerField1 = 'Pesistent';
//        request.PartnerField2 = 'force.com';
//        request.PartnerField3 = 'IBM';
//        request.PartnerField4 = 'Google';
//        request.PartnerField5 = 'Microsoft';
//        request.PreferredLanguageCode = 'en_US';
//        request.RegistrationType = 'Web'; 
//        
//        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
//        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
//        baseProfile.APIUsername = 'mayur__1253883675_biz_api1.persistent.co.in';              
//        baseProfile.APIPassword = '1253883685';            
//        baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
//        baseProfile.APISignature = 'AnNMT7nRteKS2auTkxdsRz9rRvvPAcrlgQfWCI4Dic6LyeJCPHxRoU96';                
//        baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_PRODUCTION;
//        baseProfile.ApplicationID = 'APP-7AF51302JA1116120';
//        baseProfile.DeviceIPAddress = '172.16.3.90';
//        baseProfile.DeviceID = 'DeviceID';
//    	baseProfile.DeviceIPAddress = '172.16.4.89';
//    	baseProfile.ServiceVersion = '1.3.0';
//        baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_ACCOUNT;
//        toolkit.BaseAPIProfile = baseProfile;
//        
//        
//         // Assert request parameters
//        Map<String, String>requestParams = new Map<String, String>();
//        request.getRequestParams(requestParams);
//        String requestBody = PPNvpCodec.encode(requestParams);
//        
//        PPHttpUtil httpUtil = new PPHttpUtil();
//	    httpUtil.createHttpRequest(baseProfile.getEndPoint() + request.ApiName, 'POST', baseProfile.getRequestHeaders(), requestBody);
//	     
//        requestBody = httpUtil.getBody();
//        String temp = EncodingUtil.urlDecode('en_US', 'UTF-8');
//        System.assert(requestBody.contains('requestEnvelope.errorLanguage=' + temp));
//        temp = EncodingUtil.urlEncode('ReturnAll', 'UTF-8');
//        System.assert(requestBody.contains('requestEnvelope.detailLevelCode=' + temp));
//        temp = EncodingUtil.urlEncode('Personal', 'UTF-8');
//        System.assert(requestBody.contains('accountType=' + temp));
//        temp = EncodingUtil.urlEncode('mayur_karmarkar@persistent.co.in', 'UTF-8');
//        System.assert(requestBody.contains('sandboxEmailAddress=' + temp));
//        temp = EncodingUtil.urlEncode('1968 Ape Way', 'UTF-8');
//        System.assert(requestBody.contains('address.line1=' + temp));
//        temp = EncodingUtil.urlEncode('Apt 23', 'UTF-8');
//        System.assert(requestBody.contains('address.line2=' + temp));
//        temp = EncodingUtil.urlEncode('Austin', 'UTF-8');
//        System.assert(requestBody.contains('address.city=' + temp));
//        temp = EncodingUtil.urlEncode('78750', 'UTF-8');
//        System.assert(requestBody.contains('address.postalCode=' + temp));
//        temp = EncodingUtil.urlEncode('TX', 'UTF-8');
//        System.assert(requestBody.contains('address.state=' + temp));
//        temp = EncodingUtil.urlEncode('US', 'UTF-8');
//        System.assert(requestBody.contains('address.countryCode=' + temp));
//        temp = EncodingUtil.urlEncode('My business address', 'UTF-8');
//        System.assert(requestBody.contains('business.businessAddress=' + temp));
//        temp = EncodingUtil.urlEncode('My business name', 'UTF-8');
//        System.assert(requestBody.contains('business.businessName=' + temp));
//        temp = EncodingUtil.urlEncode('21', 'UTF-8');
//        System.assert(requestBody.contains('business.category=' + temp));
//        temp = EncodingUtil.urlEncode('31', 'UTF-8');
//        System.assert(requestBody.contains('business.subCategory=' + temp));
//        temp = EncodingUtil.urlEncode('512-691-4160', 'UTF-8');
//        System.assert(requestBody.contains('business.workphone=' + temp));
//        temp = EncodingUtil.urlEncode('US', 'UTF-8');
//        System.assert(requestBody.contains('citizenshipCountryCode=' + temp));
//        temp = EncodingUtil.urlEncode('512-691-4160', 'UTF-8');
//        System.assert(requestBody.contains('contactPhoneNumber=' + temp));
//        temp = EncodingUtil.urlEncode('https://ns-sunil.ap1.visual.force.com/apex/ReturnURL', 'UTF-8');
//        System.assert(requestBody.contains('createAccountWebOptions.returnUrl=' + temp));
//        temp = EncodingUtil.urlEncode('USD', 'UTF-8');
//        System.assert(requestBody.contains('currencyCode=' + temp));
//        temp = EncodingUtil.urlEncode('Dr.', 'UTF-8');
//        System.assert(requestBody.contains('name.salutation=' + temp));
//        temp = EncodingUtil.urlEncode('test_mayur3@persistent.co.in', 'UTF-8');
//        System.assert(requestBody.contains('emailAddress=' + temp));
//        temp = EncodingUtil.urlEncode('1986-08-19', 'UTF-8');
//        System.assert(requestBody.contains('dateOfBirth=' + temp));
//        
//        temp = EncodingUtil.urlEncode('Bonzo', 'UTF-8');
//        System.assert(requestBody.contains('name.firstName=' + temp));
//        temp = EncodingUtil.urlEncode('Simore', 'UTF-8');
//        System.assert(requestBody.contains('name.middleName=' + temp));
//        temp = EncodingUtil.urlEncode('Zaius', 'UTF-8');
//        System.assert(requestBody.contains('name.lastName=' + temp));
//        temp = EncodingUtil.urlEncode('Pesistent', 'UTF-8');
//        System.assert(requestBody.contains('partnerField1=' + temp));
//        temp = EncodingUtil.urlEncode('force.com', 'UTF-8');
//        System.assert(requestBody.contains('partnerField2=' + temp));
//        temp = EncodingUtil.urlEncode('IBM', 'UTF-8');
//        System.assert(requestBody.contains('partnerField3=' + temp));
//        temp = EncodingUtil.urlEncode('Google', 'UTF-8');
//        System.assert(requestBody.contains('partnerField4=' + temp));
//        temp = EncodingUtil.urlEncode('Microsoft', 'UTF-8');
//        System.assert(requestBody.contains('partnerField5=' + temp));
//        temp = EncodingUtil.urlEncode('en_US', 'UTF-8');
//        System.assert(requestBody.contains('preferredLanguageCode=' + temp));
//        temp = EncodingUtil.urlEncode('Web', 'UTF-8');
//        System.assert(requestBody.contains('registrationType=' + temp));
//        
//        // Assert End point
//		System.assert(httpUtil.getEndPoint() == 'https://svcs.paypal.com/AdaptiveAccounts/CreateAccount');
//		// Assert Method
//		System.assert(httpUtil.getMethod() == 'POST');
//        // Assert Headers
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-USERID') == 'mayur__1253883675_biz_api1.persistent.co.in');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-PASSWORD') == '1253883685');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-SIGNATURE') == 'AnNMT7nRteKS2auTkxdsRz9rRvvPAcrlgQfWCI4Dic6LyeJCPHxRoU96');
//		System.assert(httpUtil.getHeader('X-PAYPAL-APPLICATION-ID') == 'APP-7AF51302JA1116120');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SERVICE-VERSION') == '1.3.0');
//		System.assert(httpUtil.getHeader('X-PAYPAL-DEVICE-ID') == 'DeviceID');
//		System.assert(httpUtil.getHeader('X-PAYPAL-DEVICE-IPADDRESS') == '172.16.4.89');
//		
//        PPCreateAccountResponse response = toolkit.CreateAccount(request);
//    }
//    
//    static testMethod void testGetUserAgreement() {
//    	PPGetUserAgreementRequest request = new PPGetUserAgreementRequest();
//		request.CountryCode = 'US';
//		request.LanguageCode = 'en_US';
//		                           
//		PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
//		
//		PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
//		baseProfile.APIUsername = 'mayur__1253883675_biz_api1.persistent.co.in';              
//		baseProfile.APIPassword = '1253883685';            
//		baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
//		baseProfile.APISignature = 'AnNMT7nRteKS2auTkxdsRz9rRvvPAcrlgQfWCI4Dic6LyeJCPHxRoU96';                
//		baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX_BETA;
//		baseProfile.ApplicationID = 'APP-7AF51302JA1116120';
//		baseProfile.DeviceIPAddress = '172.16.3.90';
//		baseProfile.DeviceID = 'DeviceID';
//    	baseProfile.DeviceIPAddress = '172.16.4.89';
//    	baseProfile.ServiceVersion = '1.3.0';
//		baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_ACCOUNT;
//		toolkit.BaseAPIProfile = baseProfile;
//		
//		// Assert request parameters
//        Map<String, String>requestParams = new Map<String, String>();
//        request.getRequestParams(requestParams);
//        String requestBody = PPNvpCodec.encode(requestParams);
//        
//        PPHttpUtil httpUtil = new PPHttpUtil();
//	    httpUtil.createHttpRequest(baseProfile.getEndPoint() + request.ApiName, 'POST', baseProfile.getRequestHeaders(), requestBody);
//	     
//        requestBody = httpUtil.getBody();
//        String temp = EncodingUtil.urlDecode('US', 'UTF-8');
//        System.assert(requestBody.contains('countryCode=' + temp));
//        temp = EncodingUtil.urlEncode('en_US', 'UTF-8');
//        System.assert(requestBody.contains('languageCode=' + temp));
//        
//         // Assert End point
//		System.assert(httpUtil.getEndPoint() == 'https://svcs.beta-sandbox.paypal.com/AdaptiveAccounts/GetUserAgreement');
//		// Assert Method
//		System.assert(httpUtil.getMethod() == 'POST');
//        // Assert Headers
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-USERID') == 'mayur__1253883675_biz_api1.persistent.co.in');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-PASSWORD') == '1253883685');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SECURITY-SIGNATURE') == 'AnNMT7nRteKS2auTkxdsRz9rRvvPAcrlgQfWCI4Dic6LyeJCPHxRoU96');
//		System.assert(httpUtil.getHeader('X-PAYPAL-APPLICATION-ID') == 'APP-7AF51302JA1116120');
//		System.assert(httpUtil.getHeader('X-PAYPAL-SERVICE-VERSION') == '1.3.0');
//		System.assert(httpUtil.getHeader('X-PAYPAL-DEVICE-ID') == 'DeviceID');
//		System.assert(httpUtil.getHeader('X-PAYPAL-DEVICE-IPADDRESS') == '172.16.4.89');
//        
//		PPGetUserAgreementResponse response = toolkit.GetUserAgreement(request);
//    }
//    
//    static testMethod void testPPAdaptiveErrors() {
//    	PPFaultMessageException ex = new PPFaultMessageException();
//		ex.populateWithCustomError(PPAdaptiveErrors.ERROR_INVALID_INPUT_PARAM, PPAdaptiveErrors.ERROR_STRING_INVALID_INPUT_PARAM);
//		ex.populateWithCustomError(PPAdaptiveErrors.ERROR_PROFILE_TYPE_UNKNOWN, PPAdaptiveErrors.ERROR_STRING_PROFILE_TYPE_UNKNOWN);
//		ex.populateWithCustomError(PPAdaptiveErrors.ERROR_ENVIRONMENT_TYPE_UNKNOWN, PPAdaptiveErrors.ERROR_STRING_ENVIRONMENT_TYPE_UNKNOWN);
//        ex.populateWithCustomError(PPAdaptiveErrors.ERROR_SERVICE_TYPE_UNKNOWN, PPAdaptiveErrors.ERROR_STRING_SERVICE_TYPE_UNKNOWN);
//		String errorMessage = PPAdaptiveErrors.ERROR_STRING_HTTP_RESPONSE; 
//		ex.populateWithCustomError(PPAdaptiveErrors.ERROR_HTTP_RESPONSE, errorMessage);
//		ex.populateWithCustomError(PPAdaptiveErrors.ERROR_GOVERNOR_LIMITE_WEB_CALLOUT, 
//		PPAdaptiveErrors.ERROR_STRING_GOVERNOR_LIMITE_WEB_CALLOUT);   	   
//    }
//    
//    
//    static testMethod void testErrorConditionsForUnknownProfileType() {
//    	PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
//        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
//		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
//		baseProfile.APIPassword = '1251093602';		
//    	baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
//    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX_BETA;
//    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
//    	baseProfile.ApplicationID = 'ApplicationID';
//    	baseProfile.DeviceID = 'DeviceID';
//    	baseProfile.DeviceIPAddress = '172.16.4.89';
//    	baseProfile.ServiceVersion = '1.3.0';
//		toolkit.BaseAPIProfile = baseProfile;
//		
//		PPConvertCurrencyRequest request = new PPConvertCurrencyRequest ();
//        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
//        
//		PPCurrencyType ct = new PPCurrencyType();
//        ct.Amount = 100;
//        ct.Code = 'USD';
//        List<PPCurrencyType> listC = new List<PPCurrencyType>();
//        listC.add(ct);
//        request.BaseAmountList = listC;  
//        
//        List<String>codes = new List<String>();
//        codes.add('USD');
//        request.ConvertToCurrencyList = codes;
//        
//        try {
//			PPConvertCurrencyResponse response = toolkit.convertCurrency_PP(request);
//        }
//        catch (PPFaultMessageException ex) {
//        }
//    }
//    
//    static testMethod void testErrorConditionsForUnknownServiceType() {
//    	PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
//        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
//		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
//		baseProfile.APIPassword = '1251093602';		
//    	baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
//    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX_BETA;
//    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
//    	baseProfile.ApplicationID = 'ApplicationID';
//    	baseProfile.DeviceID = 'DeviceID';
//    	baseProfile.DeviceIPAddress = '172.16.4.89';
//    	baseProfile.ServiceVersion = '1.3.0';
//		toolkit.BaseAPIProfile = baseProfile;
//		
//		PPConvertCurrencyRequest request = new PPConvertCurrencyRequest ();
//        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
//        
//		PPCurrencyType ct = new PPCurrencyType();
//        ct.Amount = 100;
//        ct.Code = 'USD';
//        List<PPCurrencyType> listC = new List<PPCurrencyType>();
//        listC.add(ct);
//        request.BaseAmountList = listC;  
//        
//        List<String>codes = new List<String>();
//        codes.add('USD');
//        request.ConvertToCurrencyList = codes;
//        
//        try {
//			PPConvertCurrencyResponse response = toolkit.convertCurrency_PP(request);
//        }
//        catch (PPFaultMessageException ex) {
//        }
//    }
//    
//    static testMethod void testErrorConditionsForUnknownEnvironmentType() {
//    	PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
//        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
//		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
//		baseProfile.APIPassword = '1251093602';		
//    	baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
//    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
//    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
//    	baseProfile.ApplicationID = 'ApplicationID';
//    	baseProfile.DeviceID = 'DeviceID';
//    	baseProfile.DeviceIPAddress = '172.16.4.89';
//    	baseProfile.ServiceVersion = '1.3.0';
//    	baseProfile.Subject = 'PayPal Toolkit';
//		toolkit.BaseAPIProfile = baseProfile;
//		
//		PPConvertCurrencyRequest request = new PPConvertCurrencyRequest ();
//        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
//        
//		PPCurrencyType ct = new PPCurrencyType();
//        ct.Amount = 100;
//        ct.Code = 'USD';
//        List<PPCurrencyType> listC = new List<PPCurrencyType>();
//        listC.add(ct);
//        request.BaseAmountList = listC;  
//        
//        List<String>codes = new List<String>();
//        codes.add('USD');
//        request.ConvertToCurrencyList = codes;
//        
//        try {
//			PPConvertCurrencyResponse response = toolkit.convertCurrency_PP(request);
//        }
//        catch (PPFaultMessageException ex) {
//        }
//    }
//    
//    static testMethod void testErrorConditionsForNullRequest() {
//    	PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
//        
//		PPConvertCurrencyRequest request;
//		try {
//			PPConvertCurrencyResponse response = toolkit.convertCurrency_PP(request);
//        }
//        catch (PPFaultMessageException ex) {
//        }
//    }
}