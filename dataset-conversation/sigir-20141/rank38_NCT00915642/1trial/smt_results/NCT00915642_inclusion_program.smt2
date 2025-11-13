;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_normal_weight_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of normal weight.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of normal weight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of normal weight.","meaning":"Boolean indicating whether the patient currently has normal weight."}  ;; "normal weight"
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of obesity.","meaning":"Boolean indicating whether the patient currently has obesity."}  ;; "obesity"
(declare-const patient_is_volunteer Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a volunteer.","when_to_set_to_false":"Set to false if the patient is not a volunteer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a volunteer.","meaning":"Boolean indicating whether the patient is a volunteer."}  ;; "volunteer"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must be (a volunteer with obesity) OR (a volunteer with normal weight).
(assert
  (! (or (and patient_is_volunteer patient_has_finding_of_obesity_now)
         (and patient_is_volunteer patient_has_finding_of_normal_weight_now))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))
