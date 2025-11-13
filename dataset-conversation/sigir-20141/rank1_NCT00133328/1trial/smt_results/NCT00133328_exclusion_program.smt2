;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_severe_renal_damage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe renal damage.","when_to_set_to_false":"Set to false if the patient currently does not have severe renal damage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe renal damage.","meaning":"Boolean indicating whether the patient currently has severe renal damage."} ;; "The patient is excluded if the patient has severe renal damage."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_severe_renal_damage_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe renal damage."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_liver_damage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of liver damage.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of liver damage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of liver damage.","meaning":"Boolean indicating whether the patient currently has liver damage."} ;; "liver damage"
(declare-const patient_has_finding_of_liver_damage_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has liver damage and the liver damage is severe.","when_to_set_to_false":"Set to false if the patient currently has liver damage but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the liver damage is severe.","meaning":"Boolean indicating whether the patient's current liver damage is severe."} ;; "severe liver damage"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_liver_damage_now@@severity_severe
      patient_has_finding_of_liver_damage_now)
:named REQ2_AUXILIARY0)) ;; "severe liver damage" implies "liver damage"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_liver_damage_now@@severity_severe)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe liver damage."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_acute_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute myocardial infarction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute myocardial infarction."} ;; "acute myocardial infarction"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_acute_myocardial_infarction_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute myocardial infarction."
