;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_asymptomatic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently asymptomatic.","when_to_set_to_false":"Set to false if the patient is currently not asymptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently asymptomatic.","meaning":"Boolean indicating whether the patient is currently asymptomatic."} ;; "asymptomatic"
(declare-const patient_is_undergoing_cardiac_catheterization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing cardiac catheterization.","when_to_set_to_false":"Set to false if the patient is currently not undergoing cardiac catheterization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing cardiac catheterization.","meaning":"Boolean indicating whether the patient is currently undergoing cardiac catheterization."} ;; "cardiac catheterization"
(declare-const patient_is_undergoing_cardiac_catheterization_now@@preoperative_context Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing cardiac catheterization and the procedure is in the preoperative context.","when_to_set_to_false":"Set to false if the patient is currently undergoing cardiac catheterization but not in the preoperative context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiac catheterization is in the preoperative context.","meaning":"Boolean indicating whether the patient is currently undergoing cardiac catheterization in the preoperative context."} ;; "preoperative cardiac catheterization"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive example: preoperative cardiac catheterization implies asymptomatic
(assert
(! (=> patient_is_undergoing_cardiac_catheterization_now@@preoperative_context
       patient_has_finding_of_asymptomatic_now)
   :named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples (a patient undergoing preoperative cardiac catheterization)."

;; Qualifier variable implies stem variable
(assert
(! (=> patient_is_undergoing_cardiac_catheterization_now@@preoperative_context
       patient_is_undergoing_cardiac_catheterization_now)
   :named REQ0_AUXILIARY1)) ;; "preoperative cardiac catheterization" is a context of "cardiac catheterization"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_asymptomatic_now)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is asymptomatic."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_transplantation_of_heart_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a heart transplantation at any time in the past (i.e., is status-post heart transplant).","when_to_set_to_false":"Set to false if the patient has never undergone a heart transplantation at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a heart transplantation.","meaning":"Boolean indicating whether the patient has ever undergone a heart transplantation (status-post heart transplant)."} ;; "heart transplant"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_transplantation_of_heart_inthehistory)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is status-post heart transplant."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary artery bypass grafting at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass grafting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone coronary artery bypass grafting in the past.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass grafting in the past."} ;; "coronary artery bypass grafting"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is status-post coronary artery bypass grafting."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "younger than eighteen years old"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than eighteen years old."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const creatinine_concentration_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's creatinine concentration measured now, in milligrams per deciliter.","when_to_set_to_null":"Set to null if the patient's creatinine concentration measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's creatinine concentration measured now, in milligrams per deciliter."} ;; "creatinine concentration greater than one point five milligrams per deciliter"

(declare-const patient_has_finding_of_renal_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal insufficiency.","meaning":"Boolean indicating whether the patient currently has renal insufficiency."} ;; "renal insufficiency"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: renal insufficiency is defined as creatinine concentration > 1.5 mg/dL
(assert
(! (= patient_has_finding_of_renal_insufficiency_now
     (> creatinine_concentration_value_recorded_now_withunit_mg_per_dl 1.5))
   :named REQ4_AUXILIARY0)) ;; "renal insufficiency (creatinine concentration greater than one point five milligrams per deciliter)."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_renal_insufficiency_now)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal insufficiency (creatinine concentration greater than one point five milligrams per deciliter)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has acute coronary syndrome."} ;; "presence of an acute coronary syndrome"

(declare-const patient_has_finding_of_st_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ST-elevation myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have ST-elevation myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ST-elevation myocardial infarction.","meaning":"Boolean indicating whether the patient currently has ST-elevation myocardial infarction."} ;; "ST-elevation myocardial infarction"

(declare-const patient_has_finding_of_non_st_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has non-ST-elevation myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have non-ST-elevation myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has non-ST-elevation myocardial infarction.","meaning":"Boolean indicating whether the patient currently has non-ST-elevation myocardial infarction."} ;; "non-ST-elevation myocardial infarction"

(declare-const patient_has_finding_of_takotsubo_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of Tako-tsubo cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of Tako-tsubo cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Tako-tsubo cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has Tako-tsubo cardiomyopathy."} ;; "Tako-tsubo cardiomyopathy"

(declare-const patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if a numeric measurement of the patient's ejection fraction recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent representing the patient's current ejection fraction value."} ;; "ejection fraction less than fifty-five percent"

(declare-const patients_cardiac_ejection_fraction_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ejection fraction is currently abnormal.","when_to_set_to_false":"Set to false if the patient's ejection fraction is currently not abnormal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ejection fraction is currently abnormal.","meaning":"Boolean indicating whether the patient's ejection fraction is currently abnormal."} ;; "an abnormal ejection fraction"

(declare-const patient_has_finding_of_cardiogenic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiogenic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiogenic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cardiogenic shock.","meaning":"Boolean indicating whether the patient currently has cardiogenic shock."} ;; "cardiogenic shock"

(declare-const patient_has_finding_of_ventricular_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ventricular tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ventricular tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ventricular tachycardia.","meaning":"Boolean indicating whether the patient currently has ventricular tachycardia."} ;; "ventricular tachycardia"

(declare-const patient_has_finding_of_ventricular_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ventricular fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ventricular fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ventricular fibrillation.","meaning":"Boolean indicating whether the patient currently has ventricular fibrillation."} ;; "ventricular fibrillation"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Exhaustive subcategories define acute coronary syndrome exactly:
(assert
(! (= patient_has_finding_of_acute_coronary_syndrome_now
(or patient_has_finding_of_st_elevation_myocardial_infarction_now
    patient_has_finding_of_non_st_elevation_myocardial_infarction_now))
:named REQ5_AUXILIARY0)) ;; "presence of an acute coronary syndrome with exhaustive subcategories ((ST-elevation myocardial infarction) OR (non-ST-elevation myocardial infarction))"

;; Abnormal ejection fraction is defined as ejection fraction < 55%
(assert
(! (= patients_cardiac_ejection_fraction_is_abnormal_now
(< patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent 55))
:named REQ5_AUXILIARY1)) ;; "an abnormal ejection fraction (ejection fraction less than fifty-five percent)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_acute_coronary_syndrome_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has presence of an acute coronary syndrome with exhaustive subcategories ((ST-elevation myocardial infarction) OR (non-ST-elevation myocardial infarction))."

(assert
(! (not patient_has_finding_of_takotsubo_cardiomyopathy_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Tako-tsubo cardiomyopathy."

(assert
(! (not patients_cardiac_ejection_fraction_is_abnormal_now)
:named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an abnormal ejection fraction (ejection fraction less than fifty-five percent)."

(assert
(! (not patient_has_finding_of_cardiogenic_shock_now)
:named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiogenic shock."

(assert
(! (not patient_has_finding_of_ventricular_tachycardia_now)
:named REQ5_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recent ventricular tachycardia."

(assert
(! (not patient_has_finding_of_ventricular_fibrillation_now)
:named REQ5_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recent ventricular fibrillation."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} ;; "chest pain"
(declare-const patient_has_finding_of_chest_pain_now@@has_another_likely_explanation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chest pain has another likely explanation (e.g., pulmonary hypertension, aortic stenosis).","when_to_set_to_false":"Set to false if the patient's current chest pain does not have another likely explanation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current chest pain has another likely explanation.","meaning":"Boolean indicating whether the patient's current chest pain has another likely explanation."} ;; "presence of another likely explanation of chest pain"

(declare-const patient_has_finding_of_pulmonary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary hypertension.","meaning":"Boolean indicating whether the patient currently has pulmonary hypertension."} ;; "pulmonary hypertension"
(declare-const patient_has_finding_of_aortic_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of aortic stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of aortic stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has aortic stenosis.","meaning":"Boolean indicating whether the patient currently has aortic stenosis."} ;; "aortic stenosis"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_pulmonary_hypertension_now
          patient_has_finding_of_aortic_stenosis_now)
     patient_has_finding_of_chest_pain_now@@has_another_likely_explanation)
:named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (pulmonary hypertension, aortic stenosis)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_chest_pain_now@@has_another_likely_explanation
       patient_has_finding_of_chest_pain_now)
:named REQ6_AUXILIARY1)) ;; "presence of another likely explanation of chest pain"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_chest_pain_now@@has_another_likely_explanation)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has presence of another likely explanation of chest pain with non-exhaustive examples (pulmonary hypertension, aortic stenosis)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_adverse_reaction_to_drug_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an adverse reaction to any drug at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had an adverse reaction to any drug in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an adverse reaction to any drug in their history.","meaning":"Boolean indicating whether the patient has ever had an adverse reaction to any drug in their history."} ;; "adverse reaction"

(declare-const patient_has_finding_of_adverse_reaction_to_drug_inthehistory@@restricted_to_medications_being_used_acetylcholine_nitroglycerin_adenosine_heparin Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an adverse reaction to any of the medications being used in the study (acetylcholine, nitroglycerin, adenosine, heparin) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had an adverse reaction to any of the medications being used in the study (acetylcholine, nitroglycerin, adenosine, heparin) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an adverse reaction to any of the medications being used in the study (acetylcholine, nitroglycerin, adenosine, heparin) in their history.","meaning":"Boolean indicating whether the patient has ever had an adverse reaction to any of the medications being used in the study (acetylcholine, nitroglycerin, adenosine, heparin) in their history."} ;; "adverse reaction to any of the medications being used (acetylcholine, nitroglycerin, adenosine, heparin)"

(declare-const patient_has_finding_of_adverse_reaction_to_acetylcholine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an adverse reaction to acetylcholine at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had an adverse reaction to acetylcholine in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an adverse reaction to acetylcholine in their history.","meaning":"Boolean indicating whether the patient has ever had an adverse reaction to acetylcholine in their history."} ;; "adverse reaction to acetylcholine"

(declare-const patient_has_finding_of_adverse_reaction_to_nitroglycerin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an adverse reaction to nitroglycerin at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had an adverse reaction to nitroglycerin in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an adverse reaction to nitroglycerin in their history.","meaning":"Boolean indicating whether the patient has ever had an adverse reaction to nitroglycerin in their history."} ;; "adverse reaction to nitroglycerin"

(declare-const patient_has_finding_of_adverse_reaction_to_adenosine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an adverse reaction to adenosine at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had an adverse reaction to adenosine in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an adverse reaction to adenosine in their history.","meaning":"Boolean indicating whether the patient has ever had an adverse reaction to adenosine in their history."} ;; "adverse reaction to adenosine"

(declare-const patient_has_finding_of_adverse_reaction_to_heparin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an adverse reaction to heparin at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had an adverse reaction to heparin in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an adverse reaction to heparin in their history.","meaning":"Boolean indicating whether the patient has ever had an adverse reaction to heparin in their history."} ;; "adverse reaction to heparin"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Exhaustive subcategories define the umbrella exactly:
(assert
(! (= patient_has_finding_of_adverse_reaction_to_drug_inthehistory@@restricted_to_medications_being_used_acetylcholine_nitroglycerin_adenosine_heparin
(or patient_has_finding_of_adverse_reaction_to_acetylcholine_inthehistory
    patient_has_finding_of_adverse_reaction_to_nitroglycerin_inthehistory
    patient_has_finding_of_adverse_reaction_to_adenosine_inthehistory
    patient_has_finding_of_adverse_reaction_to_heparin_inthehistory))
:named REQ7_AUXILIARY0)) ;; "with exhaustive subcategories (acetylcholine, nitroglycerin, adenosine, heparin)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_adverse_reaction_to_drug_inthehistory@@restricted_to_medications_being_used_acetylcholine_nitroglycerin_adenosine_heparin
      patient_has_finding_of_adverse_reaction_to_drug_inthehistory)
:named REQ7_AUXILIARY1)) ;; "adverse reaction to any of the medications being used (acetylcholine, nitroglycerin, adenosine, heparin)"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_adverse_reaction_to_acetylcholine_inthehistory)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of adverse reaction to acetylcholine."

(assert
(! (not patient_has_finding_of_adverse_reaction_to_nitroglycerin_inthehistory)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of adverse reaction to nitroglycerin."

(assert
(! (not patient_has_finding_of_adverse_reaction_to_adenosine_inthehistory)
:named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of adverse reaction to adenosine."

(assert
(! (not patient_has_finding_of_adverse_reaction_to_heparin_inthehistory)
:named REQ7_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of adverse reaction to heparin."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_taking_vasoactive_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any vasoactive medication.","when_to_set_to_false":"Set to false if the patient is currently not taking any vasoactive medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any vasoactive medication.","meaning":"Boolean indicating whether the patient is currently taking any vasoactive medication."} ;; "currently taking vasoactive medication"

(declare-const patient_is_taking_nitroglycerin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking nitroglycerin.","when_to_set_to_false":"Set to false if the patient is currently not taking nitroglycerin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking nitroglycerin.","meaning":"Boolean indicating whether the patient is currently taking nitroglycerin."} ;; "such as nitroglycerin"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive example: taking nitroglycerin implies taking vasoactive medication
(assert
(! (=> patient_is_taking_nitroglycerin_now
      patient_is_taking_vasoactive_medication_now)
   :named REQ8_AUXILIARY0)) ;; "with non-exhaustive examples (nitroglycerin)."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_taking_vasoactive_medication_now)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently taking vasoactive medication."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an inability to provide informed consent for study participation.","when_to_set_to_false":"Set to false if the patient currently does not have an inability to provide informed consent for study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an inability to provide informed consent for study participation.","meaning":"Boolean indicating whether the patient currently has an inability to provide informed consent for study participation."} ;; "an inability to provide informed consent"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_english Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to speak English.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to speak English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to speak English.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to speak English."} ;; "an inability to speak English"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_english Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to read English.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to read English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to read English.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to read English."} ;; "an inability to read English"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_english Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to understand English.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to understand English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to understand English.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to understand English."} ;; "an inability to understand English"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_spanish Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to speak Spanish.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to speak Spanish.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to speak Spanish.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to speak Spanish."} ;; "an inability to speak Spanish"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_spanish Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to read Spanish.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to read Spanish.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to read Spanish.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to read Spanish."} ;; "an inability to read Spanish"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_spanish Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to understand Spanish.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to understand Spanish.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to understand Spanish.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to understand Spanish."} ;; "an inability to understand Spanish"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_chinese Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to speak Chinese.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to speak Chinese.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to speak Chinese.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to speak Chinese."} ;; "an inability to speak Chinese"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_chinese Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to read Chinese.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to read Chinese.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to read Chinese.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to read Chinese."} ;; "an inability to read Chinese"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_chinese Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to understand Chinese.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to understand Chinese.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to understand Chinese.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to understand Chinese."} ;; "an inability to understand Chinese"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_farsi Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to speak Farsi.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to speak Farsi.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to speak Farsi.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to speak Farsi."} ;; "an inability to speak Farsi"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_farsi Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to read Farsi.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to read Farsi.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to read Farsi.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to read Farsi."} ;; "an inability to read Farsi"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_farsi Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to understand Farsi.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to understand Farsi.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to understand Farsi.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to understand Farsi."} ;; "an inability to understand Farsi"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_japanese Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to speak Japanese.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to speak Japanese.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to speak Japanese.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to speak Japanese."} ;; "an inability to speak Japanese"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_japanese Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to read Japanese.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to read Japanese.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to read Japanese.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to read Japanese."} ;; "an inability to read Japanese"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_japanese Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to understand Japanese.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to understand Japanese.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to understand Japanese.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to understand Japanese."} ;; "an inability to understand Japanese"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_korean Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to speak Korean.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to speak Korean.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to speak Korean.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to speak Korean."} ;; "an inability to speak Korean"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_korean Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to read Korean.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to read Korean.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to read Korean.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to read Korean."} ;; "an inability to read Korean"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_korean Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to understand Korean.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to understand Korean.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to understand Korean.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to understand Korean."} ;; "an inability to understand Korean"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_russian Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to speak Russian.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to speak Russian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to speak Russian.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to speak Russian."} ;; "an inability to speak Russian"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_russian Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to read Russian.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to read Russian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to read Russian.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to read Russian."} ;; "an inability to read Russian"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_russian Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to understand Russian.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to understand Russian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to understand Russian.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to understand Russian."} ;; "an inability to understand Russian"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_vietnamese Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to speak Vietnamese.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to speak Vietnamese.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to speak Vietnamese.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to speak Vietnamese."} ;; "an inability to speak Vietnamese"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_vietnamese Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to read Vietnamese.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to read Vietnamese.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to read Vietnamese.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to read Vietnamese."} ;; "an inability to read Vietnamese"

(declare-const patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_vietnamese Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to provide informed consent is due to an inability to understand Vietnamese.","when_to_set_to_false":"Set to false if the patient's inability to provide informed consent is not due to an inability to understand Vietnamese.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to provide informed consent is due to an inability to understand Vietnamese.","meaning":"Boolean indicating whether the patient's inability to provide informed consent is due to an inability to understand Vietnamese."} ;; "an inability to understand Vietnamese"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_english
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_english
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_english
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_spanish
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_spanish
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_spanish
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_chinese
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_chinese
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_chinese
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_farsi
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_farsi
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_farsi
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_japanese
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_japanese
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_japanese
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_korean
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_korean
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_korean
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_russian
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_russian
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_russian
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_vietnamese
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_vietnamese
           patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_vietnamese)
    patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY0)) ;; "including (an inability to speak English) OR (an inability to read English) ... OR (an inability to understand Vietnamese)"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_english
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY1)) ;; "an inability to speak English"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_english
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY2)) ;; "an inability to read English"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_english
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY3)) ;; "an inability to understand English"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_spanish
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY4)) ;; "an inability to speak Spanish"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_spanish
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY5)) ;; "an inability to read Spanish"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_spanish
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY6)) ;; "an inability to understand Spanish"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_chinese
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY7)) ;; "an inability to speak Chinese"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_chinese
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY8)) ;; "an inability to read Chinese"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_chinese
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY9)) ;; "an inability to understand Chinese"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_farsi
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY10)) ;; "an inability to speak Farsi"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_farsi
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY11)) ;; "an inability to read Farsi"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_farsi
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY12)) ;; "an inability to understand Farsi"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_japanese
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY13)) ;; "an inability to speak Japanese"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_japanese
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY14)) ;; "an inability to read Japanese"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_japanese
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY15)) ;; "an inability to understand Japanese"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_korean
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY16)) ;; "an inability to speak Korean"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_korean
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY17)) ;; "an inability to read Korean"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_korean
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY18)) ;; "an inability to understand Korean"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_russian
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY19)) ;; "an inability to speak Russian"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_russian
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY20)) ;; "an inability to read Russian"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_russian
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY21)) ;; "an inability to understand Russian"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_speak_vietnamese
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY22)) ;; "an inability to speak Vietnamese"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_read_vietnamese
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY23)) ;; "an inability to read Vietnamese"

(assert
(! (=> patient_has_finding_of_inability_to_provide_informed_consent_now@@due_to_inability_to_understand_vietnamese
      patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_AUXILIARY24)) ;; "an inability to understand Vietnamese"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_inability_to_provide_informed_consent_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an inability to provide informed consent, including (an inability to speak English) OR ... OR (an inability to understand Vietnamese)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_hearing_loss_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hearing loss.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hearing loss.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hearing loss.","meaning":"Boolean indicating whether the patient currently has hearing loss."} ;; "hearing impairment"

(declare-const patient_has_finding_of_hearing_loss_now@@precludes_typical_verbal_conversation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hearing loss is severe enough to prevent typical verbal conversation.","when_to_set_to_false":"Set to false if the patient's current hearing loss does not prevent typical verbal conversation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hearing loss precludes typical verbal conversation.","meaning":"Boolean indicating whether the patient's current hearing loss precludes typical verbal conversation."} ;; "hearing impairment that will not allow for a typical verbal conversation"

(declare-const patient_has_finding_of_visual_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of visual impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of visual impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has visual impairment.","meaning":"Boolean indicating whether the patient currently has visual impairment."} ;; "visual impairment"

(declare-const patient_has_finding_of_visual_impairment_now@@precludes_reading_written_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current visual impairment is severe enough to prevent reading of the written consent.","when_to_set_to_false":"Set to false if the patient's current visual impairment does not prevent reading of the written consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's visual impairment precludes reading of the written consent.","meaning":"Boolean indicating whether the patient's current visual impairment precludes reading of the written consent."} ;; "visual impairment that will not allow for reading of the written consent"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable (hearing loss)
(assert
(! (=> patient_has_finding_of_hearing_loss_now@@precludes_typical_verbal_conversation
      patient_has_finding_of_hearing_loss_now)
:named REQ10_AUXILIARY0)) ;; "hearing impairment that will not allow for a typical verbal conversation"

;; Qualifier variable implies corresponding stem variable (visual impairment)
(assert
(! (=> patient_has_finding_of_visual_impairment_now@@precludes_reading_written_consent
      patient_has_finding_of_visual_impairment_now)
:named REQ10_AUXILIARY1)) ;; "visual impairment that will not allow for reading of the written consent"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient must NOT have hearing impairment that precludes typical verbal conversation
(assert
(! (not patient_has_finding_of_hearing_loss_now@@precludes_typical_verbal_conversation)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a hearing impairment that will not allow for a typical verbal conversation."

;; Exclusion: patient must NOT have visual impairment that precludes reading of the written consent
(assert
(! (not patient_has_finding_of_visual_impairment_now@@precludes_reading_written_consent)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a visual impairment that will not allow for reading of the written consent."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_participating_in_another_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in any study other than the Stanford Gene-PAD study.","when_to_set_to_false":"Set to false if the patient is not currently participating in any study other than the Stanford Gene-PAD study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in any study other than the Stanford Gene-PAD study.","meaning":"Boolean indicating whether the patient is currently participating in any study other than the Stanford Gene-PAD study."} ;; "the patient is participating in another study"

(declare-const patient_is_participating_in_stanford_gene_pad_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in the Stanford Gene-PAD study.","when_to_set_to_false":"Set to false if the patient is not currently participating in the Stanford Gene-PAD study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in the Stanford Gene-PAD study.","meaning":"Boolean indicating whether the patient is currently participating in the Stanford Gene-PAD study."} ;; "the patient is NOT participating in the Stanford Gene-PAD study"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (and patient_is_participating_in_another_study_now
             (not patient_is_participating_in_stanford_gene_pad_study_now)))
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is participating in another study) AND (the patient is NOT participating in the Stanford Gene-PAD study)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_potentially_vulnerable_subject_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered a potentially vulnerable subject (including any of the listed categories or others as defined by study protocol).","when_to_set_to_false":"Set to false if the patient is currently not considered a potentially vulnerable subject.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently considered a potentially vulnerable subject.","meaning":"Boolean indicating whether the patient is currently considered a potentially vulnerable subject."} ;; "potentially vulnerable subject"

(declare-const patient_is_minor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a minor.","when_to_set_to_false":"Set to false if the patient is currently not a minor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a minor.","meaning":"Boolean indicating whether the patient is currently a minor."} ;; "minor"

(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently pregnant.","meaning":"Boolean indicating whether the patient is currently pregnant."} ;; "pregnant woman"

(declare-const patient_is_economically_disadvantaged_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently economically disadvantaged.","when_to_set_to_false":"Set to false if the patient is currently not economically disadvantaged.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently economically disadvantaged.","meaning":"Boolean indicating whether the patient is currently economically disadvantaged."} ;; "economically disadvantaged person"

(declare-const patient_is_educationally_disadvantaged_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently educationally disadvantaged.","when_to_set_to_false":"Set to false if the patient is currently not educationally disadvantaged.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently educationally disadvantaged.","meaning":"Boolean indicating whether the patient is currently educationally disadvantaged."} ;; "educationally disadvantaged person"

(declare-const patient_is_decisionally_impaired_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently decisionally impaired.","when_to_set_to_false":"Set to false if the patient is currently not decisionally impaired.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently decisionally impaired.","meaning":"Boolean indicating whether the patient is currently decisionally impaired."} ;; "decisionally impaired person"

(declare-const patient_is_homeless_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently homeless.","when_to_set_to_false":"Set to false if the patient is currently not homeless.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently homeless.","meaning":"Boolean indicating whether the patient is currently homeless."} ;; "homeless person"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_minor_now
           patient_is_pregnant_now
           patient_is_economically_disadvantaged_now
           patient_is_educationally_disadvantaged_now
           patient_is_decisionally_impaired_now
           patient_is_homeless_now)
       patient_is_potentially_vulnerable_subject_now)
   :named REQ12_AUXILIARY0)) ;; "with non-exhaustive examples (minor, pregnant woman, economically disadvantaged person, educationally disadvantaged person, decisionally impaired person, homeless person)."

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_is_potentially_vulnerable_subject_now)
   :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a potentially vulnerable subject."
