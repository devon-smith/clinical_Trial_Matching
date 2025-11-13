;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "adolescent"
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of the patient's body mass index (kg/m²) recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m²."} ;; "body mass index"
(declare-const patient_is_adolescent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as an adolescent.","when_to_set_to_false":"Set to false if the patient is currently not classified as an adolescent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as an adolescent.","meaning":"Boolean indicating whether the patient is currently classified as an adolescent."} ;; "adolescent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (and patient_is_adolescent_now
               (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 40)))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is an adolescent with body mass index greater than or equal to forty."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_type_1_diabetes_mellitus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received a diagnosis of type 1 diabetes mellitus at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never received a diagnosis of type 1 diabetes mellitus at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received a diagnosis of type 1 diabetes mellitus.","meaning":"Boolean indicating whether the patient has ever received a diagnosis of type 1 diabetes mellitus in their history."} ;; "type 1 diabetes"
(declare-const patient_has_diagnosis_of_type_2_diabetes_mellitus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received a diagnosis of type 2 diabetes mellitus at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never received a diagnosis of type 2 diabetes mellitus at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received a diagnosis of type 2 diabetes mellitus.","meaning":"Boolean indicating whether the patient has ever received a diagnosis of type 2 diabetes mellitus in their history."} ;; "type 2 diabetes"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_type_1_diabetes_mellitus_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous diagnosis of type 1 diabetes."

(assert
(! (not patient_has_diagnosis_of_type_2_diabetes_mellitus_inthehistory)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous diagnosis of type 2 diabetes."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const blood_pressure_diastolic_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the patient's current diastolic blood pressure value in mm Hg if available.","when_to_set_to_null":"Set to null if the patient's current diastolic blood pressure value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current diastolic blood pressure measured in mm Hg."} ;; "blood pressure in the range of stage 2 hypertension"
(declare-const blood_pressure_systolic_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the patient's current systolic blood pressure value in mm Hg if available.","when_to_set_to_null":"Set to null if the patient's current systolic blood pressure value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current systolic blood pressure measured in mm Hg."} ;; "blood pressure in the range of stage 2 hypertension"
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to or taking any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to or taking any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to or taking any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to or taking any drug or medicament."} ;; "requires medication"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@required_for_stage_2_hypertension Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently exposed to is specifically required for the treatment of stage 2 hypertension.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently exposed to is not specifically required for the treatment of stage 2 hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is specifically required for the treatment of stage 2 hypertension.","meaning":"Boolean indicating whether the drug or medicament the patient is currently exposed to is specifically required for the treatment of stage 2 hypertension."} ;; "requires medication for stage 2 hypertension"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@required_for_stage_2_hypertension
      patient_is_exposed_to_drug_or_medicament_now)
:named REQ2_AUXILIARY0)) ;; "requires medication for stage 2 hypertension"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Stage 2 hypertension is defined as:
;; Systolic blood pressure ≥ 140 mm Hg OR diastolic blood pressure ≥ 90 mm Hg (per standard clinical definition)
;; The exclusion requires BOTH: (stage 2 hypertension) AND (medication required for stage 2 hypertension)
(assert
(! (not (and
         (or (>= blood_pressure_systolic_value_recorded_now_withunit_mm_hg 140)
             (>= blood_pressure_diastolic_value_recorded_now_withunit_mm_hg 90)) ;; "blood pressure in the range of stage 2 hypertension"
         patient_is_exposed_to_drug_or_medicament_now@@required_for_stage_2_hypertension)) ;; "requires medication for stage 2 hypertension"
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has blood pressure in the range of stage 2 hypertension) AND (the patient requires medication for stage 2 hypertension)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_undergoing_therapeutic_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a therapeutic procedure (treatment).","when_to_set_to_false":"Set to false if the patient is currently not undergoing any therapeutic procedure (treatment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a therapeutic procedure (treatment).","meaning":"Boolean indicating whether the patient is currently undergoing a therapeutic procedure (treatment)."} ;; "treatment"
(declare-const patient_is_undergoing_therapeutic_procedure_now@@interferes_with_outcomes_related_to_blood_pressure_or_glucose Bool) ;; {"when_to_set_to_true":"Set to true if the therapeutic procedure (treatment) the patient is currently undergoing interferes with outcomes related to blood pressure or glucose.","when_to_set_to_false":"Set to false if the therapeutic procedure (treatment) the patient is currently undergoing does not interfere with outcomes related to blood pressure or glucose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapeutic procedure (treatment) interferes with outcomes related to blood pressure or glucose.","meaning":"Boolean indicating whether the current therapeutic procedure (treatment) interferes with outcomes related to blood pressure or glucose."} ;; "treatment which interferes with outcomes related to blood pressure or outcomes related to glucose"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_therapeutic_procedure_now@@interferes_with_outcomes_related_to_blood_pressure_or_glucose
      patient_is_undergoing_therapeutic_procedure_now)
   :named REQ3_AUXILIARY0)) ;; "treatment which interferes with outcomes related to blood pressure or outcomes related to glucose"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_undergoing_therapeutic_procedure_now@@interferes_with_outcomes_related_to_blood_pressure_or_glucose)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving treatment which interferes with outcomes related to blood pressure or outcomes related to glucose."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_weight_increased_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently experiencing weight gain as a clinical finding.","when_to_set_to_false":"Set to false if the patient is currently not experiencing weight gain as a clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently experiencing weight gain.","meaning":"Boolean indicating whether the patient is currently experiencing weight gain."} ;; "weight gain"
(declare-const patient_has_finding_of_weight_increased_now@@significantly_interfered_with_by_medications Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current weight gain is significantly interfered with by medications.","when_to_set_to_false":"Set to false if the patient's current weight gain is not significantly interfered with by medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current weight gain is significantly interfered with by medications.","meaning":"Boolean indicating whether the patient's current weight gain is significantly interfered with by medications."} ;; "medications that significantly interfere with weight gain"
(declare-const patient_is_exposed_to_steroid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to steroids.","when_to_set_to_false":"Set to false if the patient is currently not exposed to steroids.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to steroids.","meaning":"Boolean indicating whether the patient is currently exposed to steroids."} ;; "steroid"
(declare-const patient_is_exposed_to_steroid_now@@oral_administration Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current steroid exposure is via oral administration.","when_to_set_to_false":"Set to false if the patient's current steroid exposure is not via oral administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current steroid exposure is via oral administration.","meaning":"Boolean indicating whether the patient's current steroid exposure is via oral administration."} ;; "oral steroid use"
(declare-const patient_is_exposed_to_steroid_now@@duration_greater_than_two_consecutive_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current steroid exposure has lasted for greater than two consecutive weeks.","when_to_set_to_false":"Set to false if the patient's current steroid exposure has not lasted for greater than two consecutive weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current steroid exposure has lasted for greater than two consecutive weeks.","meaning":"Boolean indicating whether the patient's current steroid exposure has lasted for greater than two consecutive weeks."} ;; "oral steroid use greater than two consecutive weeks"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive example implies umbrella subclass
(assert
(! (=> (and patient_is_exposed_to_steroid_now@@oral_administration
            patient_is_exposed_to_steroid_now@@duration_greater_than_two_consecutive_weeks)
    patient_has_finding_of_weight_increased_now@@significantly_interfered_with_by_medications)
:named REQ4_AUXILIARY0)) ;; "such as oral steroid use greater than two consecutive weeks"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_weight_increased_now@@significantly_interfered_with_by_medications
    patient_has_finding_of_weight_increased_now)
:named REQ4_AUXILIARY1)) ;; "significantly interfered with by medications"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_steroid_now@@oral_administration
    patient_is_exposed_to_steroid_now)
:named REQ4_AUXILIARY2)) ;; "oral steroid use"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_steroid_now@@duration_greater_than_two_consecutive_weeks
    patient_is_exposed_to_steroid_now)
:named REQ4_AUXILIARY3)) ;; "oral steroid use greater than two consecutive weeks"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_weight_increased_now@@significantly_interfered_with_by_medications)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking medications that significantly interfere with weight gain with non-exhaustive examples (oral steroid use greater than two consecutive weeks)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_taking_anti_psychotic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any anti-psychotic agent.","when_to_set_to_false":"Set to false if the patient is currently not taking any anti-psychotic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any anti-psychotic agent.","meaning":"Boolean indicating whether the patient is currently taking anti-psychotic agents."} ;; "antipsychotic medications"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_taking_anti_psychotic_agent_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking antipsychotic medications."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_weight_decreased_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has experienced weight loss within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not experienced weight loss within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has experienced weight loss within the past 6 months.","meaning":"Boolean indicating whether the patient has experienced weight loss within the past 6 months."} ;; "weight loss"
(declare-const patient_has_finding_of_weight_decreased_inthepast6months@@due_to_participation_in_standardized_weight_loss_program Bool) ;; {"when_to_set_to_true":"Set to true if the patient's weight loss within the past 6 months is due to participation in a standardized weight loss program.","when_to_set_to_false":"Set to false if the patient's weight loss within the past 6 months is not due to participation in a standardized weight loss program.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's weight loss within the past 6 months is due to participation in a standardized weight loss program.","meaning":"Boolean indicating whether the patient's weight loss within the past 6 months is due to participation in a standardized weight loss program."} ;; "weight loss due to participation in standardized weight loss program"
(declare-const patient_has_participated_in_standardized_weight_loss_program_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in a standardized weight loss program within the previous six months.","when_to_set_to_false":"Set to false if the patient has not participated in a standardized weight loss program within the previous six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in a standardized weight loss program within the previous six months.","meaning":"Boolean indicating whether the patient has participated in a standardized weight loss program within the previous six months."} ;; "participated in a standardized weight loss program within the previous six months"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_weight_decreased_inthepast6months@@due_to_participation_in_standardized_weight_loss_program
       patient_has_finding_of_weight_decreased_inthepast6months)
   :named REQ6_AUXILIARY0)) ;; "weight loss due to participation in standardized weight loss program"

;; Participation in standardized weight loss program within previous six months implies weight loss due to program
(assert
(! (=> patient_has_participated_in_standardized_weight_loss_program_inthepast6months
       patient_has_finding_of_weight_decreased_inthepast6months@@due_to_participation_in_standardized_weight_loss_program)
   :named REQ6_AUXILIARY1)) ;; "has participated in a standardized weight loss program within the previous six months"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_participated_in_standardized_weight_loss_program_inthepast6months)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in a standardized weight loss program within the previous six months."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_able_to_provide_informed_assent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide informed assent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide informed assent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide informed assent.","meaning":"Boolean indicating whether the patient is currently able to provide informed assent."} ;; "unable to provide informed assent"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_able_to_provide_informed_assent_now)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to provide informed assent."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_parent_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has parent consent.","when_to_set_to_false":"Set to false if the patient currently does not have parent consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has parent consent.","meaning":"Boolean indicating whether the patient currently has parent consent."} ;; "the patient does not have parent consent"
(declare-const patient_has_guardian_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has guardian consent.","when_to_set_to_false":"Set to false if the patient currently does not have guardian consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has guardian consent.","meaning":"Boolean indicating whether the patient currently has guardian consent."} ;; "the patient does not have guardian consent"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (and patient_has_parent_consent_now patient_has_guardian_consent_now))
:named REQ8_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient does not have parent consent) OR (the patient does not have guardian consent)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_reading_ability_value_recorded_now_withunit_grade_level Real) ;; {"when_to_set_to_value":"Set to the numeric grade level that best represents the patient's current reading ability, as determined by assessment or documentation.","when_to_set_to_null":"Set to null if the patient's reading ability grade level is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current reading ability in terms of grade level."} ;; "reading ability to comprehend the self-administered assessment instruments (approximately fifth grade reading level)"

(declare-const patient_reading_ability_value_recorded_now_withunit_grade_level@@insufficient_to_comprehend_self_administered_assessment_instruments Bool) ;; {"when_to_set_to_true":"Set to true if the patient's reading ability is insufficient to comprehend the self-administered assessment instruments (i.e., below the required grade level threshold).","when_to_set_to_false":"Set to false if the patient's reading ability is sufficient to comprehend the self-administered assessment instruments (i.e., at or above the required grade level threshold).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's reading ability is sufficient to comprehend the self-administered assessment instruments.","meaning":"Boolean indicating whether the patient's reading ability is insufficient to comprehend the self-administered assessment instruments."} ;; "insufficient reading ability to comprehend the self-administered assessment instruments (approximately fifth grade reading level)"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Definition: insufficient reading ability means grade level below 5
(assert
(! (= patient_reading_ability_value_recorded_now_withunit_grade_level@@insufficient_to_comprehend_self_administered_assessment_instruments
    (< patient_reading_ability_value_recorded_now_withunit_grade_level 5))
:named REQ9_AUXILIARY0)) ;; "insufficient reading ability to comprehend the self-administered assessment instruments (approximately fifth grade reading level)"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_reading_ability_value_recorded_now_withunit_grade_level@@insufficient_to_comprehend_self_administered_assessment_instruments)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has insufficient reading ability to comprehend the self-administered assessment instruments (approximately fifth grade reading level)."
