@isTest
private class PPNameTest {
    static testMethod void populateNameAttribsTest() {
    	PPName name = new PPName();
    	name.Salutation = 'Mr.'; 
		name.FirstName = 'James'; 
		name.MiddleName = 'k'; 
		name.LastName = 'Bond'; 
		name.Suffix = '007'; 
    	
    	Map<String, String> nameMap = new Map<String, String>();
    	name.populateAttributes(nameMap);
		
		// Assertion
	    String tag = PPStaticRes.NAME + PPStaticRes.DOT;
		System.assert(nameMap.containsKey(tag + PPStaticRes.SALUTATION));    
        System.assert(nameMap.get(tag + PPStaticRes.SALUTATION) == 'Mr.');
		System.assert(nameMap.containsKey(tag + PPStaticRes.FIRST_NAME));    
        System.assert(nameMap.get(tag + PPStaticRes.FIRST_NAME) == 'James');
		System.assert(nameMap.containsKey(tag + PPStaticRes.MIDDLE_NAME));    
        System.assert(nameMap.get(tag + PPStaticRes.MIDDLE_NAME) == 'k');
		System.assert(nameMap.containsKey(tag + PPStaticRes.LAST_NAME));    
        System.assert(nameMap.get(tag + PPStaticRes.LAST_NAME) == 'Bond');
		System.assert(nameMap.containsKey(tag + PPStaticRes.SUFFIX));    
        System.assert(nameMap.get(tag + PPStaticRes.SUFFIX) == '007');
    }
}