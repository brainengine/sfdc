@isTest 
private class PPCurrencyConversionTest {
	static testMethod void testParseCurrencyConversionParams() {
		Map<String, String> testMap = new Map<String, String>();
		testMap.put('estimatedAmountTable.currencyConversionList(0).baseAmount.code', 'USD');
		testMap.put('estimatedAmountTable.currencyConversionList(0).baseAmount.amount', '100');
		testMap.put('estimatedAmountTable.currencyConversionList(0).currencyList.currency(0).code', 'EUR');
		testMap.put('estimatedAmountTable.currencyConversionList(0).currencyList.currency(0).amount', '76.26');
		testMap.put('estimatedAmountTable.currencyConversionList(0).currencyList.currency(1).code', 'GBP');
		testMap.put('estimatedAmountTable.currencyConversionList(0).currencyList.currency(1).amount', '52.72');
		
		PPCurrencyConversion currencyConversion = new PPCurrencyConversion();
		currencyConversion.parseAttributes(testMap, 'estimatedAmountTable.currencyConversionList(0).');
		
		// Assertion
		System.assert(currencyConversion.BaseAmount.code == 'USD');
		System.assert(currencyConversion.BaseAmount.amount == 100);		
		System.assert(currencyConversion.CurrencyList[0].code == 'EUR');
		System.assert(currencyConversion.CurrencyList[1].code == 'GBP');
		System.assert(currencyConversion.CurrencyList[0].amount == 76.26);
		System.assert(currencyConversion.CurrencyList[1].amount == 52.72);
	}
}