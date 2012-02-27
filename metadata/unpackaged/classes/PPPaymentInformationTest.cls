@isTest 
private class PPPaymentInformationTest {
	static testMethod void testparseAttributesOne() {
		PPPaymentInformation pInformation = new PPPaymentInformation();
		Map<String, String> testMap = new Map<String, String>();
		testMap.put('paymentInfoList.paymentInfo(0).pendingRefund', 'false');
    	testMap.put('paymentInfoList.paymentInfo(0).receiver.amount', '10');
    	testMap.put('paymentInfoList.paymentInfo(0).receiver.primary', 'false');
    	testMap.put('paymentInfoList.paymentInfo(0).receiver.email', 'manish_1250055563_biz@persistent.co.in');
    	testMap.put('paymentInfoList.paymentInfo(0).transactionId', '32323233');
    	testMap.put('paymentInfoList.paymentInfo(0).transactionStatus', 'done');
    	testMap.put('paymentInfoList.paymentInfo(0).refundedAmount', '3232323');
    	testMap.put('paymentInfoList.paymentInfo(0).senderTransactionId', 'td123');
    	testMap.put('paymentInfoList.paymentInfo(0).senderTransactionStatus', 'DONE');
    	pInformation.parseAttributes(testMap, 'paymentInfoList.paymentInfo(0).');
    	
    	// Assertion
    	System.assert(pInformation.PendingRefund == false);
    	System.assert(pInformation.Receiver.Amount == 10);
    	System.assert(pInformation.Receiver.Email.equals('manish_1250055563_biz@persistent.co.in'));
    	System.assert(pInformation.Receiver.Primary == false);
    	System.assert(pInformation.TransactionId.equals('32323233'));
    	System.assert(pInformation.TransactionStatus.equals('done'));
    	System.assert(pInformation.RefundedAmount == 3232323);
    	System.assert(pInformation.SenderTransactionID == 'td123');
    	System.assert(pInformation.SenderTransactionStatus == 'DONE');
	}
	
	static testMethod void testparseAttributesOneTwo() {
		PPPaymentInformation pInformation = new PPPaymentInformation();
		Map<String, String> testMap = new Map<String, String>();
		testMap.put('paymentInfoList.paymentInfo(0).pendingRefund', 'true');
    	testMap.put('paymentInfoList.paymentInfo(0).receiver.amount', '10');
    	testMap.put('paymentInfoList.paymentInfo(0).receiver.primary', 'false');
    	testMap.put('paymentInfoList.paymentInfo(0).receiver.email', 'manish_1250055563_biz@persistent.co.in');
    	testMap.put('paymentInfoList.paymentInfo(0).transactionId', '32323233');
    	testMap.put('paymentInfoList.paymentInfo(0).transactionStatus', 'done');
    	testMap.put('paymentInfoList.paymentInfo(0).refundedAmount', '3434');
    	pInformation.parseAttributes(testMap, 'paymentInfoList.paymentInfo(0).');
    	
    	// Assertion
    	System.assert(pInformation.PendingRefund == true);
    	System.assert(pInformation.Receiver.Amount == 10);
    	System.assert(pInformation.Receiver.Email.equals('manish_1250055563_biz@persistent.co.in'));
    	System.assert(pInformation.Receiver.Primary == false);
    	System.assert(pInformation.TransactionId.equals('32323233'));
    	System.assert(pInformation.TransactionStatus.equals('done'));
    	System.assert(pInformation.RefundedAmount == 3434);
	}
}