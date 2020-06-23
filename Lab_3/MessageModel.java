import java.util.Calendar;
import java.util.ArrayList;
import java.util.Arrays;

public class MessageModel {
    
    // Atributos.

	// Atributo que contiene identificador de la accion que se raliza ("BeginDialog", "EndDialog", etc).
	String ident;
	// Atributo que contiene la fecha y la hora de cuando se realiza el mensaje.
	String dateTime;
	// Atributo que contiene "User" para identificar el Mensaje del Usuario.
	String identUser;
	// Atributo que contiene el mensaje del Usuario.
	String userMsg;
	// Atributo que contiene "Chatbot" para identificar el Mensaje del Chatbpt.
	String identChatbot;
	// Atributo que contiene el mensaje del Chatbot.
	String chatbotMsg;
        // Atributo que servira para el futuro rate, C representa mensaje correcto e I representa mensaje incorrecto
        String correct;
        
    // Metodos.
        
        // Metodo constructor de la clase Message.
	// Entrada : String con el identificador, String con el Mensaje del Usuario y String con el mensaje del Chatbot.
	// Salida : Objeto Message.
	public MessageModel(String idt, String user, String chatbot, String correction){
                setIdent(idt);
                setDateTime();
                setIdentUser("Usuario");
                setUserMsg(user);
                setIdentChatbot("Chatbot");
                setChatbotMsg(chatbot);
                setCorrect(correction);
        }
        
        // Metodo que retornara la fecha y la hora actual.
	// Entrada : Vacio.
	// Salida : String que contiene la fecha y la hora.
	private String getActualDateTime(){
		int day;
		int month;
		int year;
		String date;
		int seconds;
		int minutes;
		int hours;
		String time;
		Calendar aux = Calendar.getInstance();

		day = aux.get(Calendar.DAY_OF_MONTH);
		month = aux.get(Calendar.MONTH);
		year = aux.get(Calendar.YEAR);
		date = String.valueOf(day) + "." + String.valueOf(month + 1) + "." + String.valueOf(year);

		seconds = aux.get(Calendar.SECOND);
		minutes = aux.get(Calendar.MINUTE);
		hours = aux.get(Calendar.HOUR_OF_DAY);
		time = String.valueOf(hours) + "." + String.valueOf(minutes) + "." + String.valueOf(seconds);

		return date + "-"+ time;
	}

	// Metodo que introduce el contenido del objeto Message dentro de un ArrayList
	// Entrada : Vacio.
	// Salida : ArrayList de String con la informacion del Objeto
	public ArrayList<String> messageToArray(){
		ArrayList<String> messageArray = new ArrayList<String>();
		messageArray.add(getIdent());
		messageArray.add(getDateTime());
		messageArray.add(getIdentUser());
		messageArray.add(getUserMsg());
		messageArray.add(getIdentChatbot());
		messageArray.add(getChatbotMsg());
                messageArray.add(getCorrect());

		return messageArray;
	}
       
        // Get

	// Metodo que hace el get al atributo ident.
	// Entrada : Vacio.
	// Salida : Atributo ident.
	public String getIdent(){
        return this.ident;
	}

	// Metodo que hace el get al atributo dateTime.
	// Entrada : Vacio.
	// Salida : Atributo dateTime.
	public String getDateTime(){
        return this.dateTime;
	}

	// Metodo que hace el get al atributo identUser.
	// Entrada : Vacio.
	// Salida : Atributo identUser.
	public String getIdentUser(){
        return this.identUser;
	}

	// Metodo que hace el get al atributo userMsg.
	// Entrada : Vacio.
	// Salida : Atributo userMsg.
	public String getUserMsg(){
        return this.userMsg;
	}

	// Metodo que hace el get al atributo identChatbot.
	// Entrada : Vacio.
	// Salida : Atributo identChatbot.
	public String getIdentChatbot(){
        return this.identChatbot;
	}

	// Metodo que hace el get al atributo chatbotMsg.
	// Entrada : Vacio.
	// Salida : Atributo chatbotMsg.
	public String getChatbotMsg(){
        return this.chatbotMsg;
	}
        
        // Metodo que hace el get al atributo correct.
        // Entrada : Vacio.
        // Salida : Atributo correct;
        public String getCorrect(){
        return this.correct;
        }

	// Set

	// Metodo que hace el set al atributo ident.
	// Entrada : String con el identificador.
	// Salida : Vacia.
	public void setIdent (String idt){
        this.ident = idt;
	}

	// Metodo que hace el set al atributo ident.
	// Entrada : String con el identificador.
	// Salida : Vacia.
	public void setDateTime (){
        this.dateTime = getActualDateTime();
	}

	// Metodo que hace el set al atributo ident.
	// Entrada : String con el identificador.
	// Salida : Vacia.
	public void setIdentUser (String idtUser){
        this.identUser = idtUser;
	}

	// Metodo que hace el set al atributo ident.
	// Entrada : String con el identificador.
	// Salida : Vacia.
	public void setUserMsg (String msg){
        this.userMsg = msg;
	}

	// Metodo que hace el set al atributo ident.
	// Entrada : String con el identificador.
	// Salida : Vacia.
	public void setIdentChatbot (String idtChatbot){
        this.identChatbot = idtChatbot;
	}

	// Metodo que hace el set al atributo ident.
	// Entrada : String con el identificador.
	// Salida : Vacia.
	public void setChatbotMsg (String msg){
        this.chatbotMsg = msg;
	}
        
        // Metodo que hace el set al atributo correct.
        // Entrada : String con "C" o "I"
        // Salida : Vacia.
        public void setCorrect(String correction){
        this.correct = correction;
        }
}
