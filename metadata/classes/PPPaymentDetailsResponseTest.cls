@isTest 
private class PPPaymentDetailsResponseTest {
	static testMethod void testParseResponseParametersOne() {	
    	PPPaymentDetailsResponse paymentDetailsResponse = new PPPaymentDetailsResponse();
    	Map<String, String> testMap = new Map<String, String>();
    	testMap.put('responseEnvelope.timestamp', '2009-07-13T12%3A34%3A29.316-07%3A00');
    	testMap.put('responseEnvelope.ack', 'success');
    	testMap.put('responseEnvelope.correlationId','d615a365bed61');
    	testMap.put('responseEnvelope.build', '1044393');
    	testMap.put('cancelUrl', 'https://c.ap1.visual.force.com/apex/CancelURL');
    	testMap.put('currencyCode', 'USD');
    	testMap.put('feesPayer', 'EACHRECEIVER');
    	testMap.put('preapprovalKey', 'PA-34545445');
    	testMap.put('ipnNotificationUrl', 'ipnNotificationUrl');
    	testMap.put('returnUrl', 'returnUrl');
    	testMap.put('senderEmail', 'sonali@persistent.co.in');
    	testMap.put('status', 'completed');
    	testMap.put('trackingId', '344353');
    	testMap.put('actionType', 'Pay');
    	testMap.put('reverseAllParallelPaymentsOnError', 'false');
    	testMap.put('logDefaultShippingAddress', 'false');
    	testMap.put('memo', 'test app');
    	testMap.put('payKey', 'AP-706573007A510573A');
    	testMap.put('paymentInfoList.paymentInfo(0).pendingRefund', 'false');
    	testMap.put('paymentInfoList.paymentInfo(0).receiver.amount', '10');
    	testMap.put('paymentInfoList.paymentInfo(0).receiver.primary', 'false');
    	testMap.put('paymentInfoList.paymentInfo(0).receiver.email', 'manish_1250055563_biz@persistent.co.in');
    	testMap.put('paymentInfoList.paymentInfo(1).pendingRefund', 'false');
    	testMap.put('paymentInfoList.paymentInfo(1).receiver.amount', '10');
    	testMap.put('paymentInfoList.paymentInfo(1).receiver.primary', 'false');
    	testMap.put('paymentInfoList.paymentInfo(1).receiver.email', 'sonali_1250055563_biz@persistent.co.in');
    	testMap.put('paymentInfoList.paymentInfo(2).pendingRefund', 'false');
    	testMap.put('paymentInfoList.paymentInfo(2).receiver.amount', '10');
    	testMap.put('paymentInfoList.paymentInfo(2).receiver.primary', 'false');
    	testMap.put('paymentInfoList.paymentInfo(2).receiver.email', 'ankita_1250055563_biz@persistent.co.in');
    	testMap.put('paymentInfoList.paymentInfo(3).pendingRefund', 'false');
    	testMap.put('paymentInfoList.paymentInfo(3).receiver.amount', '10');
    	testMap.put('paymentInfoList.paymentInfo(3).receiver.primary', 'true');
    	testMap.put('paymentInfoList.paymentInfo(3).receiver.email', 'anil_1250055563_biz@persistent.co.in');
    	testMap.put('fundingtypeList.fundingTypeInfo(0).fundingType', 'ECHECK');
    	testMap.put('fundingtypeList.fundingTypeInfo(1).fundingType', 'BALANCE');
    	testMap.put('fundingtypeList.fundingTypeInfo(2).fundingType', 'CREDITCARD');
    	paymentDetailsResponse.parseResponseParameters(testMap);
    	
    	// Assertion
    	System.assert(paymentDetailsResponse.FundingtypeList[0].FundingType == 'ECHECK');
    	System.assert(paymentDetailsResponse.FundingtypeList[1].FundingType == 'BALANCE');
    	System.assert(paymentDetailsResponse.FundingtypeList[2].FundingType == 'CREDITCARD');
    	System.assert(paymentDetailsResponse.ActionType.equals('Pay'));
    	System.assert(paymentDetailsResponse.CancelUrl.equals('https://c.ap1.visual.force.com/apex/CancelURL'));
    	System.assert(paymentDetailsResponse.CurrencyCode.equals('USD'));
    	System.assert(paymentDetailsResponse.FeesPayer.equals('EACHRECEIVER'));
    	System.assert(paymentDetailsResponse.IpnNotificationUrl.equals('ipnNotificationUrl'));
    	System.assert(paymentDetailsResponse.LogDefaultShippingAddress.equals('false'));
    	System.assert(paymentDetailsResponse.Memo.equals('test app'));
    	System.assert(paymentDetailsResponse.PayKey.equals('AP-706573007A510573A'));
    	System.assert(paymentDetailsResponse.PreapprovalKey.equals('PA-34545445'));
    	System.assert(paymentDetailsResponse.ReturnUrl.equals('returnUrl'));
    	System.assert(paymentDetailsResponse.ReverseAllParallelPaymentsOnError == false);
    	System.assert(paymentDetailsResponse.SenderEmail.equals('sonali@persistent.co.in'));
    	System.assert(paymentDetailsResponse.Status.equals('completed'));
    	System.assert(paymentDetailsResponse.TrackingId.equals('344353'));
    	System.assert(paymentDetailsResponse.getResponseEnvelope().StringTimeStamp.equals('2009-07-13T12%3A34%3A29.316-07%3A00'));
    	System.assert(paymentDetailsResponse.getResponseEnvelope().Ack.equals('success'));
    	System.assert(paymentDetailsResponse.getResponseEnvelope().CorrelationId.equals('d615a365bed61'));
    	System.assert(paymentDetailsResponse.getResponseEnvelope().build.equals('1044393'));
    	System.assert(paymentDetailsResponse.PaymentInformationList[0].PendingRefund == false);
    	System.assert(paymentDetailsResponse.PaymentInformationList[0].Receiver.Amount == 10);
    	System.assert(paymentDetailsResponse.PaymentInformationList[0].Receiver.Email.equals('manish_1250055563_biz@persistent.co.in'));
    	System.assert(paymentDetailsResponse.PaymentInformationList[0].Receiver.Primary == false);
    	System.assert(paymentDetailsResponse.PaymentInformationList[1].PendingRefund == false);
    	System.assert(paymentDetailsResponse.PaymentInformationList[1].Receiver.Amount == 10);
    	System.assert(paymentDetailsResponse.PaymentInformationList[1].Receiver.Email.equals('sonali_1250055563_biz@persistent.co.in'));
    	System.assert(paymentDetailsResponse.PaymentInformationList[1].Receiver.Primary == false);
    	System.assert(paymentDetailsResponse.PaymentInformationList[2].PendingRefund == false);
    	System.assert(paymentDetailsResponse.PaymentInformationList[2].Receiver.Amount == 10);
    	System.assert(paymentDetailsResponse.PaymentInformationList[2].Receiver.Email.equals('ankita_1250055563_biz@persistent.co.in'));
    	System.assert(paymentDetailsResponse.PaymentInformationList[2].Receiver.Primary == false);
    	System.assert(paymentDetailsResponse.PaymentInformationList[3].PendingRefund == false);
    	System.assert(paymentDetailsResponse.PaymentInformationList[3].Receiver.Amount == 10);
    	System.assert(paymentDetailsResponse.PaymentInformationList[3].Receiver.Email.equals('anil_1250055563_biz@persistent.co.in'));
    	System.assert(paymentDetailsResponse.PaymentInformationList[3].Receiver.Primary == true);
	
	}
	
	static testMethod void testParseResponseParametersTwo() {	
    	PPPaymentDetailsResponse paymentDetailsResponse = new PPPaymentDetailsResponse();
    	Map<String, String> testMap = new Map<String, String>();
    	testMap.put('responseEnvelope.timestamp', '2009-07-13T12%3A34%3A29.316-07%3A00');
    	testMap.put('responseEnvelope.ack', 'success');
    	testMap.put('responseEnvelope.correlationId','d615a365bed61');
    	testMap.put('responseEnvelope.build', '1044393');
    	testMap.put('cancelUrl', 'https://c.ap1.visual.force.com/apex/CancelURL');
    	testMap.put('currencyCode', 'USD');
    	testMap.put('feesPayer', 'EACHRECEIVER');
    	testMap.put('preapprovalKey', 'PA-34545445');
    	testMap.put('ipnNotificationUrl', 'ipnNotificationUrl');
    	testMap.put('returnUrl', 'returnUrl');
    	testMap.put('senderEmail', 'sonali@persistent.co.in');
    	testMap.put('status', 'completed');
    	testMap.put('trackingId', '344353');
    	testMap.put('actionType', 'Pay');
    	testMap.put('reverseAllParallelPaymentsOnError', 'true');
    	testMap.put('logDefaultShippingAddress', 'false');
    	testMap.put('memo', 'test app');
    	testMap.put('payKey', 'AP-706573007A510573A');
    	testMap.put('paymentInfoList.paymentInfo(0).pendingRefund', 'false');
    	testMap.put('paymentInfoList.paymentInfo(0).receiver.amount', '10');
    	testMap.put('paymentInfoList.paymentInfo(0).receiver.primary', 'false');
    	testMap.put('paymentInfoList.paymentInfo(0).receiver.email', 'manish_1250055563_biz@persistent.co.in');
    	paymentDetailsResponse.parseResponseParameters(testMap);
    	
    	// Assertion
    	System.assert(paymentDetailsResponse.ActionType.equals('Pay'));
    	System.assert(paymentDetailsResponse.CancelUrl.equals('https://c.ap1.visual.force.com/apex/CancelURL'));
    	System.assert(paymentDetailsResponse.CurrencyCode.equals('USD'));
    	System.assert(paymentDetailsResponse.FeesPayer.equals('EACHRECEIVER'));
    	System.assert(paymentDetailsResponse.IpnNotificationUrl.equals('ipnNotificationUrl'));
    	System.assert(paymentDetailsResponse.LogDefaultShippingAddress.equals('false'));
    	System.assert(paymentDetailsResponse.Memo.equals('test app'));
    	System.assert(paymentDetailsResponse.PayKey.equals('AP-706573007A510573A'));
    	System.assert(paymentDetailsResponse.PreapprovalKey.equals('PA-34545445'));
    	System.assert(paymentDetailsResponse.ReturnUrl.equals('returnUrl'));
    	System.assert(paymentDetailsResponse.ReverseAllParallelPaymentsOnError == true);
    	System.assert(paymentDetailsResponse.SenderEmail.equals('sonali@persistent.co.in'));
    	System.assert(paymentDetailsResponse.Status.equals('completed'));
    	System.assert(paymentDetailsResponse.TrackingId.equals('344353'));
    	System.assert(paymentDetailsResponse.getResponseEnvelope().StringTimeStamp.equals('2009-07-13T12%3A34%3A29.316-07%3A00'));
    	System.assert(paymentDetailsResponse.getResponseEnvelope().Ack.equals('success'));
    	System.assert(paymentDetailsResponse.getResponseEnvelope().CorrelationId.equals('d615a365bed61'));
    	System.assert(paymentDetailsResponse.getResponseEnvelope().build.equals('1044393'));
    	System.assert(paymentDetailsResponse.PaymentInformationList[0].PendingRefund == false);
    	System.assert(paymentDetailsResponse.PaymentInformationList[0].Receiver.Amount == 10);
    	System.assert(paymentDetailsResponse.PaymentInformationList[0].Receiver.Email.equals('manish_1250055563_biz@persistent.co.in'));
    	System.assert(paymentDetailsResponse.PaymentInformationList[0].Receiver.Primary == false);
    }
}