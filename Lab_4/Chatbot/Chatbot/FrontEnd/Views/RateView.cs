using System;
using System.Windows.Forms;
using Chatbot.BackEnd.Controllers;
using System.Threading;

namespace Chatbot.FrontEnd.Views
{
    public partial class RateView : Form
    {
        ViewController viewController;
        ChatbotController chatbot;

        public RateView(ViewController viewC, ChatbotController cbot)
        {
            viewController = viewC;
            chatbot = cbot;
            InitializeComponent();
            Rate1_Button.Enabled = false;
            Rate2_Button.Enabled = false;
        }

        private void Rate_Button_Click(object sender, EventArgs e)
        {
            String response = chatbot.Rate(Rate_TextBox.Text);
            Warning_TextBox.Text = response;
            Application.DoEvents();
            Thread.Sleep(2500);
            viewController.BackToChatbotView(chatbot,Warning_TextBox);
        }

        private void Rate2_Button_Click(object sender, EventArgs e)
        {
            String response = chatbot.Rate(Coherencia_TextBox.Text,Proposito_TextBox.Text);
            Warning_TextBox.Text = response;
            Application.DoEvents();
            Thread.Sleep(2500);
            viewController.BackToChatbotView(chatbot,Warning_TextBox);
        }

        private void Evaluacion_CheckBox_CheckedChanged(object sender, EventArgs e)
        {
            viewController.LockViewElementsEv(Cuestionario_CheckBox,Evaluacion_CheckBox,Rate_TextBox,Coherencia_TextBox,Proposito_TextBox,Rate1_Button, Rate2_Button);
        }

        private void Cuestionario_CheckBox_CheckedChanged(object sender, EventArgs e)
        {
            viewController.LockViewElementsCu(Cuestionario_CheckBox, Evaluacion_CheckBox, Rate_TextBox, Coherencia_TextBox, Proposito_TextBox, Rate1_Button, Rate2_Button);
        }
    }
}
