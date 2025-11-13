;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "male OR female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "male OR female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 25 years AND aged ≤ 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must be male OR female
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (male OR female)."

;; Component 1: Patient must be aged ≥ 25 years
(assert
  (! (>= patient_age_value_recorded_now_in_years 25)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 25 years."

;; Component 2: Patient must be aged ≤ 65 years
(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≤ 65 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_overweight_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of overweight.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of overweight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of overweight.","meaning":"Boolean indicating whether the patient currently has a clinical finding of overweight."} // "overweight"
(declare-const patient_has_finding_of_obese_class_i_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of class I obesity (body mass index).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of class I obesity (body mass index).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of class I obesity (body mass index).","meaning":"Boolean indicating whether the patient currently has a clinical finding of class I obesity (body mass index)."} // "class I body mass index"
(declare-const patient_has_finding_of_obese_class_ii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of class II obesity (body mass index).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of class II obesity (body mass index).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of class II obesity (body mass index).","meaning":"Boolean indicating whether the patient currently has a clinical finding of class II obesity (body mass index)."} // "class II body mass index"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have (overweight) OR (class I body mass index) OR (class II body mass index).
(assert
  (! (or patient_has_finding_of_overweight_now
         patient_has_finding_of_obese_class_i_now
         patient_has_finding_of_obese_class_ii_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (overweight) OR (class I body mass index) OR (class II body mass index)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_does_walk_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to walk.","when_to_set_to_false":"Set to false if the patient is currently unable to walk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to walk.","meaning":"Boolean indicating whether the patient is currently able to walk."} // "walk"
(declare-const patient_has_finding_of_does_walk_now@@without_assistance Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to walk and does so without assistance.","when_to_set_to_false":"Set to false if the patient is currently able to walk but requires assistance, or is unable to walk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient walks without assistance.","meaning":"Boolean indicating whether the patient is currently able to walk without assistance."} // "walk without assistance"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_does_walk_now@@without_assistance
         patient_has_finding_of_does_walk_now)
     :named REQ2_AUXILIARY0)) ;; "To be included, the patient must be able to walk without assistance."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_does_walk_now@@without_assistance
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to walk without assistance."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_commits_to_schedule_of_assessment_visits Bool) ;; {"when_to_set_to_true":"Set to true if the patient has formally committed to a schedule of assessment visits.","when_to_set_to_false":"Set to false if the patient has not committed to a schedule of assessment visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has committed to a schedule of assessment visits.","meaning":"Boolean indicating whether the patient has committed to a schedule of assessment visits."} // "the patient must commit to a schedule of assessment visits"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_commits_to_schedule_of_assessment_visits
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must commit to a schedule of assessment visits"
