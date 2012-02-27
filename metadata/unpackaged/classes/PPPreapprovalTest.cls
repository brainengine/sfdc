@isTest 
private class PPPreapprovalTest {
	static testMethod void testPreapproval() {
		PPPreapprovalRequest request = new PPPreapprovalRequest();
        request.setRequestEnvelopeParams('en_US', '');
        request.cancelUrl = 'https://c.ap1.visual.force.com/apex/CancelURL';
        request.returnUrl = 'https://c.ap1.visual.force.com/apex/ReturnURL';
        PPClientDetails clientDetails = new PPClientDetails();
        clientDetails.applicationId = 'myapp';
        clientDetails.ipAddress = '172.16.4.89';
        request.clientDetails = clientDetails;
        request.CurrencyCode = 'USD';
        request.DateOfMonth = 1;
        request.DayOfWeek = 'WEDNESDAY';
        request.EndingDate = DateTime.newInstance(2009, 10, 9);
        request.MaxAmountPerPayment = 10;
        request.MaxNumberOfPayments =  5;
        request.MaxNumberOfPaymentsPerPeriod = 1;
        request.maxTotalAmountOfAllPayment = 100;
        request.PaymentPeriod = 'DAILY';
        request.PinType = 'NOT_REQUIRED';
        request.StartingDate = DateTime.newInstance(2009, 9, 20);
        request.IpnNotificationUrl = 'http:\\www.ipnURl';
        request.Memo = 'memo';
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
		
        PPPreapprovalResponse response = toolkit.preapproval(request);
	}
}