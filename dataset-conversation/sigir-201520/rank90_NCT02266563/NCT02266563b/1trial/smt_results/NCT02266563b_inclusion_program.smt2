;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "male"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 40 years AND age ≤ 85 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_sex_is_male_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male."

(assert
  (! (>= patient_age_value_recorded_now_in_years 40)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be age ≥ 40 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 85)
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be age ≤ 85 years."

;; ===================== Declarations for the inclusion criteria (REQ 1) =====================
(declare-const patient_has_finding_of_mild_cognitive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has mild cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have mild cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mild cognitive impairment.","meaning":"Boolean indicating whether the patient currently has mild cognitive impairment."} // "mild cognitive impairment"
(declare-const patient_has_finding_of_concussion_injury_of_brain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of concussion injury of brain.","when_to_set_to_false":"Set to false if the patient does not have a documented history of concussion injury of brain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of concussion injury of brain.","meaning":"Boolean indicating whether the patient has a history of concussion injury of brain."} // "concussion"
(declare-const patient_has_finding_of_traumatic_brain_injury_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of traumatic brain injury.","when_to_set_to_false":"Set to false if the patient does not have a documented history of traumatic brain injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of traumatic brain injury.","meaning":"Boolean indicating whether the patient has a history of traumatic brain injury."} // "traumatic brain injury"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must have mild cognitive impairment.
(assert
  (! patient_has_finding_of_mild_cognitive_disorder_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have mild cognitive impairment."

;; Component 1: The patient must have no history of concussion or must have no history of traumatic brain injury.
(assert
  (! (or (not patient_has_finding_of_concussion_injury_of_brain_inthehistory)
         (not patient_has_finding_of_traumatic_brain_injury_inthehistory))
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have no history of concussion or must have no history of traumatic brain injury."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const study_partner_is_well_acquainted_with_patient Bool) ;; {"when_to_set_to_true":"Set to true if the study partner is well acquainted with the patient.","when_to_set_to_false":"Set to false if the study partner is not well acquainted with the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the study partner is well acquainted with the patient.","meaning":"Boolean indicating whether the study partner is well acquainted with the patient."} // "study partner who is well acquainted with the patient"
(declare-const patients_activity_of_daily_living_is_positive_now@@study_partner_can_answer_questions_in_person_or_telephone Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive status for activities of daily living and a study partner is able to answer questions about these activities either in person or over the telephone.","when_to_set_to_false":"Set to false if the patient currently has a positive status for activities of daily living but a study partner is not able to answer questions about these activities either in person or over the telephone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a study partner is able to answer questions about the patient's activities of daily living.","meaning":"Boolean indicating whether the patient currently has a positive status for activities of daily living and a study partner is able to answer questions about these activities either in person or over the telephone."} // "is able to answer questions either in person OR over the telephone about the patient's activities of daily living"
(declare-const patient_has_finding_of_impaired_cognition_now@@study_partner_can_corroborate Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cognitive problems and a study partner is able to corroborate these cognitive problems.","when_to_set_to_false":"Set to false if the patient currently has cognitive problems but a study partner is not able to corroborate these cognitive problems.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a study partner is able to corroborate the patient's cognitive problems.","meaning":"Boolean indicating whether the patient currently has cognitive problems and a study partner is able to corroborate these cognitive problems."} // "is able to corroborate cognitive problems"
(declare-const patient_has_finding_of_traumatic_and_or_non_traumatic_brain_injury_inthehistory@@study_partner_can_corroborate Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of traumatic and/or non-traumatic brain injury and a study partner is able to corroborate this history.","when_to_set_to_false":"Set to false if the patient has a history of traumatic and/or non-traumatic brain injury but a study partner is not able to corroborate this history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a study partner is able to corroborate the patient's history of brain injury.","meaning":"Boolean indicating whether the patient has a history of traumatic and/or non-traumatic brain injury and a study partner is able to corroborate this history."} // "is able to corroborate past history of brain injury"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patients_activity_of_daily_living_is_positive_now@@study_partner_can_answer_questions_in_person_or_telephone
         study_partner_is_well_acquainted_with_patient)
     :named REQ2_AUXILIARY0)) ;; "study partner is able to answer questions about activities of daily living" implies "study partner is well acquainted"

(assert
  (! (=> patient_has_finding_of_impaired_cognition_now@@study_partner_can_corroborate
         study_partner_is_well_acquainted_with_patient)
     :named REQ2_AUXILIARY1)) ;; "study partner can corroborate cognitive problems" implies "study partner is well acquainted"

(assert
  (! (=> patient_has_finding_of_traumatic_and_or_non_traumatic_brain_injury_inthehistory@@study_partner_can_corroborate
         study_partner_is_well_acquainted_with_patient)
     :named REQ2_AUXILIARY2)) ;; "study partner can corroborate past history of brain injury" implies "study partner is well acquainted"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (and study_partner_is_well_acquainted_with_patient
          patients_activity_of_daily_living_is_positive_now@@study_partner_can_answer_questions_in_person_or_telephone
          patient_has_finding_of_impaired_cognition_now@@study_partner_can_corroborate
          patient_has_finding_of_traumatic_and_or_non_traumatic_brain_injury_inthehistory@@study_partner_can_corroborate)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (a study partner who is well acquainted with the patient AND is able to answer questions either in person OR over the telephone about the patient's activities of daily living AND is able to corroborate cognitive problems AND is able to corroborate past history of brain injury)."
