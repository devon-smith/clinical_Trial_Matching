;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_signed_informed_consent_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed an informed consent form.","when_to_set_to_false":"Set to false if the patient has not signed an informed consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed an informed consent form.","meaning":"Boolean indicating whether the patient has signed an informed consent form."} ;; "To be included, the patient must have signed an informed consent form."
(declare-const patient_has_signed_informed_consent_form@@signed_by_patient Bool) ;; {"when_to_set_to_true":"Set to true if the informed consent form is signed by the patient.","when_to_set_to_false":"Set to false if the informed consent form is not signed by the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the informed consent form is signed by the patient.","meaning":"Boolean indicating whether the informed consent form is signed by the patient."} ;; "To be included, the patient must have signed an informed consent form."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_signed_informed_consent_form@@signed_by_patient
         patient_has_signed_informed_consent_form)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have signed an informed consent form."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_signed_informed_consent_form
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have signed an informed consent form."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "age > 18 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age > 18 years)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_acute_abdomen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute abdomen.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute abdomen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute abdomen.","meaning":"Boolean indicating whether the patient currently has acute abdomen."} ;; "To be included, the patient must have (nontraumatic acute abdomen)."
(declare-const patient_has_finding_of_acute_abdomen_now@@nontraumatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute abdomen is nontraumatic.","when_to_set_to_false":"Set to false if the patient's acute abdomen is traumatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acute abdomen is nontraumatic.","meaning":"Boolean indicating whether the patient's acute abdomen is nontraumatic."} ;; "To be included, the patient must have (nontraumatic acute abdomen)."

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_acute_abdomen_now@@nontraumatic
         patient_has_finding_of_acute_abdomen_now)
     :named REQ2_AUXILIARY0)) ;; "To be included, the patient must have (nontraumatic acute abdomen)."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_acute_abdomen_now@@nontraumatic
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (nontraumatic acute abdomen)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_body_weight_value_recorded_now_withunit_kilograms Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body weight in kilograms is recorded now.","when_to_set_to_null":"Set to null if no body weight measurement in kilograms is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current body weight in kilograms."} ;; "body weight < 120 kilograms"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (< patient_body_weight_value_recorded_now_withunit_kilograms 120.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (body weight < 120 kilograms)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_apnea_value_recorded_now_withunit_seconds Real) ;; {"when_to_set_to_value":"Set to the measured number of seconds if a numeric measurement of the maximum duration the patient can maintain apnea (hold their breath) now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value (in seconds) representing the maximum duration the patient can maintain apnea (hold their breath) now."} ;; "To be included, the patient must be able to keep apnoea for 15 seconds."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (>= patient_apnea_value_recorded_now_withunit_seconds 15.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to keep apnoea for 15 seconds."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_considered_fit_for_participation_by_surgeon_in_charge Bool) ;; {"when_to_set_to_true":"Set to true if the surgeon in charge considers the patient fit for participation in the study.","when_to_set_to_false":"Set to false if the surgeon in charge does not consider the patient fit for participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgeon in charge considers the patient fit for participation in the study.","meaning":"Boolean indicating whether the patient is considered fit for participation in the study by the surgeon in charge."} ;; "To be included, the patient must be considered fit for participation in the study by the surgeon in charge."
(declare-const patient_is_considered_fit_for_participation_by_surgeon_in_charge@@surgeon_in_charge Bool) ;; {"when_to_set_to_true":"Set to true if the determination of fitness for participation is made by the surgeon in charge.","when_to_set_to_false":"Set to false if the determination of fitness for participation is not made by the surgeon in charge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the determination of fitness for participation is made by the surgeon in charge.","meaning":"Boolean indicating whether the determination of fitness for participation is made by the surgeon in charge."} ;; "To be included, the patient must be considered fit for participation in the study by the surgeon in charge."

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_considered_fit_for_participation_by_surgeon_in_charge@@surgeon_in_charge
         patient_is_considered_fit_for_participation_by_surgeon_in_charge)
     :named REQ5_AUXILIARY0)) ;; "To be included, the patient must be considered fit for participation in the study by the surgeon in charge."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_is_considered_fit_for_participation_by_surgeon_in_charge@@surgeon_in_charge
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be considered fit for participation in the study by the surgeon in charge."
