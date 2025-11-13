;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chronic_granulomatous_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic granulomatous disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic granulomatous disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic granulomatous disease.","meaning":"Boolean indicating whether the patient currently has chronic granulomatous disease."} // "To be included, the patient must have documented chronic granulomatous disease."
(declare-const patient_has_finding_of_chronic_granulomatous_disease_now@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic granulomatous disease is documented.","when_to_set_to_false":"Set to false if the patient's chronic granulomatous disease is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic granulomatous disease is documented.","meaning":"Boolean indicating whether the patient's chronic granulomatous disease is documented."} // "To be included, the patient must have documented chronic granulomatous disease."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_chronic_granulomatous_disease_now@@documented
         patient_has_finding_of_chronic_granulomatous_disease_now)
     :named REQ0_AUXILIARY0)) ;; "documented chronic granulomatous disease" means the patient has chronic granulomatous disease

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_chronic_granulomatous_disease_now@@documented
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have documented chronic granulomatous disease."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 75 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 1: To be included, the patient must be aged ≤ 75 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 75.0)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 75 years."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_abscess_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a liver abscess.","when_to_set_to_false":"Set to false if the patient currently does not have a liver abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a liver abscess.","meaning":"Boolean indicating whether the patient currently has a liver abscess."} // "liver abscess"
(declare-const patient_has_finding_of_abscess_of_liver_now@@infected_with_staphylococcus_aureus Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current liver abscess is infected with Staphylococcus aureus.","when_to_set_to_false":"Set to false if the patient's current liver abscess is not infected with Staphylococcus aureus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current liver abscess is infected with Staphylococcus aureus.","meaning":"Boolean indicating whether the patient's current liver abscess is infected with Staphylococcus aureus."} // "liver abscess infected with Staphylococcus aureus"
(declare-const patient_has_finding_of_abscess_of_liver_now@@infected_with_microorganism_susceptible_to_radiofrequency_ablation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current liver abscess is infected with another microorganism susceptible to radiofrequency ablation.","when_to_set_to_false":"Set to false if the patient's current liver abscess is not infected with another microorganism susceptible to radiofrequency ablation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current liver abscess is infected with another microorganism susceptible to radiofrequency ablation.","meaning":"Boolean indicating whether the patient's current liver abscess is infected with another microorganism susceptible to radiofrequency ablation."} // "liver abscess infected with another microorganism susceptible to radiofrequency ablation"
(declare-const patient_is_not_optimal_candidate_for_curative_surgical_resection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently not an optimal candidate for curative surgical resection.","when_to_set_to_false":"Set to false if the patient is currently an optimal candidate for curative surgical resection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently not an optimal candidate for curative surgical resection.","meaning":"Boolean indicating whether the patient is currently not an optimal candidate for curative surgical resection."} // "is not an optimal candidate for curative surgical resection"
(declare-const patient_is_not_optimal_candidate_for_curative_surgical_resection_now@@due_to_location_of_disease Bool) ;; {"when_to_set_to_true":"Set to true if the reason the patient is not an optimal candidate for curative surgical resection is due to the location of the disease.","when_to_set_to_false":"Set to false if the reason is not due to the location of the disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the reason is due to the location of the disease.","meaning":"Boolean indicating whether the reason the patient is not an optimal candidate for curative surgical resection is due to the location of the disease."} // "due to location of disease"
(declare-const patient_is_not_optimal_candidate_for_curative_surgical_resection_now@@due_to_multiplicity_of_disease Bool) ;; {"when_to_set_to_true":"Set to true if the reason the patient is not an optimal candidate for curative surgical resection is due to multiplicity of disease.","when_to_set_to_false":"Set to false if the reason is not due to multiplicity of disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the reason is due to multiplicity of disease.","meaning":"Boolean indicating whether the reason the patient is not an optimal candidate for curative surgical resection is due to multiplicity of disease."} // "due to multiplicity of disease"
(declare-const patient_is_not_optimal_candidate_for_curative_surgical_resection_now@@due_to_previous_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the reason the patient is not an optimal candidate for curative surgical resection is due to previous surgery.","when_to_set_to_false":"Set to false if the reason is not due to previous surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the reason is due to previous surgery.","meaning":"Boolean indicating whether the reason the patient is not an optimal candidate for curative surgical resection is due to previous surgery."} // "due to previous surgery"
(declare-const patient_is_not_optimal_candidate_for_curative_surgical_resection_now@@due_to_other_comorbidity_such_as_pulmonary_insufficiency Bool) ;; {"when_to_set_to_true":"Set to true if the reason the patient is not an optimal candidate for curative surgical resection is due to other comorbidity such as pulmonary insufficiency.","when_to_set_to_false":"Set to false if the reason is not due to other comorbidity such as pulmonary insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the reason is due to other comorbidity such as pulmonary insufficiency.","meaning":"Boolean indicating whether the reason the patient is not an optimal candidate for curative surgical resection is due to other comorbidity such as pulmonary insufficiency."} // "due to other comorbidity such as pulmonary insufficiency"
(declare-const patient_has_contraindication_to_general_anesthesia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to general anesthesia.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to general anesthesia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to general anesthesia.","meaning":"Boolean indicating whether the patient currently has a contraindication to general anesthesia."} // "has another contraindication to general anesthesia"
(declare-const patient_has_contraindication_to_perioperative_management_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to perioperative management.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to perioperative management.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to perioperative management.","meaning":"Boolean indicating whether the patient currently has a contraindication to perioperative management."} // "has another contraindication to perioperative management"
(declare-const patient_refuses_surgery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently refuses surgery.","when_to_set_to_false":"Set to false if the patient currently does not refuse surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently refuses surgery.","meaning":"Boolean indicating whether the patient currently refuses surgery."} // "refuses surgery"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply their stem variable
(assert
  (! (=> patient_has_finding_of_abscess_of_liver_now@@infected_with_staphylococcus_aureus
         patient_has_finding_of_abscess_of_liver_now)
     :named REQ2_AUXILIARY0)) ;; "liver abscess infected with Staphylococcus aureus"

(assert
  (! (=> patient_has_finding_of_abscess_of_liver_now@@infected_with_microorganism_susceptible_to_radiofrequency_ablation
         patient_has_finding_of_abscess_of_liver_now)
     :named REQ2_AUXILIARY1)) ;; "liver abscess infected with another microorganism susceptible to radiofrequency ablation"

;; Qualifier variables for reasons imply the stem variable
(assert
  (! (=> patient_is_not_optimal_candidate_for_curative_surgical_resection_now@@due_to_location_of_disease
         patient_is_not_optimal_candidate_for_curative_surgical_resection_now)
     :named REQ2_AUXILIARY2)) ;; "not optimal candidate due to location of disease"

(assert
  (! (=> patient_is_not_optimal_candidate_for_curative_surgical_resection_now@@due_to_multiplicity_of_disease
         patient_is_not_optimal_candidate_for_curative_surgical_resection_now)
     :named REQ2_AUXILIARY3)) ;; "not optimal candidate due to multiplicity of disease"

(assert
  (! (=> patient_is_not_optimal_candidate_for_curative_surgical_resection_now@@due_to_previous_surgery
         patient_is_not_optimal_candidate_for_curative_surgical_resection_now)
     :named REQ2_AUXILIARY4)) ;; "not optimal candidate due to previous surgery"

(assert
  (! (=> patient_is_not_optimal_candidate_for_curative_surgical_resection_now@@due_to_other_comorbidity_such_as_pulmonary_insufficiency
         patient_is_not_optimal_candidate_for_curative_surgical_resection_now)
     :named REQ2_AUXILIARY5)) ;; "not optimal candidate due to other comorbidity such as pulmonary insufficiency"

;; "other comorbidity such as pulmonary insufficiency" is a non-exhaustive example, so the presence of pulmonary insufficiency implies the broader comorbidity reason
;; (No explicit variable for pulmonary insufficiency, so no further implication needed.)

;; ===================== Constraint Assertions (REQ 2) =====================
;; The main inclusion logic:
;; To be included, the patient must have a liver abscess infected with Staphylococcus aureus
;; OR (have a liver abscess infected with another microorganism susceptible to radiofrequency ablation AND
;;     (is not an optimal candidate for curative surgical resection due to location of disease OR multiplicity of disease OR previous surgery OR other comorbidity such as pulmonary insufficiency
;;      OR has another contraindication to general anesthesia
;;      OR has another contraindication to perioperative management
;;      OR refuses surgery))

(assert
  (!
    (or
      patient_has_finding_of_abscess_of_liver_now@@infected_with_staphylococcus_aureus
      (and
        patient_has_finding_of_abscess_of_liver_now@@infected_with_microorganism_susceptible_to_radiofrequency_ablation
        (or
          patient_is_not_optimal_candidate_for_curative_surgical_resection_now@@due_to_location_of_disease
          patient_is_not_optimal_candidate_for_curative_surgical_resection_now@@due_to_multiplicity_of_disease
          patient_is_not_optimal_candidate_for_curative_surgical_resection_now@@due_to_previous_surgery
          patient_is_not_optimal_candidate_for_curative_surgical_resection_now@@due_to_other_comorbidity_such_as_pulmonary_insufficiency
          patient_has_contraindication_to_general_anesthesia_now
          patient_has_contraindication_to_perioperative_management_now
          patient_refuses_surgery_now
        )
      )
    )
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a liver abscess infected with Staphylococcus aureus OR (have a liver abscess infected with another microorganism susceptible to radiofrequency ablation AND (is not an optimal candidate for curative surgical resection due to location of disease OR multiplicity of disease OR previous surgery OR other comorbidity such as pulmonary insufficiency OR has another contraindication to general anesthesia OR has another contraindication to perioperative management OR refuses surgery))."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_can_undergo_imaging_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able and willing to undergo an imaging procedure in the future.","when_to_set_to_false":"Set to false if the patient is unable or unwilling to undergo an imaging procedure in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can undergo an imaging procedure in the future.","meaning":"Boolean indicating whether the patient can undergo an imaging procedure in the future."} // "the patient must be willing to return to National Institutes of Health for imaging scan."
(declare-const patient_can_undergo_imaging_inthefuture@@performed_at_national_institutes_of_health Bool) ;; {"when_to_set_to_true":"Set to true if the imaging procedure the patient can undergo in the future is performed at the National Institutes of Health.","when_to_set_to_false":"Set to false if the imaging procedure the patient can undergo in the future is not performed at the National Institutes of Health.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the imaging procedure is performed at the National Institutes of Health.","meaning":"Boolean indicating whether the imaging procedure the patient can undergo in the future is performed at the National Institutes of Health."} // "the patient must be willing to return to National Institutes of Health for imaging scan."

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_can_undergo_imaging_inthefuture@@performed_at_national_institutes_of_health
         patient_can_undergo_imaging_inthefuture)
     :named REQ3_AUXILIARY0)) ;; "the patient must be willing to return to National Institutes of Health for imaging scan."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_can_undergo_imaging_inthefuture@@performed_at_national_institutes_of_health
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to return to National Institutes of Health for imaging scan."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_willing_to_undergo_testing_associated_with_this_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to undergo testing associated with this protocol.","when_to_set_to_false":"Set to false if the patient is not willing to undergo testing associated with this protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to undergo testing associated with this protocol.","meaning":"Boolean indicating whether the patient is willing to undergo testing associated with this protocol."} // "the patient must be willing to undergo testing associated with this protocol"
(declare-const patient_can_undergo_procedure_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able and willing to undergo a procedure in the future.","when_to_set_to_false":"Set to false if the patient is unable or unwilling to undergo a procedure in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can undergo a procedure in the future.","meaning":"Boolean indicating whether the patient can undergo a procedure in the future."} // "the patient must be willing to undergo procedure associated with this protocol"
(declare-const patient_can_undergo_procedure_inthefuture@@associated_with_this_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the procedure the patient can undergo in the future is associated with this protocol.","when_to_set_to_false":"Set to false if the procedure the patient can undergo in the future is not associated with this protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is associated with this protocol.","meaning":"Boolean indicating whether the procedure is associated with this protocol."} // "procedure associated with this protocol"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_can_undergo_procedure_inthefuture@@associated_with_this_protocol
         patient_can_undergo_procedure_inthefuture)
     :named REQ4_AUXILIARY0)) ;; "procedure associated with this protocol" implies "procedure"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: patient must be willing to undergo testing associated with this protocol OR procedure associated with this protocol
(assert
  (! (or patient_is_willing_to_undergo_testing_associated_with_this_protocol
         patient_can_undergo_procedure_inthefuture@@associated_with_this_protocol)
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to undergo testing associated with this protocol OR procedure associated with this protocol."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_undergone_antibiotic_therapy_inthehistory_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antibiotic therapy at any time in the past and the outcome was negative (the therapy failed).","when_to_set_to_false":"Set to false if the patient has undergone antibiotic therapy in the past and the outcome was not negative (the therapy succeeded or was indeterminate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone antibiotic therapy in the past and the outcome was negative.","meaning":"Boolean indicating whether the patient has undergone antibiotic therapy in the past and the outcome was negative (failed therapy)."} // "To be included, the patient must have failed long-term antibiotic treatment."
(declare-const patient_has_undergone_drainage_of_abscess_inthehistory_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone drainage of abscess at any time in the past and the outcome was negative (the procedure failed).","when_to_set_to_false":"Set to false if the patient has undergone drainage of abscess in the past and the outcome was not negative (the procedure succeeded or was indeterminate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone drainage of abscess in the past and the outcome was negative.","meaning":"Boolean indicating whether the patient has undergone drainage of abscess in the past and the outcome was negative (failed procedure)."} // "To be included, if applicable, the patient must have failed abscess drainage."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_undergone_antibiotic_therapy_inthehistory_outcome_is_negative
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have failed long-term antibiotic treatment."

(assert
  (! (or (not patient_has_finding_of_abscess_of_liver_now)
         patient_has_undergone_drainage_of_abscess_inthehistory_outcome_is_negative)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, if applicable, the patient must have failed abscess drainage."
