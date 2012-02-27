@RestResource(urlMapping='/AccountServices/*')
global class RESTAccountServices{

	@HttpPost   
	global static String createNewAccunt(String companyName, String website) {
		System.debug('COMPANY: '+companyName);
		System.debug('website: '+website);
	     
	     
		Account a = new Account();
		a.Name = companyName;
		a.Website = website;
		insert a;
	          
		return 'Create Account: '+companyName;
	}

	@HttpGet
	global static List<Task> getOpenTasks(RestRequest req, RestResponse res) {
		String companyName = req.params.get('companyName');
		Account company = [ Select ID, Name, Email__c, BillingState from Account where Name = :companyName];
     
		List<Task> tasks = [Select T.AccountId, T.Description, T.Status, T.Subject from Task T WHERE AccountId =: company.Id];
		return tasks;
    
	}
	
	@HttpPut
	global static String addAttachment(RestRequest req) {
		String companyName = req.params.get('companyName');
		String fileName = req.params.get('fileName');
		Account company = [ Select ID, Name from Account where Name = :companyName];
    
		//create an attachement and add it to the account
		Attachment a = new Attachment();
		a.ParentId = company.Id;
		a.Name = fileName;
		a.Body = req.requestBody;
		insert a;
		
		//create a new task entry
		Task task = new Task();
		task.Subject = 'Invoice Added';
		task.WhatId = company.Id;
		task.Status = 'Completed';
		task.Description = 'invoice uploaded';
		insert task;
      
		return 'Attachment added';
	}
	
}