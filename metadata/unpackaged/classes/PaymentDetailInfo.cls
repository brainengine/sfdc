public class PaymentDetailInfo {
	
	public String Email{get;set;}
	public Decimal Amt{get;set;}
	public Boolean Primary{get;set;}
	public String InvoicId{get;set;}
	public String PaymentType{get;set;}
	public String Trans{get;set;}
	public String TranStatus{get;set;}
	public Decimal RefAmt{get;set;}
	public Boolean PenRef{get;set;}
	public String SenderTransactionId{get;set;}
	public String SenderTransactionStatus{get;set;}
	
	public PaymentDetailInfo(){
		Email = '';
		Amt = 0.0;
		Primary = null;
		InvoicId = '';
		PaymentType = '';
		Trans = '';
		TranStatus = '';
		RefAmt = 0.0;
		PenRef = null;
		SenderTransactionId = '';
		SenderTransactionStatus = '';
	}

}