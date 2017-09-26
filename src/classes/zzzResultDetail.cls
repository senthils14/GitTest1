public class zzzResultDetail {

    public Integer LeadCount {get;set;}
    public Integer OppCount {get;set;}
    public Integer AccCount {get;set;}
    public Integer ConCount {get;set;}
    
    public zzzResultDetail() {
    
        LeadCount = [select count() from Lead];
        system.debug(LeadCount);
        
        OppCount = [select count() from opportunity];
        system.debug(OppCount);
        
        AccCount = [select count() from Account];
        system.debug(AccCount);
        
        ConCount = [select count() from Contact];
        system.debug(ConCount);
    
    }
}