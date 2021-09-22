public class Fizzer {
   private int _val;
	
   public Fizzer() {
     _val = 1;
   }
 
   public string getNewVal() {
     string answer = "";
     if (_val%5==0) 
	   answer = "Fizz";
		  
	 if (_val%3==0) 
	    answer+= "Buzz";
	        
	  if (!(_val%3==0 || _val%5==0))
	    answer = Convert.ToString(_val); 
 
	   answer+="\n";
	   _val+=1;
	   return answer;
   }
}
 
class Program {
    static void Main(string[] args) {
 
		Fizzer f = new Fizzer();
		for (int idx=1;idx<100;idx++){
		  
          Console.Write(f.getNewVal());
		}
	}
}

