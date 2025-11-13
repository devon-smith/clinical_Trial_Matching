;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently known not to be breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
(assert
  (! (not patient_is_breastfeeding_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breastfeeding."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_blood_coagulation_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a blood coagulation disorder (bleeding disorder) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a blood coagulation disorder (bleeding disorder) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a blood coagulation disorder (bleeding disorder).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of blood coagulation disorder (bleeding disorder) in their history."} ;; "bleeding disorder"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_blood_coagulation_disorder_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of bleeding disorder."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_chronic_liver_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have chronic liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic liver disease.","meaning":"Boolean indicating whether the patient currently has chronic liver disease."} ;; "chronic liver disease"
(declare-const patient_has_finding_of_chronic_liver_disease_now@@is_underlying_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic liver disease is considered an underlying disease.","when_to_set_to_false":"Set to false if the patient's chronic liver disease is not considered an underlying disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic liver disease is considered an underlying disease.","meaning":"Boolean indicating whether the patient's chronic liver disease is considered an underlying disease."} ;; "chronic liver disease is considered an underlying disease"
(declare-const patient_has_finding_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus."} ;; "diabetes mellitus"
(declare-const patient_has_finding_of_diabetes_mellitus_now@@is_underlying_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diabetes mellitus is considered an underlying disease.","when_to_set_to_false":"Set to false if the patient's diabetes mellitus is not considered an underlying disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diabetes mellitus is considered an underlying disease.","meaning":"Boolean indicating whether the patient's diabetes mellitus is considered an underlying disease."} ;; "diabetes mellitus is considered an underlying disease"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term (chronic liver disease ⇒ underlying disease)
(assert
(! (=> patient_has_finding_of_chronic_liver_disease_now@@is_underlying_disease
      patient_has_finding_of_chronic_liver_disease_now)
   :named REQ2_AUXILIARY0)) ;; "chronic liver disease is considered an underlying disease"

;; Non-exhaustive examples imply umbrella term (diabetes mellitus ⇒ underlying disease)
(assert
(! (=> patient_has_finding_of_diabetes_mellitus_now@@is_underlying_disease
      patient_has_finding_of_diabetes_mellitus_now)
   :named REQ2_AUXILIARY1)) ;; "diabetes mellitus is considered an underlying disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_chronic_liver_disease_now@@is_underlying_disease)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has underlying disease with non-exhaustive examples (chronic liver disease)."

(assert
(! (not patient_has_finding_of_diabetes_mellitus_now@@is_underlying_disease)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has underlying disease with non-exhaustive examples (diabetes mellitus)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_diuretic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to diuretic substances.","when_to_set_to_false":"Set to false if the patient is currently not exposed to diuretic substances.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to diuretic substances.","meaning":"Boolean indicating whether the patient is currently exposed to diuretic substances."} ;; "diuretic"
(declare-const patient_is_exposed_to_glucocorticoid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to glucocorticoid substances.","when_to_set_to_false":"Set to false if the patient is currently not exposed to glucocorticoid substances.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to glucocorticoid substances.","meaning":"Boolean indicating whether the patient is currently exposed to glucocorticoid substances."} ;; "glucocorticoid"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_is_exposed_to_diuretic_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient received diuretic."

(assert
  (! (not patient_is_exposed_to_glucocorticoid_now)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient received glucocorticoid."
