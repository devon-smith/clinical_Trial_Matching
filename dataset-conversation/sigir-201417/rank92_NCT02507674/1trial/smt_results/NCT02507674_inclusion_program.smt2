;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 0 years AND aged ≤ 18 years"
(declare-const patient_has_finding_of_abdominal_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abdominal pain.","when_to_set_to_false":"Set to false if the patient currently does not have abdominal pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abdominal pain.","meaning":"Boolean indicating whether the patient currently has abdominal pain."}  ;; "abdominal pain"
(declare-const patient_has_finding_of_abdominal_pain_now@@location_right_lower_abdomen Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current abdominal pain is located in the right lower abdomen.","when_to_set_to_false":"Set to false if the patient's current abdominal pain is not located in the right lower abdomen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current abdominal pain is located in the right lower abdomen.","meaning":"Boolean indicating whether the patient's current abdominal pain is located in the right lower abdomen."}  ;; "right lower abdominal pain"
(declare-const patient_is_being_evaluated_for_suspected_appendicitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being evaluated for suspected appendicitis.","when_to_set_to_false":"Set to false if the patient is not currently being evaluated for suspected appendicitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being evaluated for suspected appendicitis.","meaning":"Boolean indicating whether the patient is currently being evaluated for suspected appendicitis."}  ;; "suspected appendicitis"
(declare-const patient_is_presenting_to_pediatric_emergency_department_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently presenting to the pediatric emergency department.","when_to_set_to_false":"Set to false if the patient is not currently presenting to the pediatric emergency department.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently presenting to the pediatric emergency department.","meaning":"Boolean indicating whether the patient is currently presenting to the pediatric emergency department."}  ;; "presenting to the pediatric emergency department"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for right lower abdominal pain implies abdominal pain
(assert
  (! (=> patient_has_finding_of_abdominal_pain_now@@location_right_lower_abdomen
         patient_has_finding_of_abdominal_pain_now)
     :named REQ0_AUXILIARY0)) ;; "right lower abdominal pain" implies "abdominal pain"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be aged ≥ 0 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 0)
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "aged ≥ 0 years"

;; Component 1: To be included, the patient must be aged ≤ 18 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aged ≤ 18 years"

;; Component 2: To be included, the patient must be presenting to the pediatric emergency department for evaluation of (right lower abdominal pain AND suspected appendicitis).
(assert
  (! (and patient_is_presenting_to_pediatric_emergency_department_now
          patient_has_finding_of_abdominal_pain_now@@location_right_lower_abdomen
          patient_is_being_evaluated_for_suspected_appendicitis_now)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "presenting to the pediatric emergency department for evaluation of (right lower abdominal pain AND suspected appendicitis)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_undergone_ultrasonography_of_abdomen_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone abdominal ultrasonography at any time in the past (history).","when_to_set_to_false":"Set to false if the patient has not undergone abdominal ultrasonography at any time in the past (history).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone abdominal ultrasonography in the past.","meaning":"Boolean indicating whether the patient has undergone abdominal ultrasonography at any time in the past (history)."}  ;; "abdominal ultrasound"
(declare-const patient_has_undergone_ct_of_abdomen_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone abdominal computed tomography at any time in the past (history).","when_to_set_to_false":"Set to false if the patient has not undergone abdominal computed tomography at any time in the past (history).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone abdominal computed tomography in the past.","meaning":"Boolean indicating whether the patient has undergone abdominal computed tomography at any time in the past (history)."}  ;; "abdominal computed tomography"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The clinical diagnostic plan for the patient before subject enrollment must include (abdominal ultrasound OR abdominal computed tomography).
(assert
  (! (or patient_has_undergone_ultrasonography_of_abdomen_inthehistory
         patient_has_undergone_ct_of_abdomen_inthehistory)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the clinical diagnostic plan for the patient before subject enrollment must include (abdominal ultrasound OR abdominal computed tomography)"
