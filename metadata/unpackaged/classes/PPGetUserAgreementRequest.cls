global class PPGetUserAgreementRequest extends PPRequest {
	// (Optional) The code for the country in which the user account is 
	// located. You do not need to provide this country code if you are 
	// passing the createAccount key.
	global String CountryCode {get; set;}
	
	// (Optional) The key returned for this account in the CreateAccountResponse
	// message in the createAccountKey field. If you specify this key, do not 
	// pass a country code or language code. Doing so will result in an error.
	global String CreateAccountKey {get; set;}

	// (Optional) The code indicating the language to be used for the agreement.
	global String LanguageCode  {get; set;}

	// Constructor
	global PPGetUserAgreementRequest(){
		ApiName = PPStaticRes.GET_USER_AGREEMENT_API;
		CountryCode = '';
		CreateAccountKey = '';
		LanguageCode = '';
	}

	global override void setRequestEnvelopeParams(String language, String detailLevelCode) {
		super.setRequestEnvp(language, detailLevelCode);
	}
	
	public override void getRequestParams(Map<String, String> requestParams) {
		if (Null != requestParams) {
			super.setCommonRequestParams(requestParams);
			
			if (Null != CountryCode && 0 != CountryCode.length())		
    			requestParams.put(PPStaticRes.COUNTRY_CODE, CountryCode);

			if (Null != CreateAccountKey && 0 != CreateAccountKey.length())		
    			requestParams.put(PPStaticRes.CREATE_ACCOUNT_KEY, CreateAccountKey);

			if (Null != LanguageCode && 0 != LanguageCode.length())		
    			requestParams.put(PPStaticRes.LANGUAGE_CODE, LanguageCode);
		}
	}
}