;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_acute_coronary_syndrome_presentation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute coronary syndrome presentation.","when_to_set_to_false":"Set to false if the patient currently does not have an acute coronary syndrome presentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute coronary syndrome presentation.","meaning":"Boolean indicating whether the patient currently has an acute coronary syndrome presentation."} ;; "acute coronary syndrome presentation"

(declare-const patients_segment_deviation_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ST segment deviation is currently abnormal (present).","when_to_set_to_false":"Set to false if the patient's ST segment deviation is currently normal (absent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ST segment deviation is currently abnormal.","meaning":"Boolean indicating whether the patient's ST segment deviation is currently abnormal."} ;; "ST segment deviation"

(declare-const patients_segment_deviation_is_abnormal_now@@detected_on_electrocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal ST segment deviation is detected on electrocardiogram.","when_to_set_to_false":"Set to false if the patient's abnormal ST segment deviation is not detected on electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal ST segment deviation is detected on electrocardiogram.","meaning":"Boolean indicating whether the patient's abnormal ST segment deviation is detected on electrocardiogram."} ;; "ST segment deviation on electrocardiogram"

(declare-const patients_troponin_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's troponin is currently abnormal (elevated).","when_to_set_to_false":"Set to false if the patient's troponin is currently normal (not elevated).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's troponin is currently abnormal.","meaning":"Boolean indicating whether the patient's troponin is currently abnormal (elevated)."} ;; "cardiac troponin elevation"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: acute coronary syndrome presentation = (ST segment deviation on electrocardiogram) OR (cardiac troponin elevation)
(assert
(! (= patient_has_acute_coronary_syndrome_presentation_now
     (or patients_segment_deviation_is_abnormal_now@@detected_on_electrocardiogram
         patients_troponin_is_abnormal_now))
:named REQ0_AUXILIARY0)) ;; "defined as ((ST segment deviation on electrocardiogram) OR (cardiac troponin elevation))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patients_segment_deviation_is_abnormal_now@@detected_on_electrocardiogram
       patients_segment_deviation_is_abnormal_now)
:named REQ0_AUXILIARY1)) ;; "ST segment deviation on electrocardiogram" implies "ST segment deviation"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_acute_coronary_syndrome_presentation_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute coronary syndrome presentation, defined as ((ST segment deviation on electrocardiogram) OR (cardiac troponin elevation))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} ;; "chest pain"
(declare-const patient_has_positive_test_for_myocardial_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive test result for myocardial ischemia.","when_to_set_to_false":"Set to false if the patient currently does not have a positive test result for myocardial ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive test result for myocardial ischemia.","meaning":"Boolean indicating whether the patient currently has a positive test result for myocardial ischemia."} ;; "positive tests for myocardial ischemia"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and patient_has_finding_of_chest_pain_now
             patient_has_positive_test_for_myocardial_ischemia_now))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chest pain AND positive tests for myocardial ischemia."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_hemodynamic_instability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hemodynamic instability (i.e., at the time of presentation).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hemodynamic instability at the time of presentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hemodynamic instability at the time of presentation.","meaning":"Boolean indicating whether the patient currently has hemodynamic instability."} ;; "hemodynamic instability on presentation"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_hemodynamic_instability_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hemodynamic instability on presentation."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_able_to_write_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to write informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to write informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to write informed consent.","meaning":"Boolean indicating whether the patient is currently able to write informed consent."} ;; "unable to write informed consent"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_is_able_to_write_informed_consent_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to write informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "younger than 18 years of age"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than 18 years of age."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_participated_in_investigational_study_within_previous_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in any investigational study within the previous 30 days.","when_to_set_to_false":"Set to false if the patient has not participated in any investigational study within the previous 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in any investigational study within the previous 30 days.","meaning":"Boolean indicating whether the patient has participated in an investigational study within the previous 30 days."} ;; "has participated in an investigational study within the previous 30 days"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_participated_in_investigational_study_within_previous_30_days)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in an investigational study within the previous 30 days."
