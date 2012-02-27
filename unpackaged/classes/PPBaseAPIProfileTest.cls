@isTest
private class PPBaseAPIProfileTest {

    static testMethod void TestBaseAPIProfile() {
    	PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
    	baseProfile.APIUsername = 'APIUsername';
    	baseProfile.APIPassword = 'APIPassword';
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
    	baseProfile.APISignature = 'APISignature';
    	baseProfile.ApplicationID = 'ApplicationID';
    	baseProfile.DeviceID = 'DeviceID';
    	baseProfile.Certificate = 'Certificate';
    	baseProfile.CertificatePassword = 'CertificatePassword';
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	baseProfile.ServiceVersion = 'ServiceVersion';
    	baseProfile.Subject = 'Subject';

    	System.assert(baseProfile.APIUsername.equals('APIUsername'));
    	System.assert(baseProfile.APIPassword.equals('APIPassword'));
    	System.assert(baseProfile.APIProfile == PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN);
    	System.assert(baseProfile.APISignature.equals('APISignature'));
    	System.assert(baseProfile.ApplicationID.equals('ApplicationID'));
    	System.assert(baseProfile.DeviceID.equals('DeviceID'));
    	System.assert(baseProfile.Certificate.equals('Certificate'));
    	System.assert(baseProfile.CertificatePassword.equals('CertificatePassword'));

    	System.assert(baseProfile.getEndPoint().equals('https://svcs.sandbox.paypal.com/AdaptivePayments/'));
    	System.assert(baseProfile.Environment == PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX);
    	System.assert(baseProfile.getPayPalLoginPage().equals('https://www.sandbox.paypal.com/webscr?cmd='));
    	System.assert(baseProfile.ServiceVersion.equals('ServiceVersion'));
    	System.assert(baseProfile.Subject.equals('Subject'));
    }

    static testMethod void TestBaseAPIProfile_PAYMENT_SANDBOX() {
    	PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();

    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;

    	System.assert(baseProfile.Environment == PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX);
    	System.assert(baseProfile.getEndPoint().equals('https://svcs.sandbox.paypal.com/AdaptivePayments/'));
    	System.assert(baseProfile.getPayPalLoginPage().equals('https://www.sandbox.paypal.com/webscr?cmd='));
    }

    static testMethod void TestBaseAPIProfile_PAYMENT_SANDBOX_BETA() {
    	PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();

    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX_BETA;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;

    	System.assert(baseProfile.Environment == PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX_BETA);
    	System.assert(baseProfile.getEndPoint().equals('https://svcs.beta-sandbox.paypal.com/AdaptivePayments/'));
    	System.assert(baseProfile.getPayPalLoginPage().equals('https://www.beta-sandbox.paypal.com/webscr?cmd='));
    }

    static testMethod void TestBaseAPIProfile_PAYMENT_PRODUCTION() {
    	PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();

    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_PRODUCTION;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;

    	System.assert(baseProfile.Environment == PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_PRODUCTION);
    	System.assert(baseProfile.getEndPoint().equals('https://svcs.paypal.com/AdaptivePayments/'));
    	System.assert(baseProfile.getPayPalLoginPage().equals('https://www.paypal.com/webscr?cmd='));
    }

    static testMethod void TestBaseAPIProfile_ACCOUNT_PRODUCTION() {
    	PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();

    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_PRODUCTION;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_ACCOUNT;

    	System.assert(baseProfile.Environment == PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_PRODUCTION);
    	System.assert(baseProfile.getEndPoint().equals('https://svcs.paypal.com/AdaptiveAccounts/'));
    	System.assert(0 == baseProfile.getPayPalLoginPage().length());
    }

    static testMethod void getRequestHeadersTest_PROFILE_TYPE_THREE_TOKEN_PAYMENT_ENVIRONMENT_TYPE_SANDBOX() {
    	
    	PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
    	baseProfile.APIUsername = 'APIUsername';
    	baseProfile.APIPassword = 'APIPassword';
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
    	baseProfile.APISignature = 'APISignature';
    	baseProfile.ApplicationID = 'ApplicationID';
    	baseProfile.DeviceID = 'DeviceID';
    	baseProfile.DeviceIPAddress = 'DeviceIPAddress';
    	baseProfile.Certificate = 'Certificate';
    	baseProfile.CertificatePassword = 'CertificatePassword';
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	baseProfile.ServiceVersion = 'ServiceVersion';
    	baseProfile.Subject = 'Subject';

    	Map<String, String> headers = new Map<String, String>();
    	headers = baseProfile.getRequestHeaders();
    	
    	System.assert(false == headers.isEmpty());
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_SECURITY_USERID));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_SECURITY_PASSWORD));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_SECURITY_SIGNATURE));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_REQUEST_DATA_FORMAT));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_RESPONSE_DATA_FORMAT));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_SERVICE_VERSION));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_APPLICATION_ID));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_DEVICE_ID));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_DEVICE_IPADDRESS));
    	
    	System.assert(baseProfile.getEndPoint().equals('https://svcs.sandbox.paypal.com/AdaptivePayments/'));
    	System.assert(baseProfile.Environment == PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX);
    	System.assert(baseProfile.getPayPalLoginPage().equals('https://www.sandbox.paypal.com/webscr?cmd='));
    }

    static testMethod void getRequestHeadersTest_PAYMENT_PROFILE_TYPE_CERTIFICATE() {
    	
    	PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
    	baseProfile.APIUsername = 'APIUsername';
    	baseProfile.APIPassword = 'APIPassword';
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_CERTIFICATE;
    	baseProfile.APISignature = 'APISignature';
    	baseProfile.ApplicationID = 'ApplicationID';
    	baseProfile.DeviceID = 'DeviceID';
    	baseProfile.DeviceIPAddress = 'DeviceIPAddress';
    	baseProfile.Certificate = 'Certificate';
    	baseProfile.CertificatePassword = 'CertificatePassword';
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_PAYMENTS;
    	baseProfile.ServiceVersion = 'ServiceVersion';
    	baseProfile.Subject = 'Subject';

    	Map<String, String> headers = new Map<String, String>();
    	headers = baseProfile.getRequestHeaders();
    	
    	System.assert(false == headers.isEmpty());
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_SECURITY_USERID));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_SECURITY_PASSWORD));
    	System.assert(false == headers.containsKey(PPStaticRes.PAYPAL_SECURITY_SIGNATURE));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_REQUEST_DATA_FORMAT));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_RESPONSE_DATA_FORMAT));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_SERVICE_VERSION));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_APPLICATION_ID));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_DEVICE_ID));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_DEVICE_IPADDRESS));
    	
    	System.assert(baseProfile.getEndPoint().equals('https://svcs.sandbox.paypal.com/AdaptivePayments/'));
    	System.assert(baseProfile.Environment == PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX);
    	System.assert(baseProfile.getPayPalLoginPage().equals('https://www.sandbox.paypal.com/webscr?cmd='));
    }

    static testMethod void getRequestHeadersTest_ACCOUNT_PROFILE_TYPE_CERTIFICATE() {
    	
    	PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
    	baseProfile.APIUsername = 'APIUsername';
    	baseProfile.APIPassword = 'APIPassword';
    	baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_CERTIFICATE;
    	baseProfile.APISignature = 'APISignature';
    	baseProfile.ApplicationID = 'ApplicationID';
    	baseProfile.DeviceID = 'DeviceID';
    	baseProfile.DeviceIPAddress = 'DeviceIPAddress';
    	baseProfile.Certificate = 'Certificate';
    	baseProfile.CertificatePassword = 'CertificatePassword';
    	baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_ACCOUNT;
    	baseProfile.ServiceVersion = 'ServiceVersion';
    	baseProfile.Subject = 'Subject';

    	Map<String, String> headers = new Map<String, String>();
    	headers = baseProfile.getRequestHeaders();
    	
    	System.assert(false == headers.isEmpty());
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_SECURITY_USERID));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_SECURITY_PASSWORD));
    	System.assert(false == headers.containsKey(PPStaticRes.PAYPAL_SECURITY_SIGNATURE));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_REQUEST_DATA_FORMAT));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_RESPONSE_DATA_FORMAT));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_SERVICE_VERSION));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_APPLICATION_ID));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_DEVICE_ID));
    	System.assert(headers.containsKey(PPStaticRes.PAYPAL_DEVICE_IPADDRESS));
    	
    	System.assert(baseProfile.getEndPoint().equals('https://svcs.sandbox.paypal.com/AdaptiveAccounts/'));
    	System.assert(baseProfile.Environment == PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX);
    	System.assert(0 == baseProfile.getPayPalLoginPage().length());
    }

}