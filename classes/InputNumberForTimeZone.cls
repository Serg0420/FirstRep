public class InputNumberForTimeZone {
    public string B='0';
    public string ErrorMsg='Write number of hours';
    public InputNumberForTimeZone addctl{get;set;}
        	public datetime getTimeZone() {
			    datetime myDateTime = datetime.now();
        	    Integer myInt = Integer.valueOf(B);
        	    datetime newDateTime = myDateTime.addHours(myInt);
                B='0';
   			    return newDateTime;
            }
  		    public void setB(object val){
                String myStr = String.valueOf(val);
                if(myStr.isNumeric()){
                    this.B=myStr;
                    ErrorMsg='Write number of hours';
                    }else{ErrorMsg=myStr+' is not a number';
                        }
 		    }
    	    public object getB(){return this.B;}
            public string getMSG() {return ErrorMsg;}
 }