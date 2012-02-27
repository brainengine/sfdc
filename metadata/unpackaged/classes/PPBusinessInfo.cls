global class PPBusinessInfo {
	// (Required) The address where the business.
	global String BusinessAddress {get; set;} 
	
	// (Required) The name of the business.
	global String BusinessName {get; set;} 
	
	// (Required) The category indicating the business.
	global Integer Category {get; set;} 
	
	// (Required) The subcategory for the business.
	global Integer SubCategory {get; set;} 
	
	// (Required) The telephonen number for the business.
	global String Workphone {get; set;} 

	// Constructor
	global PPBusinessInfo() {
		BusinessAddress = ''; 
		BusinessName = ''; 
		Category = -1; 
		SubCategory = -1; 
		Workphone = '';
	}
	
    public void populateAttributes(Map<String, String> attributesMap) {
    	if (Null != attributesMap) {

	    	String tag = PPStaticRes.BUSINESS + PPStaticRes.DOT;
	    	if (Null != BusinessAddress && 0 != BusinessAddress.length())
				attributesMap.put(tag + PPStaticRes.BUSINESS_ADDRESS, BusinessAddress);
					
			if (Null != BusinessName && 0 != BusinessName.length())
				attributesMap.put(tag + PPStaticRes.BUSINESS_NAME, BusinessName);
				
			if (Null != Category && -1 != Category) {
				String categoryString = Category.format();
				attributesMap.put(tag + PPStaticRes.BUSINESS_CATEGORY, categoryString);
			}

			if (Null != SubCategory && -1 != SubCategory) {
				String subCategoryString = SubCategory.format();
				attributesMap.put(tag + PPStaticRes.BUSINESS_SUBCATEGORY, subCategoryString);
			}
				
			if (Null != Workphone && 0 != Workphone.length())
				attributesMap.put(tag + PPStaticRes.WORK_PHONE, Workphone);
    	}
    }
}