@isTest
public class TESTForInputNumberForTimeZone {
    
    public static List<Datetime> DateTimeAndClassObjects(String valueForTest) {
       List<Datetime> helpfulData=new List<Datetime>();
        
       InputNumberForTimeZone objOfTestClass =new InputNumberForTimeZone(); 
       Datetime testObj =objOfTestClass.getTimeZone();
        
       objOfTestClass.setInputValueForDate(valueForTest);
       Datetime myDateTime = Datetime.now(); 
        
       helpfulData.add(testObj);
       helpfulData.add(myDateTime);
       return helpfulData;
    }    
    @isTest static void WrongValueInserted() {
        String rndStr='random test string';
        System.assertEquals(DateTimeAndClassObjects(rndStr)[1],DateTimeAndClassObjects(rndStr)[0]);
    } 
    @isTest static void WrightValueInserted() {
        String rndStr='1';
        System.assertEquals(DateTimeAndClassObjects(rndStr)[1],DateTimeAndClassObjects(rndStr)[0]);
    }  
}