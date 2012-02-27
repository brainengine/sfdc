public class PPRequestEnvelope {
    // (Optional) The level of detail required by the client application 
    // for component such as Item, Transaction.
    public String DetailLevelCode{get; set;}
    
    // (Required) The RFC 3066 language in which error messages are 
    // returned. By default it is en_US, which is the only language 
    // currently supported.
    public String ErrorLanguage{get; set;}
    
    public PPRequestEnvelope() {
        DetailLevelCode = '';
        ErrorLanguage = '';
    }
}