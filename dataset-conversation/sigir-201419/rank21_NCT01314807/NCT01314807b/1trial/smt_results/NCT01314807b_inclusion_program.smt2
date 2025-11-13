;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 40 years AND age ≤ 80 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 40)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≥ 40 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 80)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≤ 80 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease."} // "chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@diagnosis_determined_by_spirometry Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of chronic obstructive pulmonary disease is determined by spirometry.","when_to_set_to_false":"Set to false if the patient's diagnosis of chronic obstructive pulmonary disease is not determined by spirometry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether spirometry was used to determine the diagnosis of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient's diagnosis of chronic obstructive pulmonary disease is determined by spirometry."} // "as determined by spirometry"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@diagnosis_determined_by_spirometry
         patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
     :named REQ1_AUXILIARY0)) ;; "as determined by spirometry" implies "chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must NOT have chronic obstructive pulmonary disease as determined by spirometry
(assert
  (! (not patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@diagnosis_determined_by_spirometry)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must NOT have chronic obstructive pulmonary disease (as determined by spirometry)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_pack_years_of_smoking_value_recorded_in_the_history_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the total number of pack-years of smoking in the patient's history, recorded in pack-years.","when_to_set_to_null":"Set to null if the total number of pack-years of smoking in the patient's history is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total number of pack-years of smoking in the patient's history, in pack-years."} // "history of smoking of ≥ 10 pack-years"
(declare-const patient_has_finding_of_smoker_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient was an active smoker at any point in their history.","when_to_set_to_false":"Set to false if the patient was never an active smoker at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was an active smoker at any point in their history.","meaning":"Boolean indicating whether the patient was an active smoker at any point in their history."} // "active smoker at any point in their history"
(declare-const patient_has_finding_of_smoker_inthehistory@@active_until_within_10_years_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient was an active smoker at any point in their history and remained an active smoker until at least within 10 years prior to the moment of enrollment.","when_to_set_to_false":"Set to false if the patient was an active smoker in the past but did not remain an active smoker until at least within 10 years prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient remained an active smoker until at least within 10 years prior to enrollment.","meaning":"Boolean indicating whether the patient was an active smoker at any point in their history and remained an active smoker until at least within 10 years prior to enrollment."} // "active smoker until at least within 10 years prior to the moment of enrollment"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_smoker_inthehistory@@active_until_within_10_years_prior_to_enrollment
         patient_has_finding_of_smoker_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "active smoker until at least within 10 years prior to the moment of enrollment" implies "active smoker at any point in their history"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: history of smoking of ≥ 10 pack-years
(assert
  (! (>= patient_pack_years_of_smoking_value_recorded_in_the_history_withunit_pack_years 10.0)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "history of smoking of ≥ 10 pack-years"

;; Component 1: active smoker until at least within 10 years prior to the moment of enrollment
(assert
  (! patient_has_finding_of_smoker_inthehistory@@active_until_within_10_years_prior_to_enrollment
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "active smoker until at least within 10 years prior to the moment of enrollment"
