;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_refuses_to_provide_consent_to_participate_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient refuses to provide consent to participate in the study.","when_to_set_to_false":"Set to false if the patient does not refuse to provide consent to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient refuses to provide consent to participate in the study.","meaning":"Boolean indicating whether the patient refuses to provide consent to participate in the study."} ;; "the patient refuses to provide consent to participate in the study."
(declare-const legal_representative_refuses_to_provide_consent_to_participate_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the legal representative of the patient refuses to provide consent to participate in the study.","when_to_set_to_false":"Set to false if the legal representative of the patient does not refuse to provide consent to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the legal representative of the patient refuses to provide consent to participate in the study.","meaning":"Boolean indicating whether the legal representative of the patient refuses to provide consent to participate in the study."} ;; "the legal representative of the patient refuses to provide consent to participate in the study."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_refuses_to_provide_consent_to_participate_in_study)
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient refuses to provide consent to participate in the study."

(assert
(! (not legal_representative_refuses_to_provide_consent_to_participate_in_study)
:named REQ0_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the legal representative of the patient refuses to provide consent to participate in the study."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_fracture_of_bone_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of bone fractures the patient currently has, if this information is available now.","when_to_set_to_null":"Set to null if the number of bone fractures is unknown, not documented, or cannot be determined at this time.","meaning":"Numeric count of bone fractures the patient currently has."} ;; "number of fractures > 1"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (> patient_fracture_of_bone_value_recorded_now_withunit_count 1))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has more than one fracture (number of fractures > 1)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (malignancy)."} ;; "malignancy"
(declare-const patient_has_suspicion_of_pathological_fracture_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected of having a pathological fracture.","when_to_set_to_false":"Set to false if the patient is currently not suspected of having a pathological fracture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected of having a pathological fracture.","meaning":"Boolean indicating whether the patient is currently suspected of having a pathological fracture."} ;; "pathological fracture"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient is suspected of having a pathological fracture in the context of known malignancy
(assert
(! (not (and patient_has_suspicion_of_pathological_fracture_now
             patient_has_diagnosis_of_malignant_neoplastic_disease_now))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suspected of having a pathological fracture in the context of known malignancy."

;; Exclusion: patient is suspected of having a pathological fracture in the context of unknown malignancy
(assert
(! (not (and patient_has_suspicion_of_pathological_fracture_now
             (not patient_has_diagnosis_of_malignant_neoplastic_disease_now)))
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suspected of having a pathological fracture in the context of unknown malignancy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_surgical_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone any surgical procedure in the past (at any time before now).","when_to_set_to_false":"Set to false if the patient has never undergone any surgical procedure in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone any surgical procedure in the past.","meaning":"Boolean indicating whether the patient has ever undergone a surgical procedure in the past."} ;; "surgery"
(declare-const patient_has_undergone_surgical_procedure_inthehistory@@of_proximal_femur_on_same_side Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure was performed on the proximal femur on the same side as the current context.","when_to_set_to_false":"Set to false if the surgical procedure was not performed on the proximal femur on the same side as the current context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure was performed on the proximal femur on the same side.","meaning":"Boolean indicating whether the surgical procedure was performed on the proximal femur on the same side as the current context."} ;; "previous surgery of the proximal femur on the same side"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_surgical_procedure_inthehistory@@of_proximal_femur_on_same_side
      patient_has_undergone_surgical_procedure_inthehistory)
:named REQ3_AUXILIARY0)) ;; "previous surgery of the proximal femur on the same side" implies "surgery"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_surgical_procedure_inthehistory@@of_proximal_femur_on_same_side)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous surgery of the proximal femur on the same side."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_follow_up_is_possible Bool) ;; {"when_to_set_to_true":"Set to true if follow-up is possible for the patient (i.e., the patient can be contacted and monitored for follow-up as required by the study or protocol).","when_to_set_to_false":"Set to false if follow-up is not possible for the patient (e.g., the patient is a tourist or otherwise cannot be contacted or monitored for follow-up).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether follow-up is possible for the patient.","meaning":"Boolean indicating whether follow-up is possible for the patient."} ;; "follow-up is not possible for the patient (e.g., the patient is a tourist)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_follow_up_is_possible)
:named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if follow-up is not possible for the patient with non-exhaustive examples (the patient is a tourist)."
