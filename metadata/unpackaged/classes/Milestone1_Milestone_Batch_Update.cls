/**
* Batchable class to manage milestone updates
*/
global with sharing class Milestone1_Milestone_Batch_Update implements Database.Batchable<sObject>{
	
	global final Set<Id> milestoneIds;
	
	global Milestone1_Milestone_Batch_Update( Set<Id> mIds ){
		this.milestoneIds = mIds;
	}

	global Database.QueryLocator start(Database.BatchableContext BC){
		return Database.getQueryLocator( [SELECT Id FROM Milestone1_Milestone__c WHERE Id IN :milestoneIds] );
	}

	global void execute(Database.BatchableContext BC, List<sObject> milestoneScope){
		update milestoneScope;
	}

	global void finish(Database.BatchableContext BC){}
	
	
	public static testmethod void testMilestoneBatchUpdate(){
		// Create a project with milestones
		Milestone1_Project__c         project = Milestone1_Test_Utility.sampleProject('My Project');
		List<Milestone1_Milestone__c> mList   = new List<Milestone1_Milestone__c>();
		
		insert project;
		
		for(Integer i = 0; i < 200; i++){
			mList.add( Milestone1_Test_Utility.sampleMilestone(project.Id, null, 'My Test Milestone ' + i) );
		}
		
		insert mList;
		
		// Extract milestones Ids and run in batch
		Set<Id> idSet = new Set<Id>();
		
		for(Milestone1_Milestone__c m : mList){
			idSet.add( m.Id );
		}
		
		Test.StartTest();

		Database.executeBatch( new Milestone1_Milestone_Batch_Update(idSet) );

		Test.StopTest();

		// Test records were updated
		List<Milestone1_Milestone__c> result = [SELECT Id, LastModifiedDate, CreatedDate FROM Milestone1_Milestone__c WHERE Project__c = :project.Id];
		
		idSet.clear();
		for(Milestone1_Milestone__c m : result){
			if( m.LastModifiedDate > m.CreatedDate ){
				idSet.add( m.Id );
			}
		}
		 
		System.AssertEquals( 200, idSet.size() );
	}
}