@isTest
public class InputNumberForTimeZoneTEST {

    public static InputNumberForTimeZone objectOfTestedClass =new InputNumberForTimeZone();
    public static DateTime myDateTime = DateTime.now();

    @isTest
    static void WrongValueInserted() {
        objectOfTestedClass.setInputValueForDate('ff');
        DateTime testObj = objectOfTestedClass.getTimeZone();
        System.assertEquals(myDateTime,testObj);
    }

    @isTest
    static void RightValueInserted() {
        objectOfTestedClass.setInputValueForDate('11');
        DateTime testObj = objectOfTestedClass.getTimeZone();
        DateTime newDateTime = myDateTime.addHours(11);
        System.assertEquals(newDateTime,testObj);
    }
}