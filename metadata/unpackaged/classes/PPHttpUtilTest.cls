@isTest 
private class PPHttpUtilTest {
    static testMethod void testPPHttpUtil() {
        PPHttpUtil httpUtil = new PPHttpUtil();
        Map<String, String> headers = new Map<String, String>();
        headers.put('key1', 'value1');
        headers.put('key2', 'value2');
        headers.put('HEADER1', 'VALUE');
        httpUtil.createHttpRequest('http://google.com', 'POST', headers , 'body');
        httpUtil.setCertificate('', '');
        
        // Asserttion
        System.assert(httpUtil.getEndPoint() == 'http://google.com');
        System.assert(httpUtil.getMethod() == 'POST');
        System.assert(httpUtil.getHeader('key1') == 'value1');
        System.assert(httpUtil.getHeader('key2') == 'value2');
        System.assert(httpUtil.getBody() == 'body');
      
        httpUtil.execute();
    } 
}