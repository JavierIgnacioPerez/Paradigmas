import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;

public class ChatbotController {
    
    // Atributos.

        // Atributo que es un objeto de la clase Chatbot.
        ChatbotModel chatbot;

        // Atributo que es un objeto de la clase Log.
        
        LogModel inputLog;

        // Atributo que es un objeto de la clase User.
        UserModel user;

        // Atributo que es un objeto de la clase Message.
        MessageModel message;
        
        // Atributo que es un objeto de la clase ComparationController.
        ComparationController cmp;
    
    // Metodos.  

        // Metodo constructor de la clase ChatbotController
        // Entrada : Log.
        // Salida : Vacía.
        public ChatbotController(ArrayList<ArrayList<String>> log){
            this.inputLog = new LogModel(log);
            this.cmp = new ComparationController();
            this.user = new UserModel("Tipo");
        }
        
        // Metodo que da la bienvenida la usuario una vez inicia el programa.
        // Entrada : Vacía.
        // Salida : Vacía.
        public void welcome(){

        System.out.println("Bienvenidos al ChatBot de la automotora 'Perez'.");
        System.out.println("La funcion de este ChatBot es ayudar al usuario al momento de realizar una compra en nuestra automotora.");
        System.out.println("");
        System.out.println("Recuerde que para hablar con el ChatBot Formal, debe ingresar un 0.");
        System.out.println("Recuerde que para hablar con el ChatBot Coloquial, debe ingresar un 1.");
        System.out.println("");
        System.out.println("--------------------------------------------------------------------------------------------------------");
        System.out.println("");
        }
        
        // Metodo que dado dos scores, guarda los scores respectivos con del usuario y del chatbot.
        // Entrada : Dos integer (De 0 a 5);
        // Salida : Vacia
        public String rate(String rateCb, String rateUs){
            try{
                int rateChatbot = Integer.parseInt(rateCb);
                int rateUser = Integer.parseInt(rateUs);
                if(rateChatbot >= 0 && rateChatbot <= 5){
                    if(rateUser >= 0 && rateUser <= 5){
                        chatbot.setRate(rateChatbot);
                        user.setUserRate(rateUser);
                        return "Se han asignado correctamente los rates al Chatbot y al Usuario";
                    }
                    else{
                        return "El rate del usuario debe estar entre 0 y 5";
                    }
                }
                else{
                    return "El rate del ChatBot debe estar entre 0 y 5";
                }
            }
            catch(Exception e){
                return "El Log debe tener una conversacion valida.";
            }
        }
        
        // Metodo que dado un Log, permite guardarlo en un archivo de texto.
        // Entrada : Vacia.
        // Salida : String con verificacion.
        public String saveLog(){
            if(inputLog.countBegin() == inputLog.countEnd()){
                File file;
                FileWriter fileWriter;

                try{
                    file = new File (message.getDateTime() + ".txt");
                    fileWriter = new FileWriter(file);
                    for (int i = 0; i < inputLog.getLog().size(); i++){
                        fileWriter.write(inputLog.getLog().get(i).get(0) + "\n");
                        fileWriter.write(inputLog.getLog().get(i).get(1) + "\n");
                        fileWriter.write(inputLog.getLog().get(i).get(2) + "\n");
                        fileWriter.write(inputLog.getLog().get(i).get(3) + "\n");
                        fileWriter.write(inputLog.getLog().get(i).get(4) + "\n");
                        fileWriter.write(inputLog.getLog().get(i).get(5) + "\n");
                        fileWriter.write(inputLog.getLog().get(i).get(6) + "\n");
                        fileWriter.write("---" + "\n");
                    }
                   fileWriter.close();
                   return("El Log se ha guardado correctamente.");
                }
                catch(Exception e){
                    return ("Error con la escritura del archivo.");
                }
            }
            else{
                return "Termine la conversacion antes de guardar el Log.";
            }
        }
        
        // Metodo que dado un String(Nombre del Archivo), permite cargar su contenido y guardarlo como un Log.
        // Entrada : String con el nombre del archivo.
        // Salida : String con verifiacion.
        public String loadLog(String fileName){
            if(inputLog.countBegin() == inputLog.countEnd()){
                String words;
                FileReader file;
                BufferedReader reader;
                try{
                    file = new FileReader(fileName);
                    reader = new BufferedReader(file);
                    ArrayList<String> aux = new ArrayList<String>();
                    while((words = reader.readLine())!= null) {
                        if(words.equals("---")){
                            aux.remove("---");
                            inputLog.setLog(aux);
                            aux = new ArrayList<String>();
                        }
                        aux.add(words);
                    }
                    reader.close();
                    return "Log cargado correctamente";
                }
                catch(Exception e){
                    return "Error con la carga del archivo.";
                }
            }
            else{
                return "Termine la conversacion antes de cargar un Log.";
            }
        }
        
        // Metodo 

        // Metodo que inicia el dialogo con el ChatBot.
        // Entrada : Integer seed que determina la personalidad del Chatbot
        // Salida : String con respuesta al mensaje de entrada.
        public String beginDialog(String seed){
            try{
                int intSeed = Integer.parseInt(seed);
                if(intSeed == 0 || intSeed == 1){
                    if( inputLog.countBegin() - inputLog.countEnd() == 0){
                        chatbot = new ChatbotModel(intSeed);
                        message = new MessageModel("BeginDialog","...",chatbot.getSalute() + ". " + chatbot.getWelcome(),"C");
                        inputLog.setLog(this.message.messageToArray());
                        return chatbot.getSalute() + ". " + chatbot.getWelcome();
                    }
                    else{
                        chatbot = new ChatbotModel(intSeed);
                        message = new MessageModel("BeginDialogTry","...","Debe finalizar la conversación","I");
                        inputLog.setLog(this.message.messageToArray());
                        return "Debe finalizar la conversacion";
                    }
                    
                }   
                    chatbot = new ChatbotModel(intSeed);
                    message = new MessageModel("BeginDialogTry","...","Seed fuera del alcanze de los chatbot.","I");
                    inputLog.setLog(this.message.messageToArray());
                    return "Seed fuera del alcanze de los chatbot.";
            }
            catch(NumberFormatException e){
                return "Parametro ingresado incorrecto.";
            }
        }

        // Metodo que finaliza el dialogo con el ChatBot.
        // Entrada : Vacia.
        // Salida : String con respuesta al mensaje de entrada.
        public String endDialog(){
            if (inputLog.countBegin() > inputLog.countEnd()){
                if(user.getName().equals("Tipo")){
                    message = new MessageModel("EndDialog","...",chatbot.getBye(),"C");
                }
                else{
                    message = new MessageModel("EndDialog","...",user.getName() + ". " + chatbot.getBye(),"C");
                }
                inputLog.setLog(this.message.messageToArray());
                return chatbot.getBye(); 
            }
            
            message = new MessageModel("EndDialogTry","...","Seed fuera del alcanze de los chatbot.","I");
            inputLog.setLog(this.message.messageToArray());
            return "Debe iniciar una conversacion con '!BeginDialog' y un seed (0 o 1)";        
        }
        
        // Metodo que recibe un mensaje, realiza una comparacion con palabras claves y retorna un mensaje pertintente desde el Chatbot.
        // Entrada : String con mensaje.
        // Salida : String con respuesta al mensaje de entrada.
        public String sendMessage(String msg){
            if(inputLog.countBegin() > inputLog.countEnd()){
                if(cmp.cmpName(msg) == true){
                    String[] aux = msg.split(" ");
                    user.setName(aux[3]);
                    message = new MessageModel("SendMessage",msg,user.getName() + ", " + chatbot.getHelp(),"C");
                    inputLog.setLog(this.message.messageToArray());
                    return user.getName() + ", " + chatbot.getHelp();
                    }
                else if(cmp.cmpBuy(msg) == true){
                    message = new MessageModel("SendMessage",msg,user.getName() + ", " + chatbot.getSellCars() + cmp.toFormat(chatbot.getBrands()),"C");
                    inputLog.setLog(this.message.messageToArray());
                    return user.getName() + ", " + chatbot.getSellCars() + cmp.toFormat(chatbot.getBrands());
                    }
                else if(cmp.cmpFord(msg) == true){
                    user.setBrandPreference("Ford");
                    message = new MessageModel("SendMessage",msg,user.getName() + ", " + chatbot.getSellModels() + cmp.toFormat(chatbot.getModels("Ford")),"C");
                    inputLog.setLog(this.message.messageToArray());
                    return chatbot.getSellModels() + cmp.toFormat(chatbot.getModels("Ford"));
                }
                else if(cmp.cmpToyota(msg) == true){
                    user.setBrandPreference("Toyota");
                    message = new MessageModel("SendMessage",msg,user.getName() + ", " + chatbot.getSellModels() + cmp.toFormat(chatbot.getModels("Toyota")),"C");
                    inputLog.setLog(this.message.messageToArray());
                    return chatbot.getSellModels() + cmp.toFormat(chatbot.getModels("Toyota"));
                }
                else if(cmp.cmpPeugeot(msg) == true){
                    user.setBrandPreference("Peugeot");
                    message = new MessageModel("SendMessage",msg,user.getName() + ", " + chatbot.getSellModels() + cmp.toFormat(chatbot.getModels("Peugeot")),"C");
                    inputLog.setLog(this.message.messageToArray());
                    return chatbot.getSellModels() + cmp.toFormat(chatbot.getModels("Peugeot"));
                }
                else if(cmp.cmpBuyModel(msg,cmp.arrayToLower(chatbot.getVocabulary().get(8)))){
                   try{
                        if(user.getBrandPreference().equals("Ford") && cmp.arrayToLower(chatbot.getModels("Ford")).contains(cmp.inListModel(msg))){
                            user.setModelPreference(cmp.inListModel(msg));
                            message = new MessageModel("SendMessage",msg,user.getName() + ", " + "Su seleccion es : Marca -> " + user.getBrandPreference() + " y Modelo -> " + user.getModelPreference(),"C");
                            inputLog.setLog(this.message.messageToArray());
                            return user.getName() + ", " + "Su seleccion es : Marca -> " + user.getBrandPreference() + " y Modelo -> " + user.getModelPreference();
                        }
                        else{
                            message = new MessageModel("SendMessage",msg,user.getName() + ", " + "No puede elegir un modelo de la Marca Ford, su elección de marca fue " + user.getBrandPreference(),"I");
                            inputLog.setLog(this.message.messageToArray());
                            return user.getName() + ", " + "No puede comprar este modelo, su eleccion de marca fue " + user.getBrandPreference();
                        }
                   }
                   catch(NullPointerException e){
                       return "Ha ocurrido un error";
                   }
                }
                else if(cmp.cmpBuyModel(msg,cmp.arrayToLower(chatbot.getVocabulary().get(9)))){
                    try{
                        if(user.getBrandPreference().equals("Toyota") && cmp.arrayToLower(chatbot.getModels("Toyota")).contains(cmp.inListModel(msg))){
                            user.setModelPreference(cmp.inListModel(msg));
                            message = new MessageModel("SendMessage",msg,user.getName() + ", " + "Su seleccion es : Marca -> " + user.getBrandPreference() + " y Modelo -> " + user.getModelPreference(),"C");
                            inputLog.setLog(this.message.messageToArray());
                            return user.getName() + ", " + "Su seleccion es : Marca -> " + user.getBrandPreference() + " y Modelo -> " + user.getModelPreference();
                        }
                        else{
                            message = new MessageModel("SendMessage",msg,user.getName() + ", " + "No puede elegir un modelo de la Marca Toyota, su elección de marca fue " + user.getBrandPreference(),"I");
                            inputLog.setLog(this.message.messageToArray());
                            return user.getName() + ", " + "No puede comprar este modelo, su eleccion de marca fue " + user.getBrandPreference();
                        }
                    }
                    catch(NullPointerException e){
                        return "Ha ocurrido un error";
                    }
                }
                else if(cmp.cmpBuyModel(msg,cmp.arrayToLower(chatbot.getVocabulary().get(10)))){
                    try{
                        if(user.getBrandPreference().equals("Peugeot") && cmp.arrayToLower(chatbot.getModels("Peugeot")).contains(cmp.inListModel(msg))){
                            user.setModelPreference(cmp.inListModel(msg));
                            message = new MessageModel("SendMessage",msg,user.getName() + ", " + "Su seleccion es : Marca -> " + user.getBrandPreference() + " y Modelo -> " + user.getModelPreference(),"C");
                            inputLog.setLog(this.message.messageToArray());
                            return user.getName() + ", " + "Su seleccion es : Marca -> " + user.getBrandPreference() + " y Modelo -> " + user.getModelPreference();
                        }
                        else{
                            message = new MessageModel("SendMessage",msg,user.getName() + ", " + "No puede elegir un modelo de la Marca Peugeot, su elección de marca fue " + user.getBrandPreference(),"I");
                            inputLog.setLog(this.message.messageToArray());
                            return user.getName() + ", " + "No puede comprar este modelo, su eleccion de marca fue " + user.getBrandPreference();
                        }
                    }
                    catch(NullPointerException e){
                        return "Ha ocurrido un error";
                    }
                }
                else if(cmp.lastBuy(msg)){
                    message = new MessageModel("SendMessage",msg,user.getName() + ", Su compra se ha realizado exitosamente","C");
                    inputLog.setLog(this.message.messageToArray());
                    return user.getName() + ", Su compra se ha realizado exitosamente";
                }
                else{
                    message = new MessageModel("SendMessage",msg,chatbot.getDontUnderstand(),"I");
                    inputLog.setLog(this.message.messageToArray());
                    return chatbot.getDontUnderstand();
                }
            }
            message = new MessageModel("SendMessage",msg,"Inicie una Conversacion, por favor","I");
            inputLog.setLog(this.message.messageToArray());
            return "Inicie una Conversacion, por favor";
        }
        
                          
        // Metodo que permite separar un String mediante un espacio.
        // Entrada : String con un mensaje.
        // Salida : ArrayList que contiene el mensaje.
        public String[] verifyStart(String message){
            String[] start = message.split(" ");
            return start;
        }
        
        // Metodo que le hace el get al objeto inputLog.
        // Entrada : Vacia
        // Salida : Objeto inputLog de la clase LogModel
        public LogModel getInputLog() {
        return inputLog;
    }
        
}
