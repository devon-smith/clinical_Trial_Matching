;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_fit_and_well_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently fit and well (a healthy subject).","when_to_set_to_false":"Set to false if the patient is currently not fit and well (not a healthy subject).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently fit and well.","meaning":"Boolean indicating whether the patient is currently fit and well (a healthy subject)."}  ;; "a healthy subject"
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."}  ;; "aged ≥ 3 months AND aged ≤ 5 months"
(declare-const patient_has_finding_of_average_intellect_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has average intellect (normal intelligence).","when_to_set_to_false":"Set to false if the patient currently does not have average intellect (does not have normal intelligence).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has average intellect.","meaning":"Boolean indicating whether the patient currently has average intellect (normal intelligence)."}  ;; "normal intelligence"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be a healthy subject.
(assert
  (! patient_has_finding_of_fit_and_well_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a healthy subject."

;; Component 1: The patient must be aged ≥ 3 months.
(assert
  (! (>= patient_age_value_recorded_now_in_months 3)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 3 months."

;; Component 2: The patient must be aged ≤ 5 months.
(assert
  (! (<= patient_age_value_recorded_now_in_months 5)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 5 months."

;; Component 3: The patient must have normal intelligence.
(assert
  (! patient_has_finding_of_average_intellect_now
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have normal intelligence."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_guardian_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a guardian.","when_to_set_to_false":"Set to false if the patient currently does not have a guardian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a guardian.","meaning":"Boolean indicating whether the patient currently has a guardian."}  ;; "the patient must have a guardian"
(declare-const patient_has_guardian_now@@guardian_able_to_understand_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current guardian is able to understand the informed consent.","when_to_set_to_false":"Set to false if the patient's current guardian is not able to understand the informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current guardian is able to understand the informed consent.","meaning":"Boolean indicating whether the patient's current guardian is able to understand the informed consent."}  ;; "guardian (who is able to understand the informed consent)"
(declare-const patient_has_guardian_now@@guardian_able_to_sign_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current guardian is able to sign the informed consent.","when_to_set_to_false":"Set to false if the patient's current guardian is not able to sign the informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current guardian is able to sign the informed consent.","meaning":"Boolean indicating whether the patient's current guardian is able to sign the informed consent."}  ;; "guardian (who is able to sign the informed consent)"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply the patient has a guardian
(assert
  (! (=> patient_has_guardian_now@@guardian_able_to_understand_informed_consent_now
         patient_has_guardian_now)
     :named REQ1_AUXILIARY0)) ;; If the guardian is able to understand informed consent, the patient must have a guardian

(assert
  (! (=> patient_has_guardian_now@@guardian_able_to_sign_informed_consent_now
         patient_has_guardian_now)
     :named REQ1_AUXILIARY1)) ;; If the guardian is able to sign informed consent, the patient must have a guardian

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must have a guardian who is able to understand the informed consent
(assert
  (! patient_has_guardian_now@@guardian_able_to_understand_informed_consent_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a guardian (who is able to understand the informed consent)"

;; Component 1: The patient must have a guardian who is able to sign the informed consent
(assert
  (! patient_has_guardian_now@@guardian_able_to_sign_informed_consent_now
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient must have a guardian (who is able to sign the informed consent)"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_clinical_decision_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a clinical decision now.","when_to_set_to_false":"Set to false if the patient has not undergone a clinical decision now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a clinical decision now.","meaning":"Boolean indicating whether the patient has undergone a clinical decision now."}  ;; "clinical decision"
(declare-const patient_has_undergone_medical_history_questioning_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone medical history questioning now.","when_to_set_to_false":"Set to false if the patient has not undergone medical history questioning now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone medical history questioning now.","meaning":"Boolean indicating whether the patient has undergone medical history questioning now."}  ;; "medical history questioning"
(declare-const patient_has_undergone_physical_examination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a physical examination now.","when_to_set_to_false":"Set to false if the patient has not undergone a physical examination now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a physical examination now.","meaning":"Boolean indicating whether the patient has undergone a physical examination now."}  ;; "physical examination"
(declare-const patient_meets_vaccination_requirements_of_investigational_vaccine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets the vaccination requirements of the investigational vaccine now.","when_to_set_to_false":"Set to false if the patient does not meet the vaccination requirements of the investigational vaccine now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets the vaccination requirements of the investigational vaccine now.","meaning":"Boolean indicating whether the patient meets the vaccination requirements of the investigational vaccine now."}  ;; "be in accordance with vaccination requirements of the investigational vaccine"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; "healthy as confirmed by (medical history questioning AND physical examination AND clinical decision)" defines fit and well
(assert
  (! (= patient_has_finding_of_fit_and_well_now
        (and patient_has_undergone_medical_history_questioning_now
             patient_has_undergone_physical_examination_now
             patient_has_undergone_clinical_decision_now))
     :named REQ2_AUXILIARY0)) ;; "healthy as confirmed by (medical history questioning AND physical examination AND clinical decision)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: patient must be healthy as confirmed by all three
(assert
  (! patient_has_finding_of_fit_and_well_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be healthy as confirmed by (medical history questioning AND physical examination AND clinical decision)"

;; Component 1: patient must meet vaccination requirements of the investigational vaccine
(assert
  (! patient_meets_vaccination_requirements_of_investigational_vaccine_now
     :named REQ2_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be in accordance with vaccination requirements of the investigational vaccine"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_able_to_comply_with_clinical_trial_program_requirements_according_to_researchers_views Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to comply with the requirements of the clinical trial program according to the researcher's views.","when_to_set_to_false":"Set to false if the patient is not able to comply with the requirements of the clinical trial program according to the researcher's views.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to comply with the requirements of the clinical trial program according to the researcher's views.","meaning":"Boolean indicating whether the patient is able to comply with the requirements of the clinical trial program, as judged according to the researcher's views."}  ;; "the patient must be able to comply with the requirements of the clinical trial program according to the researcher's views"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_able_to_comply_with_clinical_trial_program_requirements_according_to_researchers_views
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be able to comply with the requirements of the clinical trial program according to the researcher's views"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_received_group_a_polysaccharide_meningococcal_vaccine_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received group A polysaccharide meningococcal vaccine at any time prior to inclusion.","when_to_set_to_false":"Set to false if the patient has never received group A polysaccharide meningococcal vaccine at any time prior to inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received group A polysaccharide meningococcal vaccine prior to inclusion.","meaning":"Boolean indicating whether the patient has ever received group A polysaccharide meningococcal vaccine at any time prior to inclusion."}  ;; "NOT have ever received group A polysaccharide meningococcal vaccine"
(declare-const patient_has_received_group_c_polysaccharide_meningococcal_vaccine_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received group C polysaccharide meningococcal vaccine at any time prior to inclusion.","when_to_set_to_false":"Set to false if the patient has never received group C polysaccharide meningococcal vaccine at any time prior to inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received group C polysaccharide meningococcal vaccine prior to inclusion.","meaning":"Boolean indicating whether the patient has ever received group C polysaccharide meningococcal vaccine at any time prior to inclusion."}  ;; "NOT have ever received group C polysaccharide meningococcal vaccine"
(declare-const patient_has_received_type_b_haemophilus_influenzal_vaccine_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received type b haemophilus influenzal vaccine at any time prior to inclusion.","when_to_set_to_false":"Set to false if the patient has never received type b haemophilus influenzal vaccine at any time prior to inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received type b haemophilus influenzal vaccine prior to inclusion.","meaning":"Boolean indicating whether the patient has ever received type b haemophilus influenzal vaccine at any time prior to inclusion."}  ;; "NOT have ever received type b haemophilus influenzal vaccine"

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient must NOT have ever received group A polysaccharide meningococcal vaccine AND NOT have ever received group C polysaccharide meningococcal vaccine AND NOT have ever received type b haemophilus influenzal vaccine.
(assert
  (! (and (not patient_has_received_group_a_polysaccharide_meningococcal_vaccine_ever)
          (not patient_has_received_group_c_polysaccharide_meningococcal_vaccine_ever)
          (not patient_has_received_type_b_haemophilus_influenzal_vaccine_ever))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_body_temperature_value_recorded_now_withunit_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body temperature is recorded now in degrees Celsius.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body temperature in degrees Celsius."}  ;; "temperature ≤ 37°C on axillary setting"
(declare-const patient_body_temperature_value_recorded_now_withunit_celsius@@measured_on_axillary_setting Bool) ;; {"when_to_set_to_true":"Set to true if the patient's body temperature measurement was taken on the axillary setting.","when_to_set_to_false":"Set to false if the patient's body temperature measurement was not taken on the axillary setting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken on the axillary setting.","meaning":"Boolean indicating whether the patient's body temperature measurement was taken on the axillary setting."}  ;; "temperature ≤ 37°C on axillary setting"

;; ===================== Constraint Assertions (REQ 5) =====================
;; The patient must have a temperature ≤ 37°C on axillary setting.
(assert
  (! (and patient_body_temperature_value_recorded_now_withunit_celsius@@measured_on_axillary_setting
          (<= patient_body_temperature_value_recorded_now_withunit_celsius 37.0))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS))
