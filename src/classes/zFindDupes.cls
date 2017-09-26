@isTest
Public class zFindDupes {
    static testMethod void testDupes() {
    
    //Create New Contact Record
        Contact c = new contact();
        c.FirstName = 'Stephen';
        c.LastName = 'Curry';
        c.Email = 'StephenCurry@test.com';
        Insert c;
      
    // Create dupe lead with same Email ID.
        Lead dupeLead = new lead();
        dupeLead.FirstName = 'Steph';
        dupeLead.LastName = 'Curry';
        dupeLead.Company = 'Test';
        dupeLead.Email = 'StephenCurry@test.com';     
    
    //use Exception to capture the error
        try {
            insert dupeLead;
        } catch (Exception e){
            system.debug('An error happened, as predicted!');
        }
    
    // Now we try to find dupe lead, by email
       List<Lead> dupes = [SELECT Id FROM Lead WHERE Email = 'stephcurry@gsw.com'];
           System.assertEquals(0, dupes.size());
      
    // Now we "break" our trigger by inserting a non-dupe
       Lead legitLead      = new Lead();
       legitLead.FirstName = 'David';
       legitLead.LastName  = 'Lee';
       legitLead.Company   = 'Golden State Warriors';
       legitLead.Email     = 'dlee@gsw.com';
       insert legitLead;

    // Now we try to find our legit lead, by email
       List<Lead> legits = [SELECT Id FROM Lead WHERE Email = 'dlee@gsw.com'];
       System.assertEquals(1, legits.size());
    
    }    
}