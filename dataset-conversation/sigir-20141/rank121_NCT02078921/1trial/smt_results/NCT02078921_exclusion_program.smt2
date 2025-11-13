;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_can_undergo_exercise_tolerance_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo an exercise tolerance test.","when_to_set_to_false":"Set to false if the patient is currently unable to undergo an exercise tolerance test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to undergo an exercise tolerance test.","meaning":"Boolean indicating whether the patient is currently able to undergo an exercise tolerance test."} ;; "exercise test"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_can_undergo_exercise_tolerance_test_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to do an exercise test."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "woman of child bearing potential"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is female.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not female.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current recorded sex is female."} ;; "woman of child bearing potential"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman of child bearing potential."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_glucose_6_phosphate_dehydrogenase_deficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has glucose-6-phosphate dehydrogenase deficiency.","when_to_set_to_false":"Set to false if the patient currently does not have glucose-6-phosphate dehydrogenase deficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has glucose-6-phosphate dehydrogenase deficiency.","meaning":"Boolean indicating whether the patient currently has glucose-6-phosphate dehydrogenase deficiency."} ;; "the patient has glucose-6-phosphate dehydrogenase deficiency"

(declare-const patient_has_racial_origin_at_risk_of_glucose_6_phosphate_dehydrogenase_deficiency Bool) ;; {"when_to_set_to_true":"Set to true if the patient is of a racial origin that is considered at risk for glucose-6-phosphate dehydrogenase deficiency.","when_to_set_to_false":"Set to false if the patient is of a racial origin that is not considered at risk for glucose-6-phosphate dehydrogenase deficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's racial origin is at risk for glucose-6-phosphate dehydrogenase deficiency.","meaning":"Boolean indicating whether the patient is of a racial origin at risk of glucose-6-phosphate dehydrogenase deficiency."} ;; "the patient is of a racial origin at risk of glucose-6-phosphate dehydrogenase deficiency"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and patient_has_racial_origin_at_risk_of_glucose_6_phosphate_dehydrogenase_deficiency
             patient_has_glucose_6_phosphate_dehydrogenase_deficiency_now))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is of a racial origin at risk of glucose-6-phosphate dehydrogenase deficiency) AND (the patient has glucose-6-phosphate dehydrogenase deficiency)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_st_segment_depression_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value (in millimeters) if a numeric measurement of the patient's ST segment depression recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's ST segment depression (in millimeters) measured now."} ;; "ST segment depression"
(declare-const patient_st_segment_depression_value_recorded_now_withunit_millimeter@@resting_context Bool) ;; {"when_to_set_to_true":"Set to true if the ST segment depression value was measured in the resting context.","when_to_set_to_false":"Set to false if the ST segment depression value was not measured in the resting context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken in the resting context.","meaning":"Indicates whether the ST segment depression value was measured in the resting context."} ;; "resting ST segment depression"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (and patient_st_segment_depression_value_recorded_now_withunit_millimeter@@resting_context
             (>= patient_st_segment_depression_value_recorded_now_withunit_millimeter 1)))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a resting ST segment depression greater than or equal to 1 millimeter."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_new_york_heart_association_class_3_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has New York Heart Association class 3 heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have New York Heart Association class 3 heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has New York Heart Association class 3 heart failure.","meaning":"Boolean indicating whether the patient currently has New York Heart Association class 3 heart failure."} ;; "the patient has New York Heart Association class 3 heart failure"
(declare-const patient_has_finding_of_new_york_heart_association_class_4_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has New York Heart Association class 4 heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have New York Heart Association class 4 heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has New York Heart Association class 4 heart failure.","meaning":"Boolean indicating whether the patient currently has New York Heart Association class 4 heart failure."} ;; "the patient has New York Heart Association class 4 heart failure"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the patient's left ventricular ejection fraction recorded now is available.","when_to_set_to_null":"Set to null if no such percentage measurement recorded now is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current left ventricular ejection fraction."} ;; "left ventricular ejection fraction less than 45 percent"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_new_york_heart_association_class_3_heart_failure_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has New York Heart Association class 3 heart failure."

(assert
(! (not patient_has_finding_of_new_york_heart_association_class_4_heart_failure_now)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has New York Heart Association class 4 heart failure."

(assert
(! (not (< patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent 45))
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a left ventricular ejection fraction less than 45 percent."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthepast2months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of myocardial infarction within the past two months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of myocardial infarction within the past two months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of myocardial infarction within the past two months.","meaning":"Boolean indicating whether the patient has had a diagnosis of myocardial infarction within the past two months."} ;; "myocardial infarction"
(declare-const patient_has_undergone_heart_revascularization_inthepast2months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a heart revascularization procedure within the past two months.","when_to_set_to_false":"Set to false if the patient has not undergone a heart revascularization procedure within the past two months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a heart revascularization procedure within the past two months.","meaning":"Boolean indicating whether the patient has undergone a heart revascularization procedure within the past two months."} ;; "revascularisation"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not (or patient_has_diagnosis_of_myocardial_infarction_inthepast2months
              patient_has_undergone_heart_revascularization_inthepast2months))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has had a myocardial infarction or has had a revascularisation within the last two months."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_left_bundle_branch_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of left bundle branch block.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of left bundle branch block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of left bundle branch block.","meaning":"Boolean indicating whether the patient currently has left bundle branch block."} ;; "left bundle branch block"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_finding_of_left_bundle_branch_block_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has left bundle branch block."
