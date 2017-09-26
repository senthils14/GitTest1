public class usersearchcontroller {

    public String Userinput{get;set;}
    public String[] Picklist{get;}
    List<GroupMember> groupusers = [SELECT GroupId,Id,UserOrGroupId FROM GroupMember];
    List<User> user = [SELECT AccountId,ProfileId,Username,UserRoleId,UserType FROM User];
    List<Group> groups = [SELECT Id,Name,RelatedId,Type FROM Group];

    public usersearchController() {
        String[] Picklist= new String[]{'Role','Group','Queue','Dashboard'};
        this.PicklistOption = new SelectOption[]{};
        
        for (String c: Picklist) {
            this.PicklistOption.add(new SelectOption(c,c));
        }
    }
    public SelectOption[] PicklistOption { //this is where we're going to pull the list
        public get;
        private set;
    }
    
    public void search(){
    
    }
    Public pageReference theSearchResults(){
    return null;
    }
    
}