import java.io.IOException;
import java.util.Scanner;

public class ChatbotView {
    
    // Atributos.
    
        // Atributo que es un objeto de la clase ChatbotController.
        ChatbotController chatbotController;
    
    // Metodos.
    
        //Metodo constructor de la clase ChatbotView;
        public ChatbotView(ChatbotController chatbotController) {
        this.chatbotController = chatbotController;
    }
        
        // Metodo que permitira obtener informacion que el usuario entrega mediante el teclado y mostrar la respuesta del Chatbot.
        // Entrada: Vacia.
        // Salida : Vacia.    
        public void conversation(){
            chatbotController.welcome();
            boolean lock = false;
            
            while(lock == false){
                Scanner inScanner = new Scanner (System.in);
                String inKey = inScanner.nextLine(); 
                String[] auxList = chatbotController.verifyStart(inKey);
                
                try{
                    if(auxList[0].equals("!BeginDialog")){
                        String answer = chatbotController.beginDialog(auxList[1]);
                        System.out.println(answer);
                        lock = false;
                    }
                    else if (auxList[0].equals("!EndDialog")){
                        String answer = chatbotController.endDialog();
                        System.out.println(answer);
                        lock = false;
                    }
                    else if (inKey.equals("!Exit")){
                        lock = true;
                    }
                    
                    else if (inKey.equals("!SaveLog")){
                        String answer = chatbotController.saveLog();
                        System.out.println(answer);
                        lock = false;
                    }
                    else if (auxList[0].equals("!LoadLog")){
                        if(auxList[1] != null){
                            String answer = chatbotController.loadLog(auxList[1]);
                            System.out.println(answer);
                            lock = false;
                        }
                        else{
                            System.out.println("Nombre de archivo erroneo.");
                            lock = false;
                        }
                    }
                    else if (auxList[0].equals("!Rate")){
                        if(auxList[1] == null){
                            String answer = chatbotController.rate("0",auxList[2]);
                            System.out.println(answer);
                            lock = false;
                        }
                        else if(auxList[2] == null){
                            String answer = chatbotController.rate(auxList[1],"0");
                            System.out.println(answer);
                            lock = false;
                        }
                        else{
                            String answer = chatbotController.rate(auxList[1],auxList[2]);
                            System.out.println(answer);
                            lock = false;
                        }
                    }
                    else{
                        String answer = chatbotController.sendMessage(inKey);
                        System.out.println(answer);
                        lock = false;
                    }
                }
                catch(ArrayIndexOutOfBoundsException e){
                    if(auxList[0].equals("!BeginDialog")){
                        String answer = chatbotController.beginDialog("0");
                        System.out.println(answer);
                        lock = false;
                    }
                    else{
                        String answer = chatbotController.rate("0","0");
                        System.out.println(answer);
                        lock = false;
                    }
                }
            }
        }
}
