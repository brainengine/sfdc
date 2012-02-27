public class PayPalUtilityExtension{

	private final PayPal_Payment__c payment;
	public string strTransactionId {get;set;}
	public string transactionLog {get;set;}
	public string refundStatus {get;set;}
	public string refundMemo {get;set;}
	public string refundAmount {get;set;}
	public decimal dAmount {get;set;}
	
	public PayPalUtilityExtension(ApexPages.StandardController stdController) {
		//this.payment = (PayPal_Payment__c)stdController.getRecord();
		
		strTransactionId = ApexPages.currentPage().getParameters().get('id');
		this.payment = [Select Id, Name, Refund_Amount__c, Amount__c, Transaction_Id__c, Memo__c, PayPal_Credentials__r.Name from PayPal_Payment__c where id =: strTransactionId];
		transactionLog = '';
		refundStatus = '';
	}
	
	public PageReference loadTransDetails() {
		try{
			CreditCardProcessing cc = new CreditCardProcessing();
			cc.strCredential = payment.PayPal_Credentials__r.Name;
			boolean result = cc.getTransactionDetails(payment.Transaction_Id__c);
			if(result){
				transactionLog = cc.strResponse;
				//payment.Log__c = cc.strResponse;
				//update(payment);
			}else{
				transactionLog = 'Unable to retrieve transaction details.';
			}
		}catch(Exception se){
			
		}
		return null;
	}
	
	public PageReference doFullRefund() {
		try{
			CreditCardProcessing cc = new CreditCardProcessing();
			cc.strCredential = payment.PayPal_Credentials__r.Name;
			boolean result = cc.doRefund(payment.Transaction_Id__c, 'Full', refundMemo, '');
			if(result){
				refundStatus = cc.strResponse;
				//payment.Log__c = cc.strResponse;
				//update(payment);
			}else{
				refundStatus = 'Unable to refund transaction. Please try again.';
			}
		}catch(Exception se){
			
		}
		return null;
	}
	
	public PageReference doPartialRefund() {
		try{
			CreditCardProcessing cc = new CreditCardProcessing();
			cc.strCredential = payment.PayPal_Credentials__r.Name;
			boolean result = cc.doRefund(payment.Transaction_Id__c, 'Full', refundMemo, refundAmount);
			if(result){
				refundStatus = cc.strResponse;
				//payment.Log__c = cc.strResponse;
				//update(payment);
			}else{
				refundStatus = 'Unable to refund transaction. Please try again.';
			}
		}catch(Exception se){
			
		}
		return null;
	}

	Integer count = 0;
	Integer count2 = 0;
                        
	public PageReference incrementCounter() {
		count++;
		return null;
	}
	
	public PageReference incrementCounter2() {
		count2++;
		return null;
	}
                    
	public Integer getCount() {
		return count;
	}
	
	public Integer getCount2() {
		return count2;
	}
	
//	public String getTransactionId() {
//		return strTransactionId;
//	}
	
	public PayPal_Payment__c getPayment() {
		return payment;
	}




}