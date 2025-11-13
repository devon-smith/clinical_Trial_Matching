;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_deep_venous_thrombosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of deep venous thrombosis (DVT).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of deep venous thrombosis (DVT).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of deep venous thrombosis (DVT).","meaning":"Boolean indicating whether the patient currently has a diagnosis of deep venous thrombosis (DVT)."}  ;; "deep vein thrombosis"
(declare-const patient_has_diagnosis_of_deep_venous_thrombosis_now@@confirmed_by_ultrasonography Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of deep venous thrombosis (DVT) is confirmed by ultrasonography (ultrasound).","when_to_set_to_false":"Set to false if the patient's current diagnosis of deep venous thrombosis (DVT) is not confirmed by ultrasonography (ultrasound).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of deep venous thrombosis (DVT) is confirmed by ultrasonography (ultrasound).","meaning":"Boolean indicating whether the patient's current diagnosis of deep venous thrombosis (DVT) is confirmed by ultrasonography (ultrasound)."}  ;; "ultrasound-confirmed deep vein thrombosis"
(declare-const patient_has_undergone_ultrasonography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone ultrasonography (ultrasound) now.","when_to_set_to_false":"Set to false if the patient has not undergone ultrasonography (ultrasound) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone ultrasonography (ultrasound) now.","meaning":"Boolean indicating whether the patient has undergone ultrasonography (ultrasound) now."}  ;; "ultrasound"
(declare-const patient_is_from_institution_in_study_list Bool) ;; {"when_to_set_to_true":"Set to true if the patient is from one of the 183 institutions included in the study.","when_to_set_to_false":"Set to false if the patient is not from one of the 183 institutions included in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is from one of the 183 institutions included in the study.","meaning":"Boolean indicating whether the patient is from one of the 183 institutions included in the study."}  ;; "must be from one of the 183 institutions"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable (if diagnosis is confirmed by ultrasound, then diagnosis is present)
(assert
  (! (=> patient_has_diagnosis_of_deep_venous_thrombosis_now@@confirmed_by_ultrasonography
         patient_has_diagnosis_of_deep_venous_thrombosis_now)
     :named REQ0_AUXILIARY0)) ;; "ultrasound-confirmed deep vein thrombosis" implies "deep vein thrombosis"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must have ultrasound-confirmed deep vein thrombosis
(assert
  (! patient_has_diagnosis_of_deep_venous_thrombosis_now@@confirmed_by_ultrasonography
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have ultrasound-confirmed deep vein thrombosis."

;; Component 1: Patient must be from one of the 183 institutions
(assert
  (! patient_is_from_institution_in_study_list
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be from one of the 183 institutions."
