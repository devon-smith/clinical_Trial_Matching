;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_taking_metformin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently prescribed or taking any metformin-containing product.","when_to_set_to_false":"Set to false if the patient is not currently prescribed or taking any metformin-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently prescribed or taking any metformin-containing product.","meaning":"Boolean indicating whether the patient is currently prescribed or taking any metformin-containing product."} ;; "currently prescribed metformin"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_taking_metformin_containing_product_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently prescribed metformin."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal impairment (renal dysfunction).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal impairment (renal dysfunction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal impairment (renal dysfunction).","meaning":"Boolean indicating whether the patient currently has renal impairment (renal dysfunction)."} ;; "renal dysfunction"
(declare-const patient_has_finding_of_decreased_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of decreased liver function (liver dysfunction).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of decreased liver function (liver dysfunction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has decreased liver function (liver dysfunction).","meaning":"Boolean indicating whether the patient currently has decreased liver function (liver dysfunction)."} ;; "liver dysfunction"
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "heart failure"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of malignant neoplastic disease (malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of malignant neoplastic disease (malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient currently has malignant neoplastic disease (malignancy)."} ;; "malignancy"
(declare-const patient_is_able_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to give informed consent.","meaning":"Boolean indicating whether the patient is currently able to give informed consent."} ;; "unable to give informed consent"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_renal_impairment_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal dysfunction."

(assert
(! (not patient_has_finding_of_decreased_liver_function_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has liver dysfunction."

(assert
(! (not patient_has_finding_of_heart_failure_now)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart failure."

(assert
(! (not patient_has_finding_of_malignant_neoplastic_disease_now)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignancy."

(assert
(! (not (not patient_is_able_to_give_informed_consent_now))
:named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to give informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_can_undergo_cardiac_mri_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo cardiac magnetic resonance imaging (cardiac MRI) without contraindications.","when_to_set_to_false":"Set to false if the patient cannot currently undergo cardiac magnetic resonance imaging (cardiac MRI) due to contraindications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo cardiac magnetic resonance imaging (cardiac MRI).","meaning":"Boolean indicating whether the patient can currently undergo cardiac magnetic resonance imaging (cardiac MRI)."} ;; "cardiac magnetic resonance imaging"

(declare-const patient_has_implanted_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an implanted pacemaker device.","when_to_set_to_false":"Set to false if the patient currently does not have an implanted pacemaker device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an implanted pacemaker device.","meaning":"Boolean indicating whether the patient currently has an implanted pacemaker device."} ;; "pacemakers"

(declare-const patient_has_finding_of_claustrophobia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of claustrophobia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of claustrophobia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of claustrophobia.","meaning":"Boolean indicating whether the patient currently has the clinical finding of claustrophobia."} ;; "claustrophobia"

(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply contraindication to cardiac MRI
(assert
(! (=> (or patient_has_implanted_pacemaker_now
           patient_has_finding_of_claustrophobia_now)
        (not patient_can_undergo_cardiac_mri_now))
    :named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (pacemakers, claustrophobia)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: contraindications to cardiac MRI, pregnancy, or lactation
(assert
(! (not (or (not patient_can_undergo_cardiac_mri_now)
            patient_is_pregnant_now
            patient_is_lactating_now))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has contraindications to cardiac magnetic resonance imaging with non-exhaustive examples (pacemakers, claustrophobia)) OR (the patient is pregnant) OR (the patient is lactating)."
