;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_posterior_rhinorrhea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of postnasal drip (posterior rhinorrhea).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of postnasal drip (posterior rhinorrhea).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has postnasal drip (posterior rhinorrhea).","meaning":"Boolean indicating whether the patient currently has postnasal drip (posterior rhinorrhea)."}  ;; "To be included, the patient must have postnasal drip (as determined by rhinoscopy)."
(declare-const patient_has_finding_of_posterior_rhinorrhea_now@@determined_by_rhinoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's postnasal drip (posterior rhinorrhea) is determined by rhinoscopy.","when_to_set_to_false":"Set to false if the patient's postnasal drip (posterior rhinorrhea) is not determined by rhinoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether rhinoscopy was used to determine postnasal drip (posterior rhinorrhea).","meaning":"Boolean indicating whether the patient's postnasal drip (posterior rhinorrhea) is determined by rhinoscopy."}  ;; "To be included, the patient must have postnasal drip (as determined by rhinoscopy)."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_posterior_rhinorrhea_now@@determined_by_rhinoscopy
         patient_has_finding_of_posterior_rhinorrhea_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have postnasal drip (as determined by rhinoscopy)."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_posterior_rhinorrhea_now@@determined_by_rhinoscopy
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have postnasal drip (as determined by rhinoscopy)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cough.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cough.","meaning":"Boolean indicating whether the patient currently has cough."}  ;; "To be included, the patient must have cough (as measured by visual analog scale)."
(declare-const patient_has_finding_of_cough_now@@measured_by_visual_analog_scale Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cough is measured by a visual analog scale.","when_to_set_to_false":"Set to false if the patient's cough is not measured by a visual analog scale.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cough is measured by a visual analog scale.","meaning":"Boolean indicating whether the patient's cough is measured by a visual analog scale."}  ;; "To be included, the patient must have cough (as measured by visual analog scale)."
(declare-const patient_cough_severity_value_measured_by_visual_analog_scale_now_in_millimeters Real) ;; {"when_to_set_to_value":"Set to the numeric value (in millimeters) if the patient's cough severity is measured by a visual analog scale at the current time.","when_to_set_to_null":"Set to null if the cough severity is not measured by a visual analog scale, is not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the severity of the patient's cough as measured by a visual analog scale (VAS) in millimeters at the current time."}  ;; "To be included, the patient must have cough (as measured by visual analog scale)."

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_cough_now@@measured_by_visual_analog_scale
         patient_has_finding_of_cough_now)
     :named REQ1_AUXILIARY0)) ;; "To be included, the patient must have cough (as measured by visual analog scale)."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must have cough measured by visual analog scale
(assert
  (! patient_has_finding_of_cough_now@@measured_by_visual_analog_scale
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have cough (as measured by visual analog scale)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."}  ;; "Asthma is defined by the American Thoracic Society guidelines."
(declare-const patient_has_diagnosis_of_asthma_now@@defined_by_american_thoracic_society_guidelines Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma and the diagnosis is defined by the American Thoracic Society guidelines.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of asthma but the diagnosis is not defined by the American Thoracic Society guidelines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of asthma is defined by the American Thoracic Society guidelines.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma and the diagnosis is defined by the American Thoracic Society guidelines."}  ;; "Asthma is defined by the American Thoracic Society guidelines."
(declare-const patient_has_diagnosis_of_cough_variant_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cough-variant asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cough-variant asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cough-variant asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cough-variant asthma."}  ;; "To be included, the patient must have cough-variant asthma excluded by either (a negative methacholine challenge test performed within one year) OR (documented failure of chronic cough to resolve after administration of inhaled corticosteroid for more than one month)."
(declare-const patient_has_finding_of_chronic_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic cough.","when_to_set_to_false":"Set to false if the patient currently does not have chronic cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic cough.","meaning":"Boolean indicating whether the patient currently has chronic cough."}  ;; "documented failure of chronic cough to resolve after administration of inhaled corticosteroid for more than one month"
(declare-const patient_has_finding_of_chronic_cough_now@@failure_to_resolve_after_inhaled_corticosteroid_for_more_than_1_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic cough and the chronic cough has failed to resolve after administration of inhaled corticosteroid for more than one month.","when_to_set_to_false":"Set to false if the patient currently has chronic cough but the cough resolved after administration of inhaled corticosteroid for more than one month, or if the treatment was not given.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic cough failed to resolve after administration of inhaled corticosteroid for more than one month.","meaning":"Boolean indicating whether the patient currently has chronic cough and the chronic cough has failed to resolve after administration of inhaled corticosteroid for more than one month."}  ;; "documented failure of chronic cough to resolve after administration of inhaled corticosteroid for more than one month"
(declare-const patient_has_undergone_methacholine_challenge_inthepast1years_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a methacholine challenge test within the past 1 year and the outcome was negative.","when_to_set_to_false":"Set to false if the patient has not undergone a methacholine challenge test within the past 1 year with a negative outcome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a methacholine challenge test within the past 1 year with a negative outcome.","meaning":"Boolean indicating whether the patient has undergone a methacholine challenge test within the past 1 year and the outcome was negative."}  ;; "a negative methacholine challenge test performed within one year"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable for asthma definition implies asthma diagnosis
(assert
  (! (=> patient_has_diagnosis_of_asthma_now@@defined_by_american_thoracic_society_guidelines
         patient_has_diagnosis_of_asthma_now)
     :named REQ3_AUXILIARY0)) ;; "Asthma is defined by the American Thoracic Society guidelines."

;; Qualifier variable for chronic cough failure implies chronic cough finding
(assert
  (! (=> patient_has_finding_of_chronic_cough_now@@failure_to_resolve_after_inhaled_corticosteroid_for_more_than_1_month
         patient_has_finding_of_chronic_cough_now)
     :named REQ3_AUXILIARY1)) ;; "documented failure of chronic cough to resolve after administration of inhaled corticosteroid for more than one month"

;; ===================== Constraint Assertions (REQ 3) =====================
;; To be included, cough-variant asthma must be excluded by either:
;; (a negative methacholine challenge test performed within one year)
;; OR
;; (documented failure of chronic cough to resolve after administration of inhaled corticosteroid for more than one month)
(assert
  (! (not patient_has_diagnosis_of_cough_variant_asthma_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have cough-variant asthma excluded..."

(assert
  (! (or patient_has_undergone_methacholine_challenge_inthepast1years_outcome_is_negative
         patient_has_finding_of_chronic_cough_now@@failure_to_resolve_after_inhaled_corticosteroid_for_more_than_1_month)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "cough-variant asthma excluded by either (a negative methacholine challenge test performed within one year) OR (documented failure of chronic cough to resolve after administration of inhaled corticosteroid for more than one month)"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_undergone_plain_chest_x_ray_inthehistory_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a plain chest x-ray (chest radiogram) in the past and the result was negative.","when_to_set_to_false":"Set to false if the patient has undergone a plain chest x-ray in the past and the result was not negative, or if all available chest x-rays are not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a negative chest x-ray.","meaning":"Boolean indicating whether the patient has ever had a negative plain chest x-ray (chest radiogram)."}  ;; "a negative chest radiogram"
(declare-const patient_has_undergone_ct_of_chest_inthepast6months_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a chest CT scan within the past 6 months and the result was negative.","when_to_set_to_false":"Set to false if the patient has undergone a chest CT scan within the past 6 months and the result was not negative, or if all available chest CT scans in that window are not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a negative chest CT scan within the past 6 months.","meaning":"Boolean indicating whether the patient has had a negative chest CT scan within the past 6 months."}  ;; "a negative chest computed tomography scan (performed within 6 months)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must have (a negative chest radiogram OR a negative chest computed tomography scan (performed within 6 months)).
(assert
  (! (or patient_has_undergone_plain_chest_x_ray_inthehistory_outcome_is_negative
         patient_has_undergone_ct_of_chest_inthepast6months_outcome_is_negative)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (a negative chest radiogram OR a negative chest computed tomography scan (performed within 6 months))."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_gastroesophageal_reflux_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of gastroesophageal reflux disease (GERD).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of gastroesophageal reflux disease (GERD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of gastroesophageal reflux disease (GERD).","meaning":"Boolean indicating whether the patient currently has a diagnosis of gastroesophageal reflux disease (GERD)."}  ;; "To be included, the patient must have no active gastroesophageal reflux disease symptoms (reflux symptom index score < 7)."
(declare-const patient_reflux_symptom_index_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the value of the patient's current reflux symptom index score as recorded now, in units of 'score'.","when_to_set_to_null":"Set to null if the patient's current reflux symptom index score is unknown, not documented, or cannot be determined.","meaning":"Numeric variable indicating the patient's current reflux symptom index score, recorded now, with unit 'score'."}  ;; "To be included, the patient must have no active gastroesophageal reflux disease symptoms (reflux symptom index score < 7)."
(declare-const patient_is_taking_h_k_exchanging_atpase_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a proton pump inhibitor (PPI).","when_to_set_to_false":"Set to false if the patient is currently not taking a proton pump inhibitor (PPI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a proton pump inhibitor (PPI).","meaning":"Boolean indicating whether the patient is currently taking a proton pump inhibitor (PPI)."}  ;; "To be included, the patient must be on a stable dose of proton pump inhibitor (for ≥ 4 weeks)."
(declare-const patient_is_taking_h_k_exchanging_atpase_inhibitor_containing_product_now@@dose_is_stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a proton pump inhibitor (PPI) and the dose is stable.","when_to_set_to_false":"Set to false if the patient is currently taking a proton pump inhibitor (PPI) but the dose is not stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose is stable while the patient is currently taking a proton pump inhibitor (PPI).","meaning":"Boolean indicating whether the patient is currently taking a proton pump inhibitor (PPI) and the dose is stable."}  ;; "To be included, the patient must be on a stable dose of proton pump inhibitor (for ≥ 4 weeks)."
(declare-const patient_is_taking_h_k_exchanging_atpase_inhibitor_containing_product_now@@temporalcontext_within_at_least_4_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a proton pump inhibitor (PPI) and has been on the medication for at least 4 weeks.","when_to_set_to_false":"Set to false if the patient is currently taking a proton pump inhibitor (PPI) but has not been on the medication for at least 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been on the proton pump inhibitor (PPI) for at least 4 weeks while currently taking it.","meaning":"Boolean indicating whether the patient is currently taking a proton pump inhibitor (PPI) and has been on the medication for at least 4 weeks."}  ;; "To be included, the patient must be on a stable dose of proton pump inhibitor (for ≥ 4 weeks)."

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_is_taking_h_k_exchanging_atpase_inhibitor_containing_product_now@@dose_is_stable
         patient_is_taking_h_k_exchanging_atpase_inhibitor_containing_product_now)
     :named REQ5_AUXILIARY0)) ;; "dose is stable" qualifier implies currently taking PPI

(assert
  (! (=> patient_is_taking_h_k_exchanging_atpase_inhibitor_containing_product_now@@temporalcontext_within_at_least_4_weeks
         patient_is_taking_h_k_exchanging_atpase_inhibitor_containing_product_now)
     :named REQ5_AUXILIARY1)) ;; "for ≥ 4 weeks" qualifier implies currently taking PPI

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: No active GERD symptoms (reflux symptom index score < 7)
(assert
  (! (< patient_reflux_symptom_index_score_value_recorded_now_withunit_score 7)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have no active gastroesophageal reflux disease symptoms (reflux symptom index score < 7)."

;; Component 1: On a stable dose of PPI for ≥ 4 weeks
(assert
  (! (and patient_is_taking_h_k_exchanging_atpase_inhibitor_containing_product_now@@dose_is_stable
          patient_is_taking_h_k_exchanging_atpase_inhibitor_containing_product_now@@temporalcontext_within_at_least_4_weeks)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be on a stable dose of proton pump inhibitor (for ≥ 4 weeks)."
