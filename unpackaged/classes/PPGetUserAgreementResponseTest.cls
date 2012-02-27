@isTest
private class PPGetUserAgreementResponseTest {
	static testMethod void GetUserAgreementResponseTest() {	
    	PPGetUserAgreementResponse response = new PPGetUserAgreementResponse();
    	Map<String, String> testMap = new Map<String, String>();
    	testMap.put('responseEnvelope.timestamp', '2009-07-13T12%3A34%3A29.316-07%3A00');
    	testMap.put('responseEnvelope.ack', 'success');
    	testMap.put('responseEnvelope.correlationId','d615a365bed61');
    	testMap.put('responseEnvelope.build', '1044393');
    	testMap.put(PPStaticRes.AGREEMENT, 'This is PayPal copy of EULA');


    	response.parseResponseParameters(testMap);
    	System.assert(response.getResponseEnvelope().StringTimeStamp.equals('2009-07-13T12%3A34%3A29.316-07%3A00'));
    	System.assert(response.getResponseEnvelope().Ack.equals('success'));
    	System.assert(response.getResponseEnvelope().CorrelationId.equals('d615a365bed61'));
    	System.assert(response.getResponseEnvelope().build.equals('1044393'));
    	System.assert(response.Agreement == 'This is PayPal copy of EULA');
	}
}