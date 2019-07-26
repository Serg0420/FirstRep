global class SetCustomSettings implements Database.Batchable<sObject>, Database.Stateful {

    public List <Custom_Setting__c> CreateListOfCustomSettings() {

        List <Custom_Setting__c> lstOfSettings = new List <Custom_Setting__c>();

        For( Integer loopVar = 6; loopVar > 0; loopVar-- ) {
            lstOfSettings.add( new Custom_Setting__c( Number_in_row__c = loopVar, Name = 'SettingName'+loopVar ) );
        }

        lstOfSettings.add( new Custom_Setting__c( Number_in_row__c = 2, Name = 'SettingName2.2' ) );
        lstOfSettings.add( new Custom_Setting__c(Number_in_row__c = 2, Name = 'SettingName2.3' ) );
        lstOfSettings.add( new Custom_Setting__c(Number_in_row__c = 5, Name = 'SettingName5.2' ) );

        return lstOfSettings;
    }

    global List <Custom_Setting__c> start(Database.BatchableContext bc) {

        return CreateListOfCustomSettings();
    }

    global void execute(Database.BatchableContext bc, List<Custom_Setting__c> scope) {

        scope.sort();
        Integer indexOfSendingSetting = 0;
        Datetime myDateTime = Datetime.now();
        Integer secondsDelay = 0;

        for ( Custom_Setting__c sendingList : scope ) {
            if( scope.indexOf(sendingList) != ( scope.size() )-1 ) {
                if( scope.indexOf(sendingList) != 0 ) {
                    if ( scope[ scope.indexOf(sendingList) ].Number_in_row__c == scope[ ( scope.indexOf(sendingList) )+1 ].Number_in_row__c ) {
                        if ( scope[ scope.indexOf(sendingList) ].Number_in_row__c != scope[ ( scope.indexOf(sendingList) )-1 ].Number_in_row__c ) {
                            secondsDelay += 30;
                        }
                    }else{
                        if ( scope[ scope.indexOf(sendingList) ].Number_in_row__c != scope[ ( scope.indexOf(sendingList) )-1 ].Number_in_row__c ) {
                            secondsDelay += 30;
                        }
                    }
                }
            }else{
                secondsDelay += 30;
                }

            Datetime newStart = myDateTime.addSeconds(secondsDelay);
            String sch = newStart.second()+' '+newStart.minute()+' '+(newStart.hour()+1)+' '+newStart.day()+' '+newStart.month()+' ? '+newStart.year();
            SchedulerForCustomSettings.ObjectToInsert( sch, sendingList, indexOfSendingSetting);
            indexOfSendingSetting++;
        }
    }

    global void finish(Database.BatchableContext bc){

        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
                                    TotalJobItems, CreatedBy.Email
                            FROM AsyncApexJob
                            WHERE Id = :bc.getJobId()];

        System.debug('Debug: '+job);
    }
}