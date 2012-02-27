global class PPBaseAPIProfile {
	// Type of authentication methods
	global Enum APIProfileType {
		PROFILE_TYPE_UNKNOWN,
		PROFILE_TYPE_THREE_TOKEN,
		PROFILE_TYPE_CERTIFICATE
	}
	
	// Type of Environment
	global Enum EnvironmentType {
		ENVIRONMENT_TYPE_UNKNOWN,
		ENVIRONMENT_TYPE_SANDBOX,
		ENVIRONMENT_TYPE_SANDBOX_BETA,
		ENVIRONMENT_TYPE_PRODUCTION
	}

	// Type of Service
	global Enum ServiceType {
		SERVICE_TYPE_UNKNOWN,
		SERVICE_TYPE_ACCOUNT,
		SERVICE_TYPE_PAYMENTS
	}
	
	// (Required) API username of Application owner.
	global String APIUsername {get; set;}
	
	// (Required) API password of Application owner.
	global String APIPassword {get; set;} 
	
	// (Optional) authentiation method to be used to comminicate with PayPal 
	// server.
	global APIProfileType APIProfile {get; set;} 
	
	// (Required) API signature, which is required only if you use 3-token 
	// authorization.  
	global String APISignature {get; set;} 
	
	//(Required) API certificate, which is required only if you use certificate 
	// authorization.  
	global String Certificate {get; set;}
	
	//(Required) API certificate password, which is required only if you use 
	// certificate authorization.  
	global String CertificatePassword {get; set;}
	
	// (Required) Your application's identification, such as the name of your 
	// application.
	global String ApplicationID {get; set;}
	
	// (Optional) Client's device ID, such as a mobile device's IMEI number or a 
	// web browser cookie.
	global String DeviceID {get; set;}
	
	// (Optional) Client's IP address. This field is optional for all APIs except 
	// CreateAccount.
	global String DeviceIPAddress {get; set;}
	
	// (Optional) The version of an API operation to use. By default, PayPal 
	// executes a request with the current version of an API operation.
	global String ServiceVersion {get; set;}
	
	// (Optional) Third-party permission specification, which specifies the API 
	// username on whose behalf you have permission to execute the API operation. 
	// The subject must grant you third party access in their PayPal profile.
	global String Subject {get; set;}
	
	// (Required) Environment to be used (Production, Sandbox or Sandbox beta).
	global EnvironmentType Environment { get; 
		set {
			Environment = value;
			InitLoginPageAndEndPoint();
		}
	}

	// (Required) Type of service (Account or Payments).
	global ServiceType AdaptiveService { get; 
		set {
			AdaptiveService = value;
			InitLoginPageAndEndPoint();
		}
	}
	
	// Default Constructor for the advanced
	global PPBaseAPIProfile () {
		APIUsername = '';
		APIPassword = '';
		APIProfile = APIProfileType.PROFILE_TYPE_UNKNOWN;
		APISignature = '';
		Certificate = '';
		CertificatePassword = '';
		ApplicationID = '';
		DeviceID = '';
		DeviceIPAddress = '';
		Environment = EnvironmentType.ENVIRONMENT_TYPE_UNKNOWN;
		ServiceVersion = '';
		Subject = '';
		AdaptiveService = ServiceType.SERVICE_TYPE_UNKNOWN;
	}
	
	// Constructor that sets up APICredentials and Service
	global PPBaseAPIProfile (String APICredentialObjectName) {
		
		PPAPICredentials apiCredObj = new PPAPICredentials(APICredentialObjectName);
        // set the API credentials
        APIUsername = apiCredObj.APIUsername;
        APIPassword = apiCredObj.APIUserpassword;        
        if(apiCredObj.APIProfile == '3_TOKEN') {
        	// set the API authentication type
        	APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
        	APISignature = apiCredObj.APISignature;
        } else if(apiCredObj.APIProfile == 'CERTIFICATE'){
        	// set the API authentication type
        	APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_CERTIFICATE;
        	Certificate = apiCredObj.APICertificate;
        	CertificatePassword = apiCredObj.APICertificatepassword;
        } else {
        	APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_UNKNOWN;
        }
        // set the applicationID you have got from x.com
        ApplicationID = apiCredObj.ApplicationID;
        // set the environment - sandbox/beta/live
        if(apiCredObj.Environment == 'Sandbox') {
        	Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
        } else if(apiCredObj.Environment == 'Sandbox-Beta') {
        	Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX_BETA;
        } else if(apiCredObj.Environment == 'Production') {
        	Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_PRODUCTION;
        } else {
        	Environment = EnvironmentType.ENVIRONMENT_TYPE_UNKNOWN;
        }
        
        // defaults for the rest
		DeviceID = '';
		DeviceIPAddress = '';		
		ServiceVersion = '';
		Subject = '';
		AdaptiveService = ServiceType.SERVICE_TYPE_UNKNOWN;
	}
	global String getEndPoint() { return m_EndPoint; }
    global String getPayPalLoginPage() { return m_LoginPage; }
		
	// Returns header String populated with required fields that needs to be 
	// send with http request
	public map<String, String> getRequestHeaders() {
		
        map<String, String> headers = new map<String, String>();
        headers.put(PPStaticRes.PAYPAL_SECURITY_USERID, APIUsername);
        headers.put(PPStaticRes.PAYPAL_SECURITY_PASSWORD, APIPassword);

		if (APIProfileType.PROFILE_TYPE_THREE_TOKEN == APIProfile) {
			headers.put(PPStaticRes.PAYPAL_SECURITY_SIGNATURE, APISignature);
		}
		
		headers.put(PPStaticRes.PAYPAL_REQUEST_DATA_FORMAT, PPStaticRes.NVP_FORMAT);
        headers.put(PPStaticRes.PAYPAL_RESPONSE_DATA_FORMAT, PPStaticRes.NVP_FORMAT);
		
		if (0 < ServiceVersion.trim().length()) {
			headers.put(PPStaticRes.PAYPAL_SERVICE_VERSION, ServiceVersion);
		}
        
		if (0 < ApplicationID.trim().length()) {
			headers.put(PPStaticRes.PAYPAL_APPLICATION_ID, ApplicationID);
		}

		if (0 < DeviceID.trim().length()) {
			headers.put(PPStaticRes.PAYPAL_DEVICE_ID, DeviceID);
		}

		if (0 < DeviceIPAddress.trim().length()) {
			headers.put(PPStaticRes.PAYPAL_DEVICE_IPADDRESS, DeviceIPAddress);
		}
		
		if (0 < Subject.trim().length()) {
			headers.put(PPStaticRes.PAYPAL_SECURITY_SUBJECT, Subject);
		}
		// add the source header so we know where the requests are coming from
		headers.put(PPStaticRes.PAYPAL_REQUEST_SOURCE, PPStaticRes.PAYPAL_REQUEST_SOURCE_VALUE);

		return headers;
	}
	
	private void InitLoginPageAndEndPoint() {
		if(EnvironmentType.ENVIRONMENT_TYPE_SANDBOX == Environment) {
			
			if(ServiceType.SERVICE_TYPE_PAYMENTS == AdaptiveService) {				
				m_EndPoint = PAYMENT_END_POINT_SANDBOX;
				m_LoginPage = PAYMENT_PAYPAL_LOGIN_PAGE_SANDBOX;
			}else if (ServiceType.SERVICE_TYPE_ACCOUNT == AdaptiveService) {
				m_EndPoint = ACCOUNT_END_POINT_SANDBOX;
				m_LoginPage = '';
			}
		} else if (EnvironmentType.ENVIRONMENT_TYPE_SANDBOX_BETA == Environment) {

			if(ServiceType.SERVICE_TYPE_PAYMENTS == AdaptiveService) {				
				m_EndPoint = PAYMENT_END_POINT_SANDBOX_BETA;
				m_LoginPage = PAYMENT_PAYPAL_LOGIN_PAGE_SANDBOX_BETA;
			}else if (ServiceType.SERVICE_TYPE_ACCOUNT == AdaptiveService) {
				m_EndPoint = ACCOUNT_END_POINT_SANDBOX_BETA;
				m_LoginPage = '';
			}
		} else if (EnvironmentType.ENVIRONMENT_TYPE_PRODUCTION == Environment) {

			if (ServiceType.SERVICE_TYPE_PAYMENTS == AdaptiveService) {				
				m_EndPoint = PAYMENT_END_POINT_PRODUCTION;
				m_LoginPage = PAYMENT_PAYPAL_LOGIN_PAGE_PRODUCTION;
			} else if (ServiceType.SERVICE_TYPE_ACCOUNT == AdaptiveService) {
				m_EndPoint = ACCOUNT_END_POINT_PRODUCTION;
				m_LoginPage = '';
			}
		}
	}
	
	private String m_EndPoint;
	private String m_LoginPage;

    private static final String PAYMENT_END_POINT_SANDBOX = 'https://svcs.sandbox.paypal.com/AdaptivePayments/';
    private static final String PAYMENT_END_POINT_SANDBOX_BETA = 'https://svcs.beta-sandbox.paypal.com/AdaptivePayments/';
    private static final String PAYMENT_END_POINT_PRODUCTION = 'https://svcs.paypal.com/AdaptivePayments/';

    private static final String ACCOUNT_END_POINT_SANDBOX = 'https://svcs.sandbox.paypal.com/AdaptiveAccounts/';
    private static final String ACCOUNT_END_POINT_SANDBOX_BETA = 'https://svcs.beta-sandbox.paypal.com/AdaptiveAccounts/';
    private static final String ACCOUNT_END_POINT_PRODUCTION = 'https://svcs.paypal.com/AdaptiveAccounts/';
    
    
    private static final String PAYMENT_PAYPAL_LOGIN_PAGE_SANDBOX = 'https://www.sandbox.paypal.com/webscr?cmd=';
    private static final String PAYMENT_PAYPAL_LOGIN_PAGE_SANDBOX_BETA = 'https://www.beta-sandbox.paypal.com/webscr?cmd=';
    private static final String PAYMENT_PAYPAL_LOGIN_PAGE_PRODUCTION = 'https://www.paypal.com/webscr?cmd=';
}