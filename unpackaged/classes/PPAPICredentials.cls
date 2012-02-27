public class PPAPICredentials {
	
	public class PPAPICredentialsException extends Exception {}
    PPAPICredential__c credObj;
	public string APIUsername {get {return credObj.APIUsername__c;} private set;} 
    public string APIUserpassword {get {return credObj.APIUserpassword__c;} private set;}
    public string APIProfile {get {return credObj.APIProfile__c;} private set;}
    public string APICertificate {get {return credObj.APICertificate__c;} private set;}
    public string APICertificatepassword {get {return credObj.APICertificatePassword__c;} private set;}    
    public string APISignature {get {return credObj.APISignature__c;} private set;}
    public string ApplicationID {get {return credObj.ApplicationID__c;} private set;}
    public string Environment {get {return credObj.Environment__c;} private set;}
    
    public PPAPICredentials(string name) {
    	try{
    		credObj = [select APIProfile__c,APIUsername__c,APIUserpassword__c,APISignature__c,APICertificate__c,APICertificatePassword__c,ApplicationID__c,Environment__c,id from PPAPICredential__c where name = :name limit 1];
    		
    		// APIProfile/APIUsername/APIUserPassword are required fields but we add the checks for completeness
    		if(credObj.APIUsername__c == null || credObj.APIUsername__c == '') {
    			System.debug('Invalid API Username found!');
    			throw new PPAPICredentialsException('Error: No APIUsername configured in PPAPICredential object.');
    		}
    		if(credObj.APIUserpassword__c == null || credObj.APIUserpassword__c == '') {
    			System.debug('Invalid API Userpassword found!');
    			throw new PPAPICredentialsException('Error: No APIUserpassword configured in PPAPICredential object.');
    		}
    		if(credObj.APIProfile__c == null || credObj.APIProfile__c == '') {
    			System.debug('No API Profile found!');
    			throw new PPAPICredentialsException('Error: No API Profile configured in PPAPICredential object.');
    		}
    		// based on the APIProfile check for required fields.
    		if(credObj.APIProfile__c == '3_TOKEN'){
    			if(credObj.APISignature__c == null || credObj.APISignature__c == '') {
	    			System.debug('Invalid APISignature found!');
	    			throw new PPAPICredentialsException('Error: No APISignature configured in PPAPICredential object.');
	    		}
    		} else if(credObj.APIProfile__c == 'CERTIFICATE'){
    			if(credObj.APICertificate__c == null || credObj.APICertificate__c == '') {
	    			System.debug('Invalid API Certificate found!');
	    			throw new PPAPICredentialsException('Error: No Certificate configured in PPAPICredential object.');
	    		}
	    		if(credObj.APICertificatePassword__c == null || credObj.APICertificatePassword__c == '') {
	    			System.debug('Invalid API Certificate Password found!');
	    			throw new PPAPICredentialsException('Error: No Certificate Password configured in PPAPICredential object.');
	    		}
    		} else {
    			System.debug('Invalid API Profile found!');
	    		throw new PPAPICredentialsException('Error: Invalid API Profile configured in PPAPICredential object.');
    		}
    		
    	}catch(QueryException qex){
    		System.debug('Error when query APICredential object - did not find any APICredentials with name of ['+name+']');
    		throw new PPAPICredentialsException('Error when query APICredential object - did not find any APICredentials with name of ['+name+']');
    	}
    }
    
    static testmethod void testInstance() {
		try{
			PPAPICredentials k = new PPAPICredentials('nonexistentname');
		}catch(PPAPICredentialsException ppCredEx){
			system.debug('here: ' +ppCredEx.getTypeName());
		   	system.assert(ppCredEx.getTypeName().contains('PPAPICredentials.PPAPICredentialsException'));
		   	
		}
		
		// test cases for 3_TOKEN Credentials
		PPAPICredential__c t1 = new PPAPICredential__c( Environment__c='Sandbox',ApplicationID__c='appid', APIProfile__c='3_TOKEN', APIUsername__c='u1', APIUserpassword__c='p1', APISignature__c='s1', name='test' );
		insert t1;
		PPAPICredentials k = new PPAPICredentials('test');
		system.assert(k.APIUsername == 'u1');
		system.assert(k.APIUserpassword == 'p1');
		system.assert(k.APIProfile == '3_TOKEN');
		system.assert(k.APISignature == 's1');
		
		// invalid Signature value
		try{
			PPAPICredential__c t2 = new PPAPICredential__c( Environment__c='Sandbox',ApplicationID__c='appid',APIProfile__c='3_TOKEN', APIUsername__c='u2', APIUserpassword__c='p2', APISignature__c='', name='test2' );
			insert t2;
			k = new PPAPICredentials('test2');
		}catch(PPAPICredentialsException ppCredEx){
		   	system.assert(ppCredEx.getTypeName().contains('PPAPICredentials.PPAPICredentialsException'));		   	
		}
		// no Signature value
		try{
			PPAPICredential__c t3 = new PPAPICredential__c( Environment__c='Sandbox',ApplicationID__c='appid',APIProfile__c='3_TOKEN', APIUsername__c='u3', APIUserpassword__c='p3', name='test3' );
			insert t3;
			k = new PPAPICredentials('test3');
		}catch(PPAPICredentialsException ppCredEx){
		   	system.assert(ppCredEx.getTypeName().contains('PPAPICredentials.PPAPICredentialsException'));		   	
		}
		
		// test cases for CERTIFICATE Credentials
		PPAPICredential__c c1 = new PPAPICredential__c( Environment__c='Sandbox',ApplicationID__c='appid',APIProfile__c='CERTIFICATE', APIUsername__c='u1', APIUserpassword__c='p1', APICertificate__c='c1', APICertificatePassword__c='cp1', name='testc' );
		insert c1;
		PPAPICredentials k2 = new PPAPICredentials('testc');
		system.assert(k2.APIUsername == 'u1');
		system.assert(k2.APIUserpassword == 'p1');
		system.assert(k2.APIProfile == 'CERTIFICATE');
		system.assert(k2.APICertificate == 'c1');
		system.assert(k2.APICertificatePassword == 'cp1');
		
		// invalid certificate & certificatepassword values
		try{
			PPAPICredential__c c2 = new PPAPICredential__c( Environment__c='Sandbox',ApplicationID__c='appid',APIProfile__c='CERTIFICATE', APIUsername__c='u2', APIUserpassword__c='p2', APICertificate__c='',APICertificatePassword__c='', name='testc2' );
			insert c2;
			k = new PPAPICredentials('testc2');
		}catch(PPAPICredentialsException ppCredEx){
		   	system.assert(ppCredEx.getTypeName().contains('PPAPICredentials.PPAPICredentialsException'));		   	
		}
		
		// no Certificate & CertificatePassword values
		try{
			PPAPICredential__c c3 = new PPAPICredential__c( Environment__c='Sandbox',ApplicationID__c='appid',APIProfile__c='CERTIFICATE', APIUsername__c='u3', APIUserpassword__c='p3', name='testc3' );
			insert c3;
			k = new PPAPICredentials('testc3');
		}catch(PPAPICredentialsException ppCredEx){
		   	system.assert(ppCredEx.getTypeName().contains('PPAPICredentials.PPAPICredentialsException'));		   	
		}
		
		// No CertificatePassword
		try{
			PPAPICredential__c c4 = new PPAPICredential__c( Environment__c='Sandbox',ApplicationID__c='appid',APIProfile__c='CERTIFICATE', APIUsername__c='u4', APIUserpassword__c='p4',APICertificate__c='s4', name='testc4' );
			insert c4;
		}catch(PPAPICredentialsException ppCredEx){
		   	system.assert(ppCredEx.getTypeName().contains('PPAPICredentials.PPAPICredentialsException'));		   	
		}
	
		// No Certificate
		try{
			PPAPICredential__c c5 = new PPAPICredential__c( Environment__c='Sandbox',ApplicationID__c='appid',APIProfile__c='CERTIFICATE', APIUsername__c='u5', APIUserpassword__c='p5', APICertificatePassword__c='cp5', name='testc5' );
			insert c5;
			k = new PPAPICredentials('testc5');
		}catch(PPAPICredentialsException ppCredEx){
		   	system.assert(ppCredEx.getTypeName().contains('PPAPICredentials.PPAPICredentialsException'));		   	
		}
		
				
	}
}