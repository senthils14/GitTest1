trigger LeadTest on Lead (before delete) {
for (Lead leadsample :
     [select id from Lead where ownerid='005G0000002ca3AIAQ' and id IN :Trigger.old])
{
     Trigger.oldMap.get(leadsample.Id).addError('Cannot delete the lead, which Senthil is the Owner');
     }
}