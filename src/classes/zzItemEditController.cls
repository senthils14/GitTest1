public with sharing class zzItemEditController {

  private ApexPages.StandardController controller {get; set;}
  public List<user> searchResults {get;set;}
  public string searchText {get;set;}

  public zzItemEditController(ApexPages.StandardController controller) { }

  public PageReference search() {
    String qry = 'select id, name from User ' +
      'where name LIKE \'%'+searchText+'%\' order by name';
    searchResults = Database.query(qry);
    return null;
  }

}