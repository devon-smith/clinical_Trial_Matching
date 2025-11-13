;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_head_and_neck_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of squamous cell carcinoma of the head and neck.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of squamous cell carcinoma of the head and neck.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of squamous cell carcinoma of the head and neck.","meaning":"Boolean indicating whether the patient currently has a diagnosis of squamous cell carcinoma of the head and neck."}  ;; "head and neck squamous cell carcinoma"
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_head_and_neck_now@@stage_i Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of squamous cell carcinoma of the head and neck and the cancer is stage I.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of squamous cell carcinoma of the head and neck but the cancer is not stage I.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cancer is stage I.","meaning":"Boolean indicating whether the patient's squamous cell carcinoma of the head and neck is stage I."}  ;; "stage I head and neck squamous cell carcinoma"
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_head_and_neck_now@@stage_ii Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of squamous cell carcinoma of the head and neck and the cancer is stage II.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of squamous cell carcinoma of the head and neck but the cancer is not stage II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cancer is stage II.","meaning":"Boolean indicating whether the patient's squamous cell carcinoma of the head and neck is stage II."}  ;; "stage II head and neck squamous cell carcinoma"

(declare-const patient_has_undergone_surgical_procedure_inthehistory@@definitive_local_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure in the past and the procedure was definitive local treatment.","when_to_set_to_false":"Set to false if the patient has undergone a surgical procedure in the past but the procedure was not definitive local treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure was definitive local treatment.","meaning":"Boolean indicating whether the surgical procedure was definitive local treatment."}  ;; "undergone definitive local treatment with surgery"
(declare-const patient_has_undergone_radiation_therapy_inthehistory@@definitive_local_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone radiation therapy in the past and the therapy was definitive local treatment.","when_to_set_to_false":"Set to false if the patient has undergone radiation therapy in the past but the therapy was not definitive local treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the radiation therapy was definitive local treatment.","meaning":"Boolean indicating whether the radiation therapy was definitive local treatment."}  ;; "undergone definitive local treatment with radiation therapy"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_squamous_cell_carcinoma_of_head_and_neck_now@@stage_i
         patient_has_diagnosis_of_squamous_cell_carcinoma_of_head_and_neck_now)
     :named REQ0_AUXILIARY0)) ;; If stage I qualifier is true, then stem diagnosis must be true

(assert
  (! (=> patient_has_diagnosis_of_squamous_cell_carcinoma_of_head_and_neck_now@@stage_ii
         patient_has_diagnosis_of_squamous_cell_carcinoma_of_head_and_neck_now)
     :named REQ0_AUXILIARY1)) ;; If stage II qualifier is true, then stem diagnosis must be true

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must have stage I or stage II head and neck squamous cell carcinoma
(assert
  (! (or patient_has_diagnosis_of_squamous_cell_carcinoma_of_head_and_neck_now@@stage_i
         patient_has_diagnosis_of_squamous_cell_carcinoma_of_head_and_neck_now@@stage_ii)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have ((stage I head and neck squamous cell carcinoma) OR (stage II head and neck squamous cell carcinoma))."

;; Component 1: Must have undergone definitive local treatment with surgery or radiation therapy
(assert
  (! (or patient_has_undergone_surgical_procedure_inthehistory@@definitive_local_treatment
         patient_has_undergone_radiation_therapy_inthehistory@@definitive_local_treatment)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have ((undergone definitive local treatment with surgery) OR (undergone definitive local treatment with radiation therapy))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const definitive_local_treatment_time_since_received_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient received definitive local treatment prior to trial enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient received definitive local treatment.","meaning":"Numeric value representing the number of months since definitive local treatment was received prior to trial enrollment."} ;; "within 12 months prior to trial enrollment"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (<= definitive_local_treatment_time_since_received_in_months 12.0)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must have received definitive local treatment within 12 months prior to trial enrollment"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."} ;; "cancer"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_residual Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current malignant neoplastic disease (cancer) is residual.","when_to_set_to_false":"Set to false if the patient's current malignant neoplastic disease (cancer) is not residual.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current malignant neoplastic disease (cancer) is residual.","meaning":"Boolean indicating whether the patient's current malignant neoplastic disease (cancer) is residual."} ;; "residual cancer"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for residual cancer implies the patient has cancer
(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_residual
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ2_AUXILIARY0)) ;; "the patient must have no evidence of residual cancer" (qualifier implies stem)

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have no evidence of residual cancer
(assert
  (! (not patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_residual)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have no evidence of residual cancer"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged greater than or equal to 18 years"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged greater than or equal to 18 years."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_performance_status_zubrod_value_now Real) ;; {"when_to_set_to_value":"Set to the patient's current Zubrod performance status value (0, 1, or 2) if documented.","when_to_set_to_null":"Set to null if the patient's current Zubrod performance status is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current Zubrod performance status (ECOG), where 0 = fully active, 1 = restricted in physically strenuous activity but ambulatory, 2 = ambulatory and capable of all selfcare but unable to carry out any work activities."} ;; "performance status of 0, 1, or 2 (Zubrod)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (or (= patient_performance_status_zubrod_value_now 0)
         (= patient_performance_status_zubrod_value_now 1)
         (= patient_performance_status_zubrod_value_now 2))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((performance status of 0 (Zubrod)) OR (performance status of 1 (Zubrod)) OR (performance status of 2 (Zubrod)))."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_contraindication_for_undergoing_bronchoscopy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication for undergoing bronchoscopy.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication for undergoing bronchoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication for undergoing bronchoscopy.","meaning":"Boolean indicating whether the patient currently has a contraindication for undergoing bronchoscopy."} ;; "the patient must NOT have a contraindication for undergoing bronchoscopy"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_contraindication_for_undergoing_bronchoscopy_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must NOT have a contraindication for undergoing bronchoscopy"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_infectious_disease_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an infectious disease of the lung (pulmonary infection).","when_to_set_to_false":"Set to false if the patient currently does not have an infectious disease of the lung (pulmonary infection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an infectious disease of the lung (pulmonary infection).","meaning":"Boolean indicating whether the patient currently has an infectious disease of the lung (pulmonary infection)."} ;; "pulmonary infection"
(declare-const patient_has_finding_of_infectious_disease_of_lung_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current infectious disease of the lung (pulmonary infection) is active.","when_to_set_to_false":"Set to false if the patient's current infectious disease of the lung (pulmonary infection) is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current infectious disease of the lung (pulmonary infection) is active.","meaning":"Boolean indicating whether the patient's current infectious disease of the lung (pulmonary infection) is active."} ;; "active pulmonary infection"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable (active) implies the stem variable (pulmonary infection)
(assert
  (! (=> patient_has_finding_of_infectious_disease_of_lung_now@@active
         patient_has_finding_of_infectious_disease_of_lung_now)
     :named REQ6_AUXILIARY0)) ;; If the patient has an active pulmonary infection, then the patient has a pulmonary infection.

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must NOT have an active pulmonary infection.
(assert
  (! (not patient_has_finding_of_infectious_disease_of_lung_now@@active)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; The patient must NOT have an active pulmonary infection.

;; ===================== Declarations for the inclusion criteria (REQ 7) =====================
(declare-const patient_granulocyte_count_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's total granulocyte count is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's total granulocyte count measured now."}  ;; "total granulocyte count"
(declare-const patient_platelet_count_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's platelet count is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's platelet count measured now."}  ;; "platelet count"
(declare-const patient_bilirubin_total_measurement_value_recorded_now_withunit_mg_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's total bilirubin level is recorded now in mg%.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's total bilirubin level measured now in mg%."}  ;; "total bilirubin level"
(declare-const patient_creatinine_level_finding_value_recorded_now_withunit_mg_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's creatinine level is recorded now in mg%.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's creatinine level measured now in mg%."}  ;; "creatinine level"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: total granulocyte count greater than 1500
(assert
  (! (> patient_granulocyte_count_value_recorded_now_withunit_count 1500)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "total granulocyte count greater than 1500"

;; Component 1: platelet count greater than 100,000
(assert
  (! (> patient_platelet_count_value_recorded_now_withunit_count 100000)
     :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "platelet count greater than 100,000"

;; Component 2: total bilirubin level less than or equal to 1.5 mg%
(assert
  (! (<= patient_bilirubin_total_measurement_value_recorded_now_withunit_mg_percent 1.5)
     :named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "total bilirubin level less than or equal to 1.5 mg%"

;; Component 3: creatinine level less than or equal to 1.5 mg%
(assert
  (! (<= patient_creatinine_level_finding_value_recorded_now_withunit_mg_percent 1.5)
     :named REQ7_COMPONENT3_OTHER_REQUIREMENTS)) ;; "creatinine level less than or equal to 1.5 mg%"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_completed_pretreatment_evaluation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed the pretreatment evaluation now.","when_to_set_to_false":"Set to false if the patient has not completed the pretreatment evaluation now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed the pretreatment evaluation now.","meaning":"Boolean indicating whether the patient has completed the pretreatment evaluation now."} ;; "complete the pretreatment evaluation"
(declare-const patient_has_undergone_bronchoscopy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone bronchoscopy now.","when_to_set_to_false":"Set to false if the patient has not undergone bronchoscopy now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone bronchoscopy now.","meaning":"Boolean indicating whether the patient has undergone bronchoscopy now."} ;; "bronchoscopy"
(declare-const patient_has_undergone_bronchoscopy_now@@consent_obtained Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone bronchoscopy now and consent for the procedure was obtained.","when_to_set_to_false":"Set to false if the patient has undergone bronchoscopy now but consent for the procedure was not obtained.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether consent for bronchoscopy was obtained.","meaning":"Boolean indicating whether consent for bronchoscopy was obtained."} ;; "consent to bronchoscopy"
(declare-const patient_has_undergone_biopsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone biopsy now.","when_to_set_to_false":"Set to false if the patient has not undergone biopsy now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone biopsy now.","meaning":"Boolean indicating whether the patient has undergone biopsy now."} ;; "biopsy"
(declare-const patient_has_undergone_biopsy_now@@consent_obtained Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone biopsy now and consent for the procedure was obtained.","when_to_set_to_false":"Set to false if the patient has undergone biopsy now but consent for the procedure was not obtained.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether consent for biopsy was obtained.","meaning":"Boolean indicating whether consent for biopsy was obtained."} ;; "consent to endobronchial biopsy"
(declare-const patient_has_undergone_biopsy_now@@performed_for_biomarker_studies Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone biopsy now and the procedure was performed for biomarker studies.","when_to_set_to_false":"Set to false if the patient has undergone biopsy now but the procedure was not performed for biomarker studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biopsy was performed for biomarker studies.","meaning":"Boolean indicating whether the biopsy was performed for biomarker studies."} ;; "biopsy for biomarker studies"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable for bronchoscopy implies the procedure was performed
(assert
  (! (=> patient_has_undergone_bronchoscopy_now@@consent_obtained
         patient_has_undergone_bronchoscopy_now)
     :named REQ8_AUXILIARY0)) ;; "consent to bronchoscopy" implies bronchoscopy performed

;; Qualifier variable for biopsy consent implies the procedure was performed
(assert
  (! (=> patient_has_undergone_biopsy_now@@consent_obtained
         patient_has_undergone_biopsy_now)
     :named REQ8_AUXILIARY1)) ;; "consent to biopsy" implies biopsy performed

;; Qualifier variable for biopsy performed for biomarker studies implies the procedure was performed
(assert
  (! (=> patient_has_undergone_biopsy_now@@performed_for_biomarker_studies
         patient_has_undergone_biopsy_now)
     :named REQ8_AUXILIARY2)) ;; "biopsy for biomarker studies" implies biopsy performed

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: patient must complete the pretreatment evaluation
(assert
  (! patient_has_completed_pretreatment_evaluation_now
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "complete the pretreatment evaluation"

;; Component 1: patient must consent to bronchoscopy
(assert
  (! patient_has_undergone_bronchoscopy_now@@consent_obtained
     :named REQ8_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "consent to bronchoscopy"

;; Component 2: patient must consent to endobronchial biopsy for biomarker studies
(assert
  (! (and patient_has_undergone_biopsy_now@@consent_obtained
          patient_has_undergone_biopsy_now@@performed_for_biomarker_studies)
     :named REQ8_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "consent to endobronchial biopsy for biomarker studies"

;; ===================== Declarations for the inclusion criterion (REQ 9) =====================
(declare-const patient_agrees_to_participate_after_receiving_written_and_verbal_explanation_of_study_requirements Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to participate in the study after receiving both a written and verbal explanation of the study requirements.","when_to_set_to_false":"Set to false if the patient does not agree to participate in the study after receiving both a written and verbal explanation of the study requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to participate after receiving both explanations.","meaning":"Boolean indicating whether the patient agrees to participate in the study after receiving both a written and verbal explanation of the study requirements."} ;; "agree to participate after receiving a written and verbal explanation of the study requirements"
(declare-const patient_has_signed_consent_form_prior_to_registration Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed a consent form prior to registration for the study.","when_to_set_to_false":"Set to false if the patient has not signed a consent form prior to registration for the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed a consent form prior to registration.","meaning":"Boolean indicating whether the patient has signed a consent form prior to registration for the study."} ;; "sign a consent form prior to registration"
(declare-const patient_will_undergo_biopsy_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to undergo a biopsy procedure in the future as part of the study.","when_to_set_to_false":"Set to false if the patient is not willing to undergo a biopsy procedure in the future as part of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to undergo a biopsy procedure in the future as part of the study.","meaning":"Boolean indicating whether the patient is willing to undergo a biopsy procedure in the future."} ;; "be willing to undergo biopsy"
(declare-const patient_will_undergo_biopsy_inthefuture@@through_bronchoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to undergo a biopsy procedure in the future and the procedure is to be performed through bronchoscopy.","when_to_set_to_false":"Set to false if the patient is willing to undergo a biopsy procedure in the future but not through bronchoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biopsy procedure is to be performed through bronchoscopy.","meaning":"Boolean indicating whether the patient is willing to undergo a biopsy procedure in the future specifically through bronchoscopy."} ;; "be willing to undergo biopsy through bronchoscopy"
(declare-const patient_will_undergo_collection_of_blood_specimen_for_laboratory_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to undergo collection of blood specimens for laboratory purposes in the future as part of the study.","when_to_set_to_false":"Set to false if the patient is not willing to undergo collection of blood specimens for laboratory purposes in the future as part of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to undergo collection of blood specimens for laboratory purposes in the future as part of the study.","meaning":"Boolean indicating whether the patient is willing to undergo collection of blood specimens for laboratory purposes in the future."} ;; "be willing to give blood samples"
(declare-const patient_will_undergo_collection_of_blood_specimen_for_laboratory_inthefuture@@at_specified_times Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to undergo collection of blood specimens for laboratory purposes in the future at the protocol-specified times.","when_to_set_to_false":"Set to false if the patient is willing to undergo collection of blood specimens for laboratory purposes in the future but not at the protocol-specified times.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the collection will occur at the protocol-specified times.","meaning":"Boolean indicating whether the patient is willing to undergo collection of blood specimens for laboratory purposes in the future at the protocol-specified times."} ;; "be willing to give blood samples at the specified times"
(declare-const patient_will_undergo_follow_up_visit_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to undergo follow-up visits in the future as part of the study.","when_to_set_to_false":"Set to false if the patient is not willing to undergo follow-up visits in the future as part of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to undergo follow-up visits in the future as part of the study.","meaning":"Boolean indicating whether the patient is willing to undergo follow-up visits in the future."} ;; "be willing to schedule and keep the specified follow-up visits"
(declare-const patient_will_undergo_follow_up_visit_inthefuture@@scheduled_and_kept_with_physicians_and_study_clinics Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to undergo follow-up visits in the future and these visits are scheduled and kept with physicians and study clinics.","when_to_set_to_false":"Set to false if the patient is willing to undergo follow-up visits in the future but not specifically scheduled and kept with physicians and study clinics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the visits are scheduled and kept with physicians and study clinics.","meaning":"Boolean indicating whether the patient is willing to undergo follow-up visits in the future specifically scheduled and kept with physicians and study clinics."} ;; "be willing to schedule and keep the specified follow-up visits with physicians and study clinics"
(declare-const patient_is_informed_that_health_risks_may_occur_as_described_in_informed_consent_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient is informed that health risks may occur as described in the informed consent form.","when_to_set_to_false":"Set to false if the patient is not informed that health risks may occur as described in the informed consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is informed that health risks may occur as described in the informed consent form.","meaning":"Boolean indicating whether the patient is informed that health risks may occur as described in the informed consent form."} ;; "be informed that health risks may occur as described in the informed consent form"
(declare-const patient_is_informed_that_side_effects_may_occur_as_described_in_informed_consent_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient is informed that side effects may occur as described in the informed consent form.","when_to_set_to_false":"Set to false if the patient is not informed that side effects may occur as described in the informed consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is informed that side effects may occur as described in the informed consent form.","meaning":"Boolean indicating whether the patient is informed that side effects may occur as described in the informed consent form."} ;; "be informed that side effects may occur as described in the informed consent form"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_will_undergo_biopsy_inthefuture@@through_bronchoscopy
         patient_will_undergo_biopsy_inthefuture)
     :named REQ9_AUXILIARY0)) ;; "be willing to undergo biopsy through bronchoscopy"

(assert
  (! (=> patient_will_undergo_collection_of_blood_specimen_for_laboratory_inthefuture@@at_specified_times
         patient_will_undergo_collection_of_blood_specimen_for_laboratory_inthefuture)
     :named REQ9_AUXILIARY1)) ;; "be willing to give blood samples at the specified times"

(assert
  (! (=> patient_will_undergo_follow_up_visit_inthefuture@@scheduled_and_kept_with_physicians_and_study_clinics
         patient_will_undergo_follow_up_visit_inthefuture)
     :named REQ9_AUXILIARY2)) ;; "be willing to schedule and keep the specified follow-up visits with physicians and study clinics"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! patient_agrees_to_participate_after_receiving_written_and_verbal_explanation_of_study_requirements
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "agree to participate after receiving a written and verbal explanation of the study requirements"

(assert
  (! patient_has_signed_consent_form_prior_to_registration
     :named REQ9_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "sign a consent form prior to registration"

(assert
  (! patient_will_undergo_biopsy_inthefuture@@through_bronchoscopy
     :named REQ9_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be willing to undergo biopsy through bronchoscopy"

(assert
  (! patient_will_undergo_collection_of_blood_specimen_for_laboratory_inthefuture@@at_specified_times
     :named REQ9_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be willing to give blood samples at the specified times"

(assert
  (! patient_will_undergo_follow_up_visit_inthefuture@@scheduled_and_kept_with_physicians_and_study_clinics
     :named REQ9_COMPONENT4_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be willing to schedule and keep the specified follow-up visits with physicians and study clinics"

(assert
  (! (and patient_is_informed_that_side_effects_may_occur_as_described_in_informed_consent_form
          patient_is_informed_that_health_risks_may_occur_as_described_in_informed_consent_form)
     :named REQ9_COMPONENT5_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be informed that side effects and health risks may occur as described in the informed consent form"

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_cigarette_pack_years_value_recorded_inthehistory_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the total number of cigarette pack years if a numeric measurement is available in the patient's history.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the total number of cigarette pack years recorded in the patient's history."} ;; "smoking history of at least 10 pack years"
(declare-const patient_has_finding_of_ex_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a former smoker (not currently smoking but has smoked in the past).","when_to_set_to_false":"Set to false if the patient is not a former smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a former smoker.","meaning":"Boolean indicating whether the patient is a former smoker (not currently smoking but has smoked in the past)."} ;; "former smoker"
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is not currently a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} ;; "current smoker"
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any documented tobacco smoking behavior at any time in their history (current or past).","when_to_set_to_false":"Set to false if the patient has no documented tobacco smoking behavior at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any tobacco smoking behavior in their history.","meaning":"Boolean indicating whether the patient has any documented tobacco smoking behavior at any time in their history."} ;; "smoking history"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Being a current or former smoker implies tobacco smoking behavior in history
(assert
  (! (=> (or patient_has_finding_of_smoker_now
             patient_has_finding_of_ex_smoker_now)
         patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory)
     :named REQ10_AUXILIARY0)) ;; "be a current smoker OR be a former smoker" ⇒ "smoking history"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: Must have a smoking history of at least 10 pack years
(assert
  (! (>= patient_cigarette_pack_years_value_recorded_inthehistory_withunit_pack_years 10.0)
     :named REQ10_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "smoking history of at least 10 pack years"

;; Component 1: Must be a current smoker OR a former smoker
(assert
  (! (or patient_has_finding_of_smoker_now
         patient_has_finding_of_ex_smoker_now)
     :named REQ10_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be a current smoker OR be a former smoker"

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_is_legally_capable_of_providing_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered legally capable of providing consent for participation in the study.","when_to_set_to_false":"Set to false if the patient is currently considered not legally capable of providing consent for participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently considered legally capable of providing consent for participation in the study.","meaning":"Boolean indicating whether the patient is currently considered legally capable of providing consent for participation in the study."} ;; "the patient must be considered legally capable of providing (his consent OR her consent) for participation in this study"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! patient_is_legally_capable_of_providing_consent_now
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be considered legally capable of providing (his consent OR her consent) for participation in this study"

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_can_undergo_laryngoscopy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has no contraindication and can undergo laryngoscopy.","when_to_set_to_false":"Set to false if the patient currently has a contraindication and cannot undergo laryngoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo laryngoscopy.","meaning":"Boolean indicating whether the patient can currently undergo laryngoscopy (i.e., has no contraindication for the procedure at present)."} ;; "the patient must have no contraindication for undergoing laryngoscopy"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
  (! patient_can_undergo_laryngoscopy_now
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have no contraindication for undergoing laryngoscopy"
