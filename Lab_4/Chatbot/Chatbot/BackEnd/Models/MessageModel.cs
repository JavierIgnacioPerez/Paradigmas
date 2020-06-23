using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chatbot.BackEnd.Models
{
    public class MessageModel
    {
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

        // Metodos.

            // Metodo constructor de la clase Message.
            // Entrada : String con el identificador, String con el Mensaje del Usuario y String con el mensaje del Chatbot.
            // Salida : Objeto Message.
            public MessageModel(String idt,String dt, String user, String chatbot)
            {
                Ident = idt;
                DateTime = dt;
                IdentUser = "Usuario";
                UserMsg = user;
                IdentChatbot = "Chatbot";
                ChatbotMsg = chatbot;
            }

        // Propiedades.

            public String Ident { get { return ident; } set { ident = value; } }
            public String DateTime { get { return dateTime; } set { dateTime = value; } }
            public String IdentUser { get { return identUser; } set { identUser = value; } }
            public String UserMsg { get { return userMsg; } set { userMsg = value; } }
            public String IdentChatbot { get { return identChatbot; } set { identChatbot = value; } }
            public String ChatbotMsg { get { return chatbotMsg; } set { chatbotMsg = value; } }
    }
}
