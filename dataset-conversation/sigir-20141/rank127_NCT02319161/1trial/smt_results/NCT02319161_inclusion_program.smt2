;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_decompression_of_median_nerve_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has at any time in the history undergone decompression of the median nerve (operation for carpal tunnel syndrome).","when_to_set_to_false":"Set to false if the patient has never undergone decompression of the median nerve (operation for carpal tunnel syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone decompression of the median nerve (operation for carpal tunnel syndrome).","meaning":"Boolean indicating whether the patient has at any time in the history undergone decompression of the median nerve (operation for carpal tunnel syndrome)."} ;; "operation for carpal tunnel syndrome"
(declare-const patient_has_undergone_decompression_of_median_nerve_inthehistory@@performed_under_intravenous_regional_anesthesia Bool) ;; {"when_to_set_to_true":"Set to true if the decompression of the median nerve was performed under intravenous regional anesthesia.","when_to_set_to_false":"Set to false if the decompression of the median nerve was not performed under intravenous regional anesthesia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the decompression of the median nerve was performed under intravenous regional anesthesia.","meaning":"Boolean indicating whether the decompression of the median nerve was performed under intravenous regional anesthesia."} ;; "operation for carpal tunnel syndrome under intravenous regional anesthesia"
(declare-const patient_has_undergone_decompression_of_median_nerve_inthehistory@@temporalcontext_within_january_2009_to_january_2010 Bool) ;; {"when_to_set_to_true":"Set to true if the decompression of the median nerve occurred within January 2009 to January 2010.","when_to_set_to_false":"Set to false if the decompression of the median nerve did not occur within January 2009 to January 2010.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the decompression of the median nerve occurred within January 2009 to January 2010.","meaning":"Boolean indicating whether the decompression of the median nerve occurred within January 2009 to January 2010."} ;; "operation for carpal tunnel syndrome between January 2009 and January 2010"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for anesthesia implies the stem variable
(assert
  (! (=> patient_has_undergone_decompression_of_median_nerve_inthehistory@@performed_under_intravenous_regional_anesthesia
         patient_has_undergone_decompression_of_median_nerve_inthehistory)
     :named REQ0_AUXILIARY0)) ;; If the operation was performed under intravenous regional anesthesia, then the operation for carpal tunnel syndrome must have occurred

;; Qualifier variable for temporal context implies the stem variable
(assert
  (! (=> patient_has_undergone_decompression_of_median_nerve_inthehistory@@temporalcontext_within_january_2009_to_january_2010
         patient_has_undergone_decompression_of_median_nerve_inthehistory)
     :named REQ0_AUXILIARY1)) ;; If the operation occurred between January 2009 and January 2010, then the operation for carpal tunnel syndrome must have occurred

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must have undergone operation for carpal tunnel syndrome under intravenous regional anesthesia
(assert
  (! patient_has_undergone_decompression_of_median_nerve_inthehistory@@performed_under_intravenous_regional_anesthesia
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have undergone an operation for carpal tunnel syndrome under intravenous regional anesthesia"

;; Component 1: The operation must have occurred between January 2009 and January 2010
(assert
  (! patient_has_undergone_decompression_of_median_nerve_inthehistory@@temporalcontext_within_january_2009_to_january_2010
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the operation must have occurred between January 2009 and January 2010"
