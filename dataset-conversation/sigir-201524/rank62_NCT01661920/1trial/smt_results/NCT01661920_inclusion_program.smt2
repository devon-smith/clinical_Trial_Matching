;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value": "Set to the patient's current age in years as a numeric value.", "when_to_set_to_null": "Set to null if the patient's current age in years is unknown or cannot be determined.", "meaning": "Numeric value indicating the patient's current age in years."} ;; "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of community-acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of community-acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of community-acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of community-acquired pneumonia."} ;; "community-acquired pneumonia"
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pulmonary infiltrate.","when_to_set_to_false":"Set to false if the patient currently does not have a pulmonary infiltrate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pulmonary infiltrate.","meaning":"Boolean indicating whether the patient currently has a pulmonary infiltrate."} ;; "pulmonary infiltrate"
(declare-const patient_has_undergone_plain_chest_x_ray_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a thoracic (plain chest) X-ray now.","when_to_set_to_false":"Set to false if the patient has not undergone a thoracic (plain chest) X-ray now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a thoracic (plain chest) X-ray now.","meaning":"Boolean indicating whether the patient has undergone a thoracic (plain chest) X-ray now."} ;; "thoracic X-ray"
(declare-const patient_is_admitted_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to the hospital.","when_to_set_to_false":"Set to false if the patient is not currently admitted to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to the hospital.","meaning":"Boolean indicating whether the patient is currently admitted to the hospital."} ;; "admitted"
(declare-const pulmonary_infiltrate_is_known_to_be_old_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pulmonary infiltrate is known to be old.","when_to_set_to_false":"Set to false if the patient's current pulmonary infiltrate is not known to be old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pulmonary infiltrate is known to be old.","meaning":"Boolean indicating whether the patient's current pulmonary infiltrate is known to be old."} ;; "not known to be old"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: community-acquired pneumonia is defined as pulmonary infiltrate (shown in a thoracic X-ray AND not known to be old)
(assert
  (! (= patient_has_diagnosis_of_community_acquired_pneumonia_now
        (and patient_has_finding_of_radiologic_infiltrate_of_lung_now
             patient_has_undergone_plain_chest_x_ray_now
             (not pulmonary_infiltrate_is_known_to_be_old_now)))
     :named REQ1_AUXILIARY0)) ;; "community-acquired pneumonia is defined as pulmonary infiltrate (shown in a thoracic X-ray AND not known to be old)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; To be included, the patient must be admitted with community-acquired pneumonia
(assert
  (! (and patient_is_admitted_now
          patient_has_diagnosis_of_community_acquired_pneumonia_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be admitted with community-acquired pneumonia"
