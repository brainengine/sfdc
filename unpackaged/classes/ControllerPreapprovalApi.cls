public class ControllerPreapprovalApi {
	
	
    public PPPreapprovalRequest PreapprovalRequest				{get;set;}
    public PPPreapprovalResponse PreapprovalResponse			{get;set;}
    public PPResponseEnvelope RespEnvp 							{get;set;}

	public String CommonParametersObjName			{get;set;}
    public String APICredentialObjName				{get;set;}
	public String MainMessage									{get;set;}	
	public string SuccessMessage								{get;set;}
	public String EndingDate 									{get;set;}
    public String StartingDate 									{get;set;}
  
  
    public String DisplayResponse								{get;set;}
    public Boolean IsErr										{get;set;}
    
    public ControllerPreapprovalApi(){
    	
    	PreapprovalResponse=new PPPreapprovalResponse();
    }
    
	public Pagereference apply(){
		PreapprovalRequest=new PPPreapprovalRequest(CommonParametersObjName, ''); 
		Pagereference page=null;
       	MainMessage = '';
       	IsErr = false;
       	system.debug(StartingDate);
       	String[] arr = EndingDate.split('/',-1);
    	String[] arr1 = StartingDate.split('/',-1);
    	system.debug(arr1);
    	system.debug(arr);
    	dateTime myenddate;
    		
	    try{
	    	myenddate = datetime.newInstance(Integer.valueOf(arr[2]),Integer.valueOf(arr[1]),Integer.valueOf(arr[0]));
	    }catch(System.Exception e){ }
	    dateTime mystartDate ;
	    
	  	try{
	   		mystartDate = datetime.newInstance(Integer.valueOf(arr1[2]),Integer.valueOf(arr1[1]),Integer.valueOf(arr1[0]));
	  	}catch(System.Exception e){ }
	    
		PreapprovalRequest.EndingDate=myenddate;
		PreapprovalRequest.StartingDate=mystartDate;
		
	    // create the Adaptive Toolkit object instance w/ API Credentials
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit(APICredentialObjName);
        try {
	        System.Debug(Logginglevel.INFO, '==>Request' + PreapprovalRequest);
			PreapprovalResponse = toolkit.preapproval( PreapprovalRequest );
    	    System.Debug(Logginglevel.INFO, '==>response' + PreapprovalResponse);
            if(PreapprovalResponse.PreapprovalKey!=null){
            	//page=toolkit.commitPreapproval(PreapprovalResponse.PreapprovalKey); 
            	SuccessMessage = 'Preapproval Created - <a href=' + toolkit.BaseAPIProfile.getPayPalLoginPage() 
        				+  '_ap-preapproval&preapprovalkey=' + PreapprovalResponse.PreapprovalKey 
        				+ '>click to approve</a> preaprovalKey - ' + PreapprovalResponse.PreapprovalKey; 
            }
        }
        catch (PPFaultMessageException ex) {
        	System.debug('PPFaultMessageException =>' + ex);
            RespEnvp = ex.ResponseEnvelope;
            IsErr = true;
            List<PPErrorData> errlist = ex.ErrorList;
            for( PPErrorData err: errList ){
                   MainMessage += err.ErrorId + ' : ' + err.Message + '<br>';
				}
         }catch(System.Exception e){
         	MainMessage = e.getmessage();
         }   
	  return page;
	}
	
	
}