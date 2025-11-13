;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_contraindication_to_eprosartan_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication to eprosartan.","when_to_set_to_false":"Set to false if the patient currently does not have any contraindication to eprosartan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication to eprosartan.","meaning":"Boolean indicating whether the patient currently has any contraindication to eprosartan."} ;; "the patient has any contraindication to eprosartan"

(declare-const patient_has_contraindication_to_drug_excipient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication to drug excipients.","when_to_set_to_false":"Set to false if the patient currently does not have any contraindication to drug excipients.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication to drug excipients.","meaning":"Boolean indicating whether the patient currently has any contraindication to drug excipients."} ;; "the patient has any contraindication to the excipients"

(declare-const patient_has_contraindication_to_drug_excipient_now@@defined_according_to_local_label Bool) ;; {"when_to_set_to_true":"Set to true if the contraindication to drug excipients is determined according to the local label.","when_to_set_to_false":"Set to false if the contraindication to drug excipients is not determined according to the local label.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraindication to drug excipients is defined according to the local label.","meaning":"Boolean indicating whether the contraindication to drug excipients is defined according to the local label."} ;; "the excipients according to the local label"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_contraindication_to_drug_excipient_now@@defined_according_to_local_label
      patient_has_contraindication_to_drug_excipient_now)
:named REQ0_AUXILIARY0)) ;; "the excipients according to the local label"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have any contraindication to eprosartan
(assert
(! (not patient_has_contraindication_to_eprosartan_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has any contraindication to eprosartan"

;; Exclusion: patient must NOT have any contraindication to the excipients according to the local label
(assert
(! (not patient_has_contraindication_to_drug_excipient_now@@defined_according_to_local_label)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has any contraindication to the excipients according to the local label"
