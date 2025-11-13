;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_carcinomatosis_of_peritoneal_cavity_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the measured peritoneal carcinomatosis index value if recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's peritoneal carcinomatosis index measured now."} ;; "peritoneal carcinomatosis index"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (> patient_carcinomatosis_of_peritoneal_cavity_value_recorded_now_withunit_none 10))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a peritoneal carcinomatosis index > 10."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_systemic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has systemic disease.","when_to_set_to_false":"Set to false if the patient currently does not have systemic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has systemic disease.","meaning":"Boolean indicating whether the patient currently has systemic disease."} ;; "systemic disease"
(declare-const patient_has_finding_of_systemic_disease_now@@extraperitoneal Bool) ;; {"when_to_set_to_true":"Set to true if the patient's systemic disease is extraperitoneal.","when_to_set_to_false":"Set to false if the patient's systemic disease is not extraperitoneal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's systemic disease is extraperitoneal.","meaning":"Boolean indicating whether the patient's systemic disease is extraperitoneal."} ;; "extraperitoneal disease"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_incarcerated_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently incarcerated.","when_to_set_to_false":"Set to false if the patient is currently not incarcerated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently incarcerated.","meaning":"Boolean value indicating whether the patient is currently incarcerated."} ;; "the patient is incarcerated"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_systemic_disease_now@@extraperitoneal
       patient_has_finding_of_systemic_disease_now)
   :named REQ1_AUXILIARY0)) ;; "extraperitoneal disease" implies "systemic disease"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have systemic disease (extraperitoneal), be pregnant, or be incarcerated
(assert
(! (not patient_has_finding_of_systemic_disease_now@@extraperitoneal)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has systemic disease (extraperitoneal disease)."

(assert
(! (not patient_is_pregnant_now)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_incarcerated_now)
   :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is incarcerated."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
;; "the patient is pregnant"
;; Already declared in previous SMT program:
;; (declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating as determined by clinical assessment or self-report.","when_to_set_to_false":"Set to false if the patient is currently not lactating as determined by clinical assessment or self-report.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

(declare-const patient_is_woman_of_reproductive_age_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a woman of reproductive age as determined by clinical or demographic criteria.","when_to_set_to_false":"Set to false if the patient is currently not a woman of reproductive age as determined by clinical or demographic criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a woman of reproductive age.","meaning":"Boolean indicating whether the patient is currently a woman of reproductive age."} ;; "the patient is a woman of reproductive age"

(declare-const patient_is_willing_to_use_contraception_during_study_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to use contraception during study therapy as determined by self-report or documentation.","when_to_set_to_false":"Set to false if the patient is currently not willing to use contraception during study therapy as determined by self-report or documentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to use contraception during study therapy.","meaning":"Boolean indicating whether the patient is currently willing to use contraception during study therapy."} ;; "not willing to use contraception during study therapy"

(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is a woman of reproductive age"

(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} ;; "the patient is a woman of reproductive age"

(declare-const patients_lactation_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently lactating.","meaning":"Boolean indicating whether the patient is currently lactating."} ;; "lactating"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for "woman of reproductive age" is defined by sex and age (not specified in requirement, but variable provided)
(assert
(! (=> patient_is_woman_of_reproductive_age_now
      (and patient_sex_is_female_now
           (>= patient_age_value_recorded_now_in_years 12)
           (<= patient_age_value_recorded_now_in_years 50)))
:named REQ2_AUXILIARY0)) ;; "the patient is a woman of reproductive age" (assumed reproductive age: 12-50 years, as per clinical convention)

;; Qualifier variable for lactation status
(assert
(! (= patient_is_lactating_now patients_lactation_is_positive_now)
:named REQ2_AUXILIARY1)) ;; "the patient is lactating" = "patients_lactation_is_positive_now"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient is pregnant
(assert
(! (not patient_is_pregnant_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; Exclusion: patient is lactating
(assert
(! (not patient_is_lactating_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

;; Exclusion: patient is a woman of reproductive age AND NOT willing to use contraception during study therapy
(assert
(! (not (and patient_is_woman_of_reproductive_age_now
             (not patient_is_willing_to_use_contraception_during_study_therapy_now)))
:named REQ2_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient is a woman of reproductive age) AND (the patient is NOT willing to use contraception during study therapy)."
