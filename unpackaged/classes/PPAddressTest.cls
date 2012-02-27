@isTest
private class PPAddressTest {
    static testMethod void populateAttribsTest() {
    	PPAddress address = new PPAddress();
		address.Line1 = 'IT Park'; 
		address.Line2 = 'Parsodi'; 
		address.City = 'Nagpur'; 
		address.State = 'Maharashtra'; 
		address.PostalCode = '440022'; 
		address.CountryCode = '+91';
					
    	Map<String, String> attributeMap = new Map<String, String>();
    	address.populateAttributes(attributeMap);
		
	    String tag = PPStaticRes.ADDRESS + PPStaticRes.DOT;
		System.assert(attributeMap.containsKey(tag + PPStaticRes.ADDRESS_LINE_ONE));    
        System.assert(attributeMap.get(tag + PPStaticRes.ADDRESS_LINE_ONE) == 'IT Park');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.ADDRESS_LINE_TWO));    
        System.assert(attributeMap.get(tag + PPStaticRes.ADDRESS_LINE_TWO) == 'Parsodi');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.ADDRESS_LINE_CITY));    
        System.assert(attributeMap.get(tag + PPStaticRes.ADDRESS_LINE_CITY) == 'Nagpur');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.ADDRESS_LINE_STATE));    
        System.assert(attributeMap.get(tag + PPStaticRes.ADDRESS_LINE_STATE) == 'Maharashtra');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.ADDRESS_LINE_POSTAL_CODE));    
        System.assert(attributeMap.get(tag + PPStaticRes.ADDRESS_LINE_POSTAL_CODE) == '440022');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.ADDRESS_COUNTRY_CODE));    
        System.assert(attributeMap.get(tag + PPStaticRes.ADDRESS_COUNTRY_CODE) == '+91');
    }
}