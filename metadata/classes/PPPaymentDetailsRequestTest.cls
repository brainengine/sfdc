@isTest 
private class PPPaymentDetailsRequestTest {
	static testMethod void testGetRequestParamsOne() {
		PPPaymentDetailsRequest paymentDetailsRequest = new PPPaymentDetailsRequest();
		paymentDetailsRequest.PayKey = 'AP12345';
		paymentDetailsRequest.TrackingId = 'TR12345';
		paymentDetailsRequest.TransactionId = 'T12345';
		paymentDetailsRequest.setRequestEnvelopeParams('language', 'detailLevelCode');
		Map<String, String> params = new Map<String, String>();
		paymentDetailsRequest.getRequestParams(params);
		
		// Assertion
		System.assert(params.get(PPStaticRes.PAY_KEY).equals('AP12345'));
		System.assert(params.get(PPStaticRes.TRACKING_ID).equals('TR12345'));
		System.assert(params.get(PPStaticRes.TRANSACTION_ID).equals('T12345'));
		System.assert(params.get(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.ERROR_LANGUAGE).equals('language'));
		System.assert(params.get(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.DETAIL_LEVEL_CODE).equals('detailLevelCode'));
	}	
	
	static testMethod void testGetRequestParamsTwo() {
		PPPaymentDetailsRequest paymentDetailsRequest = new PPPaymentDetailsRequest();
		paymentDetailsRequest.PayKey = 'AP12345';
		paymentDetailsRequest.TrackingId = 'TR12345';
		paymentDetailsRequest.TransactionId = 'T12345';
		paymentDetailsRequest.setRequestEnvelopeParams('language', '');
		
		Map<String, String> params = new Map<String, String>();
		paymentDetailsRequest.getRequestParams(params);
		
		// Assertion
		System.assert(params.get(PPStaticRes.PAY_KEY).equals('AP12345'));
		System.assert(params.get(PPStaticRes.TRACKING_ID).equals('TR12345'));
		System.assert(params.get(PPStaticRes.TRANSACTION_ID).equals('T12345'));
		System.assert(params.get(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.ERROR_LANGUAGE).equals('language'));
		System.assert(params.get(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.DETAIL_LEVEL_CODE).equals('ReturnAll'));
	}	
}