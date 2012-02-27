global class PPConvertCurrencyResponse extends PPResponse {
 	// The list of converted currencies.
 	global List<PPCurrencyConversion> EstimatedAmountTable {get; set;} 
 	
 	// Constructor
 	global PPConvertCurrencyResponse() {
 		EstimatedAmountTable = new List<PPCurrencyConversion>();
 	}
 	
 	global override PPResponseEnvelope getResponseEnvelope() {
    	return ResponseEnvelope;
    }
    
    public override void parseResponseParameters(map<String, String> parameters) {
    	super.parseCommonParams(Parameters);
    	map<String, String> currencyConversionMap = null;
    	Integer currencyConversionNo = 0;
    	Boolean isMoreInfo = true;
		while (isMoreInfo) {
			String currencyConversioTag = PPStaticRes.ESTIMATED_AMOUNT_TABLE + PPStaticRes.DOT + PPStaticRes.CURRENCY_CONVERSION_LIST + PPStaticRes.OPENING_BRACKET + currencyConversionNo + PPStaticRes.CLOSING_BRACKET + PPStaticRes.DOT;
			currencyConversionMap = PPUtils.getMapWithSpecificKeys(Parameters, currencyConversioTag);
			if (Null != currencyConversionMap && 0 != currencyConversionMap.size()) {
				PPCurrencyConversion currencyConversion = new PPCurrencyConversion();
				currencyConversion.parseAttributes(currencyConversionMap, currencyConversioTag);
				EstimatedAmountTable.add(currencyConversion);
				currencyConversionNo++;
			} 
			else {
				isMoreInfo = false;
			}
		}
    }
}