@isTest 
private class PPPreapprovalDetailsRequestTest {
	static testMethod void testGetRequestParams() {
		PPPreapprovalDetailsRequest request = new PPPreapprovalDetailsRequest();
		request.PreapprovalKey = 'AP12345';
		request.setRequestEnvelopeParams('en_US', 'ReturnAll');
		Map<String, String> params = new Map<String, String>();
		request.getRequestParams(params);
		
		// Assertion
		System.assert(params.get(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.ERROR_LANGUAGE).equals('en_US'));
		System.assert(params.get(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.DETAIL_LEVEL_CODE).equals('ReturnAll'));
		System.assert(params.get(PPStaticRes.PREAPPROVAL_KEY).equals('AP12345'));
	}
}