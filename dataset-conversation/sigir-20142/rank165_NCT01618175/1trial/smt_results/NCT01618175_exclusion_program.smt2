;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_heart_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of heart disease (cardiac problem) documented at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of heart disease (cardiac problem) documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had heart disease (cardiac problem).","meaning":"Boolean indicating whether the patient has ever had heart disease (cardiac problem) in their history."} ;; "cardiac problem"
(declare-const patient_has_finding_of_disorder_of_lung_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of pulmonary disorder (pulmonary problem) documented at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of pulmonary disorder (pulmonary problem) documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had pulmonary disorder (pulmonary problem).","meaning":"Boolean indicating whether the patient has ever had pulmonary disorder (pulmonary problem) in their history."} ;; "pulmonary problem"
(declare-const patient_has_finding_of_myoneural_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of myoneural disorder (neuromuscular problem) documented at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of myoneural disorder (neuromuscular problem) documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had myoneural disorder (neuromuscular problem).","meaning":"Boolean indicating whether the patient has ever had myoneural disorder (neuromuscular problem) in their history."} ;; "neuromuscular problem"
(declare-const patient_has_finding_of_nutritional_problem_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of a nutritional problem (excluding failure to thrive) documented at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of a nutritional problem (excluding failure to thrive) documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a nutritional problem (excluding failure to thrive).","meaning":"Boolean indicating whether the patient has ever had a nutritional problem (excluding failure to thrive) in their history."} ;; "nutritional problem (excluding failure to thrive)"
(declare-const patient_has_finding_of_failure_to_thrive_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of failure to thrive documented at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of failure to thrive documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had failure to thrive.","meaning":"Boolean indicating whether the patient has ever had failure to thrive in their history."} ;; "failure to thrive"
(declare-const patient_has_finding_of_congenital_malformation_of_the_respiratory_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of congenital malformation of the respiratory system (congenital airway problem).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of congenital malformation of the respiratory system (congenital airway problem).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a congenital airway problem.","meaning":"Boolean indicating whether the patient currently has a congenital airway problem."} ;; "congenital airway problem"
(declare-const patient_has_finding_of_airway_morbidity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of acquired airway morbidity (acquired airway problem).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of acquired airway morbidity (acquired airway problem).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acquired airway problem.","meaning":"Boolean indicating whether the patient currently has an acquired airway problem."} ;; "acquired airway problem"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples for previous morbidity: listed problems are examples, not a complete list
(assert
(! (=> patient_has_finding_of_failure_to_thrive_inthehistory
      patient_has_finding_of_nutritional_problem_inthehistory)
    :named REQ0_AUXILIARY0)) ;; "nutritional problem with non-exhaustive examples (failure to thrive)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: previous morbidity (with non-exhaustive examples)
(assert
(! (not (or
    patient_has_finding_of_heart_disease_inthehistory
    patient_has_finding_of_disorder_of_lung_inthehistory
    patient_has_finding_of_myoneural_disorder_inthehistory
    patient_has_finding_of_nutritional_problem_inthehistory))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous morbidity with non-exhaustive examples ((cardiac problem) OR (pulmonary problem) OR (neuromuscular problem) OR (nutritional problem with non-exhaustive examples (failure to thrive)))."

;; Exclusion: congenital airway problem
(assert
(! (not patient_has_finding_of_congenital_malformation_of_the_respiratory_system_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a congenital airway problem."

;; Exclusion: acquired airway problem
(assert
(! (not patient_has_finding_of_airway_morbidity_now)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an acquired airway problem."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_age_since_conception_value_recorded_now_in_weeks Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's age since conception, in weeks, as recorded at the current time.","when_to_set_to_null":"Set to null if the patient's age since conception in weeks at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's age since conception, in weeks, recorded at the current time."} ;; "the patient's age since conception is less than forty-four weeks"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (< patient_age_since_conception_value_recorded_now_in_weeks 44))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's age since conception is less than forty-four weeks."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_apnea_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of apnea at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a documented history of apnea at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of apnea.","meaning":"Boolean indicating whether the patient has ever had a documented history of apnea."} ;; "has a history of apnea"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_apnea_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of apnea."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_bacterial_pneumonia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of bacterial pneumonia at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of bacterial pneumonia in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had bacterial pneumonia.","meaning":"Boolean indicating whether the patient has ever had bacterial pneumonia in their history."} ;; "bacterial pneumonia"
(declare-const patient_has_finding_of_bacterial_pneumonia_inthehistory@@suggested_by_localized_focal_finding_on_x_ray Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of bacterial pneumonia in their history was suggested by a localized-focal finding on X-ray.","when_to_set_to_false":"Set to false if the patient's diagnosis of bacterial pneumonia in their history was not suggested by a localized-focal finding on X-ray.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of bacterial pneumonia was suggested by a localized-focal finding on X-ray.","meaning":"Boolean indicating whether the patient's historical diagnosis of bacterial pneumonia was suggested by a localized-focal finding on X-ray."} ;; "bacterial pneumonia suggested by a localized-focal finding on X-ray"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_bacterial_pneumonia_inthehistory@@suggested_by_localized_focal_finding_on_x_ray
       patient_has_finding_of_bacterial_pneumonia_inthehistory)
   :named REQ3_AUXILIARY0)) ;; "bacterial pneumonia suggested by a localized-focal finding on X-ray" implies "bacterial pneumonia"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_bacterial_pneumonia_inthehistory@@suggested_by_localized_focal_finding_on_x_ray)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has bacterial pneumonia suggested by a localized-focal finding on X-ray)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_wheezing_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of wheezing at any time in their history (i.e., at least one previous attack).","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of wheezing at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of wheezing.","meaning":"Boolean indicating whether the patient has ever had wheezing in their history."} ;; "has had at least one previous wheezing attack"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_wheezing_inthehistory)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had at least one previous wheezing attack."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the patient's current hemoglobin saturation with oxygen (oxygen saturation) is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current hemoglobin saturation with oxygen (oxygen saturation)."} ;; "oxygen saturation"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_on_room_air Bool) ;; {"when_to_set_to_true":"Set to true if the oxygen saturation measurement was taken while the patient was breathing room air.","when_to_set_to_false":"Set to false if the oxygen saturation measurement was not taken while the patient was breathing room air.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the measurement was taken while the patient was breathing room air.","meaning":"Boolean indicating whether the oxygen saturation measurement was taken while the patient was breathing room air."} ;; "oxygen saturation greater than ninety-two percent on room air"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and
           patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_on_room_air
           (> patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent 92)
        ))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has oxygen saturation greater than ninety-two percent on room air."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_family_has_transportation_available_for_follow_up_visit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's family currently has transportation available for the patient's follow-up visit.","when_to_set_to_false":"Set to false if the patient's family currently does not have transportation available for the patient's follow-up visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's family currently has transportation available for the patient's follow-up visit.","meaning":"Boolean indicating whether the patient's family currently has transportation available for the patient's follow-up visit."} ;; "the patient's family has no transportation available for follow-up visit"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (not patient_family_has_transportation_available_for_follow_up_visit_now))
:named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient's family has no transportation available for follow-up visit."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_family_drive_time_to_medical_facility_value_recorded_now_in_minutes Real) ;; {"when_to_set_to_value":"Set to the number of minutes it takes for the patient's family to drive from their residence to the medical facility, as recorded now.","when_to_set_to_null":"Set to null if the drive time is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the drive time in minutes from the patient's family residence to the medical facility, recorded now."} ;; "family lives at a distance greater than thirty minutes' drive from the medical facility"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (> patient_family_drive_time_to_medical_facility_value_recorded_now_in_minutes 30))
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's family lives at a distance greater than thirty minutes' drive from the medical facility."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_exposed_to_steroid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to steroid.","when_to_set_to_false":"Set to false if the patient is currently not exposed to steroid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to steroid.","meaning":"Boolean indicating whether the patient is currently exposed to steroid."} ;; "steroid"
(declare-const patient_is_exposed_to_steroid_now@@for_this_attack Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to steroid is specifically for the treatment of this attack.","when_to_set_to_false":"Set to false if the patient's current exposure to steroid is not for the treatment of this attack.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to steroid is for the treatment of this attack.","meaning":"Boolean indicating whether the patient's current exposure to steroid is for the treatment of this attack."} ;; "treated with steroid for this attack"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_steroid_now@@for_this_attack
      patient_is_exposed_to_steroid_now)
:named REQ8_AUXILIARY0)) ;; "treated with steroid for this attack"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_exposed_to_steroid_now@@for_this_attack)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was treated with steroid for this attack."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_continuous_monitoring_at_home_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing continuous monitoring at home.","when_to_set_to_false":"Set to false if the patient is currently not undergoing continuous monitoring at home.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing continuous monitoring at home.","meaning":"Boolean indicating whether the patient is currently undergoing continuous monitoring at home."} ;; "continuous monitoring of the patient at home"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_continuous_monitoring_at_home_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if there is NOT continuous monitoring of the patient at home."
