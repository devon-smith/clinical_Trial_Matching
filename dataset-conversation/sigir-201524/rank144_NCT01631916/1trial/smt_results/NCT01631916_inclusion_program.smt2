;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "child"
(declare-const patient_is_child_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a child according to the study or clinical definition.","when_to_set_to_false":"Set to false if the patient is not currently classified as a child according to the study or clinical definition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a child.","meaning":"Boolean indicating whether the patient is currently classified as a child."}  ;; "child"
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of community-acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of community-acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of community-acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of community-acquired pneumonia."}  ;; "community-acquired pneumonia"
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now@@hospitalized_for_this_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hospitalized for the diagnosis of community-acquired pneumonia.","when_to_set_to_false":"Set to false if the patient is not currently hospitalized for the diagnosis of community-acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hospitalized for the diagnosis of community-acquired pneumonia.","meaning":"Boolean indicating whether the patient is currently hospitalized for the diagnosis of community-acquired pneumonia."}  ;; "hospitalized for community-acquired pneumonia"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_community_acquired_pneumonia_now@@hospitalized_for_this_diagnosis
         patient_has_diagnosis_of_community_acquired_pneumonia_now)
     :named REQ0_AUXILIARY0)) ;; "hospitalized for community-acquired pneumonia" implies "community-acquired pneumonia"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be a child
(assert
  (! patient_is_child_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be a child"

;; Component 1: patient must be hospitalized for community-acquired pneumonia
(assert
  (! patient_has_diagnosis_of_community_acquired_pneumonia_now@@hospitalized_for_this_diagnosis
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be hospitalized for community-acquired pneumonia"

;; ===================== Constraint Assertions (REQ 1) =====================
;; To be included, the patient must be aged ≥ 2 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 2)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 2 years."

;; To be included, the patient must be aged ≤ 18 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 18 years."
