/**
* Batchable class to manage milestone deletes
*/
global with sharing class Milestone1_Milestone_Batch_Delete implements Database.Batchable<sObject>{
	
	global final List<Milestone1_Milestone__c> milestones;
	
	global Milestone1_Milestone_Batch_Delete( List<Milestone1_Milestone__c> ms ){
		this.milestones = ms;
	}

	global Database.QueryLocator start(Database.BatchableContext BC){
    	Set<Id> ids = new Set<Id>();
    	
    	for(Milestone1_Milestone__c m : milestones){
    		ids.add( m.Id );
    	}
    	
		return Database.getQueryLocator( [SELECT Id FROM Milestone1_Milestone__c WHERE Id IN :ids] );
	}

	global void execute(Database.BatchableContext BC, List<sObject> milestoneScope){
		delete milestoneScope;
	}

	global void finish(Database.BatchableContext BC){}
	
	
	public static testmethod void testMilestoneBatchDelete(){
		// Create a project with milestones
		Milestone1_Project__c         project = Milestone1_Test_Utility.sampleProject('My Test Project'); 
		List<Milestone1_Milestone__c> mList   = new List<Milestone1_Milestone__c>();
		
		insert project;
		
		for(Integer i = 0; i < 200; i++){
			mList.add( Milestone1_Test_Utility.sampleMilestone(project.Id, null, 'My Test Milestone ' + i) );
		}
		
		insert mList;
		
		Test.StartTest();
		Database.executeBatch( new Milestone1_Milestone_Batch_Delete(mList) );
		Test.StopTest();

		// Test records were deleted
		Integer milestonesCount = [SELECT count() FROM Milestone1_Milestone__c WHERE Project__c = :project.Id];
		 
		System.assertEquals( 0, milestonesCount );
	}
}