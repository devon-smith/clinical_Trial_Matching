;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} // "To be included, the patient must provide written informed consent."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide written informed consent."

;; ===================== Declarations for the inclusion criteria (REQ 1) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is currently recorded as male.","when_to_set_to_false":"Set to false if the patient's sex is currently recorded as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} // "To be included, the patient must be male or female."
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is currently recorded as female.","when_to_set_to_false":"Set to false if the patient's sex is currently recorded as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} // "To be included, the patient must be male or female."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 79 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must be male or female.
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; Component 1: The patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 2: The patient must be aged ≤ 79 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 79)
     :named REQ1_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≤ 79 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_able_to_perform_sheffield_modified_bruce_treadmill_exercise_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to perform a Sheffield Modified Bruce Treadmill Exercise Protocol.","when_to_set_to_false":"Set to false if the patient is currently unable to perform a Sheffield Modified Bruce Treadmill Exercise Protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to perform a Sheffield Modified Bruce Treadmill Exercise Protocol.","meaning":"Boolean indicating whether the patient is currently able to perform a Sheffield Modified Bruce Treadmill Exercise Protocol."} // "To be included, the patient must be able to perform a Sheffield Modified Bruce Treadmill Exercise Protocol."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_able_to_perform_sheffield_modified_bruce_treadmill_exercise_protocol_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to perform a Sheffield Modified Bruce Treadmill Exercise Protocol."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const chronic_stable_angina_duration_value_recorded_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient has had chronic stable angina, if known.","when_to_set_to_null":"Set to null if the duration of chronic stable angina is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the duration, in months, of the patient's chronic stable angina history."} // "To be included, the patient must have a history of chronic stable angina with duration ≥ 3 months."
(declare-const patient_has_finding_of_angina_pectoris_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of angina pectoris (chronic stable angina) at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of angina pectoris (chronic stable angina) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of angina pectoris (chronic stable angina).","meaning":"Boolean indicating whether the patient has a history of angina pectoris (chronic stable angina) at any time in the past."} // "To be included, the patient must have a history of chronic stable angina with duration ≥ 3 months."
(declare-const patient_has_finding_of_chronic_stable_angina_relieved_by_rest_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of chronic stable angina that is relieved by rest.","when_to_set_to_false":"Set to false if the patient has a documented history of chronic stable angina that is not relieved by rest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic stable angina is relieved by rest.","meaning":"Boolean indicating whether the patient has a history of chronic stable angina that is relieved by rest."} // "To be included, the patient must have chronic stable angina relieved by rest."
(declare-const patient_has_finding_of_chronic_stable_angina_relieved_by_sublingual_nitroglycerin_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of chronic stable angina that is relieved by sublingual nitroglycerin.","when_to_set_to_false":"Set to false if the patient has a documented history of chronic stable angina that is not relieved by sublingual nitroglycerin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic stable angina is relieved by sublingual nitroglycerin.","meaning":"Boolean indicating whether the patient has a history of chronic stable angina that is relieved by sublingual nitroglycerin."} // "To be included, the patient must have chronic stable angina relieved by sublingual nitroglycerin."
(declare-const patient_has_finding_of_chronic_stable_angina_triggered_by_physical_effort_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of chronic stable angina that is triggered by physical effort.","when_to_set_to_false":"Set to false if the patient has a documented history of chronic stable angina that is not triggered by physical effort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic stable angina is triggered by physical effort.","meaning":"Boolean indicating whether the patient has a history of chronic stable angina that is triggered by physical effort."} // "To be included, the patient must have chronic stable angina triggered by physical effort."

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: The patient must have a history of chronic stable angina with duration ≥ 3 months.
(assert
  (! (and patient_has_finding_of_angina_pectoris_inthehistory
          (>= chronic_stable_angina_duration_value_recorded_in_months 3.0))
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a history of chronic stable angina with duration ≥ 3 months."

;; Component 1: The patient must have chronic stable angina triggered by physical effort.
(assert
  (! patient_has_finding_of_chronic_stable_angina_triggered_by_physical_effort_in_the_history
     :named REQ3_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have chronic stable angina triggered by physical effort."

;; Component 2: The patient must have chronic stable angina relieved by rest OR by sublingual nitroglycerin.
(assert
  (! (or patient_has_finding_of_chronic_stable_angina_relieved_by_rest_in_the_history
         patient_has_finding_of_chronic_stable_angina_relieved_by_sublingual_nitroglycerin_in_the_history)
     :named REQ3_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have chronic stable angina relieved by rest or chronic stable angina relieved by sublingual nitroglycerin."

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with coronary artery disease (coronary arteriosclerosis) at any time in their history, regardless of how it was documented.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with coronary artery disease (coronary arteriosclerosis) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with coronary artery disease (coronary arteriosclerosis).","meaning":"Boolean indicating whether the patient has ever been diagnosed with coronary artery disease (coronary arteriosclerosis) at any time in their history."} // "To be included, the patient must have coronary artery disease documented by at least one of the following: ..."

(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@documented_by_angiographic_evidence_of_stenosis_50_percent_or_greater_in_major_coronary_artery Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of coronary artery disease is documented by angiographic evidence of stenosis 50 percent or greater in at least one major coronary artery.","when_to_set_to_false":"Set to false if the patient's diagnosis of coronary artery disease is not documented by angiographic evidence of stenosis 50 percent or greater in at least one major coronary artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is documented by angiographic evidence of stenosis 50 percent or greater in at least one major coronary artery.","meaning":"Boolean indicating whether the diagnosis of coronary artery disease is documented by angiographic evidence of stenosis 50 percent or greater in at least one major coronary artery."} // "angiographic evidence of stenosis ≥ 50 percent of at least one major coronary artery"

(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@documented_by_history_of_myocardial_infarction_with_positive_ck_mb Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of coronary artery disease is documented by a history of myocardial infarction documented by positive creatine kinase-MB (CK-MB) enzymes.","when_to_set_to_false":"Set to false if the patient's diagnosis of coronary artery disease is not documented by a history of myocardial infarction documented by positive creatine kinase-MB (CK-MB) enzymes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is documented by a history of myocardial infarction documented by positive creatine kinase-MB (CK-MB) enzymes.","meaning":"Boolean indicating whether the diagnosis of coronary artery disease is documented by a history of myocardial infarction documented by positive creatine kinase-MB (CK-MB) enzymes."} // "history of myocardial infarction documented by positive creatine kinase-MB (CK-MB) enzymes"

(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@documented_by_history_of_myocardial_infarction_with_positive_troponins Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of coronary artery disease is documented by a history of myocardial infarction documented by positive troponins.","when_to_set_to_false":"Set to false if the patient's diagnosis of coronary artery disease is not documented by a history of myocardial infarction documented by positive troponins.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is documented by a history of myocardial infarction documented by positive troponins.","meaning":"Boolean indicating whether the diagnosis of coronary artery disease is documented by a history of myocardial infarction documented by positive troponins."} // "history of myocardial infarction documented by positive troponins"

(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@documented_by_history_of_myocardial_infarction_with_ecg_changes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of coronary artery disease is documented by a history of myocardial infarction documented by electrocardiogram (ECG) changes.","when_to_set_to_false":"Set to false if the patient's diagnosis of coronary artery disease is not documented by a history of myocardial infarction documented by electrocardiogram (ECG) changes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is documented by a history of myocardial infarction documented by electrocardiogram (ECG) changes.","meaning":"Boolean indicating whether the diagnosis of coronary artery disease is documented by a history of myocardial infarction documented by electrocardiogram (ECG) changes."} // "history of myocardial infarction documented by electrocardiogram changes"

(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@documented_by_cardiac_nuclear_scan_or_stress_echo_or_pharmacologic_stress_echo Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of coronary artery disease is documented by cardiac nuclear scan studies diagnostic of coronary artery disease (e.g., thallium scan, echocardiogram with stress, or echocardiogram with pharmacologic interventions such as adenosine or dipyridamole).","when_to_set_to_false":"Set to false if the patient's diagnosis of coronary artery disease is not documented by such cardiac nuclear scan studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is documented by such cardiac nuclear scan studies.","meaning":"Boolean indicating whether the diagnosis of coronary artery disease is documented by cardiac nuclear scan studies diagnostic of coronary artery disease (e.g., thallium scan, echocardiogram with stress, or echocardiogram with pharmacologic interventions such as adenosine or dipyridamole)."} // "cardiac nuclear scan studies diagnostic of coronary artery disease, for example, thallium scan OR echocardiogram with stress OR echocardiogram with pharmacologic interventions (adenosine, dipyridamole, etc.)"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@documented_by_angiographic_evidence_of_stenosis_50_percent_or_greater_in_major_coronary_artery
         patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory)
     :named REQ4_AUXILIARY0)) ;; "angiographic evidence of stenosis ≥ 50 percent of at least one major coronary artery"

(assert
  (! (=> patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@documented_by_history_of_myocardial_infarction_with_positive_ck_mb
         patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory)
     :named REQ4_AUXILIARY1)) ;; "history of myocardial infarction documented by positive creatine kinase-MB (CK-MB) enzymes"

(assert
  (! (=> patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@documented_by_history_of_myocardial_infarction_with_positive_troponins
         patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory)
     :named REQ4_AUXILIARY2)) ;; "history of myocardial infarction documented by positive troponins"

(assert
  (! (=> patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@documented_by_history_of_myocardial_infarction_with_ecg_changes
         patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory)
     :named REQ4_AUXILIARY3)) ;; "history of myocardial infarction documented by electrocardiogram changes"

(assert
  (! (=> patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@documented_by_cardiac_nuclear_scan_or_stress_echo_or_pharmacologic_stress_echo
         patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory)
     :named REQ4_AUXILIARY4)) ;; "cardiac nuclear scan studies diagnostic of coronary artery disease, for example, thallium scan OR echocardiogram with stress OR echocardiogram with pharmacologic interventions (adenosine, dipyridamole, etc.)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; At least one documentation method must be present
(assert
  (! (or patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@documented_by_angiographic_evidence_of_stenosis_50_percent_or_greater_in_major_coronary_artery
         patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@documented_by_history_of_myocardial_infarction_with_positive_ck_mb
         patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@documented_by_history_of_myocardial_infarction_with_positive_troponins
         patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@documented_by_history_of_myocardial_infarction_with_ecg_changes
         patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@documented_by_cardiac_nuclear_scan_or_stress_echo_or_pharmacologic_stress_echo)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have coronary artery disease documented by at least one of the following: ..."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a beta-adrenergic receptor antagonist containing product (beta-blocker).","when_to_set_to_false":"Set to false if the patient is currently not taking a beta-adrenergic receptor antagonist containing product (beta-blocker).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a beta-adrenergic receptor antagonist containing product (beta-blocker).","meaning":"Boolean indicating whether the patient is currently taking a beta-adrenergic receptor antagonist containing product (beta-blocker)."} // "beta-blocker"
(declare-const patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now@@stable_treatment_regimen Bool) ;; {"when_to_set_to_true":"Set to true if the patient's beta-blocker use is part of a stable treatment regimen.","when_to_set_to_false":"Set to false if the patient's beta-blocker use is not part of a stable treatment regimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's beta-blocker use is part of a stable treatment regimen.","meaning":"Boolean indicating whether the patient's beta-blocker use is part of a stable treatment regimen."} // "stable treatment"
(declare-const patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now@@used_for_at_least_4_weeks_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been taking a beta-blocker for at least 4 weeks prior to screening.","when_to_set_to_false":"Set to false if the patient has not been taking a beta-blocker for at least 4 weeks prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been taking a beta-blocker for at least 4 weeks prior to screening.","meaning":"Boolean indicating whether the patient has been taking a beta-blocker for at least 4 weeks prior to screening."} // "for ≥ 4 weeks prior to Screening"
(declare-const patient_is_exposed_to_dihydropyridine_derivative_calcium_channel_blocker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a dihydropyridine derivative calcium channel blocker.","when_to_set_to_false":"Set to false if the patient is currently not exposed to a dihydropyridine derivative calcium channel blocker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a dihydropyridine derivative calcium channel blocker.","meaning":"Boolean indicating whether the patient is currently exposed to a dihydropyridine derivative calcium channel blocker."} // "dihydropyridine calcium-channel blocker"
(declare-const patient_is_exposed_to_dihydropyridine_derivative_calcium_channel_blocker_now@@used_for_at_least_4_weeks_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a dihydropyridine calcium-channel blocker for at least 4 weeks prior to screening.","when_to_set_to_false":"Set to false if the patient has not been exposed to a dihydropyridine calcium-channel blocker for at least 4 weeks prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a dihydropyridine calcium-channel blocker for at least 4 weeks prior to screening.","meaning":"Boolean indicating whether the patient has been exposed to a dihydropyridine calcium-channel blocker for at least 4 weeks prior to screening."} // "for ≥ 4 weeks prior to Screening"
(declare-const patient_is_exposed_to_non_dihydropyridine_derivative_calcium_channel_blocker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a non-dihydropyridine derivative calcium channel blocker.","when_to_set_to_false":"Set to false if the patient is currently not exposed to a non-dihydropyridine derivative calcium channel blocker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a non-dihydropyridine derivative calcium channel blocker.","meaning":"Boolean indicating whether the patient is currently exposed to a non-dihydropyridine derivative calcium channel blocker."} // "non-dihydropyridine calcium-channel blocker"
(declare-const patient_is_exposed_to_non_dihydropyridine_derivative_calcium_channel_blocker_now@@used_for_at_least_4_weeks_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a non-dihydropyridine calcium-channel blocker for at least 4 weeks prior to screening.","when_to_set_to_false":"Set to false if the patient has not been exposed to a non-dihydropyridine calcium-channel blocker for at least 4 weeks prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a non-dihydropyridine calcium-channel blocker for at least 4 weeks prior to screening.","meaning":"Boolean indicating whether the patient has been exposed to a non-dihydropyridine calcium-channel blocker for at least 4 weeks prior to screening."} // "for ≥ 4 weeks prior to Screening"

;; Non-exhaustive examples (atenolol, metoprolol, amlodipine, nifedipine, diltiazem, verapamil) are only examples, not exhaustive, so we do not declare variables for them unless needed for other requirements.

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now@@stable_treatment_regimen
         patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now)
     :named REQ5_AUXILIARY0)) ;; "stable treatment with beta-blocker"

(assert
  (! (=> patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now@@used_for_at_least_4_weeks_prior_to_screening
         patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now)
     :named REQ5_AUXILIARY1)) ;; "beta-blocker for ≥ 4 weeks prior to Screening"

(assert
  (! (=> patient_is_exposed_to_dihydropyridine_derivative_calcium_channel_blocker_now@@used_for_at_least_4_weeks_prior_to_screening
         patient_is_exposed_to_dihydropyridine_derivative_calcium_channel_blocker_now)
     :named REQ5_AUXILIARY2)) ;; "dihydropyridine calcium-channel blocker for ≥ 4 weeks prior to Screening"

(assert
  (! (=> patient_is_exposed_to_non_dihydropyridine_derivative_calcium_channel_blocker_now@@used_for_at_least_4_weeks_prior_to_screening
         patient_is_exposed_to_non_dihydropyridine_derivative_calcium_channel_blocker_now)
     :named REQ5_AUXILIARY3)) ;; "non-dihydropyridine calcium-channel blocker for ≥ 4 weeks prior to Screening"

;; ===================== Constraint Assertions (REQ 5) =====================
;; The patient must be on stable treatment with at least one of the following antianginal medications for ≥ 4 weeks prior to Screening:
;; (beta-blocker AND stable AND ≥4 weeks) OR (dihydropyridine calcium-channel blocker AND ≥4 weeks) OR (non-dihydropyridine calcium-channel blocker AND ≥4 weeks)
(assert
  (! (or
        (and patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now@@stable_treatment_regimen
             patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now@@used_for_at_least_4_weeks_prior_to_screening)
        patient_is_exposed_to_dihydropyridine_derivative_calcium_channel_blocker_now@@used_for_at_least_4_weeks_prior_to_screening
        patient_is_exposed_to_non_dihydropyridine_derivative_calcium_channel_blocker_now@@used_for_at_least_4_weeks_prior_to_screening)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be on stable treatment with at least one of the following antianginal medications for ≥ 4 weeks prior to Screening: ..."

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const patient_is_willing_to_discontinue_other_antianginal_medications_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to discontinue other antianginal medications.","when_to_set_to_false":"Set to false if the patient is currently unwilling to discontinue other antianginal medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to discontinue other antianginal medications.","meaning":"Boolean indicating whether the patient is currently willing to discontinue other antianginal medications."} // "To be included, the patient must be willing to discontinue other antianginal medications."
(declare-const patient_is_willing_to_be_treated_with_allowed_antianginal_therapies_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to be treated with one of the allowed antianginal therapies.","when_to_set_to_false":"Set to false if the patient is currently unwilling to be treated with one of the allowed antianginal therapies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to be treated with one of the allowed antianginal therapies.","meaning":"Boolean indicating whether the patient is currently willing to be treated with one of the allowed antianginal therapies."} // "To be included, the patient must be willing to be treated with one of the allowed antianginal therapies."
(declare-const patient_can_undergo_antianginal_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able and willing to undergo antianginal therapy.","when_to_set_to_false":"Set to false if the patient is currently unable or unwilling to undergo antianginal therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able and willing to undergo antianginal therapy.","meaning":"Boolean indicating whether the patient is currently able and willing to undergo antianginal therapy."} // "antianginal therapies"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_is_willing_to_discontinue_other_antianginal_medications_now
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to discontinue other antianginal medications."

(assert
  (! patient_is_willing_to_be_treated_with_allowed_antianginal_therapies_now
     :named REQ6_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to be treated with one of the allowed antianginal therapies."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_type_2_diabetes_mellitus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of type 2 diabetes mellitus at any time in the past (i.e., in their history).","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of type 2 diabetes mellitus in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of type 2 diabetes mellitus.","meaning":"Boolean indicating whether the patient has a documented history of type 2 diabetes mellitus."} // "To be included, the patient must have a documented history of type 2 diabetes mellitus."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_has_diagnosis_of_type_2_diabetes_mellitus_inthehistory
     :named REQ7_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a documented history of type 2 diabetes mellitus."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_agrees_to_utilize_highly_effective_contraception_methods_from_screening_throughout_study_and_14days_post_last_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to utilize highly effective contraception methods from Screening throughout the duration of study treatment and for 14 days following the last dose of study drug.","when_to_set_to_false":"Set to false if the patient does not agree to utilize highly effective contraception methods for the entire required period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to utilize highly effective contraception methods for the required period.","meaning":"Boolean indicating whether the patient agrees to utilize highly effective contraception methods from Screening throughout the duration of study treatment and for 14 days following the last dose of study drug."} // "the patient must agree to utilize highly effective contraception methods from Screening throughout the duration of study treatment AND for 14 days following the last dose of study drug."
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently considered not to have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} // "female of childbearing potential"
(declare-const patient_is_exposed_to_drug_or_medicament_inthefuture14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient will be exposed to a drug or medicament during the 14 days following the last dose of study drug.","when_to_set_to_false":"Set to false if the patient will not be exposed to a drug or medicament during the 14 days following the last dose of study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will be exposed to a drug or medicament during the 14 days following the last dose of study drug.","meaning":"Boolean indicating whether the patient will be exposed to a drug or medicament during the 14 days following the last dose of study drug."} // "for 14 days following the last dose of study drug"
(declare-const patient_is_exposed_to_drug_or_medicament_inthefuture14days@@temporalcontext_within14days_after_last_dose_of_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the exposure occurs within 14 days after the last dose of study drug.","when_to_set_to_false":"Set to false if the exposure does not occur within 14 days after the last dose of study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurs within 14 days after the last dose of study drug.","meaning":"Boolean indicating whether the exposure to drug or medicament occurs within 14 days after the last dose of study drug."} // "for 14 days following the last dose of study drug"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_exposed_to_drug_or_medicament_inthefuture14days@@temporalcontext_within14days_after_last_dose_of_study_drug
         patient_is_exposed_to_drug_or_medicament_inthefuture14days)
     :named REQ8_AUXILIARY0)) ;; "for 14 days following the last dose of study drug"

;; ===================== Constraint Assertions (REQ 8) =====================
;; If the patient is a female of childbearing potential, she must agree to utilize highly effective contraception methods for the required period
(assert
  (! (or (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
         patient_agrees_to_utilize_highly_effective_contraception_methods_from_screening_throughout_study_and_14days_post_last_dose)
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is a female of childbearing potential, the patient must agree to utilize highly effective contraception methods from Screening throughout the duration of study treatment AND for 14 days following the last dose of study drug."
