global class PPCurrencyType {
	//(Required) The amount to be converted.
	global Decimal Amount {get; set;}
	
	//(Required) The currency code.
	global String Code{get; set;} 
	
	// Constructor
	global PPCurrencyType() {
		Code = '';
		Amount = -1;
	}
	
	public void populateAttributes(Map<String, String> currencyTypeParams, String currencyTag) {
    	if (Null != currencyTypeParams) {
    		if (-1 != Amount) 
    			currencyTypeParams.put(currencyTag + 'amount', String.valueOf(Amount));
    		if (Null != Code && 0 != Code.length())
    			currencyTypeParams.put(currencyTag + 'code', Code);
    	}
	}
	
	public void parseAttributes(Map<String, String> currencyTypeMap, String currencyTypeTag) {
		String tag = currencyTypeTag + PPStaticRes.AMOUNT ;
		if (currencyTypeMap.containsKey(tag)) {
        	String amountStr = currencyTypeMap.remove(tag);
        	if (Null != amountStr)
            	Amount = Decimal.valueOf(amountStr);
        }
        
        tag = currencyTypeTag + 'code' ;
        if (currencyTypeMap.containsKey(tag))
        Code = currencyTypeMap.remove(tag);
	}
}