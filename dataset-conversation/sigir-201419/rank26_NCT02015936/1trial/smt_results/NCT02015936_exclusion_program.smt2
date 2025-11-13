;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_patient_in_hospital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hospitalized (admitted to a hospital at the present time).","when_to_set_to_false":"Set to false if the patient is currently not hospitalized (not admitted to a hospital at the present time).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hospitalized.","meaning":"Boolean indicating whether the patient is currently hospitalized (admitted to a hospital at the present time)."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_patient_in_hospital_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is hospitalized."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_lesion_of_bone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of lesion of bone.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of lesion of bone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of lesion of bone.","meaning":"Boolean indicating whether the patient currently has a lesion of bone."} ;; "the patient has a lesion of bone"
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_bone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of secondary malignant neoplasm of bone (bone metastasis).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of secondary malignant neoplasm of bone (bone metastasis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of secondary malignant neoplasm of bone (bone metastasis).","meaning":"Boolean indicating whether the patient currently has a secondary malignant neoplasm of bone (bone metastasis)."} ;; "the patient has a metastasis of bone"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (or patient_has_finding_of_lesion_of_bone_now
              patient_has_finding_of_secondary_malignant_neoplasm_of_bone_now))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a lesion of bone) OR (the patient has a metastasis of bone)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_cardiac_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cardiac pacemaker.","when_to_set_to_false":"Set to false if the patient currently does not have a cardiac pacemaker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cardiac pacemaker.","meaning":"Boolean indicating whether the patient currently has a cardiac pacemaker."} ;; "The patient is excluded if the patient has a cardiac pacemaker."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_cardiac_pacemaker_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a cardiac pacemaker."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_seizure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a seizure at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a seizure at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a seizure.","meaning":"Boolean indicating whether the patient has ever had a seizure in their medical history."} ;; "the patient has a history of seizure"
(declare-const patient_has_finding_of_loss_of_consciousness_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a loss of consciousness at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a loss of consciousness at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a loss of consciousness.","meaning":"Boolean indicating whether the patient has ever had a loss of consciousness in their medical history."} ;; "the patient has a history of loss of consciousness"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_finding_of_seizure_inthehistory)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of seizure."

(assert
  (! (not patient_has_finding_of_loss_of_consciousness_inthehistory)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of loss of consciousness."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_history_of_using_wii_fit Bool) ;; {"when_to_set_to_true":"Set to true if there is evidence or documentation that the patient has used a Wii Fit at any time in the past.","when_to_set_to_false":"Set to false if there is evidence or documentation that the patient has never used a Wii Fit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever used a Wii Fit.","meaning":"Boolean indicating whether the patient has a history of using a Wii Fit."} ;; "The patient is excluded if the patient has been using a Wii Fit."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_history_of_using_wii_fit)
:named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has been using a Wii Fit."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of impaired cognition.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of impaired cognition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of impaired cognition.","meaning":"Boolean indicating whether the patient currently has a diagnosis of impaired cognition."} ;; "The patient is excluded if the patient has diagnosed cognitive impairment."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_impaired_cognition_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diagnosed cognitive impairment."
