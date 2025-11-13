;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_diabetic_on_insulin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus and is being treated with insulin.","when_to_set_to_false":"Set to false if the patient currently does not have diabetes mellitus treated with insulin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diabetes mellitus treated with insulin.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus treated with insulin."} ;; "diabetes mellitus treated with insulin"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_diabetic_on_insulin_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes mellitus treated with insulin."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const oocyte_donation_planned_for_patient Bool) ;; {"when_to_set_to_true":"Set to true if oocyte donation is planned for the patient.","when_to_set_to_false":"Set to false if oocyte donation is not planned for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether oocyte donation is planned for the patient.","meaning":"Boolean indicating whether oocyte donation is planned for the patient."} ;; "oocyte donation is planned for the patient"
(declare-const sperm_donation_planned_for_patient Bool) ;; {"when_to_set_to_true":"Set to true if sperm donation is planned for the patient.","when_to_set_to_false":"Set to false if sperm donation is not planned for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether sperm donation is planned for the patient.","meaning":"Boolean indicating whether sperm donation is planned for the patient."} ;; "sperm donation is planned for the patient"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not oocyte_donation_planned_for_patient)
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if oocyte donation is planned for the patient."

(assert
(! (not sperm_donation_planned_for_patient)
:named REQ1_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if sperm donation is planned for the patient."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const preimplantation_genetic_diagnosis_treatment_is_planned_for_patient Bool) ;; {"when_to_set_to_true":"Set to true if preimplantation genetic diagnosis treatment is planned for the patient.","when_to_set_to_false":"Set to false if preimplantation genetic diagnosis treatment is not planned for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether preimplantation genetic diagnosis treatment is planned for the patient.","meaning":"Boolean indicating whether preimplantation genetic diagnosis treatment is planned for the patient."} ;; "preimplantation genetic diagnosis treatment is planned for the patient"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not preimplantation_genetic_diagnosis_treatment_is_planned_for_patient)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if preimplantation genetic diagnosis treatment is planned for the patient."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_azoospermia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of azoospermia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of azoospermia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has azoospermia.","meaning":"Boolean indicating whether the patient currently has azoospermia."} ;; "azoospermia"
(declare-const patient_has_finding_of_azoospermia_now@@known_at_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current azoospermia is known at the time of randomization.","when_to_set_to_false":"Set to false if the patient's current azoospermia is not known at the time of randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current azoospermia is known at randomization.","meaning":"Boolean indicating whether the patient's current azoospermia is known at randomization."} ;; "azoospermia known at randomization"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_azoospermia_now@@known_at_randomization
      patient_has_finding_of_azoospermia_now)
   :named REQ3_AUXILIARY0)) ;; "azoospermia known at randomization" implies "azoospermia"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_azoospermia_now@@known_at_randomization)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has azoospermia known at randomization."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_adequate_knowledge_of_swedish_to_understand_patient_information_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has adequate knowledge of Swedish to understand patient information.","when_to_set_to_false":"Set to false if the patient currently does not have adequate knowledge of Swedish to understand patient information.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has adequate knowledge of Swedish to understand patient information.","meaning":"Boolean indicating whether the patient currently has adequate knowledge of Swedish to understand patient information."} ;; "adequate knowledge of Swedish to understand patient information"
(declare-const patient_has_adequate_knowledge_of_swedish_to_understand_questionnaires_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has adequate knowledge of Swedish to understand questionnaires.","when_to_set_to_false":"Set to false if the patient currently does not have adequate knowledge of Swedish to understand questionnaires.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has adequate knowledge of Swedish to understand questionnaires.","meaning":"Boolean indicating whether the patient currently has adequate knowledge of Swedish to understand questionnaires."} ;; "adequate knowledge of Swedish to understand questionnaires"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or (not patient_has_adequate_knowledge_of_swedish_to_understand_patient_information_now)
            (not patient_has_adequate_knowledge_of_swedish_to_understand_questionnaires_now)))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT have adequate knowledge of Swedish to understand patient information OR the patient does NOT have adequate knowledge of Swedish to understand questionnaires."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_binge_eating_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the index patient currently has the clinical finding of binge eating disorder.","when_to_set_to_false":"Set to false if the index patient currently does not have the clinical finding of binge eating disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the index patient currently has binge eating disorder.","meaning":"Boolean indicating whether the index patient currently has binge eating disorder."} ;; "binge eating disorder"

(declare-const patient_has_finding_of_binge_eating_disorder_now@@indicated_by_questionnaire_on_eating_and_weight_patterns_revised Bool) ;; {"when_to_set_to_true":"Set to true if the index patient's binge eating disorder is indicated by the Questionnaire on Eating and Weight Patterns-Revised questionnaire.","when_to_set_to_false":"Set to false if the index patient's binge eating disorder is not indicated by the Questionnaire on Eating and Weight Patterns-Revised questionnaire.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Questionnaire on Eating and Weight Patterns-Revised questionnaire indicates binge eating disorder for the index patient.","meaning":"Boolean indicating whether the index patient's binge eating disorder is indicated by the Questionnaire on Eating and Weight Patterns-Revised questionnaire."} ;; "Questionnaire on Eating and Weight Patterns-Revised questionnaire indicates binge eating disorder"

(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is female."} ;; "for the woman"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_binge_eating_disorder_now@@indicated_by_questionnaire_on_eating_and_weight_patterns_revised
       patient_has_finding_of_binge_eating_disorder_now)
   :named REQ5_AUXILIARY0)) ;; "Questionnaire on Eating and Weight Patterns-Revised questionnaire indicates binge eating disorder"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and patient_has_finding_of_binge_eating_disorder_now@@indicated_by_questionnaire_on_eating_and_weight_patterns_revised
             patient_sex_is_female_now))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the Questionnaire on Eating and Weight Patterns-Revised questionnaire indicates binge eating disorder for the woman."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_previous_participation_in_the_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated in the study.","when_to_set_to_false":"Set to false if the patient has not previously participated in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated in the study.","meaning":"Boolean indicating whether the patient has previously participated in the study."} ;; "previous participation in the study"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_previous_participation_in_the_study)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous participation in the study."
