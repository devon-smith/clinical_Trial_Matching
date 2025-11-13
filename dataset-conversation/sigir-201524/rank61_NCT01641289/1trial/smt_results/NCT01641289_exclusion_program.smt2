;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_able_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to give informed consent.","meaning":"Boolean indicating whether the patient is currently able to give informed consent."} ;; "the patient is unable to give informed consent"
(declare-const patient_is_willing_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently unwilling to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to give informed consent.","meaning":"Boolean indicating whether the patient is currently willing to give informed consent."} ;; "the patient is unwilling to give informed consent"
(declare-const relatives_are_able_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the relatives of the patient are currently able to give informed consent.","when_to_set_to_false":"Set to false if the relatives of the patient are currently unable to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the relatives of the patient are currently able to give informed consent.","meaning":"Boolean indicating whether the relatives of the patient are currently able to give informed consent."} ;; "the relatives of the patient are unable to give informed consent"
(declare-const relatives_are_willing_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the relatives of the patient are currently willing to give informed consent.","when_to_set_to_false":"Set to false if the relatives of the patient are currently unwilling to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the relatives of the patient are currently willing to give informed consent.","meaning":"Boolean indicating whether the relatives of the patient are currently willing to give informed consent."} ;; "the relatives of the patient are unwilling to give informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (not patient_is_able_to_give_informed_consent_now))
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is unable to give informed consent"

(assert
(! (not (not relatives_are_able_to_give_informed_consent_now))
:named REQ0_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the relatives of the patient are unable to give informed consent"

(assert
(! (not (not patient_is_willing_to_give_informed_consent_now))
:named REQ0_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is unwilling to give informed consent"

(assert
(! (not (not relatives_are_willing_to_give_informed_consent_now))
:named REQ0_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the relatives of the patient are unwilling to give informed consent"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_chronic_liver_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had chronic liver disease at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had chronic liver disease at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had chronic liver disease.","meaning":"Boolean indicating whether the patient has a history of chronic liver disease."} ;; "chronic liver disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_chronic_liver_disease_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of chronic liver disease."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const alcohol_use_average_drinks_per_day_value_recorded_in_the_history_withunit_drinks_per_day Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's average number of alcoholic drinks consumed per day, as recorded in the patient's history.","when_to_set_to_null":"Set to null if the average number of alcoholic drinks consumed per day in the patient's history is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the patient's average number of alcoholic drinks consumed per day in the history, in drinks per day."} ;; "alcohol use of more than three drinks per day"
(declare-const patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of alcohol drinking behavior at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of alcohol drinking behavior at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol drinking behavior.","meaning":"Boolean indicating whether the patient has a history of alcohol drinking behavior."} ;; "history of alcohol use"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Numeric value > 3 drinks/day implies history of alcohol drinking behavior
(assert
(! (=> (> alcohol_use_average_drinks_per_day_value_recorded_in_the_history_withunit_drinks_per_day 3)
     patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_inthehistory)
:named REQ2_AUXILIARY0)) ;; "history of alcohol use of more than three drinks per day"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (> alcohol_use_average_drinks_per_day_value_recorded_in_the_history_withunit_drinks_per_day 3))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of alcohol use of more than three drinks per day."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_contraindication_to_acetaminophen_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to acetaminophen-containing products.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to acetaminophen-containing products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to acetaminophen-containing products.","meaning":"Boolean indicating whether the patient currently has a contraindication to acetaminophen-containing products."} ;; "the patient has a contraindication to paracetamol therapy"
(declare-const patient_has_contraindication_to_artesunate_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to artesunate-containing products.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to artesunate-containing products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to artesunate-containing products.","meaning":"Boolean indicating whether the patient currently has a contraindication to artesunate-containing products."} ;; "the patient has a contraindication to artesunate therapy"
(declare-const patient_has_allergy_to_acetaminophen_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to acetaminophen-containing products.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to acetaminophen-containing products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to acetaminophen-containing products.","meaning":"Boolean indicating whether the patient currently has an allergy to acetaminophen-containing products."} ;; "the patient has an allergy to paracetamol therapy"
(declare-const patient_has_allergy_to_artesunate_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to artesunate-containing products.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to artesunate-containing products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to artesunate-containing products.","meaning":"Boolean indicating whether the patient currently has an allergy to artesunate-containing products."} ;; "the patient has an allergy to artesunate therapy"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_contraindication_to_acetaminophen_containing_product_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to paracetamol therapy."

(assert
(! (not patient_has_contraindication_to_artesunate_containing_product_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to artesunate therapy."

(assert
(! (not patient_has_allergy_to_acetaminophen_containing_product_now)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to paracetamol therapy."

(assert
(! (not patient_has_allergy_to_artesunate_containing_product_now)
:named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to artesunate therapy."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_can_undergo_insertion_of_nasogastric_tube_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo insertion of a nasogastric tube (i.e., no contraindication exists).","when_to_set_to_false":"Set to false if the patient cannot currently undergo insertion of a nasogastric tube due to any contraindication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo insertion of a nasogastric tube.","meaning":"Boolean indicating whether the patient can currently undergo insertion of a nasogastric tube."} ;; "nasogastric tube insertion"
(declare-const patient_has_contraindication_to_nasogastric_tube_insertion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication to nasogastric tube insertion (including but not limited to facial fracture or bleeding diathesis).","when_to_set_to_false":"Set to false if the patient currently has no contraindication to nasogastric tube insertion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication to nasogastric tube insertion.","meaning":"Boolean indicating whether the patient currently has any contraindication to nasogastric tube insertion."} ;; "contraindication to nasogastric tube insertion"
(declare-const patient_has_finding_of_bleeding_diathesis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a bleeding diathesis.","when_to_set_to_false":"Set to false if the patient currently does not have a bleeding diathesis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a bleeding diathesis.","meaning":"Boolean indicating whether the patient currently has a bleeding diathesis."} ;; "bleeding diathesis"
(declare-const patient_has_finding_of_facial_fracture_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a facial fracture.","when_to_set_to_false":"Set to false if the patient currently does not have a facial fracture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a facial fracture.","meaning":"Boolean indicating whether the patient currently has a facial fracture."} ;; "facial fracture"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_facial_fracture_now
           patient_has_finding_of_bleeding_diathesis_now)
       patient_has_contraindication_to_nasogastric_tube_insertion_now)
   :named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (facial fracture, bleeding diathesis)"

;; Contraindication means cannot undergo procedure
(assert
(! (= patient_can_undergo_insertion_of_nasogastric_tube_now
      (not patient_has_contraindication_to_nasogastric_tube_insertion_now))
   :named REQ4_AUXILIARY1)) ;; "contraindication to nasogastric tube insertion" means cannot undergo insertion

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_contraindication_to_nasogastric_tube_insertion_now)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to nasogastric tube insertion with non-exhaustive examples (facial fracture, bleeding diathesis)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
