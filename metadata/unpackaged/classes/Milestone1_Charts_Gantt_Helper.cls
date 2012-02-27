public with sharing class Milestone1_Charts_Gantt_Helper {

	public String myId {get;set;}
	public Boolean allowView {get;set;}
	
	ApexPages.StandardController stdCont;
	
	public Milestone1_Charts_Gantt_Helper(ApexPages.StandardController stc){
		myId = stc.getId();
		allowView = Apexpages.currentPage().getParameters().get('p') == null;
	}

	static testMethod void testController() {
		
		Milestone1_Project__c proj = Milestone1_Test_Utility.sampleProject('Basic Sample For Test' + DateTime.now().getTime());
		insert proj;
		
		ApexPages.StandardController stc = new ApexPages.StandardController(proj);
        Milestone1_Charts_Gantt_Helper cont = new Milestone1_Charts_Gantt_Helper(stc);
		System.assert(cont.myId != null);
		
		
	}

		
}