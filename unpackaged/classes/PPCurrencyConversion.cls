global class PPCurrencyConversion {
	// The original currency to be converted.
	global PPCurrencyType BaseAmount {get; set;} 
	
	// The list of currencies to be converted.
	global List<PPCurrencyType> CurrencyList {get; set;} 
	
	// Constructor
	global PPCurrencyConversion() {
		BaseAmount = new PPCurrencyType();
		CurrencyList = new List<PPCurrencyType>();
	}
	
	public void parseAttributes(map<String, String> currencyConversionMap, String currencyConversioTag) {
		BaseAmount.parseAttributes(currencyConversionMap, currencyConversioTag + PPStaticRes.BASE_AMOUNT + PPStaticRes.DOT);
		
		map<String, String> currencyTypeMap = null;
    	Integer currencyTypeNo = 0;
    	Boolean isMoreInfo = true;
		while (isMoreInfo) {
			String currencyTypeTag = currencyConversioTag + PPStaticRes.CURRENCY_LIST  + PPStaticRes.DOT + PPStaticRes.CURRENCY_STR +  PPStaticRes.OPENING_BRACKET + currencyTypeNo + PPStaticRes.CLOSING_BRACKET + PPStaticRes.DOT;
			currencyTypeMap = PPUtils.getMapWithSpecificKeys(currencyConversionMap, currencyTypeTag);
			if (Null != currencyTypeMap && 0 != currencyTypeMap.size()) {
				PPCurrencyType currencyType = new PPCurrencyType();
				currencyType.parseAttributes(currencyTypeMap, currencyTypeTag);
				CurrencyList.add(currencyType);
				currencyTypeNo++;
			} 
			else {
				isMoreInfo = false;
			}
		}
		
	}
}