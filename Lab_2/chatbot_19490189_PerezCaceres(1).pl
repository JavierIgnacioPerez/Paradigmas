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
chatbot("Formal",["Buendos días" ,"Buenas Tardes" , "Buenas Noches"],["Bienvenido al sistema de venta de autos, ¿Cual es su nombre?","Sea muy bienvenido, ¿Me podria facilitar su nombre?","Bienvenido a la nueva automotora, ¿Cual es su nombre?"],["¿En que le puedo ayudar?","¿De que manera le puedo ofrecer mi ayuda?","Permitame ayudarle"],["En este momento puedo vender estos autos: ","Las marcas de autos disponibles en estos momentos son: ","Estas marcas de autos son las que puedo vender: "],["Los modelos que tengo disponible son: ","Estos son los modelos disponibles: ","Los siguientes modelos estan a la venta: "],["Ha sido un gusto ayudarlo, espero que vuelva.", "Espero ayudarlo e otra ocasión","Porfavor, vuelva en otra oportunidad"],["Disculpe, ¿Lo puede decir de otra manera?","Disculpe, no he entendido","¿Podría expresarse de otra manera?"], ["Ford","Toyota","Peugeot"],["Fiesta","Mustang","FordRaptor"],["Yaris","Auris","Corolla"],["301","2008","206"]).

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

% Predicado que dado un String y un Seed devuelve el saludo correcto del
% Bot.
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

% Predicado que dada una lista Message, retorna el Identificador del
% Mensaje.
% Entrada : Lista Mensaje.
% Salida : Identificador de la Lista, si se cumples las validaciones.
getMessage_Ident(ListMsg,X):-
        isMessage(ListMsg),
        getElement(ListMsg,0,X),!.

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

% Predicado que permite obtener el ultimo mensaje pertenenciente al Log.
% Entrada : Lista Log.
% Salida : Lista con el ultimo Mensaje del Log.
getLog_LastMessage(LogList,Out):-
        isLog(LogList),
        length(LogList,X),
        getElement(LogList,X-1,Out),!.

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
        isMessage(Out),
        log(Out,Msg),
        append(InputLog,Msg,OutputLog),!.

% Predicado que permite enviar un mensaje del usuario al ChatBot.
% Entrada : String Msg, String ChatBot (Personalidad), InputLog (Lista
% Log que se pasa como parametro), Integer Seed.
% Salida : Lista OutputLog, que contiene las distintas actualizaciones
% con los nuevos mensajes del Usuario al Bot.

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
        isMessage(Out),
        log(Out,Msg),
        append(InputLog,Msg,OutputLog),!.



%----------Funciones Operadoras Sobre TDA.----------

% En este caso no son necesarias las funciones operadores sobre el TDA.

%--------------------Clausulas de Horn.--------------------

% Predicado que dado un seed, retorna un numero al azar de 0 a 2.
% Entrada: Seed (Integer)
% Salida: Out con numero obtenido.
random(Seed,Out):-
        Out is mod(mod(((1103515245*Seed)+12345),2147483648),3),!.

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
