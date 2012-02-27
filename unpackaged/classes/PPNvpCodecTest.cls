@isTest 
private class PPNvpCodecTest {
	static testMethod void testEncode() {   
        Map<String, String> tempMap = new Map<String, String>();
        tempMap.put('responseEnvelope.timestamp', '2009-07-13T12%3A34%3A29.316-07%3A00');
        tempMap.put('responseEnvelope.ack', 'Success');
        tempMap.put('responseEnvelope.correlationId', 'd615a365bed61');
        tempMap.put('responseEnvelope.build', 'DEV');
        tempMap.put('payKey', 'AP-3TY011106S4428730');
        tempMap.put('paymentExecStatus', 'CREATED');
        String encodedStr = PPNvpCodec.encode(tempMap);
        
        // Assertion
        String temp = EncodingUtil.urlEncode('2009-07-13T12%3A34%3A29.316-07%3A00', 'UTF-8');
        System.assert(encodedStr.contains('responseEnvelope.timestamp=' + temp));
        temp = EncodingUtil.urlEncode('Success', 'UTF-8');
        System.assert(encodedStr.contains('responseEnvelope.ack=' + temp));
        temp = EncodingUtil.urlEncode('d615a365bed61', 'UTF-8');
        System.assert(encodedStr.contains('responseEnvelope.correlationId=' + temp));
        temp = EncodingUtil.urlEncode('DEV', 'UTF-8');
        System.assert(encodedStr.contains('responseEnvelope.build=' + temp));
        temp = EncodingUtil.urlEncode('AP-3TY011106S4428730', 'UTF-8');
        System.assert(encodedStr.contains('payKey=' + temp));
        temp = EncodingUtil.urlEncode('CREATED', 'UTF-8');
        System.assert(encodedStr.contains('paymentExecStatus=' + temp));
        
	}
	
	static testMethod void testDecode() {
		String encodedStr = 'returnUrl=https%3A%2F%2Fc.na7.visual.force.com%2Fapex%2FReturnURL&' +
					  'currencyCode=USD&memo=test+app&' +
					  'clientDetails.applicationId=myapp&' +
					  'receiverList.receiver(0).amount=10.0&' +
					  'receiverList.receiver(0).email=manish_1250055563_biz%40persistent.co.in&' +
					  'feesPayer=EACHRECEIVER&clientDetails.ipAddress=172.16.4.89&' + 
					  'cancelUrl=https%3A%2F%2Fc.na7.visual.force.com%2Fapex%2FCancelURL&' +
					  'actionType=PAY&' +
					  'requestEnvelope.errorLanguage=en_US';   
        Map<String, String> tempMap = PPNvpCodec.decode(encodedStr);  
        
      	// Assertion
      	String temp = EncodingUtil.urlDecode('https%3A%2F%2Fc.na7.visual.force.com%2Fapex%2FReturnURL', 'UTF-8');
      	System.assert(tempMap.get(PPStaticRes.RETURN_URL).equals(temp));
      	temp = EncodingUtil.urlDecode('USD', 'UTF-8');
        System.assert(tempMap.get(PPStaticRes.CURRENCY_CODE).equals(temp));
        temp = EncodingUtil.urlDecode('test+app', 'UTF-8');
        System.assert(tempMap.get(PPStaticRes.MEMO).equals(temp));
        temp = EncodingUtil.urlDecode('10.0', 'UTF-8');
        String tag = PPStaticRes.RECEIVER_LIST + PPStaticRes.DOT + PPStaticRes.RECEIVER + PPStaticRes.OPENING_BRACKET + '0' + PPStaticRes.CLOSING_BRACKET + PPStaticRes.DOT;
        System.assert(tempMap.get(tag + PPStaticRes.AMOUNT).equals(temp));
        temp = EncodingUtil.urlDecode('manish_1250055563_biz%40persistent.co.in', 'UTF-8');
        System.assert(tempMap.get(tag + PPStaticRes.EMAIL).equals(temp));
        temp = EncodingUtil.urlDecode('EACHRECEIVER', 'UTF-8');
        System.assert(tempMap.get(PPStaticRes.FEES_PAYER).equals(temp));
        System.assert(tempMap.get(PPStaticRes.CLIENT_DETAILS + PPStaticRes.DOT + PPStaticRes.IP_ADDRESS).equals('172.16.4.89'));
        temp = EncodingUtil.urlDecode('https%3A%2F%2Fc.na7.visual.force.com%2Fapex%2FCancelURL', 'UTF-8');
        System.assert(tempMap.get(PPStaticRes.CANCEL_URL).equals(temp));
        temp = EncodingUtil.urlDecode('PAY', 'UTF-8');
        System.assert(tempMap.get(PPStaticRes.ACTION_TYPE).equals(temp));
        temp = EncodingUtil.urlDecode('en_US', 'UTF-8');
        System.assert(tempMap.get(PPStaticRes.REQUEST_ENVELOPE + PPStaticRes.DOT + PPStaticRes.ERROR_LANGUAGE).equals(temp));
	}
	
	
	static testMethod void nvpDecodeNegativeTestCase() {
		String encodedStr = 'returnUrl=ttps%3A%2F%2Fc.na7.visual.force.com%2Fapex%2FReturnURL' +
					  'currencyCodeUSD&memotest+app' +
					  'clientDetails.applicationId=myapp' +
					  'receiverList.receiver(0).amount=10.0' +
					  'receiverList.receiver(0).email=manish_1250055563_biz%40persistent.co.in' +
					  'feesPayerEACHRECEIVER&clientDetails.ipAddress=172.16.4.89' + 
					  'cancelUrlhttps%3A%2F%2Fc.na7.visual.force.com%2Fapex%2FCancelURL' +
					  'actionType=PAY&' +
					  'requestEnvelope.errorLanguage=en_US';   
        Map<String, String> tempMap = PPNvpCodec.decode(encodedStr);   
        
	}
}