@isTest 
private class PPUtilsTest {
	static testMethod void testGetMapWithSpecificKeys() {
		Map<String, String> testMap = new Map<String, String>();
		testMap.put('refundInfoList.refundInfo(0).receiver.amount', '11');
    	testMap.put('refundInfoList.refundInfo(0).receiver.email', 'sonali@persistent.co.in');
    	testMap.put('refundInfoList.refundInfo(0).receiver.primary', 'false');
    	testMap.put('refundInfoList.refundInfo(0).receiver.invoiceId', '545fe');
    	testMap.put('refundInfoList.refundInfo(0).refundStatus', 'Completed');
    	testMap.put('refundInfoList.refundInfo(0).refundNetAmount', '12.00');
    	testMap.put('refundInfoList.refundInfo(0).refundFeeAmount', '12.00');
    	testMap.put('refundInfoList.refundInfo(0).refundGrossAmount', '12.00');
    	testMap.put('refundInfoList.refundInfo(0).totalOfAllRefunds', '12.00');
    	testMap.put('refundInfoList.refundInfo(0).encryptedRefundTransactionId', '3454554');
    	testMap.put('refundInfoList.refundInfo(0).refundTransactionStatus', 'done');
    	testMap.put('refundInfoList.refundInfo(0).refundHasBecomeFull', 'true');
    	Map<String, String> result = PPUtils.getMapWithSpecificKeys(testMap, 'receiver');
    	
    	// Assertion
    	System.assert(result.size() == 4);
    	System.assert(result.containsKey('refundInfoList.refundInfo(0).receiver.amount'));
    	System.assert(result.containsKey('refundInfoList.refundInfo(0).receiver.email'));
    	System.assert(result.containsKey('refundInfoList.refundInfo(0).receiver.primary'));
    	System.assert(result.containsKey('refundInfoList.refundInfo(0).receiver.invoiceId'));
    	System.assert(!result.containsKey('refundInfoList.refundInfo(0).refundStatus'));
    	System.assert(!result.containsKey('refundInfoList.refundInfo(0).refundNetAmount'));
    	System.assert(!result.containsKey('refundInfoList.refundInfo(0).refundFeeAmount'));
    	System.assert(!result.containsKey('refundInfoList.refundInfo(0).refundGrossAmount'));
    	System.assert(!result.containsKey('refundInfoList.refundInfo(0).totalOfAllRefunds'));
    	System.assert(!result.containsKey('refundInfoList.refundInfo(0).encryptedRefundTransactionId'));
    	System.assert(!result.containsKey('refundInfoList.refundInfo(0).refundTransactionStatus'));
    	System.assert(!result.containsKey('refundInfoList.refundInfo(0).refundHasBecomeFull'));
	}
}