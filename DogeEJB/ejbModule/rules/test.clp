(import socket.client.ClientMessenger)

(deftemplate diagnosis
	(slot name (type STRING))
    (slot user (type STRING))
)

(deftemplate symptom
    (declare (backchain-reactive TRUE))
	(slot name (type STRING))
    (slot value (allowed-values TRUE FALSE))
    (slot user (type STRING))    
)

(deftemplate question
    (slot for-symptom (type STRING))
    (slot text (type STRING))
)

(deffacts questions
	(question (for-symptom has-puppies) (text "Does the dog have puppies?"))   
    (question (for-symptom puppies-young) (text "Are the puppies young?")) 
    (question (for-symptom aggressive-when-puppies-approached) (text "Is the dog aggressive when the puppies are approached?")) 
    (question (for-symptom aggressive-when-associated-with-pain) (text "Is the dog aggressive when associated with pain(needles, cutting nails)?"))  
    (question (for-symptom owner-approached) (text "Is the dog aggressive when the owner is approached by someone?"))
    (question (for-symptom owner-present) (text "Is the dog aggressive when the owner is present?"))
    (question (for-symptom towards-strangers) (text "Is the dog aggressive towards strangers?"))
    (question (for-symptom barks) (text "Does the dog bark?"))
    (question (for-symptom rushes-forward) (text "Does the dog rush forward after seeing strangers?"))
    (question (for-symptom bares-teeth) (text "Does the dog bare teeth?"))
    (question (for-symptom towards-dogs) (text "Is the dog aggressive towards other dogs?"))
    (question (for-symptom approached) (text "Is the dog aggressive when approached?"))
    (question (for-symptom eyes-wide-open) (text "Are his eyes wide open?"))
    (question (for-symptom tail-tucked) (text "Is his tail tucked?"))
    (question (for-symptom head-down) (text "Is his head down?"))
    (question (for-symptom resents-reaching-towards) (text "Does the dog resent reaching towards?"))
    (question (for-symptom approaching-food) (text "Is the dog aggressive when reaching for his food?"))
    (question (for-symptom head-up) (text "Is his head up?"))
    (question (for-symptom tail-up) (text "Is his tail up?"))
)

(defrule ask-question
   ?var <- (need-symptom (name ?name) (user ?u))
   (question (for-symptom ?name) (text ?text))
   (not(diagnosis (user ?u)))
    =>
   (store ?u ?var)
   (call ?bridge sendMessage (str-cat "question:" ?u ":" ?text))
   ;(printout t ?text crlf)
 	;(assert(symptom(name ?name) (value (read t)) (user ?u)))   
)

(defrule fear-induced
	(symptom (name approached) (value TRUE) (user ?u))
    (or (symptom (name head-down) (value TRUE) (user ?u))
        (symptom (name tail-tucked) (value TRUE) (user ?u))
        (symptom (name eyes-wide-open) (value TRUE) (user ?u))
    )    
    =>
    (assert(diagnosis (name fear-induced-aggression) (user ?u)))   
)

(defrule dominance-related
	(symptom (name resents-reaching-towards) (value TRUE) (user ?u))
    (symptom (name approaching-food) (value TRUE) (user ?u))
        (or (symptom (name head-up) (value TRUE) (user ?u))
    	(symptom (name tail-up) (value TRUE) (user ?u))    
    )     
    =>
    (assert (diagnosis (name dominance-related-aggression) (user ?u)))  
)

(reset)

(bind ?bridge (fetch "bridge"))

(printout t "radi engine" crlf)

(call ?bridge sendMessage "plswork")

(printout t "poslali smo poruku" crlf)