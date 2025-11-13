;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_physical_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a physical illness.","when_to_set_to_false":"Set to false if the patient currently does not have a physical illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a physical illness.","meaning":"Boolean indicating whether the patient currently has a physical illness."} ;; "physical illness"
(declare-const patient_has_finding_of_physical_illness_now@@may_deteriorate_during_isolation_period_required_by_radioiodine_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current physical illness may deteriorate during the isolation period required by radioiodine therapy.","when_to_set_to_false":"Set to false if the patient's current physical illness is not expected to deteriorate during the isolation period required by radioiodine therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current physical illness may deteriorate during the isolation period required by radioiodine therapy.","meaning":"Boolean indicating whether the patient's current physical illness may deteriorate during the isolation period required by radioiodine therapy."} ;; "physical illness that may deteriorate during the isolation period required by radioiodine therapy"
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric illness (mental disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a psychiatric illness (mental disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a psychiatric illness (mental disorder).","meaning":"Boolean indicating whether the patient currently has a psychiatric illness (mental disorder) now."} ;; "psychiatric illness"
(declare-const patient_has_finding_of_mental_disorder_now@@may_deteriorate_during_isolation_period_required_by_radioiodine_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current psychiatric illness (mental disorder) may deteriorate during the isolation period required by radioiodine therapy.","when_to_set_to_false":"Set to false if the patient's current psychiatric illness (mental disorder) is not expected to deteriorate during the isolation period required by radioiodine therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current psychiatric illness (mental disorder) may deteriorate during the isolation period required by radioiodine therapy.","meaning":"Boolean indicating whether the patient's current psychiatric illness (mental disorder) may deteriorate during the isolation period required by radioiodine therapy."} ;; "psychiatric illness that may deteriorate during the isolation period required by radioiodine therapy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_physical_illness_now@@may_deteriorate_during_isolation_period_required_by_radioiodine_therapy
      patient_has_finding_of_physical_illness_now)
   :named REQ1_AUXILIARY0)) ;; "physical illness that may deteriorate during the isolation period required by radioiodine therapy"

(assert
(! (=> patient_has_finding_of_mental_disorder_now@@may_deteriorate_during_isolation_period_required_by_radioiodine_therapy
      patient_has_finding_of_mental_disorder_now)
   :named REQ1_AUXILIARY1)) ;; "psychiatric illness that may deteriorate during the isolation period required by radioiodine therapy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_physical_illness_now@@may_deteriorate_during_isolation_period_required_by_radioiodine_therapy)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a physical illness that may deteriorate during the isolation period required by radioiodine therapy."

(assert
(! (not patient_has_finding_of_mental_disorder_now@@may_deteriorate_during_isolation_period_required_by_radioiodine_therapy)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a psychiatric illness that may deteriorate during the isolation period required by radioiodine therapy."
