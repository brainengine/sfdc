public class ControllerPayApi {

    public StaticStrings STATICSTRINGS				{get;set;} 
    public PPPayRequest PayRequest 					{get;set;}
    public PPPayResponse PayResponse				{get;set;} 
    public PPResponseEnvelope RespEnvp 				{get;set;}

    public String CommonParametersObjName			{get;set;}
    public String APICredentialObjName				{get;set;}
    public String ApprovalType 						{get;set;}
    public string MainMessage     					{get;set;} 
    public string SuccessMessage					{get;set;}
    public string ErrorLanguage   					{get;set;} 
    public string DetailLevel  						{get;set;}
    public string FeesPayer       					{get;set;} 
    public string SenderEmail     					{get;set;} 
    public Boolean IsDisplay 						{get;set;}

	public Boolean FundingTypeEcheck				{get;set;}
	public Boolean FundingTypeBalance				{get;set;}
	public Boolean FundingTypeCreditCard			{get;set;}
	
    public ControllerPayApi() {
        Receivers = new List<PPReceiver>();
        Receivers.add(new PPReceiver());
        
        STATICSTRINGS = new STATICSTRINGS();
        PaymentType=STATICSTRINGS.SIMPLE_PAYMENT;
        ApprovalType = 'Explicit Approval';
        FundingTypeEcheck = false;
        FundingTypeBalance = false;
        FundingTypeCreditCard = false;
    }
   
    public String PaymentType{get;set;}
    public List<SelectOption> getPaymentTypeDropDown(){
        List<selectoption> options = new List<selectoption>();
        options.add(new Selectoption(STATICSTRINGS.SIMPLE_PAYMENT,STATICSTRINGS.SIMPLE_PAYMENT));
        options.add(new Selectoption(STATICSTRINGS.PARALLEL_PAYMENT,STATICSTRINGS.PARALLEL_PAYMENT));
        options.add(new Selectoption(STATICSTRINGS.CHAINED_PAYMENT,STATICSTRINGS.CHAINED_PAYMENT));
        return options;
    }
    
    public void PaymentTypeOnChange(){
        if( PaymentType == STATICSTRINGS.SIMPLE_PAYMENT){
            Receivers.clear();
            Receivers.add(new PPReceiver());
        }
        else if( PaymentType == STATICSTRINGS.PARALLEL_PAYMENT || PaymentType == STATICSTRINGS.CHAINED_PAYMENT )
        {
            Receivers.clear();  
            if( Receivers.size() < 6 ){ 
                for(integer count = 0; count <= 5; count++)
                    Receivers.add(new PPReceiver());
            }
        }
    }
    
    public string FeePayer{get;set;}
    public List<selectoption> getFeesPayers(){
        List<selectoption> options = new List<selectoption>();
        if( !PaymentType.equalsIgnoreCase( STATICSTRINGS.CHAINED_PAYMENT) ){
            options.add(new Selectoption(STATICSTRINGS.SENDER,STATICSTRINGS.SENDER));
        }
        if(PaymentType.equalsIgnoreCase(STATICSTRINGS.CHAINED_PAYMENT) ){
            options.add(new Selectoption(STATICSTRINGS.PRIMARYRECEIVER,STATICSTRINGS.PRIMARYRECEIVER));
            options.add(new Selectoption(STATICSTRINGS.SECONDARYONLY,STATICSTRINGS.SECONDARYONLY));
        }
        options.add(new Selectoption(STATICSTRINGS.EACHRECEIVER,STATICSTRINGS.EACHRECEIVER));
        
        return options;
    }
    
    public List<PPReceiver> Receivers{get;set;}
    
    public class StaticStrings{
        public string SIMPLE_PAYMENT 	= 'Simple';
        public string PARALLEL_PAYMENT 	= 'Parallel';
        public string CHAINED_PAYMENT 	= 'Chained';
        
        public string EACHRECEIVER      = 'EACHRECEIVER';
        public string PRIMARYRECEIVER   = 'PRIMARYRECEIVER';
        public string SENDER            = 'SENDER';
        public string SECONDARYONLY     = 'SECONDARYONLY';
    }
  
    public pagereference Pay(){
        PageReference page = null;
        MainMessage = '';
		
		// create request envelope and set the common request parameters
        PPPayRequest request = new PPPayRequest(CommonParametersObjName, SenderEmail);        
        // set success and cancel urls
        String host = ApexPages.currentPage().getHeaders().get('Host');
        request.CancelUrl = 'https://' + host + '/PayApiTest?MainMessage=cancel';
        request.ReturnUrl = 'https://' + host + '/PayDetailTest?payKey=${payKey}';
		// set a note associated with the payment        
        request.Memo = 'PayApiTest';  
        // set receiver info in the request
        List<PPReceiver> receiverList = new List<PPReceiver>();
        for (PPReceiver rec : Receivers){
        	if ( (0 != rec.Email.length()) || (0 != rec.InvoiceId.length()) || (0 != rec.PaymentType.length()) )
        		receiverList.add(rec);
        }
        request.receiverList = receiverList;
        // set FeesPayer
        request.FeesPayer = FeesPayer;
        if (FundingTypeEcheck) {
       		PPFundingTypeInfo info = new PPFundingTypeInfo();
       		info.FundingType = 'ECHECK';
       		request.FundingTypeList.add(info);
       	}
       	if (FundingTypeBalance) {
       		PPFundingTypeInfo info = new PPFundingTypeInfo();
       		info.FundingType = 'BALANCE';
       		request.FundingTypeList.add(info);
       	}
       	
       	if (FundingTypeCreditCard) {
       		PPFundingTypeInfo info = new PPFundingTypeInfo();
       		info.FundingType = 'CREDITCARD';
       		request.FundingTypeList.add(info);
       	}
        
        IsDisplay = false;
       
         // create the Adaptive Toolkit object instance w/ API Credentials
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit(APICredentialObjName);
       
        try {
        	System.Debug(Logginglevel.INFO, '==>Request' + request);
        	PayResponse = toolkit.Pay(request);
			System.debug(PayResponse);			
			IsDisplay = true;
			RespEnvp = PayResponse.ResponseEnvelope;
        	if( PayResponse.PaymentExecStatus.equalsIgnoreCase('Created') ) {
        		//Page = toolkit.commitpayment(PayResponse.payKey);
        		SuccessMessage = 'Payment Created - <a href=' + toolkit.BaseAPIProfile.getPayPalLoginPage() 
        				+  '_ap-payment&paykey=' + PayResponse.payKey + '>click to approve</a> payKey - ' + PayResponse.payKey; 
			} else if( PayResponse.PaymentExecStatus.equalsIgnoreCase('Completed') ) {
        		//Page = new pagereference(request.returnUrl); 
        		SuccessMessage = 'Payment Completed - payKey - ' + PayResponse.payKey; 
            } else {
            	IsDisplay = true;
            	RespEnvp = PayResponse.getResponseEnvelope();
            	MainMessage = 'Payment Execution Status returned from server is - ' + PayResponse.PaymentExecStatus;
    		}
            
        }catch(PPFaultMessageException ex) {
			System.debug('PPFaultMessageException =>' + ex);
			IsDisplay = true;
			RespEnvp = ex.ResponseEnvelope;
    		List<PPErrorData> errList = ex.ErrorList;
			for( PPErrorData err: errList ){
                MainMessage += err.ErrorId + ' : ' + err.Message + '<br>';
			}
       }catch(System.Exception e){
			System.debug('System.Exception =>' + e);
        	MainMessage = e.getMessage();
       } 
       return page;
    }
   
}