;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_megavoltage_radiation_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever previously undergone mega-voltage external beam radiotherapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone mega-voltage external beam radiotherapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone mega-voltage external beam radiotherapy.","meaning":"Boolean indicating whether the patient has ever previously undergone mega-voltage external beam radiotherapy."} ;; "the patient has previously received mega-voltage external beam radiotherapy"

(declare-const patient_has_undergone_brachytherapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever previously undergone brachytherapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone brachytherapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone brachytherapy.","meaning":"Boolean indicating whether the patient has ever previously undergone brachytherapy."} ;; "the patient has previously received brachytherapy"

(declare-const patient_has_undergone_brachytherapy_inthehistory@@delivered_to_region_of_chest Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prior brachytherapy was delivered to the region of the chest.","when_to_set_to_false":"Set to false if the patient's prior brachytherapy was not delivered to the region of the chest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's prior brachytherapy was delivered to the region of the chest.","meaning":"Boolean indicating whether the patient's prior brachytherapy was delivered to the region of the chest."} ;; "the patient has previously received brachytherapy delivered to the region of the chest"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_brachytherapy_inthehistory@@delivered_to_region_of_chest
       patient_has_undergone_brachytherapy_inthehistory)
   :named REQ0_AUXILIARY0)) ;; "brachytherapy delivered to the region of the chest" implies "brachytherapy"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or patient_has_undergone_megavoltage_radiation_therapy_inthehistory
            patient_has_undergone_brachytherapy_inthehistory@@delivered_to_region_of_chest))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has previously received mega-voltage external beam radiotherapy) OR (the patient has previously received brachytherapy delivered to the region of the chest)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease (malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease (malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease (malignancy)."} ;; "malignancy"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@synchronous Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current malignant neoplastic disease (malignancy) is synchronous.","when_to_set_to_false":"Set to false if the patient's current malignant neoplastic disease (malignancy) is not synchronous.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current malignant neoplastic disease (malignancy) is synchronous.","meaning":"Boolean indicating whether the patient's current malignant neoplastic disease (malignancy) is synchronous."} ;; "synchronous"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current malignant neoplastic disease (malignancy) is active.","when_to_set_to_false":"Set to false if the patient's current malignant neoplastic disease (malignancy) is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current malignant neoplastic disease (malignancy) is active.","meaning":"Boolean indicating whether the patient's current malignant neoplastic disease (malignancy) is active."} ;; "active"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@synchronous
       patient_has_finding_of_malignant_neoplastic_disease_now)
:named REQ1_AUXILIARY0)) ;; "synchronous"

(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@active
       patient_has_finding_of_malignant_neoplastic_disease_now)
:named REQ1_AUXILIARY1)) ;; "active"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and patient_has_finding_of_malignant_neoplastic_disease_now@@synchronous
             patient_has_finding_of_malignant_neoplastic_disease_now@@active))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has synchronous active malignancy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently known not to be lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
  (! (not patient_is_lactating_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_unfit_for_any_treatment_component_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unfit for at least one treatment component.","when_to_set_to_false":"Set to false if the patient is currently fit for all treatment components.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unfit for any treatment component.","meaning":"Boolean indicating whether the patient is currently unfit for any treatment component."} ;; "The patient is excluded if the patient is unfit for any treatment component."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_unfit_for_any_treatment_component_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unfit for any treatment component."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_tracheoesophageal_fistula_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of tracheoesophageal fistula.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of tracheoesophageal fistula.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of tracheoesophageal fistula.","meaning":"Boolean indicating whether the patient currently has a tracheoesophageal fistula."} ;; "tracheo-oesophageal fistula"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_tracheoesophageal_fistula_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a tracheo-oesophageal fistula."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_stent_in_situ_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a stent in situ.","when_to_set_to_false":"Set to false if the patient currently does not have a stent in situ.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a stent in situ.","meaning":"Boolean indicating whether the patient currently has a stent in situ."} ;; "The patient is excluded if the patient has a stent in situ."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_stent_in_situ_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a stent in situ."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_undergone_chemotherapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone chemotherapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone chemotherapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone chemotherapy.","meaning":"Boolean indicating whether the patient has ever undergone chemotherapy at any time in the past."} ;; "chemotherapy"
(declare-const patient_has_undergone_chemotherapy_inthehistory@@for_oesophageal_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone chemotherapy for oesophageal cancer at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone chemotherapy for oesophageal cancer at any time in the past, or if all chemotherapy was for other indications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone chemotherapy for oesophageal cancer.","meaning":"Boolean indicating whether the patient has ever undergone chemotherapy for oesophageal cancer at any time in the past."} ;; "chemotherapy for oesophageal cancer"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_chemotherapy_inthehistory@@for_oesophageal_cancer
      patient_has_undergone_chemotherapy_inthehistory)
:named REQ6_AUXILIARY0)) ;; "chemotherapy for oesophageal cancer" implies "chemotherapy"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_undergone_chemotherapy_inthehistory@@for_oesophageal_cancer)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously received chemotherapy for oesophageal cancer."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const ct_of_chest_time_since_last_scan_prior_to_randomization_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks since the patient's most recent computed tomography scan of the thorax prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient's most recent computed tomography scan of the thorax occurred prior to randomization.","meaning":"Numeric variable indicating the number of weeks since the patient's most recent computed tomography scan of the thorax prior to randomization."} ;; "computed tomography scan of the thorax more than eight weeks prior to randomization"

(declare-const ct_of_abdomen_time_since_last_scan_prior_to_randomization_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks since the patient's most recent computed tomography scan of the abdomen prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient's most recent computed tomography scan of the abdomen occurred prior to randomization.","meaning":"Numeric variable indicating the number of weeks since the patient's most recent computed tomography scan of the abdomen prior to randomization."} ;; "computed tomography scan of the abdomen more than eight weeks prior to randomization"

(declare-const patient_has_undergone_ct_of_chest_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a computed tomography scan of the thorax (chest) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a computed tomography scan of the thorax (chest) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a computed tomography scan of the thorax (chest).","meaning":"Boolean indicating whether the patient has ever undergone a computed tomography scan of the thorax (chest) at any time in the past."} ;; "computed tomography scan of the thorax"

(declare-const patient_has_undergone_ct_of_abdomen_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a computed tomography scan of the abdomen at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a computed tomography scan of the abdomen at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a computed tomography scan of the abdomen.","meaning":"Boolean indicating whether the patient has ever undergone a computed tomography scan of the abdomen at any time in the past."} ;; "computed tomography scan of the abdomen"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (and patient_has_undergone_ct_of_chest_inthehistory
             (> ct_of_chest_time_since_last_scan_prior_to_randomization_in_weeks 8)))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a computed tomography scan of the thorax more than eight weeks prior to randomization."

(assert
(! (not (and patient_has_undergone_ct_of_abdomen_inthehistory
             (> ct_of_abdomen_time_since_last_scan_prior_to_randomization_in_weeks 8)))
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a computed tomography scan of the abdomen more than eight weeks prior to randomization."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_complete_blood_count_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a complete blood count procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a complete blood count procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a complete blood count procedure.","meaning":"Boolean indicating whether the patient has ever undergone a complete blood count procedure at any time in the past."} ;; "full blood count"
(declare-const patient_has_undergone_complete_blood_count_time_since_last_procedure_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient last underwent a complete blood count procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient last underwent a complete blood count procedure.","meaning":"Numeric variable representing the number of days since the patient last underwent a complete blood count procedure."} ;; "full blood count performed more than two weeks prior to randomization"
(declare-const patient_has_undergone_blood_chemistry_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a blood chemistry procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a blood chemistry procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a blood chemistry procedure.","meaning":"Boolean indicating whether the patient has ever undergone a blood chemistry procedure at any time in the past."} ;; "biochemistry"
(declare-const patient_has_undergone_blood_chemistry_inthehistory@@includes_creatinine Bool) ;; {"when_to_set_to_true":"Set to true if the patient's blood chemistry procedure included creatinine measurement.","when_to_set_to_false":"Set to false if the patient's blood chemistry procedure did not include creatinine measurement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether creatinine was included in the blood chemistry procedure.","meaning":"Boolean indicating whether the patient's blood chemistry procedure included creatinine measurement."} ;; "biochemistry including creatinine"
(declare-const patient_has_undergone_blood_chemistry_time_since_last_procedure_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient last underwent a blood chemistry procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient last underwent a blood chemistry procedure.","meaning":"Numeric variable representing the number of days since the patient last underwent a blood chemistry procedure."} ;; "biochemistry performed more than two weeks prior to randomization"
(declare-const patient_has_undergone_blood_chemistry_time_since_last_procedure_in_days@@includes_creatinine Bool) ;; {"when_to_set_to_true":"Set to true if the patient's last blood chemistry procedure included creatinine measurement.","when_to_set_to_false":"Set to false if the patient's last blood chemistry procedure did not include creatinine measurement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether creatinine was included in the last blood chemistry procedure.","meaning":"Boolean indicating whether the patient's last blood chemistry procedure included creatinine measurement."} ;; "biochemistry including creatinine performed more than two weeks prior to randomization"
(declare-const patient_has_undergone_measurement_of_renal_clearance_of_creatinine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a measurement of renal clearance of creatinine at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a measurement of renal clearance of creatinine at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a measurement of renal clearance of creatinine.","meaning":"Boolean indicating whether the patient has ever undergone a measurement of renal clearance of creatinine at any time in the past."} ;; "creatinine clearance"
(declare-const patient_has_undergone_measurement_of_renal_clearance_of_creatinine_time_since_last_procedure_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient last underwent a measurement of renal clearance of creatinine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient last underwent a measurement of renal clearance of creatinine.","meaning":"Numeric variable representing the number of days since the patient last underwent a measurement of renal clearance of creatinine."} ;; "creatinine clearance performed more than two weeks prior to randomization"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion if full blood count performed more than two weeks prior to randomization
(assert
(! (not (> patient_has_undergone_complete_blood_count_time_since_last_procedure_in_days 14))
:named REQ8_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has had a full blood count performed more than two weeks prior to randomization."

;; Exclusion if biochemistry (including creatinine) performed more than two weeks prior to randomization
(assert
(! (not (and patient_has_undergone_blood_chemistry_time_since_last_procedure_in_days@@includes_creatinine
             (> patient_has_undergone_blood_chemistry_time_since_last_procedure_in_days 14)))
:named REQ8_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has had biochemistry including creatinine performed more than two weeks prior to randomization."

;; Exclusion if creatinine clearance performed more than two weeks prior to randomization
(assert
(! (not (> patient_has_undergone_measurement_of_renal_clearance_of_creatinine_time_since_last_procedure_in_days 14))
:named REQ8_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has had creatinine clearance performed more than two weeks prior to randomization."
