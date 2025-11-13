;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "older than seventy-five years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (> patient_age_value_recorded_now_in_years 75))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is older than seventy-five years of age."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const months_since_most_recent_cerebral_ischemic_attack_value_recorded_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient's most recent cerebral ischemic attack, recorded in months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months have passed since the patient's most recent cerebral ischemic attack.","meaning":"Numeric value indicating the number of months since the patient's most recent cerebral ischemic attack, in months."} ;; "within the past six months"
(declare-const patient_has_history_of_cerebral_ischemic_attack_within_past_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebral ischemic attack that occurred within the past six months.","when_to_set_to_false":"Set to false if the patient has not had a cerebral ischemic attack within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebral ischemic attack within the past six months.","meaning":"Boolean indicating whether the patient has had a cerebral ischemic attack within the past six months."} ;; "has had a cerebral ischemic attack within the past six months"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: Boolean variable is true iff months since attack is less than or equal to 6
(assert
(! (= patient_has_history_of_cerebral_ischemic_attack_within_past_6_months
     (<= months_since_most_recent_cerebral_ischemic_attack_value_recorded_in_months 6))
:named REQ2_AUXILIARY0)) ;; "has had a cerebral ischemic attack within the past six months"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_history_of_cerebral_ischemic_attack_within_past_6_months)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a cerebral ischemic attack within the past six months."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has malignant neoplastic disease (cancer)."} ;; "cancer"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malignant neoplastic disease (cancer) and the disease is active.","when_to_set_to_false":"Set to false if the patient currently has malignant neoplastic disease (cancer) but the disease is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant neoplastic disease (cancer) is active.","meaning":"Boolean indicating whether the patient's malignant neoplastic disease (cancer) is active."} ;; "active cancer"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable (active) implies the stem variable (malignant neoplastic disease)
(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@active
       patient_has_finding_of_malignant_neoplastic_disease_now)
   :named REQ3_AUXILIARY0)) ;; "active cancer" implies "cancer"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_malignant_neoplastic_disease_now@@active)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active cancer."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_able_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide informed consent."} ;; "The patient is excluded if the patient is unable to provide informed consent."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_able_to_provide_informed_consent_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to provide informed consent."
