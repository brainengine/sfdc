public class MedalliaManagement{

	public String url 				{get;set;}
	public String response 			{get;set;}
	
	//hold the values
	Set<String> ioIds = new Set<String>();
	//Map<String,Ad_Account__c> adAccountMap = new Map<String,Ad_Account__c>();
	
	public MedalliaManagement() {
		//url = 'https://api.medallia.com/mainstreet?user=john&pass=Ypass12&query=DESCRIBE+TABLE+survey&output=csv&version=1&apikey=5hxf4qz2qzjuxm46686csnwk';	
		url = 'https://api.medallia.com/facebookdso?user=salesforce_integration&pass=suba1car&query=DESCRIBE+TABLE+survey&output=csv&version=1&apikey=5hxf4qz2qzjuxm46686csnwk';	
		url = 'https://api.medallia.com/facebookdso?user=salesforce_integration&pass=suba1car&query=select+fullname%2C+responsedate%2C+br_overall_experience%2C+br_likely_to_recommend%2C+br_likely_to_buy_next_prod%2C+comments+from+survey+where+has_comment%3D1+order+by+responsedate+desc+limit+10&output=csv&version=1&apikey=5hxf4qz2qzjuxm46686csnwk';
		url = 'https://api.medallia.com/facebookdso?user=salesforce_integration&pass=suba1car&query=select+fullname%2C+responsedate%2C+br_overall_experience%2C+br_likely_to_recommend%2C+br_likely_to_buy_next_prod%2C+comments+from+survey+where+has_comment%3D1+order+by+responsedate+desc+limit+10&output=json&version=1&apikey=5hxf4qz2qzjuxm46686csnwk';
		url = 'https://api.medallia.com/facebookdso?user=salesforce_integration&pass=suba1car&query=select+fullname%2C+responsedate%2C+comments+from+survey+where+has_comment%3D1+order+by+responsedate+desc+limit+1&output=json&version=1&apikey=5hxf4qz2qzjuxm46686csnwk';
	}
	

	public PageReference GetIOValues(){
		
		try{
			//string sql = 'SELECT r_fbdso_io, r_fbdso_advertiser, r_fbdso_campaign, r_fbdso_am_id, r_fbdso_ae_id, r_fbdso_vertical, r_fbdso_agency, firstname, lastname, email, r_fbdso_bill_to_contact, r_fbdso_bill_to_city, r_fbdso_sales_channel, r_fbdso_io_print, r_fbdso_ao_id, r_fbdso_language_locale, responsedate, r_fbdso_ltr, r_fbdso_ltr_comment, r_fbdso_ov_sat, r_fbdso_reporting_post, r_fbdso_reporting_mid, r_fbdso_acct_man, r_fbdso_sales_rep, r_fbdso_sales_process, r_fbdso_adoperation_contact, r_fbdso_ad_products, r_fbdso_product_education, r_fbdso_audience_insights, r_fbdso_target_capabilities, r_fbdso_roi_scale, r_fbdso_roi_comment, r_fbdso_drive_traffice, r_fbdso_build_following, r_fbdso_purchase_consideration, r_fbdso_brand_awareness, r_fbdso_drive_traffice_offsite, r_fbdso_launch_product, r_fbdso_online_sales, r_fbdso_offline_sales, r_fbdso_other_text, r_fbdso_contact, r_fbdso_swag_yesno, r_fbdso_swag_name, r_fbdso_swag_email1 FROM survey limit 1';
			string sql = 'SELECT r_fbdso_io, email, r_fbdso_ltr_comment FROM survey limit 2';
			string formattedSql = EncodingUtil.urlEncode(sql, 'UTF-8');
		
			//https://api.medallia.com/facebookdso?user=salesforce_integration&pass=suba1car&query=select+fullname%2C+responsedate%2C+comments+from+survey+where+has_comment%3D1+order+by+responsedate+desc+limit+1&output=json&version=1&apikey=5hxf4qz2qzjuxm46686csnwk
			string pre = 'https://api.medallia.com/facebookdso?user=salesforce_integration&pass=suba1car&query=';
			string post = '&output=json&version=1&apikey=5hxf4qz2qzjuxm46686csnwk';
			url = pre + formattedSql + post;
		
			//url = 'https://api.medallia.com/facebookdso?user=salesforce_integration&pass=suba1car&query=DESCRIBE+TABLE+survey&output=csv&version=1&apikey=5hxf4qz2qzjuxm46686csnwk';
		
			Http h = new Http();
			HttpRequest req = new HttpRequest();
			req.setEndpoint(url);
			req.setMethod('GET');	
			
			// Send the request, and return a response  
			HttpResponse res = h.send(req);
			//System.debug('response: ' + res.getBody());
			response = res.getBody();
		
			//List<Medallia__c> surveys = new List<Medallia__c>();
			
			string simple = response.replaceAll('\"','\'');
			//string simple = simple2.replaceAll('\'','@@@');
			
			response += '### Loading JSON Object';
		
			
			JSONObject jj = new JSONObject( new JSONObject.JsonTokener(simple) ) ;
		
			JSONObject.value p = jj.getValue('query');
			//system.debug ('@@@@ A ' + p.obj.getValue('table'));
			JSONObject.value[] vals = p.obj.getValue('table').values;
		
			integer t =  vals.size();
		
			for (integer i = 0; i < vals.size(); i++) {
				JSONObject.value child = vals[i];
				JSONObject.value[] theValues = child.values;
			
				system.debug('@@@@ io number: ' + theValues[0].str);
				system.debug('@@@@ contact email: ' + theValues[1].str);
				system.debug('@@@@ survey id: ' + theValues[2].str);
				
				if(theValues[0].str != null){
					ioIds.add(theValues[0].str);
				}
				
			}
			
			
//			if(ioIds.size() > 0) {
//				response += ' @@@@@@@@ Finished Insert: ';
//				List<Ad_Account__c> accountRecords = [Select A.Ad_Account_ID__c, A.Insertion_Order__c, A.Insertion_Order_ID__c, A.Id from Ad_Account__c A where Insertion_Order__c IN : ioIds ];
//				for(Ad_Account__c account : accountRecords) {
//					adAccountMap.put(account.Insertion_Order_ID__c, account);
//				}
//				
//			}
//			
			response += ' @@@@@@@@ Finished Insert: ';
			return null;
			
			
		
		
			
		
			//	response += ' @@@@@@@@ Insert Size: ' + surveys.size().format();
			//			if(surveys.size() >0){
			//				insert(surveys);
			//			}
			response += ' @@@@@@@@ Finished Insert: ';
			
		}catch(Exception e){
			response += ' @@@@@@@@ ERROR: ' + e.getMessage();
		}
		
		return null;
	}
	
	public PageReference GetIOValues2(){
		
		try{
			//string sql = 'SELECT r_fbdso_io, r_fbdso_advertiser, r_fbdso_campaign, r_fbdso_am_id, r_fbdso_ae_id, r_fbdso_vertical, r_fbdso_agency, firstname, lastname, email, r_fbdso_bill_to_contact, r_fbdso_bill_to_city, r_fbdso_sales_channel, r_fbdso_io_print, r_fbdso_ao_id, r_fbdso_language_locale, responsedate, r_fbdso_ltr, r_fbdso_ltr_comment, r_fbdso_ov_sat, r_fbdso_reporting_post, r_fbdso_reporting_mid, r_fbdso_acct_man, r_fbdso_sales_rep, r_fbdso_sales_process, r_fbdso_adoperation_contact, r_fbdso_ad_products, r_fbdso_product_education, r_fbdso_audience_insights, r_fbdso_target_capabilities, r_fbdso_roi_scale, r_fbdso_roi_comment, r_fbdso_drive_traffice, r_fbdso_build_following, r_fbdso_purchase_consideration, r_fbdso_brand_awareness, r_fbdso_drive_traffice_offsite, r_fbdso_launch_product, r_fbdso_online_sales, r_fbdso_offline_sales, r_fbdso_other_text, r_fbdso_contact, r_fbdso_swag_yesno, r_fbdso_swag_name, r_fbdso_swag_email1 FROM survey limit 1';
			string sql = 'SELECT surveyid, r_fbdso_ltr_comment FROM survey limit 2';
			//string sql = 'SELECT r_fbdso_ltr_comment FROM survey';
			string formattedSql = EncodingUtil.urlEncode(sql, 'UTF-8');
		
			//https://api.medallia.com/facebookdso?user=salesforce_integration&pass=suba1car&query=select+fullname%2C+responsedate%2C+comments+from+survey+where+has_comment%3D1+order+by+responsedate+desc+limit+1&output=json&version=1&apikey=5hxf4qz2qzjuxm46686csnwk
			string pre = 'https://api.medallia.com/facebookdso?user=salesforce_integration&pass=suba1car&query=';
			string post = '&output=csv&version=1&apikey=5hxf4qz2qzjuxm46686csnwk';
			url = pre + formattedSql + post;
		
			//url = 'https://api.medallia.com/facebookdso?user=salesforce_integration&pass=suba1car&query=DESCRIBE+TABLE+survey&output=csv&version=1&apikey=5hxf4qz2qzjuxm46686csnwk';
		
			Http h = new Http();
			HttpRequest req = new HttpRequest();
			req.setEndpoint(url);
			req.setMethod('GET');	
			
			// Send the request, and return a response  
			HttpResponse res = h.send(req);
			//System.debug('response: ' + res.getBody());
			response = res.getBody();
			
			List<String> parts = response.split('\n');
			//string filename = parts[parts.size()-1];
			for (integer i = 0; i < parts.size(); i++) 
			{
				string filename = parts[i];
				response += '@@@' + String.valueOf(i) + ' - ' + filename;
				
				if(i != 0){
					List<String> values = filename.split(',', 2);
					response += '###' + values[0] + ' - ' + values[1];
					//response += '###' + String.valueOf(i) + ' - ' + filename;
				
					//				for (integer j = 0; j < values.size(); j++) 
					//				{
					//					response += '###' + String.valueOf(i) + ' - ' + filename;
					//				}
				}
			}
			//response += '###' +  filename;
			
			return null;
			
			//List<Medallia__c> surveys = new List<Medallia__c>();
			
			string simple = response.replaceAll('\"','\'');
			//string simple = simple2.replaceAll('\'','@@@');
			
			response += '### Loading JSON Object';
		
			
			JSONObject jj = new JSONObject( new JSONObject.JsonTokener(simple) ) ;
		
			JSONObject.value p = jj.getValue('query');
			//system.debug ('@@@@ A ' + p.obj.getValue('table'));
			JSONObject.value[] vals = p.obj.getValue('table').values;
		
			integer t =  vals.size();
		
			for (integer i = 0; i < vals.size(); i++) {
				JSONObject.value child = vals[i];
				JSONObject.value[] theValues = child.values;
			
				system.debug('@@@@ io number: ' + theValues[0].str);
				system.debug('@@@@ contact email: ' + theValues[1].str);
				system.debug('@@@@ survey id: ' + theValues[2].str);
				
				if(theValues[0].str != null){
					ioIds.add(theValues[0].str);
				}
				
			}
			
			
			//			if(ioIds.size() > 0) {
			//				response += ' @@@@@@@@ Finished Insert: ';
			//				List<Ad_Account__c> accountRecords = [Select A.Ad_Account_ID__c, A.Insertion_Order__c, A.Insertion_Order_ID__c, A.Id from Ad_Account__c A where Insertion_Order__c IN : ioIds ];
			//				for(Ad_Account__c account : accountRecords) {
			//					adAccountMap.put(account.Insertion_Order_ID__c, account);
			//				}
			//				
			//			}
			//			
			response += ' @@@@@@@@ Finished Insert: ';
			return null;
			
			
		
		
			
		
			//	response += ' @@@@@@@@ Insert Size: ' + surveys.size().format();
			//			if(surveys.size() >0){
			//				insert(surveys);
			//			}
			response += ' @@@@@@@@ Finished Insert: ';
			
		}catch(Exception e){
			response += ' @@@@@@@@ ERROR: ' + e.getMessage();
		}
		
		return null;
	}
	
	public PageReference GetIOValues3(){
		
		try{
			//string sql = 'SELECT r_fbdso_io, r_fbdso_advertiser, r_fbdso_campaign, r_fbdso_am_id, r_fbdso_ae_id, r_fbdso_vertical, r_fbdso_agency, firstname, lastname, email, r_fbdso_bill_to_contact, r_fbdso_bill_to_city, r_fbdso_sales_channel, r_fbdso_io_print, r_fbdso_ao_id, r_fbdso_language_locale, responsedate, r_fbdso_ltr, r_fbdso_ltr_comment, r_fbdso_ov_sat, r_fbdso_reporting_post, r_fbdso_reporting_mid, r_fbdso_acct_man, r_fbdso_sales_rep, r_fbdso_sales_process, r_fbdso_adoperation_contact, r_fbdso_ad_products, r_fbdso_product_education, r_fbdso_audience_insights, r_fbdso_target_capabilities, r_fbdso_roi_scale, r_fbdso_roi_comment, r_fbdso_drive_traffice, r_fbdso_build_following, r_fbdso_purchase_consideration, r_fbdso_brand_awareness, r_fbdso_drive_traffice_offsite, r_fbdso_launch_product, r_fbdso_online_sales, r_fbdso_offline_sales, r_fbdso_other_text, r_fbdso_contact, r_fbdso_swag_yesno, r_fbdso_swag_name, r_fbdso_swag_email1 FROM survey limit 1';
			string sql = 'select responsedate.year_and_month, count(*), sum(r_fbdso_reporting_mid), sum(r_fbdso_reporting_post), sum(r_fbdso_product_education) from survey';
			string formattedSql = EncodingUtil.urlEncode(sql, 'UTF-8');
		
			//https://api.medallia.com/facebookdso?user=salesforce_integration&pass=suba1car&query=select+fullname%2C+responsedate%2C+comments+from+survey+where+has_comment%3D1+order+by+responsedate+desc+limit+1&output=json&version=1&apikey=5hxf4qz2qzjuxm46686csnwk
			string pre = 'https://api.medallia.com/facebookdso?user=salesforce_integration&pass=suba1car&query=';
			string post = '&output=json&version=1&apikey=5hxf4qz2qzjuxm46686csnwk';
			url = pre + formattedSql + post;
		
			//url = 'https://api.medallia.com/facebookdso?user=salesforce_integration&pass=suba1car&query=DESCRIBE+TABLE+survey&output=csv&version=1&apikey=5hxf4qz2qzjuxm46686csnwk';
		
			Http h = new Http();
			HttpRequest req = new HttpRequest();
			req.setEndpoint(url);
			req.setMethod('GET');	
			
			// Send the request, and return a response  
			HttpResponse res = h.send(req);
			//System.debug('response: ' + res.getBody());
			response = res.getBody();
		
			//List<Medallia__c> surveys = new List<Medallia__c>();
			
			string simple = response.replaceAll('\"','\'');
			//string simple = simple2.replaceAll('\'','@@@');
			
			response += '### Loading JSON Object';
		
			
			JSONObject jj = new JSONObject( new JSONObject.JsonTokener(simple) ) ;
		
			JSONObject.value p = jj.getValue('query');
			//system.debug ('@@@@ A ' + p.obj.getValue('table'));
			JSONObject.value[] vals = p.obj.getValue('table').values;
		
			integer t =  vals.size();
		
			for (integer i = 0; i < vals.size(); i++) {
				JSONObject.value child = vals[i];
				JSONObject.value[] theValues = child.values;
			
				system.debug('@@@@ io number: ' + theValues[0].str);
				system.debug('@@@@ contact email: ' + theValues[1].str);
				system.debug('@@@@ survey id: ' + theValues[2].str);
				
				if(theValues[0].str != null){
					ioIds.add(theValues[0].str);
				}
				
			}
			
			
			//			if(ioIds.size() > 0) {
			//				response += ' @@@@@@@@ Finished Insert: ';
			//				List<Ad_Account__c> accountRecords = [Select A.Ad_Account_ID__c, A.Insertion_Order__c, A.Insertion_Order_ID__c, A.Id from Ad_Account__c A where Insertion_Order__c IN : ioIds ];
			//				for(Ad_Account__c account : accountRecords) {
			//					adAccountMap.put(account.Insertion_Order_ID__c, account);
			//				}
			//				
			//			}
			//			
			response += ' @@@@@@@@ Finished Insert: ';
			return null;
			
			
		
		
			
		
			//	response += ' @@@@@@@@ Insert Size: ' + surveys.size().format();
			//			if(surveys.size() >0){
			//				insert(surveys);
			//			}
			response += ' @@@@@@@@ Finished Insert: ';
			
		}catch(Exception e){
			response += ' @@@@@@@@ ERROR: ' + e.getMessage();
		}
		
		return null;
	}
	
	public PageReference GetAggregateValue(){
		
		try{
			//string sql = 'SELECT r_fbdso_io, r_fbdso_advertiser, r_fbdso_campaign, r_fbdso_am_id, r_fbdso_ae_id, r_fbdso_vertical, r_fbdso_agency, firstname, lastname, email, r_fbdso_bill_to_contact, r_fbdso_bill_to_city, r_fbdso_sales_channel, r_fbdso_io_print, r_fbdso_ao_id, r_fbdso_language_locale, responsedate, r_fbdso_ltr, r_fbdso_ltr_comment, r_fbdso_ov_sat, r_fbdso_reporting_post, r_fbdso_reporting_mid, r_fbdso_acct_man, r_fbdso_sales_rep, r_fbdso_sales_process, r_fbdso_adoperation_contact, r_fbdso_ad_products, r_fbdso_product_education, r_fbdso_audience_insights, r_fbdso_target_capabilities, r_fbdso_roi_scale, r_fbdso_roi_comment, r_fbdso_drive_traffice, r_fbdso_build_following, r_fbdso_purchase_consideration, r_fbdso_brand_awareness, r_fbdso_drive_traffice_offsite, r_fbdso_launch_product, r_fbdso_online_sales, r_fbdso_offline_sales, r_fbdso_other_text, r_fbdso_contact, r_fbdso_swag_yesno, r_fbdso_swag_name, r_fbdso_swag_email1 FROM survey limit 1';
			string sql = 'select r_fbdso_survey_creation_date.year_and_month, count(*), avg(r_fbdso_reporting_mid) from survey ';
			string formattedSql = EncodingUtil.urlEncode(sql, 'UTF-8');
		
			//https://api.medallia.com/facebookdso?user=salesforce_integration&pass=suba1car&query=select+fullname%2C+responsedate%2C+comments+from+survey+where+has_comment%3D1+order+by+responsedate+desc+limit+1&output=json&version=1&apikey=5hxf4qz2qzjuxm46686csnwk
			string pre = 'https://api.medallia.com/facebookdso?user=salesforce_integration&pass=suba1car&query=';
			string post = '&output=json&version=1&apikey=5hxf4qz2qzjuxm46686csnwk';
			url = pre + formattedSql + post;
		
			//url = 'https://api.medallia.com/facebookdso?user=salesforce_integration&pass=suba1car&query=DESCRIBE+TABLE+survey&output=csv&version=1&apikey=5hxf4qz2qzjuxm46686csnwk';
		
			Http h = new Http();
			HttpRequest req = new HttpRequest();
			req.setEndpoint(url);
			req.setMethod('GET');	
			
			// Send the request, and return a response  
			HttpResponse res = h.send(req);
			//System.debug('response: ' + res.getBody());
			response = res.getBody();
		
			//List<Medallia__c> surveys = new List<Medallia__c>();
			
			string simple = response.replaceAll('\"','\'');
			//string simple = simple2.replaceAll('\'','@@@');
			
			response += '### Loading JSON Object';
		
			
			JSONObject jj = new JSONObject( new JSONObject.JsonTokener(simple) ) ;
		
			JSONObject.value p = jj.getValue('query');
			//system.debug ('@@@@ A ' + p.obj.getValue('table'));
			JSONObject.value[] vals = p.obj.getValue('table').values;
		
			integer t =  vals.size();
		
			for (integer i = 0; i < vals.size(); i++) {
				JSONObject.value child = vals[i];
				JSONObject.value[] theValues = child.values;
			
				system.debug('@@@@ io number: ' + theValues[0].str);
				system.debug('@@@@ contact email: ' + theValues[1].str);
				system.debug('@@@@ survey id: ' + theValues[2].str);
				
				response += ' @@@@@@@@ month: ' + theValues[0].str;
				response += ' @@@@@@@@ count: ' + theValues[1].str;
				response += ' @@@@@@@@ value: ' + theValues[2].str;
				
				Decimal myDecimal = decimal.valueOf(theValues[2].str);
				Long L1 = myDecimal.round();
				response += ' @@@@@@@@ value2: ' + string.valueof(L1);
				
				if(theValues[0].str != null){
					ioIds.add(theValues[0].str);
				}
				
			}
			
			
			//			if(ioIds.size() > 0) {
			//				response += ' @@@@@@@@ Finished Insert: ';
			//				List<Ad_Account__c> accountRecords = [Select A.Ad_Account_ID__c, A.Insertion_Order__c, A.Insertion_Order_ID__c, A.Id from Ad_Account__c A where Insertion_Order__c IN : ioIds ];
			//				for(Ad_Account__c account : accountRecords) {
			//					adAccountMap.put(account.Insertion_Order_ID__c, account);
			//				}
			//				
			//			}
			//			
			response += ' @@@@@@@@ Finished Insert: ';
			return null;
			
			
		
		
			
		
			//	response += ' @@@@@@@@ Insert Size: ' + surveys.size().format();
			//			if(surveys.size() >0){
			//				insert(surveys);
			//			}
			response += ' @@@@@@@@ Finished Insert: ';
			
		}catch(Exception e){
			response += ' @@@@@@@@ ERROR: ' + e.getMessage();
		}
		
		return null;
	}
	
	public static testmethod void test_g(){

																								
		string simple = '{ "query": { "resultCode":0,"table": [[ "21431","Sprint","2009 Nascar","Foy, Rebecca","Mahoney, Sean","TELECOMMUNICATIONS-Telecommunications","MindShare Interaction","Betsy","Paynter","elizabeth.paynter@mindshareworld.com","","","","","Nicolle Quintero","","2010-01-21","7","Facebook delivers advertisers a large audience of captive users. Their ad solutions provide a great way for marketers to gain the attention of the audience they want to capture as well as the attention of those users friends through the newsfeed. Our reporting indicates that for certain campaigns our ads perform very very well. Obviously as a marketer you cant ignore the power of advertising on Facebook so I wouldnt reccomend ignoring them as a platform. However, past experiences the Facebook sales team has left my team and our clients less than thrilled. Being asked for more and more money, being held to monthly minimum spends, not being able to revise invoices are a few complaints that my team has voiced over the past year. We feel that despite these demands we are given very little back in terms of sales support (good ideas, unique solutions, ways to grow our brand on FB). With the budgets we spend wed appreciate a bit more support from the team. We hope in the future that Facebook will expand their ad opportunities beyond the 110x80 units and allow advertisers to have a bit more freedom/customization with their ads.","5","4","4","3","3","3","","2","3","3","4","4","If our sales team was a bit more attentive to the needs of our client and kept in mind who our client is and what our goals are when they submit proposals. Also if we were given more freedom to customize our ads as well as our brand pages.","Yes","Yes","Yes","Yes","No","No","No","No","","Yes, feel free to contact me","","","" ],[ "99999","Sprint","2009 Nascar","Foy, Rebecca","Mahoney, Sean","TELECOMMUNICATIONS-Telecommunications","MindShare Interaction","Betsy","Paynter","elizabeth.paynter@mindshareworld.com","","","","","Nicolle Quintero","","2010-01-21","7","Facebook delivers advertisers a large audience of captive users. Their ad solutions provide a great way for marketers to gain the attention of the audience they want to capture as well as the attention of those users friends through the newsfeed. Our reporting indicates that for certain campaigns our ads perform very very well. Obviously as a marketer you cant ignore the power of advertising on Facebook so I wouldnt reccomend ignoring them as a platform. However, past experiences the Facebook sales team has left my team and our clients less than thrilled. Being asked for more and more money, being held to monthly minimum spends, not being able to revise invoices are a few complaints that my team has voiced over the past year. We feel that despite these demands we are given very little back in terms of sales support (good ideas, unique solutions, ways to grow our brand on FB). With the budgets we spend wed appreciate a bit more support from the team. We hope in the future that Facebook will expand their ad opportunities beyond the 110x80 units and allow advertisers to have a bit more freedom/customization with their ads.","5","4","4","3","3","3","","2","3","3","4","4","If our sales team was a bit more attentive to the needs of our client and kept in mind who our client is and what our goals are when they submit proposals. Also if we were given more freedom to customize our ads as well as our brand pages.","Yes","Yes","Yes","Yes","No","No","No","No","","Yes, feel free to contact me","","","" ]] } }';
		JSONObject jj = new JSONObject( new JSONObject.JsonTokener(simple) ) ;
		
		JSONObject.value p = jj.getValue('query');
		system.debug ('@@@@ A ' + p.obj.getValue('table'));
		JSONObject.value[] vals = p.obj.getValue('table').values;
		
		integer t =  vals.size();
		
		for (integer i = 0; i < vals.size(); i++) {
			JSONObject.value child = vals[i];
			JSONObject.value[] theValues = child.values;
			
			system.debug('@@@@ r_fbdso_io ' + theValues[0].str);
			system.debug('@@@@ r_fbdso_advertiser ' + theValues[1].str);
			system.debug('@@@@ r_fbdso_campaign ' + theValues[2].str);
		}
		
		
		////		system.debug('@@@@ length ' + t);
		////		system.debug('@@@@ B ' + vals[0].str);
		////		
		////		JSONObject.value pp = vals[0];
		////		system.debug ('@@@@ A1 ' + pp);
		////		JSONObject.value[] vals1 = pp.values;
		
		/*
		0 - r_fbdso_io
		1 - r_fbdso_advertiser
		2 - r_fbdso_campaign
		3 - r_fbdso_am_id
		4 - r_fbdso_ae_id
		5 - r_fbdso_vertical
		6 - r_fbdso_agency
		7 - firstname
		8 - lastname
		9 - email
		10 - r_fbdso_bill_to_contact
		11 - r_fbdso_bill_to_city
		12 - r_fbdso_sales_channel
		13 - r_fbdso_io_print
		14 - r_fbdso_ao_id
		15 - r_fbdso_language_locale
		16 - responsedate
		17 - r_fbdso_ltr
		18 - r_fbdso_ltr_comment
		19 - r_fbdso_ov_sat
		20 - r_fbdso_reporting_post
		21 - r_fbdso_reporting_mid
		22 - r_fbdso_acct_man
		23 - r_fbdso_sales_rep
		24 - r_fbdso_sales_process
		25 - r_fbdso_adoperation_contact
		26 - r_fbdso_ad_products
		27 - r_fbdso_product_education
		28 - r_fbdso_audience_insights
		29 - r_fbdso_target_capabilities
		30 - r_fbdso_roi_scale
		31 - r_fbdso_roi_comment
		32 - r_fbdso_drive_traffice
		33 - r_fbdso_build_following
		34 - r_fbdso_purchase_consideration
		35 - r_fbdso_brand_awareness
		36 - r_fbdso_drive_traffice_offsite
		37 - r_fbdso_launch_product
		38 - r_fbdso_online_sales
		39 - r_fbdso_offline_sales
		40 - r_fbdso_other_text
		41 - r_fbdso_contact
		42 - r_fbdso_swag_yesno
		43 - r_fbdso_swag_name
		44 - r_fbdso_swag_email1
		*/
		
		//Linking fields
		//io
		//contact - who took the survey
		//sales rep
		
		//		system.debug('@@@@ r_fbdso_io ' + vals1[0].str);
		//		system.debug('@@@@ r_fbdso_advertiser ' + vals1[1].str);
		//		system.debug('@@@@ r_fbdso_campaign ' + vals1[2].str);
		//		
		//		
		//		JSONObject.value ppp = vals[1];
		//		JSONObject.value[] vals2 = ppp.values;
		//		system.debug ('@@@@ A2 ' + ppp);
		//		system.debug('@@@@ r_fbdso_io ' + vals2[0].str);
		
		
	}
	
	

}