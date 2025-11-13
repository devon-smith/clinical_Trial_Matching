;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_allergy_to_nicardipine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of allergy to nicardipine.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of allergy to nicardipine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of allergy to nicardipine.","meaning":"Boolean indicating whether the patient currently has an allergy to nicardipine."} ;; "allergy to nicardipine"
(declare-const patient_has_finding_of_hypersensitivity_to_nicardipine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of hypersensitivity to nicardipine.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of hypersensitivity to nicardipine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of hypersensitivity to nicardipine.","meaning":"Boolean indicating whether the patient currently has hypersensitivity to nicardipine."} ;; "hypersensitivity to nicardipine"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_allergy_to_nicardipine_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to nicardipine."

(assert
(! (not patient_has_finding_of_hypersensitivity_to_nicardipine_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a hypersensitivity to nicardipine."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_chronic_renal_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic renal failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic renal failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic renal failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic renal failure."} ;; "chronic renal failure"
(declare-const patient_creatinine_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a current blood creatinine measurement in mg/dL is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current blood creatinine level in mg/dL."} ;; "creatinine blood sample levels > 2.0 mg/dL"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (or patient_has_diagnosis_of_chronic_renal_failure_now
              (> patient_creatinine_value_recorded_now_withunit_mg_per_dl 2.0)))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has chronic renal failure) OR (the patient has creatinine blood sample levels > 2.0 mg/dL)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_decreased_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impaired hepatic function (decreased liver function).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impaired hepatic function (decreased liver function).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired hepatic function (decreased liver function).","meaning":"Boolean indicating whether the patient currently has impaired hepatic function (decreased liver function)."} ;; "impaired hepatic function"

(declare-const patient_liver_enzyme_levels_finding_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's liver enzyme levels recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current liver enzyme levels."} ;; "liver enzyme levels"

(declare-const patient_liver_enzyme_upper_limit_of_normal_value_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the reference value if the upper limit of normal for liver enzyme levels is available for the patient at the current time, in the specified unit.","when_to_set_to_null":"Set to null if no such reference value is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current upper limit of normal for liver enzyme levels."} ;; "upper limit of normal for liver enzyme levels"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: impaired hepatic function = liver enzyme levels > 2 × upper limit of normal
(assert
(! (= patient_has_finding_of_decreased_liver_function_now
     (> patient_liver_enzyme_levels_finding_value_recorded_now_withunit_unit
        (* 2 patient_liver_enzyme_upper_limit_of_normal_value_now_withunit_unit)))
   :named REQ2_AUXILIARY0)) ;; "defined as liver enzyme levels > 2 times the upper limit of normal"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_decreased_liver_function_now)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has impaired hepatic function (defined as liver enzyme levels > 2 times the upper limit of normal)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a current LVEF measurement is available for the patient.","when_to_set_to_null":"Set to null if no current LVEF measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current left ventricular ejection fraction."} ;; "left ventricular ejection fraction"

(declare-const patient_has_finding_of_left_ventricular_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of left ventricular dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of left ventricular dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of left ventricular dysfunction.","meaning":"Boolean indicating whether the patient currently has left ventricular dysfunction."} ;; "left ventricular dysfunction"

(declare-const patient_has_finding_of_left_ventricular_dysfunction_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of severe left ventricular dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of severe left ventricular dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of severe left ventricular dysfunction.","meaning":"Boolean indicating whether the patient currently has severe left ventricular dysfunction."} ;; "severe left ventricular dysfunction"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: severe left ventricular dysfunction = left ventricular ejection fraction < 30%
(assert
(! (= patient_has_finding_of_left_ventricular_dysfunction_now@@severe
(< patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent 30))
:named REQ3_AUXILIARY0)) ;; "defined as left ventricular ejection fraction < 30%"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_left_ventricular_dysfunction_now@@severe
patient_has_finding_of_left_ventricular_dysfunction_now)
:named REQ3_AUXILIARY1)) ;; "severe left ventricular dysfunction" implies "left ventricular dysfunction"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_left_ventricular_dysfunction_now@@severe)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe left ventricular dysfunction (defined as left ventricular ejection fraction < 30%)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_refuses_enrollment_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient refuses to be enrolled into this study.","when_to_set_to_false":"Set to false if the patient does not refuse to be enrolled into this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient refuses to be enrolled into this study.","meaning":"Boolean indicating whether the patient refuses to be enrolled into this study."} ;; "the patient refuses to be enrolled into this study"
(declare-const authorized_representative_refuses_enrollment_of_patient_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the authorized representative of the patient refuses to enroll the patient into this study.","when_to_set_to_false":"Set to false if the authorized representative of the patient does not refuse to enroll the patient into this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the authorized representative of the patient refuses to enroll the patient into this study.","meaning":"Boolean indicating whether the authorized representative of the patient refuses to enroll the patient into this study."} ;; "the authorized representative of the patient refuses to enroll the patient into this study"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_refuses_enrollment_in_this_study)
:named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient refuses to be enrolled into this study."

(assert
(! (not authorized_representative_refuses_enrollment_of_patient_in_this_study)
:named REQ4_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the authorized representative of the patient refuses to enroll the patient into this study."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_aortic_valve_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of aortic valve stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of aortic valve stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of aortic valve stenosis.","meaning":"Boolean indicating whether the patient currently has a finding or diagnosis of aortic valve stenosis."} ;; "aortic stenosis"
(declare-const patient_has_finding_of_aortic_valve_stenosis_now@@advanced Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has aortic valve stenosis and it is advanced in severity.","when_to_set_to_false":"Set to false if the patient currently has aortic valve stenosis but it is not advanced in severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the aortic valve stenosis is advanced in severity.","meaning":"Boolean indicating whether the patient's current aortic valve stenosis is advanced in severity."} ;; "advanced aortic stenosis"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_aortic_valve_stenosis_now@@advanced
      patient_has_finding_of_aortic_valve_stenosis_now)
    :named REQ5_AUXILIARY0)) ;; "advanced aortic stenosis" implies "aortic stenosis"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_aortic_valve_stenosis_now@@advanced)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has advanced aortic stenosis."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is a woman who is nursing"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (male or other).","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female."} ;; "the patient is a woman who is nursing"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; "the patient is a woman who is nursing" means both female sex and currently breastfeeding
(assert
(! (= patient_is_breastfeeding_now
(and patient_sex_is_female_now patient_is_breastfeeding_now))
:named REQ6_AUXILIARY0)) ;; "the patient is a woman who is nursing"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT be pregnant
(assert
(! (not patient_is_pregnant_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; Exclusion: patient must NOT be a woman who is nursing (i.e., female and currently breastfeeding)
(assert
(! (not (and patient_sex_is_female_now patient_is_breastfeeding_now))
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is nursing."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_already_been_enrolled_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has already been enrolled in this study at any time prior to the current screening.","when_to_set_to_false":"Set to false if the patient has never been enrolled in this study prior to the current screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has already been enrolled in this study prior to the current screening.","meaning":"Boolean indicating whether the patient has already been enrolled in this study at any time prior to the current screening."} ;; "has already been enrolled in this study"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_already_been_enrolled_in_this_study)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has already been enrolled in this study."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_enrolled_in_other_clinical_study_during_involvement_with_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is enrolled in any other clinical study at any time during their involvement with this study.","when_to_set_to_false":"Set to false if the patient is not enrolled in any other clinical study at any time during their involvement with this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is enrolled in any other clinical study during their involvement with this study.","meaning":"Boolean indicating whether the patient is enrolled in any other clinical study at any time during their involvement with this study."} ;; "enrolled in other clinical studies during involvement with this study"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_enrolled_in_other_clinical_study_during_involvement_with_this_study)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is enrolled in other clinical studies during involvement with this study."
