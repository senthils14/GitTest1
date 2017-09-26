trigger zfindDupes on Lead (before insert, before update) {
    for (Lead myLead : Trigger.new){
        if (myLead.Email != NULL) {
            List<Contact> dupes = [select ID from contact where Email = :myLead.Email];    
            if (dupes != NULL && dupes.size() > 0){
             String errMessage = 'Duplicate Contact Found';
             errMessage = errMessage + 'Record ID is' + dupes[0].Id;
             myLead.addError(errmessage);
            }
        }
    }
}