;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_respiratory_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a respiratory illness.","when_to_set_to_false":"Set to false if the patient currently does not have a respiratory illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a respiratory illness.","meaning":"Boolean indicating whether the patient currently has a respiratory illness."} ;; "respiratory illness"

(declare-const patient_has_finding_of_respiratory_illness_now@@not_chronic_obstructive_pulmonary_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current respiratory illness is not chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient's current respiratory illness is chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current respiratory illness is chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient's current respiratory illness is not chronic obstructive pulmonary disease."} ;; "respiratory illness (that is NOT chronic obstructive pulmonary disease)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_respiratory_illness_now@@not_chronic_obstructive_pulmonary_disease
      patient_has_finding_of_respiratory_illness_now)
   :named REQ0_AUXILIARY0)) ;; "respiratory illness (that is NOT chronic obstructive pulmonary disease)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_respiratory_illness_now@@not_chronic_obstructive_pulmonary_disease)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a respiratory illness (that is NOT chronic obstructive pulmonary disease)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_chronic_infectious_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic infectious disease.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic infectious disease.","meaning":"Boolean indicating whether the patient currently has a chronic infectious disease."} ;; "chronic infectious process"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_chronic_infectious_disease_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a chronic infectious process."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any illness.","when_to_set_to_false":"Set to false if the patient currently does not have any illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any illness.","meaning":"Boolean indicating whether the patient currently has any illness."} ;; "illness"
(declare-const patient_has_finding_of_illness_now@@is_other_medical_illness Bool) ;; {"when_to_set_to_true":"Set to true if the illness present is an 'other medical illness' (not the primary condition under study).","when_to_set_to_false":"Set to false if the illness present is not an 'other medical illness'.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the illness present is an 'other medical illness'.","meaning":"Boolean indicating whether the illness present is an 'other medical illness' (not the primary condition under study)."} ;; "other medical illness"
(declare-const patient_has_finding_of_illness_now@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the illness present is significant.","when_to_set_to_false":"Set to false if the illness present is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the illness present is significant.","meaning":"Boolean indicating whether the illness present is significant."} ;; "significant"
(declare-const patient_has_finding_of_other_medical_illness_now@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another medical illness (not the primary condition under study) and the illness is significant.","when_to_set_to_false":"Set to false if the patient currently does not have another medical illness, or the illness present is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another medical illness and whether it is significant.","meaning":"Boolean indicating whether the patient currently has another medical illness (not the primary condition under study) and the illness is significant."} ;; "significant other medical illness"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; The presence of a significant other medical illness is defined as having an illness that is both 'other medical illness' and 'significant'
(assert
(! (= patient_has_finding_of_other_medical_illness_now@@is_significant
     (and patient_has_finding_of_illness_now@@is_other_medical_illness
          patient_has_finding_of_illness_now@@is_significant))
:named REQ2_AUXILIARY0)) ;; "significant other medical illness"

;; Qualifier variables imply the stem variable
(assert
(! (=> patient_has_finding_of_illness_now@@is_other_medical_illness
       patient_has_finding_of_illness_now)
:named REQ2_AUXILIARY1)) ;; "other medical illness" implies "illness"

(assert
(! (=> patient_has_finding_of_illness_now@@is_significant
       patient_has_finding_of_illness_now)
:named REQ2_AUXILIARY2)) ;; "significant" implies "illness"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_other_medical_illness_now@@is_significant)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant other medical illness."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_able_to_provide_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide consent.","meaning":"Boolean indicating whether the patient is currently able to provide consent."} ;; "unable to provide consent"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_able_to_provide_consent_now)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to provide consent."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
