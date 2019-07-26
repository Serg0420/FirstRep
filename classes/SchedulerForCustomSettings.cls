global class SchedulerForCustomSettings implements Schedulable {

    public static Custom_Setting__c sendingElement = new Custom_Setting__c();

    global void execute(SchedulableContext ctx) {
        insert sendingElement;
    }
    
    public static void ObjectToInsert(String sch, Custom_Setting__c sendingList, Integer indexOfSendingSetting){
        SchedulerForCustomSettings reminder = new SchedulerForCustomSettings();
        sendingElement=sendingList;
        String jobID = System.schedule('SettingJob'+indexOfSendingSetting, sch, reminder);
    }
}
