@isTest 
private class PPPayErrorTest {
    static testMethod void testparseAttributes() {
        PPPayError err = new PPPayError();
        Map<String, String> testMap = new Map<String, String>();
    	testMap.put('error(0).errorId', '520003');
    	testMap.put('error(0).domain', 'PLATFORM');
    	testMap.put('error(0).severity', 'Error');
    	testMap.put('error(0).category', 'Application');
    	testMap.put('error(0).message', 'Username/Password is incorrect');
    	testMap.put('error(0).exceptionID', '23343');
    	testMap.put('error(0).subdomain', 'sub domain');
    	testMap.put('receiver(0).primary', 'false');
    	testMap.put('receiver(0).amount', '100');
    	testMap.put('receiver(0).email', 'sonali@persistent.co.in');
    	err.parseAttributes(testMap, 'error(0).', 'receiver(0).');
    	
    	// Assertion
    	System.assert(err.Error.Category.equals('Application'));
        System.assert(err.Error.Domain.equals('PLATFORM'));
        System.assert(err.Error.ErrorId == 520003);
        System.assert(err.Error.ExceptionId.equals('23343'));
        System.assert(err.Error.Severity.equals('Error'));
        System.assert(err.Error.Subdomain.equals('sub domain'));
        System.assert(err.Error.Message.equals('Username/Password is incorrect'));
        System.assert(err.Receiver.Amount == 100);
        System.assert(err.Receiver.Email.equals('sonali@persistent.co.in'));
        System.assert(err.Receiver.Primary == false);
    }
    
    static testMethod void testparseAttributesOne() {
         PPPayError err = new PPPayError();
        Map<String, String> testMap = new Map<String, String>();
    	testMap.put('error(0).errorId', '520003');
    	testMap.put('error(0).domain', 'PLATFORM');
    	testMap.put('error(0).severity', 'Error');
    	testMap.put('error(0).category', 'Application');
    	testMap.put('error(0).message', 'Username/Password is incorrect');
    	testMap.put('error(0).exceptionID', '23343');
    	testMap.put('error(0).subdomain', 'sub domain');
    	testMap.put('receiver(0).primary', 'true');
    	testMap.put('receiver(0).amount', '100');
    	testMap.put('receiver(0).email', 'sonali@persistent.co.in');
    	err.parseAttributes(testMap, 'error(0).', 'receiver(0).');
    	
    	// Assertion
    	System.assert(err.Error.Category.equals('Application'));
        System.assert(err.Error.Domain.equals('PLATFORM'));
        System.assert(err.Error.ErrorId == 520003);
        System.assert(err.Error.ExceptionId.equals('23343'));
        System.assert(err.Error.Severity.equals('Error'));
        System.assert(err.Error.Subdomain.equals('sub domain'));
        System.assert(err.Error.Message.equals('Username/Password is incorrect'));
        System.assert(err.Receiver.Amount == 100);
        System.assert(err.Receiver.Email.equals('sonali@persistent.co.in'));
        System.assert(err.Receiver.Primary == true);
    }       

}