public class MedalliaPOC{


	public void Connect(){
		
		//https://api.medallia.com/yourcompany?user=username&pass=password&query=describe+table+survey&output=csv|json&version=1&apikey=value
		string url = 'https://api.medallia.com/salesforce?user=breal123&pass=winter54&query=describe+table+survey&output=csv&version=1&apikey=bm6sw9n46ym79mvgz6b4vtbz';
		url = 'https://api.medallia.com/mainstreet?user=breal123&pass=winter54&query=select+count%28*%29+from+survey&output=csv&version=1&apikey=5hxf4qz2qzjuxm46686csnwk';
		url = 'https://api.medallia.com/mainstreet?user=john&pass=Ypass12&query=DESCRIBE+TABLE+survey&output=csv&version=1&apikey=5hxf4qz2qzjuxm46686csnwk';
		url = 'https://api.medallia.com/mainstreet?user=breal123&pass=winter54&query=DESCRIBE+TABLE+survey&output=csv&version=1&apikey=5hxf4qz2qzjuxm46686csnwk';
		
		//create the http requet
		Http h = new Http();
		HttpRequest req = new HttpRequest();
		req.setEndpoint(url);
		//req.setBody(body);
		req.setMethod('GET');	
			
		// Send the request, and return a response  
		HttpResponse res = h.send(req);
		System.debug('response: ' + res.getBody());
		String response = res.getBody();
		
	}
	
}