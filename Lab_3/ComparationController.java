}
import java.util.ArrayList;
import java.util.Arrays;

public class ComparationController {

        // Metodo que dado un ArrayList, lo escribe como "Elemnto0, Elemento1, Elemento2."
        // Entrada : ArrayList de String.
        // Salida : String con el formato dado.
        public String toFormat(ArrayList<String> array){
            String out;
            out = array.get(0) + ", " + array.get(1) + ", " + array.get(2) + ".";
            return out;
        }
    
        // Metodo que dado un mensaje, verifica que modelo esta en la frase y devuelve el model identificado.
        // Entrada : String mensaje.
        // Salida : String con el modelo verificado.
        public String inListModel(String msg){
            String[] msgList = msg.split(" ");
            ArrayList<String> msgArray = new ArrayList<String>(Arrays.asList(msgList));
            ArrayList<String> lowerArray = new ArrayList<String>();
            lowerArray = arrayToLower(msgArray);
            if(lowerArray.contains("fiesta")){
                return "fiesta";
            }
            else if(lowerArray.contains("mustang")){
                return "mustang";
            }
            else if(lowerArray.contains("fordraptor")){
                return "fordraptor";
            }
            else if(lowerArray.contains("yaris")){
                return "yaris";
            }
            else if(lowerArray.contains("auris")){
                return "auris";
            }
            else if(lowerArray.contains("corolla")){
                return "corolla";
            }
            else if(lowerArray.contains("301")){
                return "301";
            }
            else if(lowerArray.contains("2008")){
                return "2008";
            }
            else{
                return "206";
            }
        }
    
        // Metodo que dado dos ArrayList, verifica si alguna palabra del segundo ArrayList, existe en el primero.
        // Entrada : ArrayList de String y ArrayList de Strings.
        // Salida : True o False, dependiendo si se respeta el formato.
        public boolean inList(ArrayList<String> array1, ArrayList<String> array2){
            int i = 0;
            while(i <array2.size()){
                if(array1.contains(array2.get(i))){
                return true;
                }
                i++;
            }
            return false;
        }
    
        // Metodo que dado un arrayList, retorna el mismo ArrayList pero en lowercase.
        // Entrada : ArrayList de strings;
        // Salida : ArrayList de string lowercase.
        public ArrayList<String> arrayToLower(ArrayList<String> array){
                ArrayList<String> lowerArray = new ArrayList<String>();
                for(int i = 0; i < array.size(); i ++){
                    lowerArray.add(array.get(i).toLowerCase());
                }
                return lowerArray;
        }
    
        // Metodo que realiza la comparacion del mensaje del usuario y verifica si cumple el formato dado.
        // Entrada : String con el mensaje del usuario.
        // Salida : True si respeta el formato dado.
        public boolean cmpName(String msg){
                String[] msgList = msg.split(" ");
                ArrayList<String> msgArray = new ArrayList<String>(Arrays.asList(msgList));
                ArrayList<String> lowerArray = new ArrayList<String>();
                lowerArray = arrayToLower(msgArray);
                if( lowerArray.contains("mi") && lowerArray.contains("nombre") && lowerArray.contains("es")){
                    return true;
                }
                return false;
        }
        
        // Metodo que realiza la comparacion del mensaje del usuario y verifica si cumple el formato dado.
        // Entrada : String con el mensaje del usuario.
        // Salida : True si respeta el formato dado.
        public boolean cmpBuy(String msg){
                String[] msgList = msg.split(" ");
                ArrayList<String> msgArray = new ArrayList<String>(Arrays.asList(msgList));
                ArrayList<String> lowerArray = new ArrayList<String>();
                lowerArray = arrayToLower(msgArray);
                
                ArrayList<String> aux0 = new ArrayList<String>();
                aux0.add("quiero");
                aux0.add("deseo");
                
                ArrayList<String> aux1 = new ArrayList<String>();
                aux1.add("comprar");
                aux1.add("adquirir");
                
                if((inList(aux0,lowerArray) && inList(aux1,lowerArray) && lowerArray.contains("auto")) && !(lowerArray.contains("ford")) && !(lowerArray.contains("toyota")) && !(lowerArray.contains("peugeot")) ||
                    inList(aux0,lowerArray) && inList(aux1,lowerArray) && lowerArray.contains("auto") && !(lowerArray.contains("ford")) && !(lowerArray.contains("toyota")) && !(lowerArray.contains("peugeot")) ||
                    inList(aux1,lowerArray) && lowerArray.contains("auto") && !(lowerArray.contains("ford")) && !(lowerArray.contains("toyota")) && !(lowerArray.contains("peugeot")) ||
                    inList(aux1,lowerArray) && lowerArray.contains("auto") && !(lowerArray.contains("ford")) && !(lowerArray.contains("toyota")) && !(lowerArray.contains("peugeot")) ||
                    inList(aux0,lowerArray) && lowerArray.contains("auto") && !(lowerArray.contains("ford")) && !(lowerArray.contains("toyota")) && !(lowerArray.contains("peugeot")) ||
                    inList(aux0,lowerArray) && inList(aux1,lowerArray) && !(lowerArray.contains("ford")) && !(lowerArray.contains("toyota")) && !(lowerArray.contains("peugeot"))){  
                    return true;
                }
                return false;
        }
        
        // Metodo que realiza la comparacion del mensaje del usuario y verifica si cumple el formato dado.
        // Entrada : String con el mensaje del usuario.
        // Salida : True si respeta el formato dado.
        public boolean cmpFord(String msg){
                String[] msgList = msg.split(" ");
                ArrayList<String> msgArray = new ArrayList<String>(Arrays.asList(msgList));
                ArrayList<String> lowerArray = new ArrayList<String>();
                lowerArray = arrayToLower(msgArray);
                
                ArrayList<String> aux0 = new ArrayList<String>();
                aux0.add("quiero");
                aux0.add("deseo");
                
                ArrayList<String> aux1 = new ArrayList<String>();
                aux1.add("comprar");
                aux1.add("adquirir");
                
                if((inList(aux0,lowerArray) && inList(aux1,lowerArray) && lowerArray.contains("auto")) && lowerArray.contains("ford")||
                    inList(aux0,lowerArray) && inList(aux1,lowerArray) && lowerArray.contains("ford")||
                    inList(aux1,lowerArray) && lowerArray.contains("ford") ||
                    inList(aux0,lowerArray) && lowerArray.contains("ford")){  
                    return true;
                }
                return false;
        }
        
        // Metodo que realiza la comparacion del mensaje del usuario y verifica si cumple el formato dado.
        // Entrada : String con el mensaje del usuario.
        // Salida : True si respeta el formato dado.
        public boolean cmpToyota(String msg){
                String[] msgList = msg.split(" ");
                ArrayList<String> msgArray = new ArrayList<String>(Arrays.asList(msgList));
                ArrayList<String> lowerArray = new ArrayList<String>();
                lowerArray = arrayToLower(msgArray);
                
                ArrayList<String> aux0 = new ArrayList<String>();
                aux0.add("quiero");
                aux0.add("deseo");
                
                ArrayList<String> aux1 = new ArrayList<String>();
                aux1.add("comprar");
                aux1.add("adquirir");
                
                if((inList(aux0,lowerArray) && inList(aux1,lowerArray) && lowerArray.contains("auto")) && lowerArray.contains("toyota")||
                    inList(aux0,lowerArray) && inList(aux1,lowerArray) && lowerArray.contains("toyota")||
                    inList(aux1,lowerArray) && lowerArray.contains("toyota") ||
                    inList(aux0,lowerArray) && lowerArray.contains("toyota")){  
                    return true;
                }
                return false;
        }
        
        // Metodo que realiza la comparacion del mensaje del usuario y verifica si cumple el formato dado.
        // Entrada : String con el mensaje del usuario.
        // Salida : True si respeta el formato dado.
        public boolean cmpPeugeot(String msg){
                String[] msgList = msg.split(" ");
                ArrayList<String> msgArray = new ArrayList<String>(Arrays.asList(msgList));
                ArrayList<String> lowerArray = new ArrayList<String>();
                lowerArray = arrayToLower(msgArray);
                
                ArrayList<String> aux0 = new ArrayList<String>();
                aux0.add("quiero");
                aux0.add("deseo");
                
                ArrayList<String> aux1 = new ArrayList<String>();
                aux1.add("comprar");
                aux1.add("adquirir");
                
                if((inList(aux0,lowerArray) && inList(aux1,lowerArray) && lowerArray.contains("auto")) && lowerArray.contains("peugeot")||
                    inList(aux0,lowerArray) && inList(aux1,lowerArray) && lowerArray.contains("peugeot")||
                    inList(aux1,lowerArray) && lowerArray.contains("peugeot") ||
                    inList(aux0,lowerArray) && lowerArray.contains("peugeot")    ){  
                    return true;
                }
                return false;
        }
        
        // Metodo que realiza la comparacion del mensaje del usuario y verifica si cumple el formato dado.
        // Entrada : String con el mensaje del usuario.
        // Salida : True si respeta el formato dado.
        public boolean cmpBuyModel(String msg,ArrayList<String> models){
                String[] msgList = msg.split(" ");
                ArrayList<String> msgArray = new ArrayList<String>(Arrays.asList(msgList));
                ArrayList<String> lowerArray = new ArrayList<String>();
                lowerArray = arrayToLower(msgArray);
                
                ArrayList<String> aux0 = new ArrayList<String>();
                aux0.add("quiero");
                aux0.add("deseo");
                
                ArrayList<String> aux1 = new ArrayList<String>();
                aux1.add("comprar");
                aux1.add("adquirir");
                
                if((inList(aux0,lowerArray) && inList(aux1,lowerArray) && lowerArray.contains("auto")) && inList(arrayToLower(models),lowerArray)||
                    inList(aux0,lowerArray) && inList(aux1,lowerArray) && inList(arrayToLower(models),lowerArray)||
                    inList(aux1,lowerArray) && inList(arrayToLower(models),lowerArray) ||
                    inList(aux0,lowerArray) && inList(arrayToLower(models),lowerArray)){ 
                    return true;
                }
                return false;
        }
        
        // Metodo que realiza la comparacion del mensaje del usuario y verifica si cumple el formato dado.
        // Entrada : String con el mensaje del usuario.
        // Salida : True si respeta el formato dado.
        public boolean lastBuy(String msg){
                String[] msgList = msg.split(" ");
                ArrayList<String> msgArray = new ArrayList<String>(Arrays.asList(msgList));
                ArrayList<String> lowerArray = new ArrayList<String>();
                lowerArray = arrayToLower(msgArray);
                
                ArrayList<String> aux0 = new ArrayList<String>();
                aux0.add("terminar");
                aux0.add("finalizar");
                
                if((inList(aux0,lowerArray) && lowerArray.contains("compra"))){  
                    return true;
                }
                return false;
        }
