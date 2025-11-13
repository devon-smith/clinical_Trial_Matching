;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_asthma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or confirmed diagnosis of asthma at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has no documented or confirmed diagnosis of asthma in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of asthma.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of asthma in their medical history."} ;; "has a known history of asthma"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_asthma_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known history of asthma."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const gestational_age_value_recorded_now_in_weeks Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's gestational age in weeks as recorded at the current time.","when_to_set_to_null":"Set to null if the patient's gestational age in weeks is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value indicating the patient's gestational age in weeks, as recorded at the current time."} ;; "gestational age ≥ 20 weeks"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (and patient_is_pregnant_now
               (>= gestational_age_value_recorded_now_in_weeks 20)))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant AND the patient has gestational age ≥ 20 weeks."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_injury_of_thoracic_cavity_inthepast72hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an injury of the thoracic cavity (thoracic trauma) within the past 72 hours.","when_to_set_to_false":"Set to false if the patient has not had an injury of the thoracic cavity (thoracic trauma) within the past 72 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an injury of the thoracic cavity (thoracic trauma) within the past 72 hours.","meaning":"Boolean indicating whether the patient has had an injury of the thoracic cavity (thoracic trauma) within the past 72 hours."} ;; "thoracic trauma in the past 72 hours"
(declare-const patient_has_finding_of_injury_of_abdomen_inthepast72hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an injury of the abdomen (abdominal trauma) within the past 72 hours.","when_to_set_to_false":"Set to false if the patient has not had an injury of the abdomen (abdominal trauma) within the past 72 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an injury of the abdomen (abdominal trauma) within the past 72 hours.","meaning":"Boolean indicating whether the patient has had an injury of the abdomen (abdominal trauma) within the past 72 hours."} ;; "abdominal trauma in the past 72 hours"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_injury_of_thoracic_cavity_inthepast72hours)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had thoracic trauma in the past 72 hours."

(assert
(! (not patient_has_finding_of_injury_of_abdomen_inthepast72hours)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had abdominal trauma in the past 72 hours."
