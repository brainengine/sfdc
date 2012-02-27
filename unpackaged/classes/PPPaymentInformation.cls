global class PPPaymentInformation {
	// PayPal transaction ID for this payment to the specified receiver.
	global String TransactionId {get; set;}
	
	// PayPal transaction status.
	global String TransactionStatus {get; set;}
	
	// The receiver of the payment.
	global PPReceiver Receiver {get; set;}
	
	// The total amount refunded for this payment since the payment occurred.
	global Decimal RefundedAmount {get; set;}
	
	// Whether the payment has a pending refund.
	global Boolean PendingRefund {get; set;}
	
	// The status of the sender of the payment.
	global String SenderTransactionStatus {get; set;}
	
	// The identification number of the sender of the payment.
	global String SenderTransactionID {get; set;}
	
	// Constructor
	global PPPaymentInformation() {
		Receiver = new PPReceiver();
		TransactionId = '';
		TransactionStatus = '';
		RefundedAmount = 0;
		PendingRefund = Null;
		SenderTransactionStatus = '';
		SenderTransactionID = '';
	}
	
	public void parseAttributes(Map<String, String> paymentInfoMap, String paymentInfoTag) {
    	Receiver.parseAttributes(paymentInfoMap, paymentInfoTag + PPStaticRes.RECEIVER + PPStaticRes.DOT);
    	
      	String tag = paymentInfoTag + PPStaticRes.TRANSACTION_ID;
        if (paymentInfoMap.containsKey(tag))
        	TransactionId = paymentInfoMap.remove(tag);
        
        tag = paymentInfoTag + PPStaticRes.TRANSACTION_STATUS;
       	if (paymentInfoMap.containsKey(tag))
        	TransactionStatus = paymentInfoMap.remove(tag);
        
        tag = paymentInfoTag + PPStaticRes.REFUNDED_AMOUNT;
        if (paymentInfoMap.containsKey(tag)) {
        	String refundedAmountStr = paymentInfoMap.remove(tag);
        	if (Null != refundedAmountStr)
            	RefundedAmount = Decimal.valueOf(refundedAmountStr);
        }
        
        tag = paymentInfoTag + PPStaticRes.PENDING_REFUND;
        if (paymentInfoMap.containsKey(tag)) {
        	String pendingRefundStr = paymentInfoMap.remove(tag);
        	if (pendingRefundStr != null && pendingRefundStr.equalsIgnoreCase(PPStaticRes.STRING_TRUE))
        		PendingRefund = true;
        	else
         		PendingRefund = false;
        }
        tag = paymentInfoTag + PPStaticRes.SENDER_TRANSACTION_STATUS;
        if (paymentInfoMap.containsKey(tag))
        	SenderTransactionStatus = paymentInfoMap.remove(tag);
        
        tag = paymentInfoTag + PPStaticRes.SENDER_TRANSACTION_ID;
        if (paymentInfoMap.containsKey(tag))
        	SenderTransactionID = paymentInfoMap.remove(tag);
    }
}