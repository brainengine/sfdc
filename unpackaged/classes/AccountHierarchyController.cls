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

public class AccountHierarchyController {
   
   /* This controller creates an Account hierarchy three levels deep. It retrieves the
    * current Account's parent Account, if there is one, and any child Account records. */
   
   private Account a;
    
   public AccountHierarchyController(ApexPages.StandardController stdController) {
        a = (Account)stdController.getRecord();
   }
   
   public String SelectedAccount{ get; set; }
   
   public String getAccountHierarchy(){
        GoogleViz gv = new GoogleViz();
        gv.cols = new list<GoogleViz.col> { 
            new GoogleViz.Col('col1','Name','string'),
            new GoogleViz.Col('col2','Parent','string'),
            new GoogleViz.Col('col3','ToolTip','string')
        };
        
        a = [SELECT Id, Name, ParentId  
             FROM Account
             WHERE Id = :a.Id];
        
        GoogleViz.row selectedAccountRow = new GoogleViz.row();
        selectedAccountRow.cells.add ( new GoogleViz.cell( a.Name ) );
        
        Integer selectedRowIndex = 0;
        if(account.ParentId != null){                                  
            Account parentAccount = [SELECT Id, Name  
                                     FROM Account
                                     WHERE Id = :a.ParentId];
            // Create the single Parent Account row.
            GoogleViz.row parentAccountRow = new GoogleViz.row();
            parentAccountRow.cells.add ( new GoogleViz.cell( parentAccount.Name ) );
            parentAccountRow.cells.add ( new GoogleViz.cell( '' ) );
            parentAccountRow.cells.add ( new GoogleViz.cell( 'Parent' ) ); 
            gv.addRow( parentAccountRow );
            selectedRowIndex = 1;
            
            // Add the Parent Account Name to the Selected Account row to form the hierachy
            selectedAccountRow.cells.add ( new GoogleViz.cell( parentAccount.Name ) );
        }else{
            // No Parent Account Name to add to the Selected Account row
            selectedAccountRow.cells.add ( new GoogleViz.cell( '' ) );
        }
        // Complete the Selected Account row
        selectedAccountRow.cells.add ( new GoogleViz.cell( '' ) );  // Not using the ToolTip column
        gv.addRow( selectedAccountRow );
        
        // The initialSelection attribute must be an array of JSON objects that contain a row property. 
        // They should take this form: '[{row:0}]', and must be eval'd.
        // More information can be found here: http://code.google.com/apis/visualization/documentation/events.html
        SelectedAccount = '[{row:' + selectedRowIndex + '}]' ;
       
       
        // Add 1 level of child accounts.
        for(Account childAccount : [SELECT Id, Name 
                                    FROM Account 
                                    WHERE ParentId = :a.Id
                                    ORDER BY Name]){
            GoogleViz.row childAccountRow = new GoogleViz.row();
            childAccountRow.cells.add ( new GoogleViz.cell( childAccount.Name ) );
            childAccountRow.cells.add ( new GoogleViz.cell( a.Name ) );
            childAccountRow.cells.add ( new GoogleViz.cell( 'Child' ) ); 
            gv.addRow( childAccountRow );  
        }
        
        return gv.toJsonString();
    }
   
    public static testMethod void testGetAccountHierarchy() {
        // Create our test data
        String expectedJSON = '{cols: [{id: "col1", label: "Name", type: "string"},' + 
                                      '{id: "col2", label: "Parent", type: "string"},' + 
                                      '{id: "col3", label: "ToolTip", type: "string"}], ' + 
                               'rows: [{c:[{v: "Parent Account"},{v: ""},{v: "Parent"}]},' + 
                                      '{c:[{v: "Selected"},{v: "Parent Account"},{v: ""}]},' + 
                                      '{c:[{v: "Child 1"},{v: "Selected"},{v: "Child"}]},' + 
                                      '{c:[{v: "Child 2"},{v: "Selected"},{v: "Child"}]}]}';
        
        Account parent = new Account(name='Parent Account');
        insert parent;
        
        Account selected = new Account(name='Selected', ParentId=parent.Id);
        insert selected;
        
        Account child1 = new Account(name='Child 1', ParentId=selected.Id);
        insert child1;

        Account child2 = new Account(name='Child 2', ParentId=selected.Id);
        insert child2;
                
        // Instantiate and construct the standard controller and extension classes.   
        ApexPages.StandardController stdController = new ApexPages.StandardController(selected);
        AccountHierarchyController extController = new AccountHierarchyController(stdController);

        // Retrieve the JSON
        String actualJSON = extController.getAccountHierarchy();
        
        System.assertEquals(expectedJSON, actualJSON);
    }
}