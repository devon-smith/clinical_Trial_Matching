;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_follicular_thyroid_carcinoma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of follicular thyroid carcinoma at any time in their history.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of follicular thyroid carcinoma at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of follicular thyroid carcinoma in their history.","meaning":"Boolean indicating whether the patient has a diagnosis of follicular thyroid carcinoma at any time in their history."} // "follicular thyroid cancer"
(declare-const patient_has_diagnosis_of_papillary_thyroid_carcinoma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of papillary thyroid carcinoma at any time in their history.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of papillary thyroid carcinoma at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of papillary thyroid carcinoma in their history.","meaning":"Boolean indicating whether the patient has a diagnosis of papillary thyroid carcinoma at any time in their history."} // "papillary thyroid cancer"
(declare-const patient_has_undergone_near_total_thyroidectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a near total thyroidectomy at any time in their history.","when_to_set_to_false":"Set to false if the patient has not undergone a near total thyroidectomy at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a near total thyroidectomy in their history.","meaning":"Boolean indicating whether the patient has undergone a near total thyroidectomy at any time in their history."} // "near total thyroidectomy"
(declare-const patient_has_undergone_near_total_thyroidectomy_inthehistory@@performed_for_papillary_or_follicular_thyroid_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the near total thyroidectomy was performed for papillary thyroid cancer or follicular thyroid cancer.","when_to_set_to_false":"Set to false if the near total thyroidectomy was not performed for papillary thyroid cancer or follicular thyroid cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the near total thyroidectomy was performed for papillary or follicular thyroid cancer.","meaning":"Boolean indicating whether the near total thyroidectomy was performed for papillary or follicular thyroid cancer."} // "near total thyroidectomy performed for papillary or follicular thyroid cancer"
(declare-const patient_has_undergone_total_thyroidectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a total thyroidectomy at any time in their history.","when_to_set_to_false":"Set to false if the patient has not undergone a total thyroidectomy at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a total thyroidectomy in their history.","meaning":"Boolean indicating whether the patient has undergone a total thyroidectomy at any time in their history."} // "total thyroidectomy"
(declare-const patient_has_undergone_total_thyroidectomy_inthehistory@@performed_for_papillary_or_follicular_thyroid_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the total thyroidectomy was performed for papillary thyroid cancer or follicular thyroid cancer.","when_to_set_to_false":"Set to false if the total thyroidectomy was not performed for papillary thyroid cancer or follicular thyroid cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the total thyroidectomy was performed for papillary or follicular thyroid cancer.","meaning":"Boolean indicating whether the total thyroidectomy was performed for papillary or follicular thyroid cancer."} // "total thyroidectomy performed for papillary or follicular thyroid cancer"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_undergone_total_thyroidectomy_inthehistory@@performed_for_papillary_or_follicular_thyroid_cancer
         patient_has_undergone_total_thyroidectomy_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "total thyroidectomy performed for papillary or follicular thyroid cancer" implies "total thyroidectomy"

(assert
  (! (=> patient_has_undergone_near_total_thyroidectomy_inthehistory@@performed_for_papillary_or_follicular_thyroid_cancer
         patient_has_undergone_near_total_thyroidectomy_inthehistory)
     :named REQ0_AUXILIARY1)) ;; "near total thyroidectomy performed for papillary or follicular thyroid cancer" implies "near total thyroidectomy"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must have had (a total thyroidectomy OR a near total thyroidectomy) performed for (papillary thyroid cancer OR follicular thyroid cancer).
(assert
  (! (or patient_has_undergone_total_thyroidectomy_inthehistory@@performed_for_papillary_or_follicular_thyroid_cancer
         patient_has_undergone_near_total_thyroidectomy_inthehistory@@performed_for_papillary_or_follicular_thyroid_cancer)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have had (a total thyroidectomy OR a near total thyroidectomy) performed for (papillary thyroid cancer OR follicular thyroid cancer)."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_excision_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an excision (resection) at any time in their history.","when_to_set_to_false":"Set to false if the patient has not undergone an excision (resection) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an excision (resection) in their history.","meaning":"Boolean indicating whether the patient has undergone an excision (resection) at any time in their history."} // "resection"
(declare-const patient_has_undergone_excision_inthehistory@@margin_status_r0 Bool) ;; {"when_to_set_to_true":"Set to true if the excision (resection) the patient underwent had R0 margin status.","when_to_set_to_false":"Set to false if the excision (resection) the patient underwent did not have R0 margin status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the excision (resection) had R0 margin status.","meaning":"Boolean indicating whether the excision (resection) had R0 margin status."} // "R0 resection"
(declare-const patient_has_undergone_excision_inthehistory@@margin_status_r1 Bool) ;; {"when_to_set_to_true":"Set to true if the excision (resection) the patient underwent had R1 margin status.","when_to_set_to_false":"Set to false if the excision (resection) the patient underwent did not have R1 margin status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the excision (resection) had R1 margin status.","meaning":"Boolean indicating whether the excision (resection) had R1 margin status."} // "R1 resection"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had malignant neoplastic disease (cancer) at any time in their history.","when_to_set_to_false":"Set to false if the patient has not had malignant neoplastic disease (cancer) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had malignant neoplastic disease (cancer) at any time in their history.","meaning":"Boolean indicating whether the patient has had malignant neoplastic disease (cancer) at any time in their history."} // "cancer"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@macroscopic Bool) ;; {"when_to_set_to_true":"Set to true if the malignant neoplastic disease (cancer) present was macroscopic.","when_to_set_to_false":"Set to false if the malignant neoplastic disease (cancer) present was not macroscopic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant neoplastic disease (cancer) present was macroscopic.","meaning":"Boolean indicating whether the malignant neoplastic disease (cancer) present was macroscopic."} // "macroscopic cancer"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@none_left_behind_at_surgery Bool) ;; {"when_to_set_to_true":"Set to true if no macroscopic malignant neoplastic disease (cancer) was left behind at surgery.","when_to_set_to_false":"Set to false if macroscopic malignant neoplastic disease (cancer) was left behind at surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether macroscopic malignant neoplastic disease (cancer) was left behind at surgery.","meaning":"Boolean indicating whether no macroscopic malignant neoplastic disease (cancer) was left behind at surgery."} // "no macroscopic cancer left behind at surgery"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_undergone_excision_inthehistory@@margin_status_r0
         patient_has_undergone_excision_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "an R0 resection"

(assert
  (! (=> patient_has_undergone_excision_inthehistory@@margin_status_r1
         patient_has_undergone_excision_inthehistory)
     :named REQ1_AUXILIARY1)) ;; "an R1 resection"

(assert
  (! (=> patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@macroscopic
         patient_has_finding_of_malignant_neoplastic_disease_inthehistory)
     :named REQ1_AUXILIARY2)) ;; "macroscopic cancer"

(assert
  (! (=> patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@none_left_behind_at_surgery
         patient_has_finding_of_malignant_neoplastic_disease_inthehistory)
     :named REQ1_AUXILIARY3)) ;; "no macroscopic cancer left behind at surgery"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must have had (an R0 resection OR an R1 resection)
(assert
  (! (or patient_has_undergone_excision_inthehistory@@margin_status_r0
         patient_has_undergone_excision_inthehistory@@margin_status_r1)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "an R0 resection OR an R1 resection"

;; Component 1: The patient must have had no macroscopic cancer left behind at surgery
(assert
  (! patient_has_finding_of_malignant_neoplastic_disease_inthehistory@@none_left_behind_at_surgery
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "no macroscopic cancer left behind at surgery"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_physically_able_to_undergo_radioiodine_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is physically able to undergo radioiodine treatment.","when_to_set_to_false":"Set to false if the patient is physically unable to undergo radioiodine treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is physically able to undergo radioiodine treatment.","meaning":"Boolean indicating whether the patient is physically able to undergo radioiodine treatment."} // "physically able to undergo radioiodine treatment"
(declare-const patient_is_emotionally_able_to_undergo_radioiodine_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is emotionally able to undergo radioiodine treatment.","when_to_set_to_false":"Set to false if the patient is emotionally unable to undergo radioiodine treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is emotionally able to undergo radioiodine treatment.","meaning":"Boolean indicating whether the patient is emotionally able to undergo radioiodine treatment."} // "emotionally able to undergo radioiodine treatment"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: physically able to undergo radioiodine treatment
(assert
  (! patient_is_physically_able_to_undergo_radioiodine_treatment
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be physically able to undergo radioiodine treatment."

;; Component 1: emotionally able to undergo radioiodine treatment
(assert
  (! patient_is_emotionally_able_to_undergo_radioiodine_treatment
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be emotionally able to undergo radioiodine treatment."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} // "To be included, the patient must have provided written informed consent."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have provided written informed consent."
