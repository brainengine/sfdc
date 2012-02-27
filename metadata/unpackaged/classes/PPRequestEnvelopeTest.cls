@isTest 
private class PPRequestEnvelopeTest {
	static testMethod void populateRequestEnvelope() {
		PPRequestEnvelope reqEnvelope = new PPRequestEnvelope();
        reqEnvelope.errorLanguage = 'en_US';
        reqEnvelope.detailLevelCode = 'ReturnAll';
	}
}