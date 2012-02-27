global class PPName {
	// (Optional) A salutation for the account user.
	global String Salutation {get; set;} 
	
	// (Required) First name of the account user.
	global String FirstName {get; set;} 
	
	// (Optional) Middle name of the account user.
	global String MiddleName {get; set;} 
	
	// (Required) Last name of the account user.
	global String LastName {get; set;}
	 
	// (Optional) A suffix for the account user.
	global String Suffix {get; set;} 

	// Constructor
	global PPName() {
		Salutation = ''; 
		FirstName = ''; 
		MiddleName = ''; 
		LastName = ''; 
		Suffix = ''; 
	}

    public void populateAttributes(Map<String, String> nameAttributes) {
    	if (Null != nameAttributes) {
	    	String tag = PPStaticRes.NAME + PPStaticRes.DOT;

	    	if (Null != Salutation && 0 != Salutation.length())
				nameAttributes.put(tag + PPStaticRes.SALUTATION, Salutation);
					
			if (Null != FirstName && 0 != FirstName.length())
				nameAttributes.put(tag + PPStaticRes.FIRST_NAME, FirstName);
				
			if (Null != MiddleName && 0 != MiddleName.length())
				nameAttributes.put(tag + PPStaticRes.MIDDLE_NAME, MiddleName);
				
			if (Null != LastName && 0 != LastName.length())
				nameAttributes.put(tag + PPStaticRes.LAST_NAME, LastName);
				
			if (Null != Suffix && 0 != Suffix.length())
				nameAttributes.put(tag + PPStaticRes.SUFFIX, Suffix);
    	}
    }
}