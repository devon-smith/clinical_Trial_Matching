;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 85 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 85)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 85 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of underlying lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of underlying lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of underlying lung disease.","meaning":"Boolean indicating whether the patient currently has underlying lung disease."} // "evidence of underlying lung disease"
(declare-const patient_has_finding_of_disorder_of_lung_now@@evidenced_by_history_and_physical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's underlying lung disease is evidenced by history and physical examination.","when_to_set_to_false":"Set to false if the patient's underlying lung disease is not evidenced by history and physical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether history and physical examination provide evidence for underlying lung disease.","meaning":"Boolean indicating whether evidence for underlying lung disease is provided by history and physical examination."} // "by history and physical examination"
(declare-const patient_has_finding_of_disorder_of_lung_now@@evidenced_by_chest_x_ray Bool) ;; {"when_to_set_to_true":"Set to true if the patient's underlying lung disease is evidenced by chest x-ray.","when_to_set_to_false":"Set to false if the patient's underlying lung disease is not evidenced by chest x-ray.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether chest x-ray provides evidence for underlying lung disease.","meaning":"Boolean indicating whether evidence for underlying lung disease is provided by chest x-ray."} // "by chest x-ray"
(declare-const patient_has_finding_of_disorder_of_lung_now@@evidenced_by_pulmonary_function_testing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's underlying lung disease is evidenced by pulmonary function testing.","when_to_set_to_false":"Set to false if the patient's underlying lung disease is not evidenced by pulmonary function testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether pulmonary function testing provides evidence for underlying lung disease.","meaning":"Boolean indicating whether evidence for underlying lung disease is provided by pulmonary function testing."} // "by pulmonary function testing"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_disorder_of_lung_now@@evidenced_by_history_and_physical_examination
         patient_has_finding_of_disorder_of_lung_now)
     :named REQ1_AUXILIARY0)) ;; "evidenced by history and physical examination"

(assert
  (! (=> patient_has_finding_of_disorder_of_lung_now@@evidenced_by_chest_x_ray
         patient_has_finding_of_disorder_of_lung_now)
     :named REQ1_AUXILIARY1)) ;; "evidenced by chest x-ray"

(assert
  (! (=> patient_has_finding_of_disorder_of_lung_now@@evidenced_by_pulmonary_function_testing
         patient_has_finding_of_disorder_of_lung_now)
     :named REQ1_AUXILIARY2)) ;; "evidenced by pulmonary function testing"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Evidence of underlying lung disease by (history and physical examination) OR by chest x-ray OR by pulmonary function testing
(assert
  (! (or patient_has_finding_of_disorder_of_lung_now@@evidenced_by_history_and_physical_examination
         patient_has_finding_of_disorder_of_lung_now@@evidenced_by_chest_x_ray
         patient_has_finding_of_disorder_of_lung_now@@evidenced_by_pulmonary_function_testing)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "evidence of underlying lung disease by (history and physical examination) OR by chest x-ray OR by pulmonary function testing"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_pulmonary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary hypertension.","meaning":"Boolean indicating whether the patient currently has pulmonary hypertension."} // "pulmonary hypertension"
(declare-const patient_has_finding_of_pulmonary_hypertension_now@@documented_by_doppler_echocardiography_within_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pulmonary hypertension is documented by Doppler echocardiography performed within the last 30 days.","when_to_set_to_false":"Set to false if the patient's pulmonary hypertension is not documented by Doppler echocardiography performed within the last 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether Doppler echocardiography performed within the last 30 days documents the patient's pulmonary hypertension.","meaning":"Boolean indicating whether the patient's pulmonary hypertension is documented by Doppler echocardiography performed within the last 30 days."} // "documented by Doppler echocardiography (performed within the last 30 days)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_pulmonary_hypertension_now@@documented_by_doppler_echocardiography_within_30_days
         patient_has_finding_of_pulmonary_hypertension_now)
     :named REQ2_AUXILIARY0)) ;; "documented by Doppler echocardiography (performed within the last 30 days)" implies "pulmonary hypertension"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_pulmonary_hypertension_now@@documented_by_doppler_echocardiography_within_30_days
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have pulmonary hypertension documented by Doppler echocardiography (performed within the last 30 days)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_able_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently not able to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to give informed consent.","meaning":"Boolean indicating whether the patient is currently able to give informed consent."} // "the patient must be able to give informed consent"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_able_to_give_informed_consent_now
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to give informed consent"
