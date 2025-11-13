;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_has_finding_of_cardiac_pacemaker_in_situ_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cardiac pacemaker in situ.","when_to_set_to_false":"Set to false if the patient currently does not have a cardiac pacemaker in situ.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cardiac pacemaker in situ.","meaning":"Boolean indicating whether the patient currently has a cardiac pacemaker in situ."} ;; "pacemaker in situ"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
  (! (not patient_has_finding_of_cardiac_pacemaker_in_situ_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a pacemaker in situ."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_serious_comorbid_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a serious comorbid condition (examples include but are not limited to cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a serious comorbid condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a serious comorbid condition.","meaning":"Boolean indicating whether the patient currently has a serious comorbid condition, which may include but is not limited to cancer."} ;; "serious comorbid condition with non-exhaustive examples (cancer)"

(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."} ;; "cancer"

(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive lung disease (COPD).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive lung disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive lung disease (COPD).","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive lung disease (COPD)."} ;; "chronic obstructive pulmonary disease"

(declare-const patient_has_diagnosis_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of heart failure."} ;; "heart failure"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive example: cancer is an example of serious comorbid condition
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now
      patient_has_serious_comorbid_condition_now)
   :named REQ1_AUXILIARY0)) ;; "serious comorbid condition with non-exhaustive examples (cancer)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have any of the following: serious comorbid condition, COPD, or heart failure
(assert
(! (not patient_has_serious_comorbid_condition_now)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serious comorbid condition with non-exhaustive examples (cancer)."

(assert
(! (not patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic obstructive pulmonary disease."

(assert
(! (not patient_has_diagnosis_of_heart_failure_now)
   :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart failure."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_non_english_speaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a non-English speaker.","when_to_set_to_false":"Set to false if the patient is currently not a non-English speaker (i.e., is an English speaker).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a non-English speaker.","meaning":"Boolean indicating whether the patient is currently a non-English speaker."} ;; "the patient is a non-English speaker"
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder (mental illness).","when_to_set_to_false":"Set to false if the patient currently does not have a mental disorder (mental illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental disorder (mental illness).","meaning":"Boolean indicating whether the patient currently has a mental disorder (mental illness)."} ;; "the patient has a mental illness"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is under 16 years of age"
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dementia.","when_to_set_to_false":"Set to false if the patient currently does not have dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "the patient has dementia"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_non_english_speaker_now)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is a non-English speaker."

(assert
(! (not patient_has_finding_of_mental_disorder_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a mental illness."

(assert
(! (not (< patient_age_value_recorded_now_in_years 16))
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is under 16 years of age."

(assert
(! (not patient_has_finding_of_dementia_now)
:named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_exacerbation_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently experiencing an exacerbation (acute worsening) of asthma.","when_to_set_to_false":"Set to false if the patient is currently not experiencing an exacerbation of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently experiencing an exacerbation of asthma.","meaning":"Boolean indicating whether the patient is currently experiencing an exacerbation of asthma."} ;; "acute worsening of asthma at the time of testing"
(declare-const patient_has_finding_of_upper_respiratory_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an upper respiratory infection.","when_to_set_to_false":"Set to false if the patient currently does not have an upper respiratory infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an upper respiratory infection.","meaning":"Boolean indicating whether the patient currently has an upper respiratory infection."} ;; "upper airway infection at the time of testing"
(declare-const patient_has_finding_of_upper_respiratory_infection_inthepast3weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an upper respiratory infection at any time within the past 3 weeks.","when_to_set_to_false":"Set to false if the patient has not had an upper respiratory infection at any time within the past 3 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an upper respiratory infection within the past 3 weeks.","meaning":"Boolean indicating whether the patient has had an upper respiratory infection within the past 3 weeks."} ;; "upper airway infection within the last three weeks"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_exacerbation_of_asthma_now)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is experiencing an acute worsening of asthma at the time of testing."

(assert
(! (not patient_has_finding_of_upper_respiratory_infection_now)
:named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has an upper airway infection at the time of testing."

(assert
(! (not patient_has_finding_of_upper_respiratory_infection_inthepast3weeks)
:named REQ3_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has had an upper airway infection within the last three weeks."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_taken_cough_and_or_decongestant_agent_inthepast12hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any cough and/or decongestant agent within the past 12 hours.","when_to_set_to_false":"Set to false if the patient has not taken any cough and/or decongestant agent within the past 12 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any cough and/or decongestant agent within the past 12 hours.","meaning":"Boolean indicating whether the patient has taken any cough and/or decongestant agent within the past 12 hours."} ;; "the patient has taken any over the counter cough mixture within the last twelve hours"
(declare-const patient_is_unwilling_to_return_for_challenge_testing Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unwilling to come back another time for challenge testing.","when_to_set_to_false":"Set to false if the patient is willing to come back another time for challenge testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unwilling to come back another time for challenge testing.","meaning":"Boolean indicating whether the patient is unwilling to come back another time for challenge testing."} ;; "the patient is unwilling to come back another time for challenge testing"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_has_taken_cough_and_or_decongestant_agent_inthepast12hours
             patient_is_unwilling_to_return_for_challenge_testing))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has taken any over the counter cough mixture within the last twelve hours) AND (the patient is unwilling to come back another time for challenge testing)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_taken_caffeine_containing_product_inthepast1hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any caffeine-containing product within the past 1 hour.","when_to_set_to_false":"Set to false if the patient has not taken any caffeine-containing product within the past 1 hour.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any caffeine-containing product within the past 1 hour.","meaning":"Boolean indicating whether the patient has taken any caffeine-containing product within the past 1 hour."} ;; "food product containing caffeine within the last hour"
(declare-const patient_has_taken_drink_product_containing_caffeine_inthepast1hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any drink product containing caffeine within the past 1 hour.","when_to_set_to_false":"Set to false if the patient has not taken any drink product containing caffeine within the past 1 hour.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any drink product containing caffeine within the past 1 hour.","meaning":"Boolean indicating whether the patient has taken any drink product containing caffeine within the past 1 hour."} ;; "drink product containing caffeine within the last hour"
(declare-const patient_has_taken_drink_product_containing_menthol_inthepast1hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any drink product containing menthol within the past 1 hour.","when_to_set_to_false":"Set to false if the patient has not taken any drink product containing menthol within the past 1 hour.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any drink product containing menthol within the past 1 hour.","meaning":"Boolean indicating whether the patient has taken any drink product containing menthol within the past 1 hour."} ;; "drink product containing menthol within the last hour"
(declare-const patient_has_taken_food_product_containing_menthol_inthepast1hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any food product containing menthol within the past 1 hour.","when_to_set_to_false":"Set to false if the patient has not taken any food product containing menthol within the past 1 hour.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any food product containing menthol within the past 1 hour.","meaning":"Boolean indicating whether the patient has taken any food product containing menthol within the past 1 hour."} ;; "food product containing menthol within the last hour"
(declare-const patient_has_taken_menthol_containing_product_inthepast1hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any menthol-containing product within the past 1 hour.","when_to_set_to_false":"Set to false if the patient has not taken any menthol-containing product within the past 1 hour.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any menthol-containing product within the past 1 hour.","meaning":"Boolean indicating whether the patient has taken any menthol-containing product within the past 1 hour."} ;; "menthol-containing product within the last hour"
(declare-const patient_is_unwilling_to_wait_for_1_hour_before_starting_the_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unwilling to wait for one hour before starting the test.","when_to_set_to_false":"Set to false if the patient is willing to wait for one hour before starting the test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unwilling to wait for one hour before starting the test.","meaning":"Boolean indicating whether the patient is unwilling to wait for one hour before starting the test."} ;; "the patient is unwilling to wait for one hour before starting the test"
;; patient_is_unwilling_to_return_for_challenge_testing is already declared and reused.

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Menthol-containing product includes both food and drink products containing menthol (non-exhaustive, so only one-way implication)
(assert
(! (=> (or patient_has_taken_food_product_containing_menthol_inthepast1hours
           patient_has_taken_drink_product_containing_menthol_inthepast1hours)
       patient_has_taken_menthol_containing_product_inthepast1hours)
    :named REQ5_AUXILIARY0)) ;; "any food product containing menthol within the last hour OR any drink product containing menthol within the last hour" implies "menthol-containing product within the last hour"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion if: (any food/drink product containing caffeine/menthol within last hour) AND unwilling to wait 1 hour AND unwilling to return another time
(assert
(! (not (and
         (or patient_has_taken_caffeine_containing_product_inthepast1hours
             patient_has_taken_drink_product_containing_caffeine_inthepast1hours
             patient_has_taken_food_product_containing_menthol_inthepast1hours
             patient_has_taken_drink_product_containing_menthol_inthepast1hours)
         patient_is_unwilling_to_wait_for_1_hour_before_starting_the_test
         patient_is_unwilling_to_return_for_challenge_testing))
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has had any food product containing caffeine within the last hour) OR (the patient has had any food product containing menthol within the last hour) OR (the patient has had any drink product containing caffeine within the last hour) OR (the patient has had any drink product containing menthol within the last hour)) AND (the patient is unwilling to wait for one hour before starting the test) AND (the patient is unwilling to return another time)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_currently_involved_in_research_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently involved in any type of research.","when_to_set_to_false":"Set to false if the patient is currently not involved in any type of research.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently involved in any type of research.","meaning":"Boolean indicating whether the patient is currently involved in any type of research."} ;; "the patient is currently involved in research"
(declare-const patient_has_participated_in_research_within_last_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in any type of research within the last three months.","when_to_set_to_false":"Set to false if the patient has not participated in any type of research within the last three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in any type of research within the last three months.","meaning":"Boolean indicating whether the patient has participated in any type of research within the last three months."} ;; "the patient has participated in any type of research within the last three months"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (or patient_is_currently_involved_in_research_now
            patient_has_participated_in_research_within_last_3_months))
   :named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient is currently involved in research) OR (the patient has participated in any type of research within the last three months)."
