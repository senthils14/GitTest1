trigger zzzApexShareTest on Department__c (after insert) 
{
    If(trigger.isInsert)
    {
        List<Department__share> depShaLis = new List<Department__share>();
        
        for(Department__c depSha : Trigger.new)
        {
        if(depSha.Name_Column__c =='XYZ')
            {
                Department__share shareRecord = new Department__share ();
                
                shareRecord.parentId = depSha.Id;
                shareRecord.UserOrGroupId = '005G0000002nV0iIAE';
                shareRecord.AccessLevel = 'Read';
                shareRecord.RowCause = schema.Department__share.RowCause.Share_to_Bob__c;
                
                depShaLis.add(shareRecord);
            }
        }
        Database.SaveResult[] depShaLisInsertResult = Database.insert(depShaLis,false);
    }
}