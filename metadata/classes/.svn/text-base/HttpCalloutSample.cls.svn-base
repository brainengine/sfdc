public class HttpCalloutSample{

	public String getContent() {

		// Instantiate a new http object  
    
		Http h = new Http();

		// Instantiate a new HTTP request, specify the method (GET) as well as the endpoint  
    
		HttpRequest req = new HttpRequest();
		req.setEndpoint('https://api-3t.sandbox.paypal.com/nvp');
		req.setBody('USER=sdk-three_api1.sdk.com&PWD=QFZCWN5HZM8VBG7Q&SIGNATURE=A.d9eRKfd1yVkRrtmMfCFLTqa6M9AyodL0SJkhYztxUi8W9pCXF6.4NI&VERSION=56.0&METHOD=DoDirectPayment&PAYMENTACTION=Sale&AMT=1.00&CREDITCARDTYPE=Visa&ACCT=4581694251940002&EXPDATE=012012&CVV2=962&FIRSTNAME=John&LASTNAME=Doe&STREET=123+Fake+St&CITY=Omaha&STATE=NE&ZIP=68104&COUNTRYCODE=US&CURRENCYCODE=USD');
		req.setMethod('POST');

		// Send the request, and return a response  
		HttpResponse res = h.send(req);
		System.debug('response: ' + res.getBody());
		
		String response = res.getBody();
		Map<String, String> responseParameters = new Map<String, String>();
		
		//begin parsing the response
		List<String> parms = response.split('&');
		for(String parm : parms){
			System.debug('parm: ' + parm);
			List<String> variables = parm.split('=');
			String varName = variables[0];
			String varValue = variables[1];
			System.debug('parm: ' + varName);
			System.debug('value: ' + varValue);
			
			responseParameters.put(varName, varValue);
		}
		return res.getBody();
	}
}