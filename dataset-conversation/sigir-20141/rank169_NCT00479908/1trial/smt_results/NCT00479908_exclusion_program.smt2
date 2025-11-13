;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_taking_long_acting_nitrate_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking long-acting nitrate treatment.","when_to_set_to_false":"Set to false if the patient is currently not taking long-acting nitrate treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking long-acting nitrate treatment.","meaning":"Boolean indicating whether the patient is currently taking long-acting nitrate treatment."} ;; "the patient receives regular treatment with long-acting nitrate treatment"
(declare-const patient_is_taking_long_acting_nitrate_treatment_now@@regular_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's long-acting nitrate treatment use is regular (i.e., scheduled, ongoing, not intermittent or as-needed).","when_to_set_to_false":"Set to false if the patient's long-acting nitrate treatment use is not regular (i.e., intermittent, as-needed, or not scheduled).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's long-acting nitrate treatment use is regular.","meaning":"Boolean indicating whether the patient's long-acting nitrate treatment use is regular."} ;; "the patient receives regular treatment with long-acting nitrate treatment"
(declare-const patient_is_taking_long_acting_nitrate_treatment_now@@cannot_be_withdrawn_at_least_72_hours_prior_to_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's long-acting nitrate treatment cannot be withdrawn at least seventy-two hours prior to the study.","when_to_set_to_false":"Set to false if the patient's long-acting nitrate treatment can be withdrawn at least seventy-two hours prior to the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's long-acting nitrate treatment can be withdrawn at least seventy-two hours prior to the study.","meaning":"Boolean indicating whether the patient's long-acting nitrate treatment cannot be withdrawn at least seventy-two hours prior to the study."} ;; "long-acting nitrate treatment cannot be withdrawn at least seventy-two hours prior to the study"
(declare-const patient_is_taking_nicorandil_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a nicorandil-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a nicorandil-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a nicorandil-containing product.","meaning":"Boolean indicating whether the patient is currently taking a nicorandil-containing product."} ;; "the patient receives regular treatment with nicorandil treatment"
(declare-const patient_is_taking_nicorandil_containing_product_now@@regular_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's nicorandil-containing product use is regular (i.e., scheduled, ongoing, not intermittent or as-needed).","when_to_set_to_false":"Set to false if the patient's nicorandil-containing product use is not regular (i.e., intermittent, as-needed, or not scheduled).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's nicorandil-containing product use is regular.","meaning":"Boolean indicating whether the patient's nicorandil-containing product use is regular."} ;; "the patient receives regular treatment with nicorandil treatment"
(declare-const patient_is_taking_nicorandil_containing_product_now@@cannot_be_withdrawn_at_least_72_hours_prior_to_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's nicorandil-containing product treatment cannot be withdrawn at least seventy-two hours prior to the study.","when_to_set_to_false":"Set to false if the patient's nicorandil-containing product treatment can be withdrawn at least seventy-two hours prior to the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's nicorandil-containing product treatment can be withdrawn at least seventy-two hours prior to the study.","meaning":"Boolean indicating whether the patient's nicorandil-containing product treatment cannot be withdrawn at least seventy-two hours prior to the study."} ;; "nicorandil treatment cannot be withdrawn at least seventy-two hours prior to the study"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_taking_long_acting_nitrate_treatment_now@@regular_treatment
       patient_is_taking_long_acting_nitrate_treatment_now)
    :named REQ0_AUXILIARY0)) ;; "the patient receives regular treatment with long-acting nitrate treatment"

(assert
(! (=> patient_is_taking_nicorandil_containing_product_now@@regular_treatment
       patient_is_taking_nicorandil_containing_product_now)
    :named REQ0_AUXILIARY1)) ;; "the patient receives regular treatment with nicorandil treatment"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: (regular long-acting nitrate treatment AND cannot be withdrawn 72h prior) OR (regular nicorandil treatment AND cannot be withdrawn 72h prior)
(assert
(! (not (or (and patient_is_taking_long_acting_nitrate_treatment_now@@regular_treatment
                 patient_is_taking_long_acting_nitrate_treatment_now@@cannot_be_withdrawn_at_least_72_hours_prior_to_study)
            (and patient_is_taking_nicorandil_containing_product_now@@regular_treatment
                 patient_is_taking_nicorandil_containing_product_now@@cannot_be_withdrawn_at_least_72_hours_prior_to_study)))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient receives regular treatment with long-acting nitrate treatment AND long-acting nitrate treatment cannot be withdrawn at least seventy-two hours prior to the study) OR (the patient receives regular treatment with nicorandil treatment AND nicorandil treatment cannot be withdrawn at least seventy-two hours prior to the study))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_myocardial_infarction_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction within the past three months.","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the past three months.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the past three months."} ;; "the patient has had myocardial infarction within three months"
(declare-const patient_has_finding_of_angina_pectoris_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had angina pectoris (unstable angina) within the past three months.","when_to_set_to_false":"Set to false if the patient has not had angina pectoris (unstable angina) within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had angina pectoris (unstable angina) within the past three months.","meaning":"Boolean indicating whether the patient has had angina pectoris within the past three months."} ;; "the patient has had unstable angina within three months"
(declare-const patient_has_finding_of_cerebrovascular_accident_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebrovascular accident (stroke) within the past three months.","when_to_set_to_false":"Set to false if the patient has not had a cerebrovascular accident (stroke) within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebrovascular accident (stroke) within the past three months.","meaning":"Boolean indicating whether the patient has had a cerebrovascular accident within the past three months."} ;; "the patient has had stroke within three months"
(declare-const patient_has_finding_of_transient_cerebral_ischemia_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had transient cerebral ischaemia within the past three months.","when_to_set_to_false":"Set to false if the patient has not had transient cerebral ischaemia within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had transient cerebral ischaemia within the past three months.","meaning":"Boolean indicating whether the patient has had transient cerebral ischaemia within the past three months."} ;; "the patient has had transient cerebral ischaemia within three months"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_myocardial_infarction_inthepast3months)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has had myocardial infarction within three months"

(assert
(! (not patient_has_finding_of_angina_pectoris_inthepast3months)
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has had unstable angina within three months"

(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthepast3months)
    :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has had stroke within three months"

(assert
(! (not patient_has_finding_of_transient_cerebral_ischemia_inthepast3months)
    :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient has had transient cerebral ischaemia within three months"

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current systolic blood pressure in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no current systolic blood pressure measurement in millimeters of mercury is available or the value is indeterminate.","meaning":"Numeric value for the patient's current systolic blood pressure in millimeters of mercury."} ;; "systolic blood pressure greater than one hundred seventy millimeters of mercury"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current diastolic blood pressure in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no current diastolic blood pressure measurement in millimeters of mercury is available or the value is indeterminate.","meaning":"Numeric value for the patient's current diastolic blood pressure in millimeters of mercury."} ;; "diastolic blood pressure greater than one hundred millimeters of mercury"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (> patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 170))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has systolic blood pressure greater than one hundred seventy millimeters of mercury."

(assert
(! (not (> patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 100))
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diastolic blood pressure greater than one hundred millimeters of mercury."

;; ===================== Constraint Assertions (REQ 3) =====================
;; "The patient is excluded if the patient has systolic blood pressure less than one hundred millimeters of mercury."
(assert
(! (not (< patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 100))
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS))

;; "The patient is excluded if the patient has diastolic blood pressure less than sixty millimeters of mercury."
(assert
(! (not (< patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 60))
    :named REQ3_COMPONENT1_OTHER_REQUIREMENTS))

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_orthostatic_hypotension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of orthostatic hypotension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of orthostatic hypotension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has orthostatic hypotension.","meaning":"Boolean indicating whether the patient currently has orthostatic hypotension."} ;; "orthostatic hypotension"
(declare-const patient_systolic_blood_pressure_fall_on_standing_value_now_in_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's systolic blood pressure fall upon standing, in millimeters of mercury, at the current time.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's systolic blood pressure fall upon standing, in millimeters of mercury, at the current time."} ;; "greater than twenty millimeters of mercury fall in systolic blood pressure on standing"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: orthostatic hypotension = greater than 20 mmHg fall in systolic blood pressure on standing
(assert
(! (= patient_has_finding_of_orthostatic_hypotension_now
     (> patient_systolic_blood_pressure_fall_on_standing_value_now_in_millimeters_of_mercury 20))
:named REQ4_AUXILIARY0)) ;; "defined as greater than twenty millimeters of mercury fall in systolic blood pressure on standing"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_orthostatic_hypotension_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has orthostatic hypotension (defined as greater than twenty millimeters of mercury fall in systolic blood pressure on standing)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes"

(declare-const patient_has_diagnosis_of_diabetes_mellitus_now@@treated_with_oral_hypoglycaemic_agent_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus and the diabetes is treated with oral hypoglycaemic agent treatment.","when_to_set_to_false":"Set to false if the patient currently has diabetes mellitus but the diabetes is not treated with oral hypoglycaemic agent treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diabetes is treated with oral hypoglycaemic agent treatment.","meaning":"Boolean indicating whether the patient's diabetes mellitus is treated with oral hypoglycaemic agent treatment."} ;; "diabetes treated with oral hypoglycaemic agent treatment"

(declare-const patient_has_diagnosis_of_diabetes_mellitus_now@@treated_with_insulin_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus and the diabetes is treated with insulin treatment.","when_to_set_to_false":"Set to false if the patient currently has diabetes mellitus but the diabetes is not treated with insulin treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diabetes is treated with insulin treatment.","meaning":"Boolean indicating whether the patient's diabetes mellitus is treated with insulin treatment."} ;; "diabetes treated with insulin treatment"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_diabetes_mellitus_now@@treated_with_oral_hypoglycaemic_agent_treatment
      patient_has_diagnosis_of_diabetes_mellitus_now)
:named REQ5_AUXILIARY0)) ;; "diabetes treated with oral hypoglycaemic agent treatment"

(assert
(! (=> patient_has_diagnosis_of_diabetes_mellitus_now@@treated_with_insulin_treatment
      patient_has_diagnosis_of_diabetes_mellitus_now)
:named REQ5_AUXILIARY1)) ;; "diabetes treated with insulin treatment"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_diabetes_mellitus_now@@treated_with_oral_hypoglycaemic_agent_treatment)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes treated with oral hypoglycaemic agent treatment."

(assert
(! (not patient_has_diagnosis_of_diabetes_mellitus_now@@treated_with_insulin_treatment)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes treated with insulin treatment."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_stable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of stable angina.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of stable angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of stable angina.","meaning":"Boolean indicating whether the patient currently has a diagnosis of stable angina."} ;; "stable angina"
(declare-const patient_has_finding_of_clinically_significant_disease_other_than_stable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any clinically significant disease other than stable angina.","when_to_set_to_false":"Set to false if the patient currently does not have any clinically significant disease other than stable angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any clinically significant disease other than stable angina.","meaning":"Boolean indicating whether the patient currently has any clinically significant disease other than stable angina."} ;; "any clinically significant disease other than stable angina"
(declare-const patient_has_finding_of_clinically_significant_disease_other_than_stable_angina_now@@not_limited_to_other_cardiovascular_disease_risk_factors Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinically significant disease other than stable angina is not limited to other cardiovascular disease risk factors (e.g., smoking, hypercholesterolaemia, diet-controlled diabetes).","when_to_set_to_false":"Set to false if the patient's clinically significant disease other than stable angina is limited to other cardiovascular disease risk factors (e.g., smoking, hypercholesterolaemia, diet-controlled diabetes).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's clinically significant disease other than stable angina is limited to other cardiovascular disease risk factors.","meaning":"Boolean indicating whether the patient's clinically significant disease other than stable angina is not limited to other cardiovascular disease risk factors (with non-exhaustive examples: smoking, hypercholesterolaemia, diet-controlled diabetes)."} ;; "the clinically significant disease is NOT limited to other cardiovascular disease risk factors with non-exhaustive examples (smoking, hypercholesterolaemia, diet-controlled diabetes)"
(declare-const patient_has_finding_of_diabetic_on_diet_only_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of diabetes controlled by diet only.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of diabetes controlled by diet only.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of diabetes controlled by diet only.","meaning":"Boolean indicating whether the patient currently has a finding of diabetes controlled by diet only."} ;; "diet-controlled diabetes"
(declare-const patient_has_finding_of_hypercholesterolemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of hypercholesterolemia.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of hypercholesterolemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of hypercholesterolemia.","meaning":"Boolean indicating whether the patient currently has a finding of hypercholesterolemia."} ;; "hypercholesterolaemia"
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of tobacco smoking behavior.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of tobacco smoking behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of tobacco smoking behavior.","meaning":"Boolean indicating whether the patient currently has a finding of tobacco smoking behavior."} ;; "smoking"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples imply the umbrella subclass for cardiovascular disease risk factors
(assert
(! (=> (or patient_has_finding_of_tobacco_smoking_behavior_finding_now
          patient_has_finding_of_hypercholesterolemia_now
          patient_has_finding_of_diabetic_on_diet_only_now)
     (not patient_has_finding_of_clinically_significant_disease_other_than_stable_angina_now@@not_limited_to_other_cardiovascular_disease_risk_factors))
:named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (smoking, hypercholesterolaemia, diet-controlled diabetes)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_clinically_significant_disease_other_than_stable_angina_now@@not_limited_to_other_cardiovascular_disease_risk_factors
      patient_has_finding_of_clinically_significant_disease_other_than_stable_angina_now)
:named REQ6_AUXILIARY1)) ;; "the clinically significant disease is NOT limited to other cardiovascular disease risk factors"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have any clinically significant disease other than stable angina AND the disease is NOT limited to other cardiovascular disease risk factors
(assert
(! (not (and patient_has_finding_of_clinically_significant_disease_other_than_stable_angina_now
             patient_has_finding_of_clinically_significant_disease_other_than_stable_angina_now@@not_limited_to_other_cardiovascular_disease_risk_factors))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has any clinically significant disease other than stable angina) AND (the clinically significant disease is NOT limited to other cardiovascular disease risk factors with non-exhaustive examples (smoking, hypercholesterolaemia, diet-controlled diabetes))."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_taking_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not taking any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any drug or medicament.","meaning":"Boolean indicating whether the patient is currently taking any drug or medicament."} ;; "drug"
(declare-const patient_is_taking_drug_or_medicament_now@@interacts_with_sildenafil_citrate Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently taking interacts with sildenafil citrate.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently taking does not interact with sildenafil citrate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament the patient is currently taking interacts with sildenafil citrate.","meaning":"Boolean indicating whether the drug or medicament being taken by the patient now interacts with sildenafil citrate."} ;; "drug that interacts with sildenafil citrate"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_is_taking_drug_or_medicament_now@@interacts_with_sildenafil_citrate
      patient_is_taking_drug_or_medicament_now)
:named REQ7_AUXILIARY0)) ;; "drug that interacts with sildenafil citrate" implies "drug"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_taking_drug_or_medicament_now@@interacts_with_sildenafil_citrate)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking any drug that interacts with sildenafil citrate."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding relating to drug misuse behavior (drug abuse).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding relating to drug misuse behavior (drug abuse).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding relating to drug misuse behavior (drug abuse).","meaning":"Boolean indicating whether the patient currently has a clinical finding relating to drug misuse behavior (drug abuse)."} ;; "evidence of drug abuse"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of drug abuse."
