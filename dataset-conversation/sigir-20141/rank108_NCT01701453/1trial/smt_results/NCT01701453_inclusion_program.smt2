;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 20 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 20.0)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 20 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_can_verbally_confirm_understanding_of_risks_of_percutaneous_coronary_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to verbally confirm understanding of the risks of receiving percutaneous coronary intervention.","when_to_set_to_false":"Set to false if the patient is currently unable to verbally confirm understanding of the risks of receiving percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to verbally confirm understanding of the risks of receiving percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient is currently able to verbally confirm understanding of the risks of receiving percutaneous coronary intervention."} // "be able to verbally confirm understanding of risks"
(declare-const patient_can_verbally_confirm_understanding_of_benefits_of_percutaneous_coronary_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to verbally confirm understanding of the benefits of receiving percutaneous coronary intervention.","when_to_set_to_false":"Set to false if the patient is currently unable to verbally confirm understanding of the benefits of receiving percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to verbally confirm understanding of the benefits of receiving percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient is currently able to verbally confirm understanding of the benefits of receiving percutaneous coronary intervention."} // "be able to verbally confirm understanding of benefits"
(declare-const patient_can_verbally_confirm_understanding_of_treatment_alternatives_of_percutaneous_coronary_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to verbally confirm understanding of the treatment alternatives of receiving percutaneous coronary intervention.","when_to_set_to_false":"Set to false if the patient is currently unable to verbally confirm understanding of the treatment alternatives of receiving percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to verbally confirm understanding of the treatment alternatives of receiving percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient is currently able to verbally confirm understanding of the treatment alternatives of receiving percutaneous coronary intervention."} // "be able to verbally confirm understanding of treatment alternatives"
(declare-const patient_has_provided_written_informed_consent_prior_to_any_study_related_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent prior to any study related procedure.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent prior to any study related procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent prior to any study related procedure.","meaning":"Boolean indicating whether the patient has provided written informed consent prior to any study related procedure."} // "the patient ... must provide written informed consent prior to any study related procedure"
(declare-const legally_authorized_representative_has_provided_written_informed_consent_prior_to_any_study_related_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the legally authorized representative of the patient has provided written informed consent prior to any study related procedure.","when_to_set_to_false":"Set to false if the legally authorized representative of the patient has not provided written informed consent prior to any study related procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the legally authorized representative of the patient has provided written informed consent prior to any study related procedure.","meaning":"Boolean indicating whether the legally authorized representative of the patient has provided written informed consent prior to any study related procedure."} // "the legally authorized representative of the patient ... must provide written informed consent prior to any study related procedure"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must be able to verbally confirm understanding of all three: risks, benefits, and treatment alternatives of percutaneous coronary intervention
(assert
  (! (and patient_can_verbally_confirm_understanding_of_risks_of_percutaneous_coronary_intervention_now
          patient_can_verbally_confirm_understanding_of_benefits_of_percutaneous_coronary_intervention_now
          patient_can_verbally_confirm_understanding_of_treatment_alternatives_of_percutaneous_coronary_intervention_now)
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be able to verbally confirm (understanding of risks AND understanding of benefits AND understanding of treatment alternatives of receiving percutaneous coronary intervention)"

;; Component 1: Either the patient OR the legally authorized representative must provide written informed consent prior to any study related procedure
(assert
  (! (or patient_has_provided_written_informed_consent_prior_to_any_study_related_procedure
         legally_authorized_representative_has_provided_written_informed_consent_prior_to_any_study_related_procedure)
     :named REQ1_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "(the patient OR the legally authorized representative of the patient) must provide written informed consent prior to any study related procedure"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_culprit_lesion_of_coronary_artery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a culprit lesion located in a native coronary artery.","when_to_set_to_false":"Set to false if the patient currently does not have a culprit lesion located in a native coronary artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a culprit lesion located in a native coronary artery.","meaning":"Boolean indicating whether the patient currently has a culprit lesion of a coronary artery."} // "culprit lesion in a native coronary artery"
(declare-const patient_stricture_of_artery_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of arterial stenosis by visual estimate is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current degree of arterial stenosis measured by visual estimate."} // "stenosis > 50% by visual estimate"
(declare-const patient_stricture_of_artery_value_recorded_now_withunit_percent@@measured_by_visual_estimate Bool) ;; {"when_to_set_to_true":"Set to true if the measurement of arterial stenosis was performed by visual estimate.","when_to_set_to_false":"Set to false if the measurement of arterial stenosis was not performed by visual estimate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was performed by visual estimate.","meaning":"Boolean indicating whether the measurement of arterial stenosis was performed by visual estimate."} // "stenosis > 50% by visual estimate"
(declare-const patient_can_undergo_endovascular_insertion_of_stent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo endovascular insertion of stent (i.e., the lesion is eligible for stent implantation).","when_to_set_to_false":"Set to false if the patient cannot currently undergo endovascular insertion of stent (i.e., the lesion is not eligible for stent implantation).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo endovascular insertion of stent.","meaning":"Boolean indicating whether the patient can currently undergo endovascular insertion of stent."} // "the lesion must be eligible for stent implantation"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; The measurement by visual estimate qualifier implies a measurement exists
(assert
  (! (=> patient_stricture_of_artery_value_recorded_now_withunit_percent@@measured_by_visual_estimate
         true)
     :named REQ2_AUXILIARY0)) ;; "stenosis > 50% by visual estimate"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Culprit lesion in native coronary artery with significant stenosis (>50% by visual estimate)
(assert
  (! (and patient_has_finding_of_culprit_lesion_of_coronary_artery_now
          patient_stricture_of_artery_value_recorded_now_withunit_percent@@measured_by_visual_estimate
          (> patient_stricture_of_artery_value_recorded_now_withunit_percent 50.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "culprit lesion in a native coronary artery with significant stenosis (stenosis > 50% by visual estimate)"

;; Component 1: Lesion must be eligible for stent implantation
(assert
  (! patient_can_undergo_endovascular_insertion_of_stent_now
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the lesion must be eligible for stent implantation"

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of acute coronary syndrome, as defined by the requirement (unstable angina OR myocardial infarction, with exhaustive subcategories and criteria).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of acute coronary syndrome."} // "the patient must have (a clinical diagnosis of acute coronary syndrome with exhaustive subcategories (unstable angina OR myocardial infarction))"
(declare-const patient_has_diagnosis_of_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of myocardial infarction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of myocardial infarction."} // "myocardial infarction"
(declare-const patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ST-segment elevation myocardial infarction (STEMI).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ST-segment elevation myocardial infarction (STEMI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ST-segment elevation myocardial infarction (STEMI).","meaning":"Boolean indicating whether the patient currently has a diagnosis of ST-segment elevation myocardial infarction (STEMI)."} // "ST-segment elevation myocardial infarction"
(declare-const patient_has_diagnosis_of_acute_non_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of non-ST-segment elevation myocardial infarction (NSTEMI).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of non-ST-segment elevation myocardial infarction (NSTEMI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of non-ST-segment elevation myocardial infarction (NSTEMI).","meaning":"Boolean indicating whether the patient currently has a diagnosis of non-ST-segment elevation myocardial infarction (NSTEMI)."} // "Non-ST-segment elevation myocardial infarction"
(declare-const patient_has_diagnosis_of_unstable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of unstable angina.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of unstable angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of unstable angina.","meaning":"Boolean indicating whether the patient currently has a diagnosis of unstable angina."} // "unstable angina"
(declare-const patient_has_finding_of_myocardial_necrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has myocardial necrosis.","when_to_set_to_false":"Set to false if the patient currently does not have myocardial necrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has myocardial necrosis.","meaning":"Boolean indicating whether the patient currently has myocardial necrosis."} // "myocardial necrosis"
(declare-const patient_has_finding_of_myocardial_necrosis_now@@biomarkers_are_elevated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has myocardial necrosis and biomarkers are elevated.","when_to_set_to_false":"Set to false if the patient currently has myocardial necrosis and biomarkers are not elevated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether biomarkers are elevated in the context of myocardial necrosis.","meaning":"Boolean indicating whether the patient currently has myocardial necrosis with elevated biomarkers."} // "elevated biomarkers of myocardial necrosis"
(declare-const patient_has_finding_of_left_bundle_branch_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a left bundle-branch block.","when_to_set_to_false":"Set to false if the patient currently does not have a left bundle-branch block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a left bundle-branch block.","meaning":"Boolean indicating whether the patient currently has a left bundle-branch block."} // "left bundle-branch block"
(declare-const patient_has_finding_of_left_bundle_branch_block_now@@new Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a left bundle-branch block and it is new.","when_to_set_to_false":"Set to false if the patient currently has a left bundle-branch block and it is not new.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the left bundle-branch block is new.","meaning":"Boolean indicating whether the patient currently has a new left bundle-branch block."} // "new left bundle-branch block"
(declare-const patient_st_segment_elevation_value_recorded_now_withunit_millivolt Real) ;; {"when_to_set_to_value":"Set to the measured value of ST-segment elevation in millivolts if recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current ST-segment elevation in millivolts."} // "elevation of ST-segment > 0.1 millivolt"
(declare-const patient_has_finding_of_st_segment_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ST-segment depression.","when_to_set_to_false":"Set to false if the patient currently does not have ST-segment depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ST-segment depression.","meaning":"Boolean indicating whether the patient currently has ST-segment depression."} // "ST-segment depression"
(declare-const patient_has_finding_of_st_segment_depression_now@@at_least_0_05_millivolt Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ST-segment depression and the depression is at least 0.05 millivolt.","when_to_set_to_false":"Set to false if the patient currently has ST-segment depression and the depression is less than 0.05 millivolt.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ST-segment depression is at least 0.05 millivolt.","meaning":"Boolean indicating whether the patient currently has ST-segment depression of at least 0.05 millivolt."} // "new ST-segment depression ≥ 0.05 millivolt"
(declare-const patient_has_finding_of_st_segment_depression_now@@transient Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has transient ST-segment depression.","when_to_set_to_false":"Set to false if the patient currently has ST-segment depression and it is not transient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ST-segment depression is transient.","meaning":"Boolean indicating whether the patient currently has transient ST-segment depression."} // "transient ST-segment depression"
(declare-const patient_has_finding_of_inverted_t_wave_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has T wave inversion.","when_to_set_to_false":"Set to false if the patient currently does not have T wave inversion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has T wave inversion.","meaning":"Boolean indicating whether the patient currently has T wave inversion."} // "T wave inversion"
(declare-const patient_has_finding_of_inverted_t_wave_now@@at_least_0_3_millivolt_in_at_least_2_leads Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has T wave inversion of at least 0.3 millivolt in at least 2 leads.","when_to_set_to_false":"Set to false if the patient currently has T wave inversion but it is less than 0.3 millivolt or in fewer than 2 leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the T wave inversion is at least 0.3 millivolt in at least 2 leads.","meaning":"Boolean indicating whether the patient currently has T wave inversion of at least 0.3 millivolt in at least 2 leads."} // "T wave inversion ≥ 0.3 millivolt in ≥ 2 leads"
(declare-const patient_has_finding_of_myocardial_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has myocardial ischemia.","when_to_set_to_false":"Set to false if the patient currently does not have myocardial ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has myocardial ischemia.","meaning":"Boolean indicating whether the patient currently has myocardial ischemia."} // "T-wave changes consistent with myocardial ischemia"
(declare-const patient_has_symptoms_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} // "chest pain"
(declare-const patient_has_symptoms_of_chest_pain_now@@accelerating_pattern_or_recurrent_at_rest_or_minimal_effort Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain and the pain is accelerating in pattern or recurrent at rest or with minimal effort.","when_to_set_to_false":"Set to false if the patient currently has chest pain and the pain is not accelerating in pattern nor recurrent at rest nor with minimal effort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest pain is accelerating in pattern or recurrent at rest or with minimal effort.","meaning":"Boolean indicating whether the patient currently has chest pain with an accelerating pattern or recurrent at rest or with minimal effort."} // "an accelerating pattern OR recurrent episodes of chest pain at rest OR with minimal effort"
(declare-const patient_has_undergone_coronary_angiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary angiography now.","when_to_set_to_false":"Set to false if the patient has not undergone coronary angiography now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone coronary angiography now.","meaning":"Boolean indicating whether the patient has undergone coronary angiography now."} // "identification of a culprit lesion at coronary angiography"
(declare-const patient_st_segment_value_recorded_now_withunit_millivolt Real) ;; {"when_to_set_to_value":"Set to the measured value of ST-segment in millivolts if recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current ST-segment in millivolts."} // "ST-segment"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Exhaustive subcategories: acute coronary syndrome ≡ (unstable angina OR myocardial infarction)
(assert
  (! (= patient_has_diagnosis_of_acute_coronary_syndrome_now
        (or patient_has_diagnosis_of_unstable_angina_now
            patient_has_diagnosis_of_myocardial_infarction_now))
     :named REQ3_AUXILIARY0)) ;; "acute coronary syndrome with exhaustive subcategories (unstable angina OR myocardial infarction)"

;; Myocardial infarction ≡ (STEMI OR NSTEMI)
(assert
  (! (= patient_has_diagnosis_of_myocardial_infarction_now
        (or patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now
            patient_has_diagnosis_of_acute_non_st_segment_elevation_myocardial_infarction_now))
     :named REQ3_AUXILIARY1)) ;; "myocardial infarction: (STEMI OR NSTEMI)"

;; STEMI definition: (ST-segment elevation > 0.1 mV in ≥2 contiguous leads OR new LBBB) AND elevated biomarkers of myocardial necrosis
(assert
  (! (= patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_now
        (and
          (or
            (> patient_st_segment_elevation_value_recorded_now_withunit_millivolt 0.1) ;; "elevation of ST-segment > 0.1 millivolt in ≥ 2 contiguous electrocardiographic leads"
            patient_has_finding_of_left_bundle_branch_block_now@@new) ;; "new left bundle-branch block"
          patient_has_finding_of_myocardial_necrosis_now@@biomarkers_are_elevated))
     :named REQ3_AUXILIARY2)) ;; "STEMI: (elevation of ST-segment > 0.1 mV in ≥2 contiguous leads OR new LBBB) AND (elevated biomarkers of myocardial necrosis)"

;; NSTEMI definition: elevated biomarkers of myocardial necrosis AND (at least one of: (transient ST-segment elevation OR transient ST-segment depression OR T-wave changes consistent with myocardial ischemia) OR (identification of a culprit lesion at coronary angiography))
(assert
  (! (= patient_has_diagnosis_of_acute_non_st_segment_elevation_myocardial_infarction_now
        (and
          patient_has_finding_of_myocardial_necrosis_now@@biomarkers_are_elevated
          (or
            (or
              patient_has_finding_of_st_segment_depression_now@@transient ;; "transient ST-segment depression"
              ;; No explicit variable for transient ST-segment elevation, so not included
              patient_has_finding_of_inverted_t_wave_now ;; "T-wave changes consistent with myocardial ischemia"
              patient_has_finding_of_myocardial_ischemia_now)
            patient_has_finding_of_culprit_lesion_of_coronary_artery_now)))
     :named REQ3_AUXILIARY3)) ;; "NSTEMI: (elevated biomarkers of myocardial necrosis) AND (at least one of: (transient ST-segment elevation OR transient ST-segment depression OR T-wave changes consistent with myocardial ischemia) OR (identification of a culprit lesion at coronary angiography))"

;; Unstable angina definition: (accelerating pattern OR recurrent episodes of chest pain at rest OR with minimal effort) AND (new ST-segment depression ≥ 0.05 mV OR T wave inversion ≥ 0.3 mV in ≥ 2 leads)
(assert
  (! (= patient_has_diagnosis_of_unstable_angina_now
        (and
          patient_has_symptoms_of_chest_pain_now@@accelerating_pattern_or_recurrent_at_rest_or_minimal_effort
          (or
            patient_has_finding_of_st_segment_depression_now@@at_least_0_05_millivolt
            patient_has_finding_of_inverted_t_wave_now@@at_least_0_3_millivolt_in_at_least_2_leads)))
     :named REQ3_AUXILIARY4)) ;; "Unstable angina: (an accelerating pattern OR recurrent episodes of chest pain at rest OR with minimal effort) AND (new ST-segment depression ≥ 0.05 millivolt OR T wave inversion ≥ 0.3 millivolt in ≥ 2 leads)"

;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_finding_of_left_bundle_branch_block_now@@new
         patient_has_finding_of_left_bundle_branch_block_now)
     :named REQ3_AUXILIARY5)) ;; "new left bundle-branch block" implies "left bundle-branch block"

(assert
  (! (=> patient_has_finding_of_st_segment_depression_now@@at_least_0_05_millivolt
         patient_has_finding_of_st_segment_depression_now)
     :named REQ3_AUXILIARY6)) ;; "ST-segment depression ≥ 0.05 millivolt" implies "ST-segment depression"

(assert
  (! (=> patient_has_finding_of_st_segment_depression_now@@transient
         patient_has_finding_of_st_segment_depression_now)
     :named REQ3_AUXILIARY7)) ;; "transient ST-segment depression" implies "ST-segment depression"

(assert
  (! (=> patient_has_finding_of_inverted_t_wave_now@@at_least_0_3_millivolt_in_at_least_2_leads
         patient_has_finding_of_inverted_t_wave_now)
     :named REQ3_AUXILIARY8)) ;; "T wave inversion ≥ 0.3 millivolt in ≥ 2 leads" implies "T wave inversion"

(assert
  (! (=> patient_has_finding_of_myocardial_necrosis_now@@biomarkers_are_elevated
         patient_has_finding_of_myocardial_necrosis_now)
     :named REQ3_AUXILIARY9)) ;; "myocardial necrosis with elevated biomarkers" implies "myocardial necrosis"

(assert
  (! (=> patient_has_symptoms_of_chest_pain_now@@accelerating_pattern_or_recurrent_at_rest_or_minimal_effort
         patient_has_symptoms_of_chest_pain_now)
     :named REQ3_AUXILIARY10)) ;; "chest pain with accelerating pattern or recurrent at rest or minimal effort" implies "chest pain"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_diagnosis_of_acute_coronary_syndrome_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have (a clinical diagnosis of acute coronary syndrome with exhaustive subcategories (unstable angina OR myocardial infarction)), defined as follows: ..."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const target_lesion_is_located_in_native_coronary_artery_now Bool) ;; {"when_to_set_to_true":"Set to true if the target lesion or target lesions are located in a native coronary artery at the current time.","when_to_set_to_false":"Set to false if the target lesion or target lesions are not located in a native coronary artery at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the target lesion or target lesions are located in a native coronary artery at the current time.","meaning":"Boolean indicating whether the target lesion or target lesions are located in a native coronary artery now."} // "target lesion or target lesions ... must be located in a native coronary artery"
(declare-const target_lesion_diameter_value_recorded_now_in_millimeters Real) ;; {"when_to_set_to_value":"Set to the visually estimated diameter in millimeters of the target lesion or target lesions located in a native coronary artery, as recorded at the current time.","when_to_set_to_null":"Set to null if the visually estimated diameter in millimeters of the target lesion or target lesions located in a native coronary artery is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value for the visually estimated diameter in millimeters of the target lesion or target lesions located in a native coronary artery, recorded now."} // "visually estimated diameter ≥ 2.25 millimeters AND ≤ 4.25 millimeters"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! target_lesion_is_located_in_native_coronary_artery_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "target lesion or target lesions ... must be located in a native coronary artery"

(assert
  (! (and (>= target_lesion_diameter_value_recorded_now_in_millimeters 2.25)
          (<= target_lesion_diameter_value_recorded_now_in_millimeters 4.25))
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "visually estimated diameter ≥ 2.25 millimeters AND ≤ 4.25 millimeters"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_can_undergo_percutaneous_coronary_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo percutaneous coronary intervention (PCI).","when_to_set_to_false":"Set to false if the patient cannot currently undergo percutaneous coronary intervention (PCI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo percutaneous coronary intervention (PCI).","meaning":"Boolean indicating whether the patient can currently undergo percutaneous coronary intervention (PCI)."} // "percutaneous coronary intervention"
(declare-const patient_can_undergo_percutaneous_coronary_intervention_now@@target_lesion_amenable_for_percutaneous_coronary_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the target lesion(s) are amenable for percutaneous coronary intervention (PCI).","when_to_set_to_false":"Set to false if the target lesion(s) are not amenable for percutaneous coronary intervention (PCI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the target lesion(s) are amenable for PCI.","meaning":"Boolean indicating whether the target lesion(s) are amenable for percutaneous coronary intervention (PCI)."} // "the target lesion or target lesions of the patient must be amenable for percutaneous coronary intervention"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_can_undergo_percutaneous_coronary_intervention_now@@target_lesion_amenable_for_percutaneous_coronary_intervention
         patient_can_undergo_percutaneous_coronary_intervention_now)
     :named REQ5_AUXILIARY0)) ;; "the target lesion or target lesions of the patient must be amenable for percutaneous coronary intervention"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_can_undergo_percutaneous_coronary_intervention_now@@target_lesion_amenable_for_percutaneous_coronary_intervention
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the target lesion or target lesions of the patient must be amenable for percutaneous coronary intervention"
