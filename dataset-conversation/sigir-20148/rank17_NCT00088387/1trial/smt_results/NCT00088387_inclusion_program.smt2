;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 40 years AND age ≤ 90 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 40)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≥ 40 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 90)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age ≤ 90 years."

;; ===================== Declarations for the inclusion criteria (REQ 1) =====================
(declare-const patient_has_finding_of_alzheimer_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Alzheimer disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Alzheimer disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Alzheimer disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer disease."} // "have a diagnosis of Alzheimer disease"
(declare-const patient_is_able_to_provide_consent_by_passing_capacity_assessment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide consent and has passed a capacity assessment.","when_to_set_to_false":"Set to false if the patient is currently unable to provide consent or has not passed a capacity assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to provide consent by passing a capacity assessment.","meaning":"Boolean indicating whether the patient is able to provide consent at present, as determined by passing a capacity assessment."} // "be able to provide consent (pass a capacity assessment)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must have a diagnosis of Alzheimer disease.
(assert
  (! patient_has_finding_of_alzheimer_disease_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a diagnosis of Alzheimer disease."

;; Component 1: The patient must be able to provide consent (pass a capacity assessment).
(assert
  (! patient_is_able_to_provide_consent_by_passing_capacity_assessment_now
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to provide consent (pass a capacity assessment)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_ischemia_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's modified Hachinski ischemia score is recorded now.","when_to_set_to_null":"Set to null if no such score is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current modified Hachinski ischemia score."} // "modified Hachinski ischemia score"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (< patient_ischemia_value_recorded_now_withunit_score 4)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a modified Hachinski ischemia score < 4."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_magnetic_resonance_imaging_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a magnetic resonance imaging scan at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a magnetic resonance imaging scan in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a magnetic resonance imaging scan in the past.","meaning":"Boolean indicating whether the patient has undergone a magnetic resonance imaging scan in the past."} // "the patient must have had a brain magnetic resonance imaging scan"
(declare-const patient_has_undergone_magnetic_resonance_imaging_inthehistory@@performed_within_15_months_of_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's magnetic resonance imaging scan was performed within 15 months prior to enrollment.","when_to_set_to_false":"Set to false if the patient's magnetic resonance imaging scan was performed outside the 15-month window prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scan was performed within 15 months prior to enrollment.","meaning":"Boolean indicating whether the patient's magnetic resonance imaging scan was performed within 15 months prior to enrollment."} // "performed within 15 months of enrollment"
(declare-const patient_has_undergone_magnetic_resonance_imaging_inthehistory@@is_of_the_brain Bool) ;; {"when_to_set_to_true":"Set to true if the patient's magnetic resonance imaging scan was of the brain.","when_to_set_to_false":"Set to false if the patient's magnetic resonance imaging scan was not of the brain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scan was of the brain.","meaning":"Boolean indicating whether the patient's magnetic resonance imaging scan was of the brain."} // "brain magnetic resonance imaging scan"
(declare-const patient_has_undergone_magnetic_resonance_imaging_inthehistory@@is_compatible_with_diagnosis_of_alzheimer_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's magnetic resonance imaging scan is compatible with the diagnosis of Alzheimer disease.","when_to_set_to_false":"Set to false if the patient's magnetic resonance imaging scan is not compatible with the diagnosis of Alzheimer disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scan is compatible with the diagnosis of Alzheimer disease.","meaning":"Boolean indicating whether the patient's magnetic resonance imaging scan is compatible with the diagnosis of Alzheimer disease."} // "magnetic resonance imaging scan that is compatible with the diagnosis of Alzheimer disease"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_undergone_magnetic_resonance_imaging_inthehistory@@performed_within_15_months_of_enrollment
         patient_has_undergone_magnetic_resonance_imaging_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "performed within 15 months of enrollment" implies MRI in history

(assert
  (! (=> patient_has_undergone_magnetic_resonance_imaging_inthehistory@@is_of_the_brain
         patient_has_undergone_magnetic_resonance_imaging_inthehistory)
     :named REQ3_AUXILIARY1)) ;; "is of the brain" implies MRI in history

(assert
  (! (=> patient_has_undergone_magnetic_resonance_imaging_inthehistory@@is_compatible_with_diagnosis_of_alzheimer_disease
         patient_has_undergone_magnetic_resonance_imaging_inthehistory)
     :named REQ3_AUXILIARY2)) ;; "is compatible with diagnosis of Alzheimer disease" implies MRI in history

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: "the patient must have had a brain magnetic resonance imaging scan performed within 15 months of enrollment"
(assert
  (! (and patient_has_undergone_magnetic_resonance_imaging_inthehistory@@performed_within_15_months_of_enrollment
          patient_has_undergone_magnetic_resonance_imaging_inthehistory@@is_of_the_brain)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "brain MRI performed within 15 months of enrollment"

;; Component 1: "the patient must have had a brain magnetic resonance imaging scan that is compatible with the diagnosis of Alzheimer disease"
(assert
  (! (and patient_has_undergone_magnetic_resonance_imaging_inthehistory@@is_of_the_brain
          patient_has_undergone_magnetic_resonance_imaging_inthehistory@@is_compatible_with_diagnosis_of_alzheimer_disease)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "brain MRI compatible with diagnosis of Alzheimer disease"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_willing_to_adhere_to_protocol_requirements_as_evidenced_by_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to adhere to protocol requirements and this willingness is evidenced by written informed consent.","when_to_set_to_false":"Set to false if the patient is not willing to adhere to protocol requirements or this willingness is not evidenced by written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to adhere to protocol requirements as evidenced by written informed consent.","meaning":"Boolean indicating whether the patient is willing to adhere to protocol requirements, as evidenced by written informed consent."} // "the patient must be willing to adhere to protocol requirements as evidenced by written informed consent"
(declare-const caregiver_is_willing_to_adhere_to_protocol_requirements_as_evidenced_by_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the caregiver is willing to adhere to protocol requirements and this willingness is evidenced by written informed consent.","when_to_set_to_false":"Set to false if the caregiver is not willing to adhere to protocol requirements or this willingness is not evidenced by written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the caregiver is willing to adhere to protocol requirements as evidenced by written informed consent.","meaning":"Boolean indicating whether the caregiver is willing to adhere to protocol requirements, as evidenced by written informed consent."} // "have a caregiver who is willing to adhere to protocol requirements as evidenced by written informed consent"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Patient must be willing to adhere to protocol requirements as evidenced by written informed consent
(assert
  (! patient_is_willing_to_adhere_to_protocol_requirements_as_evidenced_by_written_informed_consent
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to adhere to protocol requirements as evidenced by written informed consent"

;; Component 1: Caregiver must be willing to adhere to protocol requirements as evidenced by written informed consent
(assert
  (! caregiver_is_willing_to_adhere_to_protocol_requirements_as_evidenced_by_written_informed_consent
     :named REQ4_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "have a caregiver who is willing to adhere to protocol requirements as evidenced by written informed consent"
