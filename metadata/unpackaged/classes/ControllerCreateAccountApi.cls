public class ControllerCreateAccountApi {
    
    public String MainMessage									{get;set;}
    public string SuccessMessage					{get;set;}
    public String CommonParametersObjName			{get;set;}
    public String APICredentialObjName				{get;set;}
    
    public PPAddress Address 				 					{get;set;}
    public PPBusinessInfo BusinessInfo	 						{get;set;}
    public PPCreateAccountWebOptions CreateAccountWebOptions 	{get;set;}
    public PPName NameInfo 										{get;set;}
    public String DateOfBirth 									{get;set;}
    
    public PPCreateAccountRequest CreateAccountRequest			{get;set;}
    public PPCreateAccountResponse CreateAccountResponse		{get;set;}
    public PPResponseEnvelope respEnvp							{get;set;}
    
    public Boolean isDisplay									{get;set;}
    public PPResponseEnvelope ResponseEnvelope					{get;set;}
    public Boolean isErr										{get;set;}
     
    public ControllerCreateAccountApi (){
       
        CreateAccountResponse = new PPCreateAccountResponse();
        BusinessInfo = new PPBusinessInfo();
        createAccountWebOptions = new PPCreateAccountWebOptions();
        NameInfo = new PPName();
        Address = new PPAddress();
    }
       
    public Pagereference apply(){
        MainMessage = '';
        isDisplay = false;  
        isErr = false ;
        Pagereference page = null;
           
        CreateAccountRequest = new PPCreateAccountRequest(CommonParametersObjName);
        // create the Adaptive Toolkit object instance w/ API Credentials
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit(APICredentialObjName);
        
        CreateAccountRequest.BusinessInfo = BusinessInfo;
        CreateAccountRequest.CreateAccountWebOptions = CreateAccountWebOptions;
        CreateAccountRequest.NameInfo = NameInfo;
        CreateAccountRequest.Address = Address;
        
        String[] arr = DateOfBirth.split('/',-1);
        try {
	    	CreateAccountRequest.DateOfBirth = DateTime.newInstance(Integer.valueOf(arr[2]),Integer.valueOf(arr[1]),Integer.valueOf(arr[0]));
	    }catch(System.Exception e){ }
	    
        try {
        	System.Debug(Logginglevel.INFO, '==>Request' + CreateAccountRequest);
            CreateAccountResponse = toolkit.CreateAccount(CreateAccountRequest);
            System.Debug(Logginglevel.INFO, '==>response' + CreateAccountResponse);
            respEnvp = CreateAccountResponse.getResponseEnvelope();
            isDisplay = true;
            if (0 == CreateAccountResponse.RedirectURL.length() && 
            	0 < CreateAccountResponse.CreateAccountKey.length())
            	MainMessage = 'Default "Registration Type" is set to "Mobile".' + 
            					' Please specify "Registration Type" explicitly';
            else {
            	//page = new Pagereference(CreateAccountResponse.RedirectURL);
            	SuccessMessage = 'Temporary Account created - click url to complete the account registration ' 
            	+ '<a href="' + CreateAccountResponse.RedirectURL + '">'
            	+ CreateAccountResponse.RedirectURL + '</a>'; 
            }
        }catch (PPFaultMessageException ex) {
           	System.debug('PPFaultMessageException =>' + ex);
            respEnvp = ex.ResponseEnvelope;
            isErr = true ;
            List<PPErrorData> errlist = ex.ErrorList;
            for( PPErrorData err: errList ){
            	MainMessage += err.ErrorId + ' : ' + err.Message +'<br>';
            }
        }catch(System.Exception e){
        	MainMessage = e.getmessage();
        }   
       	return page;
	}
    
    
}