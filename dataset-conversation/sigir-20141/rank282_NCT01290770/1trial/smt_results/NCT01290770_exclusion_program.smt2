;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as male or other.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "the patient is a woman"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_sex_is_female_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient is a woman."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic insufficiency (hepatic failure).","when_to_set_to_false":"Set to false if the patient currently does not have hepatic insufficiency (hepatic failure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic insufficiency (hepatic failure).","meaning":"Boolean indicating whether the patient currently has hepatic insufficiency (hepatic failure) now."} ;; "hepatic insufficiency"
(declare-const patient_has_finding_of_hepatic_failure_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hepatic insufficiency (hepatic failure) is severe.","when_to_set_to_false":"Set to false if the patient's hepatic insufficiency (hepatic failure) is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hepatic insufficiency (hepatic failure) is severe.","meaning":"Boolean indicating whether the patient's hepatic insufficiency (hepatic failure) is severe."} ;; "severe hepatic insufficiency"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hepatic_failure_now@@severe
      patient_has_finding_of_hepatic_failure_now)
:named REQ1_AUXILIARY0)) ;; "severe hepatic insufficiency"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_hepatic_failure_now@@severe)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hepatic insufficiency."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_inflammatory_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of an inflammatory disorder.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of an inflammatory disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of an inflammatory disorder.","meaning":"Boolean indicating whether the patient currently has an inflammatory disorder."} ;; "inflammatory disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_inflammatory_disorder_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an inflammatory disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has neoplastic disease (neoplasia).","when_to_set_to_false":"Set to false if the patient currently does not have neoplastic disease (neoplasia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has neoplastic disease (neoplasia).","meaning":"Boolean indicating whether the patient currently has neoplastic disease (neoplasia)."} ;; "neoplasia"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_neoplastic_disease_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has neoplasia."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_protein_s_deficiency_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of protein S deficiency.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of protein S deficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of protein S deficiency.","meaning":"Boolean indicating whether the patient currently has a diagnosis of protein S deficiency."} ;; "protein S deficiency"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_protein_s_deficiency_disease_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has protein S deficiency."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_undergone_aspirin_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone aspirin therapy at any time in the past (history).","when_to_set_to_false":"Set to false if the patient has never undergone aspirin therapy at any time in the past (history).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone aspirin therapy in the past.","meaning":"Boolean indicating whether the patient has ever undergone aspirin therapy in the past (history)."} ;; "aspirin treatment"
(declare-const patient_has_undergone_aspirin_therapy_inthehistory@@temporalcontext_within10days_before_inclusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient's aspirin therapy occurred within ten days before the inclusion event.","when_to_set_to_false":"Set to false if the patient's aspirin therapy did not occur within ten days before the inclusion event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's aspirin therapy occurred within ten days before inclusion.","meaning":"Boolean indicating whether the patient's aspirin therapy occurred within ten days before the inclusion event."} ;; "aspirin treatment within ten days before inclusion"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_aspirin_therapy_inthehistory@@temporalcontext_within10days_before_inclusion
      patient_has_undergone_aspirin_therapy_inthehistory)
   :named REQ5_AUXILIARY0)) ;; "aspirin treatment within ten days before inclusion" implies "aspirin treatment"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_undergone_aspirin_therapy_inthehistory@@temporalcontext_within10days_before_inclusion)
   :named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has received aspirin treatment within ten days before inclusion."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_exposed_to_anticoagulant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to anticoagulant substances at the time of inclusion.","when_to_set_to_false":"Set to false if the patient is not currently receiving or exposed to anticoagulant substances at the time of inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to anticoagulant substances at the time of inclusion.","meaning":"Boolean indicating whether the patient is currently exposed to anticoagulant substances."} ;; "anticoagulant"
(declare-const patient_is_exposed_to_anticoagulant_now@@oral_route Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to anticoagulant substances and the route of administration is oral.","when_to_set_to_false":"Set to false if the patient is currently exposed to anticoagulant substances but the route of administration is not oral.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the route of administration for anticoagulant exposure is oral.","meaning":"Boolean indicating whether the patient is currently exposed to anticoagulant substances via the oral route."} ;; "oral anticoagulant treatment"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_anticoagulant_now@@oral_route
      patient_is_exposed_to_anticoagulant_now)
:named REQ6_AUXILIARY0)) ;; "oral anticoagulant treatment at inclusion"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_exposed_to_anticoagulant_now@@oral_route)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving oral anticoagulant treatment at inclusion."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_receiving_heparin_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving heparin treatment at the time of inclusion.","when_to_set_to_false":"Set to false if the patient is not currently receiving heparin treatment at the time of inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving heparin treatment at the time of inclusion.","meaning":"Boolean indicating whether the patient is currently receiving heparin treatment at the time of inclusion."} ;; "the patient is receiving heparin treatment at inclusion"
(declare-const patient_is_undergoing_low_molecular_weight_heparin_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving low molecular weight heparin therapy.","when_to_set_to_false":"Set to false if the patient is not currently receiving low molecular weight heparin therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving low molecular weight heparin therapy.","meaning":"Boolean indicating whether the patient is currently undergoing low molecular weight heparin therapy."} ;; "the patient is receiving low molecular weight heparin treatment at inclusion"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not (or patient_is_receiving_heparin_treatment_now
              patient_is_undergoing_low_molecular_weight_heparin_therapy_now))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is receiving heparin treatment at inclusion) OR (the patient is receiving low molecular weight heparin treatment at inclusion)."
