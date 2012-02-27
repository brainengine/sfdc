trigger afterInsert on Code_Review__c bulk (after insert) {

	for (Code_Review__c code : Trigger.new) {
		
		Approval.ProcessSubmitRequest request = new Approval.ProcessSubmitRequest();
		request.setObjectId(code.id);

		// Submit the approval request for the account 
    
		Approval.ProcessResult result = Approval.process(request);
    
	}

}