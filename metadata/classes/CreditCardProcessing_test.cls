public class CreditCardProcessing_test{

	static testMethod void CreditCardProcessing_test() {
		
		CreditCardProcessing cc = new CreditCardProcessing();
		cc.strCredential = 'Test';
		
		cc.strAMT = '1.00';
		cc.strCCType = 'Visa';
		cc.strAccntNumber = '4581694251940002';
		cc.strExpDate = '012012';
		cc.strCVV2 = '962';
		cc.strFirstName = 'John';
		cc.strLastName = 'Doe';
		cc.strStreet = '123 Fake Street';
		cc.strCity = 'Omaha';
		cc.strState = 'NE';
		cc.strZip = '68104';
		cc.strCountryCode = 'US';
		cc.strCurrencycode = 'USD';
	
		cc.makePayment();
	}
}