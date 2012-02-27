@isTest 
private class PPErrorDataTest {
    static testMethod void testparseAttributes() {
        PPErrorData error = new PPErrorData();
        Map<String, String> testMap = new Map<String, String>();
    	testMap.put('error(0).errorId', '520003');
    	testMap.put('error(0).domain', 'PLATFORM');
    	testMap.put('error(0).severity', 'Error');
    	testMap.put('error(0).category', 'Application');
    	testMap.put('error(0).message', 'Username/Password is incorrect');
    	testMap.put('error(0).exceptionID', '23343');
    	testMap.put('error(0).subdomain', 'sub domain');
        error.parseAttributes(testMap, 'error(0).');
        
        // Assertion
        System.assert(error.Category.equals('Application'));
        System.assert(error.Domain.equals('PLATFORM'));
        System.assert(error.ErrorId == 520003);
        System.assert(error.ExceptionId.equals('23343'));
        System.assert(error.Severity.equals('Error'));
        System.assert(error.Subdomain.equals('sub domain'));
        System.assert(error.Message.equals('Username/Password is incorrect'));
    }
}