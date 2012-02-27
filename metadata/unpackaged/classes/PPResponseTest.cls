@isTest 
private class PPResponseTest {
	static testMethod void testParseResponseParameters() {
		PPResponse response = new PPPayResponse();
    	Map<String, String> testMap = new Map<String, String>();
    	testMap.put('responseEnvelope.timestamp', '2009-07-13T12%3A34%3A29.316-07%3A00');
    	testMap.put('responseEnvelope.ack', 'failure');
    	testMap.put('responseEnvelope.correlationId','d615a365bed61');
    	testMap.put('responseEnvelope.build', 'DEV');
    	
    	response.parseResponseParameters(testMap);
    	
    	// Assertion
    	System.assert(response.ResponseEnvelope.Ack == 'failure');
    	System.assert(response.ResponseEnvelope.CorrelationId == 'd615a365bed61');
    	System.assert(response.ResponseEnvelope.Build == 'DEV');
    	System.assert(response.ResponseEnvelope.StringTimestamp == '2009-07-13T12%3A34%3A29.316-07%3A00');
	}
}