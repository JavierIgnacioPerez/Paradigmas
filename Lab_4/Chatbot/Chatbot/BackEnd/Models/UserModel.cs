using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chatbot.BackEnd.Models
{
    public class UserModel
    {
        // Atributos.

            // String que contendra el nombre del usuario.
            String name;
            // String que contiene la preferencia de marca del usuario.
            String brandPreference;
            // String que contiene la preferencia de modelo del usuario.
            String modelPreference;
            // Integer que contrendra la valorizacion del usuario.
            int userRate;

        // Metodos.

            // Metodo que construye el objeto User.
            // Entrada : String con el nombre del Usuario, String con la marca preferida y String con el modelo preferido.
            // Salida : Objeto User.
            public UserModel(String str)
            {
                Name = str;
            }

        // Propiedades.

            public String Name { get { return name; } set { name = value; } }
            public String BrandPreference { get { return brandPreference; } set { brandPreference = value; } }
            public String ModelPreference { get { return modelPreference; } set { modelPreference = value; } }
            public int UserRate { get { return userRate; } set { userRate = value; } }


    }
}
