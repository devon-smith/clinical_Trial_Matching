;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 40 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 40.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 40 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} // "if the patient is female"
(declare-const patient_has_been_postmenopausal_for_years_value_recorded_now_withunit_years Real) ;; {"when_to_set_to_value":"Set to the number of years the patient has been postmenopausal, recorded at the current time, in years.","when_to_set_to_null":"Set to null if the number of years the patient has been postmenopausal is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value indicating the number of years the patient has been postmenopausal, recorded now, in years."} // "has been postmenopausal for ≥ 1 year"
(declare-const patient_is_surgically_incapable_of_bearing_children_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently surgically incapable of bearing children.","when_to_set_to_false":"Set to false if the patient is currently not surgically incapable of bearing children.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently surgically incapable of bearing children.","meaning":"Boolean value indicating whether the patient is currently surgically incapable of bearing children."} // "is surgically incapable of bearing children"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} // "is of childbearing potential"
(declare-const patient_has_negative_urine_pregnancy_test_performed_immediately_before_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a negative urine pregnancy test performed immediately before study entry.","when_to_set_to_false":"Set to false if the patient does not have a negative urine pregnancy test performed immediately before study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a negative urine pregnancy test performed immediately before study entry.","meaning":"Boolean value indicating whether the patient has a negative urine pregnancy test performed immediately before study entry."} // "has a negative pregnancy test (urine pregnancy test ...)"
(declare-const patient_has_negative_serum_pregnancy_test_performed_immediately_before_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a negative serum pregnancy test performed immediately before study entry.","when_to_set_to_false":"Set to false if the patient does not have a negative serum pregnancy test performed immediately before study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a negative serum pregnancy test performed immediately before study entry.","meaning":"Boolean value indicating whether the patient has a negative serum pregnancy test performed immediately before study entry."} // "has a negative pregnancy test (... serum pregnancy test) ..."
(declare-const patient_agrees_to_abstinence_throughout_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to abstinence throughout the study.","when_to_set_to_false":"Set to false if the patient does not agree to abstinence throughout the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to abstinence throughout the study.","meaning":"Boolean value indicating whether the patient agrees to abstinence throughout the study."} // "agrees to abstinence"
(declare-const patient_agrees_to_use_accepted_method_of_contraception_throughout_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to use an accepted method of contraception and to continue with the same method throughout the study.","when_to_set_to_false":"Set to false if the patient does not agree to use an accepted method of contraception and to continue with the same method throughout the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to use an accepted method of contraception and to continue with the same method throughout the study.","meaning":"Boolean value indicating whether the patient agrees to use an accepted method of contraception and to continue with the same method throughout the study."} // "agrees to use an accepted method of contraception AND agrees to continue with the same method throughout the study"
(declare-const patient_has_only_female_sexual_partners_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has only female sexual partners.","when_to_set_to_false":"Set to false if the patient currently does not have only female sexual partners.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has only female sexual partners.","meaning":"Boolean value indicating whether the patient currently has only female sexual partners."} // "has only female sexual partners"
(declare-const patient_has_sexual_relationship_with_sterile_male_partners_only_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sexual relationship with sterile male partners only.","when_to_set_to_false":"Set to false if the patient currently does not have sexual relationship with sterile male partners only.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sexual relationship with sterile male partners only.","meaning":"Boolean value indicating whether the patient currently has sexual relationship with sterile male partners only."} // "has sexual relationship with sterile male partners only"
(declare-const patient_is_able_to_be_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to become pregnant.","when_to_set_to_false":"Set to false if the patient is currently not able to become pregnant (e.g., postmenopausal for ≥ 1 year or surgically incapable of bearing children).","when_to_set_to_null":"Set to null if the patient's ability to become pregnant is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently able to become pregnant."} // "has been postmenopausal for ≥ 1 year"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by a pregnancy test performed immediately before study entry.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by a pregnancy test performed immediately before study entry.","when_to_set_to_null":"Set to null if the patient's pregnancy status is unknown, not documented, or cannot be determined immediately before study entry.","meaning":"Boolean value indicating whether the patient is currently pregnant."} // "has a negative pregnancy test (urine pregnancy test, serum pregnancy test) performed immediately before study entry"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Exhaustive subcategories for negative pregnancy test: urine or serum
(assert
  (! (= (or patient_has_negative_urine_pregnancy_test_performed_immediately_before_study_entry
            patient_has_negative_serum_pregnancy_test_performed_immediately_before_study_entry)
         (or patient_has_negative_urine_pregnancy_test_performed_immediately_before_study_entry
             patient_has_negative_serum_pregnancy_test_performed_immediately_before_study_entry))
     :named REQ1_AUXILIARY0)) ;; "has a negative pregnancy test (with exhaustive subcategories (urine pregnancy test, serum pregnancy test))"

;; Negative pregnancy test (urine or serum) performed immediately before study entry implies not pregnant now
(assert
  (! (= (or patient_has_negative_urine_pregnancy_test_performed_immediately_before_study_entry
            patient_has_negative_serum_pregnancy_test_performed_immediately_before_study_entry)
         (not patient_is_pregnant_now))
     :named REQ1_AUXILIARY1)) ;; "has a negative pregnancy test ... performed immediately before study entry" ≡ "not pregnant now"

;; Postmenopausal for ≥ 1 year implies not able to be pregnant now
(assert
  (! (=> (>= patient_has_been_postmenopausal_for_years_value_recorded_now_withunit_years 1.0)
         (not patient_is_able_to_be_pregnant_now))
     :named REQ1_AUXILIARY2)) ;; "has been postmenopausal for ≥ 1 year" ⇒ "not able to be pregnant now"

;; Surgically incapable of bearing children implies not able to be pregnant now
(assert
  (! (=> patient_is_surgically_incapable_of_bearing_children_now
         (not patient_is_able_to_be_pregnant_now))
     :named REQ1_AUXILIARY3)) ;; "is surgically incapable of bearing children" ⇒ "not able to be pregnant now"

;; ===================== Constraint Assertions (REQ 1) =====================
;; If the patient is female, she must meet at least one of the following:
;; (1) has been postmenopausal for ≥ 1 year
;; (2) is surgically incapable of bearing children
;; (3) (is of childbearing potential AND has a negative pregnancy test (urine or serum) performed immediately before study entry AND (agrees to abstinence OR agrees to use an accepted method of contraception AND agrees to continue with the same method throughout the study))
;; (4) has only female sexual partners
;; (5) has sexual relationship with sterile male partners only

(assert
  (! (or
        (>= patient_has_been_postmenopausal_for_years_value_recorded_now_withunit_years 1.0) ;; (1)
        patient_is_surgically_incapable_of_bearing_children_now ;; (2)
        (and
          patient_has_childbearing_potential_now
          (or patient_has_negative_urine_pregnancy_test_performed_immediately_before_study_entry
              patient_has_negative_serum_pregnancy_test_performed_immediately_before_study_entry)
          (or
            patient_agrees_to_abstinence_throughout_study
            patient_agrees_to_use_accepted_method_of_contraception_throughout_study)) ;; (3)
        patient_has_only_female_sexual_partners_now ;; (4)
        patient_has_sexual_relationship_with_sterile_male_partners_only_now) ;; (5)
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is female, the patient must meet at least one of the following conditions: ..."

;; Only enforce the above if the patient is female
(assert
  (! (or (not patient_sex_is_female_now)
         (or
            (>= patient_has_been_postmenopausal_for_years_value_recorded_now_withunit_years 1.0)
            patient_is_surgically_incapable_of_bearing_children_now
            (and
              patient_has_childbearing_potential_now
              (or patient_has_negative_urine_pregnancy_test_performed_immediately_before_study_entry
                  patient_has_negative_serum_pregnancy_test_performed_immediately_before_study_entry)
              (or
                patient_agrees_to_abstinence_throughout_study
                patient_agrees_to_use_accepted_method_of_contraception_throughout_study))
            patient_has_only_female_sexual_partners_now
            patient_has_sexual_relationship_with_sterile_male_partners_only_now))
     :named REQ1_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, if the patient is female, the patient must meet at least one of the following conditions: ..."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_chronic_obstructive_pulmonary_disease_stage_i_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic obstructive pulmonary disease stage I.","when_to_set_to_false":"Set to false if the patient currently does not have chronic obstructive pulmonary disease stage I.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic obstructive pulmonary disease stage I.","meaning":"Boolean indicating whether the patient currently has chronic obstructive pulmonary disease stage I."} // "chronic obstructive pulmonary disease stage I"
(declare-const patient_has_finding_of_chronic_obstructive_pulmonary_disease_stage_ii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic obstructive pulmonary disease stage II.","when_to_set_to_false":"Set to false if the patient currently does not have chronic obstructive pulmonary disease stage II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic obstructive pulmonary disease stage II.","meaning":"Boolean indicating whether the patient currently has chronic obstructive pulmonary disease stage II."} // "chronic obstructive pulmonary disease stage II"
(declare-const patient_has_finding_of_chronic_obstructive_pulmonary_disease_stage_iii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic obstructive pulmonary disease stage III as defined by the Global initiative for chronic Obstructive Lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have chronic obstructive pulmonary disease stage III as defined by the Global initiative for chronic Obstructive Lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic obstructive pulmonary disease stage III as defined by the Global initiative for chronic Obstructive Lung disease.","meaning":"Boolean indicating whether the patient currently has chronic obstructive pulmonary disease stage III as defined by the Global initiative for chronic Obstructive Lung disease."} // "chronic obstructive pulmonary disease stage III (as defined by the Global initiative for chronic Obstructive Lung disease)"
(declare-const patient_has_finding_of_chronic_obstructive_pulmonary_disease_stage_iv_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic obstructive pulmonary disease stage IV as defined by the Global initiative for chronic Obstructive Lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have chronic obstructive pulmonary disease stage IV as defined by the Global initiative for chronic Obstructive Lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic obstructive pulmonary disease stage IV as defined by the Global initiative for chronic Obstructive Lung disease.","meaning":"Boolean indicating whether the patient currently has chronic obstructive pulmonary disease stage IV as defined by the Global initiative for chronic Obstructive Lung disease."} // "chronic obstructive pulmonary disease stage IV (as defined by the Global initiative for chronic Obstructive Lung disease)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must be diagnosed with (COPD stage I OR stage II OR stage III OR stage IV) (as defined by the Global initiative for chronic Obstructive Lung disease).
(assert
  (! (or patient_has_finding_of_chronic_obstructive_pulmonary_disease_stage_i_now
         patient_has_finding_of_chronic_obstructive_pulmonary_disease_stage_ii_now
         patient_has_finding_of_chronic_obstructive_pulmonary_disease_stage_iii_now
         patient_has_finding_of_chronic_obstructive_pulmonary_disease_stage_iv_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be diagnosed with (chronic obstructive pulmonary disease stage I OR chronic obstructive pulmonary disease stage II OR chronic obstructive pulmonary disease stage III OR chronic obstructive pulmonary disease stage IV) (as defined by the Global initiative for chronic Obstructive Lung disease)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_acute_moderate_exacerbation_of_chronic_obstructive_pulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a doctor's diagnosis of acute moderate exacerbation of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have a doctor's diagnosis of acute moderate exacerbation of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a doctor's diagnosis of acute moderate exacerbation of chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has a doctor's diagnosis of acute moderate exacerbation of chronic obstructive pulmonary disease."} // "doctor's diagnosis of acute moderate exacerbation of chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_acute_moderate_exacerbation_of_chronic_obstructive_pulmonary_disease_now@@onset_less_than_7_days Bool) ;; {"when_to_set_to_true":"Set to true if the onset of the acute moderate exacerbation of chronic obstructive pulmonary disease is less than 7 days ago.","when_to_set_to_false":"Set to false if the onset of the acute moderate exacerbation of chronic obstructive pulmonary disease is 7 days ago or more.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the onset of the acute moderate exacerbation of chronic obstructive pulmonary disease is less than 7 days ago.","meaning":"Boolean indicating whether the onset of the acute moderate exacerbation of chronic obstructive pulmonary disease is less than 7 days ago."} // "(onset < 7 days)"
(declare-const patient_has_finding_of_sustained_worsening_of_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a sustained worsening of their condition.","when_to_set_to_false":"Set to false if the patient currently does not have a sustained worsening of their condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a sustained worsening of their condition.","meaning":"Boolean indicating whether the patient currently has a sustained worsening of their condition."} // "sustained worsening of the patient's condition"
(declare-const patient_has_finding_of_dyspnea_now@@increased Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has increased dyspnea.","when_to_set_to_false":"Set to false if the patient currently has dyspnea but it is not increased.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dyspnea is increased.","meaning":"Boolean indicating whether the patient currently has increased dyspnea."} // "increased dyspnea"
(declare-const patient_has_finding_of_increased_sputum_production_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has increased sputum production.","when_to_set_to_false":"Set to false if the patient currently does not have increased sputum production.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has increased sputum production.","meaning":"Boolean indicating whether the patient currently has increased sputum production."} // "increased sputum production"
(declare-const patient_has_finding_of_purulent_sputum_now@@increased Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has increased purulent sputum.","when_to_set_to_false":"Set to false if the patient currently has purulent sputum but it is not increased.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's purulent sputum is increased.","meaning":"Boolean indicating whether the patient currently has increased purulent sputum."} // "increased sputum purulence"
(declare-const patient_has_finding_of_increasing_frequency_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of increasing frequency of cough.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of increasing frequency of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has increasing frequency of cough.","meaning":"Boolean indicating whether the patient currently has increasing frequency of cough."} // "increased cough"
(declare-const patient_has_finding_of_stable_state_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in a stable state with respect to their chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient is currently not in a stable state with respect to their chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in a stable state with respect to their chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient is currently in a stable state with respect to their chronic obstructive pulmonary disease."} // "from the stable state"
(declare-const patient_has_finding_of_beyond_normal_day_to_day_variations_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current condition is beyond normal day-to-day variations.","when_to_set_to_false":"Set to false if the patient's current condition is not beyond normal day-to-day variations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current condition is beyond normal day-to-day variations.","meaning":"Boolean indicating whether the patient's current condition is beyond normal day-to-day variations."} // "beyond normal day-to-day variations"
(declare-const patient_has_change_in_regular_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a change in their regular medication due to the exacerbation.","when_to_set_to_false":"Set to false if the patient currently does not have a change in their regular medication due to the exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a change in their regular medication due to the exacerbation.","meaning":"Boolean indicating whether the patient currently has a change in their regular medication due to the exacerbation."} // "necessitating a change in regular medication"
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has chronic obstructive pulmonary disease."} // "in a patient with underlying chronic obstructive pulmonary disease"
(declare-const patient_needs_additional_medical_assistance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently needs additional medical assistance due to the exacerbation.","when_to_set_to_false":"Set to false if the patient currently does not need additional medical assistance due to the exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently needs additional medical assistance due to the exacerbation.","meaning":"Boolean indicating whether the patient currently needs additional medical assistance due to the exacerbation."} // "needing additional medical assistance"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_acute_moderate_exacerbation_of_chronic_obstructive_pulmonary_disease_now@@onset_less_than_7_days
         patient_has_finding_of_acute_moderate_exacerbation_of_chronic_obstructive_pulmonary_disease_now)
     :named REQ3_AUXILIARY0)) ;; "onset < 7 days" implies diagnosis

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_dyspnea_now@@increased
         patient_has_finding_of_sustained_worsening_of_condition_now)
     :named REQ3_AUXILIARY1)) ;; "increased dyspnea" is a type of sustained worsening

(assert
  (! (=> patient_has_finding_of_purulent_sputum_now@@increased
         patient_has_finding_of_sustained_worsening_of_condition_now)
     :named REQ3_AUXILIARY2)) ;; "increased sputum purulence" is a type of sustained worsening

;; Define the count of increased symptoms (at least 2 required)
(define-fun acute_exacerbation_symptom_count () Int
  (+ (ite patient_has_finding_of_dyspnea_now@@increased 1 0)
     (ite patient_has_finding_of_increased_sputum_production_now 1 0)
     (ite patient_has_finding_of_purulent_sputum_now@@increased 1 0)
     (ite patient_has_finding_of_increasing_frequency_of_cough_now 1 0))) ;; "including at least 2 of the following symptoms: increased dyspnea, increased sputum production, increased sputum purulence, increased cough"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (and
        patient_has_finding_of_acute_moderate_exacerbation_of_chronic_obstructive_pulmonary_disease_now
        patient_has_finding_of_acute_moderate_exacerbation_of_chronic_obstructive_pulmonary_disease_now@@onset_less_than_7_days
        patient_has_finding_of_sustained_worsening_of_condition_now
        (>= acute_exacerbation_symptom_count 2)
        patient_has_finding_of_stable_state_now
        patient_has_finding_of_beyond_normal_day_to_day_variations_now
        patient_has_change_in_regular_medication_now
        patient_has_finding_of_chronic_obstructive_lung_disease_now
        patient_needs_additional_medical_assistance_now)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a doctor's diagnosis of acute moderate exacerbation of chronic obstructive pulmonary disease (onset < 7 days) defined by a sustained worsening of the patient's condition (including at least 2 of the following symptoms: increased dyspnea, increased sputum production, increased sputum purulence, increased cough), from the stable state and beyond normal day-to-day variations, necessitating a change in regular medication in a patient with underlying chronic obstructive pulmonary disease, and needing additional medical assistance."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of community acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of community acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of community acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of community acquired pneumonia."} // "absence of community acquired pneumonia"
(declare-const patient_has_diagnosis_of_lower_respiratory_tract_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of lower respiratory tract infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of lower respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of lower respiratory tract infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of lower respiratory tract infection."} // "absence of lower respiratory tract infection with a clear indication for antibiotic treatment as determined by procalcitonin level < 0.25 ng/mL"
(declare-const patient_has_diagnosis_of_lower_respiratory_tract_infection_now@@clear_indication_for_antibiotic_treatment_as_determined_by_procalcitonin Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of lower respiratory tract infection and there is a clear indication for antibiotic treatment as determined by procalcitonin level.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of lower respiratory tract infection but there is not a clear indication for antibiotic treatment as determined by procalcitonin level.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is a clear indication for antibiotic treatment as determined by procalcitonin level for the patient's lower respiratory tract infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of lower respiratory tract infection and there is a clear indication for antibiotic treatment as determined by procalcitonin level."} // "clear indication for antibiotic treatment as determined by procalcitonin level"
(declare-const patient_procalcitonin_value_recorded_now_withunit_ng_per_ml Real) ;; {"when_to_set_to_value":"Set to the value of the patient's procalcitonin measured now, in ng/mL.","when_to_set_to_null":"Set to null if the patient's procalcitonin value measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric variable indicating the patient's procalcitonin value recorded now, in nanograms per milliliter (ng/mL)."} // "procalcitonin level < 0.25 ng/mL"
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of radiologic infiltrate of lung (pulmonary infiltrates).","when_to_set_to_false":"Set to false if the patient currently does not have a finding of radiologic infiltrate of lung (pulmonary infiltrates).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of radiologic infiltrate of lung (pulmonary infiltrates).","meaning":"Boolean indicating whether the patient currently has a finding of radiologic infiltrate of lung (pulmonary infiltrates)."} // "pulmonary infiltrates"
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now@@detected_on_routine_chest_x_ray Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of radiologic infiltrate of lung (pulmonary infiltrates) and the finding is detected on routine chest x-ray.","when_to_set_to_false":"Set to false if the patient currently has a finding of radiologic infiltrate of lung (pulmonary infiltrates) but the finding is not detected on routine chest x-ray.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding of radiologic infiltrate of lung (pulmonary infiltrates) is detected on routine chest x-ray.","meaning":"Boolean indicating whether the patient currently has a finding of radiologic infiltrate of lung (pulmonary infiltrates) and the finding is detected on routine chest x-ray."} // "pulmonary infiltrates on routine chest x-ray"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies stem variable for lower respiratory tract infection
(assert
  (! (=> patient_has_diagnosis_of_lower_respiratory_tract_infection_now@@clear_indication_for_antibiotic_treatment_as_determined_by_procalcitonin
         patient_has_diagnosis_of_lower_respiratory_tract_infection_now)
     :named REQ4_AUXILIARY0)) ;; "clear indication for antibiotic treatment as determined by procalcitonin level"

;; Qualifier variable implies stem variable for radiologic infiltrate detected on chest x-ray
(assert
  (! (=> patient_has_finding_of_radiologic_infiltrate_of_lung_now@@detected_on_routine_chest_x_ray
         patient_has_finding_of_radiologic_infiltrate_of_lung_now)
     :named REQ4_AUXILIARY1)) ;; "pulmonary infiltrates on routine chest x-ray"

;; Definition: clear indication for antibiotic treatment as determined by procalcitonin means procalcitonin >= 0.25 ng/mL
(assert
  (! (= patient_has_diagnosis_of_lower_respiratory_tract_infection_now@@clear_indication_for_antibiotic_treatment_as_determined_by_procalcitonin
        (and patient_has_diagnosis_of_lower_respiratory_tract_infection_now
             (>= patient_procalcitonin_value_recorded_now_withunit_ng_per_ml 0.25)))
     :named REQ4_AUXILIARY2)) ;; "clear indication for antibiotic treatment as determined by procalcitonin level < 0.25 ng/mL" (negation: indication if >= 0.25)

;; Definition: pulmonary infiltrates on routine chest x-ray
(assert
  (! (= patient_has_finding_of_radiologic_infiltrate_of_lung_now@@detected_on_routine_chest_x_ray
        (and patient_has_finding_of_radiologic_infiltrate_of_lung_now
             true)) ;; Detected on routine chest x-ray is encoded by the qualifier variable
     :named REQ4_AUXILIARY3)) ;; "pulmonary infiltrates on routine chest x-ray"

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient must have:
;; (absence of community acquired pneumonia)
;; OR (absence of lower respiratory tract infection with a clear indication for antibiotic treatment as determined by procalcitonin level < 0.25 ng/mL)
;; OR (absence of pulmonary infiltrates on routine chest x-ray)
(assert
  (! (or (not patient_has_diagnosis_of_community_acquired_pneumonia_now)
         (not patient_has_diagnosis_of_lower_respiratory_tract_infection_now@@clear_indication_for_antibiotic_treatment_as_determined_by_procalcitonin)
         (not patient_has_finding_of_radiologic_infiltrate_of_lung_now@@detected_on_routine_chest_x_ray))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "absence of community acquired pneumonia or absence of lower respiratory tract infection with a clear indication for antibiotic treatment as determined by procalcitonin level < 0.25 ng/mL or absence of pulmonary infiltrates on routine chest x-ray."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_tobacco_smoking_behavior_finding_value_recorded_inthehistory_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the total number of pack years if the patient's cumulative tobacco smoking exposure is recorded at any time in their history.","when_to_set_to_null":"Set to null if the patient's cumulative tobacco smoking exposure in pack years is not recorded or is indeterminate.","meaning":"Numeric value representing the patient's cumulative tobacco smoking exposure in pack years, recorded at any time in their history."} // "smoking history of ≥ 10 pack years"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (>= patient_tobacco_smoking_behavior_finding_value_recorded_inthehistory_withunit_pack_years 10)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a smoking history of ≥ 10 pack years."

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const patient_is_able_to_complete_diaries_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to complete diaries.","when_to_set_to_false":"Set to false if the patient is currently not able to complete diaries.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to complete diaries.","meaning":"Boolean indicating whether the patient is currently able to complete diaries."} // "the patient must be able to complete diaries"
(declare-const patient_is_able_to_complete_quality_of_life_questionnaires_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to complete quality of life questionnaires.","when_to_set_to_false":"Set to false if the patient is currently not able to complete quality of life questionnaires.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to complete quality of life questionnaires.","meaning":"Boolean indicating whether the patient is currently able to complete quality of life questionnaires."} // "the patient must be able to complete quality of life questionnaires"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_is_able_to_complete_diaries_now
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be able to complete diaries"

(assert
  (! patient_is_able_to_complete_quality_of_life_questionnaires_now
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient must be able to complete quality of life questionnaires"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_signed_and_dated_informed_consent_prior_to_any_study_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed and dated an informed consent document prior to any study procedures.","when_to_set_to_false":"Set to false if the patient has not signed and dated an informed consent document prior to any study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed and dated an informed consent document prior to any study procedures.","meaning":"Boolean indicating whether the patient has signed and dated an informed consent document prior to any study procedures."} // "the patient must sign and date an informed consent prior to any study procedures."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_has_signed_and_dated_informed_consent_prior_to_any_study_procedures
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must sign and date an informed consent prior to any study procedures."
