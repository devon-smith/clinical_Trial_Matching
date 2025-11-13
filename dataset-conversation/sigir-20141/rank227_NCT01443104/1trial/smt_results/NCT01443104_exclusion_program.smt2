;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_intolerance_to_aspirin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known intolerance to aspirin.","when_to_set_to_false":"Set to false if the patient currently does not have a known intolerance to aspirin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known intolerance to aspirin.","meaning":"Boolean indicating whether the patient currently has a known intolerance to aspirin."} ;; "the patient has a known intolerance to aspirin"
(declare-const patient_has_intolerance_to_clopidogrel_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known intolerance to clopidogrel.","when_to_set_to_false":"Set to false if the patient currently does not have a known intolerance to clopidogrel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known intolerance to clopidogrel.","meaning":"Boolean indicating whether the patient currently has a known intolerance to clopidogrel."} ;; "the patient has a known intolerance to clopidogrel"
(declare-const patient_has_intolerance_to_heparin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known intolerance to heparin.","when_to_set_to_false":"Set to false if the patient currently does not have a known intolerance to heparin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known intolerance to heparin.","meaning":"Boolean indicating whether the patient currently has a known intolerance to heparin."} ;; "the patient has a known intolerance to heparin"
(declare-const patient_has_intolerance_to_stainless_steel_material_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known intolerance to stainless steel.","when_to_set_to_false":"Set to false if the patient currently does not have a known intolerance to stainless steel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known intolerance to stainless steel.","meaning":"Boolean indicating whether the patient currently has a known intolerance to stainless steel."} ;; "the patient has a known intolerance to stainless steel"
(declare-const patient_has_intolerance_to_sirolimus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known intolerance to sirolimus.","when_to_set_to_false":"Set to false if the patient currently does not have a known intolerance to sirolimus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known intolerance to sirolimus.","meaning":"Boolean indicating whether the patient currently has a known intolerance to sirolimus."} ;; "the patient has a known intolerance to sirolimus"
(declare-const patient_has_intolerance_to_everolimus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known intolerance to everolimus.","when_to_set_to_false":"Set to false if the patient currently does not have a known intolerance to everolimus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known intolerance to everolimus.","meaning":"Boolean indicating whether the patient currently has a known intolerance to everolimus."} ;; "the patient has a known intolerance to everolimus"
(declare-const patient_has_intolerance_to_contrast_media_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known intolerance to contrast material.","when_to_set_to_false":"Set to false if the patient currently does not have a known intolerance to contrast material.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known intolerance to contrast material.","meaning":"Boolean indicating whether the patient currently has a known intolerance to contrast material."} ;; "the patient has a known intolerance to contrast material"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_intolerance_to_aspirin_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known intolerance to aspirin."

(assert
(! (not patient_has_intolerance_to_clopidogrel_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known intolerance to clopidogrel."

(assert
(! (not patient_has_intolerance_to_heparin_now)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known intolerance to heparin."

(assert
(! (not patient_has_intolerance_to_stainless_steel_material_now)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known intolerance to stainless steel."

(assert
(! (not patient_has_intolerance_to_sirolimus_now)
:named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known intolerance to sirolimus."

(assert
(! (not patient_has_intolerance_to_everolimus_now)
:named REQ1_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known intolerance to everolimus."

(assert
(! (not patient_has_intolerance_to_contrast_media_now)
:named REQ1_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known intolerance to contrast material."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_able_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide informed consent."} ;; "The patient is unable to provide informed consent."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_able_to_provide_informed_consent_now)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to provide informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_currently_participating_in_another_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in and actively participating in another clinical trial.","when_to_set_to_false":"Set to false if the patient is not currently enrolled in or participating in another clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in another clinical trial.","meaning":"Boolean indicating whether the patient is currently participating in another clinical trial."} ;; "the patient is currently participating in another trial"
(declare-const patient_has_reached_first_endpoint Bool) ;; {"when_to_set_to_true":"Set to true if the patient has reached the first endpoint as defined by the study protocol.","when_to_set_to_false":"Set to false if the patient has not reached the first endpoint as defined by the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has reached the first endpoint.","meaning":"Boolean indicating whether the patient has reached the first endpoint as defined in the context of the study."} ;; "the patient has NOT reached the first endpoint"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (and patient_is_currently_participating_in_another_trial
             (not patient_has_reached_first_endpoint)))
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently participating in another trial AND the patient has NOT reached the first endpoint."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const dual_antiplatelet_therapy_is_maintained_throughout_peri_surgical_period Bool) ;; {"when_to_set_to_true":"Set to true if dual antiplatelet therapy is maintained throughout the peri-surgical period.","when_to_set_to_false":"Set to false if dual antiplatelet therapy is not maintained throughout the peri-surgical period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether dual antiplatelet therapy is maintained throughout the peri-surgical period.","meaning":"Boolean indicating whether dual antiplatelet therapy is maintained throughout the peri-surgical period."} ;; "dual antiplatelet therapy is maintained throughout the peri-surgical period"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a percutaneous coronary intervention at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a percutaneous coronary intervention in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a percutaneous coronary intervention in the past.","meaning":"Boolean indicating whether the patient has undergone a percutaneous coronary intervention in the past."} ;; "percutaneous coronary intervention"
(declare-const patient_will_undergo_surgical_procedure_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo a surgical procedure at any point in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo any surgical procedure in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled for a future surgical procedure.","meaning":"Boolean indicating whether the patient is scheduled to undergo a surgical procedure in the future."} ;; "surgery"
(declare-const patient_will_undergo_surgical_procedure_inthefuture@@temporalcontext_within6months_after_percutaneous_coronary_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the scheduled future surgical procedure is to occur within six months after the patient has undergone a percutaneous coronary intervention.","when_to_set_to_false":"Set to false if the scheduled future surgical procedure is not within six months after percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scheduled future surgical procedure is within six months after percutaneous coronary intervention.","meaning":"Boolean indicating whether the scheduled future surgical procedure is within six months after percutaneous coronary intervention."} ;; "planned surgery within six months of percutaneous coronary intervention"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_will_undergo_surgical_procedure_inthefuture@@temporalcontext_within6months_after_percutaneous_coronary_intervention
      patient_will_undergo_surgical_procedure_inthefuture)
:named REQ4_AUXILIARY0)) ;; "planned surgery within six months of percutaneous coronary intervention"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have planned surgery within six months of PCI AND dual antiplatelet therapy NOT maintained
(assert
(! (not (and patient_will_undergo_surgical_procedure_inthefuture@@temporalcontext_within6months_after_percutaneous_coronary_intervention
             (not dual_antiplatelet_therapy_is_maintained_throughout_peri_surgical_period)))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has planned surgery within six months of percutaneous coronary intervention) AND (dual antiplatelet therapy is NOT maintained throughout the peri-surgical period)."
