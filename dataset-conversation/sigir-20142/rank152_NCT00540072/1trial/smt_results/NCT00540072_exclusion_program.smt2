;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pneumonia.","meaning":"Boolean indicating whether the patient currently has pneumonia."} ;; "pneumonia"
(declare-const patient_has_finding_of_pneumonia_now@@grade_v_by_fine_score Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pneumonia is classified as Grade V by Fine Score.","when_to_set_to_false":"Set to false if the patient's current pneumonia is not classified as Grade V by Fine Score.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pneumonia is Grade V by Fine Score.","meaning":"Boolean indicating whether the patient's current pneumonia is Grade V by Fine Score."} ;; "Grade V pneumonia (based on Fine Score)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_pneumonia_now@@grade_v_by_fine_score
      patient_has_finding_of_pneumonia_now)
:named REQ0_AUXILIARY0)) ;; "pneumonia" and "Grade V pneumonia (based on Fine Score)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_pneumonia_now@@grade_v_by_fine_score)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Grade V pneumonia (based on Fine Score)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_respiratory_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in respiratory failure.","when_to_set_to_false":"Set to false if the patient is currently not in respiratory failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in respiratory failure.","meaning":"Boolean indicating whether the patient is currently in respiratory failure."} ;; "the patient is in respiratory failure"
(declare-const patient_has_finding_of_respiratory_failure_now@@incipient Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in respiratory failure and the respiratory failure is incipient (just beginning or developing).","when_to_set_to_false":"Set to false if the patient is currently in respiratory failure but it is not incipient, or if the patient is not in respiratory failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's respiratory failure is incipient.","meaning":"Boolean indicating whether the patient is currently in incipient respiratory failure."} ;; "the patient is in incipient respiratory failure"
(declare-const patient_is_candidate_for_mechanical_ventilation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a candidate for mechanical ventilation for any reason.","when_to_set_to_false":"Set to false if the patient is currently not a candidate for mechanical ventilation for any reason.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a candidate for mechanical ventilation for any reason.","meaning":"Boolean indicating whether the patient is currently a candidate for mechanical ventilation for any reason."} ;; "the patient is not a candidate for mechanical ventilation for any reason"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_respiratory_failure_now@@incipient
       patient_has_finding_of_respiratory_failure_now)
   :named REQ1_AUXILIARY0)) ;; "the patient is in incipient respiratory failure" implies "the patient is in respiratory failure"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: ((the patient is in respiratory failure) OR (the patient is in incipient respiratory failure)) AND (the patient is not a candidate for mechanical ventilation for any reason)
(assert
(! (not (and (or patient_has_finding_of_respiratory_failure_now
                 patient_has_finding_of_respiratory_failure_now@@incipient)
             (not patient_is_candidate_for_mechanical_ventilation_now)))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is in respiratory failure) OR (the patient is in incipient respiratory failure)) AND (the patient is not a candidate for mechanical ventilation for any reason)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cystic_fibrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cystic fibrosis.","when_to_set_to_false":"Set to false if the patient currently does not have cystic fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cystic fibrosis.","meaning":"Boolean indicating whether the patient currently has cystic fibrosis."} ;; "cystic fibrosis"

(declare-const patient_has_finding_of_primary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has primary malignant neoplasm of the lung (primary lung cancer).","when_to_set_to_false":"Set to false if the patient currently does not have primary malignant neoplasm of the lung (primary lung cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has primary malignant neoplasm of the lung (primary lung cancer).","meaning":"Boolean indicating whether the patient currently has primary malignant neoplasm of the lung (primary lung cancer)."} ;; "primary lung cancer"

(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a secondary malignant neoplasm of the lung (malignancy metastatic to the lungs).","when_to_set_to_false":"Set to false if the patient currently does not have a secondary malignant neoplasm of the lung (malignancy metastatic to the lungs).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a secondary malignant neoplasm of the lung (malignancy metastatic to the lungs).","meaning":"Boolean indicating whether the patient currently has a secondary malignant neoplasm of the lung (malignancy metastatic to the lungs)."} ;; "another malignancy metastatic to the lungs"

(declare-const patient_has_finding_of_obstruction_of_bronchus_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known obstruction of the bronchus (bronchial obstruction).","when_to_set_to_false":"Set to false if the patient currently has obstruction of the bronchus but it is not known (e.g., only suspected or not confirmed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bronchial obstruction is known.","meaning":"Boolean indicating whether the patient's current bronchial obstruction is a known diagnosis."} ;; "known bronchial obstruction"

(declare-const patient_has_finding_of_postobstructive_pneumonia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had post-obstructive pneumonia (at any time in the past).","when_to_set_to_false":"Set to false if the patient has never had post-obstructive pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had post-obstructive pneumonia.","meaning":"Boolean indicating whether the patient has ever had post-obstructive pneumonia (at any time in the past)."} ;; "history of post-obstructive pneumonia"

(declare-const patient_has_finding_of_active_tuberculosis_now@@known_or_suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active tuberculosis and this is either a known or suspected diagnosis.","when_to_set_to_false":"Set to false if the patient currently has active tuberculosis but it is neither known nor suspected (e.g., only possible or ruled out).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the active tuberculosis is known or suspected.","meaning":"Boolean indicating whether the patient's current active tuberculosis is a known or suspected diagnosis."} ;; "known or suspected active tuberculosis"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_cystic_fibrosis_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cystic fibrosis."

(assert
(! (not patient_has_finding_of_primary_malignant_neoplasm_of_lung_now)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has primary lung cancer."

(assert
(! (not patient_has_finding_of_secondary_malignant_neoplasm_of_lung_now)
    :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another malignancy metastatic to the lungs."

(assert
(! (not (or patient_has_finding_of_obstruction_of_bronchus_now@@known
            patient_has_finding_of_postobstructive_pneumonia_inthehistory))
    :named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known bronchial obstruction or a history of post-obstructive pneumonia."

(assert
(! (not patient_has_finding_of_active_tuberculosis_now@@known_or_suspected)
    :named REQ2_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known or suspected active tuberculosis."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of shock.","meaning":"Boolean indicating whether the patient currently has shock."} ;; "shock"

(declare-const patient_has_finding_of_shock_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe shock as defined by the protocol (systolic blood pressure < 90 mm Hg for > 30 minutes and not corrected by fluid bolus).","when_to_set_to_false":"Set to false if the patient currently does not have severe shock as defined by the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe shock as defined by the protocol.","meaning":"Boolean indicating whether the patient currently has severe shock as defined by the protocol."} ;; "severe shock (defined as systolic blood pressure < 90 mm Hg for > 30 minutes AND not corrected by fluid bolus)"

(declare-const patient_has_received_fluid_bolus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received a fluid bolus at the current time.","when_to_set_to_false":"Set to false if the patient has not received a fluid bolus at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received a fluid bolus at the current time.","meaning":"Boolean indicating whether the patient has received a fluid bolus at the current time."} ;; "not corrected by fluid bolus"

(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current systolic blood pressure in mm Hg is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in mm Hg."} ;; "systolic blood pressure < 90 mm Hg"

(declare-const patient_systolic_blood_pressure_value_recorded_for_30_minutes_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's systolic blood pressure in mm Hg is available for a continuous 30-minute period.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's systolic blood pressure in mm Hg recorded over a continuous 30-minute period."} ;; "systolic blood pressure < 90 mm Hg for > 30 minutes"

(declare-const patient_systolic_blood_pressure_value_recorded_after_fluid_bolus_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's systolic blood pressure in mm Hg is available after administration of a fluid bolus.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's systolic blood pressure in mm Hg recorded after administration of a fluid bolus."} ;; "not corrected by fluid bolus"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition of severe shock as per protocol: systolic blood pressure < 90 mm Hg for > 30 minutes AND not corrected by fluid bolus
(assert
(! (= patient_has_finding_of_shock_now@@severe
     (and
       (< patient_systolic_blood_pressure_value_recorded_for_30_minutes_withunit_mm_hg 90)
       (not (and patient_has_received_fluid_bolus_now
                 (>= patient_systolic_blood_pressure_value_recorded_after_fluid_bolus_withunit_mm_hg 90)))
     ))
:named REQ3_AUXILIARY0)) ;; "severe shock (defined as systolic blood pressure < 90 mm Hg for > 30 minutes AND not corrected by fluid bolus)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_shock_now@@severe
       patient_has_finding_of_shock_now)
:named REQ3_AUXILIARY1)) ;; "severe shock" implies "shock"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_shock_now@@severe)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe shock (defined as systolic blood pressure < 90 mm Hg for > 30 minutes AND not corrected by fluid bolus)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_bacterial_meningitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical evidence of bacterial meningitis.","when_to_set_to_false":"Set to false if the patient currently does not have clinical evidence of bacterial meningitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical evidence of bacterial meningitis.","meaning":"Boolean indicating whether the patient currently has clinical evidence of bacterial meningitis."} ;; "clinical evidence of bacterial meningitis"
(declare-const patient_has_finding_of_bacterial_meningitis_now@@based_on_lumbar_puncture_results Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current clinical evidence of bacterial meningitis is based on lumbar puncture results.","when_to_set_to_false":"Set to false if the patient's current clinical evidence of bacterial meningitis is not based on lumbar puncture results.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the evidence for bacterial meningitis is based on lumbar puncture results.","meaning":"Boolean indicating whether the patient's current clinical evidence of bacterial meningitis is based on lumbar puncture results."} ;; "clinical evidence of bacterial meningitis (based on lumbar puncture results)"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_bacterial_meningitis_now@@based_on_lumbar_puncture_results
      patient_has_finding_of_bacterial_meningitis_now)
:named REQ4_AUXILIARY0)) ;; "clinical evidence of bacterial meningitis (based on lumbar puncture results)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_bacterial_meningitis_now@@based_on_lumbar_puncture_results)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical evidence of bacterial meningitis (based on lumbar puncture results)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_ml_per_min Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's creatinine clearance in mL/min is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine clearance in mL/min."} ;; "calculated creatinine clearance < 30 mL/min"

(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal impairment.","meaning":"Boolean indicating whether the patient currently has renal impairment."} ;; "renal impairment"

(declare-const patient_has_finding_of_renal_impairment_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal impairment and the impairment is severe.","when_to_set_to_false":"Set to false if the patient currently has renal impairment but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal impairment is severe.","meaning":"Boolean indicating whether the patient's current renal impairment is severe."} ;; "severe renal impairment"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: severe renal impairment = calculated creatinine clearance < 30 mL/min
(assert
(! (= patient_has_finding_of_renal_impairment_now@@severity_severe
(< patient_creatinine_renal_clearance_value_recorded_now_withunit_ml_per_min 30))
:named REQ5_AUXILIARY0)) ;; "defined as calculated creatinine clearance < 30 mL/min"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_renal_impairment_now@@severity_severe
     patient_has_finding_of_renal_impairment_now)
:named REQ5_AUXILIARY1)) ;; "severe renal impairment" implies "renal impairment"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_renal_impairment_now@@severity_severe)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe renal impairment (defined as calculated creatinine clearance < 30 mL/min)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_moribund_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a moribund clinical condition.","when_to_set_to_false":"Set to false if the patient currently does not have a moribund clinical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a moribund clinical condition.","meaning":"Boolean indicating whether the patient currently has a moribund clinical condition."} ;; "moribund clinical condition"
(declare-const patient_has_finding_of_moribund_now@@high_likelihood_of_death_within_first_48_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current moribund clinical condition is associated with a high likelihood of death during the first 48 hours.","when_to_set_to_false":"Set to false if the patient's current moribund clinical condition is not associated with a high likelihood of death during the first 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current moribund clinical condition is associated with a high likelihood of death during the first 48 hours.","meaning":"Boolean indicating whether the patient's current moribund clinical condition is associated with a high likelihood of death during the first 48 hours."} ;; "moribund clinical condition (with a high likelihood of death during the first 48 hours)"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_moribund_now@@high_likelihood_of_death_within_first_48_hours
      patient_has_finding_of_moribund_now)
:named REQ6_AUXILIARY0)) ;; "moribund clinical condition (with a high likelihood of death during the first 48 hours)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_moribund_now@@high_likelihood_of_death_within_first_48_hours)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a moribund clinical condition (with a high likelihood of death during the first 48 hours)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human immunodeficiency virus infection (i.e., is positive for HIV infection).","when_to_set_to_false":"Set to false if the patient currently does not have human immunodeficiency virus infection (i.e., is negative for HIV infection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"

(declare-const patient_lymphocyte_antigen_cd4_value_recorded_now_withunit_cells_per_mm3 Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current CD4 lymphocyte count in cells per mm3 is recorded and known.","when_to_set_to_null":"Set to null if the patient's current CD4 lymphocyte count is not recorded, unknown, or indeterminate.","meaning":"Numeric value representing the patient's current CD4 lymphocyte count in cells per mm3."} ;; "CD4 lymphocyte counts < 200/mm3"

(declare-const patient_lymphocyte_antigen_cd4_value_recorded_now_withunit_cells_per_mm3@@count_is_known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current CD4 lymphocyte count is known (i.e., a valid measurement is available).","when_to_set_to_false":"Set to false if the patient's current CD4 lymphocyte count is not known (i.e., missing, indeterminate, or not measured).","when_to_set_to_null":"Set to null if it cannot be determined whether the patient's current CD4 lymphocyte count is known.","meaning":"Boolean indicating whether the patient's current CD4 lymphocyte count is known."} ;; "known CD4 lymphocyte counts"

(declare-const patient_has_finding_of_infection_by_pneumocystis_jirovecii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of Pneumocystis jirovecii pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of Pneumocystis jirovecii pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of Pneumocystis jirovecii pneumonia.","meaning":"Boolean indicating whether the patient currently has Pneumocystis jirovecii pneumonia."} ;; "Pneumocystis carinii pneumonia"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (and
    patient_has_finding_of_human_immunodeficiency_virus_infection_now
    (or
      (and patient_lymphocyte_antigen_cd4_value_recorded_now_withunit_cells_per_mm3@@count_is_known
           (< patient_lymphocyte_antigen_cd4_value_recorded_now_withunit_cells_per_mm3 200))
      patient_has_finding_of_infection_by_pneumocystis_jirovecii_now)))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is positive for human immunodeficiency virus infection) AND ((the patient has known CD4 lymphocyte counts < 200/mm3) OR (the patient has evidence of Pneumocystis carinii pneumonia))."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_intolerance_to_ceftriaxone_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an intolerance to ceftriaxone at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had an intolerance to ceftriaxone at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an intolerance to ceftriaxone.","meaning":"Boolean indicating whether the patient has ever had an intolerance to ceftriaxone at any time in their history."} ;; "inability to tolerate ceftriaxone"

(declare-const patient_has_allergy_to_beta_lactam_antibacterial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergy to any beta-lactam antibacterial agent at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had an allergy to any beta-lactam antibacterial agent at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergy to any beta-lactam antibacterial agent.","meaning":"Boolean indicating whether the patient has ever had an allergy to any beta-lactam antibacterial agent at any time in their history."} ;; "history of allergy to beta-lactam antibiotic"

(declare-const patient_has_finding_of_eruption_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a rash (eruption) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a rash (eruption) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a rash (eruption).","meaning":"Boolean indicating whether the patient has ever had a rash (eruption) at any time in their history."} ;; "history of rash"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient has inability to tolerate ceftriaxone
(assert
(! (not patient_has_intolerance_to_ceftriaxone_inthehistory)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inability to tolerate ceftriaxone."

;; Exclusion: patient has history of allergy to beta-lactam antibiotic AND does NOT only have a history of rash
(assert
(! (not (and patient_has_allergy_to_beta_lactam_antibacterial_inthehistory
             (not patient_has_finding_of_eruption_inthehistory)))
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of allergy to beta-lactam antibiotic) AND (the patient does NOT only have a history of rash))."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_exposed_to_anti_infective_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to an anti-infective agent at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been exposed to an anti-infective agent at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to an anti-infective agent.","meaning":"Boolean indicating whether the patient has ever been exposed to an anti-infective agent in their history."} ;; "anti-infective agent"
(declare-const patient_is_exposed_to_anti_infective_agent_inthehistory@@is_potentially_effective Bool) ;; {"when_to_set_to_true":"Set to true if the anti-infective agent to which the patient was exposed is considered potentially effective.","when_to_set_to_false":"Set to false if the anti-infective agent to which the patient was exposed is not considered potentially effective.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the anti-infective agent is potentially effective.","meaning":"Boolean indicating whether the anti-infective agent is potentially effective."} ;; "potentially effective anti-infective agent"
(declare-const patient_is_exposed_to_anti_infective_agent_inthehistory@@duration_greater_than_24_hours_or_one_dosing_day Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to the anti-infective agent lasted more than 24 hours or one dosing day.","when_to_set_to_false":"Set to false if the exposure to the anti-infective agent did not last more than 24 hours or one dosing day.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure lasted more than 24 hours or one dosing day.","meaning":"Boolean indicating whether the exposure duration was greater than 24 hours or one dosing day."} ;; "for > 24 hours (or one dosing day)"
(declare-const patient_is_exposed_to_anti_infective_agent_inthehistory@@temporalcontext_within_72_hours_of_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to the anti-infective agent occurred within 72 hours of enrollment.","when_to_set_to_false":"Set to false if the exposure to the anti-infective agent did not occur within 72 hours of enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within 72 hours of enrollment.","meaning":"Boolean indicating whether the exposure occurred within 72 hours of enrollment."} ;; "within 72 hours of enrollment"
(declare-const patient_has_prior_treatment_with_investigational_drug_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had prior treatment with any investigational drug at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had prior treatment with any investigational drug at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had prior treatment with any investigational drug in their history.","meaning":"Boolean indicating whether the patient has had prior treatment with any investigational drug in their history."} ;; "prior treatment with any investigational drug"
(declare-const patient_has_prior_treatment_with_investigational_drug_in_the_history@@temporalcontext_within_30_days_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the prior treatment with any investigational drug occurred within 30 days prior to enrollment.","when_to_set_to_false":"Set to false if the prior treatment with any investigational drug did not occur within 30 days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the prior treatment with any investigational drug occurred within 30 days prior to enrollment.","meaning":"Boolean indicating whether the prior treatment with any investigational drug occurred within 30 days prior to enrollment."} ;; "in the previous 30 days"
(declare-const patient_has_prior_treatment_with_experimental_biologic_agent_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had prior treatment with any experimental biologic agent at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had prior treatment with any experimental biologic agent at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had prior treatment with any experimental biologic agent in their history.","meaning":"Boolean indicating whether the patient has had prior treatment with any experimental biologic agent in their history."} ;; "prior treatment with any experimental biologic agent"
(declare-const patient_has_prior_treatment_with_experimental_biologic_agent_in_the_history@@temporalcontext_within_30_days_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the prior treatment with any experimental biologic agent occurred within 30 days prior to enrollment.","when_to_set_to_false":"Set to false if the prior treatment with any experimental biologic agent did not occur within 30 days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the prior treatment with any experimental biologic agent occurred within 30 days prior to enrollment.","meaning":"Boolean indicating whether the prior treatment with any experimental biologic agent occurred within 30 days prior to enrollment."} ;; "in the previous 30 days"
(declare-const patient_is_exposed_to_daptomycin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to daptomycin at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been exposed to daptomycin at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to daptomycin.","meaning":"Boolean indicating whether the patient has ever been exposed to daptomycin in their history."} ;; "prior therapy with daptomycin"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variables for anti-infective agent exposure
(assert
(! (=> patient_is_exposed_to_anti_infective_agent_inthehistory@@is_potentially_effective
      patient_is_exposed_to_anti_infective_agent_inthehistory)
:named REQ9_AUXILIARY0)) ;; "potentially effective anti-infective agent"

(assert
(! (=> patient_is_exposed_to_anti_infective_agent_inthehistory@@duration_greater_than_24_hours_or_one_dosing_day
      patient_is_exposed_to_anti_infective_agent_inthehistory)
:named REQ9_AUXILIARY1)) ;; "for > 24 hours (or one dosing day)"

(assert
(! (=> patient_is_exposed_to_anti_infective_agent_inthehistory@@temporalcontext_within_72_hours_of_enrollment
      patient_is_exposed_to_anti_infective_agent_inthehistory)
:named REQ9_AUXILIARY2)) ;; "within 72 hours of enrollment"

;; Qualifier variables imply corresponding stem variables for investigational drug
(assert
(! (=> patient_has_prior_treatment_with_investigational_drug_in_the_history@@temporalcontext_within_30_days_prior_to_enrollment
      patient_has_prior_treatment_with_investigational_drug_in_the_history)
:named REQ9_AUXILIARY3)) ;; "prior treatment with any investigational drug in the previous 30 days"

;; Qualifier variables imply corresponding stem variables for experimental biologic agent
(assert
(! (=> patient_has_prior_treatment_with_experimental_biologic_agent_in_the_history@@temporalcontext_within_30_days_prior_to_enrollment
      patient_has_prior_treatment_with_experimental_biologic_agent_in_the_history)
:named REQ9_AUXILIARY4)) ;; "prior treatment with any experimental biologic agent in the previous 30 days"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion 1: previously treated with a potentially effective anti-infective agent for >24h (or one dosing day) within 72h of enrollment
(assert
(! (not (and patient_is_exposed_to_anti_infective_agent_inthehistory@@is_potentially_effective
             patient_is_exposed_to_anti_infective_agent_inthehistory@@duration_greater_than_24_hours_or_one_dosing_day
             patient_is_exposed_to_anti_infective_agent_inthehistory@@temporalcontext_within_72_hours_of_enrollment))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been previously treated with a potentially effective anti-infective agent for > 24 hours (or one dosing day) within 72 hours of enrollment."

;; Exclusion 2: prior treatment with any investigational drug including experimental biologic agent in the previous 30 days
(assert
(! (not (or patient_has_prior_treatment_with_investigational_drug_in_the_history@@temporalcontext_within_30_days_prior_to_enrollment
            patient_has_prior_treatment_with_experimental_biologic_agent_in_the_history@@temporalcontext_within_30_days_prior_to_enrollment))
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior treatment with any investigational drug including experimental biologic agent in the previous 30 days."

;; Exclusion 3: prior therapy with daptomycin
(assert
(! (not patient_is_exposed_to_daptomycin_inthehistory)
:named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior therapy with daptomycin."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_must_continue_3_hydroxy_3_methylglutaryl_coenzyme_a_reductase_inhibitor_therapy_during_study_treatment_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is required to continue therapy with a 3-hydroxy-3-methylglutaryl-coenzyme A reductase inhibitor during the study treatment period.","when_to_set_to_false":"Set to false if the patient is not required to continue therapy with a 3-hydroxy-3-methylglutaryl-coenzyme A reductase inhibitor during the study treatment period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient must continue therapy with a 3-hydroxy-3-methylglutaryl-coenzyme A reductase inhibitor during the study treatment period.","meaning":"Boolean indicating whether the patient must continue therapy with a 3-hydroxy-3-methylglutaryl-coenzyme A reductase inhibitor during the study treatment period."} ;; "must continue therapy with 3-hydroxy-3-methylglutaryl-coenzyme A reductase inhibitor with non-exhaustive examples (simvastatin, lovastatin) during the study treatment period."

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_must_continue_3_hydroxy_3_methylglutaryl_coenzyme_a_reductase_inhibitor_therapy_during_study_treatment_period)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient must continue therapy with 3-hydroxy-3-methylglutaryl-coenzyme A reductase inhibitor with non-exhaustive examples (simvastatin, lovastatin) during the study treatment period."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_requires_second_non_protocol_systemic_antibiotic_now Bool) ;; {"when_to_set_to_true":"Set to true if it is anticipated that the patient will require a second systemic antibiotic that is not part of the study protocol now.","when_to_set_to_false":"Set to false if it is anticipated that the patient will not require a second systemic antibiotic that is not part of the study protocol now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether it is anticipated that the patient will require a second systemic antibiotic that is not part of the study protocol now.","meaning":"Boolean indicating whether it is anticipated that the patient will require a second systemic antibiotic that is not part of the study protocol now."} ;; "it is anticipated that the patient will require a second non-protocol systemic antibiotic."
(declare-const patient_requires_second_non_protocol_systemic_antibiotic_now@@anticipated_requirement Bool) ;; {"when_to_set_to_true":"Set to true if the requirement for a second non-protocol systemic antibiotic is anticipated.","when_to_set_to_false":"Set to false if the requirement for a second non-protocol systemic antibiotic is not anticipated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the requirement for a second non-protocol systemic antibiotic is anticipated.","meaning":"Boolean indicating whether the requirement for a second non-protocol systemic antibiotic is anticipated."} ;; "anticipated that the patient will require a second non-protocol systemic antibiotic"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_requires_second_non_protocol_systemic_antibiotic_now@@anticipated_requirement
      patient_requires_second_non_protocol_systemic_antibiotic_now)
:named REQ11_AUXILIARY0)) ;; "anticipated that the patient will require a second non-protocol systemic antibiotic"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_requires_second_non_protocol_systemic_antibiotic_now@@anticipated_requirement)
:named REQ11_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if it is anticipated that the patient will require a second non-protocol systemic antibiotic."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_undergone_induction_chemotherapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone induction chemotherapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone induction chemotherapy in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone induction chemotherapy in the past.","meaning":"Boolean indicating whether the patient has ever undergone induction chemotherapy in the past."} ;; "induction chemotherapy"
(declare-const patient_has_undergone_induction_chemotherapy_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone induction chemotherapy within two weeks prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not undergone induction chemotherapy within two weeks prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone induction chemotherapy within two weeks prior to enrollment.","meaning":"Boolean indicating whether the patient has undergone induction chemotherapy within two weeks prior to enrollment."} ;; "within two weeks prior to enrollment"
(declare-const patient_has_received_exogenous_therapy_anticipated_to_result_in_polymorphonuclear_leukocyte_count_value_recorded_during_treatment_phase_withunit_cells_per_cubic_millimeter Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received exogenous therapy that is anticipated to result in polymorphonuclear leukocyte count less than 200 cells per cubic millimeter during the Treatment Phase.","when_to_set_to_false":"Set to false if the patient has not received exogenous therapy anticipated to result in such a count during the Treatment Phase.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received exogenous therapy anticipated to result in polymorphonuclear leukocyte count less than 200 cells per cubic millimeter during the Treatment Phase.","meaning":"Boolean indicating whether the patient has received exogenous therapy anticipated to result in polymorphonuclear leukocyte count less than 200 cells per cubic millimeter during the Treatment Phase."} ;; "received exogenous therapy anticipated to result in polymorphonuclear leukocyte counts < 200 cells per cubic millimeter during the Treatment Phase"
(declare-const patient_has_finding_of_neutropenic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis or finding of neutropenia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis or finding of neutropenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis or finding of neutropenia.","meaning":"Boolean indicating whether the patient currently has a diagnosis or finding of neutropenia."} ;; "severe neutropenia"
(declare-const patient_polymorphonuclear_leukocyte_count_value_recorded_now_withunit_cells_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if a current measurement of the patient's polymorphonuclear leukocyte count in cells per cubic millimeter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current polymorphonuclear leukocyte count in cells per cubic millimeter."} ;; "polymorphonuclear leukocyte counts < 200 cells per cubic millimeter"
(declare-const patient_polymorphonuclear_leukocyte_count_value_recorded_now_withunit_cells_per_cubic_millimeter@@measured_during_treatment_phase Bool) ;; {"when_to_set_to_true":"Set to true if the measurement was taken during the Treatment Phase.","when_to_set_to_false":"Set to false if the measurement was not taken during the Treatment Phase.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken during the Treatment Phase.","meaning":"Boolean indicating whether the measurement was taken during the Treatment Phase."} ;; "measured during the Treatment Phase"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable for induction chemotherapy
(assert
(! (=> patient_has_undergone_induction_chemotherapy_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment
     patient_has_undergone_induction_chemotherapy_inthehistory)
:named REQ12_AUXILIARY0)) ;; "within two weeks prior to enrollment"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Exclusion 1: Induction chemotherapy within two weeks prior to enrollment
(assert
(! (not patient_has_undergone_induction_chemotherapy_inthehistory@@temporalcontext_within_2_weeks_prior_to_enrollment)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received induction chemotherapy within two weeks prior to enrollment."

;; Exclusion 2: Received exogenous therapy anticipated to result in polymorphonuclear leukocyte count < 200 cells per cubic millimeter during the Treatment Phase
(assert
(! (not patient_has_received_exogenous_therapy_anticipated_to_result_in_polymorphonuclear_leukocyte_count_value_recorded_during_treatment_phase_withunit_cells_per_cubic_millimeter)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received exogenous therapy which is anticipated to result in polymorphonuclear leukocyte counts < 200 cells per cubic millimeter during the Treatment Phase."

;; Exclusion 3: Severe neutropenia defined as polymorphonuclear leukocyte counts < 200 cells per cubic millimeter
(assert
(! (not (and patient_has_finding_of_neutropenic_disorder_now
             (< patient_polymorphonuclear_leukocyte_count_value_recorded_now_withunit_cells_per_cubic_millimeter 200)))
:named REQ12_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe neutropenia defined as polymorphonuclear leukocyte counts < 200 cells per cubic millimeter."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_considered_unreliable_to_return_for_visits_or_to_comply_with_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient is considered unreliable to return for visits or to comply with study procedures.","when_to_set_to_false":"Set to false if the patient is considered reliable to return for visits and to comply with study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is considered unreliable to return for visits or to comply with study procedures.","meaning":"Boolean indicating whether the patient is considered unreliable to return for visits or to comply with study procedures."} ;; "the patient is considered unreliable to return for visits OR to comply with study procedures"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_is_considered_unreliable_to_return_for_visits_or_to_comply_with_study_procedures)
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is considered unreliable to return for visits OR to comply with study procedures."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malignant neoplastic disease (malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have malignant neoplastic disease (malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient currently has malignant neoplastic disease (malignancy)."} ;; "malignancy"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@in_remission Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malignant neoplastic disease (malignancy) and the malignancy is in remission.","when_to_set_to_false":"Set to false if the patient currently has malignant neoplastic disease (malignancy) and the malignancy is not in remission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignancy is in remission.","meaning":"Boolean indicating whether the patient's current malignant neoplastic disease (malignancy) is in remission."} ;; "malignancy is in remission"
(declare-const patient_has_finding_of_tumor_progression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has progressive neoplastic disease (tumor progression).","when_to_set_to_false":"Set to false if the patient currently does not have progressive neoplastic disease (tumor progression).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has progressive neoplastic disease (tumor progression).","meaning":"Boolean indicating whether the patient currently has progressive neoplastic disease (tumor progression)."} ;; "progressive neoplastic disease"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@in_remission
      patient_has_finding_of_malignant_neoplastic_disease_now)
:named REQ14_AUXILIARY0)) ;; "malignancy is in remission"

;; ===================== Constraint Assertions (REQ 14) =====================
;; Exclusion: patient must NOT have progressive neoplastic disease, unless the malignancy is in remission
(assert
(! (not (and patient_has_finding_of_tumor_progression_now
             (not patient_has_finding_of_malignant_neoplastic_disease_now@@in_remission)))
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has progressive neoplastic disease, except if the malignancy is in remission."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "the patient is a woman"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as pregnant.","when_to_set_to_false":"Set to false if the patient is currently documented as not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently documented as not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is nursing"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as lactating.","when_to_set_to_false":"Set to false if the patient is currently documented as not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not (or
        (and patient_sex_is_female_now patient_is_pregnant_now)
        (and patient_sex_is_female_now patient_is_breastfeeding_now)
        (and patient_sex_is_female_now patient_is_lactating_now)
    ))
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a woman who is pregnant) OR (the patient is a woman who is nursing) OR (the patient is a woman who is lactating)."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const days_since_discharge_from_hospital Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient was discharged from a hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient was discharged from a hospital.","meaning":"Numeric value indicating the number of days since the patient was discharged from a hospital."} ;; "less than fourteen days after discharge from a hospital"
(declare-const days_since_discharge_from_skilled_nursing_facility Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient was discharged from a skilled nursing facility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient was discharged from a skilled nursing facility.","meaning":"Numeric value indicating the number of days since the patient was discharged from a skilled nursing facility."} ;; "less than fourteen days after discharge from a skilled nursing facility"
(declare-const initial_hospitalization_duration_at_hospital_discharge_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days of the initial hospitalization prior to discharge from a hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days the initial hospitalization lasted prior to discharge from a hospital.","meaning":"Numeric value indicating the duration in days of the initial hospitalization prior to discharge from a hospital."} ;; "initial hospitalization of three or more days duration (hospital)"
(declare-const initial_hospitalization_duration_at_skilled_nursing_facility_discharge_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days of the initial hospitalization prior to discharge to a skilled nursing facility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days the initial hospitalization lasted prior to discharge to a skilled nursing facility.","meaning":"Numeric value indicating the duration in days of the initial hospitalization prior to discharge to a skilled nursing facility."} ;; "initial hospitalization of three or more days duration (skilled nursing facility)"
(declare-const patient_has_diagnosis_of_hospital_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hospital-acquired (nosocomial) pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hospital-acquired (nosocomial) pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hospital-acquired (nosocomial) pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hospital-acquired (nosocomial) pneumonia."} ;; "nosocomial pneumonia"

;; ===================== Constraint Assertions (REQ 16) =====================
;; Exclusion: nosocomial pneumonia defined as less than 14 days after discharge from a skilled nursing facility with an initial hospitalization of 3 or more days duration
(assert
(! (not (and patient_has_diagnosis_of_hospital_acquired_pneumonia_now
             (< days_since_discharge_from_skilled_nursing_facility 14)
             (>= initial_hospitalization_duration_at_skilled_nursing_facility_discharge_in_days 3)))
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient presents with nosocomial pneumonia defined as less than fourteen days after discharge from a skilled nursing facility with an initial hospitalization of three or more days duration."

;; Exclusion: nosocomial pneumonia defined as less than 14 days after discharge from a hospital with an initial hospitalization of 3 or more days duration
(assert
(! (not (and patient_has_diagnosis_of_hospital_acquired_pneumonia_now
             (< days_since_discharge_from_hospital 14)
             (>= initial_hospitalization_duration_at_hospital_discharge_in_days 3)))
   :named REQ16_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient presents with nosocomial pneumonia defined as less than fourteen days after discharge from a hospital with an initial hospitalization of three or more days duration."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_suspicion_of_legionella_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if there is clinical suspicion of Legionella pneumonia in the patient at the present time.","when_to_set_to_false":"Set to false if there is no clinical suspicion of Legionella pneumonia in the patient at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is clinical suspicion of Legionella pneumonia in the patient at the present time.","meaning":"Boolean indicating whether there is clinical suspicion of Legionella pneumonia in the patient at the present time."} ;; "clinical suspicion of Legionella pneumonia"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_suspicion_of_legionella_pneumonia_now)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if there is clinical suspicion of Legionella pneumonia."
