;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_12_lead_ecg_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a 12-lead electrocardiogram (ECG) now.","when_to_set_to_false":"Set to false if the patient has not undergone a 12-lead electrocardiogram (ECG) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a 12-lead electrocardiogram (ECG) now.","meaning":"Boolean indicating whether the patient has undergone a 12-lead electrocardiogram (ECG) now."} ;; "12-derivation electrocardiogram"
(declare-const patient_has_undergone_12_lead_ecg_now@@shows_persistent_st_segment_elevation Bool) ;; {"when_to_set_to_true":"Set to true if the 12-lead ECG performed now shows persistent ST-segment elevation.","when_to_set_to_false":"Set to false if the 12-lead ECG performed now does not show persistent ST-segment elevation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the 12-lead ECG performed now shows persistent ST-segment elevation.","meaning":"Boolean indicating whether the 12-lead ECG performed now shows persistent ST-segment elevation."} ;; "showing persistent ST-segment elevation"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_12_lead_ecg_now@@shows_persistent_st_segment_elevation
      patient_has_undergone_12_lead_ecg_now)
:named REQ0_AUXILIARY0)) ;; "showing persistent ST-segment elevation" implies "12-derivation electrocardiogram"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_12_lead_ecg_now@@shows_persistent_st_segment_elevation)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a 12-derivation electrocardiogram showing persistent ST-segment elevation."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_angina_pectoris_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of angina pectoris.","meaning":"Boolean indicating whether the patient currently has a diagnosis of angina pectoris."} ;; "angina"
(declare-const patient_has_diagnosis_of_angina_pectoris_now@@caused_by_secondary_cause Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of angina pectoris is caused by a secondary cause (e.g., anemia, fever, hypovolemia, dehydration, or use of cocaine).","when_to_set_to_false":"Set to false if the patient's current diagnosis of angina pectoris is not caused by a secondary cause.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angina pectoris is caused by a secondary cause.","meaning":"Boolean indicating whether the patient's current angina pectoris diagnosis is caused by a secondary cause."} ;; "diagnosis of angina by a secondary cause"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_angina_pectoris_now@@caused_by_secondary_cause
      patient_has_diagnosis_of_angina_pectoris_now)
:named REQ1_AUXILIARY0)) ;; "diagnosis of angina by a secondary cause"

;; Non-exhaustive examples imply the secondary cause qualifier
(declare-const patient_has_diagnosis_of_anemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of anemia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of anemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of anemia."} ;; "anemia"
(declare-const patient_has_diagnosis_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of fever.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of fever.","meaning":"Boolean indicating whether the patient currently has a diagnosis of fever."} ;; "fever"
(declare-const patient_has_diagnosis_of_hypovolemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypovolemia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypovolemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypovolemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypovolemia."} ;; "hypovolemia"
(declare-const patient_has_diagnosis_of_dehydration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dehydration.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dehydration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dehydration.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dehydration."} ;; "dehydration"
(declare-const patient_has_history_of_cocaine_use_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using cocaine or has a history of cocaine use relevant to the current diagnosis.","when_to_set_to_false":"Set to false if the patient is not currently using cocaine and has no relevant history of cocaine use.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using cocaine or has a relevant history of cocaine use.","meaning":"Boolean indicating whether the patient is currently using cocaine or has a relevant history of cocaine use."} ;; "use of cocaine"

(assert
(! (=> (or patient_has_diagnosis_of_anemia_now
           patient_has_diagnosis_of_fever_now
           patient_has_diagnosis_of_hypovolemia_now
           patient_has_diagnosis_of_dehydration_now
           patient_has_history_of_cocaine_use_now)
    patient_has_diagnosis_of_angina_pectoris_now@@caused_by_secondary_cause)
:named REQ1_AUXILIARY1)) ;; "with non-exhaustive examples ((anemia) OR (fever) OR (hypovolemia) OR (dehydration) OR (use of cocaine))."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_angina_pectoris_now@@caused_by_secondary_cause)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of angina by a secondary cause with non-exhaustive examples ((anemia) OR (fever) OR (hypovolemia) OR (dehydration) OR (use of cocaine))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_taken_unfractionated_heparin_inthepast_48_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken unfractionated heparin in the 48 hours prior to randomization.","when_to_set_to_false":"Set to false if the patient has not taken unfractionated heparin in the 48 hours prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken unfractionated heparin in the 48 hours prior to randomization.","meaning":"Boolean indicating whether the patient has taken unfractionated heparin in the 48 hours prior to randomization."} ;; "the patient has used unfractionated heparin in the prior forty-eight hours to the randomization"
(declare-const patient_has_taken_low_molecular_weight_heparin_containing_product_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any low-molecular weight heparin-containing product in the 48 hours prior to randomization.","when_to_set_to_false":"Set to false if the patient has not taken any low-molecular weight heparin-containing product in the 48 hours prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any low-molecular weight heparin-containing product in the 48 hours prior to randomization.","meaning":"Boolean indicating whether the patient has taken any low-molecular weight heparin-containing product in the past 48 hours."} ;; "the patient has used low-molecular weight heparin in the prior forty-eight hours to the randomization"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_taken_unfractionated_heparin_inthepast_48_hours)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used unfractionated heparin in the prior forty-eight hours to the randomization."

(assert
(! (not patient_has_taken_low_molecular_weight_heparin_containing_product_inthepast48hours)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used low-molecular weight heparin in the prior forty-eight hours to the randomization."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any comorbid conditions (concomitant diseases).","when_to_set_to_false":"Set to false if the patient currently does not have any comorbid conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any comorbid conditions.","meaning":"Boolean indicating whether the patient currently has any comorbid conditions."} ;; "concomitant diseases"

(declare-const patient_has_finding_of_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal failure syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have renal failure syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal failure syndrome.","meaning":"Boolean indicating whether the patient currently has renal failure syndrome."} ;; "renal failure"

(declare-const patient_has_finding_of_renal_failure_syndrome_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe renal failure syndrome.","when_to_set_to_false":"Set to false if the patient currently has renal failure syndrome but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal failure syndrome is severe.","meaning":"Boolean indicating whether the patient's renal failure syndrome is severe."} ;; "severe renal failure"

(declare-const patient_creatinine_clearance_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's creatinine clearance measured now, in milliliters per minute.","when_to_set_to_null":"Set to null if the patient's creatinine clearance value measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's creatinine clearance measured now, in milliliters per minute."} ;; "creatinine clearance lower than thirty milliliters per minute"

(declare-const patient_has_finding_of_hepatic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic disease.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic disease.","meaning":"Boolean indicating whether the patient currently has hepatic disease."} ;; "hepatic disease"

(declare-const patient_has_finding_of_other_significant_comorbidities_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has other significant comorbidities.","when_to_set_to_false":"Set to false if the patient currently does not have other significant comorbidities.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has other significant comorbidities.","meaning":"Boolean indicating whether the patient currently has other significant comorbidities."} ;; "other significant comorbidities"

(declare-const patient_has_finding_of_other_significant_comorbidities_now@@under_investigator_judgment Bool) ;; {"when_to_set_to_true":"Set to true if the significance of the patient's other comorbidities is determined under investigator judgment.","when_to_set_to_false":"Set to false if the significance of the patient's other comorbidities is not determined under investigator judgment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the significance of the patient's other comorbidities is determined under investigator judgment.","meaning":"Boolean indicating whether the significance of the patient's other comorbidities is determined under investigator judgment."} ;; "other significant comorbidities under investigator judgment"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_renal_failure_syndrome_now@@severe
           patient_has_finding_of_hepatic_disease_now
           patient_has_finding_of_other_significant_comorbidities_now@@under_investigator_judgment)
       patient_has_finding_of_co_morbid_conditions_now)
   :named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples ((severe renal failure (creatinine clearance lower than thirty milliliters per minute)) OR (hepatic disease) OR (other significant comorbidities under investigator judgment))."

;; Qualifier variable for severe renal failure implies stem variable
(assert
(! (=> patient_has_finding_of_renal_failure_syndrome_now@@severe
       patient_has_finding_of_renal_failure_syndrome_now)
   :named REQ3_AUXILIARY1)) ;; "severe renal failure"

;; Severe renal failure defined as creatinine clearance < 30 mL/min
(assert
(! (= patient_has_finding_of_renal_failure_syndrome_now@@severe
      (and patient_has_finding_of_renal_failure_syndrome_now
           (< patient_creatinine_clearance_value_recorded_now_withunit_milliliters_per_minute 30)))
   :named REQ3_AUXILIARY2)) ;; "severe renal failure (creatinine clearance lower than thirty milliliters per minute)"

;; Qualifier variable for other significant comorbidities under investigator judgment implies stem variable
(assert
(! (=> patient_has_finding_of_other_significant_comorbidities_now@@under_investigator_judgment
       patient_has_finding_of_other_significant_comorbidities_now)
   :named REQ3_AUXILIARY3)) ;; "other significant comorbidities under investigator judgment"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_co_morbid_conditions_now)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has concomitant diseases with non-exhaustive examples ((severe renal failure (creatinine clearance lower than thirty milliliters per minute)) OR (hepatic disease) OR (other significant comorbidities under investigator judgment))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of cerebrovascular accident within the past 12 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of cerebrovascular accident within the past 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of cerebrovascular accident within the past 12 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of cerebrovascular accident within the past 12 months."} ;; "cerebrovascular accident in the last twelve months"
(declare-const patient_has_diagnosis_of_hemorrhagic_cerebrovascular_accident_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of hemorrhagic cerebrovascular accident within the past 12 months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of hemorrhagic cerebrovascular accident within the past 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of hemorrhagic cerebrovascular accident within the past 12 months.","meaning":"Boolean indicating whether the patient has had a diagnosis of hemorrhagic cerebrovascular accident within the past 12 months."} ;; "hemorrhagic cerebrovascular accident in the last twelve months"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Hemorrhagic cerebrovascular accident is a subtype of cerebrovascular accident
(assert
(! (=> patient_has_diagnosis_of_hemorrhagic_cerebrovascular_accident_inthepast12months
       patient_has_diagnosis_of_cerebrovascular_accident_inthepast12months)
   :named REQ4_AUXILIARY0)) ;; "hemorrhagic cerebrovascular accident in the last twelve months" is a type of "cerebrovascular accident in the last twelve months"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_hemorrhagic_cerebrovascular_accident_inthepast12months)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a recent hemorrhagic cerebrovascular accident in the last twelve months."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_scheduled_for_myocardial_revascularization_surgery_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo cardiac surgery for myocardial revascularization in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo cardiac surgery for myocardial revascularization in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled for cardiac surgery for myocardial revascularization in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo cardiac surgery for myocardial revascularization in the future."} ;; "scheduled for cardiac surgery of myocardial revascularization"
(declare-const patient_will_undergo_operation_on_heart_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo a cardiac surgery (operation on heart) in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo a cardiac surgery (operation on heart) in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled for a cardiac surgery (operation on heart) in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo a cardiac surgery (operation on heart) in the future."} ;; "cardiac surgery"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Myocardial revascularization surgery is a type of cardiac surgery
(assert
(! (=> patient_is_scheduled_for_myocardial_revascularization_surgery_inthefuture
     patient_will_undergo_operation_on_heart_inthefuture)
:named REQ5_AUXILIARY0)) ;; "cardiac surgery of myocardial revascularization"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_scheduled_for_myocardial_revascularization_surgery_inthefuture)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is scheduled for cardiac surgery of myocardial revascularization."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_history_of_drug_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a history of drug use at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a history of drug use at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of drug use.","meaning":"Boolean indicating whether the patient has ever had a history of drug use at any time in the past."} ;; "the patient has a history of drug use"
(declare-const patient_has_finding_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis or clinical finding of alcohol abuse at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis or clinical finding of alcohol abuse at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis or clinical finding of alcohol abuse.","meaning":"Boolean indicating whether the patient has ever had a diagnosis or clinical finding of alcohol abuse at any time in the past."} ;; "the patient has a history of alcohol abuse"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_history_of_drug_use)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of drug use."

(assert
(! (not patient_has_finding_of_alcohol_abuse_inthehistory)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of alcohol abuse."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not lactating as documented or reported.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
(assert
  (! (not patient_is_lactating_now)
     :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_operation_on_nervous_system_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical operation on the nervous system within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical operation on the nervous system within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical operation on the nervous system within the past 3 months.","meaning":"Boolean indicating whether the patient has undergone a surgical operation on the nervous system within the past 3 months."} ;; "neurosurgery in the last three months"

(declare-const patient_has_undergone_surgical_procedure_on_eye_proper_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure on the eye proper within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure on the eye proper within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure on the eye proper within the past 3 months.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure on the eye proper within the past 3 months."} ;; "ophthalmic surgery in the last three months"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not patient_has_undergone_operation_on_nervous_system_inthepast3months)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had recent neurosurgery in the last three months."

(assert
  (! (not patient_has_undergone_surgical_procedure_on_eye_proper_inthepast3months)
     :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had recent ophthalmic surgery in the last three months."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_blood_coagulation_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a blood coagulation disorder (coagulopathy) at any time in the past, regardless of current status.","when_to_set_to_false":"Set to false if the patient has never had a blood coagulation disorder (coagulopathy) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a blood coagulation disorder (coagulopathy).","meaning":"Boolean indicating whether the patient has ever had a blood coagulation disorder (coagulopathy) at any time in the past."} ;; "the patient has a history of coagulopathy"
(declare-const patient_has_diagnosis_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of blood coagulation disorder (coagulopathy).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of blood coagulation disorder (coagulopathy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of blood coagulation disorder (coagulopathy).","meaning":"Boolean indicating whether the patient currently has a diagnosis of blood coagulation disorder (coagulopathy)."} ;; "the patient has a diagnosis of coagulopathy"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (or patient_has_finding_of_blood_coagulation_disorder_inthehistory
            patient_has_diagnosis_of_blood_coagulation_disorder_now))
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of coagulopathy) OR (the patient has a diagnosis of coagulopathy)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_allergy_to_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to any of the drug components to be used in this study.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to any of the drug components to be used in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a documented allergy to any of the drug components to be used in this study.","meaning":"Boolean indicating whether the patient currently has a documented allergy to any of the drug components to be used in this study."} ;; "allergy to any of the drug components to be used in this study"
(declare-const patient_has_finding_of_allergy_to_drug_now@@judged_as_clinically_significant_by_main_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's documented allergy to any of the drug components to be used in this study is judged as clinically significant in the main investigator's opinion.","when_to_set_to_false":"Set to false if the patient's documented allergy to any of the drug components to be used in this study is not judged as clinically significant in the main investigator's opinion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy is judged as clinically significant in the main investigator's opinion.","meaning":"Boolean indicating whether the patient's documented allergy to any of the drug components to be used in this study is judged as clinically significant in the main investigator's opinion."} ;; "this allergy is judged as clinically significant in the main investigator's opinion"
(declare-const patient_has_finding_of_propensity_to_adverse_reactions_to_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented hypersensibility (propensity to adverse reactions) to any of the drug components to be used in this study.","when_to_set_to_false":"Set to false if the patient currently does not have a documented hypersensibility (propensity to adverse reactions) to any of the drug components to be used in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a documented hypersensibility (propensity to adverse reactions) to any of the drug components to be used in this study.","meaning":"Boolean indicating whether the patient currently has a documented hypersensibility (propensity to adverse reactions) to any of the drug components to be used in this study."} ;; "hypersensibility to any of the drug components to be used in this study"
(declare-const patient_has_finding_of_propensity_to_adverse_reactions_to_drug_now@@judged_as_clinically_significant_by_main_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's documented hypersensibility to any of the drug components to be used in this study is judged as clinically significant in the main investigator's opinion.","when_to_set_to_false":"Set to false if the patient's documented hypersensibility to any of the drug components to be used in this study is not judged as clinically significant in the main investigator's opinion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensibility is judged as clinically significant in the main investigator's opinion.","meaning":"Boolean indicating whether the patient's documented hypersensibility to any of the drug components to be used in this study is judged as clinically significant in the main investigator's opinion."} ;; "this hypersensibility is judged as clinically significant in the main investigator's opinion"
(declare-const patient_has_finding_of_intolerance_to_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented intolerance to any of the drug components to be used in this study.","when_to_set_to_false":"Set to false if the patient currently does not have a documented intolerance to any of the drug components to be used in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a documented intolerance to any of the drug components to be used in this study.","meaning":"Boolean indicating whether the patient currently has a documented intolerance to any of the drug components to be used in this study."} ;; "intolerance to any of the drug components to be used in this study"
(declare-const patient_has_finding_of_intolerance_to_drug_now@@judged_as_clinically_significant_by_main_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's documented intolerance to any of the drug components to be used in this study is judged as clinically significant in the main investigator's opinion.","when_to_set_to_false":"Set to false if the patient's documented intolerance to any of the drug components to be used in this study is not judged as clinically significant in the main investigator's opinion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the intolerance is judged as clinically significant in the main investigator's opinion.","meaning":"Boolean indicating whether the patient's documented intolerance to any of the drug components to be used in this study is judged as clinically significant in the main investigator's opinion."} ;; "this intolerance is judged as clinically significant in the main investigator's opinion"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_allergy_to_drug_now@@judged_as_clinically_significant_by_main_investigator
      patient_has_finding_of_allergy_to_drug_now)
    :named REQ10_AUXILIARY0)) ;; "this allergy is judged as clinically significant in the main investigator's opinion"

(assert
(! (=> patient_has_finding_of_propensity_to_adverse_reactions_to_drug_now@@judged_as_clinically_significant_by_main_investigator
      patient_has_finding_of_propensity_to_adverse_reactions_to_drug_now)
    :named REQ10_AUXILIARY1)) ;; "this hypersensibility is judged as clinically significant in the main investigator's opinion"

(assert
(! (=> patient_has_finding_of_intolerance_to_drug_now@@judged_as_clinically_significant_by_main_investigator
      patient_has_finding_of_intolerance_to_drug_now)
    :named REQ10_AUXILIARY2)) ;; "this intolerance is judged as clinically significant in the main investigator's opinion"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient must NOT have any clinically significant allergy, hypersensibility, or intolerance to study drug components
(assert
(! (not (or patient_has_finding_of_allergy_to_drug_now@@judged_as_clinically_significant_by_main_investigator
            patient_has_finding_of_propensity_to_adverse_reactions_to_drug_now@@judged_as_clinically_significant_by_main_investigator
            patient_has_finding_of_intolerance_to_drug_now@@judged_as_clinically_significant_by_main_investigator))
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a medical record containing allergy to any of the drug components to be used in this study AND this allergy is judged as clinically significant in the main investigator's opinion) OR (the patient has a medical record containing hypersensibility to any of the drug components to be used in this study AND this hypersensibility is judged as clinically significant in the main investigator's opinion) OR (the patient has a medical record containing intolerance to any of the drug components to be used in this study AND this intolerance is judged as clinically significant in the main investigator's opinion))."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_undergone_clinical_trial_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in a clinical trial at any time within the past twelve months.","when_to_set_to_false":"Set to false if the patient has not participated in a clinical trial within the past twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in a clinical trial within the past twelve months.","meaning":"Boolean indicating whether the patient has participated in a clinical trial within the past twelve months."} ;; "clinical study within the last twelve months"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_undergone_clinical_trial_inthepast12months)
    :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had participation in a clinical study within the last twelve months."
