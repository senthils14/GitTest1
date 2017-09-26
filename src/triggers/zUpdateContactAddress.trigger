trigger zUpdateContactAddress on Account (after update) {
    List<ID> accID = new List<ID>();
    for(Account objAcc : Trigger.new)
        {
            if (objAcc.name != NULL)
                {
                    accID.add(objAcc.Id);
                }
        }
        
        List<Contact> conLis = [select Id, accountId, phone, OtherStreet, OtherCity   from contact where accountId in : accID];
        system.debug('conLis==>'+conLis);
        for(Contact objCon: conLis)
            {
                if(objCon.phone == '1234567890'){
                    objCon.OtherStreet = Trigger.newMAp.get(objCon.accountId).BillingStreet;
                    objCon.OtherCity = Trigger.newMAp.get(objCon.accountId).BillingCity;
                }
            }
        if (conLis.size() > 0)
            {
                 system.debug('conLis12132==>'+conLis);
                update conLis;
            }    

}