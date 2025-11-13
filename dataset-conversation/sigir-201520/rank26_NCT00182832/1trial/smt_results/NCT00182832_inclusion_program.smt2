;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 65 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_hospitalized_in_medical_ward_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hospitalized in a medical ward.","when_to_set_to_false":"Set to false if the patient is currently not hospitalized in a medical ward.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hospitalized in a medical ward.","meaning":"Boolean indicating whether the patient is currently hospitalized in a medical ward."} ;; "the patient must be hospitalized in a medical ward"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_hospitalized_in_medical_ward_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be hospitalized in a medical ward"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_able_to_speak_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to speak the English language.","when_to_set_to_false":"Set to false if the patient is currently not able to speak the English language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to speak the English language.","meaning":"Boolean indicating whether the patient is currently able to speak the English language."} ;; "the patient must be able to speak the English language"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_able_to_speak_english_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be able to speak the English language"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cognitive impairment.","meaning":"Boolean indicating whether the patient currently has cognitive impairment."} ;; "cognitive impairment"
(declare-const patient_has_finding_of_impaired_cognition_now@@based_on_cognitive_impairment_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cognitive impairment finding is based on cognitive impairment screening.","when_to_set_to_false":"Set to false if the patient's cognitive impairment finding is not based on cognitive impairment screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cognitive impairment finding is based on cognitive impairment screening.","meaning":"Boolean indicating whether the patient's cognitive impairment finding is based on cognitive impairment screening."} ;; "based on cognitive impairment screening"
(declare-const patient_has_finding_of_impaired_cognition_now@@present_at_time_of_hospital_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cognitive impairment finding is present at the time of hospital admission.","when_to_set_to_false":"Set to false if the patient's cognitive impairment finding is not present at the time of hospital admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cognitive impairment finding is present at the time of hospital admission.","meaning":"Boolean indicating whether the patient's cognitive impairment finding is present at the time of hospital admission."} ;; "at the time of hospital admission"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable: if cognitive impairment is based on screening, then cognitive impairment is present
(assert
  (! (=> patient_has_finding_of_impaired_cognition_now@@based_on_cognitive_impairment_screening
         patient_has_finding_of_impaired_cognition_now)
     :named REQ3_AUXILIARY0)) ;; "based on cognitive impairment screening"

;; Qualifier variable implies stem variable: if cognitive impairment is present at time of hospital admission, then cognitive impairment is present
(assert
  (! (=> patient_has_finding_of_impaired_cognition_now@@present_at_time_of_hospital_admission
         patient_has_finding_of_impaired_cognition_now)
     :named REQ3_AUXILIARY1)) ;; "at the time of hospital admission"

;; ===================== Constraint Assertions (REQ 3) =====================
;; To be included, the patient must have cognitive impairment based on cognitive impairment screening at the time of hospital admission.
(assert
  (! (and patient_has_finding_of_impaired_cognition_now@@based_on_cognitive_impairment_screening
          patient_has_finding_of_impaired_cognition_now@@present_at_time_of_hospital_admission)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "cognitive impairment based on cognitive impairment screening at the time of hospital admission"
