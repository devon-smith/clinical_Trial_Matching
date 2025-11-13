;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_injury_of_abdomen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of injury of the abdomen (abdominal trauma).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of injury of the abdomen (abdominal trauma).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of injury of the abdomen (abdominal trauma).","meaning":"Boolean indicating whether the patient currently has injury of the abdomen (abdominal trauma)."} ;; "abdominal trauma"
(declare-const patient_has_finding_of_injury_of_abdomen_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current injury of the abdomen (abdominal trauma) is acute.","when_to_set_to_false":"Set to false if the patient's current injury of the abdomen (abdominal trauma) is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current injury of the abdomen (abdominal trauma) is acute.","meaning":"Boolean indicating whether the patient's current injury of the abdomen (abdominal trauma) is acute."} ;; "acute abdominal trauma"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_injury_of_abdomen_now@@acute
       patient_has_finding_of_injury_of_abdomen_now)
   :named REQ1_AUXILIARY0)) ;; "acute abdominal trauma"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_injury_of_abdomen_now@@acute)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute abdominal trauma."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_allergy_to_iodinated_contrast_media_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to iodinated contrast media.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to iodinated contrast media.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to iodinated contrast media.","meaning":"Boolean indicating whether the patient currently has an allergy to iodinated contrast media."} ;; "The patient is excluded if the patient has an allergy to iodinated contrast media."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_allergy_to_iodinated_contrast_media_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to iodinated contrast media."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_renal_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal insufficiency.","meaning":"Boolean indicating whether the patient currently has renal insufficiency."} ;; "renal insufficiency"
(declare-const patient_has_finding_of_renal_insufficiency_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current renal insufficiency is severe.","when_to_set_to_false":"Set to false if the patient's current renal insufficiency is not severe (i.e., mild or moderate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current renal insufficiency is severe.","meaning":"Boolean indicating whether the patient's current renal insufficiency is severe."} ;; "severe renal insufficiency"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_renal_insufficiency_now@@severity_severe
       patient_has_finding_of_renal_insufficiency_now)
   :named REQ3_AUXILIARY0)) ;; "severe renal insufficiency" implies "renal insufficiency"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_renal_insufficiency_now@@severity_severe)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe renal insufficiency."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_taking_metformin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a metformin-containing medication.","when_to_set_to_false":"Set to false if the patient is currently not taking any metformin-containing medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a metformin-containing medication.","meaning":"Boolean indicating whether the patient is currently taking a metformin-containing medication."} ;; "the patient is taking metformin medication"
(declare-const patient_has_undergone_plasma_creatinine_measurement_now_outcome_is_abnormal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a plasma creatinine measurement now and the outcome is abnormal (elevated).","when_to_set_to_false":"Set to false if the patient has undergone a plasma creatinine measurement now and the outcome is not abnormal (not elevated).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a plasma creatinine measurement now with an abnormal outcome.","meaning":"Boolean indicating whether the patient has undergone a plasma creatinine measurement now and the outcome is abnormal (elevated)."} ;; "the patient has an elevated plasma creatinine level"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_is_taking_metformin_containing_product_now
             patient_has_undergone_plasma_creatinine_measurement_now_outcome_is_abnormal))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is taking metformin medication) AND (the patient has an elevated plasma creatinine level)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const informed_consent_possible_now Bool) ;; {"when_to_set_to_true":"Set to true if it is currently possible to obtain informed consent from the patient.","when_to_set_to_false":"Set to false if it is currently not possible to obtain informed consent from the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether it is currently possible to obtain informed consent from the patient.","meaning":"Boolean indicating whether it is currently possible to obtain informed consent from the patient."} ;; "informed consent is not possible"
(declare-const patient_lacks_cooperation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently lacks cooperation.","when_to_set_to_false":"Set to false if the patient currently does not lack cooperation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently lacks cooperation.","meaning":"Boolean indicating whether the patient currently lacks cooperation."} ;; "patient lacks cooperation"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and patient_lacks_cooperation_now (not informed_consent_possible_now)))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient lacks cooperation such that informed consent is not possible."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_abdominal_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abdominal pain.","when_to_set_to_false":"Set to false if the patient currently does not have abdominal pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abdominal pain.","meaning":"Boolean indicating whether the patient currently has abdominal pain."} ;; "abdominal pain"
(declare-const patient_has_finding_of_hemorrhagic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hemorrhagic shock.","when_to_set_to_false":"Set to false if the patient currently does not have hemorrhagic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hemorrhagic shock.","meaning":"Boolean indicating whether the patient currently has hemorrhagic shock."} ;; "bleeding shock"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not (and patient_has_finding_of_abdominal_pain_now
               patient_has_finding_of_hemorrhagic_shock_now))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has abdominal pain) AND (the patient has bleeding shock)."
