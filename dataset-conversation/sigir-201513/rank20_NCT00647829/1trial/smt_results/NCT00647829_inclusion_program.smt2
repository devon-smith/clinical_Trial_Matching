;; ===================== Declarations for the inclusion criteria (REQ 0) =====================

(declare-const patient_has_finding_of_moderate_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has moderate pain as a clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have moderate pain as a clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has moderate pain.","meaning":"Boolean indicating whether the patient currently has moderate pain."}  ;; "moderate pain"
(declare-const patient_has_finding_of_moderate_pain_now@@measured_on_swallowing Bool) ;; {"when_to_set_to_true":"Set to true if the moderate pain finding is specifically measured on swallowing.","when_to_set_to_false":"Set to false if the moderate pain finding is not specifically measured on swallowing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the moderate pain finding is measured on swallowing.","meaning":"Boolean indicating whether the moderate pain finding is measured on swallowing."}  ;; "moderate pain as measured on swallowing"
(declare-const patient_has_finding_of_severe_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe pain as a clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have severe pain as a clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe pain.","meaning":"Boolean indicating whether the patient currently has severe pain."}  ;; "severe pain"
(declare-const patient_has_finding_of_severe_pain_now@@measured_on_swallowing Bool) ;; {"when_to_set_to_true":"Set to true if the severe pain finding is specifically measured on swallowing.","when_to_set_to_false":"Set to false if the severe pain finding is not specifically measured on swallowing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severe pain finding is measured on swallowing.","meaning":"Boolean indicating whether the severe pain finding is measured on swallowing."}  ;; "severe pain as measured on swallowing"
(declare-const patient_pain_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value in millimeters if a numeric measurement of pain intensity recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current pain intensity score in millimeters."}  ;; "pain intensity scale in millimeters"
(declare-const patient_pain_value_recorded_now_withunit_millimeter@@measured_on_swallowing Bool) ;; {"when_to_set_to_true":"Set to true if the pain intensity measurement is specifically measured on swallowing.","when_to_set_to_false":"Set to false if the pain intensity measurement is not specifically measured on swallowing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pain intensity measurement is measured on swallowing.","meaning":"Boolean indicating whether the pain intensity measurement is measured on swallowing."}  ;; "pain intensity scale on swallowing"
(declare-const patient_visual_analog_scale_score_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value in millimeters if a numeric measurement of visual analogue scale score recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current visual analogue scale score in millimeters."}  ;; "visual analogue scale in millimeters"
(declare-const patient_visual_analog_scale_score_value_recorded_now_withunit_millimeter@@measured_on_swallowing Bool) ;; {"when_to_set_to_true":"Set to true if the visual analogue scale score measurement is specifically measured on swallowing.","when_to_set_to_false":"Set to false if the visual analogue scale score measurement is not specifically measured on swallowing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the visual analogue scale score measurement is measured on swallowing.","meaning":"Boolean indicating whether the visual analogue scale score measurement is measured on swallowing."}  ;; "visual analogue scale on swallowing"
(declare-const patient_tonsillo_pharyngitis_score_value_recorded_now_withunit_point Real) ;; {"when_to_set_to_value":"Set to the measured value in points if a numeric measurement of tonsillo-pharyngitis score recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current tonsillo-pharyngitis score in points."}  ;; "tonsillo-pharyngitis score"
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough as a clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have cough as a clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."}  ;; "cough"
(declare-const patient_has_finding_of_mouth_breathing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has mouth-breathing as a clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have mouth-breathing as a clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mouth-breathing.","meaning":"Boolean indicating whether the patient currently has mouth-breathing."}  ;; "mouth-breathing"

;; ===================== Auxiliary Assertions (REQ 0) =====================

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_moderate_pain_now@@measured_on_swallowing
         patient_has_finding_of_moderate_pain_now)
     :named REQ0_AUXILIARY0)) ;; "moderate pain as measured on swallowing"

(assert
  (! (=> patient_has_finding_of_severe_pain_now@@measured_on_swallowing
         patient_has_finding_of_severe_pain_now)
     :named REQ0_AUXILIARY1)) ;; "severe pain as measured on swallowing"

(assert
  (! (=> patient_pain_value_recorded_now_withunit_millimeter@@measured_on_swallowing
         (>= patient_pain_value_recorded_now_withunit_millimeter 0.0))
     :named REQ0_AUXILIARY2)) ;; "pain intensity measurement on swallowing"

(assert
  (! (=> patient_visual_analog_scale_score_value_recorded_now_withunit_millimeter@@measured_on_swallowing
         (>= patient_visual_analog_scale_score_value_recorded_now_withunit_millimeter 0.0))
     :named REQ0_AUXILIARY3)) ;; "visual analogue scale measurement on swallowing"

;; ===================== Constraint Assertions (REQ 0) =====================

;; Component 0: ((moderate pain OR severe pain) as measured by the sore throat pain intensity scale on swallowing ≥ 66 mm on a 100-mm visual analogue scale)
(assert
  (! (or
        (and patient_has_finding_of_moderate_pain_now@@measured_on_swallowing
             (>= patient_pain_value_recorded_now_withunit_millimeter 66.0)
             (>= patient_visual_analog_scale_score_value_recorded_now_withunit_millimeter 66.0)
             patient_visual_analog_scale_score_value_recorded_now_withunit_millimeter@@measured_on_swallowing)
        (and patient_has_finding_of_severe_pain_now@@measured_on_swallowing
             (>= patient_pain_value_recorded_now_withunit_millimeter 66.0)
             (>= patient_visual_analog_scale_score_value_recorded_now_withunit_millimeter 66.0)
             patient_visual_analog_scale_score_value_recorded_now_withunit_millimeter@@measured_on_swallowing)
     )
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "((have moderate pain OR have severe pain) as measured by the sore throat pain intensity scale on swallowing ≥ 66 millimeters on a 100-millimeter visual analogue scale)"

;; Component 1: minimum of 4 points on the 10-point tonsillo-pharyngitis score
(assert
  (! (>= patient_tonsillo_pharyngitis_score_value_recorded_now_withunit_point 4.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have a minimum of 4 points on the 10-point tonsillo-pharyngitis score"

;; Component 2: NOT experiencing cough
(assert
  (! (not patient_has_finding_of_cough_now)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "NOT be experiencing cough"

;; Component 3: NOT experiencing any evidence of mouth-breathing
(assert
  (! (not patient_has_finding_of_mouth_breathing_now)
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "NOT be experiencing any evidence of mouth-breathing"
