;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_delirium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of delirium.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of delirium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has delirium.","meaning":"Boolean indicating whether the patient currently has delirium."} ;; "delirium"
(declare-const patient_has_finding_of_delirium_now@@at_intensive_care_unit_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has delirium at the time of intensive care unit admission.","when_to_set_to_false":"Set to false if the patient does not have delirium at the time of intensive care unit admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has delirium at the time of intensive care unit admission.","meaning":"Boolean indicating whether the patient currently has delirium at the time of intensive care unit admission."} ;; "delirium at intensive care unit admission"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_delirium_now@@at_intensive_care_unit_admission
      patient_has_finding_of_delirium_now)
:named REQ0_AUXILIARY0)) ;; "delirium at intensive care unit admission" implies "delirium"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_delirium_now@@at_intensive_care_unit_admission)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has delirium at intensive care unit admission."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const expected_intensive_care_unit_stay_duration_in_hours Real) ;; {"when_to_set_to_value":"Set to the expected number of hours the patient will stay in the intensive care unit, as determined by clinical judgment or care planning.","when_to_set_to_null":"Set to null if the expected duration of the patient's intensive care unit stay is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the expected duration in hours of the patient's intensive care unit stay."} ;; "expected to have an intensive care unit stay less than six hours"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (< expected_intensive_care_unit_stay_duration_in_hours 6))
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is expected to have an intensive care unit stay less than six hours."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_coma_inthehistory@@sustained_during_entire_intensive_care_unit_stay Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coma was sustained during the entire intensive care unit stay.","when_to_set_to_false":"Set to false if the patient's coma was not sustained during the entire intensive care unit stay.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coma was sustained during the entire intensive care unit stay.","meaning":"Boolean indicating whether the patient's coma was sustained during the entire intensive care unit stay."} ;; "sustained coma during entire intensive care unit stay"
(declare-const patient_has_finding_of_inability_to_understand_language_spoken_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to understand the language spoken.","when_to_set_to_false":"Set to false if the patient currently does not have inability to understand the language spoken.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to understand the language spoken.","meaning":"Boolean indicating whether the patient currently has inability to understand the language spoken."} ;; "inability to understand the language spoken"
(declare-const patient_has_finding_of_severe_mental_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe mental disability.","when_to_set_to_false":"Set to false if the patient currently does not have severe mental disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe mental disability.","meaning":"Boolean indicating whether the patient currently has severe mental disability."} ;; "severe mental disability"
(declare-const patient_has_finding_of_aphasia_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's aphasia is serious.","when_to_set_to_false":"Set to false if the patient's aphasia is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's aphasia is serious.","meaning":"Boolean indicating whether the patient's aphasia is serious."} ;; "serious receptive aphasia"
(declare-const patient_has_finding_of_aphasia_now@@receptive Bool) ;; {"when_to_set_to_true":"Set to true if the patient's aphasia is receptive.","when_to_set_to_false":"Set to false if the patient's aphasia is not receptive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's aphasia is receptive.","meaning":"Boolean indicating whether the patient's aphasia is receptive."} ;; "serious receptive aphasia"
(declare-const patient_has_finding_of_serious_auditory_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has serious auditory disorder.","when_to_set_to_false":"Set to false if the patient currently does not have serious auditory disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has serious auditory disorder.","meaning":"Boolean indicating whether the patient currently has serious auditory disorder."} ;; "serious auditory disorder"
(declare-const patient_has_finding_of_serious_visual_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has serious visual disorder.","when_to_set_to_false":"Set to false if the patient currently does not have serious visual disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has serious visual disorder.","meaning":"Boolean indicating whether the patient currently has serious visual disorder."} ;; "serious visual disorder"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; "serious receptive aphasia" requires both serious and receptive aphasia
(assert
(! (=> (and patient_has_finding_of_aphasia_now@@serious
            patient_has_finding_of_aphasia_now@@receptive)
        true)
    :named REQ2_AUXILIARY0)) ;; "serious receptive aphasia" = serious AND receptive aphasia

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_finding_of_coma_inthehistory@@sustained_during_entire_intensive_care_unit_stay
            patient_has_finding_of_inability_to_understand_language_spoken_now
            patient_has_finding_of_severe_mental_disability_now
            (and patient_has_finding_of_aphasia_now@@serious
                 patient_has_finding_of_aphasia_now@@receptive)
            patient_has_finding_of_serious_auditory_disorder_now
            patient_has_finding_of_serious_visual_disorder_now))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "unable to reliably assess intensive care unit delirium due to at least one of the following: (sustained coma during entire intensive care unit stay) OR (inability to understand the language spoken) OR (severe mental disability) OR (serious receptive aphasia) OR (serious auditory disorder) OR (serious visual disorder)."
