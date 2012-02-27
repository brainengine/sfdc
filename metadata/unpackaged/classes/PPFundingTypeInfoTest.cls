@isTest 
private class PPFundingTypeInfoTest {
	static testMethod void testpopulateAttributes() {
		PPFundingTypeInfo fundingTypeInfo = new PPFundingTypeInfo();
		fundingTypeInfo.FundingType = 'ECHECK';
		Map<String, String> testMap = new Map<String, String>();
		fundingTypeInfo.populateAttributes(testMap, 'fundingTypeList.fundingTypeInfo(0).');
		
		//Assertion
		System.assert(testMap.get('fundingTypeList.fundingTypeInfo(0).fundingType') == 'ECHECK');
	}
	
	static testMethod void testparseAttributes() {
		Map<String, String> testMap = new Map<String, String>();
		testMap.put('fundingTypeList.fundingTypeInfo(0).fundingType', 'ECHECK');
		
		PPFundingTypeInfo fundingTypeInfo = new PPFundingTypeInfo();
		fundingTypeInfo.parseAttributes(testMap, 'fundingTypeList.fundingTypeInfo(0).');
		
		//Assertion
		System.assert(fundingTypeInfo.FundingType == 'ECHECK');
	}
	
}