;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an acute exacerbation of chronic obstructive airways disease (COPD) in their history.","when_to_set_to_false":"Set to false if the patient has never had an acute exacerbation of chronic obstructive airways disease (COPD) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an acute exacerbation of chronic obstructive airways disease (COPD).","meaning":"Boolean indicating whether the patient has ever had an acute exacerbation of chronic obstructive airways disease (COPD) in their history."} ;; "acute exacerbation of chronic obstructive pulmonary disease"

(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_within_30_days_from_last_dose_of_antibiotic_treatment_as_of_initiating_eligibility_evaluation Bool) ;; {"when_to_set_to_true":"Set to true if the acute exacerbation of COPD occurred within thirty days from the last dose of antibiotic treatment as of initiating eligibility evaluation.","when_to_set_to_false":"Set to false if the acute exacerbation of COPD did not occur within thirty days from the last dose of antibiotic treatment as of initiating eligibility evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute exacerbation of COPD occurred within thirty days from the last dose of antibiotic treatment as of initiating eligibility evaluation.","meaning":"Boolean indicating whether the acute exacerbation of COPD occurred within thirty days from the last dose of antibiotic treatment as of initiating eligibility evaluation."} ;; "less than thirty days from last dose of antibiotic treatment for acute exacerbation of chronic obstructive pulmonary disease as of initiating eligibility evaluation"

(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_within_30_days_since_new_or_increased_dose_of_systemic_corticosteroid_treatment_as_of_initiating_eligibility_evaluation Bool) ;; {"when_to_set_to_true":"Set to true if the acute exacerbation of COPD occurred within thirty days since a new or increased dose of systemic corticosteroid treatment as of initiating eligibility evaluation.","when_to_set_to_false":"Set to false if the acute exacerbation of COPD did not occur within thirty days since a new or increased dose of systemic corticosteroid treatment as of initiating eligibility evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute exacerbation of COPD occurred within thirty days since a new or increased dose of systemic corticosteroid treatment as of initiating eligibility evaluation.","meaning":"Boolean indicating whether the acute exacerbation of COPD occurred within thirty days since a new or increased dose of systemic corticosteroid treatment as of initiating eligibility evaluation."} ;; "less than thirty days since a new or increased dose of systemic corticosteroid treatment for acute exacerbation of chronic obstructive pulmonary disease as of initiating eligibility evaluation"

(declare-const patient_is_on_systemic_corticosteroid_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving systemic corticosteroid treatment.","when_to_set_to_false":"Set to false if the patient is not currently receiving systemic corticosteroid treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving systemic corticosteroid treatment.","meaning":"Boolean indicating whether the patient is currently receiving systemic corticosteroid treatment."} ;; "systemic corticosteroid treatment"

(declare-const patient_is_on_systemic_corticosteroid_treatment_now@@chronic_use_while_health_is_stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving systemic corticosteroid treatment and the use is chronic while the patient's health is stable.","when_to_set_to_false":"Set to false if the patient is currently receiving systemic corticosteroid treatment but the use is not chronic while health is stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving systemic corticosteroid treatment as chronic use while health is stable.","meaning":"Boolean indicating whether the patient is currently receiving systemic corticosteroid treatment as chronic use while health is stable."} ;; "chronic use of systemic corticosteroid treatment while health is stable is not exclusionary"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable for antibiotic treatment window
(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_within_30_days_from_last_dose_of_antibiotic_treatment_as_of_initiating_eligibility_evaluation
      patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory)
    :named REQ0_AUXILIARY0)) ;; "within thirty days from last dose of antibiotic treatment for acute exacerbation of chronic obstructive pulmonary disease"

;; Qualifier variable implies stem variable for corticosteroid treatment window
(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_within_30_days_since_new_or_increased_dose_of_systemic_corticosteroid_treatment_as_of_initiating_eligibility_evaluation
      patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory)
    :named REQ0_AUXILIARY1)) ;; "within thirty days since a new or increased dose of systemic corticosteroid treatment for acute exacerbation of chronic obstructive pulmonary disease"

;; Chronic use of systemic corticosteroid treatment while health is stable is not exclusionary
(assert
(! (=> patient_is_on_systemic_corticosteroid_treatment_now@@chronic_use_while_health_is_stable
      patient_is_on_systemic_corticosteroid_treatment_now)
    :named REQ0_AUXILIARY2)) ;; "chronic use of systemic corticosteroid treatment while health is stable is not exclusionary"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion if either: (1) within 30 days from last dose of antibiotic for acute exacerbation of COPD, OR (2) within 30 days since new/increased dose of systemic corticosteroid for acute exacerbation of COPD (but chronic use while stable is NOT exclusionary)
(assert
(! (not (or patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_within_30_days_from_last_dose_of_antibiotic_treatment_as_of_initiating_eligibility_evaluation
           (and patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_within_30_days_since_new_or_increased_dose_of_systemic_corticosteroid_treatment_as_of_initiating_eligibility_evaluation
                (not patient_is_on_systemic_corticosteroid_treatment_now@@chronic_use_while_health_is_stable))))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is less than thirty days from last dose of antibiotic treatment for acute exacerbation of chronic obstructive pulmonary disease as of initiating eligibility evaluation) OR (the patient is less than thirty days since a new or increased dose of systemic corticosteroid treatment for acute exacerbation of chronic obstructive pulmonary disease as of initiating eligibility evaluation)). Chronic use of systemic corticosteroid treatment while health is stable is not exclusionary."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_after_screening_starts_and_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the acute exacerbation of chronic obstructive pulmonary disease occurred after screening starts and prior to randomization.","when_to_set_to_false":"Set to false if the acute exacerbation did not occur in that window.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the event occurred after screening starts and prior to randomization.","meaning":"Boolean indicating whether the acute exacerbation of chronic obstructive pulmonary disease occurred after screening starts and prior to randomization."} ;; "after screening starts and prior to randomization"

(declare-const patient_has_undergone_antibiotic_therapy_inthehistory@@temporalcontext_after_screening_starts_and_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antibiotic therapy after screening starts and prior to randomization.","when_to_set_to_false":"Set to false if the patient has not undergone antibiotic therapy after screening starts and prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone antibiotic therapy after screening starts and prior to randomization.","meaning":"Boolean indicating whether the patient has undergone antibiotic therapy after screening starts and prior to randomization."} ;; "requiring antibiotic treatment after screening starts and prior to randomization"

(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@administered_as_new_or_increased_dose@@temporalcontext_after_screening_starts_and_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a new or increased dose of systemic corticosteroid after screening starts and prior to randomization.","when_to_set_to_false":"Set to false if the patient has not taken a new or increased dose of systemic corticosteroid after screening starts and prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a new or increased dose of systemic corticosteroid after screening starts and prior to randomization.","meaning":"Boolean indicating whether the patient has taken a new or increased dose of systemic corticosteroid after screening starts and prior to randomization."} ;; "requiring a new or increased dose of systemic corticosteroid treatment after screening starts and prior to randomization"

(declare-const patient_has_undergone_oxygen_therapy_inthehistory@@temporalcontext_after_screening_starts_and_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone oxygen therapy after screening starts and prior to randomization.","when_to_set_to_false":"Set to false if the patient has not undergone oxygen therapy after screening starts and prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone oxygen therapy after screening starts and prior to randomization.","meaning":"Boolean indicating whether the patient has undergone oxygen therapy after screening starts and prior to randomization."} ;; "requiring oxygen treatment after screening starts and prior to randomization"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion 1: COPD exacerbation requiring antibiotic treatment after screening starts and prior to randomization
(assert
(! (not (and patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_after_screening_starts_and_prior_to_randomization
             patient_has_undergone_antibiotic_therapy_inthehistory@@temporalcontext_after_screening_starts_and_prior_to_randomization))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a chronic obstructive pulmonary disease exacerbation requiring antibiotic treatment after screening starts and prior to randomization."

;; Exclusion 2: COPD exacerbation requiring a new or increased dose of systemic corticosteroid treatment after screening starts and prior to randomization
(assert
(! (not (and patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_after_screening_starts_and_prior_to_randomization
             patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthehistory@@administered_as_new_or_increased_dose@@temporalcontext_after_screening_starts_and_prior_to_randomization))
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a chronic obstructive pulmonary disease exacerbation requiring a new or increased dose of systemic corticosteroid treatment after screening starts and prior to randomization."

;; Exclusion 3: COPD exacerbation requiring oxygen treatment after screening starts and prior to randomization
(assert
(! (not (and patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_after_screening_starts_and_prior_to_randomization
             patient_has_undergone_oxygen_therapy_inthehistory@@temporalcontext_after_screening_starts_and_prior_to_randomization))
   :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a chronic obstructive pulmonary disease exacerbation requiring oxygen treatment after screening starts and prior to randomization."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic obstructive lung disease (COPD).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic obstructive lung disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chronic obstructive lung disease (COPD).","meaning":"Boolean indicating whether the patient currently has chronic obstructive lung disease (COPD)."} ;; "chronic obstructive pulmonary disease"
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now@@hospitalization_for_this_condition_within_30_days_prior_to_eligibility_evaluation Bool) ;; {"when_to_set_to_true":"Set to true if the patient was discharged from an acute care hospital less than thirty days ago after hospitalization for chronic obstructive lung disease (COPD), as of initiating eligibility evaluation.","when_to_set_to_false":"Set to false if the patient was not discharged from an acute care hospital less than thirty days ago after hospitalization for chronic obstructive lung disease (COPD), as of initiating eligibility evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was discharged from an acute care hospital less than thirty days ago after hospitalization for chronic obstructive lung disease (COPD), as of initiating eligibility evaluation.","meaning":"Boolean indicating whether the patient was discharged from an acute care hospital less than thirty days ago after hospitalization for chronic obstructive lung disease (COPD), as of initiating eligibility evaluation."} ;; "less than thirty days post discharge from an acute care hospital after acute care hospitalization for chronic obstructive pulmonary disease as of initiating eligibility evaluation"
(declare-const patient_has_finding_of_another_condition_now@@hospitalization_for_this_condition_within_30_days_prior_to_eligibility_evaluation Bool) ;; {"when_to_set_to_true":"Set to true if the patient was discharged from an acute care hospital less than thirty days ago after hospitalization for another condition, as of initiating eligibility evaluation.","when_to_set_to_false":"Set to false if the patient was not discharged from an acute care hospital less than thirty days ago after hospitalization for another condition, as of initiating eligibility evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was discharged from an acute care hospital less than thirty days ago after hospitalization for another condition, as of initiating eligibility evaluation.","meaning":"Boolean indicating whether the patient was discharged from an acute care hospital less than thirty days ago after hospitalization for another condition, as of initiating eligibility evaluation."} ;; "less than thirty days post discharge from an acute care hospital after acute care hospitalization for another condition as of initiating eligibility evaluation"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable for COPD
(assert
(! (=> patient_has_finding_of_chronic_obstructive_lung_disease_now@@hospitalization_for_this_condition_within_30_days_prior_to_eligibility_evaluation
      patient_has_finding_of_chronic_obstructive_lung_disease_now)
:named REQ2_AUXILIARY0)) ;; "hospitalization for chronic obstructive pulmonary disease within 30 days prior to eligibility evaluation"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT be less than thirty days post discharge from acute care hospital after hospitalization for COPD
(assert
(! (not patient_has_finding_of_chronic_obstructive_lung_disease_now@@hospitalization_for_this_condition_within_30_days_prior_to_eligibility_evaluation)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is less than thirty days post discharge from an acute care hospital after acute care hospitalization for chronic obstructive pulmonary disease as of initiating eligibility evaluation."

;; Exclusion: patient must NOT be less than thirty days post discharge from acute care hospital after hospitalization for another condition
(assert
(! (not patient_has_finding_of_another_condition_now@@hospitalization_for_this_condition_within_30_days_prior_to_eligibility_evaluation)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is less than thirty days post discharge from an acute care hospital after acute care hospitalization for another condition as of initiating eligibility evaluation."

;; --- verifier-bypassed (attempt 8/8) 2025-10-24T07:06:54.447574 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_new_prescription_of_supplemental_oxygen_therapy_after_screening_starts_and_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a new prescription of supplemental oxygen therapy after screening starts and before randomization.","when_to_set_to_false":"Set to false if the patient does not have a new prescription of supplemental oxygen therapy after screening starts and before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a new prescription of supplemental oxygen therapy after screening starts and before randomization.","meaning":"Boolean indicating whether the patient has a new prescription of supplemental oxygen therapy after screening starts and before randomization."} ;; "The patient is excluded if the patient has a new prescription of supplemental oxygen therapy after screening starts and before randomization."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_new_prescription_of_supplemental_oxygen_therapy_after_screening_starts_and_before_randomization)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a new prescription of supplemental oxygen therapy after screening starts and before randomization."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_opening_of_chest_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone thoracotomy (opening of chest) in the six months before study entry.","when_to_set_to_false":"Set to false if the patient has not undergone thoracotomy (opening of chest) in the six months before study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone thoracotomy (opening of chest) in the six months before study entry.","meaning":"Boolean indicating whether the patient has undergone thoracotomy (opening of chest) in the six months before study entry."} ;; "thoracotomy in the six months before study entry"

(declare-const patient_has_undergone_sternotomy_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone sternotomy in the six months before study entry.","when_to_set_to_false":"Set to false if the patient has not undergone sternotomy in the six months before study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone sternotomy in the six months before study entry.","meaning":"Boolean indicating whether the patient has undergone sternotomy in the six months before study entry."} ;; "sternotomy in the six months before study entry"

(declare-const patient_has_undergone_major_cardiopulmonary_intervention_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a major cardiopulmonary intervention in the six months before study entry.","when_to_set_to_false":"Set to false if the patient has not undergone a major cardiopulmonary intervention in the six months before study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a major cardiopulmonary intervention in the six months before study entry.","meaning":"Boolean indicating whether the patient has undergone a major cardiopulmonary intervention in the six months before study entry."} ;; "major cardiopulmonary intervention in the six months before study entry"

(declare-const patient_has_undergone_lung_excision_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone lung excision (lung resection) in the six months before study entry.","when_to_set_to_false":"Set to false if the patient has not undergone lung excision (lung resection) in the six months before study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone lung excision (lung resection) in the six months before study entry.","meaning":"Boolean indicating whether the patient has undergone lung excision (lung resection) in the six months before study entry."} ;; "lung resection in the six months before study entry (example of major cardiopulmonary intervention)"

(declare-const patient_has_undergone_open_heart_surgery_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone open heart surgery in the six months before study entry.","when_to_set_to_false":"Set to false if the patient has not undergone open heart surgery in the six months before study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone open heart surgery in the six months before study entry.","meaning":"Boolean indicating whether the patient has undergone open heart surgery in the six months before study entry."} ;; "open heart surgery in the six months before study entry (example of major cardiopulmonary intervention)"

(declare-const patient_has_undergone_procedure_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any procedure in the six months before study entry.","when_to_set_to_false":"Set to false if the patient has not undergone any procedure in the six months before study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any procedure in the six months before study entry.","meaning":"Boolean indicating whether the patient has undergone any procedure in the six months before study entry."} ;; "any procedure in the six months before study entry"

(declare-const patient_has_undergone_procedure_inthepast6months@@likely_to_cause_instability_of_pulmonary_status Bool) ;; {"when_to_set_to_true":"Set to true if the procedure undergone by the patient in the six months before study entry is likely to cause instability of pulmonary status.","when_to_set_to_false":"Set to false if the procedure undergone by the patient in the six months before study entry is not likely to cause instability of pulmonary status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is likely to cause instability of pulmonary status.","meaning":"Boolean indicating whether the procedure undergone in the six months before study entry is likely to cause instability of pulmonary status."} ;; "procedure in the six months before study entry that is likely to cause instability of pulmonary status"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term for major cardiopulmonary intervention
(assert
(! (=> (or patient_has_undergone_lung_excision_inthepast6months
          patient_has_undergone_open_heart_surgery_inthepast6months)
     patient_has_undergone_major_cardiopulmonary_intervention_inthepast6months)
:named REQ4_AUXILIARY0)) ;; "major cardiopulmonary intervention with non-exhaustive examples (lung resection, open heart surgery) in the six months before study entry"

;; Qualifier variable implies corresponding stem variable for procedure
(assert
(! (=> patient_has_undergone_procedure_inthepast6months@@likely_to_cause_instability_of_pulmonary_status
     patient_has_undergone_procedure_inthepast6months)
:named REQ4_AUXILIARY1)) ;; "procedure in the six months before study entry that is likely to cause instability of pulmonary status"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_undergone_opening_of_chest_inthepast6months)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had thoracotomy in the six months before study entry."

(assert
(! (not patient_has_undergone_sternotomy_inthepast6months)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had sternotomy in the six months before study entry."

(assert
(! (not patient_has_undergone_major_cardiopulmonary_intervention_inthepast6months)
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had major cardiopulmonary intervention with non-exhaustive examples (lung resection, open heart surgery) in the six months before study entry."

(assert
(! (not patient_has_undergone_procedure_inthepast6months@@likely_to_cause_instability_of_pulmonary_status)
:named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had another procedure in the six months before study entry that is likely to cause instability of pulmonary status."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the lung.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the lung.","meaning":"Boolean indicating whether the patient currently has a disorder of the lung."} ;; "lung disease"
(declare-const patient_has_finding_of_disorder_of_lung_now@@affects_oxygenation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the lung affects oxygenation.","when_to_set_to_false":"Set to false if the patient's current disorder of the lung does not affect oxygenation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of the lung affects oxygenation.","meaning":"Boolean indicating whether the patient's current disorder of the lung affects oxygenation."} ;; "lung disease that affects oxygenation"
(declare-const patient_has_finding_of_disorder_of_lung_now@@affects_survival Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the lung affects survival.","when_to_set_to_false":"Set to false if the patient's current disorder of the lung does not affect survival.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of the lung affects survival.","meaning":"Boolean indicating whether the patient's current disorder of the lung affects survival."} ;; "lung disease that affects survival"
(declare-const patient_has_finding_of_disorder_of_lung_now@@non_chronic_obstructive_pulmonary_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the lung is not chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient's current disorder of the lung is chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of the lung is chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient's current disorder of the lung is not chronic obstructive pulmonary disease."} ;; "non-chronic obstructive pulmonary disease lung disease"
(declare-const patient_has_finding_of_disorder_of_lung_now@@non_chronic_obstructive_pulmonary_disease@@affects_oxygenation Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the lung that is not chronic obstructive pulmonary disease and the disorder affects oxygenation.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the lung that is not chronic obstructive pulmonary disease and/or the disorder does not affect oxygenation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the lung that is not chronic obstructive pulmonary disease and the disorder affects oxygenation.","meaning":"Boolean indicating whether the patient currently has a disorder of the lung that is not chronic obstructive pulmonary disease and the disorder affects oxygenation."} ;; "non-chronic obstructive pulmonary disease lung disease that affects oxygenation"
(declare-const patient_has_finding_of_disorder_of_lung_now@@non_chronic_obstructive_pulmonary_disease@@affects_survival Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the lung that is not chronic obstructive pulmonary disease and the disorder affects survival.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the lung that is not chronic obstructive pulmonary disease and/or the disorder does not affect survival.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the lung that is not chronic obstructive pulmonary disease and the disorder affects survival.","meaning":"Boolean indicating whether the patient currently has a disorder of the lung that is not chronic obstructive pulmonary disease and the disorder affects survival."} ;; "non-chronic obstructive pulmonary disease lung disease that affects survival"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definitional: The conjunction of qualifiers defines the composite variable
(assert
(! (= patient_has_finding_of_disorder_of_lung_now@@non_chronic_obstructive_pulmonary_disease@@affects_oxygenation
      (and patient_has_finding_of_disorder_of_lung_now
           patient_has_finding_of_disorder_of_lung_now@@non_chronic_obstructive_pulmonary_disease
           patient_has_finding_of_disorder_of_lung_now@@affects_oxygenation))
   :named REQ5_AUXILIARY0)) ;; "non-chronic obstructive pulmonary disease lung disease that affects oxygenation"

(assert
(! (= patient_has_finding_of_disorder_of_lung_now@@non_chronic_obstructive_pulmonary_disease@@affects_survival
      (and patient_has_finding_of_disorder_of_lung_now
           patient_has_finding_of_disorder_of_lung_now@@non_chronic_obstructive_pulmonary_disease
           patient_has_finding_of_disorder_of_lung_now@@affects_survival))
   :named REQ5_AUXILIARY1)) ;; "non-chronic obstructive pulmonary disease lung disease that affects survival"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@affects_oxygenation
       patient_has_finding_of_disorder_of_lung_now)
   :named REQ5_AUXILIARY2)) ;; "lung disease that affects oxygenation"

(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@affects_survival
       patient_has_finding_of_disorder_of_lung_now)
   :named REQ5_AUXILIARY3)) ;; "lung disease that affects survival"

(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@non_chronic_obstructive_pulmonary_disease
       patient_has_finding_of_disorder_of_lung_now)
   :named REQ5_AUXILIARY4)) ;; "non-chronic obstructive pulmonary disease lung disease"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_disorder_of_lung_now@@non_chronic_obstructive_pulmonary_disease@@affects_oxygenation)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a non-chronic obstructive pulmonary disease lung disease that affects oxygenation."

(assert
(! (not patient_has_finding_of_disorder_of_lung_now@@non_chronic_obstructive_pulmonary_disease@@affects_survival)
   :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a non-chronic obstructive pulmonary disease lung disease that affects survival."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const epworth_sleepiness_scale_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's Epworth Sleepiness Scale score recorded at the current time, in points.","when_to_set_to_null":"Set to null if the patient's Epworth Sleepiness Scale score is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value of the patient's Epworth Sleepiness Scale score recorded now, in points."} ;; "Epworth Sleepiness Scale score greater than fifteen"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (> epworth_sleepiness_scale_score_value_recorded_now_withunit_points 15))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an Epworth Sleepiness Scale score greater than fifteen."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_desaturation_of_blood_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the lowest measured blood oxygen saturation percentage during the six-minute walk test if available now.","when_to_set_to_null":"Set to null if no such measurement is available or cannot be determined.","meaning":"Numeric value representing the patient's lowest blood oxygen saturation percentage measured now."} ;; "desaturation"
(declare-const patient_desaturation_of_blood_value_recorded_now_withunit_percent@@measured_during_six_minute_walk_test Bool) ;; {"when_to_set_to_true":"Set to true if the blood oxygen saturation measurement was taken during the six-minute walk test.","when_to_set_to_false":"Set to false if the measurement was not taken during the six-minute walk test.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the measurement was taken during the six-minute walk test.","meaning":"Indicates whether the blood oxygen saturation measurement was taken during the six-minute walk test."} ;; "measured during the six-minute walk test"
(declare-const patient_duration_of_desaturation_below_80_percent_during_six_minute_walk_test_in_minutes Real) ;; {"when_to_set_to_value":"Set to the total duration in minutes that the patient's blood oxygen saturation was below 80 percent during the six-minute walk test if available.","when_to_set_to_null":"Set to null if no such measurement is available or cannot be determined.","meaning":"Numeric value representing the total duration in minutes that the patient's blood oxygen saturation was below 80 percent during the six-minute walk test."} ;; "duration in minutes that the patient's blood oxygen saturation was below 80 percent during the six-minute walk test"
(declare-const patient_has_desaturation_below_80_percent_for_at_least_1_minute_during_six_minute_walk_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient experienced a blood oxygen desaturation below 80 percent for at least one minute during the six-minute walk test.","when_to_set_to_false":"Set to false if the patient did not experience a blood oxygen desaturation below 80 percent for at least one minute during the six-minute walk test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient experienced a blood oxygen desaturation below 80 percent for at least one minute during the six-minute walk test.","meaning":"Boolean indicating whether the patient experienced a blood oxygen desaturation below 80 percent for at least one minute during the six-minute walk test."} ;; "desaturation below eighty percent for at least one minute during the six-minute walk test"
(declare-const patient_minimum_blood_oxygen_saturation_value_during_six_minute_walk_test_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the minimum measured blood oxygen saturation percentage during the six-minute walk test if available.","when_to_set_to_null":"Set to null if no such measurement is available or cannot be determined.","meaning":"Numeric value representing the patient's minimum blood oxygen saturation percentage measured during the six-minute walk test."} ;; "minimum blood oxygen saturation percentage measured during the six-minute walk test"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Define the Boolean variable in terms of the numeric duration
(assert
(! (= patient_has_desaturation_below_80_percent_for_at_least_1_minute_during_six_minute_walk_test
     (>= patient_duration_of_desaturation_below_80_percent_during_six_minute_walk_test_in_minutes 1))
:named REQ7_AUXILIARY0)) ;; "for at least one minute during the six-minute walk test"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_desaturation_below_80_percent_for_at_least_1_minute_during_six_minute_walk_test)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has desaturation below eighty percent for at least one minute during the six-minute walk test."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease.","when_to_set_to_false":"Set to false if the patient currently does not have a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease.","meaning":"Boolean indicating whether the patient currently has a disease."} ;; "disease"
(declare-const patient_has_finding_of_disease_now@@expected_to_cause_death_within_6_months_of_random_assignment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disease is expected to cause death within six months of random assignment.","when_to_set_to_false":"Set to false if the patient's current disease is not expected to cause death within six months of random assignment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is expected to cause death within six months of random assignment.","meaning":"Boolean indicating whether the patient's current disease is expected to cause death within six months of random assignment."} ;; "disease that is expected to cause death within six months of random assignment"
(declare-const patient_has_finding_of_disease_now@@expectation_judged_by_study_physician Bool) ;; {"when_to_set_to_true":"Set to true if the expectation that the disease will cause death within six months of random assignment is judged by the study physician.","when_to_set_to_false":"Set to false if the expectation is not judged by the study physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the expectation is judged by the study physician.","meaning":"Boolean indicating whether the expectation regarding death within six months of random assignment is judged by the study physician."} ;; "as judged by the study physician"
(declare-const patient_has_finding_of_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a condition.","when_to_set_to_false":"Set to false if the patient currently does not have a condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a condition.","meaning":"Boolean indicating whether the patient currently has a condition."} ;; "condition"
(declare-const patient_has_finding_of_condition_now@@expected_to_cause_death_within_6_months_of_random_assignment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current condition is expected to cause death within six months of random assignment.","when_to_set_to_false":"Set to false if the patient's current condition is not expected to cause death within six months of random assignment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the condition is expected to cause death within six months of random assignment.","meaning":"Boolean indicating whether the patient's current condition is expected to cause death within six months of random assignment."} ;; "condition that is expected to cause death within six months of random assignment"
(declare-const patient_has_finding_of_condition_now@@expectation_judged_by_study_physician Bool) ;; {"when_to_set_to_true":"Set to true if the expectation that the condition will cause death within six months of random assignment is judged by the study physician.","when_to_set_to_false":"Set to false if the expectation is not judged by the study physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the expectation is judged by the study physician.","meaning":"Boolean indicating whether the expectation regarding death within six months of random assignment is judged by the study physician."} ;; "as judged by the study physician"
(declare-const patient_has_finding_of_inability_to_perform_procedures_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to perform procedures.","when_to_set_to_false":"Set to false if the patient currently does not have inability to perform procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to perform procedures.","meaning":"Boolean indicating whether the patient currently has inability to perform procedures."} ;; "inability to perform procedures"
(declare-const patient_has_finding_of_inability_to_perform_procedures_now@@expected_to_occur_within_6_months_of_random_assignment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to perform procedures is expected to occur within six months of random assignment.","when_to_set_to_false":"Set to false if the patient's inability to perform procedures is not expected to occur within six months of random assignment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether inability to perform procedures is expected to occur within six months of random assignment.","meaning":"Boolean indicating whether inability to perform procedures is expected to occur within six months of random assignment."} ;; "expected to cause inability to perform procedures for the trial within six months of random assignment"
(declare-const patient_has_finding_of_inability_to_perform_procedures_now@@expectation_judged_by_study_physician Bool) ;; {"when_to_set_to_true":"Set to true if the expectation that inability to perform procedures will occur within six months of random assignment is judged by the study physician.","when_to_set_to_false":"Set to false if the expectation is not judged by the study physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the expectation is judged by the study physician.","meaning":"Boolean indicating whether the expectation regarding inability to perform procedures within six months of random assignment is judged by the study physician."} ;; "as judged by the study physician"
(declare-const patient_has_finding_of_condition_now@@expected_to_cause_inability_to_perform_procedures_for_trial_within_6_months_of_random_assignment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current condition is expected to cause inability to perform procedures for the trial within six months of random assignment.","when_to_set_to_false":"Set to false if the patient's current condition is not expected to cause inability to perform procedures for the trial within six months of random assignment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the condition is expected to cause inability to perform procedures for the trial within six months of random assignment.","meaning":"Boolean indicating whether the patient's current condition is expected to cause inability to perform procedures for the trial within six months of random assignment."} ;; "condition that is expected to cause inability to perform procedures for the trial within six months of random assignment"
(declare-const patient_has_finding_of_inability_to_comply_with_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to comply with therapy.","when_to_set_to_false":"Set to false if the patient currently does not have inability to comply with therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to comply with therapy.","meaning":"Boolean indicating whether the patient currently has inability to comply with therapy."} ;; "inability to comply with therapy"
(declare-const patient_has_finding_of_inability_to_comply_with_therapy_now@@expected_to_occur_within_6_months_of_random_assignment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to comply with therapy is expected to occur within six months of random assignment.","when_to_set_to_false":"Set to false if the patient's inability to comply with therapy is not expected to occur within six months of random assignment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether inability to comply with therapy is expected to occur within six months of random assignment.","meaning":"Boolean indicating whether inability to comply with therapy is expected to occur within six months of random assignment."} ;; "expected to cause inability to comply with therapy within six months of random assignment"
(declare-const patient_has_finding_of_inability_to_comply_with_therapy_now@@expectation_judged_by_study_physician Bool) ;; {"when_to_set_to_true":"Set to true if the expectation that inability to comply with therapy will occur within six months of random assignment is judged by the study physician.","when_to_set_to_false":"Set to false if the expectation is not judged by the study physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the expectation is judged by the study physician.","meaning":"Boolean indicating whether the expectation regarding inability to comply with therapy within six months of random assignment is judged by the study physician."} ;; "as judged by the study physician"
(declare-const patient_has_finding_of_condition_now@@expected_to_cause_inability_to_comply_with_therapy_within_6_months_of_random_assignment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current condition is expected to cause inability to comply with therapy within six months of random assignment.","when_to_set_to_false":"Set to false if the patient's current condition is not expected to cause inability to comply with therapy within six months of random assignment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the condition is expected to cause inability to comply with therapy within six months of random assignment.","meaning":"Boolean indicating whether the patient's current condition is expected to cause inability to comply with therapy within six months of random assignment."} ;; "condition that is expected to cause inability to comply with therapy within six months of random assignment"
(declare-const patient_has_finding_of_condition_now@@expectation_judged_by_study_physician_inability_to_comply_with_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the expectation that the condition will cause inability to comply with therapy within six months of random assignment is judged by the study physician.","when_to_set_to_false":"Set to false if the expectation is not judged by the study physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the expectation is judged by the study physician.","meaning":"Boolean indicating whether the expectation regarding inability to comply with therapy within six months of random assignment is judged by the study physician."} ;; "as judged by the study physician"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disease_now@@expected_to_cause_death_within_6_months_of_random_assignment
      patient_has_finding_of_disease_now)
    :named REQ8_AUXILIARY0)) ;; "disease that is expected to cause death within six months of random assignment"

(assert
(! (=> patient_has_finding_of_disease_now@@expectation_judged_by_study_physician
      patient_has_finding_of_disease_now)
    :named REQ8_AUXILIARY1)) ;; "as judged by the study physician" for disease

(assert
(! (=> patient_has_finding_of_condition_now@@expected_to_cause_death_within_6_months_of_random_assignment
      patient_has_finding_of_condition_now)
    :named REQ8_AUXILIARY2)) ;; "condition that is expected to cause death within six months of random assignment"

(assert
(! (=> patient_has_finding_of_condition_now@@expectation_judged_by_study_physician
      patient_has_finding_of_condition_now)
    :named REQ8_AUXILIARY3)) ;; "as judged by the study physician" for condition

(assert
(! (=> patient_has_finding_of_inability_to_perform_procedures_now@@expected_to_occur_within_6_months_of_random_assignment
      patient_has_finding_of_inability_to_perform_procedures_now)
    :named REQ8_AUXILIARY4)) ;; "expected to cause inability to perform procedures for the trial within six months of random assignment"

(assert
(! (=> patient_has_finding_of_inability_to_perform_procedures_now@@expectation_judged_by_study_physician
      patient_has_finding_of_inability_to_perform_procedures_now)
    :named REQ8_AUXILIARY5)) ;; "as judged by the study physician" for inability to perform procedures

(assert
(! (=> patient_has_finding_of_condition_now@@expected_to_cause_inability_to_perform_procedures_for_trial_within_6_months_of_random_assignment
      patient_has_finding_of_condition_now)
    :named REQ8_AUXILIARY6)) ;; "condition that is expected to cause inability to perform procedures for the trial within six months of random assignment"

(assert
(! (=> patient_has_finding_of_inability_to_comply_with_therapy_now@@expected_to_occur_within_6_months_of_random_assignment
      patient_has_finding_of_inability_to_comply_with_therapy_now)
    :named REQ8_AUXILIARY7)) ;; "expected to cause inability to comply with therapy within six months of random assignment"

(assert
(! (=> patient_has_finding_of_inability_to_comply_with_therapy_now@@expectation_judged_by_study_physician
      patient_has_finding_of_inability_to_comply_with_therapy_now)
    :named REQ8_AUXILIARY8)) ;; "as judged by the study physician" for inability to comply with therapy

(assert
(! (=> patient_has_finding_of_condition_now@@expected_to_cause_inability_to_comply_with_therapy_within_6_months_of_random_assignment
      patient_has_finding_of_condition_now)
    :named REQ8_AUXILIARY9)) ;; "condition that is expected to cause inability to comply with therapy within six months of random assignment"

(assert
(! (=> patient_has_finding_of_condition_now@@expectation_judged_by_study_physician_inability_to_comply_with_therapy
      patient_has_finding_of_condition_now)
    :named REQ8_AUXILIARY10)) ;; "as judged by the study physician" for inability to comply with therapy (condition)

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (and patient_has_finding_of_disease_now@@expected_to_cause_death_within_6_months_of_random_assignment
             patient_has_finding_of_disease_now@@expectation_judged_by_study_physician))
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a disease that is expected to cause death within six months of random assignment as judged by the study physician."

(assert
(! (not (and patient_has_finding_of_condition_now@@expected_to_cause_death_within_6_months_of_random_assignment
             patient_has_finding_of_condition_now@@expectation_judged_by_study_physician))
    :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a condition that is expected to cause death within six months of random assignment as judged by the study physician."

(assert
(! (not (and patient_has_finding_of_inability_to_perform_procedures_now@@expected_to_occur_within_6_months_of_random_assignment
             patient_has_finding_of_inability_to_perform_procedures_now@@expectation_judged_by_study_physician))
    :named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a disease that is expected to cause inability to perform procedures for the trial within six months of random assignment as judged by the study physician."

(assert
(! (not (and patient_has_finding_of_condition_now@@expected_to_cause_inability_to_perform_procedures_for_trial_within_6_months_of_random_assignment
             patient_has_finding_of_condition_now@@expectation_judged_by_study_physician))
    :named REQ8_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a condition that is expected to cause inability to perform procedures for the trial within six months of random assignment as judged by the study physician."

(assert
(! (not (and patient_has_finding_of_inability_to_comply_with_therapy_now@@expected_to_occur_within_6_months_of_random_assignment
             patient_has_finding_of_inability_to_comply_with_therapy_now@@expectation_judged_by_study_physician))
    :named REQ8_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a disease that is expected to cause inability to comply with therapy within six months of random assignment as judged by the study physician."

(assert
(! (not (and patient_has_finding_of_condition_now@@expected_to_cause_inability_to_comply_with_therapy_within_6_months_of_random_assignment
             patient_has_finding_of_condition_now@@expectation_judged_by_study_physician_inability_to_comply_with_therapy))
    :named REQ8_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a condition that is expected to cause inability to comply with therapy within six months of random assignment as judged by the study physician."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_participating_in_another_intervention_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in an intervention study that is not the current study.","when_to_set_to_false":"Set to false if the patient is currently not participating in any other intervention study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in another intervention study.","meaning":"Boolean indicating whether the patient is currently participating in an intervention study other than the current study."} ;; "participating in another intervention study"
(declare-const patient_is_participating_in_another_intervention_study_now@@other_than_current_study Bool) ;; {"when_to_set_to_true":"Set to true if the intervention study in which the patient is participating is not the current study.","when_to_set_to_false":"Set to false if the intervention study in which the patient is participating is the current study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the intervention study is not the current study.","meaning":"Boolean indicating whether the intervention study is not the current study."} ;; "other than current study"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_participating_in_another_intervention_study_now@@other_than_current_study
      patient_is_participating_in_another_intervention_study_now)
:named REQ9_AUXILIARY0)) ;; "The qualifier specifies that the intervention study is not the current study."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_participating_in_another_intervention_study_now@@other_than_current_study)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is participating in another intervention study."
