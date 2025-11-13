;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_intolerance_to_angiotensin_converting_enzyme_inhibitor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intolerance to angiotensin converting enzyme inhibitor drugs.","when_to_set_to_false":"Set to false if the patient currently does not have intolerance to angiotensin converting enzyme inhibitor drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intolerance to angiotensin converting enzyme inhibitor drugs.","meaning":"Boolean indicating whether the patient currently has intolerance to angiotensin converting enzyme inhibitor drugs."} ;; "the patient has intolerance of angiotensin converting enzyme inhibitor drugs"

(declare-const patient_has_intolerance_to_angiotensin_ii_receptor_antagonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intolerance to angiotensin II receptor antagonist containing products.","when_to_set_to_false":"Set to false if the patient currently does not have intolerance to angiotensin II receptor antagonist containing products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intolerance to angiotensin II receptor antagonist containing products.","meaning":"Boolean indicating whether the patient currently has intolerance to angiotensin II receptor antagonist containing products."} ;; "the patient has intolerance of angiotensin receptor blocker drugs"

(declare-const patient_has_allergy_to_angiotensin_converting_enzyme_inhibitor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has allergy to angiotensin converting enzyme inhibitor drugs.","when_to_set_to_false":"Set to false if the patient currently does not have allergy to angiotensin converting enzyme inhibitor drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has allergy to angiotensin converting enzyme inhibitor drugs.","meaning":"Boolean indicating whether the patient currently has allergy to angiotensin converting enzyme inhibitor drugs."} ;; "the patient has allergy to angiotensin converting enzyme inhibitor drugs"

(declare-const patient_has_allergy_to_angiotensin_ii_receptor_antagonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has allergy to angiotensin II receptor antagonist containing products.","when_to_set_to_false":"Set to false if the patient currently does not have allergy to angiotensin II receptor antagonist containing products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has allergy to angiotensin II receptor antagonist containing products.","meaning":"Boolean indicating whether the patient currently has allergy to angiotensin II receptor antagonist containing products."} ;; "the patient has allergy to angiotensin receptor blocker drugs"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_intolerance_to_angiotensin_converting_enzyme_inhibitor_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intolerance of angiotensin converting enzyme inhibitor drugs."

(assert
(! (not patient_has_intolerance_to_angiotensin_ii_receptor_antagonist_containing_product_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intolerance of angiotensin receptor blocker drugs."

(assert
(! (not patient_has_allergy_to_angiotensin_converting_enzyme_inhibitor_now)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to angiotensin converting enzyme inhibitor drugs."

(assert
(! (not patient_has_allergy_to_angiotensin_ii_receptor_antagonist_containing_product_now)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to angiotensin receptor blocker drugs."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding as documented or reported.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
(assert
  (! (not patient_is_breastfeeding_now)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breastfeeding."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pre-menopausal and has the potential for childbearing.","when_to_set_to_false":"Set to false if the patient is currently post-menopausal or otherwise lacks childbearing potential.","when_to_set_to_null":"Set to null if the patient's menopausal status or childbearing potential is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has the potential for childbearing (i.e., is pre-menopausal)."} ;; "pre-menopausal woman"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "pre-menopausal woman"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a pre-menopausal woman."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "cardiac failure"
(declare-const patient_has_finding_of_heart_failure_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's heart failure is uncontrolled.","when_to_set_to_false":"Set to false if the patient's heart failure is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart failure is uncontrolled.","meaning":"Boolean indicating whether the patient's heart failure is uncontrolled."} ;; "uncontrolled cardiac failure"
(declare-const patient_has_finding_of_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal failure syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal failure syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of renal failure syndrome.","meaning":"Boolean indicating whether the patient currently has renal failure syndrome."} ;; "renal failure"
(declare-const patient_has_finding_of_renal_failure_syndrome_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal failure syndrome is uncontrolled.","when_to_set_to_false":"Set to false if the patient's renal failure syndrome is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's renal failure syndrome is uncontrolled.","meaning":"Boolean indicating whether the patient's renal failure syndrome is uncontrolled."} ;; "uncontrolled renal failure"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_heart_failure_now@@uncontrolled
      patient_has_finding_of_heart_failure_now)
    :named REQ3_AUXILIARY0)) ;; "uncontrolled cardiac failure"

(assert
(! (=> patient_has_finding_of_renal_failure_syndrome_now@@uncontrolled
      patient_has_finding_of_renal_failure_syndrome_now)
    :named REQ3_AUXILIARY1)) ;; "uncontrolled renal failure"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_heart_failure_now@@uncontrolled)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled cardiac failure."

(assert
(! (not patient_has_finding_of_renal_failure_syndrome_now@@uncontrolled)
    :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled renal failure."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes mellitus"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_diabetes_mellitus_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes mellitus."
