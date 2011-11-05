@isTest 
private class PPPayTest {
    static testMethod void simplePaymentExplicitApprovalSenderPaysFees() {
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
        request.clientDetails = clientDetails;
         
        request.cancelUrl = 'https://c.na7.visual.force.com/apex/CancelURL';
        request.returnUrl = 'https://c.na7.visual.force.com/apex/ReturnURL';
        request.IpnNotificationUrl = 'http://google.com';
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
        
        
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
		baseProfile.ApplicationID = 'ApplicationID';
		baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
		toolkit.BaseAPIProfile = baseProfile;
		
		// Assert BaseAPIProfile
		System.assert(toolkit.BaseAPIProfile.APIUsername.equals('S11_1251093592_biz_api1.persistent.co.in'));
		System.assert(toolkit.BaseAPIProfile.APIPassword.equals('1251093602'));
		System.assert(toolkit.BaseAPIProfile.APIProfile == PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN);
		System.assert(toolkit.BaseAPIProfile.APISignature.equals('AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND'));
		System.assert(toolkit.BaseAPIProfile.Environment == PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX);
		System.assert(toolkit.BaseAPIProfile.ApplicationID.equals('ApplicationID'));
		
		System.assert(request.RequestEnvelope.ErrorLanguage.equals('en_US'));
        System.assert(request.RequestEnvelope.DetailLevelCode.equals('ReturnAll'));
        
        PPPayResponse response = toolkit.Pay(request);
    }
    
     static testMethod void simplePaymentExplicitApprovalReceiverPaysFees() {
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
        request.clientDetails = clientDetails;
        
        request.cancelUrl = 'https://c.na7.visual.force.com/apex/CancelURL';
        request.returnUrl = 'https://c.na7.visual.force.com/apex/ReturnURL';
        request.IpnNotificationUrl = 'http://google.com';
        
        request.currencyCode = 'USD';
        request.feesPayer = 'EACHRECEIVER';
        request.memo = 'test app';
        
        List<PPReceiver> receiverList = new List<PPReceiver>();
        PPReceiver receiver = new PPReceiver();
        receiver.email = 'manish_1250055563_biz@persistent.co.in';
        receiver.amount = 10.00;
        receiverList.Add(receiver);
        request.receiverList = receiverList;
        
        request.LogDefaultShippingAddress = false;
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
		baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
		toolkit.BaseAPIProfile = baseProfile;
		
		// Assert BaseAPIProfile
		System.assert(toolkit.BaseAPIProfile.APIUsername.equals('S11_1251093592_biz_api1.persistent.co.in'));
		System.assert(toolkit.BaseAPIProfile.APIPassword.equals('1251093602'));
		System.assert(toolkit.BaseAPIProfile.APIProfile == PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN);
		System.assert(toolkit.BaseAPIProfile.APISignature.equals('AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND'));
		System.assert(toolkit.BaseAPIProfile.Environment == PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX);
        PPPayResponse response = toolkit.Pay(request);
    }
    
    static testMethod void simplePaymentPreApprovalReceiverPaysFees() {
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
        request.clientDetails = clientDetails;
        
        request.cancelUrl = 'https://c.na7.visual.force.com/apex/CancelURL';
        request.returnUrl = 'https://c.na7.visual.force.com/apex/ReturnURL';
        request.IpnNotificationUrl = 'http://google.com';
        
        request.currencyCode = 'USD';
        request.feesPayer = 'EACHRECEIVER';
        request.memo = 'test app';
        
        List<PPReceiver> receiverList = new List<PPReceiver>();
        PPReceiver receiver = new PPReceiver();
        receiver.email = 'manish_1250055563_biz@persistent.co.in';
        receiver.amount = 10.00;
        receiverList.Add(receiver);
        request.receiverList = receiverList;
        
        request.PreapprovalKey = 'PR-A456646';
        request.Pin = '5544666';
        
        request.LogDefaultShippingAddress = true;
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	toolkit.BaseAPIProfile = baseProfile;       
        PPPayResponse response = toolkit.Pay(request);
    }
    
    static testMethod void simplePaymentPreApprovalSenderPaysFees() {
        PPPayRequest request = new PPPayRequest();
        request.setRequestEnvelopeParams('en_US', '');
        PPClientDetails clientDetails = new PPClientDetails();
        clientDetails.applicationId = 'myapp';
        clientDetails.ipAddress = '172.16.4.89';
        clientDetails.customerId = '123456';
        clientDetails.customerType = 'partner';
        clientDetails.deviceId = '2233';
        clientDetails.geoLocation = 'USA';
        clientDetails.partnerName = 'Persistent';
        request.clientDetails = clientDetails;
        
        request.cancelUrl = 'https://c.na7.visual.force.com/apex/CancelURL';
        request.returnUrl = 'https://c.na7.visual.force.com/apex/ReturnURL';
        request.IpnNotificationUrl = 'http://google.com';
        
        request.currencyCode = 'USD';
        request.feesPayer = 'SENDER';
        request.memo = 'test app';
        
        List<PPReceiver> receiverList = new List<PPReceiver>();
        PPReceiver receiver = new PPReceiver();
        receiver.email = 'manish_1250055563_biz@persistent.co.in';
        receiver.amount = 10.00;
        receiverList.Add(receiver);
        request.receiverList = receiverList;
        
        request.PreapprovalKey = 'PR-A456646';
        request.Pin = '5544666';
        request.LogDefaultShippingAddress = false;
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	toolkit.BaseAPIProfile = baseProfile;        
        PPPayResponse response = toolkit.Pay(request);
    }
    
    static testMethod void simplePaymentImplicitApproval() {
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
        request.clientDetails = clientDetails;
        
        request.cancelUrl = 'https://c.na7.visual.force.com/apex/CancelURL';
        request.returnUrl = 'https://c.na7.visual.force.com/apex/ReturnURL';
        request.IpnNotificationUrl = 'http://google.com';
        
        request.currencyCode = 'USD';
        request.memo = 'test app';
        
        List<PPReceiver> receiverList = new List<PPReceiver>();
        PPReceiver receiver = new PPReceiver();
        receiver.email = 'manish_1250055563_biz@persistent.co.in';
        receiver.amount = 10.00;
        receiverList.Add(receiver);
        request.receiverList = receiverList;
        
        request.LogDefaultShippingAddress = false;
        request.SenderEmail = 'sonali_1251967680_biz@persistent.co.in'; // make sure
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	toolkit.BaseAPIProfile = baseProfile; 
        PPPayResponse response = toolkit.Pay(request);
    }
    
    static testMethod void parallelPaymentExplicitApprovalSenderPaysFees() {
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
        request.clientDetails = clientDetails;
        
        request.cancelUrl = 'https://c.na7.visual.force.com/apex/CancelURL';
        request.returnUrl = 'https://c.na7.visual.force.com/apex/ReturnURL';
        request.IpnNotificationUrl = 'http://google.com';
        
        request.currencyCode = 'USD';
        request.feesPayer = 'SENDER';
        request.memo = 'test app';
        
        List<PPReceiver> receiverList = new List<PPReceiver>();
        PPReceiver receiver1 = new PPReceiver();
        receiver1.email = 'manish_1250055563_biz@persistent.co.in';
        receiver1.amount = 10.00;
        PPReceiver receiver2 = new PPReceiver();
        receiver2.email = 'sonali_1251967680_biz@persistent.co.in';
        receiver2.amount = 10.00;
        receiverList.Add(receiver2);
        receiverList.Add(receiver1);
        request.receiverList = receiverList;
        
        request.LogDefaultShippingAddress = false;
        request.ReverseAllParallelPaymentsOnError = true;
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	toolkit.BaseAPIProfile = baseProfile;        
        PPPayResponse response = toolkit.Pay(request);    
     }
    
     static testMethod void parallelPaymentExplicitApprovalReceiverPaysFees() {
        PPPayRequest request = new PPPayRequest();
        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
        
        PPClientDetails clientDetails = new PPClientDetails();
        clientDetails.applicationId = 'myapp';
        clientDetails.ipAddress = '172.16.4.89';
        request.clientDetails = clientDetails;
        
        request.cancelUrl = 'https://c.na7.visual.force.com/apex/CancelURL';
        request.returnUrl = 'https://c.na7.visual.force.com/apex/ReturnURL';
        request.IpnNotificationUrl = 'http://google.com';
        
        request.currencyCode = 'USD';
        request.feesPayer = 'EACHRECEIVER';
        request.memo = 'test app';
        
        List<PPReceiver> receiverList = new List<PPReceiver>();
        PPReceiver receiver1 = new PPReceiver();
        receiver1.email = 'manish_1250055563_biz@persistent.co.in';
        receiver1.amount = 10.00;
        PPReceiver receiver2 = new PPReceiver();
        receiver2.email = 'sonali_1251967680_biz@persistent.co.in';
        receiver2.amount = 10.00;
        receiverList.Add(receiver2);
        receiverList.Add(receiver1);
        request.receiverList = receiverList;
        
        request.LogDefaultShippingAddress = false;
        request.ReverseAllParallelPaymentsOnError = false;
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	toolkit.BaseAPIProfile = baseProfile;        
        PPPayResponse response = toolkit.Pay(request);    
    }
    
    static testMethod void parallelPaymentPreApprovalSenderPaysFees() {
        PPPayRequest request = new PPPayRequest();
        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
        PPClientDetails clientDetails = new PPClientDetails();
        clientDetails.applicationId = 'myapp';
        clientDetails.ipAddress = '172.16.4.89';
        request.clientDetails = clientDetails;
        
        request.cancelUrl = 'https://c.na7.visual.force.com/apex/CancelURL';
        request.returnUrl = 'https://c.na7.visual.force.com/apex/ReturnURL';
        request.IpnNotificationUrl = 'http://google.com';
        
        request.currencyCode = 'USD';
        request.feesPayer = 'SENDER';
        request.memo = 'test app';
        
        List<PPReceiver> receiverList = new List<PPReceiver>();
        PPReceiver receiver1 = new PPReceiver();
        receiver1.email = 'manish_1250055563_biz@persistent.co.in';
        receiver1.amount = 10.00;
        PPReceiver receiver2 = new PPReceiver();
        receiver2.email = 'sonali_1251967680_biz@persistent.co.in';
        receiver2.amount = 10.00;
        receiverList.Add(receiver2);
        receiverList.Add(receiver1);
        request.receiverList = receiverList;
        
        request.LogDefaultShippingAddress = false;
        request.ReverseAllParallelPaymentsOnError = false;
        
        request.PreapprovalKey = 'PR-A456646';
        request.Pin = '5544666';
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	toolkit.BaseAPIProfile = baseProfile;
        PPPayResponse response = toolkit.Pay(request);    
    }
    
    static testMethod void parallelPaymentPreApprovalReceiverPaysFees() {
        PPPayRequest request = new PPPayRequest();
        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
        PPClientDetails clientDetails = new PPClientDetails();
        clientDetails.applicationId = 'myapp';
        clientDetails.ipAddress = '172.16.4.89';
        request.clientDetails = clientDetails;
        
        request.cancelUrl = 'https://c.na7.visual.force.com/apex/CancelURL';
        request.returnUrl = 'https://c.na7.visual.force.com/apex/ReturnURL';
        request.IpnNotificationUrl = 'http://google.com';
        
        request.currencyCode = 'USD';
        request.feesPayer = 'EACHRECEIVER';
        request.memo = 'test app';
        
        List<PPReceiver> receiverList = new List<PPReceiver>();
        PPReceiver receiver1 = new PPReceiver();
        receiver1.email = 'manish_1250055563_biz@persistent.co.in';
        receiver1.amount = 10.00;
        PPReceiver receiver2 = new PPReceiver();
        receiver2.email = 'sonali_1251967680_biz@persistent.co.in';
        receiver2.amount = 10.00;
        receiverList.Add(receiver2);
        receiverList.Add(receiver1);
        request.receiverList = receiverList;
        
        request.LogDefaultShippingAddress = false;
        request.ReverseAllParallelPaymentsOnError = false;
        
         // Set proper keys
        request.PreapprovalKey = 'PR-A456646';
        request.Pin = '5544666';
        
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	toolkit.BaseAPIProfile = baseProfile;       
        
        PPPayResponse response = toolkit.Pay(request);        
    }
    
    static testMethod void chainedPaymentExplicitApprovalSenderPaysFees() {
        PPPayRequest request = new PPPayRequest();
        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
        
        PPClientDetails clientDetails = new PPClientDetails();
        clientDetails.applicationId = 'myapp';
        clientDetails.ipAddress = '172.16.4.89';
        request.clientDetails = clientDetails;
        
        request.cancelUrl = 'https://c.na7.visual.force.com/apex/CancelURL';
        request.returnUrl = 'https://c.na7.visual.force.com/apex/ReturnURL';
        request.IpnNotificationUrl = 'http://google.com';
        
        request.currencyCode = 'USD';
        request.feesPayer = 'SENDER';
        request.memo = 'test app';
        
        List<PPReceiver> receiverList = new List<PPReceiver>();
        PPReceiver primaryReceiver = new PPReceiver();
        primaryReceiver.email = 'seller_1251967875_biz@persistent.co.in';
        primaryReceiver.amount = 10.00;
        primaryReceiver.Primary = true;
        PPReceiver receiver1 = new PPReceiver();
        receiver1.email = 'manish_1250055563_biz@persistent.co.in';
        receiver1.amount = 10.00;
        PPReceiver receiver2 = new PPReceiver();
        receiver2.email = 'sonali_1251967680_biz@persistent.co.in';
        receiver2.amount = 10.00;
        receiverList.Add(receiver2);
        receiverList.Add(receiver1);
        receiverList.Add(primaryReceiver);
        request.receiverList = receiverList;
        
        request.LogDefaultShippingAddress = false;
        request.ReverseAllParallelPaymentsOnError = false;
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	toolkit.BaseAPIProfile = baseProfile;
        PPPayResponse response = toolkit.Pay(request);        
    }
    
    static testMethod void chainedPaymentExplicitApprovalReceiverPaysFees() {
        PPPayRequest request = new PPPayRequest();
        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
        PPClientDetails clientDetails = new PPClientDetails();
        clientDetails.applicationId = 'myapp';
        clientDetails.ipAddress = '172.16.4.89';
        request.clientDetails = clientDetails;
        
        request.cancelUrl = 'https://c.na7.visual.force.com/apex/CancelURL';
        request.returnUrl = 'https://c.na7.visual.force.com/apex/ReturnURL';
        request.IpnNotificationUrl = 'http://google.com';
        
        request.currencyCode = 'USD';
        request.feesPayer = 'EACHRECEIVER';
        request.memo = 'test app';
        
        List<PPReceiver> receiverList = new List<PPReceiver>();
        PPReceiver primaryReceiver = new PPReceiver();
        primaryReceiver.email = 'seller_1251967875_biz@persistent.co.in';
        primaryReceiver.amount = 10.00;
        primaryReceiver.Primary = true;
        PPReceiver receiver1 = new PPReceiver();
        receiver1.email = 'manish_1250055563_biz@persistent.co.in';
        receiver1.amount = 10.00;
        PPReceiver receiver2 = new PPReceiver();
        receiver2.email = 'sonali_1251967680_biz@persistent.co.in';
        receiver2.amount = 10.00;
        receiverList.Add(receiver2);
        receiverList.Add(receiver1);
        receiverList.Add(primaryReceiver);
        
        request.receiverList = receiverList;
        request.LogDefaultShippingAddress = false;
        request.ReverseAllParallelPaymentsOnError = false;
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	toolkit.BaseAPIProfile = baseProfile;
        PPPayResponse response = toolkit.Pay(request);        
    }
    
    static testMethod void chainedPaymentExplicitApprovalPrimaryReceiverPaysFees() {
        PPPayRequest request = new PPPayRequest();
        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
        PPClientDetails clientDetails = new PPClientDetails();
        clientDetails.applicationId = 'myapp';
        clientDetails.ipAddress = '172.16.4.89';
        request.clientDetails = clientDetails;
        
        request.cancelUrl = 'https://c.na7.visual.force.com/apex/CancelURL';
        request.returnUrl = 'https://c.na7.visual.force.com/apex/ReturnURL';
        request.IpnNotificationUrl = 'http://google.com';
        
        request.currencyCode = 'USD';
        request.feesPayer = 'PRIMARYRECEIVER';
        request.memo = 'test app';
        
        List<PPReceiver> receiverList = new List<PPReceiver>();
        PPReceiver primaryReceiver = new PPReceiver();
        primaryReceiver.email = 'seller_1251967875_biz@persistent.co.in';
        primaryReceiver.amount = 10.00;
        primaryReceiver.Primary = true;
        PPReceiver receiver1 = new PPReceiver();
        receiver1.email = 'manish_1250055563_biz@persistent.co.in';
        receiver1.amount = 10.00;
        PPReceiver receiver2 = new PPReceiver();
        receiver2.email = 'sonali_1251967680_biz@persistent.co.in';
        receiver2.amount = 10.00;
        receiverList.Add(receiver2);
        receiverList.Add(receiver1);
        receiverList.Add(primaryReceiver);
        request.receiverList = receiverList;
        
        request.LogDefaultShippingAddress = false;
        request.ReverseAllParallelPaymentsOnError = false;
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	toolkit.BaseAPIProfile = baseProfile;
        PPPayResponse response = toolkit.Pay(request);        
     }
    
     static testMethod void chainedPaymentPreApprovalSenderPaysFees() {
        PPPayRequest request = new PPPayRequest();
        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
        PPClientDetails clientDetails = new PPClientDetails();
        clientDetails.applicationId = 'myapp';
        clientDetails.ipAddress = '172.16.4.89';
        request.clientDetails = clientDetails;
        
        request.cancelUrl = 'https://c.na7.visual.force.com/apex/CancelURL';
        request.returnUrl = 'https://c.na7.visual.force.com/apex/ReturnURL';
        request.IpnNotificationUrl = 'http://google.com';
        
        request.currencyCode = 'USD';
        request.feesPayer = 'SENDER';
        request.memo = 'test app';
        
        List<PPReceiver> receiverList = new List<PPReceiver>();
        PPReceiver primaryReceiver = new PPReceiver();
        primaryReceiver.email = 'seller_1251967875_biz@persistent.co.in';
        primaryReceiver.amount = 10.00;
        primaryReceiver.Primary = true;
        PPReceiver receiver1 = new PPReceiver();
        receiver1.email = 'manish_1250055563_biz@persistent.co.in';
        receiver1.amount = 10.00;
        PPReceiver receiver2 = new PPReceiver();
        receiver2.email = 'sonali_1251967680_biz@persistent.co.in';
        receiver2.amount = 10.00;
        receiverList.Add(receiver2);
        receiverList.Add(receiver1);
        receiverList.Add(primaryReceiver);
        request.receiverList = receiverList;
        
        request.LogDefaultShippingAddress = false;
        request.ReverseAllParallelPaymentsOnError = false;
        request.PreapprovalKey = 'PR-A456646';
        request.Pin = '5544666';
        
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	toolkit.BaseAPIProfile = baseProfile;
        PPPayResponse response = toolkit.Pay(request);    
    }
    
    static testMethod void chainedPaymentPreApprovalReceiverPaysFees() {
        PPPayRequest request = new PPPayRequest();
        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
        PPClientDetails clientDetails = new PPClientDetails();
        clientDetails.applicationId = 'myapp';
        clientDetails.ipAddress = '172.16.4.89';
        request.clientDetails = clientDetails;
        
        request.cancelUrl = 'https://c.na7.visual.force.com/apex/CancelURL';
        request.returnUrl = 'https://c.na7.visual.force.com/apex/ReturnURL';
        request.IpnNotificationUrl = 'http://google.com';
        
        request.currencyCode = 'USD';
        request.feesPayer = 'EACHRECEIVER';
        request.memo = 'test app';
        
        List<PPReceiver> receiverList = new List<PPReceiver>();
        PPReceiver primaryReceiver = new PPReceiver();
        primaryReceiver.email = 'seller_1251967875_biz@persistent.co.in';
        primaryReceiver.amount = 10.00;
        primaryReceiver.Primary = true;
        PPReceiver receiver1 = new PPReceiver();
        receiver1.email = 'manish_1250055563_biz@persistent.co.in';
        receiver1.amount = 10.00;
        PPReceiver receiver2 = new PPReceiver();
        receiver2.email = 'sonali_1251967680_biz@persistent.co.in';
        receiver2.amount = 10.00;
        receiverList.Add(receiver2);
        receiverList.Add(receiver1);
        receiverList.Add(primaryReceiver);
        
        request.receiverList = receiverList;
        request.LogDefaultShippingAddress = false;
        request.ReverseAllParallelPaymentsOnError = false;
        
        request.PreapprovalKey = 'PR-A456646';
        request.Pin = '5544666';
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	toolkit.BaseAPIProfile = baseProfile;
        PPPayResponse response = toolkit.Pay(request);
    }
    
    static testMethod void chainedPaymentPreApprovalPrimaryReceiverPaysFees() {
        PPPayRequest request = new PPPayRequest();
        request.setRequestEnvelopeParams('en_US', 'ReturnAll');
        PPClientDetails clientDetails = new PPClientDetails();
        clientDetails.applicationId = 'myapp';
        clientDetails.ipAddress = '172.16.4.89';
        request.clientDetails = clientDetails;
        
        request.cancelUrl = 'https://c.na7.visual.force.com/apex/CancelURL';
        request.returnUrl = 'https://c.na7.visual.force.com/apex/ReturnURL';
        request.IpnNotificationUrl = 'http://google.com';
        
        request.currencyCode = 'USD';
        request.feesPayer = 'PRIMARYRECEIVER';
        request.memo = 'test app';
        
        List<PPReceiver> receiverList = new List<PPReceiver>();
        PPReceiver primaryReceiver = new PPReceiver();
        primaryReceiver.email = 'seller_1251967875_biz@persistent.co.in';
        primaryReceiver.amount = 10.00;
        primaryReceiver.Primary = true;
        PPReceiver receiver1 = new PPReceiver();
        receiver1.email = 'manish_1250055563_biz@persistent.co.in';
        receiver1.amount = 10.00;
        receiver1.Primary = false;
        PPReceiver receiver2 = new PPReceiver();
        receiver2.email = 'sonali_1251967680_biz@persistent.co.in';
        receiver2.amount = 10.00;
        receiver2.Primary = false;
        receiverList.Add(receiver2);
        receiverList.Add(receiver1);
        receiverList.Add(primaryReceiver);
        
        request.receiverList = receiverList;
        request.LogDefaultShippingAddress = false;
        request.ReverseAllParallelPaymentsOnError = false;
        request.PreapprovalKey = 'PR-A456646';
        request.Pin = '5544666';
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	toolkit.BaseAPIProfile = baseProfile;
        PPPayResponse response = toolkit.Pay(request);
    }
}