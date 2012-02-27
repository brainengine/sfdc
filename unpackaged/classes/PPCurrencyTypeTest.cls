@isTest 
private class PPCurrencyTypeTest {
	static testMethod void testpopulateAttributes() {
		PPCurrencyType currencyType = new PPCurrencyType();
		currencyType.Amount = 100;
		currencyType.Code = 'USD';
		
		Map<String, String> testMap = new Map<String, String>();
		currencyType.populateAttributes(testMap, 'Currency.');
		
		// Assertion
		System.assert(testMap.get('Currency.amount') == '100');
		System.assert(testMap.get('Currency.code') == 'USD');
	}
	
	static testMethod void testparseAttributes() {
		Map<String, String> testMap = new Map<String, String>();
		testMap.put('Currency.amount', '100');
		testMap.put('Currency.code', 'USD');
		PPCurrencyType currencyType = new PPCurrencyType();
		currencyType.parseAttributes(testMap, 'Currency.');
		
		// Assertion
		System.assert(currencyType.Amount == 100);
		System.assert(currencyType.Code == 'USD');
	}
}