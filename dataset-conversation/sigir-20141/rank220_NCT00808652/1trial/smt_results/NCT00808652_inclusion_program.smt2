;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_morbid_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of morbid obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of morbid obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of morbid obesity.","meaning":"Boolean indicating whether the patient currently has morbid obesity."}  ;; "To be included, the patient must have morbid obesity."
(declare-const patient_has_finding_of_morbid_obesity_now@@fulfills_national_institutes_of_health_criteria_for_surgical_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the patient's morbid obesity fulfills the National Institutes of Health criteria for surgical intervention.","when_to_set_to_false":"Set to false if the patient's morbid obesity does not fulfill the National Institutes of Health criteria for surgical intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's morbid obesity fulfills the National Institutes of Health criteria for surgical intervention.","meaning":"Boolean indicating whether the patient's morbid obesity fulfills the National Institutes of Health criteria for surgical intervention."}  ;; "To be included, the patient must fulfill the National Institutes of Health criteria for surgical intervention."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_morbid_obesity_now@@fulfills_national_institutes_of_health_criteria_for_surgical_intervention
         patient_has_finding_of_morbid_obesity_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must fulfill the National Institutes of Health criteria for surgical intervention."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_morbid_obesity_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have morbid obesity."

(assert
  (! patient_has_finding_of_morbid_obesity_now@@fulfills_national_institutes_of_health_criteria_for_surgical_intervention
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must fulfill the National Institutes of Health criteria for surgical intervention."
