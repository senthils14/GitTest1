public with sharing class soql_offset_example {

    private integer counter=0;  //keeps track of the offset
    private integer list_size=20; //sets the page size or number of rows
    public integer total_size; //used to show user the total size of the list
    
    public soql_offset_example() {
        total_size = [select count() from Number__c]; //set the total size in the constructor
    }
    
    public Number__c[] getNumbers() {
        
        try { //we have to catch query exceptions in case the list is greater than 2000 rows
                Number__c[] numbers = [select Number__c, Square_Root__c 
                                     from Number__c 
                                     order by Number__c
                                     limit :list_size
                                    offset :counter];                   
                return numbers;
        
        } catch (QueryException e) {                            
                ApexPages.addMessages(e);                   
                return null;
        }
        
    }
    
    public PageReference Beginning() { //user clicked beginning
        counter = 0;
        return null;
    }

    public PageReference Previous() { //user clicked previous button
        counter -= list_size;
        return null;
    }

    public PageReference Next() { //user clicked next button
        counter += list_size;
        return null;
    }

    public PageReference End() { //user clicked end
        counter = total_size - math.mod(total_size, list_size);
        return null;
    }
    
    public Boolean getDisablePrevious() { //this will disable the previous and beginning buttons
        if (counter>0) return false; else return true;
    }

    public Boolean getDisableNext() { //this will disable the next and end buttons
        if (counter + list_size < total_size) return false; else return true;
    }

    public Integer getTotal_size() {
        return total_size;
    }
    
    public Integer getPageNumber() {
        return counter/list_size + 1;
    }

    public Integer getTotalPages() {
        if (math.mod(total_size, list_size) > 0) {
            return total_size/list_size + 1;
        } else {
            return (total_size/list_size);
        }
    }
}