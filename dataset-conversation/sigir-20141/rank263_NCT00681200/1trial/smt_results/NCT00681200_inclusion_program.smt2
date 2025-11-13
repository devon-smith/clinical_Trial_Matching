;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_self_identifies_as_african_american_descent Bool) ;; {"when_to_set_to_true":"Set to true if the patient self-identifies as a person of African American descent.","when_to_set_to_false":"Set to false if the patient does not self-identify as a person of African American descent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient self-identifies as a person of African American descent.","meaning":"Boolean indicating whether the patient self-identifies as a person of African American descent."} // "To be included, the patient must self-identify as a person of African American descent."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_self_identifies_as_african_american_descent
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must self-identify as a person of African American descent."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_resides_in_washington_dc_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently resides in Washington, District of Columbia.","when_to_set_to_false":"Set to false if the patient currently does not reside in Washington, District of Columbia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently resides in Washington, District of Columbia.","meaning":"Boolean indicating whether the patient currently resides in Washington, District of Columbia."} // "To be included, the patient must reside in (Washington, District of Columbia)..."
(declare-const patient_resides_in_surrounding_communities_of_washington_dc_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently resides in the surrounding communities of Washington, District of Columbia.","when_to_set_to_false":"Set to false if the patient currently does not reside in the surrounding communities of Washington, District of Columbia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently resides in the surrounding communities of Washington, District of Columbia.","meaning":"Boolean indicating whether the patient currently resides in the surrounding communities of Washington, District of Columbia."} // "To be included, the patient must reside in ... OR (surrounding communities of Washington, District of Columbia)."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must reside in Washington, DC OR surrounding communities of Washington, DC
(assert
  (! (or patient_resides_in_washington_dc_now
         patient_resides_in_surrounding_communities_of_washington_dc_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must reside in (Washington, District of Columbia) OR (surrounding communities of Washington, District of Columbia)."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured average systolic blood pressure value in millimeters of mercury if available for the patient now.","when_to_set_to_null":"Set to null if no average systolic blood pressure measurement is available for the patient now or the value is indeterminate.","meaning":"Numeric value representing the patient's average systolic blood pressure measured now, in millimeters of mercury."} // "systolic blood pressure measured now, in millimeters of mercury"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@average_measurement Bool) ;; {"when_to_set_to_true":"Set to true if the systolic blood pressure value represents an average of multiple measurements taken now.","when_to_set_to_false":"Set to false if the systolic blood pressure value does not represent an average (e.g., is a single measurement) taken now.","when_to_set_to_null":"Set to null if it is unknown whether the systolic blood pressure value is an average or not.","meaning":"Boolean indicating whether the systolic blood pressure value recorded now is an average measurement."} // "average systolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured average diastolic blood pressure value in millimeters of mercury if available for the patient now.","when_to_set_to_null":"Set to null if no average diastolic blood pressure measurement is available for the patient now or the value is indeterminate.","meaning":"Numeric value representing the patient's average diastolic blood pressure measured now, in millimeters of mercury."} // "diastolic blood pressure measured now, in millimeters of mercury"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@average_measurement Bool) ;; {"when_to_set_to_true":"Set to true if the diastolic blood pressure value represents an average of multiple measurements taken now.","when_to_set_to_false":"Set to false if the diastolic blood pressure value does not represent an average (e.g., is a single measurement) taken now.","when_to_set_to_null":"Set to null if it is unknown whether the diastolic blood pressure value is an average or not.","meaning":"Boolean indicating whether the diastolic blood pressure value recorded now is an average measurement."} // "average diastolic blood pressure"
(declare-const patient_is_taking_antihypertensive_medication_in_sympatholytic_class_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an antihypertensive medication that is in the sympatholytic medication class.","when_to_set_to_false":"Set to false if the patient is currently not taking any antihypertensive medication in the sympatholytic medication class.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an antihypertensive medication in the sympatholytic medication class.","meaning":"Boolean indicating whether the patient is currently taking an antihypertensive medication that is in the sympatholytic medication class."} // "antihypertensive medication in the sympatholytic medication class"
(declare-const patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a beta adrenergic receptor antagonist containing product (beta blocker medication).","when_to_set_to_false":"Set to false if the patient is currently not taking a beta adrenergic receptor antagonist containing product (beta blocker medication).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a beta adrenergic receptor antagonist containing product (beta blocker medication).","meaning":"Boolean indicating whether the patient is currently taking a beta adrenergic receptor antagonist containing product (beta blocker medication)."} // "beta blocker medication"
(declare-const patient_is_exposed_to_alpha_adrenergic_receptor_antagonist_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to an alpha adrenergic receptor antagonist (alpha antagonist medication).","when_to_set_to_false":"Set to false if the patient is currently not exposed to an alpha adrenergic receptor antagonist (alpha antagonist medication).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to an alpha adrenergic receptor antagonist (alpha antagonist medication).","meaning":"Boolean indicating whether the patient is currently exposed to an alpha adrenergic receptor antagonist (alpha antagonist medication)."} // "alpha antagonist medication"
(declare-const patient_is_taking_central_nervous_system_agonist_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a central nervous system agonist medication.","when_to_set_to_false":"Set to false if the patient is currently not taking a central nervous system agonist medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a central nervous system agonist medication.","meaning":"Boolean indicating whether the patient is currently taking a central nervous system agonist medication."} // "central nervous system agonist medication"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@average_measurement
         true)
     :named REQ2_AUXILIARY0)) ;; "systolic blood pressure value is an average measurement"

(assert
  (! (=> patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@average_measurement
         true)
     :named REQ2_AUXILIARY1)) ;; "diastolic blood pressure value is an average measurement"

;; Non-exhaustive examples imply the sympatholytic medication class
(assert
  (! (=> (or patient_is_taking_beta_adrenergic_receptor_antagonist_containing_product_now
             patient_is_exposed_to_alpha_adrenergic_receptor_antagonist_now
             patient_is_taking_central_nervous_system_agonist_medication_now)
         patient_is_taking_antihypertensive_medication_in_sympatholytic_class_now)
     :named REQ2_AUXILIARY2)) ;; "beta blocker, alpha antagonist, CNS agonist are examples of sympatholytic antihypertensive medication"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Stage I hypertension (average SBP 140-159 OR average DBP 90-99)
(assert
  (! (or (and patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@average_measurement
              (>= patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 140.0)
              (<= patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 159.0))
         (and patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@average_measurement
              (>= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 90.0)
              (<= patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 99.0)))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "stage I hypertension defined as SBP 140-159 or DBP 90-99, on average"

;; Component 1: NOT taking antihypertensive medication in sympatholytic class
(assert
  (! (not patient_is_taking_antihypertensive_medication_in_sympatholytic_class_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "must NOT be taking antihypertensive medication in sympatholytic class"
