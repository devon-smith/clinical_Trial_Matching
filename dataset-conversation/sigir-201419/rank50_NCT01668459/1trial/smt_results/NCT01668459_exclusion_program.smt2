;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_exposed_to_taxane_derivative_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to a taxane derivative at any time in the past, regardless of context.","when_to_set_to_false":"Set to false if the patient has never been exposed to a taxane derivative at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to a taxane derivative.","meaning":"Boolean indicating whether the patient has ever been exposed to a taxane derivative at any time in the past."} ;; "taxane drug"

(declare-const patient_is_exposed_to_taxane_derivative_inthehistory@@exposure_occurred_in_previous_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to a taxane derivative at any time in the past occurred specifically as part of previous therapy.","when_to_set_to_false":"Set to false if the patient's exposure to a taxane derivative at any time in the past did not occur as part of previous therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred as part of previous therapy.","meaning":"Boolean indicating whether the patient's exposure to a taxane derivative at any time in the past occurred specifically as part of previous therapy."} ;; "previous therapy with a taxane drug"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_taxane_derivative_inthehistory@@exposure_occurred_in_previous_therapy
      patient_is_exposed_to_taxane_derivative_inthehistory)
:named REQ0_AUXILIARY0)) ;; "previous therapy with a taxane drug""

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_exposed_to_taxane_derivative_inthehistory@@exposure_occurred_in_previous_therapy)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous therapy with a taxane drug."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_malignant_epithelial_neoplasm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant epithelial neoplasm (carcinoma).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant epithelial neoplasm (carcinoma).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant epithelial neoplasm (carcinoma).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant epithelial neoplasm (carcinoma)."} ;; "carcinoma"
(declare-const patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@pure_non_transitional_cell_histology Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of malignant epithelial neoplasm (carcinoma) is of pure non-transitional cell histology.","when_to_set_to_false":"Set to false if the patient's current diagnosis of malignant epithelial neoplasm (carcinoma) is not of pure non-transitional cell histology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the histology of the patient's current carcinoma diagnosis is pure non-transitional cell type.","meaning":"Boolean indicating whether the patient's current diagnosis of malignant epithelial neoplasm (carcinoma) is of pure non-transitional cell histology."} ;; "pure non-transitional cell carcinoma histologies"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@pure_non_transitional_cell_histology
      patient_has_diagnosis_of_malignant_epithelial_neoplasm_now)
   :named REQ1_AUXILIARY0)) ;; "pure non-transitional cell carcinoma histologies" qualifier implies carcinoma diagnosis

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_epithelial_neoplasm_now@@pure_non_transitional_cell_histology)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pure non-transitional cell carcinoma histologies."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disorder_of_the_peripheral_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the peripheral nervous system (peripheral neuropathy).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the peripheral nervous system (peripheral neuropathy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the peripheral nervous system (peripheral neuropathy).","meaning":"Boolean indicating whether the patient currently has a disorder of the peripheral nervous system (peripheral neuropathy) now."} ;; "peripheral neuropathy"
(declare-const patient_has_finding_of_disorder_of_the_peripheral_nervous_system_now@@grade_ii Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral neuropathy and the grade is II.","when_to_set_to_false":"Set to false if the patient currently has peripheral neuropathy but the grade is not II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the grade of peripheral neuropathy is II.","meaning":"Boolean indicating whether the patient currently has peripheral neuropathy of grade II."} ;; "grade II peripheral neuropathy"
(declare-const patient_has_finding_of_disorder_of_the_peripheral_nervous_system_now@@grade_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral neuropathy and the grade is III.","when_to_set_to_false":"Set to false if the patient currently has peripheral neuropathy but the grade is not III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the grade of peripheral neuropathy is III.","meaning":"Boolean indicating whether the patient currently has peripheral neuropathy of grade III."} ;; "grade III peripheral neuropathy"
(declare-const patient_has_finding_of_disorder_of_the_peripheral_nervous_system_now@@grade_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral neuropathy and the grade is IV.","when_to_set_to_false":"Set to false if the patient currently has peripheral neuropathy but the grade is not IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the grade of peripheral neuropathy is IV.","meaning":"Boolean indicating whether the patient currently has peripheral neuropathy of grade IV."} ;; "grade IV peripheral neuropathy"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_the_peripheral_nervous_system_now@@grade_ii
      patient_has_finding_of_disorder_of_the_peripheral_nervous_system_now)
:named REQ2_AUXILIARY0)) ;; "grade II peripheral neuropathy"

(assert
(! (=> patient_has_finding_of_disorder_of_the_peripheral_nervous_system_now@@grade_iii
      patient_has_finding_of_disorder_of_the_peripheral_nervous_system_now)
:named REQ2_AUXILIARY1)) ;; "grade III peripheral neuropathy"

(assert
(! (=> patient_has_finding_of_disorder_of_the_peripheral_nervous_system_now@@grade_iv
      patient_has_finding_of_disorder_of_the_peripheral_nervous_system_now)
:named REQ2_AUXILIARY2)) ;; "grade IV peripheral neuropathy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_disorder_of_the_peripheral_nervous_system_now@@grade_ii)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has grade II peripheral neuropathy."

(assert
(! (not patient_has_finding_of_disorder_of_the_peripheral_nervous_system_now@@grade_iii)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has grade III peripheral neuropathy."

(assert
(! (not patient_has_finding_of_disorder_of_the_peripheral_nervous_system_now@@grade_iv)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has grade IV peripheral neuropathy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_surgical_procedure_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure within the past four weeks prior to enrolment in the study.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure within the past four weeks prior to enrolment in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure within the past four weeks prior to enrolment in the study.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure within the past four weeks."} ;; "prior surgery within four weeks prior to enrolment in the study"
(declare-const patient_has_undergone_therapeutic_procedure_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a therapeutic procedure (e.g., radiation therapy) within the past four weeks prior to enrolment in the study.","when_to_set_to_false":"Set to false if the patient has not undergone a therapeutic procedure within the past four weeks prior to enrolment in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a therapeutic procedure within the past four weeks prior to enrolment in the study.","meaning":"Boolean indicating whether the patient has undergone a therapeutic procedure within the past four weeks."} ;; "prior radiation therapy within four weeks prior to enrolment in the study"
(declare-const patient_has_undergone_chemotherapy_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone chemotherapy within the past four weeks prior to enrolment in the study.","when_to_set_to_false":"Set to false if the patient has not undergone chemotherapy within the past four weeks prior to enrolment in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone chemotherapy within the past four weeks prior to enrolment in the study.","meaning":"Boolean indicating whether the patient has undergone chemotherapy within the past four weeks."} ;; "prior chemotherapy within four weeks prior to enrolment in the study"
(declare-const patient_has_undergone_administration_of_antineoplastic_agent_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone administration of an antineoplastic agent (anti-cancer therapy) within the past four weeks prior to enrolment in the study.","when_to_set_to_false":"Set to false if the patient has not undergone administration of an antineoplastic agent within the past four weeks prior to enrolment in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone administration of an antineoplastic agent within the past four weeks prior to enrolment in the study.","meaning":"Boolean indicating whether the patient has undergone administration of an antineoplastic agent within the past four weeks."} ;; "prior anti-cancer therapy within four weeks prior to enrolment in the study"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_surgical_procedure_inthepast4weeks)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has had prior surgery within four weeks prior to enrolment in the study."

(assert
(! (not patient_has_undergone_therapeutic_procedure_inthepast4weeks)
:named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has had prior radiation therapy within four weeks prior to enrolment in the study."

(assert
(! (not patient_has_undergone_chemotherapy_inthepast4weeks)
:named REQ3_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has had prior chemotherapy within four weeks prior to enrolment in the study."

(assert
(! (not patient_has_undergone_administration_of_antineoplastic_agent_inthepast4weeks)
:named REQ3_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has had prior anti-cancer therapy within four weeks prior to enrolment in the study."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any illness.","when_to_set_to_false":"Set to false if the patient currently does not have any illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any illness.","meaning":"Boolean indicating whether the patient currently has any illness."} ;; "illness"
(declare-const patient_has_finding_of_illness_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any illness and the illness is uncontrolled.","when_to_set_to_false":"Set to false if the patient currently has any illness and the illness is not uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the illness is uncontrolled.","meaning":"Boolean indicating whether the patient's current illness is uncontrolled."} ;; "uncontrolled severe illness"
(declare-const patient_has_finding_of_illness_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any illness and the illness is severe.","when_to_set_to_false":"Set to false if the patient currently has any illness and the illness is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the illness is severe.","meaning":"Boolean indicating whether the patient's current illness is severe."} ;; "uncontrolled severe illness"
(declare-const patient_has_finding_of_severe_medical_condition_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a severe medical condition and the condition is uncontrolled.","when_to_set_to_false":"Set to false if the patient currently has a severe medical condition and the condition is not uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current severe medical condition is uncontrolled.","meaning":"Boolean indicating whether the patient currently has a severe medical condition and the condition is uncontrolled."} ;; "uncontrolled severe medical condition"
(declare-const patient_has_finding_of_diabetic_poor_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus with poor control (uncontrolled diabetes mellitus).","when_to_set_to_false":"Set to false if the patient currently does not have diabetes mellitus with poor control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diabetes mellitus with poor control.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus with poor control (uncontrolled diabetes mellitus)."} ;; "uncontrolled diabetes mellitus"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_illness_now@@uncontrolled
       patient_has_finding_of_illness_now)
   :named REQ4_AUXILIARY0)) ;; "uncontrolled severe illness"

(assert
(! (=> patient_has_finding_of_illness_now@@severe
       patient_has_finding_of_illness_now)
   :named REQ4_AUXILIARY1)) ;; "uncontrolled severe illness"

;; Non-exhaustive example: uncontrolled diabetes mellitus implies uncontrolled severe medical condition
(assert
(! (=> patient_has_finding_of_diabetic_poor_control_now
       patient_has_finding_of_severe_medical_condition_now@@uncontrolled)
   :named REQ4_AUXILIARY2)) ;; "with non-exhaustive examples (uncontrolled diabetes mellitus)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion if (uncontrolled severe illness) OR (uncontrolled severe medical condition)
(assert
(! (not (or (and patient_has_finding_of_illness_now@@uncontrolled
                 patient_has_finding_of_illness_now@@severe)
            patient_has_finding_of_severe_medical_condition_now@@uncontrolled))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has an uncontrolled severe illness) OR (the patient has an uncontrolled severe medical condition with non-exhaustive examples (uncontrolled diabetes mellitus))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_inadequate_organ_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inadequate organ function.","when_to_set_to_false":"Set to false if the patient currently does not have inadequate organ function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inadequate organ function.","meaning":"Boolean indicating whether the patient currently has inadequate organ function."} ;; "inadequate organ function"
(declare-const patient_has_finding_of_inadequate_bone_marrow_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inadequate bone marrow function.","when_to_set_to_false":"Set to false if the patient currently does not have inadequate bone marrow function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inadequate bone marrow function.","meaning":"Boolean indicating whether the patient currently has inadequate bone marrow function."} ;; "inadequate bone marrow function"
(declare-const patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_grams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current hemoglobin concentration in grams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current hemoglobin concentration in grams per deciliter."} ;; "hemoglobin concentration < 9.0 grams per deciliter"
(declare-const patient_absolute_neutrophil_count_value_recorded_now_withunit_10e9_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current absolute neutrophil count in 10^9 per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current absolute neutrophil count in 10^9 per liter."} ;; "absolute neutrophil count < 1.5 × 10^9 per liter"
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current platelet count in 10^9 per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current platelet count in 10^9 per liter."} ;; "platelet count < 100 × 10^9 per liter"
(declare-const patient_aspartate_transaminase_level_value_recorded_now_withunit_multiple_of_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current AST concentration as a multiple of the upper limit of normal is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current AST concentration as a multiple of the upper limit of normal."} ;; "aspartate aminotransferase concentration > 2.5 × upper limit of normal"
(declare-const patient_alanine_transaminase_level_value_recorded_now_withunit_multiple_of_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current ALT concentration as a multiple of the upper limit of normal is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current ALT concentration as a multiple of the upper limit of normal."} ;; "alanine aminotransferase concentration > 2.5 × upper limit of normal"
(declare-const patient_bilirubin_total_measurement_value_recorded_now_withunit_multiple_of_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current total bilirubin concentration as a multiple of the upper limit of normal is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current total bilirubin concentration as a multiple of the upper limit of normal."} ;; "total bilirubin concentration > 1.0 × upper limit of normal"
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_multiple_of_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum creatinine concentration as a multiple of the upper limit of normal is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum creatinine concentration as a multiple of the upper limit of normal."} ;; "serum creatinine concentration > 1.5 × upper limit of normal"
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current creatinine clearance in milliliters per minute is available and calculated according to the CKD-EPI formula.","when_to_set_to_null":"Set to null if no such measurement is available, the value is indeterminate, or the calculation method is not CKD-EPI.","meaning":"Numeric value for the patient's current creatinine clearance in milliliters per minute, calculated by CKD-EPI."} ;; "creatinine clearance calculated according to the Chronic Kidney Disease Epidemiology Collaboration formula ≤ 30 milliliters per minute"
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute@@calculated_by_ckd_epi_formula Bool) ;; {"when_to_set_to_true":"Set to true if the creatinine clearance value is calculated according to the CKD-EPI formula.","when_to_set_to_false":"Set to false if the creatinine clearance value is not calculated according to the CKD-EPI formula.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the CKD-EPI formula was used.","meaning":"Boolean indicating whether the creatinine clearance value is calculated by the CKD-EPI formula."} ;; "creatinine clearance calculated according to the Chronic Kidney Disease Epidemiology Collaboration formula"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not
     (or patient_has_finding_of_inadequate_organ_function_now
         patient_has_finding_of_inadequate_bone_marrow_function_now
         (< patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_grams_per_deciliter 9.0)
         (< patient_absolute_neutrophil_count_value_recorded_now_withunit_10e9_per_liter 1.5)
         (< patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_liter 100.0)
         (> patient_aspartate_transaminase_level_value_recorded_now_withunit_multiple_of_upper_limit_of_normal 2.5)
         (> patient_alanine_transaminase_level_value_recorded_now_withunit_multiple_of_upper_limit_of_normal 2.5)
         (> patient_bilirubin_total_measurement_value_recorded_now_withunit_multiple_of_upper_limit_of_normal 1.0)
         (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_multiple_of_upper_limit_of_normal 1.5)
         (and (>= patient_serum_creatinine_level_finding_value_recorded_now_withunit_multiple_of_upper_limit_of_normal 1.0)
              (<= patient_serum_creatinine_level_finding_value_recorded_now_withunit_multiple_of_upper_limit_of_normal 1.5)
              patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute@@calculated_by_ckd_epi_formula
              (<= patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute 30.0)
         )
     )
   )
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inadequate organ function OR inadequate bone marrow function as evidenced by any of the following: (hemoglobin concentration < 9.0 grams per deciliter) OR (absolute neutrophil count < 1.5 × 10^9 per liter) OR (platelet count < 100 × 10^9 per liter) OR (aspartate aminotransferase concentration > 2.5 × upper limit of normal) OR (alanine aminotransferase concentration > 2.5 × upper limit of normal) OR (total bilirubin concentration > 1.0 × upper limit of normal) OR (serum creatinine concentration > 1.5 × upper limit of normal) OR ((serum creatinine concentration ≥ 1.0 × upper limit of normal AND serum creatinine concentration ≤ 1.5 × upper limit of normal) AND (creatinine clearance calculated according to the Chronic Kidney Disease Epidemiology Collaboration formula ≤ 30 milliliters per minute))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
;; No new variable declarations needed; using existing variable:
;; (declare-const patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_grams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current hemoglobin concentration in grams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current hemoglobin concentration in grams per deciliter."} ;; "hemoglobin concentration < 9.0 grams per deciliter"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not (< patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_grams_per_deciliter 9.0))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hemoglobin concentration < 9.0 grams per deciliter."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
;; patient_absolute_neutrophil_count_value_recorded_now_withunit_10e9_per_liter is already declared:
;; (declare-const patient_absolute_neutrophil_count_value_recorded_now_withunit_10e9_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current absolute neutrophil count in 10^9 per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current absolute neutrophil count in 10^9 per liter."} ;; "absolute neutrophil count < 1.5 × 10^9 per liter"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not (< patient_absolute_neutrophil_count_value_recorded_now_withunit_10e9_per_liter 1.5))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has absolute neutrophil count < 1.5 × 10^9 per liter."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
;; patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_liter is already declared:
;; (declare-const patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current platelet count in 10^9 per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current platelet count in 10^9 per liter."} ;; "platelet count < 100 × 10^9 per liter"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (< patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_liter 100))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has platelet count < 100 × 10^9 per liter."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
;; Variables already declared in previous SMT program:
;; (declare-const patient_aspartate_transaminase_level_value_recorded_now_withunit_multiple_of_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current AST concentration as a multiple of the upper limit of normal is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current AST concentration as a multiple of the upper limit of normal."} ;; "aspartate aminotransferase concentration > 2.5 × upper limit of normal"
;; (declare-const patient_alanine_transaminase_level_value_recorded_now_withunit_multiple_of_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current ALT concentration as a multiple of the upper limit of normal is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current ALT concentration as a multiple of the upper limit of normal."} ;; "alanine aminotransferase concentration > 2.5 × upper limit of normal"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not (or
        (> patient_aspartate_transaminase_level_value_recorded_now_withunit_multiple_of_upper_limit_of_normal 2.5) ;; "aspartate aminotransferase concentration > 2.5 × upper limit of normal"
        (> patient_alanine_transaminase_level_value_recorded_now_withunit_multiple_of_upper_limit_of_normal 2.5)   ;; "alanine aminotransferase concentration > 2.5 × upper limit of normal"
      ))
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has aspartate aminotransferase concentration > 2.5 × upper limit of normal) OR (the patient has alanine aminotransferase concentration > 2.5 × upper limit of normal)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
;; Variable already declared in previous SMT program:
;; (declare-const patient_bilirubin_total_measurement_value_recorded_now_withunit_multiple_of_upper_limit_of_normal Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current total bilirubin concentration as a multiple of the upper limit of normal is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current total bilirubin concentration as a multiple of the upper limit of normal."} ;; "total bilirubin concentration > 1.0 × upper limit of normal"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! (not (> patient_bilirubin_total_measurement_value_recorded_now_withunit_multiple_of_upper_limit_of_normal 1.0))
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has total bilirubin concentration > 1.0 times the upper limit of normal."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
;; All variables are already declared in <already_used_variables_in_SMT_program> and <reusable_variables>
;; patient_serum_creatinine_level_finding_value_recorded_now_withunit_multiple_of_upper_limit_of_normal
;; patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute
;; patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute@@calculated_by_ckd_epi_formula

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion if serum creatinine > 1.5 × ULN
(assert
(! (not (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_multiple_of_upper_limit_of_normal 1.5))
    :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serum creatinine concentration > 1.5 times the upper limit of normal."

;; Exclusion if (serum creatinine ≥ 1.0 × ULN AND ≤ 1.5 × ULN) AND (creatinine clearance by CKD-EPI ≤ 30 mL/min)
(assert
(! (not (and (>= patient_serum_creatinine_level_finding_value_recorded_now_withunit_multiple_of_upper_limit_of_normal 1.0)
             (<= patient_serum_creatinine_level_finding_value_recorded_now_withunit_multiple_of_upper_limit_of_normal 1.5)
             (<= patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute 30)
             patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute@@calculated_by_ckd_epi_formula))
    :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has serum creatinine concentration ≥ 1.0 times the upper limit of normal AND ≤ 1.5 times the upper limit of normal) AND (the patient has creatinine clearance calculated according to the Chronic Kidney Disease Epidemiology Collaboration formula ≤ 30 milliliters per minute))."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of secondary malignant neoplasm of brain (brain metastases).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of secondary malignant neoplasm of brain (brain metastases).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary malignant neoplasm of brain (brain metastases).","meaning":"Boolean indicating whether the patient currently has secondary malignant neoplasm of brain (brain metastases) now."} ;; "brain metastases"
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current secondary malignant neoplasm of brain (brain metastases) are symptomatic.","when_to_set_to_false":"Set to false if the patient's current secondary malignant neoplasm of brain (brain metastases) are not symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current secondary malignant neoplasm of brain (brain metastases) are symptomatic.","meaning":"Boolean indicating whether the patient's current secondary malignant neoplasm of brain (brain metastases) are symptomatic."} ;; "symptomatic brain metastases"
(declare-const patient_has_finding_of_leptomeningeal_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has leptomeningeal disease.","when_to_set_to_false":"Set to false if the patient currently does not have leptomeningeal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has leptomeningeal disease.","meaning":"Boolean indicating whether the patient currently has leptomeningeal disease."} ;; "leptomeningeal disease"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now@@symptomatic
       patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now)
   :named REQ12_AUXILIARY0)) ;; "symptomatic brain metastases" implies "brain metastases"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now@@symptomatic)
   :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptomatic brain metastases."

(assert
(! (not patient_has_finding_of_leptomeningeal_disease_now)
   :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has leptomeningeal disease."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a neoplastic disease (neoplasm) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a neoplastic disease (neoplasm) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a neoplastic disease (neoplasm).","meaning":"Boolean indicating whether the patient has a history of neoplastic disease (neoplasm)."} ;; "history of another neoplasm"

(declare-const patient_has_finding_of_malignant_melanoma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had malignant melanoma at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had malignant melanoma in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had malignant melanoma.","meaning":"Boolean indicating whether the patient has a history of malignant melanoma."} ;; "history of non-metastatic melanoma skin cancer"

(declare-const patient_has_finding_of_malignant_melanoma_inthehistory@@non_metastatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of malignant melanoma is non-metastatic.","when_to_set_to_false":"Set to false if the patient's history of malignant melanoma is metastatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of malignant melanoma is non-metastatic.","meaning":"Boolean indicating whether the patient's history of malignant melanoma is non-metastatic."} ;; "non-metastatic melanoma skin cancer"

(declare-const patient_has_finding_of_carcinoma_in_situ_of_uterine_cervix_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had carcinoma in situ of the uterine cervix at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had carcinoma in situ of the uterine cervix in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had carcinoma in situ of the uterine cervix.","meaning":"Boolean indicating whether the patient has a history of carcinoma in situ of the uterine cervix."} ;; "history of carcinoma in situ of the cervix"

(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had malignant neoplastic disease (cancer) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had malignant neoplastic disease (cancer) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient has a history of malignant neoplastic disease (cancer)."} ;; "history of cancer"

(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@cured_by_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of malignant neoplastic disease (cancer) was cured by surgery.","when_to_set_to_false":"Set to false if the patient's history of malignant neoplastic disease (cancer) was not cured by surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of malignant neoplastic disease (cancer) was cured by surgery.","meaning":"Boolean indicating whether the patient's history of malignant neoplastic disease (cancer) was cured by surgery."} ;; "history of cancer cured by surgery"

(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@cured_by_small_field_radiation_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of malignant neoplastic disease (cancer) was cured by small field radiation therapy.","when_to_set_to_false":"Set to false if the patient's history of malignant neoplastic disease (cancer) was not cured by small field radiation therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of malignant neoplastic disease (cancer) was cured by small field radiation therapy.","meaning":"Boolean indicating whether the patient's history of malignant neoplastic disease (cancer) was cured by small field radiation therapy."} ;; "history of cancer cured by small field radiation therapy"

(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@cured_by_chemotherapy_less_than_5_years_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of malignant neoplastic disease (cancer) was cured by chemotherapy less than 5 years prior to randomization.","when_to_set_to_false":"Set to false if the patient's history of malignant neoplastic disease (cancer) was cured by chemotherapy 5 or more years prior to randomization, or not cured by chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of malignant neoplastic disease (cancer) was cured by chemotherapy less than 5 years prior to randomization.","meaning":"Boolean indicating whether the patient's history of malignant neoplastic disease (cancer) was cured by chemotherapy less than 5 years prior to randomization."} ;; "history of cancer cured by chemotherapy less than 5 years prior to randomization"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable for melanoma
(assert
(! (=> patient_has_finding_of_malignant_melanoma_inthehistory@@non_metastatic
      patient_has_finding_of_malignant_melanoma_inthehistory)
    :named REQ13_AUXILIARY0)) ;; "non-metastatic melanoma skin cancer"

;; Qualifier variable implies corresponding stem variable for cancer cured by surgery
(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@cured_by_surgery
      patient_has_finding_of_malignant_neoplastic_disease_inthehistory)
    :named REQ13_AUXILIARY1)) ;; "history of cancer cured by surgery"

;; Qualifier variable implies corresponding stem variable for cancer cured by small field radiation therapy
(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@cured_by_small_field_radiation_therapy
      patient_has_finding_of_malignant_neoplastic_disease_inthehistory)
    :named REQ13_AUXILIARY2)) ;; "history of cancer cured by small field radiation therapy"

;; Qualifier variable implies corresponding stem variable for cancer cured by chemotherapy less than 5 years prior to randomization
(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@cured_by_chemotherapy_less_than_5_years_prior_to_randomization
      patient_has_finding_of_malignant_neoplastic_disease_inthehistory)
    :named REQ13_AUXILIARY3)) ;; "history of cancer cured by chemotherapy less than 5 years prior to randomization"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Exclusion: patient has a history of another neoplasm AND NOT (any of the exceptions)
(assert
(! (not (and
         patient_has_finding_of_neoplastic_disease_inthehistory
         (not (or
           patient_has_finding_of_malignant_melanoma_inthehistory@@non_metastatic
           patient_has_finding_of_carcinoma_in_situ_of_uterine_cervix_inthehistory
           patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@cured_by_surgery
           patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@cured_by_small_field_radiation_therapy
           patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@cured_by_chemotherapy_less_than_5_years_prior_to_randomization
         ))
       ))
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of another neoplasm) AND NOT ((the patient has a history of non-metastatic melanoma skin cancer) OR (the patient has a history of carcinoma in situ of the cervix) OR (the patient has a history of cancer cured by surgery) OR (the patient has a history of cancer cured by small field radiation therapy) OR (the patient has a history of cancer cured by chemotherapy less than 5 years prior to randomization)))."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_diagnosis_of_inflammatory_bowel_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with inflammatory bowel disease at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with inflammatory bowel disease at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with inflammatory bowel disease.","meaning":"Boolean indicating whether the patient has a history of inflammatory bowel disease."} ;; "the patient has a history of inflammatory bowel disease"

(declare-const patient_has_diagnosis_of_intestinal_obstruction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with intestinal obstruction at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with intestinal obstruction at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with intestinal obstruction.","meaning":"Boolean indicating whether the patient has a history of intestinal obstruction."} ;; "the patient has a history of significant bowel obstruction"

(declare-const patient_has_diagnosis_of_intestinal_obstruction_inthehistory@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of intestinal obstruction is considered significant.","when_to_set_to_false":"Set to false if the patient's history of intestinal obstruction is not considered significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of intestinal obstruction is significant.","meaning":"Boolean indicating whether the patient's history of intestinal obstruction is significant."} ;; "significant bowel obstruction"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_intestinal_obstruction_inthehistory@@significant
      patient_has_diagnosis_of_intestinal_obstruction_inthehistory)
:named REQ14_AUXILIARY0)) ;; "significant bowel obstruction""

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_diagnosis_of_inflammatory_bowel_disease_inthehistory)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of inflammatory bowel disease."

(assert
(! (not patient_has_diagnosis_of_intestinal_obstruction_inthehistory@@significant)
:named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of significant bowel obstruction."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_history_of_hypersensitivity_to_platinum_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity caused by platinum drug.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity caused by platinum drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity caused by platinum drug.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity caused by platinum drug."} ;; "the patient has a history of hypersensitivity to platinum drug"
(declare-const patient_has_history_of_hypersensitivity_to_gemcitabine_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity caused by gemcitabine drug.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity caused by gemcitabine drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity caused by gemcitabine drug.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity caused by gemcitabine drug."} ;; "the patient has a history of hypersensitivity to gemcitabine drug"
(declare-const patient_has_history_of_hypersensitivity_to_taxane_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity caused by taxane drug.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity caused by taxane drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity caused by taxane drug.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity caused by taxane drug."} ;; "the patient has a history of hypersensitivity to taxane drug"
(declare-const patient_has_history_of_hypersensitivity_to_polysorbate_80 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity caused by Polysorbate-80.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity caused by Polysorbate-80.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity caused by Polysorbate-80.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity caused by Polysorbate-80."} ;; "the patient has a history of hypersensitivity to Polysorbate-80"
(declare-const patient_has_history_of_hypersensitivity_to_compounds_with_similar_chemical_structures Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity caused by compounds with similar chemical structures.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity caused by compounds with similar chemical structures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity caused by compounds with similar chemical structures.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity caused by compounds with similar chemical structures."} ;; "the patient has a history of hypersensitivity to compounds with similar chemical structures"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_history_of_hypersensitivity_to_platinum_drug)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to platinum drug."

(assert
(! (not patient_has_history_of_hypersensitivity_to_gemcitabine_drug)
:named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to gemcitabine drug."

(assert
(! (not patient_has_history_of_hypersensitivity_to_taxane_drug)
:named REQ15_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to taxane drug."

(assert
(! (not patient_has_history_of_hypersensitivity_to_polysorbate_80)
:named REQ15_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to Polysorbate-80."

(assert
(! (not patient_has_history_of_hypersensitivity_to_compounds_with_similar_chemical_structures)
:named REQ15_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to compounds with similar chemical structures."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a myocardial infarction documented in their history.","when_to_set_to_false":"Set to false if the patient has never had a myocardial infarction documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a myocardial infarction in their history."} ;; "myocardial infarction"
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within6months_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial infarction occurred within 6 months before randomization.","when_to_set_to_false":"Set to false if the patient's myocardial infarction did not occur within 6 months before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial infarction occurred within 6 months before randomization.","meaning":"Boolean indicating whether the patient's myocardial infarction occurred within 6 months before randomization."} ;; "myocardial infarction within 6 months prior to randomization"

(declare-const patient_has_finding_of_angina_pectoris_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had angina pectoris documented in their history.","when_to_set_to_false":"Set to false if the patient has never had angina pectoris documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had angina pectoris.","meaning":"Boolean indicating whether the patient has ever had angina pectoris in their history."} ;; "angina"
(declare-const patient_has_finding_of_angina_pectoris_inthehistory@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's angina pectoris was severe.","when_to_set_to_false":"Set to false if the patient's angina pectoris was not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angina pectoris was severe.","meaning":"Boolean indicating whether the patient's angina pectoris was severe."} ;; "severe angina"
(declare-const patient_has_finding_of_angina_pectoris_inthehistory@@instability_unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's angina pectoris was unstable.","when_to_set_to_false":"Set to false if the patient's angina pectoris was not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angina pectoris was unstable.","meaning":"Boolean indicating whether the patient's angina pectoris was unstable."} ;; "unstable angina"
(declare-const patient_has_finding_of_angina_pectoris_inthehistory@@temporalcontext_within6months_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's angina pectoris occurred within 6 months before randomization.","when_to_set_to_false":"Set to false if the patient's angina pectoris did not occur within 6 months before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angina pectoris occurred within 6 months before randomization.","meaning":"Boolean indicating whether the patient's angina pectoris occurred within 6 months before randomization."} ;; "angina within 6 months prior to randomization"

(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass graft surgery documented in their history.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass graft surgery documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass graft surgery.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass graft surgery in their history."} ;; "coronary artery bypass graft surgery"
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@temporalcontext_within6months_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary artery bypass graft surgery occurred within 6 months before randomization.","when_to_set_to_false":"Set to false if the patient's coronary artery bypass graft surgery did not occur within 6 months before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coronary artery bypass graft surgery occurred within 6 months before randomization.","meaning":"Boolean indicating whether the patient's coronary artery bypass graft surgery occurred within 6 months before randomization."} ;; "coronary artery bypass graft surgery within 6 months prior to randomization"

(declare-const patient_has_undergone_peripheral_arterial_bypass_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone peripheral arterial bypass documented in their history.","when_to_set_to_false":"Set to false if the patient has never undergone peripheral arterial bypass documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone peripheral arterial bypass.","meaning":"Boolean indicating whether the patient has ever undergone peripheral arterial bypass in their history."} ;; "peripheral artery bypass graft surgery"
(declare-const patient_has_undergone_peripheral_arterial_bypass_inthehistory@@temporalcontext_within6months_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's peripheral arterial bypass occurred within 6 months before randomization.","when_to_set_to_false":"Set to false if the patient's peripheral arterial bypass did not occur within 6 months before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the peripheral arterial bypass occurred within 6 months before randomization.","meaning":"Boolean indicating whether the patient's peripheral arterial bypass occurred within 6 months before randomization."} ;; "peripheral artery bypass graft surgery within 6 months prior to randomization"

(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a disorder of the cardiovascular system documented in their history.","when_to_set_to_false":"Set to false if the patient has never had a disorder of the cardiovascular system documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a disorder of the cardiovascular system.","meaning":"Boolean indicating whether the patient has ever had a disorder of the cardiovascular system in their history."} ;; "cardiovascular disease"
(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_inthehistory@@clinicalstatus_symptomatic_and_uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiovascular disease was clinically symptomatic and uncontrolled.","when_to_set_to_false":"Set to false if the patient's cardiovascular disease was not clinically symptomatic and uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiovascular disease was clinically symptomatic and uncontrolled.","meaning":"Boolean indicating whether the patient's cardiovascular disease was clinically symptomatic and uncontrolled."} ;; "clinically symptomatic and uncontrolled cardiovascular disease"
(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_inthehistory@@temporalcontext_within6months_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiovascular disease occurred within 6 months before randomization.","when_to_set_to_false":"Set to false if the patient's cardiovascular disease did not occur within 6 months before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiovascular disease occurred within 6 months before randomization.","meaning":"Boolean indicating whether the patient's cardiovascular disease occurred within 6 months before randomization."} ;; "cardiovascular disease within 6 months prior to randomization"

(declare-const patient_has_finding_of_clinically_significant_arrhythmia_of_grade_iii_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had clinically significant arrhythmia of grade III documented in their history.","when_to_set_to_false":"Set to false if the patient has never had clinically significant arrhythmia of grade III documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had clinically significant arrhythmia of grade III.","meaning":"Boolean indicating whether the patient has ever had clinically significant arrhythmia of grade III in their history."} ;; "clinically significant arrhythmia of grade III"
(declare-const patient_has_finding_of_clinically_significant_arrhythmia_of_grade_iii_inthehistory@@temporalcontext_within6months_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinically significant arrhythmia of grade III occurred within 6 months before randomization.","when_to_set_to_false":"Set to false if the patient's clinically significant arrhythmia of grade III did not occur within 6 months before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinically significant arrhythmia of grade III occurred within 6 months before randomization.","meaning":"Boolean indicating whether the patient's clinically significant arrhythmia of grade III occurred within 6 months before randomization."} ;; "clinically significant arrhythmia of grade III within 6 months prior to randomization"

(declare-const patient_has_finding_of_clinically_significant_arrhythmia_of_grade_iv_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had clinically significant arrhythmia of grade IV documented in their history.","when_to_set_to_false":"Set to false if the patient has never had clinically significant arrhythmia of grade IV documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had clinically significant arrhythmia of grade IV.","meaning":"Boolean indicating whether the patient has ever had clinically significant arrhythmia of grade IV in their history."} ;; "clinically significant arrhythmia of grade IV"
(declare-const patient_has_finding_of_clinically_significant_arrhythmia_of_grade_iv_inthehistory@@temporalcontext_within6months_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinically significant arrhythmia of grade IV occurred within 6 months before randomization.","when_to_set_to_false":"Set to false if the patient's clinically significant arrhythmia of grade IV did not occur within 6 months before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinically significant arrhythmia of grade IV occurred within 6 months before randomization.","meaning":"Boolean indicating whether the patient's clinically significant arrhythmia of grade IV occurred within 6 months before randomization."} ;; "clinically significant arrhythmia of grade IV within 6 months prior to randomization"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within6months_before_randomization
      patient_has_finding_of_myocardial_infarction_inthehistory)
   :named REQ16_AUXILIARY0)) ;; "myocardial infarction within 6 months prior to randomization"

(assert
(! (=> patient_has_finding_of_angina_pectoris_inthehistory@@temporalcontext_within6months_before_randomization
      patient_has_finding_of_angina_pectoris_inthehistory)
   :named REQ16_AUXILIARY1)) ;; "angina within 6 months prior to randomization"

(assert
(! (=> patient_has_finding_of_angina_pectoris_inthehistory@@severity_severe
      patient_has_finding_of_angina_pectoris_inthehistory)
   :named REQ16_AUXILIARY2)) ;; "severe angina"

(assert
(! (=> patient_has_finding_of_angina_pectoris_inthehistory@@instability_unstable
      patient_has_finding_of_angina_pectoris_inthehistory)
   :named REQ16_AUXILIARY3)) ;; "unstable angina"

(assert
(! (=> patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@temporalcontext_within6months_before_randomization
      patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
   :named REQ16_AUXILIARY4)) ;; "coronary artery bypass graft surgery within 6 months prior to randomization"

(assert
(! (=> patient_has_undergone_peripheral_arterial_bypass_inthehistory@@temporalcontext_within6months_before_randomization
      patient_has_undergone_peripheral_arterial_bypass_inthehistory)
   :named REQ16_AUXILIARY5)) ;; "peripheral artery bypass graft surgery within 6 months prior to randomization"

(assert
(! (=> patient_has_finding_of_disorder_of_cardiovascular_system_inthehistory@@temporalcontext_within6months_before_randomization
      patient_has_finding_of_disorder_of_cardiovascular_system_inthehistory)
   :named REQ16_AUXILIARY6)) ;; "cardiovascular disease within 6 months prior to randomization"

(assert
(! (=> patient_has_finding_of_disorder_of_cardiovascular_system_inthehistory@@clinicalstatus_symptomatic_and_uncontrolled
      patient_has_finding_of_disorder_of_cardiovascular_system_inthehistory)
   :named REQ16_AUXILIARY7)) ;; "clinically symptomatic and uncontrolled cardiovascular disease"

(assert
(! (=> patient_has_finding_of_clinically_significant_arrhythmia_of_grade_iii_inthehistory@@temporalcontext_within6months_before_randomization
      patient_has_finding_of_clinically_significant_arrhythmia_of_grade_iii_inthehistory)
   :named REQ16_AUXILIARY8)) ;; "clinically significant arrhythmia of grade III within 6 months prior to randomization"

(assert
(! (=> patient_has_finding_of_clinically_significant_arrhythmia_of_grade_iv_inthehistory@@temporalcontext_within6months_before_randomization
      patient_has_finding_of_clinically_significant_arrhythmia_of_grade_iv_inthehistory)
   :named REQ16_AUXILIARY9)) ;; "clinically significant arrhythmia of grade IV within 6 months prior to randomization"

;; ===================== Constraint Assertions (REQ 16) =====================
;; Exclusion: patient must NOT have had any of the listed events within 6 months prior to randomization
(assert
(! (not (or
    patient_has_finding_of_myocardial_infarction_inthehistory@@temporalcontext_within6months_before_randomization
    patient_has_finding_of_angina_pectoris_inthehistory@@severity_severe
    patient_has_finding_of_angina_pectoris_inthehistory@@instability_unstable
    patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@temporalcontext_within6months_before_randomization
    patient_has_undergone_peripheral_arterial_bypass_inthehistory@@temporalcontext_within6months_before_randomization
    patient_has_finding_of_disorder_of_cardiovascular_system_inthehistory@@clinicalstatus_symptomatic_and_uncontrolled
    patient_has_finding_of_clinically_significant_arrhythmia_of_grade_iii_inthehistory@@temporalcontext_within6months_before_randomization
    patient_has_finding_of_clinically_significant_arrhythmia_of_grade_iv_inthehistory@@temporalcontext_within6months_before_randomization
    ))
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had at least one of the following events within 6 months prior to randomization: (myocardial infarction) OR (severe angina) OR (unstable angina) OR (coronary artery bypass graft surgery) OR (peripheral artery bypass graft surgery) OR (clinically symptomatic and uncontrolled cardiovascular disease) OR (clinically significant arrhythmia of grade III) OR (clinically significant arrhythmia of grade IV)."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment with strong inhibitors of cytochrome P450 3A4.","when_to_set_to_false":"Set to false if the patient is currently not receiving treatment with strong inhibitors of cytochrome P450 3A4.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving treatment with strong inhibitors of cytochrome P450 3A4.","meaning":"Boolean indicating whether the patient is currently exposed to strong inhibitors of cytochrome P450 3A4."} ;; "the patient is receiving concurrent treatment with strong inhibitors of cytochrome P450 3A4"
(declare-const patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_now@@strong_inhibitor Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to strong inhibitors of cytochrome P450 3A4.","when_to_set_to_false":"Set to false if the patient is currently exposed to cytochrome P450 3A4 but not to strong inhibitors.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is to strong inhibitors.","meaning":"Boolean indicating whether the exposure to cytochrome P450 3A4 is specifically to strong inhibitors."} ;; "strong inhibitors of cytochrome P450 3A4"
(declare-const patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning to receive treatment with strong inhibitors of cytochrome P450 3A4 in the future.","when_to_set_to_false":"Set to false if the patient is not planning to receive treatment with strong inhibitors of cytochrome P450 3A4 in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planning to receive treatment with strong inhibitors of cytochrome P450 3A4 in the future.","meaning":"Boolean indicating whether the patient is planning future exposure to strong inhibitors of cytochrome P450 3A4."} ;; "the patient is planning to receive treatment with strong inhibitors of cytochrome P450 3A4"
(declare-const patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_inthefuture@@strong_inhibitor Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning future exposure to strong inhibitors of cytochrome P450 3A4.","when_to_set_to_false":"Set to false if the patient is planning future exposure to cytochrome P450 3A4 but not to strong inhibitors.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the planned exposure is to strong inhibitors.","meaning":"Boolean indicating whether the planned exposure to cytochrome P450 3A4 is specifically to strong inhibitors."} ;; "strong inhibitors of cytochrome P450 3A4 (future)"
(declare-const patient_has_completed_washout_period_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed a washout period prior to randomization.","when_to_set_to_false":"Set to false if the patient has not completed a washout period prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed a washout period prior to randomization.","meaning":"Boolean indicating whether the patient has completed a washout period prior to randomization."} ;; "the patient has completed a washout period prior to randomization"
(declare-const patient_has_completed_washout_period_prior_to_randomization@@one_week_duration Bool) ;; {"when_to_set_to_true":"Set to true if the washout period completed prior to randomization is exactly one week in duration.","when_to_set_to_false":"Set to false if the washout period completed prior to randomization is not one week in duration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the washout period completed prior to randomization is one week in duration.","meaning":"Boolean indicating whether the washout period completed prior to randomization is one week in duration."} ;; "one-week washout period prior to randomization"
(declare-const washout_period_duration_value_recorded_prior_to_randomization_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days of the washout period completed prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days the washout period lasted prior to randomization.","meaning":"Numeric value indicating the duration in days of the washout period completed prior to randomization."} ;; "duration of washout period prior to randomization in days"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_now@@strong_inhibitor
      patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_now)
:named REQ17_AUXILIARY0)) ;; "strong inhibitors of cytochrome P450 3A4 (now)"

(assert
(! (=> patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_inthefuture@@strong_inhibitor
      patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_inthefuture)
:named REQ17_AUXILIARY1)) ;; "strong inhibitors of cytochrome P450 3A4 (future)"

(assert
(! (=> patient_has_completed_washout_period_prior_to_randomization@@one_week_duration
      patient_has_completed_washout_period_prior_to_randomization)
:named REQ17_AUXILIARY2)) ;; "one-week washout period prior to randomization"

;; Definition: one-week duration means washout period duration is at least 7 days
(assert
(! (= patient_has_completed_washout_period_prior_to_randomization@@one_week_duration
      (and patient_has_completed_washout_period_prior_to_randomization
           (>= washout_period_duration_value_recorded_prior_to_randomization_in_days 7)))
:named REQ17_AUXILIARY3)) ;; "one-week washout period prior to randomization = washout period completed AND duration >= 7 days"

;; ===================== Constraint Assertions (REQ 17) =====================
;; Exclusion: If (currently exposed to strong inhibitors OR planning future exposure to strong inhibitors) AND NOT completed one-week washout period prior to randomization, then patient is excluded.
(assert
(! (not (and
         (or patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_now@@strong_inhibitor
             patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_inthefuture@@strong_inhibitor)
         (not patient_has_completed_washout_period_prior_to_randomization@@one_week_duration)))
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is receiving concurrent treatment with strong inhibitors of cytochrome P450 3A4) OR (the patient is planning to receive treatment with strong inhibitors of cytochrome P450 3A4)) AND (the patient has NOT completed a one-week washout period prior to randomization)."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is documented as not currently breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown or not documented.","meaning":"Indicates whether the patient is currently breastfeeding."} ;; "the patient is a woman who is breastfeeding"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown or not documented.","meaning":"Indicates whether the patient's sex is female at the current time."} ;; "the patient is a woman"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have childbearing potential (not postmenopausal for 12 months and not surgically sterile).","when_to_set_to_false":"Set to false if the patient is currently considered to not have childbearing potential (postmenopausal for 12 months or surgically sterile).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown or not documented.","meaning":"Indicates whether the patient currently has childbearing potential."} ;; "the patient is a woman of childbearing potential (defined as NOT postmenopausal for 12 months OR NOT surgically sterile)"
(declare-const patient_agrees_to_use_adequate_method_of_contraception_during_treatment_and_6_months_after_last_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to use an adequate method of contraception during the treatment period and for 6 months after the last dose of the study drug.","when_to_set_to_false":"Set to false if the patient does not agree to use an adequate method of contraception during the treatment period and for 6 months after the last dose of the study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to use an adequate method of contraception during the treatment period and for 6 months after the last dose of the study drug.","meaning":"Boolean indicating whether the patient agrees to use an adequate method of contraception during the treatment period and for 6 months after the last dose of the study drug."} ;; "the patient does NOT agree to use an adequate method of contraception during the treatment period AND for 6 months after the last dose of the study drug"

;; ===================== Constraint Assertions (REQ 18) =====================
;; Exclusion: patient is a woman who is breastfeeding
(assert
(! (not (and patient_sex_is_female_now patient_is_breastfeeding_now))
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is breastfeeding."

;; Exclusion: patient is a woman of childbearing potential AND does NOT agree to use contraception
(assert
(! (not (and patient_sex_is_female_now
             patient_has_childbearing_potential_now
             (not patient_agrees_to_use_adequate_method_of_contraception_during_treatment_and_6_months_after_last_dose)))
:named REQ18_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if ((the patient is a woman of childbearing potential (defined as NOT postmenopausal for 12 months OR NOT surgically sterile)) AND (the patient does NOT agree to use an adequate method of contraception during the treatment period AND for 6 months after the last dose of the study drug))."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_agrees_to_use_effective_contraception_and_condom_to_protect_against_exposure_to_seminal_liquid Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to use both effective contraception and a condom to protect against exposure to seminal liquid.","when_to_set_to_false":"Set to false if the patient does not agree to use both effective contraception and a condom to protect against exposure to seminal liquid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to use both effective contraception and a condom to protect against exposure to seminal liquid.","meaning":"Boolean indicating whether the patient agrees to use both effective contraception and a condom to protect against exposure to seminal liquid."} ;; "agrees to use effective contraception and a condom to protect against exposure to seminal liquid"

(declare-const patient_agrees_to_use_effective_contraception_and_condom_to_protect_against_exposure_to_seminal_liquid@@whilst_participating_in_trial_and_for_6_months_after_last_dose_of_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to use both effective contraception and a condom to protect against exposure to seminal liquid whilst participating in the trial and for 6 months after the last dose of study medication.","when_to_set_to_false":"Set to false if the patient does not agree to use both effective contraception and a condom to protect against exposure to seminal liquid whilst participating in the trial and for 6 months after the last dose of study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to use both effective contraception and a condom to protect against exposure to seminal liquid whilst participating in the trial and for 6 months after the last dose of study medication.","meaning":"Boolean indicating whether the patient agrees to use both effective contraception and a condom to protect against exposure to seminal liquid whilst participating in the trial and for 6 months after the last dose of study medication."} ;; "agrees to use effective contraception and a condom to protect against exposure to seminal liquid whilst participating in the trial and for 6 months after the last dose of study medication"

(declare-const patient_is_exposed_to_seminal_fluid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to seminal fluid.","when_to_set_to_false":"Set to false if the patient is currently not exposed to seminal fluid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to seminal fluid.","meaning":"Boolean indicating whether the patient is currently exposed to seminal fluid."} ;; "seminal liquid"

(declare-const patient_is_exposed_to_seminal_fluid_now@@temporalcontext_within_trial_and_6_months_after_last_dose_of_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient is exposed to seminal fluid during the trial and/or within 6 months after the last dose of study medication.","when_to_set_to_false":"Set to false if the patient is not exposed to seminal fluid during the trial and within 6 months after the last dose of study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is exposed to seminal fluid during the trial and/or within 6 months after the last dose of study medication.","meaning":"Boolean indicating whether the patient is exposed to seminal fluid during the trial and for 6 months after the last dose of study medication."} ;; "exposed to seminal fluid during the trial and for 6 months after the last dose of study medication"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_agrees_to_use_effective_contraception_and_condom_to_protect_against_exposure_to_seminal_liquid@@whilst_participating_in_trial_and_for_6_months_after_last_dose_of_study_medication
      patient_agrees_to_use_effective_contraception_and_condom_to_protect_against_exposure_to_seminal_liquid)
:named REQ19_AUXILIARY0)) ;; "agrees to use effective contraception and a condom to protect against exposure to seminal liquid whilst participating in the trial and for 6 months after the last dose of study medication"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_seminal_fluid_now@@temporalcontext_within_trial_and_6_months_after_last_dose_of_study_medication
      patient_is_exposed_to_seminal_fluid_now)
:named REQ19_AUXILIARY1)) ;; "exposed to seminal fluid during the trial and for 6 months after the last dose of study medication"

;; ===================== Constraint Assertions (REQ 19) =====================
;; Exclusion: If the patient is a man and does NOT agree to use effective contraception and a condom to protect against exposure to seminal liquid whilst participating in the trial and for 6 months after the last dose of study medication, then the patient is excluded.
(assert
(! (not (and (not patient_sex_is_female_now)
             (not patient_agrees_to_use_effective_contraception_and_condom_to_protect_against_exposure_to_seminal_liquid@@whilst_participating_in_trial_and_for_6_months_after_last_dose_of_study_medication)))
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is a man) AND (the patient does NOT agree to use effective contraception AND a condom to protect against exposure to seminal liquid whilst participating in the trial AND for 6 months after the last dose of study medication))."
