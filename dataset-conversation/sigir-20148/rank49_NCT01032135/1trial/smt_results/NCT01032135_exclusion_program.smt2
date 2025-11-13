;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_psychotic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychotic disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a psychotic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a psychotic disorder.","meaning":"Boolean indicating whether the patient currently has a psychotic disorder."} ;; "psychotic disorder"
(declare-const patient_has_finding_of_psychotic_disorder_now@@assessed_with_psychotic_disorder_screen_from_mini_international_neuropsychiatric_interview Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current psychotic disorder is assessed with the psychotic disorder screen from the Mini International Neuropsychiatric Interview.","when_to_set_to_false":"Set to false if the patient's current psychotic disorder is not assessed with the psychotic disorder screen from the Mini International Neuropsychiatric Interview.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the assessment was performed with the psychotic disorder screen from the Mini International Neuropsychiatric Interview.","meaning":"Boolean indicating whether the patient's current psychotic disorder is assessed with the psychotic disorder screen from the Mini International Neuropsychiatric Interview."} ;; "as assessed with the psychotic disorder screen from the Mini International Neuropsychiatric Interview"
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dementia.","when_to_set_to_false":"Set to false if the patient currently does not have dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "dementia"
(declare-const patient_has_finding_of_dementia_now@@severe_enough_to_prevent_participation_in_outpatient_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current dementia is severe enough to prevent participation in outpatient treatment.","when_to_set_to_false":"Set to false if the patient's current dementia is not severe enough to prevent participation in outpatient treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dementia is severe enough to prevent participation in outpatient treatment.","meaning":"Boolean indicating whether the patient's current dementia is severe enough to prevent participation in outpatient treatment."} ;; "severe enough to prevent participation in outpatient treatment"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable for psychotic disorder
(assert
(! (=> patient_has_finding_of_psychotic_disorder_now@@assessed_with_psychotic_disorder_screen_from_mini_international_neuropsychiatric_interview
      patient_has_finding_of_psychotic_disorder_now)
:named REQ0_AUXILIARY0)) ;; "as assessed with the psychotic disorder screen from the Mini International Neuropsychiatric Interview"

;; Qualifier variable implies corresponding stem variable for dementia
(assert
(! (=> patient_has_finding_of_dementia_now@@severe_enough_to_prevent_participation_in_outpatient_treatment
      patient_has_finding_of_dementia_now)
:named REQ0_AUXILIARY1)) ;; "severe enough to prevent participation in outpatient treatment"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have a current psychotic disorder (as assessed with the psychotic disorder screen from the Mini International Neuropsychiatric Interview)
(assert
(! (not patient_has_finding_of_psychotic_disorder_now@@assessed_with_psychotic_disorder_screen_from_mini_international_neuropsychiatric_interview)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current psychotic disorder (as assessed with the psychotic disorder screen from the Mini International Neuropsychiatric Interview)."

;; Exclusion: patient must NOT have evidence of dementia severe enough to prevent participation in outpatient treatment
(assert
(! (not patient_has_finding_of_dementia_now@@severe_enough_to_prevent_participation_in_outpatient_treatment)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of dementia severe enough to prevent participation in outpatient treatment."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_medical_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute medical problem.","when_to_set_to_false":"Set to false if the patient currently does not have an acute medical problem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute medical problem.","meaning":"Boolean indicating whether the patient currently has an acute medical problem."} ;; "acute medical problem"
(declare-const patient_has_finding_of_acute_medical_problem_now@@requiring_immediate_inpatient_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current acute medical problem requires immediate inpatient treatment.","when_to_set_to_false":"Set to false if the patient's current acute medical problem does not require immediate inpatient treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current acute medical problem requires immediate inpatient treatment.","meaning":"Boolean indicating whether the patient's current acute medical problem requires immediate inpatient treatment."} ;; "requiring immediate inpatient treatment"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_acute_medical_problem_now@@requiring_immediate_inpatient_treatment
      patient_has_finding_of_acute_medical_problem_now)
   :named REQ1_AUXILIARY0)) ;; "requiring immediate inpatient treatment" implies "acute medical problem"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_acute_medical_problem_now@@requiring_immediate_inpatient_treatment)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an acute medical problem requiring immediate inpatient treatment."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_currently_participating_in_methadone_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in methadone treatment.","when_to_set_to_false":"Set to false if the patient is not currently participating in methadone treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in methadone treatment.","meaning":"Boolean indicating whether the patient is currently participating in methadone treatment."} ;; "the patient is currently participating in methadone treatment"
(declare-const patient_is_currently_participating_in_dopamine_agonist_treatment_excluding_intensive_outpatient_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in dopamine agonist treatment, and this treatment excludes intensive outpatient therapy.","when_to_set_to_false":"Set to false if the patient is not currently participating in dopamine agonist treatment, or only participating in intensive outpatient therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in dopamine agonist treatment excluding intensive outpatient therapy.","meaning":"Boolean indicating whether the patient is currently participating in dopamine agonist treatment, excluding intensive outpatient therapy."} ;; "the patient is currently participating in other forms of dopamine agonist treatment other than intensive outpatient therapy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_currently_participating_in_methadone_treatment)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is currently participating in methadone treatment."

(assert
(! (not patient_is_currently_participating_in_dopamine_agonist_treatment_excluding_intensive_outpatient_therapy)
:named REQ2_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is currently participating in other forms of dopamine agonist treatment other than intensive outpatient therapy."
