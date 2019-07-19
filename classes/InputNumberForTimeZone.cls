public class InputNumberForTimeZone {
    public String InputValueForDate='0';
    public String Msg=' ';

    public InputNumberForTimeZone objOfInputNumber {get;set;}

    public Datetime getTimeZone() {
        Datetime myDateTime = Datetime.now();
        Integer timeDelay = Integer.valueOf(InputValueForDate);
        Datetime newDateTime = myDateTime.addHours(timeDelay);
        InputValueForDate='0';
        return newDateTime;
    }

    public void setInputValueForDate(Object insertedVal){
        String insertedStrValue = String.valueOf(insertedVal);
        if( insertedStrValue.isNumeric() ) {
            this.InputValueForDate=insertedStrValue;
            Msg=' ';
        } else {
            Msg=insertedStrValue+' is not a number';
        }
    }

    public Object getInputValueForDate() {
        return this.InputValueForDate;
    }

    public String getMSG() {
        return Msg;
    }
 }