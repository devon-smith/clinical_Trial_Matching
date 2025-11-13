;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_infiltrate_on_chest_radiograph_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an infiltrate detected on chest radiograph.","when_to_set_to_false":"Set to false if the patient currently does not have an infiltrate detected on chest radiograph.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an infiltrate detected on chest radiograph.","meaning":"Boolean indicating whether the patient currently has an infiltrate detected on chest radiograph."} ;; "To be included, the patient must have an infiltrate on chest radiograph."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_finding_of_infiltrate_on_chest_radiograph_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have an infiltrate on chest radiograph."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough.","when_to_set_to_false":"Set to false if the patient currently does not have cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."} ;; "cough"
(declare-const patient_has_finding_of_purulent_sputum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has purulent sputum.","when_to_set_to_false":"Set to false if the patient currently does not have purulent sputum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has purulent sputum.","meaning":"Boolean indicating whether the patient currently has purulent sputum."} ;; "production of purulent sputum"
(declare-const patient_has_finding_of_respiratory_crackles_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory crackles.","when_to_set_to_false":"Set to false if the patient currently does not have respiratory crackles.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory crackles.","meaning":"Boolean indicating whether the patient currently has respiratory crackles."} ;; "crackles"
(declare-const patient_has_finding_of_respiratory_crackles_now@@detected_on_lung_auscultation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's respiratory crackles are detected on lung auscultation.","when_to_set_to_false":"Set to false if the patient's respiratory crackles are not detected on lung auscultation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's respiratory crackles are detected on lung auscultation.","meaning":"Boolean indicating whether the patient's respiratory crackles are detected on lung auscultation."} ;; "pathologic finding on lung auscultation (crackles)"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} ;; "fever"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_respiratory_crackles_now@@detected_on_lung_auscultation
         patient_has_finding_of_respiratory_crackles_now)
     :named REQ2_AUXILIARY0)) ;; "pathologic finding on lung auscultation (crackles)" implies "crackles"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: At least one of the following must be present: cough OR purulent sputum OR pathologic finding on lung auscultation (crackles) OR fever
(assert
  (! (or patient_has_finding_of_cough_now
         patient_has_finding_of_purulent_sputum_now
         patient_has_finding_of_respiratory_crackles_now@@detected_on_lung_auscultation
         patient_has_finding_of_fever_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have at least one of the following (cough OR production of purulent sputum OR pathologic finding on lung auscultation (crackles) OR fever)."
