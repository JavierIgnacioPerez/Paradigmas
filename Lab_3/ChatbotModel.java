import java.util.Calendar;
import java.util.ArrayList;

public class ChatbotModel {

    // Atributos
    
        // Integer que determinara la personalidad del Chatbot.
        int personality;

        // Lista que contendra el vocabulario a manejar del Chatbot.
        // Esta lista contendra 11 sub-listas, cada una representara:
        // 		1ra sub-lista: Saludos
        //              2da sub-lista: Peticiones de Nombre.
        //		3ra sub-lista: Ofrecer ayuda.
        // 		4ta sub-lista: Oraciones de venta de autos.
        // 		5ta sub-lista: Oraciones de venta de modelos.
        //		6ta sub-lista: Despedidas
        //              7ma sub-lista: Oraciones cuando el Chatbot no entiende
        //		8va sub-lista: Marcas de auto a vender.
        //              9na sub-lista: Modelos de la Marca Ford.
        //              10ma sub-lista: Modelos de la Marca Toyota.
        //              11va sub-lista: Modelos de la Marca Peugeot.
        ArrayList<ArrayList<String>> vocabulary = new ArrayList<ArrayList<String>>();

        // Integer que contendra la valorizacion del Usuario al Chatbot, iniciado en 0.
        ArrayList<Integer> rate;
    
    // Metodos

	// Metodo constructor de la clase ChatBot.
	// Entrada : Vacia.
	// Salida : Objeto Chatbot.
	public ChatbotModel(int num){
            setPersonality(num);
            setVocabulary();
            rate = new ArrayList<Integer>();
	}
        
        // Get

        // Metodo que realiza el get al rate del chatbot.
        // Entrada : Vacia.
        // Salida : ArrayList de integer.
        public ArrayList<Integer> getRate(int num){
            return this.rate;
        }
        
        // Metodo que realiza el get al vocabulario del Chatbot.
	// Entrada : Vacia
	// Salida : ArrayList con el vocabulario.
	public ArrayList<ArrayList<String>> getVocabulary(){
		return this.vocabulary;
	}
        
	// Metodo que realiza el get a la personalidad del Chatbot.
	// Entrada : Vacia
	// Salida : String con la personalidad.
	public int getPersonality(){
		return this.personality;
	}

	// Metodo que realiza el get al saludo del Chatbot, dependiendo de la hora del dia, sera el saludo que efectue el Chatbot.
	// Entrada : Vacia.
	// Salida : String con el mensaje del Chatbot.
	public String getSalute(){
		Calendar auxDate = Calendar.getInstance();
		int hour = auxDate.get(Calendar.HOUR_OF_DAY);

		if(hour >= 6 && hour < 12){
			return vocabulary.get(0).get(0);
		}
		if(hour >= 12 && hour < 19){
			return vocabulary.get(0).get(1);
		}
		return vocabulary.get(0).get(2);
	}

	// Metodo que realiza el get a la peticion de nombre del Chatbot, y dado un numero, obtener un mensaje al azar.
	// Entrada : Integer para realizar el random y asi dar variabilidad a la respuesta de Bot.
	// Salida : String con el mensaje del Chatbot.
	public String getWelcome(){
		return vocabulary.get(1).get(0);
	}

	// Metodo que realiza el get al mensaje de ayuda del Chatbot, y dado un numero, obtener un mensaje al azar.
	// Entrada : Integer para realizar el random y asi dar variabilidad a la respuesta de Bot.
	// Salida : String con el mensaje del Chatbot.
	public String getHelp(){
		return vocabulary.get(2).get(0);
	}

	// Metodo que realiza el get a la venta de marcas del Chatbot, y dado un numero, obtener un mensaje al azar.
	// Entrada : Integer para realizar el random y asi dar variabilidad a la respuesta de Bot.
	// Salida : String con el mensaje del Chatbot.
	public String getSellCars(){
		return vocabulary.get(3).get(0);
	}

	// Metodo que realiza el get a la venta de modelos del Chatbot, y dado un numero, obtener un mensaje al azar.
	// Entrada : Integer para realizar el random y asi dar variabilidad a la respuesta de Bot.
	// Salida : String con el mensaje del Chatbot.
	public String getSellModels(){
		return vocabulary.get(4).get(0);
	}

	// Metodo que realiza el get a las despedidas del Chatbot, y dado un numero, obtener un mensaje al azar.
	// Entrada : Integer para realizar el random y asi dar variabilidad a la respuesta de Bot.
	// Salida : String con el mensaje del Chatbot.
	public String getBye(){
		return vocabulary.get(5).get(0);
	}

	// Metodo que realiza el get al mensaje cuando el Chatbot no entiende, y dado un numero, obtener un mensaje al azar.
	// Entrada : Integer para realizar el random y asi dar variabilidad a la respuesta de Bot.
	// Salida : String con el mensaje del Chatbot.
	public String getDontUnderstand(){
		return vocabulary.get(6).get(0);
	}

	// Metodo que realiza el get a las marcas de auto que el Chatbot puede vender, y dado un numero, obtener un mensaje al azar.
	// Entrada : Integer para realizar el random y asi dar variabilidad a la respuesta de Bot.
	// Salida : String con el mensaje del Chatbot.
	public ArrayList<String> getBrands(){
		return vocabulary.get(7);
	}

	// Metodo que realiza el get a lps modelos de auto que el Chatbot puede vender, y dado un numero, obtener un mensaje al azar.
	// Entrada : Integer para realizar el random y asi dar variabilidad a la respuesta de Bot. String brand para especificar de que marca de solicitan los modelos
	// Salida : String con el mensaje del Chatbot.
	public ArrayList<String> getModels(String brand){
		if(brand.equals("Ford")){
			return vocabulary.get(8);
		}
		if(brand.equals("Toyota")){
			return vocabulary.get(9);
		}
		if(brand.equals("Peugeot")){
			return vocabulary.get(10);
		}
		return null;
	}
        
        // Set
        
        // Metodo que realiza el set a la personalidad del Chatbot.
        // Entrada : Integer que representa la personalidad del Chatbot.
        // Salida : Vacia.
        public void setPersonality(int num){
            this.personality = num;
        }
        
        // Metodo que realiza el set al rate del chatbot.
        // Entrada : Int rate que se agregara al arreglo
        // Salida : ArrayList de integer actualizado.
        public void setRate(int num){
            this.rate.add(num);
        }
        
        // Metodo que realiza el set al vocabulario del chatbot, dado un numero que deine el chatbot con que se trabajara.
        // Entrada : Integer que representa la personalidad del Chatbot.
        // Salida Vacia.
        public void setVocabulary(){
                // El integer 0 representara la personalidad Formal.
		// El integer 1 representara la personalidad Coloquial.
		if(personality == 0){
			ArrayList<String> aux0 = new ArrayList<String>();
			aux0.add("Buenos Dias");
			aux0.add("Buenas Tardes");
			aux0.add("Buenas Noches");
			ArrayList<String> aux1 = new ArrayList<String>();
			aux1.add("Bienvenido al sistema de venta de autos, Cual es su nombre?");
			ArrayList<String> aux2 = new ArrayList<String>();
			aux2.add("En que le puedo ayudar?");
			ArrayList<String> aux3 = new ArrayList<String>();
			aux3.add("En este momento puedo vender estos autos: ");
			ArrayList<String> aux4 = new ArrayList<String>();
			aux4.add("Los modelos que tengo disponible son: ");
			ArrayList<String> aux5 = new ArrayList<String>();
			aux5.add("Ha sido un gusto ayudarlo, espero que vuelva en otra ocasion.");
			ArrayList<String> aux6 = new ArrayList<String>();
			aux6.add("Disculpe, Lo puede decir de otra manera?");
			ArrayList<String> aux7 = new ArrayList<String>();
			aux7.add("Ford");
			aux7.add("Toyota");
			aux7.add("Peugeot");
			ArrayList<String> aux8 = new ArrayList<String>();
			aux8.add("Fiesta");
			aux8.add("Mustang");
			aux8.add("FordRaptor");
			ArrayList<String> aux9 = new ArrayList<String>();
			aux9.add("Yaris");
			aux9.add("Auris");
			aux9.add("Corolla");
			ArrayList<String> aux10 = new ArrayList<String>();
			aux10.add("301");
			aux10.add("2008");
			aux10.add("206");

			this.vocabulary.add(aux0);
			this.vocabulary.add(aux1);
			this.vocabulary.add(aux2);
			this.vocabulary.add(aux3);
			this.vocabulary.add(aux4);
			this.vocabulary.add(aux5);
			this.vocabulary.add(aux6);
			this.vocabulary.add(aux7);
			this.vocabulary.add(aux8);
			this.vocabulary.add(aux9);
			this.vocabulary.add(aux10);
                }
                if(personality == 1){
                        ArrayList<String> aux0 = new ArrayList<String>();
			aux0.add("Buen Dia");
			aux0.add("Buenas Tardes");
			aux0.add("Buenas Noches");
			ArrayList<String> aux1 = new ArrayList<String>();
			aux1.add("Bienvenido a la automotora, Dime tu nombre");
			ArrayList<String> aux2 = new ArrayList<String>();
			aux2.add("En que te ayudo?");
			ArrayList<String> aux3 = new ArrayList<String>();
			aux3.add("Estas marcas de autos tengo a la venta: ");
			ArrayList<String> aux4 = new ArrayList<String>();
			aux4.add("Estos modelos tengo a la venta:: ");
			ArrayList<String> aux5 = new ArrayList<String>();
			aux5.add("Espero vuelvas.");
			ArrayList<String> aux6 = new ArrayList<String>();
			aux6.add("Lo puedes repetir?");
			ArrayList<String> aux7 = new ArrayList<String>();
			aux7.add("Ford");
			aux7.add("Toyota");
			aux7.add("Peugeot");
			ArrayList<String> aux8 = new ArrayList<String>();
			aux8.add("Fiesta");
			aux8.add("Mustang");
			aux8.add("FordRaptor");
			ArrayList<String> aux9 = new ArrayList<String>();
			aux9.add("Yaris");
			aux9.add("Auris");
			aux9.add("Corolla");
			ArrayList<String> aux10 = new ArrayList<String>();
			aux10.add("301");
			aux10.add("2008");
			aux10.add("206");

			this.vocabulary.add(aux0);
			this.vocabulary.add(aux1);
			this.vocabulary.add(aux2);
			this.vocabulary.add(aux3);
			this.vocabulary.add(aux4);
			this.vocabulary.add(aux5);
			this.vocabulary.add(aux6);
			this.vocabulary.add(aux7);
			this.vocabulary.add(aux8);
			this.vocabulary.add(aux9);
			this.vocabulary.add(aux10);
                }
            }
}
