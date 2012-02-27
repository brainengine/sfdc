public class sampleTestMethodCls {

	static testMethod void testBuildTrigger(){
		string buldDesc;
		//create a new build
		try{
			String description = 'sample description';
			BE_Builds__c build = new BE_Builds__c();
			build.Name = 'Sample Build';
			build.Active__c = true;
			build.Description__c = description;
			insert build;
		}catch(exception e){
			
			
		}
		
	}	

}