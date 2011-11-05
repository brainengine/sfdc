@isTest 
private class PPRefundRequestTest {
	static testMethod void testGetRequestParams() {
		PPRefundRequest request = new PPRefundRequest();
		request.PayKey = 'AP-34466';
		request.setRequestEnvelopeParams('language', 'detailLevelCode');
		PPReceiver rec = new PPReceiver();
		List<PPReceiver> recList = new List<PPReceiver>();
		rec.Email = 'sonali@persistent.co.in';
		rec.Amount = 34;
		rec.Primary = false;
		rec.InvoiceId = '5454';
		recList.add(rec); 
		request.ReceiverList = recList;
		request.TrackingId = '4343434';
		request.TransactionId = '4554343434';
		request.CurrencyCode = 'USD';
		Map<String, String> params = new Map<String, String>();
		request.getRequestParams(params);
		
		System.assert(params.get(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.ERROR_LANGUAGE).equals('language'));
		System.assert(params.get(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.DETAIL_LEVEL_CODE).equals('detailLevelCode'));
		System.assert(params.get(PPStaticRes.PAY_KEY).equals('AP-34466'));
		System.assert(params.get(PPStaticRes.TRACKING_ID).equals('4343434'));
		System.assert(params.get(PPStaticRes.TRANSACTION_ID).equals('4554343434'));
		System.assert(params.get(PPStaticRes.CURRENCY_CODE).equals('USD'));
		String tag = PPStaticRes.RECEIVER_LIST + PPStaticRes.DOT + PPStaticRes.RECEIVER + PPStaticRes.OPENING_BRACKET + '0' + PPStaticRes.CLOSING_BRACKET + PPStaticRes.DOT;
		System.assert(params.get(tag + PPStaticRes.AMOUNT).equals('34'));
		System.assert(params.get(tag + PPStaticRes.PRIMARY).equals('false'));
		System.assert(params.get(tag + PPStaticRes.INVOICE_ID).equals('5454'));
		System.assert(params.get(tag + PPStaticRes.EMAIL).equals('sonali@persistent.co.in'));
	}
}