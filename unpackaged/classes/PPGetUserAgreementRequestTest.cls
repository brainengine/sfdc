@isTest
private class PPGetUserAgreementRequestTest {
	static testMethod void GetUserAgreementRequestTest() {
		PPGetUserAgreementRequest request = new PPGetUserAgreementRequest();
        
        request.setRequestEnvelopeParams('en_US', '');
        request.CountryCode = 'IND';
		request.CreateAccountKey = 'AA-6H279897NK391145S';
		request.LanguageCode = 'ENG';
        
     	Map<String, String> attributeMap = new Map<String, String>();
		request.getRequestParams(attributeMap);
		
		System.assert(attributeMap.get(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.ERROR_LANGUAGE).equals('en_US'));
		System.assert(attributeMap.get(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.DETAIL_LEVEL_CODE).equals('ReturnAll'));

		System.assert(attributeMap.get(PPStaticRes.COUNTRY_CODE).equals('IND'));
		System.assert(attributeMap.get(PPStaticRes.CREATE_ACCOUNT_KEY).equals('AA-6H279897NK391145S'));
		System.assert(attributeMap.get(PPStaticRes.LANGUAGE_CODE).equals('ENG'));
	
	}
}