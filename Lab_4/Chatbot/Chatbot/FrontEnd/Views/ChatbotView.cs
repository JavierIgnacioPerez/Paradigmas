using System;
using System.Threading;
using System.Windows.Forms;
using Chatbot.BackEnd.Controllers;

namespace Chatbot.FrontEnd.Views
{
    public partial class ChatbotView : Form
    {
        //Atributos.

            ChatbotController chatbot;
            ViewController view;

        //Metodos 

            public ChatbotView(ChatbotController cbot)
            {
                view = new ViewController();
                InitializeComponent();
                chatbot = cbot;
                SaveLog_Button.Enabled = false;
                Chatbot_TextBox.Text = cbot.Welcome();
            }

            private void BeginDialog_Button_Click(object sender, EventArgs e)
            {
                if (BeginDialog_TextBox.Text == "")
                {
                    String response;
                    response = chatbot.BeginDialog("0");
                    Chatbot_TextBox.Text += response;
                    BeginDialog_TextBox.Text = "";
                    Chatbot_TextBox.SelectionStart = Chatbot_TextBox.Text.Length;
                    Chatbot_TextBox.ScrollToCaret();
                    SaveLog_Button.Enabled = false;
                }
                else {
                    String response = chatbot.BeginDialog(BeginDialog_TextBox.Text);
                    Chatbot_TextBox.Text += response;
                    BeginDialog_TextBox.Text = "";
                    Chatbot_TextBox.SelectionStart = Chatbot_TextBox.Text.Length;
                    Chatbot_TextBox.ScrollToCaret();
                    SaveLog_Button.Enabled = false;
                }
            }

            private void EndDialog_Button_Click(object sender, EventArgs e)
            {
                String response;
                response = chatbot.EndDialog();
                Chatbot_TextBox.Text += response;
                Chatbot_TextBox.SelectionStart = Chatbot_TextBox.Text.Length;
                Chatbot_TextBox.ScrollToCaret();
                view.openRateView(chatbot,response,Chatbot_TextBox);   
                view.LockSaveDialog(chatbot,response,SaveLog_Button);
            }

            private void SendMessage_Button_Click(object sender, EventArgs e)
            {
                if (SendMessage_TextBox.Text == "")
                {
                    String response;
                    response = "Porfavor, ingrese un mensaje.\r\n";
                    SendMessage_TextBox.Text = "";
                    Chatbot_TextBox.Text += response;
                    Chatbot_TextBox.SelectionStart = Chatbot_TextBox.Text.Length;
                    Chatbot_TextBox.ScrollToCaret();
                }
                else
                {
                    String response;
                    response = chatbot.SendMessage(SendMessage_TextBox.Text);
                    SendMessage_TextBox.Text = "";
                    Chatbot_TextBox.Text += response;
                    Chatbot_TextBox.SelectionStart = Chatbot_TextBox.Text.Length;
                    Chatbot_TextBox.ScrollToCaret();
                }
            }

            private void LoadLog_Button_Click(object sender, EventArgs e)
            {
                OpenFileDialog openFileDialog1 = new OpenFileDialog();
                openFileDialog1.Filter = "Archivos de texto(*.txt)| *.txt";
                openFileDialog1.Title = "Load Log";
                openFileDialog1.ShowDialog();
                String response = chatbot.LoadLog(openFileDialog1.FileName);
                Chatbot_TextBox.Text += response + "\r\n";
                Chatbot_TextBox.SelectionStart = Chatbot_TextBox.Text.Length;
                Chatbot_TextBox.ScrollToCaret();
                Chatbot_TextBox.Text = "Cargando Log...";
                Application.DoEvents();
                Thread.Sleep(2500);
                response = chatbot.Welcome();
                Chatbot_TextBox.Text = response;
                response = chatbot.ReloadChat();
                Chatbot_TextBox.Text += response;
                Chatbot_TextBox.SelectionStart = Chatbot_TextBox.Text.Length;
                Chatbot_TextBox.ScrollToCaret();
            }

            private void SaveLog_Button_Click(object sender, EventArgs e)
            {
                saveFileDialog1.Filter = "Archivos de texto(*.txt)| *.txt";
                saveFileDialog1.Title = "Save Log";
                saveFileDialog1.ShowDialog();
                String response = chatbot.SaveLog(saveFileDialog1.FileName);
                Chatbot_TextBox.Text += response + "\r\n";
                Chatbot_TextBox.SelectionStart = Chatbot_TextBox.Text.Length;
                Chatbot_TextBox.ScrollToCaret();
            }

            private void ShowRates_Button_Click(object sender, EventArgs e)
            {
                String response = chatbot.RatesToString();
                Chatbot_TextBox.Text += response + "\r\n";
                Chatbot_TextBox.SelectionStart = Chatbot_TextBox.Text.Length;
                Chatbot_TextBox.ScrollToCaret();
            }
    }
}
