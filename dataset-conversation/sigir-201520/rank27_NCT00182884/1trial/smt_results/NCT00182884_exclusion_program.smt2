;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const mini_mental_state_examination_score_value_recorded_most_recent_withunit_points Real) ;; {"when_to_set_to_value":"Set to the most recent documented MMSE score in points for the patient.","when_to_set_to_null":"Set to null if the MMSE score is unknown, not documented, or cannot be determined for the patient.","meaning":"Numeric value representing the most recent Mini-Mental State Examination score for the patient, in points."} ;; "Mini-Mental State Examination score < 10"
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "dementia"

(declare-const patient_has_finding_of_dementia_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe dementia as defined by MMSE score < 10.","when_to_set_to_false":"Set to false if the patient currently does not have severe dementia as defined by MMSE score < 10.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe dementia as defined by MMSE score < 10.","meaning":"Boolean indicating whether the patient currently has severe dementia, defined as MMSE score < 10."} ;; "severe dementia (as defined by Mini-Mental State Examination score < 10)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: severe dementia = dementia AND MMSE score < 10
(assert
(! (= patient_has_finding_of_dementia_now@@severe
     (and patient_has_finding_of_dementia_now
          (< mini_mental_state_examination_score_value_recorded_most_recent_withunit_points 10)))
   :named REQ0_AUXILIARY0)) ;; "severe dementia (as defined by Mini-Mental State Examination score < 10)"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_dementia_now@@severe
       patient_has_finding_of_dementia_now)
   :named REQ0_AUXILIARY1)) ;; "severe dementia" implies "dementia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_dementia_now@@severe)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe dementia (as defined by Mini-Mental State Examination score < 10)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of metastatic (secondary malignant) cancer.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of metastatic (secondary malignant) cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of metastatic (secondary malignant) cancer.","meaning":"Boolean indicating whether the patient currently has a diagnosis of metastatic (secondary malignant) cancer."} ;; "metastatic cancer"

(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a comorbid illness.","when_to_set_to_false":"Set to false if the patient currently does not have a comorbid illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a comorbid illness.","meaning":"Boolean indicating whether the patient currently has a comorbid illness."} ;; "comorbid illness"

(declare-const patient_has_finding_of_co_morbid_conditions_now@@likely_to_reduce_life_expectancy_to_less_than_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a comorbid illness and that illness is likely to reduce life expectancy to less than 6 months.","when_to_set_to_false":"Set to false if the patient currently has a comorbid illness but it is not likely to reduce life expectancy to less than 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the comorbid illness is likely to reduce life expectancy to less than 6 months.","meaning":"Boolean indicating whether the patient currently has a comorbid illness that is likely to reduce life expectancy to less than 6 months."} ;; "other comorbid illness likely to reduce life expectancy to < 6 months"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@likely_to_reduce_life_expectancy_to_less_than_6_months
      patient_has_finding_of_co_morbid_conditions_now)
:named REQ1_AUXILIARY0)) ;; "other comorbid illness likely to reduce life expectancy to < 6 months"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have metastatic cancer
(assert
(! (not patient_has_diagnosis_of_secondary_malignant_neoplastic_disease_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has metastatic cancer."

;; Exclusion: patient must NOT have comorbid illness likely to reduce life expectancy to < 6 months
(assert
(! (not patient_has_finding_of_co_morbid_conditions_now@@likely_to_reduce_life_expectancy_to_less_than_6_months)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other comorbid illness likely to reduce life expectancy to < 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_multiple_injuries_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of multiple injuries (multiple trauma).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of multiple injuries (multiple trauma).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of multiple injuries (multiple trauma).","meaning":"Boolean indicating whether the patient currently has multiple injuries (multiple trauma)."} ;; "multiple trauma"
(declare-const patient_has_finding_of_pathological_fracture_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pathological fracture.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pathological fracture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pathological fracture.","meaning":"Boolean indicating whether the patient currently has a pathological fracture."} ;; "pathological fracture"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_multiple_injuries_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has multiple trauma."

(assert
(! (not patient_has_finding_of_pathological_fracture_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pathological fracture."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_aphasia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of aphasia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of aphasia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has aphasia.","meaning":"Boolean indicating whether the patient currently has aphasia."} ;; "aphasia"
(declare-const patient_has_finding_of_legal_blindness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has legal blindness.","when_to_set_to_false":"Set to false if the patient currently does not have legal blindness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has legal blindness.","meaning":"Boolean indicating whether the patient currently has legal blindness."} ;; "legal blindness"
(declare-const patient_has_finding_of_deafness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has deafness.","when_to_set_to_false":"Set to false if the patient currently does not have deafness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has deafness.","meaning":"Boolean indicating whether the patient currently has deafness."} ;; "deafness"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_aphasia_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has aphasia."

(assert
(! (not patient_has_finding_of_legal_blindness_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has legal blindness."

(assert
(! (not patient_has_finding_of_deafness_now)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has deafness."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_exposed_to_donepezil_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to donepezil within the 1 month prior to now.","when_to_set_to_false":"Set to false if the patient has not been exposed to donepezil within the 1 month prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to donepezil within the 1 month prior to now.","meaning":"Boolean indicating whether the patient has been exposed to donepezil in the 1 month prior to now."} ;; "Donepezil within 1 month prior to surgery"
(declare-const patient_is_exposed_to_donepezil_inthepast1months@@temporalcontext_within1months_before_surgical_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to donepezil occurred within 1 month before a surgical procedure.","when_to_set_to_false":"Set to false if the patient's exposure to donepezil did not occur within 1 month before a surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to donepezil occurred within 1 month before a surgical procedure.","meaning":"Boolean indicating whether the patient's exposure to donepezil occurred within 1 month before a surgical procedure."} ;; "Donepezil within 1 month prior to surgery"
(declare-const patient_is_exposed_to_other_cholinesterase_inhibitor_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any cholinesterase inhibitor other than donepezil within the 1 month prior to now.","when_to_set_to_false":"Set to false if the patient has not been exposed to any cholinesterase inhibitor other than donepezil within the 1 month prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any cholinesterase inhibitor other than donepezil within the 1 month prior to now.","meaning":"Boolean indicating whether the patient has been exposed to any cholinesterase inhibitor other than donepezil in the 1 month prior to now."} ;; "other cholinesterase inhibitor within 1 month prior to surgery"
(declare-const patient_is_exposed_to_other_cholinesterase_inhibitor_inthepast1months@@temporalcontext_within1months_before_surgical_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to any cholinesterase inhibitor other than donepezil occurred within 1 month before a surgical procedure.","when_to_set_to_false":"Set to false if the patient's exposure to any cholinesterase inhibitor other than donepezil did not occur within 1 month before a surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to any cholinesterase inhibitor other than donepezil occurred within 1 month before a surgical procedure.","meaning":"Boolean indicating whether the patient's exposure to any cholinesterase inhibitor other than donepezil occurred within 1 month before a surgical procedure."} ;; "other cholinesterase inhibitor within 1 month prior to surgery"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_donepezil_inthepast1months@@temporalcontext_within1months_before_surgical_procedure
      patient_is_exposed_to_donepezil_inthepast1months)
:named REQ4_AUXILIARY0)) ;; "Donepezil within 1 month prior to surgery"

(assert
(! (=> patient_is_exposed_to_other_cholinesterase_inhibitor_inthepast1months@@temporalcontext_within1months_before_surgical_procedure
      patient_is_exposed_to_other_cholinesterase_inhibitor_inthepast1months)
:named REQ4_AUXILIARY1)) ;; "other cholinesterase inhibitor within 1 month prior to surgery"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_exposed_to_donepezil_inthepast1months@@temporalcontext_within1months_before_surgical_procedure)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used Donepezil within 1 month prior to surgery."

(assert
(! (not patient_is_exposed_to_other_cholinesterase_inhibitor_inthepast1months@@temporalcontext_within1months_before_surgical_procedure)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used other cholinesterase inhibitor within 1 month prior to surgery."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_allergy_to_donepezil_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to Donepezil.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to Donepezil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to Donepezil.","meaning":"Boolean indicating whether the patient currently has an allergy to Donepezil."} ;; "The patient is excluded if the patient has allergy to Donepezil."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_allergy_to_donepezil_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to Donepezil."
