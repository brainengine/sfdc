@isTest
private class PPFaultMessageExceptionTest {

    static testMethod void testPopulateWithFaultMessage() {
		/********************************************************************************
		responseEnvelope.timestamp=2009-09-25T02%3A46%3A15.779-07%3A00&responseEnvelope.
		ack=Failure&responseEnvelope.correlationId=0544e0d98013c&responseEnvelope.build=
		1041436&error(0).errorId=580001&error(0).domain=PLATFORM&error(0).severity=Error
		&error(0).category=Application&error(0).message=Invalid+request%3A+applicationId
		*********************************************************************************/
		
		PPFaultMessageException ex = new PPFaultMessageException();
		System.assert(Null == ex.ResponseEnvelope);
		System.assert(Null == ex.ErrorList);
		
		Map<String, String> faultMessage = new Map<String, String>();
		faultMessage.put('responseEnvelope.timestamp', '2009-09-25T02.46.15.779-07');
		faultMessage.put('responseEnvelope.ack', 'Failure');
		faultMessage.put('responseEnvelope.correlationId', '0544e0d98013c');
		faultMessage.put('responseEnvelope.build', '1041436');
		faultMessage.put('error(0).errorId', '580001');
		faultMessage.put('error(0).domain', 'PLATFORM');
		faultMessage.put('error(0).severity', 'Error');
		faultMessage.put('error(0).category', 'Application');
		faultMessage.put('error(0).message', 'Invalid+request%3A+applicationId');

		ex.populateWithFaultMessage(faultMessage);

		System.assert(ex.ResponseEnvelope.Ack.equals('Failure'));
		System.assert(ex.ResponseEnvelope.CorrelationId.equals('0544e0d98013c'));
		System.assert(ex.ResponseEnvelope.Build.equals('1041436'));
		System.assert(ex.ResponseEnvelope.StringTimestamp.equals('2009-09-25T02.46.15.779-07'));
		
		System.assert(ex.ErrorList[0].ErrorId == 580001);
		System.assert(ex.ErrorList[0].Domain.equals('PLATFORM'));
		System.assert(ex.ErrorList[0].Severity.equals('Error'));
		System.assert(ex.ErrorList[0].Category.equals('Application'));
		System.assert(ex.ErrorList[0].Message.equals('Invalid+request%3A+applicationId'));
		
    }

    static testMethod void testPopulateWithCustomError() {
		PPFaultMessageException ex = new PPFaultMessageException();
		System.assert(Null == ex.ResponseEnvelope);
		System.assert(Null == ex.ErrorList);
		
		ex.populateWithCustomError(420, 'My custom exception');
		
		System.assert(0 < ex.ResponseEnvelope.StringTimestamp.length());
		System.assert(ex.ResponseEnvelope.Ack.equals('Failure'));

		System.assert(ex.ErrorList[0].ErrorId == 420);
		System.assert(ex.ErrorList[0].Domain.equals('SalesforceToolkit'));
		System.assert(ex.ErrorList[0].Severity.equals('Error'));
		System.assert(ex.ErrorList[0].Category.equals('Application'));
		System.assert(ex.ErrorList[0].Message.equals('My custom exception'));
		System.assert(0 == ex.ErrorList[0].Subdomain.trim().length());
    }

    static testMethod void testPopulateWithFaultMessage_MORE_THAN_ONE_ERRORS() {
		
		PPFaultMessageException ex = new PPFaultMessageException();
		System.assert(Null == ex.ResponseEnvelope);
		System.assert(Null == ex.ErrorList);
		
		Map<String, String> faultMessage = new Map<String, String>();
		faultMessage.put('responseEnvelope.timestamp', '2009-09-25T02.46.15.779-07');
		faultMessage.put('responseEnvelope.ack', 'Failure');
		faultMessage.put('responseEnvelope.correlationId', '0544e0d98013c');
		faultMessage.put('responseEnvelope.build', '1041436');

		faultMessage.put('error(0).errorId', '580001');
		faultMessage.put('error(0).domain', 'PLATFORM');
		faultMessage.put('error(0).severity', 'Error');
		faultMessage.put('error(0).category', 'Application');
		faultMessage.put('error(0).message', 'Invalid+request%3A+applicationId');
		faultMessage.put('error(0).subdomain', 'Adaptive services');
		faultMessage.put('error(0).exceptionID', '440022');

		faultMessage.put('error(1).errorId', '580002');
		faultMessage.put('error(1).domain', 'PLATFORM');
		faultMessage.put('error(1).severity', 'Error');
		faultMessage.put('error(1).category', 'Application');
		faultMessage.put('error(1).message', 'Invalid+request%3A+applicationId');
		faultMessage.put('error(1).subdomain', 'Adaptive services');
		faultMessage.put('error(1).exceptionID', '440023');

		ex.populateWithFaultMessage(faultMessage);

		System.assert(ex.ResponseEnvelope.Ack.equals('Failure'));
		System.assert(ex.ResponseEnvelope.CorrelationId.equals('0544e0d98013c'));
		System.assert(ex.ResponseEnvelope.Build.equals('1041436'));
		System.assert(ex.ResponseEnvelope.StringTimestamp.equals('2009-09-25T02.46.15.779-07'));
		
		System.assert(ex.ErrorList[0].ErrorId == 580001);
		System.assert(ex.ErrorList[0].Domain.equals('PLATFORM'));
		System.assert(ex.ErrorList[0].Severity.equals('Error'));
		System.assert(ex.ErrorList[0].Category.equals('Application'));
		System.assert(ex.ErrorList[0].Message.equals('Invalid+request%3A+applicationId'));
		System.assert(ex.ErrorList[0].Subdomain.equals('Adaptive services'));
		System.assert(ex.ErrorList[0].ExceptionId.equals('440022'));
		System.assert(ex.ErrorList[1].ErrorId == 580002);
		System.assert(ex.ErrorList[1].Domain.equals('PLATFORM'));
		System.assert(ex.ErrorList[1].Severity.equals('Error'));
		System.assert(ex.ErrorList[1].Category.equals('Application'));
		System.assert(ex.ErrorList[1].Message.equals('Invalid+request%3A+applicationId'));
		System.assert(ex.ErrorList[1].Subdomain.equals('Adaptive services'));
		System.assert(ex.ErrorList[1].ExceptionId.equals('440023'));
		
    }
}