public class ControllerPayDetailApi {
	
    public PPPaymentDetailsRequest PaymentDetailRequest 	{get;set;}
    public PPPaymentDetailsResponse PaymentDetailResponse	{get;set;} 
    public PPResponseEnvelope RespEnvp 						{get;set;}

    public string MainMessage     							{get;set;} 
    public String payKey									{get;set;}
    public String transactionId								{get;set;}
    public String trackingId								{get;set;}
    
 	public String CommonParametersObjName					{get;set;}
    public String APICredentialObjName						{get;set;}
    
    public PPPaymentInformation PaymentInfo 				{get;set;}
    public List<PPFundingTypeInfo> FundingTypeInfo			{get;set;}
    
    public List<PaymentDetailInfo> outParameterList			{get;set;}
	   
    public Boolean IsDisplayResponse						{get;set;}
  	public Boolean IsErr									{get;set;}
    
    public ControllerPayDetailApi(){
    	
        PaymentDetailResponse = new PPPaymentDetailsResponse();
        outParameterList = new List<PaymentDetailInfo>();
        FundingTypeInfo = new List<PPFundingTypeInfo>();        
    }

	public pagereference PayDetail(){
        PageReference page = null;
        MainMessage = '';
        IsErr = false;
        IsDisplayResponse = false ;
        PaymentDetailRequest = new PPPaymentDetailsRequest(CommonParametersObjName);
        PaymentDetailRequest.PayKey = paykey;
        PaymentDetailRequest.TrackingId = trackingId;
        PaymentDetailRequest.TransactionId = transactionId;
        // create the Adaptive Toolkit object instance w/ API Credentials
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit(APICredentialObjName);
        try {
        	outParameterList.clear();
	        System.Debug(Logginglevel.INFO, '==>Request' + PaymentDetailRequest);
        	PaymentDetailResponse = toolkit.paymentDetails(PaymentDetailRequest );
    	    System.Debug(Logginglevel.INFO, '==>response' + PaymentDetailResponse);
            RespEnvp = PaymentDetailResponse.getResponseEnvelope();
            System.debug('===========>Ack' + RespEnvp);
            
            //FundingTypeInfo.clear();
            FundingTypeInfo = PaymentDetailResponse.FundingtypeList;
            
            for(Integer index=0;index < PaymentDetailResponse.PaymentInformationList.size();index++){
                PaymentInfo = PaymentDetailResponse.PaymentInformationList.get(index);
           		PaymentDetailInfo paymentDetail= new PaymentDetailInfo();
                paymentDetail.Trans =  PaymentInfo.TransactionId;
                paymentDetail.TranStatus = PaymentInfo.TransactionStatus;
                paymentDetail.RefAmt =  PaymentInfo.RefundedAmount;
                paymentDetail.PenRef =  PaymentInfo.PendingRefund;
                paymentDetail.Email = PaymentInfo.Receiver.Email;
                paymentDetail.Amt = PaymentInfo.Receiver.Amount;
                paymentDetail.PaymentType = PaymentInfo.Receiver.PaymentType;
                paymentDetail.Primary = PaymentInfo.Receiver.Primary;
                paymentDetail.InvoicId = PaymentInfo.Receiver.InvoiceId;
                paymentDetail.SenderTransactionId = PaymentInfo.senderTransactionID;
                paymentDetail.SenderTransactionStatus = PaymentInfo.senderTransactionStatus;
                outParameterList.add(paymentDetail);
        	}
        	
        	IsDisplayResponse = true ;
        	
        }catch (PPFaultMessageException ex) {
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