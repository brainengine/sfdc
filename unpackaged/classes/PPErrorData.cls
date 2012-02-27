global class PPErrorData {
    // The location where the error occurred.
	global String Category {get; set;}

    // The domain to which this service belongs.
    global String Domain {get; set;}
    
    // A number that uniquely identifies a particular error.
    global Long ErrorId {get; set;}
    
    // This field is not used.
    global String ExceptionId {get; set;}
    
    // A description of the errorId.
    global String Message {get; set;}
    
    // Represents contextual information about the error encountered
    global List<String> Parameter {get; set;}
    
    // The severity of the error encountered.
	global String Severity {get; set;}
	
    // This field is not used.
    global String Subdomain {get; set;}

	// Constructor
    global PPErrorData(){
    	Parameter = new List<String>();
    	Category = '';
    	Domain = '';
    	ErrorId = 0;
    	ExceptionId = '';
    	Message = '';
    	Severity = '';
    	Subdomain = '';
    }

    public void parseAttributes(Map<String, String> errorMap, String errorTag) {
		String tag = errorTag + PPStaticRes.CATEGORY;
		if (errorMap.containsKey(tag))
			Category = errorMap.remove(tag);
			
        tag = errorTag + PPStaticRes.DOMAIN;
        if (errorMap.containsKey(tag))
        	Domain = errorMap.remove(tag);
        	
        tag = errorTag + PPStaticRes.ERROR_ID;
        if (errorMap.containsKey(tag)){
        	String id = errorMap.remove(tag);
			ErrorId = Long.valueof(id);
        }	

        tag = errorTag + PPStaticRes.EXCEPTION_ID;
        if (errorMap.containsKey(tag))
        	ExceptionId = errorMap.remove(tag);
        	
        tag = errorTag + PPStaticRes.MESSAGE;
        if (errorMap.containsKey(tag))
        	Message = errorMap.remove(tag);
        	
        Map<String, String> parameterMap = PPUtils.getMapWithSpecificKeys(errorMap, errorTag + PPStaticRes.PARAMETER);
        Parameter = parameterMap.Values();
        	
        tag = errorTag + PPStaticRes.SEVERITY;
        if (errorMap.containsKey(tag))
        	Severity  = errorMap.remove(tag);
        	
        tag = errorTag + PPStaticRes.SUBDOMAIN;
        if (errorMap.containsKey(tag))
        	Subdomain = errorMap.remove(tag);
	}
}