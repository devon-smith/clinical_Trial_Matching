;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_medical_interview_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a medical interview now.","when_to_set_to_false":"Set to false if the patient has not undergone a medical interview now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a medical interview now.","meaning":"Boolean indicating whether the patient has undergone a medical interview now."} ;; "medical interview"
(declare-const patient_has_undergone_physical_examination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a physical examination now.","when_to_set_to_false":"Set to false if the patient has not undergone a physical examination now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a physical examination now.","meaning":"Boolean indicating whether the patient has undergone a physical examination now."} ;; "physical examination"
(declare-const patient_has_undergone_screening_investigation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a screening investigation now.","when_to_set_to_false":"Set to false if the patient has not undergone a screening investigation now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a screening investigation now.","meaning":"Boolean indicating whether the patient has undergone a screening investigation now."} ;; "screening investigation"
(declare-const physician_considers_patient_unfit_for_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the physician responsible currently considers the patient unfit for the study.","when_to_set_to_false":"Set to false if the physician responsible currently does not consider the patient unfit for the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the physician responsible currently considers the patient unfit for the study.","meaning":"Boolean indicating whether the physician responsible currently considers the patient unfit for the study."} ;; "the physician responsible considers the patient unfit for the study"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_has_undergone_medical_interview_now
             physician_considers_patient_unfit_for_study_now))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((as a result of the medical interview) AND (the physician responsible considers the patient unfit for the study))."

(assert
(! (not (and patient_has_undergone_physical_examination_now
             physician_considers_patient_unfit_for_study_now))
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((as a result of the physical examination) AND (the physician responsible considers the patient unfit for the study))."

(assert
(! (not (and patient_has_undergone_screening_investigation_now
             physician_considers_patient_unfit_for_study_now))
   :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((as a result of the screening investigation) AND (the physician responsible considers the patient unfit for the study))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient has pregnancy"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is currently female."} ;; "the patient is female"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (and patient_sex_is_female_now patient_is_pregnant_now))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is female AND the patient has pregnancy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of any disease in the past (prior to now).","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of any disease in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of any disease in the past.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of any disease in the past."} ;; "the patient has a past disease"

(declare-const patient_has_diagnosis_of_disease_inthehistory@@may_affect_safety_or_study_outcome_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of any disease in the past and, as judged by the investigator, the disease may affect subject safety or may influence the outcome of the study.","when_to_set_to_false":"Set to false if the patient has ever had a diagnosis of any disease in the past but, as judged by the investigator, the disease does not affect subject safety nor influence the outcome of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease may affect subject safety or study outcome as judged by the investigator.","meaning":"Boolean indicating whether the patient's past disease may affect subject safety or study outcome as judged by the investigator."} ;; "as judged by the investigator, the disease may affect subject safety OR may influence the outcome of the study (for past disease)"

(declare-const patient_has_diagnosis_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any disease."} ;; "the patient has a present disease"

(declare-const patient_has_diagnosis_of_disease_now@@may_affect_safety_or_study_outcome_as_judged_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any disease and, as judged by the investigator, the disease may affect subject safety or may influence the outcome of the study.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of any disease but, as judged by the investigator, the disease does not affect subject safety nor influence the outcome of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease may affect subject safety or study outcome as judged by the investigator.","meaning":"Boolean indicating whether the patient's present disease may affect subject safety or study outcome as judged by the investigator."} ;; "as judged by the investigator, the disease may affect subject safety OR may influence the outcome of the study (for present disease)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable (past disease)
(assert
(! (=> patient_has_diagnosis_of_disease_inthehistory@@may_affect_safety_or_study_outcome_as_judged_by_investigator
      patient_has_diagnosis_of_disease_inthehistory)
:named REQ2_AUXILIARY0)) ;; "as judged by the investigator, the disease may affect subject safety OR may influence the outcome of the study (for past disease)"

;; Qualifier variable implies corresponding stem variable (present disease)
(assert
(! (=> patient_has_diagnosis_of_disease_now@@may_affect_safety_or_study_outcome_as_judged_by_investigator
      patient_has_diagnosis_of_disease_now)
:named REQ2_AUXILIARY1)) ;; "as judged by the investigator, the disease may affect subject safety OR may influence the outcome of the study (for present disease)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have a past disease that may affect safety or study outcome as judged by investigator
(assert
(! (not patient_has_diagnosis_of_disease_inthehistory@@may_affect_safety_or_study_outcome_as_judged_by_investigator)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a past disease) AND (as judged by the investigator, the disease may affect subject safety OR may influence the outcome of the study)."

;; Exclusion: patient must NOT have a present disease that may affect safety or study outcome as judged by investigator
(assert
(! (not patient_has_diagnosis_of_disease_now@@may_affect_safety_or_study_outcome_as_judged_by_investigator)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a present disease) AND (as judged by the investigator, the disease may affect subject safety OR may influence the outcome of the study)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const duration_of_biological_effect_of_drug_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days corresponding to the duration of the biological effect of the relevant drug.","when_to_set_to_null":"Set to null if the duration of the biological effect of the relevant drug is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration of the biological effect of a relevant drug in days."} ;; "twice the duration of the biological effect of any drug"
(declare-const half_life_of_drug_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days corresponding to the half-life of the relevant drug.","when_to_set_to_null":"Set to null if the half-life of the relevant drug is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the half-life of a relevant drug in days."} ;; "five half-lives of any drug"
(declare-const patient_has_participated_in_other_research_trial_within_2x_biological_effect_duration_of_any_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in any other research trial within twice the duration of the biological effect of any drug.","when_to_set_to_false":"Set to false if the patient has not participated in any other research trial within twice the duration of the biological effect of any drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in any other research trial within twice the duration of the biological effect of any drug.","meaning":"Boolean indicating whether the patient has participated in any other research trial within twice the duration of the biological effect of any drug."} ;; "within twice the duration of the biological effect of any drug"
(declare-const patient_has_participated_in_other_research_trial_within_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in any other research trial within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not participated in any other research trial within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in any other research trial within the past 30 days.","meaning":"Boolean indicating whether the patient has participated in any other research trial within the past 30 days."} ;; "within thirty days"
(declare-const patient_has_participated_in_other_research_trial_within_5_half_lives_of_any_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in any other research trial within five half-lives of any drug.","when_to_set_to_false":"Set to false if the patient has not participated in any other research trial within five half-lives of any drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in any other research trial within five half-lives of any drug.","meaning":"Boolean indicating whether the patient has participated in any other research trial within five half-lives of any drug."} ;; "within five half-lives of any drug"
(declare-const patient_has_received_investigational_drug_within_2x_biological_effect_duration_of_any_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received an investigational drug within twice the duration of the biological effect of any drug.","when_to_set_to_false":"Set to false if the patient has not received an investigational drug within twice the duration of the biological effect of any drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received an investigational drug within twice the duration of the biological effect of any drug.","meaning":"Boolean indicating whether the patient has received an investigational drug within twice the duration of the biological effect of any drug."} ;; "within twice the duration of the biological effect of any drug"
(declare-const patient_has_received_investigational_drug_within_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received an investigational drug within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not received an investigational drug within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received an investigational drug within the past 30 days.","meaning":"Boolean indicating whether the patient has received an investigational drug within the past 30 days."} ;; "within thirty days"
(declare-const patient_has_received_investigational_drug_within_5_half_lives_of_any_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received an investigational drug within five half-lives of any drug.","when_to_set_to_false":"Set to false if the patient has not received an investigational drug within five half-lives of any drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received an investigational drug within five half-lives of any drug.","meaning":"Boolean indicating whether the patient has received an investigational drug within five half-lives of any drug."} ;; "within five half-lives of any drug"
(declare-const patient_has_undergone_clinical_trial_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a clinical trial in the past (prior to now).","when_to_set_to_false":"Set to false if the patient has never undergone a clinical trial in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a clinical trial in the past.","meaning":"auto-synthesized variable for clinical_trial (Procedure) with timeframe inthehistory"} ;; "research trial"
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament.","meaning":"auto-synthesized variable for drug_or_medicament (Substance) with timeframe now"} ;; "drug"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have received an investigational drug or participated in any other research trial within the longest of the three time windows
(assert
(! (not (or
  patient_has_received_investigational_drug_within_30_days
  patient_has_received_investigational_drug_within_5_half_lives_of_any_drug
  patient_has_received_investigational_drug_within_2x_biological_effect_duration_of_any_drug
  patient_has_participated_in_other_research_trial_within_30_days
  patient_has_participated_in_other_research_trial_within_5_half_lives_of_any_drug
  patient_has_participated_in_other_research_trial_within_2x_biological_effect_duration_of_any_drug
))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has received an investigational drug within thirty days) OR (the patient has received an investigational drug within five half-lives of any drug) OR (the patient has received an investigational drug within twice the duration of the biological effect of any drug) OR (the patient has participated in any other research trial within thirty days) OR (the patient has participated in any other research trial within five half-lives of any drug) OR (the patient has participated in any other research trial within twice the duration of the biological effect of any drug)), where the relevant time window is whichever is longer."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "asthma"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD)."} ;; "chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_has_diagnosis_of_asthma_now
             patient_has_diagnosis_of_chronic_obstructive_lung_disease_now))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has asthma AND the patient has chronic obstructive pulmonary disease."

;; --- verifier-bypassed (attempt 8/8) 2025-10-24T09:18:50.246837 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_previous_inclusion_in_research_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously been included in any research protocol.","when_to_set_to_false":"Set to false if the patient has not previously been included in any research protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously been included in any research protocol.","meaning":"Boolean indicating whether the patient has previously been included in any research protocol."} ;; "the patient has previous inclusion in a research protocol"
(declare-const patient_has_previous_inclusion_in_medical_protocol_involving_nuclear_medicine Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously been included in any medical protocol involving nuclear medicine.","when_to_set_to_false":"Set to false if the patient has not previously been included in any medical protocol involving nuclear medicine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously been included in any medical protocol involving nuclear medicine.","meaning":"Boolean indicating whether the patient has previously been included in any medical protocol involving nuclear medicine."} ;; "the patient has previous inclusion in a medical protocol involving nuclear medicine"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_previous_inclusion_in_research_protocol)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous inclusion in a research protocol."

(assert
(! (not patient_has_previous_inclusion_in_medical_protocol_involving_nuclear_medicine)
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous inclusion in a medical protocol involving nuclear medicine."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_dosage_of_radiation_exposure_value_recorded_inthepast3years_withunit_millisievert Real) ;; {"when_to_set_to_value":"Set to the total measured or estimated dosage of radiation exposure (in millisievert) received by the patient in the past 3 years, including the dose from this study.","when_to_set_to_null":"Set to null if the total dosage of radiation exposure in the past 3 years is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's total radiation exposure in millisievert over the past 3 years."} ;; "no more than ten millisievert in addition to natural background radiation, in the previous three years including the dose from this study"
(declare-const patient_has_undergone_radiographic_imaging_procedure_inthepast3years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any radiographic imaging procedure in the past 3 years, including the dose from this study.","when_to_set_to_false":"Set to false if the patient has not undergone any radiographic imaging procedure in the past 3 years, including the dose from this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any radiographic imaging procedure in the past 3 years.","meaning":"Boolean indicating whether the patient has undergone any radiographic imaging procedure in the past 3 years."} ;; "the patient has had any radiological investigation ... in the previous three years including the dose from this study"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient has had any radiological investigation with significant radiation burden (defined as >10 mSv in past 3 years including this study)
(assert
(! (not (and patient_has_undergone_radiographic_imaging_procedure_inthepast3years
             (> patient_dosage_of_radiation_exposure_value_recorded_inthepast3years_withunit_millisievert 10)))
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had any radiological investigation with significant radiation burden (a significant radiation burden being defined as International Commission on Radiological Protection category IIb or above: no more than ten millisievert in addition to natural background radiation, in the previous three years including the dose from this study))."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of alcohol abuse prior to now.","when_to_set_to_false":"Set to false if the patient has never had a documented history of alcohol abuse prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol abuse.","meaning":"Boolean indicating whether the patient has a history of alcohol abuse at any time prior to now."} ;; "the patient has a history of alcohol abuse"
(declare-const patient_has_finding_of_drug_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of drug abuse prior to now.","when_to_set_to_false":"Set to false if the patient has never had a documented history of drug abuse prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of drug abuse.","meaning":"Boolean indicating whether the patient has a history of drug abuse at any time prior to now."} ;; "the patient has a history of drug abuse"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_alcohol_abuse_inthehistory)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of alcohol abuse."

(assert
(! (not patient_has_finding_of_drug_abuse_inthehistory)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of drug abuse."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_respiratory_tract_infection_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a respiratory tract infection at any time within the past 4 weeks.","when_to_set_to_false":"Set to false if the patient has not had a respiratory tract infection within the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a respiratory tract infection within the past 4 weeks.","meaning":"Boolean indicating whether the patient has had a respiratory tract infection within the past 4 weeks."} ;; "the patient has had a respiratory tract infection within four weeks of the start of the study"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_respiratory_tract_infection_inthepast4weeks)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a respiratory tract infection within four weeks of the start of the study."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_claustrophobia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with claustrophobia at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with claustrophobia at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with claustrophobia.","meaning":"Boolean indicating whether the patient has a history of claustrophobia."} ;; "claustrophobia"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_diagnosis_of_claustrophobia_inthehistory)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of claustrophobia."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_unable_to_perform_multi_channel_recorder_assessment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to perform the multi channel recorder assessment.","when_to_set_to_false":"Set to false if the patient is able to perform the multi channel recorder assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to perform the multi channel recorder assessment.","meaning":"Boolean indicating whether the patient is unable to perform the multi channel recorder assessment."} ;; "the patient is unable to perform the multi channel recorder assessment"
(declare-const patient_is_unable_to_perform_pharyngometry_assessment_correctly Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to perform the pharyngometry assessment correctly.","when_to_set_to_false":"Set to false if the patient is able to perform the pharyngometry assessment correctly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to perform the pharyngometry assessment correctly.","meaning":"Boolean indicating whether the patient is unable to perform the pharyngometry assessment correctly."} ;; "the patient is unable to perform the pharyngometry assessment correctly"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_unable_to_perform_multi_channel_recorder_assessment)
:named REQ10_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to perform the multi channel recorder assessment."

(assert
(! (not patient_is_unable_to_perform_pharyngometry_assessment_correctly)
:named REQ10_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to perform the pharyngometry assessment correctly."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_known_allergy_to_milk_protein Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or known allergy to milk protein.","when_to_set_to_false":"Set to false if the patient does not have a documented or known allergy to milk protein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a known allergy to milk protein.","meaning":"Boolean indicating whether the patient has a known allergy to milk protein."} ;; "the patient has a known allergy to milk protein"
(declare-const patient_has_known_hypersensitivity_to_milk_protein Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or known hypersensitivity to milk protein.","when_to_set_to_false":"Set to false if the patient does not have a documented or known hypersensitivity to milk protein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a known hypersensitivity to milk protein.","meaning":"Boolean indicating whether the patient has a known hypersensitivity to milk protein."} ;; "the patient has a known hypersensitivity to milk protein"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (not patient_has_known_allergy_to_milk_protein)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to milk protein."

(assert
  (! (not patient_has_known_hypersensitivity_to_milk_protein)
     :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known hypersensitivity to milk protein."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_unwilling_to_follow_any_procedures_outlined_in_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unwilling to follow at least one of the procedures outlined in the protocol.","when_to_set_to_false":"Set to false if the patient is willing to follow all of the procedures outlined in the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unwilling to follow any of the procedures outlined in the protocol.","meaning":"Boolean indicating whether the patient is unwilling to follow any of the procedures outlined in the protocol."} ;; "the patient is unwilling to follow any of the procedures outlined in the protocol"
(declare-const patient_is_unable_to_follow_any_procedures_outlined_in_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to follow at least one of the procedures outlined in the protocol.","when_to_set_to_false":"Set to false if the patient is able to follow all of the procedures outlined in the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to follow any of the procedures outlined in the protocol.","meaning":"Boolean indicating whether the patient is unable to follow any of the procedures outlined in the protocol."} ;; "the patient is unable to follow any of the procedures outlined in the protocol"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (or patient_is_unwilling_to_follow_any_procedures_outlined_in_protocol
            patient_is_unable_to_follow_any_procedures_outlined_in_protocol))
   :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is unwilling to follow any of the procedures outlined in the protocol) OR (the patient is unable to follow any of the procedures outlined in the protocol)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_kept_under_regulatory_order_in_institution_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently kept under a regulatory order in an institution.","when_to_set_to_false":"Set to false if the patient is currently not kept under a regulatory order in an institution.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently kept under a regulatory order in an institution.","meaning":"Boolean indicating whether the patient is currently kept under a regulatory order in an institution."} ;; "the patient is kept under regulatory order in an institution"
(declare-const patient_is_kept_under_judicial_order_in_institution_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently kept under a judicial order in an institution.","when_to_set_to_false":"Set to false if the patient is currently not kept under a judicial order in an institution.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently kept under a judicial order in an institution.","meaning":"Boolean indicating whether the patient is currently kept under a judicial order in an institution."} ;; "the patient is kept under judicial order in an institution"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_is_kept_under_regulatory_order_in_institution_now)
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is kept under regulatory order in an institution."

(assert
(! (not patient_is_kept_under_judicial_order_in_institution_now)
    :named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is kept under judicial order in an institution."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_is_mentally_incapacitated_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently mentally incapacitated.","when_to_set_to_false":"Set to false if the patient is currently not mentally incapacitated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently mentally incapacitated.","meaning":"Boolean indicating whether the patient is currently mentally incapacitated."} ;; "the patient is mentally incapacitated"
(declare-const patient_is_legally_incapacitated_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently legally incapacitated.","when_to_set_to_false":"Set to false if the patient is currently not legally incapacitated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently legally incapacitated.","meaning":"Boolean indicating whether the patient is currently legally incapacitated."} ;; "the patient is legally incapacitated"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_is_mentally_incapacitated_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is mentally incapacitated."

(assert
(! (not patient_is_legally_incapacitated_now)
:named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is legally incapacitated."
