public class Main {

    static ChatbotView chatbotView;
    static ChatbotController chatbotController;
    
    public static void main(String[] args){
        
        chatbotController = new ChatbotController(null);
        chatbotView = new ChatbotView(chatbotController);
        chatbotView.conversation();
    }
    
}