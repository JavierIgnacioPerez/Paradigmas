using Chatbot.BackEnd.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chatbot.BackEnd.Controllers
{
    public class ChatbotController
    {
        // Atributos.

            // Atributo que es un objeto de la clase Chatbot.
            ChatbotModel chatbot;

            // Atributo que es un objeto de la clase Log.
            LogModel inputLog;

            // Atributo que es un objeto de la clase User.
            UserModel user;

            // Atributo que es un objeto de la clase Message.
            MessageModel message;

            // Atributo que es un objeto de la clase ComparationController.
            ComparationController cmp;
            
            // Atributo auxiliar con la lista de rates.
            List<int> rates;

        // Metodos.

            // Metodo constructor de la clase ChatbotController
            // Entrada : Log.
            // Salida : Vacía.
            public ChatbotController()
                {
                    inputLog = new LogModel(null);
                    user = new UserModel("None");
                    cmp = new ComparationController();
                    rates = new List<int>();
                }

            // Metodo que retornara la fecha y la hora actual.
	        // Entrada : Vacio.
	        // Salida : String que contiene la fecha y la hora.
            public String GetActualDateTime()
            {
                DateTime date = DateTime.Now;
                int year = date.Year;
                int month = date.Month;
                int day = date.Day;
                int hour = date.Hour;
                int minute = date.Minute;
                int second = date.Second;
                
                String actualDate = day + "/" + month + "/" + year;
                String actualTime = hour + ":" + minute + ":" + second;
                String actualDateTime = actualDate + "-" + actualTime;

                return actualDateTime;
            }

            // Metodo que retornara y la hora actual.
            // Entrada : Vacio.
            // Salida : String que contiene la hora.
            public String GetActualTime()
            {
                DateTime date = DateTime.Now;
                int hour = date.Hour;
                int minute = date.Minute;
                int second = date.Second;

                String actualTime = hour + ":" + minute + ":" + second;

                return actualTime;
            }

            // Metodo que realiza el get al saludo del Chatbot. Dependiendo de la hora del dia, sera el saludo que efectue el Chatbot.
            // Entrada : Vacia.
            // Salida : String con el mensaje del Chatbot.
            public String ChatbotGetSalute()
                {
                    DateTime date = DateTime.Now;

                    if (date.Hour >= 6 && date.Hour < 12)
                    {
                        return chatbot.Salute[0];
                    }
                    if (date.Hour >= 12 && date.Hour < 19)
                    {
                        return chatbot.Salute[1];
                    }
                    return chatbot.Salute[2];
                }

            // Metodo que realiza el get a lps modelos de auto que el Chatbot puede vender, y dado un numero, obtener un mensaje al azar.
            // Entrada : String brand para especificar de que marca de solicitan los modelos
            // Salida : String con el mensaje del Chatbot.
            public List<String> ChatbotGetModels(String brand)
            {
                if (brand.Equals("Ford"))
                {
                    return chatbot.ModelList[0];
                }
                if (brand.Equals("Toyota"))
                {
                    return chatbot.ModelList[1];
                }
                if (brand.Equals("Peugeot"))
                {
                    return chatbot.ModelList[2];
                }
                return null;
            }

            // Metodo que cuenta cuantas veces se ha inciado una conversación.
            // Entrada : Vacia.
            // Salida : Integer con las veces que se encontro el identificador "BeginDialog"
            public int LogCountBegin()
            {
                int num = 0;
                foreach (MessageModel msg in inputLog.Log)
                {
                if (msg.Ident.Equals("BeginDialog"))
                    {
                        num += 1;
                    }
                }
                return num;
            }

            // Metodo que cuenta cuantas veces se ha inciado una conversación.
            // Entrada : Vacia.
            // Salida : Integer con las veces que se encontro el identificador "EndDialog"
            public int LogCountEnd()
            {
                int num = 0;
                foreach (MessageModel msg in inputLog.Log)
                {
                    if (msg.Ident.Equals("EndDialog"))
                    {
                        num += 1;
                    }
                }
                return num;
            }

            // Metodo que dado un string, retorna el string con la primera letra en mayuscula.
            // Entrada : String con la palabra
            // Salida : String con la palabra modificada
            public string FirstLetterToUpper(string str)
            {
                if (str == null)
                    return null;

                if (str.Length > 1)
                    return char.ToUpper(str[0]) + str.Substring(1);

                return str.ToUpper();
            }

            // Metodo que cuando se carga un Log, hace un String que contiene la informacion del Log cargado
            // Entrada : Vacia
            // Salida : Un String con todas las interacciones.
            public string ReloadChat()
            {
                string chat = "";
                for(int i = 0; i < inputLog.Log.Count; i++)
                {
                    String[] time = inputLog.Log[i].DateTime.Split('-');
                    chat += time[1] + "-";
                    chat += inputLog.Log[i].IdentChatbot + ": ";
                    chat += inputLog.Log[i].ChatbotMsg + "\r\n";
                    if (!(inputLog.Log[i].UserMsg.Equals("...")))
                    {
                        chat += time[1] + "-";
                        chat += inputLog.Log[i].IdentUser + ": ";
                        chat += inputLog.Log[i].UserMsg + "\r\n";
                    }
                }
                return chat;
            }

            // Metodo que devuelve un string con los distintos rates que se le ha asignado al Chatbot.
            // Entrada: Vacia.
            // Salida : Un string con el/los rate/s
            public string RatesToString() {
                try {
                    String[] a = Rates[0].ToString().Split('-');
                    string rates = "El/Los rate/s es/son : ";
                    for(int i = 0; i < Rates.Count; i++)
                    {
                        rates += Rates[i].ToString() + ", "; 
                    }
                    rates = rates.Substring(0, rates.Length-2);
                    return rates + ".";
                }
                catch(ArgumentOutOfRangeException e)
                {
                    Console.WriteLine(e);
                    return "AVISO : Debe asignar un rate";
                }
            }

        // Metodos de acciones.

            // Metodo que da la bienvenida la usuario una vez inicia el programa.
            // Entrada : Vacía.
            // Salida : Vacía.
            public String Welcome()
                {
                    String actualWelcome;

                    actualWelcome = "Bienvenidos al ChatBot de la automotora 'Perez'.\r\n";
                    actualWelcome += "La funcion de este ChatBot es ayudar al usuario al momento de realizar una compra en nuestra automotora.\r\n";
                    actualWelcome += "En esta automotora se trabaja con las marcas : Ford, Toyota y Peugeot\r\n";
                    actualWelcome += "Los modelos disponibles de la marca Ford son : Fiesta, Mustang y Raptor\r\n";
                    actualWelcome += "Los modelos disponibles de la marca Toyota son : Yaris, Auris y Corolla\r\n";
                    actualWelcome += "Los modelos disponibles de la marca Peugeot son : 301, 2008 y 206\r\n";
                    actualWelcome += "Recuerde que para hablar con el ChatBot Formal, debe ingresar un 0.\r\n";
                    actualWelcome += "Recuerde que para hablar con el ChatBot Coloquial, debe ingresar un 1.\r\n";
                    actualWelcome += "-------------------------------------------------------------------------------------------------------------\r\n";
                    actualWelcome += "\r\n";

                    return actualWelcome;
                }

            // Metodo que inicia el dialogo con el ChatBot.
            // Entrada : Integer seed que determina la personalidad del Chatbot
            // Salida : String con respuesta al mensaje de entrada.
            public String BeginDialog(String seed)
            {
                try
                {
                    int intSeed = Int32.Parse(seed);

                    if (intSeed == 0 || intSeed == 1)
                    {
                        if (LogCountBegin() - LogCountEnd() == 0)
                        {
                            chatbot = new ChatbotModel(intSeed);
                            message = new MessageModel("BeginDialog",GetActualDateTime(),"...", ChatbotGetSalute() + ". " + chatbot.Name);
                            inputLog.Log.Add(message);
                            return GetActualTime() + "-" + "Chatbot: " + ChatbotGetSalute() + ". " + chatbot.Name + "\r\n";
                        }
                        else
                        {
                            chatbot = new ChatbotModel(intSeed);
                            message = new MessageModel("BeginDialogTry",GetActualDateTime(), "...", "Debe finalizar la conversación");
                            inputLog.Log.Add(message);
                            return "AVISO : Debe finalizar la conversacion.\r\n";
                        }

                    }
                    chatbot = new ChatbotModel(intSeed);
                    message = new MessageModel("BeginDialogTry",GetActualDateTime(), "...", "Seed fuera del alcanze de los chatbot.");
                    inputLog.Log.Add(message);
                    return "AVISO : Seed fuera del alcanze de los chatbot.\r\n";
                }
                catch (ArgumentException e)
                {
                    Console.WriteLine(e);
                    return "AVISO : Parametro ingresado incorrecto.\r\n";
                }
            }

            // Metodo que finaliza el dialogo con el ChatBot.
            // Entrada : Vacia.
            // Salida : String con respuesta al mensaje de entrada.
            public String EndDialog()
            {
                if (LogCountBegin() > LogCountEnd())
                {
                    if (user.Name.Equals("None"))
                    {
                        message = new MessageModel("EndDialog",GetActualDateTime(),"...",chatbot.Bye);
                    }
                    else
                    {
                        message = new MessageModel("EndDialog",GetActualDateTime(), "...", user.Name + ". " + chatbot.Bye);
                    }
                    inputLog.Log.Add(message);
                    return GetActualTime() + "-" + "Chatbot: " + chatbot.Bye + "\r\n";
                }

                message = new MessageModel("EndDialogTry",GetActualDateTime(),"...", "Debe iniciar una conversacion con BeginDialog.");
                inputLog.Log.Add(message);
                return "AVISO : Debe iniciar una conversacion con BeginDialog y un seed (0 o 1).\r\n";
            }

            // Metodo que recibe un mensaje, realiza una comparacion con palabras claves y retorna un mensaje pertintente desde el Chatbot.
            // Entrada : String con mensaje.
            // Salida : String con respuesta al mensaje de entrada.
            public String SendMessage(String msg)
            {
                if (LogCountBegin() > LogCountEnd())
                {
                    if (cmp.CmpName(msg) == true)
                    {
                        String[] aux = msg.Split(' ');
                        user.Name = aux[3];
                        message = new MessageModel("SendMessage", GetActualDateTime(), msg, user.Name + ", " + chatbot.Help);
                        inputLog.Log.Add(this.message);
                        return GetActualTime() + "-" + "Usuario : " + msg + "\r\n" + GetActualTime() + "-" + "Chatbot : " + user.Name + ", " + chatbot.Help + "\r\n";
                    }
                    if(user.Name != "None")
                    {
                        if (cmp.CmpBuy(msg) == true)
                        {
                            message = new MessageModel("SendMessage", GetActualDateTime(), msg, user.Name + ", " + chatbot.SellCar + cmp.ToFormat(chatbot.BrandList));
                            inputLog.Log.Add(this.message);
                            return GetActualTime() + "-" + "Usuario : " + msg + "\r\n" + GetActualTime() + "-" + "Chatbot : " + user.Name + ", " + chatbot.SellCar + cmp.ToFormat(chatbot.BrandList) + "\r\n";
                        }
                        else if (cmp.CmpFord(msg) == true)
                        {
                            user.BrandPreference = "Ford";
                            message = new MessageModel("SendMessage", GetActualDateTime(), msg, user.Name + ", " + chatbot.SellModel + cmp.ToFormat(ChatbotGetModels("Ford")));
                            inputLog.Log.Add(this.message);
                            return GetActualTime() + "-" + "Usuario : " + msg + "\r\n" + GetActualTime() + "-" + "Chatbot : " + chatbot.SellModel + cmp.ToFormat(ChatbotGetModels("Ford")) + "\r\n";
                        }
                        else if (cmp.CmpToyota(msg) == true)
                        {
                            user.BrandPreference = "Toyota";
                            message = new MessageModel("SendMessage", GetActualDateTime(), msg, user.Name + ", " + chatbot.SellModel + cmp.ToFormat(ChatbotGetModels("Toyota")));
                            inputLog.Log.Add(this.message);
                            return GetActualTime() + "-" + "Usuario : " + msg + "\r\n" + GetActualTime() + "-" + "Chatbot : " + user.Name + ", " + chatbot.SellModel + cmp.ToFormat(ChatbotGetModels("Toyota")) + "\r\n";
                        }
                        else if (cmp.CmpPeugeot(msg) == true)
                        {
                            user.BrandPreference = "Peugeot";
                            message = new MessageModel("SendMessage", GetActualDateTime(), msg, user.Name + ", " + chatbot.SellModel + cmp.ToFormat(ChatbotGetModels("Peugeot")));
                            inputLog.Log.Add(this.message);
                            return GetActualTime() + "-" + "Usuario : " + msg + "\r\n" + GetActualTime() + "-" + "Chatbot : " + user.Name + ", " + chatbot.SellModel + cmp.ToFormat(ChatbotGetModels("Peugeot")) + "\r\n";
                        }
                        else if (cmp.CmpBuyModel(msg, ChatbotGetModels("Ford").ConvertAll(d => d.ToLower())))
                        {
                        Console.WriteLine("a");
                        try
                            {
                                if (user.BrandPreference.Equals("Ford") && ChatbotGetModels("Ford").ConvertAll(d => d.ToLower()).Contains(cmp.InListModel(msg)))
                                {
                                    user.ModelPreference = FirstLetterToUpper(cmp.InListModel(msg));
                                    message = new MessageModel("SendMessage", GetActualDateTime(), msg, user.Name + ", " + "Su seleccion es : Marca -> " + user.BrandPreference + " y Modelo -> " + user.ModelPreference);
                                    inputLog.Log.Add(this.message);
                                    return GetActualTime() + "-" + "Usuario : " + msg + "\r\n" + GetActualTime() + "-" + "Chatbot : " + user.Name + ", " + "Su seleccion es : Marca -> " + user.BrandPreference + " y Modelo -> " + user.ModelPreference + "\r\n";
                                }
                                else
                                {
                                    message = new MessageModel("SendMessage", GetActualDateTime(), msg, user.Name + ", " + "No puede elegir un modelo de la Marca Ford, su elección de marca fue " + user.BrandPreference);
                                    inputLog.Log.Add(this.message);
                                    return GetActualTime() + "-" + "Usuario : " + msg + "\r\n" + GetActualTime() + "-" + "Chatbot : " + user.Name + ", " + "No puede elegir un modelo de la Marca Ford, su elección de marca fue " + user.BrandPreference + "\r\n";
                                }
                            }
                            catch (NullReferenceException e)
                            {
                                Console.WriteLine(e);
                                return "AVISO : Ha ocurrido un error\r\n";
                            }
                        }
                        else if (cmp.CmpBuyModel(msg, ChatbotGetModels("Toyota").ConvertAll(d => d.ToLower())))
                        {
                            try
                            {
                                if (user.BrandPreference.Equals("Toyota") && ChatbotGetModels("Toyota").ConvertAll(d => d.ToLower()).Contains(cmp.InListModel(msg)))
                                {
                                    user.ModelPreference = FirstLetterToUpper(cmp.InListModel(msg));
                                    message = new MessageModel("SendMessage", GetActualDateTime(), msg, user.Name + ", " + "Su seleccion es : Marca -> " + user.BrandPreference + " y Modelo -> " + user.ModelPreference);
                                    inputLog.Log.Add(this.message);
                                    return GetActualTime() + "-" + "Usuario : " + msg + "\r\n" + GetActualTime() + "-" + "Chatbot : " + user.Name + ", " + "Su seleccion es : Marca -> " + user.BrandPreference + " y Modelo -> " + user.ModelPreference + "\r\n";
                                }
                                else
                                {
                                    message = new MessageModel("SendMessage", GetActualDateTime(), msg, user.Name + ", " + "No puede elegir un modelo de la Marca Ford, su elección de marca fue " + user.BrandPreference);
                                    inputLog.Log.Add(this.message);
                                    return GetActualTime() + "-" + "Usuario : " + msg + "\r\n" + GetActualTime() + "-" + "Chatbot : " + user.Name + ", " + "No puede elegir un modelo de la Marca Toyota, su elección de marca fue " + user.BrandPreference + "\r\n";
                                }
                            }
                            catch (NullReferenceException e)
                            {
                                Console.WriteLine(e);
                                return "AVISO : Ha ocurrido un error\r\n";
                            }
                        }
                        else if (cmp.CmpBuyModel(msg, ChatbotGetModels("Peugeot").ConvertAll(d => d.ToLower())))
                        {
                            try
                            {
                                if (user.BrandPreference.Equals("Peugeot") && ChatbotGetModels("Peugeot").ConvertAll(d => d.ToLower()).Contains(cmp.InListModel(msg)))
                                {
                                    user.ModelPreference = FirstLetterToUpper(cmp.InListModel(msg));
                                    message = new MessageModel("SendMessage", GetActualDateTime(), msg, user.Name + ", " + "Su seleccion es : Marca -> " + user.BrandPreference + " y Modelo -> " + user.ModelPreference);
                                    inputLog.Log.Add(this.message);
                                    return GetActualTime() + "-" + "Usuario : " + msg + "\r\n" + GetActualTime() + "-" + "Chatbot : " + user.Name + ", " + "Su seleccion es : Marca -> " + user.BrandPreference + " y Modelo -> " + user.ModelPreference + "\r\n";
                                }
                                else
                                {
                                    message = new MessageModel("SendMessage", GetActualDateTime(), msg, user.Name + ", " + "No puede elegir un modelo de la Marca Ford, su elección de marca fue " + user.BrandPreference);
                                    inputLog.Log.Add(this.message);
                                    return GetActualTime() + "-" + "Usuario : " + msg + "\r\n" + GetActualTime() + "-" + "Chatbot : " + user.Name + ", " + "No puede elegir un modelo de la Marca Peugeot, su elección de marca fue " + user.BrandPreference + "\r\n";
                                }
                            }
                            catch (NullReferenceException e)
                            {
                                Console.WriteLine(e);
                                return "AVISO : Ha ocurrido un error\r\n";
                            }
                        }
                        else if (cmp.LastBuy(msg))
                        {
                            message = new MessageModel("SendMessage", GetActualDateTime(), msg, user.Name + ", Su compra se ha realizado exitosamente");
                            inputLog.Log.Add(this.message);
                            return GetActualTime() + "-" + "Usuario : " + msg + "\r\n" + GetActualTime() + "-" + "Chatbot : " + user.Name + ", Su compra se ha realizado exitosamente" + "\r\n";
                        }
                        else
                        {
                            message = new MessageModel("SendMessage", GetActualDateTime(), msg, chatbot.NotUnderstand);
                            inputLog.Log.Add(this.message);
                            return GetActualTime() + "-" + "Usuario : " + msg + "\r\n" + GetActualTime() + "-" + "Chatbot : " + chatbot.NotUnderstand + "\r\n";
                        }
                    }
                    else
                    {
                        return "AVISO : Primero debe ingresar su nombre.\r\n";
                    }
                }
                message = new MessageModel("SendMessage", GetActualDateTime(), msg, "Inicie una Conversacion, por favor");
                inputLog.Log.Add(this.message);
                return "AVISO : Inicie una Conversacion, por favor \r\n";
            }

            // Metodo que dado un Log, permite guardarlo en un archivo de texto.
            // Entrada : Vacia.
            // Salida : String con verificacion.
            public String SaveLog(String path)
            {
                if (LogCountBegin() == LogCountEnd() && LogCountBegin() != 0 && LogCountEnd() != 0)
                {
                    try
                    {
                        using (StreamWriter sw = new StreamWriter(path))
                        {
                            sw.WriteLine("Esto es un Log"+ "\n" + "---");
                            for (int i = 0; i < inputLog.Log.Count; i++)
                            {
                                sw.WriteLine(inputLog.Log[i].Ident + "\n" + inputLog.Log[i].DateTime + "\n" + inputLog.Log[i].IdentUser + "\n" + inputLog.Log[i].UserMsg + "\n" + inputLog.Log[i].IdentChatbot + "\n" + inputLog.Log[i].ChatbotMsg + "\n" + "---");
                            }
                        }
 
                        return ("AVISO : El Log se ha guardado correctamente.");
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e);
                        return ("AVISO : Error con la escritura del archivo.");
                    }
                }
                else
                {
                    return "AVISO : Termine la conversacion antes de guardar el Log.";
                }
            }

            // Metodo que dado un String(Nombre del Archivo), permite cargar su contenido y guardarlo como un Log.
            // Entrada : String con el nombre del archivo.
            // Salida : String con verifiacion.
            public String LoadLog(String path)
            {
                if (LogCountBegin() == LogCountEnd())
                {
                    String words = "";
                    try
                    {
                        StreamReader objReader = new StreamReader(path);
                        if (objReader.ReadLine() == "Esto es un Log")
                        {
                            while (words != null)
                            {
                                words = objReader.ReadLine();
                                if (words == null) break;
                                if (words.Equals("---"))
                                {
                                    MessageModel msg = new MessageModel("0", "0", "0", "0");
                                    msg.Ident = objReader.ReadLine();
                                    msg.DateTime = objReader.ReadLine();
                                    objReader.ReadLine();
                                    msg.UserMsg = objReader.ReadLine();
                                    objReader.ReadLine();
                                    msg.ChatbotMsg= objReader.ReadLine();
                                    inputLog.Log.Add(msg);  
                                }
                        }
                        inputLog.Log.RemoveAt(inputLog.Log.Count - 1);
                        return "AVISO : Log cargado correctamente";
                        }
                        else
                        {
                            return "AVISO : El .txt cargado no es un Log.";
                        }
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e);
                        return "AVISO : Error con la carga del archivo.";
                    }
                }
                else
                {
                    return "AVISO : Termine la conversacion antes de cargar un Log.";
                }
        }

            // Metodo que dado un numero entero (entre 0 y 5), permite agregar una valorizacion al Chatbot
            // Entrada : String con la valorizacion
            // Salida : String con verificación.
            public String Rate(String num)
            {
                try
                {
                    if (LogCountBegin() == LogCountEnd() && LogCountBegin() != 0 && LogCountEnd() != 0)
                    {
                        int actualNum;
                        try
                        {
                            actualNum = Int32.Parse(num);
                            try
                            {
                                if (actualNum >= 0 && actualNum <= 5)
                                {
                                    chatbot.Rates.Add(actualNum);
                                    Rates.Add(actualNum);
                                    return "AVISO : El rate se ha añadido satisfactoriamente.";
                                }
                                return "AVISO : Rate fuera del rango establecido.";
                            }
                            catch (ArgumentNullException e)
                            {
                                Console.WriteLine(e);
                                return "AVISO : Debe iniciar una conversacion";
                            }
                        }
                        catch (FormatException e)
                        {   
                            Console.WriteLine(e);
                            return "AVISO : Porfavor, ingrese un número valido.";
                        }
                    }
                    else
                    {
                        return "AVISO : Porfavor debe iniciar y cerrar una conversacion";
                    }
                }
                catch(IndexOutOfRangeException e)
                {
                Console.WriteLine(e);
                return "AVISO : Debe volver a iniciar y cerrar una conversacion";
                }
            }

            // SobreCarga del metodo Rate(String num)
            // Metodo que dado dos numers enters (entre 0 y 5), permite agregar una valorizacion al Chatbot
            // Entrada : String con la valorizacion
            // Salida : String con verificación.
            public String Rate(String num,String num2)
            {
                try
                {
                    if (LogCountBegin() == LogCountEnd() && LogCountBegin() != 0 && LogCountEnd() != 0)
                    {
                        int actualNum;
                        int actualNum2;
                        try
                        {
                            actualNum = Int32.Parse(num);
                            actualNum2 = Int32.Parse(num2);
                            try
                            {
                                if (actualNum >= 0 && actualNum <= 5)
                                {
                                    chatbot.Rates.Add((actualNum + actualNum2) / 2);
                                    Rates.Add((actualNum + actualNum2) / 2);
                                    return "AVISO : El rate se ha añadido satisfactoriamente.";
                                }
                                return "AVISO : Rate fuera del rango establecido.";
                            }
                            catch (ArgumentNullException e)
                            {
                                Console.WriteLine(e);
                                return "AVISO : Debe iniciar una conversacion";
                            }
                        }
                        catch (FormatException e)
                        {
                            Console.WriteLine(e);
                            return "AVISO : Porfavor, ingrese un número valido.";
                        }
                    }
                    else
                    {
                        return "AVISO : Porfavor debe iniciar y cerrar una conversacion";
                    }
                }
                catch (IndexOutOfRangeException e)
                {
                    Console.WriteLine(e);
                    return "AVISO : Debe volver a iniciar y cerrar una conversacion";
                }
            }

        // Propiedades

            public List<int> Rates { get { return rates; } set { rates = value;} }
    }
}
