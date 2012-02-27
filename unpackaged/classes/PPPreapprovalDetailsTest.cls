@isTest 
private class PPPreapprovalDetailsTest {
	static testMethod void testPreapprovalDetails() {
		PPPreapprovalDetailsRequest request = new PPPreapprovalDetailsRequest();
		PPRequestEnvelope reqEnvelope = new PPRequestEnvelope();
   		reqEnvelope.errorLanguage = 'en_US';
   		reqEnvelope.detailLevelCode = 'ReturnAll';
   		request.requestEnvelope = reqEnvelope;
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
		
   		request.PreapprovalKey = 'PA-6R389498HA1768156';
   		Map<String, String>requestParams = new Map<String, String>();
   		PPPreapprovalDetailsResponse response = toolkit.preapprovalDetails(request);
	}
}