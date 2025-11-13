;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_currently_involved_in_concurrent_research Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently involved in any other research study at the same time.","when_to_set_to_false":"Set to false if the patient is not currently involved in any other research study at the same time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently involved in concurrent research.","meaning":"Boolean indicating whether the patient is currently involved in concurrent research."} ;; "the patient is already involved in concurrent research"
(declare-const carer_of_patient_is_currently_involved_in_concurrent_research Bool) ;; {"when_to_set_to_true":"Set to true if the carer of the patient is currently involved in any other research study at the same time.","when_to_set_to_false":"Set to false if the carer of the patient is not currently involved in any other research study at the same time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carer of the patient is currently involved in concurrent research.","meaning":"Boolean indicating whether the carer of the patient is currently involved in concurrent research."} ;; "the carer of the patient is already involved in concurrent research"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_currently_involved_in_concurrent_research)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is already involved in concurrent research."

(assert
(! (not carer_of_patient_is_currently_involved_in_concurrent_research)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient’s carer is already involved in concurrent research."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dementia.","when_to_set_to_false":"Set to false if the patient currently does not have dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "the dementia is very severe"
(declare-const patient_has_finding_of_dementia_now@@very_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current dementia is very severe.","when_to_set_to_false":"Set to false if the patient's current dementia is not very severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current dementia is very severe.","meaning":"Boolean indicating whether the patient's current dementia is very severe."} ;; "the dementia is very severe"
(declare-const patient_has_finding_of_distress_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of distress.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of distress.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of distress.","meaning":"Boolean indicating whether the patient currently has distress."} ;; "an approach may increase distress"
(declare-const patient_has_finding_of_distress_now@@may_be_increased_by_approach_to_patient Bool) ;; {"when_to_set_to_true":"Set to true if the patient's distress may be increased by an approach to the patient.","when_to_set_to_false":"Set to false if the patient's distress is not increased by an approach to the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether an approach to the patient may increase distress.","meaning":"Boolean indicating whether the patient's distress may be increased by an approach to the patient."} ;; "an approach may increase distress (to patient)"
(declare-const patient_has_finding_of_distress_now@@may_be_increased_by_approach_to_carer_of_patient Bool) ;; {"when_to_set_to_true":"Set to true if the patient's distress may be increased by an approach to the carer of the patient.","when_to_set_to_false":"Set to false if the patient's distress is not increased by an approach to the carer of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether an approach to the carer of the patient may increase distress.","meaning":"Boolean indicating whether the patient's distress may be increased by an approach to the carer of the patient."} ;; "an approach may increase distress (to carer)"

;; ===================== Additional variables for key professional's judgment =====================
(declare-const key_professional_feels_approach_to_patient_inappropriate_now Bool) ;; {"when_to_set_to_true":"Set to true if the key professional currently feels that an approach to the patient would be inappropriate.","when_to_set_to_false":"Set to false if the key professional currently feels that an approach to the patient would NOT be inappropriate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the key professional feels that an approach to the patient would be inappropriate.","meaning":"Boolean indicating whether the key professional currently feels that an approach to the patient would be inappropriate."} ;; "the key professional feels that an approach to the patient would be inappropriate"
(declare-const key_professional_feels_approach_to_carer_inappropriate_now Bool) ;; {"when_to_set_to_true":"Set to true if the key professional currently feels that an approach to the carer of the patient would be inappropriate.","when_to_set_to_false":"Set to false if the key professional currently feels that an approach to the carer of the patient would NOT be inappropriate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the key professional feels that an approach to the carer of the patient would be inappropriate.","meaning":"Boolean indicating whether the key professional currently feels that an approach to the carer of the patient would be inappropriate."} ;; "the key professional feels that an approach to the carer of the patient would be inappropriate"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term (for patient)
(assert
(! (=> (or patient_has_finding_of_dementia_now@@very_severe
           patient_has_finding_of_distress_now@@may_be_increased_by_approach_to_patient)
       key_professional_feels_approach_to_patient_inappropriate_now)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (the dementia is very severe, an approach may increase distress)" for patient

;; Non-exhaustive examples imply umbrella term (for carer)
(assert
(! (=> (or patient_has_finding_of_dementia_now@@very_severe
           patient_has_finding_of_distress_now@@may_be_increased_by_approach_to_carer_of_patient)
       key_professional_feels_approach_to_carer_inappropriate_now)
:named REQ1_AUXILIARY1)) ;; "with non-exhaustive examples (the dementia is very severe, an approach may increase distress)" for carer

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_dementia_now@@very_severe
       patient_has_finding_of_dementia_now)
:named REQ1_AUXILIARY2)) ;; "very severe dementia implies dementia"

(assert
(! (=> patient_has_finding_of_distress_now@@may_be_increased_by_approach_to_patient
       patient_has_finding_of_distress_now)
:named REQ1_AUXILIARY3)) ;; "distress may be increased by approach to patient implies distress"

(assert
(! (=> patient_has_finding_of_distress_now@@may_be_increased_by_approach_to_carer_of_patient
       patient_has_finding_of_distress_now)
:named REQ1_AUXILIARY4)) ;; "distress may be increased by approach to carer implies distress"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT satisfy either exclusion condition
(assert
(! (not (or key_professional_feels_approach_to_patient_inappropriate_now
            key_professional_feels_approach_to_carer_inappropriate_now))
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the key professional feels that an approach to the patient would be inappropriate ...) OR (the key professional feels that an approach to the carer of the patient would be inappropriate ...)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or key_professional_feels_approach_to_patient_inappropriate_now
            key_professional_feels_approach_to_carer_inappropriate_now))
    :named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the key professional has any other important reason for why the patient should not be contacted) OR (the key professional has any other important reason for why the carer of the patient should not be contacted)."
