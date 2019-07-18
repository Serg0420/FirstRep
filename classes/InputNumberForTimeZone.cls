public class InputNumberForTimeZone {
    public String InputValueForDate='0';
    public String Msg=' ';

            public InputNumberForTimeZone addctl{get;set;}

        	public Datetime getTimeZone() {
			    Datetime myDateTime = Datetime.now();
        	    Integer myInt = Integer.valueOf(InputValueForDate);
        	    Datetime newDateTime = myDateTime.addHours(myInt);
                InputValueForDate='0';
   			    return newDateTime;
            }

  		    public void setInputValueForDate(Object val){
                String myStr = String.valueOf(val);
                if(myStr.isNumeric()){
                    this.InputValueForDate=myStr;
                    Msg=' ';
                    }else{
                        Msg=myStr+' is not a number';
                    }
 		    }

    	    public Object getInputValueForDate(){return this.InputValueForDate;}

            public String getMSG() {return Msg;}
 }