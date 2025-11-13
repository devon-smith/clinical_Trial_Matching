;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_pregnancy_with_single_fetus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant and the pregnancy involves a single fetus.","when_to_set_to_false":"Set to false if the patient is currently pregnant and the pregnancy does not involve a single fetus, or if the patient is not currently pregnant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently pregnant with a single fetus.","meaning":"Boolean indicating whether the patient is currently pregnant and the pregnancy involves a single fetus."}  ;; "a pregnancy with a single fetus"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."}  ;; "a pregnancy with a single fetus"

(declare-const patient_has_single_fetus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pregnancy with a single fetus (singleton pregnancy).","when_to_set_to_false":"Set to false if the patient is pregnant with more than one fetus (e.g., twins, triplets) or is not pregnant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a single fetus.","meaning":"Boolean indicating whether the patient currently has a pregnancy with a single fetus (singleton pregnancy)."}  ;; "the patient must have a single fetus"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: pregnancy with a single fetus means both pregnant and single fetus
(assert
  (! (= patient_has_pregnancy_with_single_fetus_now
        (and patient_is_pregnant_now patient_has_single_fetus_now))
     :named REQ0_AUXILIARY0)) ;; "the patient must have (a pregnancy with a single fetus)."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be pregnant
(assert
  (! patient_is_pregnant_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have a pregnancy."

;; Component 1: patient must have a single fetus
(assert
  (! patient_has_single_fetus_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have a single fetus."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_gestational_age_value_recorded_now_in_weeks Real) ;; {"when_to_set_to_value":"Set to the patient's current estimated gestational age in weeks if available.","when_to_set_to_null":"Set to null if the patient's current estimated gestational age in weeks is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current estimated gestational age in weeks."}  ;; "estimated gestational age ≥ 38 weeks"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must have a pregnancy at term (estimated gestational age ≥ 38 weeks).
(assert
  (! (and patient_is_pregnant_now
          (>= patient_gestational_age_value_recorded_now_in_weeks 38.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a pregnancy at term (estimated gestational age ≥ 38 weeks)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_will_undergo_elective_cesarean_section_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo an elective cesarean section in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo an elective cesarean section in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled for an elective cesarean section in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo an elective cesarean section in the future."}  ;; "the patient must be scheduled for an elective cesarean section"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_will_undergo_elective_cesarean_section_inthefuture
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be scheduled for an elective cesarean section"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_body_height_measure_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body height is recorded in the specified unit.","when_to_set_to_null":"Set to null if no current body height measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body height measurement in the specified unit."}  ;; "height"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must have height ≥ 60 units.
(assert
  (! (>= patient_body_height_measure_value_recorded_now_withunit_unit 60)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have height ≥ 60 units."

;; Component 1: To be included, the patient must have height ≤ 70 units.
(assert
  (! (<= patient_body_height_measure_value_recorded_now_withunit_unit 70)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have height ≤ 70 units."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_classified_as_asa_class_i_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as ASA Physical Status class I.","when_to_set_to_false":"Set to false if the patient is currently not classified as ASA Physical Status class I.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as ASA Physical Status class I.","meaning":"Boolean indicating whether the patient is currently classified as ASA Physical Status class I."} ;; "classified as American Society of Anesthesiologists Physical Status Classification System class I"
(declare-const patient_is_classified_as_asa_class_ii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as ASA Physical Status class II.","when_to_set_to_false":"Set to false if the patient is currently not classified as ASA Physical Status class II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as ASA Physical Status class II.","meaning":"Boolean indicating whether the patient is currently classified as ASA Physical Status class II."} ;; "classified as American Society of Anesthesiologists Physical Status Classification System class II"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must be classified as ASA class I OR ASA class II.
(assert
  (! (or patient_is_classified_as_asa_class_i_now
         patient_is_classified_as_asa_class_ii_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "classified as American Society of Anesthesiologists Physical Status Classification System class I OR classified as American Society of Anesthesiologists Physical Status Classification System class II"
