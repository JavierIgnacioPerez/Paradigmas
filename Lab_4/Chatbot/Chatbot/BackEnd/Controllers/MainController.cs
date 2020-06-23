using Chatbot.FrontEnd.Views;

namespace Chatbot.BackEnd.Controllers
{
    public class MainController
    {
        [System.STAThread]
        public static void Main() {
            ChatbotController cb = new ChatbotController();
            ChatbotView view = new ChatbotView(cb);
            view.ShowDialog();
        }
    }
}
