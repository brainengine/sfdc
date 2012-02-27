@isTest 
private class PPRefundTest {
	static testMethod void usingPayKey() {
		PPRefundRequest request = new PPRefundRequest();
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        request.setRequestEnvelopeParams('en_US', '');
        request.PayKey = 'AP-345664';
        request.CurrencyCode = 'USD';
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
		toolkit.BaseAPIProfile = baseProfile;
		PPRefundResponse response = toolkit.refund(request);
	}
	
	static testMethod void usingTransactionId() {
		PPRefundRequest request = new PPRefundRequest();
       	PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        request.setRequestEnvelopeParams('en_US', '');
        request.TransactionId = '22826050WW377444U';
        request.CurrencyCode = 'USD';
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
		toolkit.BaseAPIProfile = baseProfile;
		request.TransactionId = 'TD-1234455';
        PPRefundResponse response = toolkit.refund(request);
	}
	
	static testMethod void usingTrackingId() {
		PPRefundRequest request = new PPRefundRequest();
       	PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        request.setRequestEnvelopeParams('en_US', '');
        request.TrackingId = '2282605';
        request.CurrencyCode = 'USD';
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
		toolkit.BaseAPIProfile = baseProfile;
		PPRefundResponse response = toolkit.refund(request);
	}
	
	static testMethod void usingTrackingIdandTransactionId() {
		PPRefundRequest request = new PPRefundRequest();
       	PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        request.setRequestEnvelopeParams('en_US', '');
        request.TrackingId = '22826050';
        request.TransactionId = '22826050WW377444U';
        request.CurrencyCode = 'USD';
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
		toolkit.BaseAPIProfile = baseProfile;
		PPRefundResponse response = toolkit.refund(request);
	}
	
	static testMethod void usingPayKeyTrackingIdandTransactionId() {
		PPRefundRequest request = new PPRefundRequest();
       	PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        request.setRequestEnvelopeParams('en_US', '');
        request.TrackingId = '22826050';
        request.TransactionId = '22826050WW377444U';
        request.CurrencyCode = 'USD';
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
		toolkit.BaseAPIProfile = baseProfile;
        request.PayKey = 'AP-345664';
        PPRefundResponse response = toolkit.refund(request);
	}
	
	static testMethod void usingPayKeyandTrackingId() {
		PPRefundRequest request = new PPRefundRequest();
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        request.setRequestEnvelopeParams('en_US', '');
        request.TrackingId = '22826050';
        request.CurrencyCode = 'USD';
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
		toolkit.BaseAPIProfile = baseProfile;
        request.PayKey = 'AP-345664';
        PPRefundResponse response = toolkit.refund(request);
	}
	
	static testMethod void usingPayKeydandTransactionId() {
		PPRefundRequest request = new PPRefundRequest();
       	PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        request.setRequestEnvelopeParams('en_US', '');
        request.TransactionId = '22826050WW377444U';
        request.CurrencyCode = 'USD';
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
		baseProfile.APIUsername = 'S11_1251093592_biz_api1.persistent.co.in';		
		baseProfile.APIPassword = '1251093602';		
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
		baseProfile.APISignature = 'AjOZLBchs9bvmNntdTAwK-YNomcsAPlrb3SUw.cISjP8I7bfev9VZDND';		
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
		toolkit.BaseAPIProfile = baseProfile;
        request.PayKey = 'Ap-345664';
        PPRefundResponse response = toolkit.refund(request);
	}
}