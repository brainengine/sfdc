public class RefundInfo {
	
	public String Email{get;set;}
	public String InvoiceId{get;set;}
	public String PaymentType{get;set;}
	public Decimal Amt{get;set;}
	public Boolean Primary{get;set;}
	
	public string Category { get; set; }
    public string Domain { get; set; }
    public Long ErrorId { get; set; }
    public string ExceptionId { get; set; }
    public string Message { get; set; }
    public list<string> Parameter { get; set; }
    public string Severity { get; set; }
    public string Subdomain { get; set; }
   
    public String RefundStatus {get; set;}
	public Decimal RefundNetAmount {get; set;}
	public Decimal RefundFeeAmount {get; set;}
	public Decimal RefundGrossAmount {get; set;}
	public Decimal TotalOfAllRefunds {get; set;}
	public Boolean RefundHasBecomeFull {get; set;}
	public String EncryptedRefundTransactionId {get; set;}
	public String RefundTransactionStatus {get; set;}
	
	public RefundInfo(){
		Email = '';
		Amt = 0.0;
		Primary = null;
		InvoiceId = '';
		PaymentType = '';
	 	Category  = '';
  		Domain = '';
     	
  		ExceptionId = '';
    	Message = '';
    	Severity  = '';
  		Subdomain = '';
  		
  		RefundStatus = '';
  		RefundNetAmount = 0.0;
  		RefundFeeAmount = 0.0;
  		RefundGrossAmount = 0.0;
  		TotalOfAllRefunds = 0.0;
  		RefundHasBecomeFull = null;
  		EncryptedRefundTransactionId = '';
  		RefundTransactionStatus = '';
	}
	
}