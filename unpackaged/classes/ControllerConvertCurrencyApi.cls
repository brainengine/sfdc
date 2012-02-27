public class ControllerConvertCurrencyApi {
    
    public String MainMessage{get;set;}
    
   
    public PPConvertCurrencyRequest ConvertCurrencyRequest  	{get;set;}
    public PPConvertCurrencyResponse ConvertCurrencyResponse	{get;set;}
    public PPResponseEnvelope respEnvp							{get;set;}
    public String CommonParametersObjName			{get;set;}
    public String APICredentialObjName				{get;set;}
    public Boolean isDisplay									{get;set;}
    public PPResponseEnvelope ResponseEnvelope					{get;set;}
    public Boolean isErr										{get;set;}

    public class CurrencyInfo {
    	public CurrencyInfo() {
        	BaseAmount = new PPCurrencyType();
        	Code = '';
        }
        public PPCurrencyType BaseAmount {get;set;}
        public String Code {get;set;}
    }
     
    public List<CurrencyInfo> CurrencyInfoList {get; set;}      
    public ControllerConvertCurrencyApi (){
        ConvertCurrencyRequest = new PPConvertCurrencyRequest();
        ConvertCurrencyResponse = new PPConvertCurrencyResponse();
       	CurrencyInfoList  = new List<CurrencyInfo>();
        CurrencyInfoList.clear();
        CurrencyInfoList.add(new CurrencyInfo());
	}
    
    public void Add () {
        CurrencyInfoList.add(new CurrencyInfo());
    }
   
    public Pagereference apply(){
        MainMessage = '';
        isDisplay = false;  
        isErr = false ;
        Pagereference page=null;           
		// create the Adaptive Toolkit object instance w/ API Credentials
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit(APICredentialObjName);
        
        list<PPCurrencyType> BaseAmountList = new list<PPCurrencyType>();
        list<String> ConvertToCurrencyList = new list<String>();
        
        for (CurrencyInfo info : CurrencyInfoList) {
        	//if (info.BaseAmount.Amount > 0)
        		BaseAmountList.add(info.BaseAmount);
        	//if(info.Code != null && info.Code.length() != 0) 
        		ConvertToCurrencyList.add(info.Code);
        }
        ConvertCurrencyRequest.BaseAmountList = BaseAmountList;
        ConvertCurrencyRequest.ConvertToCurrencyList = ConvertToCurrencyList;    
        try {
            System.Debug(Logginglevel.INFO, '==>Request' + ConvertCurrencyRequest);
            ConvertCurrencyResponse = toolkit.convertCurrency_PP(ConvertCurrencyRequest);
            System.Debug(Logginglevel.INFO, '==>response' + ConvertCurrencyResponse);
            respEnvp = ConvertCurrencyResponse.getResponseEnvelope();
            isDisplay = true;
        } catch (PPFaultMessageException ex) {
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
    
}