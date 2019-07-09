trigger Project1Trig on RndTXT__c (before insert, before update) {

    
for(RndTXT__c rnnd : Trigger.New) {
    
    System.debug('1111: '+rnnd.TextField__c);    
    System.debug('2222: '+rnnd.TextField2__c);  
        
          rnnd.TextField2__c=rnnd.TextField__c;
    
    System.debug('3333: '+rnnd.TextField__c);    
    System.debug('4444: '+rnnd.TextField2__c);
     System.debug('4444: '+rnnd.ID);             
    }



}