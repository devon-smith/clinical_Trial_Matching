;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is younger than seven years old OR the patient is older than thirteen years old"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (< patient_age_value_recorded_now_in_years 7))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than seven years old."

(assert
  (! (not (> patient_age_value_recorded_now_in_years 13))
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is older than thirteen years old."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic disease.","meaning":"Boolean indicating whether the patient currently has a chronic disease."} ;; "chronic illness"
(declare-const patient_has_finding_of_chronic_disease_now@@is_known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic disease is known (documented or established in the medical record).","when_to_set_to_false":"Set to false if the patient's chronic disease is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic disease is known.","meaning":"Boolean indicating whether the patient's chronic disease is known (documented or established)."} ;; "known chronic illness"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_chronic_disease_now@@is_known
      patient_has_finding_of_chronic_disease_now)
:named REQ1_AUXILIARY0)) ;; "known chronic illness"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_chronic_disease_now@@is_known)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known chronic illness."
