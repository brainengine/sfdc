global class PPConvertCurrencyRequest extends PPRequest {
	// (Required) A list of amounts with associated currencies to be converted.
	global List<PPCurrencyType> BaseAmountList {get; set;}
	
	// (Required) A list of currencies to convert to.
	global List<String> ConvertToCurrencyList {get; set;}
	
	// Constructor
	global PPConvertCurrencyRequest() {
		ApiName = PPStaticRes.CONVERT_CURRENCY_API;
		BaseAmountList = new List<PPCurrencyType>();
		ConvertToCurrencyList = new List<String>();
	}
	
	global override void setRequestEnvelopeParams(String language, String detailLevelCode) {
		super.setRequestEnvp(language, detailLevelCode);
	}
		
	public override void getRequestParams(map<String, String> requestParams) {
		if (Null != requestParams) {
			super.setCommonRequestParams(requestParams);
			Integer currencyCnt = 0;
            for (PPCurrencyType cur : BaseAmountList) {
            	String currencyTag = PPStaticRes.BASE_AMOUNT_LIST + PPStaticRes.DOT + PPStaticRes.CURRENCY_STR + PPStaticRes.OPENING_BRACKET + currencyCnt + PPStaticRes.CLOSING_BRACKET + PPStaticRes.DOT;
            	cur.populateAttributes(requestParams, currencyTag);
                currencyCnt++;
            }
            
            currencyCnt = 0;
            for (String currencyCode : ConvertToCurrencyList) {
                if (Null != currencyCode && 0 != currencyCode.length()) {
            		String currencyTag = PPStaticRes.CONVERT_TO_CURRENCY_LIST + PPStaticRes.DOT + PPStaticRes.CURRENCY_CODE + PPStaticRes.OPENING_BRACKET + currencyCnt + PPStaticRes.CLOSING_BRACKET;
                    requestParams.put(currencyTag, currencyCode);
                	currencyCnt++;
            	}
			}		
		}
    }
}