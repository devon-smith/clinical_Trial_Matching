;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "the patient must be male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "the patient must be female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "6-14 years of age"
(declare-const patient_has_finding_of_mild_persistent_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of mild persistent asthma.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of mild persistent asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mild persistent asthma.","meaning":"Boolean indicating whether the patient currently has mild persistent asthma."} // "mild persistent asthma"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be male or the patient must be female, 6-14 years of age with mild persistent asthma.
(assert
  (! (or patient_sex_is_male_now
         (and patient_sex_is_female_now
              (>= patient_age_value_recorded_now_in_years 6)
              (<= patient_age_value_recorded_now_in_years 14)
              patient_has_finding_of_mild_persistent_asthma_now))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or the patient must be female, 6-14 years of age with mild persistent asthma."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_wheezing_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of wheezing.","when_to_set_to_false":"Set to false if the patient does not have a documented history of wheezing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of wheezing.","meaning":"Boolean indicating whether the patient has a history of wheezing."} // "have a history of wheezing"
(declare-const patient_has_finding_of_tight_chest_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of chest tightness.","when_to_set_to_false":"Set to false if the patient does not have a documented history of chest tightness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of chest tightness.","meaning":"Boolean indicating whether the patient has a history of chest tightness."} // "have a history of chest tightness"
(declare-const patient_has_finding_of_cough_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of cough.","when_to_set_to_false":"Set to false if the patient does not have a documented history of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of cough.","meaning":"Boolean indicating whether the patient has a history of cough."} // "have a history of cough"
(declare-const patient_has_finding_of_other_symptom_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of at least one other symptom, excluding wheezing, chest tightness, and cough.","when_to_set_to_false":"Set to false if the patient does not have a documented history of any other symptom besides wheezing, chest tightness, and cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of at least one other symptom.","meaning":"Boolean indicating whether the patient has a history of at least one other symptom, in addition to wheezing, chest tightness, and cough."} // "have a history of at least one other symptom"
(declare-const patient_has_finding_of_other_symptom_inthehistory@@excluding_wheezing_chest_tightness_cough Bool) ;; {"when_to_set_to_true":"Set to true if the symptom is not wheezing, chest tightness, or cough.","when_to_set_to_false":"Set to false if the symptom is wheezing, chest tightness, or cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the symptom is other than wheezing, chest tightness, or cough.","meaning":"Boolean indicating whether the symptom is other than wheezing, chest tightness, or cough."} // "other symptom (excluding wheezing, chest tightness, cough)"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the corresponding stem variable
(assert
  (! (=> patient_has_finding_of_other_symptom_inthehistory@@excluding_wheezing_chest_tightness_cough
         patient_has_finding_of_other_symptom_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "other symptom (excluding wheezing, chest tightness, cough)" implies "other symptom"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: history of wheezing
(assert
  (! patient_has_finding_of_wheezing_inthehistory
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have a history of wheezing"

;; Component 1: history of chest tightness
(assert
  (! patient_has_finding_of_tight_chest_inthehistory
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have a history of chest tightness"

;; Component 2: history of cough
(assert
  (! patient_has_finding_of_cough_inthehistory
     :named REQ1_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have a history of cough"

;; Component 3: history of at least one other symptom (excluding wheezing, chest tightness, cough)
(assert
  (! patient_has_finding_of_other_symptom_inthehistory@@excluding_wheezing_chest_tightness_cough
     :named REQ1_COMPONENT3_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have a history of at least one other symptom (excluding wheezing, chest tightness, cough)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_asthma_by_doctor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma made by a doctor.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma made by a doctor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma made by a doctor.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma made by a doctor."} // "the patient must have a diagnosis of asthma by a doctor"
(declare-const patient_has_diagnosis_of_asthma_by_doctor_now@@diagnosed_by_doctor Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of asthma was made by a doctor.","when_to_set_to_false":"Set to false if the diagnosis of asthma was not made by a doctor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of asthma was made by a doctor.","meaning":"Boolean indicating whether the diagnosis of asthma was made by a doctor."} // "diagnosis of asthma by a doctor"
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} // "diagnosis of asthma"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_diagnosis_of_asthma_by_doctor_now@@diagnosed_by_doctor
         patient_has_diagnosis_of_asthma_by_doctor_now)
     :named REQ2_AUXILIARY0)) ;; "diagnosis of asthma by a doctor" implies "diagnosis of asthma by a doctor"

;; Qualifier variable implies general asthma diagnosis
(assert
  (! (=> patient_has_diagnosis_of_asthma_by_doctor_now@@diagnosed_by_doctor
         patient_has_diagnosis_of_asthma_now)
     :named REQ2_AUXILIARY1)) ;; "diagnosis of asthma by a doctor" implies "diagnosis of asthma"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_diagnosis_of_asthma_by_doctor_now@@diagnosed_by_doctor
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have a diagnosis of asthma by a doctor"
