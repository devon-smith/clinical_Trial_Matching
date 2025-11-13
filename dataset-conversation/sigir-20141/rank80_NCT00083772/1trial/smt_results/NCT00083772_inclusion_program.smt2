;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged greater than or equal to 18 years AND aged less than or equal to 85 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be aged greater than or equal to 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged greater than or equal to 18 years."

;; Component 1: To be included, the patient must be aged less than or equal to 85 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 85)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged less than or equal to 85 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_acute_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted with a diagnosis of acute heart failure.","when_to_set_to_false":"Set to false if the patient is currently admitted without a diagnosis of acute heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted with acute heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute heart failure."} ;; "admitted with acute heart failure"
(declare-const patient_has_symptoms_of_fatigue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of fatigue.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of fatigue.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of fatigue.","meaning":"Boolean indicating whether the patient currently has symptoms of fatigue."} ;; "symptoms of fatigue"
(declare-const patient_has_symptoms_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of dyspnea (shortness of breath).","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of dyspnea (shortness of breath).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of dyspnea (shortness of breath).","meaning":"Boolean indicating whether the patient currently has symptoms of dyspnea (shortness of breath)."} ;; "symptoms of shortness of breath"
(declare-const patient_has_symptoms_of_edema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of edema.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of edema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of edema.","meaning":"Boolean indicating whether the patient currently has symptoms of edema."} ;; "symptoms of edema"
(declare-const patient_has_clinical_signs_of_hypervolemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of hypervolemia (volume overload).","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs of hypervolemia (volume overload).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs of hypervolemia (volume overload).","meaning":"Boolean indicating whether the patient currently has clinical signs of hypervolemia (volume overload)."} ;; "physical evidence of volume overload"
(declare-const patient_has_finding_of_pulmonary_edema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary edema.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary edema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pulmonary edema.","meaning":"Boolean indicating whether the patient currently has the clinical finding of pulmonary edema."} ;; "pulmonary edema"
(declare-const patient_has_finding_of_pulmonary_edema_now@@shown_by_chest_radiograph Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pulmonary edema is shown by chest radiograph.","when_to_set_to_false":"Set to false if the patient's pulmonary edema is not shown by chest radiograph.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pulmonary edema is shown by chest radiograph.","meaning":"Boolean indicating whether the patient's pulmonary edema is shown by chest radiograph."} ;; "pulmonary edema shown by chest radiograph"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_pulmonary_edema_now@@shown_by_chest_radiograph
         patient_has_finding_of_pulmonary_edema_now)
     :named REQ1_AUXILIARY0)) ;; "pulmonary edema shown by chest radiograph" implies "pulmonary edema"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be admitted with acute heart failure determined by (at least one of the following: symptoms of fatigue OR symptoms of shortness of breath OR symptoms of edema OR physical evidence of volume overload OR pulmonary edema shown by chest radiograph).
(assert
  (! (and patient_has_diagnosis_of_acute_heart_failure_now
          (or patient_has_symptoms_of_fatigue_now
              patient_has_symptoms_of_dyspnea_now
              patient_has_symptoms_of_edema_now
              patient_has_clinical_signs_of_hypervolemia_now
              patient_has_finding_of_pulmonary_edema_now@@shown_by_chest_radiograph))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "acute heart failure determined by (at least one of: fatigue, shortness of breath, edema, volume overload, pulmonary edema shown by chest radiograph)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_inthepast1months_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if the patient's left ventricular ejection fraction was measured by echocardiogram within 1 month prior to screening.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent value of the patient's left ventricular ejection fraction measured by echocardiogram within 1 month prior to screening."} ;; "left ventricular ejection fraction greater than or equal to 40 percent on a recent echocardiogram (performed less than or equal to 1 month prior to screening) OR ... on a recent multigated acquisition scan (performed less than or equal to 1 month prior to screening)"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_inthepast1months_withunit_percent@@measured_by_echocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the left ventricular ejection fraction measurement within 1 month prior to screening was performed by echocardiogram.","when_to_set_to_false":"Set to false if the measurement was not performed by echocardiogram.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was performed by echocardiogram.","meaning":"Boolean indicating whether the left ventricular ejection fraction measurement within 1 month prior to screening was performed by echocardiogram."} ;; "measured by echocardiogram"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_inthepast1months_withunit_percent@@measured_by_multigated_acquisition_scan Bool) ;; {"when_to_set_to_true":"Set to true if the left ventricular ejection fraction measurement within 1 month prior to screening was performed by multigated acquisition scan.","when_to_set_to_false":"Set to false if the measurement was not performed by multigated acquisition scan.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was performed by multigated acquisition scan.","meaning":"Boolean indicating whether the left ventricular ejection fraction measurement within 1 month prior to screening was performed by multigated acquisition scan."} ;; "measured by multigated acquisition scan"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply that a measurement exists
(assert
  (! (=> patient_left_ventricular_ejection_fraction_value_recorded_inthepast1months_withunit_percent@@measured_by_echocardiogram
         true)
     :named REQ2_AUXILIARY0)) ;; "measurement by echocardiogram implies measurement exists"

(assert
  (! (=> patient_left_ventricular_ejection_fraction_value_recorded_inthepast1months_withunit_percent@@measured_by_multigated_acquisition_scan
         true)
     :named REQ2_AUXILIARY1)) ;; "measurement by multigated acquisition scan implies measurement exists"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have (left ventricular ejection fraction >= 40% on a recent echocardiogram (<= 1 month prior to screening) OR left ventricular ejection fraction >= 40% on a recent multigated acquisition scan (<= 1 month prior to screening)).
(assert
  (! (or
        (and patient_left_ventricular_ejection_fraction_value_recorded_inthepast1months_withunit_percent@@measured_by_echocardiogram
             (>= patient_left_ventricular_ejection_fraction_value_recorded_inthepast1months_withunit_percent 40.0))
        (and patient_left_ventricular_ejection_fraction_value_recorded_inthepast1months_withunit_percent@@measured_by_multigated_acquisition_scan
             (>= patient_left_ventricular_ejection_fraction_value_recorded_inthepast1months_withunit_percent 40.0))
     )
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "left ventricular ejection fraction >= 40% on recent echocardiogram or multigated acquisition scan (<= 1 month prior to screening)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_nyha_class_iii_on_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient has New York Heart Association class III present on admission.","when_to_set_to_false":"Set to false if the patient does not have New York Heart Association class III present on admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has New York Heart Association class III present on admission.","meaning":"Boolean indicating whether the patient has New York Heart Association class III present on admission."} ;; "New York Heart Association class III on admission"
(declare-const patient_has_nyha_class_iv_on_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient has New York Heart Association class IV present on admission.","when_to_set_to_false":"Set to false if the patient does not have New York Heart Association class IV present on admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has New York Heart Association class IV present on admission.","meaning":"Boolean indicating whether the patient has New York Heart Association class IV present on admission."} ;; "New York Heart Association class IV on admission"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (or patient_has_nyha_class_iii_on_admission
         patient_has_nyha_class_iv_on_admission)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (New York Heart Association class III on admission OR New York Heart Association class IV on admission)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patients_systolic_blood_pressure_value_recorded_baseline_in_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's baseline systolic blood pressure in millimeters of mercury.","when_to_set_to_null":"Set to null if the patient's baseline systolic blood pressure value in millimeters of mercury is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's baseline systolic blood pressure in millimeters of mercury."} ;; "baseline systolic blood pressure greater than 90 millimeters of mercury"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (> patients_systolic_blood_pressure_value_recorded_baseline_in_millimeters_of_mercury 90.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "baseline systolic blood pressure greater than 90 millimeters of mercury"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_brain_natriuretic_peptide_measurement_value_recorded_inthehistory_withunit_picograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a B-type (brain) natriuretic peptide (BNP) measurement in picograms per milliliter is available from the patient's history (including baseline).","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's B-type (brain) natriuretic peptide (BNP) measurement in picograms per milliliter, recorded at some point in the patient's history."} ;; "baseline B-type natriuretic peptide level greater than 100 picograms per milliliter"
(declare-const patient_brain_natriuretic_peptide_measurement_value_recorded_inthehistory_withunit_picograms_per_milliliter@@measured_at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the BNP measurement was taken at baseline.","when_to_set_to_false":"Set to false if the BNP measurement was not taken at baseline.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the BNP measurement was taken at baseline.","meaning":"Indicates whether the BNP measurement was specifically taken at baseline."} ;; "baseline B-type natriuretic peptide level"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (and patient_brain_natriuretic_peptide_measurement_value_recorded_inthehistory_withunit_picograms_per_milliliter@@measured_at_baseline
          (> patient_brain_natriuretic_peptide_measurement_value_recorded_inthehistory_withunit_picograms_per_milliliter 100.0))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have baseline B-type natriuretic peptide level greater than 100 picograms per milliliter."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_able_to_sign_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to sign informed consent.","when_to_set_to_false":"Set to false if the patient is currently not able to sign informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to sign informed consent.","meaning":"Boolean indicating whether the patient is currently able to sign informed consent."} ;; "the patient must be able to sign informed consent"
(declare-const patient_is_able_to_return_for_follow_up_assessments Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to return for follow-up assessments as required by the study.","when_to_set_to_false":"Set to false if the patient is not able to return for follow-up assessments as required by the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to return for follow-up assessments as required by the study.","meaning":"Boolean indicating whether the patient is able to return for follow-up assessments as required by the study."} ;; "the patient must be able to return for follow-up assessments"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: The patient must be able to sign informed consent.
(assert
  (! patient_is_able_to_sign_informed_consent_now
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to sign informed consent"

;; Component 1: The patient must be able to return for follow-up assessments.
(assert
  (! patient_is_able_to_return_for_follow_up_assessments
     :named REQ6_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be able to return for follow-up assessments"
