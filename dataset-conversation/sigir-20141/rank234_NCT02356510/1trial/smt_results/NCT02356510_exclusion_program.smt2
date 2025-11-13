;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_finding_of_lesion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of lesion.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of lesion.","meaning":"Boolean indicating whether the patient currently has a clinical finding of lesion."} ;; "lesion"
(declare-const patient_has_finding_of_finding_of_lesion_now@@anatomical_location_left_main_coronary_artery Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current lesion is located in the left main coronary artery.","when_to_set_to_false":"Set to false if the patient's current lesion is not located in the left main coronary artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion is located in the left main coronary artery.","meaning":"Boolean indicating whether the patient's current lesion is located in the left main coronary artery."} ;; "left main coronary artery lesion"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_finding_of_lesion_now@@anatomical_location_left_main_coronary_artery
      patient_has_finding_of_finding_of_lesion_now)
:named REQ0_AUXILIARY0)) ;; "Boolean clinical finding indicating whether the patient currently has a lesion, and the lesion is located in the left main coronary artery."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_finding_of_lesion_now@@anatomical_location_left_main_coronary_artery)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a left main coronary artery lesion."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_cardiogenic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiogenic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiogenic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cardiogenic shock.","meaning":"Boolean indicating whether the patient currently has cardiogenic shock."} ;; "cardiogenic shock"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_cardiogenic_shock_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiogenic shock."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a coronary artery bypass graft operation at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a coronary artery bypass graft operation at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a coronary artery bypass graft operation.","meaning":"Boolean indicating whether the patient has ever undergone a coronary artery bypass graft operation at any time in the past."} ;; "coronary artery bypass graft operation"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a previous coronary artery bypass graft operation."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@decision_for_procedure_occurred_after_primary_percutaneous_coronary_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the decision for the patient to undergo CABG occurred after the patient's primary percutaneous coronary intervention (PCI).","when_to_set_to_false":"Set to false if the decision for CABG did not occur after primary PCI (i.e., it occurred before or there was no primary PCI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the decision for CABG occurred after primary PCI.","meaning":"Boolean indicating whether the decision for CABG occurred after the patient's primary percutaneous coronary intervention (PCI)."} ;; "decision for coronary artery bypass graft operation after primary percutaneous coronary intervention"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@decision_for_procedure_occurred_after_primary_percutaneous_coronary_intervention)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a decision for coronary artery bypass graft operation after primary percutaneous coronary intervention."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a heart valve disorder (valvular disease).","when_to_set_to_false":"Set to false if the patient currently does not have a heart valve disorder (valvular disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a heart valve disorder (valvular disease).","meaning":"Boolean indicating whether the patient currently has a heart valve disorder (valvular disease) now."} ;; "valvular disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a heart valve disorder (valvular disease) and the disorder is severe.","when_to_set_to_false":"Set to false if the patient currently has a heart valve disorder (valvular disease) but the disorder is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the heart valve disorder (valvular disease) is severe.","meaning":"Boolean indicating whether the patient's current heart valve disorder (valvular disease) is severe."} ;; "severe valvular disease"

(declare-const patient_has_finding_of_aortic_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of aortic stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of aortic stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of aortic stenosis.","meaning":"Boolean indicating whether the patient currently has a clinical finding of aortic stenosis."} ;; "aortic stenosis"
(declare-const patient_has_finding_of_mitral_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of mitral insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of mitral insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of mitral insufficiency.","meaning":"Boolean indicating whether the patient currently has a clinical finding of mitral insufficiency."} ;; "mitral insufficiency"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_aortic_stenosis_now
          patient_has_finding_of_mitral_insufficiency_now)
     patient_has_finding_of_heart_valve_disorder_now@@severity_severe)
:named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (aortic stenosis, mitral insufficiency)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@severity_severe
       patient_has_finding_of_heart_valve_disorder_now)
:named REQ4_AUXILIARY1)) ;; "severe valvular disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_heart_valve_disorder_now@@severity_severe)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe valvular disease with non-exhaustive examples (aortic stenosis, mitral insufficiency)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of kidney disease.","meaning":"Boolean indicating whether the patient currently has kidney disease."} ;; "kidney disease"
(declare-const patient_has_finding_of_kidney_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has kidney disease and the disease is severe.","when_to_set_to_false":"Set to false if the patient currently has kidney disease but the disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's kidney disease is severe.","meaning":"Boolean indicating whether the patient's current kidney disease is severe."} ;; "severe kidney disease"
(declare-const patient_is_on_maintenance_hemodialysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently on maintenance hemodialysis.","when_to_set_to_false":"Set to false if the patient is not currently on maintenance hemodialysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently on maintenance hemodialysis.","meaning":"Boolean indicating whether the patient is currently on maintenance hemodialysis."} ;; "is on maintenance hemodialysis"
(declare-const serum_creatinine_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the patient's current serum creatinine value in mg/dl if available.","when_to_set_to_null":"Set to null if the patient's current serum creatinine value in mg/dl is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current serum creatinine in mg/dl."} ;; "serum creatinine > 2.5 mg/dl"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: severe kidney disease = (serum creatinine > 2.5 mg/dl) OR (is on maintenance hemodialysis)
(assert
(! (= patient_has_finding_of_kidney_disease_now@@severe
     (or (> serum_creatinine_value_recorded_now_withunit_mg_per_dl 2.5)
         patient_is_on_maintenance_hemodialysis_now))
:named REQ5_AUXILIARY0)) ;; "severe kidney disease defined as (serum creatinine > 2.5 mg/dl) OR (is on maintenance hemodialysis)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_kidney_disease_now@@severe
       patient_has_finding_of_kidney_disease_now)
:named REQ5_AUXILIARY1)) ;; "severe kidney disease" implies "kidney disease"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_kidney_disease_now@@severe)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has severe kidney disease defined as (serum creatinine > 2.5 mg/dl) OR (is on maintenance hemodialysis)"

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_rejected_percutaneous_coronary_intervention_second_procedure_after_index_event Bool) ;; {"when_to_set_to_true":"Set to true if the patient has rejected a second percutaneous coronary intervention procedure after the index event.","when_to_set_to_false":"Set to false if the patient has not rejected a second percutaneous coronary intervention procedure after the index event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has rejected a second percutaneous coronary intervention procedure after the index event.","meaning":"Boolean indicating whether the patient has rejected a second percutaneous coronary intervention procedure after the index event."} ;; "rejects a second percutaneous coronary intervention after the index event"

(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has at any time in the past undergone a percutaneous coronary intervention procedure.","when_to_set_to_false":"Set to false if the patient has never undergone a percutaneous coronary intervention procedure in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a percutaneous coronary intervention procedure.","meaning":"Boolean indicating whether the patient has ever undergone a percutaneous coronary intervention procedure in the past."} ;; "percutaneous coronary intervention"

(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@second_procedure_after_index_event Bool) ;; {"when_to_set_to_true":"Set to true if the percutaneous coronary intervention procedure referenced is the second such procedure performed after the index event.","when_to_set_to_false":"Set to false if the percutaneous coronary intervention procedure referenced is not the second such procedure after the index event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is the second after the index event.","meaning":"Boolean indicating whether the percutaneous coronary intervention procedure is the second such procedure after the index event."} ;; "second percutaneous coronary intervention after the index event"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@second_procedure_after_index_event
      patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
:named REQ6_AUXILIARY0)) ;; "second percutaneous coronary intervention after the index event" implies "percutaneous coronary intervention in the history"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_rejected_percutaneous_coronary_intervention_second_procedure_after_index_event)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient rejects a second percutaneous coronary intervention after the index event."
