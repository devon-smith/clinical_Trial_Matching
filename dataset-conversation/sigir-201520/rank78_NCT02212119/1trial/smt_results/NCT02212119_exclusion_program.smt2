;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_alternate_etiology_for_increased_muscle_tone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an alternate etiology (cause) for increased muscle tone.","when_to_set_to_false":"Set to false if the patient currently does not have an alternate etiology for increased muscle tone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an alternate etiology for increased muscle tone.","meaning":"Boolean indicating whether the patient currently has an alternate etiology for increased muscle tone."} ;; "alternate etiologies for increased muscle tone"

(declare-const patient_has_finding_of_increased_muscle_tone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of increased muscle tone.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of increased muscle tone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has increased muscle tone.","meaning":"Boolean indicating whether the patient currently has increased muscle tone."} ;; "increased muscle tone"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_alternate_etiology_for_increased_muscle_tone_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has alternate etiologies for increased muscle tone."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_taken_clostridium_botulinum_toxin_containing_product_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any clostridium botulinum toxin containing product within the past 6 months prior to the study.","when_to_set_to_false":"Set to false if the patient has not taken any clostridium botulinum toxin containing product within the past 6 months prior to the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any clostridium botulinum toxin containing product within the past 6 months prior to the study.","meaning":"Boolean indicating whether the patient has taken any clostridium botulinum toxin containing product within the past 6 months."} ;; "botulinum toxin within the six months preceding the study"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_taken_clostridium_botulinum_toxin_containing_product_inthepast6months)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received botulinum toxin within the six months preceding the study."
