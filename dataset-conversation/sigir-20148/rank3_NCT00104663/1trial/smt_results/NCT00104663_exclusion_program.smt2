;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_coma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in a coma.","when_to_set_to_false":"Set to false if the patient is currently not in a coma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in a coma.","meaning":"Boolean indicating whether the patient is currently in a coma."} ;; "coma"

(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease.","when_to_set_to_false":"Set to false if the patient currently does not have a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease.","meaning":"Boolean indicating whether the patient currently has a disease."} ;; "disease"

(declare-const patient_has_finding_of_disease_now@@in_pre_terminal_phase Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease and the disease is in a pre-terminal phase.","when_to_set_to_false":"Set to false if the patient currently has a disease but it is not in a pre-terminal phase.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease is in a pre-terminal phase.","meaning":"Boolean indicating whether the patient's current disease is in a pre-terminal phase."} ;; "pre-terminal phase of disease"

(declare-const prolongation_of_current_quality_of_life_would_be_supported Bool) ;; {"when_to_set_to_true":"Set to true if prolongation of the patient's current quality of life would be supported.","when_to_set_to_false":"Set to false if prolongation of the patient's current quality of life would NOT be supported.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether prolongation of the patient's current quality of life would be supported.","meaning":"Boolean indicating whether prolongation of the patient's current quality of life would be supported."} ;; "prolongation of the current quality of life would NOT be supported"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_now@@in_pre_terminal_phase
       patient_has_finding_of_disease_now)
   :named REQ0_AUXILIARY0)) ;; "pre-terminal phase of disease"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient is in a coma OR (patient is in a pre-terminal phase of disease AND prolongation of the current quality of life would NOT be supported)
(assert
(! (not (or patient_has_finding_of_coma_now
            (and patient_has_finding_of_disease_now@@in_pre_terminal_phase
                 (not prolongation_of_current_quality_of_life_would_be_supported))))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is in a coma) OR (the patient is in a pre-terminal phase of disease AND prolongation of the current quality of life would NOT be supported)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_allergy_to_quinacrine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to quinacrine.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to quinacrine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to quinacrine.","meaning":"Boolean indicating whether the patient currently has an allergy to quinacrine."} ;; "sensitivity to quinacrine"
(declare-const patient_has_finding_of_allergy_to_quinacrine_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to quinacrine is known (documented or established).","when_to_set_to_false":"Set to false if the patient's allergy to quinacrine is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to quinacrine is known.","meaning":"Boolean indicating whether the patient's allergy to quinacrine is known (documented or established)."} ;; "known sensitivity to quinacrine"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_allergy_to_quinacrine_now@@known
      patient_has_finding_of_allergy_to_quinacrine_now)
   :named REQ1_AUXILIARY0)) ;; "known sensitivity to quinacrine"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_allergy_to_quinacrine_now@@known)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known sensitivity to quinacrine."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const duration_of_other_putative_anti_prion_therapy_taken_in_the_history_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks the patient has taken any other putative anti-prion therapy in the history.","when_to_set_to_null":"Set to null if the duration in weeks is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the total duration, in weeks, that the patient has taken any other putative anti-prion therapy in the history."} ;; "duration ... for less than eight weeks"
(declare-const patient_has_taken_other_putative_anti_prion_therapy_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any other putative anti-prion therapy at any time in the history.","when_to_set_to_false":"Set to false if the patient has never taken any other putative anti-prion therapy in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any other putative anti-prion therapy in the history.","meaning":"Boolean indicating whether the patient has taken any other putative anti-prion therapy at any time in the history."} ;; "has been taking any other putative anti-prion therapy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and patient_has_taken_other_putative_anti_prion_therapy_in_the_history
             (< duration_of_other_putative_anti_prion_therapy_taken_in_the_history_in_weeks 8)))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been taking any other putative anti-prion therapy for less than eight weeks."
