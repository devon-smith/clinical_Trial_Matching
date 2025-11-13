;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute_per_1_73_square_meters Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's estimated glomerular filtration rate (eGFR) in milliliters per minute per 1.73 square meters is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's glomerular filtration rate (eGFR) in milliliters per minute per 1.73 square meters, recorded now."} ;; "estimated glomerular filtration rate < 30 milliliters per minute per 1.73 square meters."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute_per_1_73_square_meters 30))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has estimated glomerular filtration rate < 30 milliliters per minute per 1.73 square meters."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_patient_s_condition_unstable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of an unstable medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of an unstable medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an unstable medical condition.","meaning":"Boolean indicating whether the patient currently has an unstable medical condition."} ;; "unstable medical condition"
(declare-const patient_is_unable_to_tolerate_interventional_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to tolerate interventional therapy.","when_to_set_to_false":"Set to false if the patient is currently able to tolerate interventional therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to tolerate interventional therapy.","meaning":"Boolean indicating whether the patient is currently unable to tolerate interventional therapy."} ;; "unable to tolerate interventional therapy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (and patient_has_finding_of_patient_s_condition_unstable_now
               patient_is_unable_to_tolerate_interventional_therapy_now))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable medical condition and the patient is unable to tolerate interventional therapy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const renal_artery_pathology_anatomy_is_not_suitable_for_interventional_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current renal artery pathology anatomy is not suitable for interventional therapy.","when_to_set_to_false":"Set to false if the patient's current renal artery pathology anatomy is suitable for interventional therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current renal artery pathology anatomy is suitable for interventional therapy.","meaning":"Boolean indicating whether the patient's current renal artery pathology anatomy is not suitable for interventional therapy."} ;; "renal artery pathology anatomy that is not suitable for interventional therapy."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not renal_artery_pathology_anatomy_is_not_suitable_for_interventional_therapy_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal artery pathology anatomy that is not suitable for interventional therapy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_allergy_to_dihydropyridine_derivative_calcium_channel_blocker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to dihydropyridine derivative calcium channel blockers.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to dihydropyridine derivative calcium channel blockers.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to dihydropyridine derivative calcium channel blockers.","meaning":"Boolean indicating whether the patient currently has an allergy to dihydropyridine derivative calcium channel blockers."} ;; "The patient is excluded if the patient is allergic to dihydropyridine."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_allergy_to_dihydropyridine_derivative_calcium_channel_blocker_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is allergic to dihydropyridine."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_complete_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of complete atrioventricular block (third degree AV block).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of complete atrioventricular block (third degree AV block).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has complete atrioventricular block (third degree AV block).","meaning":"Boolean indicating whether the patient currently has complete atrioventricular block (third degree AV block)."} ;; "third degree atrioventricular block"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_complete_atrioventricular_block_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has third degree atrioventricular block."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_allergy_to_contrast_media_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of allergy to contrast media (contrast agent allergy).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of allergy to contrast media (contrast agent allergy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of allergy to contrast media (contrast agent allergy).","meaning":"Boolean indicating whether the patient currently has a clinical finding of allergy to contrast media (contrast agent allergy)."} ;; "contrast agent allergy"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_allergy_to_contrast_media_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has contrast agent allergy."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease (malignant tumor).","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease (malignant tumor).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease (malignant tumor).","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease (malignant tumor)."} ;; "malignant tumor"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_malignant_neoplastic_disease_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignant tumor."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_non_compliant_behavior_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented finding of non-compliant behavior at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a documented finding of non-compliant behavior at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of non-compliant behavior.","meaning":"Boolean indicating whether the patient has ever had a finding of non-compliant behavior in their history."} ;; "non-compliant"
(declare-const patient_has_finding_of_alcoholism_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented finding of alcoholism at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a documented finding of alcoholism at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of alcoholism.","meaning":"Boolean indicating whether the patient has ever had a finding of alcoholism in their history."} ;; "history of alcoholism"
(declare-const patient_has_finding_of_drug_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented finding of drug abuse at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a documented finding of drug abuse at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of drug abuse.","meaning":"Boolean indicating whether the patient has ever had a finding of drug abuse in their history."} ;; "history of drug abuse"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient is excluded if any of the following is true: non-compliance, history of alcoholism, or history of drug abuse.
(assert
(! (not (or patient_has_finding_of_non_compliant_behavior_inthehistory
            patient_has_finding_of_alcoholism_inthehistory
            patient_has_finding_of_drug_abuse_inthehistory))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is non-compliant) OR (the patient has history of alcoholism) OR (the patient has history of drug abuse))."
