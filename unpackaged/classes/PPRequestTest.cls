@isTest 
private class PPRequestTest {
	static testMethod void requestEnvelopeTest() {
		PPRequest req = new PPPayRequest();
		req.ApiName = 'pay';
		req.setRequestEnvelopeParams('language', '');
		
		System.assert(req.RequestEnvelope.DetailLevelCode == 'returnAll');
		System.assert(req.RequestEnvelope.ErrorLanguage == 'language');
		System.assert(req.ApiName == 'pay');
	}

	static testMethod void apiNameTest() {
		PPRequest req = new PPPayRequest();
		req.setRequestEnvelopeParams('language', 'returnAll');
		
		System.assert(req.RequestEnvelope.DetailLevelCode == 'returnAll');
		System.assert(req.RequestEnvelope.ErrorLanguage == 'language');
		System.assert(req.ApiName == 'pay');
	}
}