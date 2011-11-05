@isTest
private class PPCreateAccountRequestTest {
	static testMethod void CreateAccountRequestTest() {
        PPCreateAccountRequest request = new PPCreateAccountRequest();
        
        request.setRequestEnvelopeParams('en_US', '');
 		request.AccountType = 'Personal';
 		request.SandboxEmailAddress = 'sonali_gupta@persistent.co.in';
		PPAddress address = new PPAddress();
		address.Line1 = 'IT Park'; 
		address.Line2 = 'Parsodi'; 
		address.City = 'Nagpur'; 
		address.State = 'Maharashtra'; 
		address.PostalCode = '440022'; 
		address.CountryCode = '+91';
		request.Address = address; 
    	PPBusinessInfo businessInfo = new PPBusinessInfo();
    	businessInfo.BusinessAddress = 'My business address'; 
		businessInfo.BusinessName = 'My business name'; 
		businessInfo.Category = 21; 
		businessInfo.SubCategory = 31; 
		businessInfo.Workphone = '+919975205275';    
		request.BusinessInfo = businessInfo;
		request.CitizenshipCountryCode = 'US';
        PPClientDetails clientDetails = new PPClientDetails();
        clientDetails.applicationId = 'myapp';
        clientDetails.ipAddress = '172.16.4.89';
        request.ClientDetails = clientDetails;
		request.ContactPhoneNumber = '+919975205275';
    	PPCreateAccountWebOptions createAccountWebOptions = new PPCreateAccountWebOptions();
    	createAccountWebOptions.ReturnURL = 'http://www.google.co.in/ig?hl=en'; 
		request.CreateAccountWebOptions = createAccountWebOptions;
		request.CurrencyCode = 'USD';
		request.DateOfBirth = DateTime.newInstance(1986, 08, 19);
		request.EmailAddress = 'test@paypal.com';
    	PPName name = new PPName();
    	name.Salutation = 'Mr.'; 
		name.FirstName = 'James'; 
		name.MiddleName = 'k'; 
		name.LastName = 'Bond'; 
		name.Suffix = '007'; 
		request.NameInfo = name;
		request.NotificationURL = 'https://c.ap1.visual.force.com/apex/ReturnURL';
		request.PartnerField1 = 'Pesistent';
		request.PartnerField2 = 'force.com';
		request.PartnerField3 = 'IBM';
		request.PartnerField4 = 'Google';
		request.PartnerField5 = 'Microsoft';
		request.PreferredLanguageCode = 'US';
		request.RegistrationType = 'Web'; 

     	Map<String, String> attributeMap = new Map<String, String>();
		request.getRequestParams(attributeMap);
		
		System.assert(attributeMap.get(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.ERROR_LANGUAGE).equals('en_US'));
		System.assert(attributeMap.get(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.DETAIL_LEVEL_CODE).equals('ReturnAll'));

		System.assert(attributeMap.get(PPStaticRes.ACCOUNT_TYPE).equals('Personal'));

	    String tag = PPStaticRes.ADDRESS + PPStaticRes.DOT;
		System.assert(attributeMap.containsKey(tag + PPStaticRes.ADDRESS_LINE_ONE));    
        System.assert(attributeMap.get(tag + PPStaticRes.ADDRESS_LINE_ONE) == 'IT Park');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.ADDRESS_LINE_TWO));    
        System.assert(attributeMap.get(tag + PPStaticRes.ADDRESS_LINE_TWO) == 'Parsodi');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.ADDRESS_LINE_CITY));    
        System.assert(attributeMap.get(tag + PPStaticRes.ADDRESS_LINE_CITY) == 'Nagpur');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.ADDRESS_LINE_STATE));    
        System.assert(attributeMap.get(tag + PPStaticRes.ADDRESS_LINE_STATE) == 'Maharashtra');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.ADDRESS_LINE_POSTAL_CODE));    
        System.assert(attributeMap.get(tag + PPStaticRes.ADDRESS_LINE_POSTAL_CODE) == '440022');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.ADDRESS_COUNTRY_CODE));    
        System.assert(attributeMap.get(tag + PPStaticRes.ADDRESS_COUNTRY_CODE) == '+91');

	    tag = PPStaticRes.BUSINESS + PPStaticRes.DOT;
		System.assert(attributeMap.containsKey(tag + PPStaticRes.BUSINESS_ADDRESS));    
        System.assert(attributeMap.get(tag + PPStaticRes.BUSINESS_ADDRESS) == 'My business address');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.BUSINESS_NAME));    
        System.assert(attributeMap.get(tag + PPStaticRes.BUSINESS_NAME) == 'My business name');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.BUSINESS_CATEGORY));    
        System.assert(attributeMap.get(tag + PPStaticRes.BUSINESS_CATEGORY) == '21');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.BUSINESS_SUBCATEGORY));    
        System.assert(attributeMap.get(tag + PPStaticRes.BUSINESS_SUBCATEGORY) == '31');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.WORK_PHONE));    
        System.assert(attributeMap.get(tag + PPStaticRes.WORK_PHONE) == '+919975205275');

		System.assert(attributeMap.get(PPStaticRes.CITIZENSHIP_COUNTRY_CODE).equals('US'));

		System.assert(attributeMap.get(PPStaticRes.CLIENT_DETAILS + PPStaticRes.DOT + PPStaticRes.IP_ADDRESS).equals('172.16.4.89'));
		System.assert(attributeMap.get(PPStaticRes.CLIENT_DETAILS + PPStaticRes.DOT + PPStaticRes.APPLICATION_ID).equals('myapp'));

        tag = PPStaticRes.CLIENT_DETAILS + PPStaticRes.DOT;
        System.assert(attributeMap.get(tag + PPStaticRes.APPLICATION_ID).equals('myapp'));
        System.assert(attributeMap.get(tag + PPStaticRes.IP_ADDRESS).equals('172.16.4.89'));

		System.assert(attributeMap.get(PPStaticRes.CONTACT_PHONE_NUMBER).equals('+919975205275'));

	    tag = PPStaticRes.CREATE_ACCOUNTS_WEB_OPTIONS + PPStaticRes.DOT;
		System.assert(attributeMap.containsKey(tag + PPStaticRes.CREATE_ACCOUNTS_WEB_OPTIONS_RETURN_URL));    
        System.assert(attributeMap.get(tag + PPStaticRes.CREATE_ACCOUNTS_WEB_OPTIONS_RETURN_URL) == 'http://www.google.co.in/ig?hl=en');

		System.assert(attributeMap.get(PPStaticRes.CURRENCY_CODE).equals('USD'));
		System.assert(attributeMap.get(PPStaticRes.DATE_OF_BIRTH).equals('1986-08-19'));
		System.assert(attributeMap.get(PPStaticRes.EMAIL_ADDRESS).equals('test@paypal.com'));

	    tag = PPStaticRes.NAME + PPStaticRes.DOT;
		System.assert(attributeMap.containsKey(tag + PPStaticRes.SALUTATION));    
        System.assert(attributeMap.get(tag + PPStaticRes.SALUTATION) == 'Mr.');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.FIRST_NAME));    
        System.assert(attributeMap.get(tag + PPStaticRes.FIRST_NAME) == 'James');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.MIDDLE_NAME));    
        System.assert(attributeMap.get(tag + PPStaticRes.MIDDLE_NAME) == 'k');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.LAST_NAME));    
        System.assert(attributeMap.get(tag + PPStaticRes.LAST_NAME) == 'Bond');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.SUFFIX));    
        System.assert(attributeMap.get(tag + PPStaticRes.SUFFIX) == '007');

		System.assert(attributeMap.get(PPStaticRes.NOTIFICATION_URL).equals('https://c.ap1.visual.force.com/apex/ReturnURL'));
		System.assert(attributeMap.get(PPStaticRes.PARTNER_FIELD1).equals('Pesistent'));
		System.assert(attributeMap.get(PPStaticRes.PARTNER_FIELD2).equals('force.com'));
		System.assert(attributeMap.get(PPStaticRes.PARTNER_FIELD3).equals('IBM'));
		System.assert(attributeMap.get(PPStaticRes.PARTNER_FIELD4).equals('Google'));
		System.assert(attributeMap.get(PPStaticRes.PARTNER_FIELD5).equals('Microsoft'));
		System.assert(attributeMap.get(PPStaticRes.REFERRED_LANGUAGE_CODE).equals('US'));
		System.assert(attributeMap.get(PPStaticRes.REGISTRATION_TYPE).equals('Web'));
	}
}