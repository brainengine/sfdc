global class FileAttachmentService{

	webservice static String createFileAttachment(string fileName, string fileContent)
	{
		//just grab the first account we find
		Id parentId;
		for (Account a : [SELECT Id FROM Account WHERE Name = 'GenePoint' LIMIT 1]) {  
			parentId = a.id;
		}
        
		//create an attachement and add it to the account
		Attachment attach = new Attachment();
		attach.Body = Blob.valueOf(fileContent); 
		attach.Name = fileName;
		attach.IsPrivate = false;
		attach.ParentId = parentId;
		insert attach;
		
		//create a new task entry
		Task task = new Task();
		task.Subject = 'Invoice Added';
		task.WhatId = parentId;
		task.Status = 'Completed';
		task.Description = 'invoice uploaded';
		insert task;
        
		//return the attachment id;
		return attach.Id;
	}   
	
}