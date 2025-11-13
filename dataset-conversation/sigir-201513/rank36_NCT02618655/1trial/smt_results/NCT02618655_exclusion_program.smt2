;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of fever.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of fever.","meaning":"Boolean indicating whether the patient currently has fever."} ;; "fever"

(declare-const patient_has_finding_of_fever_now@@caused_by_non_infectious_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current fever is caused by a non-infectious disease.","when_to_set_to_false":"Set to false if the patient's current fever is not caused by a non-infectious disease (e.g., caused by infectious disease or unknown cause).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current fever is caused by a non-infectious disease.","meaning":"Boolean indicating whether the patient's current fever is caused by a non-infectious disease."} ;; "fever due to non-infectious disease"

(declare-const patient_has_finding_of_rheumatic_autoimmune_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a rheumatic autoimmune disease.","when_to_set_to_false":"Set to false if the patient currently does not have a rheumatic autoimmune disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a rheumatic autoimmune disease.","meaning":"Boolean indicating whether the patient currently has a rheumatic autoimmune disease."} ;; "rheumatic autoimmune disease"

(declare-const patient_has_finding_of_tumor_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a tumor disease.","when_to_set_to_false":"Set to false if the patient currently does not have a tumor disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a tumor disease.","meaning":"Boolean indicating whether the patient currently has a tumor disease."} ;; "tumor disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_rheumatic_autoimmune_disease_now
          patient_has_finding_of_tumor_disease_now)
     patient_has_finding_of_fever_now@@caused_by_non_infectious_disease)
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples ((rheumatic autoimmune disease) OR (tumor disease))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_fever_now@@caused_by_non_infectious_disease
       patient_has_finding_of_fever_now)
:named REQ0_AUXILIARY1)) ;; "fever due to non-infectious disease""

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_fever_now@@caused_by_non_infectious_disease)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has fever due to non-infectious disease with non-exhaustive examples ((rheumatic autoimmune disease) OR (tumor disease))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_meets_selection_criterion_within_observation_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets the selection criterion at any time during the observation period.","when_to_set_to_false":"Set to false if the patient does not meet the selection criterion at any time during the observation period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets the selection criterion within the observation period.","meaning":"Boolean indicating whether the patient meets the selection criterion within the observation period."} ;; "meets the selection criterion within the observation period"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_meets_selection_criterion_within_observation_period)
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient does NOT meet the selection criterion within the observation period."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_leaves_with_automatic_discharge Bool) ;; {"when_to_set_to_true":"Set to true if the patient leaves with an automatic discharge.","when_to_set_to_false":"Set to false if the patient leaves and the discharge is not automatic, or if the patient does not leave.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient leaves with automatic discharge.","meaning":"Boolean indicating whether the patient leaves with automatic discharge."} ;; "leaves with automatic discharge"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_leaves_with_automatic_discharge)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient leaves with automatic discharge."
