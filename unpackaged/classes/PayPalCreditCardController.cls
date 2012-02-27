public class PayPalCreditCardController{

	public String strMethod 			{get;set;}
	public String strPaymentAction 		{get;set;}
	public String strAMT	 			{get;set;}
	public String strCCType 			{get;set;}
	public String strAccntNumber 		{get;set;}
	public String strExpDate 			{get;set;}
	public String strCVV2 				{get;set;}
	public String strFirstName 			{get;set;}
	public String strLastName 			{get;set;}
	public String strStreet 			{get;set;}
	public String strStreet2 			{get;set;}
	public String strCity 				{get;set;}
	public String strState	 			{get;set;}
	public String strZip	 			{get;set;}
	public String strCountryCode 		{get;set;}
	public String strCurrencycode	 	{get;set;}
	public String strCredential		 	{get;set;}
	public String strResponse		 	{get;set;}
	
	private string cardType;
	private string expMonth;
	private string expYear;
	
	public PayPalCreditCardController() {
		strCredential 			= 'Test_Credentials';
		strAMT 					= '1.00';
		strCCType 				= 'Visa';
		cardType 				= 'Visa';
		strAccntNumber 			= '4581694251940002';
		strExpDate 				= '012012';
		ExpMonth				= '03';
		ExpYear					= '2012';
		strCVV2 				= '962';
		strFirstName 			= 'John';
		strLastName 			= 'Doe';
		strStreet 				= '123 Fake Street';
		strStreet2				= '';
		strCity 				= 'Omaha';
		strState 				= 'NE';
		strZip 					= '68104';
		strCountryCode 			= 'US';
		strCurrencycode 		= 'USD';
	}
	
	public String getCardType() {
		return cardType;
	}
 			
	public void setCardType(String card) {
		this.cardType = card;
	}
	
	public String getExpMonth() {
		return expMonth;
	}
 			
	public void setExpMonth(String month) {
		this.expMonth = month;
	}
	
	public String getExpYear() {
		return expYear;
	}
 			
	public void setExpYear(String year) {
		this.expYear = year;
	}
	
	Integer count = 0;
	
	public PageReference makePayment() {
		
		CreditCardProcessing cc = new CreditCardProcessing();
		cc.strCredential = strCredential;
		
		cc.strAMT = strAMT;
		cc.strCCType = strCCType;
		cc.strAccntNumber = strAccntNumber;
		cc.strExpDate = strExpDate;
		cc.strCVV2 = strCVV2;
		cc.strFirstName = strFirstName;
		cc.strLastName = strLastName;
		cc.strStreet = strStreet;
		cc.strCity = strCity;
		cc.strState = strState;
		cc.strZip = strZip;
		cc.strCountryCode = 'US';
		cc.strCurrencycode = 'USD';
		
		try{
			boolean result = cc.makePayment();
			if(result){
				strResponse = cc.strResponse;
			}else{
				strResponse = 'Unable to retrieve transaction details.';
			}
		}catch(Exception ex){
			strResponse = ex.getMessage();
		}
		
		return null;
	}
	
	public Integer getCount() {
		return count;
	}
	
}