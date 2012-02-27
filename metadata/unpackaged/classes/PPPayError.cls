global class PPPayError {
    // Receiver is the party where funds are transferred to. A primary 
    // receiver receives a payment directly from the sender in a chained 
    // split payment. A primary receiver should not be specified when 
    // making a single or parallel split payment.
    global PPReceiver Receiver { get; set; }
    
    // Detailed error information.
	global PPErrorData Error { get; set; }

	// Constructor
    global PPPayError() {
        Error = new PPErrorData();
        receiver = new PPReceiver();
    }
    
    public void parseAttributes(Map<String, String> errorMap, String errorTag, String receiverTag) {
    	Error.parseAttributes(errorMap, errorTag);
    	receiver.parseAttributes(errorMap, receiverTag);
    }
}