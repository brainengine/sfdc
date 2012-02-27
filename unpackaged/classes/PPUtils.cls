public class PPUtils {
	public static Map<String, String> getMapWithSpecificKeys(Map<String, String> sourceMap, String keyPattern) {
    	Map<String, String> retVal = new Map<String, String>();
    	set<String> keySet = sourceMap.keySet();
    	for (String key : keySet) {
    		if (key.contains(keyPattern))
    			retVal.put(key, sourceMap.get(key));
    	}
    	return retVal;
    }
}