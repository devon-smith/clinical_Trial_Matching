;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker (actively smokes now).","when_to_set_to_false":"Set to false if the patient is currently not a smoker (does not actively smoke now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} ;; "current smoker"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_smoker_now)
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is a current smoker."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_ex_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding/status of ex-smoker.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding/status of ex-smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding/status of ex-smoker.","meaning":"Boolean indicating whether the patient currently has the status of ex-smoker."} ;; "ex-smoker"

(declare-const patient_has_finding_of_ex_smoker_now@@time_since_quitting_tobacco_smoking_less_than_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an ex-smoker and has given up tobacco smoking less than 6 months ago.","when_to_set_to_false":"Set to false if the patient is currently an ex-smoker and has given up tobacco smoking 6 months ago or more.","when_to_set_to_null":"Set to null if it is unknown, not documented, or indeterminate whether the patient is an ex-smoker and the time since quitting tobacco smoking is less than 6 months.","meaning":"Boolean indicating whether the patient is currently an ex-smoker and has given up tobacco smoking less than 6 months ago."} ;; "ex-smoker who has given up tobacco smoking less than 6 months ago"

(declare-const patient_cigarette_pack_years_value_recorded_inthehistory_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the total number of cigarette pack years if documented in the patient's history.","when_to_set_to_null":"Set to null if the total number of cigarette pack years in the patient's history is unknown, not documented, or indeterminate.","meaning":"Numeric value representing the patient's total number of cigarette pack years accumulated in their history."} ;; "history of tobacco smoking greater than 20 pack years"

(declare-const patient_tobacco_smoking_consumption_value_recorded_inthehistory_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the total pack years if the patient's cumulative tobacco smoking history is documented.","when_to_set_to_null":"Set to null if the patient's cumulative tobacco smoking history in pack years is unknown, not documented, or indeterminate.","meaning":"Numeric value representing the patient's total history of tobacco smoking consumption in pack years."} ;; "history of tobacco smoking in pack years"

(declare-const patient_tobacco_smoking_consumption_value_recorded_inthepast6months_withunit_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient gave up tobacco smoking if documented and within the past 6 months.","when_to_set_to_null":"Set to null if the time since quitting tobacco smoking is unknown, not documented, or indeterminate.","meaning":"Numeric value representing the time since the patient gave up tobacco smoking, measured in months, within the past 6 months."} ;; "time since the patient gave up tobacco smoking, measured in months, within the past 6 months"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_ex_smoker_now@@time_since_quitting_tobacco_smoking_less_than_6_months
      patient_has_finding_of_ex_smoker_now)
   :named REQ1_AUXILIARY0)) ;; "ex-smoker who has given up tobacco smoking less than 6 months ago"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient is an ex-smoker with a history of tobacco smoking greater than 20 pack years
(assert
(! (not (and patient_has_finding_of_ex_smoker_now
             (> patient_cigarette_pack_years_value_recorded_inthehistory_withunit_pack_years 20)))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is an ex-smoker with a history of tobacco smoking greater than 20 pack years."

;; Exclusion: patient is an ex-smoker who has given up tobacco smoking less than 6 months ago
(assert
(! (not patient_has_finding_of_ex_smoker_now@@time_since_quitting_tobacco_smoking_less_than_6_months)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is an ex-smoker who has given up tobacco smoking less than 6 months ago."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_exposed_to_antitussive_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to antitussive agents (medications likely to suppress cough).","when_to_set_to_false":"Set to false if the patient is currently not exposed to antitussive agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to antitussive agents.","meaning":"Boolean indicating whether the patient is currently exposed to antitussive agents."} ;; "medications likely to suppress cough"
(declare-const patient_is_taking_codeine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a codeine-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a codeine-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a codeine-containing product.","meaning":"Boolean indicating whether the patient is currently taking a codeine-containing product."} ;; "codeine"
(declare-const patient_is_taking_morphine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a morphine-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a morphine-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a morphine-containing product.","meaning":"Boolean indicating whether the patient is currently taking a morphine-containing product."} ;; "morphine"
(declare-const patient_is_taking_pregabalin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a pregabalin-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a pregabalin-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a pregabalin-containing product.","meaning":"Boolean indicating whether the patient is currently taking a pregabalin-containing product."} ;; "pregabalin"
(declare-const patient_is_taking_gabapentin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a gabapentin-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a gabapentin-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a gabapentin-containing product.","meaning":"Boolean indicating whether the patient is currently taking a gabapentin-containing product."} ;; "gabapentin"
(declare-const patient_is_taking_amitriptyline_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an amitriptyline-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking an amitriptyline-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an amitriptyline-containing product.","meaning":"Boolean indicating whether the patient is currently taking an amitriptyline-containing product."} ;; "amitriptylline"
(declare-const patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an angiotensin converting enzyme inhibitor (type 1) containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking an angiotensin converting enzyme inhibitor (type 1) containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an angiotensin converting enzyme inhibitor (type 1) containing product.","meaning":"Boolean indicating whether the patient is currently taking an angiotensin converting enzyme inhibitor (type 1) containing product."} ;; "angiotensin converting enzyme inhibitor (type 1)"
(declare-const patient_is_taking_baclofen_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a baclofen-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a baclofen-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a baclofen-containing product.","meaning":"Boolean indicating whether the patient is currently taking a baclofen-containing product."} ;; "baclofen"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples: listed drugs are examples of medications likely to suppress or affect cough
(assert
(! (=> (or patient_is_taking_codeine_containing_product_now
          patient_is_taking_morphine_containing_product_now
          patient_is_taking_pregabalin_containing_product_now
          patient_is_taking_gabapentin_containing_product_now
          patient_is_taking_amitriptyline_containing_product_now
          patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now
          patient_is_taking_baclofen_containing_product_now)
    patient_is_exposed_to_antitussive_agent_now)
:named REQ2_AUXILIARY0)) ;; "including codeine, morphine, pregabalin, gabapentin, amitriptylline, angiotensin converting enzyme inhibitor (type 1), or baclofen."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_exposed_to_antitussive_agent_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient uses medications likely to suppress cough or uses medications likely to affect cough, including codeine, morphine, pregabalin, gabapentin, amitriptylline, angiotensin converting enzyme inhibitor (type 1), or baclofen."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_taking_antiarrhythmic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or using any antiarrhythmic agent (anti-arrhythmic medication).","when_to_set_to_false":"Set to false if the patient is currently not taking or using any antiarrhythmic agent (anti-arrhythmic medication).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or using any antiarrhythmic agent (anti-arrhythmic medication).","meaning":"Boolean indicating whether the patient is currently taking or using any antiarrhythmic agent (anti-arrhythmic medication)."} ;; "anti-arrhythmic medication"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_taking_antiarrhythmic_agent_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses any anti-arrhythmic medication."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_taking_cimetidine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any cimetidine-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any cimetidine-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any cimetidine-containing product.","meaning":"Boolean indicating whether the patient is currently taking any cimetidine-containing product."} ;; "the patient uses cimetidine"
(declare-const patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any beta-adrenergic receptor antagonist-containing product (beta blocker medication).","when_to_set_to_false":"Set to false if the patient is currently not taking any beta-adrenergic receptor antagonist-containing product (beta blocker medication).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any beta-adrenergic receptor antagonist-containing product (beta blocker medication).","meaning":"Boolean indicating whether the patient is currently taking any beta-adrenergic receptor antagonist-containing product (beta blocker medication)."} ;; "the patient uses beta blocker medication"
(declare-const patient_is_taking_diuretic_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any diuretic medication.","when_to_set_to_false":"Set to false if the patient is currently not taking any diuretic medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any diuretic medication.","meaning":"Boolean indicating whether the patient is currently taking any diuretic medication."} ;; "the patient uses diuretic medication"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_taking_cimetidine_containing_product_now)
    :named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient uses cimetidine."
(assert
(! (not patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now)
    :named REQ4_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient uses beta blocker medication."
(assert
(! (not patient_is_taking_diuretic_medication_now)
    :named REQ4_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient uses diuretic medication."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_sinus_node_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of sinus node dysfunction (sinoatrial node disease).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of sinus node dysfunction (sinoatrial node disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sinus node dysfunction (sinoatrial node disease).","meaning":"Boolean indicating whether the patient currently has sinus node dysfunction (sinoatrial node disease)."} ;; "sinoatrial node disease"
(declare-const patient_has_finding_of_bradycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bradycardia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bradycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bradycardia.","meaning":"Boolean indicating whether the patient currently has bradycardia."} ;; "bradycardia"
(declare-const patient_has_finding_of_heart_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of any type of heart block.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of any type of heart block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any type of heart block.","meaning":"Boolean indicating whether the patient currently has any type of heart block."} ;; "any type of heart block"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_sinus_node_dysfunction_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sinoatrial node disease."

(assert
(! (not patient_has_finding_of_bradycardia_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bradycardia."

(assert
(! (not patient_has_finding_of_heart_block_now)
:named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any type of heart block."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_ischemic_heart_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with ischaemic heart disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with ischaemic heart disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with ischaemic heart disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of ischaemic heart disease in their history."} ;; "history of ischaemic heart disease"
(declare-const patient_has_diagnosis_of_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with heart failure at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with heart failure at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with heart failure.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of heart failure in their history."} ;; "history of heart failure"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (or patient_has_diagnosis_of_ischemic_heart_disease_inthehistory
            patient_has_diagnosis_of_heart_failure_inthehistory))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of ischaemic heart disease) OR (the patient has a history of heart failure)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_electrocardiogram_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abnormal electrocardiogram.","when_to_set_to_false":"Set to false if the patient currently does not have an abnormal electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abnormal electrocardiogram.","meaning":"Boolean indicating whether the patient currently has an abnormal electrocardiogram."} ;; "abnormal electrocardiogram"
(declare-const patient_has_finding_of_electrocardiogram_abnormal_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal electrocardiogram is clinically significant.","when_to_set_to_false":"Set to false if the patient's abnormal electrocardiogram is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal electrocardiogram is clinically significant.","meaning":"Boolean indicating whether the patient's abnormal electrocardiogram is clinically significant."} ;; "clinically significant abnormal electrocardiogram"
(declare-const patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abnormal electrocardiogram and the abnormality is present at Screening.","when_to_set_to_false":"Set to false if the patient currently does not have an abnormal electrocardiogram present at Screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abnormal electrocardiogram present at Screening.","meaning":"Boolean indicating whether the patient currently has an abnormal electrocardiogram present at Screening."} ;; "abnormal electrocardiogram present at Screening"
(declare-const patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_screening@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal electrocardiogram present at Screening is clinically significant.","when_to_set_to_false":"Set to false if the patient's abnormal electrocardiogram present at Screening is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal electrocardiogram present at Screening is clinically significant.","meaning":"Boolean indicating whether the patient's abnormal electrocardiogram present at Screening is clinically significant."} ;; "clinically significant abnormal electrocardiogram present at Screening"
(declare-const patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abnormal electrocardiogram and the abnormality is present at Baseline.","when_to_set_to_false":"Set to false if the patient currently does not have an abnormal electrocardiogram present at Baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abnormal electrocardiogram present at Baseline.","meaning":"Boolean indicating whether the patient currently has an abnormal electrocardiogram present at Baseline."} ;; "abnormal electrocardiogram present at Baseline"
(declare-const patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_baseline@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal electrocardiogram present at Baseline is clinically significant.","when_to_set_to_false":"Set to false if the patient's abnormal electrocardiogram present at Baseline is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal electrocardiogram present at Baseline is clinically significant.","meaning":"Boolean indicating whether the patient's abnormal electrocardiogram present at Baseline is clinically significant."} ;; "clinically significant abnormal electrocardiogram present at Baseline"
(declare-const patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_screening_or_at_baseline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal electrocardiogram is present at Screening or at Baseline.","when_to_set_to_false":"Set to false if the patient's abnormal electrocardiogram is not present at Screening or at Baseline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal electrocardiogram is present at Screening or at Baseline.","meaning":"Boolean indicating whether the patient's abnormal electrocardiogram is present at Screening or at Baseline."} ;; "abnormal electrocardiogram present at Screening or at Baseline"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_electrocardiogram_abnormal_now@@clinically_significant
      patient_has_finding_of_electrocardiogram_abnormal_now)
   :named REQ7_AUXILIARY0)) ;; "clinically significant abnormal electrocardiogram"

(assert
(! (=> patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_screening
      patient_has_finding_of_electrocardiogram_abnormal_now)
   :named REQ7_AUXILIARY1)) ;; "abnormal electrocardiogram present at Screening"

(assert
(! (=> patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_baseline
      patient_has_finding_of_electrocardiogram_abnormal_now)
   :named REQ7_AUXILIARY2)) ;; "abnormal electrocardiogram present at Baseline"

(assert
(! (=> patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_screening@@clinically_significant
      patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_screening)
   :named REQ7_AUXILIARY3)) ;; "clinically significant abnormal electrocardiogram present at Screening"

(assert
(! (=> patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_baseline@@clinically_significant
      patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_baseline)
   :named REQ7_AUXILIARY4)) ;; "clinically significant abnormal electrocardiogram present at Baseline"

;; "present at Screening or at Baseline" is the logical OR of the two
(assert
(! (= patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_screening_or_at_baseline
      (or patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_screening
          patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_baseline))
   :named REQ7_AUXILIARY5)) ;; "abnormal electrocardiogram present at Screening or at Baseline"

;; "clinically significant abnormal electrocardiogram at Screening" is the logical AND of present at Screening and clinically significant
(assert
(! (= patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_screening@@clinically_significant
      (and patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_screening
           patient_has_finding_of_electrocardiogram_abnormal_now@@clinically_significant))
   :named REQ7_AUXILIARY6)) ;; "clinically significant abnormal electrocardiogram at Screening"

;; "clinically significant abnormal electrocardiogram at Baseline" is the logical AND of present at Baseline and clinically significant
(assert
(! (= patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_baseline@@clinically_significant
      (and patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_baseline
           patient_has_finding_of_electrocardiogram_abnormal_now@@clinically_significant))
   :named REQ7_AUXILIARY7)) ;; "clinically significant abnormal electrocardiogram at Baseline"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have a clinically significant abnormal electrocardiogram at Screening
(assert
(! (not patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_screening@@clinically_significant)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a clinically significant abnormal electrocardiogram at Screening."

;; Exclusion: patient must NOT have a clinically significant abnormal electrocardiogram at Baseline
(assert
(! (not patient_has_finding_of_electrocardiogram_abnormal_now@@present_at_baseline@@clinically_significant)
   :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a clinically significant abnormal electrocardiogram at Baseline."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_operation_on_heart_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a cardiac surgery (operation on heart) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a cardiac surgery (operation on heart) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a cardiac surgery (operation on heart).","meaning":"Boolean indicating whether the patient has ever undergone a cardiac surgery (operation on heart) at any time in their history."} ;; "cardiac surgery"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not patient_has_undergone_operation_on_heart_inthehistory)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cardiac surgery."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "asthma"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_diagnosis_of_asthma_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has asthma."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_epilepsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of epilepsy.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of epilepsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of epilepsy.","meaning":"Boolean indicating whether the patient currently has a diagnosis of epilepsy."} ;; "epilepsy"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! (not patient_has_diagnosis_of_epilepsy_now)
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has epilepsy."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_diagnosis_of_myasthenia_gravis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of myasthenia gravis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of myasthenia gravis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of myasthenia gravis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of myasthenia gravis."} ;; "myasthenia gravis"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (not patient_has_diagnosis_of_myasthenia_gravis_now)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has myasthenia gravis."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_abnormal_liver_function_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had abnormal liver function (hepatic dysfunction) documented at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had abnormal liver function (hepatic dysfunction) documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had abnormal liver function (hepatic dysfunction).","meaning":"Boolean indicating whether the patient has ever had abnormal liver function (hepatic dysfunction) in their medical history."} ;; "hepatic dysfunction"
(declare-const patient_has_finding_of_renal_impairment_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had renal impairment (renal dysfunction) documented at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had renal impairment (renal dysfunction) documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had renal impairment (renal dysfunction).","meaning":"Boolean indicating whether the patient has ever had renal impairment (renal dysfunction) in their medical history."} ;; "renal dysfunction"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_abnormal_liver_function_inthehistory)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hepatic dysfunction."

(assert
(! (not patient_has_finding_of_renal_impairment_inthehistory)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of renal dysfunction."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_diagnosis_of_porphyria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of porphyria.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of porphyria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of porphyria.","meaning":"Boolean indicating whether the patient currently has a diagnosis of porphyria."} ;; "porphyria"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_diagnosis_of_porphyria_now)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has porphyria."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_allergy_to_lidocaine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented clinical finding of allergy to lidocaine at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented clinical finding of allergy to lidocaine in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of allergy to lidocaine.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of allergy to lidocaine in their history."} ;; "hypersensitivity to lidocaine"

(declare-const patient_has_finding_of_allergy_to_related_drugs_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented clinical finding of allergy or hypersensitivity to drugs related to lidocaine at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented clinical finding of allergy or hypersensitivity to drugs related to lidocaine in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of allergy or hypersensitivity to drugs related to lidocaine.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of allergy or hypersensitivity to drugs related to lidocaine in their history."} ;; "hypersensitivity to related drugs"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_allergy_to_lidocaine_inthehistory)
    :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to lidocaine."

(assert
(! (not patient_has_finding_of_allergy_to_related_drugs_inthehistory)
    :named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to related drugs."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding as documented or reported.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breastfeeding.","meaning":"Boolean indicating whether the patient is currently breastfeeding."} ;; "breastfeeding"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Link alternate breastfeeding variable to main breastfeeding variable
(assert
(! (= patient_is_breastfeeding_now patients_breastfeeding_is_positive_now)
:named REQ15_AUXILIARY0)) ;; "breastfeeding"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_breastfeeding_now)
:named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breastfeeding."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_patient_entered_into_trial_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in another clinical trial at any time within the past six weeks.","when_to_set_to_false":"Set to false if the patient has not participated in another clinical trial at any time within the past six weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in another clinical trial within the past six weeks.","meaning":"Boolean indicating whether the patient has participated in another clinical trial within the past six weeks."} ;; "participated in another trial within the preceding six weeks"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_finding_of_patient_entered_into_trial_inthepast6weeks)
    :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in another trial within the preceding six weeks."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_injury_of_mouth_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has injury (trauma) to the oral mucosa.","when_to_set_to_false":"Set to false if the patient currently does not have injury (trauma) to the oral mucosa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has injury (trauma) to the oral mucosa.","meaning":"Boolean indicating whether the patient currently has injury (trauma) to the oral mucosa."} ;; "trauma to the oral mucosa"
(declare-const patient_has_finding_of_ulcer_of_mouth_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ulceration of the oral mucosa.","when_to_set_to_false":"Set to false if the patient currently does not have ulceration of the oral mucosa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ulceration of the oral mucosa.","meaning":"Boolean indicating whether the patient currently has ulceration of the oral mucosa."} ;; "ulceration of the oral mucosa"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_finding_of_injury_of_mouth_now)
    :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has trauma to the oral mucosa."

(assert
(! (not patient_has_finding_of_ulcer_of_mouth_now)
    :named REQ17_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ulceration of the oral mucosa."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_finding_of_lower_respiratory_tract_infection_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a lower respiratory tract infection (chest infection) within the past six weeks.","when_to_set_to_false":"Set to false if the patient has not had a lower respiratory tract infection (chest infection) within the past six weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a lower respiratory tract infection (chest infection) within the past six weeks.","meaning":"Boolean indicating whether the patient has had a lower respiratory tract infection (chest infection) within the past six weeks."} ;; "chest infection within the past six weeks"
(declare-const patient_has_finding_of_upper_respiratory_infection_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an upper respiratory infection (upper airway infection) within the past six weeks.","when_to_set_to_false":"Set to false if the patient has not had an upper respiratory infection (upper airway infection) within the past six weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an upper respiratory infection (upper airway infection) within the past six weeks.","meaning":"Boolean indicating whether the patient has had an upper respiratory infection (upper airway infection) within the past six weeks."} ;; "upper airway infection within the past six weeks"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
  (! (not patient_has_finding_of_lower_respiratory_tract_infection_inthepast6weeks)
     :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of chest infection within the past six weeks."

(assert
  (! (not patient_has_finding_of_upper_respiratory_infection_inthepast6weeks)
     :named REQ18_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of upper airway infection within the past six weeks."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_condition_which_may_affect_cough_response_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any condition which may affect cough response, including but not limited to stroke, diabetes mellitus, or Parkinson's disease.","when_to_set_to_false":"Set to false if the patient currently does not have any condition which may affect cough response.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any condition which may affect cough response.","meaning":"Boolean indicating whether the patient currently has any condition which may affect cough response, including but not limited to stroke, diabetes mellitus, or Parkinson's disease."} ;; "condition which may affect cough response"
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cerebrovascular accident (stroke).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cerebrovascular accident (stroke).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient currently has a diagnosis of cerebrovascular accident (stroke)."} ;; "stroke"
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes mellitus"
(declare-const patient_has_diagnosis_of_parkinson_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Parkinson's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Parkinson's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Parkinson's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Parkinson's disease."} ;; "Parkinson's disease"
(declare-const patients_cough_reflex_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cough reflex is abnormal now (i.e., cough response is affected).","when_to_set_to_false":"Set to false if the patient's cough reflex is not abnormal now (i.e., cough response is normal).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cough reflex is abnormal now.","meaning":"Boolean indicating whether the patient's cough reflex is abnormal now."} ;; "cough response"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_cerebrovascular_accident_now
          patient_has_diagnosis_of_diabetes_mellitus_now
          patient_has_diagnosis_of_parkinson_s_disease_now)
    patient_has_condition_which_may_affect_cough_response_now)
:named REQ19_AUXILIARY0)) ;; "with non-exhaustive examples (stroke, diabetes mellitus, Parkinson's disease)"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_condition_which_may_affect_cough_response_now)
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a condition which may affect cough response with non-exhaustive examples (stroke, diabetes mellitus, Parkinson's disease)."
