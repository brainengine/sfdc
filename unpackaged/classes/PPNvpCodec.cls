public class PPNvpCodec {
    public static String encode(Map<String, String> parameters) {
		String retVal = '';
        set <String> keySet = parameters.keySet();
        List <String> tempList = new List<String>();
        for (String key: keySet) {
        	tempList.add(key);
        }
        tempList.sort();
		
        if(0 < tempList.size()) {
	    	retVal += tempList[0];
	        retVal += PPStaticRes.EQUAL;
	        retVal += EncodingUtil.urlEncode(parameters.get(tempList[0]), PPStaticRes.UTF_8); 
        }
            
        for (Integer index = 1; index < tempList.size(); index++) {
            retVal += PPStaticRes.AMPERSAND;
            retVal += tempList[index];
            retVal += PPStaticRes.EQUAL;
            retVal += EncodingUtil.urlEncode(parameters.get(tempList[index]), PPStaticRes.UTF_8); 
        }

        return retVal;
    }

    public static Map<String, String> decode(String encodedStr) {
       Map<String, String> retVal = new Map<String, String>();
        try {
            String[] pairs = encodedStr.split(PPStaticRes.AMPERSAND, 0);
            for (Integer i = 0; i < pairs.size(); i++) {
                String[] pair = pairs[i].Split(PPStaticRes.EQUAL);
                retVal.put(pair[0], EncodingUtil.urlDecode(pair[1], PPStaticRes.UTF_8));
            }
        }
        catch (System.Exception e) {
            System.Debug(Logginglevel.ERROR, 'PPNvpCodec:decode() : ' + e);
        }
        return retVal;
    }
}