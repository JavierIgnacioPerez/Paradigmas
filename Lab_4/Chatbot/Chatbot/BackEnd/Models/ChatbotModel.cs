using System;
using System.Collections.Generic;

namespace Chatbot.BackEnd.Models
{
    public class ChatbotModel
    {
        // Atributos

            // Integer que determinara la personalidad del Chatbot.
            private int personality;

            // String que contiene el saludo del Chatbot
            List<String> salute;

            // String que contiene la frase para preguntar el nombre al usuario.
            String name;

            // String que contiene la frase para ofrecer ayuda al usuario.
            String help;

            // String que contiene la frase de venta de los autos.
            String sellCar;

            // String que contiene la frase de venta de las marcas de auto.
            String sellModel;

            // String que contiene la frase de despedida del Chatbot.
            String bye;

            // String que contiene la frase que informa al usuario que el Chatbot no entendio el mensaje.
            String notUnderstand;

            // List que contiene las marcas de auto que vende el ChatBot.
            List<String> brandList;

            // List de Lists que contiene los modelos de auto que vende  el ChatBot.
            List<List<String>> modelList;
            
            // List de enteros que contiene las distintas valorizaciones que tiene el Chatbot actual.
            List<int> rates;

        // Metodos
            
            // Metodo constructor de la clase ChatBot.
            // Entrada : Un numero entero que determina la personalidad del Chatbot.
            // Salida : Objeto ChatbotModel
            public ChatbotModel(int num)
            {
                Personality = num;
                brandList = new List<string>();
                modelList = new List<List<string>>();
                salute = new List<String>();
                rates = new List<int>();

                if (Personality == 0) {

                    Salute.Add("Buenos Dias");
                    Salute.Add("Buenas Tardes");
                    Salute.Add("Buenas Noches");
                    Name = "Bienvenido al sistema de venta de autos, Cual es su nombre?";
                    Help = "En que le puedo ayudar?";
                    SellCar = "En este momento puedo vender estos autos: ";
                    SellModel = "Los modelos que tengo disponible son: ";
                    Bye = "Ha sido un gusto ayudarlo, espero que vuelva en otra ocasion.";
                    NotUnderstand = "Disculpe, Lo puede decir de otra manera?";
                    BrandList.Add("Ford");
                    BrandList.Add("Toyota");
                    BrandList.Add("Peugeot");
                    List<String> aux1 = new List<String>();
                    aux1.Add("Fiesta");
                    aux1.Add("Mustang");
                    aux1.Add("FordRaptor");
                    List<String> aux2 = new List<String>();
                    aux2.Add("Yaris");
                    aux2.Add("Auris");
                    aux2.Add("Corolla");
                    List<String> aux3 = new List<String>();
                    aux3.Add("301");
                    aux3.Add("2008");
                    aux3.Add("206");
                    ModelList.Add(aux1);
                    ModelList.Add(aux2);
                    ModelList.Add(aux3);
                }

                if (Personality == 1){

                    Salute.Add("Bueno Dia");
                    Salute.Add("Buenas Tardes");
                    Salute.Add("Buenas Noches");
                    Name = "Bienvenido a la automotora, Dime tu nombre";
                    Help = "En que te ayudo?";
                    SellCar = "Estas marcas de autos tengo a la venta: ";
                    SellModel = "Estos modelos tengo a la venta:: ";
                    Bye = "Espero vuelvas.";
                    NotUnderstand = "Lo puedes repetir?";
                    BrandList.Add("Ford");
                    BrandList.Add("Toyota");
                    BrandList.Add("Peugeot");
                    List<String> aux1 = new List<String>();
                    aux1.Add("Fiesta");
                    aux1.Add("Mustang");
                    aux1.Add("FordRaptor");
                    List<String> aux2 = new List<String>();
                    aux2.Add("Yaris");
                    aux2.Add("Auris");
                    aux2.Add("Corolla");
                    List<String> aux3 = new List<String>();
                    aux3.Add("301");
                    aux3.Add("2008");
                    aux3.Add("206");
                    ModelList.Add(aux1);
                    ModelList.Add(aux2);
                    ModelList.Add(aux3);
                }
            }

        //Propiedades

            public int Personality { get { return personality; } set { personality = value; } }
            public List<String> Salute { get { return salute; } set { salute = value; } }
            public String Name { get { return name; } set { name = value; } }
            public String Help { get { return help; } set { help = value; } }
            public String SellCar { get { return sellCar; } set { sellCar = value; } }
            public String SellModel { get { return sellModel; } set { sellModel = value; } }
            public String Bye { get { return bye; } set { bye = value; } }
            public String NotUnderstand { get { return notUnderstand; } set { notUnderstand = value; } }
            public List<String> BrandList { get { return brandList; } set { brandList = value; } }
            public List<List<String>> ModelList { get { return modelList; } set { modelList = value; } }
            public List<int> Rates { get { return rates; } set { rates = value; } }
    }
}
