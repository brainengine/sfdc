@isTest
private class PPBusinessInfoTest {
    static testMethod void populateAttribsTest() {
    	PPBusinessInfo businessInfo = new PPBusinessInfo();
    	businessInfo.BusinessAddress = 'My business address'; 
		businessInfo.BusinessName = 'My business name'; 
		businessInfo.Category = 21; 
		businessInfo.SubCategory = 31; 
		businessInfo.Workphone = '+919975205275';    
			
    	Map<String, String> attributeMap = new Map<String, String>();
    	businessInfo.populateAttributes(attributeMap);
		
	    String tag = PPStaticRes.BUSINESS + PPStaticRes.DOT;
	
		System.assert(attributeMap.containsKey(tag + PPStaticRes.BUSINESS_ADDRESS));    
        System.assert(attributeMap.get(tag + PPStaticRes.BUSINESS_ADDRESS) == 'My business address');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.BUSINESS_NAME));    
        System.assert(attributeMap.get(tag + PPStaticRes.BUSINESS_NAME) == 'My business name');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.BUSINESS_CATEGORY));    
        System.assert(attributeMap.get(tag + PPStaticRes.BUSINESS_CATEGORY) == '21');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.BUSINESS_SUBCATEGORY));    
        System.assert(attributeMap.get(tag + PPStaticRes.BUSINESS_SUBCATEGORY) == '31');
		System.assert(attributeMap.containsKey(tag + PPStaticRes.WORK_PHONE));    
        System.assert(attributeMap.get(tag + PPStaticRes.WORK_PHONE) == '+919975205275');
    }

}