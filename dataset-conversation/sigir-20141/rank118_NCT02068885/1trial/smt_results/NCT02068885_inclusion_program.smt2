;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 65 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 65 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value in kilograms per square meter if a current measurement is available.","when_to_set_to_null":"Set to null if no current BMI measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} // "body mass index"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have body mass index ≥ 25 kilograms per square meter.
(assert
  (! (>= patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 25.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body mass index ≥ 25 kilograms per square meter."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_body_weight_value_recorded_now_withunit_pounds Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body weight in pounds is recorded now.","when_to_set_to_null":"Set to null if no current measurement of body weight in pounds is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body weight in pounds."} // "body weight ≤ 425 pounds"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (<= patient_body_weight_value_recorded_now_withunit_pounds 425.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have body weight ≤ 425 pounds."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_medical_clearance_from_primary_care_provider_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has medical clearance that is provided by a primary care provider.","when_to_set_to_false":"Set to false if the patient currently does not have medical clearance from a primary care provider.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has medical clearance from a primary care provider.","meaning":"Boolean indicating whether the patient currently has medical clearance from a primary care provider."} // "the patient must have medical clearance from a primary care provider"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_medical_clearance_from_primary_care_provider_now
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have medical clearance from a primary care provider"

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_is_campus_based_faculty Bool) ;; {"when_to_set_to_true":"Set to true if the patient is campus-based faculty.","when_to_set_to_false":"Set to false if the patient is not campus-based faculty.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is campus-based faculty.","meaning":"Boolean indicating whether the patient is campus-based faculty."} // "be campus-based faculty"
(declare-const patient_is_campus_based_staff Bool) ;; {"when_to_set_to_true":"Set to true if the patient is campus-based staff.","when_to_set_to_false":"Set to false if the patient is not campus-based staff.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is campus-based staff.","meaning":"Boolean indicating whether the patient is campus-based staff."} // "be campus-based staff"
(declare-const patient_is_campus_based_student Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a campus-based student.","when_to_set_to_false":"Set to false if the patient is not a campus-based student.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a campus-based student.","meaning":"Boolean indicating whether the patient is a campus-based student."} // "be a campus-based student"
(declare-const patient_is_community_based_participant Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a community-based participant.","when_to_set_to_false":"Set to false if the patient is not a community-based participant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a community-based participant.","meaning":"Boolean indicating whether the patient is a community-based participant."} // "be a community-based participant"
(declare-const patient_lives_in_greater_framingham_area_throughout_academic_year_of_enrollment_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient lives in the greater Framingham area for the entire academic year during which they are enrolled in the study.","when_to_set_to_false":"Set to false if the patient does not live in the greater Framingham area for the entire academic year of enrollment in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient lives in the greater Framingham area throughout the academic year of enrollment in the study.","meaning":"Boolean indicating whether the patient lives in the greater Framingham area throughout the academic year of enrollment in the study."} // "live in the greater Framingham area throughout the academic year of enrollment in the study"
(declare-const patient_plans_to_matriculate_at_framingham_state_university_throughout_academic_year_of_enrollment_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient plans to matriculate at Framingham State University for the entire academic year during which they are enrolled in the study.","when_to_set_to_false":"Set to false if the patient does not plan to matriculate at Framingham State University for the entire academic year of enrollment in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient plans to matriculate at Framingham State University throughout the academic year of enrollment in the study.","meaning":"Boolean indicating whether the patient plans to matriculate at Framingham State University throughout the academic year of enrollment in the study."} // "plan to matriculate at Framingham State University throughout the academic year of enrollment in the study"
(declare-const patient_works_on_campus_throughout_academic_year_of_enrollment_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient works on campus for the entire academic year during which they are enrolled in the study.","when_to_set_to_false":"Set to false if the patient does not work on campus for the entire academic year of enrollment in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient works on campus throughout the academic year of enrollment in the study.","meaning":"Boolean indicating whether the patient works on campus throughout the academic year of enrollment in the study."} // "work on campus throughout the academic year of enrollment in the study"

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient must ((plan to matriculate at Framingham State University throughout the academic year of enrollment in the study AND be a campus-based student)
;; OR (work on campus throughout the academic year of enrollment in the study AND (be campus-based faculty OR campus-based staff))
;; OR (live in the greater Framingham area throughout the academic year of enrollment in the study AND be a community-based participant)).
(assert
  (! (or
        (and patient_plans_to_matriculate_at_framingham_state_university_throughout_academic_year_of_enrollment_in_study
             patient_is_campus_based_student)
        (and patient_works_on_campus_throughout_academic_year_of_enrollment_in_study
             (or patient_is_campus_based_faculty patient_is_campus_based_staff))
        (and patient_lives_in_greater_framingham_area_throughout_academic_year_of_enrollment_in_study
             patient_is_community_based_participant))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((plan to matriculate at Framingham State University throughout the academic year of enrollment in the study AND be a campus-based student) OR (work on campus throughout the academic year of enrollment in the study AND be campus-based faculty OR campus-based staff) OR (live in the greater Framingham area throughout the academic year of enrollment in the study AND be a community-based participant))."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_academic_clearance_from_framingham_state_university_office_of_enrollment_and_student_development Bool) ;; {"when_to_set_to_true":"Set to true if the patient has academic clearance from the Framingham State University Office of Enrollment and Student Development.","when_to_set_to_false":"Set to false if the patient does not have academic clearance from the Framingham State University Office of Enrollment and Student Development.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has academic clearance from the Framingham State University Office of Enrollment and Student Development.","meaning":"Boolean indicating whether the patient has academic clearance from the Framingham State University Office of Enrollment and Student Development."} // "have academic clearance from the Framingham State University Office of Enrollment and Student Development"
(declare-const patient_has_social_clearance_from_framingham_state_university_office_of_enrollment_and_student_development Bool) ;; {"when_to_set_to_true":"Set to true if the patient has social clearance from the Framingham State University Office of Enrollment and Student Development.","when_to_set_to_false":"Set to false if the patient does not have social clearance from the Framingham State University Office of Enrollment and Student Development.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has social clearance from the Framingham State University Office of Enrollment and Student Development.","meaning":"Boolean indicating whether the patient has social clearance from the Framingham State University Office of Enrollment and Student Development."} // "have social clearance from the Framingham State University Office of Enrollment and Student Development"
(declare-const patient_is_student_participant Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a student participant.","when_to_set_to_false":"Set to false if the patient is not a student participant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a student participant.","meaning":"Boolean indicating whether the patient is a student participant."} // "be a student participant"
(declare-const patient_is_willing_to_comply_with_criminal_offender_record_information_check Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to comply with Criminal Offender Record Information check.","when_to_set_to_false":"Set to false if the patient is not willing to comply with Criminal Offender Record Information check.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to comply with Criminal Offender Record Information check.","meaning":"Boolean indicating whether the patient is willing to comply with Criminal Offender Record Information check."} // "be willing to comply with Criminal Offender Record Information check"
(declare-const patient_is_willing_to_comply_with_sex_offender_registry_information_check Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to comply with Sex Offender Registry Information check.","when_to_set_to_false":"Set to false if the patient is not willing to comply with Sex Offender Registry Information check.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to comply with Sex Offender Registry Information check.","meaning":"Boolean indicating whether the patient is willing to comply with Sex Offender Registry Information check."} // "be willing to comply with Sex Offender Registry Information check"
(declare-const patient_is_community_based_subject Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a community-based subject.","when_to_set_to_false":"Set to false if the patient is not a community-based subject.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a community-based subject.","meaning":"Boolean indicating whether the patient is a community-based subject."} // "be a community-based subject"

;; ===================== Constraint Assertions (REQ 5) =====================
;; The patient must ((have academic clearance AND social clearance AND be a student participant) OR (be willing to comply with CORI check AND SORI check AND be a community-based subject))
(assert
  (! (or (and patient_has_academic_clearance_from_framingham_state_university_office_of_enrollment_and_student_development
              patient_has_social_clearance_from_framingham_state_university_office_of_enrollment_and_student_development
              patient_is_student_participant)
         (and patient_is_willing_to_comply_with_criminal_offender_record_information_check
              patient_is_willing_to_comply_with_sex_offender_registry_information_check
              patient_is_community_based_subject))
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must ((have academic clearance from the Framingham State University Office of Enrollment and Student Development AND have social clearance from the Framingham State University Office of Enrollment and Student Development AND be a student participant) OR (be willing to comply with Criminal Offender Record Information check AND be willing to comply with Sex Offender Registry Information check AND be a community-based subject))."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_willing_to_eat_only_foods_on_study_menus_during_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to eat only the foods that are on the study menus during participation.","when_to_set_to_false":"Set to false if the patient is not willing to eat only the foods that are on the study menus during participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to eat only the foods that are on the study menus during participation.","meaning":"Boolean indicating whether the patient is willing to eat only the foods that are on the study menus during the period of participation."} // "be willing to eat only the foods on the study menus during participation"
(declare-const patient_is_willing_to_drink_only_beverages_on_study_menus_during_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to drink only the beverages that are on the study menus during participation.","when_to_set_to_false":"Set to false if the patient is not willing to drink only the beverages that are on the study menus during participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to drink only the beverages that are on the study menus during participation.","meaning":"Boolean indicating whether the patient is willing to drink only the beverages that are on the study menus during the period of participation."} // "be willing to drink only the beverages on the study menus during participation"
(declare-const patient_has_finding_of_allergy_to_food_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any allergy to food.","when_to_set_to_false":"Set to false if the patient currently does not have any allergy to food.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any allergy to food.","meaning":"Boolean indicating whether the patient currently has any allergy to food."} // "NOT have any food allergy"
(declare-const patient_has_finding_of_aversion_to_particular_food_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any aversion to particular foods.","when_to_set_to_false":"Set to false if the patient currently does not have any aversion to particular foods.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any aversion to particular foods.","meaning":"Boolean indicating whether the patient currently has any aversion to particular foods."} // "NOT have any food aversion"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: "be willing to eat only the foods on the study menus during participation"
(assert
  (! patient_is_willing_to_eat_only_foods_on_study_menus_during_participation
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be willing to eat only the foods on the study menus during participation"

;; Component 1: "be willing to drink only the beverages on the study menus during participation"
(assert
  (! patient_is_willing_to_drink_only_beverages_on_study_menus_during_participation
     :named REQ6_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be willing to drink only the beverages on the study menus during participation"

;; Component 2: "NOT have any food allergy"
(assert
  (! (not patient_has_finding_of_allergy_to_food_now)
     :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "NOT have any food allergy"

;; Component 3: "NOT have any food aversion"
(assert
  (! (not patient_has_finding_of_aversion_to_particular_food_now)
     :named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "NOT have any food aversion"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_willing_to_eat_in_dining_hall_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to eat in the dining hall.","when_to_set_to_false":"Set to false if the patient is currently not willing to eat in the dining hall.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to eat in the dining hall.","meaning":"Boolean indicating whether the patient is currently willing to eat in the dining hall."} // "the patient must be willing to eat in the dining hall"
(declare-const patient_is_willing_to_eat_in_dining_hall_now@@dining_hall_is_location_where_patient_must_eat Bool) ;; {"when_to_set_to_true":"Set to true if the dining hall is the location where the patient must eat.","when_to_set_to_false":"Set to false if the dining hall is not the location where the patient must eat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dining hall is the location where the patient must eat.","meaning":"Boolean indicating whether the dining hall is the location where the patient must eat."} // "the patient must be willing to eat in the dining hall"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_is_willing_to_eat_in_dining_hall_now@@dining_hall_is_location_where_patient_must_eat
         patient_is_willing_to_eat_in_dining_hall_now)
     :named REQ7_AUXILIARY0)) ;; "the patient must be willing to eat in the dining hall"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_is_willing_to_eat_in_dining_hall_now
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to eat in the dining hall"

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_finding_of_alcohol_intake_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently consuming alcohol.","when_to_set_to_false":"Set to false if the patient is currently abstaining from alcohol consumption.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently consuming alcohol.","meaning":"Boolean indicating whether the patient is currently consuming alcohol."} // "alcohol consumption"
(declare-const patient_has_finding_of_alcohol_intake_finding_now@@during_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently consuming alcohol during the period of study participation.","when_to_set_to_false":"Set to false if the patient is abstaining from alcohol consumption during the period of study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is consuming alcohol during study participation.","meaning":"Boolean indicating whether the patient is currently consuming alcohol during study participation."} // "abstain from alcohol consumption during participation"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_alcohol_intake_finding_now@@during_study_participation
         patient_has_finding_of_alcohol_intake_finding_now)
     :named REQ8_AUXILIARY0)) ;; "abstain from alcohol consumption during participation"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: patient must be willing to abstain from alcohol consumption during participation
(assert
  (! (not patient_has_finding_of_alcohol_intake_finding_now@@during_study_participation)
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be willing to abstain from alcohol consumption during participation"
