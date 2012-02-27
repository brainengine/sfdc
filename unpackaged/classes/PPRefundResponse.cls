global class PPRefundResponse extends PPResponse {
	// The currency code.
	global String CurrencyCode {get; set;}
	
	// List of refunds associated with the payment.
	global List<PPRefundInfo> RefundInfoList {get; set;}
	
	// Construtor
	global PPRefundResponse () {
		RefundInfoList = new List<PPRefundInfo>();
		CurrencyCode = '';
	}

    global override PPResponseEnvelope getResponseEnvelope() {
    	return ResponseEnvelope;
    }

    public override void parseResponseParameters(Map<String, String> parameters) {
    	try {
    		super.parseCommonParams(Parameters);
			
			if (parameters.containsKey(PPStaticRes.CURRENCY_CODE))
    	 		CurrencyCode = parameters.remove(PPStaticRes.CURRENCY_CODE);
    	 	
    	 	Map<String, String> refundInfoMap = null;
    		Integer refundInfoNo = 0;
    		Boolean isMoreInfo = true;
    		while (isMoreInfo) {
				String refundInfoTag = PPStaticRes.REFUND_INFO_LIST + PPStaticRes.DOT + PPStaticRes.REFUND_INFO + PPStaticRes.OPENING_BRACKET + refundInfoNo + PPStaticRes.CLOSING_BRACKET + PPStaticRes.DOT;
				refundInfoMap = PPUtils.getMapWithSpecificKeys(parameters, refundInfoTag);
				if (Null != refundInfoMap && 0 != refundInfoMap.size()) {
					PPRefundInfo refundInfo = new PPRefundInfo();
					refundInfo.parseAttributes(refundInfoMap, refundInfoTag);
					RefundInfoList.add(refundInfo);
					refundInfoNo++;
				} 
				else {
					isMoreInfo = false;
				}
    		}
    	}
    	catch (System.Exception e) {
    		System.Debug(Logginglevel.ERROR, 'PPRefundResponse:parseResponseParameters() : ' + e);
    	}
    }

}