package Clases;
import java.time.*;
public class PKGenerator {
    String date = java.time.LocalDate.now().toString();
    String time = java.time.LocalTime.now().toString();
    String word ;
    public PKGenerator(){
        word = "Key";
    }
    public String getPrimarykey(){
        String pk = date+"#"+time+"_"+word;
        return pk;
    }
    public String getPrimarykey(String w){
        String pk = date+"#"+time+"_"+w;
        return pk;
    }
}
