trigger zzzCreateCaseOppLost on Opportunity (after update) 
{
    List<case> caseLis = new List<case>();
    for(Opportunity oppObj: Trigger.new)
    {
        if(oppObj.StageName == 'Closed Lost')
        {
            Opportunity oldOppObj = Trigger.oldMAp.get(oppObj.ID);
            boolean blsChange = (oppObj.StageName != oldOppObj.StageName); 
            
            if(blsChange)
            {
                case caseObj = new case();
                caseObj.AccountId = oppObj.AccountId;
                caseObj.Origin = 'web';
                caseObj.Subject = 'Opportunity "' + oppObj.name + '" is Failed';
             
                caseLis.add(caseObj);
             }
        }
       
        insert caseLis;
    }
}