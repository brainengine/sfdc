global class PPFundingTypeInfo {
	// (Required) Specifies a List of allowed funding selections for the 
	// payment. This is a List of funding selections that can be combined 
	// in any order to allow payments to use the indicated funding type. 
	// If this field is omitted, the payment can be funded by any funding 
	// type that is supported for Adaptive Payments.
	global String FundingType {get; set;}
	
	// Constructor
	global PPFundingTypeInfo() {
		FundingType = '';
	}
	
	public void populateAttributes(Map<String, String> fundingTypeInfoParams, String fundingTypeTag) {
		if (Null != FundingType && 0 != FundingType.length())
			fundingTypeInfoParams.put(fundingTypeTag + PPStaticRes.FUNDING_TYPE, FundingType);
	}
	
	public void parseAttributes(Map<String, String> fundingTypeInfoParams, String fundingTypeTag) {
		String tag = fundingTypeTag + PPStaticRes.FUNDING_TYPE;
	    if (fundingTypeInfoParams.containsKey(tag)) 
        	FundingType = fundingTypeInfoParams.get(tag);
	}	
}