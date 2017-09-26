trigger zUpdateContactAddressOnlyItsChange on Account (after insert, after update) {
    List<ID> accId = new List<ID>();
    for (Account objAcc : Trigger.new)
        {
            Account oldAccInform = Trigger.oldMap.get(objAcc.ID);
            boolean bIsChanged = (objAcc.BillingStreet != oldAccInform.BillingStreet || objAcc.BillingCity != oldAccInform.BillingCity);
            if (bIsChanged)
                {
                    accId.add(objAcc.Id);
                }
        }
        
        List<Contact> conLis = [select accountId, OtherStreet, OtherCity from contact where accountId in :accId];
        for (Contact objCon: conLis)
            {
                objCon.OtherStreet = Trigger.newMap.get(objCon.accountId).BillingStreet;
                objCon.OtherCity = Trigger.newMAp.get(objCon.accountId).BillingCity;
                
            }
        
        if (conLis.size() > 0)
            {
                 try 
                 {
                     update conLis;
                 }
                     catch(Exception e) 
                 {
                     System.debug('The following exception has occurred: ' + e.getMessage());
                 } 
            }
}