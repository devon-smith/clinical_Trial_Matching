;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_written_informed_consent_signed_and_dated Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent and the consent document is both signed and dated.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent, or the consent document is missing either a signature or a date.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent that is both signed and dated.","meaning":"Boolean indicating whether the patient has provided written informed consent that is both signed and dated."} // "To be included, the patient must have signed AND dated written informed consent."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_written_informed_consent_signed_and_dated
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have signed written informed consent."
(assert
  (! patient_has_written_informed_consent_signed_and_dated
     :named REQ0_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have dated written informed consent."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "male"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 40 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (male OR female)."

(assert
  (! (>= patient_age_value_recorded_now_in_years 40)
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be age ≥ 40 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential (e.g., post-menopausal, surgically sterile).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} // "post-menopausal"
(declare-const patient_is_able_to_be_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to become pregnant.","when_to_set_to_false":"Set to false if the patient is currently not able to become pregnant (e.g., due to sterilization, menopause, or other medical reasons).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is able to become pregnant.","meaning":"Boolean value indicating whether the patient is currently able to become pregnant."} // "using a highly effective method for avoidance of pregnancy"
(declare-const patient_is_post_menopausal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently post-menopausal.","when_to_set_to_false":"Set to false if the patient is currently not post-menopausal.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is currently post-menopausal.","meaning":"Boolean value indicating whether the patient is currently post-menopausal."} // "post-menopausal"
(declare-const patient_is_using_highly_effective_method_for_avoidance_of_pregnancy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a highly effective method for avoidance of pregnancy.","when_to_set_to_false":"Set to false if the patient is currently not using a highly effective method for avoidance of pregnancy.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is currently using a highly effective method for avoidance of pregnancy.","meaning":"Boolean value indicating whether the patient is currently using a highly effective method for avoidance of pregnancy."} // "using a highly effective method for avoidance of pregnancy"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: post-menopausal patients do not have childbearing potential
(assert
  (! (= patient_is_post_menopausal_now
        (not patient_has_childbearing_potential_now))
     :named REQ2_AUXILIARY0)) ;; "post-menopausal" ≡ not childbearing potential

;; Definition: patients able to be pregnant have childbearing potential
(assert
  (! (= patient_is_able_to_be_pregnant_now
        patient_has_childbearing_potential_now)
     :named REQ2_AUXILIARY1)) ;; "able to be pregnant" ≡ childbearing potential

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must be female.
(assert
  (! patient_sex_is_female_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be female."

;; Component 1: To be included, the patient must be ((post-menopausal) OR (using a highly effective method for avoidance of pregnancy)).
(assert
  (! (or patient_is_post_menopausal_now
         patient_is_using_highly_effective_method_for_avoidance_of_pregnancy_now)
     :named REQ2_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be ((post-menopausal) OR (using a highly effective method for avoidance of pregnancy))."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented clinical history of chronic obstructive pulmonary disease at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented clinical history of chronic obstructive pulmonary disease at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a clinical history of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient has a history of chronic obstructive pulmonary disease."} // "chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_inthehistory@@defined_by_american_thoracic_society_european_respiratory_society Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of chronic obstructive pulmonary disease is defined by the American Thoracic Society/European Respiratory Society criteria.","when_to_set_to_false":"Set to false if the patient's history of chronic obstructive pulmonary disease is not defined by the American Thoracic Society/European Respiratory Society criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of chronic obstructive pulmonary disease is defined by the American Thoracic Society/European Respiratory Society criteria.","meaning":"Boolean indicating whether the patient's history of chronic obstructive pulmonary disease is defined by the American Thoracic Society/European Respiratory Society criteria."} // "by American Thoracic Society/European Respiratory Society definition"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies the corresponding stem variable
(assert
  (! (=> patient_has_finding_of_chronic_obstructive_lung_disease_inthehistory@@defined_by_american_thoracic_society_european_respiratory_society
         patient_has_finding_of_chronic_obstructive_lung_disease_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "by American Thoracic Society/European Respiratory Society definition" implies "chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_chronic_obstructive_lung_disease_inthehistory@@defined_by_american_thoracic_society_european_respiratory_society
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have an established clinical history of chronic obstructive pulmonary disease (by American Thoracic Society/European Respiratory Society definition)."

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's post-bronchodilator FEV1 as percent of predicted normal is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's post-bronchodilator FEV1 as percent of predicted normal recorded now."} // "forced expiratory volume in one second ≥ 30 % of predicted normal (by National Health and Nutrition Examination Survey III) AND forced expiratory volume in one second ≤ 70 % of predicted normal (by National Health and Nutrition Examination Survey III)"
(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's post-bronchodilator FEV1/FVC ratio is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's post-bronchodilator FEV1/FVC ratio recorded now."} // "forced expiratory volume in one second/forced vital capacity ratio ≤ 0.70"
(declare-const patient_has_undergone_post_bronchodilator_spirometry_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone post-bronchodilator spirometry now.","when_to_set_to_false":"Set to false if the patient has not undergone post-bronchodilator spirometry now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone post-bronchodilator spirometry now.","meaning":"Boolean indicating whether the patient has undergone post-bronchodilator spirometry now."} // "post-albuterol spirometry"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: FEV1/FVC ratio ≤ 0.70, post-bronchodilator
(assert
  (! (and patient_has_undergone_post_bronchodilator_spirometry_now
          (<= patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio 0.70))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "forced expiratory volume in one second/forced vital capacity ratio ≤ 0.70"

;; Component 1: FEV1 ≥ 30% and ≤ 70% of predicted normal, post-bronchodilator
(assert
  (! (and patient_has_undergone_post_bronchodilator_spirometry_now
          (>= patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted 30.0)
          (<= patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted 70.0))
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "forced expiratory volume in one second ≥ 30 % of predicted normal (by National Health and Nutrition Examination Survey III) AND forced expiratory volume in one second ≤ 70 % of predicted normal (by National Health and Nutrition Examination Survey III)"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_cigarette_pack_years_value_recorded_now_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's number of cigarette pack years is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current number of cigarette pack years."} // "pack years"
(declare-const patient_has_finding_of_current_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a current smoker.","when_to_set_to_false":"Set to false if the patient is not currently classified as a current smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a current smoker.","meaning":"Boolean indicating whether the patient is currently classified as a current smoker."} // "current smoker"
(declare-const patient_has_finding_of_former_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a former smoker.","when_to_set_to_false":"Set to false if the patient is not currently classified as a former smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a former smoker.","meaning":"Boolean indicating whether the patient is currently classified as a former smoker."} // "former smoker"
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker, including current or former smoker status.","when_to_set_to_false":"Set to false if the patient is not a smoker (never smoked).","when_to_set_to_null":"Set to null if the patient's smoking status is unknown or cannot be determined.","meaning":"Boolean indicating whether the patient is currently a smoker (current or former)."} // "smoker"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Being a current or former smoker implies smoker umbrella
(assert
  (! (=> patient_has_finding_of_current_smoker_now
         patient_has_finding_of_smoker_now)
     :named REQ5_AUXILIARY0)) ;; "current smoker" implies "smoker"

(assert
  (! (=> patient_has_finding_of_former_smoker_now
         patient_has_finding_of_smoker_now)
     :named REQ5_AUXILIARY1)) ;; "former smoker" implies "smoker"

;; ===================== Constraint Assertions (REQ 5) =====================
;; To be included, the patient must be a former smoker OR a current smoker with ≥10 pack years.
(assert
  (! (or patient_has_finding_of_former_smoker_now
         (and patient_has_finding_of_current_smoker_now
              (>= patient_cigarette_pack_years_value_recorded_now_withunit_pack_years 10.0)))
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a former smoker or a current smoker with ≥10 pack years."

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cerebrovascular accident (stroke) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cerebrovascular accident (stroke) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever been diagnosed with cerebrovascular accident (stroke) in the past."} // "previous stroke"
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with coronary arteriosclerosis (coronary artery disease) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with coronary arteriosclerosis (coronary artery disease) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with coronary arteriosclerosis (coronary artery disease).","meaning":"Boolean indicating whether the patient has ever been diagnosed with coronary arteriosclerosis (coronary artery disease) in the past."} // "established coronary artery disease"
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@established Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of coronary arteriosclerosis (coronary artery disease) is established.","when_to_set_to_false":"Set to false if the diagnosis is not established.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diagnosis is established.","meaning":"Boolean indicating whether the diagnosis of coronary arteriosclerosis (coronary artery disease) is established."} // "established"
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@confirmed_by_clinical_signs_or_imaging_studies Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of coronary arteriosclerosis (coronary artery disease) is confirmed by clinical signs or imaging studies.","when_to_set_to_false":"Set to false if the diagnosis is not confirmed by clinical signs or imaging studies.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diagnosis is confirmed by clinical signs or imaging studies.","meaning":"Boolean indicating whether the diagnosis of coronary arteriosclerosis (coronary artery disease) is confirmed by clinical signs or imaging studies."} // "by clinical signs OR imaging studies"
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a disorder of the cardiovascular system (cardiovascular disease) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a disorder of the cardiovascular system (cardiovascular disease) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a disorder of the cardiovascular system (cardiovascular disease).","meaning":"Boolean indicating whether the patient has ever been diagnosed with a disorder of the cardiovascular system (cardiovascular disease) in the past."} // "diagnosed cardiovascular disease"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myocardial infarction.","meaning":"Boolean indicating whether the patient has ever been diagnosed with myocardial infarction in the past."} // "previous myocardial infarction"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_within6months_before_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of myocardial infarction occurred within 6 months prior to Visit 1.","when_to_set_to_false":"Set to false if the diagnosis did not occur within 6 months prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diagnosis occurred within 6 months prior to Visit 1.","meaning":"Boolean indicating whether the diagnosis of myocardial infarction occurred within 6 months prior to Visit 1."} // "myocardial infarction within 6 months prior to Visit 1"
(declare-const patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with transient cerebral ischemia (transient ischemic attack) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with transient cerebral ischemia (transient ischemic attack) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with transient cerebral ischemia (transient ischemic attack).","meaning":"Boolean indicating whether the patient has ever been diagnosed with transient cerebral ischemia (transient ischemic attack) in the past."} // "transient ischemic attack"
(declare-const patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory@@objectively_confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of transient cerebral ischemia (transient ischemic attack) is objectively confirmed.","when_to_set_to_false":"Set to false if the diagnosis is not objectively confirmed.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diagnosis is objectively confirmed.","meaning":"Boolean indicating whether the diagnosis of transient cerebral ischemia (transient ischemic attack) is objectively confirmed."} // "objectively confirmed"
(declare-const patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory@@transient_neurological_deficit_documented_by_health_care_professional Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of transient cerebral ischemia (transient ischemic attack) is defined as a transient neurological deficit documented by a health-care professional.","when_to_set_to_false":"Set to false if the diagnosis is not defined as such.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diagnosis is defined as a transient neurological deficit documented by a health-care professional.","meaning":"Boolean indicating whether the diagnosis of transient cerebral ischemia (transient ischemic attack) is defined as a transient neurological deficit documented by a health-care professional."} // "transient neurological deficit documented by a health-care professional"
(declare-const patient_has_diagnosis_of_vascular_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a vascular disorder (vascular disease) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a vascular disorder (vascular disease) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a vascular disorder (vascular disease).","meaning":"Boolean indicating whether the patient has ever been diagnosed with a vascular disorder (vascular disease) in the past."} // "peripheral vascular disease (arterial)"
(declare-const patient_has_diagnosis_of_vascular_disorder_inthehistory@@established Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of vascular disorder (vascular disease) is established.","when_to_set_to_false":"Set to false if the diagnosis is not established.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diagnosis is established.","meaning":"Boolean indicating whether the diagnosis of vascular disorder (vascular disease) is established."} // "established"
(declare-const patient_has_diagnosis_of_vascular_disorder_inthehistory@@confirmed_by_clinical_signs_or_imaging_studies Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of vascular disorder (vascular disease) is confirmed by clinical signs or imaging studies.","when_to_set_to_false":"Set to false if the diagnosis is not confirmed by clinical signs or imaging studies.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diagnosis is confirmed by clinical signs or imaging studies.","meaning":"Boolean indicating whether the diagnosis of vascular disorder (vascular disease) is confirmed by clinical signs or imaging studies."} // "by clinical signs OR imaging studies"
(declare-const patient_has_diagnosis_of_vascular_disorder_inthehistory@@peripheral_and_arterial Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of vascular disorder (vascular disease) is peripheral and arterial.","when_to_set_to_false":"Set to false if the diagnosis is not peripheral and arterial.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diagnosis is peripheral and arterial.","meaning":"Boolean indicating whether the diagnosis of vascular disorder (vascular disease) is peripheral and arterial."} // "peripheral and arterial"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@established
         patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory)
     :named REQ6_AUXILIARY0)) ;; "established coronary artery disease"

(assert
  (! (=> patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@confirmed_by_clinical_signs_or_imaging_studies
         patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory)
     :named REQ6_AUXILIARY1)) ;; "by clinical signs OR imaging studies"

(assert
  (! (=> patient_has_diagnosis_of_vascular_disorder_inthehistory@@established
         patient_has_diagnosis_of_vascular_disorder_inthehistory)
     :named REQ6_AUXILIARY2)) ;; "established peripheral vascular disease"

(assert
  (! (=> patient_has_diagnosis_of_vascular_disorder_inthehistory@@confirmed_by_clinical_signs_or_imaging_studies
         patient_has_diagnosis_of_vascular_disorder_inthehistory)
     :named REQ6_AUXILIARY3)) ;; "by clinical signs OR imaging studies"

(assert
  (! (=> patient_has_diagnosis_of_vascular_disorder_inthehistory@@peripheral_and_arterial
         patient_has_diagnosis_of_vascular_disorder_inthehistory)
     :named REQ6_AUXILIARY4)) ;; "peripheral and arterial"

(assert
  (! (=> patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory@@objectively_confirmed
         patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory)
     :named REQ6_AUXILIARY5)) ;; "objectively confirmed transient ischemic attack"

(assert
  (! (=> patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory@@transient_neurological_deficit_documented_by_health_care_professional
         patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory)
     :named REQ6_AUXILIARY6)) ;; "transient neurological deficit documented by a health-care professional"

(assert
  (! (=> patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_within6months_before_visit_1
         patient_has_diagnosis_of_myocardial_infarction_inthehistory)
     :named REQ6_AUXILIARY7)) ;; "myocardial infarction within 6 months prior to Visit 1"

;; Exhaustive subcategories for "prior cardiovascular event"
(define-fun patient_has_prior_cardiovascular_event () Bool
  (or
    ;; established coronary artery disease (by clinical signs OR imaging studies)
    (and patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@established
         patient_has_diagnosis_of_coronary_arteriosclerosis_inthehistory@@confirmed_by_clinical_signs_or_imaging_studies)
    ;; established peripheral vascular disease (arterial) (by clinical signs OR imaging studies)
    (and patient_has_diagnosis_of_vascular_disorder_inthehistory@@established
         patient_has_diagnosis_of_vascular_disorder_inthehistory@@peripheral_and_arterial
         patient_has_diagnosis_of_vascular_disorder_inthehistory@@confirmed_by_clinical_signs_or_imaging_studies)
    ;; previous stroke
    patient_has_diagnosis_of_cerebrovascular_accident_inthehistory
    ;; objectively confirmed transient ischemic attack (transient neurological deficit documented by a health-care professional)
    (and patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory@@objectively_confirmed
         patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory@@transient_neurological_deficit_documented_by_health_care_professional)
    ;; previous myocardial infarction
    patient_has_diagnosis_of_myocardial_infarction_inthehistory
  )
) ;; "prior cardiovascular event with exhaustive subcategories"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: (a history of diagnosed cardiovascular disease OR a prior cardiovascular event with exhaustive subcategories)
(assert
  (! (or patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory
         patient_has_prior_cardiovascular_event)
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a history of diagnosed cardiovascular disease OR a prior cardiovascular event with exhaustive subcategories"

;; Component 1: NOT (myocardial infarction within 6 months prior to Visit 1)
(assert
  (! (not patient_has_diagnosis_of_myocardial_infarction_inthehistory@@temporalcontext_within6months_before_visit_1)
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "NOT (myocardial infarction within 6 months prior to Visit 1)"

;; ===================== Declarations for the inclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension)."} // "current diagnosis of hypertension"
(declare-const patient_has_diagnosis_of_hypercholesterolemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypercholesterolemia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypercholesterolemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypercholesterolemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypercholesterolemia."} // "current diagnosis of hypercholesterolemia"
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} // "diabetes mellitus"
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now@@treated_with_pharmacotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus and the diabetes mellitus is treated with pharmacotherapy.","when_to_set_to_false":"Set to false if the patient currently has diabetes mellitus but it is not treated with pharmacotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diabetes mellitus is treated with pharmacotherapy.","meaning":"Boolean indicating whether the patient's current diabetes mellitus is treated with pharmacotherapy."} // "diabetes mellitus treated with pharmacotherapy"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable for diabetes mellitus treated with pharmacotherapy implies diabetes mellitus diagnosis
(assert
  (! (=> patient_has_diagnosis_of_diabetes_mellitus_now@@treated_with_pharmacotherapy
         patient_has_diagnosis_of_diabetes_mellitus_now)
     :named REQ7_AUXILIARY0)) ;; "diabetes mellitus treated with pharmacotherapy" implies "diabetes mellitus"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: (a former smoker OR a current smoker)
(assert
  (! (or patient_has_finding_of_former_smoker_now
         patient_has_finding_of_current_smoker_now)
     :named REQ7_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "a former smoker OR a current smoker"

;; Component 1: (current diagnosis of hypertension OR current diagnosis of hypercholesterolemia OR diabetes mellitus treated with pharmacotherapy)
(assert
  (! (or patient_has_diagnosis_of_hypertensive_disorder_now
         patient_has_diagnosis_of_hypercholesterolemia_now
         patient_has_diagnosis_of_diabetes_mellitus_now@@treated_with_pharmacotherapy)
     :named REQ7_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "current diagnosis of hypertension OR current diagnosis of hypercholesterolemia OR diabetes mellitus treated with pharmacotherapy"
