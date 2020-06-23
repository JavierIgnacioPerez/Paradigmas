#lang scheme

;---------------------------------DEFINICION DE LISTAS USER------------------------------------
(define user1 '("Inicio" "Mi nombre es Javier" "Deseo comprar un Auto" "Quiero comprar un helado" "Quiero comprar un Ford" "Quiero adquirir un FordRaptor" "Realizar Compra" "Forzar Compra" "Fin"))

(define user2 '("Inicio" "Mi nombre es Nadia" "Quiero comprar un Auto" "Quiero un Peugeot" "Quiero adquirir un FordRaptor" "Quiero adquirir un 206" "Realizar Compra" "Forzar Compra" "Fin"))

(define user3 '("Inicio" "Mi nombre es Tommy" "comprar Auto" "Deseo un auto Toyota" "Jajaja" "Adquirir un Yaris" "Realizar Compra" "Forzar Compra" "Fin"))

(define user4 '("Inicio" "Mi nombre es Tommy" "comprar Auto" "Deseo un auto Ford" "Adquirir un Yaris" "Realizar Compra" "Jajajaja" "Forzar Compra" "Fin"))

;-----------------------------------------------------------------------------------------------


;TDA message
;REPRESENTACION Lista.
;Lista compuesta por 4 elementos (excepto la primera y la ultima).
   ;Los elementos son: ID, FECHA Y HORA, MENSAJE DE USUARIO, RESPUESTA DE CHATBOT Y VERIFICADOR MENSAJE (SI LA RESPUESTA FUE CORRECTA O NO).
   ;La primera y la ultima sub-listas tendra mensaje del usuario equivalente al delimitador , dependiendo si se trata del primero o el ultimo mensaje.

;CONSTRUCTOR

;Funcion constructora de TDA menssage.
;Integer id, String dateTime, String userMsg, String botMsg -> Lista que contiene la informacion de los parametros entregados.
;No hay recursion.
(define (message id dateTime userMsg botMsg vrMsg)
  (if (number? id)
      (if (and (string? dateTime) (string? userMsg) (or (string? botMsg) (promise? botMsg)) (string? vrMsg))
          (if (eq? "" userMsg)
              (append (list id) (list dateTime) (list botMsg))
              (append (list id) (list dateTime) (list userMsg) (list botMsg) (list vrMsg))
              )
          null
          )
      null
      )
  )

;FUNCION DE PERTENENCIA

;Funcion de pertenencia del TDA message.
;List message -> Bool #t si message respeta el formato establecido en el tda, #f en caso contrario.
;No hay recursion.
(define (message? message)
  (if (list? message)
      (if (null? message)
          #t
          (if (= (length message) 5)
              (if (number? (car message))
                  (message? (cdr message))
                  #f
                  )
              (if (or (string? (car message)) (promise? (car message)))
                  (message? (cdr message))
                  #f
                  )
              )
          )
      #f
      )
  )

;SELECTORES

;Funcion que obtiene el mensaje del bot.
;List message -> String con el mensaje del bot.
;No hay recursion.
(define (message-getBot message)
  (if (message? message)
      (if (= (length message) 5)
          (cadddr message)
          null
          )
      null
      )
  )

;Funcion que obtiene el mensaje del usuario.
;List message -> String con el mensaje del usuario.
;No hay recursion.
(define (message-getUser message)
  (if (message? message)
      (if (= (length message) 5)
          (caddr message)
          null
          )
      null
      )
  )

;Funcion que obtiene la verificacion del mensaje.
;List message-> String con el mensaje de verificacion.
;No hay recursion.
(define (message-getVer message)
  (if (message? message)
      (if (= (length message) 5)
          (cadddr (cdr message))
          null
          )
      null
      )
  )

;MODIFICADORES
     ;En este caso no son necesarias funciones modificadoras del TDA.

;FUNCIONES QUE OPERAN SOBRE EL TDA
     ;En este caso no son necesarias funciones que operan sobre el TDA.

;------------------------------------------------------------------------------------------------------------

;TDA log
;REPRESENTACION : Listas de listas.

;Lista compuestas de listas (hasta n sub-listas, depende de la conversascion),
;donde cada sublista es un mensaje del TDA message.

;CONSTRUCTOR
;Funcion que construye el TDA log.
;List list que puede estar vacia o con contenido, dependiendo de la entrada -> List con la misma informacion.
;No hay recursion.
(define (log listN)
  (if (list? listN)
      listN
      null
      )
  )

;FUNCION DE PERTENENCIA
;Funcion de pertenencia del TDA log.
;List log -> Bool #t si log respeta el formato dado en el tda, #f en caso contrario.
;Recursion de cola.
(define (log? log)
 (if (list? log)
     (if (null? log)
         #t
         (if(message? (car log))
            (log? (cdr log))
            #f
            )
         )
     #f
     )
  )

;SELECTORES

;Funcion que dado un log, retorna el mensaje donde se pregunto la marca del auto a comprar.
;List log -> String message.
;Recursion de cola.
(define (log-getBrandMessageUser log)
  (if (log? log)
      (if (verifyEnd log)
          (log-getBrandMessageUser (cdr log))
          (if (null? log)
              null
              (if (and (eq? (message-getVer (car log)) "#C") (cmpFord (listToLower (myString-split (string->list (message-getUser (car log))) "" '()))))
                  "Ford"
                  (if (and (eq? (message-getVer (car log)) "#C") (cmpToyota (listToLower (myString-split (string->list (message-getUser (car log))) "" '()))))
                      "Toyota"
                      (if (and (eq? (message-getVer (car log)) "#C") (cmpPeugeot (listToLower (myString-split (string->list (message-getUser (car log))) "" '()))))
                          "Peugeot"
                          (log-getBrandMessageUser (cdr log))
                          )
                      )
                  )
              )
          )
      null
      )
  )

;Funcion que retorna el ultimo mensaje del bot.
;Lista log -> String con el mensaje del bot.
;Recursion de cola.
(define (log-getLastMessageBot log)
  (if (log? log)
      (if (verifyEnd log)
          (log-getLastMessageBot (cdr log))
          (if (promise? (message-getBot (car log)))
              (message-getBot (car log))
              (log-getLastMessageBot (cdr log))
              )
          )
      null
      )
  )

;Fucion que dado un log, retorna el nombre que se ingreso al Log.
;List log -> String message con el nombre
;Recursion de cola.
(define (log-getName log)
  (if (log? log)
      (if (verifyEnd log)
          (log-getName (cdr log))
          (cadddr (myString-split (string->list (message-getUser (cadr log))) "" '()))
          )
      null
      )
  )

;MODIFICADORES

;Funcion que inicia el dialogo.
;List chatbot, List log, Integer seed  -> List log.
;No hay recursión.
(define (beginDialog chatbot log seed)
 (if (chatbot? chatbot)
     (if (log? log)
         (if (number? seed)
             (log-setLog log (message (random seed) (actualDateTime) "BeginDialog" (string-append(selectSl chatbot) " " (chatbot-getDialog chatbot chatbot-getExpl (random seed))) "#C"))
             null
             )
         null
         )
     null
     )
  )


;Funcion que permite al usuario enviar mensajes al chatbot.
;String msg, List chatbot, List log, Integer seed -> List log.
;No hay recursion.
(define (sendMessage msg chatbot log seed)
 (if (and (verifyStart log) (string? msg) (chatbot? chatbot) (log? log) (number? seed))
      (if (cmpName (listToLower (myString-split (string->list msg) "" '())))
          (log-setLog log (message (random seed) (actualDateTime) msg (string-append (cadddr (myString-split (string->list msg) "" '())) ". "(chatbot-getDialog chatbot chatbot-getServ (random seed))) "#C"))
          (if (cmpBuy (listToLower (myString-split (string->list msg) "" '())))
              (log-setLog log (message (random seed) (actualDateTime) msg (string-append (log-getName log) ". "(chatbot-getDialog chatbot chatbot-getSell (random seed)) (stringList (chatbot-getBrands chatbot))) "#C"))
              (if (cmpFord (listToLower (myString-split (string->list msg) "" '())))
                  (log-setLog log (message (random seed) (actualDateTime) msg (string-append (log-getName log) ". "(chatbot-getDialog chatbot chatbot-getSellB (random seed)) (stringList (chatbot-getModels "Ford" chatbot))) "#C"))
                  (if (cmpToyota (listToLower (myString-split (string->list msg) "" '())))
                      (log-setLog log (message (random seed) (actualDateTime) msg (string-append (log-getName log) ". "(chatbot-getDialog chatbot chatbot-getSellB (random seed)) (stringList (chatbot-getModels "Toyota" chatbot))) "#C"))
                      (if (cmpPeugeot (listToLower (myString-split (string->list msg) "" '())))
                          (log-setLog log (message (random seed) (actualDateTime) msg (string-append (log-getName log) ". "(chatbot-getDialog chatbot chatbot-getSellB (random seed)) (stringList (chatbot-getModels "Peugeot" chatbot))) "#C"))
                          (if (and (cmpBuyM (listToLower (myString-split (string->list msg) "" '())) (chatbot-getModels "Ford" chatbot)) (eq? "Ford" (log-getBrandMessageUser log)))
                              (log-setLog log (message (random seed) (actualDateTime) msg (string-append (log-getName log) ". " "Su compra es : Marca -> " (log-getBrandMessageUser log) " , " "Modelo -> " (getWord (myString-split (string->list msg) "" '()) (chatbot-getModels "Ford" chatbotFormal))) "#C"))
                              (if (and (cmpBuyM (listToLower (myString-split (string->list msg) "" '())) (chatbot-getModels "Toyota" chatbot)) (eq? "Toyota" (log-getBrandMessageUser log)))
                                  (log-setLog log (message (random seed) (actualDateTime) msg (string-append (log-getName log) ". " "Su compra es : Marca -> " (log-getBrandMessageUser log) " , " "Modelo -> " (getWord (myString-split (string->list msg) "" '()) (chatbot-getModels "Toyota" chatbotFormal))) "#C"))
                                  (if (and (cmpBuyM (listToLower (myString-split (string->list msg) "" '())) (chatbot-getModels "Peugeot" chatbot)) (eq? "Peugeot" (log-getBrandMessageUser log))) 
                                      (log-setLog log (message (random seed) (actualDateTime) msg (string-append (log-getName log) ". " "Su compra es : Marca -> " (log-getBrandMessageUser log) " , " "Modelo -> " (getWord (myString-split (string->list msg) "" '()) (chatbot-getModels "Peugeot" chatbotFormal))) "#C"))
                                      (if (cmpDelay (listToLower (myString-split (string->list msg) "" '())))
                                          (log-setLog log (message (random seed) (actualDateTime) msg delayedDialog "#C"))
                                          (if (and (cmpForce (listToLower (myString-split (string->list msg) "" '()))) (promise? (log-getLastMessageBot log)))
                                              (log-setLog log (message (random seed) (actualDateTime) msg ((forceDialog)) "#C"))
                                              (log-setLog log (message (random seed) (actualDateTime) msg (chatbot-getDialog chatbot chatbot-getNotU (random seed)) "#I"))
                                              )
                                          )
                                      )
                                  )
                              )
                          )
                      )
                  )
              )
          )
      (log-setLog log (message (random seed) (actualDateTime) msg (chatbot-getDialog chatbot chatbot-getNotU (random seed)) "#I"))
     )
  )

;Funcion que termina el dialogo.
;List chatbot, List log, Integer seed  -> List log.
;No hay recursión.
(define (endDialog chatbot log seed)
  (if(and (chatbot? chatbot) (verifyStart log))
     (if (log? log)
         (if (number? seed)
             (log-setLog log (message (random seed) (actualDateTime) "EndDialog" (caadr(chatbot-getBye chatbot)) "#C"))
             null
             )
         null
         )
     null
     )
  )

;Funcion que permite simular un dialogo fluido con el bot, retorna el log con dicho dialogo.
;List user (Dialogo de usuario), List chatbot, List log, Integer Seed -> List log.
;Recursion de cola.
(define (test user chatbot log seed)
  (if (and (list? user) (chatbot? chatbot) (log? log) (integer? seed))
      (if (null? user)
          log
          (if (eq? (car user) "Inicio")
              (test (cdr user) chatbot (beginDialog chatbot log seed) (+ seed 1))
              (if (eq? (car user) "Fin")
                  (test (cdr user) chatbot (endDialog chatbot log seed) (+ seed 1))
                  (test (cdr user) chatbot (sendMessage (car user) chatbot log seed) (+ seed 1))
                  )
              )
          )
      null
      )
  )

;Funcion que dada una lista log y un mensaje, retorna una lista log actualizada con el nuevo mensaje.
;List log, List msg -> List log actualizada.
;No hay recursion.
(define (log-setLog logN msg)
  (if (and (log? logN) (message? msg))
      (log (append logN (list msg)))
      logN
      )
  )

;FUNCIONES QUE OPERAN SOBRE EL TDA

;Funcion que verifica si existe un delimitador BeginDialog
;List log -> Bool #t si el log contiene el delimitador BeginDialog, #f caso en caso contrario.
;Recursion de cola.
(define (verifyStart log)
  (if (log? log)
      (if (null? log)
          #f
          (if(eq? (message-getUser (car log)) "BeginDialog")
             #t
             (verifyEnd (cdr log))
             )
          )
      #f
      )
  )

;Funcion que verifica si existe un delimitador EndDialog
;List log -> Bool #t si el log contiene el delimitador EndDialog, #f caso en caso contrario.
;Recursion de cola.
(define (verifyEnd log)
  (if (log? log)
      (if (null? log)
          #f
          (if(eq? (message-getUser (car log)) "EndDialog")
             #t
             (verifyEnd (cdr log))
             )
          )
      #f
      )
  )

;Funcion que dado un log, contabiliza las respuestas buenas por parte del bot.
;List log, Integer cont -> Integer que contiene la cantidad de respuestas buenas.
;Recursion de cola.
(define (getCorrect log cont)
  (if (log? log)
      (if (null? log)
          cont
          (if (eq? (message-getVer (car log)) "#C")
              (getCorrect (cdr log) (+ cont 1))
              (getCorrect (cdr log) cont)
              )
          )
      -1
      )
  )

;Funcion que dada las respuestas correctas contenidas en un log, entrega una nota final.
;List log -> Integer que representa la nota final del Bot.
;No hay recursion.
(define (getScore log)
  (if (and (> (getCorrect log 0) 6) (< (getCorrect log 0) 99))
      5
      (if (and (> (getCorrect log 0) 3) (<= (getCorrect log 0) 5))
          4
          (if (and (> (getCorrect log 0) 2) (<= (getCorrect log 0) 3))
              3
              (if (and (> (getCorrect log 0) 1) (<= (getCorrect log 0) 2))
                  2
                  (if (= (getCorrect log 0) 1)
                      1
                      (if (= (getCorrect log 0) 0)
                          0
                          0
                          )
                      )
                  )
              )
          )
      )
  )

;------------------------------------------------------------------------------------------------------------

;TDA chatbot
;REPRESENTACION : Lista de listas de listas.

;Lista compuesto por personalidad y vocabulario.
;1ra lista es una lista de listas, en donde se contiene la personalidad del chatbot.
     ;1ra sub-lista personalidad del chatbot.
;2da lista es una lista de listas, en donde cada lista tendra las distintas palabras y/o oraciones que tiene el bot.
     ;1ra sub-lista contiene los saludos.
     ;2da sub-lista contiene los mensajes de ayuda del Bot.
     ;3ra sub-lista contiene los mensajes de venta de las marcas de auto que posee el bot.
     ;4ta sub-lista contiene los mensajes de venta de los modelos de las marcas de auto que posee el bot.
     ;5ta sub-lista contiene el mensaje de despedida del bot.
     ;6ta sub-lista contiene los mensajes en donde el bot no logra entender lo que dice el usuario.
     ;7ma sub-lista contiene las marcas de auto que puede vender el bot.
     ;8va - 9na sub-lista contiene los distintos modelos de autos dependiendo de la marca, ordenados respectivamente segun la 7ma sub-listas
;3ra lista es una lista de listas, en donde se contienen los scores del bot.
     ;1ra sub-lista scores del bot.


;CONSTRUCTOR

;CHATBOT CON PERSONALIDAD FORMAL.
(define chatbotFormal
  '('('("Formal")) '('("Buenos días." "Buenas tardes." "Buenas noches.")'('("Bienvenido al sistema de venta de autos, ¿Cual es su nombre?" "Sea muy bienvenido, ¿Me podria facilitar su nombre?" "Bienvenido a la nueva automotora, ¿Cual es su nombre?") '("¿En que le puedo ayudar?" "¿De que manera le puedo ofrecer mi ayuda?" "Permitame ayudarle") '("En este momento puedo vender estos autos: " "Las marcas de autos disponibles en estos momentos son: " "Estas marcas de autos son las que puedo vender: ") '("Los modelos que tengo disponible son: " "Estos son los modelos disponibles: " "Los siguientes modelos estan a la venta: ") '("Ha sido un gusto ayudarlo, espero que vuelva.") '("Disculpe, ¿Lo puede decir de otra manera?" "Disculpe, no he entendido" "¿Podría expresarse de otra manera?")) '("Ford" "Toyota" "Peugeot") '("Fiesta" "Mustang" "FordRaptor") '("Yaris" "Auris" "Corolla") '("301" "2008" "206")) '(-1)))

;CHATBOT CON PERSONALIDAD COLOQUIAL.
(define chatbotColoquial
  '('('("Coloquial")) '('("Buen día." "Buena tarde." "Buenas.")'('("Bienvenido a mi tienda de autos, ¿Tu nombre?" "¿Cual es tu nombre?" "Esta es mi nueva tienda, Dime tu nombre") '("¿Te puedo ayudar?" "¿Que se te ofrece?" "Dejame ayudarte") '("Estos autos estan a la venta: " "Vendo estas marcas: " "Estas marcas vendo: ") '("Estos modelos vendo: " "Tengo estos modelos: " "Estos modelos estan a la venta: ") '("Gracias por la compra, vuelva pronto") '("No te entiendo" "Lo puedes repetir" "Dilo de otra manera, porfavor")) '("Ford" "Toyota" "Peugeot") '("Fiesta" "Mustang" "FordRaptor") '("Yaris" "Auris" "Corolla") '("301" "2008" "206")) '(-1)))

;FUNCION DE PERTENENCIA

;Funcion de pertenencia del TDA chatbot.
;List chatbot -> Bool #t si se respeta la estructrua del TDA, #f caso contrario.
;Recursion de cola.
(define (chatbot? chatbot)
   (if (list? chatbot)
      (if (null? chatbot)
          #t
          (if (= (length chatbot) 1)
              (if (allNumbers (cadar chatbot))
                  #t
                  chatbot
                  )
              (if(allStrings (cdr(car chatbot)))
                 (chatbot? (cdr chatbot))
              #f
              )
              )
          )
      null
      )
   )

;SELECTORES

;Funcion que retorna la personalidad del bot.
;List chatbot -> String con la personalidad.
;No hay recursion
(define (chatbot-getPers chatbot)
  (if (chatbot? chatbot)
      (caar(cdr(caar(cdar chatbot))))
      null
      )
  )
;Funcion que retorna el vocabulario del bot.
;List chatbot -> Lista de listas con el vocabulario.
;No hay recursion
(define (chatbot-getVoc chatbot)
  (if (chatbot? chatbot)
       (cadr(car(cdr chatbot)))
       null
       )
  )

;Funcion que retorna los scores del bot.
;List chatbot -> Lista de listas con los scores.
;No hay recursion
(define (chatbot-getScore chatbot)
  (if (chatbot? chatbot)
       (cadr(car(cddr chatbot)))
       null
       )
  )


;Funcion que retorna la funcionalidad del bot.
;List chatbot -> String con la explicacion.
;No hay recursión.
(define (chatbot-getExpl chatbot)
  (if (chatbot? chatbot)
      (caar(cdr(car(cdr(chatbot-getVoc chatbot)))))
      null
      )
  )

;Funcion que retorna la primera pregunta hacia el usuario.
;List chatbot -> String con la pregunta.
;No hay recursión.
(define (chatbot-getServ chatbot)
  (if (chatbot? chatbot)
      (cadr(car(cdr(car(cdr(chatbot-getVoc chatbot))))))
      null
      )
  )

;Funcion que retorna el mensaje de lo que puede vender el bot.
;List chatbot -> String con la respuesta.
;No hay recursión.
(define (chatbot-getSell chatbot)
  (if (chatbot? chatbot)
      (caddr(car(cdr(car(cdr(chatbot-getVoc chatbot))))))
      null
      )
  )

;Funcion que retorna el mensaje de los modeos de auto que puede vender el bot.
;List chatbot -> String con la respuesta.
;No hay recursión.
(define (chatbot-getSellB chatbot)
  (if (chatbot? chatbot)
      (cadddr(car(cdr(car(cdr(chatbot-getVoc chatbot))))))
      null
      )
  )


;Funcion que retorna el mensaje del delay.
;List chatbot -> String con el mensaje del delay.
;No hay recursión.
(define (chatbot-getBye chatbot)
  (if (chatbot? chatbot)
      (cadddr(cdr(car(cdr(car(cdr(chatbot-getVoc chatbot)))))))
      null
      )
  )

;Funcion que retorna el mensaje del force.
;List chatbot -> String con el mensaje del force.
;No hay recursión.
(define (chatbot-getNotU chatbot)
  (if (chatbot? chatbot)
      (cadddr(cddr(car(cdr(car(cdr(chatbot-getVoc chatbot)))))))
      null
      )
  )

;Funcion que retorna la marcas de autos que vende el bot.
;List chatbot -> String con las marcas.
;No hay recursión.
(define (chatbot-getBrands chatbot)
  (if (chatbot? chatbot)
      (cadr(caddr(chatbot-getVoc chatbot)))
      null
      )
  )

;Funcion que retorna los modelos de auto segun un modelo.
;List chatbot, String marca -> Lista String con modelos
;No hay recursion
(define (chatbot-getModels brand chatbot)
  (if (chatbot? chatbot)
      (if (eq? brand "Ford")
          (car(cdar(cdddr(chatbot-getVoc chatbot))))
          (if (eq? brand "Toyota")
              (car(cdar(cddddr (chatbot-getVoc chatbot))))
              (if(eq? brand "Peugeot")
                 (car(cdar(cdr(cddddr (chatbot-getVoc chatbot)))))
                 null
                 )
              )
          )
      null
      )
  )

;Funcion que dada una funcion y un numero al azar (entre 0 y 2), determina el dialogo que usara el bot.
;Integer num, Funcion f (donde se obtendra la informacion), List chatbot -> List con la informacion pedida.
;No hay recursion
(define (chatbot-getDialog chatbot f num)
  (if (number? num)
      (if (< (remainder num 10) 3)
              (if (= (remainder num 10) 0)
                  (car(cadr(f chatbot)))
                  (if (= (remainder num 10) 1)
                      (cadr(cadr(f chatbot)))
                      (if (= (remainder num 10) 2)
                          (caddr(cadr(f chatbot)))
                          0                          
                          )
                      )
                  )
              
              (if (= (remainder num 3) 0)
                  (car(cadr(f chatbot)))
                  (if (= (remainder num 3) 1)
                      (cadr(cadr(f chatbot)))
                      (if (= (remainder num 3) 2)
                          (caddr(cadr(f chatbot)))
                          null
                          )
                      )
                  )
              )
      null
      )
  )

;MODIFICADORES

;Funcion que dado un chatbot, un log y una funcion que da un puntaje (rendimiento del bot), retorna el chatbot con los nuevos valores de score.
;Chatbot chatbot, Log log, Metrica f, Integer Score -> Chatbot chatbot con la lista de score actualizada.
;No hay recursion.
(define (rate chatbot score f log)
  (if (chatbot? chatbot)
      (if (log? log)
          (if (integer? score)
              (if (verifyEnd log)
                  (if (= (car(chatbot-getScore chatbot)) -1)
                      (append (list (list (chatbot-getPers chatbot))) (list (list (chatbot-getVoc chatbot))) (list (append (list score) (list (f log)))))
                      (append (list (list (chatbot-getPers chatbot))) (list (list (chatbot-getVoc chatbot))) (list (append (chatbot-getScore chatbot) (list score) (list (f log)))))
                      )
                  chatbot
                  )
              chatbot
              )
          chatbot
          )
      null
      )
  )


;FUNCIONES QUE OPERAN SOBRE EL TDA

;Funcion que determina el saludo según la hora.
;List chatbot -> String con el saludo.
;No hay recursión.
(define (selectSl chatbot)
  (if (chatbot? chatbot)
      (if (and (>= (actualHour) 6) (< (actualHour) 12))
          (caadar (chatbot-getVoc chatbot))
          (if (and (>= (actualHour) 12) (< (actualHour) 18))
              (cadr(cadar (chatbot-getVoc chatbot)))
              (caddr(cadar(chatbot-getVoc chatbot)))
              )
          )
      null
      )
  )

;----------------------------------------------------------------------------------------------------------

;Funcion que dado un string devuelve una lista de strings que representa la palabra separada por espacio.-
;String phrase -> List de strings que contienen la informacion de phrase.
;Recursion de cola.
(define (myString-split phrase auxString outList)
  (if (list? phrase)
      (if (null? phrase)
          (append outList (list auxString))
          (if (eq? (car phrase) #\space)
              (myString-split (cdr phrase) "" (append outList (list auxString)))
              (myString-split (cdr phrase) (string-append auxString (string (car phrase))) outList)
              )
          )
      null
      )
  )

;Funcion que recibe una lista y devuelve un string con el contenido de la lista.
;List list -> String con el contenido de la lista.
;Recursion lineal.
(define (stringList list)
  (if(null? list)
     ""
     (if (= (length list) 1)
         (string-append (car list) "." (stringList (cdr list)))
         (string-append (car list) ", " (stringList (cdr list)))
         )
     )
  )

;Funcion que genera un numero aleatorio mediante una semilla.
;Integer seed -> Integer con numero random.
;No hay recursion.
(define (random seed)
  (remainder (+ (* 1103515245 seed) 12345) 2147483648)
  )

;Funcion que obtiene el dia actual.
;Void -> Integer con el dia actual.
;No hay recursión.
(define (actualDay)
  (let ((date (seconds->date (current-seconds))))
  (date-day date))
  )

;Funcion que obtiene el mes actual.
;Void -> Integer con el mes actual.
;No hay recursión.
(define (actualMonth)
  (let ((date (seconds->date (current-seconds))))
  (date-month date))
  )

;Funcion que obtiene el año actual.
;Void -> Integer con el año actual.
;No hay recursión.
(define (actualYear)
  (let ((date (seconds->date (current-seconds))))
  (date-year date))
  )

;Funcion que obtiene la fecha actual.
;Void -> String con la fecha actual.
;No hay recursión.
(define (actualDate)
  (string-append (number->string(actualDay)) "/" (number->string(actualMonth)) "/" (number->string(actualYear)))
  )

;Funcion que obtiene la hora actual.
;Void -> Integer con la hora actual.
;No hay recursión.
(define (actualHour)
  (let ((date (seconds->date (current-seconds))))
  (date-hour date))
  )

;Funcion que obtiene los minutos actuales.
;Void -> Integer con los minutos actuales.
;No hay recursión.
(define (actualMinute)
  (let ((date (seconds->date (current-seconds))))
  (date-minute date))
  )

;Funcion que obtiene los segundos actuales.
;Void -> Integer con los segundos actuales.
;No hay recursión.
(define (actualSeconds)
  (let ((date (seconds->date (current-seconds))))
  (date-second date))
  )

;Funcion que obtiene la hora completa actual.
;Void -> String con la hora completa actual.
;No hay recursión.
(define (actualTime)
  (string-append (number->string(actualHour)) ":" (number->string(actualMinute)) ":" (number->string(actualSeconds)))
  )

;Funcion que obtiene la hora y la fecha actual.
;Void -> String con la hora y fecha actual.
;No hay recursión.
(define (actualDateTime)
  (string-append (actualTime) " " "-" " " (actualDate))
  )

;Funcion que dada una lista de strings, devuelve una lista que contiene los mismos strings pero en minusculas.
;List phrase -> List con las palabras en minusculas.
;Recursion lineal.
(define (listToLower phrase)
  (if (list? phrase)
      (if (null? phrase)
          '()
          (append (list (string-downcase(car phrase))) (listToLower (cdr phrase)))
          )
      null
      )
  )

;Funcion que verifica si una lista esta compuesta por numeros.
;List lista -> Bool #t si la lista es compuesta por numeros, #f en caso contrario.
;Recursion de cola.
(define (allNumbers listSt)
  (if (list? listSt)
      (if (null? listSt)
          #t
          (if (number? (car listSt))
              (allNumbers (cdr listSt))
              #f
              )
          )
      null
      )
  )

;Funcion que verifica si una lista esta compuesta por strings.
;List lista -> Bool #t si la lista es compuesta por strings, #f en caso contrario.
;Recursion de cola.
(define (allStrings listSt)
  (if (list? listSt)
      (if (null? listSt)
          #t
          (if (string? (caar(cdr(caar listSt))))
              (allStrings (cdr listSt))
              #f
              )
          )
      null
      )
  )

;Funcion que dada una lista de strings y una palabra, verifica si dicha palabra existe en la lista.
;List phrase, String word -> Bool #t si se encuentra la palabra, #f en caso contrario.
;Recursion de cola.
(define (verifyWord phrase word)
  (if (list? phrase)
      (if (null? phrase)
          #f
          (if (string=? (car phrase) word)
              #t
              (verifyWord (cdr phrase) word)
              )
          )
      null
      )
  )

;Funcion que dada una frase y una lista de frases, entrega #t si se encuentra la frase en la lista.
;String phrase, List phraseList -> Bool #t si hay coincidencia, #f en caso contrario.
;Recursion de cola.
(define (phraseInList phrase phraseList)
  (if (and (string? phrase) (list? phraseList))
      (if (null? phraseList)
          #f
          (if (eq? phrase (car phraseList))
              #t
              (phraseInList phrase (cdr phraseList))
              )
          )
      #f
      )
  )

;Funcion que dada una lista de strings y una lista de strings, verifica si una palabra de la primera lista se encuentra en la segunda lista.
;List phrase, List wordPhrase -> Bool #t si hay coincidencia, #f en caso contrario.
;Recursion de cola.
(define (inList phrase wordPhrase)
  (if (list? phrase)
      (if (null? wordPhrase)
          #f
          (if (verifyWord phrase (car wordPhrase))
              #t
              (inList phrase (cdr wordPhrase))
              )
          )
      null
      )
  )

;Funcion que retorna el string de que la compra fue realizada exitosamente.
;NULL -> String respuesta.
;No hay recursion.
(define (confirmDialog)
  "Compra realizada exitosamente"
  )

;Funcion que provoca el delay de una funcion.
;Funcion f -> Promise de la funcion f.
;No hay recursion
(define delayedDialog
  (delay confirmDialog)
  )

;Funcion que provoca el force de una funcion.
;Funcion f -> Resultado del delay de la funcion f.
;No hay recursion
(define (forceDialog)
  (force delayedDialog)
  )

;-----------------------------------------------------------------------------------------------------------------------------------------

;Funcion que dado una frase y una lista, retorna la palabra que se encuentra en la lista.
;List phrase, List list -> String de la palabra contenia en ambas listas
;Recursion de cola.
(define (getWord phrase listN)
  (if (and (list? phrase) (list? listN))
      (if (null? phrase)
          null
          (if (inList (list (car phrase)) listN)
              (car phrase)
              (getWord (cdr phrase) listN)
              )
          )
      null
      )
  )

;Funcion que verifica si una frase esta dentro de una lista de palabras.
;List phrase -> Bool #t si la alguna palabra de la frase se encuentra en la lista dada, #f caso contrario.
;No hay recursion.
(define (cmpName phrase)
  (if (list? phrase)
      (if (and (inList phrase '("mi")) (inList phrase '("nombre")) (inList phrase '("es")))
          #t
          #f
          )
      #f
      )
  )

;Funcion que verifica si una frase esta dentro de una lista de palabras.
;List phrase -> Bool #t si la alguna palabra de la frase se encuentra en la lista dada, #f caso contrario.
;No hay recursion.
(define (cmpFord phrase)
  (if (list? phrase)
      (if (or (and (inList phrase '("quiero" "deseo")) (inList phrase '("comprar" "adquirir")) (inList phrase '("auto")) (inList phrase '("ford")))
              (and (inList phrase '("quiero" "deseo")) (inList phrase '("ford")))
              (and (inList phrase '("comprar" "adquirir")) (inList phrase '("ford"))))
          #t
          #f
          )
      #f
      )
  )

;Funcion que verifica si una frase esta dentro de una lista de palabras.
;List phrase -> Bool #t si la alguna palabra de la frase se encuentra en la lista dada, #f caso contrario.
;No hay recursion.
(define (cmpToyota phrase)
  (if (list? phrase)
      (if (or (and (inList phrase '("quiero" "deseo")) (inList phrase '("comprar" "adquirir")) (inList phrase '("auto")) (inList phrase '("toyota")))
              (and (inList phrase '("quiero" "deseo")) (inList phrase '("toyota")))
              (and (inList phrase '("comprar" "adquirir")) (inList phrase '("toyota"))))
          #t
          #f
          )
      #f
      )
  )

;Funcion que verifica si una frase esta dentro de una lista de palabras.
;List phrase -> Bool #t si la alguna palabra de la frase se encuentra en la lista dada, #f caso contrario.
;No hay recursion.
(define (cmpPeugeot phrase)
  (if (list? phrase)
      (if (or (and (inList phrase '("quiero" "deseo")) (inList phrase '("comprar" "adquirir")) (inList phrase '("auto")) (inList phrase '("peugeot")))
              (and (inList phrase '("quiero" "deseo")) (inList phrase '("peugeot")))
              (and (inList phrase '("comprar" "adquirir")) (inList phrase '("peugeot"))))
          #t
          #f
          )
      #f
      )
  )

;Funcion que verifica si una frase esta dentro de una lista de palabras entregada como parametro.
;List phrase, List list -> Bool #t si la alguna palabra de la frase se encuentra en la lista dada, #f caso contrario.
;No hay recursion.
(define (cmpBuyM phrase list)
  (if (list? phrase)
      (if (or (and (inList phrase '("quiero" "deseo")) (inList phrase '("comprar" "adquirir")) (inList phrase '("auto")) (inList phrase list))
              (and (inList phrase '("quiero" "deseo")) (inList phrase '("auto")) (inList phrase list))
              (and (inList phrase '("comprar" "adquirir")) (inList phrase (listToLower list))))
          #t
          #f
          )
      #f
      )
  )

;Funcion que verifica si una frase esta dentro de una lista de palabras.
;List phrase -> Bool #t si la alguna palabra de la frase se encuentra en la lista dada, #f caso contrario.
;No hay recursion.
(define (cmpBuy phrase)
  (if (list? phrase)
      (if (or (and (inList phrase '("quiero" "deseo")) (inList phrase '("comprar" "adquirir")) (inList phrase '("auto")) (not (inList phrase '("ford" "toyota" "peugeot"))))
              (and (inList phrase '("quiero" "deseo")) (inList phrase '("auto")) (not (inList phrase '("ford" "toyota" "peugeot"))))
              (and (inList phrase '("comprar" "adquirir")) (inList phrase '("auto")) (not (inList phrase '("ford" "toyota" "peugeot")))))
          #t
          #f
          )
      #f
      )
  )

;Funcion que verifica si una frase esta dentro de una lista de palabras.
;List phrase -> Bool #t si la alguna palabra de la frase se encuentra en la lista dada, #f caso contrario.
;No hay recursion.
(define (cmpDelay phrase)
  (if (list? phrase)
      (if (and (inList phrase '("realizar")) (inList phrase '("compra")))
          #t
          #f
          )
      #f
      )
  )

;Funcion que verifica si una frase esta dentro de una lista de palabras.
;List phrase -> Bool #t si la alguna palabra de la frase se encuentra en la lista dada, #f caso contrario.
;No hay recursion.
(define (cmpForce phrase)
  (if (list? phrase)
      (if (and (inList phrase '("forzar")) (inList phrase '("compra")))
          #t
          #f
          )
      #f
      )
  )

;---------------------------------------------------------------------------------------------------
