public class CreditCardProcessing{

	/**
 	* Credit Card processing class
 	*/

	public String strMethod 			{get;set;}
	public String strPaymentAction 		{get;set;}
	public String strAMT	 			{get;set;}
	public String strCCType 			{get;set;}
	public String strAccntNumber 		{get;set;}
	public String strExpDate 			{get;set;}
	public String strCVV2 				{get;set;}
	public String strFirstName 			{get;set;}
	public String strLastName 			{get;set;}
	public String strStreet 			{get;set;}
	public String strCity 				{get;set;}
	public String strState	 			{get;set;}
	public String strZip	 			{get;set;}
	public String strCountryCode 		{get;set;}
	public String strCurrencycode	 	{get;set;}
	public String strCredential		 	{get;set;}
	
	private String endPoint = 'https://api-3t.sandbox.paypal.com/nvp';
	private String strUID;
	private String strPWD;
	private String strSignature;
	private String strVersion;
	private String strEnvironment;
	private string body = '';
	public string strResponse = '';
	public Map<String, String> responseParameters = new Map<String, String>();
	
	public boolean makePayment(){
		
		//core function used to create the credit card request
		boolean result = false;
		try{
			PPAPICredentials apiCredObj = new PPAPICredentials(strCredential);
			strUID = apiCredObj.APIUsername;
			strPWD = apiCredObj.APIUserpassword;
			strSignature = apiCredObj.APISignature;
			strVersion = '64.0';
			strEnvironment = apiCredObj.Environment;
			
			//set the default operation parameters
			strMethod = 'DoDirectPayment';
			strPaymentAction = 'Sale';
				
			System.debug('uid: ' + strUID);
			System.debug('pwd: ' + strPWD);
			System.debug('signature: ' + strSignature);
			System.debug('version: ' + strVersion);
			System.debug('environment: ' + strEnvironment);
			
			PayPalSettings__c settings = PayPalSettings__c.getValues('Default');
			if(strEnvironment == 'Sandbox'){
				endPoint = settings.Sandbox__c;
			}else{
				endPoint = settings.Production__c;
			}
			System.debug('server url: ' + endPoint);
			
			body += 'USER=' + strUID;
			body += '&PWD=' + strPWD;
			body += '&SIGNATURE=' + strSignature;
			body += '&VERSION=' + strVersion;
			body += '&METHOD=' + strMethod;
			body += '&PAYMENTACTION=' + strPaymentAction;
			body += '&AMT=' + strAMT;
			body += '&CREDITCARDTYPE=' + strCCType;
			body += '&ACCT=' + strAccntNumber;
			body += '&EXPDATE=' + strExpDate;
			body += '&CVV2=' + strCVV2;
			body += '&FIRSTNAME=' + EncodingUtil.urlEncode(strFirstName, 'UTF-8');
			body += '&LASTNAME=' + EncodingUtil.urlEncode(strLastName, 'UTF-8');
			body += '&STREET=' + EncodingUtil.urlEncode(strStreet, 'UTF-8');
			body += '&CITY=' + EncodingUtil.urlEncode(strCity, 'UTF-8');
			body += '&STATE=' + strState;
			body += '&ZIP=' + strZip;
			body += '&COUNTRYCODE=' + strCountryCode;
			body += '&CURRENCYCODE=' + strCurrencycode;
			
			System.debug('body: ' + body);
			
			//create the http requet
			Http h = new Http();
			HttpRequest req = new HttpRequest();
			req.setEndpoint(endPoint);
			req.setBody(body);
			req.setMethod('POST');	
			
			// Send the request, and return a response  
			HttpResponse res = h.send(req);
			System.debug('response: ' + res.getBody());
			String response = res.getBody();
			
			//begin parsing the response
			List<String> parms = response.split('&');
			for(String parm : parms){
				System.debug('parm: ' + parm);
				List<String> variables = parm.split('=');
				String parmName = variables[0];
				String parmValue = variables[1];
				System.debug('parm: ' + parmName);
				System.debug('value: ' + parmValue);
				responseParameters.put(parmName, parmValue);
			}
			
			String ack = responseParameters.get('ACK');
			System.debug('ack result: ' + ack);
			if(ack.toLowerCase() == 'success'){
				System.debug('ACK = Success');
				result = true;	
			}else{
				System.debug('ACK = Failure');
			}
			
			//set the response body
			strResponse = res.getBody();
			
		}catch(exception se){
		}
		
		return result;
	}
	
	public boolean doRefund(string transactionId, string refundType, string memo, string amount){
		
		boolean result;
		try{
			PPAPICredentials apiCredObj = new PPAPICredentials(strCredential);
			strUID = apiCredObj.APIUsername;
			strPWD = apiCredObj.APIUserpassword;
			strSignature = apiCredObj.APISignature;
			strVersion = '56.0';
			strEnvironment = apiCredObj.Environment;
			
			//set the default operation parameters
			strMethod = 'RefundTransaction';
				
			System.debug('uid: ' + strUID);
			System.debug('pwd: ' + strPWD);
			System.debug('signature: ' + strSignature);
			System.debug('version: ' + strVersion);
			System.debug('environment: ' + strEnvironment);
			
			PayPalSettings__c settings = PayPalSettings__c.getValues('Default');
			if(strEnvironment == 'Sandbox'){
				endPoint = settings.Sandbox__c;
			}else{
				endPoint = settings.Production__c;
			}
			System.debug('server url: ' + endPoint);
			
			body += 'USER=' + strUID;
			body += '&PWD=' + strPWD;
			body += '&SIGNATURE=' + strSignature;
			body += '&VERSION=' + strVersion;
			body += '&METHOD=' + strMethod;
			body += '&TRANSACTIONID=' + transactionId;
			body += '&REFUNDTYPE=' + refundType;
			body += '&NOTE=' + memo;
			if(refundType != 'Full'){
				body += '&AMT=' + amount;
			}
			
			System.debug('body: ' + body);
			
			//create the http requet
			Http h = new Http();
			HttpRequest req = new HttpRequest();
			req.setEndpoint(endPoint);
			req.setBody(body);
			req.setMethod('POST');	
			
			// Send the request, and return a response  
			HttpResponse res = h.send(req);
			System.debug('response: ' + res.getBody());
			String response = res.getBody();
			
			//begin parsing the response
			List<String> parms = response.split('&');
			for(String parm : parms){
				System.debug('parm: ' + parm);
				List<String> variables = parm.split('=');
				String parmName = variables[0];
				String parmValue = variables[1];
				System.debug('parm: ' + parmName);
				System.debug('value: ' + parmValue);
				responseParameters.put(parmName, parmValue);
			}
			
			String ack = responseParameters.get('ACK');
			System.debug('ack result: ' + ack);
			if(ack.toLowerCase() == 'success'){
				System.debug('ACK = Success');
				result = true;	
			}else{
				System.debug('ACK = Failure');
			}
			
			//set the response body
			strResponse = res.getBody();
			
		}catch(Exception se){
			
		}
		
		return result;
		
	}
	
	public boolean getTransactionDetails(string transactionId){
		
		boolean result;
		try{
			PPAPICredentials apiCredObj = new PPAPICredentials(strCredential);
			strUID = apiCredObj.APIUsername;
			strPWD = apiCredObj.APIUserpassword;
			strSignature = apiCredObj.APISignature;
			strVersion = '56.0';
			strEnvironment = apiCredObj.Environment;
			
			//set the default operation parameters
			strMethod = 'GetTransactionDetails';
				
			System.debug('uid: ' + strUID);
			System.debug('pwd: ' + strPWD);
			System.debug('signature: ' + strSignature);
			System.debug('version: ' + strVersion);
			System.debug('environment: ' + strEnvironment);
			
			PayPalSettings__c settings = PayPalSettings__c.getValues('Default');
			if(strEnvironment == 'Sandbox'){
				endPoint = settings.Sandbox__c;
			}else{
				endPoint = settings.Production__c;
			}
			System.debug('server url: ' + endPoint);
			
			body += 'USER=' + strUID;
			body += '&PWD=' + strPWD;
			body += '&SIGNATURE=' + strSignature;
			body += '&VERSION=' + strVersion;
			body += '&METHOD=' + strMethod;
			body += '&TRANSACTIONID=' + transactionId;
			
			System.debug('body: ' + body);
			
			//create the http requet
			Http h = new Http();
			HttpRequest req = new HttpRequest();
			req.setTimeout(60000);
			req.setEndpoint(endPoint);
			req.setBody(body);
			req.setMethod('POST');	
			
			// Send the request, and return a response  
			HttpResponse res = h.send(req);
			System.debug('response: ' + res.getBody());
			String response = res.getBody();
			
			//begin parsing the response
			List<String> parms = response.split('&');
			for(String parm : parms){
				System.debug('parm: ' + parm);
				List<String> variables = parm.split('=');
				String parmName = variables[0];
				String parmValue = variables[1];
				System.debug('parm: ' + parmName);
				System.debug('value: ' + parmValue);
				responseParameters.put(parmName, parmValue);
			}
			
			String ack = responseParameters.get('ACK');
			System.debug('ack result: ' + ack);
			if(ack.toLowerCase() == 'success'){
				System.debug('ACK = Success');
				result = true;	
			}else{
				System.debug('ACK = Failure');
			}
			
			//set the response body
			strResponse = res.getBody();
			
		}catch(Exception se){
			
		}
		
		return result;
		
	}
	
	public string executePayment(){
		//test method to be used from the console
		strCredential = 'Test';
		strAMT = '1.00';
		strCCType = 'Visa';
		strAccntNumber = '4581694251940002';
		strExpDate = '012012';
		strCVV2 = '962';
		strFirstName = 'John';
		strLastName = 'Doe';
		strStreet = '123 Fake Street';
		strCity = 'Omaha';
		strState = 'NE';
		strZip = '68104';
		strCountryCode = 'US';
		strCurrencycode = 'USD';
	
		makePayment();
		return strResponse;
	}
	
	public string executeRefund(string transactionId){
		//test method to be used from the console
		strCredential = 'Test_Credentials';
		doRefund('2VN46681SJ672572B', 'Full', 'sample memo', '16.60');
		return strResponse;
	}
	
	public string executeTransactionDetails(string transactionId){
		//test method to be used from the console
		strCredential = 'Test';
		getTransactionDetails(transactionId);
		return strResponse;
	}
	
}