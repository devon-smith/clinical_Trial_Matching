;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_ventricular_pre_excitation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ventricular pre-excitation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ventricular pre-excitation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of ventricular pre-excitation.","meaning":"Boolean indicating whether the patient currently has ventricular pre-excitation."} ;; "pre-excitation"
(declare-const patient_has_finding_of_abnormal_cardiac_conduction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of abnormal cardiac conduction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of abnormal cardiac conduction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of abnormal cardiac conduction.","meaning":"Boolean indicating whether the patient currently has abnormal cardiac conduction."} ;; "conduction abnormality"
(declare-const patient_has_finding_of_rhythm_from_artificial_pacing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of rhythm from artificial pacing (pacemaker rhythm).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of rhythm from artificial pacing (pacemaker rhythm).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of rhythm from artificial pacing (pacemaker rhythm).","meaning":"Boolean indicating whether the patient currently has rhythm from artificial pacing (pacemaker rhythm)."} ;; "pacemaker rhythm"
(declare-const patient_has_finding_of_preinfarction_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of preinfarction syndrome (unstable angina).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of preinfarction syndrome (unstable angina).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of preinfarction syndrome (unstable angina).","meaning":"Boolean indicating whether the patient currently has preinfarction syndrome (unstable angina)."} ;; "unstable angina"
(declare-const patient_has_finding_of_myocardial_infarction_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the past 3 months.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the past 3 months."} ;; "myocardial infarction within the preceding 3 months"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_ventricular_pre_excitation_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pre-excitation."

(assert
(! (not patient_has_finding_of_abnormal_cardiac_conduction_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has conduction abnormality."

(assert
(! (not patient_has_finding_of_rhythm_from_artificial_pacing_now)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pacemaker rhythm."

(assert
(! (not patient_has_finding_of_preinfarction_syndrome_now)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable angina."

(assert
(! (not patient_has_finding_of_myocardial_infarction_inthepast3months)
:named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has myocardial infarction within the preceding 3 months."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "heart failure"
(declare-const patient_has_finding_of_heart_failure_now@@classified_as_nyha_class_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart failure is classified as New York Heart Association class III.","when_to_set_to_false":"Set to false if the patient's current heart failure is not classified as New York Heart Association class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart failure is classified as New York Heart Association class III.","meaning":"Boolean indicating whether the patient's current heart failure is classified as New York Heart Association class III."} ;; "heart failure (New York Heart Association class III)"
(declare-const patient_has_finding_of_heart_failure_now@@classified_as_nyha_class_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart failure is classified as New York Heart Association class IV.","when_to_set_to_false":"Set to false if the patient's current heart failure is not classified as New York Heart Association class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart failure is classified as New York Heart Association class IV.","meaning":"Boolean indicating whether the patient's current heart failure is classified as New York Heart Association class IV."} ;; "heart failure (New York Heart Association class IV)"
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has valvular heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have valvular heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has valvular heart disease.","meaning":"Boolean indicating whether the patient currently has valvular heart disease."} ;; "valvular heart disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@uncorrected Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has valvular heart disease and the disease is uncorrected.","when_to_set_to_false":"Set to false if the patient currently has valvular heart disease but the disease is corrected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the valvular heart disease is uncorrected.","meaning":"Boolean indicating whether the patient's current valvular heart disease is uncorrected."} ;; "uncorrected valvular heart disease"
(declare-const patient_has_finding_of_congenital_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congenital heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have congenital heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congenital heart disease.","meaning":"Boolean indicating whether the patient currently has congenital heart disease."} ;; "congenital heart disease"
(declare-const patient_has_finding_of_congenital_heart_disease_now@@uncorrected Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congenital heart disease and the disease is uncorrected.","when_to_set_to_false":"Set to false if the patient currently has congenital heart disease but the disease is corrected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the congenital heart disease is uncorrected.","meaning":"Boolean indicating whether the patient's current congenital heart disease is uncorrected."} ;; "uncorrected congenital heart disease"
(declare-const patient_is_exposed_to_digoxin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to digoxin.","when_to_set_to_false":"Set to false if the patient is currently not exposed to digoxin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to digoxin.","meaning":"Boolean indicating whether the patient is currently exposed to digoxin."} ;; "digoxin"
(declare-const patient_is_exposed_to_digoxin_now@@needed_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to digoxin and the exposure is because it is needed as judged by the investigator.","when_to_set_to_false":"Set to false if the patient is currently exposed to digoxin but not because it is needed as judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is because it is needed as judged by the investigator.","meaning":"Boolean indicating whether the patient's current exposure to digoxin is because it is needed as judged by the investigator."} ;; "needs digoxin as judged by the investigator"
(declare-const patient_is_exposed_to_isosorbide_mononitrate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to isosorbide mononitrate.","when_to_set_to_false":"Set to false if the patient is currently not exposed to isosorbide mononitrate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to isosorbide mononitrate.","meaning":"Boolean indicating whether the patient is currently exposed to isosorbide mononitrate."} ;; "isosorbide mononitrate"
(declare-const patient_is_exposed_to_isosorbide_mononitrate_now@@needed_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to isosorbide mononitrate and the exposure is because it is needed as judged by the investigator.","when_to_set_to_false":"Set to false if the patient is currently exposed to isosorbide mononitrate but not because it is needed as judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is because it is needed as judged by the investigator.","meaning":"Boolean indicating whether the patient's current exposure to isosorbide mononitrate is because it is needed as judged by the investigator."} ;; "needs isosorbide mononitrate as judged by the investigator"
(declare-const patient_is_taking_nitroglycerin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a nitroglycerin-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a nitroglycerin-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a nitroglycerin-containing product.","meaning":"Boolean indicating whether the patient is currently taking a nitroglycerin-containing product."} ;; "nitroglycerin"
(declare-const patient_is_taking_nitroglycerin_containing_product_now@@needed_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a nitroglycerin-containing product and the exposure is because it is needed as judged by the investigator.","when_to_set_to_false":"Set to false if the patient is currently taking a nitroglycerin-containing product but not because it is needed as judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is because it is needed as judged by the investigator.","meaning":"Boolean indicating whether the patient's current exposure to nitroglycerin-containing product is because it is needed as judged by the investigator."} ;; "needs nitroglycerin sustained release preparation as judged by the investigator"
(declare-const patient_is_taking_nitroglycerin_containing_product_now@@sustained_release_preparation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a nitroglycerin-containing product and the product is a sustained release preparation.","when_to_set_to_false":"Set to false if the patient is currently taking a nitroglycerin-containing product but the product is not a sustained release preparation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the nitroglycerin-containing product is a sustained release preparation.","meaning":"Boolean indicating whether the patient's current nitroglycerin-containing product exposure is specifically a sustained release preparation."} ;; "nitroglycerin sustained release preparation"
(declare-const patient_is_exposed_to_theophylline_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to theophylline.","when_to_set_to_false":"Set to false if the patient is currently not exposed to theophylline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to theophylline.","meaning":"Boolean indicating whether the patient is currently exposed to theophylline."} ;; "theophylline"
(declare-const patient_is_exposed_to_theophylline_now@@needed_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to theophylline and the exposure is because it is needed as judged by the investigator.","when_to_set_to_false":"Set to false if the patient is currently exposed to theophylline but not because it is needed as judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is because it is needed as judged by the investigator.","meaning":"Boolean indicating whether the patient's current exposure to theophylline is because it is needed as judged by the investigator."} ;; "needs theophylline as judged by the investigator"
(declare-const patient_is_exposed_to_class_i_antiarrhythmic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a class I antiarrhythmic agent.","when_to_set_to_false":"Set to false if the patient is currently not exposed to a class I antiarrhythmic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a class I antiarrhythmic agent.","meaning":"Boolean indicating whether the patient is currently exposed to a class I antiarrhythmic agent."} ;; "class I antiarrhythmic agent"
(declare-const patient_is_exposed_to_class_i_antiarrhythmic_agent_now@@needed_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a class I antiarrhythmic agent and the exposure is because it is needed as judged by the investigator.","when_to_set_to_false":"Set to false if the patient is currently exposed to a class I antiarrhythmic agent but not because it is needed as judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is because it is needed as judged by the investigator.","meaning":"Boolean indicating whether the patient's current exposure to a class I antiarrhythmic agent is because it is needed as judged by the investigator."} ;; "needs class I antiarrhythmic agent as judged by the investigator"
(declare-const patient_is_exposed_to_digitalis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to digitalis.","when_to_set_to_false":"Set to false if the patient is currently not exposed to digitalis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to digitalis.","meaning":"Boolean indicating whether the patient is currently exposed to digitalis."} ;; "digitalis"
(declare-const patient_is_exposed_to_digitalis_now@@needed_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to digitalis and the exposure is because it is needed as judged by the investigator.","when_to_set_to_false":"Set to false if the patient is currently exposed to digitalis but not because it is needed as judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is because it is needed as judged by the investigator.","meaning":"Boolean indicating whether the patient's current exposure to digitalis is because it is needed as judged by the investigator."} ;; "needs digitalis as judged by the investigator"
(declare-const patient_is_exposed_to_monoamine_oxidase_inhibitor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a monoamine oxidase inhibitor.","when_to_set_to_false":"Set to false if the patient is currently not exposed to a monoamine oxidase inhibitor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a monoamine oxidase inhibitor.","meaning":"Boolean indicating whether the patient is currently exposed to a monoamine oxidase inhibitor."} ;; "monoamine oxidase inhibitor"
(declare-const patient_is_exposed_to_monoamine_oxidase_inhibitor_now@@needed_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a monoamine oxidase inhibitor and the exposure is because it is needed as judged by the investigator.","when_to_set_to_false":"Set to false if the patient is currently exposed to a monoamine oxidase inhibitor but not because it is needed as judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is because it is needed as judged by the investigator.","meaning":"Boolean indicating whether the patient's current exposure to a monoamine oxidase inhibitor is because it is needed as judged by the investigator."} ;; "needs monoamine oxidase inhibitor as judged by the investigator"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_heart_failure_now@@classified_as_nyha_class_iii
       patient_has_finding_of_heart_failure_now)
:named REQ1_AUXILIARY0)) ;; "heart failure (New York Heart Association class III)"

(assert
(! (=> patient_has_finding_of_heart_failure_now@@classified_as_nyha_class_iv
       patient_has_finding_of_heart_failure_now)
:named REQ1_AUXILIARY1)) ;; "heart failure (New York Heart Association class IV)"

(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@uncorrected
       patient_has_finding_of_heart_valve_disorder_now)
:named REQ1_AUXILIARY2)) ;; "uncorrected valvular heart disease"

(assert
(! (=> patient_has_finding_of_congenital_heart_disease_now@@uncorrected
       patient_has_finding_of_congenital_heart_disease_now)
:named REQ1_AUXILIARY3)) ;; "uncorrected congenital heart disease"

(assert
(! (=> patient_is_exposed_to_digoxin_now@@needed_as_judged_by_investigator
       patient_is_exposed_to_digoxin_now)
:named REQ1_AUXILIARY4)) ;; "needs digoxin as judged by the investigator"

(assert
(! (=> patient_is_exposed_to_isosorbide_mononitrate_now@@needed_as_judged_by_investigator
       patient_is_exposed_to_isosorbide_mononitrate_now)
:named REQ1_AUXILIARY5)) ;; "needs isosorbide mononitrate as judged by the investigator"

(assert
(! (=> patient_is_taking_nitroglycerin_containing_product_now@@needed_as_judged_by_investigator
       patient_is_taking_nitroglycerin_containing_product_now)
:named REQ1_AUXILIARY6)) ;; "needs nitroglycerin sustained release preparation as judged by the investigator"

(assert
(! (=> patient_is_taking_nitroglycerin_containing_product_now@@sustained_release_preparation
       patient_is_taking_nitroglycerin_containing_product_now)
:named REQ1_AUXILIARY7)) ;; "nitroglycerin sustained release preparation"

(assert
(! (=> patient_is_exposed_to_theophylline_now@@needed_as_judged_by_investigator
       patient_is_exposed_to_theophylline_now)
:named REQ1_AUXILIARY8)) ;; "needs theophylline as judged by the investigator"

(assert
(! (=> patient_is_exposed_to_class_i_antiarrhythmic_agent_now@@needed_as_judged_by_investigator
       patient_is_exposed_to_class_i_antiarrhythmic_agent_now)
:named REQ1_AUXILIARY9)) ;; "needs class I antiarrhythmic agent as judged by the investigator"

(assert
(! (=> patient_is_exposed_to_digitalis_now@@needed_as_judged_by_investigator
       patient_is_exposed_to_digitalis_now)
:named REQ1_AUXILIARY10)) ;; "needs digitalis as judged by the investigator"

(assert
(! (=> patient_is_exposed_to_monoamine_oxidase_inhibitor_now@@needed_as_judged_by_investigator
       patient_is_exposed_to_monoamine_oxidase_inhibitor_now)
:named REQ1_AUXILIARY11)) ;; "needs monoamine oxidase inhibitor as judged by the investigator"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_heart_failure_now@@classified_as_nyha_class_iii)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart failure (New York Heart Association class III)."

(assert
(! (not patient_has_finding_of_heart_failure_now@@classified_as_nyha_class_iv)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart failure (New York Heart Association class IV)."

(assert
(! (not patient_has_finding_of_heart_valve_disorder_now@@uncorrected)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncorrected valvular heart disease."

(assert
(! (not patient_has_finding_of_congenital_heart_disease_now@@uncorrected)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncorrected congenital heart disease."

(assert
(! (not patient_is_exposed_to_digoxin_now@@needed_as_judged_by_investigator)
:named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs digoxin as judged by the investigator."

(assert
(! (not patient_is_exposed_to_isosorbide_mononitrate_now@@needed_as_judged_by_investigator)
:named REQ1_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs isosorbide mononitrate as judged by the investigator."

(assert
(! (not (and patient_is_taking_nitroglycerin_containing_product_now@@needed_as_judged_by_investigator
             patient_is_taking_nitroglycerin_containing_product_now@@sustained_release_preparation))
:named REQ1_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs nitroglycerin sustained release preparation as judged by the investigator."

(assert
(! (not patient_is_exposed_to_theophylline_now@@needed_as_judged_by_investigator)
:named REQ1_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs theophylline as judged by the investigator."

(assert
(! (not patient_is_exposed_to_class_i_antiarrhythmic_agent_now@@needed_as_judged_by_investigator)
:named REQ1_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs class I antiarrhythmic agent as judged by the investigator."

(assert
(! (not patient_is_exposed_to_digitalis_now@@needed_as_judged_by_investigator)
:named REQ1_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs digitalis as judged by the investigator."

(assert
(! (not patient_is_exposed_to_monoamine_oxidase_inhibitor_now@@needed_as_judged_by_investigator)
:named REQ1_COMPONENT10_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs monoamine oxidase inhibitor as judged by the investigator."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_abnormal_cardiac_conduction_now@@prevents_interpretation_of_ischemia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal cardiac conduction finding prevents the interpretation of ischemia.","when_to_set_to_false":"Set to false if the patient's abnormal cardiac conduction finding does not prevent the interpretation of ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormality prevents interpretation of ischemia.","meaning":"Boolean indicating whether the patient's abnormal cardiac conduction finding prevents interpretation of ischemia."} ;; "any electrocardiogram abnormality preventing the interpretation of ischemia"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive example: complete left bundle branch block implies abnormal conduction prevents interpretation of ischemia
(declare-const patient_has_finding_of_complete_left_bundle_branch_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of complete left bundle branch block.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of complete left bundle branch block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of complete left bundle branch block.","meaning":"Boolean indicating whether the patient currently has complete left bundle branch block."} ;; "complete left bundle branch block"
(assert
(! (=> patient_has_finding_of_complete_left_bundle_branch_block_now
     patient_has_finding_of_abnormal_cardiac_conduction_now@@prevents_interpretation_of_ischemia)
   :named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (complete left bundle branch block)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_abnormal_cardiac_conduction_now@@prevents_interpretation_of_ischemia
     patient_has_finding_of_abnormal_cardiac_conduction_now)
   :named REQ2_AUXILIARY1)) ;; "prevents interpretation of ischemia" qualifier implies abnormal cardiac conduction

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_abnormal_cardiac_conduction_now@@prevents_interpretation_of_ischemia)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any electrocardiogram abnormality preventing the interpretation of ischemia with non-exhaustive examples (complete left bundle branch block)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD)."} ;; "chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@requires_bronchodilator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current COPD diagnosis requires bronchodilator therapy.","when_to_set_to_false":"Set to false if the patient's current COPD diagnosis does not require bronchodilator therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current COPD diagnosis requires bronchodilator therapy.","meaning":"Boolean indicating whether the patient's current COPD diagnosis requires bronchodilator therapy."} ;; "chronic obstructive pulmonary disease requiring bronchodilator"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@requires_bronchodilator
      patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
   :named REQ3_AUXILIARY0)) ;; "requiring bronchodilator" implies "chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_chronic_obstructive_lung_disease_now@@requires_bronchodilator)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic obstructive pulmonary disease requiring bronchodilator."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const aspartate_transaminase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the patient's current aspartate transaminase (AST) value in U/L if available.","when_to_set_to_null":"Set to null if the patient's current aspartate transaminase (AST) value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current aspartate transaminase (AST) level in U/L."} ;; "aspartate transaminase > 3 times the upper limit of normal values"
(declare-const aspartate_transaminase_upper_limit_of_normal_value_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the laboratory-defined upper limit of normal for aspartate transaminase (AST) in U/L.","when_to_set_to_null":"Set to null if the upper limit of normal for aspartate transaminase (AST) is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the laboratory reference upper limit of normal for aspartate transaminase (AST) in U/L."} ;; "upper limit of normal values"
(declare-const alanine_transaminase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the patient's current alanine transaminase (ALT) value in U/L if available.","when_to_set_to_null":"Set to null if the patient's current alanine transaminase (ALT) value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current alanine transaminase (ALT) level in U/L."} ;; "alanine transaminase > 3 times the upper limit of normal values"
(declare-const alanine_transaminase_upper_limit_of_normal_value_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the laboratory-defined upper limit of normal for alanine transaminase (ALT) in U/L.","when_to_set_to_null":"Set to null if the upper limit of normal for alanine transaminase (ALT) is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the laboratory reference upper limit of normal for alanine transaminase (ALT) in U/L."} ;; "upper limit of normal values"
(declare-const patient_has_finding_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hepatic failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hepatic failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic failure.","meaning":"Boolean indicating whether the patient currently has hepatic failure."} ;; "hepatic failure"
(declare-const patient_has_finding_of_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal failure syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal failure syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal failure syndrome.","meaning":"Boolean indicating whether the patient currently has renal failure syndrome."} ;; "renal failure"
(declare-const serum_creatinine_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the patient's current serum creatinine value in mg/dL if available.","when_to_set_to_null":"Set to null if the patient's current serum creatinine value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current serum creatinine level in mg/dL."} ;; "serum creatinine > 3 mg/dL"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition of hepatic failure per requirement
(assert
(! (= patient_has_finding_of_hepatic_failure_now
     (or
       (> aspartate_transaminase_value_recorded_now_withunit_u_per_l
          (* 3 aspartate_transaminase_upper_limit_of_normal_value_withunit_u_per_l))
       (> alanine_transaminase_value_recorded_now_withunit_u_per_l
          (* 3 alanine_transaminase_upper_limit_of_normal_value_withunit_u_per_l))))
   :named REQ4_AUXILIARY0)) ;; "hepatic failure (defined as (aspartate transaminase > 3 times the upper limit of normal values) OR (alanine transaminase > 3 times the upper limit of normal values))"

;; Definition of renal failure per requirement
(assert
(! (= patient_has_finding_of_renal_failure_syndrome_now
     (> serum_creatinine_value_recorded_now_withunit_mg_per_dl 3))
   :named REQ4_AUXILIARY1)) ;; "renal failure (defined as serum creatinine > 3 mg/dL)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_hepatic_failure_now)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hepatic failure (defined as (aspartate transaminase > 3 times the upper limit of normal values) OR (alanine transaminase > 3 times the upper limit of normal values))."

(assert
(! (not patient_has_finding_of_renal_failure_syndrome_now)
   :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal failure (defined as serum creatinine > 3 mg/dL)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the gastrointestinal tract.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the gastrointestinal tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the gastrointestinal tract.","meaning":"Boolean indicating whether the patient currently has a disorder of the gastrointestinal tract."} ;; "gastrointestinal illness"
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the gastrointestinal tract is severe.","when_to_set_to_false":"Set to false if the patient's current disorder of the gastrointestinal tract is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is severe.","meaning":"Boolean indicating whether the patient's current disorder of the gastrointestinal tract is severe."} ;; "severe gastrointestinal illness"
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the severity of the patient's current disorder of the gastrointestinal tract is as judged by the investigator.","when_to_set_to_false":"Set to false if the severity of the patient's current disorder of the gastrointestinal tract is not as judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity is as judged by the investigator.","meaning":"Boolean indicating whether the severity of the patient's current disorder of the gastrointestinal tract is as judged by the investigator."} ;; "as judged by the investigator"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@severe
      patient_has_finding_of_disorder_of_gastrointestinal_tract_now)
:named REQ5_AUXILIARY0)) ;; "severe gastrointestinal illness"

(assert
(! (=> patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@as_judged_by_investigator
      patient_has_finding_of_disorder_of_gastrointestinal_tract_now)
:named REQ5_AUXILIARY1)) ;; "as judged by the investigator"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have severe gastrointestinal illness as judged by the investigator
(assert
(! (not (and patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@severe
             patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@as_judged_by_investigator))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe gastrointestinal illness as judged by the investigator."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_can_undergo_exercise_tolerance_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo an exercise tolerance test.","when_to_set_to_false":"Set to false if the patient is currently unable to undergo an exercise tolerance test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo an exercise tolerance test.","meaning":"Boolean indicating whether the patient can currently undergo an exercise tolerance test."} ;; "exercise tolerance test"

(declare-const patient_has_condition_that_interferes_with_performance_of_exercise_tolerance_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any condition that interferes with the performance of exercise tolerance test.","when_to_set_to_false":"Set to false if the patient currently does not have any condition that interferes with the performance of exercise tolerance test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any condition that interferes with the performance of exercise tolerance test.","meaning":"Boolean indicating whether the patient currently has any condition that interferes with the performance of exercise tolerance test."} ;; "any condition that interferes with the performance of exercise tolerance test"

(declare-const patient_has_condition_that_interferes_with_performance_of_exercise_tolerance_test_now@@judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the determination that the patient has a condition interfering with the performance of exercise tolerance test is judged by the investigator.","when_to_set_to_false":"Set to false if the determination is not judged by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the determination is judged by the investigator.","meaning":"Boolean indicating whether the determination that the patient has a condition interfering with the performance of exercise tolerance test is judged by the investigator."} ;; "as judged by the investigator"

(declare-const patient_has_diagnosis_of_arthropathy_of_knee_joint_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of arthropathy of the knee joint.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of arthropathy of the knee joint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of arthropathy of the knee joint.","meaning":"Boolean indicating whether the patient currently has a diagnosis of arthropathy of the knee joint."} ;; "knee arthropathy"

(declare-const patient_has_diagnosis_of_disorder_of_joint_of_ankle_and_or_foot_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder of joint of ankle and/or foot.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disorder of joint of ankle and/or foot.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disorder of joint of ankle and/or foot.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disorder of joint of ankle and/or foot."} ;; "ankle arthropathy"

(declare-const patient_has_diagnosis_of_parkinsonism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of parkinsonism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of parkinsonism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of parkinsonism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of parkinsonism."} ;; "Parkinsonism"

(declare-const patient_has_diagnosis_of_cerebrovascular_accident_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cerebrovascular accident (stroke).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cerebrovascular accident (stroke).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient currently has a diagnosis of cerebrovascular accident (stroke)."} ;; "stroke"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_arthropathy_of_knee_joint_now
           patient_has_diagnosis_of_disorder_of_joint_of_ankle_and_or_foot_now
           patient_has_diagnosis_of_parkinsonism_now
           patient_has_diagnosis_of_cerebrovascular_accident_now)
       patient_has_condition_that_interferes_with_performance_of_exercise_tolerance_test_now@@judged_by_investigator)
   :named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (knee arthropathy, ankle arthropathy, Parkinsonism, stroke)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_condition_that_interferes_with_performance_of_exercise_tolerance_test_now@@judged_by_investigator
       patient_has_condition_that_interferes_with_performance_of_exercise_tolerance_test_now)
   :named REQ6_AUXILIARY1)) ;; "as judged by the investigator"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_condition_that_interferes_with_performance_of_exercise_tolerance_test_now@@judged_by_investigator)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition that interferes with the performance of exercise tolerance test as judged by the investigator with non-exhaustive examples (knee arthropathy, ankle arthropathy, Parkinsonism, stroke)."
