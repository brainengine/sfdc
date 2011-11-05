/*
    Copyright (c) 2008 salesforce.com, inc.
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

public class OpporunityExtension {
	
	private Opportunity o;
    
    public OpporunityExtension(ApexPages.StandardController stdController) {
        o = (Opportunity)stdController.getRecord();
    }
	
	public String getAmount(){
		
    	GoogleViz gv = new GoogleViz();
                
        gv.cols = new list<GoogleViz.col> { 
			new GoogleViz.Col('col1', 'Label', 'string'),
		    new GoogleViz.Col('col2', 'Value', 'number')
        };
        
        
        o = [SELECT Amount FROM Opportunity WHERE Id = :o.Id];
            
        GoogleViz.row r = new GoogleViz.row();
        r.cells.add ( new GoogleViz.cell( 'Amount' ) );
        r.cells.add ( new GoogleViz.cell( o.Amount.intValue() ) );
        	                
        gv.addRow( r );
        
        return gv.toJsonString();
	}
	
	public static testMethod void testGetAmount() {
        // Create our test data
        String expectedJSON = '{cols: [{id: "col1", label: "Label", type: "string"},{id: "col2", label: "Value", type: "number"}], ' + 
        					  'rows: [{c:[{v: "Amount"},{v: 10000.0}]}]}';  
        
        Account a = new Account(name='Test Account');
        insert a;
        Opportunity o = new Opportunity(Name='Test Opportunity', Amount=10000, StageName='Prospecting', CloseDate=Date.today(), AccountId=a.Id);
        insert o;
        
        // Instantiate and construct the standard controller and extension classes.   
        ApexPages.StandardController stdController = new ApexPages.StandardController(o);
        OpporunityExtension extController = new OpporunityExtension(stdController);
		
		// Retrieve the JSON
		String actualJSON = extController.getAmount();
        
      	System.assertEquals(expectedJSON, actualJSON);
    }
	 
}