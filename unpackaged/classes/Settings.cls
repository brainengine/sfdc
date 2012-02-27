public class Settings{

	public static void runTest(){
		List<PayPalSettings__c> mcs = PayPalSettings__c.getall().values();
		boolean textField = null;
		if (mcs[0].Production__c == 'PC') {
			textField = true;
		}else{
			mcs[0].Production__c = 'me';	
		}
		//system.assertEquals(textField, true);	
		update mcs;
	}
	
	static testMethod void testSettings() {
		runTest();
	}

}