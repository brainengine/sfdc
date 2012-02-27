public class StoreFront{

//	public PageReference shop() {
//		return null;
//	}
    
	DisplayMerchandise[] products;
	
public String message {get; set;}   

	public class DisplayMerchandise {
		public Merchandise__c merchandise { get; set; }
		public Decimal count { get; set; }
		public DisplayMerchandise(Merchandise__c item) {
			this.merchandise = item;
		}
	}

	public DisplayMerchandise[] getProducts() {
		if (products == null) {
			products = new DisplayMerchandise[]{};
			for (Merchandise__c item : 
				[SELECT id, name, description__c, price__c 
				FROM Merchandise__c 
				WHERE Inventory__c > 0]) {
			products.add(new DisplayMerchandise(item));
		}
			}
		return products;      
	}
	
	public PageReference shop2() {
		message = 'You bought: ';
		for (DisplayMerchandise p: products) {
			if (p.count > 0) {
				message += p.merchandise.name + ' (' + p.count + ')    ';
			}
		}
		return null;
	}
	
	public PageReference shop() { 
		message = 'You are   buying: '; 
		Double   totalOrderAmount = 0; 
		for (DisplayMerchandise p: products) { 
			if (p.count > 0) { 
				message += p.merchandise.name + ' (' + p.count   + ') '; 
				totalOrderAmount += p.count * p.merchandise.Price__c; 
			} 
		} 
		totalOrderAmount = 45.99;
		if(totalOrderAmount > 0) { 
			User user = [select id,   username, Profile.Name, email from User where id = :Userinfo.getUserId()]; 
			return SendPayRequest(totalOrderAmount,   'bmatth_1281040218_biz@mrchouston.com', 'seller_1281458905_biz@mrchouston.com', message); 
		} else { 
			System.debug('User did not enter # of items'); 
			return null; 
		} 
	}
	
	// method to send Pay   Request to PayPal 
	private PageReference SendPayRequest(Double   amount, String paypalSenderId, String paypalReceiverId, String message) { 
                   
		PageReference returnPage;        
		// create request envelope and set   the common request parameters object name 
		PPPayRequest request = new PPPayRequest('Demo', paypalSenderId); 
		// set success and cancel urls 
		String host = ApexPages.currentPage().getHeaders().get('Host'); 
		request.CancelUrl = 'https://' + host + '/StoreFront?status=cancel'; 
		request.ReturnUrl = 'https://' + host + '/StoreFront?status=success'; 
		// set a note associated with the   payment        
		request.Memo = message;  
		// set Receiver info - there can be   more than one receiver - but for this example we will use just one 
		List<PPReceiver> receiverList = new List<PPReceiver>(); 
		PPReceiver receiver1 = new PPReceiver(); 
		// set the receiver email   (receiver's PayPal Id) 
		receiver1.email = paypalReceiverId; 
		// set amount to be credited to the   receiver's account 
		receiver1.amount = amount; 
		receiverList.Add(receiver1); 
		// set receiver info in the request 
		request.receiverList = receiverList; 
		// create the Adaptive Toolkit   object instance w/ API Credentials 
		PPAdaptiveToolkit toolkit = new PPAdaptiveToolkit('Credentials'); 
		try { 
			// send the PayRequest using the   Adaptive toolkit object 
			PPPayResponse response = toolkit.pay(request); 
			// check the   response payment status 
			if (   response.PaymentExecStatus.equalsIgnoreCase('Created') ) { 
				// if the payment status is   'Created' - send the user to approval page 
				//   commitpayment() method constructs the PayPal approval url 
				returnPage = toolkit.commitpayment(response.payKey); 
			} else if(   response.PaymentExecStatus.equalsIgnoreCase('Completed') ) { 
				// if the payment   is 'Completed' (when no approval is required 
				//  - returned in case of pre-approvals   or implicit approvals)
				// send the user to the return url 
				returnPage = new pagereference(request.returnUrl); 
			} 
			return returnPage; 
		} catch(PPFaultMessageException faultMsg) { 
			System.debug('executePAY_SIMPLE_EXPLICIT_SENDER   failed =>' + faultMsg); 
			returnPage = new pagereference('https://' + host + '/?error=1&faultMsg=' + faultMsg); 
		} catch(System.Exception e) { 
			System.debug('executePAY_SIMPLE_EXPLICIT_SENDER   failed =>' + e); 
			returnPage = new pagereference('https://' + host + '/?error=2&exp=' + e);            
		} 
		return returnPage; 
	}

}