global class zzzBatchUpdateTesting implements database.batchable<sObject>
{
    global Database.queryLocator start(database.batchableContext BC)
    {
        string query = 'select id, Name__c, Department__c from Testing__c';
        return database.getqueryLocator(query);
    }
    
    global void execute(database.batchableContext BC, List<Testing__c> scope)
    {
        List<Department__c> deptLis = [select Name, Name_Column__c from Department__c];
        Map<string, String> mapS = new Map<string, String>();
        
        for (Department__c depObj : deptLis)
            {
                MapS.put(depObj.name, depObj.Name_Column__c);
            }
            
        List<Testing__c> testLis = new List<Testing__c>();       
        for(Testing__c s : scope)
            {
                 s.Name__c = mapS.get(s.Department__c);
                 testLis.add(s);
            }
            update testLis;          
    }
    
    global void finish(Database.BatchableContext BC)
    {
    //Send an email to the User after your batch completes
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'senthil.subramani@accenture.com'};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Apex Batch Job is done');
        mail.setPlainTextBody('The batch Apex job processed ');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

    }
    
}