;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_taken_azithromycin_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken (initiated) an azithromycin-containing product at any time in their history.","when_to_set_to_false":"Set to false if the patient has never taken (initiated) an azithromycin-containing product at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken (initiated) an azithromycin-containing product.","meaning":"Boolean indicating whether the patient has ever taken (initiated) an azithromycin-containing product at any time in their history."} ;; "azithromycin"
(declare-const patient_has_taken_azithromycin_containing_product_inthehistory@@temporalcontext_initiation_before_hospitalization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken (initiated) an azithromycin-containing product and the initiation occurred before hospitalization.","when_to_set_to_false":"Set to false if the patient has taken (initiated) an azithromycin-containing product but the initiation did not occur before hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the initiation occurred before hospitalization.","meaning":"Boolean indicating whether the patient has taken (initiated) an azithromycin-containing product and the initiation occurred before hospitalization."} ;; "initiation of azithromycin before hospitalization"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_taken_azithromycin_containing_product_inthehistory@@temporalcontext_initiation_before_hospitalization
      patient_has_taken_azithromycin_containing_product_inthehistory)
   :named REQ0_AUXILIARY0)) ;; "initiation of azithromycin before hospitalization" implies "has ever taken azithromycin"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_taken_azithromycin_containing_product_inthehistory@@temporalcontext_initiation_before_hospitalization)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient had initiation of azithromycin before hospitalization."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_inadequate_ecg_tracing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a technically undecipherable (inadequate) electrocardiogram tracing.","when_to_set_to_false":"Set to false if the patient currently does not have a technically undecipherable (inadequate) electrocardiogram tracing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a technically undecipherable (inadequate) electrocardiogram tracing.","meaning":"Boolean indicating whether the patient currently has an inadequate ECG tracing."} ;; "technically undecipherable electrocardiogram"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_inadequate_ecg_tracing_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a technically undecipherable electrocardiogram."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_permanent_cardiac_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a permanent cardiac pacemaker.","when_to_set_to_false":"Set to false if the patient currently does not have a permanent cardiac pacemaker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a permanent cardiac pacemaker.","meaning":"Boolean indicating whether the patient currently has a permanent cardiac pacemaker."} ;; "permanent cardiac pacemaker"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_permanent_cardiac_pacemaker_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a permanent cardiac pacemaker."
