global class PPRefundInfo {
	// Information about the receiver of the refund.
	global PPReceiver Receiver {get; set;}
	
	// Information about why a refund failed.
	global List<PPErrorData> ErrorList {get; set;}
	
	// Status of the refund.
	global String RefundStatus {get; set;}
	
	// The total amount of the refund from this receiver.
	global Decimal RefundNetAmount {get; set;}
	
	// Amount of fees that have been refunded.
	global Decimal RefundFeeAmount {get; set;}
	
	// Gross amount of the refund, including the total amount from this 
	// receiver and fees.
	global Decimal RefundGrossAmount {get; set;}
	
	// The total of all refunds actually paid. It does not include pending 
	// amounts.
	global Decimal TotalOfAllRefunds {get; set;}
	
	// Whether you have refunded the total amount of the payment.
	global Boolean RefundHasBecomeFull {get; set;}
	
	// The PayPal transaction ID for this refund.
	global String EncryptedRefundTransactionId {get; set;}
	
	// The status of the refund transaction.
	global String RefundTransactionStatus {get; set;}
	
	// Constructor
	global PPRefundInfo() {
		Receiver = new PPReceiver();
		ErrorList = new List<PPErrorData>();
		RefundNetAmount = 0.0;   				
		RefundFeeAmount = 0.0; 				
		RefundGrossAmount = 0.0; 				
		TotalOfAllRefunds = 0.0; 				
		RefundHasBecomeFull = false;
		EncryptedRefundTransactionId = '';
		RefundTransactionStatus = '';
		RefundStatus = '';		
	} 
	
	public void parseAttributes(Map<String, String> refundInfoMap, String refundInfoTag) {
    	Receiver.parseAttributes(refundInfoMap, refundInfoTag + PPStaticRes.RECEIVER + PPStaticRes.DOT);
        
        Integer index = 0;
    	Boolean isMoreError = true;
    	while (isMoreError) {
			String errortag = refundInfoTag + PPStaticRes.ERROR + PPStaticRes.OPENING_BRACKET + index + PPStaticRes.CLOSING_BRACKET + PPStaticRes.DOT;
			Map<String, String> errorMap = null;
			errorMap = PPUtils.getMapWithSpecificKeys(refundInfoMap, errortag);
			if (Null != errorMap && 0 != errorMap.size()) {
				PPErrorData error = new PPErrorData();
				error.parseAttributes(errorMap, errorTag);
				ErrorList.add(error);
				index++;
			} 
			else {
				isMoreError = false;
			}
    	}
        
        // PPRefundInfo.RefundStatus
        String tag = refundInfoTag + PPStaticRes.REFUND_STATUS;
        if (refundInfoMap.containsKey(tag))
        	RefundStatus = refundInfoMap.remove(tag);
        	
		// PPRefundInfo.RefundNetAmount
        tag = refundInfoTag + PPStaticRes.REFUND_NET_AMOUNT;
        if (refundInfoMap.containsKey(tag)) {
        	String netAmount = refundInfoMap.remove(tag);
        	if (Null != netAmount)
            	RefundNetAmount = Decimal.valueOf(netAmount);
        }
        
		// PPRefundInfo.RefundFeeAmount
        tag = refundInfoTag + PPStaticRes.REFUND_FEE_AMOUNT;
        if (refundInfoMap.containsKey(tag)) {
        	String feeAmount = refundInfoMap.remove(tag);
        	if (Null != feeAmount)
            	RefundFeeAmount = Decimal.valueOf(feeAmount);
        }
        
		// PPRefundInfo.RefundGrossAmount
        tag = refundInfoTag + PPStaticRes.REFUND_GROSS_AMOUNT;
        if (refundInfoMap.containsKey(tag)) {
        	String grossAmount = refundInfoMap.remove(tag);
        	if (Null != grossAmount)
            	RefundGrossAmount = Decimal.valueOf(grossAmount);
        }
        
		// PPRefundInfo.TotalOfAllRefunds
        tag = refundInfoTag + PPStaticRes.TOTAL_OF_ALL_REFUNDS;
        if (refundInfoMap.containsKey(tag)) {
        	String totalRefundAmount = refundInfoMap.remove(tag);
        	if (Null != totalRefundAmount)
            	TotalOfAllRefunds = Decimal.valueOf(totalRefundAmount);
        }
        
		// PPRefundInfo.RefundHasBecomeFull
        tag = refundInfoTag + PPStaticRes.REFUND_HAS_BECOME_FULL;
        if (refundInfoMap.containsKey(tag)) {
        	String refundHasBecomeFullStr = refundInfoMap.remove(tag);
        	if (refundHasBecomeFullStr != null && refundHasBecomeFullStr.equalsIgnoreCase(PPStaticRes.STRING_TRUE))
        		RefundHasBecomeFull = true;
        	else
         		RefundHasBecomeFull = false;
        }

        tag = refundInfoTag + PPStaticRes.ENCRYPTED_REFUND_TRANSACTION_ID;
        if (refundInfoMap.containsKey(tag))
        	EncryptedRefundTransactionId = refundInfoMap.remove(tag);

        tag = refundInfoTag + PPStaticRes.REFUND_TRANSACTION_STATUS;
        if (refundInfoMap.containsKey(tag))
        	RefundTransactionStatus = refundInfoMap.remove(tag);
    }
}