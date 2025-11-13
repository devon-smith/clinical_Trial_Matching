;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_allergic_rhinitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with allergic rhinitis.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with allergic rhinitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with allergic rhinitis.","meaning":"Boolean indicating whether the patient is currently diagnosed with allergic rhinitis."} ;; "the patient is diagnosed with allergic rhinitis"
(declare-const patient_has_diagnosis_of_bacterial_respiratory_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with bacterial respiratory tract infection.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with bacterial respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with bacterial respiratory tract infection.","meaning":"Boolean indicating whether the patient is currently diagnosed with bacterial respiratory tract infection."} ;; "the patient is diagnosed with bacterial respiratory tract infection"
(declare-const patient_has_diagnosis_of_chronic_nasosinusitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with chronic nasosinusitis.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with chronic nasosinusitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with chronic nasosinusitis.","meaning":"Boolean indicating whether the patient is currently diagnosed with chronic nasosinusitis."} ;; "the patient is diagnosed with chronic nasosinusitis"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_diagnosis_of_allergic_rhinitis_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is diagnosed with allergic rhinitis."

(assert
  (! (not patient_has_diagnosis_of_chronic_nasosinusitis_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is diagnosed with chronic nasosinusitis."

(assert
  (! (not patient_has_diagnosis_of_bacterial_respiratory_infection_now)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is diagnosed with bacterial respiratory tract infection."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_disorder_of_respiratory_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with a disorder of the respiratory system.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with a disorder of the respiratory system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with a disorder of the respiratory system.","meaning":"Boolean indicating whether the patient is currently diagnosed with a disorder of the respiratory system."} ;; "respiratory disease"
(declare-const patient_has_diagnosis_of_disorder_of_respiratory_system_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with a disorder of the respiratory system and the disorder is severe.","when_to_set_to_false":"Set to false if the patient is currently diagnosed with a disorder of the respiratory system and the disorder is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder of the respiratory system is severe.","meaning":"Boolean indicating whether the disorder of the respiratory system is severe."} ;; "severe respiratory disease"
(declare-const patient_has_diagnosis_of_systemic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with a systemic disease.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with a systemic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with a systemic disease.","meaning":"Boolean indicating whether the patient is currently diagnosed with a systemic disease."} ;; "systemic disease"
(declare-const patient_has_diagnosis_of_systemic_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with a systemic disease and the disease is severe.","when_to_set_to_false":"Set to false if the patient is currently diagnosed with a systemic disease and the disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the systemic disease is severe.","meaning":"Boolean indicating whether the systemic disease is severe."} ;; "severe systemic disease"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable for respiratory system
(assert
(! (=> patient_has_diagnosis_of_disorder_of_respiratory_system_now@@severe
      patient_has_diagnosis_of_disorder_of_respiratory_system_now)
:named REQ1_AUXILIARY0)) ;; "severe respiratory disease" implies "respiratory disease"

;; Qualifier variable implies corresponding stem variable for systemic disease
(assert
(! (=> patient_has_diagnosis_of_systemic_disease_now@@severe
      patient_has_diagnosis_of_systemic_disease_now)
:named REQ1_AUXILIARY1)) ;; "severe systemic disease" implies "systemic disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_respiratory_system_now@@severe)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is diagnosed with severe respiratory disease."

(assert
(! (not patient_has_diagnosis_of_systemic_disease_now@@severe)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is diagnosed with other severe systemic disease."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_allergy_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to any drug or medicament.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to any drug or medicament.","meaning":"Boolean indicating whether the patient currently has an allergy to any drug or medicament."} ;; "the patient is allergic to any drug"
(declare-const patient_has_allergy_to_drug_or_medicament_now@@drug_has_constraints_that_it_is_to_be_tested Bool) ;; {"when_to_set_to_true":"Set to true if the allergy is to a drug or medicament that is to be tested in the study.","when_to_set_to_false":"Set to false if the allergy is not to a drug or medicament that is to be tested in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy is to a drug or medicament that is to be tested in the study.","meaning":"Boolean indicating whether the allergy is to a drug or medicament that is to be tested in the study."} ;; "the patient is allergic to any drug to be tested"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_allergy_to_drug_or_medicament_now@@drug_has_constraints_that_it_is_to_be_tested
      patient_has_allergy_to_drug_or_medicament_now)
:named REQ2_AUXILIARY0)) ;; "allergy to any drug to be tested" implies "allergy to any drug"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_allergy_to_drug_or_medicament_now@@drug_has_constraints_that_it_is_to_be_tested)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is allergic to any drug to be tested."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_non_cooperative_during_examination_session Bool) ;; {"when_to_set_to_true":"Set to true if the patient is non-cooperative during the examination session.","when_to_set_to_false":"Set to false if the patient is cooperative during the examination session.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is non-cooperative during the examination session.","meaning":"Boolean indicating whether the patient is non-cooperative during the examination session."} ;; "the patient is non-cooperative during examination session"
(declare-const patient_is_non_cooperative_during_other_step_of_the_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient is non-cooperative during any other step of the trial (excluding the examination session).","when_to_set_to_false":"Set to false if the patient is cooperative during all other steps of the trial (excluding the examination session).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is non-cooperative during any other step of the trial.","meaning":"Boolean indicating whether the patient is non-cooperative during any other step of the trial (excluding the examination session)."} ;; "the patient is non-cooperative during other step of the trial"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_non_cooperative_during_examination_session)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is non-cooperative during examination session."

(assert
(! (not patient_is_non_cooperative_during_other_step_of_the_trial)
:named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is non-cooperative during other step of the trial."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_able_to_sign_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to sign consent.","when_to_set_to_false":"Set to false if the patient is currently not able to sign consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to sign consent.","meaning":"Boolean indicating whether the patient is currently able to sign consent."} ;; "the patient is not able to sign consent"
(declare-const patient_refuses_to_sign_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently refuses to sign consent.","when_to_set_to_false":"Set to false if the patient currently does not refuse to sign consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently refuses to sign consent.","meaning":"Boolean indicating whether the patient currently refuses to sign consent."} ;; "the patient refuses to sign consent"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (not patient_is_able_to_sign_consent_now))
    :named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is not able to sign consent."

(assert
(! (not patient_refuses_to_sign_consent_now)
    :named REQ4_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient refuses to sign consent."
