@isTest 
private class PPPreapprovalResponseTest {
	static testMethod void testParseResponseParameters() {	
    	PPPreapprovalResponse response = new PPPreapprovalResponse();
    	Map<String, String> testMap = new Map<String, String>();
    	testMap.put('responseEnvelope.timestamp', '2009-07-13T12%3A34%3A29.316-07%3A00');
    	testMap.put('responseEnvelope.ack', 'success');
    	testMap.put('responseEnvelope.correlationId','d615a365bed61');
    	testMap.put('responseEnvelope.build', 'DEV');
    	testMap.put('preapprovalKey', 'PK-3TY011106S4428730');
    	response.parseResponseParameters(testMap);
    	
    	// Assertion
    	System.assert(response.getResponseEnvelope().StringTimeStamp.equals('2009-07-13T12%3A34%3A29.316-07%3A00'));
    	System.assert(response.getResponseEnvelope().Ack.equals('success'));
    	System.assert(response.getResponseEnvelope().CorrelationId.equals('d615a365bed61'));
    	System.assert(response.getResponseEnvelope().build.equals('DEV'));
    	System.assert(response.PreapprovalKey.equals('PK-3TY011106S4428730'));
	}
}