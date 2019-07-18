@isTest
public class TESTForInputNumberForTimeZone {
     @isTest static void test1() {
        InputNumberForTimeZone gg =new InputNumberForTimeZone();
        gg.setB('ff');
      	datetime objB =gg.getTimeZone();
        datetime myDateTime = datetime.now();
        System.assertEquals(myDateTime,objB);
    } 
    @isTest static void test2() {
        InputNumberForTimeZone gg =new InputNumberForTimeZone();
        gg.setB('11');
      	datetime objB =gg.getTimeZone();
        datetime myDateTime = datetime.now();
        datetime newDateTime = myDateTime.addHours(11);
        System.assertEquals(newDateTime,objB);
    }  
}