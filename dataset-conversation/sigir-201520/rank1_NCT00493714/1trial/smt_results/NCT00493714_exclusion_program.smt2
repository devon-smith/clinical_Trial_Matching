;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_refuses_to_complete_assessments Bool) ;; {"when_to_set_to_true":"Set to true if the patient refuses to complete assessments.","when_to_set_to_false":"Set to false if the patient does not refuse to complete assessments.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient refuses to complete assessments.","meaning":"Boolean indicating whether the patient refuses to complete assessments."} ;; "the patient refuses to complete assessments"
(declare-const caregiver_refuses_to_complete_assessments Bool) ;; {"when_to_set_to_true":"Set to true if the caregiver of the patient refuses to complete assessments.","when_to_set_to_false":"Set to false if the caregiver of the patient does not refuse to complete assessments.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the caregiver of the patient refuses to complete assessments.","meaning":"Boolean indicating whether the caregiver of the patient refuses to complete assessments."} ;; "the caregiver of the patient refuses to complete assessments"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_refuses_to_complete_assessments caregiver_refuses_to_complete_assessments))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient refuses to complete assessments) AND (the caregiver of the patient refuses to complete assessments)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_aphasia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has aphasia.","when_to_set_to_false":"Set to false if the patient currently does not have aphasia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has aphasia.","meaning":"Boolean indicating whether the patient currently has aphasia."} ;; "aphasia"
(declare-const patient_has_finding_of_blindness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has blindness.","when_to_set_to_false":"Set to false if the patient currently does not have blindness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has blindness.","meaning":"Boolean indicating whether the patient currently has blindness."} ;; "blindness"
(declare-const patient_has_finding_of_deafness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has deafness.","when_to_set_to_false":"Set to false if the patient currently does not have deafness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has deafness.","meaning":"Boolean indicating whether the patient currently has deafness."} ;; "deafness"
(declare-const patient_has_finding_of_sensory_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a sensorial deficit (sensory disability).","when_to_set_to_false":"Set to false if the patient currently does not have a sensorial deficit (sensory disability).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a sensorial deficit (sensory disability).","meaning":"Boolean indicating whether the patient currently has a sensorial deficit (sensory disability)."} ;; "sensorial deficit"
(declare-const patient_has_finding_of_sensory_disability_now@@other_than_cognitive_deficit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sensorial deficit is other than cognitive deficit.","when_to_set_to_false":"Set to false if the patient's sensorial deficit is cognitive deficit or cannot be determined to be other than cognitive deficit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sensorial deficit is other than cognitive deficit.","meaning":"Boolean indicating whether the patient's sensorial deficit is other than cognitive deficit."} ;; "other than cognitive deficit"
(declare-const patient_has_finding_of_sensory_disability_now@@might_impact_ability_to_recall_delirium Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sensorial deficit might impact their ability to recall the episode of delirium.","when_to_set_to_false":"Set to false if the patient's sensorial deficit does not impact or cannot be determined to impact their ability to recall the episode of delirium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sensorial deficit might impact the ability to recall delirium.","meaning":"Boolean indicating whether the patient's sensorial deficit might impact their ability to recall the episode of delirium."} ;; "might impact the ability of the patient to recall the episode of delirium"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term (sensorial deficit other than cognitive deficit)
(assert
(! (=> (or patient_has_finding_of_blindness_now
          patient_has_finding_of_deafness_now
          patient_has_finding_of_aphasia_now)
    patient_has_finding_of_sensory_disability_now@@other_than_cognitive_deficit)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (blindness, deafness, aphasia)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_sensory_disability_now@@other_than_cognitive_deficit
    patient_has_finding_of_sensory_disability_now)
:named REQ1_AUXILIARY1)) ;; "other than cognitive deficit"

(assert
(! (=> patient_has_finding_of_sensory_disability_now@@might_impact_ability_to_recall_delirium
    patient_has_finding_of_sensory_disability_now)
:named REQ1_AUXILIARY2)) ;; "might impact the ability of the patient to recall the episode of delirium"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient is unable to complete assessment due to sensorial deficit other than cognitive deficit AND the sensorial deficit might impact ability to recall delirium
(assert
(! (not (and patient_has_finding_of_sensory_disability_now@@other_than_cognitive_deficit
             patient_has_finding_of_sensory_disability_now@@might_impact_ability_to_recall_delirium))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "unable to complete assessment due to sensorial deficit other than cognitive deficit with non-exhaustive examples (blindness, deafness, aphasia) AND the sensorial deficit might impact the ability of the patient to recall the episode of delirium."
