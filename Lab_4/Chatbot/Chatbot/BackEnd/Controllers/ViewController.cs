using Chatbot.FrontEnd.Views;
using Chatbot.BackEnd.Controllers;
using System.Threading;
using System.Windows.Forms;

namespace Chatbot.BackEnd.Controllers
{
        public class ViewController
        {
            // Atributos

            ChatbotController chatbot;
            ChatbotView chatbotView;
            RateView rateView;

            // Metodos 

            // Metodo que dado un objeto ChatbotController permite abrir la ventana de rate.
            // Entrada : Objeto ChatbotController
            // Salida : Vacia.
            public void openRateView(ChatbotController cbot, string aux, TextBox chat)
            {

                if (aux.Equals("AVISO : Debe iniciar una conversacion con BeginDialog y un seed (0 o 1).\r\n"))
                {
                }
                else
                {
                    Application.DoEvents();
                    Thread.Sleep(2500);
                    chat.Text += "AVISO : Abriendo ventada de Rate...\r\n";
                    Application.DoEvents();
                    Thread.Sleep(2500);
                    chatbot = cbot;
                    rateView = new RateView(this, cbot);
                    rateView.ShowDialog();
                }

            }

            // Metodo que dado un objeto ChatbotController permite volver a abrir la ventana de chatbot.
            // Entrada : Objeto ChatbotController
            // Salida : Vacia.
            public void BackToChatbotView(ChatbotController cbot, TextBox Warning)
            {
                chatbotView = new ChatbotView(cbot);
                if (Warning.Text.Equals("AVISO : El rate se ha añadido satisfactoriamente."))
                {
                    Warning.Text = "AVISO : Cerrando...";
                    Application.DoEvents();
                    Thread.Sleep(2500);
                    rateView.Hide();
                }
                else
                {
                    Warning.Text = "AVISO : Ingrese un valor nuevamente.";
                    Application.DoEvents();
                    Thread.Sleep(2500);
                }
            }

            // Metodo que dado dos checkbox, los habilita o deshabilita dependiendo si el otro checkbox esta o no habilitado.
            // Entrada : Vacia.
            //  Salida : Vacia.
            public void LockViewElementsEv(CheckBox cuestionario, CheckBox evaluacion, TextBox ev1, TextBox cu2, TextBox cu3, Button b1, Button b2)
            {
                cu2.Text = "";
                cu3.Text = "";
                cuestionario.Enabled = !(evaluacion.CheckState == CheckState.Checked);
                cu2.Enabled = !(evaluacion.CheckState == CheckState.Checked);
                cu3.Enabled = !(evaluacion.CheckState == CheckState.Checked);
                b1.Enabled = (evaluacion.CheckState == CheckState.Checked);
            }

            // Metodo que dado dos checkbox, los habilita o deshabilita dependiendo si el otro checkbox esta o no habilitado.
            // Entrada : Vacia.
            //  Salida : Vacia.
            public void LockViewElementsCu(CheckBox cuestionario, CheckBox evaluacion, TextBox ev1, TextBox cu2, TextBox cu3, Button b1, Button b2)
            {
                ev1.Text = "";
                evaluacion.Enabled = !(cuestionario.CheckState == CheckState.Checked);
                ev1.Enabled = !(cuestionario.CheckState == CheckState.Checked);
                b2.Enabled = (cuestionario.CheckState == CheckState.Checked);
            }

            // Metodo que permite iniciar la ventana de SavloLogDialog cuando el log existe
            // Entrada : ChatbotController cbot, String con la respuesta de EndDialog para la comparacion, Boton SaveDialog
            // Salida : Vacia
            public void LockSaveDialog(ChatbotController cbot, string response, Button saveButton)
            {
                if (response.Equals("AVISO : Debe iniciar una conversacion con BeginDialog y un seed (0 o 1).\r\n"))
                {
                    saveButton.Enabled = false;
                }
                else
                {
                    saveButton.Enabled = true;
                }
            }
        }
}
