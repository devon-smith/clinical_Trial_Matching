;; --- verifier-bypassed (attempt 8/8) 2025-10-25T11:57:01.764908 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_allergy_to_aspirin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to aspirin.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to aspirin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to aspirin.","meaning":"Boolean indicating whether the patient currently has an allergy to aspirin."} ;; "allergy to aspirin"
(declare-const patient_has_finding_of_allergy_to_non_steroidal_anti_inflammatory_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to nonsteroidal anti-inflammatory drugs.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to nonsteroidal anti-inflammatory drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to nonsteroidal anti-inflammatory drugs.","meaning":"Boolean indicating whether the patient currently has an allergy to nonsteroidal anti-inflammatory drugs."} ;; "allergy to nonsteroidal anti-inflammatory drugs"
(declare-const patient_has_finding_of_allergy_to_inactive_ingredient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to any inactive ingredient, including but not limited to honey, lemon flavor, menthol, or sucrose.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to any inactive ingredient, including but not limited to honey, lemon flavor, menthol, or sucrose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a documented allergy to any inactive ingredient.","meaning":"Boolean indicating whether the patient currently has a known allergy to any inactive ingredient (with non-exhaustive examples such as honey, lemon flavor, menthol, sucrose)."} ;; "allergy to any inactive ingredient with non-exhaustive examples (honey, lemon flavor, menthol, sucrose)"
(declare-const patient_has_finding_of_hypersensitivity_to_aspirin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented hypersensitivity to aspirin.","when_to_set_to_false":"Set to false if the patient currently does not have a documented hypersensitivity to aspirin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a documented hypersensitivity to aspirin.","meaning":"Boolean indicating whether the patient currently has a known hypersensitivity to aspirin."} ;; "hypersensitivity to aspirin"
(declare-const patient_has_finding_of_allergic_reaction_caused_by_nonsteroidal_antiinflammatory_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergic reaction or hypersensitivity to nonsteroidal anti-inflammatory drugs.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergic reaction or hypersensitivity to nonsteroidal anti-inflammatory drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergic reaction or hypersensitivity to nonsteroidal anti-inflammatory drugs.","meaning":"Boolean indicating whether the patient currently has an allergic reaction or hypersensitivity to nonsteroidal anti-inflammatory drugs."} ;; "hypersensitivity to nonsteroidal anti-inflammatory drugs"
(declare-const patient_has_finding_of_hypersensitivity_to_inactive_ingredient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented hypersensitivity to any inactive ingredient, including but not limited to honey, lemon flavor, menthol, or sucrose.","when_to_set_to_false":"Set to false if the patient currently does not have a documented hypersensitivity to any inactive ingredient, including but not limited to honey, lemon flavor, menthol, or sucrose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a documented hypersensitivity to any inactive ingredient.","meaning":"Boolean indicating whether the patient currently has a known hypersensitivity to any inactive ingredient (with non-exhaustive examples such as honey, lemon flavor, menthol, sucrose)."} ;; "hypersensitivity to any inactive ingredient with non-exhaustive examples (honey, lemon flavor, menthol, sucrose)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_allergy_to_aspirin_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to aspirin."

(assert
(! (not patient_has_finding_of_allergy_to_non_steroidal_anti_inflammatory_agent_now)
    :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to nonsteroidal anti-inflammatory drugs."

(assert
(! (not patient_has_finding_of_allergy_to_inactive_ingredient_now)
    :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to any inactive ingredient with non-exhaustive examples (honey, lemon flavor, menthol, sucrose)."

(assert
(! (not patient_has_finding_of_hypersensitivity_to_aspirin_now)
    :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known hypersensitivity to aspirin."

(assert
(! (not patient_has_finding_of_allergic_reaction_caused_by_nonsteroidal_antiinflammatory_agent_now)
    :named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known hypersensitivity to nonsteroidal anti-inflammatory drugs."

(assert
(! (not patient_has_finding_of_hypersensitivity_to_inactive_ingredient_now)
    :named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known hypersensitivity to any inactive ingredient with non-exhaustive examples (honey, lemon flavor, menthol, sucrose)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_gastrointestinal_ulcer_inthepast60days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a gastrointestinal ulcer at any time within the past sixty days.","when_to_set_to_false":"Set to false if the patient has not had a gastrointestinal ulcer within the past sixty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a gastrointestinal ulcer within the past sixty days.","meaning":"Boolean indicating whether the patient has had a gastrointestinal ulcer within the past sixty days."} ;; "history of upper gastrointestinal ulcer within the past sixty days"

(declare-const patient_has_finding_of_upper_gastrointestinal_complaint_now_and_clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinically significant upper gastrointestinal complaint.","when_to_set_to_false":"Set to false if the patient currently does not have a clinically significant upper gastrointestinal complaint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically significant upper gastrointestinal complaint.","meaning":"Boolean indicating whether the patient currently has a clinically significant upper gastrointestinal complaint."} ;; "current clinically significant upper gastrointestinal complaint"

(declare-const patient_has_regular_use_of_medication_for_upper_gastrointestinal_symptom_in_the_past_7_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any medication for upper gastrointestinal symptom regularly (frequency ≥ 3 times) in the past 7 days.","when_to_set_to_false":"Set to false if the patient has not used any medication for upper gastrointestinal symptom regularly (frequency < 3 times) in the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any medication for upper gastrointestinal symptom regularly in the past 7 days.","meaning":"Boolean indicating whether the patient has regular use of any medication for upper gastrointestinal symptom in the past 7 days."} ;; "current regular use (frequency ≥ three times in the previous week) of any medication for upper gastrointestinal symptom"

(declare-const patient_medication_for_upper_gastrointestinal_symptom_frequency_in_the_past_7_days_value_recorded_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of times the patient has used any medication for upper gastrointestinal symptom in the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many times the patient has used any medication for upper gastrointestinal symptom in the past 7 days.","meaning":"Numeric value indicating the number of times the patient has used any medication for upper gastrointestinal symptom in the past 7 days."} ;; "frequency ≥ three times in the previous week"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: regular use (frequency ≥ 3 times in previous week) of any medication for upper gastrointestinal symptom
(assert
(! (= patient_has_regular_use_of_medication_for_upper_gastrointestinal_symptom_in_the_past_7_days
    (>= patient_medication_for_upper_gastrointestinal_symptom_frequency_in_the_past_7_days_value_recorded_withunit_count 3))
:named REQ1_AUXILIARY0)) ;; "current regular use (frequency ≥ three times in the previous week) of any medication for upper gastrointestinal symptom"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT satisfy any of the three exclusion components
(assert
(! (not (or patient_has_finding_of_gastrointestinal_ulcer_inthepast60days
            patient_has_finding_of_upper_gastrointestinal_complaint_now_and_clinically_significant
            patient_has_regular_use_of_medication_for_upper_gastrointestinal_symptom_in_the_past_7_days))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of upper gastrointestinal ulcer within the past sixty days) OR (the patient has current clinically significant upper gastrointestinal complaint) OR (the patient has current regular use (frequency ≥ three times in the previous week) of any medication for upper gastrointestinal symptom with non-exhaustive examples (antacid, histamine-2 receptor blocker, proton pump inhibitor, sucralfate)))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_disease_of_liver_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with hepatic (liver) disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with hepatic (liver) disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with hepatic (liver) disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of hepatic (liver) disease in their history."} ;; "the patient has a history of hepatic disease"
(declare-const patient_has_diagnosis_of_renal_impairment_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with renal dysfunction (renal impairment) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with renal dysfunction (renal impairment) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with renal dysfunction (renal impairment).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of renal dysfunction (renal impairment) in their history."} ;; "the patient has a history of renal dysfunction"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_diagnosis_of_disease_of_liver_inthehistory
            patient_has_diagnosis_of_renal_impairment_inthehistory))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of hepatic disease) OR (the patient has a history of renal dysfunction))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_acute_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have an acute medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute medical condition.","meaning":"Boolean indicating whether the patient currently has an acute medical condition."} ;; "acute medical condition"
(declare-const patient_has_finding_of_acute_disease_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the acute medical condition present is severe.","when_to_set_to_false":"Set to false if the acute medical condition present is not severe.","when_to_set_to_null":"Set to null if severity of the acute medical condition is unknown or indeterminate.","meaning":"Boolean indicating whether the acute medical condition present is severe."} ;; "severe acute medical condition"
(declare-const patient_has_finding_of_acute_disease_now@@investigator_judges_inappropriate_for_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if, in the judgment of the Investigator, the acute medical condition would make the patient inappropriate for entry into the study.","when_to_set_to_false":"Set to false if, in the judgment of the Investigator, the acute medical condition would not make the patient inappropriate for entry into the study.","when_to_set_to_null":"Set to null if the Investigator's judgment regarding study entry appropriateness is unknown or indeterminate.","meaning":"Boolean indicating whether, in the Investigator's judgment, the acute medical condition makes the patient inappropriate for study entry."} ;; "in the judgment of the Investigator, the condition would make the patient inappropriate for entry into this study"
(declare-const patient_has_finding_of_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic medical condition.","meaning":"Boolean indicating whether the patient currently has a chronic medical condition."} ;; "chronic medical condition"
(declare-const patient_has_finding_of_chronic_disease_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the chronic medical condition present is severe.","when_to_set_to_false":"Set to false if the chronic medical condition present is not severe.","when_to_set_to_null":"Set to null if severity of the chronic medical condition is unknown or indeterminate.","meaning":"Boolean indicating whether the chronic medical condition present is severe."} ;; "severe chronic medical condition"
(declare-const patient_has_finding_of_chronic_disease_now@@may_increase_risk_of_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the chronic medical condition present may increase the risk associated with study participation.","when_to_set_to_false":"Set to false if the chronic medical condition present does not increase the risk associated with study participation.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the chronic medical condition may increase risk of study participation.","meaning":"Boolean indicating whether the chronic medical condition may increase risk of study participation."} ;; "the condition may increase the risk associated with study participation"
(declare-const patient_has_finding_of_chronic_disease_now@@may_interfere_with_interpretation_of_study_results Bool) ;; {"when_to_set_to_true":"Set to true if the chronic medical condition present may interfere with the interpretation of study results.","when_to_set_to_false":"Set to false if the chronic medical condition present does not interfere with the interpretation of study results.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the chronic medical condition may interfere with interpretation of study results.","meaning":"Boolean indicating whether the chronic medical condition may interfere with interpretation of study results."} ;; "the condition may interfere with the interpretation of study results"
(declare-const patient_has_finding_of_chronic_disease_now@@investigator_judges_inappropriate_for_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if, in the judgment of the Investigator, the chronic medical condition would make the patient inappropriate for entry into the study.","when_to_set_to_false":"Set to false if, in the judgment of the Investigator, the chronic medical condition would not make the patient inappropriate for entry into the study.","when_to_set_to_null":"Set to null if the Investigator's judgment regarding study entry appropriateness is unknown or indeterminate.","meaning":"Boolean indicating whether, in the Investigator's judgment, the chronic medical condition makes the patient inappropriate for study entry."} ;; "in the judgment of the Investigator, the condition would make the patient inappropriate for entry into this study"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables (acute)
(assert
(! (=> patient_has_finding_of_acute_disease_now@@is_severe
       patient_has_finding_of_acute_disease_now)
    :named REQ3_AUXILIARY0)) ;; "severe acute medical condition"

(assert
(! (=> patient_has_finding_of_acute_disease_now@@investigator_judges_inappropriate_for_study_entry
       patient_has_finding_of_acute_disease_now)
    :named REQ3_AUXILIARY1)) ;; "in the judgment of the Investigator, the condition would make the patient inappropriate for entry into this study (acute)"

;; Qualifier variables imply corresponding stem variables (chronic)
(assert
(! (=> patient_has_finding_of_chronic_disease_now@@is_severe
       patient_has_finding_of_chronic_disease_now)
    :named REQ3_AUXILIARY2)) ;; "severe chronic medical condition"

(assert
(! (=> patient_has_finding_of_chronic_disease_now@@may_increase_risk_of_study_participation
       patient_has_finding_of_chronic_disease_now)
    :named REQ3_AUXILIARY3)) ;; "the condition may increase the risk associated with study participation"

(assert
(! (=> patient_has_finding_of_chronic_disease_now@@may_interfere_with_interpretation_of_study_results
       patient_has_finding_of_chronic_disease_now)
    :named REQ3_AUXILIARY4)) ;; "the condition may interfere with the interpretation of study results"

(assert
(! (=> patient_has_finding_of_chronic_disease_now@@investigator_judges_inappropriate_for_study_entry
       patient_has_finding_of_chronic_disease_now)
    :named REQ3_AUXILIARY5)) ;; "in the judgment of the Investigator, the condition would make the patient inappropriate for entry into this study (chronic)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: The patient is excluded if the patient has any other severe acute medical condition and in the judgment of the Investigator, the condition would make the patient inappropriate for entry into this study.
(assert
(! (not (and patient_has_finding_of_acute_disease_now@@is_severe
             patient_has_finding_of_acute_disease_now@@investigator_judges_inappropriate_for_study_entry))
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other severe acute medical condition and in the judgment of the Investigator, the condition would make the patient inappropriate for entry into this study."

;; Component 1: The patient is excluded if the patient has any other severe chronic medical condition and ((the condition may increase the risk associated with study participation) or (the condition may interfere with the interpretation of study results)) and in the judgment of the Investigator, the condition would make the patient inappropriate for entry into this study.
(assert
(! (not (and patient_has_finding_of_chronic_disease_now@@is_severe
             (or patient_has_finding_of_chronic_disease_now@@may_increase_risk_of_study_participation
                 patient_has_finding_of_chronic_disease_now@@may_interfere_with_interpretation_of_study_results)
             patient_has_finding_of_chronic_disease_now@@investigator_judges_inappropriate_for_study_entry))
    :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other severe chronic medical condition and ((the condition may increase the risk associated with study participation) or (the condition may interfere with the interpretation of study results)) and in the judgment of the Investigator, the condition would make the patient inappropriate for entry into this study."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const analgesic_use_frequency_value_recorded_past_4_weeks_in_times_per_week Real) ;; {"when_to_set_to_value":"Set to the number of times per week the patient used analgesics over the prior four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how frequently the patient used analgesics over the prior four weeks.","meaning":"Numeric value indicating the frequency of analgesic use by the patient, recorded as the number of times per week over the prior four weeks."} ;; "frequency ≥ three times per week over the prior four weeks"
(declare-const patient_is_exposed_to_analgesic_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to analgesic substances at any time during the prior four weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to analgesic substances during the prior four weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to analgesic substances during the prior four weeks.","meaning":"Boolean indicating whether the patient has been exposed to analgesic substances during the prior four weeks."} ;; "has a history of analgesic use in the prior four weeks"
(declare-const patient_is_exposed_to_analgesic_inthepast4weeks@@chronic_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to analgesic substances in the prior four weeks is consistent with chronic use (i.e., ongoing or repeated pattern).","when_to_set_to_false":"Set to false if the patient's exposure to analgesic substances in the prior four weeks is not consistent with chronic use.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure pattern is chronic.","meaning":"Boolean indicating whether the patient's exposure to analgesic substances in the prior four weeks is chronic."} ;; "history of chronic analgesic use in the prior four weeks"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: chronic analgesic use in the prior four weeks is exposure with frequency ≥ 3 times per week
(assert
(! (= patient_is_exposed_to_analgesic_inthepast4weeks@@chronic_use
(and patient_is_exposed_to_analgesic_inthepast4weeks
     (>= analgesic_use_frequency_value_recorded_past_4_weeks_in_times_per_week 3)))
:named REQ4_AUXILIARY0)) ;; "chronic analgesic use (frequency ≥ three times per week over the prior four weeks)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_analgesic_inthepast4weeks@@chronic_use
       patient_is_exposed_to_analgesic_inthepast4weeks)
:named REQ4_AUXILIARY1)) ;; "chronic use implies exposure"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_exposed_to_analgesic_inthepast4weeks@@chronic_use)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of chronic analgesic use (frequency ≥ three times per week over the prior four weeks)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_acute_disease_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a clinical finding of acute disease at any time within the past 24 hours before the reference point (randomization).","when_to_set_to_false":"Set to false if the patient has not had a clinical finding of acute disease at any time within the past 24 hours before the reference point (randomization).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a clinical finding of acute disease within the past 24 hours before the reference point (randomization).","meaning":"Boolean indicating whether the patient has had a clinical finding of acute disease within the past 24 hours."} ;; "acute disease within the previous twenty-four hours before randomization"
(declare-const patient_has_finding_of_acute_disease_inthepast24hours@@temporalcontext_within24hours_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a clinical finding of acute disease within the past 24 hours before randomization.","when_to_set_to_false":"Set to false if the patient has not had a clinical finding of acute disease within the past 24 hours before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a clinical finding of acute disease within the past 24 hours before randomization.","meaning":"Boolean indicating whether the finding's temporal context is specifically within 24 hours before randomization."} ;; "acute disease within the previous twenty-four hours before randomization"
(declare-const patient_has_used_antibiotic_for_acute_disease_within_24hours_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any antibiotic for acute disease within the previous 24 hours before randomization.","when_to_set_to_false":"Set to false if the patient has not used any antibiotic for acute disease within the previous 24 hours before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any antibiotic for acute disease within the previous 24 hours before randomization.","meaning":"Boolean indicating whether the patient has used any antibiotic for acute disease within the previous 24 hours before randomization."} ;; "used an antibiotic for acute disease within the previous twenty-four hours before randomization"
(declare-const patient_has_used_quinolone_antibiotic_within_past_week Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used a quinolone antibiotic within the past week before randomization.","when_to_set_to_false":"Set to false if the patient has not used a quinolone antibiotic within the past week before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used a quinolone antibiotic within the past week before randomization.","meaning":"Boolean indicating whether the patient has used a quinolone antibiotic within the past week before randomization."} ;; "used quinolone antibiotic within the past week"
(declare-const patient_has_used_quinolone_antibiotic_concurrently Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a quinolone antibiotic at the time of randomization.","when_to_set_to_false":"Set to false if the patient is not currently using a quinolone antibiotic at the time of randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a quinolone antibiotic at the time of randomization.","meaning":"Boolean indicating whether the patient is currently using a quinolone antibiotic at the time of randomization."} ;; "used quinolone antibiotic concurrently"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_used_antibiotic_for_acute_disease_within_24hours_before_randomization)
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used an antibiotic for acute disease within the previous twenty-four hours before randomization."

(assert
(! (not patient_has_used_quinolone_antibiotic_within_past_week)
:named REQ5_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used quinolone antibiotic with non-exhaustive examples (ciprofloxacin, nalidixic acid) within the past week."

(assert
(! (not patient_has_used_quinolone_antibiotic_concurrently)
:named REQ5_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used quinolone antibiotic with non-exhaustive examples (ciprofloxacin, nalidixic acid) concurrently."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_taken_mifepristone_containing_product_inthepast12days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any mifepristone-containing product in the past 12 days prior to the screening visit.","when_to_set_to_false":"Set to false if the patient has not taken any mifepristone-containing product in the past 12 days prior to the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any mifepristone-containing product in the past 12 days prior to the screening visit.","meaning":"Boolean indicating whether the patient has taken any mifepristone-containing product in the past 12 days."} ;; "the patient has used mifepristone in the twelve days prior to the screening visit"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_taken_mifepristone_containing_product_inthepast12days)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used mifepristone in the twelve days prior to the screening visit."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_undergone_inhaled_steroid_therapy_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone inhaled steroid therapy at any time in the week prior to the screening visit.","when_to_set_to_false":"Set to false if the patient has not undergone inhaled steroid therapy at any time in the week prior to the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone inhaled steroid therapy in the week prior to the screening visit.","meaning":"Boolean indicating whether the patient has undergone inhaled steroid therapy in the week prior to the screening visit."} ;; "inhaled steroid"
(declare-const patient_has_undergone_inhaled_steroid_therapy_inthepast1weeks@@acute_basis_for_disease_exacerbation Bool) ;; {"when_to_set_to_true":"Set to true if the inhaled steroid therapy in the week prior to screening was performed on an acute basis for disease exacerbation.","when_to_set_to_false":"Set to false if the inhaled steroid therapy in the week prior to screening was not performed on an acute basis for disease exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the inhaled steroid therapy in the week prior to screening was performed on an acute basis for disease exacerbation.","meaning":"Boolean indicating whether the inhaled steroid therapy in the week prior to screening was performed on an acute basis for disease exacerbation."} ;; "inhaled steroid therapy on an acute basis for disease exacerbation in the week prior to the screening visit"
(declare-const patient_has_undergone_inhaled_bronchodilator_therapy_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone inhaled bronchodilator therapy (beta-agonist) at any time in the week prior to the screening visit.","when_to_set_to_false":"Set to false if the patient has not undergone inhaled bronchodilator therapy (beta-agonist) at any time in the week prior to the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone inhaled bronchodilator therapy (beta-agonist) in the week prior to the screening visit.","meaning":"Boolean indicating whether the patient has undergone inhaled bronchodilator therapy (beta-agonist) in the week prior to the screening visit."} ;; "inhaled beta-agonist"
(declare-const patient_has_undergone_inhaled_bronchodilator_therapy_inthepast1weeks@@acute_basis_for_disease_exacerbation Bool) ;; {"when_to_set_to_true":"Set to true if the inhaled bronchodilator therapy (beta-agonist) in the week prior to screening was performed on an acute basis for disease exacerbation.","when_to_set_to_false":"Set to false if the inhaled bronchodilator therapy (beta-agonist) in the week prior to screening was not performed on an acute basis for disease exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the inhaled bronchodilator therapy (beta-agonist) in the week prior to screening was performed on an acute basis for disease exacerbation.","meaning":"Boolean indicating whether the inhaled bronchodilator therapy (beta-agonist) in the week prior to screening was performed on an acute basis for disease exacerbation."} ;; "inhaled beta-agonist therapy on an acute basis for disease exacerbation in the week prior to the screening visit"
(declare-const patient_has_taken_albuterol_containing_product_inthepast1weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken an albuterol-containing product (e.g., Ventolin) at any time in the week prior to the screening visit.","when_to_set_to_false":"Set to false if the patient has not taken an albuterol-containing product (e.g., Ventolin) at any time in the week prior to the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken an albuterol-containing product (e.g., Ventolin) in the week prior to the screening visit.","meaning":"Boolean indicating whether the patient has taken an albuterol-containing product (e.g., Ventolin) in the week prior to the screening visit."} ;; "Ventolin (albuterol-containing product) in the week prior to the screening visit"
(declare-const patient_has_taken_albuterol_containing_product_inthepast1weeks@@acute_basis_for_disease_exacerbation Bool) ;; {"when_to_set_to_true":"Set to true if the albuterol-containing product (e.g., Ventolin) in the week prior to screening was taken on an acute basis for disease exacerbation.","when_to_set_to_false":"Set to false if the albuterol-containing product (e.g., Ventolin) in the week prior to screening was not taken on an acute basis for disease exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the albuterol-containing product (e.g., Ventolin) in the week prior to screening was taken on an acute basis for disease exacerbation.","meaning":"Boolean indicating whether the albuterol-containing product (e.g., Ventolin) in the week prior to screening was taken on an acute basis for disease exacerbation."} ;; "Ventolin (albuterol-containing product) taken on an acute basis for disease exacerbation in the week prior to the screening visit"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples: inhaled steroid and inhaled beta-agonist are examples of inhaled therapy
(assert
(! (=> (or patient_has_undergone_inhaled_steroid_therapy_inthepast1weeks
          patient_has_undergone_inhaled_bronchodilator_therapy_inthepast1weeks)
     (or patient_has_undergone_inhaled_steroid_therapy_inthepast1weeks
         patient_has_undergone_inhaled_bronchodilator_therapy_inthepast1weeks))
:named REQ7_AUXILIARY0)) ;; "inhaled therapy with non-exhaustive examples (inhaled steroid, inhaled beta-agonist...)"

;; Non-exhaustive examples: Ventolin is an example of inhaled beta-agonist
(assert
(! (=> patient_has_taken_albuterol_containing_product_inthepast1weeks
     patient_has_undergone_inhaled_bronchodilator_therapy_inthepast1weeks)
:named REQ7_AUXILIARY1)) ;; "Ventolin is a non-exhaustive example of inhaled beta-agonist"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_inhaled_steroid_therapy_inthepast1weeks@@acute_basis_for_disease_exacerbation
     patient_has_undergone_inhaled_steroid_therapy_inthepast1weeks)
:named REQ7_AUXILIARY2)) ;; "inhaled steroid therapy on an acute basis for disease exacerbation"

(assert
(! (=> patient_has_undergone_inhaled_bronchodilator_therapy_inthepast1weeks@@acute_basis_for_disease_exacerbation
     patient_has_undergone_inhaled_bronchodilator_therapy_inthepast1weeks)
:named REQ7_AUXILIARY3)) ;; "inhaled beta-agonist therapy on an acute basis for disease exacerbation"

(assert
(! (=> patient_has_taken_albuterol_containing_product_inthepast1weeks@@acute_basis_for_disease_exacerbation
     patient_has_taken_albuterol_containing_product_inthepast1weeks)
:named REQ7_AUXILIARY4)) ;; "Ventolin (albuterol-containing product) taken on an acute basis for disease exacerbation"

;; Qualifier variables for Ventolin imply qualifier for inhaled beta-agonist
(assert
(! (=> patient_has_taken_albuterol_containing_product_inthepast1weeks@@acute_basis_for_disease_exacerbation
     patient_has_undergone_inhaled_bronchodilator_therapy_inthepast1weeks@@acute_basis_for_disease_exacerbation)
:named REQ7_AUXILIARY5)) ;; "Ventolin (albuterol-containing product) taken on an acute basis for disease exacerbation implies inhaled beta-agonist therapy on an acute basis for disease exacerbation"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have used inhaled therapy (inhaled steroid, inhaled beta-agonist, or Ventolin) on an acute basis for disease exacerbation in the week prior to screening
(assert
(! (not (or patient_has_undergone_inhaled_steroid_therapy_inthepast1weeks@@acute_basis_for_disease_exacerbation
           patient_has_undergone_inhaled_bronchodilator_therapy_inthepast1weeks@@acute_basis_for_disease_exacerbation
           patient_has_taken_albuterol_containing_product_inthepast1weeks@@acute_basis_for_disease_exacerbation))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used inhaled therapy with non-exhaustive examples (inhaled steroid, inhaled beta-agonist with non-exhaustive examples (Ventolin)) on an acute basis for disease exacerbation in the week prior to the screening visit."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_exposed_to_analgesic_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to an analgesic substance at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to an analgesic substance at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to an analgesic substance in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to an analgesic substance at any time in the past."} ;; "analgesic"
(declare-const patient_is_exposed_to_analgesic_inthehistory@@immediate_release_formulation Bool) ;; {"when_to_set_to_true":"Set to true if the analgesic exposure was specifically to an immediate release formulation.","when_to_set_to_false":"Set to false if the analgesic exposure was not to an immediate release formulation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the analgesic exposure was to an immediate release formulation.","meaning":"Boolean indicating whether the analgesic exposure was specifically to an immediate release formulation."} ;; "immediate release analgesic"
(declare-const patient_is_exposed_to_analgesic_inthehistory@@temporalcontext_within4hours_before_study_medication_administration Bool) ;; {"when_to_set_to_true":"Set to true if the analgesic exposure occurred within four hours before administration of the study medication.","when_to_set_to_false":"Set to false if the analgesic exposure did not occur within four hours before administration of the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the analgesic exposure occurred within four hours before administration of the study medication.","meaning":"Boolean indicating whether the analgesic exposure occurred within four hours before administration of the study medication."} ;; "within four hours preceding administration of the study medication"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_analgesic_inthehistory@@immediate_release_formulation
      patient_is_exposed_to_analgesic_inthehistory)
:named REQ8_AUXILIARY0)) ;; "immediate release analgesic"

(assert
(! (=> patient_is_exposed_to_analgesic_inthehistory@@temporalcontext_within4hours_before_study_medication_administration
      patient_is_exposed_to_analgesic_inthehistory)
:named REQ8_AUXILIARY1)) ;; "within four hours preceding administration of the study medication"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (and patient_is_exposed_to_analgesic_inthehistory@@immediate_release_formulation
             patient_is_exposed_to_analgesic_inthehistory@@temporalcontext_within4hours_before_study_medication_administration))
:named REQ8_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used immediate release analgesic within four hours preceding administration of the study medication."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_exposed_to_analgesic_inthepast12hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to an analgesic within the past twelve hours.","when_to_set_to_false":"Set to false if the patient has not been exposed to an analgesic within the past twelve hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to an analgesic within the past twelve hours.","meaning":"Boolean indicating whether the patient has been exposed to an analgesic within the past twelve hours."} ;; "analgesic"
(declare-const patient_is_exposed_to_analgesic_inthepast12hours@@sustained_release_formulation Bool) ;; {"when_to_set_to_true":"Set to true if the analgesic exposure within the past twelve hours was specifically to a sustained release formulation.","when_to_set_to_false":"Set to false if the analgesic exposure within the past twelve hours was not to a sustained release formulation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the analgesic exposure within the past twelve hours was to a sustained release formulation.","meaning":"Boolean indicating whether the analgesic exposure within the past twelve hours was to a sustained release formulation."} ;; "sustained release analgesic"
(declare-const patient_is_exposed_to_analgesic_inthepast12hours@@temporalcontext_within12hours_preceding_study_medication_administration Bool) ;; {"when_to_set_to_true":"Set to true if the twelve-hour window is anchored to the period immediately preceding administration of the study medication.","when_to_set_to_false":"Set to false if the twelve-hour window is not anchored to the period immediately preceding administration of the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the twelve-hour window is anchored to the period immediately preceding administration of the study medication.","meaning":"Boolean indicating whether the twelve-hour window is anchored to the period immediately preceding administration of the study medication."} ;; "within twelve hours preceding administration of the study medication"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_analgesic_inthepast12hours@@sustained_release_formulation
      patient_is_exposed_to_analgesic_inthepast12hours)
:named REQ9_AUXILIARY0)) ;; "sustained release analgesic within twelve hours"

(assert
(! (=> patient_is_exposed_to_analgesic_inthepast12hours@@temporalcontext_within12hours_preceding_study_medication_administration
      patient_is_exposed_to_analgesic_inthepast12hours)
:named REQ9_AUXILIARY1)) ;; "within twelve hours preceding administration of the study medication"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (and patient_is_exposed_to_analgesic_inthepast12hours@@sustained_release_formulation
             patient_is_exposed_to_analgesic_inthepast12hours@@temporalcontext_within12hours_preceding_study_medication_administration))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used sustained release analgesic within twelve hours preceding administration of the study medication."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_exposed_to_cold_medication_inthepast4hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any cold medication within the 4 hours preceding administration of the dose of study medication.","when_to_set_to_false":"Set to false if the patient has not been exposed to any cold medication within the 4 hours preceding administration of the dose of study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any cold medication within the 4 hours preceding administration of the dose of study medication.","meaning":"Boolean indicating whether the patient has been exposed to any cold medication within the 4 hours preceding administration of the dose of study medication."} ;; "has used cold medication ... within four hours preceding administration of the dose of study medication"
(declare-const patient_is_exposed_to_decongestant_inthepast4hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a decongestant within the 4 hours preceding administration of the dose of study medication.","when_to_set_to_false":"Set to false if the patient has not been exposed to a decongestant within the 4 hours preceding administration of the dose of study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a decongestant within the 4 hours preceding administration of the dose of study medication.","meaning":"Boolean indicating whether the patient has been exposed to a decongestant within the past 4 hours."} ;; "decongestant ... within four hours preceding administration of the dose of study medication"
(declare-const patient_is_exposed_to_histamine_receptor_antagonist_inthepast4hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a histamine receptor antagonist (antihistamine) within the 4 hours preceding administration of the dose of study medication.","when_to_set_to_false":"Set to false if the patient has not been exposed to a histamine receptor antagonist (antihistamine) within the 4 hours preceding administration of the dose of study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a histamine receptor antagonist (antihistamine) within the 4 hours preceding administration of the dose of study medication.","meaning":"Boolean indicating whether the patient has been exposed to a histamine receptor antagonist (antihistamine) within the past 4 hours."} ;; "antihistamine ... within four hours preceding administration of the dose of study medication"
(declare-const patient_is_exposed_to_expectorant_agent_inthepast4hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to an expectorant agent within the 4 hours preceding administration of the dose of study medication.","when_to_set_to_false":"Set to false if the patient has not been exposed to an expectorant agent within the 4 hours preceding administration of the dose of study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to an expectorant agent within the 4 hours preceding administration of the dose of study medication.","meaning":"Boolean indicating whether the patient has been exposed to an expectorant agent within the past 4 hours."} ;; "expectorant ... within four hours preceding administration of the dose of study medication"
(declare-const patient_is_exposed_to_antitussive_agent_inthepast4hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to an antitussive agent within the 4 hours preceding administration of the dose of study medication.","when_to_set_to_false":"Set to false if the patient has not been exposed to an antitussive agent within the 4 hours preceding administration of the dose of study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to an antitussive agent within the 4 hours preceding administration of the dose of study medication.","meaning":"Boolean indicating whether the patient has been exposed to an antitussive agent within the past 4 hours."} ;; "antitussive ... within four hours preceding administration of the dose of study medication"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_exposed_to_decongestant_inthepast4hours
           patient_is_exposed_to_histamine_receptor_antagonist_inthepast4hours
           patient_is_exposed_to_expectorant_agent_inthepast4hours
           patient_is_exposed_to_antitussive_agent_inthepast4hours)
       patient_is_exposed_to_cold_medication_inthepast4hours)
   :named REQ10_AUXILIARY0)) ;; "with non-exhaustive examples (decongestant, antihistamine, expectorant, antitussive)"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_exposed_to_cold_medication_inthepast4hours)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used cold medication with non-exhaustive examples (decongestant, antihistamine, expectorant, antitussive) within four hours preceding administration of the dose of study medication."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_used_throat_lozenge_within_2_hours_before_administration_of_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used a throat lozenge within two hours before administration of the study medication.","when_to_set_to_false":"Set to false if the patient has not used a throat lozenge within two hours before administration of the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient used a throat lozenge within two hours before administration of the study medication.","meaning":"Boolean indicating whether the patient has used a throat lozenge within two hours preceding administration of the study medication."} ;; "the patient has used throat lozenge within two hours preceding administration of the study medication"

(declare-const patient_has_used_throat_spray_within_2_hours_before_administration_of_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used a throat spray within two hours before administration of the study medication.","when_to_set_to_false":"Set to false if the patient has not used a throat spray within two hours before administration of the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient used a throat spray within two hours before administration of the study medication.","meaning":"Boolean indicating whether the patient has used a throat spray within two hours preceding administration of the study medication."} ;; "the patient has used throat spray within two hours preceding administration of the study medication"

(declare-const patient_is_exposed_to_cough_drop_inthepast2hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a cough drop at any time in the two hours prior to the anchor event (administration of the study medication).","when_to_set_to_false":"Set to false if the patient has not been exposed to a cough drop in the two hours prior to the anchor event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to a cough drop in the two hours prior to the anchor event.","meaning":"Boolean indicating whether the patient has been exposed to a cough drop in the two hours prior to the anchor event (administration of the study medication)."} ;; "the patient has used cough drop within two hours preceding administration of the study medication"

(declare-const patient_is_exposed_to_cough_drop_inthepast2hours@@temporalcontext_within2hours_before_administration_of_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to a cough drop occurred within two hours before administration of the study medication.","when_to_set_to_false":"Set to false if the exposure did not occur within two hours before administration of the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within two hours before administration of the study medication.","meaning":"Boolean indicating whether the exposure to a cough drop occurred within two hours before administration of the study medication."} ;; "the patient has used cough drop within two hours preceding administration of the study medication"

(declare-const patient_is_taking_menthol_containing_product_inthepast2hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a menthol-containing product at any time in the two hours prior to the anchor event (administration of the study medication).","when_to_set_to_false":"Set to false if the patient has not taken a menthol-containing product in the two hours prior to the anchor event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient took a menthol-containing product in the two hours prior to the anchor event.","meaning":"Boolean indicating whether the patient has taken a menthol-containing product in the two hours prior to the anchor event (administration of the study medication)."} ;; "the patient has used menthol-containing product within two hours preceding administration of the study medication"

(declare-const patient_is_taking_menthol_containing_product_inthepast2hours@@temporalcontext_within2hours_before_administration_of_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the taking of a menthol-containing product occurred within two hours before administration of the study medication.","when_to_set_to_false":"Set to false if the taking did not occur within two hours before administration of the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the taking occurred within two hours before administration of the study medication.","meaning":"Boolean indicating whether the taking of a menthol-containing product occurred within two hours before administration of the study medication."} ;; "the patient has used menthol-containing product within two hours preceding administration of the study medication"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable for cough drop
(assert
(! (=> patient_is_exposed_to_cough_drop_inthepast2hours@@temporalcontext_within2hours_before_administration_of_study_medication
       patient_is_exposed_to_cough_drop_inthepast2hours)
    :named REQ11_AUXILIARY0)) ;; "exposure to a cough drop occurred within two hours before administration of the study medication"

;; Qualifier variable implies corresponding stem variable for menthol-containing product
(assert
(! (=> patient_is_taking_menthol_containing_product_inthepast2hours@@temporalcontext_within2hours_before_administration_of_study_medication
       patient_is_taking_menthol_containing_product_inthepast2hours)
    :named REQ11_AUXILIARY1)) ;; "taking of a menthol-containing product occurred within two hours before administration of the study medication"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_used_throat_lozenge_within_2_hours_before_administration_of_study_medication)
    :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has used throat lozenge within two hours preceding administration of the study medication"

(assert
(! (not patient_has_used_throat_spray_within_2_hours_before_administration_of_study_medication)
    :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has used throat spray within two hours preceding administration of the study medication"

(assert
(! (not patient_is_exposed_to_cough_drop_inthepast2hours@@temporalcontext_within2hours_before_administration_of_study_medication)
    :named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has used cough drop within two hours preceding administration of the study medication"

(assert
(! (not patient_is_taking_menthol_containing_product_inthepast2hours@@temporalcontext_within2hours_before_administration_of_study_medication)
    :named REQ11_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient has used menthol-containing product within two hours preceding administration of the study medication"

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_exposed_to_caffeine_containing_beverage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has consumed any beverage containing caffeine within the relevant timeframe (see qualifiers for precise window).","when_to_set_to_false":"Set to false if the patient has not consumed any beverage containing caffeine within the relevant timeframe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has consumed any beverage containing caffeine within the relevant timeframe.","meaning":"Boolean indicating whether the patient is currently exposed to any caffeine-containing beverage."} ;; "caffeine-containing beverage"
(declare-const patient_is_exposed_to_caffeine_containing_beverage_now@@temporalcontext_within5minutes_before_administration_of_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to any caffeine-containing beverage occurred within five minutes before administration of the study medication.","when_to_set_to_false":"Set to false if the patient's exposure to any caffeine-containing beverage did not occur within five minutes before administration of the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to any caffeine-containing beverage occurred within five minutes before administration of the study medication.","meaning":"Boolean indicating whether the patient's exposure to any caffeine-containing beverage occurred within five minutes before administration of the study medication."} ;; "within five minutes preceding administration of the study medication"
(declare-const patient_is_exposed_to_coffee_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has consumed coffee within the relevant timeframe (see qualifiers for precise window).","when_to_set_to_false":"Set to false if the patient has not consumed coffee within the relevant timeframe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has consumed coffee within the relevant timeframe.","meaning":"Boolean indicating whether the patient is currently exposed to coffee."} ;; "coffee"
(declare-const patient_is_exposed_to_coffee_now@@temporalcontext_within5minutes_before_administration_of_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to coffee occurred within five minutes before administration of the study medication.","when_to_set_to_false":"Set to false if the patient's exposure to coffee did not occur within five minutes before administration of the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to coffee occurred within five minutes before administration of the study medication.","meaning":"Boolean indicating whether the patient's exposure to coffee occurred within five minutes before administration of the study medication."} ;; "coffee within five minutes preceding administration of the study medication"
(declare-const patient_is_exposed_to_tea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has consumed tea within the relevant timeframe (see qualifiers for precise window).","when_to_set_to_false":"Set to false if the patient has not consumed tea within the relevant timeframe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has consumed tea within the relevant timeframe.","meaning":"Boolean indicating whether the patient is currently exposed to tea."} ;; "tea"
(declare-const patient_is_exposed_to_tea_now@@temporalcontext_within5minutes_before_administration_of_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to tea occurred within five minutes before administration of the study medication.","when_to_set_to_false":"Set to false if the patient's exposure to tea did not occur within five minutes before administration of the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to tea occurred within five minutes before administration of the study medication.","meaning":"Boolean indicating whether the patient's exposure to tea occurred within five minutes before administration of the study medication."} ;; "tea within five minutes preceding administration of the study medication"
(declare-const patient_is_exposed_to_hot_chocolate_drink_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has consumed hot chocolate drink within the relevant timeframe (see qualifiers for precise window).","when_to_set_to_false":"Set to false if the patient has not consumed hot chocolate drink within the relevant timeframe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has consumed hot chocolate drink within the relevant timeframe.","meaning":"Boolean indicating whether the patient is currently exposed to hot chocolate drink."} ;; "hot chocolate"
(declare-const patient_is_exposed_to_hot_chocolate_drink_now@@temporalcontext_within5minutes_before_administration_of_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to hot chocolate drink occurred within five minutes before administration of the study medication.","when_to_set_to_false":"Set to false if the patient's exposure to hot chocolate drink did not occur within five minutes before administration of the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to hot chocolate drink occurred within five minutes before administration of the study medication.","meaning":"Boolean indicating whether the patient's exposure to hot chocolate drink occurred within five minutes before administration of the study medication."} ;; "hot chocolate within five minutes preceding administration of the study medication"
(declare-const patient_is_exposed_to_caffeinated_soft_drinks_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has consumed caffeinated soft drinks within the relevant timeframe (see qualifiers for precise window).","when_to_set_to_false":"Set to false if the patient has not consumed caffeinated soft drinks within the relevant timeframe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has consumed caffeinated soft drinks within the relevant timeframe.","meaning":"Boolean indicating whether the patient is currently exposed to caffeinated soft drinks."} ;; "caffeinated soft drink"
(declare-const patient_is_exposed_to_caffeinated_soft_drinks_now@@temporalcontext_within5minutes_before_administration_of_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to caffeinated soft drinks occurred within five minutes before administration of the study medication.","when_to_set_to_false":"Set to false if the patient's exposure to caffeinated soft drinks did not occur within five minutes before administration of the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to caffeinated soft drinks occurred within five minutes before administration of the study medication.","meaning":"Boolean indicating whether the patient's exposure to caffeinated soft drinks occurred within five minutes before administration of the study medication."} ;; "caffeinated soft drink within five minutes preceding administration of the study medication"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_exposed_to_coffee_now@@temporalcontext_within5minutes_before_administration_of_study_medication
           patient_is_exposed_to_tea_now@@temporalcontext_within5minutes_before_administration_of_study_medication
           patient_is_exposed_to_hot_chocolate_drink_now@@temporalcontext_within5minutes_before_administration_of_study_medication
           patient_is_exposed_to_caffeinated_soft_drinks_now@@temporalcontext_within5minutes_before_administration_of_study_medication)
        patient_is_exposed_to_caffeine_containing_beverage_now@@temporalcontext_within5minutes_before_administration_of_study_medication)
:named REQ12_AUXILIARY0)) ;; "with non-exhaustive examples (coffee, tea, hot chocolate, caffeinated soft drink) within five minutes preceding administration of the study medication"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_caffeine_containing_beverage_now@@temporalcontext_within5minutes_before_administration_of_study_medication
       patient_is_exposed_to_caffeine_containing_beverage_now)
:named REQ12_AUXILIARY1)) ;; "caffeine-containing beverage within five minutes preceding administration of the study medication"

(assert
(! (=> patient_is_exposed_to_coffee_now@@temporalcontext_within5minutes_before_administration_of_study_medication
       patient_is_exposed_to_coffee_now)
:named REQ12_AUXILIARY2)) ;; "coffee within five minutes preceding administration of the study medication"

(assert
(! (=> patient_is_exposed_to_tea_now@@temporalcontext_within5minutes_before_administration_of_study_medication
       patient_is_exposed_to_tea_now)
:named REQ12_AUXILIARY3)) ;; "tea within five minutes preceding administration of the study medication"

(assert
(! (=> patient_is_exposed_to_hot_chocolate_drink_now@@temporalcontext_within5minutes_before_administration_of_study_medication
       patient_is_exposed_to_hot_chocolate_drink_now)
:named REQ12_AUXILIARY4)) ;; "hot chocolate within five minutes preceding administration of the study medication"

(assert
(! (=> patient_is_exposed_to_caffeinated_soft_drinks_now@@temporalcontext_within5minutes_before_administration_of_study_medication
       patient_is_exposed_to_caffeinated_soft_drinks_now)
:named REQ12_AUXILIARY5)) ;; "caffeinated soft drink within five minutes preceding administration of the study medication"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_is_exposed_to_caffeine_containing_beverage_now@@temporalcontext_within5minutes_before_administration_of_study_medication)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has consumed caffeine-containing beverage with non-exhaustive examples (coffee, tea, hot chocolate, caffeinated soft drink) within five minutes preceding administration of the study medication."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_mouth_breathing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any evidence of mouth-breathing.","when_to_set_to_false":"Set to false if the patient currently does not have any evidence of mouth-breathing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any evidence of mouth-breathing.","meaning":"Boolean indicating whether the patient currently has any evidence of mouth-breathing."} ;; "mouth-breathing"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_finding_of_mouth_breathing_now)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any evidence of mouth-breathing (which could worsen sore throat pain)."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough.","when_to_set_to_false":"Set to false if the patient currently does not have cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."} ;; "coughing"
(declare-const patient_has_finding_of_cough_now@@causes_throat_discomfort Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cough causes throat discomfort.","when_to_set_to_false":"Set to false if the patient's current cough does not cause throat discomfort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cough causes throat discomfort.","meaning":"Boolean indicating whether the patient's current cough causes throat discomfort."} ;; "coughing that causes throat discomfort"
(declare-const patient_has_finding_of_pain_in_throat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain in throat (throat discomfort).","when_to_set_to_false":"Set to false if the patient currently does not have pain in throat (throat discomfort).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain in throat (throat discomfort).","meaning":"Boolean indicating whether the patient currently has pain in throat (throat discomfort)."} ;; "throat discomfort"
(declare-const patient_has_finding_of_active_physical_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any active physical disease.","when_to_set_to_false":"Set to false if the patient currently does not have any active physical disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any active physical disease.","meaning":"Boolean indicating whether the patient currently has any active physical disease."} ;; "any active physical disease"
(declare-const patient_has_finding_of_active_physical_disease_now@@could_compromise_respiratory_function_and_worsen_sore_throat Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current active physical disease could compromise respiratory function and worsen sore throat.","when_to_set_to_false":"Set to false if the patient's current active physical disease could not compromise respiratory function and worsen sore throat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current active physical disease could compromise respiratory function and worsen sore throat.","meaning":"Boolean indicating whether the patient's current active physical disease could compromise respiratory function and worsen sore throat."} ;; "any active physical disease ... which could compromise respiratory function and worsen sore throat"
(declare-const patient_has_finding_of_bronchopneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bronchopneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have bronchopneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bronchopneumonia.","meaning":"Boolean indicating whether the patient currently has bronchopneumonia."} ;; "bronchopneumonia"
(declare-const patient_has_finding_of_bronchopneumonia_now@@could_compromise_respiratory_function_and_worsen_sore_throat Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bronchopneumonia could compromise respiratory function and worsen sore throat.","when_to_set_to_false":"Set to false if the patient's current bronchopneumonia could not compromise respiratory function and worsen sore throat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bronchopneumonia could compromise respiratory function and worsen sore throat.","meaning":"Boolean indicating whether the patient's current bronchopneumonia could compromise respiratory function and worsen sore throat."} ;; "bronchopneumonia which could compromise respiratory function and worsen sore throat"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variable implies stem variable for cough
(assert
(! (=> patient_has_finding_of_cough_now@@causes_throat_discomfort
      patient_has_finding_of_cough_now)
    :named REQ14_AUXILIARY0)) ;; "coughing that causes throat discomfort"

;; Qualifier variable implies stem variable for active physical disease
(assert
(! (=> patient_has_finding_of_active_physical_disease_now@@could_compromise_respiratory_function_and_worsen_sore_throat
      patient_has_finding_of_active_physical_disease_now)
    :named REQ14_AUXILIARY1)) ;; "any active physical disease ... which could compromise respiratory function and worsen sore throat"

;; Qualifier variable implies stem variable for bronchopneumonia
(assert
(! (=> patient_has_finding_of_bronchopneumonia_now@@could_compromise_respiratory_function_and_worsen_sore_throat
      patient_has_finding_of_bronchopneumonia_now)
    :named REQ14_AUXILIARY2)) ;; "bronchopneumonia which could compromise respiratory function and worsen sore throat"

;; Non-exhaustive example: bronchopneumonia is an example of active physical disease that could compromise respiratory function and worsen sore throat
(assert
(! (=> patient_has_finding_of_bronchopneumonia_now@@could_compromise_respiratory_function_and_worsen_sore_throat
      patient_has_finding_of_active_physical_disease_now@@could_compromise_respiratory_function_and_worsen_sore_throat)
    :named REQ14_AUXILIARY3)) ;; "bronchopneumonia ... such as ... which could compromise respiratory function and worsen sore throat"

;; ===================== Constraint Assertions (REQ 14) =====================
;; Exclusion: patient has coughing that causes throat discomfort
(assert
(! (not patient_has_finding_of_cough_now@@causes_throat_discomfort)
    :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has coughing that causes throat discomfort."

;; Exclusion: patient has any active physical disease (such as bronchopneumonia) which could compromise respiratory function and worsen sore throat
(assert
(! (not patient_has_finding_of_active_physical_disease_now@@could_compromise_respiratory_function_and_worsen_sore_throat)
    :named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any active physical disease with non-exhaustive examples (bronchopneumonia) which could compromise respiratory function and worsen sore throat."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_is_unable_to_comply_with_study_requirements_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if, in the opinion of the Investigator, the patient is unable to comply fully with the study requirements.","when_to_set_to_false":"Set to false if, in the opinion of the Investigator, the patient is able to comply fully with the study requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the opinion of the Investigator, the patient is unable to comply fully with the study requirements.","meaning":"Boolean indicating whether, in the opinion of the Investigator, the patient is unable to comply fully with the study requirements."} ;; "in the opinion of the Investigator, the patient is unable to comply fully with the study requirements"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_is_unable_to_comply_with_study_requirements_investigator_opinion)
:named REQ15_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (in the opinion of the Investigator, the patient is unable to comply fully with the study requirements)."
