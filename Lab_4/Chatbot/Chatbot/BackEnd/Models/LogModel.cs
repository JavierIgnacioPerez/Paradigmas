using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chatbot.BackEnd.Models
{
    public class LogModel
    {
        // Atributos.

        List<MessageModel> log;

        // Metodos.

            // Metodo constructor de la clase Log.
            // Entrada : String con el identificador, String con el Mensaje del Usuario y String con el mensaje del Chatbot.
            // Salida : Objeto Log.
            public LogModel(List<MessageModel> inputLog)
            {
                if (inputLog == null || inputLog.Count == 0)
                {
                    this.log = new List<MessageModel>();
                }
                else
                {
                    this.log = inputLog;
                }
            }

        // Propiedades.

            public List<MessageModel> Log { get { return log; } set { log = value; } }
    }
}
