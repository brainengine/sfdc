@isTest 
private class PPPaymentDetailsTest {
	static testMethod void 	usingPayKey() {
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
		
		PPPaymentDetailsRequest request = new PPPaymentDetailsRequest();
		request.setRequestEnvelopeParams('language', 'detailLevelCode');
		System.assert(request.RequestEnvelope.ErrorLanguage.equals('language'));
        System.assert(request.RequestEnvelope.DetailLevelCode.equals('detailLevelCode'));
        request.PayKey = 'AP-4565344';
        System.assert(request.PayKey.equals('AP-4565344'));
        PPPaymentDetailsResponse response = toolkit.paymentDetails(request);
	}

	static testMethod void 	usingTransactionID() {
		PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_CERTIFICATE;
		baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
		baseProfile.Certificate = 'Certificate';
		baseProfile.CertificatePassword = 'CertificatePassword';
		baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
		toolkit.BaseAPIProfile = baseProfile;
		
		// Assert BaseAPIProfile
		System.assert(toolkit.BaseAPIProfile.APIUsername.equals('S11_1251093592_biz_api1.persistent.co.in'));
		System.assert(toolkit.BaseAPIProfile.APIPassword.equals('1251093602'));
		System.assert(toolkit.BaseAPIProfile.Certificate.equals('Certificate'));
		System.assert(toolkit.BaseAPIProfile.CertificatePassword.equals('CertificatePassword'));
		System.assert(toolkit.BaseAPIProfile.APIProfile == PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_CERTIFICATE);
		System.assert(toolkit.BaseAPIProfile.Environment == PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX);
	
		PPPaymentDetailsRequest request = new PPPaymentDetailsRequest();
        request.setRequestEnvelopeParams('language', 'detailLevelCode');
        System.assert(request.RequestEnvelope.ErrorLanguage.equals('language'));
        System.assert(request.RequestEnvelope.DetailLevelCode.equals('detailLevelCode'));
        request.TransactionId = 'DS4565344';
        System.assert(request.TransactionId.equals('DS4565344'));
        PPPaymentDetailsResponse response = toolkit.paymentDetails(request);
	}
	
	static testMethod void 	usingTrackingID() {
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX_BETA;
		baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
		toolkit.BaseAPIProfile = baseProfile;
		
		// Assert BaseAPIProfile
		System.assert(toolkit.BaseAPIProfile.APIUsername.equals('S11_1251093592_biz_api1.persistent.co.in'));
		System.assert(toolkit.BaseAPIProfile.APIPassword.equals('1251093602'));
		System.assert(toolkit.BaseAPIProfile.APIProfile == PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN);
		System.assert(toolkit.BaseAPIProfile.APISignature.equals('AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND'));
		System.assert(toolkit.BaseAPIProfile.Environment == PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX_BETA);
	
		PPPaymentDetailsRequest request = new PPPaymentDetailsRequest();
        request.setRequestEnvelopeParams('language', 'detailLevelCode');
        System.assert(request.RequestEnvelope.ErrorLanguage.equals('language'));
        System.assert(request.RequestEnvelope.DetailLevelCode.equals('detailLevelCode'));
        request.TrackingId = 'sddsds';
        System.assert(request.TrackingId.equals('sddsds'));
        PPPaymentDetailsResponse response = toolkit.paymentDetails(request);
	}
	
	static testMethod void 	usingPayKeyandTransactionID() {
		PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_PRODUCTION;
		baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
		toolkit.BaseAPIProfile = baseProfile;
		
		// Assert BaseAPIProfile
		System.assert(toolkit.BaseAPIProfile.APIUsername.equals('S11_1251093592_biz_api1.persistent.co.in'));
		System.assert(toolkit.BaseAPIProfile.APIPassword.equals('1251093602'));
		System.assert(toolkit.BaseAPIProfile.APIProfile == PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN);
		System.assert(toolkit.BaseAPIProfile.APISignature.equals('AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND'));
		System.assert(toolkit.BaseAPIProfile.Environment == PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_PRODUCTION);
	
		PPPaymentDetailsRequest request = new PPPaymentDetailsRequest();
        request.setRequestEnvelopeParams('language', 'detailLevelCode');
        System.assert(request.RequestEnvelope.ErrorLanguage.equals('language'));
        System.assert(request.RequestEnvelope.DetailLevelCode.equals('detailLevelCode'));
        request.TransactionId = 'DS4565344';
        request.PayKey = 'AP-4565344';
        System.assert(request.TransactionId.equals('DS4565344'));
        System.assert(request.PayKey.equals('AP-4565344'));
        PPPaymentDetailsResponse response = toolkit.paymentDetails(request);
	}
	
	static testMethod void 	usingPayKeyandTrackingID() {
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_PRODUCTION;
		baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
		toolkit.BaseAPIProfile = baseProfile;
		
		// Assert BaseAPIProfile
		System.assert(toolkit.BaseAPIProfile.APIUsername.equals('S11_1251093592_biz_api1.persistent.co.in'));
		System.assert(toolkit.BaseAPIProfile.APIPassword.equals('1251093602'));
		System.assert(toolkit.BaseAPIProfile.APIProfile == PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN);
		System.assert(toolkit.BaseAPIProfile.APISignature.equals('AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND'));
		System.assert(toolkit.BaseAPIProfile.Environment == PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_PRODUCTION);
	
   		PPPaymentDetailsRequest request = new PPPaymentDetailsRequest();
        request.setRequestEnvelopeParams('language', 'detailLevelCode');
        System.assert(request.RequestEnvelope.ErrorLanguage.equals('language'));
        System.assert(request.RequestEnvelope.DetailLevelCode.equals('detailLevelCode'));
        request.TrackingId = 'sddsds';
        request.PayKey = 'AP-4565344';
        System.assert(request.TrackingId.equals('sddsds'));
        System.assert(request.PayKey.equals('AP-4565344'));
        PPPaymentDetailsResponse response = toolkit.paymentDetails(request);
	}
	
	static testMethod void 	usingTransactionIDyandTrackingID() {
		PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
		PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_PRODUCTION;
		baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
		toolkit.BaseAPIProfile = baseProfile;
		
		// Assert BaseAPIProfile
		System.assert(toolkit.BaseAPIProfile.APIUsername.equals('S11_1251093592_biz_api1.persistent.co.in'));
		System.assert(toolkit.BaseAPIProfile.APIPassword.equals('1251093602'));
		System.assert(toolkit.BaseAPIProfile.APIProfile == PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN);
		System.assert(toolkit.BaseAPIProfile.APISignature.equals('AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND'));
		System.assert(toolkit.BaseAPIProfile.Environment == PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_PRODUCTION);
	
        PPPaymentDetailsRequest request = new PPPaymentDetailsRequest();
        request.setRequestEnvelopeParams('language', 'detailLevelCode');
        System.assert(request.RequestEnvelope.ErrorLanguage.equals('language'));
        System.assert(request.RequestEnvelope.DetailLevelCode.equals('detailLevelCode'));
        
        request.TrackingId = 'sddsds';
        request.TransactionId = 'DS4565344';
        System.assert(request.TrackingId.equals('sddsds'));
        System.assert(request.TransactionId.equals('DS4565344'));
        PPPaymentDetailsResponse response = toolkit.paymentDetails(request);
	}
	
	static testMethod void 	usingPayKeTransactionIDyandTrackingID() {
		PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
		PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_PRODUCTION;
    	baseProfile.ApplicationID = 'ApplicationID';
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
		toolkit.BaseAPIProfile = baseProfile;
		
		// Assert BaseAPIProfile
		System.assert(toolkit.BaseAPIProfile.APIUsername.equals('S11_1251093592_biz_api1.persistent.co.in'));
		System.assert(toolkit.BaseAPIProfile.APIPassword.equals('1251093602'));
		System.assert(toolkit.BaseAPIProfile.APIProfile == PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN);
		System.assert(toolkit.BaseAPIProfile.APISignature.equals('AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND'));
		System.assert(toolkit.BaseAPIProfile.Environment == PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_PRODUCTION);
	
        PPPaymentDetailsRequest request = new PPPaymentDetailsRequest();
        request.setRequestEnvelopeParams('language', 'detailLevelCode');
        System.assert(request.RequestEnvelope.ErrorLanguage.equals('language'));
        System.assert(request.RequestEnvelope.DetailLevelCode.equals('detailLevelCode'));
        
        request.TrackingId = 'sddsds';
        request.TransactionId = 'DS4565344';
        request.PayKey = 'AP-4565344';
        System.assert(request.TrackingId.equals('sddsds'));
        System.assert(request.TransactionId.equals('DS4565344'));
        System.assert(request.PayKey.equals('AP-4565344'));
        PPPaymentDetailsResponse response = toolkit.paymentDetails(request);
	}
}