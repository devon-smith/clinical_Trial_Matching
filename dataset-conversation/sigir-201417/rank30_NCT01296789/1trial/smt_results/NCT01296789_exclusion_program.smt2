;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_disorder_of_the_central_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of central nervous system disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of central nervous system disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of central nervous system disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of central nervous system disease."} ;; "central nervous system disease"
(declare-const patient_is_admitted_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to the hospital.","when_to_set_to_false":"Set to false if the patient is not currently admitted to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to the hospital.","meaning":"Boolean indicating whether the patient is currently admitted to the hospital."} ;; "admitted"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_is_admitted_now patient_has_diagnosis_of_disorder_of_the_central_nervous_system_now))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is admitted with central nervous system disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute ST segment elevation myocardial infarction (STEMI).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute ST segment elevation myocardial infarction (STEMI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute ST segment elevation myocardial infarction (STEMI).","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute ST segment elevation myocardial infarction (STEMI)."} ;; "ST elevation myocardial infarction"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ST elevation myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_pulmonary_embolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of pulmonary embolism.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of pulmonary embolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of pulmonary embolism.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of pulmonary embolism."} ;; "pulmonary embolism"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_pulmonary_embolism_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pulmonary embolism."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_cardiac_arrest_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of cardiac arrest.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of cardiac arrest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of cardiac arrest.","meaning":"Boolean indicating whether the patient currently has a finding of cardiac arrest."} ;; "cardiac arrest"
(declare-const patient_has_finding_of_cardiac_arrest_now@@out_of_hospital_context Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiac arrest occurred out of hospital.","when_to_set_to_false":"Set to false if the patient's cardiac arrest did not occur out of hospital (i.e., occurred in hospital).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiac arrest occurred out of hospital.","meaning":"Boolean indicating whether the patient's cardiac arrest occurred out of hospital."} ;; "out of hospital cardiac arrest"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_cardiac_arrest_now@@out_of_hospital_context
      patient_has_finding_of_cardiac_arrest_now)
:named REQ3_AUXILIARY0)) ;; "out of hospital cardiac arrest patient" implies "cardiac arrest"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_cardiac_arrest_now@@out_of_hospital_context)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is an out of hospital cardiac arrest patient."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_therapeutic_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any therapeutic procedure at the present time.","when_to_set_to_false":"Set to false if the patient has not undergone any therapeutic procedure at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any therapeutic procedure at the present time.","meaning":"Boolean indicating whether the patient has undergone any therapeutic procedure now."} ;; "therapy"
(declare-const patient_has_undergone_therapeutic_procedure_now@@limitation_present Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a limitation present on therapeutic procedures now.","when_to_set_to_false":"Set to false if the patient does not have a limitation present on therapeutic procedures now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a limitation is present on therapeutic procedures now.","meaning":"Boolean indicating whether a limitation is present on therapeutic procedures now."} ;; "therapy limitation"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_therapeutic_procedure_now@@limitation_present
      patient_has_undergone_therapeutic_procedure_now)
:named REQ4_AUXILIARY0)) ;; "therapy limitation" qualifier implies therapy

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_undergone_therapeutic_procedure_now@@limitation_present)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has therapy limitation."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if there is documented evidence that the patient is currently pregnant.","when_to_set_to_false":"Set to false if there is documented evidence that the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently known to be pregnant."} ;; "known pregnancy"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known pregnancy."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_included_in_other_interventional_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently included in an interventional trial other than the present one.","when_to_set_to_false":"Set to false if the patient is not currently included in any other interventional trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently included in another interventional trial.","meaning":"Boolean indicating whether the patient is currently included in another interventional trial (not the present one)."} ;; "included in other interventional trial"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_included_in_other_interventional_trial_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is included in other interventional trial."
