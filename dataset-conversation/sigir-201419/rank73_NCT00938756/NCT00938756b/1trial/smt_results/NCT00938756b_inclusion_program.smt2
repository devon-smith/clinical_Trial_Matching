;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."} // "another type of cancer"
(declare-const patient_has_finding_of_malignant_meningitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of malignant meningitis (carcinomatous meningitis).","when_to_set_to_false":"Set to false if the patient currently does not have a finding of malignant meningitis (carcinomatous meningitis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of malignant meningitis (carcinomatous meningitis).","meaning":"Boolean indicating whether the patient currently has a finding of malignant meningitis (carcinomatous meningitis)."} // "carcinomatous meningitis"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must have another type of cancer.
(assert
  (! patient_has_diagnosis_of_malignant_neoplastic_disease_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have another type of cancer."

;; Component 1: To be included, the patient must have evidence suggestive of carcinomatous meningitis.
(assert
  (! patient_has_finding_of_malignant_meningitis_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have evidence suggestive of carcinomatous meningitis."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with any malignant neoplastic disease (cancer) at any time in their history prior to the present.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with any malignant neoplastic disease (cancer) at any time in their history prior to the present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with any malignant neoplastic disease (cancer) in their history.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplastic disease (cancer) at any time in their history."} // "any other prior cancer"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must NOT have any other prior cancer.
(assert
  (! (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have any other prior cancer."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} // "must NOT be pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} // "NOT be nursing"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must NOT be pregnant AND NOT be nursing.
(assert
  (! (and (not patient_is_pregnant_now)
          (not patient_is_breastfeeding_now))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_medication_administration_intrathecal_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone intrathecal medication administration at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone intrathecal medication administration at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone intrathecal medication administration in the past.","meaning":"Boolean indicating whether the patient has ever undergone intrathecal medication administration at any time in the past."} // "prior intrathecal treatment"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must NOT have had prior intrathecal treatment.
(assert
  (! (not patient_has_undergone_medication_administration_intrathecal_inthehistory)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const time_since_prior_interferon_treatment_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks since the patient's most recent prior interferon treatment, if such treatment occurred and the time is known.","when_to_set_to_null":"Set to null if the patient has never received interferon treatment, or if the time since prior interferon treatment is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of weeks since the patient's most recent prior interferon treatment."} // "time since prior interferon treatment ≥ 4 weeks"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (>= time_since_prior_interferon_treatment_in_weeks 4.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have had time since prior interferon treatment ≥ 4 weeks"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_participating_in_another_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in another clinical trial concurrently with the index study.","when_to_set_to_false":"Set to false if the patient is not currently participating in another clinical trial concurrently with the index study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in another clinical trial concurrently with the index study.","meaning":"Boolean indicating whether the patient is currently participating in another clinical trial at the same time as the index study."} // "must NOT be participating concurrently in another clinical trial"
(declare-const patient_is_participating_in_another_clinical_trial_now@@concurrently Bool) ;; {"when_to_set_to_true":"Set to true if the patient's participation in another clinical trial is concurrent with participation in the index study.","when_to_set_to_false":"Set to false if the patient's participation in another clinical trial is not concurrent with participation in the index study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's participation in another clinical trial is concurrent with participation in the index study.","meaning":"Boolean indicating whether the patient's participation in another clinical trial is concurrent with participation in the index study."} // "concurrently in another clinical trial"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_participating_in_another_clinical_trial_now@@concurrently
         patient_is_participating_in_another_clinical_trial_now)
     :named REQ5_AUXILIARY0)) ;; "concurrent participation in another clinical trial" implies "participating in another clinical trial"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must NOT be participating concurrently in another clinical trial.
(assert
  (! (not patient_is_participating_in_another_clinical_trial_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT be participating concurrently in another clinical trial"
