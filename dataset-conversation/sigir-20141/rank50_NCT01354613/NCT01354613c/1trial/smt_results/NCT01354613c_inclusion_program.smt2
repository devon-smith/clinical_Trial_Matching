;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the patient's left ventricular ejection fraction (LVEF) recorded now is available.","when_to_set_to_null":"Set to null if no such percentage measurement recorded now is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current left ventricular ejection fraction (LVEF)."} // "left ventricular ejection fraction ≥ 50 %"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent 50.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have left ventricular ejection fraction ≥ 50 %."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_symptomatic_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of symptomatic congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of symptomatic congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptomatic congestive heart failure.","meaning":"Boolean indicating whether the patient currently has symptomatic congestive heart failure."} // "symptomatic heart failure"
(declare-const patient_meets_appropriate_comparator_group_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets the appropriate comparator group criteria as defined by the study.","when_to_set_to_false":"Set to false if the patient does not meet the appropriate comparator group criteria as defined by the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets the appropriate comparator group criteria as defined by the study.","meaning":"Boolean indicating whether the patient meets the appropriate comparator group criteria as defined by the study."} // "meet appropriate comparator group criteria"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must (have symptomatic heart failure OR meet appropriate comparator group criteria).
(assert
  (! (or patient_has_finding_of_symptomatic_congestive_heart_failure_now
         patient_meets_appropriate_comparator_group_criteria)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (have symptomatic heart failure OR meet appropriate comparator group criteria)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_signed_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed informed consent.","when_to_set_to_false":"Set to false if the patient has not signed informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed informed consent.","meaning":"Boolean indicating whether the patient has signed informed consent."} // "the patient must have signed informed consent"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_signed_informed_consent
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have signed informed consent"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of hypertensive disorder (hypertension) at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with hypertensive disorder (hypertension) or documentation confirms absence of such history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient has a known history of hypertensive disorder (hypertension)."} // "known history of hypertension"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_diagnosis_of_hypertensive_disorder_inthehistory
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have known history of hypertension."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_left_ventricular_hypertrophy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of left ventricular hypertrophy.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of left ventricular hypertrophy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of left ventricular hypertrophy.","meaning":"Boolean indicating whether the patient currently has left ventricular hypertrophy."} // "left ventricular hypertrophy"
(declare-const patient_has_finding_of_left_ventricular_hypertrophy_now@@evidenced_by_echocardiography Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left ventricular hypertrophy is evidenced by echocardiography.","when_to_set_to_false":"Set to false if the patient's left ventricular hypertrophy is not evidenced by echocardiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether echocardiography evidences the patient's left ventricular hypertrophy.","meaning":"Boolean indicating whether the patient's left ventricular hypertrophy is evidenced by echocardiography."} // "echocardiographic evidence of left ventricular hypertrophy"
(declare-const patient_has_finding_of_diastolic_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of diastolic dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of diastolic dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of diastolic dysfunction.","meaning":"Boolean indicating whether the patient currently has diastolic dysfunction."} // "diastolic dysfunction"
(declare-const patient_has_finding_of_diastolic_dysfunction_now@@evidenced_by_echocardiography Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diastolic dysfunction is evidenced by echocardiography.","when_to_set_to_false":"Set to false if the patient's diastolic dysfunction is not evidenced by echocardiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether echocardiography evidences the patient's diastolic dysfunction.","meaning":"Boolean indicating whether the patient's diastolic dysfunction is evidenced by echocardiography."} // "echocardiographic evidence of diastolic dysfunction"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable for left ventricular hypertrophy implies the base variable
(assert
  (! (=> patient_has_finding_of_left_ventricular_hypertrophy_now@@evidenced_by_echocardiography
         patient_has_finding_of_left_ventricular_hypertrophy_now)
     :named REQ5_AUXILIARY0)) ;; "echocardiographic evidence of left ventricular hypertrophy" implies "left ventricular hypertrophy"

;; Qualifier variable for diastolic dysfunction implies the base variable
(assert
  (! (=> patient_has_finding_of_diastolic_dysfunction_now@@evidenced_by_echocardiography
         patient_has_finding_of_diastolic_dysfunction_now)
     :named REQ5_AUXILIARY1)) ;; "echocardiographic evidence of diastolic dysfunction" implies "diastolic dysfunction"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: Must have echocardiographic evidence of left ventricular hypertrophy
(assert
  (! patient_has_finding_of_left_ventricular_hypertrophy_now@@evidenced_by_echocardiography
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have echocardiographic evidence of left ventricular hypertrophy"

;; Component 1: Must have echocardiographic evidence of diastolic dysfunction
(assert
  (! patient_has_finding_of_diastolic_dysfunction_now@@evidenced_by_echocardiography
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have echocardiographic evidence of diastolic dysfunction"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with heart failure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with heart failure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with heart failure.","meaning":"Boolean indicating whether the patient has ever been diagnosed with heart failure in their history."} // "history of heart failure"
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has physical examination evidence of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have physical examination evidence of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has physical examination evidence of heart failure.","meaning":"Boolean indicating whether the patient currently has physical examination evidence of heart failure."} // "physical examination evidence of heart failure"
(declare-const patient_has_finding_of_dyspnea_on_exertion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dyspnea on exertion.","when_to_set_to_false":"Set to false if the patient currently does not have dyspnea on exertion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dyspnea on exertion.","meaning":"Boolean indicating whether the patient currently has dyspnea on exertion."} // "dyspnea on exertion"
(declare-const patient_has_finding_of_dyspnea_on_exertion_now@@excessive Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dyspnea on exertion and it is excessive.","when_to_set_to_false":"Set to false if the patient currently has dyspnea on exertion but it is not excessive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dyspnea on exertion is excessive.","meaning":"Boolean indicating whether the patient's current dyspnea on exertion is excessive."} // "excessive dyspnea on exertion"
(declare-const patient_has_finding_of_dyspnea_at_rest_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dyspnea at rest.","when_to_set_to_false":"Set to false if the patient currently does not have dyspnea at rest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dyspnea at rest.","meaning":"Boolean indicating whether the patient currently has dyspnea at rest."} // "dyspnea at rest"
(declare-const patient_has_finding_of_orthopnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has orthopnea.","when_to_set_to_false":"Set to false if the patient currently does not have orthopnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has orthopnea.","meaning":"Boolean indicating whether the patient currently has orthopnea."} // "orthopnea"
(declare-const patient_has_finding_of_paroxysmal_nocturnal_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has paroxysmal nocturnal dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not have paroxysmal nocturnal dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has paroxysmal nocturnal dyspnea.","meaning":"Boolean indicating whether the patient currently has paroxysmal nocturnal dyspnea."} // "paroxysmal nocturnal dyspnea (PND)"
(declare-const patient_has_finding_of_jugular_venous_engorgement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has jugular venous distention.","when_to_set_to_false":"Set to false if the patient currently does not have jugular venous distention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has jugular venous distention.","meaning":"Boolean indicating whether the patient currently has jugular venous distention."} // "jugular venous distention"
(declare-const patient_has_finding_of_hepatojugular_reflux_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatojugular reflux.","when_to_set_to_false":"Set to false if the patient currently does not have hepatojugular reflux.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatojugular reflux.","meaning":"Boolean indicating whether the patient currently has hepatojugular reflux."} // "hepatojugular reflux"
(declare-const patient_has_finding_of_respiratory_crackles_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory crackles (rales).","when_to_set_to_false":"Set to false if the patient currently does not have respiratory crackles (rales).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory crackles (rales).","meaning":"Boolean indicating whether the patient currently has respiratory crackles (rales)."} // "rales"
(declare-const patient_has_finding_of_edema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has edema.","when_to_set_to_false":"Set to false if the patient currently does not have edema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has edema.","meaning":"Boolean indicating whether the patient currently has edema."} // "edema"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples: listed findings imply physical exam evidence of heart failure
(assert
  (! (=> (or patient_has_finding_of_dyspnea_on_exertion_now@@excessive
            patient_has_finding_of_dyspnea_at_rest_now
            patient_has_finding_of_orthopnea_now
            patient_has_finding_of_paroxysmal_nocturnal_dyspnea_now
            patient_has_finding_of_jugular_venous_engorgement_now
            patient_has_finding_of_hepatojugular_reflux_now
            patient_has_finding_of_respiratory_crackles_now
            patient_has_finding_of_edema_now)
         patient_has_finding_of_heart_failure_now)
     :named REQ6_AUXILIARY0)) ;; "including excessive dyspnea on exertion, dyspnea at rest, orthopnea, paroxysmal nocturnal dyspnea (PND), jugular venous distention, hepatojugular reflux, rales, or edema"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_dyspnea_on_exertion_now@@excessive
         patient_has_finding_of_dyspnea_on_exertion_now)
     :named REQ6_AUXILIARY1)) ;; "excessive dyspnea on exertion" implies "dyspnea on exertion"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: patient must NOT have a history of heart failure OR must NOT have physical examination evidence of heart failure (including listed findings)
(assert
  (! (or (not patient_has_diagnosis_of_heart_failure_inthehistory)
         (not patient_has_finding_of_heart_failure_now))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must not have a history of heart failure or must not have physical examination evidence of heart failure, including ..."
