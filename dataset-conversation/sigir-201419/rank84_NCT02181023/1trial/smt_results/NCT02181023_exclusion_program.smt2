;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_acute_bronchial_exacerbation_at_recruitment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has acute bronchial exacerbation at the time of recruitment.","when_to_set_to_false":"Set to false if the patient does not have acute bronchial exacerbation at the time of recruitment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has acute bronchial exacerbation at the time of recruitment.","meaning":"Boolean indicating whether the patient has acute bronchial exacerbation at the time of recruitment."} ;; "The patient is excluded if the patient has acute bronchial exacerbation at recruitment."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_acute_bronchial_exacerbation_at_recruitment)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute bronchial exacerbation at recruitment."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient’s age ≥ 18 years AND the patient’s age ≤ 50 years"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have childbearing potential (i.e., is fertile).","when_to_set_to_false":"Set to false if the patient is currently considered not to have childbearing potential (i.e., is infertile).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "the patient is a fertile woman"
(declare-const patient_has_finding_of_menstrual_bleeding_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently experiencing active menstrual bleeding (menstrual period).","when_to_set_to_false":"Set to false if the patient is currently not experiencing active menstrual bleeding (menstrual period).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently experiencing active menstrual bleeding (menstrual period).","meaning":"Boolean indicating whether the patient currently has active menstrual bleeding (menstrual period)."} ;; "active menstrual period"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient is a fertile woman aged 18-50 years OR is a fertile woman with active menstrual period
(assert
(! (not (or
          (and patient_has_childbearing_potential_now
               (>= patient_age_value_recorded_now_in_years 18)
               (<= patient_age_value_recorded_now_in_years 50))
          (and patient_has_childbearing_potential_now
               patient_has_finding_of_menstrual_bleeding_present_now)))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is a fertile woman AND the patient’s age ≥ 18 years AND the patient’s age ≤ 50 years) OR (the patient is a fertile woman AND the patient has active menstrual period))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_undergoing_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in any clinical trial.","when_to_set_to_false":"Set to false if the patient is not currently enrolled in any clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in any clinical trial.","meaning":"Boolean indicating whether the patient is currently enrolled in a clinical trial."} ;; "the patient is enrolled in other clinical trials"

(declare-const patient_has_undergone_clinical_trial_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in a clinical trial in the past 1 month (preceding enrollment).","when_to_set_to_false":"Set to false if the patient has not participated in a clinical trial in the past 1 month (preceding enrollment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient participated in a clinical trial in the past 1 month.","meaning":"Boolean indicating whether the patient has participated in a clinical trial in the past 1 month."} ;; "the patient has taken part in a clinical trial in the month preceding the enrollment"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_is_undergoing_clinical_trial_now
            patient_has_undergone_clinical_trial_inthepast1months))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is enrolled in other clinical trials) OR (the patient has taken part in a clinical trial in the month preceding the enrollment)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_percent_of_predicted_value Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's FEV1/FVC ratio (forced expired volume in one second / forced vital capacity) is recorded now in percent of predicted value and measured in basal conditions.","when_to_set_to_null":"Set to null if no such measurement is available, not recorded now, or not measured in basal conditions.","meaning":"Numeric value representing the patient's FEV1/FVC ratio (forced expired volume in one second / forced vital capacity), measured now, expressed as percent of predicted value."} ;; "FEV1/FVC ratio > 70 percent of predicted value in basal conditions"

(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_percent_of_predicted_value@@measured_in_basal_conditions Bool) ;; {"when_to_set_to_true":"Set to true if the FEV1/FVC ratio measurement was taken in basal conditions.","when_to_set_to_false":"Set to false if the FEV1/FVC ratio measurement was not taken in basal conditions.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the measurement was taken in basal conditions.","meaning":"Boolean indicating whether the FEV1/FVC ratio measurement was taken in basal conditions."} ;; "in basal conditions"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not (and
            patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_percent_of_predicted_value@@measured_in_basal_conditions
            (> patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_percent_of_predicted_value 70)
          ))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has FEV1/FVC ratio > 70 percent of predicted value in basal conditions (where FEV1 = forced expiratory volume in one second, FVC = forced vital capacity)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted_value Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's FEV1 (forced expiratory volume in one second) is recorded now as percent of predicted value in basal conditions.","when_to_set_to_null":"Set to null if no such measurement is available, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's FEV1 (forced expiratory volume in one second) measured now, expressed as percent of predicted value."} ;; "forced expiratory volume in one second more than 70 percent of predicted value in basal conditions."
(declare-const patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted_value@@in_basal_conditions Bool) ;; {"when_to_set_to_true":"Set to true if the FEV1 measurement was taken in basal conditions (i.e., at baseline, without intervention or acute change).","when_to_set_to_false":"Set to false if the FEV1 measurement was not taken in basal conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken in basal conditions.","meaning":"Indicates whether the FEV1 measurement was taken in basal conditions."} ;; "in basal conditions"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and
          patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted_value@@in_basal_conditions
          (> patient_forced_expired_volume_in_1_second_value_recorded_now_withunit_percent_of_predicted_value 70)
      ))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has FEV1 > 70 percent of predicted value in basal conditions (where FEV1 = forced expiratory volume in one second)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_alpha_1_antitrypsin_deficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented deficit (deficiency) of alpha-1 antitrypsin.","when_to_set_to_false":"Set to false if the patient currently does not have a deficit (deficiency) of alpha-1 antitrypsin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a deficit (deficiency) of alpha-1 antitrypsin.","meaning":"Boolean indicating whether the patient currently has a deficit (deficiency) of alpha-1 antitrypsin."} ;; "deficit of alpha-1 antitrypsin"
(declare-const patient_has_finding_of_alpha_1_antitrypsin_deficiency_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's alpha-1 antitrypsin deficiency is known (confirmed/documented).","when_to_set_to_false":"Set to false if the patient's alpha-1 antitrypsin deficiency is not known (suspected, uncertain, or not documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's alpha-1 antitrypsin deficiency is known.","meaning":"Boolean indicating whether the patient's alpha-1 antitrypsin deficiency is known (confirmed/documented)."} ;; "known deficit of alpha-1 antitrypsin"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_alpha_1_antitrypsin_deficiency_now@@known
      patient_has_finding_of_alpha_1_antitrypsin_deficiency_now)
   :named REQ6_AUXILIARY0)) ;; "known deficit of alpha-1 antitrypsin"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_alpha_1_antitrypsin_deficiency_now@@known)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known deficit of alpha-1 antitrypsin."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_undergone_lung_volume_reduction_surgery_5a6303_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone lung volume reduction surgery (LVRS) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone lung volume reduction surgery (LVRS) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone lung volume reduction surgery (LVRS).","meaning":"Boolean indicating whether the patient has ever undergone lung volume reduction surgery (LVRS) at any time in their history."} ;; "The patient is excluded if the patient has undergone lung volume reduction surgery (LVRS)."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_has_undergone_lung_volume_reduction_surgery_5a6303_inthehistory)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has undergone lung volume reduction surgery (LVRS)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known diagnosis or finding of human immunodeficiency virus infection (HIV).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis or finding of human immunodeficiency virus infection (HIV).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus infection (HIV).","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection (HIV)."} ;; "human immunodeficiency virus infection"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not patient_has_finding_of_human_immunodeficiency_virus_infection_now)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known positivity to human immunodeficiency virus infection."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of alcohol abuse (misuses alcohol).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of alcohol abuse.","meaning":"Boolean indicating whether the patient currently has a finding of alcohol abuse."} ;; "the patient misuses alcohol"
(declare-const patient_has_finding_of_misuses_drugs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of drug misuse (misuses drugs).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of drug misuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of drug misuse.","meaning":"Boolean indicating whether the patient currently has a finding of drug misuse."} ;; "the patient misuses drugs"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not patient_has_finding_of_alcohol_abuse_now)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient misuses alcohol."

(assert
  (! (not patient_has_finding_of_misuses_drugs_now)
     :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient misuses drugs."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_undergone_measurement_of_respiratory_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone measurement of respiratory function (respiratory function tests) now.","when_to_set_to_false":"Set to false if the patient has not undergone measurement of respiratory function (respiratory function tests) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone measurement of respiratory function now.","meaning":"Boolean indicating whether the patient has undergone measurement of respiratory function (respiratory function tests) now."} ;; "respiratory function tests"
(declare-const patient_has_undergone_measurement_of_respiratory_function_now@@lacks_compliance_in_performing Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone measurement of respiratory function now and lacked compliance in performing the procedure (e.g., did not follow instructions, refused, or was otherwise noncompliant).","when_to_set_to_false":"Set to false if the patient has undergone measurement of respiratory function now and was compliant in performing the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient lacked compliance in performing the procedure.","meaning":"Boolean indicating whether the patient lacked compliance in performing measurement of respiratory function now."} ;; "lacks compliance in performing respiratory function tests"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_measurement_of_respiratory_function_now@@lacks_compliance_in_performing
      patient_has_undergone_measurement_of_respiratory_function_now)
:named REQ10_AUXILIARY0)) ;; "lacks compliance in performing respiratory function tests""

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_undergone_measurement_of_respiratory_function_now@@lacks_compliance_in_performing)
:named REQ10_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient lacks compliance in performing respiratory function tests."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a mental disorder (psychiatric disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a mental disorder (psychiatric disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a mental disorder (psychiatric disorder).","meaning":"Boolean indicating whether the patient currently has a diagnosis of a mental disorder."} ;; "psychiatric disorders"
(declare-const patient_is_not_capable_to_follow_study_prescriptions_due_to_language_problems Bool) ;; {"when_to_set_to_true":"Set to true if the patient is not capable to follow the study prescriptions because of language problems.","when_to_set_to_false":"Set to false if the patient is capable to follow the study prescriptions and language problems are not a barrier.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether language problems prevent the patient from following the study prescriptions.","meaning":"Boolean indicating whether the patient is not capable to follow the study prescriptions because of language problems."} ;; "the patient is not capable to follow the study prescriptions because of language problems"
(declare-const patient_is_not_capable_to_follow_study_prescriptions_due_to_psychiatric_disorders Bool) ;; {"when_to_set_to_true":"Set to true if the patient is not capable to follow the study prescriptions because of psychiatric disorders.","when_to_set_to_false":"Set to false if the patient is capable to follow the study prescriptions and psychiatric disorders are not a barrier.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether psychiatric disorders prevent the patient from following the study prescriptions.","meaning":"Boolean indicating whether the patient is not capable to follow the study prescriptions because of psychiatric disorders."} ;; "the patient is not capable to follow the study prescriptions because of psychiatric disorders"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_not_capable_to_follow_study_prescriptions_due_to_psychiatric_disorders)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is not capable to follow the study prescriptions because of psychiatric disorders."

(assert
(! (not patient_is_not_capable_to_follow_study_prescriptions_due_to_language_problems)
:named REQ11_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is not capable to follow the study prescriptions because of language problems."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_undergoing_long_term_oxygen_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing long-term oxygen therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing long-term oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing long-term oxygen therapy.","meaning":"Boolean indicating whether the patient is currently undergoing long-term oxygen therapy."} ;; "long-term oxygen therapy"
(declare-const patient_is_undergoing_long_term_oxygen_therapy_now@@at_rest Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing long-term oxygen therapy at rest.","when_to_set_to_false":"Set to false if the patient is currently undergoing long-term oxygen therapy but not at rest.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is undergoing long-term oxygen therapy at rest.","meaning":"Boolean indicating whether the patient is currently undergoing long-term oxygen therapy at rest."} ;; "long-term oxygen therapy ... at rest"
(declare-const patient_oxygen_value_recorded_now_withunit_litres_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured oxygen flow rate in litres per minute if the patient is currently receiving oxygen therapy and the flow rate is recorded.","when_to_set_to_null":"Set to null if no current oxygen flow rate measurement is available or the value is indeterminate.","meaning":"Numeric value representing the oxygen flow rate (litres per minute) currently administered to the patient."} ;; "oxygen flows greater than 6 litres per minute"
(declare-const patient_oxygen_value_recorded_now_withunit_litres_per_minute@@at_rest Real) ;; {"when_to_set_to_value":"Set to the measured oxygen flow rate in litres per minute if the patient is currently at rest and the flow rate is recorded.","when_to_set_to_null":"Set to null if no current oxygen flow rate measurement at rest is available or the value is indeterminate.","meaning":"Numeric value representing the oxygen flow rate (litres per minute) currently administered to the patient at rest."} ;; "oxygen flows greater than 6 litres per minute at rest"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_long_term_oxygen_therapy_now@@at_rest
      patient_is_undergoing_long_term_oxygen_therapy_now)
:named REQ12_AUXILIARY0)) ;; "long-term oxygen therapy at rest"

;; Qualifier variable for oxygen flow at rest is only meaningful if patient is at rest
;; (No further auxiliary needed unless requirement defines a relationship)

;; ===================== Constraint Assertions (REQ 12) =====================
;; Exclusion: patient must NOT be on long-term oxygen therapy with oxygen flows > 6 litres per minute at rest
(assert
(! (not (and patient_is_undergoing_long_term_oxygen_therapy_now@@at_rest
             (> patient_oxygen_value_recorded_now_withunit_litres_per_minute@@at_rest 6)))
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on long-term oxygen therapy with oxygen flows greater than 6 litres per minute at rest."
