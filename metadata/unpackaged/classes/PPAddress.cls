global class PPAddress {
	// (Required) The street address.
	global String Line1 {get; set;}
	
	// (Optional) The second line of the address.
	global String Line2 {get; set;}
	
	// (Required) The city.
	global String City {get; set;} 
	
	// (Optional) The state code.
	global String State {get; set;}
	
	// (Optional) The zip or postal code.
	global String PostalCode {get; set;} 
	
	// (Required) The country code. Allowable values are:
	global String CountryCode {get; set;} 

	// Constructor
	global PPAddress() {
		Line1 = ''; 
		Line2 = ''; 
		City = ''; 
		State = ''; 
		PostalCode = ''; 
		CountryCode = '';
	}

    public void populateAttributes(Map<String, String> attributesMap) {
    	if (Null != attributesMap) {
	    	String tag = PPStaticRes.ADDRESS + PPStaticRes.DOT;

	    	if (Null != Line1 && 0 != Line1.length())
				attributesMap.put(tag + PPStaticRes.ADDRESS_LINE_ONE, Line1);
					
			if (Null != Line2 && 0 != Line2.length())
				attributesMap.put(tag + PPStaticRes.ADDRESS_LINE_TWO, Line2);

			if (Null != City && 0 != City.length())
				attributesMap.put(tag + PPStaticRes.ADDRESS_LINE_CITY, City);

			if (Null != State && 0 != State.length())
				attributesMap.put(tag + PPStaticRes.ADDRESS_LINE_STATE, State);

			if (Null != PostalCode && 0 != PostalCode.length())
				attributesMap.put(tag + PPStaticRes.ADDRESS_LINE_POSTAL_CODE, PostalCode);

			if (Null != CountryCode && 0 != CountryCode.length())
				attributesMap.put(tag + PPStaticRes.ADDRESS_COUNTRY_CODE, CountryCode);
    	}
    }
}