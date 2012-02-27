trigger CreateBuilds on BE_Builds__c bulk (before insert) {

	BE_Builds__c[] builds = Trigger.new;
	BuildManagement.processNewBuilds(builds);
	
}