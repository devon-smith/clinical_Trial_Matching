;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_taking_amlodipine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any amlodipine-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any amlodipine-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any amlodipine-containing product.","meaning":"Boolean indicating whether the patient is currently taking any amlodipine-containing product."} ;; "existing use of amlodipine"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_taking_amlodipine_containing_product_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has existing use of amlodipine."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_thrombocytopenic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of thrombocytopenia (a thrombocytopenic disorder).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of thrombocytopenia (a thrombocytopenic disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has thrombocytopenia (a thrombocytopenic disorder).","meaning":"Boolean indicating whether the patient currently has thrombocytopenia (a thrombocytopenic disorder)."} ;; "thrombocytopenia"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_thrombocytopenic_disorder_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has thrombocytopenia."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_end_stage_renal_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of end stage renal disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of end stage renal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has end stage renal disease.","meaning":"Boolean indicating whether the patient currently has end stage renal disease."} ;; "end stage renal failure"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_end_stage_renal_disease_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has end stage renal failure."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_allergy_to_amlodipine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of allergy to amlodipine.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of allergy to amlodipine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of allergy to amlodipine.","meaning":"Boolean indicating whether the patient currently has a clinical finding of allergy to amlodipine."} ;; "allergy to amlodipine"
(declare-const patient_has_finding_of_allergy_to_clopidogrel_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of allergy to clopidogrel.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of allergy to clopidogrel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of allergy to clopidogrel.","meaning":"Boolean indicating whether the patient currently has a clinical finding of allergy to clopidogrel."} ;; "allergy to clopidogrel"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_allergy_to_clopidogrel_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to clopidogrel."

(assert
(! (not patient_has_finding_of_allergy_to_amlodipine_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to amlodipine."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently known not to be lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
  (! (not patient_is_lactating_now)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to cytochrome P450 3A4 enzyme in the past 7 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to cytochrome P450 3A4 enzyme in the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to cytochrome P450 3A4 enzyme in the past 7 days.","meaning":"Boolean indicating whether the patient has been exposed to cytochrome P450 3A4 enzyme in the past 7 days."} ;; "cytochrome P450 3A4 enzyme"
(declare-const patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_inthepast7days@@is_strong_inhibitor Bool) ;; {"when_to_set_to_true":"Set to true if the exposure in the past 7 days was to a strong inhibitor of cytochrome P450 3A4 enzyme.","when_to_set_to_false":"Set to false if the exposure in the past 7 days was not to a strong inhibitor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was to a strong inhibitor.","meaning":"Boolean indicating whether the exposure to cytochrome P450 3A4 enzyme in the past 7 days was to a strong inhibitor."} ;; "strong inhibitor of cytochrome P450 3A4 enzyme within 7 days before the start of the study"
(declare-const patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_inthepast7days@@is_strong_inducer Bool) ;; {"when_to_set_to_true":"Set to true if the exposure in the past 7 days was to a strong inducer of cytochrome P450 3A4 enzyme.","when_to_set_to_false":"Set to false if the exposure in the past 7 days was not to a strong inducer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was to a strong inducer.","meaning":"Boolean indicating whether the exposure to cytochrome P450 3A4 enzyme in the past 7 days was to a strong inducer."} ;; "strong inducer of cytochrome P450 3A4 enzyme within 7 days before the start of the study"
(declare-const patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_inthepast7days@@temporalcontext_within7days_before_study_start Bool) ;; {"when_to_set_to_true":"Set to true if the exposure occurred within 7 days before the start of the study.","when_to_set_to_false":"Set to false if the exposure did not occur within 7 days before the start of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within 7 days before the start of the study.","meaning":"Boolean indicating whether the exposure occurred within 7 days before the start of the study."} ;; "within 7 days before the start of the study"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_inthepast7days@@is_strong_inhibitor
      patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_inthepast7days)
:named REQ5_AUXILIARY0)) ;; "strong inhibitor of cytochrome P450 3A4 enzyme within 7 days before the start of the study"

(assert
(! (=> patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_inthepast7days@@is_strong_inducer
      patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_inthepast7days)
:named REQ5_AUXILIARY1)) ;; "strong inducer of cytochrome P450 3A4 enzyme within 7 days before the start of the study"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have used a strong inhibitor or strong inducer of cytochrome P450 3A4 enzyme within 7 days before the start of the study
(assert
(! (not (or patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_inthepast7days@@is_strong_inhibitor
           patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_inthepast7days@@is_strong_inducer))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has used a strong inhibitor of cytochrome P450 3A4 enzyme within 7 days before the start of the study) OR (the patient has used a strong inducer of cytochrome P450 3A4 enzyme within 7 days before the start of the study)."
