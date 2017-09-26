public with sharing class RS2_URLRedirectController {

    private String SearchStr = 'no';
    public void setSearchStr(String n) {
        SearchStr = n;
    }        
    public String getSearchStr() {
        return SearchStr;
    }
    
    public RS2_URLRedirectController (){
        System.debug('--------Inside RS2_URLRedirectController Class Constructor----------');
        System.debug('Value of searchStr is --------------'+SearchStr);
    }



     public PageReference toHomeTab(){
        PageReference newPage;
        newPage = new PageReference('/apex/RS2_PartnerHome');
        return newPage.setRedirect(true);
    }
    
    public PageReference toProjectsTab(){
        PageReference newPage;
        //newPage = new PageReference('/apex/'+Label.ProjectsTab);
        return newPage.setRedirect(true);
    }
    
    public PageReference toCasesTab(){
        PageReference newPage;
        //newPage = new PageReference('/apex/'+Label.CasesTab);
        return newPage.setRedirect(true);
    }
    
    public PageReference toSearchPageURL(){
        System.debug('Value of searchStr is --------------'+SearchStr);
        PageReference newPage;
        newPage = new PageReference('/apex/SearchResultPage?searchText='+SearchStr);
        return newPage.setRedirect(true);
    }
    
    public PageReference toDevCenter(){
        PageReference newPage;
        //newPage = new PageReference(Label.DevCenterURL);
        return newPage.setRedirect(true);
    }
}