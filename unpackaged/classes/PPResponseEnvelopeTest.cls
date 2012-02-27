@isTest 
private class PPResponseEnvelopeTest {
    static testMethod void testParseAttributes() {
        PPResponseEnvelope responseEnvelope = new PPResponseEnvelope();
        Map<String, String> testMap = new Map<String, String>();
    	testMap.put('responseEnvelope.timestamp', '2009-07-13T12%3A34%3A29.316-07%3A00');
    	testMap.put('responseEnvelope.ack', 'failure');
    	testMap.put('responseEnvelope.correlationId','d615a365bed61');
    	testMap.put('responseEnvelope.build', 'DEV');
    	
    	responseEnvelope.parseAttributes(testMap, 'responseEnvelope.');
    	
    	// Assertion
    	System.assert(responseEnvelope.StringTimestamp == '2009-07-13T12%3A34%3A29.316-07%3A00');
    	System.assert(responseEnvelope.Ack == 'failure');
    	System.assert(responseEnvelope.CorrelationId == 'd615a365bed61');
    	System.assert(responseEnvelope.Build == 'DEV');
    }

}