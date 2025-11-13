;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_sleep_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a sleep disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a sleep disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a sleep disorder.","meaning":"Boolean indicating whether the patient currently has a sleep disorder."} ;; "sleep disorder"
(declare-const patient_has_finding_of_sleep_disorder_now@@diagnosable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sleep disorder is diagnosable.","when_to_set_to_false":"Set to false if the patient's current sleep disorder is not diagnosable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current sleep disorder is diagnosable.","meaning":"Boolean indicating whether the patient's current sleep disorder is diagnosable."} ;; "diagnosable sleep disorder"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_sleep_disorder_now@@diagnosable
      patient_has_finding_of_sleep_disorder_now)
   :named REQ0_AUXILIARY0)) ;; "diagnosable sleep disorder"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_sleep_disorder_now@@diagnosable)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosable sleep disorder."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have a medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medical condition.","meaning":"Boolean indicating whether the patient currently has a medical condition."} ;; "medical condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@could_influence_sleep Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current medical condition could influence sleep.","when_to_set_to_false":"Set to false if the patient's current medical condition could not influence sleep.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current medical condition could influence sleep.","meaning":"Boolean indicating whether the patient's current medical condition could influence sleep."} ;; "medical condition that could influence sleep"
(declare-const patient_has_finding_of_disease_condition_finding_now@@could_influence_weight Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current medical condition could influence weight.","when_to_set_to_false":"Set to false if the patient's current medical condition could not influence weight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current medical condition could influence weight.","meaning":"Boolean indicating whether the patient's current medical condition could influence weight."} ;; "medical condition that could influence weight"
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric condition.","when_to_set_to_false":"Set to false if the patient currently does not have a psychiatric condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a psychiatric condition.","meaning":"Boolean indicating whether the patient currently has a psychiatric condition."} ;; "psychiatric condition"
(declare-const patient_has_finding_of_mental_disorder_now@@could_influence_sleep Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current psychiatric condition could influence sleep.","when_to_set_to_false":"Set to false if the patient's current psychiatric condition could not influence sleep.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current psychiatric condition could influence sleep.","meaning":"Boolean indicating whether the patient's current psychiatric condition could influence sleep."} ;; "psychiatric condition that could influence sleep"
(declare-const patient_has_finding_of_mental_disorder_now@@could_influence_weight Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current psychiatric condition could influence weight.","when_to_set_to_false":"Set to false if the patient's current psychiatric condition could not influence weight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current psychiatric condition could influence weight.","meaning":"Boolean indicating whether the patient's current psychiatric condition could influence weight."} ;; "psychiatric condition that could influence weight"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@could_influence_sleep
      patient_has_finding_of_disease_condition_finding_now)
:named REQ1_AUXILIARY0)) ;; "medical condition that could influence sleep"

(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@could_influence_weight
      patient_has_finding_of_disease_condition_finding_now)
:named REQ1_AUXILIARY1)) ;; "medical condition that could influence weight"

(assert
(! (=> patient_has_finding_of_mental_disorder_now@@could_influence_sleep
      patient_has_finding_of_mental_disorder_now)
:named REQ1_AUXILIARY2)) ;; "psychiatric condition that could influence sleep"

(assert
(! (=> patient_has_finding_of_mental_disorder_now@@could_influence_weight
      patient_has_finding_of_mental_disorder_now)
:named REQ1_AUXILIARY3)) ;; "psychiatric condition that could influence weight"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@could_influence_sleep)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a medical condition that could influence sleep."

(assert
(! (not patient_has_finding_of_mental_disorder_now@@could_influence_sleep)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a psychiatric condition that could influence sleep."

(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@could_influence_weight)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a medical condition that could influence weight."

(assert
(! (not patient_has_finding_of_mental_disorder_now@@could_influence_weight)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a psychiatric condition that could influence weight."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_menarche_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had onset of menarche (i.e., has begun menstruation) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had onset of menarche at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had onset of menarche.","meaning":"Boolean indicating whether the patient has ever had onset of menarche (i.e., begun menstruation) at any point in their history."} ;; "has had onset of menarche"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_menarche_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had onset of menarche."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disability.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disability.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disability."} ;; "disability"

(declare-const patient_is_unable_to_complete_study_materials_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to complete study materials for the study.","when_to_set_to_false":"Set to false if the patient is currently able to complete study materials for the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to complete study materials for the study.","meaning":"Boolean indicating whether the patient is currently unable to complete study materials for the study."} ;; "unable to complete study materials"

(declare-const patient_is_unable_to_complete_study_materials_now@@including_due_to_diagnosed_disability Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to complete study materials is due to a diagnosed disability.","when_to_set_to_false":"Set to false if the patient's inability to complete study materials is not due to a diagnosed disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to complete study materials is due to a diagnosed disability.","meaning":"Boolean indicating whether the patient's inability to complete study materials is due to a diagnosed disability."} ;; "including due to diagnosed disability"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_unable_to_complete_study_materials_now@@including_due_to_diagnosed_disability
     patient_is_unable_to_complete_study_materials_now)
:named REQ3_AUXILIARY0)) ;; "including due to diagnosed disability"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_unable_to_complete_study_materials_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to complete study materials, including due to diagnosed disability."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_dietary_restriction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a dietary restriction.","when_to_set_to_false":"Set to false if the patient currently does not have a dietary restriction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a dietary restriction.","meaning":"Boolean indicating whether the patient currently has a dietary restriction."} ;; "dietary restriction"
(declare-const patient_has_finding_of_dietary_restriction_now@@precludes_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dietary restriction precludes study participation.","when_to_set_to_false":"Set to false if the patient's dietary restriction does not preclude study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dietary restriction precludes study participation.","meaning":"Boolean indicating whether the patient's dietary restriction precludes study participation."} ;; "dietary restriction that precludes the patient from study participation"
(declare-const patient_has_finding_of_allergy_to_food_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to food.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to food.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to food.","meaning":"Boolean indicating whether the patient currently has an allergy to food."} ;; "allergy to food"
(declare-const patient_has_finding_of_allergy_to_food_now@@to_food_used_in_the_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to food is specifically to food used in the study.","when_to_set_to_false":"Set to false if the patient's allergy to food is not to food used in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to food is to food used in the study.","meaning":"Boolean indicating whether the patient's allergy to food is to food used in the study."} ;; "allergy to food used in the study"
(declare-const patient_has_finding_of_allergy_to_food_now@@precludes_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to food precludes study participation.","when_to_set_to_false":"Set to false if the patient's allergy to food does not preclude study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to food precludes study participation.","meaning":"Boolean indicating whether the patient's allergy to food precludes study participation."} ;; "allergy to food used in the study that precludes the patient from study participation"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable for dietary restriction
(assert
(! (=> patient_has_finding_of_dietary_restriction_now@@precludes_study_participation
     patient_has_finding_of_dietary_restriction_now)
:named REQ4_AUXILIARY0)) ;; "dietary restriction that precludes the patient from study participation"

;; Qualifier variable implies corresponding stem variable for allergy to food
(assert
(! (=> patient_has_finding_of_allergy_to_food_now@@to_food_used_in_the_study
     patient_has_finding_of_allergy_to_food_now)
:named REQ4_AUXILIARY1)) ;; "allergy to food used in the study"

;; Qualifier variable implies corresponding stem variable for allergy to food precluding participation
(assert
(! (=> patient_has_finding_of_allergy_to_food_now@@precludes_study_participation
     patient_has_finding_of_allergy_to_food_now@@to_food_used_in_the_study)
:named REQ4_AUXILIARY2)) ;; "allergy to food used in the study that precludes the patient from study participation"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: dietary restriction that precludes study participation
(assert
(! (not patient_has_finding_of_dietary_restriction_now@@precludes_study_participation)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dietary restriction that precludes the patient from study participation."

;; Exclusion: allergy to food used in the study that precludes study participation
(assert
(! (not patient_has_finding_of_allergy_to_food_now@@precludes_study_participation)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to food used in the study that precludes the patient from study participation."
