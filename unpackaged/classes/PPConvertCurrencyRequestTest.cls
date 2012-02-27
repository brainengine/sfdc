@isTest 
private class PPConvertCurrencyRequestTest {
	static testMethod void testGetRequestParams() {
		PPConvertCurrencyRequest request = new PPConvertCurrencyRequest();
		List<PPCurrencyType> BaseAmountList = new List<PPCurrencyType>();
		PPCurrencyType CurrencyType = new PPCurrencyType();
		CurrencyType.Amount = 100;
		CurrencyType.Code = 'USD';
		BaseAmountList.add(CurrencyType);
		
		request.BaseAmountList = BaseAmountList;
		
		List<String> ConvertToCurrencyList = new List<String>();
		ConvertToCurrencyList.add('USD');
		ConvertToCurrencyList.add('EUR');
		request.ConvertToCurrencyList = ConvertToCurrencyList;
		request.setRequestEnvelopeParams('en_US', 'ReturnAll');
		Map<String, String> requestParams = new Map<String, String>();
		request.getRequestParams(requestParams);
		
		//Assertion
		System.assert(Decimal.valueOf(requestParams.get('baseAmountList.currency(0).amount')) == 100);
		System.assert(requestParams.get('baseAmountList.currency(0).code') == 'USD');
		System.assert(requestParams.get('convertToCurrencyList.currencyCode(0)') == 'USD');
		System.assert(requestParams.get('convertToCurrencyList.currencyCode(1)') == 'EUR');
		System.assert(requestParams.get(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.ERROR_LANGUAGE).equals('en_US'));
		System.assert(requestParams.get(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.DETAIL_LEVEL_CODE).equals('ReturnAll'));
	}
}