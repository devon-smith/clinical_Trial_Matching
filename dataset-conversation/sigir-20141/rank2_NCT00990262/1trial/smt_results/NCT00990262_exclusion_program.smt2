;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patients_troponin_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive troponin test result.","when_to_set_to_false":"Set to false if the patient currently does not have a positive troponin test result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive troponin test result.","meaning":"Boolean indicating whether the patient currently has a positive troponin test result."} ;; "troponin"

(declare-const patients_troponin_is_positive_now@@initial_test Bool) ;; {"when_to_set_to_true":"Set to true if the positive troponin test result is from the initial test.","when_to_set_to_false":"Set to false if the positive troponin test result is not from the initial test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the positive troponin test result is from the initial test.","meaning":"Boolean indicating whether the positive troponin test result is from the initial test."} ;; "positive initial troponin test"

(declare-const patients_creatine_kinase_isoenzyme_mb_fraction_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive creatine kinase MB isoenzyme test result.","when_to_set_to_false":"Set to false if the patient currently does not have a positive creatine kinase MB isoenzyme test result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive creatine kinase MB isoenzyme test result.","meaning":"Boolean indicating whether the patient currently has a positive creatine kinase MB isoenzyme test result."} ;; "creatine kinase MB isoenzyme"

(declare-const patients_creatine_kinase_isoenzyme_mb_fraction_is_positive_now@@initial_test Bool) ;; {"when_to_set_to_true":"Set to true if the positive creatine kinase MB isoenzyme test result is from the initial test.","when_to_set_to_false":"Set to false if the positive creatine kinase MB isoenzyme test result is not from the initial test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the positive creatine kinase MB isoenzyme test result is from the initial test.","meaning":"Boolean indicating whether the positive creatine kinase MB isoenzyme test result is from the initial test."} ;; "positive initial creatine kinase MB isoenzyme test"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patients_troponin_is_positive_now@@initial_test
       patients_troponin_is_positive_now)
   :named REQ0_AUXILIARY0)) ;; "positive initial troponin test"

(assert
(! (=> patients_creatine_kinase_isoenzyme_mb_fraction_is_positive_now@@initial_test
       patients_creatine_kinase_isoenzyme_mb_fraction_is_positive_now)
   :named REQ0_AUXILIARY1)) ;; "positive initial creatine kinase MB isoenzyme test"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patients_troponin_is_positive_now@@initial_test)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a positive initial troponin test."

(assert
(! (not patients_creatine_kinase_isoenzyme_mb_fraction_is_positive_now@@initial_test)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a positive initial creatine kinase MB isoenzyme test."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_st_segment_elevation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ST-segment elevation on diagnostic electrocardiogram.","when_to_set_to_false":"Set to false if the patient currently does not have ST-segment elevation on diagnostic electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ST-segment elevation on diagnostic electrocardiogram.","meaning":"Boolean indicating whether the patient currently has ST-segment elevation on diagnostic electrocardiogram now."} ;; "ST-segment elevation"
(declare-const patient_has_finding_of_st_segment_elevation_now@@occurs_in_more_than_two_contiguous_leads Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ST-segment elevation on diagnostic electrocardiogram now and the finding occurs in more than two contiguous leads.","when_to_set_to_false":"Set to false if the patient currently has ST-segment elevation on diagnostic electrocardiogram now but the finding does not occur in more than two contiguous leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding occurs in more than two contiguous leads.","meaning":"Boolean indicating whether the patient currently has ST-segment elevation on diagnostic electrocardiogram now and the finding occurs in more than two contiguous leads."} ;; "ST-segment elevation in more than two contiguous leads"
(declare-const patient_has_finding_of_st_segment_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ST-segment depression on diagnostic electrocardiogram.","when_to_set_to_false":"Set to false if the patient currently does not have ST-segment depression on diagnostic electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ST-segment depression on diagnostic electrocardiogram.","meaning":"Boolean indicating whether the patient currently has ST-segment depression on diagnostic electrocardiogram now."} ;; "ST-segment depression"
(declare-const patient_has_finding_of_st_segment_depression_now@@occurs_in_more_than_two_contiguous_leads Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ST-segment depression on diagnostic electrocardiogram now and the finding occurs in more than two contiguous leads.","when_to_set_to_false":"Set to false if the patient currently has ST-segment depression on diagnostic electrocardiogram now but the finding does not occur in more than two contiguous leads.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding occurs in more than two contiguous leads.","meaning":"Boolean indicating whether the patient currently has ST-segment depression on diagnostic electrocardiogram now and the finding occurs in more than two contiguous leads."} ;; "ST-segment depression in more than two contiguous leads"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_st_segment_elevation_now@@occurs_in_more_than_two_contiguous_leads
       patient_has_finding_of_st_segment_elevation_now)
   :named REQ1_AUXILIARY0)) ;; "ST-segment elevation in more than two contiguous leads"

(assert
(! (=> patient_has_finding_of_st_segment_depression_now@@occurs_in_more_than_two_contiguous_leads
       patient_has_finding_of_st_segment_depression_now)
   :named REQ1_AUXILIARY1)) ;; "ST-segment depression in more than two contiguous leads"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_st_segment_elevation_now@@occurs_in_more_than_two_contiguous_leads)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ST-segment elevation in more than two contiguous leads."

(assert
(! (not patient_has_finding_of_st_segment_depression_now@@occurs_in_more_than_two_contiguous_leads)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ST-segment depression in more than two contiguous leads."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_patient_s_condition_unstable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an unstable clinical condition.","when_to_set_to_false":"Set to false if the patient currently does not have an unstable clinical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an unstable clinical condition.","meaning":"Boolean indicating whether the patient currently has an unstable clinical condition."} ;; "unstable clinical condition"
(declare-const patient_has_finding_of_hemodynamic_instability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hemodynamically unstable.","when_to_set_to_false":"Set to false if the patient is currently not hemodynamically unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hemodynamically unstable.","meaning":"Boolean indicating whether the patient is currently hemodynamically unstable."} ;; "hemodynamically unstable"
(declare-const patient_has_finding_of_ventricular_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ventricular tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have ventricular tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ventricular tachycardia.","meaning":"Boolean indicating whether the patient currently has ventricular tachycardia."} ;; "ventricular tachycardia"
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} ;; "chest pain"
(declare-const patient_has_finding_of_chest_pain_now@@persistent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chest pain is persistent.","when_to_set_to_false":"Set to false if the patient's current chest pain is not persistent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current chest pain is persistent.","meaning":"Boolean indicating whether the patient's current chest pain is persistent."} ;; "persistent chest pain"
(declare-const patient_has_finding_of_chest_pain_now@@despite_adequate_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chest pain persists despite adequate therapy.","when_to_set_to_false":"Set to false if the patient's current chest pain does not persist despite adequate therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current chest pain persists despite adequate therapy.","meaning":"Boolean indicating whether the patient's current chest pain persists despite adequate therapy."} ;; "persistent chest pain despite adequate therapy"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: unstable clinical condition = (hemodynamically unstable) OR (ventricular tachycardia) OR (persistent chest pain despite adequate therapy)
(assert
(! (= patient_has_finding_of_patient_s_condition_unstable_now
     (or patient_has_finding_of_hemodynamic_instability_now
         patient_has_finding_of_ventricular_tachycardia_now
         patient_has_finding_of_chest_pain_now@@despite_adequate_therapy))
   :named REQ2_AUXILIARY0)) ;; "defined as ((the patient is hemodynamically unstable) OR (the patient has ventricular tachycardia) OR (the patient has persistent chest pain despite adequate therapy))."

;; Qualifier variable implies stem variable: chest pain despite adequate therapy ⇒ chest pain
(assert
(! (=> patient_has_finding_of_chest_pain_now@@despite_adequate_therapy
       patient_has_finding_of_chest_pain_now)
   :named REQ2_AUXILIARY1)) ;; "chest pain persists despite adequate therapy"

;; Qualifier variable implies stem variable: persistent chest pain ⇒ chest pain
(assert
(! (=> patient_has_finding_of_chest_pain_now@@persistent
       patient_has_finding_of_chest_pain_now)
   :named REQ2_AUXILIARY2)) ;; "persistent chest pain"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have an unstable clinical condition
(assert
(! (not patient_has_finding_of_patient_s_condition_unstable_now)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an unstable clinical condition, defined as ((the patient is hemodynamically unstable) OR (the patient has ventricular tachycardia) OR (the patient has persistent chest pain despite adequate therapy))."

;; Exclusion: patient must NOT be hemodynamically unstable
(assert
(! (not patient_has_finding_of_hemodynamic_instability_now)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is hemodynamically unstable."

;; Exclusion: patient must NOT have ventricular tachycardia
(assert
(! (not patient_has_finding_of_ventricular_tachycardia_now)
   :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ventricular tachycardia."

;; Exclusion: patient must NOT have persistent chest pain despite adequate therapy
(assert
(! (not patient_has_finding_of_chest_pain_now@@despite_adequate_therapy)
   :named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has persistent chest pain despite adequate therapy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if a current creatinine renal clearance measurement in milliliters per minute is available for the patient.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current creatinine renal clearance in milliliters per minute."} ;; "creatinine clearance less than 50 milliliters per minute"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (< patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute 50))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has creatinine clearance less than 50 milliliters per minute."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_allergy_to_iodinated_contrast_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known allergy to iodinated contrast agent.","when_to_set_to_false":"Set to false if the patient currently does not have a known allergy to iodinated contrast agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known allergy to iodinated contrast agent.","meaning":"Boolean indicating whether the patient currently has a known allergy to iodinated contrast agent."} ;; "The patient is excluded if the patient has a known allergy to iodinated contrast agent."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_allergy_to_iodinated_contrast_agent_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to iodinated contrast agent."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_exposed_to_metformin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking or receiving metformin therapy.","when_to_set_to_false":"Set to false if the patient is currently not taking or receiving metformin therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking or receiving metformin therapy.","meaning":"Boolean indicating whether the patient is currently exposed to metformin."} ;; "the patient is on metformin therapy"
(declare-const patient_is_unable_to_discontinue_metformin_therapy_for_48_hours_after_ct_scan Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to discontinue metformin therapy for 48 hours after the computed tomography scan procedure.","when_to_set_to_false":"Set to false if the patient is able to discontinue metformin therapy for 48 hours after the computed tomography scan procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to discontinue metformin therapy for 48 hours after the computed tomography scan procedure.","meaning":"Boolean indicating whether the patient is unable to discontinue metformin therapy for 48 hours after the computed tomography scan procedure."} ;; "the patient is unable to discontinue metformin therapy for 48 hours after the computed tomography scan procedure"
(declare-const patient_is_unwilling_to_discontinue_metformin_therapy_for_48_hours_after_ct_scan Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unwilling to discontinue metformin therapy for 48 hours after the computed tomography scan procedure.","when_to_set_to_false":"Set to false if the patient is willing to discontinue metformin therapy for 48 hours after the computed tomography scan procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unwilling to discontinue metformin therapy for 48 hours after the computed tomography scan procedure.","meaning":"Boolean indicating whether the patient is unwilling to discontinue metformin therapy for 48 hours after the computed tomography scan procedure."} ;; "the patient is unwilling to discontinue metformin therapy for 48 hours after the computed tomography scan procedure"
(declare-const patient_is_exposed_to_metformin_inthefuture48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient will be exposed to metformin during the 48 hours after the computed tomography scan procedure.","when_to_set_to_false":"Set to false if the patient will not be exposed to metformin during the 48 hours after the computed tomography scan procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will be exposed to metformin during the 48 hours after the computed tomography scan procedure.","meaning":"Boolean indicating whether the patient will be exposed to metformin during the 48 hours after the computed tomography scan procedure."} ;; "metformin therapy for 48 hours after the computed tomography scan procedure"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and patient_is_exposed_to_metformin_now
             (or patient_is_unable_to_discontinue_metformin_therapy_for_48_hours_after_ct_scan
                 patient_is_unwilling_to_discontinue_metformin_therapy_for_48_hours_after_ct_scan)))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is on metformin therapy) AND ((the patient is unable to discontinue metformin therapy for 48 hours after the computed tomography scan procedure) OR (the patient is unwilling to discontinue metformin therapy for 48 hours after the computed tomography scan procedure))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "the patient has known asthma"
(declare-const patient_has_diagnosis_of_reactive_airway_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of reactive airway disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of reactive airway disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of reactive airway disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of reactive airway disease."} ;; "the patient has reactive airway disease"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_diagnosis_of_asthma_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known asthma."

(assert
  (! (not patient_has_diagnosis_of_reactive_airway_disease_now)
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has reactive airway disease."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in atrial fibrillation.","when_to_set_to_false":"Set to false if the patient is currently not in atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in atrial fibrillation.","meaning":"Boolean indicating whether the patient is currently in atrial fibrillation."} ;; "The patient is excluded if the patient is currently in atrial fibrillation."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_has_finding_of_atrial_fibrillation_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently in atrial fibrillation."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_intolerance_to_beta_adrenergic_receptor_antagonist_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented intolerance to a beta-adrenergic receptor antagonist (beta blocker) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has no documented intolerance to a beta-adrenergic receptor antagonist (beta blocker) in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an intolerance to a beta-adrenergic receptor antagonist (beta blocker).","meaning":"Boolean indicating whether the patient has ever had an intolerance to a beta-adrenergic receptor antagonist (beta blocker) at any time in their medical history."} ;; "previous intolerance to beta blocker"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_intolerance_to_beta_adrenergic_receptor_antagonist_inthehistory)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous intolerance to beta blocker."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_undergoing_coronary_angiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing coronary angiography.","when_to_set_to_false":"Set to false if the patient is currently not undergoing coronary angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing coronary angiography.","meaning":"Boolean indicating whether the patient is currently undergoing coronary angiography."} ;; "coronary angiography"
(declare-const patient_is_undergoing_coronary_angiography_now@@referred_by_primary_care_provider Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing coronary angiography and the referral was made by the primary care provider.","when_to_set_to_false":"Set to false if the patient is currently undergoing coronary angiography but the referral was not made by the primary care provider.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the referral for coronary angiography was made by the primary care provider.","meaning":"Boolean indicating whether the patient is currently undergoing coronary angiography and the referral was made by the primary care provider."} ;; "referred for coronary angiography by the primary care provider"
(declare-const patient_is_undergoing_coronary_angiography_now@@referred_by_cardiologist Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing coronary angiography and the referral was made by the cardiologist.","when_to_set_to_false":"Set to false if the patient is currently undergoing coronary angiography but the referral was not made by the cardiologist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the referral for coronary angiography was made by the cardiologist.","meaning":"Boolean indicating whether the patient is currently undergoing coronary angiography and the referral was made by the cardiologist."} ;; "referred for coronary angiography by the cardiologist"
(declare-const patient_is_undergoing_percutaneous_coronary_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing percutaneous coronary intervention.","when_to_set_to_false":"Set to false if the patient is currently not undergoing percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient is currently undergoing percutaneous coronary intervention."} ;; "percutaneous coronary intervention"
(declare-const patient_is_undergoing_percutaneous_coronary_intervention_now@@referred_by_primary_care_provider Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing percutaneous coronary intervention and the referral was made by the primary care provider.","when_to_set_to_false":"Set to false if the patient is currently undergoing percutaneous coronary intervention but the referral was not made by the primary care provider.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the referral for percutaneous coronary intervention was made by the primary care provider.","meaning":"Boolean indicating whether the patient is currently undergoing percutaneous coronary intervention and the referral was made by the primary care provider."} ;; "referred for percutaneous coronary intervention by the primary care provider"
(declare-const patient_is_undergoing_percutaneous_coronary_intervention_now@@referred_by_cardiologist Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing percutaneous coronary intervention and the referral was made by the cardiologist.","when_to_set_to_false":"Set to false if the patient is currently undergoing percutaneous coronary intervention but the referral was not made by the cardiologist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the referral for percutaneous coronary intervention was made by the cardiologist.","meaning":"Boolean indicating whether the patient is currently undergoing percutaneous coronary intervention and the referral was made by the cardiologist."} ;; "referred for percutaneous coronary intervention by the cardiologist"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_undergoing_coronary_angiography_now@@referred_by_primary_care_provider
      patient_is_undergoing_coronary_angiography_now)
   :named REQ9_AUXILIARY0)) ;; "referred for coronary angiography by the primary care provider"

(assert
(! (=> patient_is_undergoing_coronary_angiography_now@@referred_by_cardiologist
      patient_is_undergoing_coronary_angiography_now)
   :named REQ9_AUXILIARY1)) ;; "referred for coronary angiography by the cardiologist"

(assert
(! (=> patient_is_undergoing_percutaneous_coronary_intervention_now@@referred_by_primary_care_provider
      patient_is_undergoing_percutaneous_coronary_intervention_now)
   :named REQ9_AUXILIARY2)) ;; "referred for percutaneous coronary intervention by the primary care provider"

(assert
(! (=> patient_is_undergoing_percutaneous_coronary_intervention_now@@referred_by_cardiologist
      patient_is_undergoing_percutaneous_coronary_intervention_now)
   :named REQ9_AUXILIARY3)) ;; "referred for percutaneous coronary intervention by the cardiologist"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_undergoing_coronary_angiography_now@@referred_by_primary_care_provider)
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is referred for coronary angiography by the primary care provider."

(assert
(! (not patient_is_undergoing_coronary_angiography_now@@referred_by_cardiologist)
   :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is referred for coronary angiography by the cardiologist."

(assert
(! (not patient_is_undergoing_percutaneous_coronary_intervention_now@@referred_by_primary_care_provider)
   :named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is referred for percutaneous coronary intervention by the primary care provider."

(assert
(! (not patient_is_undergoing_percutaneous_coronary_intervention_now@@referred_by_cardiologist)
   :named REQ9_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is referred for percutaneous coronary intervention by the cardiologist."
