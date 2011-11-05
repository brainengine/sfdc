/**
* Batchable class to manage project updates
*/
global with sharing class Milestone1_Project_Batch_Update implements Database.Batchable<sObject>{
	global final Set<Id> projectIds;
	
	global Milestone1_Project_Batch_Update( Set<Id> pIds ){
		this.projectIds = pIds;
	}

	global Database.QueryLocator start(Database.BatchableContext BC){
		return Database.getQueryLocator( [SELECT Id FROM Milestone1_Project__c WHERE Id IN :projectIds] );
	}

	global void execute(Database.BatchableContext BC, List<sObject> projectScope){
		update projectScope;
	}

	global void finish(Database.BatchableContext BC){}
	
	
	public static testmethod void testMilestoneBatchUpdate(){
		// Create projects
		List<Milestone1_Project__c> pList = new List<Milestone1_Project__c>();
		
		for(Integer i = 0; i < 200; i++){
			pList.add( Milestone1_Test_Utility.sampleProject('My Project ' + i) );
		}
		
		insert pList;
		
		// Extract project Ids and run in batch
		Set<Id> idSet = new Set<Id>();
		
		for(Milestone1_Project__c p : pList){
			idSet.add( p.Id );
		}
		
		Test.StartTest();

		Database.executeBatch( new Milestone1_Project_Batch_Update(idSet) );

		Test.StopTest();

		// Test records were updated
		List<Milestone1_Project__c> result = [SELECT Id, LastModifiedDate, CreatedDate FROM Milestone1_Project__c WHERE Id IN :idSet];
		Set<Id> idRes = new Set<Id>();
		
		for(Milestone1_Project__c p : result){
			if( p.LastModifiedDate > p.CreatedDate ){
				idRes.add( p.Id );
			}
		}
		 
		System.Assert( idSet.containsAll(idRes) && idRes.containsAll(idSet) );
	}

}