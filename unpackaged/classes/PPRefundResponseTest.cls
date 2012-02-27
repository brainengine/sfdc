@isTest 
private class PPRefundResponseTest {
	static testMethod void testParseResponseParameters() {
		PPRefundResponse response = new PPRefundResponse();
		Map<String, String> testMap = new Map<String, String>();
    	testMap.put('responseEnvelope.timestamp', '2009-07-13T12%3A34%3A29.316-07%3A00');
    	testMap.put('responseEnvelope.ack', 'success');
    	testMap.put('responseEnvelope.correlationId','d615a365bed61');
    	testMap.put('responseEnvelope.build', 'DEV');
    	testMap.put('currencyCode', 'USD');

    	testMap.put('refundInfoList.refundInfo(0).refundStatus', 'Completed');
    	testMap.put('refundInfoList.refundInfo(0).refundNetAmount', '12.00');
    	testMap.put('refundInfoList.refundInfo(0).refundFeeAmount', '12.00');
    	testMap.put('refundInfoList.refundInfo(0).refundGrossAmount', '12.00');
    	testMap.put('refundInfoList.refundInfo(0).totalOfAllRefunds', '12.00');
    	testMap.put('refundInfoList.refundInfo(0).refundHasBecomeFull', 'false');
    	testMap.put('refundInfoList.refundInfo(0).encryptedRefundTransactionId', '3454554');
    	testMap.put('refundInfoList.refundInfo(0).refundTransactionStatus', 'done');

    	testMap.put('refundInfoList.refundInfo(0).receiver.amount', '11');
    	testMap.put('refundInfoList.refundInfo(0).receiver.email', 'Test@persistent.co.in');
    	testMap.put('refundInfoList.refundInfo(0).receiver.primary', 'false');
    	testMap.put('refundInfoList.refundInfo(0).receiver.invoiceId', '545fe');

    	testMap.put('refundInfoList.refundInfo(0).error(0).errorId', '520003');
    	testMap.put('refundInfoList.refundInfo(0).error(0).domain', 'PLATFORM');
    	testMap.put('refundInfoList.refundInfo(0).error(0).severity', 'Error');
    	testMap.put('refundInfoList.refundInfo(0).error(0).category', 'Application');
    	testMap.put('refundInfoList.refundInfo(0).error(0).message', 'Username/Password is incorrect');
    	testMap.put('refundInfoList.refundInfo(0).error(0).exceptionID', '23343');
    	testMap.put('refundInfoList.refundInfo(0).error(0).subdomain', 'sub domain');
    	testMap.put('refundInfoList.refundInfo(0).error(0).parameter(0)', 'error0-parameter0');
    	testMap.put('refundInfoList.refundInfo(0).error(0).parameter(1)', 'error0-parameter1');
    	testMap.put('refundInfoList.refundInfo(0).error(0).parameter(2)', 'error0-parameter2');
    	
    	testMap.put('refundInfoList.refundInfo(0).error(1).errorId', '520004');
    	testMap.put('refundInfoList.refundInfo(0).error(1).domain', 'PLATFORM');
    	testMap.put('refundInfoList.refundInfo(0).error(1).severity', 'Error');
    	testMap.put('refundInfoList.refundInfo(0).error(1).category', 'Application');
    	testMap.put('refundInfoList.refundInfo(0).error(1).message', 'Username/Password is incorrect');
    	testMap.put('refundInfoList.refundInfo(0).error(1).exceptionID', '44444');
    	testMap.put('refundInfoList.refundInfo(0).error(1).subdomain', 'Reserved');
    	testMap.put('refundInfoList.refundInfo(0).error(1).parameter(0)', 'error1-parameter0');
    	testMap.put('refundInfoList.refundInfo(0).error(1).parameter(1)', 'error1-parameter1');
    	testMap.put('refundInfoList.refundInfo(0).error(1).parameter(2)', 'error1-parameter2');

    	testMap.put('refundInfoList.refundInfo(0).error(2).errorId', '520005');
    	testMap.put('refundInfoList.refundInfo(0).error(2).domain', 'PLATFORM');
    	testMap.put('refundInfoList.refundInfo(0).error(2).severity', 'Error');
    	testMap.put('refundInfoList.refundInfo(0).error(2).category', 'Application');
    	testMap.put('refundInfoList.refundInfo(0).error(2).message', 'Username/Password is incorrect');
    	testMap.put('refundInfoList.refundInfo(0).error(2).exceptionID', '55555');
    	testMap.put('refundInfoList.refundInfo(0).error(2).subdomain', 'Reserved');
    	testMap.put('refundInfoList.refundInfo(0).error(2).parameter(0)', 'error2-parameter0');
    	testMap.put('refundInfoList.refundInfo(0).error(2).parameter(1)', 'error2-parameter1');
    	testMap.put('refundInfoList.refundInfo(0).error(2).parameter(2)', 'error2-parameter2');
		
		testMap.put('refundInfoList.refundInfo(1).refundStatus', 'Created');
    	testMap.put('refundInfoList.refundInfo(1).refundNetAmount', '15.00');
    	testMap.put('refundInfoList.refundInfo(1).refundFeeAmount', '15.00');
    	testMap.put('refundInfoList.refundInfo(1).refundGrossAmount', '15.00');
    	testMap.put('refundInfoList.refundInfo(1).totalOfAllRefunds', '15.00');
    	testMap.put('refundInfoList.refundInfo(1).refundHasBecomeFull', 'true');
    	testMap.put('refundInfoList.refundInfo(1).encryptedRefundTransactionId', '458800');
    	testMap.put('refundInfoList.refundInfo(1).refundTransactionStatus', 'Pending');

    	testMap.put('refundInfoList.refundInfo(1).receiver.amount', '111');
    	testMap.put('refundInfoList.refundInfo(1).receiver.email', 'Test2@persistent.co.in');
    	testMap.put('refundInfoList.refundInfo(1).receiver.primary', 'false');
    	testMap.put('refundInfoList.refundInfo(1).receiver.invoiceId', '545fefgh');

    	testMap.put('refundInfoList.refundInfo(1).error(0).errorId', '620003');
    	testMap.put('refundInfoList.refundInfo(1).error(0).domain', 'PLATFORM');
    	testMap.put('refundInfoList.refundInfo(1).error(0).severity', 'Error');
    	testMap.put('refundInfoList.refundInfo(1).error(0).category', 'Application');
    	testMap.put('refundInfoList.refundInfo(1).error(0).message', 'Username/Password is incorrect');
    	testMap.put('refundInfoList.refundInfo(1).error(0).exceptionID', '77777');
    	testMap.put('refundInfoList.refundInfo(1).error(0).subdomain', 'Reserved');
    	testMap.put('refundInfoList.refundInfo(1).error(0).parameter(0)', 'error0-parameter0');
    	testMap.put('refundInfoList.refundInfo(1).error(0).parameter(1)', 'error0-parameter1');
    	testMap.put('refundInfoList.refundInfo(1).error(0).parameter(2)', 'error0-parameter2');
    
    	testMap.put('refundInfoList.refundInfo(1).error(1).errorId', '620004');
    	testMap.put('refundInfoList.refundInfo(1).error(1).domain', 'PLATFORM');
    	testMap.put('refundInfoList.refundInfo(1).error(1).severity', 'Error');
    	testMap.put('refundInfoList.refundInfo(1).error(1).category', 'Application');
    	testMap.put('refundInfoList.refundInfo(1).error(1).message', 'Username/Password is incorrect');
    	testMap.put('refundInfoList.refundInfo(1).error(1).exceptionID', '88888');
    	testMap.put('refundInfoList.refundInfo(1).error(1).subdomain', 'Reserved1');
    	testMap.put('refundInfoList.refundInfo(1).error(1).parameter(0)', 'error1-parameter0');
    	testMap.put('refundInfoList.refundInfo(1).error(1).parameter(1)', 'error1-parameter1');
    	testMap.put('refundInfoList.refundInfo(1).error(1).parameter(2)', 'error1-parameter2');

    	testMap.put('refundInfoList.refundInfo(1).error(2).errorId', '620005');
    	testMap.put('refundInfoList.refundInfo(1).error(2).domain', 'PLATFORM');
    	testMap.put('refundInfoList.refundInfo(1).error(2).severity', 'Error');
    	testMap.put('refundInfoList.refundInfo(1).error(2).category', 'Application');
    	testMap.put('refundInfoList.refundInfo(1).error(2).message', 'Username/Password is incorrect');
    	testMap.put('refundInfoList.refundInfo(1).error(2).exceptionID', '99999');
    	testMap.put('refundInfoList.refundInfo(1).error(2).subdomain', 'Reserved2');
    	testMap.put('refundInfoList.refundInfo(1).error(2).parameter(0)', 'error2-parameter0');
    	testMap.put('refundInfoList.refundInfo(1).error(2).parameter(1)', 'error2-parameter1');
    	testMap.put('refundInfoList.refundInfo(1).error(2).parameter(2)', 'error2-parameter2');
		
    	response.parseResponseParameters(testMap);

		System.assert(response.CurrencyCode == 'USD');

		PPResponseEnvelope responseEnvelope = response.getResponseEnvelope();
		System.assert(responseEnvelope.Ack == 'success');
		System.assert(responseEnvelope.CorrelationId == 'd615a365bed61');
		System.assert(responseEnvelope.Build == 'DEV');
		System.assert(responseEnvelope.StringTimestamp == '2009-07-13T12%3A34%3A29.316-07%3A00');
		
		System.assert(2 == response.RefundInfoList.size());
    
		System.assert(response.RefundInfoList[0].RefundStatus == 'Completed');
		System.assert(response.RefundInfoList[0].RefundNetAmount == 12.00);
		System.assert(response.RefundInfoList[0].RefundFeeAmount == 12.00);
		System.assert(response.RefundInfoList[0].RefundGrossAmount == 12.00);
		System.assert(response.RefundInfoList[0].TotalOfAllRefunds == 12.00);
		System.assert(response.RefundInfoList[0].RefundHasBecomeFull == false);
		System.assert(response.RefundInfoList[0].EncryptedRefundTransactionId == '3454554');
		System.assert(response.RefundInfoList[0].RefundTransactionStatus == 'done');

		System.assert(response.RefundInfoList[0].Receiver.Amount == 11);
		System.assert(response.RefundInfoList[0].Receiver.Email == 'Test@persistent.co.in');
		System.assert(response.RefundInfoList[0].Receiver.Primary == false);
		System.assert(response.RefundInfoList[0].Receiver.InvoiceId == '545fe');

		System.assert(response.RefundInfoList[0].ErrorList[0].ErrorId == 520003);
		System.assert(response.RefundInfoList[0].ErrorList[0].Domain == 'PLATFORM');
		System.assert(response.RefundInfoList[0].ErrorList[0].Severity == 'Error');
		System.assert(response.RefundInfoList[0].ErrorList[0].Category == 'Application');
		System.assert(response.RefundInfoList[0].ErrorList[0].Message == 'Username/Password is incorrect');
		System.assert(response.RefundInfoList[0].ErrorList[0].ExceptionId == '23343');
		System.assert(response.RefundInfoList[0].ErrorList[0].Subdomain == 'sub domain');
		System.assert(0 < response.RefundInfoList[0].ErrorList[0].Parameter[0].trim().length());
		System.assert(0 < response.RefundInfoList[0].ErrorList[0].Parameter[0].trim().length());
		System.assert(0 < response.RefundInfoList[0].ErrorList[0].Parameter[0].trim().length());

		System.assert(response.RefundInfoList[0].ErrorList[1].ErrorId == 520004);
		System.assert(response.RefundInfoList[0].ErrorList[1].Domain == 'PLATFORM');
		System.assert(response.RefundInfoList[0].ErrorList[1].Severity == 'Error');
		System.assert(response.RefundInfoList[0].ErrorList[1].Category == 'Application');
		System.assert(response.RefundInfoList[0].ErrorList[1].Message == 'Username/Password is incorrect');
		System.assert(response.RefundInfoList[0].ErrorList[1].ExceptionId == '44444');
		System.assert(response.RefundInfoList[0].ErrorList[1].Subdomain == 'Reserved');
		System.assert(0 < response.RefundInfoList[0].ErrorList[1].Parameter[0].trim().length());
		System.assert(0 < response.RefundInfoList[0].ErrorList[1].Parameter[0].trim().length());
		System.assert(0 < response.RefundInfoList[0].ErrorList[1].Parameter[0].trim().length());

		System.assert(response.RefundInfoList[0].ErrorList[2].ErrorId == 520005);
		System.assert(response.RefundInfoList[0].ErrorList[2].Domain == 'PLATFORM');
		System.assert(response.RefundInfoList[0].ErrorList[2].Severity == 'Error');
		System.assert(response.RefundInfoList[0].ErrorList[2].Category == 'Application');
		System.assert(response.RefundInfoList[0].ErrorList[2].Message == 'Username/Password is incorrect');
		System.assert(response.RefundInfoList[0].ErrorList[2].ExceptionId == '55555');
		System.assert(response.RefundInfoList[0].ErrorList[2].Subdomain == 'Reserved');
		System.assert(0 < response.RefundInfoList[0].ErrorList[2].Parameter[0].trim().length());
		System.assert(0 < response.RefundInfoList[0].ErrorList[2].Parameter[0].trim().length());
		System.assert(0 < response.RefundInfoList[0].ErrorList[2].Parameter[0].trim().length());


		System.assert(response.RefundInfoList[1].RefundStatus == 'Created');
		System.assert(response.RefundInfoList[1].RefundNetAmount == 15.00);
		System.assert(response.RefundInfoList[1].RefundFeeAmount == 15.00);
		System.assert(response.RefundInfoList[1].RefundGrossAmount == 15.00);
		System.assert(response.RefundInfoList[1].TotalOfAllRefunds == 15.00);
		System.assert(response.RefundInfoList[1].RefundHasBecomeFull == true);
		System.assert(response.RefundInfoList[1].EncryptedRefundTransactionId == '458800');
		System.assert(response.RefundInfoList[1].RefundTransactionStatus == 'Pending');

		System.assert(response.RefundInfoList[1].Receiver.Amount == 111);
		System.assert(response.RefundInfoList[1].Receiver.Email == 'Test2@persistent.co.in');
		System.assert(response.RefundInfoList[1].Receiver.Primary == false);
		System.assert(response.RefundInfoList[1].Receiver.InvoiceId == '545fefgh');

		System.assert(response.RefundInfoList[1].ErrorList[0].ErrorId == 620003);
		System.assert(response.RefundInfoList[1].ErrorList[0].Domain == 'PLATFORM');
		System.assert(response.RefundInfoList[1].ErrorList[0].Severity == 'Error');
		System.assert(response.RefundInfoList[1].ErrorList[0].Category == 'Application');
		System.assert(response.RefundInfoList[1].ErrorList[0].Message == 'Username/Password is incorrect');
		System.assert(response.RefundInfoList[1].ErrorList[0].ExceptionId == '77777');
		System.assert(response.RefundInfoList[1].ErrorList[0].Subdomain == 'Reserved');
		System.assert(0 < response.RefundInfoList[1].ErrorList[0].Parameter[0].trim().length());
		System.assert(0 < response.RefundInfoList[1].ErrorList[0].Parameter[0].trim().length());
		System.assert(0 < response.RefundInfoList[1].ErrorList[0].Parameter[0].trim().length());

		System.assert(response.RefundInfoList[1].ErrorList[1].ErrorId == 620004);
		System.assert(response.RefundInfoList[1].ErrorList[1].Domain == 'PLATFORM');
		System.assert(response.RefundInfoList[1].ErrorList[1].Severity == 'Error');
		System.assert(response.RefundInfoList[1].ErrorList[1].Category == 'Application');
		System.assert(response.RefundInfoList[1].ErrorList[1].Message == 'Username/Password is incorrect');
		System.assert(response.RefundInfoList[1].ErrorList[1].ExceptionId == '88888');
		System.assert(response.RefundInfoList[1].ErrorList[1].Subdomain == 'Reserved1');
		System.assert(0 < response.RefundInfoList[1].ErrorList[1].Parameter[0].trim().length());
		System.assert(0 < response.RefundInfoList[1].ErrorList[1].Parameter[0].trim().length());
		System.assert(0 < response.RefundInfoList[1].ErrorList[1].Parameter[0].trim().length());

		System.assert(response.RefundInfoList[1].ErrorList[2].ErrorId == 620005);
		System.assert(response.RefundInfoList[1].ErrorList[2].Domain == 'PLATFORM');
		System.assert(response.RefundInfoList[1].ErrorList[2].Severity == 'Error');
		System.assert(response.RefundInfoList[1].ErrorList[2].Category == 'Application');
		System.assert(response.RefundInfoList[1].ErrorList[2].Message == 'Username/Password is incorrect');
		System.assert(response.RefundInfoList[1].ErrorList[2].ExceptionId == '99999');
		System.assert(response.RefundInfoList[1].ErrorList[2].Subdomain == 'Reserved2');
		System.assert(0 < response.RefundInfoList[1].ErrorList[2].Parameter[0].trim().length());
		System.assert(0 < response.RefundInfoList[1].ErrorList[2].Parameter[0].trim().length());
		System.assert(0 < response.RefundInfoList[1].ErrorList[2].Parameter[0].trim().length());
	}
}