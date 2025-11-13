;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_musculoskeletal_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has musculoskeletal pain.","when_to_set_to_false":"Set to false if the patient currently does not have musculoskeletal pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has musculoskeletal pain.","meaning":"Boolean indicating whether the patient currently has musculoskeletal pain."} // "have muscular-skeletal pain"
(declare-const patient_has_finding_of_musculoskeletal_pain_now@@located_in_neck_region Bool) ;; {"when_to_set_to_true":"Set to true if the patient's musculoskeletal pain is located in the neck region.","when_to_set_to_false":"Set to false if the patient's musculoskeletal pain is not located in the neck region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the musculoskeletal pain is located in the neck region.","meaning":"Boolean indicating whether the patient's musculoskeletal pain is located in the neck region."} // "muscular-skeletal pain in the neck region"
(declare-const patient_has_finding_of_musculoskeletal_pain_now@@located_in_shoulder_region Bool) ;; {"when_to_set_to_true":"Set to true if the patient's musculoskeletal pain is located in the shoulder region.","when_to_set_to_false":"Set to false if the patient's musculoskeletal pain is not located in the shoulder region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the musculoskeletal pain is located in the shoulder region.","meaning":"Boolean indicating whether the patient's musculoskeletal pain is located in the shoulder region."} // "muscular-skeletal pain in the shoulder region"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_finding_of_musculoskeletal_pain_now@@located_in_neck_region
         patient_has_finding_of_musculoskeletal_pain_now)
     :named REQ0_AUXILIARY0)) ;; "muscular-skeletal pain in the neck region" implies "muscular-skeletal pain"

(assert
  (! (=> patient_has_finding_of_musculoskeletal_pain_now@@located_in_shoulder_region
         patient_has_finding_of_musculoskeletal_pain_now)
     :named REQ0_AUXILIARY1)) ;; "muscular-skeletal pain in the shoulder region" implies "muscular-skeletal pain"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_has_finding_of_musculoskeletal_pain_now@@located_in_neck_region
         patient_has_finding_of_musculoskeletal_pain_now@@located_in_shoulder_region)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have muscular-skeletal pain in the neck region OR have muscular-skeletal pain in the shoulder region"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute pain.","when_to_set_to_false":"Set to false if the patient currently does not have acute pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute pain.","meaning":"Boolean indicating whether the patient currently has acute pain."} // "acute pain"
(declare-const patient_has_finding_of_acute_pain_now@@located_in_neck_region Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute pain is located in the neck region.","when_to_set_to_false":"Set to false if the patient's acute pain is not located in the neck region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acute pain is located in the neck region.","meaning":"Boolean indicating whether the patient's acute pain is located in the neck region."} // "acute pain in the neck region"
(declare-const patient_has_finding_of_acute_pain_now@@located_in_shoulder_region Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute pain is located in the shoulder region.","when_to_set_to_false":"Set to false if the patient's acute pain is not located in the shoulder region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acute pain is located in the shoulder region.","meaning":"Boolean indicating whether the patient's acute pain is located in the shoulder region."} // "acute pain in the shoulder region"
(declare-const patient_has_finding_of_chronic_neck_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic pain in the neck region.","when_to_set_to_false":"Set to false if the patient currently does not have chronic pain in the neck region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic pain in the neck region.","meaning":"Boolean indicating whether the patient currently has chronic pain in the neck region."} // "chronic pain in the neck region"
(declare-const patient_has_finding_of_chronic_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic pain.","when_to_set_to_false":"Set to false if the patient currently does not have chronic pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic pain.","meaning":"Boolean indicating whether the patient currently has chronic pain."} // "chronic pain"
(declare-const patient_has_finding_of_chronic_pain_now@@located_in_shoulder_region Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic pain is located in the shoulder region.","when_to_set_to_false":"Set to false if the patient's chronic pain is not located in the shoulder region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic pain is located in the shoulder region.","meaning":"Boolean indicating whether the patient's chronic pain is located in the shoulder region."} // "chronic pain in the shoulder region"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_acute_pain_now@@located_in_neck_region
         patient_has_finding_of_acute_pain_now)
     :named REQ1_AUXILIARY0)) ;; "acute pain in the neck region" implies "acute pain"

(assert
  (! (=> patient_has_finding_of_acute_pain_now@@located_in_shoulder_region
         patient_has_finding_of_acute_pain_now)
     :named REQ1_AUXILIARY1)) ;; "acute pain in the shoulder region" implies "acute pain"

(assert
  (! (=> patient_has_finding_of_chronic_pain_now@@located_in_shoulder_region
         patient_has_finding_of_chronic_pain_now)
     :named REQ1_AUXILIARY2)) ;; "chronic pain in the shoulder region" implies "chronic pain"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must (have acute pain in the neck region OR have acute pain in the shoulder region OR have chronic pain in the neck region OR have chronic pain in the shoulder region).
(assert
  (! (or patient_has_finding_of_acute_pain_now@@located_in_neck_region
         patient_has_finding_of_acute_pain_now@@located_in_shoulder_region
         patient_has_finding_of_chronic_neck_pain_now
         patient_has_finding_of_chronic_pain_now@@located_in_shoulder_region)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (have acute pain in the neck region OR have acute pain in the shoulder region OR have chronic pain in the neck region OR have chronic pain in the shoulder region)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_decreased_range_of_cervical_spine_movement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of decreased range of cervical spine movement (restricted neck motion).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of decreased range of cervical spine movement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has decreased range of cervical spine movement.","meaning":"Boolean indicating whether the patient currently has decreased range of cervical spine movement."} // "restricted range of motion in the neck region"
(declare-const patient_has_finding_of_decreased_range_of_shoulder_movement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of decreased range of shoulder movement (restricted shoulder motion).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of decreased range of shoulder movement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has decreased range of shoulder movement.","meaning":"Boolean indicating whether the patient currently has decreased range of shoulder movement."} // "restricted range of motion in the shoulder region"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must (have restricted range of motion in the neck region OR have restricted range of motion in the shoulder region).
(assert
  (! (or patient_has_finding_of_decreased_range_of_cervical_spine_movement_now
         patient_has_finding_of_decreased_range_of_shoulder_movement_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (have restricted range of motion in the neck region OR have restricted range of motion in the shoulder region)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_fibrosis_now@@located_in_neck_region Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fibrosis located in the neck region.","when_to_set_to_false":"Set to false if the patient currently does not have fibrosis located in the neck region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fibrosis located in the neck region.","meaning":"Boolean indicating whether the patient currently has fibrosis located in the neck region."} // "have fibrosis in the neck region"
(declare-const patient_has_finding_of_fibrosis_now@@located_in_shoulder_region Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fibrosis located in the shoulder region.","when_to_set_to_false":"Set to false if the patient currently does not have fibrosis located in the shoulder region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fibrosis located in the shoulder region.","meaning":"Boolean indicating whether the patient currently has fibrosis located in the shoulder region."} // "have fibrosis in the shoulder region"
(declare-const patient_has_finding_of_scar_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has scar tissue.","when_to_set_to_false":"Set to false if the patient currently does not have scar tissue.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has scar tissue.","meaning":"Boolean indicating whether the patient currently has scar tissue."} // "scar tissue"
(declare-const patient_has_finding_of_scar_now@@located_in_neck_region Bool) ;; {"when_to_set_to_true":"Set to true if the patient's scar tissue is located in the neck region.","when_to_set_to_false":"Set to false if the patient's scar tissue is not located in the neck region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's scar tissue is located in the neck region.","meaning":"Boolean indicating whether the patient's scar tissue is located in the neck region."} // "scar tissue in the neck region"
(declare-const patient_has_finding_of_scar_now@@located_in_shoulder_region Bool) ;; {"when_to_set_to_true":"Set to true if the patient's scar tissue is located in the shoulder region.","when_to_set_to_false":"Set to false if the patient's scar tissue is not located in the shoulder region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's scar tissue is located in the shoulder region.","meaning":"Boolean indicating whether the patient's scar tissue is located in the shoulder region."} // "scar tissue in the shoulder region"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable for scar tissue
(assert
  (! (=> patient_has_finding_of_scar_now@@located_in_neck_region
         patient_has_finding_of_scar_now)
     :named REQ3_AUXILIARY0)) ;; "scar tissue in the neck region" implies "scar tissue"

(assert
  (! (=> patient_has_finding_of_scar_now@@located_in_shoulder_region
         patient_has_finding_of_scar_now)
     :named REQ3_AUXILIARY1)) ;; "scar tissue in the shoulder region" implies "scar tissue"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must (have fibrosis in the neck region OR have fibrosis in the shoulder region OR have scar tissue in the neck region OR have scar tissue in the shoulder region).
(assert
  (! (or patient_has_finding_of_fibrosis_now@@located_in_neck_region
         patient_has_finding_of_fibrosis_now@@located_in_shoulder_region
         patient_has_finding_of_scar_now@@located_in_neck_region
         patient_has_finding_of_scar_now@@located_in_shoulder_region)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (have fibrosis in the neck region OR have fibrosis in the shoulder region OR have scar tissue in the neck region OR have scar tissue in the shoulder region)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_inflammatory_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an inflammatory disorder.","when_to_set_to_false":"Set to false if the patient currently does not have an inflammatory disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an inflammatory disorder.","meaning":"Boolean indicating whether the patient currently has an inflammatory disorder."} // "inflammation"
(declare-const patient_has_finding_of_inflammatory_disorder_now@@located_in_neck_region Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current inflammatory disorder is located in the neck region.","when_to_set_to_false":"Set to false if the patient's current inflammatory disorder is not located in the neck region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the inflammatory disorder is located in the neck region.","meaning":"Boolean indicating whether the patient's current inflammatory disorder is located in the neck region."} // "inflammation in the neck region"
(declare-const patient_has_finding_of_inflammatory_disorder_now@@located_in_shoulder_region Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current inflammatory disorder is located in the shoulder region.","when_to_set_to_false":"Set to false if the patient's current inflammatory disorder is not located in the shoulder region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the inflammatory disorder is located in the shoulder region.","meaning":"Boolean indicating whether the patient's current inflammatory disorder is located in the shoulder region."} // "inflammation in the shoulder region"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_inflammatory_disorder_now@@located_in_neck_region
         patient_has_finding_of_inflammatory_disorder_now)
     :named REQ4_AUXILIARY0)) ;; "have inflammation in the neck region"

(assert
  (! (=> patient_has_finding_of_inflammatory_disorder_now@@located_in_shoulder_region
         patient_has_finding_of_inflammatory_disorder_now)
     :named REQ4_AUXILIARY1)) ;; "have inflammation in the shoulder region"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must (have inflammation in the neck region OR have inflammation in the shoulder region).
(assert
  (! (or patient_has_finding_of_inflammatory_disorder_now@@located_in_neck_region
         patient_has_finding_of_inflammatory_disorder_now@@located_in_shoulder_region)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (have inflammation in the neck region OR have inflammation in the shoulder region)."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_functional_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of functional disorder (altered function).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of functional disorder (altered function).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of functional disorder (altered function).","meaning":"Boolean indicating whether the patient currently has a functional disorder (altered function)."} // "altered function"
(declare-const patient_has_finding_of_functional_disorder_now@@located_in_neck_region Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current functional disorder (altered function) is located in the neck region.","when_to_set_to_false":"Set to false if the patient's current functional disorder (altered function) is not located in the neck region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current functional disorder (altered function) is located in the neck region.","meaning":"Boolean indicating whether the patient's current functional disorder (altered function) is located in the neck region."} // "altered function in the neck region"
(declare-const patient_has_finding_of_functional_disorder_now@@located_in_shoulder_region Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current functional disorder (altered function) is located in the shoulder region.","when_to_set_to_false":"Set to false if the patient's current functional disorder (altered function) is not located in the shoulder region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current functional disorder (altered function) is located in the shoulder region.","meaning":"Boolean indicating whether the patient's current functional disorder (altered function) is located in the shoulder region."} // "altered function in the shoulder region"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_functional_disorder_now@@located_in_neck_region
         patient_has_finding_of_functional_disorder_now)
     :named REQ5_AUXILIARY0)) ;; "altered function in the neck region" implies "altered function"

(assert
  (! (=> patient_has_finding_of_functional_disorder_now@@located_in_shoulder_region
         patient_has_finding_of_functional_disorder_now)
     :named REQ5_AUXILIARY1)) ;; "altered function in the shoulder region" implies "altered function"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must (have altered function in the neck region OR have altered function in the shoulder region).
(assert
  (! (or patient_has_finding_of_functional_disorder_now@@located_in_neck_region
         patient_has_finding_of_functional_disorder_now@@located_in_shoulder_region)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (have altered function in the neck region OR have altered function in the shoulder region)."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_strain_of_neck_muscle_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of strain of neck muscle.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of strain of neck muscle.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of strain of neck muscle.","meaning":"Boolean indicating whether the patient currently has a strain of neck muscle."} // "muscle strains in the neck region"
(declare-const patient_has_finding_of_shoulder_strain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of shoulder strain.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of shoulder strain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of shoulder strain.","meaning":"Boolean indicating whether the patient currently has a shoulder strain."} // "muscle strains in the shoulder region"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (or patient_has_finding_of_strain_of_neck_muscle_now
         patient_has_finding_of_shoulder_strain_now)
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (have muscle strains in the neck region OR have muscle strains in the shoulder region)."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_visual_analog_scale_pain_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current visual analog scale pain score (0-100) is recorded.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current visual analog scale pain score (0-100)."} // "visual analog scale pain scale (range 0 to 100)"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (>= patient_visual_analog_scale_pain_score_value_recorded_now_withunit_score 30)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must (have a rating on the visual analog scale pain scale (range 0 to 100) ≥ 30)."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 65 years"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 1: To be included, the patient must be aged ≤ 65 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 65 years."
