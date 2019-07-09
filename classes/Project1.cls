public class Project1 {
    public static void insertNewRndTxt(String IdOfTxt, String RndText){
        RndTXT__c rmm = [SELECT Id,Name,TextField__c FROM RndTXT__c WHERE id=:IdOfTxt];
   
        
        RndTXT__c rnt = new RndTXT__c(Id=rmm.Id,Name=rmm.Name,TextField__c=RndText);
        
        upsert rnt;



    }
}