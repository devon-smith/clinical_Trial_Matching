;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years at the time of providing informed consent if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years at the time of providing informed consent is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years at the time of providing informed consent."} // "aged ≥ 18 years at the time of providing informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years at the time of providing informed consent."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_or_legal_representative_has_been_informed_of_nature_of_trial Bool) ;; {"when_to_set_to_true":"Set to true if either the patient or the legal representative of the patient has been informed of the nature of the trial.","when_to_set_to_false":"Set to false if neither the patient nor the legal representative of the patient has been informed of the nature of the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient or the legal representative of the patient has been informed of the nature of the trial.","meaning":"Boolean indicating whether the patient or the legal representative of the patient has been informed of the nature of the trial."} // "the patient or the legal representative of the patient must have been informed of the nature of the trial"
(declare-const patient_or_legal_representative_agrees_to_participate Bool) ;; {"when_to_set_to_true":"Set to true if either the patient or the legal representative of the patient agrees to participate in the trial.","when_to_set_to_false":"Set to false if neither the patient nor the legal representative of the patient agrees to participate in the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient or the legal representative of the patient agrees to participate in the trial.","meaning":"Boolean indicating whether the patient or the legal representative of the patient agrees to participate in the trial."} // "the patient or the legal representative of the patient must agree to participate"
(declare-const informed_consent_form_signed_by_patient_or_legal_representative Bool) ;; {"when_to_set_to_true":"Set to true if an informed consent form has been signed by the patient or the legal representative of the patient.","when_to_set_to_false":"Set to false if an informed consent form has not been signed by the patient or the legal representative of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether an informed consent form has been signed by the patient or the legal representative of the patient.","meaning":"Boolean indicating whether an informed consent form has been signed by the patient or the legal representative of the patient."} // "the patient or the legal representative of the patient must have signed an informed consent form"
(declare-const informed_consent_form_signed_by_patient_or_legal_representative@@approved_by_institutional_review_board_or_ethics_committee Bool) ;; {"when_to_set_to_true":"Set to true if the informed consent form signed by the patient or legal representative is approved by an Institutional Review Board or approved by an Ethics Committee.","when_to_set_to_false":"Set to false if the informed consent form signed by the patient or legal representative is not approved by an Institutional Review Board nor approved by an Ethics Committee.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the informed consent form signed by the patient or legal representative is approved by an Institutional Review Board or approved by an Ethics Committee.","meaning":"Boolean indicating whether the informed consent form signed by the patient or legal representative is approved by an Institutional Review Board or approved by an Ethics Committee."} // "approved by an Institutional Review Board OR approved by an Ethics Committee"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> informed_consent_form_signed_by_patient_or_legal_representative@@approved_by_institutional_review_board_or_ethics_committee
         informed_consent_form_signed_by_patient_or_legal_representative)
     :named REQ1_AUXILIARY0)) ;; "approved by an Institutional Review Board OR approved by an Ethics Committee" implies "signed informed consent form"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: patient or legal representative must have been informed of the nature of the trial
(assert
  (! patient_or_legal_representative_has_been_informed_of_nature_of_trial
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must have been informed of the nature of the trial"

;; Component 1: patient or legal representative must agree to participate
(assert
  (! patient_or_legal_representative_agrees_to_participate
     :named REQ1_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must agree to participate"

;; Component 2: patient or legal representative must have signed an informed consent form approved by IRB or Ethics Committee
(assert
  (! informed_consent_form_signed_by_patient_or_legal_representative@@approved_by_institutional_review_board_or_ethics_committee
     :named REQ1_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must have signed an informed consent form approved by an Institutional Review Board OR approved by an Ethics Committee"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_bilateral_kidneys_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has two kidneys (bilateral kidneys).","when_to_set_to_false":"Set to false if the patient currently does not have two kidneys (bilateral kidneys).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bilateral kidneys.","meaning":"Boolean indicating whether the patient currently has bilateral kidneys."} // "have bilateral kidneys"
(declare-const patient_has_solitary_functioning_kidney_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a solitary functioning kidney.","when_to_set_to_false":"Set to false if the patient currently does not have a solitary functioning kidney.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a solitary functioning kidney.","meaning":"Boolean indicating whether the patient currently has a solitary functioning kidney."} // "have a solitary functioning kidney"
(declare-const patient_has_finding_of_renal_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal artery stenosis.","meaning":"Boolean indicating whether the patient currently has renal artery stenosis."} // "renal artery stenosis"
(declare-const patient_has_finding_of_renal_artery_stenosis_now@@present_in_at_least_one_kidney Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal artery stenosis present in at least one kidney.","when_to_set_to_false":"Set to false if the patient currently has renal artery stenosis but it is not present in at least one kidney.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether renal artery stenosis is present in at least one kidney.","meaning":"Boolean indicating whether the patient's renal artery stenosis is present in at least one kidney."} // "renal artery stenosis in ≥ 1 kidney"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured average systolic blood pressure value in mmHg if recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's average systolic blood pressure in mmHg recorded now."} // "average systolic blood pressure ≥ 155 mmHg"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for renal artery stenosis implies stem variable
(assert
  (! (=> patient_has_finding_of_renal_artery_stenosis_now@@present_in_at_least_one_kidney
         patient_has_finding_of_renal_artery_stenosis_now)
     :named REQ2_AUXILIARY0)) ;; "renal artery stenosis in ≥ 1 kidney" implies "renal artery stenosis"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: ((have bilateral kidneys) OR (have a solitary functioning kidney with renal artery stenosis in ≥ 1 kidney))
(assert
  (! (or patient_has_bilateral_kidneys_now
         (and patient_has_solitary_functioning_kidney_now
              patient_has_finding_of_renal_artery_stenosis_now@@present_in_at_least_one_kidney))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "((have bilateral kidneys) OR (have a solitary functioning kidney with renal artery stenosis in ≥ 1 kidney))"

;; Component 1: average systolic blood pressure ≥ 155 mmHg
(assert
  (! (>= patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 155.0)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "average systolic blood pressure ≥ 155 mmHg"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_hypotensive_agent_value_recorded_inthehistory_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of distinct anti-hypertensive medication classes the patient has received at any time in their history.","when_to_set_to_null":"Set to null if the number of distinct anti-hypertensive medication classes received in history is unknown or cannot be determined.","meaning":"Numeric count of distinct anti-hypertensive medication classes received by the patient in their history."} // "anti-hypertensive medication classes"
(declare-const patient_hypotensive_agent_value_recorded_inthehistory_withunit_count@@received_at_maximum_tolerable_dose Bool) ;; {"when_to_set_to_true":"Set to true if the anti-hypertensive medication classes counted were received at the maximum tolerable dose.","when_to_set_to_false":"Set to false if the anti-hypertensive medication classes counted were not received at the maximum tolerable dose.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the anti-hypertensive medication classes were received at the maximum tolerable dose.","meaning":"Boolean indicating whether the counted anti-hypertensive medication classes were received at the maximum tolerable dose."} // "maximum tolerable dose"
(declare-const patient_hypotensive_agent_value_recorded_inthehistory_withunit_count@@received_for_at_least_2_weeks_prior_to_screening_period Bool) ;; {"when_to_set_to_true":"Set to true if the anti-hypertensive medication classes counted were received for at least 2 weeks prior to the medical documentation screening period.","when_to_set_to_false":"Set to false if the anti-hypertensive medication classes counted were not received for at least 2 weeks prior to the medical documentation screening period.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the anti-hypertensive medication classes were received for at least 2 weeks prior to the medical documentation screening period.","meaning":"Boolean indicating whether the counted anti-hypertensive medication classes were received for at least 2 weeks prior to the medical documentation screening period."} // "for ≥ 2 weeks prior to the medical documentation screening period"
(declare-const patient_diuretic_agent_value_recorded_inthehistory_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of distinct diuretic medication classes the patient has received at any time in their history.","when_to_set_to_null":"Set to null if the number of distinct diuretic medication classes received in history is unknown or cannot be determined.","meaning":"Numeric count of distinct diuretic medication classes received by the patient in their history."} // "diuretic medication"
(declare-const patient_diuretic_agent_value_recorded_inthehistory_withunit_count@@received_at_maximum_tolerable_dose Bool) ;; {"when_to_set_to_true":"Set to true if the diuretic medication classes counted were received at the maximum tolerable dose.","when_to_set_to_false":"Set to false if the diuretic medication classes counted were not received at the maximum tolerable dose.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diuretic medication classes were received at the maximum tolerable dose.","meaning":"Boolean indicating whether the counted diuretic medication classes were received at the maximum tolerable dose."} // "maximum tolerable dose (diuretic)"
(declare-const patient_diuretic_agent_value_recorded_inthehistory_withunit_count@@received_for_at_least_2_weeks_prior_to_screening_period Bool) ;; {"when_to_set_to_true":"Set to true if the diuretic medication classes counted were received for at least 2 weeks prior to the medical documentation screening period.","when_to_set_to_false":"Set to false if the diuretic medication classes counted were not received for at least 2 weeks prior to the medical documentation screening period.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diuretic medication classes were received for at least 2 weeks prior to the medical documentation screening period.","meaning":"Boolean indicating whether the counted diuretic medication classes were received for at least 2 weeks prior to the medical documentation screening period."} // "for ≥ 2 weeks prior to the medical documentation screening period (diuretic)"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables (anti-hypertensive)
(assert
  (! (=> patient_hypotensive_agent_value_recorded_inthehistory_withunit_count@@received_at_maximum_tolerable_dose
         (>= patient_hypotensive_agent_value_recorded_inthehistory_withunit_count 0))
     :named REQ3_AUXILIARY0)) ;; "received at maximum tolerable dose"

(assert
  (! (=> patient_hypotensive_agent_value_recorded_inthehistory_withunit_count@@received_for_at_least_2_weeks_prior_to_screening_period
         (>= patient_hypotensive_agent_value_recorded_inthehistory_withunit_count 0))
     :named REQ3_AUXILIARY1)) ;; "received for at least 2 weeks prior to screening period"

;; Qualifier variables imply corresponding stem variables (diuretic)
(assert
  (! (=> patient_diuretic_agent_value_recorded_inthehistory_withunit_count@@received_at_maximum_tolerable_dose
         (>= patient_diuretic_agent_value_recorded_inthehistory_withunit_count 0))
     :named REQ3_AUXILIARY2)) ;; "received at maximum tolerable dose (diuretic)"

(assert
  (! (=> patient_diuretic_agent_value_recorded_inthehistory_withunit_count@@received_for_at_least_2_weeks_prior_to_screening_period
         (>= patient_diuretic_agent_value_recorded_inthehistory_withunit_count 0))
     :named REQ3_AUXILIARY3)) ;; "received for at least 2 weeks prior to screening period (diuretic)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must have a history of receiving the maximum tolerable dose of ≥ 3 anti-hypertensive medication classes (including ≥ 1 diuretic medication) for ≥ 2 weeks prior to the medical documentation screening period.
(assert
  (! (and
        (>= patient_hypotensive_agent_value_recorded_inthehistory_withunit_count 3) ;; "≥ 3 anti-hypertensive medication classes"
        patient_hypotensive_agent_value_recorded_inthehistory_withunit_count@@received_at_maximum_tolerable_dose ;; "maximum tolerable dose"
        patient_hypotensive_agent_value_recorded_inthehistory_withunit_count@@received_for_at_least_2_weeks_prior_to_screening_period ;; "for ≥ 2 weeks prior to the medical documentation screening period"
        (>= patient_diuretic_agent_value_recorded_inthehistory_withunit_count 1) ;; "including ≥ 1 diuretic medication"
        patient_diuretic_agent_value_recorded_inthehistory_withunit_count@@received_at_maximum_tolerable_dose ;; "maximum tolerable dose (diuretic)"
        patient_diuretic_agent_value_recorded_inthehistory_withunit_count@@received_for_at_least_2_weeks_prior_to_screening_period ;; "for ≥ 2 weeks prior to the medical documentation screening period (diuretic)"
     )
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_anti_hypertensive_medication_has_failed_or_not_tolerated_in_history Bool) ;; {"when_to_set_to_true":"Set to true if the anti-hypertensive medications used by the patient have either failed to control hypertension or have not been tolerated, as documented in the history.","when_to_set_to_false":"Set to false if the anti-hypertensive medications used by the patient have not failed and have been tolerated, as documented in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the anti-hypertensive medications used by the patient have either failed or have not been tolerated, as documented in the history.","meaning":"Boolean variable indicating whether the anti-hypertensive medications used by the patient have either failed to control hypertension or have not been tolerated, as documented in the history."} // "including use of a broad variety of anti-hypertensive medications that have been used and failed OR have not been tolerated"
(declare-const patient_anti_hypertensive_medication_variety_value_recorded_in_history_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of distinct anti-hypertensive medications used by the patient as documented in the history.","when_to_set_to_null":"Set to null if the count is unknown, not documented, or cannot be determined.","meaning":"Numeric variable indicating the count of distinct anti-hypertensive medications used by the patient as documented in the history."} // "including use of a broad variety of anti-hypertensive medications"
(declare-const patient_documented_history_of_hypertension_management_duration_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months for which the patient has a documented history of hypertension management prior to providing informed consent.","when_to_set_to_null":"Set to null if the duration is unknown, not documented, or cannot be determined.","meaning":"Numeric variable indicating the duration in months for which the patient has a documented history showing efforts to manage hypertension prior to providing informed consent."} // "documented history for ≥ 3 months"
(declare-const patient_has_diagnosis_of_hypertensive_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypertensive disorder (hypertension) at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypertensive disorder (hypertension) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a documented history of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient has a documented history of hypertensive disorder (hypertension)."} // "showing reasonable and aggressive efforts to manage hypertension"
(declare-const patient_has_reasonable_and_aggressive_efforts_to_manage_hypertension_documented_in_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has reasonable and aggressive efforts documented in the history directed to manage hypertension.","when_to_set_to_false":"Set to false if the patient does not have reasonable and aggressive efforts documented in the history directed to manage hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has reasonable and aggressive efforts documented in the history directed to manage hypertension.","meaning":"Boolean variable indicating whether the patient has reasonable and aggressive efforts documented in the history that are directed to manage hypertension."} // "showing reasonable and aggressive efforts to manage hypertension"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must have a documented history for ≥ 3 months showing reasonable and aggressive efforts to manage hypertension prior to providing informed consent, including use of a broad variety of anti-hypertensive medications that have been used and failed OR have not been tolerated.
(assert
  (! (and
        (>= patient_documented_history_of_hypertension_management_duration_in_months 3.0) ;; "documented history for ≥ 3 months"
        patient_has_diagnosis_of_hypertensive_disorder_inthehistory ;; "showing reasonable and aggressive efforts to manage hypertension"
        patient_has_reasonable_and_aggressive_efforts_to_manage_hypertension_documented_in_history ;; "showing reasonable and aggressive efforts to manage hypertension"
        (>= patient_anti_hypertensive_medication_variety_value_recorded_in_history_withunit_count 1.0) ;; "use of a broad variety of anti-hypertensive medications"
        patient_anti_hypertensive_medication_has_failed_or_not_tolerated_in_history ;; "anti-hypertensive medications that have been used and failed OR have not been tolerated"
     )
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const angiographic_findings_value_recorded_inthehistory_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the percent value if the angiographic findings are documented in the patient's history.","when_to_set_to_null":"Set to null if the percent value of angiographic findings is unknown, not documented, or cannot be determined.","meaning":"Numeric variable indicating the percent value of angiographic findings recorded at any time in the patient's history."} // "angiographic findings > 80 percent"
(declare-const patient_has_documented_clinical_evidence_supporting_likelihood_of_angiographic_findings_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has documented clinical evidence supporting the likelihood of angiographic findings at any time in their history.","when_to_set_to_false":"Set to false if the patient does not have documented clinical evidence supporting the likelihood of angiographic findings at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has documented clinical evidence supporting the likelihood of angiographic findings at any time in their history.","meaning":"Boolean variable indicating whether the patient has documented clinical evidence supporting the likelihood of angiographic findings at any time in their history."} // "documented clinical evidence to support likelihood of angiographic findings"
(declare-const patient_has_documented_clinical_evidence_supporting_likelihood_of_angiographic_findings_inthehistory@@evidence_from_duplex_ultrasonography_or_ct_angiography_or_mr_angiography_or_other_medical_evidence Bool) ;; {"when_to_set_to_true":"Set to true if the documented clinical evidence supporting the likelihood of angiographic findings is from duplex ultrasonography, computed tomography angiography, magnetic resonance angiography, or other medical evidence.","when_to_set_to_false":"Set to false if the documented clinical evidence supporting the likelihood of angiographic findings is not from any of these sources.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the evidence is from these sources.","meaning":"Boolean variable indicating whether the documented clinical evidence supporting the likelihood of angiographic findings is from duplex ultrasonography, computed tomography angiography, magnetic resonance angiography, or other medical evidence."} // "evidence is from duplex ultrasonography OR computed tomography angiography OR magnetic resonance angiography OR other medical evidence"
(declare-const patient_has_undergone_ct_angiography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone computed tomography angiography (CTA) at any time in their history.","when_to_set_to_false":"Set to false if the patient has not undergone computed tomography angiography (CTA) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone computed tomography angiography (CTA) at any time in their history.","meaning":"Boolean indicating whether the patient has undergone computed tomography angiography (CTA) at any time in their history."} // "computed tomography angiography"
(declare-const patient_has_undergone_magnetic_resonance_imaging_mri_of_vessels_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone magnetic resonance angiography (MRA) at any time in their history.","when_to_set_to_false":"Set to false if the patient has not undergone magnetic resonance angiography (MRA) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone magnetic resonance angiography (MRA) at any time in their history.","meaning":"Boolean indicating whether the patient has undergone magnetic resonance angiography (MRA) at any time in their history."} // "magnetic resonance angiography"
(declare-const patient_has_undergone_ultrasonography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone ultrasonography (duplex) at any time in their history.","when_to_set_to_false":"Set to false if the patient has not undergone ultrasonography (duplex) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone ultrasonography (duplex) at any time in their history.","meaning":"Boolean indicating whether the patient has undergone ultrasonography (duplex) at any time in their history."} // "duplex ultrasonography"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_documented_clinical_evidence_supporting_likelihood_of_angiographic_findings_inthehistory@@evidence_from_duplex_ultrasonography_or_ct_angiography_or_mr_angiography_or_other_medical_evidence
         patient_has_documented_clinical_evidence_supporting_likelihood_of_angiographic_findings_inthehistory)
     :named REQ5_AUXILIARY0)) ;; "evidence is from duplex ultrasonography OR computed tomography angiography OR magnetic resonance angiography OR other medical evidence" implies "documented clinical evidence supporting likelihood of angiographic findings"

;; Non-exhaustive examples: undergoing any of the listed procedures implies the qualifier
(assert
  (! (=> (or patient_has_undergone_ultrasonography_inthehistory
             patient_has_undergone_ct_angiography_inthehistory
             patient_has_undergone_magnetic_resonance_imaging_mri_of_vessels_inthehistory)
         patient_has_documented_clinical_evidence_supporting_likelihood_of_angiographic_findings_inthehistory@@evidence_from_duplex_ultrasonography_or_ct_angiography_or_mr_angiography_or_other_medical_evidence)
     :named REQ5_AUXILIARY1)) ;; "duplex ultrasonography OR computed tomography angiography OR magnetic resonance angiography" are non-exhaustive examples for the qualifier

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: Must have documented clinical evidence supporting likelihood of angiographic findings > 80%, with evidence from the specified sources
(assert
  (! (and patient_has_documented_clinical_evidence_supporting_likelihood_of_angiographic_findings_inthehistory@@evidence_from_duplex_ultrasonography_or_ct_angiography_or_mr_angiography_or_other_medical_evidence
          (> angiographic_findings_value_recorded_inthehistory_withunit_percent 80.0))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "documented clinical evidence to support likelihood of angiographic findings > 80 percent, whether the evidence is from duplex ultrasonography OR computed tomography angiography OR magnetic resonance angiography OR other medical evidence"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_nyha_class_i_at_trial_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has NYHA class I at the time of trial enrollment.","when_to_set_to_false":"Set to false if the patient does not have NYHA class I at the time of trial enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has NYHA class I at the time of trial enrollment.","meaning":"Boolean indicating whether the patient has NYHA class I at the time of trial enrollment."} // "must have New York Heart Association (NYHA) class I at the time of trial enrollment"
(declare-const patient_has_finding_of_nyha_class_ii_at_trial_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has NYHA class II at the time of trial enrollment.","when_to_set_to_false":"Set to false if the patient does not have NYHA class II at the time of trial enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has NYHA class II at the time of trial enrollment.","meaning":"Boolean indicating whether the patient has NYHA class II at the time of trial enrollment."} // "must have New York Heart Association (NYHA) class II at the time of trial enrollment"
(declare-const patient_has_finding_of_nyha_class_iii_at_trial_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has NYHA class III at the time of trial enrollment.","when_to_set_to_false":"Set to false if the patient does not have NYHA class III at the time of trial enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has NYHA class III at the time of trial enrollment.","meaning":"Boolean indicating whether the patient has NYHA class III at the time of trial enrollment."} // "must have New York Heart Association (NYHA) class III at the time of trial enrollment"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (or patient_has_finding_of_nyha_class_i_at_trial_enrollment
         patient_has_finding_of_nyha_class_ii_at_trial_enrollment
         patient_has_finding_of_nyha_class_iii_at_trial_enrollment)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have NYHA class I OR NYHA class II OR NYHA class III at the time of trial enrollment"
