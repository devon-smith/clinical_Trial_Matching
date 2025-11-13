;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_malignant_essential_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of malignant essential hypertension (accelerated hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of malignant essential hypertension (accelerated hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant essential hypertension (accelerated hypertension).","meaning":"Boolean indicating whether the patient currently has malignant essential hypertension (accelerated hypertension)."} ;; "accelerated hypertension"
(declare-const patient_has_finding_of_retinal_hemorrhage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of retinal hemorrhage.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of retinal hemorrhage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has retinal hemorrhage.","meaning":"Boolean indicating whether the patient currently has retinal hemorrhage."} ;; "retinal haemorrhages"
(declare-const patient_has_finding_of_cotton_wool_spots_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cotton wool spots (retinal exudates).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cotton wool spots (retinal exudates).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cotton wool spots (retinal exudates).","meaning":"Boolean indicating whether the patient currently has cotton wool spots (retinal exudates)."} ;; "retinal exudates"
(declare-const patient_has_finding_of_optic_disc_edema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of optic disc edema (papilloedema).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of optic disc edema (papilloedema).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has optic disc edema (papilloedema).","meaning":"Boolean indicating whether the patient currently has optic disc edema (papilloedema)."} ;; "papilloedema"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_retinal_hemorrhage_now
          patient_has_finding_of_cotton_wool_spots_now
          patient_has_finding_of_optic_disc_edema_now)
     patient_has_finding_of_malignant_essential_hypertension_now)
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples ((retinal haemorrhages) OR (retinal exudates) OR (papilloedema))."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_malignant_essential_hypertension_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has accelerated hypertension with non-exhaustive examples ((retinal haemorrhages) OR (retinal exudates) OR (papilloedema))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_has_finding_of_congestive_heart_failure_now@@requires_treatment_with_diuretic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's congestive heart failure requires treatment with a diuretic.","when_to_set_to_false":"Set to false if the patient's congestive heart failure does not require treatment with a diuretic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's congestive heart failure requires treatment with a diuretic.","meaning":"Boolean indicating whether the patient's congestive heart failure requires treatment with a diuretic."} ;; "requiring treatment with a diuretic"
(declare-const patient_has_finding_of_congestive_heart_failure_now@@requires_treatment_with_angiotensin_converting_enzyme_inhibitor Bool) ;; {"when_to_set_to_true":"Set to true if the patient's congestive heart failure requires treatment with an angiotensin converting enzyme inhibitor.","when_to_set_to_false":"Set to false if the patient's congestive heart failure does not require treatment with an angiotensin converting enzyme inhibitor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's congestive heart failure requires treatment with an angiotensin converting enzyme inhibitor.","meaning":"Boolean indicating whether the patient's congestive heart failure requires treatment with an angiotensin converting enzyme inhibitor."} ;; "requiring treatment with an angiotensin converting enzyme (ACE) inhibitor"
(declare-const patient_is_taking_digoxin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with digoxin.","when_to_set_to_false":"Set to false if the patient is currently not being treated with digoxin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with digoxin.","meaning":"Boolean indicating whether the patient is currently being treated with digoxin."} ;; "digoxin"
(declare-const patient_is_taking_digoxin_now@@is_only_treatment_patient_is_receiving Bool) ;; {"when_to_set_to_true":"Set to true if digoxin is the only treatment the patient is currently receiving.","when_to_set_to_false":"Set to false if the patient is currently receiving other treatments in addition to digoxin or is not receiving digoxin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether digoxin is the only treatment the patient is receiving.","meaning":"Boolean indicating whether digoxin is the only treatment the patient is currently receiving."} ;; "digoxin only"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_congestive_heart_failure_now@@requires_treatment_with_diuretic
      patient_has_finding_of_congestive_heart_failure_now)
:named REQ1_AUXILIARY0)) ;; "requiring treatment with a diuretic"

(assert
(! (=> patient_has_finding_of_congestive_heart_failure_now@@requires_treatment_with_angiotensin_converting_enzyme_inhibitor
      patient_has_finding_of_congestive_heart_failure_now)
:named REQ1_AUXILIARY1)) ;; "requiring treatment with an angiotensin converting enzyme (ACE) inhibitor"

(assert
(! (=> patient_is_taking_digoxin_now@@is_only_treatment_patient_is_receiving
      patient_is_taking_digoxin_now)
:named REQ1_AUXILIARY2)) ;; "digoxin only"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have CHF requiring diuretic or ACE inhibitor, unless treated with digoxin only
(assert
(! (not (and
         (or patient_has_finding_of_congestive_heart_failure_now@@requires_treatment_with_diuretic
             patient_has_finding_of_congestive_heart_failure_now@@requires_treatment_with_angiotensin_converting_enzyme_inhibitor)
         (not patient_is_taking_digoxin_now@@is_only_treatment_patient_is_receiving)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has congestive heart failure requiring treatment with a diuretic) OR (the patient has congestive heart failure requiring treatment with an angiotensin converting enzyme (ACE) inhibitor)) UNLESS the patient is treated with digoxin only."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_creatinine_measurement_serum_value_recorded_now_withunit_micromoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a current serum creatinine measurement in micromoles per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum creatinine measurement in micromoles per liter."} ;; "serum creatinine > 150 micromoles per liter"
(declare-const patient_has_diagnosis_of_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of renal failure syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of renal failure syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of renal failure syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of renal failure syndrome."} ;; "renal failure"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: renal failure is present if serum creatinine > 150 micromoles per liter
(assert
(! (= patient_has_diagnosis_of_renal_failure_syndrome_now
     (> patient_creatinine_measurement_serum_value_recorded_now_withunit_micromoles_per_liter 150))
   :named REQ2_AUXILIARY0)) ;; "renal failure (serum creatinine > 150 micromoles per liter)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_renal_failure_syndrome_now)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal failure (serum creatinine > 150 micromoles per liter)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_cerebral_hemorrhage_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebral hemorrhage within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a cerebral hemorrhage within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebral hemorrhage within the past 6 months.","meaning":"Boolean indicating whether the patient has had cerebral hemorrhage within the past 6 months."} ;; "the patient has had previous documented cerebral haemorrhage within the last 6 months"
(declare-const patient_has_finding_of_cerebral_hemorrhage_inthepast6months@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cerebral hemorrhage within the past 6 months is documented.","when_to_set_to_false":"Set to false if the patient's cerebral hemorrhage within the past 6 months is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cerebral hemorrhage within the past 6 months is documented.","meaning":"Boolean indicating whether the patient's cerebral hemorrhage within the past 6 months is documented."} ;; "previous documented cerebral haemorrhage within the last 6 months"
(declare-const patient_has_finding_of_subarachnoid_hemorrhage_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a subarachnoid hemorrhage within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had subarachnoid hemorrhage within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had subarachnoid hemorrhage within the past 6 months.","meaning":"Boolean indicating whether the patient has had subarachnoid hemorrhage within the past 6 months."} ;; "the patient has had previous documented subarachnoid haemorrhage within the last 6 months"
(declare-const patient_has_finding_of_subarachnoid_hemorrhage_inthepast6months@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's subarachnoid hemorrhage within the past 6 months is documented.","when_to_set_to_false":"Set to false if the patient's subarachnoid hemorrhage within the past 6 months is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the subarachnoid hemorrhage within the past 6 months is documented.","meaning":"Boolean indicating whether the patient's subarachnoid hemorrhage within the past 6 months is documented."} ;; "previous documented subarachnoid haemorrhage within the last 6 months"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_cerebral_hemorrhage_inthepast6months@@documented
      patient_has_finding_of_cerebral_hemorrhage_inthepast6months)
    :named REQ3_AUXILIARY0)) ;; "previous documented cerebral haemorrhage within the last 6 months"

(assert
(! (=> patient_has_finding_of_subarachnoid_hemorrhage_inthepast6months@@documented
      patient_has_finding_of_subarachnoid_hemorrhage_inthepast6months)
    :named REQ3_AUXILIARY1)) ;; "previous documented subarachnoid haemorrhage within the last 6 months"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_has_finding_of_cerebral_hemorrhage_inthepast6months@@documented
            patient_has_finding_of_subarachnoid_hemorrhage_inthepast6months@@documented))
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has had previous documented cerebral haemorrhage within the last 6 months) OR (the patient has had previous documented subarachnoid haemorrhage within the last 6 months))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_condition_expected_to_severely_limit_survival_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a condition that is expected to severely limit survival, regardless of specific diagnosis.","when_to_set_to_false":"Set to false if the patient currently does not have any condition expected to severely limit survival.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a condition expected to severely limit survival.","meaning":"Boolean indicating whether the patient currently has a condition that is expected to severely limit survival."} ;; "condition expected to severely limit survival"
(declare-const patient_has_diagnosis_of_terminal_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of terminal illness.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of terminal illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of terminal illness.","meaning":"Boolean indicating whether the patient currently has a diagnosis of terminal illness."} ;; "terminal illness"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive example: terminal illness is an example of a condition expected to severely limit survival
(assert
(! (=> patient_has_diagnosis_of_terminal_illness_now
      patient_has_condition_expected_to_severely_limit_survival_now)
   :named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (terminal illness)."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_condition_expected_to_severely_limit_survival_now)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a condition expected to severely limit survival with non-exhaustive examples (terminal illness)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_secondary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of secondary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of secondary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary hypertension.","meaning":"Boolean indicating whether the patient currently has secondary hypertension."} ;; "secondary hypertension"
(declare-const patient_has_finding_of_renal_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal artery stenosis.","meaning":"Boolean indicating whether the patient currently has renal artery stenosis."} ;; "renal artery stenosis"
(declare-const patient_has_finding_of_chronic_renal_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic renal insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic renal insufficiency.","meaning":"Boolean indicating whether the patient currently has chronic renal insufficiency."} ;; "chronic renal insufficiency"
(declare-const patient_has_finding_of_endocrine_cause_of_secondary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has secondary hypertension and the cause is endocrine.","when_to_set_to_false":"Set to false if the patient currently does not have secondary hypertension due to an endocrine cause.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary hypertension due to an endocrine cause.","meaning":"Boolean indicating whether the patient currently has secondary hypertension due to an endocrine cause."} ;; "endocrine cause"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_renal_artery_stenosis_now
          patient_has_finding_of_chronic_renal_insufficiency_now
          patient_has_finding_of_endocrine_cause_of_secondary_hypertension_now)
    patient_has_finding_of_secondary_hypertension_now)
:named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples ((renal artery stenosis) OR (chronic renal insufficiency) OR (endocrine cause))."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_secondary_hypertension_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has secondary hypertension with non-exhaustive examples ((renal artery stenosis) OR (chronic renal insufficiency) OR (endocrine cause))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_gout_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of gout.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of gout.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of gout.","meaning":"Boolean indicating whether the patient currently has a diagnosis of gout."} ;; "gout"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_gout_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has gout."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia."} ;; "dementia"
(declare-const patient_has_diagnosis_of_dementia_now@@diagnosed_clinically Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of dementia was made clinically (i.e., based on clinical assessment, not solely by imaging or laboratory criteria).","when_to_set_to_false":"Set to false if the patient's current diagnosis of dementia was not made clinically.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of dementia was made clinically.","meaning":"Boolean indicating whether the patient's current diagnosis of dementia was made clinically."} ;; "dementia diagnosed clinically"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_diagnosis_of_dementia_now@@diagnosed_clinically
      patient_has_diagnosis_of_dementia_now)
   :named REQ7_AUXILIARY0)) ;; "diagnosed clinically" implies "dementia"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_diagnosis_of_dementia_now@@diagnosed_clinically)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia diagnosed clinically."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_resident_in_nursing_home_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently resident in a nursing home.","when_to_set_to_false":"Set to false if the patient is currently not resident in a nursing home.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently resident in a nursing home.","meaning":"Boolean indicating whether the patient is currently resident in a nursing home."} ;; "the patient is resident in a nursing home"

(declare-const dependency_and_care_requirements_require_regular_input_of_qualified_nurses_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dependency and care requirements currently require regular input of qualified nurses.","when_to_set_to_false":"Set to false if the patient's dependency and care requirements currently do not require regular input of qualified nurses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dependency and care requirements currently require regular input of qualified nurses.","meaning":"Boolean indicating whether the patient's dependency and care requirements currently require regular input of qualified nurses."} ;; "the dependency and care requirements are such that regular input of qualified nurses is required"

(declare-const staff_count_nurses_now Real) ;; {"when_to_set_to_value":"Set to the current number of nurses among the staff.","when_to_set_to_null":"Set to null if the current number of nurses among the staff is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the current number of nurses among the staff."} ;; "the majority of staff are nurses"

(declare-const staff_count_total_now Real) ;; {"when_to_set_to_value":"Set to the current total number of staff.","when_to_set_to_null":"Set to null if the current total number of staff is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the current total number of staff."} ;; "the majority of staff are nurses"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (and patient_is_resident_in_nursing_home_now
             dependency_and_care_requirements_require_regular_input_of_qualified_nurses_now
             (> staff_count_nurses_now (/ staff_count_total_now 2))))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is resident in a nursing home AND the dependency and care requirements are such that regular input of qualified nurses is required AND the majority of staff are nurses."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_unable_to_stand_up_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to stand up.","when_to_set_to_false":"Set to false if the patient is currently able to stand up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to stand up.","meaning":"Boolean indicating whether the patient is currently unable to stand up."} ;; "unable to stand up"
(declare-const patient_has_finding_of_unable_to_walk_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to walk.","when_to_set_to_false":"Set to false if the patient is currently able to walk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to walk.","meaning":"Boolean indicating whether the patient is currently unable to walk."} ;; "unable to walk"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not (or patient_has_finding_of_unable_to_stand_up_now
              patient_has_finding_of_unable_to_walk_now))
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is unable to stand up) OR (the patient is unable to walk))."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_undergone_clinical_drug_trial_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a clinical drug trial within the past 1 month prior to selection.","when_to_set_to_false":"Set to false if the patient has not undergone a clinical drug trial within the past 1 month prior to selection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a clinical drug trial within the past 1 month prior to selection.","meaning":"Boolean indicating whether the patient has undergone a clinical drug trial within the past 1 month prior to selection."} ;; "drug trial within the time interval of one month preceding selection"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_undergone_clinical_drug_trial_inthepast1months)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in a drug trial within the time interval of one month preceding selection."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of alcohol abuse.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of alcohol abuse."} ;; "alcohol abuse"
(declare-const patient_has_finding_of_drug_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of drug abuse.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of drug abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of drug abuse.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of drug abuse."} ;; "drug abuse"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (not (or patient_has_finding_of_alcohol_abuse_now
              patient_has_finding_of_drug_abuse_now))
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has alcohol abuse) OR (the patient has drug abuse)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const placebo_run_in_period_duration_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient's placebo run-in period lasted, as documented.","when_to_set_to_null":"Set to null if the duration of the patient's placebo run-in period is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in months of the patient's placebo run-in period."} ;; "placebo run-in period of less than two months"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (< placebo_run_in_period_duration_in_months 2))
:named REQ12_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has had a placebo run-in period of less than two months."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_contraindication_to_use_of_trial_drugs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication to the use of trial drugs.","when_to_set_to_false":"Set to false if the patient currently does not have any contraindication to the use of trial drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication to the use of trial drugs.","meaning":"Boolean indicating whether the patient currently has any contraindication to the use of trial drugs."} ;; "contraindications to use of trial drugs"
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is not currently exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} ;; "drugs"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_contraindication_to_use_of_trial_drugs_now)
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has contraindications to use of trial drugs."
