;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_sibling_of_birth_cohort Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a sibling of a birth cohort.","when_to_set_to_false":"Set to false if the patient is not a sibling of a birth cohort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a sibling of a birth cohort.","meaning":"Boolean indicating whether the patient is a sibling of a birth cohort."}  ;; "the patient must be a sibling of a birth cohort"
(declare-const patient_is_sibling_of_birth_cohort@@birth_cohort_recruited_in_1997_to_1999_inclusive Bool) ;; {"when_to_set_to_true":"Set to true if the birth cohort was recruited in the time period from 1997 to 1999, inclusive.","when_to_set_to_false":"Set to false if the birth cohort was not recruited in the time period from 1997 to 1999, inclusive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the birth cohort was recruited in the time period from 1997 to 1999, inclusive.","meaning":"Boolean indicating whether the birth cohort was recruited in the time period from 1997 to 1999, inclusive."}  ;; "birth cohort recruited in the time period from 1997 to 1999 (inclusive)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_is_sibling_of_birth_cohort@@birth_cohort_recruited_in_1997_to_1999_inclusive
         patient_is_sibling_of_birth_cohort)
     :named REQ0_AUXILIARY0)) ;; "the patient is a sibling of a birth cohort recruited in the time period from 1997 to 1999 (inclusive)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_sibling_of_birth_cohort@@birth_cohort_recruited_in_1997_to_1999_inclusive
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be a sibling of a birth cohort recruited in the time period from 1997 to 1999 (inclusive)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged less than 11 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (< patient_age_value_recorded_now_in_years 11.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged less than 11 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."}  ;; "the patient must have physician diagnosed asthma"
(declare-const patient_has_diagnosis_of_asthma_now@@diagnosed_by_physician Bool) ;; {"when_to_set_to_true":"Set to true if the patient's asthma diagnosis was made by a physician.","when_to_set_to_false":"Set to false if the patient's asthma diagnosis was not made by a physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the asthma diagnosis was made by a physician.","meaning":"Boolean indicating whether the patient's asthma diagnosis was made by a physician."}  ;; "physician diagnosed asthma"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_asthma_now@@diagnosed_by_physician
         patient_has_diagnosis_of_asthma_now)
     :named REQ2_AUXILIARY0)) ;; "physician diagnosed asthma" means asthma diagnosis present

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_diagnosis_of_asthma_now@@diagnosed_by_physician
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have physician diagnosed asthma"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_symptoms_of_wheezing_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had symptoms of wheezing at any time in the 12 months prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not had symptoms of wheezing in the 12 months prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had symptoms of wheezing in the 12 months prior to enrollment.","meaning":"Boolean indicating whether the patient has had symptoms of wheezing in the 12 months prior to enrollment."} ;; "wheeze in the 12 months prior to enrollment"
(declare-const patient_has_symptoms_of_persistent_cough_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had symptoms of persistent cough at any time in the 12 months prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not had symptoms of persistent cough in the 12 months prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had symptoms of persistent cough in the 12 months prior to enrollment.","meaning":"Boolean indicating whether the patient has had symptoms of persistent cough in the 12 months prior to enrollment."} ;; "persistent cough in the 12 months prior to enrollment"
(declare-const patient_has_symptoms_of_tight_chest_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had symptoms of chest tightness at any time in the 12 months prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not had symptoms of chest tightness in the 12 months prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had symptoms of chest tightness in the 12 months prior to enrollment.","meaning":"Boolean indicating whether the patient has had symptoms of chest tightness in the 12 months prior to enrollment."} ;; "chest tightness in the 12 months prior to enrollment"
(declare-const patient_has_symptoms_of_dyspnea_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had symptoms of shortness of breath at any time in the 12 months prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not had symptoms of shortness of breath in the 12 months prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had symptoms of shortness of breath in the 12 months prior to enrollment.","meaning":"Boolean indicating whether the patient has had symptoms of shortness of breath in the 12 months prior to enrollment."} ;; "shortness of breath in the 12 months prior to enrollment"
(declare-const patient_has_taken_drug_or_medicament_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any drug or medicament at any time in the 12 months prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not taken any drug or medicament in the 12 months prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any drug or medicament in the 12 months prior to enrollment.","meaning":"Boolean indicating whether the patient has taken any drug or medicament in the 12 months prior to enrollment."} ;; "medication use in the 12 months prior to enrollment"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: "at least one active symptom (wheeze OR persistent cough OR chest tightness OR shortness of breath) in the 12 months prior to enrollment"
(define-fun patient_has_at_least_one_active_symptom_inthepast12months () Bool
  (or patient_has_symptoms_of_wheezing_inthepast12months
      patient_has_symptoms_of_persistent_cough_inthepast12months
      patient_has_symptoms_of_tight_chest_inthepast12months
      patient_has_symptoms_of_dyspnea_inthepast12months)) ;; "at least one active symptom (wheeze OR persistent cough OR chest tightness OR shortness of breath) in the 12 months prior to enrollment"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: "To be included, the patient must have (at least one active symptom ... in the 12 months prior to enrollment) OR (medication use in the 12 months prior to enrollment)."
(assert
  (! (or patient_has_at_least_one_active_symptom_inthepast12months
         patient_has_taken_drug_or_medicament_inthepast12months)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "at least one active symptom ... OR medication use in the 12 months prior to enrollment"
