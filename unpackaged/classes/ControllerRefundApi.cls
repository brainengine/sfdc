public class ControllerRefundApi {
	
	public String MainMessage{get;set;}
	
	public List<PPReceiver> Receivers								{get;set;}
	public PPReceiver rec											{get;set;}
	
	public PPRefundRequest RefundRequest							{get;set;}
	public PPRefundResponse RefundResponse							{get;set;}
	public String CommonParametersObjName			{get;set;}
    public String APICredentialObjName				{get;set;}
	public RefundInfo refundInfo 									{get;set;}
	public List<RefundInfo> refundInfoList 							{get;set;}
	public PPRefundInfo refInfo 									{get;set;}
	public List<PPErrorData> errData								{get;set;}
	
	
	public PPResponseEnvelope RespEnvp 								{get;set;}
//	public List<PPRefundInfo> refInfo {get;set;}
	
	public ControllerRefundApi(){
		
		RefundResponse=new PPRefundResponse();
		Receivers = new List<PPReceiver>();
		
		for(Integer i=0;i<6;i++){
			Receivers.add(new PPReceiver());
		}
		refundInfo = new RefundInfo();
		refundInfoList = new List<RefundInfo>();
		errData = new List<PPErrorData>();
    }
    
	public Boolean IsDisplay{get;set;}
	public Boolean IsErr{get;set;}
		
	public Pagereference apply(){
		RefundRequest=new PPRefundRequest(CommonParametersObjName);
        RefundRequest.receiverList.clear();
		MainMessage = '';
		IsDisplay = false;
		IsErr = false;
		Pagereference page = null;
        for (PPReceiver rec : Receivers){
        	if ( (0 != rec.Email.length()) || (0 != rec.InvoiceId.length()) || (0 != rec.PaymentType.length()) )
        		RefundRequest.ReceiverList.add(rec);
        }
		
        // create the Adaptive Toolkit object instance w/ API Credentials
        PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit(APICredentialObjName);
        try {
            RefundResponse = toolkit.refund( RefundRequest );
            RespEnvp = RefundResponse.getResponseEnvelope(); 
          	refundInfoList.clear();
		 	for(Integer index=0;index < RefundResponse.RefundInfoList.size() ;index++){
		 		RefundInfo rr = new RefundInfo();
		 		refInfo = RefundResponse.RefundInfoList.get(index);
		 		rr.Email = refInfo.Receiver.Email;
				rr.Amt = refInfo.Receiver.Amount;
				rr.Primary = refInfo.Receiver.Primary;
				rr.InvoiceId = refInfo.Receiver.InvoiceId;
				rr.PaymentType = refInfo.Receiver.PaymentType;
				
				errData = refInfo.ErrorList;
				if(null != errData.size() ){
					for(PPErrorData err: errData){
						rr.Category = err.Category;
						rr.Domain = err.Domain;
						rr.ErrorId = err.ErrorId;
  						rr.ExceptionId = err.ExceptionId;
    					rr.Message = err.Message;
    					rr.Severity  = err.Severity;
  						rr.Subdomain = err.Subdomain;
  						rr.Parameter = err.Parameter;
		 			}
				}
			
  				rr.RefundStatus =  refInfo.RefundStatus;
  				rr.RefundNetAmount =  refInfo.RefundNetAmount;
  				rr.RefundFeeAmount =  refInfo.RefundFeeAmount;
  				rr.RefundGrossAmount = refInfo.RefundGrossAmount;
  				rr.TotalOfAllRefunds =  refInfo.TotalOfAllRefunds;
  				rr.RefundHasBecomeFull =  refInfo.RefundHasBecomeFull;
  				rr.EncryptedRefundTransactionId =  refInfo.EncryptedRefundTransactionId;
  				rr.RefundTransactionStatus =  refInfo.RefundTransactionStatus;
            
				refundInfoList.add(rr);	
		 	}
            IsDisplay = true;	
              	
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
        System.Debug(Logginglevel.INFO, '==>Request' + RefundRequest);
        System.Debug(Logginglevel.INFO, '==>response' + RefundResponse);
		return page;	
	}
	
	 
}