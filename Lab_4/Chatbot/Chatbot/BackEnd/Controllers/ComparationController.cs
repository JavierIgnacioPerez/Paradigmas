using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chatbot.BackEnd.Controllers
{
    public class ComparationController
    {
        // Metodos

            // Metodo que dado un ArrayList, lo escribe como "Elemnto0, Elemento1, Elemento2."
            // Entrada : ArrayList de String.
            // Salida : String con el formato dado.
            public String ToFormat(List<String> list)
            {
                return list[0] + ", " + list[1] + ", " + list[2] + ".";
            }

            // Metodo que dado un mensaje, verifica que modelo esta en la frase y devuelve el model identificado.
            // Entrada : String mensaje.
            // Salida : String con el modelo verificado.
            public String InListModel(String msg)
            {
                String[] list = msg.Split(' ');
                List<String> newList = list.ToList<String>();
                List<String> lowerList = newList.ConvertAll(d => d.ToLower());

                if (lowerList.Contains("fiesta"))
                {
                    return "fiesta";
                }
                else if (lowerList.Contains("mustang"))
                {
                    return "mustang";
                }
                else if (lowerList.Contains("fordraptor"))
                {
                    return "fordraptor";
                }
                else if (lowerList.Contains("yaris"))
                {
                    return "yaris";
                }
                else if (lowerList.Contains("auris"))
                {
                    return "auris";
                }
                else if (lowerList.Contains("corolla"))
                {
                    return "corolla";
                }
                else if (lowerList.Contains("301"))
                {
                    return "301";
                }
                else if (lowerList.Contains("2008"))
                {
                    return "2008";
                }
                else
                {
                    return "206";
                }
            }

            // Metodo que dado dos ArrayList, verifica si alguna palabra del segundo ArrayList, existe en el primero.
            // Entrada : ArrayList de String y ArrayList de Strings.
            // Salida : True o False, dependiendo si se respeta el formato.
            public bool InList(List<String> list1, List<String> list2)
            {
                int i = 0;
                while (i < list2.Count())
                {
                    if (list1.Contains(list2[i]))
                    {
                        return true;
                    }
                    i++;
                }
                return false;
            }

            // Metodo que realiza la comparacion del mensaje del usuario y verifica si cumple el formato dado.
            // Entrada : String con el mensaje del usuario.
            // Salida : True si respeta el formato dado.
            public bool CmpName(String msg)
            {
                String[] list = msg.Split(' ');
                List<String> msgList = list.ToList<String>();
                List<String> lowerList = msgList.ConvertAll(d => d.ToLower());

                if (lowerList.Contains("mi") && lowerList.Contains("nombre") && lowerList.Contains("es"))
                {
                    return true;
                }
                return false;
            }

            // Metodo que realiza la comparacion del mensaje del usuario y verifica si cumple el formato dado.
            // Entrada : String con el mensaje del usuario.
            // Salida : True si respeta el formato dado.
            public bool CmpBuy(String msg)
            {
                String[] list = msg.Split(' ');
                List<String> msgList = list.ToList<String>();
                List<String> lowerList = msgList.ConvertAll(d => d.ToLower());

                List<String> aux0 = new List<String>();
                aux0.Add("quiero");
                aux0.Add("deseo");

                List<String> aux1 = new List<String>();
                aux1.Add("comprar");
                aux1.Add("adquirir");

                List<String> aux2 = new List<String>();
                aux2.Add("fiesta");
                aux2.Add("mustang");
                aux2.Add("fordRaptor");

                List<String> aux3 = new List<String>();
                aux3.Add("yaris");
                aux3.Add("corolla");
                aux3.Add("auris");

                List<String> aux4 = new List<String>();
                aux4.Add("301");
                aux4.Add("2008");
                aux4.Add("206");

            if ((InList(aux0, lowerList) && InList(aux1, lowerList) && lowerList.Contains("auto")) && !(lowerList.Contains("ford")) && !(lowerList.Contains("toyota")) && !(lowerList.Contains("peugeot")) && !(InList(aux2, lowerList)) && !(InList(aux3, lowerList)) && !(InList(aux4, lowerList)) ||
                    InList(aux0, lowerList) && InList(aux1, lowerList) && lowerList.Contains("auto") && !(lowerList.Contains("ford")) && !(lowerList.Contains("toyota")) && !(lowerList.Contains("peugeot")) && !(InList(aux2, lowerList)) && !(InList(aux3, lowerList)) && !(InList(aux4, lowerList)) ||
                    InList(aux1, lowerList) && lowerList.Contains("auto") && !(lowerList.Contains("ford")) && !(lowerList.Contains("toyota")) && !(lowerList.Contains("peugeot")) && !(InList(aux2, lowerList)) && !(InList(aux3, lowerList)) && !(InList(aux4, lowerList)) ||
                    InList(aux1, lowerList) && lowerList.Contains("auto") && !(lowerList.Contains("ford")) && !(lowerList.Contains("toyota")) && !(lowerList.Contains("peugeot")) && !(InList(aux2, lowerList)) && !(InList(aux3, lowerList)) && !(InList(aux4, lowerList)) ||
                    InList(aux0, lowerList) && lowerList.Contains("auto") && !(lowerList.Contains("ford")) && !(lowerList.Contains("toyota")) && !(lowerList.Contains("peugeot")) && !(InList(aux2, lowerList)) && !(InList(aux3, lowerList)) && !(InList(aux4, lowerList)) ||
                    InList(aux0, lowerList) && InList(aux1, lowerList) && !(lowerList.Contains("ford")) && !(lowerList.Contains("toyota")) && !(lowerList.Contains("peugeot")) && !(InList(aux2, lowerList)) && !(InList(aux3, lowerList)) && !(InList(aux4, lowerList)))
                {
                    return true;
                }
                return false;
            }

            // Metodo que realiza la comparacion del mensaje del usuario y verifica si cumple el formato dado.
            // Entrada : String con el mensaje del usuario.
            // Salida : True si respeta el formato dado.
            public bool CmpFord(String msg) {
                String[] list = msg.Split(' ');
                List<String> msgList = list.ToList<String>();
                List<String> lowerList = msgList.ConvertAll(d => d.ToLower());

                List<String> aux0 = new List<String>();
                aux0.Add("quiero");
                aux0.Add("deseo");

                List<String> aux1 = new List<String>();
                aux1.Add("comprar");
                aux1.Add("adquirir");

                List<String> aux2 = new List<String>();
                aux2.Add("fiesta");
                aux2.Add("mstang");
                aux2.Add("fordRaptor");

                List<String> aux3 = new List<String>();
                aux3.Add("yaris");
                aux3.Add("corolla");
                aux3.Add("auris");

                List<String> aux4 = new List<String>();
                aux4.Add("301");
                aux4.Add("2008");
                aux4.Add("206");

            if (InList(aux0, lowerList) && InList(aux1, lowerList) && lowerList.Contains("auto") && lowerList.Contains("ford") && !(InList(aux2, lowerList)) && !(InList(aux3, lowerList)) && !(InList(aux4, lowerList)) ||
                    InList(aux0, lowerList) && InList(aux1, lowerList) && lowerList.Contains("ford") && !(InList(aux2, lowerList)) && !(InList(aux3, lowerList)) && !(InList(aux4, lowerList)) ||
                    InList(aux1, lowerList) && lowerList.Contains("ford") && !(InList(aux2, lowerList)) && !(InList(aux3, lowerList)) && !(InList(aux4, lowerList)) ||
                    InList(aux0, lowerList) && lowerList.Contains("ford") && !(InList(aux2, lowerList)) && !(InList(aux3, lowerList)) && !(InList(aux4, lowerList)))
                {
                    return true;
                }
                return false;
            }

            // Metodo que realiza la comparacion del mensaje del usuario y verifica si cumple el formato dado.
            // Entrada : String con el mensaje del usuario.
            // Salida : True si respeta el formato dado.
            public bool CmpToyota(String msg)
            {
                String[] list = msg.Split(' ');
                List<String> msgList = list.ToList<String>();
                List<String> lowerList = msgList.ConvertAll(d => d.ToLower());

                List<String> aux0 = new List<String>();
                aux0.Add("quiero");
                aux0.Add("deseo");

                List<String> aux1 = new List<String>();
                aux1.Add("comprar");
                aux1.Add("adquirir");

                List<String> aux2 = new List<String>();
                aux2.Add("fiesta");
                aux2.Add("mustang");
                aux2.Add("fordRaptor");

                List<String> aux3 = new List<String>();
                aux3.Add("yaris");
                aux3.Add("corolla");
                aux3.Add("auris");

                List<String> aux4 = new List<String>();
                aux4.Add("301");
                aux4.Add("2008");
                aux4.Add("206");

            if (InList(aux0, lowerList) && InList(aux1, lowerList) && lowerList.Contains("auto") && lowerList.Contains("toyota") && !(InList(aux2, lowerList)) && !(InList(aux3, lowerList)) && !(InList(aux4, lowerList)) ||
                    InList(aux0, lowerList) && InList(aux1, lowerList) && lowerList.Contains("toyota") && !(InList(aux2, lowerList)) && !(InList(aux3, lowerList)) && !(InList(aux4, lowerList)) ||
                    InList(aux1, lowerList) && lowerList.Contains("toyota") && !(InList(aux2, lowerList)) && !(InList(aux3, lowerList)) && !(InList(aux4, lowerList)) ||
                    InList(aux0, lowerList) && lowerList.Contains("toyota") && !(InList(aux2, lowerList)) && !(InList(aux3, lowerList)) && !(InList(aux4, lowerList)))
                {
                    return true;
                }
                return false;
            }

            // Metodo que realiza la comparacion del mensaje del usuario y verifica si cumple el formato dado.
            // Entrada : String con el mensaje del usuario.
            // Salida : True si respeta el formato dado.
            public bool CmpPeugeot(String msg)
            {
                String[] list = msg.Split(' ');
                List<String> msgList = list.ToList<String>();
                List<String> lowerList = msgList.ConvertAll(d => d.ToLower());

                List<String> aux0 = new List<String>();
                aux0.Add("quiero");
                aux0.Add("deseo");

                List<String> aux1 = new List<String>();
                aux1.Add("comprar");
                aux1.Add("adquirir");

                List<String> aux2 = new List<String>();
                aux2.Add("fiesta");
                aux2.Add("mustang");
                aux2.Add("fordRaptor");

                List<String> aux3 = new List<String>();
                aux3.Add("yaris");
                aux3.Add("corolla");
                aux3.Add("auris");

                List<String> aux4 = new List<String>();
                aux4.Add("301");
                aux4.Add("2008");
                aux4.Add("206");

            if (InList(aux0, lowerList) && InList(aux1, lowerList) && lowerList.Contains("auto") && lowerList.Contains("peugeot") && !(InList(aux2, lowerList)) && !(InList(aux3, lowerList)) && !(InList(aux4, lowerList)) ||
                    InList(aux0, lowerList) && InList(aux1, lowerList) && lowerList.Contains("peugeot") && !(InList(aux2, lowerList)) && !(InList(aux3, lowerList)) && !(InList(aux4, lowerList)) ||
                    InList(aux1, lowerList) && lowerList.Contains("peugeot") && !(InList(aux2, lowerList)) && !(InList(aux3, lowerList)) && !(InList(aux4, lowerList)) ||
                    InList(aux0, lowerList) && lowerList.Contains("peugeot") && !(InList(aux2, lowerList)) && !(InList(aux3, lowerList)) && !(InList(aux4, lowerList)))
                {
                    return true;
                }
                return false;
            }

            // Metodo que realiza la comparacion del mensaje del usuario y verifica si cumple el formato dado.
            // Entrada : String con el mensaje del usuario.
            // Salida : True si respeta el formato dado.
            public bool CmpBuyModel(String msg, List<String> models)
            {
                String[] list = msg.Split(' ');
                List<String> msgList = list.ToList<String>();
                List<String> lowerList = msgList.ConvertAll(d => d.ToLower());
                List<String> modelsList = models.ConvertAll(d => d.ToLower());

                List<String> aux0 = new List<String>();
                aux0.Add("quiero");
                aux0.Add("deseo");

                List<String> aux1 = new List<String>();
                aux1.Add("comprar");
                aux1.Add("adquirir");

                if ((InList(aux0, lowerList) && InList(aux1, lowerList) && lowerList.Contains("auto")) && InList(modelsList, lowerList) ||
                    InList(aux0, lowerList) && InList(aux1, lowerList) && InList(modelsList, lowerList) ||
                    InList(aux1, lowerList) && InList(modelsList, lowerList) ||
                    InList(aux0, lowerList) && InList(modelsList, lowerList))
                {
                    return true;
                }
                return false;
            }

            // Metodo que realiza la comparacion del mensaje del usuario y verifica si cumple el formato dado.
            // Entrada : String con el mensaje del usuario.
            // Salida : True si respeta el formato dado.
            public bool LastBuy(String msg)
            {
                String[] list = msg.Split(' ');
                List<String> msgList = list.ToList<String>();
                List<String> lowerList = msgList.ConvertAll(d => d.ToLower());

                List<String> aux0 = new List<String>();
                aux0.Add("terminar");
                aux0.Add("finalizar");

                if ((InList(aux0, lowerList) && lowerList.Contains("compra")))
                {
                    return true;
                }
                return false;
            }

            
    }
}
