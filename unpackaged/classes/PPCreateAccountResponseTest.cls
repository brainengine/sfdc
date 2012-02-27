@isTest
private class PPCreateAccountResponseTest {
	static testMethod void testParseResponseParameters() {	
		Map<String, String> responseMap = new Map<String, String>();
		responseMap.put(PPStaticRes.CREATE_ACCOUNT_KEY , 'AP-3TY011106S4428730');
		responseMap.put(PPStaticRes.EXCEC_STATUS , 'CREATED');
		responseMap.put(PPStaticRes.REDIRECT_URL , 'https://svcs.sandbox.paypal.com/AdaptivePayments/CreateAccount');

    	responseMap.put('responseEnvelope.timestamp', '2009-07-13T12%3A34%3A29.316-07%3A00');
    	responseMap.put('responseEnvelope.ack', 'success');
    	responseMap.put('responseEnvelope.correlationId','d615a365bed61');
    	responseMap.put('responseEnvelope.build', 'DEV');
		
		PPCreateAccountResponse response = new PPCreateAccountResponse();
		response.parseResponseParameters(responseMap);
	
		// Assertion
	    System.assert(response.getResponseEnvelope().StringTimeStamp.equals('2009-07-13T12%3A34%3A29.316-07%3A00'));
    	System.assert(response.getResponseEnvelope().Ack.equals('success'));
    	System.assert(response.getResponseEnvelope().CorrelationId.equals('d615a365bed61'));
    	System.assert(response.getResponseEnvelope().build.equals('DEV'));
    	System.assert(response.CreateAccountKey.equals('AP-3TY011106S4428730'));
    	System.assert(response.ExecStatus.equals('CREATED'));
    	System.assert(response.RedirectURL.equals('https://svcs.sandbox.paypal.com/AdaptivePayments/CreateAccount'));
	}
}