@isTest 
private class PPClientDetailsTest {
    static testMethod void testpopulateAttributes() {
        PPClientDetails clientDetail = new PPClientDetails();
        clientDetail.applicationId = 'test cases';
        clientDetail.customerId = '123456';
        clientDetail.customerType = 'partner';
        clientDetail.deviceId = '2233';
        clientDetail.geoLocation = 'USA';
        clientDetail.partnerName = 'Persistent';
        clientDetail.ipAddress = '172.16.34.3';
        clientDetail.Model = 'Model';
        
        Map<String, String> clientDetailsParams = new Map<String, String>();
        clientDetail.populateAttributes(clientDetailsParams);
        
        // Assertion
        System.assert(clientDetailsParams.size() == 8);
        String tag = PPStaticRes.CLIENT_DETAILS + PPStaticRes.DOT;
        System.assert(clientDetailsParams.get(tag + PPStaticRes.APPLICATION_ID).equals('test cases'));
        System.assert(clientDetailsParams.get(tag + PPStaticRes.CUSTOMER_ID).equals('123456'));
        System.assert(clientDetailsParams.get(tag + PPStaticRes.CUSTOMER_TYPE).equals('partner'));
        System.assert(clientDetailsParams.get(tag + PPStaticRes.DEVICE_ID).equals('2233'));
        System.assert(clientDetailsParams.get(tag + PPStaticRes.GEO_LOCATION).equals('USA'));
        System.assert(clientDetailsParams.get(tag + PPStaticRes.PARTNER_NAME).equals('Persistent'));
        System.assert(clientDetailsParams.get(tag + PPStaticRes.IP_ADDRESS).equals('172.16.34.3'));
        System.assert(clientDetailsParams.get(tag + PPStaticRes.MODEL).equals('Model'));
    }
}