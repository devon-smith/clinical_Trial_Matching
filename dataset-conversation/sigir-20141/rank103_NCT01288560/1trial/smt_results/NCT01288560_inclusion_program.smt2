;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "age > 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age > 18 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented diagnosis of coronary artery disease (coronary arteriosclerosis).","when_to_set_to_false":"Set to false if the patient currently does not have a documented diagnosis of coronary artery disease (coronary arteriosclerosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of coronary artery disease (coronary arteriosclerosis).","meaning":"Boolean indicating whether the patient currently has a diagnosis of coronary artery disease (coronary arteriosclerosis)."} ;; "known coronary artery disease"
(declare-const patient_has_suspicion_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a highly suspected diagnosis of coronary artery disease (coronary arteriosclerosis), as documented by specified evidence.","when_to_set_to_false":"Set to false if the patient currently does not have a highly suspected diagnosis of coronary artery disease (coronary arteriosclerosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a highly suspected diagnosis of coronary artery disease (coronary arteriosclerosis).","meaning":"Boolean indicating whether the patient currently has a clinical suspicion of coronary artery disease (coronary arteriosclerosis)."} ;; "highly suspected coronary artery disease"
(declare-const patient_has_undergone_coronary_angiography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary angiography at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone coronary angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary angiography.","meaning":"Boolean indicating whether the patient has ever undergone coronary angiography."} ;; "coronary angiography"
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a myocardial infarction at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a myocardial infarction."} ;; "history of previous myocardial infarction"
(declare-const patient_has_finding_of_myocardial_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of myocardial ischemia.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of myocardial ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of myocardial ischemia.","meaning":"Boolean indicating whether the patient currently has evidence of myocardial ischemia."} ;; "evidence of moderate myocardial ischemia"
(declare-const patient_has_finding_of_myocardial_scar_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has evidence of myocardial scar based on prior imaging at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have evidence of myocardial scar based on prior imaging at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has evidence of myocardial scar based on prior imaging at any time in the past.","meaning":"Boolean indicating whether the patient has evidence of myocardial scar based on prior imaging at any time in the past."} ;; "evidence of myocardial scar based on prior imaging"
(declare-const patient_has_undergone_imaging_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone imaging at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone imaging.","meaning":"Boolean indicating whether the patient has ever undergone imaging at any time in the past."} ;; "prior imaging"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: Highly suspected coronary artery disease is documented by any of the following:
(assert
  (! (= patient_has_suspicion_of_coronary_arteriosclerosis_now
        (or patient_has_undergone_coronary_angiography_inthehistory
            patient_has_finding_of_myocardial_infarction_inthehistory
            patient_has_finding_of_myocardial_ischemia_now
            patient_has_finding_of_myocardial_scar_inthehistory))
     :named REQ1_AUXILIARY0)) ;; "highly suspected coronary artery disease documented by (coronary angiography OR history of previous myocardial infarction OR evidence of moderate myocardial ischemia OR evidence of myocardial scar based on prior imaging)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have (known coronary artery disease) OR (highly suspected coronary artery disease documented by ...)
(assert
  (! (or patient_has_diagnosis_of_coronary_arteriosclerosis_now
         patient_has_suspicion_of_coronary_arteriosclerosis_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (known coronary artery disease) OR (highly suspected coronary artery disease documented by ...)"

;; ===================== Declarations for the inclusion criteria (REQ 2) =====================
(declare-const patient_has_finding_of_left_ventricular_cardiac_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of left ventricular cardiac dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of left ventricular cardiac dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left ventricular cardiac dysfunction.","meaning":"Boolean indicating whether the patient currently has left ventricular cardiac dysfunction."} ;; "left ventricular dysfunction"
(declare-const patient_has_finding_of_left_ventricular_cardiac_dysfunction_now@@most_likely_attributable_to_ischemic_heart_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left ventricular cardiac dysfunction is most likely attributable to ischemic heart disease.","when_to_set_to_false":"Set to false if the patient's left ventricular cardiac dysfunction is not most likely attributable to ischemic heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's left ventricular cardiac dysfunction is most likely attributable to ischemic heart disease.","meaning":"Boolean indicating whether the patient's left ventricular cardiac dysfunction is most likely attributable to ischemic heart disease."} ;; "left ventricular dysfunction most likely attributable to ischemic heart disease"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_inthepast6months_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if a left ventricular ejection fraction measurement is available within the past 6 months.","when_to_set_to_null":"Set to null if no such measurement within the past 6 months is available or the value is indeterminate.","meaning":"Numeric percent value representing the patient's left ventricular ejection fraction measured within the past 6 months."} ;; "left ventricular ejection fraction < 45% measured by any acceptable means within the previous 6 months"
(declare-const patient_has_finding_of_new_york_heart_association_class_ii_symptoms_within_the_past_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has New York Heart Association class II symptoms that occurred within the past 12 months.","when_to_set_to_false":"Set to false if the patient does not have New York Heart Association class II symptoms that occurred within the past 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has New York Heart Association class II symptoms that occurred within the past 12 months.","meaning":"Boolean indicating whether the patient has New York Heart Association class II symptoms that occurred within the past 12 months."} ;; "New York Heart Association class II symptoms within the past 12 months"
(declare-const patient_has_finding_of_new_york_heart_association_class_iii_symptoms_within_the_past_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has New York Heart Association class III symptoms that occurred within the past 12 months.","when_to_set_to_false":"Set to false if the patient does not have New York Heart Association class III symptoms that occurred within the past 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has New York Heart Association class III symptoms that occurred within the past 12 months.","meaning":"Boolean indicating whether the patient has New York Heart Association class III symptoms that occurred within the past 12 months."} ;; "New York Heart Association class III symptoms within the past 12 months"
(declare-const patient_has_finding_of_new_york_heart_association_class_iv_symptoms_within_the_past_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has New York Heart Association class IV symptoms that occurred within the past 12 months.","when_to_set_to_false":"Set to false if the patient does not have New York Heart Association class IV symptoms that occurred within the past 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has New York Heart Association class IV symptoms that occurred within the past 12 months.","meaning":"Boolean indicating whether the patient has New York Heart Association class IV symptoms that occurred within the past 12 months."} ;; "New York Heart Association class IV symptoms within the past 12 months"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for left ventricular dysfunction implies the stem variable
(assert
  (! (=> patient_has_finding_of_left_ventricular_cardiac_dysfunction_now@@most_likely_attributable_to_ischemic_heart_disease
         patient_has_finding_of_left_ventricular_cardiac_dysfunction_now)
     :named REQ2_AUXILIARY0)) ;; "left ventricular dysfunction most likely attributable to ischemic heart disease" implies "left ventricular dysfunction"

;; Non-exhaustive examples for ejection fraction measurement methods (echocardiography, nuclear radionuclide angiography, positron emission tomography perfusion, single-photon emission computed tomography perfusion, angiography, cardiac magnetic resonance imaging) are not encoded as they are only examples and do not restrict the umbrella (any acceptable means).

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: left ventricular dysfunction most likely attributable to ischemic heart disease
(assert
  (! patient_has_finding_of_left_ventricular_cardiac_dysfunction_now@@most_likely_attributable_to_ischemic_heart_disease
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "left ventricular dysfunction most likely attributable to ischemic heart disease"

;; Component 1: left ventricular ejection fraction < 45% measured by any acceptable means within the previous 6 months
(assert
  (! (< patient_left_ventricular_ejection_fraction_value_recorded_inthepast6months_withunit_percent 45.0)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "left ventricular ejection fraction < 45% measured by any acceptable means within the previous 6 months"

;; Component 2: NYHA class II, III, or IV symptoms within the past 12 months (at least one)
(assert
  (! (or patient_has_finding_of_new_york_heart_association_class_ii_symptoms_within_the_past_12_months
         patient_has_finding_of_new_york_heart_association_class_iii_symptoms_within_the_past_12_months
         patient_has_finding_of_new_york_heart_association_class_iv_symptoms_within_the_past_12_months)
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "NYHA class II, III, or IV symptoms within the past 12 months"

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
;; "To be included, the patient must have (left ventricular dysfunction most likely attributable to ischemic heart disease)"
;; Variable already declared in reusable_variables
;; (declare-const patient_has_finding_of_left_ventricular_cardiac_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of left ventricular cardiac dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of left ventricular cardiac dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left ventricular cardiac dysfunction.","meaning":"Boolean indicating whether the patient currently has left ventricular cardiac dysfunction."} ;; "left ventricular dysfunction"
;; (declare-const patient_has_finding_of_left_ventricular_cardiac_dysfunction_now@@most_likely_attributable_to_ischemic_heart_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left ventricular cardiac dysfunction is most likely attributable to ischemic heart disease.","when_to_set_to_false":"Set to false if the patient's left ventricular cardiac dysfunction is not most likely attributable to ischemic heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's left ventricular cardiac dysfunction is most likely attributable to ischemic heart disease.","meaning":"Boolean indicating whether the patient's left ventricular cardiac dysfunction is most likely attributable to ischemic heart disease."} ;; "left ventricular dysfunction most likely attributable to ischemic heart disease"

;; "To be included, the patient must have (left ventricular ejection fraction ≤ 30% measured by any acceptable means (with non-exhaustive examples (echocardiography, nuclear radionuclide angiography, positron emission tomography perfusion, single-photon emission computed tomography perfusion, angiography, cardiac magnetic resonance imaging)) within the previous 6 months)."
;; Variable already declared in reusable_variables
;; (declare-const patient_left_ventricular_ejection_fraction_value_recorded_inthepast6months_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if a left ventricular ejection fraction measurement is available within the past 6 months.","when_to_set_to_null":"Set to null if no such measurement within the past 6 months is available or the value is indeterminate.","meaning":"Numeric percent value representing the patient's left ventricular ejection fraction measured within the past 6 months."} ;; "left ventricular ejection fraction < 45% measured by any acceptable means within the previous 6 months"

;; "To be included, the patient must have (New York Heart Association class I symptoms within the past 12 months)."
(declare-const patient_has_finding_of_new_york_heart_association_class_i_symptoms_in_the_past_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had New York Heart Association class I symptoms within the past 12 months.","when_to_set_to_false":"Set to false if the patient has not had New York Heart Association class I symptoms within the past 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had New York Heart Association class I symptoms within the past 12 months.","meaning":"Boolean indicating whether the patient has had New York Heart Association class I symptoms within the past 12 months."} ;; "New York Heart Association class I symptoms within the past 12 months"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable for left ventricular dysfunction
(assert
  (! (=> patient_has_finding_of_left_ventricular_cardiac_dysfunction_now@@most_likely_attributable_to_ischemic_heart_disease
         patient_has_finding_of_left_ventricular_cardiac_dysfunction_now)
     :named REQ3_AUXILIARY0)) ;; "left ventricular dysfunction most likely attributable to ischemic heart disease"

;; Non-exhaustive examples for "measured by any acceptable means" (echocardiography, nuclear radionuclide angiography, positron emission tomography perfusion, single-photon emission computed tomography perfusion, angiography, cardiac magnetic resonance imaging)
;; No umbrella variable is present, so no auxiliary assertion is needed for the measurement modality.

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: left ventricular dysfunction most likely attributable to ischemic heart disease
(assert
  (! patient_has_finding_of_left_ventricular_cardiac_dysfunction_now@@most_likely_attributable_to_ischemic_heart_disease
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "left ventricular dysfunction most likely attributable to ischemic heart disease"

;; Component 1: left ventricular ejection fraction ≤ 30% measured by any acceptable means within the previous 6 months
(assert
  (! (<= patient_left_ventricular_ejection_fraction_value_recorded_inthepast6months_withunit_percent 30.0)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "left ventricular ejection fraction ≤ 30% measured by any acceptable means within the previous 6 months"

;; Component 2: New York Heart Association class I symptoms within the past 12 months
(assert
  (! patient_has_finding_of_new_york_heart_association_class_i_symptoms_in_the_past_12_months
     :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "New York Heart Association class I symptoms within the past 12 months"
