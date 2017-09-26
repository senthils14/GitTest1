public class CustomPickList {
        
    public String TextString { get; set; }
    public String SelectedObjective { get; set; } 
       
    public list<UserRole> lstroloeid {get;set;}
    public list<Group>lstgroupid {get;set;}
    public list<Folder>lstDBfolder {get;set;} 
    public list<Group>lstqueue {get;set;}
    public list<User> listuser{get;set;}
    
    public list<User> userList{get;set;}
    
    public list<GroupMember> groupList{get;set;}
    public list<String> usersList1 = new list<String>();
    public list<User> userName{get ; set;}
    public list<String> groupslist = new list<String>();
    
    public list<Dashboard> DashboardList {get;set;}
    
    public list<String> lstqueue1 = new  list<String>();
    public list<String> lstusr = new  list<String>();    
    public list<User> Queueuser {get;set;}
    public list<Group> groupsleve1 {get;set;}
      
    public boolean isUserRolePresent {get;set;}
    public boolean isGroupPresent {get;set;}    
    public boolean isDashboardFolderPresent {get;set;}  
    public boolean isQueueSobjectPresent {get;set;}
    public boolean isUserrecordpresent {get;set;}
    
    public boolean isUserRole {get;set;}
    public boolean isDashboard {get;set;}
    public boolean isUser {get;set;}    
    public boolean isdisplayqueue {get;set;}
    public boolean isdisplayuser {get;set;}

    //public ApexPages.StandardSetController con{get; set;}    
    
     //Pagination variables
     public list<User> listuser1{get;set;}  
     public list<User> Queueuser1{get;set;}
     
     public Integer DEFAULT_NUMBER_OF_RECORDS_PER_PAGE = 5;
     public PageManager objPageManager1 {get; set;}
     public Integer totalRecords{get;set;} 
     public list<WrapperShowSearchResult> lstWrpShowResult{get;set;}
     public list<WrapperShowSearchResult> lstWrpShowResult2{get;set;}
     public list<WrapperShowSearchResult> lstWrpShowResult3{get;set;}
     //public list<WrapperShowSearchResult> listtodisplay{get;set;}
         
    public CustomPickList() {        
    }
    
    public void resetfunc(){
    
    system.debug('im being called');
    System.debug('TextString==>'+TextString);
    System.debug('SelectedObjective==>'+SelectedObjective);
        TextString = '';
        
        userList = new list<User>();
            userName = new list<User>();
            DashboardList = new list<Dashboard>();
            Queueuser = new list<User>();
        
        Queueuser = new list<User>();
            groupsleve1 = new list<Group>();
        
        isUserRolePresent = false;
        isGroupPresent = false;
        isQueueSobjectPresent = false;
        isDashboardFolderPresent = false;
        isUserrecordpresent = false;
        
         isUserRole = false;
         isDashboard = false;
         isUser = false;
        
        
        Queueuser.clear();
        groupsleve1.clear();
        isdisplayqueue = false;
        isdisplayuser = false;
        
        lstWrpShowResult=new List<WrapperShowSearchResult>();
        lstWrpShowResult2=new List<WrapperShowSearchResult>();
        lstWrpShowResult3=new List<WrapperShowSearchResult>();
        
        lstWrpShowResult.clear();
        lstWrpShowResult2.clear();
        lstWrpShowResult3.clear();
    }        
    
    public String objectname {get; set;} 
    public Map<String, SObjectAPINames__c> mapsobjectnames = SObjectAPINames__c.getAll();
    public list<sobject> lstresults {get;set;} 

 
    public List<SelectOption> getsobjectList() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('', '-- Select One --'));        
  
        List<String> lstsobjectNames = new List<String>();
        lstsobjectNames.addAll(mapsobjectnames.keySet());
        lstsobjectNames.sort();
        system.debug('lstsobjectNames==>'+lstsobjectNames);
        
        for (String objsobjectNames : lstsobjectNames) {            
            options.add(new SelectOption(objsobjectNames, objsobjectNames));
        }
        return options;
    }
    
    
    public PageReference SearchOrg() { 
        
        system.debug('TextString.length()==>'+TextString.length());
        if(TextString.length() >= 3){
            
            system.debug('objectname==>'+objectname);        
            system.debug('TextString==>'+TextString);
            
            totalRecords=0;
                    
            isUserRolePresent = false;
            isGroupPresent = false;
            isQueueSobjectPresent = false;
            isDashboardFolderPresent = false;
            isUserrecordpresent = false;
                    
            userList = new list<User>();
            userName = new list<User>();
            DashboardList = new list<Dashboard>();
            Queueuser = new list<User>();
     
            isUserRole = false;
            isDashboard = false;
            isUser = false;
            
            
            Queueuser = new list<User>();
            groupsleve1 = new list<Group>();
            
            Queueuser.clear();
            groupsleve1.clear();
            isdisplayqueue = false;
            isdisplayuser = false;
            
            
            listuser = new list<User>();
            lstroloeid = new list<userrole>();
            lstgroupid = new list<Group>();
            lstDBfolder = new list<Folder>();
            lstqueue = new list<Group>();
            System.debug('TextString==>'+TextString);
            System.debug('SelectedObjective==>'+SelectedObjective);
            
            if(TextString!= null && SelectedObjective != null && SelectedObjective == 'Roles'){
                lstroloeid =[Select id,name from UserRole where Name like :'%'+TextString+'%'];
                if(!lstroloeid.isempty()){
                    isUserRolePresent = true;
                    objPageManager1 = new PageManager(DEFAULT_NUMBER_OF_RECORDS_PER_PAGE);
                    objPageManager1.numberOfRows = lstroloeid.size();
                    totalRecords = lstroloeid.size();
                    //listtodisplay = listobject(lstroloeid,SelectedObjective);
                    //system.debug('listtodisplay==>'+listtodisplay);                                
                }else{
                    apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.INFO,'There are no matching roles present with the search criteria.');
                    ApexPages.addmessage(msg);
                }
            }else if(TextString!= null && SelectedObjective != null && SelectedObjective == 'User'){
                listuser =[Select id,name from User where Name like :'%'+TextString+'%'];
                if(!listuser.isempty()){
                    isUserrecordPresent = true;
                    objPageManager1 = new PageManager(DEFAULT_NUMBER_OF_RECORDS_PER_PAGE);
                    objPageManager1.numberOfRows = listuser.size();
                    totalRecords = listuser.size();
                }else{
                    apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.INFO,'There are no matching User present with the search criteria.');
                    ApexPages.addmessage(msg);
                }        
            }else if(TextString!= null && SelectedObjective != null && SelectedObjective == 'Groups'){
                lstgroupid =[Select id,name from Group where Name like :'%'+TextString+'%' and Type = 'Regular'];
                if(!lstgroupid.isempty()){
                    isGroupPresent = true;
                    objPageManager1 = new PageManager(DEFAULT_NUMBER_OF_RECORDS_PER_PAGE);
                    objPageManager1.numberOfRows = lstgroupid.size();
                    totalRecords = lstgroupid.size();
                }else{
                    apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.INFO,'There are no matching groups present with the search criteria.');
                    ApexPages.addmessage(msg);
                }        
            }else if(TextString!= null && SelectedObjective != null && SelectedObjective == 'Dashboard Folder'){
                lstDBfolder =[Select id,name from Folder where Name like :'%'+TextString+'%' and Type = 'Dashboard'];
                if(!lstDBfolder.isempty()){
                    isDashboardFolderPresent = true;
                    objPageManager1 = new PageManager(DEFAULT_NUMBER_OF_RECORDS_PER_PAGE);
                    objPageManager1.numberOfRows = lstDBfolder.size();
                    totalRecords = lstDBfolder.size();
                }else{
                    apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.INFO,'There are no matching dashboard folder present with the search criteria.');
                    ApexPages.addmessage(msg);
                }
            }else if(TextString!= null && SelectedObjective != null && SelectedObjective == 'Queues'){
                lstqueue =[Select id,name from Group where Name like :'%'+TextString+'%' and Type = 'Queue'];
                if(!lstqueue.isempty()){                
                    isQueueSobjectPresent = true;
                    objPageManager1 = new PageManager(DEFAULT_NUMBER_OF_RECORDS_PER_PAGE);
                    objPageManager1.numberOfRows = lstqueue.size();
                    totalRecords = lstqueue.size();
                }else{
                    apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.INFO,'There are no matching queue present with the search criteria.');
                    ApexPages.addmessage(msg);
                }
            }else if(SelectedObjective != null && SelectedObjective == '-Select-' && TextString!= null) {
                apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.INFO,'Please select a object from the picklist');
                ApexPages.addmessage(msg);
            }else if(SelectedObjective != null && TextString == null) {
                apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.INFO,'Please enter a search criteria in the text box');
                ApexPages.addmessage(msg);
            }               
        
            }else {
                
                
                isUserRolePresent = false;
                isGroupPresent = false;
                isQueueSobjectPresent = false;
                isDashboardFolderPresent = false;
                isUserrecordpresent = false;
                
                isUserRole = false;
                isDashboard = false;
                isUser = false;
                Queueuser.clear();
                groupsleve1.clear();
                isdisplayqueue = false;
                isdisplayuser = false;
                
                apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.INFO,'Please enter minimum 3 characters to search');
                ApexPages.addmessage(msg);                              
            }
        return null;     
        
        }
       
        
        public void findUser1() {
                system.debug('In findUser1');
                userList.clear();
                Id ids = System.currentPageReference().getParameters().get('idrole');
                String clickedname = System.currentPageReference().getParameters().get('idrolename');
                TextString = clickedname;
                System.debug('ID==='+ids+'...TextString==>'+TextString );               
                userList = [Select Id , Name  from User Where UserRoleId =: ids  ]; 
                if(!userList.isEmpty()) {
                    isUserRole = true;
                    objPageManager1 = new PageManager(DEFAULT_NUMBER_OF_RECORDS_PER_PAGE);
                        objPageManager1.numberOfRows = userList.size();
                        totalRecords = userList.size();
                }else{
                    isUserRole = false;
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO,'User Is not Available For This Role');
                    ApexPages.addMessage(myMsg);                
                }                               
        }
        
        
        
        public pagereference findUserinfo() {
          
          Id UserId = System.currentPageReference().getParameters().get('iduser');
          String clickedname = System.currentPageReference().getParameters().get('idusername');
          TextString = clickedname;
          System.debug('ID==='+UserId+'...TextString==>'+TextString );                     
          PageReference pg = new PageReference('/apex/DisplayPage?id='+UserId);
          pg.setRedirect(true);
          return pg;
                    
          }       
        
        public void findUser3() {
            DashboardList.clear();
            Id ids = System.currentPageReference().getParameters().get('idDashboard');
            system.debug('ID==='+ids);
            String clickedname = System.currentPageReference().getParameters().get('idDBname');
            TextString = clickedname;
            system.debug('ID==='+ids+'...clickedname==>'+clickedname);  
            DashboardList = new list<Dashboard>();
            DashboardList = [Select Id , DeveloperName  from Dashboard Where FolderId =: ids  ]; 
            if(!DashboardList.isEmpty()) {
                isDashboard = true;
                objPageManager1 = new PageManager(DEFAULT_NUMBER_OF_RECORDS_PER_PAGE);
                objPageManager1.numberOfRows = DashboardList.size();
                totalRecords = DashboardList.size();            
            }else{
                isDashboard = false;
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO,'No dashboard are available in this folder');
                ApexPages.addMessage(myMsg);
            }             
                      
        }
        
        
        
        public void todisplaypage(){
           lstusr.clear();
           lstqueue1.clear();
            Queueuser.clear();
            groupsleve1.clear();
            isdisplayqueue = false;
            isdisplayuser = false;
            Id ids = System.currentPageReference().getParameters().get('idqueue');
            system.debug('ID==='+ids); 
            String clickedname = System.currentPageReference().getParameters().get('idqueuename');
            TextString = clickedname;
            system.debug('ID111==='+ids+'...clickedname==>'+clickedname);
            list<GroupMember> queueList = new  list<GroupMember>();

                           
            queueList = [SELECT GroupId , UserOrGroupId FROM GroupMember WHERE GroupId =: ids ];
            if(!queueList.isEmpty()) {
                for(GroupMember gm : queueList) {
                    if(String.valueOf(gm.UserOrGroupId).startsWith('00G')){
                            lstqueue1.add(gm.UserOrGroupId);
                    }else{
                            lstusr.add(gm.UserOrGroupId) ;
                    }                   
                } 
                
                system.debug('lstqueue1==>'+lstqueue1);
                system.debug('lstusr==>'+lstusr);                       
            }else{
                   isdisplayqueue = false;
                   isdisplayuser = false; 
                   ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO,'User or groups not Available in the queue');
                   ApexPages.addMessage(myMsg); 
            }
      
            if(!lstusr.isEmpty()){
                try{
                    Queueuser = [Select Id , Name From User Where ID IN : lstusr];
                }catch(exception e){                
                    system.debug('oopms!!!');                
                }
                if(!Queueuser.isEmpty()){
                    isdisplayuser = true;
                                        objPageManager1 = new PageManager(DEFAULT_NUMBER_OF_RECORDS_PER_PAGE);
                        objPageManager1.numberOfRows = Queueuser.size();
                        totalRecords = Queueuser.size();                 
                }else{                    
                    isdisplayuser = false;
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO,'No more users');
                    ApexPages.addMessage(myMsg); 
                }
                
            }
        
            if(!lstqueue1.isEmpty()){            
                groupsleve1 = [Select Id , Name From Group Where ID IN : lstqueue1];                       
                if(!groupsleve1.isEmpty()){
                        isdisplayqueue = true;
                        objPageManager1 = new PageManager(DEFAULT_NUMBER_OF_RECORDS_PER_PAGE);
                        objPageManager1.numberOfRows = groupsleve1.size();
                        totalRecords = groupsleve1.size();                
                }else{                    
                    isdisplayqueue = false;
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO,'No more groups');
                    ApexPages.addMessage(myMsg); 
                }
                               
            }        
        
            if(lstusr.isEmpty() && lstqueue1.isEmpty()){
                isdisplayqueue = false;
                isdisplayuser = false;
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO,'Users not in queue');
                ApexPages.addMessage(myMsg);
            }            
        }
        
        
        //Wrapper Class 
      public class WrapperShowSearchResult{
         public Id sbjectid {get;set;}
         public String sobjectname {get;set;}         
      }
        
        
        public List<WrapperShowSearchResult>  getsobjectlists(){            

             if(lstroloeid!=null && !lstroloeid.isEmpty() ){
                system.debug('rolelist in side getsojectlist==>'+lstroloeid);
                lstWrpShowResult=new List<WrapperShowSearchResult>();             
                for (integer i=objPageManager1.startIndex;i<objPageManager1.endIndex && i<lstroloeid.size();i++) {
                    UserRole obj=lstroloeid.get(i);                     
                    WrapperShowSearchResult ws=new WrapperShowSearchResult();
                    ws.sbjectid = obj.id;
                    ws.sobjectname = obj.Name;
                    lstWrpShowResult.add(ws);                   
                }
            system.debug('totalRecords==>'+totalRecords+'---objPageManager1==>'+objPageManager1);
            }
            
            if(lstgroupid!=null && !lstgroupid.isEmpty() ){
                lstWrpShowResult=new List<WrapperShowSearchResult>();             
                for (integer i=objPageManager1.startIndex;i<objPageManager1.endIndex && i<lstgroupid.size();i++) {
                    Group obj=lstgroupid.get(i);                     
                    WrapperShowSearchResult ws=new WrapperShowSearchResult();
                    ws.sbjectid = obj.id;
                    ws.sobjectname = obj.Name;
                    lstWrpShowResult.add(ws);                   
                }
            system.debug('totalRecords==>'+totalRecords+'---objPageManager1==>'+objPageManager1);
            }
            
            if(lstDBfolder != null && !lstDBfolder.isEmpty() ){
                lstWrpShowResult=new List<WrapperShowSearchResult>();             
                for (integer i=objPageManager1.startIndex;i<objPageManager1.endIndex && i<lstDBfolder.size();i++) {
                    Folder obj=lstDBfolder.get(i);                     
                    WrapperShowSearchResult ws=new WrapperShowSearchResult();
                    ws.sbjectid = obj.id;
                    ws.sobjectname = obj.Name;
                    lstWrpShowResult.add(ws);                   
                }
            system.debug('totalRecords==>'+totalRecords+'---objPageManager1==>'+objPageManager1);
            }
            
            if(lstqueue != null && !lstqueue.isEmpty() ){
                lstWrpShowResult=new List<WrapperShowSearchResult>();             
                for (integer i=objPageManager1.startIndex;i<objPageManager1.endIndex && i<lstqueue.size();i++) {
                    Group obj=lstqueue.get(i);                     
                    WrapperShowSearchResult ws=new WrapperShowSearchResult();
                    ws.sbjectid = obj.id;
                    ws.sobjectname = obj.Name;
                    lstWrpShowResult.add(ws);                   
                }
            system.debug('totalRecords==>'+totalRecords+'---objPageManager1==>'+objPageManager1);
            }
            
            if(listuser != null && !listuser.isEmpty() ){
                lstWrpShowResult=new List<WrapperShowSearchResult>();             
                for (integer i=objPageManager1.startIndex;i<objPageManager1.endIndex && i<listuser.size();i++) {
                    User obj=listuser.get(i);                     
                    WrapperShowSearchResult ws=new WrapperShowSearchResult();
                    ws.sbjectid = obj.id;
                    ws.sobjectname = obj.Name;
                    lstWrpShowResult.add(ws);                   
                }
            system.debug('totalRecords==>'+totalRecords+'---objPageManager1==>'+objPageManager1);
            }            
                                    
            if(lstWrpShowResult!=null && !lstWrpShowResult.isEmpty()){
                return lstWrpShowResult;
            }
            else{
                return null;
            
            }                                                                                    
        }
       
       public List<WrapperShowSearchResult>  getsobjectlists2(){
               
            if(userList != null && !userList.isEmpty() ){
                system.debug('userList in side getsojectlist==>'+userList);
                lstWrpShowResult2=new List<WrapperShowSearchResult>();             
                for (integer i=objPageManager1.startIndex;i<objPageManager1.endIndex && i<userList.size();i++) {
                    User obj=userList.get(i);                     
                    WrapperShowSearchResult ws=new WrapperShowSearchResult();
                    ws.sbjectid = obj.id;
                    ws.sobjectname = obj.Name;
                    lstWrpShowResult2.add(ws);                   
                }
            system.debug('totalRecords==>'+totalRecords+'---objPageManager1==>'+objPageManager1);
            }
            
            if(DashboardList != null && !DashboardList.isEmpty() ){
                system.debug('DashboardList in side getsojectlist==>'+DashboardList);
                lstWrpShowResult2=new List<WrapperShowSearchResult>();             
                for (integer i=objPageManager1.startIndex;i<objPageManager1.endIndex && i<DashboardList.size();i++) {
                    Dashboard obj=DashboardList.get(i);                     
                    WrapperShowSearchResult ws=new WrapperShowSearchResult();
                    ws.sbjectid = obj.id;
                    ws.sobjectname = obj.DeveloperName;
                    lstWrpShowResult2.add(ws);                   
                }
            system.debug('totalRecords==>'+totalRecords+'---objPageManager1==>'+objPageManager1);
            }
            
            if(Queueuser != null && !Queueuser.isEmpty() ){
                system.debug('Queueuser in side getsojectlist==>'+Queueuser);
                lstWrpShowResult2=new List<WrapperShowSearchResult>();             
                for (integer i=objPageManager1.startIndex;i<objPageManager1.endIndex && i<Queueuser.size();i++) {
                    User obj=Queueuser.get(i);                     
                    WrapperShowSearchResult ws=new WrapperShowSearchResult();
                    ws.sbjectid = obj.id;
                    ws.sobjectname = obj.Name;
                    lstWrpShowResult2.add(ws);                   
                }
            system.debug('totalRecords==>'+totalRecords+'---lstWrpShowResult2==>'+lstWrpShowResult2);
            }
                        
            if(lstWrpShowResult2!=null && !lstWrpShowResult2.isEmpty()){
                return lstWrpShowResult2;
            }
            else{
                return null;
            
            }
       }
        public List<WrapperShowSearchResult>  getsobjectlists3(){

                if(groupsleve1 != null && !groupsleve1.isEmpty() ){
                system.debug('groupsleve1 in side getsojectlist==>'+groupsleve1);
                lstWrpShowResult3=new List<WrapperShowSearchResult>();             
                for (integer i=objPageManager1.startIndex;i<objPageManager1.endIndex && i<groupsleve1.size();i++) {
                    Group obj=groupsleve1.get(i);                     
                    WrapperShowSearchResult ws=new WrapperShowSearchResult();
                    ws.sbjectid = obj.id;
                    ws.sobjectname = obj.Name;
                    lstWrpShowResult3.add(ws);                   
                }
            system.debug('totalRecords==>'+totalRecords+'---lstWrpShowResult3==>'+lstWrpShowResult3);
            }
                
                if(lstWrpShowResult3!=null && !lstWrpShowResult3.isEmpty()){
                return lstWrpShowResult3;
            }
            else{
                return null;
            
            }
                
        }
       
       /* 
        public List<WrapperShowSearchResult>  Listobject(list<sObject> objectlist, String selectedobject){            
            system.debug('objectlist==>'+objectlist+'---selectedobject==>'+selectedobject);
             if(objectlist!=null && !objectlist.isEmpty() ){
                lstWrpShowResult=new List<WrapperShowSearchResult>();             
                for (integer i=objPageManager1.startIndex;i<objPageManager1.endIndex && i<objectlist.size();i++) {
                        
                        if(selectedobject == 'Roles'){
                                UserRole obj=(UserRole)objectlist.get(i);
                                WrapperShowSearchResult ws=new WrapperShowSearchResult();
                        ws.sbjectid = obj.id;
                        ws.sobjectname = obj.Name;
                        lstWrpShowResult.add(ws); 
                        }else if(selectedobject == 'Dashboard Folder'){
                                Folder obj=(Folder)objectlist.get(i);
                        }
                                                                                  
                }
            system.debug('totalRecords==>'+totalRecords+'---objPageManager1==>'+objPageManager1);
            }
                        
            if(lstWrpShowResult!=null && !lstWrpShowResult.isEmpty()){
                return lstWrpShowResult;
            }
            else{
                return null;
            
            }                                                                                    
        }
       */        
    }