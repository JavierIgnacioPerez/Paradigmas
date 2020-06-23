import java.util.ArrayList;

public class LogModel {
    
    // Atributos

	// Lista de listas que representa la conversacion.
	ArrayList<ArrayList<String>> log;
        
    // Metodos.
        
        // Metodo constructor de la clase Log.
	// Entrada : String con el identificador, String con el Mensaje del Usuario y String con el mensaje del Chatbot.
	// Salida : Objeto Log.
	public LogModel(ArrayList<ArrayList<String>> inputLog){
		if(inputLog == null || inputLog.isEmpty()){
			this.log = new ArrayList<ArrayList<String>>();
		}
		else{
			this.log = inputLog;
		}
	}
        
        // Metodo que cuenta cuantas veces se ha inciado una conversación.
        // Entrada : Vacia.
        // Salida : Integer con las veces que encontro el identificador "BeginDialog"
        public int countBegin(){ 
            int num = 0;
            for (ArrayList<String> list: log){
                for (String name: list){
                if(name.equals("BeginDialog")){
                    num = num + 1;
                    }
                }
            }
            return num;
        }
        
        // Metodo que cuenta cuantas se ha finalizado una conversación.
        // Entrada : Vacia.
        // Salida : Integer con las veces que encontro el identificador "EndDialog"
        public int countEnd(){ 
            int num = 0;
            for (ArrayList<String> list: log){
                for (String name: list){
                if(name.equals("EndDialog")){
                    num = num + 1;
                    }
                }
            }
            return num;
        }
        
        // Get

	// Metodo que hace el get al log.
	// Entrada : Vacia.
	// Salida : Lista de lista que representa la conversacion.
	public ArrayList<ArrayList<String>> getLog(){
		return this.log;
	}

	// Metodo que hace el get a un mensaje dentro de la lista log.
	// Entrada : Posicion del mensaje que se quiere acceder.
	// Salida : Lista que contiene la informacion del Message especificado.
	public ArrayList<String> getLogIndex(int num){
		return this.log.get(num);
	}

	// Set

	// Metodo que añade una lista (Un mensaje) a la conversacion (log).
	// Entrada : Lista con el Mensaje.
	// Salida : Log actualizado con el nuevo mensaje.
	public ArrayList<ArrayList<String>> setLog(ArrayList<String> msg){
		this.log.add(msg);
		return log;
	}

}
