%DEFINICION LISTAS USER.
user("User1",["Mi nombre es Javier","Deseo comprar un Auto","Quiero comprar un Ford","Jajajaja","Quiero comprar un Mustang"]).

user("User2",["Mi nombre es Nadia","Error","Quiero comprar un Auto","Quiero comprar un auto Peugeot","Quiero comprar un 206"]).

user("User3",["Mi nombre es Tommy","Jaja","Comprar Auto","Quiero un auto Toyota","Quiero Comprar un Yaris"]).

%--------------------TDA Chatbot.--------------------------

%----------Representacion.-----------

% El Tda chatbot se representara como un hecho que tendra 12 elementos,
% el primer elemento sera un String que sera la personalidad del
% Chatbot, del elemento 2 al 12 seran listas de Strings que contendran
% los distintos dialogos que posee el Chatbot, es una lista de Strings
% ya que se crea cierta aleatoriedad al momento de elegir la respuesta.

%----------Constructor.----------

% Hecho que representa la estructura de chatbot, esta compuesto por 12
% elementos.
chatbot("Formal",["Buendos días" ,"Buenas Tardes" , "Buenas Noches"],["Bienvenido al sistema de venta de autos, ¿Cual es su nombre?","Sea muy bienvenido, ¿Me podria facilitar su nombre?","Bienvenido a la nueva automotora, ¿Cual es su nombre?"],["¿En que le puedo ayudar?","¿De que manera le puedo ofrecer mi ayuda?","Permitame ayudarle"],["En este momento puedo vender estos autos: ","Las marcas de autos disponibles en estos momentos son: ","Estas marcas de autos son las que puedo vender: "],["Los modelos que tengo disponible son: ","Estos son los modelos disponibles: ","Los siguientes modelos estan a la venta: "],["Ha sido un gusto ayudarlo, espero que vuelva.", "Espero ayudarlo en otra ocasión","Porfavor, vuelva en otra oportunidad"],["Disculpe, ¿Lo puede decir de otra manera?","Disculpe, no he entendido","¿Podría expresarse de otra manera?"], ["Ford","Toyota","Peugeot"],["Fiesta","Mustang","FordRaptor"],["Yaris","Auris","Corolla"],["301","2008","206"]).

%----------Pertenencia.---------

% Predicado que dado una personalidad, verifica si existe un chatbot
% con dicha personalidad.
% Entrada: 1 Variables que contendra la personalidad Salida : True o
% False, dependiendo si se respeta la estructura.
isChatBot(A):-
        chatbot(A,_,_,_,_,_,_,_,_,_,_,_),
        string(A).

%----------Selectores.----------

% Predicado que dado un String y un Seed devuelve el saludo correcto del
% Bot.
% Entrada: String que contiene la personalidad del Bot, Integer Seed
% Salida: String con el saludo elegido mediante un numero aleatorio.
getChatBot_Salute(P,Out):-
        isChatBot(P),
        chatbot(P,B,_,_,_,_,_,_,_,_,_,_),
        get_time(Stamp),
        stamp_date_time(Stamp, DateTime, local),
        date_time_value(hour, DateTime, X),
        X >= 6,
        X < 12,
        getElement(B,0,Out),!.
getChatBot_Salute(P,Out):-
        isChatBot(P),
        chatbot(P,B,_,_,_,_,_,_,_,_,_,_),
        get_time(Stamp),
        stamp_date_time(Stamp, DateTime, local),
        date_time_value(hour, DateTime, X),
        X >= 12,
        X < 19,
        getElement(B,1,Out),!.
getChatBot_Salute(P,Out):-
        isChatBot(P),
        chatbot(P,B,_,_,_,_,_,_,_,_,_,_),
        get_time(Stamp),
        stamp_date_time(Stamp, DateTime, local),
        date_time_value(hour, DateTime, X),
        X >= 19,
        X < 23,
        getElement(B,2,Out),!.
getChatBot_Salute(P,Out):-
        isChatBot(P),
        chatbot(P,B,_,_,_,_,_,_,_,_,_,_),
        get_time(Stamp),
        stamp_date_time(Stamp, DateTime, local),
        date_time_value(hour, DateTime, X),
        X >= 0,
        X < 6,
        getElement(B,2,Out),!.


% Predicado que dado un String y un Seed devuelve el saludo correcto del
% Bot.
% Entrada: String que contiene la personalidad del Bot, Integer Seed
% Salida: String con la bienvenida elegido mediante un numero aleatorio.
getChatBot_Welcome(P,Seed,Out):-
        isChatBot(P),
        chatbot(P,_,B,_,_,_,_,_,_,_,_,_),
        random(Seed,Num),
        getElement(B,Num,Out),!.

% Predicado que dado un String y un Seed devuelve el saludo correcto del
% Bot.
% Entrada: String que contiene la personalidad del Bot, Integer Seed
% Salida: String con la pregunta de ayuda del bot elegido mediante un
% numero aleatorio.
getChatBot_Help(P,Seed,Out):-
        isChatBot(P),
        chatbot(P,_,_,B,_,_,_,_,_,_,_,_),
        random(Seed,Num),
        getElement(B,Num,Out),!.

% Predicado que dado un String y un Seed devuelve el saludo correcto del
% Bot.
% Entrada: String que contiene la personalidad del Bot, Integer Seed
% Salida: String con el dialogo de la venta de autos del bot elegido
% mediante un numero aleatorio.
getChatBot_SellCars(P,Seed,Out):-
        isChatBot(P),
        chatbot(P,_,_,_,B,_,_,_,_,_,_,_),
        random(Seed,Num),
        getElement(B,Num,Out),!.

% Predicado que dado un String y un Seed devuelve el saludo correcto del
% Bot.
% Entrada: String que contiene la personalidad del Bot, Integer Seed
% Salida: String con el dialogo de la venta de modelos del bot elegido
% mediante un numero aleatorio.
getChatBot_SellModels(P,Seed,Out):-
        isChatBot(P),
        chatbot(P,_,_,_,_,B,_,_,_,_,_,_),
        random(Seed,Num),
        getElement(B,Num,Out),!.

% Predicado que dado un String y un Seed devuelve el saludo correcto del
% Bot.
% Entrada: String que contiene la personalidad del Bot, Integer Seed
% Salida: String con la despedidas del bot elegido mediante un numero
% aleatorio.
getChatBot_GoodBye(P,Seed,Out):-
        isChatBot(P),
        chatbot(P,_,_,_,_,_,B,_,_,_,_,_),
        random(Seed,Num),
        getElement(B,Num,Out),!.

% Predicado que dado un String y un Seed devuelve el mensaje de
% cuando el Bot no entiende.
% Entrada: String que contiene la personalidad del Bot, Integer Seed
% Salida: String con el mensaje cuando el bot no entiende elegido
% mediante un numero aleatorio.
getChatBot_DontUnderstand(P,Seed,Out):-
        isChatBot(P),
        chatbot(P,_,_,_,_,_,_,B,_,_,_,_),
        random(Seed,Num),
        getElement(B,Num,Out),!.

% Predicado que dado un String, retorna una lista con las marcas
% de autos disponibles
% Entrada: String que contiene la personalidad del Bot
% Salida: Lista con las marcas de autos que vende el bot. aleatorio.
getChatBot_Cars(P,Out):-
        chatbot(P,_,_,_,_,_,_,_,Out,_,_,_),!.

% Predicado que dado un String, retorna una lista con las marcas
% de autos disponibles
% Entrada: String que contiene la personalidad del Bot
% Salida: Lista con las marcas de autos que vende el bot. aleatorio.
getChatBot_Models(P,Car,Out):-
        isChatBot(P),
        =(Car,"Ford"),
        chatbot(P,_,_,_,_,_,_,_,_,Out,_,_),!.
getChatBot_Models(P,Car,Out):-
        isChatBot(P),
        =(Car,"Toyota"),
        chatbot(P,_,_,_,_,_,_,_,_,_,Out,_),!.
getChatBot_Models(P,Car,Out):-
        isChatBot(P),
        =(Car,"Peugeot"),
        chatbot(P,_,_,_,_,_,_,_,_,_,_,Out),!.


%----------Modificadores.----------

%En este caso no son necesarios los modificiadores del TDA.


%----------Funciones Operadoras Sobre TDA.----------

%En este caso no son necesarios los operadores sobre el TDA.


%--------------------TDA Message.------------------------------

%----------Represantacion.---------

%El TDA message es una lista que contiene 7 elementos.

% Primer elemento -> Identificador general (BeginDialog, SendMessage o
% EndDialog).
% Segundo elemento -> Contiene la fecha y hora del mensaje.
% Tercer elemento -> Indentificador "Usuario: ".
% Cuarto elemento -> Mensaje del Usuario.
% Quinto elemento ->Indentificador "ChatBot: ".
% Sexto elemento -> Mensaje del Usuario.

%----------Constructor.----------

% Predicado que representa el TDA messsage.
% Entrada: Los 6 primeros elementos representan lo mismo que el TDA
% Message, y el átomo auxiliar Out.
% Salida: Out que contiene la lista con la informacion de los 6 primeros
% átomos.
message(Iden,DateTime,IdenU,UMsg,IdenC,CMsg,Out):-
        append([Iden],[DateTime],Out1),
        append(Out1,[IdenU],Out2),
        append(Out2,[UMsg],Out3),
        append(Out3,[IdenC],Out4),
        append(Out4,[CMsg],Out).

%----------Pertenencia----------

% Predicado que permite verificar si una Lista Message, respeta el
% formato de la representación.
% Entrada : Lista Message.
% Salida : True o False, dependiendo de si se cumple o no la
% representación.
isMessage(Message):-
        getElement(Message,0,X),
        =(X,"BeginDialog"),
        getElement(Message,1,Y),
        string(Y),
        getElement(Message,2,Z),
        =(Z,"Usuario:"),
        getElement(Message,3,W),
        string(W),
        getElement(Message,4,L),
        =(L,"ChatBot:"),
        getElement(Message,5,O),
        string(O),!.
isMessage(Message):-
        getElement(Message,0,X),
        =(X,"SendMessage"),
        getElement(Message,1,Y),
        string(Y),
        getElement(Message,2,Z),
        =(Z,"Usuario:"),
        getElement(Message,3,W),
        string(W),
        getElement(Message,4,L),
        =(L,"ChatBot:"),
        getElement(Message,5,O),
        string(O),!.
isMessage(Message):-
        getElement(Message,0,X),
        =(X,"EndDialog"),
        getElement(Message,1,Y),
        string(Y),
        getElement(Message,2,Z),
         =(Z,"Usuario:"),
        getElement(Message,3,W),
        string(W),
        getElement(Message,4,L),
        =(L,"ChatBot:"),
        getElement(Message,5,O),
        string(O),!.


%----------Selectores-----------

% Predicado que dada una lista Message, retorna el Mensaje del
% Usuario.
% Entrada : Lista Mensaje.
% Salida : Mensaje del Usuario, si se cumples las
% validaciones.
getMessage_User(ListMsg,X):-
        isMessage(ListMsg),
        getElement(ListMsg,3,X),!.

% Predicado que dada una lista Message, retorna el Mensaje del
% ChatBot.
% Entrada : Lista Mensaje.
% Salida : Mensaje del ChatBot, si se cumples las
% validaciones.
getMessage_ChatBot(ListMsg,X):-
        isMessage(ListMsg),
        getElement(ListMsg,5,X),!.

%----------Modificadores.----------

%En este caso no son necesarios los modificiadores del TDA.


%----------Funciones Operadoras Sobre TDA.----------

%En este caso no son necesarios los operadores sobre el TDA.

%--------------------TDA Log.--------------------

%-----------Representación.----------

% El TDA Log se representará como una lista de listas.
% Donde cada sub-lista sera un TDA Message que representa una
% interaccion usuario-chatbot.

%----------Constructor.---------

% Predicado que construye el TDA log.
% Entrada : Una Lista.
% Salida : Una lista de listas.
log(MsgList,Out):-
        append(_,[MsgList],Out),!.

%----------Pertenencia.----------

% Predicado que verifica que la lista log, respete la representacion
% dada.
% Entrada : Lista Log.
% Salida : True o False, dependiendo si respeta la representacion.
isLog([]).
isLog([X|Xs]):-
        isMessage(X),
        isLog(Xs).

%----------Selectores.----------

% Predicado que permite obtener el nombre del usuario pertenenciente al
% Log.
% Entrada : Lista Log.
% Salida : String con el nombre.
getLog_Name(LogList,Out):-
        getElement(LogList,1,Msg),
        getMessage_User(Msg,X),
        split_string(X," ","",NewMsg),
        getElement(NewMsg,3,Out),!.

% Predicado que permite obtener el modelo del auto que el usuario desea
% comprar.
% Entrada : Lista Log.
% Salida : String con la marca.

%-----------Modificador.----------

% Predicado que permite agregar un mensaje a la lista Log.
% Entrada : Lista Log y Lista Message.
% Salida : Nueva Lista Log con el Message anidado.
setLog_NewLog(LogList,Message,NewLog):-
        isLog(LogList),
        isMessage(Message),
        log(Message,X),
        append(LogList,X,NewLog),!.

% Predicado que permite iniciar la conversacion.
% Entrada : ChatBot (String con la personalidad que se desea), InputLog
% (Lista Log , que puede ser vacia o ya tener una conversación), Seed
% (Integer que permitira realizar cierta aleatoriedad de los mensajes) y
% OutputLog (Lista Log de salida).
% Salida : Lista OutputLog, que contiene la bienvenida del ChatBot.
beginDialog(Chatbot, InputLog, Seed, OutputLog):-
        isChatBot(Chatbot),
        isLog(InputLog),
        number(Seed),
        getChatBot_Salute(Chatbot,OutSalute),
        getChatBot_Welcome(Chatbot,Seed,OutWelcome),
        string_concat(OutSalute, ", ", OutString1),
        string_concat(OutString1,OutWelcome, OutString2),
        string_concat(OutString2,".",OutFinal),
        dateTime(DT),
        message("BeginDialog",DT,"Usuario:","-","ChatBot:",OutFinal,Out),
        setLog_NewLog(InputLog,Out,OutputLog),!.

% Predicado que permite enviar un mensaje del usuario al ChatBot.
% Entrada : String Msg, String ChatBot (Personalidad), InputLog (Lista
% Log que se pasa como parametro), Integer Seed.
% Salida : Lista OutputLog, que contiene las distintas actualizaciones
% con los nuevos mensajes del Usuario al Bot.
sendMessage(Msg, Chatbot, InputLog, Seed, OutputLog):-
        isChatBot(Chatbot),
        isLog(InputLog),
        number(Seed),
        string(Msg),
        dateTime(DT),
        cmpName(Msg),
        getChatBot_Help(Chatbot,Seed,OutHelp),
        split_string(Msg," ","",NewMsg),
        getElement(NewMsg,3,Name),
        string_concat(Name,", ",NewName),
        string_concat(NewName,OutHelp,OutFinal),
        message("SendMessage",DT,"Usuario:",Msg,"ChatBot:",OutFinal,Out),
        setLog_NewLog(InputLog,Out,OutputLog),!.
sendMessage(Msg, Chatbot, InputLog, Seed, OutputLog):-
        isChatBot(Chatbot),
        isLog(InputLog),
        number(Seed),
        string(Msg),
        %dateTime(DT),
        cmpBuy(Msg),
        getChatBot_SellCars(Chatbot,Seed,OutSell),
        getChatBot_Cars(Chatbot,OutCars),
        listToString(OutCars,StringCars),
        string_concat(OutSell,StringCars,OutFinal),
        getLog_Name(InputLog,X),
        string_concat(X,", ",Xnew),
        string_concat(Xnew,OutFinal,OutF),
        message("SendMessage","a","Usuario:",Msg,"ChatBot:",OutF,Out),
        setLog_NewLog(InputLog,Out,OutputLog),!.
sendMessage(Msg, Chatbot, InputLog, Seed, OutputLog):-
        isChatBot(Chatbot),
        isLog(InputLog),
        number(Seed),
        string(Msg),
        dateTime(DT),
        cmpFord(Msg),
        getChatBot_SellModels(Chatbot,Seed,OutSell),
        getChatBot_Models(Chatbot,"Ford",OutModels),
        listToString(OutModels,StringCars),
        string_concat(OutSell,StringCars,OutFinal),
        getLog_Name(InputLog,X),
        string_concat(X,", ",Xnew),
        string_concat(Xnew,OutFinal,OutF),
        message("SendMessage",DT,"Usuario:",Msg,"ChatBot:",OutF,Out),
        setLog_NewLog(InputLog,Out,OutputLog),!.
sendMessage(Msg, Chatbot, InputLog, Seed, OutputLog):-
        isChatBot(Chatbot),
        isLog(InputLog),
        number(Seed),
        string(Msg),
        dateTime(DT),
        cmpToyota(Msg),
        getChatBot_SellModels(Chatbot,Seed,OutSell),
        getChatBot_Models(Chatbot,"Toyota",OutModels),
        listToString(OutModels,StringCars),
        string_concat(OutSell,StringCars,OutFinal),
        getLog_Name(InputLog,X),
        string_concat(X,", ",Xnew),
        string_concat(Xnew,OutFinal,OutF),
        message("SendMessage",DT,"Usuario:",Msg,"ChatBot:",OutF,Out),
        setLog_NewLog(InputLog,Out,OutputLog),!.
sendMessage(Msg, Chatbot, InputLog, Seed, OutputLog):-
        isChatBot(Chatbot),
        isLog(InputLog),
        number(Seed),
        string(Msg),
        dateTime(DT),
        cmpPeugeot(Msg),
        getChatBot_SellModels(Chatbot,Seed,OutSell),
        getChatBot_Models(Chatbot,"Peugeot",OutModels),
        listToString(OutModels,StringCars),
        string_concat(OutSell,StringCars,OutFinal),
        getLog_Name(InputLog,X),
        string_concat(X,", ",Xnew),
        string_concat(Xnew,OutFinal,OutF),
        message("SendMessage",DT,"Usuario:",Msg,"ChatBot:",OutF,Out),
        setLog_NewLog(InputLog,Out,OutputLog),!.
sendMessage(Msg, Chatbot, InputLog, Seed, OutputLog):-
        isChatBot(Chatbot),
        isLog(InputLog),
        number(Seed),
        string(Msg),
        dateTime(DT),
        cmpFordModel(Msg),
        getWord(Msg,Brand),
        string_concat("Su compra es --> ","Marca: ",X1),
        string_concat(X1,"Ford",X2),
        string_concat(X2,", ",X3),
        string_concat(X3,"Modelo: ",X4),
        string_concat(X4,Brand,X5),
        string_concat(X5,".",X6),
        getLog_Name(InputLog,X),
        string_concat(X,", ",Xnew),
        string_concat(Xnew,X6,OutF),
        message("SendMessage",DT,"Usuario:",Msg,"ChatBot:",OutF,Out),
        setLog_NewLog(InputLog,Out,OutputLog),!.
sendMessage(Msg, Chatbot, InputLog, Seed, OutputLog):-
        isChatBot(Chatbot),
        isLog(InputLog),
        number(Seed),
        string(Msg),
        dateTime(DT),
        cmpToyotaModel(Msg),
        getWord(Msg,Brand),
        string_concat("Su compra es --> ","Marca: ",X1),
        string_concat(X1,"Toyota",X2),
        string_concat(X2,", ",X3),
        string_concat(X3,"Modelo: ",X4),
        string_concat(X4,Brand,X5),
        string_concat(X5,".",X6),
        getLog_Name(InputLog,X),
        string_concat(X,", ",Xnew),
        string_concat(Xnew,X6,OutF),
        message("SendMessage",DT,"Usuario:",Msg,"ChatBot:",OutF,Out),
        setLog_NewLog(InputLog,Out,OutputLog),!.
sendMessage(Msg, Chatbot, InputLog, Seed, OutputLog):-
        isChatBot(Chatbot),
        isLog(InputLog),
        number(Seed),
        string(Msg),
        dateTime(DT),
        cmpPeugeotModel(Msg),
        getWord(Msg,Brand),
        string_concat("Su compra es --> ","Marca: ",X1),
        string_concat(X1,"Peugeot",X2),
        string_concat(X2,", ",X3),
        string_concat(X3,"Modelo: ",X4),
        string_concat(X4,Brand,X5),
        string_concat(X5,".",X6),
        getLog_Name(InputLog,X),
        string_concat(X,", ",Xnew),
        string_concat(Xnew,X6,OutF),
        message("SendMessage",DT,"Usuario:",Msg,"ChatBot:",OutF,Out),
        setLog_NewLog(InputLog,Out,OutputLog),!.
sendMessage(Msg, Chatbot, InputLog, Seed, OutputLog):-
        isChatBot(Chatbot),
        isLog(InputLog),
        number(Seed),
        string(Msg),
        dateTime(DT),
        not(cmpBuy(Msg)),
        getChatBot_DontUnderstand(Chatbot,Seed,OutDont),
        message("SendMessage",DT,"Usuario:",Msg,"ChatBot:",OutDont,Out),
        setLog_NewLog(InputLog,Out,OutputLog),!.


% Predicado que permite finalizar una conversacion.
% Entrada : ChatBot (String con la personalidad que se desea), InputLog
% (Lista Log), Seed (Integer que permitira realizar cierta aleatoriedad
% de los mensajes) y OutputLog (Lista Log de salida).
% Salida : Lista OutputLog, que contiene la bienvenida del ChatBot.
endDialog(Chatbot, InputLog, Seed, OutputLog):-
        isChatBot(Chatbot),
        isLog(InputLog),
        number(Seed),
        getChatBot_GoodBye(Chatbot,Seed,OutBye),
        dateTime(DT),
        message("EndDialog",DT,"Usuario:","-","ChatBot:",OutBye,Out),
        setLog_NewLog(InputLog,Out,OutputLog),!.

% Predicado que permite simular una conversacion con el Bot, mediante
% usuarios representados como listas.
% Entrada: Lista User (Lista Strings), ChatBot (String con la
% personalidad), InputLog (Lista Log), Seed (Integer que permite cierta
% aleatoriedad de los dialogos del Bot)y OutPutLog(Salida).
% Salida : Lista OutpuLog, con toda la conversacion.
test(User, Chatbot, InputLog, Seed, OutputLog):-
        isChatBot(Chatbot),
        isLog(InputLog),
        number(Seed),
        user(User,UserList),
        beginDialog(Chatbot,InputLog,Seed,Out1),
        Seed1 is Seed + 1,
        testAux(UserList,Chatbot,Out1,Seed1,Out2),
        Seed2 is Seed1 + 1,
        endDialog(Chatbot,Out2,Seed2,OutputLog).

% Predicado que dada una lista de strings, permite aplicar el predicado
% SendMessage a cada elemento de la lista.
% Entrada: Lista User (Lista Strings), ChatBot (String con la
% personalidad), InputLog (Lista Log), Seed (Integer que permite cierta
% aleatoriedad de los dialogos del Bot)y Out(Salida).
% Salida : Lista OutpuLog, con toda la conversacion.
testAux([],_,InputLog,_,InputLog).
testAux([X|Xs],Chatbot,InputLog,Seed,OutLog):-
        Num is Seed + 1,
        sendMessage(X,Chatbot,InputLog,Seed,Out),
        testAux(Xs,Chatbot,Out,Num,OutLog).

%----------Funciones Operadoras Sobre TDA.----------

% Predicado que dada una lista Log, permite entregar un string con la
% conversacoin de una manera mas entendible.
% Entrada : Lista log con una conversacion.
% Salida: String que representa la conversacion.
logToStr(Log, StrRep):-
        isLog(Log),
        reverse(Log,ReverseLog),
        logToStrAux(ReverseLog,"",Out),
        string_concat("\n......INICIO CONVERSACION\n\n",Out,Out1),
        string_concat(Out1,"\n......FIN CONVERSACION\n\n",StrRep),
        string(StrRep),
        write(StrRep).

% Predicado que permite realizar una recursion con la lista Log,
% añandiendola a un String con un formato predeterminado
% Entdada: Lista Log.
% Salida : String que representa la conversacion.
logToStrAux([],StrOut,StrOut).
logToStrAux([X|Xs],StrOut,OutString):-
        getMessage_User(X,User),
        getMessage_ChatBot(X,Bot),
        string_concat(StrOut,"",Start),
        string_concat("ChatBot: ",Bot,NewBot),
        string_concat("Usuario: ",User,NewUser),
        string_concat(NewBot,"\n",FinalBot),
        string_concat(NewUser,"\n",FinalUser),
        string_concat(FinalUser,FinalBot,Message),
        string_concat(Message,Start,Out),
        logToStrAux(Xs,Out,OutString).


%--------------------Clausulas de Horn.--------------------

%Predicado que dada una lista

% Predicado que dado un seed, retorna un numero al azar de 0 a 2.
% Entrada: Seed (Integer)
% Salida: Out con numero obtenido.
random(Seed,Out):-
        Out is mod(mod(((1103515245*Seed)+12345),2147483648),3),!.

% Predicado que dada una lista, retorna un string con los elementos de
% la lista.
% Entrada: Lista
% Salida: String con la informacion de la lista.
listToString(List,X):-
        getElement(List,0,X1),
        getElement(List,1,X2),
        getElement(List,2,X3),
        string_concat(X1,", ",X1Out),
        string_concat(X2,", ",X2Out),
        string_concat(X3,".",X3Out),
        string_concat(X1Out,X2Out,NewX),
        string_concat(NewX,X3Out,X).


% Predicado que dado una lista y un número, retorna el elemento en esa
% posición de la lista.
% Entrada: Lista de Strings, Seed Num
% Salida: Out con el elemento de la lista en la posición Num.
getElement([X|_],0,X).
getElement([_|Xs],Num,Out):-
        Num2 is Num - 1,
        getElement(Xs,Num2,Out),!.

% Predicado que permite obtener la fecha actual.
% Entrada: No posee entrada
% Salida : Variable Date donde se guarda la fecha.
date(Date) :-
    get_time(Stamp),
    stamp_date_time(Stamp, DateTime, local),
    date_time_value(year, DateTime, X),
    atom_string(X,XString),
    date_time_value(month, DateTime, Y),
    atom_string(Y,YString),
    date_time_value(day, DateTime, Z),
    atom_string(Z,ZString),
    string_concat(ZString,"/",NewDay),
    string_concat(YString,"/",NewMonth),
    string_concat(NewDay,NewMonth,DayMonth),
    string_concat(DayMonth,XString,Date).

% Predicado que permite obtener la hora actual.
% Entrada: No posee entrada
% Salida : Variable time donde se guarda la hora.
time(Time) :-
    get_time(Stamp),
    stamp_date_time(Stamp, DateTime, local),
    date_time_value(hour, DateTime, X),
    atom_string(X,XString),
    date_time_value(minute, DateTime, Y),
    atom_string(Y,YString),
    date_time_value(second, DateTime, Z),
    Z2 is round(Z),
    atom_string(Z2,ZString),
    string_concat(XString,":",NewHour),
    string_concat(YString,":",NewMinute),
    string_concat(NewHour,NewMinute,HourMinute),
    string_concat(HourMinute,ZString,Time).

% Predicado que junta la fecha y la hora en un solo String.
% Entrada : No posee entrada.
% Salida : Variable DateTime donde se guarda el nuevo string.
dateTime(X):-
        date(Date),
        time(Time),
        string_concat(Date,"-",New),
        string_concat(New,Time,X).

% Predicado que verifica y retorna si una marca de auto se encuentra
% dentro del mensaje.
% Entrada: List phrase.
% Salida: X con el string de la marca de auto correspondiente
getWord(Phrase,X):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",Out),
        member("fiesta",Out),
        X = "Fiesta",!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",Out),
        member("mustang",Out),
        X = "Mustang",!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",Out),
        member("fordraptor",Out),
        X = "FordRaptor",!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",Out),
        member("auris",Out),
        X = "Auris",!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",Out),
        member("yaris",Out),
        X = "Yaris",!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",Out),
        member("corolla",Out),
        X = "Corolla",!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",Out),
        member("301",Out),
        X = "301",!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",Out),
        member("206",Out),
        X = "206",!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",Out),
        member("2008",Out),
        X = "2008",!.


% Predicado que verifica si una frase esta dentro de una lista de
% palabras.
% Entrada : List phrase
% Salida : True o False, dependiendo de si se cumple o no la
% representación.
cmpName(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("mi",ListPhrase),
        member("nombre",ListPhrase),
        member("es",ListPhrase),!.

% Predicado que verifica si una frase esta dentro de una lista de
% palabras.
% Entrada : List phrase
% Salida : True o False, dependiendo de si se cumple o no la
% condicion.
cmpBuy(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        not(member("mustang",ListPhrase)),
        not(member("fiesta",ListPhrase)),
        not(member("fordraptor",ListPhrase)),
        not(member("301",ListPhrase)),
        not(member("206",ListPhrase)),
        not(member("2008",ListPhrase)),
        not(member("auris",ListPhrase)),
        not(member("yaris",ListPhrase)),
        not(member("corolla",ListPhrase)),
        not(member("ford",ListPhrase)),
        not(member("toyota",ListPhrase)),
        not(member("peugeot",ListPhrase)),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        not(member("mustang",ListPhrase)),
        not(member("fiesta",ListPhrase)),
        not(member("fordraptor",ListPhrase)),
        not(member("301",ListPhrase)),
        not(member("206",ListPhrase)),
        not(member("2008",ListPhrase)),
        not(member("auris",ListPhrase)),
        not(member("yaris",ListPhrase)),
        not(member("corolla",ListPhrase)),
        not(member("ford",ListPhrase)),
        not(member("toyota",ListPhrase)),
        not(member("peugeot",ListPhrase)),!.
cmpBuy(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        not(member("ford",ListPhrase)),
        not(member("mustang",ListPhrase)),
        not(member("fiesta",ListPhrase)),
        not(member("fordraptor",ListPhrase)),
        not(member("301",ListPhrase)),
        not(member("206",ListPhrase)),
        not(member("2008",ListPhrase)),
        not(member("auris",ListPhrase)),
        not(member("yaris",ListPhrase)),
        not(member("corolla",ListPhrase)),
        not(member("toyota",ListPhrase)),
        not(member("peugeot",ListPhrase)),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        not(member("mustang",ListPhrase)),
        not(member("fiesta",ListPhrase)),
        not(member("fordraptor",ListPhrase)),
        not(member("301",ListPhrase)),
        not(member("206",ListPhrase)),
        not(member("2008",ListPhrase)),
        not(member("auris",ListPhrase)),
        not(member("yaris",ListPhrase)),
        not(member("corolla",ListPhrase)),
        not(member("ford",ListPhrase)),
        not(member("toyota",ListPhrase)),
        not(member("peugeot",ListPhrase)),!.




% Predicado que verifica si una frase esta dentro de una lista de
% palabras.
% Entrada : List phrase
% Salida : True o False, dependiendo de si se cumple o no la
% condicion.
cmpFord(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("ford",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("ford",ListPhrase),
        not(member("fiesta",ListPhrase)),
        not(member("mustang",ListPhrase)),
        not(member("fordraptor",ListPhrase)),!.
cmpFord(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("ford",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("ford",ListPhrase),
        not(member("fiesta",ListPhrase)),
        not(member("mustang",ListPhrase)),
        not(member("fordraptor",ListPhrase)),!.


% Predicado que verifica si una frase esta dentro de una lista de
% palabras.
% Entrada : List phrase
% Salida : True o False, dependiendo de si se cumple o no la
% condicion.
cmpPeugeot(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("peugeot",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("peugeot",ListPhrase),
        not(member("301",ListPhrase)),
        not(member("206",ListPhrase)),
        not(member("2008",ListPhrase)),!.
cmpPeugeot(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("peugeot",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("peugeot",ListPhrase),
        not(member("301",ListPhrase)),
        not(member("206",ListPhrase)),
        not(member("2008",ListPhrase)),!.


% Predicado que verifica si una frase esta dentro de una lista de
% palabras.
% Entrada : List phrase
% Salida : True o False, dependiendo de si se cumple o no la
% condicion.
cmpToyota(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("toyota",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("toyota",ListPhrase),
        not(member("auris",ListPhrase)),
        not(member("corolla",ListPhrase)),
        not(member("yaris",ListPhrase)),!.
cmpToyota(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("toyota",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("toyota",ListPhrase),
        not(member("auris",ListPhrase)),
        not(member("corolla",ListPhrase)),
        not(member("yaris",ListPhrase)),!.



% Predicado que verifica si una frase esta dentro de una lista de
% palabras.
% Entrada : List phrase
% Salida : True o False, dependiendo de si se cumple o no la
% condicion.
cmpFordModel(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("fordraptor",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("mustang",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("fiesta",ListPhrase),!.
cmpFordModel(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("fordraptor",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("mustang",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("fiesta",ListPhrase),!.
cmpFordModel(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("fordraptor",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("mustang",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("fiesta",ListPhrase),!.
cmpFordModel(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("fordraptor",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("mustang",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("fiesta",ListPhrase),!.


% Predicado que verifica si una frase esta dentro de una lista de
% palabras.
% Entrada : List phrase
% Salida : True o False, dependiendo de si se cumple o no la
% condicion.
cmpToyotaModel(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("auris",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("corolla",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("yaris",ListPhrase),!.
cmpToyotaModel(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("corolla",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("auris",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("yaris",ListPhrase),!.
cmpToyotaModel(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("auris",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("corolla",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("yaris",ListPhrase),!.
cmpToyotaModel(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("corolla",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("auris",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),!.


% Predicado que verifica si una frase esta dentro de una lista de
% palabras.
% Entrada : List phrase
% Salida : True o False, dependiendo de si se cumple o no la
% condicion.
cmpPeugeotModel(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("301",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("2008",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("206",ListPhrase),!.
cmpPeugeotModel(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("301",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("2008",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("quiero",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("206",ListPhrase),!.
cmpPeugeotModel(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("301",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("2008",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("206",ListPhrase),!.
cmpPeugeotModel(Phrase):-
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("301",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("2008",ListPhrase),!;
        string_lower(Phrase,NewPhrase),
        split_string(NewPhrase," ","",ListPhrase),
        member("deseo",ListPhrase),
        member("comprar",ListPhrase),
        member("auto",ListPhrase),
        member("206",ListPhrase),!.
