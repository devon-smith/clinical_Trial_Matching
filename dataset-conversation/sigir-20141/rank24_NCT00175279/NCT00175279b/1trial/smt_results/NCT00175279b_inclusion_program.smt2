;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_ischemic_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ischemic heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ischemic heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ischemic heart disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ischemic heart disease."} // "To be included, the patient must have ischemic heart disease."
(declare-const patient_is_undergoing_statin_prophylaxis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing statin prophylaxis (statin therapy).","when_to_set_to_false":"Set to false if the patient is currently not undergoing statin prophylaxis (statin therapy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing statin prophylaxis (statin therapy).","meaning":"Boolean indicating whether the patient is currently undergoing statin prophylaxis (statin therapy)."} // "To be included, the patient must not be currently taking statin therapy."
(declare-const primary_care_physician_is_member_of_study_population Bool) ;; {"when_to_set_to_true":"Set to true if the primary care physician of the patient is a member of the study population.","when_to_set_to_false":"Set to false if the primary care physician of the patient is not a member of the study population.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the primary care physician of the patient is a member of the study population.","meaning":"Boolean indicating whether the primary care physician of the patient is a member of the study population."} // "the primary care physician of the patient must be part of the study population."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_ischemic_heart_disease_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have ischemic heart disease."

(assert
  (! (not patient_is_undergoing_statin_prophylaxis_now)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must not be currently taking statin therapy."

(assert
  (! primary_care_physician_is_member_of_study_population
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the primary care physician of the patient must be part of the study population."
