;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged > 18 years"
(declare-const patient_is_undergoing_cardiac_catheterization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing cardiac catheterization.","when_to_set_to_false":"Set to false if the patient is not currently undergoing cardiac catheterization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing cardiac catheterization.","meaning":"Boolean indicating whether the patient is currently undergoing cardiac catheterization."}  ;; "cardiac catheterization"
(declare-const patient_is_undergoing_cardiac_catheterization_now@@procedure_is_diagnostic Bool) ;; {"when_to_set_to_true":"Set to true if the cardiac catheterization the patient is currently undergoing is diagnostic.","when_to_set_to_false":"Set to false if the cardiac catheterization the patient is currently undergoing is not diagnostic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiac catheterization is diagnostic.","meaning":"Boolean indicating whether the cardiac catheterization is diagnostic."}  ;; "require diagnostic cardiac catheterization"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_undergoing_cardiac_catheterization_now@@procedure_is_diagnostic
         patient_is_undergoing_cardiac_catheterization_now)
     :named REQ0_AUXILIARY0)) ;; "require diagnostic cardiac catheterization"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be aged > 18 years
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be aged > 18 years"

;; Component 1: patient must require diagnostic cardiac catheterization
(assert
  (! patient_is_undergoing_cardiac_catheterization_now@@procedure_is_diagnostic
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "require diagnostic cardiac catheterization"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} ;; "be a woman"
(declare-const patient_is_undergoing_estrogen_hormone_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing estrogen hormone therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing estrogen hormone therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing estrogen hormone therapy.","meaning":"Boolean indicating whether the patient is currently undergoing estrogen hormone therapy."} ;; "estrogen therapy"
(declare-const patient_is_undergoing_estrogen_hormone_therapy_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing estrogen hormone therapy and the therapy is chronic (ongoing and long-term).","when_to_set_to_false":"Set to false if the patient is currently undergoing estrogen hormone therapy but the therapy is not chronic (not ongoing or not long-term).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the estrogen hormone therapy is chronic.","meaning":"Boolean indicating whether the patient's current estrogen hormone therapy is chronic (ongoing and long-term)."} ;; "chronic estrogen therapy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for chronic estrogen therapy implies the stem variable
(assert
  (! (=> patient_is_undergoing_estrogen_hormone_therapy_now@@chronic
         patient_is_undergoing_estrogen_hormone_therapy_now)
     :named REQ1_AUXILIARY0)) ;; "chronic estrogen therapy" implies "estrogen therapy"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must be a woman
(assert
  (! patient_sex_is_female_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be a woman"

;; Component 1: Patient must be receiving chronic estrogen therapy
(assert
  (! patient_is_undergoing_estrogen_hormone_therapy_now@@chronic
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be receiving chronic estrogen therapy"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cardiac_syndrome_x_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chest pain syndrome with normal coronary arteries (Cardiac Syndrome X).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chest pain syndrome with normal coronary arteries (Cardiac Syndrome X).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain syndrome with normal coronary arteries (Cardiac Syndrome X).","meaning":"Boolean indicating whether the patient currently has chest pain syndrome with normal coronary arteries (Cardiac Syndrome X)."} ;; "chest pain syndrome with normal coronary arteries"
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has coronary artery disease.","meaning":"Boolean indicating whether the patient currently has coronary artery disease."} ;; "coronary artery disease"
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "heart failure"
(declare-const patient_has_finding_of_risk_factors_for_atherosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has one or more risk factors for atherosclerosis.","when_to_set_to_false":"Set to false if the patient currently does not have any risk factors for atherosclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has risk factors for atherosclerosis.","meaning":"Boolean indicating whether the patient currently has risk factors for atherosclerosis."} ;; "risk factors for atherosclerosis"

;; ===================== Constraint Assertions (REQ 2) =====================
;; To be included, the patient must ((be investigated for chest pain syndrome with normal coronary arteries (with or without risk factors for atherosclerosis)) OR (have coronary artery disease) OR (have heart failure)).
(assert
  (! (or patient_has_finding_of_cardiac_syndrome_x_now
         patient_has_finding_of_coronary_arteriosclerosis_now
         patient_has_finding_of_heart_failure_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((be investigated for chest pain syndrome with normal coronary arteries (with or without risk factors for atherosclerosis)) OR (have coronary artery disease) OR (have heart failure))."
