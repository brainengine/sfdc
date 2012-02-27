@isTest 
private class PPPreapprovalDetailsResponseTest {
	static testMethod void testParseResponseParametersOne() {	
    	PPPreapprovalDetailsResponse response = new PPPreapprovalDetailsResponse();
    	Map<String, String> testMap = new Map<String, String>();
    	testMap.put('responseEnvelope.timestamp', '2009-07-13T12%3A34%3A29.316-07%3A00');
    	testMap.put('responseEnvelope.ack', 'success');
    	testMap.put('responseEnvelope.correlationId','d615a365bed61');
    	testMap.put('responseEnvelope.build', '1044393');
    	testMap.put('cancelUrl', 'https://c.ap1.visual.force.com/apex/CancelURL');
    	testMap.put('currencyCode', 'USD');
    	testMap.put('preapprovalKey', 'PA-34545445');
    	testMap.put('ipnNotificationUrl', 'ipnNotificationUrl');
    	testMap.put('returnUrl', 'https://c.ap1.visual.force.com/apex/ReturnURL');
    	testMap.put('senderEmail', 'sonali@persistent.co.in');
    	testMap.put('status', 'completed');
    	testMap.put('approved', 'false');
    	testMap.put('memo', 'test app');
    	testMap.put('curPayments', '2');
    	testMap.put('curPaymentsAmount', '24');
    	testMap.put('curPeriodAttempts', '2');
    	testMap.put('curPeriodEndingDate', '2009-09-09T12:09:09.454-7:00');
    	testMap.put('dateOfMonth', '3');
    	testMap.put('dayOfWeek', 'Monday');
    	testMap.put('maxAmountPerPayment', '30');
    	testMap.put('maxNumberOfPayments', '10');
    	testMap.put('endingDate', '2009-09-09T12:09:09.454-7:00');
    	testMap.put('startingDate', '2009-09-09T12:09:09.454-7:00');
    	testMap.put('maxNumberOfPaymentsPerPeriod', '14');
    	testMap.put('maxTotalAmountOfAllPayments', '144');
    	testMap.put('paymentPeriod', '');
    	testMap.put('pinType', 'REQUIRED');
    	response.parseResponseParameters(testMap);
    	
    	// Assertion
    	System.assert(response.Approved == false);
    	System.assert(response.CancelUrl.equals('https://c.ap1.visual.force.com/apex/CancelURL'));
    	System.assert(response.CurPayments == 2);
    	System.assert(response.CurPaymentsAmount == 24);
    	System.assert(response.CurPeriodAttempts == 2);
    	System.assert(response.CurrencyCode.equals('USD'));
    	System.assert(response.DateOfMonth == 3);
    	System.assert(response.DayOfWeek.equals('Monday'));
    	System.assert(response.IpnNotificationUrl.equals('ipnNotificationUrl'));
    	System.assert(response.MaxAmountPerPayment == 30);
    	System.assert(response.MaxNumberOfPayments == 10);
    	System.assert(response.MaxNumberOfPaymentsPerPeriod == 14);
    	System.assert(response.MaxTotalAmountOfAllPayments == 144);
    	System.assert(response.Memo.equals('test app'));
    	System.assert(response.PaymentPeriod.equals(''));
    	System.assert(response.PinType.equals('REQUIRED'));
    	System.assert(response.ReturnUrl.equals('https://c.ap1.visual.force.com/apex/ReturnURL'));
    	System.assert(response.SenderEmail.equals('sonali@persistent.co.in'));
    	System.assert(response.Status.equals('completed'));
    	System.assert(response.StringCurPeriodEndingDate.equals('2009-09-09T12:09:09.454-7:00'));
    	System.assert(response.StringEndingDate.equals('2009-09-09T12:09:09.454-7:00'));
    	System.assert(response.StringStartingDate.equals('2009-09-09T12:09:09.454-7:00'));
    	System.assert(response.getResponseEnvelope().StringTimeStamp.equals('2009-07-13T12%3A34%3A29.316-07%3A00'));
    	System.assert(response.getResponseEnvelope().Ack.equals('success'));
    	System.assert(response.getResponseEnvelope().CorrelationId.equals('d615a365bed61'));
    	System.assert(response.getResponseEnvelope().build.equals('1044393'));
	}
    	
	static testMethod void testParseResponseParametersTwo() {	
    	PPPreapprovalDetailsResponse response = new PPPreapprovalDetailsResponse();
    	Map<String, String> testMap = new Map<String, String>();
    	testMap.put('responseEnvelope.timestamp', '2009-07-13T12%3A34%3A29.316-07%3A00');
    	testMap.put('responseEnvelope.ack', 'success');
    	testMap.put('responseEnvelope.correlationId','d615a365bed61');
    	testMap.put('responseEnvelope.build', '1044393');
    	testMap.put('cancelUrl', 'https://c.ap1.visual.force.com/apex/CancelURL');
    	testMap.put('currencyCode', 'USD');
    	testMap.put('preapprovalKey', 'PA-34545445');
    	testMap.put('ipnNotificationUrl', 'ipnNotificationUrl');
    	testMap.put('returnUrl', 'https://c.ap1.visual.force.com/apex/ReturnURL');
    	testMap.put('senderEmail', 'sonali@persistent.co.in');
    	testMap.put('status', 'completed');
    	testMap.put('approved', 'true');
    	testMap.put('memo', 'test app');
    	testMap.put('curPayments', '2');
    	testMap.put('curPaymentsAmount', '24');
    	testMap.put('curPeriodAttempts', '2');
    	testMap.put('curPeriodEndingDate', '2009-09-09T12:09:09.454-7:00');
    	testMap.put('dateOfMonth', '3');
    	testMap.put('dayOfWeek', 'Monday');
    	testMap.put('maxAmountPerPayment', '30');
    	testMap.put('maxNumberOfPayments', '10');
    	testMap.put('endingDate', '2009-09-09T12:09:09.454-7:00');
    	testMap.put('startingDate', '2009-09-09T12:09:09.454-7:00');
    	testMap.put('maxNumberOfPaymentsPerPeriod', '14');
    	testMap.put('maxTotalAmountOfAllPayments', '144');
    	testMap.put('paymentPeriod', '');
    	testMap.put('pinType', 'REQUIRED');
    	response.parseResponseParameters(testMap);
    	
    	// Assertion
    	System.assert(response.Approved == true);
    	System.assert(response.CancelUrl.equals('https://c.ap1.visual.force.com/apex/CancelURL'));
    	System.assert(response.CurPayments == 2);
    	System.assert(response.CurPaymentsAmount == 24);
    	System.assert(response.CurPeriodAttempts == 2);
    	System.assert(response.CurrencyCode.equals('USD'));
    	System.assert(response.DateOfMonth == 3);
    	System.assert(response.DayOfWeek.equals('Monday'));
    	System.assert(response.IpnNotificationUrl.equals('ipnNotificationUrl'));
    	System.assert(response.MaxAmountPerPayment == 30);
    	System.assert(response.MaxNumberOfPayments == 10);
    	System.assert(response.MaxNumberOfPaymentsPerPeriod == 14);
    	System.assert(response.MaxTotalAmountOfAllPayments == 144);
    	System.assert(response.Memo.equals('test app'));
    	System.assert(response.PaymentPeriod.equals(''));
    	System.assert(response.PinType.equals('REQUIRED'));
    	System.assert(response.ReturnUrl.equals('https://c.ap1.visual.force.com/apex/ReturnURL'));
    	System.assert(response.SenderEmail.equals('sonali@persistent.co.in'));
    	System.assert(response.Status.equals('completed'));
    	System.assert(response.StringCurPeriodEndingDate.equals('2009-09-09T12:09:09.454-7:00'));
    	System.assert(response.StringEndingDate.equals('2009-09-09T12:09:09.454-7:00'));
    	System.assert(response.StringStartingDate.equals('2009-09-09T12:09:09.454-7:00'));
    	System.assert(response.getResponseEnvelope().StringTimeStamp.equals('2009-07-13T12%3A34%3A29.316-07%3A00'));
    	System.assert(response.getResponseEnvelope().Ack.equals('success'));
    	System.assert(response.getResponseEnvelope().CorrelationId.equals('d615a365bed61'));
    	System.assert(response.getResponseEnvelope().build.equals('1044393'));
	}
}