;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_dyspnea_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had dyspnea (shortness of breath) within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not had dyspnea within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had dyspnea within the past 24 hours.","meaning":"Boolean indicating whether the patient has had dyspnea within the past 24 hours."} // "signs or symptoms of dyspnea (such as shortness of breath...) within the last 24 hours"
(declare-const patient_has_finding_of_hyperventilation_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had hyperventilation within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not had hyperventilation within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had hyperventilation within the past 24 hours.","meaning":"Boolean indicating whether the patient has had hyperventilation within the past 24 hours."} // "signs or symptoms of dyspnea (such as ... hyperventilation...) within the last 24 hours"
(declare-const patient_has_finding_of_tachypnea_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had tachypnea within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not had tachypnea within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had tachypnea within the past 24 hours.","meaning":"Boolean indicating whether the patient has had tachypnea within the past 24 hours."} // "signs or symptoms of dyspnea (such as ... tachypnea...) within the last 24 hours"
(declare-const patient_presented_to_emergency_department_with_signs_or_symptoms_of_dyspnea_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient presented to the Emergency Department with signs or symptoms of dyspnea (such as shortness of breath, tachypnea, hyperventilation, etc.) within the past 24 hours.","when_to_set_to_false":"Set to false if the patient did not present to the Emergency Department with signs or symptoms of dyspnea within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient presented to the Emergency Department with signs or symptoms of dyspnea within the past 24 hours.","meaning":"Boolean indicating whether the patient presented to the Emergency Department with signs or symptoms of dyspnea within the past 24 hours."} // "presented to the Emergency Department with signs or symptoms of dyspnea ... within the last 24 hours"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples: shortness of breath, tachypnea, hyperventilation, etc. are examples of dyspnea
(assert
  (! (=> (or patient_has_finding_of_tachypnea_inthepast24hours
            patient_has_finding_of_hyperventilation_inthepast24hours)
         patient_has_finding_of_dyspnea_inthepast24hours)
     :named REQ0_AUXILIARY0)) ;; "such as shortness of breath, tachypnea, hyperventilation, etc." are examples of dyspnea

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must have presented to the Emergency Department with signs or symptoms of dyspnea within the last 24 hours
(assert
  (! patient_presented_to_emergency_department_with_signs_or_symptoms_of_dyspnea_inthepast24hours
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "presented to the Emergency Department with signs or symptoms of dyspnea ... within the last 24 hours"

;; Component 1: Patient must have signs or symptoms of dyspnea at the time of presentation (within the last 24 hours)
(assert
  (! patient_has_finding_of_dyspnea_inthepast24hours
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "signs or symptoms of dyspnea ... within the last 24 hours"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patients_cardiac_output_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiac output is normal at the present time.","when_to_set_to_false":"Set to false if the patient's cardiac output is not normal at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiac output is normal at the present time.","meaning":"Boolean indicating whether the patient's cardiac output is normal now."} // "the patient must have normal cardiac output"
(declare-const patients_cardiac_output_is_normal_now@@measured_by_noninvasive_bioimpedance Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiac output normal status is determined by measurement using noninvasive bioimpedance.","when_to_set_to_false":"Set to false if the patient's cardiac output normal status is not determined by measurement using noninvasive bioimpedance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether noninvasive bioimpedance was used to measure cardiac output normal status.","meaning":"Boolean indicating whether the patient's cardiac output normal status is measured by noninvasive bioimpedance."} // "as measured by noninvasive bioimpedance"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patients_cardiac_output_is_normal_now@@measured_by_noninvasive_bioimpedance
         patients_cardiac_output_is_normal_now)
     :named REQ1_AUXILIARY0)) ;; "as measured by noninvasive bioimpedance" implies "normal cardiac output"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (and patients_cardiac_output_is_normal_now
          patients_cardiac_output_is_normal_now@@measured_by_noninvasive_bioimpedance)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have normal cardiac output as measured by noninvasive bioimpedance"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged greater than or equal to 18 years"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged greater than or equal to 18 years."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_or_legal_representative_is_able_to_comply_with_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient or the legal representative is able to comply with study procedures.","when_to_set_to_false":"Set to false if the patient or the legal representative is not able to comply with study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient or the legal representative is able to comply with study procedures.","meaning":"Boolean indicating whether the patient or the legal representative is able to comply with study procedures."} // "able to comply with study procedures"
(declare-const patient_or_legal_representative_is_able_to_provide_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient or the legal representative is able to provide informed consent.","when_to_set_to_false":"Set to false if the patient or the legal representative is not able to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient or the legal representative is able to provide informed consent.","meaning":"Boolean indicating whether the patient or the legal representative is able to provide informed consent."} // "able to provide informed consent"
(declare-const patient_or_legal_representative_is_willing_to_comply_with_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient or the legal representative is willing to comply with study procedures.","when_to_set_to_false":"Set to false if the patient or the legal representative is not willing to comply with study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient or the legal representative is willing to comply with study procedures.","meaning":"Boolean indicating whether the patient or the legal representative is willing to comply with study procedures."} // "willing to comply with study procedures"
(declare-const patient_or_legal_representative_is_willing_to_provide_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient or the legal representative is willing to provide informed consent.","when_to_set_to_false":"Set to false if the patient or the legal representative is not willing to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient or the legal representative is willing to provide informed consent.","meaning":"Boolean indicating whether the patient or the legal representative is willing to provide informed consent."} // "willing to provide informed consent"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (and patient_or_legal_representative_is_willing_to_provide_informed_consent
          patient_or_legal_representative_is_able_to_provide_informed_consent
          patient_or_legal_representative_is_willing_to_comply_with_study_procedures
          patient_or_legal_representative_is_able_to_comply_with_study_procedures)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient or the legal representative of the patient must be willing AND able to provide informed consent AND willing AND able to comply with study procedures"
