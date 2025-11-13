;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured mean sitting systolic blood pressure value (in mmHg) if such a measurement by cuff in the office at any visit is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's mean sitting systolic blood pressure measured by cuff in the office at any visit, in millimeters of mercury."} ;; "mean sitting systolic blood pressure ≥ 200 millimeters of mercury at any visit"

(declare-const patient_diastolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured mean sitting diastolic blood pressure value (in mmHg) if such a measurement by cuff in the office at any visit is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's mean sitting diastolic blood pressure measured by cuff in the office at any visit, in millimeters of mercury."} ;; "mean sitting diastolic blood pressure ≥ 110 millimeters of mercury at any visit"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or
  (>= patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury 200) ;; "mean sitting systolic blood pressure ≥ 200 millimeters of mercury at any visit"
  (>= patient_diastolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury 110) ;; "mean sitting diastolic blood pressure ≥ 110 millimeters of mercury at any visit"
))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has office blood pressure measured by cuff with mean sitting systolic blood pressure ≥ 200 millimeters of mercury at any visit) OR (the patient has office blood pressure measured by cuff with mean sitting diastolic blood pressure ≥ 110 millimeters of mercury at any visit))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} ;; "uses other investigational drugs at the time of enrollment"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@is_investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient is currently exposed is investigational.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient is currently exposed is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is investigational.","meaning":"Boolean indicating whether the drug or medicament to which the patient is currently exposed is investigational."} ;; "uses other investigational drugs at the time of enrollment"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@is_other_than_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient is currently exposed is other than the study drug.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient is currently exposed is the study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is other than the study drug.","meaning":"Boolean indicating whether the drug or medicament to which the patient is currently exposed is other than the study drug."} ;; "uses other investigational drugs at the time of enrollment"

(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to any drug or medicament within the past 30 days.","when_to_set_to_false":"Set to false if the patient was not exposed to any drug or medicament within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to any drug or medicament within the past 30 days.","meaning":"Boolean indicating whether the patient was exposed to any drug or medicament within the past 30 days."} ;; "uses other investigational drugs within the longer of (30 days) OR (5 half-lives of the investigational drug)"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient was exposed within the past 30 days is investigational.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient was exposed within the past 30 days is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is investigational.","meaning":"Boolean indicating whether the drug or medicament to which the patient was exposed within the past 30 days is investigational."} ;; "uses other investigational drugs within the longer of (30 days) OR (5 half-lives of the investigational drug)"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_other_than_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient was exposed within the past 30 days is other than the study drug.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient was exposed within the past 30 days is the study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is other than the study drug.","meaning":"Boolean indicating whether the drug or medicament to which the patient was exposed within the past 30 days is other than the study drug."} ;; "uses other investigational drugs within the longer of (30 days) OR (5 half-lives of the investigational drug)"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@temporalcontext_within_longer_of_30_days_or_5_half_lives Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to the drug or medicament occurred within the longer of 30 days or 5 half-lives of the investigational drug prior to enrollment.","when_to_set_to_false":"Set to false if the exposure to the drug or medicament did not occur within the longer of 30 days or 5 half-lives of the investigational drug prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within the longer of 30 days or 5 half-lives of the investigational drug prior to enrollment.","meaning":"Boolean indicating whether the exposure to the drug or medicament occurred within the longer of 30 days or 5 half-lives of the investigational drug prior to enrollment."} ;; "uses other investigational drugs within the longer of (30 days) OR (5 half-lives of the investigational drug)"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables (current exposure)
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@is_investigational
       patient_is_exposed_to_drug_or_medicament_now)
    :named REQ1_AUXILIARY0)) ;; "uses other investigational drugs at the time of enrollment"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@is_other_than_study_drug
       patient_is_exposed_to_drug_or_medicament_now)
    :named REQ1_AUXILIARY1)) ;; "uses other investigational drugs at the time of enrollment"

;; Qualifier variables imply corresponding stem variables (past 30 days)
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational
       patient_is_exposed_to_drug_or_medicament_inthepast30days)
    :named REQ1_AUXILIARY2)) ;; "uses other investigational drugs within the longer of (30 days) OR (5 half-lives of the investigational drug)"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_other_than_study_drug
       patient_is_exposed_to_drug_or_medicament_inthepast30days)
    :named REQ1_AUXILIARY3)) ;; "uses other investigational drugs within the longer of (30 days) OR (5 half-lives of the investigational drug)"

;; The temporal context qualifier implies the stem variable (past 30 days)
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@temporalcontext_within_longer_of_30_days_or_5_half_lives
       patient_is_exposed_to_drug_or_medicament_inthepast30days)
    :named REQ1_AUXILIARY4)) ;; "uses other investigational drugs within the longer of (30 days) OR (5 half-lives of the investigational drug)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion if patient uses other investigational drugs at the time of enrollment
(assert
(! (not (and patient_is_exposed_to_drug_or_medicament_now@@is_investigational
             patient_is_exposed_to_drug_or_medicament_now@@is_other_than_study_drug))
    :named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient uses other investigational drugs at the time of enrollment."

;; Exclusion if patient uses other investigational drugs within the longer of 30 days or 5 half-lives
(assert
(! (not (and patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational
             patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_other_than_study_drug
             patient_is_exposed_to_drug_or_medicament_inthepast30days@@temporalcontext_within_longer_of_30_days_or_5_half_lives))
    :named REQ1_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient uses other investigational drugs within the longer of (30 days) OR (5 half-lives of the investigational drug)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity condition at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity condition at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity condition.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity condition."} ;; "hypersensitivity"

(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_of_the_study_drugs Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of hypersensitivity condition is specifically to any of the study drugs.","when_to_set_to_false":"Set to false if the patient's history of hypersensitivity condition is not to any of the study drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity condition is to any of the study drugs.","meaning":"Boolean indicating whether the patient's history of hypersensitivity condition is to any of the study drugs."} ;; "hypersensitivity to any of the study drugs"

(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_drugs_belonging_to_same_therapeutic_class_as_study_drugs_with_exhaustive_subcategories Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of hypersensitivity condition is specifically to drugs belonging to the same therapeutic class as the study drugs, including exhaustive subcategories (e.g., calcium channel blockers, thiazide diuretics).","when_to_set_to_false":"Set to false if the patient's history of hypersensitivity condition is not to drugs belonging to the same therapeutic class as the study drugs, or not to the specified subcategories.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity condition is to drugs belonging to the same therapeutic class as the study drugs, including exhaustive subcategories.","meaning":"Boolean indicating whether the patient's history of hypersensitivity condition is to drugs belonging to the same therapeutic class as the study drugs, including exhaustive subcategories."} ;; "hypersensitivity to drugs belonging to the same therapeutic class as the study drugs (calcium channel blockers, thiazide diuretics)"

(declare-const patient_has_hypersensitivity_to_drug_or_medicament_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to any drug or medicament at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity to any drug or medicament at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to any drug or medicament.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to any drug or medicament."} ;; "hypersensitivity to any drug or medicament"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_of_the_study_drugs
      patient_has_finding_of_hypersensitivity_condition_inthehistory)
:named REQ2_AUXILIARY0)) ;; "hypersensitivity to any of the study drugs"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_drugs_belonging_to_same_therapeutic_class_as_study_drugs_with_exhaustive_subcategories
      patient_has_finding_of_hypersensitivity_condition_inthehistory)
:named REQ2_AUXILIARY1)) ;; "hypersensitivity to drugs belonging to the same therapeutic class as the study drugs (calcium channel blockers, thiazide diuretics)"

;; Exhaustive subcategories define the therapeutic class qualifier exactly:
;; "calcium channel blockers, thiazide diuretics" are the exhaustive subcategories for drugs belonging to the same therapeutic class as the study drugs
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_calcium_channel_blockers Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of hypersensitivity condition is specifically to calcium channel blockers.","when_to_set_to_false":"Set to false if the patient's history of hypersensitivity condition is not to calcium channel blockers.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity condition is to calcium channel blockers.","meaning":"Boolean indicating whether the patient's history of hypersensitivity condition is to calcium channel blockers."} ;; "calcium channel blockers"

(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_thiazide_diuretics Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of hypersensitivity condition is specifically to thiazide diuretics.","when_to_set_to_false":"Set to false if the patient's history of hypersensitivity condition is not to thiazide diuretics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity condition is to thiazide diuretics.","meaning":"Boolean indicating whether the patient's history of hypersensitivity condition is to thiazide diuretics."} ;; "thiazide diuretics"

(assert
(! (= patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_drugs_belonging_to_same_therapeutic_class_as_study_drugs_with_exhaustive_subcategories
      (or patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_calcium_channel_blockers
          patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_thiazide_diuretics))
:named REQ2_AUXILIARY2)) ;; "exhaustive subcategories (calcium channel blockers, thiazide diuretics)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have a history of hypersensitivity to any of the study drugs
(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_any_of_the_study_drugs)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to any of the study drugs."

;; Exclusion: patient must NOT have a history of hypersensitivity to drugs belonging to the same therapeutic class as the study drugs (calcium channel blockers, thiazide diuretics)
(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_drugs_belonging_to_same_therapeutic_class_as_study_drugs_with_exhaustive_subcategories)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to drugs belonging to the same therapeutic class with exhaustive subcategories (calcium channel blockers, thiazide diuretics) as the study drugs."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_long_qt_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of long QT syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of long QT syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of long QT syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of long QT syndrome."} ;; "long QT syndrome"
(declare-const patient_qt_interval_feature_value_recorded_now_withunit_milliseconds Real) ;; {"when_to_set_to_value":"Set to the measured value in milliseconds if the patient's corrected QT interval is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's corrected QT interval (in milliseconds) measured now."} ;; "QT interval"
(declare-const patient_qt_interval_feature_value_recorded_now_withunit_milliseconds@@measured_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's corrected QT interval value recorded now is specifically measured at the screening visit.","when_to_set_to_false":"Set to false if the value is not measured at screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the value was measured at screening.","meaning":"Boolean indicating whether the patient's corrected QT interval value recorded now was measured at the screening visit."} ;; "QT interval measured at screening"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} ;; "the patient is female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} ;; "the patient is male"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient has long QT syndrome
(assert
(! (not patient_has_diagnosis_of_long_qt_syndrome_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has long QT syndrome."

;; Exclusion: patient is male AND QTc > 450 ms at screening
(assert
(! (not (and patient_sex_is_male_now
             patient_qt_interval_feature_value_recorded_now_withunit_milliseconds@@measured_at_screening
             (> patient_qt_interval_feature_value_recorded_now_withunit_milliseconds 450)))
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is male AND the patient has corrected QT interval > 450 milliseconds at screening."

;; Exclusion: patient is female AND QTc > 470 ms at screening
(assert
(! (not (and patient_sex_is_female_now
             patient_qt_interval_feature_value_recorded_now_withunit_milliseconds@@measured_at_screening
             (> patient_qt_interval_feature_value_recorded_now_withunit_milliseconds 470)))
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is female AND the patient has corrected QT interval > 470 milliseconds at screening."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of malignant neoplastic disease (malignancy) of any organ system within the past 5 years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of malignant neoplastic disease (malignancy) of any organ system within the past 5 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of malignant neoplastic disease (malignancy) of any organ system within the past 5 years.","meaning":"Boolean indicating whether the patient has had a diagnosis of malignant neoplastic disease (malignancy) of any organ system within the past 5 years."} ;; "malignancy of any organ system (treated or untreated) within the past 5 years"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@excluding_localized_basal_cell_carcinoma_of_the_skin Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of malignant neoplastic disease (malignancy) within the past 5 years excludes localized basal cell carcinoma of the skin.","when_to_set_to_false":"Set to false if the diagnosis includes localized basal cell carcinoma of the skin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether localized basal cell carcinoma of the skin is excluded.","meaning":"Boolean indicating whether the diagnosis of malignancy within the past 5 years excludes localized basal cell carcinoma of the skin."} ;; "other than localized basal cell carcinoma of the skin"
(declare-const patient_has_finding_of_recurrent_tumor_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had evidence of recurrent tumor (local recurrence) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had evidence of recurrent tumor (local recurrence) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had evidence of recurrent tumor (local recurrence).","meaning":"Boolean indicating whether the patient has ever had evidence of recurrent tumor (local recurrence)."} ;; "evidence of local recurrence"
(declare-const patient_has_finding_of_secondary_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had evidence of secondary malignant neoplastic disease (metastases) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had evidence of secondary malignant neoplastic disease (metastases) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had evidence of secondary malignant neoplastic disease (metastases).","meaning":"Boolean indicating whether the patient has ever had evidence of secondary malignant neoplastic disease (metastases)."} ;; "evidence of metastases"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@excluding_localized_basal_cell_carcinoma_of_the_skin
      patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years)
:named REQ4_AUXILIARY0)) ;; "other than localized basal cell carcinoma of the skin"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have a history of malignancy of any organ system (other than localized basal cell carcinoma of the skin) treated or untreated within the past 5 years, regardless of recurrence or metastases
(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast5years@@excluding_localized_basal_cell_carcinoma_of_the_skin)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of malignancy of any organ system (other than localized basal cell carcinoma of the skin)) AND (the malignancy was treated or untreated within the past 5 years), regardless of whether there is evidence of local recurrence or evidence of metastases)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant, as confirmed by clinical assessment or laboratory testing.","when_to_set_to_false":"Set to false if the patient is currently not pregnant, as confirmed by clinical assessment or laboratory testing.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

(declare-const patient_human_chorionic_gonadotropin_lab_test_value_now_withunit_milli_international_units_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current hCG laboratory test result, measured in milli-international units per milliliter, as recorded in laboratory data.","when_to_set_to_null":"Set to null if the patient's current hCG laboratory test result is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current hCG laboratory test result, measured in milli-international units per milliliter."} ;; "confirmed by a positive human chorionic gonadotropin laboratory test (> 5 milli-international units per milliliter)"

(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating (nursing), as confirmed by clinical assessment or patient report.","when_to_set_to_false":"Set to false if the patient is currently not lactating (nursing), as confirmed by clinical assessment or patient report.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating (nursing)."} ;; "the patient is nursing (lactating)"

(declare-const patients_lactation_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating (nursing).","when_to_set_to_false":"Set to false if the patient is currently not lactating (nursing).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently lactating (nursing).","meaning":"Boolean indicating whether the patient is currently lactating (nursing)."} ;; "lactating"

(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} ;; "the state of a female after conception"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition of pregnancy per requirement: female, after conception, until termination of gestation, confirmed by hCG > 5 mIU/mL
(assert
(! (= patient_is_pregnant_now
     (and patient_sex_is_female_now
          (> patient_human_chorionic_gonadotropin_lab_test_value_now_withunit_milli_international_units_per_milliliter 5)))
:named REQ5_AUXILIARY0)) ;; "pregnancy is defined as the state of a female after conception and until the termination of gestation, confirmed by a positive human chorionic gonadotropin laboratory test (> 5 milli-international units per milliliter)"

;; Link observable lactation variable to clinical lactation status
(assert
(! (= patient_is_lactating_now
      patients_lactation_is_positive_now)
:named REQ5_AUXILIARY1)) ;; "the patient is nursing (lactating)"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT be pregnant
(assert
(! (not patient_is_pregnant_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant, where pregnancy is defined as ..."

;; Exclusion: patient must NOT be nursing (lactating)
(assert
(! (not patient_is_lactating_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is nursing (lactating)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_woman_of_child_bearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a woman physiologically capable of becoming pregnant, regardless of career, lifestyle, sexual orientation, or partner's sterilization status.","when_to_set_to_false":"Set to false if the patient is not currently a woman of child-bearing potential (e.g., postmenopausal, prepubertal, or physiologically incapable of becoming pregnant).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a woman of child-bearing potential.","meaning":"Boolean indicating whether the patient is currently a woman of child-bearing potential, as defined above."} ;; "the patient is a woman of child-bearing potential, defined as any woman physiologically capable of becoming pregnant (including women whose career, lifestyle, or sexual orientation precludes intercourse with a male partner and women whose partners have been sterilized by vasectomy or other means)"
(declare-const patient_is_using_two_birth_control_methods_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using two birth control methods.","when_to_set_to_false":"Set to false if the patient is not currently using two birth control methods.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using two birth control methods.","meaning":"Boolean indicating whether the patient is currently using two birth control methods."} ;; "the patient is NOT using two birth control methods, which can be a double barrier method OR a barrier method plus a hormonal method"
(declare-const patient_is_using_two_birth_control_methods_now@@double_barrier_method Bool) ;; {"when_to_set_to_true":"Set to true if the two birth control methods currently used by the patient are both barrier methods (double barrier method).","when_to_set_to_false":"Set to false if the two birth control methods currently used by the patient are not both barrier methods.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the two birth control methods currently used by the patient are both barrier methods.","meaning":"Boolean indicating whether the two birth control methods currently used by the patient are both barrier methods (double barrier method)."} ;; "double barrier method"
(declare-const patient_is_using_two_birth_control_methods_now@@barrier_plus_hormonal_method Bool) ;; {"when_to_set_to_true":"Set to true if the two birth control methods currently used by the patient are a combination of a barrier method and a hormonal method.","when_to_set_to_false":"Set to false if the two birth control methods currently used by the patient are not a combination of a barrier method and a hormonal method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the two birth control methods currently used by the patient are a combination of a barrier method and a hormonal method.","meaning":"Boolean indicating whether the two birth control methods currently used by the patient are a combination of a barrier method and a hormonal method."} ;; "barrier method plus a hormonal method"
(declare-const patient_has_undergone_vasectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the index patient has undergone vasectomy at any time in the past.","when_to_set_to_false":"Set to false if the index patient has not undergone vasectomy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the index patient has undergone vasectomy at any time in the past.","meaning":"Boolean indicating whether the index patient has undergone vasectomy at any time in the past."} ;; "vasectomy"
(declare-const patient_has_undergone_vasectomy_inthehistory@@performed_on_partner_of_woman Bool) ;; {"when_to_set_to_true":"Set to true if the vasectomy procedure was performed on the partner of the woman, not the index patient.","when_to_set_to_false":"Set to false if the vasectomy procedure was not performed on the partner of the woman, or was performed on the index patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the vasectomy procedure was performed on the partner of the woman.","meaning":"Boolean indicating whether the vasectomy procedure was performed on the partner of the woman."} ;; "vasectomy ... performed on the partner of the woman"
;; patient_sex_is_female_now is already declared and reused

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_using_two_birth_control_methods_now@@double_barrier_method
      patient_is_using_two_birth_control_methods_now)
:named REQ6_AUXILIARY0)) ;; "double barrier method is a type of two birth control methods"

(assert
(! (=> patient_is_using_two_birth_control_methods_now@@barrier_plus_hormonal_method
      patient_is_using_two_birth_control_methods_now)
:named REQ6_AUXILIARY1)) ;; "barrier method plus a hormonal method is a type of two birth control methods"

(assert
(! (=> patient_has_undergone_vasectomy_inthehistory@@performed_on_partner_of_woman
      patient_has_undergone_vasectomy_inthehistory)
:named REQ6_AUXILIARY2)) ;; "vasectomy performed on partner implies vasectomy"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (and patient_is_woman_of_child_bearing_potential_now
             (not patient_is_using_two_birth_control_methods_now)))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is a woman of child-bearing potential, defined as any woman physiologically capable of becoming pregnant (including women whose career, lifestyle, or sexual orientation precludes intercourse with a male partner and women whose partners have been sterilized by vasectomy or other means)) AND (the patient is NOT using two birth control methods, which can be a double barrier method OR a barrier method plus a hormonal method))."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_barrier_contraception_method_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a barrier contraception method.","when_to_set_to_false":"Set to false if the patient is currently not using a barrier contraception method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a barrier contraception method.","meaning":"Boolean indicating whether the patient is currently using a barrier contraception method."} ;; "barrier methods of contraception"
(declare-const patient_has_finding_of_barrier_contraception_method_now@@adequate Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a barrier contraception method and the method is considered adequate.","when_to_set_to_false":"Set to false if the patient is currently using a barrier contraception method but it is not considered adequate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the barrier contraception method is adequate.","meaning":"Boolean indicating whether the patient's current barrier contraception method is adequate."} ;; "adequate barrier methods of contraception"
(declare-const patient_has_finding_of_barrier_contraception_method_now@@exhaustive_subcategory Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a barrier contraception method and the method is one of the exhaustive subcategories: diaphragm, condom by the partner, intrauterine device (copper or hormonal), sponge, or spermicide.","when_to_set_to_false":"Set to false if the patient is currently using a barrier contraception method but it is not one of the exhaustive subcategories.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the barrier contraception method is one of the exhaustive subcategories.","meaning":"Boolean indicating whether the patient's current barrier contraception method is one of the exhaustive subcategories."} ;; "diaphragm, condom by the partner, intrauterine device (copper or hormonal), sponge, spermicide"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any form of contraception.","when_to_set_to_false":"Set to false if the patient is currently not using any form of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using any form of contraception.","meaning":"Boolean indicating whether the patient is currently using any form of contraception."} ;; "contraception"
(declare-const patient_has_finding_of_contraception_now@@reliable Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception and it is considered reliable.","when_to_set_to_false":"Set to false if the patient is currently using contraception but it is not considered reliable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception is reliable.","meaning":"Boolean indicating whether the patient's current contraception is reliable."} ;; "reliable contraception"
(declare-const patient_has_finding_of_contraception_now@@maintained_throughout_study_and_7_days_post_discontinuation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception and it is maintained throughout the study and for 7 days after study drug discontinuation.","when_to_set_to_false":"Set to false if the patient is currently using contraception but it is not maintained throughout the study and for 7 days after study drug discontinuation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception is maintained throughout the study and for 7 days after study drug discontinuation.","meaning":"Boolean indicating whether the patient's current contraception is maintained throughout the study and for 7 days after study drug discontinuation."} ;; "maintain reliable contraception throughout the study and for 7 days after study drug discontinuation"
(declare-const patient_has_finding_of_hormonal_contraceptive_method_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a hormonal contraceptive method.","when_to_set_to_false":"Set to false if the patient is currently not using a hormonal contraceptive method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a hormonal contraceptive method.","meaning":"Boolean indicating whether the patient is currently using a hormonal contraceptive method."} ;; "hormonal contraceptives"
(declare-const patient_has_finding_of_hormonal_contraceptive_method_now@@exhaustive_subcategory Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a hormonal contraceptive method and the method is one of the exhaustive subcategories: any marketed contraceptive agent that includes an estrogen and/or a progestational agent.","when_to_set_to_false":"Set to false if the patient is currently using a hormonal contraceptive method but it is not one of the exhaustive subcategories.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hormonal contraceptive method is one of the exhaustive subcategories.","meaning":"Boolean indicating whether the patient's current hormonal contraceptive method is one of the exhaustive subcategories."} ;; "any marketed contraceptive agent that includes an estrogen and/or a progestational agent"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Exhaustive subcategories define adequate barrier contraception
(assert
(! (= patient_has_finding_of_barrier_contraception_method_now@@adequate
     patient_has_finding_of_barrier_contraception_method_now@@exhaustive_subcategory)
:named REQ7_AUXILIARY0)) ;; "adequate barrier methods of contraception with exhaustive subcategories (diaphragm, condom by the partner, intrauterine device (copper or hormonal), sponge, spermicide)"

;; Exhaustive subcategories define hormonal contraceptive method
(assert
(! (= patient_has_finding_of_hormonal_contraceptive_method_now
     patient_has_finding_of_hormonal_contraceptive_method_now@@exhaustive_subcategory)
:named REQ7_AUXILIARY1)) ;; "hormonal contraceptives with exhaustive subcategories (any marketed contraceptive agent that includes an estrogen and/or a progestational agent)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_barrier_contraception_method_now@@adequate
      patient_has_finding_of_barrier_contraception_method_now)
:named REQ7_AUXILIARY2)) ;; "adequate barrier methods of contraception"

(assert
(! (=> patient_has_finding_of_barrier_contraception_method_now@@exhaustive_subcategory
      patient_has_finding_of_barrier_contraception_method_now)
:named REQ7_AUXILIARY3)) ;; "barrier contraception method is one of the exhaustive subcategories"

(assert
(! (=> patient_has_finding_of_hormonal_contraceptive_method_now@@exhaustive_subcategory
      patient_has_finding_of_hormonal_contraceptive_method_now)
:named REQ7_AUXILIARY4)) ;; "hormonal contraceptive method is one of the exhaustive subcategories"

(assert
(! (=> patient_has_finding_of_contraception_now@@reliable
      patient_has_finding_of_contraception_now)
:named REQ7_AUXILIARY5)) ;; "contraception is reliable"

(assert
(! (=> patient_has_finding_of_contraception_now@@maintained_throughout_study_and_7_days_post_discontinuation
      patient_has_finding_of_contraception_now)
:named REQ7_AUXILIARY6)) ;; "contraception is maintained throughout the study and for 7 days after study drug discontinuation"

;; ===================== Constraint Assertions (REQ 7) =====================
;; 1. The patient is a woman of child-bearing potential AND NOT using adequate barrier methods of contraception (as per exhaustive subcategories)
(assert
(! (not (and patient_is_woman_of_child_bearing_potential_now
             (not patient_has_finding_of_barrier_contraception_method_now@@adequate)))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman of child-bearing potential AND the patient is NOT using adequate barrier methods of contraception with exhaustive subcategories (diaphragm, condom by the partner, intrauterine device (copper or hormonal), sponge, spermicide)."

;; 2. The patient is a woman of child-bearing potential AND NOT using hormonal contraceptives (as per exhaustive subcategories)
(assert
(! (not (and patient_is_woman_of_child_bearing_potential_now
             (not patient_has_finding_of_hormonal_contraceptive_method_now)))
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman of child-bearing potential AND the patient is NOT using hormonal contraceptives with exhaustive subcategories (any marketed contraceptive agent that includes an estrogen and/or a progestational agent)."

;; 3. The patient is a woman of child-bearing potential AND does NOT maintain reliable contraception throughout the study AND for 7 days after study drug discontinuation
(assert
(! (not (and patient_is_woman_of_child_bearing_potential_now
             (not patient_has_finding_of_contraception_now@@maintained_throughout_study_and_7_days_post_discontinuation)))
:named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman of child-bearing potential AND the patient does NOT maintain reliable contraception throughout the study AND for 7 days after study drug discontinuation."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_post_menopausal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered post-menopausal according to clinical criteria.","when_to_set_to_false":"Set to false if the patient is currently not considered post-menopausal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently considered post-menopausal.","meaning":"Boolean indicating whether the patient is currently considered post-menopausal."} ;; "the patient is NOT considered post-menopausal"

(declare-const patient_has_natural_amenorrhea_duration_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient has currently experienced natural (spontaneous) amenorrhea.","when_to_set_to_null":"Set to null if the duration of natural amenorrhea is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of months of natural (spontaneous) amenorrhea currently experienced by the patient."} ;; "having had 12 months of natural (spontaneous) amenorrhea"

(declare-const patient_has_natural_amenorrhea_duration_value_recorded_now_in_months@@with_appropriate_clinical_profile Bool) ;; {"when_to_set_to_true":"Set to true if the patient's natural amenorrhea duration is accompanied by an appropriate clinical profile (e.g., age appropriate, history of vasomotor symptoms).","when_to_set_to_false":"Set to false if the patient's natural amenorrhea duration is not accompanied by an appropriate clinical profile.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the amenorrhea is accompanied by an appropriate clinical profile.","meaning":"Boolean indicating whether the patient's natural amenorrhea duration is accompanied by an appropriate clinical profile."} ;; "with an appropriate clinical profile (e.g., age appropriate, history of vasomotor symptoms)"

(declare-const patient_has_spontaneous_amenorrhea_duration_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient has currently experienced spontaneous amenorrhea.","when_to_set_to_null":"Set to null if the duration of spontaneous amenorrhea is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of months of spontaneous amenorrhea currently experienced by the patient."} ;; "6 months of spontaneous amenorrhea"

(declare-const patient_has_spontaneous_amenorrhea_duration_value_recorded_now_in_months@@with_hormone_profile Bool) ;; {"when_to_set_to_true":"Set to true if the patient's spontaneous amenorrhea duration is accompanied by serum follicle-stimulating hormone levels and estradiol levels as specified.","when_to_set_to_false":"Set to false if the patient's spontaneous amenorrhea duration is not accompanied by the specified hormone profile.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the amenorrhea is accompanied by the specified hormone profile.","meaning":"Boolean indicating whether the patient's spontaneous amenorrhea duration is accompanied by the specified hormone profile."} ;; "with serum follicle-stimulating hormone levels > 40 mIU/mL AND estradiol < 20 pg/mL"

(declare-const patient_serum_follicle_stimulating_hormone_value_recorded_now_in_milli_international_units_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the patient's current serum follicle-stimulating hormone level in milli-international units per milliliter.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current serum follicle-stimulating hormone level in milli-international units per milliliter."} ;; "serum follicle-stimulating hormone levels > 40 milli-international units per milliliter"

(declare-const patient_serum_estradiol_value_recorded_now_in_picograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the patient's current serum estradiol level in picograms per milliliter.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current serum estradiol level in picograms per milliliter."} ;; "estradiol < 20 picograms per milliliter"

(declare-const patient_has_undergone_bilateral_oophorectomy_with_or_without_hysterectomy_at_least_6_weeks_ago Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone surgical bilateral oophorectomy (with or without hysterectomy) at least 6 weeks ago.","when_to_set_to_false":"Set to false if the patient has not undergone surgical bilateral oophorectomy (with or without hysterectomy) at least 6 weeks ago.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone surgical bilateral oophorectomy (with or without hysterectomy) at least 6 weeks ago.","meaning":"Boolean indicating whether the patient has undergone surgical bilateral oophorectomy (with or without hysterectomy) at least 6 weeks ago."} ;; "having had surgical bilateral oophorectomy (with or without hysterectomy) at least 6 weeks ago"

(declare-const patient_has_undergone_oophorectomy_alone_at_least_6_weeks_ago_with_confirmed_reproductive_status_by_follow_up_hormone_assessment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone oophorectomy alone at least 6 weeks ago and reproductive status has been confirmed by follow up hormone level assessment.","when_to_set_to_false":"Set to false if the patient has not undergone oophorectomy alone at least 6 weeks ago or reproductive status has not been confirmed by follow up hormone level assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone oophorectomy alone at least 6 weeks ago with confirmed reproductive status by follow up hormone level assessment.","meaning":"Boolean indicating whether the patient has undergone oophorectomy alone at least 6 weeks ago and reproductive status has been confirmed by follow up hormone level assessment."} ;; "in the case of oophorectomy alone, only when the reproductive status of the woman has been confirmed by follow up hormone level assessment"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Definition of post-menopausal and NOT of child bearing potential
(assert
(! (= patient_is_post_menopausal_now
(or
  ;; 12 months of natural amenorrhea with appropriate clinical profile
  (and (>= patient_has_natural_amenorrhea_duration_value_recorded_now_in_months 12)
       patient_has_natural_amenorrhea_duration_value_recorded_now_in_months@@with_appropriate_clinical_profile)
  ;; 6 months of spontaneous amenorrhea with hormone profile
  (and (>= patient_has_spontaneous_amenorrhea_duration_value_recorded_now_in_months 6)
       patient_has_spontaneous_amenorrhea_duration_value_recorded_now_in_months@@with_hormone_profile
       (> patient_serum_follicle_stimulating_hormone_value_recorded_now_in_milli_international_units_per_milliliter 40)
       (< patient_serum_estradiol_value_recorded_now_in_picograms_per_milliliter 20))
  ;; Bilateral oophorectomy (with or without hysterectomy) at least 6 weeks ago
  patient_has_undergone_bilateral_oophorectomy_with_or_without_hysterectomy_at_least_6_weeks_ago
  ;; Oophorectomy alone at least 6 weeks ago with confirmed reproductive status
  patient_has_undergone_oophorectomy_alone_at_least_6_weeks_ago_with_confirmed_reproductive_status_by_follow_up_hormone_assessment
))
:named REQ8_AUXILIARY0)) ;; "post-menopausal and NOT of child bearing potential is defined as ..."

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: If patient is female AND NOT post-menopausal AND NOT of child bearing potential, exclude
(assert
(! (not (and patient_sex_is_female_now
             (not patient_is_post_menopausal_now)
             (not (not patient_is_woman_of_child_bearing_potential_now))))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is a woman) AND (the patient is NOT considered post-menopausal AND NOT of child bearing potential, where post-menopausal and NOT of child bearing potential is defined as ...))"

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_secondary_hypertension_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of secondary hypertension.","when_to_set_to_false":"Set to false if the patient does not have a documented history of secondary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of secondary hypertension.","meaning":"Boolean indicating whether the patient has a history of secondary hypertension."} ;; "the patient has a history of a secondary form of hypertension"

(declare-const patient_has_finding_of_secondary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of secondary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of secondary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of secondary hypertension.","meaning":"Boolean indicating whether the patient currently has evidence of secondary hypertension."} ;; "the patient has evidence of a secondary form of hypertension"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_secondary_hypertension_inthehistory)
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of a secondary form of hypertension."

(assert
(! (not patient_has_finding_of_secondary_hypertension_now)
    :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of a secondary form of hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_hypertensive_retinopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypertensive retinopathy.","when_to_set_to_false":"Set to false if the patient currently does not have hypertensive retinopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypertensive retinopathy.","meaning":"Boolean indicating whether the patient currently has hypertensive retinopathy."} ;; "hypertensive retinopathy"
(declare-const patient_has_finding_of_hypertensive_retinopathy_now@@keith_wagener_grade_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypertensive retinopathy is classified as Keith-Wagener Grade III.","when_to_set_to_false":"Set to false if the patient's hypertensive retinopathy is not classified as Keith-Wagener Grade III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypertensive retinopathy is classified as Keith-Wagener Grade III.","meaning":"Boolean indicating whether the patient's hypertensive retinopathy is classified as Keith-Wagener Grade III."} ;; "Keith-Wagener Grade III hypertensive retinopathy"
(declare-const patient_has_finding_of_hypertensive_retinopathy_now@@keith_wagener_grade_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypertensive retinopathy is classified as Keith-Wagener Grade IV.","when_to_set_to_false":"Set to false if the patient's hypertensive retinopathy is not classified as Keith-Wagener Grade IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypertensive retinopathy is classified as Keith-Wagener Grade IV.","meaning":"Boolean indicating whether the patient's hypertensive retinopathy is classified as Keith-Wagener Grade IV."} ;; "Keith-Wagener Grade IV hypertensive retinopathy"
(declare-const patient_has_finding_of_hypertensive_retinopathy_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypertensive retinopathy is known (documented, not suspected or historical only).","when_to_set_to_false":"Set to false if the patient's hypertensive retinopathy is not known (e.g., only suspected or historical).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypertensive retinopathy is known.","meaning":"Boolean indicating whether the patient's hypertensive retinopathy is known (documented, not suspected or historical only)."} ;; "known"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypertensive_retinopathy_now@@keith_wagener_grade_iii
      patient_has_finding_of_hypertensive_retinopathy_now)
:named REQ10_AUXILIARY0)) ;; "the patient has known Keith-Wagener Grade III hypertensive retinopathy"

(assert
(! (=> patient_has_finding_of_hypertensive_retinopathy_now@@keith_wagener_grade_iv
      patient_has_finding_of_hypertensive_retinopathy_now)
:named REQ10_AUXILIARY1)) ;; "the patient has known Keith-Wagener Grade IV hypertensive retinopathy"

;; "known" qualifier implies stem variable
(assert
(! (=> patient_has_finding_of_hypertensive_retinopathy_now@@known
      patient_has_finding_of_hypertensive_retinopathy_now)
:named REQ10_AUXILIARY2)) ;; "known"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient must NOT have known Keith-Wagener Grade III hypertensive retinopathy
(assert
(! (not patient_has_finding_of_hypertensive_retinopathy_now@@keith_wagener_grade_iii)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known Keith-Wagener Grade III hypertensive retinopathy."

;; Exclusion: patient must NOT have known Keith-Wagener Grade IV hypertensive retinopathy
(assert
(! (not patient_has_finding_of_hypertensive_retinopathy_now@@keith_wagener_grade_iv)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known Keith-Wagener Grade IV hypertensive retinopathy."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a cerebrovascular accident (stroke) at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a cerebrovascular accident (stroke) in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever had a cerebrovascular accident (stroke) in their medical history."} ;; "the patient has a history of cerebrovascular accident"

(declare-const patient_has_finding_of_transient_cerebral_ischemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a transient cerebral ischemic attack (TIA) at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a transient cerebral ischemic attack (TIA) in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a transient cerebral ischemic attack (TIA).","meaning":"Boolean indicating whether the patient has ever had a transient cerebral ischemic attack (TIA) in their medical history."} ;; "the patient has a history of transient ischemic cerebral attack"

(declare-const patient_has_finding_of_heart_failure_nyha_class_ii_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had heart failure classified as NYHA Class II at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had heart failure classified as NYHA Class II in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had heart failure classified as NYHA Class II.","meaning":"Boolean indicating whether the patient has ever had heart failure classified as NYHA Class II in their medical history."} ;; "the patient has a history of heart failure (New York Heart Association Class II)"

(declare-const patient_has_finding_of_heart_failure_nyha_class_iii_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had heart failure classified as NYHA Class III at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had heart failure classified as NYHA Class III in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had heart failure classified as NYHA Class III.","meaning":"Boolean indicating whether the patient has ever had heart failure classified as NYHA Class III in their medical history."} ;; "the patient has a history of heart failure (New York Heart Association Class III)"

(declare-const patient_has_finding_of_heart_failure_nyha_class_iv_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had heart failure classified as NYHA Class IV at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had heart failure classified as NYHA Class IV in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had heart failure classified as NYHA Class IV.","meaning":"Boolean indicating whether the patient has ever had heart failure classified as NYHA Class IV in their medical history."} ;; "the patient has a history of heart failure (New York Heart Association Class IV)"

(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a myocardial infarction (heart attack) at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a myocardial infarction (heart attack) in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a myocardial infarction (heart attack).","meaning":"Boolean indicating whether the patient has ever had a myocardial infarction (heart attack) in their medical history."} ;; "the patient has a history of myocardial infarction"

(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass graft surgery at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass graft surgery in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass graft surgery.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass graft surgery in their medical history."} ;; "the patient has a history of coronary bypass surgery"

(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any percutaneous coronary intervention within the past twelve months.","when_to_set_to_false":"Set to false if the patient has not undergone any percutaneous coronary intervention within the past twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any percutaneous coronary intervention within the past twelve months.","meaning":"Boolean indicating whether the patient has undergone any percutaneous coronary intervention within the past twelve months."} ;; "the patient has a history of any percutaneous coronary intervention in the last twelve months"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthehistory)
    :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cerebrovascular accident."

(assert
(! (not patient_has_finding_of_transient_cerebral_ischemia_inthehistory)
    :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of transient ischemic cerebral attack."

(assert
(! (not patient_has_finding_of_heart_failure_nyha_class_ii_inthehistory)
    :named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of heart failure (New York Heart Association Class II)."

(assert
(! (not patient_has_finding_of_heart_failure_nyha_class_iii_inthehistory)
    :named REQ11_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of heart failure (New York Heart Association Class III)."

(assert
(! (not patient_has_finding_of_heart_failure_nyha_class_iv_inthehistory)
    :named REQ11_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of heart failure (New York Heart Association Class IV)."

(assert
(! (not patient_has_finding_of_myocardial_infarction_inthehistory)
    :named REQ11_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of myocardial infarction."

(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
    :named REQ11_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of coronary bypass surgery."

(assert
(! (not patient_has_undergone_percutaneous_coronary_intervention_inthepast12months)
    :named REQ11_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of any percutaneous coronary intervention in the last twelve months."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_angina_pectoris_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has angina pectoris.","meaning":"Boolean indicating whether the patient currently has angina pectoris."} ;; "angina pectoris"
(declare-const patient_has_finding_of_angina_pectoris_now@@requires_pharmacological_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current angina pectoris requires pharmacological therapy.","when_to_set_to_false":"Set to false if the patient's current angina pectoris does not require pharmacological therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current angina pectoris requires pharmacological therapy.","meaning":"Boolean indicating whether the patient's current angina pectoris requires pharmacological therapy."} ;; "current angina pectoris requiring pharmacological therapy"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_angina_pectoris_now@@requires_pharmacological_therapy
       patient_has_finding_of_angina_pectoris_now)
   :named REQ12_AUXILIARY0)) ;; "current angina pectoris requiring pharmacological therapy"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_angina_pectoris_now@@requires_pharmacological_therapy)
   :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current angina pectoris requiring pharmacological therapy."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_meets_other_protocol_defined_exclusion_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets any other protocol-defined exclusion criteria not otherwise specified in this SMT program.","when_to_set_to_false":"Set to false if the patient does not meet any other protocol-defined exclusion criteria not otherwise specified in this SMT program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets other protocol-defined exclusion criteria.","meaning":"Boolean indicating whether the patient meets other protocol-defined exclusion criteria (criteria not otherwise specified in this SMT program)."}

(declare-const patient_meets_other_protocol_defined_inclusion_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets any other protocol-defined inclusion criteria not otherwise specified in this SMT program.","when_to_set_to_false":"Set to false if the patient does not meet any other protocol-defined inclusion criteria not otherwise specified in this SMT program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets other protocol-defined inclusion criteria.","meaning":"Boolean indicating whether the patient meets other protocol-defined inclusion criteria (criteria not otherwise specified in this SMT program)."}

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not (or patient_meets_other_protocol_defined_inclusion_criteria
            patient_meets_other_protocol_defined_exclusion_criteria))
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient meets other protocol-defined inclusion criteria) OR (the patient meets other protocol-defined exclusion criteria)."
