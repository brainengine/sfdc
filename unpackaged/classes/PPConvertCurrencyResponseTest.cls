@isTest 
private class PPConvertCurrencyResponseTest {
	static testMethod void testParseResponseParameters() {
		Map<String, String> testMap = new Map<String, String>();
		testMap.put('responseEnvelope.timestamp', '2009-07-13T12%3A34%3A29.316-07%3A00');
    	testMap.put('responseEnvelope.ack', 'success');
    	testMap.put('responseEnvelope.correlationId','d615a365bed61');
    	testMap.put('responseEnvelope.build', 'DEV');
    	testMap.put('estimatedAmountTable.currencyConversionList(0).baseAmount.code', 'USD');
		testMap.put('estimatedAmountTable.currencyConversionList(0).baseAmount.amount', '100');
		testMap.put('estimatedAmountTable.currencyConversionList(0).currencyList.currency(0).code', 'EUR');
		testMap.put('estimatedAmountTable.currencyConversionList(0).currencyList.currency(0).amount', '76.26');
		testMap.put('estimatedAmountTable.currencyConversionList(0).currencyList.currency(1).code', 'GBP');
		testMap.put('estimatedAmountTable.currencyConversionList(0).currencyList.currency(1).amount', '52.72');
		PPConvertCurrencyResponse response = new PPConvertCurrencyResponse();
		response.parseResponseParameters(testMap);
		
		// Assertion
		PPResponseEnvelope responseEnvelope = response.getResponseEnvelope();
		System.assert(responseEnvelope.Ack == 'success');
		System.assert(responseEnvelope.CorrelationId == 'd615a365bed61');
		System.assert(responseEnvelope.Build == 'DEV');
		System.assert(responseEnvelope.StringTimestamp == '2009-07-13T12%3A34%3A29.316-07%3A00');
		System.assert(response.EstimatedAmountTable[0].BaseAmount.code == 'USD');
		System.assert(response.EstimatedAmountTable[0].BaseAmount.amount == 100);		
		System.assert(response.EstimatedAmountTable[0].CurrencyList[0].code == 'EUR');
		System.assert(response.EstimatedAmountTable[0].CurrencyList[1].code == 'GBP');
		System.assert(response.EstimatedAmountTable[0].CurrencyList[0].amount == 76.26);
		System.assert(response.EstimatedAmountTable[0].CurrencyList[1].amount == 52.72);
	}
}