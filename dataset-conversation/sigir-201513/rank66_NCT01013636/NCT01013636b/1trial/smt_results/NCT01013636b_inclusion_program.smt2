;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of fever.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."}  // "To be included, the patient must have fever."
(declare-const patient_has_finding_of_thrombocytopenic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of thrombocytopenia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of thrombocytopenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has thrombocytopenia.","meaning":"Boolean indicating whether the patient currently has thrombocytopenia."}  // "To be included, the patient must have at least one of the following (thrombocytopenia OR leucopenia OR hepatitis)."
(declare-const patient_has_finding_of_decreased_blood_leukocyte_number_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of leucopenia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of leucopenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has leucopenia.","meaning":"Boolean indicating whether the patient currently has leucopenia."}  // "To be included, the patient must have at least one of the following (thrombocytopenia OR leucopenia OR hepatitis)."
(declare-const patient_has_finding_of_inflammatory_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hepatitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hepatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatitis.","meaning":"Boolean indicating whether the patient currently has hepatitis."}  // "To be included, the patient must have at least one of the following (thrombocytopenia OR leucopenia OR hepatitis)."
(declare-const patient_has_finding_of_fever_now@@not_explained_by_other_cause Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever and there is no other cause that can explain the fever.","when_to_set_to_false":"Set to false if the patient currently has fever but there is another cause that can explain the fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether another cause explains the fever.","meaning":"Boolean indicating whether the patient's current fever is not explained by any other cause."}  // "To be included, the patient must NOT have any other cause that can explain (fever OR thrombocytopenia OR leucopenia OR hepatitis)."
(declare-const patient_has_finding_of_thrombocytopenic_disorder_now@@not_explained_by_other_cause Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has thrombocytopenia and there is no other cause that can explain the thrombocytopenia.","when_to_set_to_false":"Set to false if the patient currently has thrombocytopenia but there is another cause that can explain the thrombocytopenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether another cause explains the thrombocytopenia.","meaning":"Boolean indicating whether the patient's current thrombocytopenia is not explained by any other cause."}  // "To be included, the patient must NOT have any other cause that can explain (fever OR thrombocytopenia OR leucopenia OR hepatitis)."
(declare-const patient_has_finding_of_decreased_blood_leukocyte_number_now@@not_explained_by_other_cause Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has leucopenia and there is no other cause that can explain the leucopenia.","when_to_set_to_false":"Set to false if the patient currently has leucopenia but there is another cause that can explain the leucopenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether another cause explains the leucopenia.","meaning":"Boolean indicating whether the patient's current leucopenia is not explained by any other cause."}  // "To be included, the patient must NOT have any other cause that can explain (fever OR thrombocytopenia OR leucopenia OR hepatitis)."
(declare-const patient_has_finding_of_inflammatory_disease_of_liver_now@@not_explained_by_other_cause Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatitis and there is no other cause that can explain the hepatitis.","when_to_set_to_false":"Set to false if the patient currently has hepatitis but there is another cause that can explain the hepatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether another cause explains the hepatitis.","meaning":"Boolean indicating whether the patient's current hepatitis is not explained by any other cause."}  // "To be included, the patient must NOT have any other cause that can explain (fever OR thrombocytopenia OR leucopenia OR hepatitis)."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_fever_now@@not_explained_by_other_cause
         patient_has_finding_of_fever_now)
     :named REQ0_AUXILIARY0))  ;; "To be included, the patient must NOT have any other cause that can explain fever."

(assert
  (! (=> patient_has_finding_of_thrombocytopenic_disorder_now@@not_explained_by_other_cause
         patient_has_finding_of_thrombocytopenic_disorder_now)
     :named REQ0_AUXILIARY1))  ;; "To be included, the patient must NOT have any other cause that can explain thrombocytopenia."

(assert
  (! (=> patient_has_finding_of_decreased_blood_leukocyte_number_now@@not_explained_by_other_cause
         patient_has_finding_of_decreased_blood_leukocyte_number_now)
     :named REQ0_AUXILIARY2))  ;; "To be included, the patient must NOT have any other cause that can explain leucopenia."

(assert
  (! (=> patient_has_finding_of_inflammatory_disease_of_liver_now@@not_explained_by_other_cause
         patient_has_finding_of_inflammatory_disease_of_liver_now)
     :named REQ0_AUXILIARY3))  ;; "To be included, the patient must NOT have any other cause that can explain hepatitis."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must have fever
(assert
  (! patient_has_finding_of_fever_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS))  ;; "To be included, the patient must have fever."

;; Component 1: Patient must have at least one of (thrombocytopenia OR leucopenia OR hepatitis)
(assert
  (! (or patient_has_finding_of_thrombocytopenic_disorder_now
         patient_has_finding_of_decreased_blood_leukocyte_number_now
         patient_has_finding_of_inflammatory_disease_of_liver_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS))  ;; "To be included, the patient must have at least one of the following (thrombocytopenia OR leucopenia OR hepatitis)."

;; Component 2: Patient must NOT have any other cause that can explain (fever OR thrombocytopenia OR leucopenia OR hepatitis)
(assert
  (! (and patient_has_finding_of_fever_now@@not_explained_by_other_cause
          (or patient_has_finding_of_thrombocytopenic_disorder_now@@not_explained_by_other_cause
              patient_has_finding_of_decreased_blood_leukocyte_number_now@@not_explained_by_other_cause
              patient_has_finding_of_inflammatory_disease_of_liver_now@@not_explained_by_other_cause))
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS))  ;; "To be included, the patient must NOT have any other cause that can explain (fever OR thrombocytopenia OR leucopenia OR hepatitis)."
