;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 30 years AND aged ≤ 80 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 30)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 30 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 80)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 80 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const caregiver_spends_time_with_patient_with_dementia_per_day_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours per day that the caregiver spends their own time with a patient with dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours per day the caregiver spends their own time with a patient with dementia.","meaning":"Numeric variable indicating the number of hours per day that the caregiver spends their own time with a patient with dementia."} // "spends their own time with patients with dementia for > 4 hours per day"

(declare-const patient_is_caregiver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a caregiver.","when_to_set_to_false":"Set to false if the patient is currently not a caregiver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a caregiver.","meaning":"Boolean indicating whether the patient is currently a caregiver."} // "the patient must be a caregiver"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (and patient_is_caregiver_now
          (> caregiver_spends_time_with_patient_with_dementia_per_day_in_hours 4.0))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be a caregiver who spends their own time with patients with dementia for > 4 hours per day"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const caregiver_distress_score_value_recorded_now_withunit_integer Int) ;; {"when_to_set_to_value":"Set to the integer value of the caregiver distress score recorded for the patient at the current time.","when_to_set_to_null":"Set to null if the caregiver distress score is unknown, not documented, or cannot be determined for the patient at the current time.","meaning":"Numeric variable representing the caregiver distress score value recorded for the patient at the current time as an integer."} // "the patient must have a caregiver distress score ≥ 2"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= caregiver_distress_score_value_recorded_now_withunit_integer 2)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a caregiver distress score ≥ 2"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const care_recipient_has_finding_of_alzheimers_disease_dementia_mild_stage_now Bool) ;; {"when_to_set_to_true":"Set to true if the care recipient currently has Alzheimer's disease dementia in the mild stage (MMSE score 10-26).","when_to_set_to_false":"Set to false if the care recipient currently does not have Alzheimer's disease dementia in the mild stage (MMSE score 10-26).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the care recipient currently has Alzheimer's disease dementia in the mild stage (MMSE score 10-26).","meaning":"Boolean indicating whether the care recipient currently has Alzheimer's disease dementia in the mild stage (MMSE score 10-26)."} // "Alzheimer's disease dementia in the mild stage (Mini-Mental Status Examination: 10-26)"
(declare-const care_recipient_has_finding_of_alzheimers_disease_dementia_moderate_stage_now Bool) ;; {"when_to_set_to_true":"Set to true if the care recipient currently has Alzheimer's disease dementia in the moderate stage (MMSE score 10-26).","when_to_set_to_false":"Set to false if the care recipient currently does not have Alzheimer's disease dementia in the moderate stage (MMSE score 10-26).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the care recipient currently has Alzheimer's disease dementia in the moderate stage (MMSE score 10-26).","meaning":"Boolean indicating whether the care recipient currently has Alzheimer's disease dementia in the moderate stage (MMSE score 10-26)."} // "Alzheimer's disease dementia in the moderate stage (Mini-Mental Status Examination: 10-26)"
(declare-const care_recipient_mmse_score_now Real) ;; {"when_to_set_to_value":"Set to the current MMSE score (in points) of the care recipient.","when_to_set_to_null":"Set to null if the current MMSE score of the care recipient is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the current MMSE score of the care recipient in points."} // "Mini-Mental Status Examination: 10-26"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: mild stage is MMSE 10-26
(assert
  (! (= care_recipient_has_finding_of_alzheimers_disease_dementia_mild_stage_now
        (and (>= care_recipient_mmse_score_now 10)
             (<= care_recipient_mmse_score_now 26)))
     :named REQ3_AUXILIARY0)) ;; "Alzheimer's disease dementia in the mild stage (Mini-Mental Status Examination: 10-26)"

;; Definition: moderate stage is MMSE 10-26
(assert
  (! (= care_recipient_has_finding_of_alzheimers_disease_dementia_moderate_stage_now
        (and (>= care_recipient_mmse_score_now 10)
             (<= care_recipient_mmse_score_now 26)))
     :named REQ3_AUXILIARY1)) ;; "Alzheimer's disease dementia in the moderate stage (Mini-Mental Status Examination: 10-26)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Inclusion: patient must be a caregiver of a care recipient with AD dementia in mild or moderate stage (MMSE 10-26)
(assert
  (! (and patient_is_caregiver_now
          (or care_recipient_has_finding_of_alzheimers_disease_dementia_mild_stage_now
              care_recipient_has_finding_of_alzheimers_disease_dementia_moderate_stage_now))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a caregiver of a patient with Alzheimer's disease dementia in the mild stage (Mini-Mental Status Examination: 10-26) or a caregiver of a patient with Alzheimer's disease dementia in the moderate stage (Mini-Mental Status Examination: 10-26)."
