trigger zzzUpdateContactMobile on Account (after update) {
    List<ID> accID = new List<ID>();
    for(Account objAcc : Trigger.new)
        {
            if (objAcc.name != Null)
                {
                   accID.add(ObjAcc.id);
                }
        }
        
    List<Contact> conLis = [select id, accountid, MobilePhone from contact where accountid in : accID];
    for (Contact objCon : conLis)
        {
            ObjCon.MobilePhone = Trigger.newMap.get(ObjCon.accountId).Telephone_2__c;
        }
    if (conLis.size() > 0)
        {
        update conLis;
        }
}