public with sharing class TimeForCustomField2 {
    @InvocableMethod(label='Set Time For Custom Field 2')
    public static void SetTimeForCustomField2(list<String> IdOfAcc){
        datetime myDateTime = datetime.now();
        Account AccBase = [SELECT Id,Name,CustomField2__c FROM Account WHERE id=:IdOfAcc];
        Account acc =new Account(Id=AccBase.Id,Name=AccBase.Name,CustomField2__c=myDateTime);
        upsert acc;
    }
}