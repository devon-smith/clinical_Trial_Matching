;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_fulfills_all_listed_criteria Bool) ;; {"when_to_set_to_true": "Set to true if the patient fulfills all of the listed criteria required for inclusion.", "when_to_set_to_false": "Set to false if the patient does not fulfill all of the listed criteria required for inclusion.", "when_to_set_to_null": "Set to null if it is unknown whether the patient fulfills all of the listed criteria.", "meaning": "Indicates whether the patient fulfills all of the listed criteria for inclusion."} ;; "To be included, the patient must fulfil all of the listed criteria."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_fulfills_all_listed_criteria
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must fulfil all of the listed criteria."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "be female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} ;; "be male"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; To be included, the patient must ((be female) OR ((be male) AND (be aged ≥ 18 years))).
(assert
  (! (or patient_sex_is_female_now
         (and patient_sex_is_male_now (>= patient_age_value_recorded_now_in_years 18)))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be female) OR ((be male) AND (be aged ≥ 18 years)))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_information_letter_sent_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if a patient information letter has been sent to the patient by the investigator.","when_to_set_to_false":"Set to false if a patient information letter has not been sent to the patient by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a patient information letter has been sent to the patient by the investigator.","meaning":"Boolean indicating whether a patient information letter has been sent to the patient by the investigator."} ;; "To be included, the patient must have been sent a patient information letter by the investigator."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_information_letter_sent_by_investigator
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have been sent a patient information letter by the investigator."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_been_discharged_alive_from_hospital_to_home_following_acute_coronary_syndrome_event Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been discharged alive from the hospital to home after an acute coronary syndrome event.","when_to_set_to_false":"Set to false if the patient has not been discharged alive from the hospital to home after an acute coronary syndrome event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been discharged alive from the hospital to home following an acute coronary syndrome event.","meaning":"Boolean indicating whether the patient has been discharged alive from the hospital to home following an acute coronary syndrome event."} ;; "have been discharged alive from the hospital to home following an acute coronary syndrome event"
(declare-const patient_has_finding_of_acute_coronary_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an acute coronary syndrome event in their history.","when_to_set_to_false":"Set to false if the patient has never had an acute coronary syndrome event in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an acute coronary syndrome event in their history.","meaning":"Boolean indicating whether the patient has ever had an acute coronary syndrome event in their history."} ;; "acute coronary syndrome event"
(declare-const patient_has_finding_of_acute_coronary_syndrome_inthehistory@@diagnosed_as_st_elevation_myocardial_infarction_or_non_st_elevation_myocardial_infarction_or_unstable_angina Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute coronary syndrome event in their history was diagnosed as ST elevation myocardial infarction, non-ST elevation myocardial infarction, or unstable angina.","when_to_set_to_false":"Set to false if the patient's acute coronary syndrome event in their history was not diagnosed as any of these subtypes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute coronary syndrome event was diagnosed as one of these subtypes.","meaning":"Boolean indicating whether the patient's acute coronary syndrome event in their history was diagnosed as STEMI, NSTEMI, or unstable angina."} ;; "diagnosed as (ST elevation myocardial infarction OR non-ST elevation myocardial infarction OR unstable angina)"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_acute_coronary_syndrome_inthehistory@@diagnosed_as_st_elevation_myocardial_infarction_or_non_st_elevation_myocardial_infarction_or_unstable_angina
         patient_has_finding_of_acute_coronary_syndrome_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "diagnosed as (ST elevation myocardial infarction OR non-ST elevation myocardial infarction OR unstable angina)" implies "acute coronary syndrome event in history"

;; Discharge event requires qualifying ACS event
(assert
  (! (=> patient_has_been_discharged_alive_from_hospital_to_home_following_acute_coronary_syndrome_event
         patient_has_finding_of_acute_coronary_syndrome_inthehistory@@diagnosed_as_st_elevation_myocardial_infarction_or_non_st_elevation_myocardial_infarction_or_unstable_angina)
     :named REQ3_AUXILIARY1)) ;; "discharged alive from hospital to home following ACS event" requires ACS event diagnosed as STEMI, NSTEMI, or unstable angina

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_been_discharged_alive_from_hospital_to_home_following_acute_coronary_syndrome_event
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have been discharged alive from the hospital to home following an acute coronary syndrome event diagnosed as (ST elevation myocardial infarction OR non-ST elevation myocardial infarction OR unstable angina)."

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_unstable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of unstable angina as the acute coronary syndrome event.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of unstable angina as the acute coronary syndrome event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of unstable angina as the acute coronary syndrome event.","meaning":"Boolean indicating whether the patient currently has a diagnosis of unstable angina as the acute coronary syndrome event."} ;; "unstable angina"
(declare-const patient_has_finding_of_type_1_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Type 1 (spontaneous) myocardial infarction as the acute coronary syndrome event.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Type 1 (spontaneous) myocardial infarction as the acute coronary syndrome event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Type 1 (spontaneous) myocardial infarction as the acute coronary syndrome event.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Type 1 (spontaneous) myocardial infarction as the acute coronary syndrome event."} ;; "myocardial infarction of Type 1 (spontaneous myocardial infarction related to ischemia due to a primary coronary event...)"
(declare-const patient_has_finding_of_type_1_myocardial_infarction_now@@related_to_primary_coronary_event Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current Type 1 myocardial infarction is related to a primary coronary event.","when_to_set_to_false":"Set to false if the patient's current Type 1 myocardial infarction is not related to a primary coronary event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current Type 1 myocardial infarction is related to a primary coronary event.","meaning":"Boolean indicating whether the patient's current Type 1 myocardial infarction is related to a primary coronary event."} ;; "spontaneous myocardial infarction related to ischemia due to a primary coronary event"
(declare-const patient_has_finding_of_type_1_myocardial_infarction_now@@due_to_ischemia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current Type 1 myocardial infarction is due to ischemia.","when_to_set_to_false":"Set to false if the patient's current Type 1 myocardial infarction is not due to ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current Type 1 myocardial infarction is due to ischemia.","meaning":"Boolean indicating whether the patient's current Type 1 myocardial infarction is due to ischemia."} ;; "spontaneous myocardial infarction related to ischemia"
(declare-const patient_has_finding_of_type_1_myocardial_infarction_now@@with_coronary_plaque_erosion_or_rupture_or_fissuring_or_dissection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current Type 1 myocardial infarction is associated with coronary plaque erosion, rupture, fissuring, or dissection.","when_to_set_to_false":"Set to false if the patient's current Type 1 myocardial infarction is not associated with coronary plaque erosion, rupture, fissuring, or dissection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current Type 1 myocardial infarction is associated with coronary plaque erosion, rupture, fissuring, or dissection.","meaning":"Boolean indicating whether the patient's current Type 1 myocardial infarction is associated with coronary plaque erosion, rupture, fissuring, or dissection."} ;; "coronary plaque erosion OR coronary plaque rupture OR coronary plaque fissuring OR coronary plaque dissection"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_finding_of_type_1_myocardial_infarction_now@@related_to_primary_coronary_event
         patient_has_finding_of_type_1_myocardial_infarction_now)
     :named REQ4_AUXILIARY0)) ;; "spontaneous myocardial infarction related to ischemia due to a primary coronary event"

(assert
  (! (=> patient_has_finding_of_type_1_myocardial_infarction_now@@due_to_ischemia
         patient_has_finding_of_type_1_myocardial_infarction_now)
     :named REQ4_AUXILIARY1)) ;; "spontaneous myocardial infarction related to ischemia"

(assert
  (! (=> patient_has_finding_of_type_1_myocardial_infarction_now@@with_coronary_plaque_erosion_or_rupture_or_fissuring_or_dissection
         patient_has_finding_of_type_1_myocardial_infarction_now)
     :named REQ4_AUXILIARY2)) ;; "coronary plaque erosion OR coronary plaque rupture OR coronary plaque fissuring OR coronary plaque dissection"

;; Exhaustive subcategories for primary coronary event: plaque erosion, rupture, fissuring, dissection
;; (coronary plaque erosion OR rupture OR fissuring OR dissection) ≡ with_coronary_plaque_erosion_or_rupture_or_fissuring_or_dissection
;; (This is already encoded in the variable meaning and declaration.)

;; Type 1 MI definition: must be spontaneous MI related to ischemia due to a primary coronary event with exhaustive subcategories
(assert
  (! (= patient_has_finding_of_type_1_myocardial_infarction_now
        (and patient_has_finding_of_type_1_myocardial_infarction_now@@related_to_primary_coronary_event
             patient_has_finding_of_type_1_myocardial_infarction_now@@due_to_ischemia
             patient_has_finding_of_type_1_myocardial_infarction_now@@with_coronary_plaque_erosion_or_rupture_or_fissuring_or_dissection))
     :named REQ4_AUXILIARY3)) ;; "myocardial infarction of Type 1 (spontaneous myocardial infarction related to ischemia due to a primary coronary event with exhaustive subcategories (coronary plaque erosion OR coronary plaque rupture OR coronary plaque fissuring OR coronary plaque dissection))"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Inclusion: acute coronary syndrome event must be (unstable angina OR type 1 MI as defined above)
(assert
  (! (or patient_has_finding_of_unstable_angina_now
         patient_has_finding_of_type_1_myocardial_infarction_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient's acute coronary syndrome event must be ((unstable angina) OR (myocardial infarction of Type 1 ...))"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_acute_coronary_syndrome_event_occurred_date_in_iso8601 Real) ;; {"when_to_set_to_value":"Set to the date (in ISO 8601 format) when the patient's acute coronary syndrome event occurred, if known.","when_to_set_to_null":"Set to null if the date of the acute coronary syndrome event is unknown, not documented, or cannot be determined.","meaning":"The date (in ISO 8601 format) on which the patient's acute coronary syndrome event occurred."} ;; "the patient's acute coronary syndrome event must have occurred (after 1st July 2012) AND (before 1st June 2013)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (> patient_has_acute_coronary_syndrome_event_occurred_date_in_iso8601 2012.0701)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient's acute coronary syndrome event must have occurred after 1st July 2012"

(assert
  (! (< patient_has_acute_coronary_syndrome_event_occurred_date_in_iso8601 2013.0601)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient's acute coronary syndrome event must have occurred before 1st June 2013"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_taking_clopidogrel_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a clopidogrel-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a clopidogrel-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a clopidogrel-containing product.","meaning":"Boolean indicating whether the patient is currently taking a clopidogrel-containing product."} ;; "clopidogrel treatment"
(declare-const patient_is_taking_clopidogrel_containing_product_now@@at_discharge_following_acute_coronary_syndrome_event Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a clopidogrel-containing product specifically at the time of discharge following an acute coronary syndrome event.","when_to_set_to_false":"Set to false if the patient is not taking a clopidogrel-containing product at discharge following an acute coronary syndrome event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is taking a clopidogrel-containing product at discharge following an acute coronary syndrome event.","meaning":"Boolean indicating whether the patient is currently taking a clopidogrel-containing product at discharge following an acute coronary syndrome event."} ;; "clopidogrel treatment at discharge following an acute coronary syndrome event"
(declare-const patient_is_taking_prasugrel_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a prasugrel-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a prasugrel-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a prasugrel-containing product.","meaning":"Boolean indicating whether the patient is currently taking a prasugrel-containing product."} ;; "prasugrel treatment"
(declare-const patient_is_taking_prasugrel_containing_product_now@@at_discharge_following_acute_coronary_syndrome_event Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a prasugrel-containing product specifically at the time of discharge following an acute coronary syndrome event.","when_to_set_to_false":"Set to false if the patient is not taking a prasugrel-containing product at discharge following an acute coronary syndrome event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is taking a prasugrel-containing product at discharge following an acute coronary syndrome event.","meaning":"Boolean indicating whether the patient is currently taking a prasugrel-containing product at discharge following an acute coronary syndrome event."} ;; "prasugrel treatment at discharge following an acute coronary syndrome event"
(declare-const patient_is_taking_ticagrelor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a ticagrelor-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a ticagrelor-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a ticagrelor-containing product.","meaning":"Boolean indicating whether the patient is currently taking a ticagrelor-containing product."} ;; "ticagrelor treatment"
(declare-const patient_is_taking_ticagrelor_containing_product_now@@at_discharge_following_acute_coronary_syndrome_event Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a ticagrelor-containing product specifically at the time of discharge following an acute coronary syndrome event.","when_to_set_to_false":"Set to false if the patient is not taking a ticagrelor-containing product at discharge following an acute coronary syndrome event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is taking a ticagrelor-containing product at discharge following an acute coronary syndrome event.","meaning":"Boolean indicating whether the patient is currently taking a ticagrelor-containing product at discharge following an acute coronary syndrome event."} ;; "ticagrelor treatment at discharge following an acute coronary syndrome event"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_is_taking_clopidogrel_containing_product_now@@at_discharge_following_acute_coronary_syndrome_event
         patient_is_taking_clopidogrel_containing_product_now)
     :named REQ6_AUXILIARY0)) ;; "clopidogrel treatment at discharge following an acute coronary syndrome event"

(assert
  (! (=> patient_is_taking_prasugrel_containing_product_now@@at_discharge_following_acute_coronary_syndrome_event
         patient_is_taking_prasugrel_containing_product_now)
     :named REQ6_AUXILIARY1)) ;; "prasugrel treatment at discharge following an acute coronary syndrome event"

(assert
  (! (=> patient_is_taking_ticagrelor_containing_product_now@@at_discharge_following_acute_coronary_syndrome_event
         patient_is_taking_ticagrelor_containing_product_now)
     :named REQ6_AUXILIARY2)) ;; "ticagrelor treatment at discharge following an acute coronary syndrome event"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must be (on ticagrelor treatment OR on prasugrel treatment OR on clopidogrel treatment) at discharge following an acute coronary syndrome event.
(assert
  (! (or patient_is_taking_ticagrelor_containing_product_now@@at_discharge_following_acute_coronary_syndrome_event
         patient_is_taking_prasugrel_containing_product_now@@at_discharge_following_acute_coronary_syndrome_event
         patient_is_taking_clopidogrel_containing_product_now@@at_discharge_following_acute_coronary_syndrome_event)
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (on ticagrelor treatment OR on prasugrel treatment OR on clopidogrel treatment) at discharge following an acute coronary syndrome event."
