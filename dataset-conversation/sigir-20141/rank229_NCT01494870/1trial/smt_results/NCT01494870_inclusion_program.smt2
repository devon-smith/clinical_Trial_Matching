;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 75 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 75)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 75 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_ischemic_discomfort_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had ischemic discomfort at any time within the previous 24 hours.","when_to_set_to_false":"Set to false if the patient has not had ischemic discomfort within the previous 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had ischemic discomfort within the previous 24 hours.","meaning":"Boolean indicating whether the patient has had ischemic discomfort within the previous 24 hours."} // "ischemic discomfort at rest for duration ≥ 20 minutes within the previous 24 hours"
(declare-const patient_has_finding_of_ischemic_discomfort_inthepast24hours@@at_rest Bool) ;; {"when_to_set_to_true":"Set to true if the ischemic discomfort within the previous 24 hours occurred at rest.","when_to_set_to_false":"Set to false if the ischemic discomfort within the previous 24 hours did not occur at rest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ischemic discomfort within the previous 24 hours occurred at rest.","meaning":"Boolean indicating whether the ischemic discomfort within the previous 24 hours occurred at rest."} // "ischemic discomfort at rest"
(declare-const patient_has_finding_of_ischemic_discomfort_inthepast24hours@@duration_minutes Real) ;; {"when_to_set_to_value":"Set to the duration in minutes if the duration of the ischemic discomfort episode(s) within the previous 24 hours is known.","when_to_set_to_null":"Set to null if the duration in minutes is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in minutes of the ischemic discomfort episode(s) within the previous 24 hours."} // "duration ≥ 20 minutes"

(declare-const patient_has_finding_of_ischemic_chest_pain_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had ischemic chest pain at any time within the previous 24 hours.","when_to_set_to_false":"Set to false if the patient has not had ischemic chest pain within the previous 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had ischemic chest pain within the previous 24 hours.","meaning":"Boolean indicating whether the patient has had ischemic chest pain within the previous 24 hours."} // "ischemic chest pain OR ischemic chest pain equivalent"
(declare-const patient_has_finding_of_ischemic_chest_pain_inthepast24hours@@at_rest Bool) ;; {"when_to_set_to_true":"Set to true if the ischemic chest pain within the previous 24 hours occurred at rest.","when_to_set_to_false":"Set to false if the ischemic chest pain within the previous 24 hours did not occur at rest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ischemic chest pain within the previous 24 hours occurred at rest.","meaning":"Boolean indicating whether the ischemic chest pain within the previous 24 hours occurred at rest."} // "ischemic chest pain at rest"
(declare-const patient_has_finding_of_ischemic_chest_pain_inthepast24hours@@duration_minutes Real) ;; {"when_to_set_to_value":"Set to the duration in minutes if the duration of the ischemic chest pain episode(s) within the previous 24 hours is known.","when_to_set_to_null":"Set to null if the duration in minutes is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in minutes of the ischemic chest pain episode(s) within the previous 24 hours."} // "duration ≥ 20 minutes"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples: ischemic chest pain OR ischemic chest pain equivalent imply ischemic discomfort
(assert
  (! (=> patient_has_finding_of_ischemic_chest_pain_inthepast24hours
         patient_has_finding_of_ischemic_discomfort_inthepast24hours)
     :named REQ1_AUXILIARY0)) ;; "ischemic chest pain OR ischemic chest pain equivalent" are examples of "ischemic discomfort"

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_ischemic_discomfort_inthepast24hours@@at_rest
         patient_has_finding_of_ischemic_discomfort_inthepast24hours)
     :named REQ1_AUXILIARY1)) ;; "ischemic discomfort at rest" implies "ischemic discomfort"

(assert
  (! (=> patient_has_finding_of_ischemic_chest_pain_inthepast24hours@@at_rest
         patient_has_finding_of_ischemic_chest_pain_inthepast24hours)
     :named REQ1_AUXILIARY2)) ;; "ischemic chest pain at rest" implies "ischemic chest pain"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have ischemic discomfort at rest for duration ≥ 20 minutes within the previous 24 hours
(assert
  (! (and patient_has_finding_of_ischemic_discomfort_inthepast24hours@@at_rest
          (>= patient_has_finding_of_ischemic_discomfort_inthepast24hours@@duration_minutes 20))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "ischemic discomfort at rest for duration ≥ 20 minutes within the previous 24 hours"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_left_bundle_branch_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a left bundle branch block.","when_to_set_to_false":"Set to false if the patient currently does not have a left bundle branch block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a left bundle branch block.","meaning":"Boolean indicating whether the patient currently has a left bundle branch block."} // "left bundle branch block"
(declare-const patient_has_finding_of_left_bundle_branch_block_now@@detected_on_prehospital_or_admission_electrocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left bundle branch block is detected on either the prehospital or admission electrocardiogram.","when_to_set_to_false":"Set to false if the patient's left bundle branch block is not detected on either the prehospital or admission electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the left bundle branch block is detected on either the prehospital or admission electrocardiogram.","meaning":"Boolean indicating whether the patient's left bundle branch block is detected on either the prehospital or admission electrocardiogram."} // "on the prehospital electrocardiogram OR on the admission electrocardiogram"
(declare-const patient_has_finding_of_left_bundle_branch_block_now@@classification_new_presumably_new_or_old Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left bundle branch block is classified as new, presumably new, or old.","when_to_set_to_false":"Set to false if the patient's left bundle branch block is not classified as new, presumably new, or old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the left bundle branch block is classified as new, presumably new, or old.","meaning":"Boolean indicating whether the patient's left bundle branch block is classified as new, presumably new, or old."} // "new OR presumably new OR old"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for detection on prehospital or admission ECG implies the stem variable
(assert
  (! (=> patient_has_finding_of_left_bundle_branch_block_now@@detected_on_prehospital_or_admission_electrocardiogram
         patient_has_finding_of_left_bundle_branch_block_now)
     :named REQ2_AUXILIARY0)) ;; "left bundle branch block on the prehospital electrocardiogram OR on the admission electrocardiogram"

;; Qualifier variable for classification (new, presumably new, or old) implies the stem variable
(assert
  (! (=> patient_has_finding_of_left_bundle_branch_block_now@@classification_new_presumably_new_or_old
         patient_has_finding_of_left_bundle_branch_block_now)
     :named REQ2_AUXILIARY1)) ;; "left bundle branch block (new OR presumably new OR old)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; To be included, the patient must have a left bundle branch block (classified as new, presumably new, or old) detected on either the prehospital or admission ECG
(assert
  (! (and patient_has_finding_of_left_bundle_branch_block_now@@classification_new_presumably_new_or_old
          patient_has_finding_of_left_bundle_branch_block_now@@detected_on_prehospital_or_admission_electrocardiogram)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "left bundle branch block (new OR presumably new OR old) on the prehospital electrocardiogram OR on the admission electrocardiogram"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_coronary_angiography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary angiography.","when_to_set_to_false":"Set to false if the patient has never undergone coronary angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary angiography.","meaning":"Boolean indicating whether the patient has ever undergone coronary angiography."} // "the patient must undergo (urgent coronary angiography ...)"
(declare-const patient_has_undergone_coronary_angiography_inthehistory@@urgent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary angiography was performed urgently.","when_to_set_to_false":"Set to false if the patient's coronary angiography was not performed urgently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coronary angiography was performed urgently.","meaning":"Boolean indicating whether the patient's coronary angiography was performed urgently."} // "urgent coronary angiography"
(declare-const patient_has_undergone_coronary_angiography_inthehistory@@temporalcontext_within90minutes_after_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary angiography was performed within 90 minutes after admission.","when_to_set_to_false":"Set to false if the patient's coronary angiography was not performed within 90 minutes after admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coronary angiography was performed within 90 minutes after admission.","meaning":"Boolean indicating whether the patient's coronary angiography was performed within 90 minutes after admission."} // "ideally within 90 minutes after admission"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone percutaneous coronary intervention.","when_to_set_to_false":"Set to false if the patient has never undergone percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient has ever undergone percutaneous coronary intervention."} // "followed, when indicated, by percutaneous coronary intervention"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@when_indicated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's percutaneous coronary intervention was performed only when indicated.","when_to_set_to_false":"Set to false if the patient's percutaneous coronary intervention was performed when not indicated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the percutaneous coronary intervention was performed only when indicated.","meaning":"Boolean indicating whether the patient's percutaneous coronary intervention was performed only when indicated."} // "when indicated"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@after_coronary_angiography Bool) ;; {"when_to_set_to_true":"Set to true if the patient's percutaneous coronary intervention was performed after coronary angiography.","when_to_set_to_false":"Set to false if the patient's percutaneous coronary intervention was not performed after coronary angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the percutaneous coronary intervention was performed after coronary angiography.","meaning":"Boolean indicating whether the patient's percutaneous coronary intervention was performed after coronary angiography."} // "followed ... by percutaneous coronary intervention"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_undergone_coronary_angiography_inthehistory@@urgent
         patient_has_undergone_coronary_angiography_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "urgent coronary angiography"

(assert
  (! (=> patient_has_undergone_coronary_angiography_inthehistory@@temporalcontext_within90minutes_after_admission
         patient_has_undergone_coronary_angiography_inthehistory)
     :named REQ3_AUXILIARY1)) ;; "coronary angiography ... within 90 minutes after admission"

(assert
  (! (=> patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@when_indicated
         patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
     :named REQ3_AUXILIARY2)) ;; "percutaneous coronary intervention ... when indicated"

(assert
  (! (=> patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@after_coronary_angiography
         patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
     :named REQ3_AUXILIARY3)) ;; "percutaneous coronary intervention ... after coronary angiography"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: The patient must undergo urgent coronary angiography (ideally within 90 minutes after admission), followed when indicated by percutaneous coronary intervention.
(assert
  (! (and patient_has_undergone_coronary_angiography_inthehistory@@urgent
          (or (not patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
              patient_has_undergone_percutaneous_coronary_intervention_inthehistory@@when_indicated)
          patient_has_undergone_coronary_angiography_inthehistory@@temporalcontext_within90minutes_after_admission)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must undergo urgent coronary angiography (followed, when indicated, by percutaneous coronary intervention) ideally within 90 minutes after admission"
