public class ControllerGetUserAgreementApi {
	
	public PPGetUserAgreementRequest GetUserAgreementRequest 	{get;set;}
	public PPGetUserAgreementResponse GetUserAgreementResponse	{get;set;}
	public String CommonParametersObjName			{get;set;}
    public String APICredentialObjName				{get;set;}
	public String MainMessage									{get;set;}
	
	public String Userid										{get;set;}
    public String Password										{get;set;}
    public String Certificate									{get;set;}
    public String CertificatePassword							{get;set;}
    public String Signature										{get;set;}
    public String ApplicationId									{get;set;}
    public String DeviceId										{get;set;}
    public String DeviceIpAddress								{get;set;}
	public String Subject                           			{get;set;}
	
	public String ErrorLanguage									{get;set;}
    public String DetailLevel 									{get;set;}
	
    public String Environment									{get;set;}
	public PPResponseEnvelope respEnvp 							{get;set;}
	public Boolean isDisplay 									{get;set;}
	public Boolean isErr 										{get;set;}
	
	public ControllerGetUserAgreementApi(){
		GetUserAgreementRequest = new PPGetUserAgreementRequest();
		GetUserAgreementResponse = new PPGetUserAgreementResponse();
			
	}

	public String AuthenticationMethod{get;set;}
    public List<SelectOption> getSelectAuthentication(){
        List<selectoption> options = new List<selectoption>();
        options.add(new Selectoption('Cetificate','Certificate'));
        options.add(new Selectoption('Threetoken','ThreeToken'));
        return options;
    }
    
    public List<SelectOption> getSelectEnvironment(){
        List<selectoption> options = new List<selectoption>();
        options.add(new Selectoption('SANDBOX','SANDBOX'));
        options.add(new Selectoption('BETA-SANDBOX','BETA-SANDBOX'));
        options.add(new Selectoption('PRODUCTION','PRODUCTION'));
        return options;
    }
	
	public Pagereference apply(){
		MainMessage = '';
		isDisplay = false;
		isErr = false;
		Pagereference page = null;
		GetUserAgreementRequest.setRequestEnvelopeParams(ErrorLanguage, DetailLevel);
           
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit();
        setBaseAPIProfile(toolkit);
        
        try {
        	System.Debug(Logginglevel.INFO, '==>Request' + GetUserAgreementRequest);
            GetUserAgreementResponse = toolkit.getUserAgreement(GetUserAgreementRequest);
            System.Debug(Logginglevel.INFO, '==>response' + GetUserAgreementResponse);
            respEnvp = GetUserAgreementResponse.getResponseEnvelope();
            isDisplay = true;
            
        }catch (PPFaultMessageException ex) {
           	System.debug('PPFaultMessageException =>' + ex);
            respEnvp = ex.ResponseEnvelope;
            isErr = true ;
            List<PPErrorData> errlist = ex.ErrorList;
            for( PPErrorData err: errList ){
            	MainMessage += err.ErrorId + ' : ' + err.Message + '<br>';
            }
        }catch(System.Exception e){
        	MainMessage = e.getmessage();
        }   
		
		return page;
	}
	
	public void setBaseAPIProfile(PPAdaptiveToolkit toolkit) {
        PPBaseAPIProfile baseProfile = new PPBaseAPIProfile();
        baseProfile.APIUsername = Userid;       
        baseProfile.APIPassword = Password;     
        baseProfile.APISignature = Signature;       
        baseProfile.AdaptiveService = PPBaseAPIProfile.ServiceType.SERVICE_TYPE_ACCOUNT;
        baseProfile.ApplicationID = ApplicationId;
        baseProfile.DeviceIPAddress = DeviceIpAddress;
        baseProfile.DeviceId = DeviceId;
        baseProfile.Subject = Subject;
      
        Document d; 
        if(AuthenticationMethod=='Cetificate'){
            baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_CERTIFICATE;
            String cert = '';
            try{
                d = [Select d.Body From Document d where name = :Certificate];
                cert = EncodingUtil.base64Encode(d.Body);
            }catch(Exception e){ }
            baseProfile.Certificate = cert;
            baseProfile.CertificatePassword = CertificatePassword;
        }
        else if(AuthenticationMethod=='Threetoken'){
            baseProfile.APIProfile = PPBaseAPIProfile.APIProfileType.PROFILE_TYPE_THREE_TOKEN;
    	}
    	
    	if(Environment=='SANDBOX'){
    		baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX;
    	}
    	else if (Environment == 'BETA-SANDBOX') {
    		baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_SANDBOX_BETA;
    	}
    	else
    		baseProfile.Environment = PPBaseAPIProfile.EnvironmentType.ENVIRONMENT_TYPE_PRODUCTION;
    		    		
        toolkit.BaseAPIProfile = baseProfile;
    }
}