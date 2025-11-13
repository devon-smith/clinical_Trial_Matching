;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years AND aged ≤ 90 years"
(declare-const patient_has_finding_of_dysphagia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with dysphagia.","when_to_set_to_false":"Set to false if the patient currently does not present with dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with dysphagia.","meaning":"Boolean indicating whether the patient currently presents with dysphagia."}  ;; "dysphagia"
(declare-const patient_has_finding_of_food_impaction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently presents with food impaction.","when_to_set_to_false":"Set to false if the patient currently does not present with food impaction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently presents with food impaction.","meaning":"Boolean indicating whether the patient currently presents with food impaction."}  ;; "food impaction"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 1: To be included, the patient must be aged ≤ 90 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 90)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 90 years."

;; Component 2: To be included, the patient must (present with dysphagia OR present with food impaction).
(assert
  (! (or patient_has_finding_of_dysphagia_now
         patient_has_finding_of_food_impaction_now)
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (present with dysphagia OR present with food impaction)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_can_undergo_esophagogastroduodenoscopy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to undergo esophagogastroduodenoscopy.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to undergo esophagogastroduodenoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to undergo esophagogastroduodenoscopy.","meaning":"Boolean indicating whether the patient currently has the ability to undergo esophagogastroduodenoscopy."}  ;; "the ability to undergo esophagogastroduodenoscopy"
(declare-const patient_can_undergo_biopsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to undergo biopsy.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to undergo biopsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to undergo biopsy.","meaning":"Boolean indicating whether the patient currently has the ability to undergo biopsy."}  ;; "the ability to undergo biopsies"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: "To be included, the patient must have the ability to undergo esophagogastroduodenoscopy."
(assert
  (! patient_can_undergo_esophagogastroduodenoscopy_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS))

;; Component 1: "To be included, the patient must have the ability to undergo biopsies."
(assert
  (! patient_can_undergo_biopsy_now
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_significant_cardiopulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has significant cardiopulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have significant cardiopulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has significant cardiopulmonary disease.","meaning":"Boolean indicating whether the patient currently has significant cardiopulmonary disease."}  ;; "significant cardiopulmonary disease"
(declare-const patient_has_contraindication_to_esophagogastroduodenoscopy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication to esophagogastroduodenoscopy.","when_to_set_to_false":"Set to false if the patient currently does not have any contraindication to esophagogastroduodenoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication to esophagogastroduodenoscopy.","meaning":"Boolean indicating whether the patient currently has any contraindication to esophagogastroduodenoscopy."}  ;; "any other contraindication to esophagogastroduodenoscopy"

;; ===================== Constraint Assertions (REQ 2) =====================
;; To be included, the patient must (NOT have significant cardiopulmonary disease OR NOT have any other contraindication to esophagogastroduodenoscopy).
(assert
  (! (or (not patient_has_significant_cardiopulmonary_disease_now)
         (not patient_has_contraindication_to_esophagogastroduodenoscopy_now))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "NOT have significant cardiopulmonary disease OR NOT have any other contraindication to esophagogastroduodenoscopy"
