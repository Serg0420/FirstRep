trigger Project1Trig on RndTXT__c (before insert, before update) {
for(RndTXT__c rnnd : Trigger.New) {
              rnnd.TextField2__c=rnnd.TextField__c;
    }
}