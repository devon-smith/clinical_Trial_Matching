;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_surgical_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a surgical procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a surgical procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a surgical procedure.","meaning":"Boolean indicating whether the patient has ever undergone a surgical procedure in the past."} ;; "surgery"
(declare-const patient_has_undergone_surgical_procedure_inthehistory@@with_general_anesthesia Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure was performed with general anesthesia.","when_to_set_to_false":"Set to false if the surgical procedure was not performed with general anesthesia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether general anesthesia was used for the surgical procedure.","meaning":"Boolean indicating whether the surgical procedure was performed with general anesthesia."} ;; "general anesthesia"
(declare-const patient_has_undergone_surgical_procedure_inthehistory@@temporalcontext_within30days_before_inclusion_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure occurred within thirty days before inclusion in the study.","when_to_set_to_false":"Set to false if the surgical procedure did not occur within thirty days before inclusion in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure occurred within thirty days before inclusion in the study.","meaning":"Boolean indicating whether the surgical procedure occurred within thirty days before inclusion in the study."} ;; "within thirty days before inclusion in the study"
(declare-const patient_has_undergone_surgical_procedure_inthehistory@@with_general_anesthesia@@temporalcontext_within30days_before_inclusion_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure with general anesthesia within thirty days before inclusion in the study.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure with general anesthesia within thirty days before inclusion in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure with general anesthesia within thirty days before inclusion in the study.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure with general anesthesia within thirty days before inclusion in the study."} ;; "previous surgery with general anesthesia within thirty days before inclusion in the study"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable (general anesthesia)
(assert
(! (=> patient_has_undergone_surgical_procedure_inthehistory@@with_general_anesthesia
       patient_has_undergone_surgical_procedure_inthehistory)
    :named REQ0_AUXILIARY0)) ;; "surgery with general anesthesia"

;; Qualifier variable implies stem variable (temporal context)
(assert
(! (=> patient_has_undergone_surgical_procedure_inthehistory@@temporalcontext_within30days_before_inclusion_in_study
       patient_has_undergone_surgical_procedure_inthehistory)
    :named REQ0_AUXILIARY1)) ;; "surgery within thirty days before inclusion in the study"

;; Double qualifier variable implies both single qualifiers
(assert
(! (=> patient_has_undergone_surgical_procedure_inthehistory@@with_general_anesthesia@@temporalcontext_within30days_before_inclusion_in_study
       (and patient_has_undergone_surgical_procedure_inthehistory@@with_general_anesthesia
            patient_has_undergone_surgical_procedure_inthehistory@@temporalcontext_within30days_before_inclusion_in_study))
    :named REQ0_AUXILIARY2)) ;; "surgery with general anesthesia within thirty days before inclusion in the study"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_surgical_procedure_inthehistory@@with_general_anesthesia@@temporalcontext_within30days_before_inclusion_in_study)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous surgery with general anesthesia within thirty days before inclusion in the study."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_anticoagulant_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing anticoagulant therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing anticoagulant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing anticoagulant therapy.","meaning":"Boolean indicating whether the patient is currently undergoing anticoagulant therapy."} ;; "anticoagulant treatment"
(declare-const patient_is_undergoing_anticoagulant_therapy_now@@curative_intent Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing anticoagulant therapy and the therapy is being administered with curative intent.","when_to_set_to_false":"Set to false if the patient is currently undergoing anticoagulant therapy but it is not with curative intent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the anticoagulant therapy is with curative intent.","meaning":"Boolean indicating whether the patient's current anticoagulant therapy is with curative intent."} ;; "requires a curative anticoagulant treatment"
(declare-const patient_is_undergoing_thrombolytic_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing thrombolytic therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing thrombolytic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing thrombolytic therapy.","meaning":"Boolean indicating whether the patient is currently undergoing thrombolytic therapy."} ;; "thrombolytic treatment"
(declare-const patient_is_undergoing_thrombolytic_therapy_now@@curative_intent Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing thrombolytic therapy and the therapy is being administered with curative intent.","when_to_set_to_false":"Set to false if the patient is currently undergoing thrombolytic therapy but it is not with curative intent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the thrombolytic therapy is with curative intent.","meaning":"Boolean indicating whether the patient's current thrombolytic therapy is with curative intent."} ;; "requires a curative thrombolytic treatment"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for curative intent implies the patient is undergoing the therapy
(assert
(! (=> patient_is_undergoing_anticoagulant_therapy_now@@curative_intent
       patient_is_undergoing_anticoagulant_therapy_now)
    :named REQ1_AUXILIARY0)) ;; "requires a curative anticoagulant treatment"

(assert
(! (=> patient_is_undergoing_thrombolytic_therapy_now@@curative_intent
       patient_is_undergoing_thrombolytic_therapy_now)
    :named REQ1_AUXILIARY1)) ;; "requires a curative thrombolytic treatment"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_undergoing_anticoagulant_therapy_now@@curative_intent)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires a curative anticoagulant treatment."

(assert
(! (not patient_is_undergoing_thrombolytic_therapy_now@@curative_intent)
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires a curative thrombolytic treatment."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_at_risk_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered at risk of bleeding.","when_to_set_to_false":"Set to false if the patient is currently not considered at risk of bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently at risk of bleeding.","meaning":"Boolean indicating whether the patient is currently at risk of bleeding."} ;; "The patient is excluded if the patient is at risk of bleeding."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_at_risk_of_bleeding_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is at risk of bleeding."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a cerebrovascular accident (stroke) at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a cerebrovascular accident (stroke) at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever had a cerebrovascular accident (stroke) in their medical history."} ;; "stroke"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_cerebrovascular_accident_inthehistory)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a stroke."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_allergy_to_heparin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy (hypersensitivity) to heparin.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy (hypersensitivity) to heparin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has allergy to heparin.","meaning":"Boolean indicating whether the patient currently has allergy to heparin."} ;; "the patient has a known hypersensitivity to heparin"
(declare-const patient_has_finding_of_allergy_to_enoxaparin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy (hypersensitivity) to enoxaparin sodium.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy (hypersensitivity) to enoxaparin sodium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has allergy to enoxaparin sodium.","meaning":"Boolean indicating whether the patient currently has allergy to enoxaparin sodium."} ;; "the patient has a known hypersensitivity to enoxaparin sodium"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_finding_of_allergy_to_heparin_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known hypersensitivity to heparin."

(assert
  (! (not patient_has_finding_of_allergy_to_enoxaparin_now)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known hypersensitivity to enoxaparin sodium."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_end_stage_renal_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of end stage renal disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of end stage renal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has end stage renal disease.","meaning":"Boolean indicating whether the patient currently has end stage renal disease."} ;; "end stage renal disease"
(declare-const patient_is_undergoing_dialysis_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing dialysis treatment.","when_to_set_to_false":"Set to false if the patient is currently not undergoing dialysis treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing dialysis treatment.","meaning":"Boolean indicating whether the patient is currently undergoing dialysis treatment."} ;; "dialysis treatment"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not (or patient_has_finding_of_end_stage_renal_disease_now
              patient_is_undergoing_dialysis_procedure_now))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has end stage renal disease) OR (the patient is on dialysis treatment)."
