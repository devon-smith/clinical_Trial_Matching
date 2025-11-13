;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_carcinoma_of_esophagus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of carcinoma of the oesophagus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of carcinoma of the oesophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of carcinoma of the oesophagus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of carcinoma of the oesophagus."}  ;; "To be included, the patient must have biopsy proven carcinoma of the oesophagus."
(declare-const patient_has_diagnosis_of_carcinoma_of_esophagus_now@@proven_by_biopsy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of carcinoma of the oesophagus is proven by biopsy.","when_to_set_to_false":"Set to false if the patient's diagnosis of carcinoma of the oesophagus is not proven by biopsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of carcinoma of the oesophagus is proven by biopsy.","meaning":"Boolean indicating whether the patient's diagnosis of carcinoma of the oesophagus is proven by biopsy."}  ;; "To be included, the patient must have biopsy proven carcinoma of the oesophagus."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_diagnosis_of_carcinoma_of_esophagus_now@@proven_by_biopsy
         patient_has_diagnosis_of_carcinoma_of_esophagus_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have biopsy proven carcinoma of the oesophagus."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_carcinoma_of_esophagus_now@@proven_by_biopsy
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have biopsy proven carcinoma of the oesophagus."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_candidate_for_radical_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a candidate for radical treatment.","when_to_set_to_false":"Set to false if the patient is currently not a candidate for radical treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a candidate for radical treatment.","meaning":"Boolean indicating whether the patient is currently a candidate for radical treatment."} ;; "NOT be a candidate for radical treatment"
(declare-const patient_is_candidate_for_curative_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a candidate for curative treatment.","when_to_set_to_false":"Set to false if the patient is currently not a candidate for curative treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a candidate for curative treatment.","meaning":"Boolean indicating whether the patient is currently a candidate for curative treatment."} ;; "NOT be a candidate for curative treatment"
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease.","when_to_set_to_false":"Set to false if the patient currently does not have a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease.","meaning":"Boolean indicating whether the patient currently has a disease."} ;; "advanced nature of the disease"
(declare-const patient_has_finding_of_disease_now@@advanced_nature Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disease is advanced in nature.","when_to_set_to_false":"Set to false if the patient's current disease is not advanced in nature.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease is advanced in nature.","meaning":"Boolean indicating whether the patient's current disease is advanced in nature."} ;; "advanced nature of the disease"
(declare-const patient_has_finding_of_secondary_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has secondary malignant neoplastic disease (metastases).","when_to_set_to_false":"Set to false if the patient currently does not have secondary malignant neoplastic disease (metastases).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary malignant neoplastic disease (metastases).","meaning":"Boolean indicating whether the patient currently has secondary malignant neoplastic disease (metastases)."} ;; "presence of metastases"
(declare-const patient_has_finding_of_intercurrent_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an intercurrent disease (intercurrent illness).","when_to_set_to_false":"Set to false if the patient currently does not have an intercurrent disease (intercurrent illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an intercurrent disease (intercurrent illness).","meaning":"Boolean indicating whether the patient currently has an intercurrent disease (intercurrent illness)."} ;; "presence of intercurrent illness"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_disease_now@@advanced_nature
         patient_has_finding_of_disease_now)
     :named REQ1_AUXILIARY0)) ;; "advanced nature of the disease"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must (NOT be a candidate for radical treatment) OR (NOT be a candidate for curative treatment due to (the advanced nature of the disease OR presence of metastases OR presence of intercurrent illness)).
(assert
  (! (or
        (not patient_is_candidate_for_radical_treatment_now)
        (and
          (not patient_is_candidate_for_curative_treatment_now)
          (or patient_has_finding_of_disease_now@@advanced_nature
              patient_has_finding_of_secondary_malignant_neoplastic_disease_now
              patient_has_finding_of_intercurrent_disease_now)))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (NOT be a candidate for radical treatment) OR (NOT be a candidate for curative treatment due to (the advanced nature of the disease OR presence of metastases OR presence of intercurrent illness))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_dysphagia_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured dysphagia score if a numeric measurement using the Mellow Scale is available for the patient now.","when_to_set_to_null":"Set to null if no such score is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current dysphagia score (Mellow Scale)."} ;; "dysphagia scores ≥ 1 (defined as able to eat only some solids according to Mellow Scale appendix 1)"
(declare-const patient_is_symptomatic_with_dysphagia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently symptomatic with dysphagia.","when_to_set_to_false":"Set to false if the patient is currently not symptomatic with dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently symptomatic with dysphagia.","meaning":"Boolean indicating whether the patient is currently symptomatic with dysphagia."} ;; "the patient must be symptomatic with dysphagia"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Being symptomatic with dysphagia is defined as having a dysphagia score ≥ 1 (Mellow Scale)
(assert
  (! (= patient_is_symptomatic_with_dysphagia_now
        (>= patient_dysphagia_value_recorded_now_withunit_score 1.0))
     :named REQ2_AUXILIARY0)) ;; "dysphagia scores ≥ 1 (defined as able to eat only some solids according to Mellow Scale appendix 1)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_symptomatic_with_dysphagia_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be symptomatic with dysphagia scores ≥ 1 (defined as able to eat only some solids according to Mellow Scale appendix 1)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_ecog_performance_status_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the measured ECOG performance status value if a numeric measurement is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current ECOG performance status."} ;; "performance status Eastern Cooperative Oncology Group ≤ 2"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (<= patient_ecog_performance_status_value_recorded_now_withunit_none 2)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a performance status Eastern Cooperative Oncology Group ≤ 2."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const treatment_start_time_since_randomization_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days between the patient's randomization and the start of treatment, if both dates are known.","when_to_set_to_null":"Set to null if either the date of randomization or the date of treatment initiation is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of days between randomization and treatment start for the patient."} ;; "To be included, the patient must begin treatment within 2 weeks of randomization."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (<= treatment_start_time_since_randomization_in_days 14)
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must begin treatment within 2 weeks of randomization."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "To be included, the patient must be at least 18 years old."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be at least 18 years old."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_can_undergo_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo chemotherapy.","when_to_set_to_false":"Set to false if the patient cannot currently undergo chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo chemotherapy.","meaning":"Boolean indicating whether the patient can currently undergo chemotherapy."} ;; "To be included, the patient must have adequate haematological function to undergo chemotherapy"
(declare-const patients_hematologic_function_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's haematological function is normal (adequate) now.","when_to_set_to_false":"Set to false if the patient's haematological function is not normal (inadequate) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's haematological function is normal now.","meaning":"Boolean indicating whether the patient's haematological function is normal (adequate) now."} ;; "adequate haematological function"
(declare-const peripheral_blood_neutrophil_count_value_recorded_now_withunit_10e9_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current peripheral blood neutrophil count, measured in 10^9 per liter, if available now.","when_to_set_to_null":"Set to null if the current peripheral blood neutrophil count is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current peripheral blood neutrophil count, in 10^9 per liter."} ;; "peripheral blood neutrophil count > 1.5 x 10^9/L"
(declare-const peripheral_blood_platelet_count_value_recorded_now_withunit_10e9_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current peripheral blood platelet count, measured in 10^9 per liter, if available now.","when_to_set_to_null":"Set to null if the current peripheral blood platelet count is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current peripheral blood platelet count, in 10^9 per liter."} ;; "peripheral blood platelet count > 100 x 10^9/L"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition in the requirement: adequate haematological function is defined as both counts above thresholds
(assert
  (! (= patients_hematologic_function_is_normal_now
        (and (> peripheral_blood_neutrophil_count_value_recorded_now_withunit_10e9_per_l 1.5)
             (> peripheral_blood_platelet_count_value_recorded_now_withunit_10e9_per_l 100.0)))
     :named REQ6_AUXILIARY0)) ;; "adequate haematological function to undergo chemotherapy (defined as peripheral blood neutrophil count > 1.5 x 10^9/L AND peripheral blood platelet count > 100 x 10^9/L)"

;; Definition in the requirement: patient can undergo chemotherapy if haematological function is adequate
(assert
  (! (= patient_can_undergo_chemotherapy_now
        patients_hematologic_function_is_normal_now)
     :named REQ6_AUXILIARY1)) ;; "adequate haematological function to undergo chemotherapy"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_can_undergo_chemotherapy_now
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have adequate haematological function to undergo chemotherapy (defined as peripheral blood neutrophil count > 1.5 x 10^9/L AND peripheral blood platelet count > 100 x 10^9/L)."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_creatinine_clearance_value_recorded_now_withunit_ml_per_min Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's creatinine calculated clearance measured now, in ml/min.","when_to_set_to_null":"Set to null if the patient's creatinine calculated clearance value measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's creatinine calculated clearance measured now, in ml/min."}  ;; "creatinine calculated clearance ≥ 50 ml/min"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (>= patient_creatinine_clearance_value_recorded_now_withunit_ml_per_min 50.0)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have adequate renal function (defined as creatinine calculated clearance ≥ 50 ml/min)."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the biological potential to bear children (e.g., is of appropriate sex and age, not postmenopausal, not surgically sterilized).","when_to_set_to_false":"Set to false if the patient does not currently have the biological potential to bear children (e.g., male sex, postmenopausal, surgically sterilized, prepubertal).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has the biological potential to bear children."} ;; "capable of childbearing"
(declare-const patient_is_using_adequate_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using contraception that is considered adequate (e.g., hormonal, intrauterine device, sterilization, or other methods deemed sufficient by clinical guidelines).","when_to_set_to_false":"Set to false if the patient is currently not using contraception, or is using contraception that is not considered adequate (e.g., unreliable methods, abstinence not confirmed, or inconsistent use).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using adequate contraception.","meaning":"Boolean indicating whether the patient is currently using contraception that is considered adequate."} ;; "the patient must be using adequate contraception"

;; ===================== Constraint Assertions (REQ 8) =====================
;; If the patient is capable of childbearing, the patient must be using adequate contraception.
(assert
  (! (or (not patient_has_childbearing_potential_now)
         patient_is_using_adequate_contraception_now)
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is capable of childbearing, the patient must be using adequate contraception."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} ;; "To be included, the patient must provide written informed consent."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide written informed consent."
