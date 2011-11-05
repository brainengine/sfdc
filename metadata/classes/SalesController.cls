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

    Illustrates somewhat complex query patterns.
*/


public class SalesController {
    
    public String getSalesActivity(){
        return getSalesActivity(null);
    }
    
    public String getSalesActivity(List<Id> ids){
        
        GoogleViz gv = new GoogleViz();
                
        gv.cols = new list<GoogleViz.col> { 
            new GoogleViz.Col('col1','Date','date'),
            new GoogleViz.Col('col2', UserInfo.getFirstName() + ' ' + UserInfo.getLastName(),'number'),
            new GoogleViz.Col('col3','Account Name','string'),
            new GoogleViz.Col('col4','Opportunity Amount','string')
        };
                
        Integer numOpportunities = 1;
        Id userId = UserInfo.getUserId();
        string query = 'SELECT Id, Name, Amount, CloseDate, Account.Name, Owner.Name FROM Opportunity WHERE IsWon = true AND OwnerId = :userId';
        
        // The unit testing path.
        if(ids != null && ids.size() > 0){
            query += ' AND Id IN :ids';
        }
        
        query += ' ORDER BY CloseDate ASC';
        
        for(Opportunity o : Database.query(query)){  
            GoogleViz.row r = new GoogleViz.row();
            r.cells.add ( new GoogleViz.cell( o.CloseDate ) );
            r.cells.add ( new GoogleViz.cell( numOpportunities ) );
            r.cells.add ( new GoogleViz.cell( o.Account.Name ) );
            r.cells.add ( new GoogleViz.cell( o.Amount ) );
                
            gv.addRow( r );
            numOpportunities++;
        }

        return gv.toJsonString();
    }  
    
    public String getSalesByYear(){
        return getSalesByYear(null);    
    }
    
    private String getSalesByYear(List<Id> ids){
        
        GoogleViz gv = new GoogleViz();
                
        gv.cols = new list<GoogleViz.col> { 
            new GoogleViz.Col('col1','Year','string'),
            new GoogleViz.Col('col2','Amount','number')
        };
        
        Map<String, Integer> mapAmountsByYear = new Map<String, Integer>();
        
        string query = 'SELECT Amount, FiscalYear FROM Opportunity WHERE IsWon = true';
        
        // The unit testing path.
        if(ids != null && ids.size() > 0){
            query += ' AND Id IN :ids';
        }
        
        query += ' ORDER BY FiscalYear ASC';

        for(Opportunity o : Database.query(query)){         
            String fiscalYear = String.valueOf(o.FiscalYear);
                                
            if(!mapAmountsByYear.containsKey(fiscalYear)){
                mapAmountsByYear.put(fiscalYear, o.Amount.intValue());  
            }else{
                Integer currentTotalAmount = mapAmountsByYear.get(fiscalYear);  
                currentTotalAmount += o.Amount.intValue();
                mapAmountsByYear.put(fiscalYear, currentTotalAmount);
            }
        }
        
        for(String year : mapAmountsByYear.keySet()){
            GoogleViz.row r = new GoogleViz.row();
            r.cells.add ( new GoogleViz.cell( year ) );
            r.cells.add ( new GoogleViz.cell( mapAmountsByYear.get(year) ) );
                            
            gv.addRow( r );
        }
        
        return gv.toJsonString();
    } 
    
    public String getOpportunitiesByBillingCountry(){
        return getOpportunitiesByBillingCountry(null);
    }  
    
    private String getOpportunitiesByBillingCountry(List<Id> ids){
        
        GoogleViz gv = new GoogleViz();
        gv.cols = new list<GoogleViz.col> { 
            new GoogleViz.Col('col1','Billing Country','string'),
            new GoogleViz.Col('col2','Number of Opportunities','number')
        };
                
        Map<String, Integer> mapOpportunityCounts = new Map<String, Integer>();

        string query = 'SELECT Id, Account.BillingCountry FROM Opportunity';
        
        // The unit testing path.
        if(ids != null && ids.size() > 0){
            query += ' WHERE Id IN :ids';
        }

        for(Opportunity o : Database.query(query)){
            if(!mapOpportunityCounts.containsKey(o.Account.BillingCountry)){
                mapOpportunityCounts.put(o.Account.BillingCountry, 0);  
            }
            
            Integer numOpportunities = mapOpportunityCounts.get(o.Account.BillingCountry);  
            numOpportunities++;
            
            mapOpportunityCounts.put(o.Account.BillingCountry, numOpportunities);
        }
        
        for(String billingCountry : mapOpportunityCounts.keySet()){
            
            Integer numOpportunities = mapOpportunityCounts.get(billingCountry);
            
            GoogleViz.row r = new GoogleViz.row();
            r.cells.add ( new GoogleViz.cell( billingCountry ) );
            r.cells.add ( new GoogleViz.cell( numOpportunities ) );
                
            gv.addRow( r );
        }

        return gv.toJsonString();
    }  
    
    public String getOpportunitiesAmountProbability(){
        return getOpportunitiesAmountProbability(null);
    }  
    
    private String getOpportunitiesAmountProbability(List<Id> ids){
        GoogleViz gv = new GoogleViz();
        gv.cols = new list<GoogleViz.col> { 
            new GoogleViz.Col('col1','Probability','number'),
            new GoogleViz.Col('col2','Amount','number')
        };
        
        string query = 'SELECT Probability, Amount FROM Opportunity';
        
        // The unit testing path.
        if(ids != null && ids.size() > 0){
            query += ' WHERE Id IN :ids ORDER BY CloseDate ASC';
        }

        for(Opportunity o : Database.query(query)){
            GoogleViz.row r = new GoogleViz.row();
            r.cells.add ( new GoogleViz.cell( o.Probability ) );
            r.cells.add ( new GoogleViz.cell( o.Amount ) );                 
            gv.addRow( r );
        }
        
        return gv.toJsonString();
    }  
    private testMethod static void testSalesActivity(){
        String ownerName = UserInfo.getFirstName() + ' ' + UserInfo.getLastName();
        
        String expected = '{cols: [{id: "col1", label: "Date", type: "date"},{id: "col2", label: "' + ownerName + '", type: "number"},{id: "col3", label: "Account Name", type: "string"},{id: "col4", label: "Opportunity Amount", type: "string"}], rows: [{c:[{v: new Date(2009, 0, 1, 0, 0, 0), f: "1/1/2009"},{v: 1.0},{v: "a1"},{v: 1000.0}]},{c:[{v: new Date(2009, 1, 2, 0, 0, 0), f: "2/2/2009"},{v: 2.0},{v: "a1"},{v: 2000.0}]}]}';
        
        SalesController salesCon = new SalesController();

        Account a = new Account(name='a1');
        insert a;
        Opportunity o1 = new Opportunity(Name='o1', StageName='Closed Won', CloseDate=date.newinstance(2009, 1, 1), Amount=1000, AccountId=a.Id, OwnerId=UserInfo.getUserId()); 
        Opportunity o2 = new Opportunity(Name='o2', StageName='Closed Won', CloseDate=date.newinstance(2009, 2, 2), Amount=2000, AccountId=a.Id, OwnerId=UserInfo.getUserId()); 
        insert new List<Opportunity> {o1, o2};
        String actual = salesCon.getSalesActivity(new List<Id> {o1.Id, o2.Id});
        
        System.assertEquals(expected, actual);
    }
    
    private testMethod static void testSalesByYear(){
        String expected = '{cols: [{id: "col1", label: "Year", type: "string"},{id: "col2", label: "Amount", type: "number"}], rows: [{c:[{v: "2009"},{v: 3000.0}]}]}';
        
        SalesController salesCon = new SalesController();
        Opportunity o1 = new Opportunity(Name='o1', StageName='Closed Won', CloseDate=date.newinstance(2009, 1, 1), Amount=1000); 
        Opportunity o2 = new Opportunity(Name='o2', StageName='Closed Won', CloseDate=date.newinstance(2009, 1, 1), Amount=2000); 
        insert new List<Opportunity> {o1, o2};
        String actual = salesCon.getSalesByYear(new List<Id> {o1.Id, o2.Id});
        
        System.assertEquals(expected, actual);
    }
    
    private testMethod static void testOpportunitiesByBillingCountry(){
        String expected = '{cols: [{id: "col1", label: "Billing Country", type: "string"},{id: "col2", label: "Number of Opportunities", type: "number"}], rows: [{c:[{v: "MyCountry"},{v: 2.0}]}]}';
        
        SalesController salesCon = new SalesController();
        Account a = new Account(name='a1', BillingCountry='MyCountry');
        insert a;
        Opportunity o1 = new Opportunity(Name='o1', StageName='Closed Won', CloseDate=date.newinstance(2009, 1, 1), Amount=1000, AccountId=a.Id); 
        Opportunity o2 = new Opportunity(Name='o2', StageName='Closed Lost', CloseDate=date.newinstance(2009, 2, 2), Amount=2000, AccountId=a.Id); 
        insert new List<Opportunity> {o1, o2};
        String actual = salesCon.getOpportunitiesByBillingCountry(new List<Id> {o1.Id, o2.Id});

        System.assertEquals(expected, actual);
    }
    
    private testMethod static void testGetOpportunityAmountProbability(){
        String expected = '{cols: [{id: "col1", label: "Probability", type: "number"},{id: "col2", label: "Amount", type: "number"}], rows: [{c:[{v: 100.0},{v: 1000.0}]},{c:[{v: 0.0},{v: 2000.0}]}]}';
        
        SalesController salesCon = new SalesController();
        Opportunity o1 = new Opportunity(Name='o1', StageName='Closed Won', CloseDate=date.newinstance(2009, 1, 1), Amount=1000); 
        Opportunity o2 = new Opportunity(Name='o2', StageName='Closed Lost', CloseDate=date.newinstance(2009, 2, 2), Amount=2000); 
        insert new List<Opportunity> {o1, o2};
        String actual = salesCon.getOpportunitiesAmountProbability(new List<Id> {o1.Id, o2.Id});

        System.assertEquals(expected, actual);
    }
}