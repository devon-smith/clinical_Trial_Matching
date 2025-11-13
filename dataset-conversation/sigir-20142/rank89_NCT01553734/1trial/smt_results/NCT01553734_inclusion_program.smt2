;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of community acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of community acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of community acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of community acquired pneumonia."}  ;; "To be included, the patient must have severe community acquired pneumonia."
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of community acquired pneumonia and the pneumonia is severe.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of community acquired pneumonia but the pneumonia is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the community acquired pneumonia is severe.","meaning":"Boolean indicating whether the patient's current community acquired pneumonia is severe."}  ;; "To be included, the patient must have severe community acquired pneumonia."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_diagnosis_of_community_acquired_pneumonia_now@@severe
         patient_has_diagnosis_of_community_acquired_pneumonia_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have severe community acquired pneumonia."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_community_acquired_pneumonia_now@@severe
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have severe community acquired pneumonia."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_taking_azithromycin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with an azithromycin-containing product.","when_to_set_to_false":"Set to false if the patient is currently not being treated with an azithromycin-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with an azithromycin-containing product.","meaning":"Boolean indicating whether the patient is currently taking an azithromycin-containing product."}  ;; "To be included, the patient must be treated with azithromycin."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_taking_azithromycin_containing_product_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be treated with azithromycin."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "To be included, the patient must be age > 18 years."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age > 18 years."
