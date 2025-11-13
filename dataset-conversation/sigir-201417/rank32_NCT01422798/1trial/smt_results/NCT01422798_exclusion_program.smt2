;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_tb_chemotherapy_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed tuberculosis treatment within the past six months.","when_to_set_to_false":"Set to false if the patient has not completed tuberculosis treatment within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed tuberculosis treatment within the past six months.","meaning":"Boolean indicating whether the patient has completed tuberculosis treatment within the past six months."} ;; "the patient completed tuberculosis treatment within the past six months"
(declare-const patient_is_undergoing_tb_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving tuberculosis treatment.","when_to_set_to_false":"Set to false if the patient is currently not receiving tuberculosis treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving tuberculosis treatment.","meaning":"Boolean indicating whether the patient is currently receiving tuberculosis treatment."} ;; "the patient is currently receiving tuberculosis treatment"
(declare-const patient_is_undergoing_tuberculosis_prophylaxis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving isoniazid preventive therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving isoniazid preventive therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving isoniazid preventive therapy.","meaning":"Boolean indicating whether the patient is currently receiving isoniazid preventive therapy."} ;; "the patient is NOT receiving isoniazid preventive therapy"
(declare-const patient_tb_chemotherapy_value_recorded_inthehistory_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days the patient has received tuberculosis treatment in the history if available.","when_to_set_to_null":"Set to null if the number of days is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of days the patient has received tuberculosis treatment in the history."} ;; "the patient has received tuberculosis treatment for greater than or equal to three days"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: (currently receiving TB treatment AND >=3 days AND NOT isoniazid preventive therapy) OR (completed TB treatment within past 6 months)
(assert
(! (not (or
         (and patient_is_undergoing_tb_chemotherapy_now
              (>= patient_tb_chemotherapy_value_recorded_inthehistory_withunit_days 3)
              (not patient_is_undergoing_tuberculosis_prophylaxis_now))
         patient_has_undergone_tb_chemotherapy_inthepast6months))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is currently receiving tuberculosis treatment AND (the patient has received tuberculosis treatment for greater than or equal to three days) AND (the patient is NOT receiving isoniazid preventive therapy)) OR (the patient completed tuberculosis treatment within the past six months))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has provided informed consent.","when_to_set_to_false":"Set to false if the patient currently has NOT provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has provided informed consent.","meaning":"Boolean indicating whether the patient currently has provided informed consent."} ;; "The patient is excluded if the patient does NOT have informed consent."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_informed_consent_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT have informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_lives_in_greater_mbarara_region_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently lives within the Greater Mbarara region.","when_to_set_to_false":"Set to false if the patient currently lives outside of the Greater Mbarara region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently lives within the Greater Mbarara region.","meaning":"Boolean indicating whether the patient currently lives within the Greater Mbarara region."} ;; "The patient is excluded if the patient lives outside of the Greater Mbarara region."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_lives_in_greater_mbarara_region_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient lives outside of the Greater Mbarara region."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_unable_to_attend_follow_up_visits Bool) ;; {"when_to_set_to_true":"Set to true if it is documented or determined that the patient is unable to attend the follow-up visits.","when_to_set_to_false":"Set to false if it is documented or determined that the patient is able to attend the follow-up visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to attend the follow-up visits.","meaning":"Boolean indicating whether the patient is unable to attend the follow-up visits."} ;; "the patient is unable to attend the follow-up visits"
(declare-const patient_is_unwilling_to_attend_follow_up_visits Bool) ;; {"when_to_set_to_true":"Set to true if it is documented or determined that the patient is unwilling to attend the follow-up visits.","when_to_set_to_false":"Set to false if it is documented or determined that the patient is willing to attend the follow-up visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unwilling to attend the follow-up visits.","meaning":"Boolean indicating whether the patient is unwilling to attend the follow-up visits."} ;; "the patient is unwilling to attend the follow-up visits"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_unable_to_attend_follow_up_visits)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to attend the follow-up visits."

(assert
(! (not patient_is_unwilling_to_attend_follow_up_visits)
:named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unwilling to attend the follow-up visits."
