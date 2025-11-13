;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female now.","when_to_set_to_false":"Set to false if the patient's sex is documented as male or documented as a sex other than female now.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean indicating whether the patient's sex is female now."}
;; Motivated by requirement text: "a woman"

(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}
;; Motivated by requirement text: "age ≥ 40 years AND age ≤ 69 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_sex_is_female_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE))
;; Motivated by requirement text: "the patient must be (a woman)."

(assert
  (! (>= patient_age_value_recorded_now_in_years 40.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS))
;; Motivated by requirement text: "age ≥ 40 years"

(assert
  (! (<= patient_age_value_recorded_now_in_years 69.0)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS))
;; Motivated by requirement text: "age ≤ 69 years"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the numeric BMI (kg/m^2) measured or recorded for the patient now.","when_to_set_to_null":"Set to null if no BMI value recorded now is available or the value is indeterminate.","meaning":"Numeric BMI (kg/m^2) recorded now."}
;; "body mass index"
(declare-const patient_has_finding_of_obesity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of obesity.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of obesity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of obesity.","meaning":"Boolean indicating whether the patient currently has obesity."}
;; "have class I obesity" and "have class II obesity"
(declare-const patient_has_finding_of_obesity_now@@class_is_class_i Bool) ;; {"when_to_set_to_true":"Set to true if the patient's obesity classification is documented as class I.","when_to_set_to_false":"Set to false if the patient's obesity classification is not class I.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's obesity classification is class I.","meaning":"Boolean indicating whether the patient's obesity is classified as class I."}
;; "class I obesity"
(declare-const patient_has_finding_of_obesity_now@@class_is_class_ii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's obesity classification is documented as class II.","when_to_set_to_false":"Set to false if the patient's obesity classification is not class II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's obesity classification is class II.","meaning":"Boolean indicating whether the patient's obesity is classified as class II."}
;; "class II obesity"
(declare-const patient_has_finding_of_overweight_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of overweight.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of overweight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of overweight.","meaning":"Boolean indicating whether the patient currently has overweight."}
;; "be overweight"
(declare-const patient_has_physician_clearance_now Bool) ;; {"when_to_set_to_true":"Set to true if the physician has provided clearance for the patient now.","when_to_set_to_false":"Set to false if the physician has not provided clearance for the patient now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the physician has provided clearance for the patient now.","meaning":"Boolean indicating whether the physician has provided clearance for the patient now."}
;; "physician clearance"

;; ===================== Auxiliary Assertions (REQ 1) =====================
(assert
  (! (=> patient_has_finding_of_obesity_now@@class_is_class_i
         patient_has_finding_of_obesity_now)
     :named REQ1_AUXILIARY0))
;; "have class I obesity"
(assert
  (! (=> patient_has_finding_of_obesity_now@@class_is_class_ii
         patient_has_finding_of_obesity_now)
     :named REQ1_AUXILIARY1))
;; "have class II obesity"

;; Helper boolean terms for the disjunctive options
(define-fun overweight_condition_satisfied () Bool
  patient_has_finding_of_overweight_now)
;; "be overweight"

(define-fun class_i_obesity_condition_satisfied () Bool
  (and patient_has_finding_of_obesity_now@@class_is_class_i
       (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 28.0)
       (<= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 39.9)))
;; "have class I obesity (body mass index ≥ 28 and ≤ 39.9)"

(define-fun class_ii_obesity_condition_satisfied () Bool
  (and patient_has_finding_of_obesity_now@@class_is_class_ii
       (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 28.0)
       (<= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 39.9)))
;; "have class II obesity (body mass index ≥ 28 and ≤ 39.9)"

(define-fun bmi_40_to_45_with_physician_clearance_condition_satisfied () Bool
  (and (>= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 40.0)
       (<= patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 45.0)
       patient_has_physician_clearance_now))
;; "(have a body mass index ≥ 40 and ≤ 45) AND (physician clearance)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or overweight_condition_satisfied
         class_i_obesity_condition_satisfied
         class_ii_obesity_condition_satisfied
         bmi_40_to_45_with_physician_clearance_condition_satisfied)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS))
;; "To be included, the patient must ((be overweight) OR (have class I obesity (body mass index ≥ 28 and ≤ 39.9)) OR (have class II obesity (body mass index ≥ 28 and ≤ 39.9)) OR ((have a body mass index ≥ 40 and ≤ 45) AND (physician clearance)))."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_states_commitment_to_losing_weight Bool) ;; {"when_to_set_to_true":"Set to true if the patient explicitly states a commitment to losing weight.","when_to_set_to_false":"Set to false if there is explicit documentation that the patient does not state a commitment to losing weight (e.g., denies commitment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient states a commitment to losing weight.","meaning":"Boolean indicating whether the patient states a commitment to losing weight."}
;; "must state a commitment to losing weight."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_states_commitment_to_losing_weight
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS))
;; "must state a commitment to losing weight."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_is_able_to_speak_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to speak English.","when_to_set_to_false":"Set to false if the patient is currently not able to speak English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to speak English.","meaning":"Boolean indicating whether the patient is currently able to speak English."} ;; "speak English"
(declare-const patient_is_able_to_read_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to read English.","when_to_set_to_false":"Set to false if the patient is currently not able to read English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to read English.","meaning":"Boolean indicating whether the patient is currently able to read English."} ;; "read English"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_able_to_speak_english_now
     :named        REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (speak English)."

(assert
  (! patient_is_able_to_read_english_now
     :named        REQ3_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (read English)."

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_is_able_to_communicate_over_the_telephone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to communicate over the telephone.","when_to_set_to_false":"Set to false if the patient is currently not able to communicate over the telephone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to communicate over the telephone.","meaning":"Boolean indicating whether the patient is currently able to communicate over the telephone."}
;; "the patient must be able to communicate over the telephone."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_able_to_communicate_over_the_telephone_now
     :named        REQ4_COMPONENT0_OTHER_REQUIREMENTS))
;; "To be included, the patient must be able to communicate over the telephone."

;; ===================== Declarations for the inclusion criterion (REQ 5) =====================
(declare-const patient_is_able_to_use_a_computer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to use a computer.","when_to_set_to_false":"Set to false if the patient is currently not able to use a computer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to use a computer.","meaning":"Boolean indicating whether the patient is currently able to use a computer."} ;; "be able to use a computer"
(declare-const patient_is_able_to_use_a_computer_now@@with_minimal_assistance Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ability to use a computer is with minimal assistance.","when_to_set_to_false":"Set to false if the patient's current ability to use a computer is not with minimal assistance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ability to use a computer is with minimal assistance.","meaning":"Boolean indicating whether the patient's current ability to use a computer is with minimal assistance."} ;; "with minimal assistance"
(declare-const patient_is_able_to_complete_electronic_forms_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to complete electronic forms.","when_to_set_to_false":"Set to false if the patient is currently not able to complete electronic forms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to complete electronic forms.","meaning":"Boolean indicating whether the patient is currently able to complete electronic forms."} ;; "be able to complete electronic forms"
(declare-const patient_is_able_to_complete_electronic_surveys_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to complete electronic surveys.","when_to_set_to_false":"Set to false if the patient is currently not able to complete electronic surveys.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to complete electronic surveys.","meaning":"Boolean indicating whether the patient is currently able to complete electronic surveys."} ;; "be able to complete electronic surveys"

;; ===================== Auxiliary Assertions (REQ 5) =====================
(assert
  (! (=> patient_is_able_to_use_a_computer_now@@with_minimal_assistance
         patient_is_able_to_use_a_computer_now)
     :named        REQ5_AUXILIARY0)) ;; "be able to use a computer with minimal assistance"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_is_able_to_use_a_computer_now@@with_minimal_assistance
     :named        REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be able to use a computer with minimal assistance"

(assert
  (! patient_is_able_to_complete_electronic_forms_now
     :named        REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "be able to complete electronic forms"

(assert
  (! patient_is_able_to_complete_electronic_surveys_now
     :named        REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "be able to complete electronic surveys"

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const patient_has_access_to_the_internet_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has access to the Internet.","when_to_set_to_false":"Set to false if the patient currently does not have access to the Internet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has access to the Internet.","meaning":"Boolean indicating whether the patient currently has access to the Internet."} ;; "have access to the Internet"
(declare-const patient_is_able_to_access_the_internet_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to access the Internet.","when_to_set_to_false":"Set to false if the patient is currently not able to access the Internet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to access the Internet.","meaning":"Boolean indicating whether the patient is currently able to access the Internet."} ;; "be able to access the Internet"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_has_access_to_the_internet_now
     :named        REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have access to the Internet"
(assert
  (! patient_is_able_to_access_the_internet_now
     :named        REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "be able to access the Internet"

;; ===================== Declarations for the inclusion criterion (REQ 7) =====================
(declare-const patient_has_commitment_to_access_the_research_website_as_required_by_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a commitment to access the research website as required by the research intervention.","when_to_set_to_false":"Set to false if the patient currently does not have a commitment to access the research website as required by the research intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a commitment to access the research website as required by the research intervention.","meaning":"Boolean indicating whether the patient currently has a commitment to access the research website as required by the research intervention."}
;; "To be included, the patient must have a commitment to access the website as required by the research intervention."

(declare-const patient_self_reporting_of_calories_frequency_value_recorded_withunit_per_week Int) ;; {"when_to_set_to_value":"Set to the numeric count of times per week the patient self-reports calories via the research website.","when_to_set_to_null":"Set to null if the weekly frequency of the patient's self-reporting of calories via the research website is unknown, not documented, or cannot be determined.","meaning":"Numeric measure of the patient's frequency of self-reporting calories via the research website per week."}
;; "including (weekly self-reporting of calories)"

(declare-const patient_self_reporting_of_fat_grams_frequency_value_recorded_withunit_per_week Int) ;; {"when_to_set_to_value":"Set to the numeric count of times per week the patient self-reports fat grams via the research website.","when_to_set_to_null":"Set to null if the weekly frequency of the patient's self-reporting of fat grams via the research website is unknown, not documented, or cannot be determined.","meaning":"Numeric measure of the patient's frequency of self-reporting fat grams via the research website per week."}
;; "including (weekly self-reporting of fat grams)"

(declare-const patient_self_reporting_of_physical_activity_frequency_value_recorded_withunit_per_week Int) ;; {"when_to_set_to_value":"Set to the numeric count of times per week the patient self-reports physical activity via the research website.","when_to_set_to_null":"Set to null if the weekly frequency of the patient's self-reporting of physical activity via the research website is unknown, not documented, or cannot be determined.","meaning":"Numeric measure of the patient's frequency of self-reporting physical activity via the research website per week."}
;; "including (weekly self-reporting of physical activity)"

(declare-const patient_self_reporting_of_pedometer_steps_frequency_value_recorded_withunit_per_week Int) ;; {"when_to_set_to_value":"Set to the numeric count of times per week the patient self-reports pedometer steps via the research website.","when_to_set_to_null":"Set to null if the weekly frequency of the patient's self-reporting of pedometer steps via the research website is unknown, not documented, or cannot be determined.","meaning":"Numeric measure of the patient's frequency of self-reporting pedometer steps via the research website per week."}
;; "including (weekly self-reporting of pedometer steps)"

(declare-const patient_self_reporting_of_body_weight_frequency_value_recorded_withunit_per_week Int) ;; {"when_to_set_to_value":"Set to the numeric count of times per week the patient self-reports body weight via the research website.","when_to_set_to_null":"Set to null if the weekly frequency of the patient's self-reporting of body weight via the research website is unknown, not documented, or cannot be determined.","meaning":"Numeric measure of the patient's frequency of self-reporting body weight via the research website per week."}
;; "including (weekly self-reporting of body weight)"

(declare-const patient_participation_in_other_website_components_frequency_value_recorded_withunit_per_week Int) ;; {"when_to_set_to_value":"Set to the numeric count of times per week the patient participates in other research website components.","when_to_set_to_null":"Set to null if the weekly frequency of the patient's participation in other research website components is unknown, not documented, or cannot be determined.","meaning":"Numeric measure of the patient's frequency of participation per week in other research website components."}
;; "including (((weekly participation) OR (more often participation)) in other website components ...)"

(declare-const patient_participation_in_other_website_components_frequency_value_recorded_withunit_per_week@@as_determined_by_the_group_to_which_the_patient_is_randomized Bool) ;; {"when_to_set_to_true":"Set to true if the required participation schedule for other research website components is determined by the group to which the patient is randomized.","when_to_set_to_false":"Set to false if the required participation schedule for other research website components is not determined by the group to which the patient is randomized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the required participation schedule for other research website components is determined by the group to which the patient is randomized.","meaning":"Boolean indicating whether the required participation schedule for other research website components is determined by the group to which the patient is randomized."}
;; "(as determined by (the group to which the patient is randomized) ...)"

(declare-const patient_participation_in_other_website_components_frequency_value_recorded_withunit_per_week@@as_determined_by_the_phase_of_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the required participation schedule for other research website components is determined by the phase of the intervention.","when_to_set_to_false":"Set to false if the required participation schedule for other research website components is not determined by the phase of the intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the required participation schedule for other research website components is determined by the phase of the intervention.","meaning":"Boolean indicating whether the required participation schedule for other research website components is determined by the phase of the intervention."}
;; "(as determined by ... (the phase of intervention))"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_has_commitment_to_access_the_research_website_as_required_by_intervention_now
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS))
;; "To be included, the patient must have a commitment to access the website as required by the research intervention."

(assert
  (! (>= patient_self_reporting_of_calories_frequency_value_recorded_withunit_per_week 1)
     :named REQ7_COMPONENT1_OTHER_REQUIREMENTS))
;; "including (weekly self-reporting of calories)."

(assert
  (! (>= patient_self_reporting_of_fat_grams_frequency_value_recorded_withunit_per_week 1)
     :named REQ7_COMPONENT2_OTHER_REQUIREMENTS))
;; "including (weekly self-reporting of fat grams)."

(assert
  (! (>= patient_self_reporting_of_physical_activity_frequency_value_recorded_withunit_per_week 1)
     :named REQ7_COMPONENT3_OTHER_REQUIREMENTS))
;; "including (weekly self-reporting of physical activity)."

(assert
  (! (>= patient_self_reporting_of_pedometer_steps_frequency_value_recorded_withunit_per_week 1)
     :named REQ7_COMPONENT4_OTHER_REQUIREMENTS))
;; "including (weekly self-reporting of pedometer steps)."

(assert
  (! (>= patient_self_reporting_of_body_weight_frequency_value_recorded_withunit_per_week 1)
     :named REQ7_COMPONENT5_OTHER_REQUIREMENTS))
;; "including (weekly self-reporting of body weight)."

(assert
  (! (and (>= patient_participation_in_other_website_components_frequency_value_recorded_withunit_per_week 1)
          patient_participation_in_other_website_components_frequency_value_recorded_withunit_per_week@@as_determined_by_the_group_to_which_the_patient_is_randomized
          patient_participation_in_other_website_components_frequency_value_recorded_withunit_per_week@@as_determined_by_the_phase_of_intervention)
     :named REQ7_COMPONENT6_OTHER_REQUIREMENTS))
;; "including (((weekly participation) OR (more often participation)) in other website components (as determined by (the group to which the patient is randomized) AND (the phase of intervention)))."

;; ===================== Declarations for the inclusion criterion (REQ 8) =====================
(declare-const patient_has_electronic_mail_account_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an electronic mail (email) account.","when_to_set_to_false":"Set to false if the patient currently does not have an electronic mail (email) account.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an electronic mail (email) account.","meaning":"Boolean indicating whether the patient currently has an electronic mail (email) account."}
;; "have an electronic mail account"
(declare-const patient_is_willing_to_obtain_electronic_mail_account_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to obtain an electronic mail (email) account.","when_to_set_to_false":"Set to false if the patient is currently not willing to obtain an electronic mail (email) account.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to obtain an electronic mail (email) account.","meaning":"Boolean indicating whether the patient is currently willing to obtain an electronic mail (email) account."}
;; "be willing to obtain an electronic mail account"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (or patient_has_electronic_mail_account_now
         patient_is_willing_to_obtain_electronic_mail_account_now)
     :named        REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))
;; "((have an electronic mail account) OR (be willing to obtain an electronic mail account))"

;; ===================== Declarations for the inclusion criterion (REQ 9) =====================
(declare-const patient_has_access_to_digital_versatile_disc_player Bool) ;; {"when_to_set_to_true":"Set to true if the patient has access to a digital versatile disc player.","when_to_set_to_false":"Set to false if the patient does not have access to a digital versatile disc player.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has access to a digital versatile disc player.","meaning":"Boolean indicating whether the patient has access to a digital versatile disc player."}
;; "have access to a digital versatile disc player."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! patient_has_access_to_digital_versatile_disc_player
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))
;; "To be included, the patient must have access to a digital versatile disc player."

;; ===================== Declarations for the inclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_does_walk_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently is able to walk (ambulate).","when_to_set_to_false":"Set to false if the patient currently is not able to walk (cannot ambulate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently is able to walk.","meaning":"Boolean indicating whether the patient currently is able to walk (ambulate)."} ;; "be able to walk"
(declare-const patient_has_finding_of_does_walk_now@@without_assistive_device Bool) ;; {"when_to_set_to_true":"Set to true if the patient's walking is performed without use of any assistive device (e.g., cane, walker, crutches).","when_to_set_to_false":"Set to false if the patient's walking requires any assistive device.","when_to_set_to_null":"Set to null if it is unknown or not documented whether the patient's walking requires an assistive device.","meaning":"Boolean indicating whether the walking is performed without any assistive device."} ;; "without an assistive device"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_does_walk_now@@without_assistive_device
         patient_has_finding_of_does_walk_now)
     :named REQ10_AUXILIARY0)) ;; "walk without an assistive device"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! patient_has_finding_of_does_walk_now@@without_assistive_device
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must be able to walk without an assistive device"

;; ===================== Declarations for the inclusion criterion (REQ 11) =====================
(declare-const patient_answered_no_to_all_questions_on_physical_activity_readiness_questionnaire_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently answered 'no' to all questions on the Physical Activity Readiness Questionnaire.","when_to_set_to_false":"Set to false if the patient currently did not answer 'no' to all questions on the Physical Activity Readiness Questionnaire (e.g., any 'yes' or mixed/unknown responses).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently answered 'no' to all questions on the Physical Activity Readiness Questionnaire.","meaning":"Boolean indicating whether the patient currently answered 'no' to all questions on the Physical Activity Readiness Questionnaire."} ;; "answer 'no' to all questions on the Physical Activity Readiness Questionnaire"
(declare-const patient_has_physician_clearance_now@@from_patient_physician Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current physician clearance is issued by the physician of the patient.","when_to_set_to_false":"Set to false if the patient's current physician clearance is not issued by the physician of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current physician clearance is issued by the physician of the patient.","meaning":"Boolean indicating whether the patient's current physician clearance is issued by the physician of the patient."} ;; "clearance from the physician of the patient"
(declare-const patient_has_physician_clearance_now@@to_become_more_active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current physician clearance is specifically to become more active.","when_to_set_to_false":"Set to false if the patient's current physician clearance is not specifically to become more active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current physician clearance is specifically to become more active.","meaning":"Boolean indicating whether the patient's current physician clearance is specifically to become more active."} ;; "clearance ... to become more active"

;; ===================== Auxiliary Assertions (REQ 11) =====================
(assert
  (! (=> patient_has_physician_clearance_now@@from_patient_physician
         patient_has_physician_clearance_now)
     :named REQ11_AUXILIARY0)) ;; "clearance from the physician of the patient"

(assert
  (! (=> patient_has_physician_clearance_now@@to_become_more_active
         patient_has_physician_clearance_now)
     :named REQ11_AUXILIARY1)) ;; "clearance ... to become more active"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (or patient_answered_no_to_all_questions_on_physical_activity_readiness_questionnaire_now
         (and patient_has_physician_clearance_now
              patient_has_physician_clearance_now@@from_patient_physician
              patient_has_physician_clearance_now@@to_become_more_active))
     :named REQ11_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "(answer 'no' to all questions on the Physical Activity Readiness Questionnaire) OR (obtain clearance from the physician of the patient to become more active)"
