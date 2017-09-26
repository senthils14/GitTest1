public class DisplayUserinfo {
    
    public id Userid;
    public User userinfo{get;set;}
    public list<Groupmember> Groupvalues{get;set;}
    public list<group> groupids1{get;set;}
    public list<group> groupids2{get;set;}
    public list<group> groupids3{get;set;}
    public list<id> lstgroupids1 = new list<id>();
    public list<id> lstgroupids2 = new list<id>();
    public Integer DEFAULT_NUMBER_OF_RECORDS_PER_PAGE = 5;
    public PageManager objPageManager1 {get; set;}
    public Integer totalRecords{get;set;} 
    public Boolean displaygrouplevel1 {get;set;}
    public Boolean displaygrouplevel2 {get;set;}
    public Boolean displaygrouplevel3 {get;set;}
    public list<Group> Queue1 {get;set;}
    public Boolean displayQueue1 {get;set;}
    public UserRole UserRoleInfo {get;set;}
    public Profile UserProfileInfo {get;set;}
    public Boolean displayrole {get;set;}
    
    public DisplayUserinfo(){
        
        totalRecords=0;
        Userid = System.currentPageReference().getParameters().get('id');
     
        if(Userid != null){
            Userinfo = [select id,Name,FirstName,LastName,IsActive,Phone,State,Username,ProfileId,UserRoleId from User where id=:Userid];
            
            try{
                UserRoleInfo = [select id,Name,RollupDescription,PortalType,ParentRoleId from UserRole where id =: Userinfo.UserRoleId];
                if(UserRoleInfo != null){
                    displayrole = true;
                }else {
                    displayrole = false;
                }
             }catch (exception e){
                        
             }  

            UserProfileInfo = [select id,Name,UserLicenseId,Description from Profile where id =: Userinfo.ProfileId];
        }
        
        
        
        
        if(Userinfo != null){
        try{
            groupids1 = [select id, name from group where id IN (select Groupid from groupmember where UserOrGroupId=:Userid) and type='regular'];
            system.debug('groupids1...'+groupids1);
            if(groupids1 != null && !groupids1.isEmpty()){
                for(group objgroupid1:groupids1){
                    displaygrouplevel1 = true;
                    lstgroupids1.add(objgroupid1.id);
                }
            }else{
                displaygrouplevel1 = false;
            }
         }catch (exception e){
         
         }
                    
        }                   
        
        if(lstgroupids1 != null && !lstgroupids1.isEmpty()){
        try{
            groupids2 = [select id, name from group where id IN (select Groupid from groupmember where UserOrGroupId IN:lstgroupids1) and type='regular'];
            system.debug('groupids2...'+groupids2);
            if(groupids2 != null && !groupids2.isEmpty()){
                for(group objgroupid2:groupids2){
                    displaygrouplevel2 =true;
                    lstgroupids2.add(objgroupid2.id);
                }
            }else {
                displaygrouplevel2 = false;
            }
          }catch(exception e) {
          }  
                     
        }
        
        if(lstgroupids2 != null && !lstgroupids2.isEmpty()){
        try{
            groupids3 = [select id, name from group where id IN (select Groupid from groupmember where UserOrGroupId IN:lstgroupids2) and type='regular'];
            if(groupids3 != null && !groupids3.isEmpty()){
                displaygrouplevel3 = true;
            }else {
                displaygrouplevel3 = false;
            }
          }catch (exception e){
          }           
        }
        
        
        if(Userinfo != null){
        try{
            Queue1 = [select id, name from group where id IN (select Groupid from groupmember where UserOrGroupId=:Userid) and type='Queue'];
            system.debug('Queue1...'+Queue1);
            if(Queue1 != null && !Queue1.isEmpty()){
                for(group objgroupid1:Queue1){
                    displayQueue1 = true;                   
                }
            }else{
                displayQueue1 = false;
            }
          }catch(exception e){
          }       
        }
        
      
    }
}