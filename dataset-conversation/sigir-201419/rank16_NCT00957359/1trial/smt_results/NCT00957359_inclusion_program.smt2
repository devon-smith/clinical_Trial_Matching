;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years old AND aged ≤ 76 years old"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years old."

(assert
  (! (<= patient_age_value_recorded_now_in_years 76)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 76 years old."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."} // "current diagnosis of cancer"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of malignant neoplastic disease (cancer) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of malignant neoplastic disease (cancer) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplastic disease (cancer) in the past."} // "historical diagnosis of cancer"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_has_diagnosis_of_malignant_neoplastic_disease_now
         patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (a current diagnosis of cancer OR a historical diagnosis of cancer)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_inthefuture_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's projected life expectancy in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's projected life expectancy in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's projected life expectancy in years."} // "projected life expectancy ≥ 1 year"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_age_value_recorded_inthefuture_in_years 1.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a projected life expectancy ≥ 1 year."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_acute_stress_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute stress disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute stress disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute stress disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute stress disorder."} // "diagnosis ... of acute stress disorder"
(declare-const patient_has_diagnosis_of_acute_stress_disorder_now@@diagnosed_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of acute stress disorder is made according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's diagnosis of acute stress disorder is not made according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of acute stress disorder is made according to DSM-IV.","meaning":"Boolean indicating whether the patient's diagnosis of acute stress disorder is made according to DSM-IV."} // "diagnosis ... of acute stress disorder ... according to DSM-IV"
(declare-const patient_has_diagnosis_of_generalized_anxiety_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of generalized anxiety disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of generalized anxiety disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of generalized anxiety disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of generalized anxiety disorder."} // "diagnosis ... of generalized anxiety disorder"
(declare-const patient_has_diagnosis_of_generalized_anxiety_disorder_now@@diagnosed_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of generalized anxiety disorder is made according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's diagnosis of generalized anxiety disorder is not made according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of generalized anxiety disorder is made according to DSM-IV.","meaning":"Boolean indicating whether the patient's diagnosis of generalized anxiety disorder is made according to DSM-IV."} // "diagnosis ... of generalized anxiety disorder ... according to DSM-IV"
(declare-const patient_has_diagnosis_of_anxiety_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of anxiety disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of anxiety disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of anxiety disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of anxiety disorder."} // "diagnosis ... of anxiety disorder"
(declare-const patient_has_diagnosis_of_anxiety_disorder_now@@diagnosed_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of anxiety disorder is made according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's diagnosis of anxiety disorder is not made according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of anxiety disorder is made according to DSM-IV.","meaning":"Boolean indicating whether the patient's diagnosis of anxiety disorder is made according to DSM-IV."} // "diagnosis ... of anxiety disorder ... according to DSM-IV"
(declare-const patient_has_diagnosis_of_anxiety_disorder_now@@due_to_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the patient's anxiety disorder is due to cancer.","when_to_set_to_false":"Set to false if the patient's anxiety disorder is not due to cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the anxiety disorder is due to cancer.","meaning":"Boolean indicating whether the patient's anxiety disorder is due to cancer."} // "diagnosis ... of anxiety disorder due to cancer"
(declare-const patient_has_diagnosis_of_adjustment_disorder_with_anxious_mood_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of adjustment disorder with anxious features.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of adjustment disorder with anxious features.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of adjustment disorder with anxious features.","meaning":"Boolean indicating whether the patient currently has a diagnosis of adjustment disorder with anxious features."} // "diagnosis ... of adjustment disorder with anxious features"
(declare-const patient_has_diagnosis_of_adjustment_disorder_with_anxious_mood_now@@diagnosed_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of adjustment disorder with anxious features is made according to DSM-IV.","when_to_set_to_false":"Set to false if the patient's diagnosis of adjustment disorder with anxious features is not made according to DSM-IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of adjustment disorder with anxious features is made according to DSM-IV.","meaning":"Boolean indicating whether the patient's diagnosis of adjustment disorder with anxious features is made according to DSM-IV."} // "diagnosis ... of adjustment disorder with anxious features ... according to DSM-IV"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_acute_stress_disorder_now@@diagnosed_according_to_dsm_iv
         patient_has_diagnosis_of_acute_stress_disorder_now)
     :named REQ3_AUXILIARY0)) ;; "diagnosis ... of acute stress disorder ... according to DSM-IV"

(assert
  (! (=> patient_has_diagnosis_of_generalized_anxiety_disorder_now@@diagnosed_according_to_dsm_iv
         patient_has_diagnosis_of_generalized_anxiety_disorder_now)
     :named REQ3_AUXILIARY1)) ;; "diagnosis ... of generalized anxiety disorder ... according to DSM-IV"

(assert
  (! (=> patient_has_diagnosis_of_anxiety_disorder_now@@diagnosed_according_to_dsm_iv
         patient_has_diagnosis_of_anxiety_disorder_now)
     :named REQ3_AUXILIARY2)) ;; "diagnosis ... of anxiety disorder ... according to DSM-IV"

(assert
  (! (=> patient_has_diagnosis_of_adjustment_disorder_with_anxious_mood_now@@diagnosed_according_to_dsm_iv
         patient_has_diagnosis_of_adjustment_disorder_with_anxious_mood_now)
     :named REQ3_AUXILIARY3)) ;; "diagnosis ... of adjustment disorder with anxious features ... according to DSM-IV"

;; Anxiety disorder due to cancer: both DSM-IV diagnosis and due to cancer
(define-fun patient_has_diagnosis_of_anxiety_disorder_due_to_cancer_now@@diagnosed_according_to_dsm_iv () Bool
  (and patient_has_diagnosis_of_anxiety_disorder_now@@diagnosed_according_to_dsm_iv
       patient_has_diagnosis_of_anxiety_disorder_now@@due_to_cancer)) ;; "diagnosis ... of anxiety disorder due to cancer ... according to DSM-IV"

;; ===================== Constraint Assertions (REQ 3) =====================
;; At least one of the following DSM-IV diagnoses must be present:
;; - acute stress disorder
;; - generalized anxiety disorder
;; - anxiety disorder due to cancer
;; - adjustment disorder with anxious features
(assert
  (! (or patient_has_diagnosis_of_acute_stress_disorder_now@@diagnosed_according_to_dsm_iv
         patient_has_diagnosis_of_generalized_anxiety_disorder_now@@diagnosed_according_to_dsm_iv
         patient_has_diagnosis_of_anxiety_disorder_due_to_cancer_now@@diagnosed_according_to_dsm_iv
         patient_has_diagnosis_of_adjustment_disorder_with_anxious_mood_now@@diagnosed_according_to_dsm_iv)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "diagnosis according to DSM-IV of acute stress disorder OR ... generalized anxiety disorder OR ... anxiety disorder due to cancer OR ... adjustment disorder with anxious features"

;; ===================== Declarations for the criterion (REQ 4) =====================
;; No new variable declarations needed; all required variables are already declared.

;; ===================== Constraint Assertions (REQ 4) =====================
;; "To be included, the patient must have any stage of cancer diagnosis."
(assert
  (! (or patient_has_diagnosis_of_malignant_neoplastic_disease_now
         patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have any stage of cancer diagnosis."
