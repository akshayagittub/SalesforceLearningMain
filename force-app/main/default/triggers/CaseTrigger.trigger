trigger CaseTrigger on Case (after insert, after update) {
    List<Task> taskstoInsert = new List<Task>();
for(Case cas : Trigger.New){
    if(cas.Create_Task__C == true && cas.AccountId!=null){
        Account acc = [Select PrimaryContact__c from Account where ID = : cas.AccountId LIMIT 1];
        if(acc.PrimaryContact__c!=null){
            Task tas = new Task();
            tas.Subject = 'FollowUp Task';
            tas.WhatId = cas.Id;
            tas.WhoID = acc.PrimaryContact__c;
            tas.priority = 'Normal';
            taskstoInsert.add(tas);
        }
    }
}
if(!taskstoInsert.isEmpty()){
    insert taskstoInsert;
}
}