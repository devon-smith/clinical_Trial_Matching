;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_veteran_status_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as a veteran.","when_to_set_to_false":"Set to false if the patient is currently documented as not a veteran.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a veteran.","meaning":"Boolean indicating whether the patient currently has veteran status."} // "To be included, the patient must be a Veteran."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "To be included, the patient must be age > 21 years."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_veteran_status_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a Veteran."

(assert
  (! (> patient_age_value_recorded_now_in_years 21)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be age > 21 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_chronic_ulcer_of_lower_extremity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic ulcers of the lower extremity.","when_to_set_to_false":"Set to false if the patient currently does not have chronic ulcers of the lower extremity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic ulcers of the lower extremity.","meaning":"Boolean indicating whether the patient currently has chronic ulcers of the lower extremity."} // "have chronic lower extremity ulcers"
(declare-const patient_has_finding_of_diabetic_foot_ulcer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic diabetic foot ulcers.","when_to_set_to_false":"Set to false if the patient currently does not have chronic diabetic foot ulcers.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic diabetic foot ulcers.","meaning":"Boolean indicating whether the patient currently has chronic diabetic foot ulcers."} // "have chronic diabetic foot ulcers"
(declare-const wound_duration_value_recorded_now_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks corresponding to the duration of the patient's wound as recorded at the current time.","when_to_set_to_null":"Set to null if the duration of the patient's wound in weeks is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the duration of the patient's wound in weeks, recorded at the current time."} // "wound duration > 8 weeks"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_has_finding_of_chronic_ulcer_of_lower_extremity_now
         (and patient_has_finding_of_diabetic_foot_ulcer_now
              (> wound_duration_value_recorded_now_in_weeks 8.0)))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have chronic lower extremity ulcers) OR (have chronic diabetic foot ulcers AND wound duration > 8 weeks))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_undergoing_debridement_of_wound_of_skin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing or is judged by the clinician to require debridement of a wound of the skin.","when_to_set_to_false":"Set to false if the patient is not currently undergoing and is not judged to require debridement of a wound of the skin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing or is judged to require debridement of a wound of the skin.","meaning":"Boolean indicating whether the patient is currently undergoing or is judged to require debridement of a wound of the skin."} // "require wound debridement (25% or more of wound bed covered with non-viable tissue)"
(declare-const wound_bed_non_viable_tissue_coverage_percent_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the recorded percentage value if the percentage of the wound bed covered with non-viable tissue is documented now.","when_to_set_to_null":"Set to null if the percentage of the wound bed covered with non-viable tissue is unknown, not documented, or cannot be determined now.","meaning":"Numeric value representing the percentage of the wound bed currently covered with non-viable tissue, in percent."} // "25% or more of wound bed covered with non-viable tissue"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; The requirement states: "require wound debridement (25% or more of wound bed covered with non-viable tissue)"
;; This means that, in the context of this trial, the patient is judged to require wound debridement if and only if 25% or more of the wound bed is covered with non-viable tissue.
(assert
  (! (= patient_is_undergoing_debridement_of_wound_of_skin_now
        (>= wound_bed_non_viable_tissue_coverage_percent_value_recorded_now_withunit_percent 25.0))
     :named REQ2_AUXILIARY0)) ;; "require wound debridement (25% or more of wound bed covered with non-viable tissue)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_undergoing_debridement_of_wound_of_skin_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "require wound debridement (25% or more of wound bed covered with non-viable tissue)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_wound_value_recorded_now_withunit_centimeters Real) ;; {"when_to_set_to_value":"Set to the measured diameter in centimeters if a numeric measurement of the patient's wound diameter is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's wound diameter in centimeters measured now."} // "To be included, the patient must have wound size diameter ≥ 1.5 centimeters."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (>= patient_wound_value_recorded_now_withunit_centimeters 1.5)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have wound size diameter ≥ 1.5 centimeters."
