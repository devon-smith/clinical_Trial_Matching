;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_inthehistory_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years at the time of first dementia symptom onset if it is known and documented.","when_to_set_to_null":"Set to null if the patient's age at dementia symptom onset is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in years at the time when dementia symptoms first appeared."} // "debut of dementia symptoms before the age of 65 years"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age at time of inclusion ≤ 70 years"
(declare-const patient_has_finding_of_dementia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had dementia symptoms at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had dementia symptoms at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had dementia symptoms.","meaning":"Boolean indicating whether the patient has ever had dementia symptoms in their history."} // "dementia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (and patient_has_finding_of_dementia_inthehistory
          (< patient_age_value_recorded_inthehistory_in_years 65.0))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "debut of dementia symptoms before the age of 65 years"

(assert
  (! (<= patient_age_value_recorded_now_in_years 70.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "age at time of inclusion ≤ 70 years"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_frontotemporal_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of frontotemporal dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of frontotemporal dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of frontotemporal dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of frontotemporal dementia."} // "frontotemporal dementia"
(declare-const patient_has_diagnosis_of_frontotemporal_dementia_now@@defined_according_to_neary_et_al_1998 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of frontotemporal dementia is defined according to Neary et al., 1998 criteria.","when_to_set_to_false":"Set to false if the patient's diagnosis of frontotemporal dementia is not defined according to Neary et al., 1998 criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of frontotemporal dementia is defined according to Neary et al., 1998 criteria.","meaning":"Boolean indicating whether the patient's diagnosis of frontotemporal dementia is defined according to Neary et al., 1998 criteria."} // "according to Neary et al., 1998"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable (if diagnosis is defined according to Neary et al., 1998, then patient has FTD diagnosis)
(assert
  (! (=> patient_has_diagnosis_of_frontotemporal_dementia_now@@defined_according_to_neary_et_al_1998
         patient_has_diagnosis_of_frontotemporal_dementia_now)
     :named REQ1_AUXILIARY0)) ;; "the patient must meet the criteria for frontotemporal dementia (according to Neary et al., 1998)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Inclusion: patient must have FTD diagnosis defined according to Neary et al., 1998
(assert
  (! patient_has_diagnosis_of_frontotemporal_dementia_now@@defined_according_to_neary_et_al_1998
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must meet the criteria for frontotemporal dementia (according to Neary et al., 1998)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_aphasia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of aphasia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of aphasia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has aphasia.","meaning":"Boolean indicating whether the patient currently has aphasia."} // "the patient must meet the criteria for primary progressive aphasia (according to Mesulam, 2003)"
(declare-const patient_has_finding_of_aphasia_now@@defined_according_to_mesulam_2003 Bool) ;; {"when_to_set_to_true":"Set to true if the patient's aphasia diagnosis meets criteria as defined according to Mesulam, 2003.","when_to_set_to_false":"Set to false if the patient's aphasia diagnosis does not meet criteria as defined according to Mesulam, 2003.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's aphasia diagnosis meets criteria as defined according to Mesulam, 2003.","meaning":"Boolean indicating whether the patient's aphasia diagnosis meets criteria as defined according to Mesulam, 2003."} // "the patient must meet the criteria for primary progressive aphasia (according to Mesulam, 2003)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_aphasia_now@@defined_according_to_mesulam_2003
         patient_has_finding_of_aphasia_now)
     :named REQ2_AUXILIARY0)) ;; "the patient must meet the criteria for primary progressive aphasia (according to Mesulam, 2003)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_aphasia_now@@defined_according_to_mesulam_2003
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must meet the criteria for primary progressive aphasia (according to Mesulam, 2003)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Alzheimer’s disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Alzheimer’s disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Alzheimer’s disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Alzheimer’s disease."} // "the patient must meet the criteria for Alzheimer disease"
(declare-const patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosis_according_to_dsm_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient’s diagnosis of Alzheimer’s disease is made according to DSM-IV criteria.","when_to_set_to_false":"Set to false if the patient’s diagnosis of Alzheimer’s disease is not made according to DSM-IV criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of Alzheimer’s disease is made according to DSM-IV criteria.","meaning":"Boolean indicating whether the patient’s diagnosis of Alzheimer’s disease is made according to DSM-IV criteria."} // "according to Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosis_according_to_dsm_iv
         patient_has_diagnosis_of_alzheimer_s_disease_now)
     :named REQ3_AUXILIARY0)) ;; "diagnosis of Alzheimer’s disease according to DSM-IV" implies "diagnosis of Alzheimer’s disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_diagnosis_of_alzheimer_s_disease_now@@diagnosis_according_to_dsm_iv
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must meet the criteria for Alzheimer disease (according to DSM-IV)"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_living_in_community_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently living in the community (not in any institutional or facility-based setting).","when_to_set_to_false":"Set to false if the patient is currently not living in the community (i.e., is residing in an institutional or facility-based setting).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently living in the community.","meaning":"Boolean indicating whether the patient is currently living in the community."} // "the patient must be living in the community"
(declare-const patient_is_living_in_dementia_specific_living_facility_manned_24h_7d_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently living in a dementia-specific living facility that is staffed 24 hours per day, 7 days per week.","when_to_set_to_false":"Set to false if the patient is currently not living in a dementia-specific living facility staffed 24 hours per day, 7 days per week.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently living in a dementia-specific living facility staffed 24 hours per day, 7 days per week.","meaning":"Boolean indicating whether the patient is currently living in a dementia-specific living facility staffed 24 hours per day, 7 days per week."} // "the patient must not be living in dementia-specific living facilities manned 24 hours per day, 7 days per week"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: The patient must be living in the community.
(assert
  (! patient_is_living_in_community_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be living in the community"

;; Component 1: The patient must NOT be living in dementia-specific living facilities manned 24 hours per day, 7 days per week.
(assert
  (! (not patient_is_living_in_dementia_specific_living_facility_manned_24h_7d_now)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient must not be living in dementia-specific living facilities manned 24 hours per day, 7 days per week"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_family_member_with_regular_contact_at_least_once_per_week Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a family member who has regular contact with the patient at least once per week.","when_to_set_to_false":"Set to false if the patient does not have a family member who has regular contact with the patient at least once per week.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a family member with regular contact at least once per week.","meaning":"Boolean indicating whether the patient has a family member who has regular contact with the patient at least once per week."} // "the patient must have a family member with regular contact at least once per week"
(declare-const patient_has_family_member_with_regular_contact_at_least_once_per_week@@regular_contact_frequency_value_recorded_per_week_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of times per week that the family member has contact with the patient.","when_to_set_to_null":"Set to null if the frequency of contact per week is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the frequency (count per week) of contact between the family member and the patient."} // "regular contact at least once per week"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; The Boolean variable is true if and only if the contact frequency is at least 1 per week
(assert
  (! (= patient_has_family_member_with_regular_contact_at_least_once_per_week
        (>= patient_has_family_member_with_regular_contact_at_least_once_per_week@@regular_contact_frequency_value_recorded_per_week_withunit_count 1))
     :named REQ5_AUXILIARY0)) ;; "regular contact at least once per week"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_family_member_with_regular_contact_at_least_once_per_week
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a family member with regular contact at least once per week"
