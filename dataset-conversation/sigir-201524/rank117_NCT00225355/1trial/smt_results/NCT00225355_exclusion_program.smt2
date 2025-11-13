;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes mellitus"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_diagnosis_of_diabetes_mellitus_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const alanine_aminotransferase_value_recorded_now_withunit_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current alanine aminotransferase (ALT) level in units per liter.","when_to_set_to_null":"Set to null if the patient's current alanine aminotransferase (ALT) level is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current alanine aminotransferase (ALT) level in units per liter."} ;; "alanine aminotransferase > 70 units per liter"
(declare-const aspartate_aminotransferase_value_recorded_now_withunit_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current aspartate aminotransferase (AST) level in units per liter.","when_to_set_to_null":"Set to null if the patient's current aspartate aminotransferase (AST) level is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current aspartate aminotransferase (AST) level in units per liter."} ;; "aspartate aminotransferase > 80 units per liter"
(declare-const patient_has_finding_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hepatic failure (liver failure).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hepatic failure (liver failure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic failure (liver failure).","meaning":"Boolean indicating whether the patient currently has hepatic failure (liver failure)."} ;; "liver failure"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: liver failure is defined as (ALT > 70) OR (AST > 80)
(assert
(! (= patient_has_finding_of_hepatic_failure_now
     (or (> alanine_aminotransferase_value_recorded_now_withunit_units_per_liter 70)
         (> aspartate_aminotransferase_value_recorded_now_withunit_units_per_liter 80)))
   :named REQ1_AUXILIARY0)) ;; "liver failure, defined as ((alanine aminotransferase > 70 units per liter) OR (aspartate aminotransferase > 80 units per liter))"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_hepatic_failure_now)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has liver failure, defined as ((alanine aminotransferase > 70 units per liter) OR (aspartate aminotransferase > 80 units per liter)))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const creatinine_value_recorded_now_withunit_millimoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's most recent creatinine measurement, in millimoles per liter, if available.","when_to_set_to_null":"Set to null if the patient's most recent creatinine measurement in millimoles per liter is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's most recent creatinine measurement, in millimoles per liter."} ;; "creatinine > 130 millimoles per liter"
(declare-const patient_has_finding_of_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal failure syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal failure syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal failure syndrome.","meaning":"Boolean indicating whether the patient currently has renal failure syndrome."} ;; "renal failure"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition in the requirement: renal failure = creatinine > 130 mmol/l
(assert
(! (= patient_has_finding_of_renal_failure_syndrome_now
     (> creatinine_value_recorded_now_withunit_millimoles_per_liter 130))
:named REQ2_AUXILIARY0)) ;; "defined as (creatinine > 130 millimoles per liter)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_renal_failure_syndrome_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal failure, defined as (creatinine > 130 millimoles per liter)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "cardiac failure"
(declare-const patient_has_finding_of_heart_failure_now@@nyha_class_3 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart failure is New York Heart Association class 3.","when_to_set_to_false":"Set to false if the patient's current heart failure is not New York Heart Association class 3.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart failure is New York Heart Association class 3.","meaning":"Boolean indicating whether the patient's current heart failure is New York Heart Association class 3."} ;; "New York Heart Association class 3 cardiac failure"
(declare-const patient_has_finding_of_heart_failure_now@@nyha_class_4 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart failure is New York Heart Association class 4.","when_to_set_to_false":"Set to false if the patient's current heart failure is not New York Heart Association class 4.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart failure is New York Heart Association class 4.","meaning":"Boolean indicating whether the patient's current heart failure is New York Heart Association class 4."} ;; "New York Heart Association class 4 cardiac failure"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_failure_now@@nyha_class_3
       patient_has_finding_of_heart_failure_now)
   :named REQ3_AUXILIARY0)) ;; "New York Heart Association class 3 cardiac failure"

(assert
(! (=> patient_has_finding_of_heart_failure_now@@nyha_class_4
       patient_has_finding_of_heart_failure_now)
   :named REQ3_AUXILIARY1)) ;; "New York Heart Association class 4 cardiac failure"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_has_finding_of_heart_failure_now@@nyha_class_3
            patient_has_finding_of_heart_failure_now@@nyha_class_4))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has New York Heart Association class 3 cardiac failure) OR (the patient has New York Heart Association class 4 cardiac failure))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_physical_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a physical disability.","when_to_set_to_false":"Set to false if the patient currently does not have a physical disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a physical disability.","meaning":"Boolean indicating whether the patient currently has a physical disability."} ;; "physical disability"
(declare-const patient_has_finding_of_physical_disability_now@@precludes_treadmill_testing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current physical disability precludes treadmill testing.","when_to_set_to_false":"Set to false if the patient's current physical disability does not preclude treadmill testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current physical disability precludes treadmill testing.","meaning":"Boolean indicating whether the patient's current physical disability precludes treadmill testing."} ;; "physical disability that precludes treadmill testing"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_physical_disability_now@@precludes_treadmill_testing
      patient_has_finding_of_physical_disability_now)
:named REQ4_AUXILIARY0)) ;; "physical disability that precludes treadmill testing"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_physical_disability_now@@precludes_treadmill_testing)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a physical disability that precludes treadmill testing."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of childbearing (e.g., premenopausal, not sterilized, and not otherwise incapable of pregnancy).","when_to_set_to_false":"Set to false if the patient is currently incapable of childbearing (e.g., postmenopausal, sterilized, or otherwise incapable of pregnancy).","when_to_set_to_null":"Set to null if the patient's childbearing potential is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient currently has the potential for childbearing."} ;; "childbearing capacity"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as male or other at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient's sex is female at the current time."} ;; "woman"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient is a woman with childbearing capacity."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_mother_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a mother (i.e., has given birth to at least one child and is alive as a mother at the present time).","when_to_set_to_false":"Set to false if the patient is currently not a mother (i.e., has never given birth or is not considered a mother at the present time).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a mother.","meaning":"Boolean indicating whether the patient is currently a mother."} ;; "the patient is a mother"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently documented as not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breastfeeding.","meaning":"Boolean indicating whether the patient is currently breastfeeding."} ;; "breastfeeding"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Equate the two breastfeeding variables (if both are present, they should be equivalent)
(assert
(! (= patient_is_breastfeeding_now patients_breastfeeding_is_positive_now)
:named REQ6_AUXILIARY0)) ;; "the patient is breastfeeding"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT be both a mother AND breastfeeding
(assert
(! (not (and patient_is_mother_now patient_is_breastfeeding_now))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is a mother) AND (the patient is breastfeeding))."
