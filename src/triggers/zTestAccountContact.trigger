trigger zTestAccountContact on Account (after update) 
{
    List<ID> accIDLst = new List<ID>();
    for(Account accObj: Trigger.new)
    {
       IF(accObj.email__c !=null)
       {
           accIDLst.add(accObj.id);
       }
    }
    
    List<Contact> contactLst = [Select email, accountid from Contact where accountid in :accIDLst];
    
    for( Contact contactObj:contactLst)
    {
       contactObj.email = Trigger.newMAp.get(contactObj.accountID ).email__c; 
    }
    
    if(contactLst.size() > 0)
    {
   update contactLst;
    }
}