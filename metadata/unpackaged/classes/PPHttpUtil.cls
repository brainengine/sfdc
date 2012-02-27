public class PPHttpUtil {
   
    public PPHttpUtil() {
    	m_httpRequest = new HttpRequest();	
    }
    
    public void createHttpRequest(String endPoint, String method, 
    	Map<String, String> headers, String body) {
        m_httpRequest.setEndpoint(endPoint);
        setHeaders(headers);
        m_httpRequest.setMethod(method);
        m_httpRequest.setBody(body);
        m_httpRequest.setTimeout(60000);
    }
    
    public void setCertificate(String certificate, String password) {
    	m_httpRequest.setClientCertificate(certificate, password);
    }

    public HttpResponse execute() {
        HttpResponse response = null;
        if (canCallout) {   
	        response = new Http().send(m_httpRequest);
	        if(200 != response.getStatusCode()){
		    	PPFaultMessageException ex = new PPFaultMessageException();
		    	String errorMessage = PPAdaptiveErrors.ERROR_STRING_HTTP_RESPONSE + 
		    					response.getStatusCode() + ', Message: ' + response.getStatus();
		    	ex.populateWithCustomError(PPAdaptiveErrors.ERROR_HTTP_RESPONSE, errorMessage);
		    	throw ex;
	        }
        }else {
		    PPFaultMessageException ex = new PPFaultMessageException();
		    ex.populateWithCustomError(PPAdaptiveErrors.ERROR_GOVERNOR_LIMITE_WEB_CALLOUT, 
		    	PPAdaptiveErrors.ERROR_STRING_GOVERNOR_LIMITE_WEB_CALLOUT);
    	    throw ex;
        }
        return response;
    }
    
    public String getBody() { return m_httpRequest.getBody(); }
    public String getMethod() { return m_httpRequest.getMethod(); }
    public String getEndPoint() { return m_httpRequest.getEndpoint(); }
    public String getHeader(String Key) { return m_httpRequest.getHeader(key);} 
    
    private void setHeaders(Map<String, String> headers) {
    	set<String> keySet = headers.keySet();
        for (String key : keySet) {
        	m_httpRequest.setHeader(key, headers.get(key));
        }
    }

    private Boolean canCallout { 
	    get { return Limits.getCallouts() < limits.getLimitCallouts() ; }
    }

    private HttpRequest m_httpRequest;
    
}