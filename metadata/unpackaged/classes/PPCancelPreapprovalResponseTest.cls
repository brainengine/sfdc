@isTest 
private class PPCancelPreapprovalResponseTest {
	static testMethod void testParseResponseParametersOne() {	
    	PPCancelPreapprovalResponse response = new PPCancelPreapprovalResponse();
    	Map<String, String> testMap = new Map<String, String>();
    	testMap.put('responseEnvelope.timestamp', '2009-07-13T12%3A34%3A29.316-07%3A00');
    	testMap.put('responseEnvelope.ack', 'success');
    	testMap.put('responseEnvelope.correlationId','d615a365bed61');
    	testMap.put('responseEnvelope.build', '1044393');
    	response.parseResponseParameters(testMap);
    	
    	// Assertion
    	System.assert(response.getResponseEnvelope().StringTimeStamp.equals('2009-07-13T12%3A34%3A29.316-07%3A00'));
    	System.assert(response.getResponseEnvelope().Ack.equals('success'));
    	System.assert(response.getResponseEnvelope().CorrelationId.equals('d615a365bed61'));
    	System.assert(response.getResponseEnvelope().build.equals('1044393'));
	}
}