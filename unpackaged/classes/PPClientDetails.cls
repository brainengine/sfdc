global class PPClientDetails {    
    // (Optional) Sender's IP address.
    global String IpAddress {get; set;}
 
    // (Optional) Sender's device ID, such as a mobile device's IMEI number 
	// or a web browser cookie.
    global String DeviceId {get;  set;}
    
    // (Optional) Your application's identification, such as the name of your 
    // application.
    global String ApplicationId {get; set;}
    
    // (Optional) Sender's geographic location.
    global String GeoLocation {get; set;}
    
    // (Optional) Your identification of the type of customer.
    global String CustomerType {get; set;}
    
    // (Optional) Your organization's name or ID.
    global String PartnerName {get; set;}
    
    // (Optional) Your ID for this sender.
    global String CustomerId {get; set;}
    
    // (Optional) A sub-identification of the application.
    global String Model {get; set;}
    
 	// Constructor
    global PPClientDetails() {
        IpAddress = '';
        DeviceId = '';
        ApplicationId = '';
        GeoLocation = '';
        CustomerType = '';
        PartnerName = '';
        CustomerId = '';
        Model = '';
    }
    
    public void populateAttributes(Map<String, String> clientDetailsParams) {
    	if (Null != clientDetailsParams) {
	    	String tag = PPStaticRes.CLIENT_DETAILS + PPStaticRes.DOT;
	    	if (Null != IpAddress && 0 != IpAddress.length())
				clientDetailsParams.put(tag + PPStaticRes.IP_ADDRESS, IpAddress);
					
			if (Null != DeviceId && 0 != DeviceId.length())
				clientDetailsParams.put(tag + PPStaticRes.DEVICE_ID, DeviceId);
				
			if (Null != ApplicationId && 0 != ApplicationId.length())
				clientDetailsParams.put(tag + PPStaticRes.APPLICATION_ID, ApplicationId);
				
			if (Null != GeoLocation && 0 != GeoLocation.length())
				clientDetailsParams.put(tag + PPStaticRes.GEO_LOCATION, GeoLocation);
				
			if (Null != CustomerType && 0 != CustomerType.length())
				clientDetailsParams.put(tag + PPStaticRes.CUSTOMER_TYPE, CustomerType);
				
			if (Null != PartnerName && 0 != PartnerName.length())
				clientDetailsParams.put(tag + PPStaticRes.PARTNER_NAME, PartnerName);
				
			if (Null != CustomerId && 0 != CustomerId.length())
				clientDetailsParams.put(tag + PPStaticRes.CUSTOMER_ID, CustomerId);
				
			if (Null != Model && 0 != Model.length())
				clientDetailsParams.put(tag + PPStaticRes.Model, Model);
    	}
    }
}