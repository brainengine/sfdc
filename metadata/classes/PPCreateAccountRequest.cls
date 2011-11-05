global class PPCreateAccountRequest extends PPRequest {
	// (Optional) The type of account to be created. 
	global String AccountType {get; set;}

	 // !!! Once SandboxEmailAddress field is moved to request headers 
	 // SandboxEmailAddress field should moved into BaseAPIProfile class
	global String SandboxEmailAddress {get;set;}
	
	// (Required) The address to be associated with the account.
	global PPAddress Address {get; set;} 

	// (Optional) Name and contact information for the business that is 
	// requesting the account to be created.
	global PPBusinessInfo BusinessInfo {get; set;}

	// (Optional) The code of the country to be associated with the account.
	global String CitizenshipCountryCode {get; set;}

	// (Optional) Information about the business requesting the account to be created.
	global PPClientDetails ClientDetails {get; set;}

	//(Required) Phone number to be associated with the account.
	global String ContactPhoneNumber {get; set;}
	
	// (Required) The URL to which the business redirects the PayPal user to
	// complete account setup.
	global PPCreateAccountWebOptions CreateAccountWebOptions {get; set;}

	// (Optional) The code of the currency to be associated with the account.
	global String CurrencyCode {get; set;}
	
	// (Optional) The date of birth of person to be associated with the account.
	global DateTime DateOfBirth {get; set;}

	// (Optional) Email address of person to be associated with the account.
	global String EmailAddress {get; set;}

	// (Required) The name and address of the person to be associated with the
	// account.	
	global PPName NameInfo {get; set;}
	
	// (Optional) The URL to post instant payment notification (IPN) messages
	// regarding account creation. This URL supersedes the IPN notification URL
	// you may have set in your profile.
	global String NotificationURL {get; set;}
	
	// (Optional) A maximum of five fields for your own use, where n is a digit
	// between 1 and 5, inclusive.
	global String PartnerField1 {get; set;}
	global String PartnerField2 {get; set;}
	global String PartnerField3 {get; set;}
	global String PartnerField4 {get; set;}
	global String PartnerField5 {get; set;}
	
	// (Required) The code indicating the language to be associated with the account.
	global String PreferredLanguageCode { get; set; }
	
	// (Optional) Whether the PayPal user will use a mobile device or the web to
	// complete registration. This attribute determines whether a key or a URL is
	// returned for the redirect URL.
	global String RegistrationType { get; set; } 

	// Constructor
	global PPCreateAccountRequest() {
		ApiName = PPStaticRes.CREATE_ACCOUNT_API;
		AccountType = '';
		SandboxEmailAddress = '';
		Address = new PPAddress(); 
		BusinessInfo = new PPBusinessInfo();
		CitizenshipCountryCode = '';
		ClientDetails = new PPClientDetails();
		ContactPhoneNumber = '';
		CreateAccountWebOptions = new PPCreateAccountWebOptions();
		CurrencyCode = '';
		DateOfBirth = Null;
		EmailAddress = '';
		NameInfo = new PPName();
		NotificationURL = '';
		PartnerField1 = '';
		PartnerField2 = '';
		PartnerField3 = '';
		PartnerField4 = '';
		PartnerField5 = '';
		PreferredLanguageCode = '';
		RegistrationType = ''; 
	} 
	
	// Constructor
	global PPCreateAccountRequest(String CommonRequestParametersObjectName){

		PPCommonRequestParameters commonRequestParameters = new PPCommonRequestParameters(CommonRequestParametersObjectName);
        // set request envelope fields
        setRequestEnvelopeParams(commonRequestParameters.Language, commonRequestParameters.DetailLevel);
        
		ApiName = PPStaticRes.CREATE_ACCOUNT_API;
		AccountType = '';
		SandboxEmailAddress = '';
		Address = new PPAddress(); 
		BusinessInfo = new PPBusinessInfo();
		CitizenshipCountryCode = '';
		ClientDetails = new PPClientDetails();
		ContactPhoneNumber = '';
		CreateAccountWebOptions = new PPCreateAccountWebOptions();
		CurrencyCode = '';
		DateOfBirth = Null;
		EmailAddress = '';
		NameInfo = new PPName();
		NotificationURL = '';
		PartnerField1 = '';
		PartnerField2 = '';
		PartnerField3 = '';
		PartnerField4 = '';
		PartnerField5 = '';
		PreferredLanguageCode = '';
		RegistrationType = ''; 
	} 

	global override void setRequestEnvelopeParams(String language, String detailLevelCode) {
		super.setRequestEnvp(language, detailLevelCode);
	}
	
	public override void getRequestParams(Map<String, String> requestParams) {
		if (Null != requestParams) {
			super.setCommonRequestParams(requestParams);

			if (Null != AccountType && 0 != AccountType.length())		
    			requestParams.put(PPStaticRes.ACCOUNT_TYPE, AccountType);

			if (Null != SandboxEmailAddress && 0 != SandboxEmailAddress.length())		
    			requestParams.put(PPStaticRes.SANDBOX_EMAIL_ADDRESS, SandboxEmailAddress);

			Address.populateAttributes(requestParams); 
			BusinessInfo.populateAttributes(requestParams);
			
			if (Null != CitizenshipCountryCode && 0 != CitizenshipCountryCode.length())		
    			requestParams.put(PPStaticRes.CITIZENSHIP_COUNTRY_CODE, CitizenshipCountryCode);

			ClientDetails.populateAttributes(requestParams);

			if (Null != ContactPhoneNumber && 0 != ContactPhoneNumber.length())		
    			requestParams.put(PPStaticRes.CONTACT_PHONE_NUMBER, ContactPhoneNumber);

			CreateAccountWebOptions.populateAttributes(requestParams);

			if (Null != CurrencyCode && 0 != CurrencyCode.length())		
    			requestParams.put(PPStaticRes.CURRENCY_CODE, CurrencyCode);
			
			if (Null != DateOfBirth) {	
    			requestParams.put(PPStaticRes.DATE_OF_BIRTH, DateOfBirth.format('yyyy-MM-dd'));
			}
			
			if (Null != EmailAddress && 0 != EmailAddress.length())		
    			requestParams.put(PPStaticRes.EMAIL_ADDRESS, EmailAddress);

			NameInfo.populateAttributes(requestParams);

			if (Null != NotificationURL && 0 != NotificationURL.length())		
    			requestParams.put(PPStaticRes.NOTIFICATION_URL, NotificationURL);

			if (Null != PartnerField1 && 0 != PartnerField1.length())		
    			requestParams.put(PPStaticRes.PARTNER_FIELD1, PartnerField1);
			if (Null != PartnerField2 && 0 != PartnerField2.length())		
    			requestParams.put(PPStaticRes.PARTNER_FIELD2, PartnerField2);
			if (Null != PartnerField3 && 0 != PartnerField3.length())		
    			requestParams.put(PPStaticRes.PARTNER_FIELD3, PartnerField3);
			if (Null != PartnerField4 && 0 != PartnerField4.length())		
    			requestParams.put(PPStaticRes.PARTNER_FIELD4, PartnerField4);
			if (Null != PartnerField5 && 0 != PartnerField5.length())		
    			requestParams.put(PPStaticRes.PARTNER_FIELD5, PartnerField5);

			if (Null != PreferredLanguageCode && 0 != PreferredLanguageCode.length())		
    			requestParams.put(PPStaticRes.REFERRED_LANGUAGE_CODE, PreferredLanguageCode);

			if (Null != RegistrationType && 0 != RegistrationType.length())		
    			requestParams.put(PPStaticRes.REGISTRATION_TYPE, RegistrationType);
		}
	}
}