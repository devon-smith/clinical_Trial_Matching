;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of community acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of community acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of community acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of community acquired pneumonia."}  ;; "To be included, the patient must have confirmed community acquired pneumonia."
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now@@confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of community acquired pneumonia is confirmed.","when_to_set_to_false":"Set to false if the diagnosis of community acquired pneumonia is not confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of community acquired pneumonia is confirmed.","meaning":"Boolean indicating whether the diagnosis of community acquired pneumonia is confirmed."}  ;; "To be included, the patient must have confirmed community acquired pneumonia."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_community_acquired_pneumonia_now@@confirmed
         patient_has_diagnosis_of_community_acquired_pneumonia_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have confirmed community acquired pneumonia."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_community_acquired_pneumonia_now@@confirmed
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have confirmed community acquired pneumonia."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years AND aged ≤ 60 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 60)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 60 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cough.","when_to_set_to_false":"Set to false if the patient currently does not have a cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cough.","meaning":"Boolean indicating whether the patient currently has a cough."}  ;; "cough"
(declare-const patient_has_finding_of_cough_now@@accompanied_by_little_or_no_sputum Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cough is accompanied by little or no sputum.","when_to_set_to_false":"Set to false if the patient's current cough is not accompanied by little or no sputum (i.e., is productive or has moderate/large sputum).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cough is accompanied by little or no sputum.","meaning":"Boolean indicating whether the patient's current cough is accompanied by little or no sputum."}  ;; "cough accompanied by little or no sputum"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_cough_now@@accompanied_by_little_or_no_sputum
         patient_has_finding_of_cough_now)
     :named REQ2_AUXILIARY0)) ;; "cough accompanied by little or no sputum" implies "cough"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have a respiratory symptom (specifically, cough accompanied by little or no sputum).
(assert
  (! patient_has_finding_of_cough_now@@accompanied_by_little_or_no_sputum
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a respiratory symptom (specifically, cough accompanied by little or no sputum)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_new_infiltration_shown_by_chest_radiology_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a new infiltration that is demonstrated by chest radiology, specifically by either chest x-ray or chest computed tomography.","when_to_set_to_false":"Set to false if the patient currently does not have a new infiltration shown by chest radiology (chest x-ray or chest computed tomography).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a new infiltration shown by chest radiology (chest x-ray or chest computed tomography).","meaning":"Boolean indicating whether the patient currently has a new infiltration that is shown by chest radiology (chest x-ray or chest computed tomography)."} ;; "To be included, the patient must have new infiltration shown by chest radiology (chest x-ray OR chest computed tomography)."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_new_infiltration_shown_by_chest_radiology_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have new infiltration shown by chest radiology (chest x-ray OR chest computed tomography)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_lung_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any lung findings (signs).","when_to_set_to_false":"Set to false if the patient currently does not have any lung findings (signs).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any lung findings (signs).","meaning":"Boolean indicating whether the patient currently has any lung findings (signs)."}  ;; "lung signs"
(declare-const patient_has_finding_of_lung_finding_now@@obvious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current lung findings (signs) are obvious.","when_to_set_to_false":"Set to false if the patient's current lung findings (signs) are not obvious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current lung findings (signs) are obvious.","meaning":"Boolean indicating whether the patient's current lung findings (signs) are obvious."}  ;; "obvious lung signs"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_lung_finding_now@@obvious
         patient_has_finding_of_lung_finding_now)
     :named REQ4_AUXILIARY0)) ;; "obvious lung signs" implies "lung signs"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must NOT have obvious lung signs.
(assert
  (! (not patient_has_finding_of_lung_finding_now@@obvious)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have obvious lung signs."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_per_mm3 Real) ;; {"when_to_set_to_value":"Set to the measured value if a current white blood cell count (per mm³) is available for the patient.","when_to_set_to_null":"Set to null if no current measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current white blood cell count in cells per mm³."}  ;; "white blood cell count < 10,000 per mm³"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (< patient_white_blood_cell_count_value_recorded_now_withunit_per_mm3 10000)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have white blood cell count < 10,000 per mm³."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease.","when_to_set_to_false":"Set to false if the patient currently does not have any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease.","meaning":"Boolean indicating whether the patient currently has any disease."}  ;; "To be included, the patient must ((have no underlying disease) OR (have only mild underlying disease))."
(declare-const patient_has_finding_of_disease_now@@underlying Bool) ;; {"when_to_set_to_true":"Set to true if the disease present in the patient is underlying.","when_to_set_to_false":"Set to false if the disease present in the patient is not underlying.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease present in the patient is underlying.","meaning":"Boolean indicating whether the disease present in the patient is underlying."}  ;; "To be included, the patient must ((have no underlying disease) OR (have only mild underlying disease))."
(declare-const patient_has_finding_of_disease_now@@mild Bool) ;; {"when_to_set_to_true":"Set to true if the disease present in the patient is mild.","when_to_set_to_false":"Set to false if the disease present in the patient is not mild.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease present in the patient is mild.","meaning":"Boolean indicating whether the disease present in the patient is mild."}  ;; "To be included, the patient must ((have no underlying disease) OR (have only mild underlying disease))."
(declare-const patient_has_finding_of_disease_now@@underlying@@mild Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an underlying disease and the underlying disease is mild.","when_to_set_to_false":"Set to false if the patient currently does not have an underlying disease, or the underlying disease is not mild.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an underlying disease and the underlying disease is mild.","meaning":"Boolean indicating whether the patient currently has any underlying disease, and the underlying disease is mild."}  ;; "To be included, the patient must ((have no underlying disease) OR (have only mild underlying disease))."

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definitional: If the patient has an underlying disease and it is mild, then both underlying and mild qualifiers must be true.
(assert
  (! (=> patient_has_finding_of_disease_now@@underlying@@mild
         (and patient_has_finding_of_disease_now@@underlying
              patient_has_finding_of_disease_now@@mild))
     :named REQ6_AUXILIARY0)) ;; "have only mild underlying disease"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must ((have no underlying disease) OR (have only mild underlying disease)).
(assert
  (! (or (not patient_has_finding_of_disease_now@@underlying)
         patient_has_finding_of_disease_now@@underlying@@mild)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have no underlying disease) OR (have only mild underlying disease))."
