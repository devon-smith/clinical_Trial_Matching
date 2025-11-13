;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_bilateral_renal_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bilateral renal artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bilateral renal artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bilateral renal artery stenosis.","meaning":"Boolean indicating whether the patient currently has bilateral renal artery stenosis."} ;; "bilateral renal artery stenosis"

(declare-const patient_has_finding_of_renal_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal artery stenosis.","meaning":"Boolean indicating whether the patient currently has renal artery stenosis."} ;; "renal artery stenosis"

(declare-const patient_has_finding_of_renal_artery_stenosis_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current renal artery stenosis is significant.","when_to_set_to_false":"Set to false if the patient's current renal artery stenosis is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current renal artery stenosis is significant.","meaning":"Boolean indicating whether the patient's current renal artery stenosis is significant."} ;; "significant renal artery stenosis"

(declare-const patient_has_finding_of_renal_artery_stenosis_now@@in_a_solitary_kidney Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current renal artery stenosis is present in a solitary kidney.","when_to_set_to_false":"Set to false if the patient's current renal artery stenosis is not present in a solitary kidney.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current renal artery stenosis is present in a solitary kidney.","meaning":"Boolean indicating whether the patient's current renal artery stenosis is present in a solitary kidney."} ;; "renal artery stenosis in a solitary kidney"

(declare-const patient_has_finding_of_renal_artery_stenosis_now@@significant@@in_a_solitary_kidney Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has significant renal artery stenosis in a solitary kidney.","when_to_set_to_false":"Set to false if the patient currently does not have significant renal artery stenosis in a solitary kidney.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has significant renal artery stenosis in a solitary kidney.","meaning":"Boolean indicating whether the patient currently has significant renal artery stenosis in a solitary kidney."} ;; "significant renal artery stenosis in a solitary kidney"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_renal_artery_stenosis_now@@significant
      patient_has_finding_of_renal_artery_stenosis_now)
:named REQ0_AUXILIARY0)) ;; "significant renal artery stenosis"

(assert
(! (=> patient_has_finding_of_renal_artery_stenosis_now@@in_a_solitary_kidney
      patient_has_finding_of_renal_artery_stenosis_now)
:named REQ0_AUXILIARY1)) ;; "renal artery stenosis in a solitary kidney"

;; Definition: significant renal artery stenosis in a solitary kidney
(assert
(! (= patient_has_finding_of_renal_artery_stenosis_now@@significant@@in_a_solitary_kidney
      (and patient_has_finding_of_renal_artery_stenosis_now@@significant
           patient_has_finding_of_renal_artery_stenosis_now@@in_a_solitary_kidney))
:named REQ0_AUXILIARY2)) ;; "significant renal artery stenosis in a solitary kidney"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_bilateral_renal_artery_stenosis_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bilateral renal artery stenosis."

(assert
(! (not patient_has_finding_of_renal_artery_stenosis_now@@significant@@in_a_solitary_kidney)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant renal artery stenosis in a solitary kidney."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_can_undergo_percutaneous_transluminal_angioplasty_of_renal_artery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo percutaneous transluminal angioplasty of the renal artery (i.e., has no contraindications to the procedure).","when_to_set_to_false":"Set to false if the patient cannot currently undergo percutaneous transluminal angioplasty of the renal artery (i.e., has contraindications to the procedure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo percutaneous transluminal angioplasty of the renal artery.","meaning":"Boolean indicating whether the patient can currently undergo percutaneous transluminal angioplasty of the renal artery."} ;; "percutaneous renal angioplasty"
(declare-const patient_can_undergo_insertion_of_arterial_stent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo insertion of an arterial stent (i.e., has no contraindications to the procedure).","when_to_set_to_false":"Set to false if the patient cannot currently undergo insertion of an arterial stent (i.e., has contraindications to the procedure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo insertion of an arterial stent.","meaning":"Boolean indicating whether the patient can currently undergo insertion of an arterial stent."} ;; "stenting"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have contraindications to percutaneous renal angioplasty
(assert
(! (not patient_can_undergo_percutaneous_transluminal_angioplasty_of_renal_artery_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has contraindications to percutaneous renal angioplasty."

;; Exclusion: patient must NOT have contraindications to stenting
(assert
(! (not patient_can_undergo_insertion_of_arterial_stent_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has contraindications to stenting."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_atrophy_of_kidney_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has atrophy of the kidney.","when_to_set_to_false":"Set to false if the patient currently does not have atrophy of the kidney.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atrophy of the kidney.","meaning":"Boolean indicating whether the patient currently has atrophy of the kidney."} ;; "atrophy of the kidney"
(declare-const patient_has_finding_of_atrophy_of_kidney_now@@supplied_with_stenosed_artery Bool) ;; {"when_to_set_to_true":"Set to true if the atrophic kidney is supplied by a stenosed artery.","when_to_set_to_false":"Set to false if the atrophic kidney is not supplied by a stenosed artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the atrophic kidney is supplied by a stenosed artery.","meaning":"Boolean indicating whether the atrophic kidney is supplied by a stenosed artery."} ;; "atrophy of the kidney supplied with a stenosed artery"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_atrophy_of_kidney_now@@supplied_with_stenosed_artery
      patient_has_finding_of_atrophy_of_kidney_now)
:named REQ2_AUXILIARY0)) ;; "atrophy of the kidney supplied with a stenosed artery""

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_atrophy_of_kidney_now@@supplied_with_stenosed_artery)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has atrophy of the kidney supplied with a stenosed artery."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_another_secondary_reason_for_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another well known secondary reason for hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have another well known secondary reason for hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another well known secondary reason for hypertension.","meaning":"Boolean indicating whether the patient currently has another well known secondary reason for hypertension."} ;; "another well known secondary reason for hypertension"

(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension)."} ;; "hypertension"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_another_secondary_reason_for_hypertension_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another well known secondary reason for hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_chronic_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chronic heart failure.","meaning":"Boolean indicating whether the patient currently has chronic heart failure."} ;; "chronic heart failure"
(declare-const patient_has_finding_of_chronic_heart_failure_now@@nyha_class_ii Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic heart failure and it is classified as New York Heart Association class II.","when_to_set_to_false":"Set to false if the patient currently has chronic heart failure but it is not classified as New York Heart Association class II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic heart failure is New York Heart Association class II.","meaning":"Boolean indicating whether the patient's chronic heart failure is New York Heart Association class II."} ;; "chronic heart failure New York Heart Association class II"
(declare-const patient_has_finding_of_chronic_heart_failure_now@@nyha_class_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic heart failure and it is classified as New York Heart Association class III.","when_to_set_to_false":"Set to false if the patient currently has chronic heart failure but it is not classified as New York Heart Association class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic heart failure is New York Heart Association class III.","meaning":"Boolean indicating whether the patient's chronic heart failure is New York Heart Association class III."} ;; "chronic heart failure New York Heart Association class III"
(declare-const patient_has_finding_of_chronic_heart_failure_now@@nyha_class_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic heart failure and it is classified as New York Heart Association class IV.","when_to_set_to_false":"Set to false if the patient currently has chronic heart failure but it is not classified as New York Heart Association class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic heart failure is New York Heart Association class IV.","meaning":"Boolean indicating whether the patient's chronic heart failure is New York Heart Association class IV."} ;; "chronic heart failure New York Heart Association class IV"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_chronic_heart_failure_now@@nyha_class_ii
      patient_has_finding_of_chronic_heart_failure_now)
:named REQ4_AUXILIARY0)) ;; "chronic heart failure New York Heart Association class II"

(assert
(! (=> patient_has_finding_of_chronic_heart_failure_now@@nyha_class_iii
      patient_has_finding_of_chronic_heart_failure_now)
:named REQ4_AUXILIARY1)) ;; "chronic heart failure New York Heart Association class III"

(assert
(! (=> patient_has_finding_of_chronic_heart_failure_now@@nyha_class_iv
      patient_has_finding_of_chronic_heart_failure_now)
:named REQ4_AUXILIARY2)) ;; "chronic heart failure New York Heart Association class IV"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_chronic_heart_failure_now@@nyha_class_ii)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic heart failure New York Heart Association class II."

(assert
(! (not patient_has_finding_of_chronic_heart_failure_now@@nyha_class_iii)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic heart failure New York Heart Association class III."

(assert
(! (not patient_has_finding_of_chronic_heart_failure_now@@nyha_class_iv)
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic heart failure New York Heart Association class IV."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of heart valve disorder (valvular heart disease).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of heart valve disorder (valvular heart disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of heart valve disorder (valvular heart disease).","meaning":"Boolean indicating whether the patient currently has a heart valve disorder (valvular heart disease)."} ;; "valvular heart disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart valve disorder is significant.","when_to_set_to_false":"Set to false if the patient's current heart valve disorder is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart valve disorder is significant.","meaning":"Boolean indicating whether the patient's current heart valve disorder is significant."} ;; "significant valvular heart disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@qualified_for_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart valve disorder is qualified for surgery.","when_to_set_to_false":"Set to false if the patient's current heart valve disorder is not qualified for surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart valve disorder is qualified for surgery.","meaning":"Boolean indicating whether the patient's current heart valve disorder is qualified for surgery."} ;; "valvular heart disease qualified for surgery"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@significant
       patient_has_finding_of_heart_valve_disorder_now)
   :named REQ5_AUXILIARY0)) ;; "significant valvular heart disease"

(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@qualified_for_surgery
       patient_has_finding_of_heart_valve_disorder_now)
   :named REQ5_AUXILIARY1)) ;; "valvular heart disease qualified for surgery"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have significant valvular heart disease qualified for surgery
(assert
(! (not (and patient_has_finding_of_heart_valve_disorder_now@@significant
             patient_has_finding_of_heart_valve_disorder_now@@qualified_for_surgery))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant valvular heart disease qualified for surgery."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_persistent_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of persistent atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of persistent atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has persistent atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has persistent atrial fibrillation."} ;; "persistent atrial fibrillation"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_finding_of_persistent_atrial_fibrillation_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has persistent atrial fibrillation."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const glomerular_filtration_rate_value_recorded_now_in_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current glomerular filtration rate in milliliters per minute if available.","when_to_set_to_null":"Set to null if the patient's current glomerular filtration rate in milliliters per minute is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current glomerular filtration rate in milliliters per minute."} ;; "glomerular filtration rate < 30 milliliters per minute"
(declare-const patient_has_finding_of_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal failure syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal failure syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal failure syndrome.","meaning":"Boolean indicating whether the patient currently has renal failure syndrome."} ;; "renal failure"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not (and patient_has_finding_of_renal_failure_syndrome_now
               (< glomerular_filtration_rate_value_recorded_now_in_milliliters_per_minute 30)))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal failure with glomerular filtration rate < 30 milliliters per minute."
