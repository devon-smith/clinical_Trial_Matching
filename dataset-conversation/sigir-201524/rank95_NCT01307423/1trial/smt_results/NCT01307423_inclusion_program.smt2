;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."} ;; "the patient must be male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} ;; "the patient must be female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged ≥ 18 years at time of consent"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must be male OR (the patient must be female AND aged ≥ 18 years at time of consent)
(assert
  (! (or patient_sex_is_male_now
         (and patient_sex_is_female_now (>= patient_age_value_recorded_now_in_years 18)))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or the patient must be female, aged ≥ 18 years at time of consent."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_understands_informed_consent_document_prior_to_study_related_assessments_and_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient understands the informed consent document before any study related assessments and any study related procedures are conducted.","when_to_set_to_false":"Set to false if the patient does not understand the informed consent document before any study related assessments and any study related procedures are conducted.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient understands the informed consent document prior to any study related assessments and any study related procedures.","meaning":"Boolean indicating whether the patient understands the informed consent document prior to any study related assessments and any study related procedures being conducted."} ;; "the patient must understand the informed consent document"
(declare-const patient_voluntarily_signs_informed_consent_document_prior_to_study_related_assessments_and_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient voluntarily signs the informed consent document before any study related assessments and any study related procedures are conducted.","when_to_set_to_false":"Set to false if the patient does not voluntarily sign the informed consent document before any study related assessments and any study related procedures are conducted.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient voluntarily signs the informed consent document prior to any study related assessments and any study related procedures.","meaning":"Boolean indicating whether the patient voluntarily signs the informed consent document prior to any study related assessments and any study related procedures being conducted."} ;; "the patient must voluntarily sign the informed consent document prior to any study related assessments AND any study related procedures being conducted"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_understands_informed_consent_document_prior_to_study_related_assessments_and_procedures
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must understand the informed consent document"

(assert
  (! patient_voluntarily_signs_informed_consent_document_prior_to_study_related_assessments_and_procedures
     :named REQ1_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must voluntarily sign the informed consent document prior to any study related assessments AND any study related procedures being conducted"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_able_to_adhere_to_study_visit_schedule Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to adhere to the study visit schedule as required by the protocol.","when_to_set_to_false":"Set to false if the patient is not able to adhere to the study visit schedule as required by the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to adhere to the study visit schedule as required by the protocol.","meaning":"Boolean indicating whether the patient is able to adhere to the study visit schedule as required by the protocol."} ;; "the patient must be able to adhere to the study visit schedule"
(declare-const patient_is_able_to_adhere_to_other_protocol_requirements Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to adhere to other protocol requirements (apart from the study visit schedule).","when_to_set_to_false":"Set to false if the patient is not able to adhere to other protocol requirements (apart from the study visit schedule).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to adhere to other protocol requirements (apart from the study visit schedule).","meaning":"Boolean indicating whether the patient is able to adhere to other protocol requirements (apart from the study visit schedule)."} ;; "the patient must be able to adhere to other protocol requirements"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_able_to_adhere_to_study_visit_schedule
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to adhere to the study visit schedule"

(assert
  (! patient_is_able_to_adhere_to_other_protocol_requirements
     :named REQ2_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to adhere to other protocol requirements"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_psoriatic_arthritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented diagnosis of psoriatic arthritis, by any criteria.","when_to_set_to_false":"Set to false if the patient does not currently have a documented diagnosis of psoriatic arthritis, by any criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a documented diagnosis of psoriatic arthritis, by any criteria.","meaning":"Boolean value indicating whether the patient currently has a documented diagnosis of psoriatic arthritis, by any criteria."} ;; "the patient must have a documented diagnosis of psoriatic arthritis (by any criteria)"
(declare-const duration_of_psoriatic_arthritis_diagnosis_value_recorded_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient was first diagnosed with psoriatic arthritis, if known and documented.","when_to_set_to_null":"Set to null if the duration since psoriatic arthritis diagnosis is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in months since the patient was first diagnosed with psoriatic arthritis."} ;; "duration of psoriatic arthritis diagnosis ≥ 3 months"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_psoriatic_arthritis_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have a documented diagnosis of psoriatic arthritis (by any criteria)"

(assert
  (! (>= duration_of_psoriatic_arthritis_diagnosis_value_recorded_in_months 3)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "duration of psoriatic arthritis diagnosis ≥ 3 months"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_psoriatic_arthritis_now@@meets_classification_criteria_for_psoriatic_arthritis_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current documented finding of psoriatic arthritis meets the Classification Criteria for Psoriatic Arthritis at the time of screening.","when_to_set_to_false":"Set to false if the patient's current documented finding of psoriatic arthritis does not meet the Classification Criteria for Psoriatic Arthritis at the time of screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current documented finding of psoriatic arthritis meets the Classification Criteria for Psoriatic Arthritis at the time of screening.","meaning":"Boolean indicating whether the patient's current documented finding of psoriatic arthritis meets the Classification Criteria for Psoriatic Arthritis at the time of screening."} ;; "the patient must meet the Classification Criteria for Psoriatic Arthritis criteria at time of screening"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies the stem variable (if the patient meets the classification criteria for psoriatic arthritis at screening, then the patient has a finding of psoriatic arthritis now)
(assert
  (! (=> patient_has_finding_of_psoriatic_arthritis_now@@meets_classification_criteria_for_psoriatic_arthritis_at_screening
         patient_has_finding_of_psoriatic_arthritis_now)
     :named REQ4_AUXILIARY0)) ;; "the patient must meet the Classification Criteria for Psoriatic Arthritis criteria at time of screening"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_finding_of_psoriatic_arthritis_now@@meets_classification_criteria_for_psoriatic_arthritis_at_screening
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must meet the Classification Criteria for Psoriatic Arthritis criteria at time of screening"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_joint_swelling_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the measured count if the number of swollen joints is recorded for the patient now.","when_to_set_to_null":"Set to null if the number of swollen joints is not recorded or is indeterminate for the patient now.","meaning":"Numeric count of swollen joints the patient currently has."} ;; "number of swollen joints"
(declare-const patient_tenderness_of_joint_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the measured count if the number of tender joints is recorded for the patient now.","when_to_set_to_null":"Set to null if the number of tender joints is not recorded or is indeterminate for the patient now.","meaning":"Numeric count of tender joints the patient currently has."} ;; "number of tender joints"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: number of swollen joints ≥ 3
(assert
  (! (>= patient_joint_swelling_value_recorded_now_withunit_count 3)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "number of swollen joints ≥ 3"

;; Component 1: number of tender joints ≥ 3
(assert
  (! (>= patient_tenderness_of_joint_value_recorded_now_withunit_count 3)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "number of tender joints ≥ 3"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to any drug or medicament at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to any drug or medicament at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to any drug or medicament in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to any drug or medicament at any time in the past."} ;; "the patient must NOT have been previously treated with (small molecule disease-modifying antirheumatic drugs) AND NOT have been previously treated with (biologic disease-modifying antirheumatic drugs)"
(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory@@is_small_molecule_disease_modifying_antirheumatic_drug Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient was exposed to is a small molecule disease-modifying antirheumatic drug.","when_to_set_to_false":"Set to false if the drug or medicament the patient was exposed to is not a small molecule disease-modifying antirheumatic drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is a small molecule disease-modifying antirheumatic drug.","meaning":"Boolean indicating whether the drug or medicament the patient was exposed to is a small molecule disease-modifying antirheumatic drug."} ;; "the patient must NOT have been previously treated with (small molecule disease-modifying antirheumatic drugs)"
(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory@@is_biologic_disease_modifying_antirheumatic_drug Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient was exposed to is a biologic disease-modifying antirheumatic drug.","when_to_set_to_false":"Set to false if the drug or medicament the patient was exposed to is not a biologic disease-modifying antirheumatic drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is a biologic disease-modifying antirheumatic drug.","meaning":"Boolean indicating whether the drug or medicament the patient was exposed to is a biologic disease-modifying antirheumatic drug."} ;; "the patient must NOT have been previously treated with (biologic disease-modifying antirheumatic drugs)"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_is_exposed_to_drug_or_medicament_inthehistory@@is_small_molecule_disease_modifying_antirheumatic_drug
         patient_is_exposed_to_drug_or_medicament_inthehistory)
     :named REQ6_AUXILIARY0)) ;; "the patient must NOT have been previously treated with (small molecule disease-modifying antirheumatic drugs)"

(assert
  (! (=> patient_is_exposed_to_drug_or_medicament_inthehistory@@is_biologic_disease_modifying_antirheumatic_drug
         patient_is_exposed_to_drug_or_medicament_inthehistory)
     :named REQ6_AUXILIARY1)) ;; "the patient must NOT have been previously treated with (biologic disease-modifying antirheumatic drugs)"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: Patient must NOT have been previously treated with small molecule DMARDs AND NOT with biologic DMARDs
(assert
  (! (and (not patient_is_exposed_to_drug_or_medicament_inthehistory@@is_small_molecule_disease_modifying_antirheumatic_drug)
          (not patient_is_exposed_to_drug_or_medicament_inthehistory@@is_biologic_disease_modifying_antirheumatic_drug))
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must NOT have been previously treated with (small molecule disease-modifying antirheumatic drugs) AND NOT have been previously treated with (biologic disease-modifying antirheumatic drugs)."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_undergoing_therapeutic_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a therapeutic procedure (treatment).","when_to_set_to_false":"Set to false if the patient is currently not undergoing a therapeutic procedure (treatment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a therapeutic procedure (treatment).","meaning":"Boolean indicating whether the patient is currently undergoing a therapeutic procedure (treatment)."} ;; "the patient must be receiving treatment"
(declare-const patient_is_undergoing_therapeutic_procedure_now@@outpatient_basis Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a therapeutic procedure (treatment) and the procedure is provided on an outpatient basis.","when_to_set_to_false":"Set to false if the patient is currently undergoing a therapeutic procedure (treatment) but the procedure is not provided on an outpatient basis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is provided on an outpatient basis.","meaning":"Boolean indicating whether the patient is currently undergoing a therapeutic procedure (treatment) on an outpatient basis."} ;; "the patient must be receiving treatment on an outpatient basis"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies the stem variable (if patient is receiving treatment on an outpatient basis, then patient is receiving treatment)
(assert
  (! (=> patient_is_undergoing_therapeutic_procedure_now@@outpatient_basis
         patient_is_undergoing_therapeutic_procedure_now)
     :named REQ7_AUXILIARY0)) ;; "the patient must be receiving treatment on an outpatient basis" implies "the patient must be receiving treatment"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: The patient must be receiving treatment on an outpatient basis
(assert
  (! patient_is_undergoing_therapeutic_procedure_now@@outpatient_basis
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be receiving treatment on an outpatient basis"

;; ===================== Declarations for the inclusion criterion (REQ 8) =====================
(declare-const oral_corticosteroid_dose_value_recorded_now_withunit_mg_per_day Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current daily oral corticosteroid dose in milligrams per day.","when_to_set_to_null":"Set to null if the current daily oral corticosteroid dose is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the current daily dose of oral corticosteroid the patient is taking, in milligrams per day."} ;; "prednisone ≤ 10 milligrams per day OR an equivalent oral corticosteroid ≤ 10 milligrams per day"
(declare-const patient_is_taking_oral_corticosteroid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any oral corticosteroid.","when_to_set_to_false":"Set to false if the patient is currently not taking any oral corticosteroid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any oral corticosteroid.","meaning":"Boolean indicating whether the patient is currently taking any oral corticosteroid (including but not limited to prednisone)."} ;; "if the patient is taking oral corticosteroids"
(declare-const patient_is_taking_oral_corticosteroid_now@@stable_dose_for_at_least_1_month_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been on a stable dose of oral corticosteroid for at least 1 month prior to screening.","when_to_set_to_false":"Set to false if the patient has not been on a stable dose of oral corticosteroid for at least 1 month prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been on a stable dose of oral corticosteroid for at least 1 month prior to screening.","meaning":"Boolean indicating whether the patient has been on a stable dose of oral corticosteroid for at least 1 month prior to screening."} ;; "the patient must be on a stable dose for at least 1 month prior to screening"
(declare-const patient_is_taking_prednisone_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a prednisone-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a prednisone-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a prednisone-containing product.","meaning":"Boolean indicating whether the patient is currently taking a prednisone-containing product."} ;; "prednisone ≤ 10 milligrams per day"
(declare-const patient_is_taking_prednisone_containing_product_now@@stable_dose_for_at_least_1_month_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been on a stable dose of prednisone-containing product for at least 1 month prior to screening.","when_to_set_to_false":"Set to false if the patient has not been on a stable dose of prednisone-containing product for at least 1 month prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been on a stable dose of prednisone-containing product for at least 1 month prior to screening.","meaning":"Boolean indicating whether the patient has been on a stable dose of prednisone-containing product for at least 1 month prior to screening."} ;; "prednisone ≤ 10 milligrams per day"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable for prednisone-containing product implies stem variable
(assert
  (! (=> patient_is_taking_prednisone_containing_product_now@@stable_dose_for_at_least_1_month_prior_to_screening
         patient_is_taking_prednisone_containing_product_now)
     :named REQ8_AUXILIARY0)) ;; "the patient has been on a stable dose of prednisone-containing product for at least 1 month prior to screening"

;; Qualifier variable for oral corticosteroid implies stem variable
(assert
  (! (=> patient_is_taking_oral_corticosteroid_now@@stable_dose_for_at_least_1_month_prior_to_screening
         patient_is_taking_oral_corticosteroid_now)
     :named REQ8_AUXILIARY1)) ;; "the patient has been on a stable dose of oral corticosteroid for at least 1 month prior to screening"

;; Prednisone-containing product is a type of oral corticosteroid
(assert
  (! (=> patient_is_taking_prednisone_containing_product_now
         patient_is_taking_oral_corticosteroid_now)
     :named REQ8_AUXILIARY2)) ;; "prednisone is a type of oral corticosteroid"

;; Prednisone-containing product with stable dose is a type of oral corticosteroid with stable dose
(assert
  (! (=> patient_is_taking_prednisone_containing_product_now@@stable_dose_for_at_least_1_month_prior_to_screening
         patient_is_taking_oral_corticosteroid_now@@stable_dose_for_at_least_1_month_prior_to_screening)
     :named REQ8_AUXILIARY3)) ;; "prednisone with stable dose is a type of oral corticosteroid with stable dose"

;; ===================== Constraint Assertions (REQ 8) =====================
;; If the patient is taking oral corticosteroids, then the patient must be on a stable dose for at least 1 month prior to screening of (prednisone ≤ 10 mg/day OR an equivalent oral corticosteroid ≤ 10 mg/day)
(assert
  (! (or (not patient_is_taking_oral_corticosteroid_now)
         (and patient_is_taking_oral_corticosteroid_now@@stable_dose_for_at_least_1_month_prior_to_screening
              (or
                (and patient_is_taking_prednisone_containing_product_now@@stable_dose_for_at_least_1_month_prior_to_screening
                     (<= oral_corticosteroid_dose_value_recorded_now_withunit_mg_per_day 10.0)) ;; prednisone ≤ 10 mg/day
                (and (not patient_is_taking_prednisone_containing_product_now)
                     (<= oral_corticosteroid_dose_value_recorded_now_withunit_mg_per_day 10.0)) ;; equivalent oral corticosteroid ≤ 10 mg/day
              )
         )
      )
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is taking oral corticosteroids, the patient must be on a stable dose for at least 1 month prior to screening of (prednisone ≤ 10 milligrams per day) OR (an equivalent oral corticosteroid ≤ 10 milligrams per day)"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_is_taking_non_steroidal_anti_inflammatory_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a nonsteroidal anti-inflammatory agent.","when_to_set_to_false":"Set to false if the patient is currently not taking a nonsteroidal anti-inflammatory agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a nonsteroidal anti-inflammatory agent.","meaning":"Boolean indicating whether the patient is currently taking a nonsteroidal anti-inflammatory agent."} ;; "the patient is taking nonsteroidal anti-inflammatory drugs"
(declare-const patient_is_taking_non_steroidal_anti_inflammatory_agent_now@@stable_dose_for_at_least_2_weeks_prior_to_screening_and_until_completion_of_week_24_study_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a nonsteroidal anti-inflammatory agent and has been on a stable dose for at least 2 weeks prior to screening and until completion of the Week 24 study visit.","when_to_set_to_false":"Set to false if the patient is currently taking a nonsteroidal anti-inflammatory agent but has not been on a stable dose for at least 2 weeks prior to screening and until completion of the Week 24 study visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been on a stable dose for the required period.","meaning":"Boolean indicating that the patient is currently taking a nonsteroidal anti-inflammatory agent and has been on a stable dose for at least 2 weeks prior to screening and until completion of the Week 24 study visit."} ;; "the patient must be on a stable dose for at least 2 weeks prior to screening and until completion of the Week 24 study visit of (nonsteroidal anti-inflammatory drugs)"
(declare-const patient_is_taking_opioid_receptor_agonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an opioid receptor agonist containing product (narcotic analgesic).","when_to_set_to_false":"Set to false if the patient is currently not taking an opioid receptor agonist containing product (narcotic analgesic).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an opioid receptor agonist containing product (narcotic analgesic).","meaning":"Boolean indicating whether the patient is currently taking an opioid receptor agonist containing product (narcotic analgesic)."} ;; "the patient is taking narcotic analgesics"
(declare-const patient_is_taking_opioid_receptor_agonist_containing_product_now@@stable_dose_for_at_least_2_weeks_prior_to_screening_and_until_completion_of_week_24_study_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an opioid receptor agonist containing product (narcotic analgesic) and has been on a stable dose for at least 2 weeks prior to screening and until completion of the Week 24 study visit.","when_to_set_to_false":"Set to false if the patient is currently taking an opioid receptor agonist containing product (narcotic analgesic) but has not been on a stable dose for at least 2 weeks prior to screening and until completion of the Week 24 study visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been on a stable dose for the required period.","meaning":"Boolean indicating that the patient is currently taking an opioid receptor agonist containing product (narcotic analgesic) and has been on a stable dose for at least 2 weeks prior to screening and until completion of the Week 24 study visit."} ;; "the patient must be on a stable dose for at least 2 weeks prior to screening and until completion of the Week 24 study visit of (narcotic analgesics)"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable for NSAIDs implies stem variable
(assert
  (! (=> patient_is_taking_non_steroidal_anti_inflammatory_agent_now@@stable_dose_for_at_least_2_weeks_prior_to_screening_and_until_completion_of_week_24_study_visit
         patient_is_taking_non_steroidal_anti_inflammatory_agent_now)
     :named REQ9_AUXILIARY0)) ;; "the patient must be on a stable dose for at least 2 weeks prior to screening and until completion of the Week 24 study visit of (nonsteroidal anti-inflammatory drugs)"

;; Qualifier variable for narcotic analgesics implies stem variable
(assert
  (! (=> patient_is_taking_opioid_receptor_agonist_containing_product_now@@stable_dose_for_at_least_2_weeks_prior_to_screening_and_until_completion_of_week_24_study_visit
         patient_is_taking_opioid_receptor_agonist_containing_product_now)
     :named REQ9_AUXILIARY1)) ;; "the patient must be on a stable dose for at least 2 weeks prior to screening and until completion of the Week 24 study visit of (narcotic analgesics)"

;; ===================== Constraint Assertions (REQ 9) =====================
;; If the patient is taking NSAIDs or narcotic analgesics, then must be on a stable dose for at least 2 weeks prior to screening and until completion of Week 24 study visit (for the respective drug class)
(assert
  (! (or (not (or patient_is_taking_non_steroidal_anti_inflammatory_agent_now
                  patient_is_taking_opioid_receptor_agonist_containing_product_now))
         (and (=> patient_is_taking_non_steroidal_anti_inflammatory_agent_now
                  patient_is_taking_non_steroidal_anti_inflammatory_agent_now@@stable_dose_for_at_least_2_weeks_prior_to_screening_and_until_completion_of_week_24_study_visit)
              (=> patient_is_taking_opioid_receptor_agonist_containing_product_now
                  patient_is_taking_opioid_receptor_agonist_containing_product_now@@stable_dose_for_at_least_2_weeks_prior_to_screening_and_until_completion_of_week_24_study_visit)))
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is taking nonsteroidal anti-inflammatory drugs OR narcotic analgesics, the patient must be on a stable dose for at least 2 weeks prior to screening and until completion of the Week 24 study visit"

;; ===================== Declarations for the inclusion criterion (REQ 10) =====================

(declare-const patient_has_finding_of_finding_of_lesion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has lesions.","when_to_set_to_false":"Set to false if the patient currently does not have lesions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lesions.","meaning":"Boolean indicating whether the patient currently has lesions."} ;; "lesions"
(declare-const patient_has_finding_of_finding_of_lesion_now@@located_on_body Bool) ;; {"when_to_set_to_true":"Set to true if the lesions are located on the body.","when_to_set_to_false":"Set to false if the lesions are not located on the body.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesions are located on the body.","meaning":"Boolean indicating whether the lesions are located on the body."} ;; "body lesions"
(declare-const patient_has_finding_of_lesion_of_scalp_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has lesions located on the scalp.","when_to_set_to_false":"Set to false if the patient currently does not have lesions located on the scalp.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lesions located on the scalp.","meaning":"Boolean indicating whether the patient currently has lesions located on the scalp."} ;; "scalp lesions"
(declare-const patient_has_finding_of_psoriasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has psoriasis.","when_to_set_to_false":"Set to false if the patient currently does not have psoriasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has psoriasis.","meaning":"Boolean indicating whether the patient currently has psoriasis."} ;; "psoriasis"
(declare-const patient_has_finding_of_psoriasis_now@@located_on_axillae Bool) ;; {"when_to_set_to_true":"Set to true if the psoriasis is located on the axillae.","when_to_set_to_false":"Set to false if the psoriasis is not located on the axillae.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the psoriasis is located on the axillae.","meaning":"Boolean indicating whether the psoriasis is located on the axillae."} ;; "psoriasis on the axillae"
(declare-const patient_has_finding_of_psoriasis_now@@located_on_groin Bool) ;; {"when_to_set_to_true":"Set to true if the psoriasis is located on the groin.","when_to_set_to_false":"Set to false if the psoriasis is not located on the groin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the psoriasis is located on the groin.","meaning":"Boolean indicating whether the psoriasis is located on the groin."} ;; "psoriasis on the groin"
(declare-const patient_has_finding_of_psoriasis_of_face_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has psoriasis located on the face.","when_to_set_to_false":"Set to false if the patient currently does not have psoriasis located on the face.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has psoriasis located on the face.","meaning":"Boolean indicating whether the patient currently has psoriasis located on the face."} ;; "psoriasis on the face"
(declare-const patient_has_finding_of_scalp_psoriasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has psoriasis located on the scalp.","when_to_set_to_false":"Set to false if the patient currently does not have psoriasis located on the scalp.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has psoriasis located on the scalp.","meaning":"Boolean indicating whether the patient currently has psoriasis located on the scalp."} ;; "scalp psoriasis"

(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a corticosteroid or corticosteroid derivative-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a corticosteroid or corticosteroid derivative-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a corticosteroid or corticosteroid derivative-containing product.","meaning":"Boolean indicating whether the patient is currently taking a corticosteroid or corticosteroid derivative-containing product."} ;; "low potency topical corticosteroids"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@low_potency Bool) ;; {"when_to_set_to_true":"Set to true if the corticosteroid or corticosteroid derivative-containing product being taken is of low potency.","when_to_set_to_false":"Set to false if the product is not of low potency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product is of low potency.","meaning":"Boolean indicating whether the corticosteroid or corticosteroid derivative-containing product is of low potency."} ;; "low potency topical corticosteroids"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@used_as_background_therapy_for_psoriasis_of_face_or_axillae_or_groin Bool) ;; {"when_to_set_to_true":"Set to true if the corticosteroid or corticosteroid derivative-containing product is used as background therapy for treatment of psoriasis on the face, axillae, or groin.","when_to_set_to_false":"Set to false if the product is not used as background therapy for these indications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product is used as background therapy for these indications.","meaning":"Boolean indicating whether the corticosteroid or corticosteroid derivative-containing product is used as background therapy for treatment of psoriasis on the face, axillae, or groin."} ;; "as background therapy for treatment of (psoriasis on the face) OR (psoriasis on the axillae) OR (psoriasis on the groin)"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@used_in_accordance_with_manufacturer_suggested_usage Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a corticosteroid or corticosteroid derivative-containing product and the product is used in accordance with the manufacturer's suggested usage.","when_to_set_to_false":"Set to false if the patient is currently taking a corticosteroid or corticosteroid derivative-containing product and the product is not used in accordance with the manufacturer's suggested usage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product is used in accordance with the manufacturer's suggested usage.","meaning":"Boolean indicating whether the patient is currently taking a corticosteroid or corticosteroid derivative-containing product and the product is used in accordance with the manufacturer's suggested usage."} ;; "in accordance with the manufacturers' suggested usage"
(declare-const patient_is_taking_coal_tar_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a coal tar-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a coal tar-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a coal tar-containing product.","meaning":"Boolean indicating whether the patient is currently taking a coal tar-containing product."} ;; "coal tar shampoo"
(declare-const patient_is_taking_coal_tar_containing_product_now@@used_as_shampoo Bool) ;; {"when_to_set_to_true":"Set to true if the coal tar-containing product is used as shampoo.","when_to_set_to_false":"Set to false if the product is not used as shampoo.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product is used as shampoo.","meaning":"Boolean indicating whether the coal tar-containing product is used as shampoo."} ;; "coal tar shampoo"
(declare-const patient_is_taking_coal_tar_containing_product_now@@used_on_scalp_lesions Bool) ;; {"when_to_set_to_true":"Set to true if the coal tar-containing product is used on scalp lesions.","when_to_set_to_false":"Set to false if the product is not used on scalp lesions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product is used on scalp lesions.","meaning":"Boolean indicating whether the coal tar-containing product is used on scalp lesions."} ;; "coal tar shampoo on scalp lesions"
(declare-const patient_is_exposed_to_salicylic_acid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to salicylic acid.","when_to_set_to_false":"Set to false if the patient is currently not exposed to salicylic acid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to salicylic acid.","meaning":"Boolean indicating whether the patient is currently exposed to salicylic acid."} ;; "salicylic acid scalp preparations"
(declare-const patient_is_exposed_to_salicylic_acid_now@@used_as_scalp_preparations Bool) ;; {"when_to_set_to_true":"Set to true if the salicylic acid is used as scalp preparations.","when_to_set_to_false":"Set to false if the salicylic acid is not used as scalp preparations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the salicylic acid is used as scalp preparations.","meaning":"Boolean indicating whether the salicylic acid is used as scalp preparations."} ;; "salicylic acid scalp preparations"
(declare-const patient_is_exposed_to_salicylic_acid_now@@used_on_scalp_lesions Bool) ;; {"when_to_set_to_true":"Set to true if the salicylic acid is used on scalp lesions.","when_to_set_to_false":"Set to false if the salicylic acid is not used on scalp lesions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the salicylic acid is used on scalp lesions.","meaning":"Boolean indicating whether the salicylic acid is used on scalp lesions."} ;; "salicylic acid scalp preparations on scalp lesions"
(declare-const patient_is_exposed_to_emollient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to an emollient.","when_to_set_to_false":"Set to false if the patient is currently not exposed to an emollient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to an emollient.","meaning":"Boolean indicating whether the patient is currently exposed to an emollient."} ;; "non-medicated skin emollient"
(declare-const patient_is_exposed_to_emollient_now@@non_medicated Bool) ;; {"when_to_set_to_true":"Set to true if the emollient is non-medicated.","when_to_set_to_false":"Set to false if the emollient is medicated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the emollient is non-medicated.","meaning":"Boolean indicating whether the emollient is non-medicated."} ;; "non-medicated skin emollient"
(declare-const patient_is_exposed_to_emollient_now@@used_for_body_lesions_only Bool) ;; {"when_to_set_to_true":"Set to true if the emollient is used for body lesions only.","when_to_set_to_false":"Set to false if the emollient is used for other indications or locations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the emollient is used for body lesions only.","meaning":"Boolean indicating whether the emollient is used for body lesions only."} ;; "non-medicated skin emollient for body lesions only"

(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a corticosteroid or corticosteroid derivative-containing product within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not taken a corticosteroid or corticosteroid derivative-containing product within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a corticosteroid or corticosteroid derivative-containing product within the past 24 hours.","meaning":"Boolean indicating whether the patient has taken a corticosteroid or corticosteroid derivative-containing product within the past 24 hours."} ;; "low potency topical corticosteroids within 24 hours"
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast24hours@@low_potency Bool) ;; {"when_to_set_to_true":"Set to true if the corticosteroid or corticosteroid derivative-containing product taken within the past 24 hours is of low potency.","when_to_set_to_false":"Set to false if the product is not of low potency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product is of low potency.","meaning":"Boolean indicating whether the corticosteroid or corticosteroid derivative-containing product taken within the past 24 hours is of low potency."} ;; "low potency topical corticosteroids within 24 hours"
(declare-const patient_has_taken_coal_tar_containing_product_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a coal tar-containing product within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not taken a coal tar-containing product within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a coal tar-containing product within the past 24 hours.","meaning":"Boolean indicating whether the patient has taken a coal tar-containing product within the past 24 hours."} ;; "coal tar shampoo within 24 hours"
(declare-const patient_is_exposed_to_salicylic_acid_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to salicylic acid within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not been exposed to salicylic acid within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to salicylic acid within the past 24 hours.","meaning":"Boolean indicating whether the patient has been exposed to salicylic acid within the past 24 hours."} ;; "salicylic acid scalp preparations within 24 hours"
(declare-const patient_is_exposed_to_emollient_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to an emollient within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not been exposed to an emollient within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to an emollient within the past 24 hours.","meaning":"Boolean indicating whether the patient has been exposed to an emollient within the past 24 hours."} ;; "non-medicated skin emollient within 24 hours"

;; ===================== Auxiliary Assertions (REQ 10) =====================

;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_finding_of_finding_of_lesion_now@@located_on_body
         patient_has_finding_of_finding_of_lesion_now)
     :named REQ10_AUXILIARY0)) ;; "body lesions"

(assert
  (! (=> patient_has_finding_of_psoriasis_now@@located_on_axillae
         patient_has_finding_of_psoriasis_now)
     :named REQ10_AUXILIARY1)) ;; "psoriasis on the axillae"

(assert
  (! (=> patient_has_finding_of_psoriasis_now@@located_on_groin
         patient_has_finding_of_psoriasis_now)
     :named REQ10_AUXILIARY2)) ;; "psoriasis on the groin"

(assert
  (! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@low_potency
         patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
     :named REQ10_AUXILIARY3)) ;; "low potency topical corticosteroids"

(assert
  (! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@used_as_background_therapy_for_psoriasis_of_face_or_axillae_or_groin
         patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
     :named REQ10_AUXILIARY4)) ;; "as background therapy for treatment of (psoriasis on the face) OR (psoriasis on the axillae) OR (psoriasis on the groin)"

(assert
  (! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@used_in_accordance_with_manufacturer_suggested_usage
         patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
     :named REQ10_AUXILIARY5)) ;; "in accordance with the manufacturers' suggested usage"

(assert
  (! (=> patient_is_taking_coal_tar_containing_product_now@@used_as_shampoo
         patient_is_taking_coal_tar_containing_product_now)
     :named REQ10_AUXILIARY6)) ;; "coal tar shampoo"

(assert
  (! (=> patient_is_taking_coal_tar_containing_product_now@@used_on_scalp_lesions
         patient_is_taking_coal_tar_containing_product_now)
     :named REQ10_AUXILIARY7)) ;; "coal tar shampoo on scalp lesions"

(assert
  (! (=> patient_is_exposed_to_salicylic_acid_now@@used_as_scalp_preparations
         patient_is_exposed_to_salicylic_acid_now)
     :named REQ10_AUXILIARY8)) ;; "salicylic acid scalp preparations"

(assert
  (! (=> patient_is_exposed_to_salicylic_acid_now@@used_on_scalp_lesions
         patient_is_exposed_to_salicylic_acid_now)
     :named REQ10_AUXILIARY9)) ;; "salicylic acid scalp preparations on scalp lesions"

(assert
  (! (=> patient_is_exposed_to_emollient_now@@non_medicated
         patient_is_exposed_to_emollient_now)
     :named REQ10_AUXILIARY10)) ;; "non-medicated skin emollient"

(assert
  (! (=> patient_is_exposed_to_emollient_now@@used_for_body_lesions_only
         patient_is_exposed_to_emollient_now)
     :named REQ10_AUXILIARY11)) ;; "non-medicated skin emollient for body lesions only"

(assert
  (! (=> patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast24hours@@low_potency
         patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast24hours)
     :named REQ10_AUXILIARY12)) ;; "low potency topical corticosteroids within 24 hours"

;; Non-exhaustive examples for low potency topical corticosteroids (Appendix M or locally available equivalent) are not encoded as equivalence, only as implication if needed (not present in variable set).

;; Non-exhaustive examples for non-medicated skin emollient (Eucerin cream) are not encoded as equivalence, only as implication if needed (not present in variable set).

;; ===================== Constraint Assertions (REQ 10) =====================
;; All components in this requirement are labeled as "NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION" and thus do not restrict eligibility.
;; No constraint assertions are emitted for this requirement.

;; ===================== Declarations for the laboratory criteria (REQ 11) =====================
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current white blood cell count per cubic millimeter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current white blood cell count per cubic millimeter."} ;; "white blood cell count ≥ 3,000 per cubic millimeter AND white blood cell count < 14,000 per cubic millimeter"
(declare-const patient_platelet_count_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current platelet count per cubic millimeter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current platelet count per cubic millimeter."} ;; "platelet count ≥ 100,000 per cubic millimeter"
(declare-const patient_creatinine_measurement_serum_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum creatinine in milligrams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum creatinine in milligrams per deciliter."} ;; "serum creatinine ≤ 1.5 milligrams per deciliter"
(declare-const patient_aspartate_aminotransferase_measurement_value_recorded_now_withunit_times_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current AST (serum glutamic oxaloacetic transaminase) in multiples of the upper limit of normal is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current AST in multiples of the upper limit of normal."} ;; "aspartate aminotransferase ≤ 2 × upper limit of normal"
(declare-const patient_serum_glutamic_pyruvic_transaminase_measurement_value_recorded_now_withunit_times_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum glutamic pyruvic transaminase in multiples of the upper limit of normal is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum glutamic pyruvic transaminase in multiples of the upper limit of normal."} ;; "serum glutamic pyruvic transaminase ≤ 2 × upper limit of normal"
(declare-const patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_times_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current ALT (serum glutamic pyruvic transaminase) in multiples of the upper limit of normal is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current ALT in multiples of the upper limit of normal."} ;; "alanine aminotransferase ≤ 2 × upper limit of normal"
(declare-const patient_bilirubin_total_measurement_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current total bilirubin in milligrams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current total bilirubin in milligrams per deciliter."} ;; "total bilirubin ≤ 2 milligrams per deciliter"
(declare-const patient_hemoglobin_measurement_value_recorded_now_withunit_grams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current hemoglobin in grams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current hemoglobin in grams per deciliter."} ;; "hemoglobin ≥ 9 grams per deciliter"
(declare-const patient_hemoglobin_a1c_measurement_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current hemoglobin A1c in percent is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current hemoglobin A1c in percent."} ;; "hemoglobin A1c ≤ 9.0 percent"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Component 0: white blood cell count ≥ 3,000 AND < 14,000 per cubic millimeter
(assert
  (! (and (>= patient_white_blood_cell_count_value_recorded_now_withunit_per_cubic_millimeter 3000.0)
          (< patient_white_blood_cell_count_value_recorded_now_withunit_per_cubic_millimeter 14000.0))
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "white blood cell count ≥ 3,000 per cubic millimeter AND white blood cell count < 14,000 per cubic millimeter"

;; Component 1: platelet count ≥ 100,000 per cubic millimeter
(assert
  (! (>= patient_platelet_count_value_recorded_now_withunit_per_cubic_millimeter 100000.0)
     :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "platelet count ≥ 100,000 per cubic millimeter"

;; Component 2: serum creatinine ≤ 1.5 milligrams per deciliter
(assert
  (! (<= patient_creatinine_measurement_serum_value_recorded_now_withunit_milligrams_per_deciliter 1.5)
     :named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "serum creatinine ≤ 1.5 milligrams per deciliter"

;; Component 3: (aspartate aminotransferase ≤ 2 × ULN) OR (serum glutamic oxaloacetic transaminase ≤ 2 × ULN)
(assert
  (! (or (<= patient_aspartate_aminotransferase_measurement_value_recorded_now_withunit_times_upper_limit_of_normal 2.0)
         (<= patient_serum_glutamic_pyruvic_transaminase_measurement_value_recorded_now_withunit_times_upper_limit_of_normal 2.0))
     :named REQ11_COMPONENT3_OTHER_REQUIREMENTS)) ;; "(aspartate aminotransferase ≤ 2 × upper limit of normal) OR (serum glutamic oxaloacetic transaminase ≤ 2 × upper limit of normal)"

;; Component 4: (alanine aminotransferase ≤ 2 × ULN) OR (serum glutamic pyruvic transaminase ≤ 2 × ULN)
(assert
  (! (or (<= patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_times_upper_limit_of_normal 2.0)
         (<= patient_serum_glutamic_pyruvic_transaminase_measurement_value_recorded_now_withunit_times_upper_limit_of_normal 2.0))
     :named REQ11_COMPONENT4_OTHER_REQUIREMENTS)) ;; "(alanine aminotransferase ≤ 2 × upper limit of normal) OR (serum glutamic pyruvic transaminase ≤ 2 × upper limit of normal)"

;; Component 5: total bilirubin ≤ 2 milligrams per deciliter
(assert
  (! (<= patient_bilirubin_total_measurement_value_recorded_now_withunit_milligrams_per_deciliter 2.0)
     :named REQ11_COMPONENT5_OTHER_REQUIREMENTS)) ;; "total bilirubin ≤ 2 milligrams per deciliter"

;; Component 6: hemoglobin ≥ 9 grams per deciliter
(assert
  (! (>= patient_hemoglobin_measurement_value_recorded_now_withunit_grams_per_deciliter 9.0)
     :named REQ11_COMPONENT6_OTHER_REQUIREMENTS)) ;; "hemoglobin ≥ 9 grams per deciliter"

;; Component 7: hemoglobin A1c ≤ 9.0 percent
(assert
  (! (<= patient_hemoglobin_a1c_measurement_value_recorded_now_withunit_percent 9.0)
     :named REQ11_COMPONENT7_OTHER_REQUIREMENTS)) ;; "hemoglobin A1c ≤ 9.0 percent"

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_engages_in_activity_in_which_conception_is_possible_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently engaging in activity in which conception is possible.","when_to_set_to_false":"Set to false if the patient is currently not engaging in activity in which conception is possible.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently engaging in activity in which conception is possible.","meaning":"Boolean indicating whether the patient is currently engaging in activity in which conception is possible."} ;; "engages in activity in which conception is possible"
(declare-const patient_has_finding_of_barrier_contraception_method_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a barrier contraception method.","when_to_set_to_false":"Set to false if the patient is currently not using a barrier contraception method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a barrier contraception method.","meaning":"Boolean indicating whether the patient is currently using a barrier contraception method."} ;; "must use barrier contraception"
(declare-const patient_has_finding_of_barrier_contraception_method_now@@used_while_on_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a barrier contraception method and the method is used while the patient is on investigational product.","when_to_set_to_false":"Set to false if the patient is currently using a barrier contraception method but not while on investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the barrier contraception method is used while on investigational product.","meaning":"Boolean indicating whether the patient is currently using a barrier contraception method while on investigational product."} ;; "while on investigational product"
(declare-const patient_has_finding_of_barrier_contraception_method_now@@used_for_at_least_28_days_after_last_dose_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a barrier contraception method and the method is used for at least 28 days after the last dose of investigational product.","when_to_set_to_false":"Set to false if the patient is currently using a barrier contraception method but not for at least 28 days after the last dose of investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the barrier contraception method is used for at least 28 days after the last dose of investigational product.","meaning":"Boolean indicating whether the patient is currently using a barrier contraception method for at least 28 days after the last dose of investigational product."} ;; "for at least 28 days after the last dose of investigational product"
(declare-const patient_has_finding_of_barrier_contraception_method_now@@type_latex_condom Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a latex condom as a barrier contraception method.","when_to_set_to_false":"Set to false if the patient is currently using a barrier contraception method but not a latex condom.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a latex condom as a barrier contraception method.","meaning":"Boolean indicating whether the patient is currently using a latex condom as a barrier contraception method."} ;; "latex condom"
(declare-const patient_has_finding_of_barrier_contraception_method_now@@type_nonlatex_condom_not_made_out_of_natural_animal_membrane Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a nonlatex condom not made out of natural animal membrane as a barrier contraception method.","when_to_set_to_false":"Set to false if the patient is currently using a barrier contraception method but not a nonlatex condom not made out of natural animal membrane.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a nonlatex condom not made out of natural animal membrane as a barrier contraception method.","meaning":"Boolean indicating whether the patient is currently using a nonlatex condom not made out of natural animal membrane as a barrier contraception method."} ;; "any nonlatex condom not made out of natural animal membrane"
(declare-const patient_has_finding_of_barrier_contraception_method_now@@type_nonlatex_condom_not_made_out_of_natural_animal_membrane@@type_polyurethane Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a polyurethane nonlatex condom not made out of natural animal membrane as a barrier contraception method.","when_to_set_to_false":"Set to false if the patient is currently using a nonlatex condom not made out of natural animal membrane as a barrier contraception method but not made of polyurethane.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a polyurethane nonlatex condom not made out of natural animal membrane as a barrier contraception method.","meaning":"Boolean indicating whether the patient is currently using a polyurethane nonlatex condom not made out of natural animal membrane as a barrier contraception method."} ;; "polyurethane (nonlatex condom not made out of natural animal membrane)"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Non-exhaustive examples: latex condom and any nonlatex condom not made out of natural animal membrane are examples of barrier contraception
(assert
  (! (=> (or patient_has_finding_of_barrier_contraception_method_now@@type_latex_condom
             patient_has_finding_of_barrier_contraception_method_now@@type_nonlatex_condom_not_made_out_of_natural_animal_membrane)
         patient_has_finding_of_barrier_contraception_method_now)
     :named REQ12_AUXILIARY0)) ;; "barrier contraception (with non-exhaustive examples (latex condom OR any nonlatex condom not made out of natural animal membrane ...))"

;; Non-exhaustive example: polyurethane is an example of nonlatex condom not made out of natural animal membrane
(assert
  (! (=> patient_has_finding_of_barrier_contraception_method_now@@type_nonlatex_condom_not_made_out_of_natural_animal_membrane@@type_polyurethane
         patient_has_finding_of_barrier_contraception_method_now@@type_nonlatex_condom_not_made_out_of_natural_animal_membrane)
     :named REQ12_AUXILIARY1)) ;; "polyurethane (nonlatex condom not made out of natural animal membrane)"

;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_finding_of_barrier_contraception_method_now@@used_while_on_investigational_product
         patient_has_finding_of_barrier_contraception_method_now)
     :named REQ12_AUXILIARY2)) ;; "used while on investigational product"

(assert
  (! (=> patient_has_finding_of_barrier_contraception_method_now@@used_for_at_least_28_days_after_last_dose_of_investigational_product
         patient_has_finding_of_barrier_contraception_method_now)
     :named REQ12_AUXILIARY3)) ;; "used for at least 28 days after the last dose of investigational product"

;; ===================== Constraint Assertions (REQ 12) =====================
;; If the patient is male and engages in activity in which conception is possible, then must use barrier contraception while on investigational product and for at least 28 days after last dose
(assert
  (! (or (not (and patient_sex_is_male_now
                   patient_engages_in_activity_in_which_conception_is_possible_now))
         (and patient_has_finding_of_barrier_contraception_method_now@@used_while_on_investigational_product
              patient_has_finding_of_barrier_contraception_method_now@@used_for_at_least_28_days_after_last_dose_of_investigational_product))
     :named REQ12_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is male AND engages in activity in which conception is possible, the patient must use barrier contraception while on investigational product AND for at least 28 days after the last dose of investigational product"

;; ===================== Declarations for the inclusion criterion (REQ 13) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have childbearing potential (i.e., is biologically capable of becoming pregnant, not postmenopausal, not permanently sterilized, and not otherwise incapable of pregnancy).","when_to_set_to_false":"Set to false if the patient is currently not considered to have childbearing potential (e.g., postmenopausal, permanently sterilized, or otherwise incapable of pregnancy).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient currently has childbearing potential."} ;; "if the patient is a female of childbearing potential"
(declare-const patient_has_pregnancy_test_result_at_screening_value_recorded_now_withunit_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a negative pregnancy test result recorded at Screening.","when_to_set_to_false":"Set to false if the patient does not have a negative pregnancy test result recorded at Screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a negative pregnancy test result recorded at Screening.","meaning":"Indicates whether the patient has a negative pregnancy test result recorded at Screening."} ;; "the patient must have a negative pregnancy test at Screening"
(declare-const patient_has_pregnancy_test_result_at_baseline_value_recorded_now_withunit_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a negative pregnancy test result recorded at Baseline.","when_to_set_to_false":"Set to false if the patient does not have a negative pregnancy test result recorded at Baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a negative pregnancy test result recorded at Baseline.","meaning":"Indicates whether the patient has a negative pregnancy test result recorded at Baseline."} ;; "the patient must have a negative pregnancy test at Baseline"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by a pregnancy test or clinical assessment.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by a pregnancy test or clinical assessment.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently pregnant."} ;; "the patient must have a negative pregnancy test at Screening AND Baseline"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} ;; "the patient must be female"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Pregnancy test results at Screening and Baseline imply not currently pregnant
(assert
  (! (=> (and patient_has_pregnancy_test_result_at_screening_value_recorded_now_withunit_negative
              patient_has_pregnancy_test_result_at_baseline_value_recorded_now_withunit_negative)
         (not patient_is_pregnant_now))
     :named REQ13_AUXILIARY0)) ;; "the patient must have a negative pregnancy test at Screening AND Baseline"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Component 0: If patient is female and of childbearing potential, must have negative pregnancy test at Screening AND Baseline
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         (and patient_has_pregnancy_test_result_at_screening_value_recorded_now_withunit_negative
              patient_has_pregnancy_test_result_at_baseline_value_recorded_now_withunit_negative))
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, if the patient is a female of childbearing potential, the patient must have a negative pregnancy test at Screening AND Baseline."
