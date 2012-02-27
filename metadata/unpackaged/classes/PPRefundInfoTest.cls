@isTest 
private class PPRefundInfoTest {
	static testMethod void testparseAttributes() {
		PPRefundInfo rInfo = new PPRefundInfo();
		Map<String, String> testMap = new Map<String, String>();
		testMap.put('refundInfoList.refundInfo(0).receiver.amount', '11');
    	testMap.put('refundInfoList.refundInfo(0).receiver.email', 'sonali@persistent.co.in');
    	testMap.put('refundInfoList.refundInfo(0).receiver.primary', 'false');
    	testMap.put('refundInfoList.refundInfo(0).receiver.invoiceId', '545fe');
    	testMap.put('refundInfoList.refundInfo(0).refundStatus', 'Completed');
    	testMap.put('refundInfoList.refundInfo(0).refundNetAmount', '12.00');
    	testMap.put('refundInfoList.refundInfo(0).refundFeeAmount', '13.00');
    	testMap.put('refundInfoList.refundInfo(0).refundGrossAmount', '14.00');
    	testMap.put('refundInfoList.refundInfo(0).totalOfAllRefunds', '15.00');
    	testMap.put('refundInfoList.refundInfo(0).encryptedRefundTransactionId', '3454554');
    	testMap.put('refundInfoList.refundInfo(0).refundTransactionStatus', 'done');
    	testMap.put('refundInfoList.refundInfo(0).refundHasBecomeFull', 'true');
    	rInfo.parseAttributes(testMap, 'refundInfoList.refundInfo(0).');
    	
    	// Assertion
    	System.assert(rInfo.Receiver.Amount == 11);
    	System.assert(rInfo.Receiver.Email.equals('sonali@persistent.co.in'));
    	System.assert(rInfo.Receiver.Primary == false);
    	System.assert(rInfo.Receiver.InvoiceID.equals('545fe'));
    	System.assert(rInfo.RefundStatus.equals('Completed'));
    	System.assert(rInfo.RefundNetAmount == 12);
    	System.assert(rInfo.RefundFeeAmount == 13);
    	System.assert(rInfo.RefundGrossAmount == 14);
    	System.assert(rInfo.TotalOfAllRefunds == 15);
    	System.assert(rInfo.EncryptedRefundTransactionId.equals('3454554'));
    	System.assert(rInfo.RefundTransactionStatus.equals('done'));
    	System.assert(rInfo.RefundHasBecomeFull == true);
	}
	
	static testMethod void testparseAttributesOne() {
		PPRefundInfo rInfo = new PPRefundInfo();
		Map<String, String> testMap = new Map<String, String>();
		testMap.put('refundInfoList.refundInfo(0).receiver.amount', '11');
    	testMap.put('refundInfoList.refundInfo(0).receiver.email', 'sonali@persistent.co.in');
    	testMap.put('refundInfoList.refundInfo(0).receiver.primary', 'false');
    	testMap.put('refundInfoList.refundInfo(0).receiver.invoiceId', '545fe');
    	testMap.put('refundInfoList.refundInfo(0).refundStatus', 'Completed');
    	testMap.put('refundInfoList.refundInfo(0).refundNetAmount', '12.00');
    	testMap.put('refundInfoList.refundInfo(0).refundFeeAmount', '13.00');
    	testMap.put('refundInfoList.refundInfo(0).refundGrossAmount', '14.00');
    	testMap.put('refundInfoList.refundInfo(0).totalOfAllRefunds', '15.00');
    	testMap.put('refundInfoList.refundInfo(0).encryptedRefundTransactionId', '3454554');
    	testMap.put('refundInfoList.refundInfo(0).refundTransactionStatus', 'done');
    	testMap.put('refundInfoList.refundInfo(0).refundHasBecomeFull', 'false');
    	rInfo.parseAttributes(testMap, 'refundInfoList.refundInfo(0).');
    	
    	// Assertion
    	System.assert(rInfo.Receiver.Amount == 11);
    	System.assert(rInfo.Receiver.Email.equals('sonali@persistent.co.in'));
    	System.assert(rInfo.Receiver.Primary == false);
    	System.assert(rInfo.Receiver.InvoiceID.equals('545fe'));
    	System.assert(rInfo.RefundStatus.equals('Completed'));
    	System.assert(rInfo.RefundNetAmount == 12);
    	System.assert(rInfo.RefundFeeAmount == 13);
    	System.assert(rInfo.RefundGrossAmount == 14);
    	System.assert(rInfo.TotalOfAllRefunds == 15);
    	System.assert(rInfo.EncryptedRefundTransactionId.equals('3454554'));
    	System.assert(rInfo.RefundTransactionStatus.equals('done'));
    	System.assert(rInfo.RefundHasBecomeFull == false);
	}
}