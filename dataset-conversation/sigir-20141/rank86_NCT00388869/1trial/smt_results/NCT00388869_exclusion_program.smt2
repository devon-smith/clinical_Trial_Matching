;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_contraindication_to_contrast_media_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to contrast media.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to contrast media.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to contrast media.","meaning":"Boolean indicating whether the patient currently has a contraindication to contrast media."} ;; "contraindication for intravenous contrast injection"

(declare-const patient_has_contraindication_to_contrast_media_now@@administered_intravenously_as_injection Bool) ;; {"when_to_set_to_true":"Set to true if the contraindication to contrast media applies specifically to contrast media administered intravenously as an injection.","when_to_set_to_false":"Set to false if the contraindication to contrast media does not apply to intravenous injection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraindication applies to intravenous injection.","meaning":"Boolean indicating whether the contraindication to contrast media applies specifically to intravenous injection."} ;; "contraindication for intravenous contrast injection"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_contraindication_to_contrast_media_now@@administered_intravenously_as_injection
       patient_has_contraindication_to_contrast_media_now)
   :named REQ0_AUXILIARY0)) ;; "contraindication for intravenous contrast injection"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_contraindication_to_contrast_media_now@@administered_intravenously_as_injection)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication for intravenous contrast injection."

;; --- verifier-bypassed (attempt 8/8) 2025-10-24T05:01:20.585836 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_exposed_to_contrast_media_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to contrast media.","when_to_set_to_false":"Set to false if the patient is currently not exposed to contrast media.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to contrast media.","meaning":"Boolean indicating whether the patient is currently exposed to contrast media."} ;; "contrast"
(declare-const patient_is_exposed_to_contrast_media_now@@administered_intravenously Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to contrast media is administered intravenously.","when_to_set_to_false":"Set to false if the patient's current exposure to contrast media is not administered intravenously.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contrast media was administered intravenously.","meaning":"Boolean indicating whether the patient's current exposure to contrast media is via intravenous administration."} ;; "contrast"
(declare-const renal_arteries_are_demonstrated_with_intravenous_contrast Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal arteries are demonstrated using intravenous contrast.","when_to_set_to_false":"Set to false if the patient's renal arteries are not demonstrated using intravenous contrast.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's renal arteries are demonstrated using intravenous contrast.","meaning":"Boolean indicating whether the patient's renal arteries are demonstrated using intravenous contrast."} ;; "failure to demonstrate renal arteries with intravenous contrast"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (not renal_arteries_are_demonstrated_with_intravenous_contrast))
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has a failure to demonstrate renal arteries with intravenous contrast."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_refused_to_sign_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient refused to sign an informed consent.","when_to_set_to_false":"Set to false if the patient did not refuse to sign an informed consent (i.e., signed or was willing to sign).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient refused to sign an informed consent.","meaning":"Boolean indicating whether the patient refused to sign an informed consent."} ;; "refuses to sign an informed consent"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_refused_to_sign_informed_consent)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient refuses to sign an informed consent."
