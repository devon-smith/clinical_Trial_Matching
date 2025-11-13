;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_attends_community_based_child_care_center_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently attends a community-based child care center.","when_to_set_to_false":"Set to false if the patient currently does not attend a community-based child care center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently attends a community-based child care center.","meaning":"Boolean indicating whether the patient currently attends a community-based child care center."} // "the patient must attend a community-based child care center"
(declare-const patient_attends_community_based_child_care_center_now@@located_in_urban_area_in_north_carolina_or_urban_area_in_california_or_urban_area_in_connecticut Bool) ;; {"when_to_set_to_true":"Set to true if the community-based child care center attended by the patient is located in an urban area in North Carolina, California, or Connecticut.","when_to_set_to_false":"Set to false if the community-based child care center attended by the patient is not located in an urban area in North Carolina, California, or Connecticut.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the community-based child care center attended by the patient is located in an urban area in North Carolina, California, or Connecticut.","meaning":"Boolean indicating whether the community-based child care center attended by the patient is located in an urban area in North Carolina, California, or Connecticut."} // "located in (an urban area in North Carolina OR an urban area in California OR an urban area in Connecticut)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_attends_community_based_child_care_center_now@@located_in_urban_area_in_north_carolina_or_urban_area_in_california_or_urban_area_in_connecticut
         patient_attends_community_based_child_care_center_now)
     :named REQ0_AUXILIARY0)) ;; "the patient must attend a community-based child care center located in (an urban area in North Carolina OR an urban area in California OR an urban area in Connecticut)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_attends_community_based_child_care_center_now@@located_in_urban_area_in_north_carolina_or_urban_area_in_california_or_urban_area_in_connecticut
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must attend a community-based child care center located in (an urban area in North Carolina OR an urban area in California OR an urban area in Connecticut)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_attends_community_based_child_care_center_now@@has_english_speaking_director Bool) ;; {"when_to_set_to_true":"Set to true if the community-based child care center attended by the patient currently has an English-speaking director.","when_to_set_to_false":"Set to false if the community-based child care center attended by the patient does not have an English-speaking director.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the community-based child care center attended by the patient has an English-speaking director.","meaning":"Boolean indicating whether the community-based child care center attended by the patient has an English-speaking director."} // "an English-speaking director"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_attends_community_based_child_care_center_now@@has_english_speaking_director
         patient_attends_community_based_child_care_center_now)
     :named REQ1_AUXILIARY0)) ;; "the patient must attend a child care center with an English-speaking director"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_attends_community_based_child_care_center_now@@has_english_speaking_director
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must attend a child care center with an English-speaking director"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_attends_community_based_child_care_center_now@@child_care_center_has_kitchen Bool) ;; {"when_to_set_to_true":"Set to true if the child care center attended by the patient currently has a kitchen.","when_to_set_to_false":"Set to false if the child care center attended by the patient does not have a kitchen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the child care center attended by the patient has a kitchen.","meaning":"Boolean indicating whether the child care center attended by the patient currently has a kitchen."} // "a child care center that has a kitchen"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_attends_community_based_child_care_center_now@@child_care_center_has_kitchen
         patient_attends_community_based_child_care_center_now)
     :named REQ2_AUXILIARY0)) ;; "the patient must attend a child care center that has a kitchen"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_attends_community_based_child_care_center_now@@child_care_center_has_kitchen
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must attend a child care center that has a kitchen"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const child_care_center_population_of_children_aged_2_to_5_years_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the current population count of children aged 2 to 5 years at the child care center attended by the patient, if known and documented.","when_to_set_to_null":"Set to null if the current population count of children aged 2 to 5 years at the attended child care center is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the current population count of children aged 2 to 5 years at the child care center attended by the patient."} // "a population of children between the ages of 2 years and 5 years ≥ 50 AND ≤ 60"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "children between the ages of 2 years and 5 years"
(declare-const patient_attends_community_based_child_care_center_now@@population_of_children_aged_2_to_5_years_between_50_and_60 Bool) ;; {"when_to_set_to_true":"Set to true if the attended child care center has a population of children aged 2 to 5 years that is at least 50 and at most 60.","when_to_set_to_false":"Set to false if the attended child care center does not have a population of children aged 2 to 5 years between 50 and 60.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the attended child care center has a population of children aged 2 to 5 years between 50 and 60.","meaning":"Boolean indicating whether the attended child care center has a population of children aged 2 to 5 years between 50 and 60."} // "a population of children between the ages of 2 years and 5 years ≥ 50 AND ≤ 60"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition in the requirement: population constraint for qualifier variable
(assert
  (! (= patient_attends_community_based_child_care_center_now@@population_of_children_aged_2_to_5_years_between_50_and_60
        (and (>= child_care_center_population_of_children_aged_2_to_5_years_value_recorded_now_withunit_count 50)
             (<= child_care_center_population_of_children_aged_2_to_5_years_value_recorded_now_withunit_count 60)))
     :named REQ3_AUXILIARY0)) ;; "a population of children between the ages of 2 years and 5 years ≥ 50 AND ≤ 60"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_attends_community_based_child_care_center_now@@population_of_children_aged_2_to_5_years_between_50_and_60
         patient_attends_community_based_child_care_center_now)
     :named REQ3_AUXILIARY1)) ;; "the patient must attend a child care center"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: patient must attend a child care center with population of children aged 2-5 years between 50 and 60
(assert
  (! (and patient_attends_community_based_child_care_center_now
          patient_attends_community_based_child_care_center_now@@population_of_children_aged_2_to_5_years_between_50_and_60)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must attend a child care center with a population of children between the ages of 2 years and 5 years ≥ 50 AND ≤ 60"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_child_care_center_proportion_of_children_eligible_for_subsidy_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if the proportion of children eligible for subsidy at the child care center attended by the patient is recorded now.","when_to_set_to_null":"Set to null if no such percentage measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the proportion of children eligible for subsidy at the child care center attended by the patient, recorded now."} // "the proportion of children eligible for subsidy ≥ 35 percent"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (and patient_attends_community_based_child_care_center_now
          (>= patient_child_care_center_proportion_of_children_eligible_for_subsidy_value_recorded_now_withunit_percent 35.0))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must attend a child care center in which the proportion of children eligible for subsidy ≥ 35 percent"
