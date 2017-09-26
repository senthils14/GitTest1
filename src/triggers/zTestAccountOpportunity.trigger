trigger zTestAccountOpportunity on Account (after update) {
    List<ID> AccID = new List<ID>();
        for(Account objAcc : Trigger.new)
            {
                if(objAcc.name != NULL){
                    AccID.add(ObjAcc.Id);
                }
            }
        List<Opportunity> oppLis = [select Description, accountid from opportunity where accountid in : AccID]; 
            for(Opportunity Opp: oppLis)
            {
                opp.Description = Trigger.newMAp.get(opp.accountid).Description;
            }
            if(oppLis .size() > 0)
    {
   update oppLis ;
    }
}