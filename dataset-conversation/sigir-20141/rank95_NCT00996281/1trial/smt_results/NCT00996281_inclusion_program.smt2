;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_is_undergoing_antihypertensive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing antihypertensive therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing antihypertensive therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing antihypertensive therapy.","meaning":"Boolean indicating whether the patient is currently undergoing antihypertensive therapy."}  ;; "be treated with antihypertensive therapy"
(declare-const patient_blood_pressure_value_recorded_inthefuture1days_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured systolic blood pressure value in millimeters of mercury recorded on Day 1.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's systolic blood pressure measurement recorded on Day 1 in millimeters of mercury."}  ;; "systolic blood pressure measurement ... on Day 1"
(declare-const patient_blood_pressure_value_recorded_inthefuture1days_withunit_millimeters_of_mercury@@measured_after_post_washout Bool) ;; {"when_to_set_to_true":"Set to true if the blood pressure measurement on Day 1 is taken after post-washout.","when_to_set_to_false":"Set to false if the blood pressure measurement on Day 1 is not taken after post-washout.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken after post-washout.","meaning":"Boolean indicating whether the Day 1 blood pressure measurement was taken after post-washout."}  ;; "post-washout ... on Day 1"
(declare-const patient_blood_pressure_value_recorded_inthefuture1days_withunit_millimeters_of_mercury@@measured_in_sitting_position_in_clinic Bool) ;; {"when_to_set_to_true":"Set to true if the blood pressure measurement on Day 1 is taken in a sitting position in a clinic.","when_to_set_to_false":"Set to false if the blood pressure measurement on Day 1 is not taken in a sitting position in a clinic.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken in a sitting position in a clinic.","meaning":"Boolean indicating whether the Day 1 blood pressure measurement was taken in a sitting position in a clinic."}  ;; "mean sitting clinic systolic blood pressure ... on Day 1"
(declare-const patient_has_undergone_antihypertensive_therapy_inthepast14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antihypertensive therapy within the past 14 days.","when_to_set_to_false":"Set to false if the patient has not undergone antihypertensive therapy within the past 14 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone antihypertensive therapy within the past 14 days.","meaning":"Boolean indicating whether the patient has undergone antihypertensive therapy within the past 14 days."}  ;; "NOT have received antihypertensive treatment within 14 days prior to Screening"
(declare-const patient_has_undergone_antihypertensive_therapy_inthepast14days@@prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the antihypertensive therapy within the past 14 days occurred prior to Screening.","when_to_set_to_false":"Set to false if the antihypertensive therapy within the past 14 days did not occur prior to Screening.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the therapy occurred prior to Screening.","meaning":"Boolean indicating whether the antihypertensive therapy within the past 14 days occurred prior to Screening."}  ;; "within 14 days prior to Screening"
(declare-const patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured systolic blood pressure value in millimeters of mercury recorded at the Screening Visit.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's systolic blood pressure measurement recorded at the Screening Visit in millimeters of mercury."}  ;; "systolic blood pressure measurement ... at the Screening Visit"
(declare-const patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_sitting_position_in_clinic Bool) ;; {"when_to_set_to_true":"Set to true if the blood pressure measurement at the Screening Visit is taken in a sitting position in a clinic.","when_to_set_to_false":"Set to false if the blood pressure measurement at the Screening Visit is not taken in a sitting position in a clinic.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken in a sitting position in a clinic.","meaning":"Boolean indicating whether the Screening Visit blood pressure measurement was taken in a sitting position in a clinic."}  ;; "mean sitting clinic systolic blood pressure ... at the Screening Visit"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_blood_pressure_value_recorded_inthefuture1days_withunit_millimeters_of_mercury@@measured_after_post_washout
         true)
     :named REQ0_AUXILIARY0)) ;; "post-washout" qualifier

(assert
  (! (=> patient_blood_pressure_value_recorded_inthefuture1days_withunit_millimeters_of_mercury@@measured_in_sitting_position_in_clinic
         true)
     :named REQ0_AUXILIARY1)) ;; "sitting clinic" qualifier for Day 1

(assert
  (! (=> patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_sitting_position_in_clinic
         true)
     :named REQ0_AUXILIARY2)) ;; "sitting clinic" qualifier for Screening Visit

(assert
  (! (=> patient_has_undergone_antihypertensive_therapy_inthepast14days@@prior_to_screening
         patient_has_undergone_antihypertensive_therapy_inthepast14days)
     :named REQ0_AUXILIARY3)) ;; "prior to Screening" qualifier

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: ((on antihypertensive therapy now AND post-washout mean sitting clinic SBP 160-190 mmHg on Day 1) OR (NOT received antihypertensive therapy in past 14 days prior to Screening AND mean sitting clinic SBP 160-190 mmHg at Screening Visit AND mean sitting clinic SBP 160-190 mmHg on Day 1))
(assert
  (! (or
        (and
          patient_is_undergoing_antihypertensive_therapy_now
          patient_blood_pressure_value_recorded_inthefuture1days_withunit_millimeters_of_mercury@@measured_after_post_washout
          patient_blood_pressure_value_recorded_inthefuture1days_withunit_millimeters_of_mercury@@measured_in_sitting_position_in_clinic
          (>= patient_blood_pressure_value_recorded_inthefuture1days_withunit_millimeters_of_mercury 160.0)
          (<= patient_blood_pressure_value_recorded_inthefuture1days_withunit_millimeters_of_mercury 190.0)
        )
        (and
          (not patient_has_undergone_antihypertensive_therapy_inthepast14days@@prior_to_screening)
          patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_in_sitting_position_in_clinic
          (>= patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 160.0)
          (<= patient_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 190.0)
          patient_blood_pressure_value_recorded_inthefuture1days_withunit_millimeters_of_mercury@@measured_in_sitting_position_in_clinic
          (>= patient_blood_pressure_value_recorded_inthefuture1days_withunit_millimeters_of_mercury 160.0)
          (<= patient_blood_pressure_value_recorded_inthefuture1days_withunit_millimeters_of_mercury 190.0)
        )
     )
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((be treated with antihypertensive therapy AND (have a post-washout mean sitting clinic systolic blood pressure measurement ≥ 160 millimeters of mercury AND ≤ 190 millimeters of mercury on Day 1)) OR (NOT have received antihypertensive treatment within 14 days prior to Screening AND (have a mean sitting clinic systolic blood pressure measurement ≥ 160 millimeters of mercury AND ≤ 190 millimeters of mercury at the Screening Visit) AND (have a mean sitting clinic systolic blood pressure measurement ≥ 160 millimeters of mercury AND ≤ 190 millimeters of mercury on Day 1)))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_female_of_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently female and of childbearing potential.","when_to_set_to_false":"Set to false if the patient is not currently female and/or not of childbearing potential.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently female and of childbearing potential.","meaning":"Boolean indicating whether the patient is currently female and of childbearing potential."} ;; "female patient of childbearing potential"
(declare-const patient_is_sexually_active_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently sexually active.","when_to_set_to_false":"Set to false if the patient is currently not sexually active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently sexually active.","meaning":"Boolean indicating whether the patient is currently sexually active."} ;; "who is sexually active"
(declare-const patient_has_finding_of_contraception_now@@routine_use_from_before_study_participation_to_screening_to_30_days_after_last_study_drug_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient is using contraception routinely during the period from before study participation to Screening to 30 days after the last study drug dose.","when_to_set_to_false":"Set to false if the patient is not using contraception routinely during this period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether contraception is used routinely during this period.","meaning":"Boolean indicating whether contraception is used routinely from before study participation to Screening to 30 days after the last study drug dose."} ;; "agree to routinely use adequate contraception ... from before study participation to Screening to 30 days after the last study drug dose"
(declare-const patient_is_pregnant_now@@not_pregnant_from_before_study_participation_to_screening_to_30_days_after_last_study_drug_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant and/or was pregnant at any time from before study participation to Screening to 30 days after the last study drug dose.","when_to_set_to_false":"Set to false if the patient is not currently pregnant and was not pregnant at any time from before study participation to Screening to 30 days after the last study drug dose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was pregnant at any time from before study participation to Screening to 30 days after the last study drug dose.","meaning":"Boolean indicating whether the patient is pregnant at any time from before study participation to Screening to 30 days after the last study drug dose."} ;; "NOT be a pregnant patient ... from before study participation to Screening to 30 days after the last study drug dose"
(declare-const patient_is_lactating_now@@not_lactating_from_before_study_participation_to_screening_to_30_days_after_last_study_drug_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating and/or was lactating at any time from before study participation to Screening to 30 days after the last study drug dose.","when_to_set_to_false":"Set to false if the patient is not currently lactating and was not lactating at any time from before study participation to Screening to 30 days after the last study drug dose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was lactating at any time from before study participation to Screening to 30 days after the last study drug dose.","meaning":"Boolean indicating whether the patient is lactating at any time from before study participation to Screening to 30 days after the last study drug dose."} ;; "NOT be a lactating patient ... from before study participation to Screening to 30 days after the last study drug dose"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: If the patient is a female of childbearing potential and is sexually active, she must agree to routinely use adequate contraception from before study participation to Screening to 30 days after the last study drug dose.
(assert
  (! (or (not (and patient_is_female_of_childbearing_potential_now patient_is_sexually_active_now))
         patient_has_finding_of_contraception_now@@routine_use_from_before_study_participation_to_screening_to_30_days_after_last_study_drug_dose)
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a female patient of childbearing potential who is sexually active, the patient must agree to routinely use adequate contraception ..."

;; Component 1: If the patient is a female of childbearing potential and is sexually active, she must NOT be a pregnant patient from before study participation to Screening to 30 days after the last study drug dose.
(assert
  (! (or (not (and patient_is_female_of_childbearing_potential_now patient_is_sexually_active_now))
         (not patient_is_pregnant_now@@not_pregnant_from_before_study_participation_to_screening_to_30_days_after_last_study_drug_dose))
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "must not be a pregnant patient ... from before study participation to Screening to 30 days after the last study drug dose"

;; Component 2: If the patient is a female of childbearing potential and is sexually active, she must NOT be a lactating patient from before study participation to Screening to 30 days after the last study drug dose.
(assert
  (! (or (not (and patient_is_female_of_childbearing_potential_now patient_is_sexually_active_now))
         (not patient_is_lactating_now@@not_lactating_from_before_study_participation_to_screening_to_30_days_after_last_study_drug_dose))
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "must not be a lactating patient ... from before study participation to Screening to 30 days after the last study drug dose"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_undergone_laboratory_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a clinical laboratory test now.","when_to_set_to_false":"Set to false if the patient has not undergone a clinical laboratory test now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a clinical laboratory test now.","meaning":"Boolean indicating whether the patient has undergone a clinical laboratory test now."} ;; "clinical laboratory test"
(declare-const patient_has_undergone_laboratory_test_now@@result_within_reference_range_for_testing_laboratory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a clinical laboratory test now and the result is within the reference range for the testing laboratory.","when_to_set_to_false":"Set to false if the patient has undergone a clinical laboratory test now and the result is not within the reference range for the testing laboratory.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the result is within the reference range for the testing laboratory.","meaning":"Boolean indicating whether the result of the clinical laboratory test is within the reference range for the testing laboratory."} ;; "clinical laboratory test result within the reference range for the testing laboratory"
(declare-const patient_has_undergone_laboratory_test_now@@result_not_considered_clinically_significant_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a clinical laboratory test now and the investigator does NOT consider the result clinically significant.","when_to_set_to_false":"Set to false if the patient has undergone a clinical laboratory test now and the investigator does consider the result clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator considers the result clinically significant.","meaning":"Boolean indicating whether the investigator does NOT consider the result of the clinical laboratory test to be clinically significant."} ;; "the investigator must NOT consider the clinical laboratory test result to be clinically significant"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_undergone_laboratory_test_now@@result_within_reference_range_for_testing_laboratory
         patient_has_undergone_laboratory_test_now)
     :named REQ2_AUXILIARY0)) ;; "result within reference range for the testing laboratory" implies laboratory test was done

(assert
  (! (=> patient_has_undergone_laboratory_test_now@@result_not_considered_clinically_significant_by_investigator
         patient_has_undergone_laboratory_test_now)
     :named REQ2_AUXILIARY1)) ;; "result not considered clinically significant by investigator" implies laboratory test was done

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must (have a clinical laboratory test result within the reference range for the testing laboratory OR the investigator must NOT consider the clinical laboratory test result to be clinically significant).
(assert
  (! (or patient_has_undergone_laboratory_test_now@@result_within_reference_range_for_testing_laboratory
         patient_has_undergone_laboratory_test_now@@result_not_considered_clinically_significant_by_investigator)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have a clinical laboratory test result within the reference range for the testing laboratory OR the investigator must NOT consider the clinical laboratory test result to be clinically significant"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_hypotensive_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (taking or receiving) antihypertensive medication (hypotensive agents) now.","when_to_set_to_false":"Set to false if the patient is not currently exposed to antihypertensive medication (hypotensive agents) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to antihypertensive medication (hypotensive agents) now.","meaning":"Boolean indicating whether the patient is currently exposed to antihypertensive medication (hypotensive agents) now."} ;; "antihypertensive medication"
(declare-const patient_is_exposed_to_hypotensive_agent_now@@willing_to_discontinue_up_to_3_weeks_before_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to discontinue antihypertensive medication (hypotensive agents) up to 3 weeks before enrollment.","when_to_set_to_false":"Set to false if the patient is not willing to discontinue antihypertensive medication (hypotensive agents) up to 3 weeks before enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to discontinue antihypertensive medication (hypotensive agents) up to 3 weeks before enrollment.","meaning":"Boolean indicating whether the patient is willing to discontinue antihypertensive medication (hypotensive agents) up to 3 weeks before enrollment."} ;; "willing to discontinue current antihypertensive medication up to 3 weeks before enrollment"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_exposed_to_hypotensive_agent_now@@willing_to_discontinue_up_to_3_weeks_before_enrollment
         patient_is_exposed_to_hypotensive_agent_now)
     :named REQ3_AUXILIARY0)) ;; "willing to discontinue current antihypertensive medication up to 3 weeks before enrollment" implies "currently exposed to antihypertensive medication"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_exposed_to_hypotensive_agent_now@@willing_to_discontinue_up_to_3_weeks_before_enrollment
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to discontinue current antihypertensive medication up to 3 weeks before enrollment."
