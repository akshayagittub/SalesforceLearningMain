public with sharing class searchContactClass {
    @AuraEnabled(cacheable=true)
    public static List<contact> findContacts(String searchContext){
        string key = '%'+searchContext+'%';
        return [Select Id, LastName, Phone FROM Contact WHERE LastName LIKE:Key];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
   return [Select Id, Name From Account];
    }

    @AuraEnabled
    public static void saveContact(contact contact){
       
            try{
                insert contact;
            }catch(Exception e){
              //  new throw AuraHandledException('e.getMessage');
            }
           
        
    }
}