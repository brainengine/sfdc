/*
    Copyright (c) 2009 salesforce.com, inc.
    All rights reserved.
    
    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions
    are met:
    
    1. Redistributions of source code must retain the above copyright
       notice, this list of conditions and the following disclaimer.
    2. Redistributions in binary form must reproduce the above copyright
       notice, this list of conditions and the following disclaimer in the
       documentation and/or other materials provided with the distribution.
    3. The name of the author may not be used to endorse or promote products
       derived from this software without specific prior written permission.
    
    THIS SOFTWARE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS OR
    IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
    OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
    IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, 
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
    NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
    THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
    THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/* This class shows an example of how to extend the GoogleDataSourceController. */
public class CallVolumeDataSourceController extends GoogleDataSourceController{
    public override String getTableName(){ return 'Call_Volume__c'; }
    
    public override List<String> getDefaultColumns() { 
        return new List<String>{ 'Id', 'Name', 'Date__c', 'Hour__c', 'Number_Of_Calls__c' }; 
    }
    
    private testMethod static void testCallVolumeDataTableCreation(){
        // Create our test data
        String expectedJSON = 'google.visualization.Query.setResponse({version:\'0.5\',reqId:\'0\',status:\'ok\',' + 
                              'table:{cols: [{id: "col0", label: "Hour__c", type: "string"},' + 
                                            '{id: "col1", label: "Number_of_Calls__c", type: "number"}], ' +
                                     'rows: [{c:[{v: "8 AM"},{v: 10.0}]},' + 
                                            '{c:[{v: "9 AM"},{v: 20.0}]},' + 
                                            '{c:[{v: "10 AM"},{v: 30.0}]}]}});';
        
        // This date that should guarantee that we get the Call_Volume__c records that we expect.
        String stringDate = '1999-01-01';
        Date testDate = Date.valueOf(stringDate);
        
        Call_Volume__c cv8am = new Call_Volume__c();
        cv8am.Hour__c = '8 AM';
        cv8am.Number_of_Calls__c = 10;
        cv8am.Date__c = testDate;
        insert cv8am;
        
        Call_Volume__c cv9am = new Call_Volume__c();
        cv9am.Hour__c = '9 AM';
        cv9am.Number_of_Calls__c = 20;
        cv9am.Date__c = testDate;
        insert cv9am;
        
        Call_Volume__c cv10am = new Call_Volume__c();
        cv10am.Hour__c = '10 AM';
        cv10am.Number_of_Calls__c = 30;
        cv10am.Date__c = testDate;
        insert cv10am;
                
        // Instantiate the page and the controller.
        PageReference pageRef = Page.CallVolume;
        Test.setCurrentPage(pageRef); // Set the current PageReference for the controller.
        CallVolumeDataSourceController cvdsController = new CallVolumeDataSourceController();
        
        // Only retrieve the records that we've created in this testMethod.
        String query = 'SELECT Hour__c, Number_of_Calls__c WHERE Date__c = ' + stringDate + ' ORDER BY Hour__c';
        pageRef.getParameters().put('tq', query);
        
        // Retrieve the JSON
        String actualJSON = cvdsController.getResponse();
        
        //System.debug('\n\n #### EXCPECTED:' + expectedJSON);
        //System.debug('\n\n #### ACTUAL:   ' + actualJSON);
        System.assertEquals(expectedJSON, actualJSON);
    }
}