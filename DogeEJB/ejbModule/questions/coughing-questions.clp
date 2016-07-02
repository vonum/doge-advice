(batch "templates/templates.clp")

(deffacts questions
    (question (for-symptom gornji-trakt) (text "Da li se promene uocavaju u gornjem traktu?"))
    (question (for-symptom donji-trakt) (text "Da li se promene uocavaju u donjem traktu?"))
	(question (for-symptom grkljan-nos) (text "Da li se promene uocavaju od grkljana do nosa?"))
    (question (for-symptom grkljan) (text "Da li se promene uocavaju na grkljanu?"))
    (question (for-symptom dusnik) (text "Da li se promene uocavaju na dusniku?"))
    
    (question (for-symptom upala-sluzokoze-nos) (text "Da li se uocava upala sluzokoze u nosu?"))
    (question (for-symptom strano-telo-nos) (text "Da li se uocava strano telo u nosu?"))
    (question (for-symptom tumor-nos) (text "Da li se uocava izrastaj u nosnoj supljini?"))
    (question (for-symptom crvenilo-krajnici) (text "Da li se uocava crvenilo u predelu krajnika?"))
    (question (for-symptom oteceni-krajnici) (text "Da li su krajnici oteceni?"))
    (question (for-symptom bol-krajnici) (text "Da li pas oseca bol pri dodiru krajnika?"))
    
    (question (for-symptom strano-telo-grkljan) (text "Da li se uocava strano telo na grkljanu?"))
    (question (for-symptom crvenilo-grkljan) (text "Da li se uocavam crvenilo u predelu grkljana?"))
    (question (for-symptom otecen-grkljan) (text "Da li je grkljan otecen?"))
    (question (for-symptom bol-grkljan) (text "Da li pas oseca bol pri dodiru u predelu grkljana?"))
    (question (for-symptom tumor-grkljan) (text "Da li se uocava izrastaj na grkljanu?"))
)