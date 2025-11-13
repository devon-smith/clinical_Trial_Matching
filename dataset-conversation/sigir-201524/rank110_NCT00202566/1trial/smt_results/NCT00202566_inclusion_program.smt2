;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_stable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of stable angina.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of stable angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of stable angina.","meaning":"Boolean indicating whether the patient currently has a diagnosis of stable angina."} // "To be included, the patient must have chronic stable angina pectoris."
(declare-const patient_has_diagnosis_of_stable_angina_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of stable angina is chronic.","when_to_set_to_false":"Set to false if the patient's diagnosis of stable angina is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of stable angina is chronic.","meaning":"Boolean indicating whether the patient's diagnosis of stable angina is chronic."} // "To be included, the patient must have chronic stable angina pectoris."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_stable_angina_now@@chronic
         patient_has_diagnosis_of_stable_angina_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have chronic stable angina pectoris."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (and patient_has_diagnosis_of_stable_angina_now
          patient_has_diagnosis_of_stable_angina_now@@chronic)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have chronic stable angina pectoris."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented diagnosis of coronary artery disease (coronary arteriosclerosis).","when_to_set_to_false":"Set to false if the patient currently does not have a documented diagnosis of coronary artery disease (coronary arteriosclerosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of coronary artery disease (coronary arteriosclerosis).","meaning":"Boolean indicating whether the patient currently has a diagnosis of coronary artery disease (coronary arteriosclerosis)."} // "To be included, the patient must have documented coronary artery disease."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_coronary_arteriosclerosis_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have documented coronary artery disease."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_taken_atenolol_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever previously taken an atenolol-containing product at any time in their history.","when_to_set_to_false":"Set to false if the patient has never previously taken an atenolol-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever previously taken an atenolol-containing product.","meaning":"Boolean indicating whether the patient has ever previously taken an atenolol-containing product."} // "previously been treated with atenolol"
(declare-const patient_has_taken_beta_adrenergic_receptor_antagonist_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever previously taken a beta-adrenergic receptor antagonist-containing product (any beta-blocker agent) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never previously taken a beta-adrenergic receptor antagonist-containing product (any beta-blocker agent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever previously taken a beta-adrenergic receptor antagonist-containing product (any beta-blocker agent).","meaning":"Boolean indicating whether the patient has ever previously taken a beta-adrenergic receptor antagonist-containing product (any beta-blocker agent)."} // "previously been treated with another beta-blocker agent"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have (previously been treated with atenolol OR previously been treated with another beta-blocker agent).
(assert
  (! (or patient_has_taken_atenolol_containing_product_inthehistory
         patient_has_taken_beta_adrenergic_receptor_antagonist_containing_product_inthehistory)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (previously been treated with atenolol OR previously been treated with another beta-blocker agent)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_exercise_tolerance_test_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive (abnormal) exercise tolerance test result.","when_to_set_to_false":"Set to false if the patient currently does not have a positive (abnormal) exercise tolerance test result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive (abnormal) exercise tolerance test result.","meaning":"Boolean indicating whether the patient currently has a positive (abnormal) exercise tolerance test result."} // "a positive exercise tolerance test"
(declare-const patient_has_finding_of_exercise_tolerance_test_abnormal_now@@stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive (abnormal) exercise tolerance test result and the result is stable.","when_to_set_to_false":"Set to false if the patient currently has a positive (abnormal) exercise tolerance test result but the result is not stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the positive (abnormal) exercise tolerance test result is stable.","meaning":"Boolean indicating whether the positive (abnormal) exercise tolerance test result is stable."} // "a stable exercise tolerance test"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_exercise_tolerance_test_abnormal_now@@stable
         patient_has_finding_of_exercise_tolerance_test_abnormal_now)
     :named REQ3_AUXILIARY0)) ;; "a stable exercise tolerance test" implies "a positive exercise tolerance test"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must have a positive exercise tolerance test.
(assert
  (! patient_has_finding_of_exercise_tolerance_test_abnormal_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a positive exercise tolerance test."

;; Component 1: To be included, the patient must have a stable exercise tolerance test.
(assert
  (! patient_has_finding_of_exercise_tolerance_test_abnormal_now@@stable
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a stable exercise tolerance test."
