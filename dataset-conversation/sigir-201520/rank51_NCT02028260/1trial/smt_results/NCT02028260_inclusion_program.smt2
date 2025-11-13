;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged greater than or equal to 18 years AND aged less than 76 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged greater than or equal to 18 years."

(assert
  (! (< patient_age_value_recorded_now_in_years 76)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged less than 76 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_admitted_to_medical_icu_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to the medical intensive care unit.","when_to_set_to_false":"Set to false if the patient is currently not admitted to the medical intensive care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to the medical intensive care unit.","meaning":"Boolean indicating whether the patient is currently admitted to the medical intensive care unit."} // "admitted to the medical intensive care unit"
(declare-const patient_is_admitted_to_medical_icu_now@@subcategories_3b_or_3c Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to the medical intensive care unit, specifically to subcategory 3B or 3C.","when_to_set_to_false":"Set to false if the patient is currently admitted to the medical intensive care unit, but not to subcategory 3B or 3C.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to subcategory 3B or 3C of the medical intensive care unit.","meaning":"Boolean indicating whether the patient is currently admitted to subcategory 3B or 3C of the medical intensive care unit."} // "admitted to the medical intensive care unit (with exhaustive subcategories (3B, 3C))"
(declare-const patient_is_admitted_to_surgical_icu_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to the surgical intensive care unit.","when_to_set_to_false":"Set to false if the patient is currently not admitted to the surgical intensive care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to the surgical intensive care unit.","meaning":"Boolean indicating whether the patient is currently admitted to the surgical intensive care unit."} // "admitted to the surgical intensive care unit"
(declare-const patient_is_admitted_to_surgical_icu_now@@subcategories_8c_or_8d_or_11c Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to the surgical intensive care unit, specifically to subcategory 8C, 8D, or 11C.","when_to_set_to_false":"Set to false if the patient is currently admitted to the surgical intensive care unit, but not to subcategory 8C, 8D, or 11C.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to subcategory 8C, 8D, or 11C of the surgical intensive care unit.","meaning":"Boolean indicating whether the patient is currently admitted to subcategory 8C, 8D, or 11C of the surgical intensive care unit."} // "admitted to the surgical intensive care unit (with exhaustive subcategories (8C, 8D, 11C))"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Exhaustive subcategories define the umbrella exactly:
(assert
  (! (= patient_is_admitted_to_medical_icu_now
        patient_is_admitted_to_medical_icu_now@@subcategories_3b_or_3c)
     :named REQ1_AUXILIARY0)) ;; "admitted to the medical intensive care unit (with exhaustive subcategories (3B, 3C))"

(assert
  (! (= patient_is_admitted_to_surgical_icu_now
        patient_is_admitted_to_surgical_icu_now@@subcategories_8c_or_8d_or_11c)
     :named REQ1_AUXILIARY1)) ;; "admitted to the surgical intensive care unit (with exhaustive subcategories (8C, 8D, 11C))"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: patient must be admitted to either medical ICU (3B or 3C) or surgical ICU (8C, 8D, or 11C)
(assert
  (! (or patient_is_admitted_to_medical_icu_now
         patient_is_admitted_to_surgical_icu_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (admitted to the medical intensive care unit (with exhaustive subcategories (3B, 3C)) OR admitted to the surgical intensive care unit (with exhaustive subcategories (8C, 8D, 11C)))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_surrogate_present_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a surrogate present who is able to provide informed consent on the patient's behalf.","when_to_set_to_false":"Set to false if the patient currently does not have a surrogate present who is able to provide informed consent on the patient's behalf.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a surrogate present who is able to provide informed consent on the patient's behalf.","meaning":"Boolean indicating whether the patient currently has a surrogate present who is able to provide informed consent on the patient's behalf."} // "must have a surrogate present to provide informed consent"
(declare-const patient_has_surrogate_present_to_provide_informed_consent_now@@when_patient_is_not_able_to_provide_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the surrogate is present to provide informed consent specifically when the patient is not able to provide informed consent.","when_to_set_to_false":"Set to false if the surrogate is not present to provide informed consent when the patient is not able to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surrogate is present to provide informed consent when the patient is not able to provide informed consent.","meaning":"Boolean indicating whether the surrogate is present to provide informed consent when the patient is not able to provide informed consent."} // "when the patient is not able"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_surrogate_present_to_provide_informed_consent_now@@when_patient_is_not_able_to_provide_informed_consent
         patient_has_surrogate_present_to_provide_informed_consent_now)
     :named REQ2_AUXILIARY0)) ;; "a surrogate present to provide informed consent when the patient is not able"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_surrogate_present_to_provide_informed_consent_now@@when_patient_is_not_able_to_provide_informed_consent
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must have a surrogate present to provide informed consent when the patient is not able"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_richmond_agitation_sedation_scale_score_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Richmond Agitation-Sedation Scale score is recorded now.","when_to_set_to_null":"Set to null if no such score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's Richmond Agitation-Sedation Scale score recorded now."} // "Richmond Agitation-Sedation Scale score"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Richmond Agitation-Sedation Scale score greater than -3
(assert
  (! (> patient_richmond_agitation_sedation_scale_score_value_recorded_now_withunit_none -3)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "Richmond Agitation-Sedation Scale score greater than -3"

;; Component 1: Richmond Agitation-Sedation Scale score less than +1
(assert
  (! (< patient_richmond_agitation_sedation_scale_score_value_recorded_now_withunit_none 1)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "Richmond Agitation-Sedation Scale score less than +1"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_positive_confusion_assessment_method_result_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive result on the Confusion Assessment Method.","when_to_set_to_false":"Set to false if the patient currently does not have a positive result on the Confusion Assessment Method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive result on the Confusion Assessment Method.","meaning":"Boolean indicating whether the patient currently has a positive result on the Confusion Assessment Method."} // "must have a positive Confusion Assessment Method result"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_positive_confusion_assessment_method_result_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have a positive Confusion Assessment Method result"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_enteral_access_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has enteral access.","when_to_set_to_false":"Set to false if the patient currently does not have enteral access.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has enteral access.","meaning":"Boolean indicating whether the patient currently has enteral access."} // "To be included, the patient must have enteral access."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_enteral_access_now
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have enteral access."
