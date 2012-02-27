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

public class ContactHierarchyController {
   
   /* This controller creates a Reporting hierarchy three levels deep. It retrieves the
    * current Contact's manager, if there is one, and any direct reports. */
   
   private Contact c;
    
   public ContactHierarchyController(ApexPages.StandardController stdController) {
        c = (Contact)stdController.getRecord();
   }
   
   public String SelectedContact{ get; set; }
   
   public String getReportingHierarchy(){
        GoogleViz gv = new GoogleViz();
        gv.cols = new list<GoogleViz.col> { 
            new GoogleViz.Col('col1','Name','string'),
            new GoogleViz.Col('col2','Manager','string'),
            new GoogleViz.Col('col3','ToolTip','string')
        };
        
        c = [SELECT Id, FirstName, LastName, ReportsToId  
             FROM Contact
             WHERE Id = :c.Id];
        
        GoogleViz.row selectedContactRow = new GoogleViz.row();
        selectedContactRow.cells.add ( new GoogleViz.cell( getContactName(c) ) );
        
        Integer selectedRowIndex = 0;
        if(c.ReportsToId != null){                                 
            Contact manager = [SELECT Id, FirstName, LastName  
                               FROM Contact
                               WHERE Id = :c.ReportsToId];
            // Create the single Parent Contact row.
            GoogleViz.row managerContactRow = new GoogleViz.row();
            managerContactRow.cells.add ( new GoogleViz.cell( getContactName(manager) ) );
            managerContactRow.cells.add ( new GoogleViz.cell( '' ) );
            managerContactRow.cells.add ( new GoogleViz.cell( 'Manager' ) ); 
            gv.addRow( managerContactRow );
            selectedRowIndex = 1;
            
            // Add the Manager Name to the Selected Contact row to form the hierachy
            selectedContactRow.cells.add ( new GoogleViz.cell( getContactName(manager) ) );
        }else{
            // No Manager to add to the Selected Contact row
            selectedContactRow.cells.add ( new GoogleViz.cell( '' ) );
        }
        // Complete the Selected Contact row
        selectedContactRow.cells.add ( new GoogleViz.cell( '' ) );  // Not using the ToolTip column
        gv.addRow( selectedContactRow );
        
        // The initialSelection attribute must be an array of JSON objects that contain a row property. 
        // They should take this form: '[{row:0}]', and must be eval'd.
        // More information can be found here: http://code.google.com/apis/visualization/documentation/events.html
        SelectedContact = '[{row:' + selectedRowIndex + '}]' ;
       
        // Add 1 level of direct reports.
        for(Contact employee : [SELECT Id, FirstName, LastName 
                                FROM Contact 
                                WHERE ReportsToId = :c.Id
                                ORDER BY LastName]){
            GoogleViz.row employeeRow = new GoogleViz.row();
            employeeRow.cells.add ( new GoogleViz.cell( getContactName(employee) ) );
            employeeRow.cells.add ( new GoogleViz.cell( getContactName(c) ) );
            employeeRow.cells.add ( new GoogleViz.cell( 'Employee' ) ); 
            gv.addRow( employeeRow );  
        }
        
        return gv.toJsonString();
    }
    
    private String getContactName(Contact con){
        return con.FirstName + ' ' + con.LastName;
    }
   
    public static testMethod void testGetReportingHierarchy() {
        // Create our test data
        String expectedJSON = '{cols: [{id: "col1", label: "Name", type: "string"},' + 
                                      '{id: "col2", label: "Manager", type: "string"},' + 
                                      '{id: "col3", label: "ToolTip", type: "string"}], ' + 
                               'rows: [{c:[{v: "Head Manager"},{v: ""},{v: "Manager"}]},' + 
                                      '{c:[{v: "Middle Manager"},{v: "Head Manager"},{v: ""}]},' + 
                                      '{c:[{v: "Sally Employee1"},{v: "Middle Manager"},{v: "Employee"}]},' + 
                                      '{c:[{v: "Jon Employee2"},{v: "Middle Manager"},{v: "Employee"}]}]}';
        
        Contact manager = new Contact(FirstName='Head', LastName='Manager');
        insert manager;
        
        Contact selected = new Contact(FirstName='Middle', LastName='Manager', ReportsToId=manager.Id);
        insert selected;
        
        Contact employee1 = new Contact(FirstName='Sally', LastName='Employee1', ReportsToId=selected.Id);
        insert employee1;

        Contact employee2 = new Contact(FirstName='Jon', LastName='Employee2', ReportsToId=selected.Id);
        insert employee2;
                
        // Instantiate and construct the standard controller and extension classes.   
        ApexPages.StandardController stdController = new ApexPages.StandardController(selected);
        ContactHierarchyController extController = new ContactHierarchyController(stdController);

        // Retrieve the JSON
        String actualJSON = extController.getReportingHierarchy();
        
        System.assertEquals(expectedJSON, actualJSON);
    }
}