;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged > 45 years"
(declare-const patient_is_age_matched_with_previously_enrolled_cohort_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is age matched with a previously enrolled cohort of current smokers and ex-smokers with airflow obstruction and moderate atypia on sputum cytology.","when_to_set_to_false":"Set to false if the patient is not age matched with such a cohort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is age matched with such a cohort.","meaning":"Boolean indicating whether the patient is age matched with a previously enrolled cohort of current smokers and ex-smokers with airflow obstruction and moderate atypia on sputum cytology."} // "be age matched with a previously enrolled cohort of current smokers and ex-smokers with airflow obstruction and moderate atypia on sputum cytology"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 45)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged > 45 years."

(assert
  (! patient_is_age_matched_with_previously_enrolled_cohort_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age matched with a previously enrolled cohort of current smokers and ex-smokers with airflow obstruction and moderate atypia on sputum cytology."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} // "current smoker"
(declare-const patient_cigarette_pack_years_value_recorded_now_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's total cigarette pack years is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's total cigarette pack years recorded now."} // "more than 30 pack years"
(declare-const patient_has_finding_of_airflow_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has airflow obstruction.","when_to_set_to_false":"Set to false if the patient currently does not have airflow obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has airflow obstruction.","meaning":"Boolean indicating whether the patient currently has airflow obstruction."} // "no airflow obstruction"
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_predicted Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's FEV1 (percent predicted) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's FEV1 (percent predicted) recorded now."} // "forced expiratory volume in one second greater than 90 percent predicted"
(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary malignant neoplasm of lung (lung cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary malignant neoplasm of lung (lung cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of lung cancer.","meaning":"Boolean indicating whether the patient currently has a diagnosis of lung cancer."} // "no lung cancer"
;; patient_age_value_recorded_now_in_years already declared
;; patient_is_age_matched_with_previously_enrolled_cohort_now already declared
(declare-const patient_has_finding_of_sputum_cytology_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of sputum cytology.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of sputum cytology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of sputum cytology.","meaning":"Boolean indicating whether the patient currently has a finding of sputum cytology."} // "sputum cytology"
(declare-const patient_has_finding_of_sputum_cytology_now@@shows_moderate_atypia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sputum cytology finding currently shows moderate atypia.","when_to_set_to_false":"Set to false if the patient's sputum cytology finding currently does not show moderate atypia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sputum cytology finding currently shows moderate atypia.","meaning":"Boolean indicating whether the patient's sputum cytology finding currently shows moderate atypia."} // "moderate atypia on sputum cytology"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: FEV1 > 90% predicted implies no airflow obstruction
(assert
  (! (= patient_has_finding_of_airflow_obstruction_now
        (not (> patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_predicted 90.0)))
     :named REQ1_AUXILIARY0)) ;; "no airflow obstruction (forced expiratory volume in one second greater than 90 percent predicted)"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_sputum_cytology_now@@shows_moderate_atypia
         patient_has_finding_of_sputum_cytology_now)
     :named REQ1_AUXILIARY1)) ;; "moderate atypia on sputum cytology"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: All inclusion criteria must be satisfied
(assert
  (! (and
        patient_has_finding_of_smoker_now ;; "current smoker"
        (> patient_cigarette_pack_years_value_recorded_now_withunit_pack_years 30.0) ;; "more than 30 pack years"
        (or (not patient_has_finding_of_airflow_obstruction_now)
            (> patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_predicted 90.0)
            (not patient_has_diagnosis_of_primary_malignant_neoplasm_of_lung_now)) ;; "no airflow obstruction ... or have no lung cancer"
        (> patient_age_value_recorded_now_in_years 50.0) ;; "over 50 years of age"
        patient_is_age_matched_with_previously_enrolled_cohort_now ;; "age matched with a previously enrolled cohort with airflow obstruction and moderate atypia on sputum cytology"
     )
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_head_carcinoma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with head carcinoma at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with head carcinoma at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with head carcinoma.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of head carcinoma in their history."} // "NOT have prior history of head carcinoma"
(declare-const patient_has_diagnosis_of_malignant_tumor_of_neck_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant tumor of the neck (neck carcinoma) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant tumor of the neck (neck carcinoma) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant tumor of the neck (neck carcinoma).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant tumor of the neck (neck carcinoma) in their history."} // "NOT have prior history of neck carcinoma"
(declare-const patient_has_diagnosis_of_bronchogenic_carcinoma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with bronchogenic carcinoma at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with bronchogenic carcinoma at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with bronchogenic carcinoma.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of bronchogenic carcinoma in their history."} // "NOT have prior history of bronchogenic carcinoma"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must NOT have prior history of head carcinoma AND NOT have prior history of neck carcinoma AND NOT have prior history of bronchogenic carcinoma.
(assert
  (! (and (not patient_has_diagnosis_of_head_carcinoma_inthehistory)
          (not patient_has_diagnosis_of_malignant_tumor_of_neck_inthehistory)
          (not patient_has_diagnosis_of_bronchogenic_carcinoma_inthehistory))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_fully_informed_of_investigational_nature_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been fully informed of the investigational nature of this study.","when_to_set_to_false":"Set to false if the patient has not been fully informed of the investigational nature of this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been fully informed of the investigational nature of this study.","meaning":"Boolean indicating whether the patient has been fully informed of the investigational nature of this study."} // "be fully informed of the investigational nature of this study"
(declare-const patient_has_signed_informed_consent_in_accordance_with_institutional_and_fda_guidelines Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed an informed consent and the process was in accordance with both institutional guidelines and Food and Drug Administration guidelines.","when_to_set_to_false":"Set to false if the patient has not signed an informed consent or the process was not in accordance with both institutional guidelines and Food and Drug Administration guidelines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed an informed consent in accordance with both institutional guidelines and Food and Drug Administration guidelines.","meaning":"Boolean indicating whether the patient has signed an informed consent in accordance with both institutional guidelines and Food and Drug Administration guidelines."} // "sign an informed consent in accordance with institutional guidelines AND Food and Drug Administration guidelines"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Patient must be fully informed of the investigational nature of this study
(assert
  (! patient_is_fully_informed_of_investigational_nature_of_study
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be fully informed of the investigational nature of this study"

;; Component 1: Patient must sign an informed consent in accordance with institutional guidelines AND FDA guidelines
(assert
  (! patient_has_signed_informed_consent_in_accordance_with_institutional_and_fda_guidelines
     :named REQ3_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "sign an informed consent in accordance with institutional guidelines AND Food and Drug Administration guidelines"
