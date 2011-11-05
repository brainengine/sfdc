@isTest 
private class PPPayResponseTest {
	static testMethod void testParseResponseParameters() {	
    	PPPayResponse payResponse = new PPPayResponse();
    	Map<String, String> testMap = new Map<String, String>();
    	testMap.put('responseEnvelope.timestamp', '2009-07-13T12%3A34%3A29.316-07%3A00');
    	testMap.put('responseEnvelope.ack', 'success');
    	testMap.put('responseEnvelope.correlationId','d615a365bed61');
    	testMap.put('responseEnvelope.build', 'DEV');
    	testMap.put('payKey', 'AP-3TY011106S4428730');
    	testMap.put('paymentExecStatus', 'CREATED');
    	payResponse.parseResponseParameters(testMap);
    	payResponse.getErrorList();
    	
    	// Assertion
    	System.assert(payResponse.getResponseEnvelope().StringTimeStamp.equals('2009-07-13T12%3A34%3A29.316-07%3A00'));
    	System.assert(payResponse.getResponseEnvelope().Ack.equals('success'));
    	System.assert(payResponse.getResponseEnvelope().CorrelationId.equals('d615a365bed61'));
    	System.assert(payResponse.getResponseEnvelope().build.equals('DEV'));
    	System.assert(payResponse.PayKey.equals('AP-3TY011106S4428730'));
    	System.assert(payResponse.PaymentExecStatus.equals('CREATED'));
	}
	
	static testMethod void populateErrorPPPayResponse() {	
    	PPPayResponse payResponse = new PPPayResponse();
    	Map<String, String> testMap = new Map<String, String>();
    	testMap.put('responseEnvelope.timestamp', '2009-07-13T12%3A34%3A29.316-07%3A00');
    	testMap.put('responseEnvelope.ack', 'failure');
    	testMap.put('responseEnvelope.correlationId','d615a365bed61');
    	testMap.put('responseEnvelope.build', 'DEV');
    	testMap.put('error(0).errorId', '520003');
    	testMap.put('error(0).domain', 'PLATFORM');
    	testMap.put('error(0).severity', 'Error');
    	testMap.put('error(0).category', 'Application');
    	testMap.put('error(0).message', 'Username/Password is incorrect');
    	testMap.put('error(0).exceptionID', '23343');
    	testMap.put('error(0).subdomain', 'sub domain');
    	testMap.put('receiver(0).amount', '10');
    	testMap.put('receiver(0).email', 'paypal@persistent.co.in');
    	testMap.put('receiver(0).primary', 'false');
    	
    	testMap.put('error(1).errorId', '520004');
    	testMap.put('error(1).domain', 'PLATFORM');
    	testMap.put('error(1).severity', 'Error');
    	testMap.put('error(1).category', 'Application');
    	testMap.put('error(1).message', 'Username/Password is incorrect');
    	testMap.put('receiver(1).amount', '10');
    	testMap.put('receiver(1).email', 'paypal1@persistent.co.in');
    	testMap.put('receiver(1).primary', 'false');
    	
    	testMap.put('error(2).errorId', '520005');
    	testMap.put('error(2).domain', 'PLATFORM');
    	testMap.put('error(2).severity', 'Error');
    	testMap.put('error(2).category', 'Application');
    	testMap.put('error(2).message', 'Username/Password is incorrect');
    	testMap.put('receiver(2).amount', '10');
    	testMap.put('receiver(2).email', 'paypal2@persistent.co.in');
    	testMap.put('receiver(2).primary', 'false');
    	
    	payResponse.parseResponseParameters(testMap);
    	
    	//Assertion
    	System.assert(payResponse.getResponseEnvelope().StringTimeStamp.equals('2009-07-13T12%3A34%3A29.316-07%3A00'));
    	System.assert(payResponse.getResponseEnvelope().Ack.equals('failure'));
    	System.assert(payResponse.getResponseEnvelope().CorrelationId.equals('d615a365bed61'));
    	System.assert(payResponse.getResponseEnvelope().build.equals('DEV'));
    	System.assert(payResponse.PayErrorList[0].Error.ErrorId == 520003);
    	System.assert(payResponse.PayErrorList[0].Error.Domain == 'PLATFORM');
		System.assert(payResponse.PayErrorList[0].Error.Severity == 'Error');
		System.assert(payResponse.PayErrorList[0].Error.Category == 'Application');
		System.assert(payResponse.PayErrorList[0].Error.Message == 'Username/Password is incorrect');
		System.assert(payResponse.PayErrorList[0].Error.ExceptionId == '23343');
		System.assert(payResponse.PayErrorList[0].Error.Subdomain == 'sub domain');
		System.assert(payResponse.PayErrorList[0].Receiver.Amount == 10);
		System.assert(payResponse.PayErrorList[0].Receiver.Email == 'paypal@persistent.co.in');
		System.assert(payResponse.PayErrorList[0].Receiver.Primary == false);
    	
    	System.assert(payResponse.PayErrorList[1].Error.ErrorId == 520004);
    	System.assert(payResponse.PayErrorList[1].Error.Domain == 'PLATFORM');
		System.assert(payResponse.PayErrorList[1].Error.Severity == 'Error');
		System.assert(payResponse.PayErrorList[1].Error.Category == 'Application');
		System.assert(payResponse.PayErrorList[1].Error.Message == 'Username/Password is incorrect');
		System.assert(payResponse.PayErrorList[1].Receiver.Amount == 10);
		System.assert(payResponse.PayErrorList[1].Receiver.Email == 'paypal1@persistent.co.in');
		System.assert(payResponse.PayErrorList[1].Receiver.Primary == false);
		
		System.assert(payResponse.PayErrorList[2].Error.ErrorId == 520005);
    	System.assert(payResponse.PayErrorList[2].Error.Domain == 'PLATFORM');
		System.assert(payResponse.PayErrorList[2].Error.Severity == 'Error');
		System.assert(payResponse.PayErrorList[2].Error.Category == 'Application');
		System.assert(payResponse.PayErrorList[2].Error.Message == 'Username/Password is incorrect');
		System.assert(payResponse.PayErrorList[2].Receiver.Amount == 10);
		System.assert(payResponse.PayErrorList[2].Receiver.Email == 'paypal2@persistent.co.in');
		System.assert(payResponse.PayErrorList[2].Receiver.Primary == false);	
	}
}