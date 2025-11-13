;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_exposed_to_interleukin_1_receptor_antagonist_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to interleukin-1 receptor antagonist at any time in the past, including previous treatments.","when_to_set_to_false":"Set to false if the patient has never been exposed to interleukin-1 receptor antagonist at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to interleukin-1 receptor antagonist.","meaning":"Boolean indicating whether the patient has ever been exposed to interleukin-1 receptor antagonist at any time in the past."} ;; "has had previous treatment with interleukin-1 receptor antagonist."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_exposed_to_interleukin_1_receptor_antagonist_inthehistory)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous treatment with interleukin-1 receptor antagonist."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_intra_articular_injection_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an intra-articular injection in the past 4 weeks.","when_to_set_to_false":"Set to false if the patient has not undergone an intra-articular injection in the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an intra-articular injection in the past 4 weeks.","meaning":"Boolean indicating whether the patient has undergone an intra-articular injection in the past 4 weeks."} ;; "intra-articular injection"
(declare-const patient_has_undergone_intra_articular_injection_inthepast4weeks@@temporalcontext_within4weeks_before_initiation_of_anakinra_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the intra-articular injection occurred within the 4 weeks before the initiation of anakinra treatment.","when_to_set_to_false":"Set to false if the intra-articular injection did not occur within the 4 weeks before the initiation of anakinra treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the intra-articular injection occurred within the 4 weeks before the initiation of anakinra treatment.","meaning":"Boolean indicating whether the intra-articular injection occurred within the 4 weeks before the initiation of anakinra treatment."} ;; "intra-articular injection in the 4 weeks preceding the initiation of anakinra treatment"
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to non-steroidal anti-inflammatory agent in the past 4 weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to non-steroidal anti-inflammatory agent in the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to non-steroidal anti-inflammatory agent in the past 4 weeks.","meaning":"Boolean indicating whether the patient has been exposed to non-steroidal anti-inflammatory agent in the past 4 weeks."} ;; "non-steroidal anti-inflammatory drug"
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast4weeks@@dose_changed Bool) ;; {"when_to_set_to_true":"Set to true if the dose of non-steroidal anti-inflammatory agent was changed in the past 4 weeks.","when_to_set_to_false":"Set to false if the dose of non-steroidal anti-inflammatory agent was not changed in the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose of non-steroidal anti-inflammatory agent was changed in the past 4 weeks.","meaning":"Boolean indicating whether the dose of non-steroidal anti-inflammatory agent was changed in the past 4 weeks."} ;; "change in the doses of non-steroidal anti-inflammatory drug"
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast4weeks@@temporalcontext_within4weeks_before_initiation_of_anakinra_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the change in dose occurred within the 4 weeks before the initiation of anakinra treatment.","when_to_set_to_false":"Set to false if the change in dose did not occur within the 4 weeks before the initiation of anakinra treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the change in dose occurred within the 4 weeks before the initiation of anakinra treatment.","meaning":"Boolean indicating whether the change in dose occurred within the 4 weeks before the initiation of anakinra treatment."} ;; "change in the doses of non-steroidal anti-inflammatory drug in the 4 weeks preceding the initiation of anakinra treatment"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is taking corticosteroid and corticosteroid derivative containing product in the past 4 weeks.","when_to_set_to_false":"Set to false if the patient is not taking corticosteroid and corticosteroid derivative containing product in the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is taking corticosteroid and corticosteroid derivative containing product in the past 4 weeks.","meaning":"Boolean indicating whether the patient is taking corticosteroid and corticosteroid derivative containing product in the past 4 weeks."} ;; "corticosteroid"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks@@dose_changed Bool) ;; {"when_to_set_to_true":"Set to true if the dose of corticosteroid and corticosteroid derivative containing product was changed in the past 4 weeks.","when_to_set_to_false":"Set to false if the dose of corticosteroid and corticosteroid derivative containing product was not changed in the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose of corticosteroid and corticosteroid derivative containing product was changed in the past 4 weeks.","meaning":"Boolean indicating whether the dose of corticosteroid and corticosteroid derivative containing product was changed in the past 4 weeks."} ;; "change in the doses of corticosteroid"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks@@temporalcontext_within4weeks_before_initiation_of_anakinra_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the change in dose occurred within the 4 weeks before the initiation of anakinra treatment.","when_to_set_to_false":"Set to false if the change in dose did not occur within the 4 weeks before the initiation of anakinra treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the change in dose occurred within the 4 weeks before the initiation of anakinra treatment.","meaning":"Boolean indicating whether the change in dose occurred within the 4 weeks before the initiation of anakinra treatment."} ;; "change in the doses of corticosteroid in the 4 weeks preceding the initiation of anakinra treatment"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable for intra-articular injection
(assert
(! (=> patient_has_undergone_intra_articular_injection_inthepast4weeks@@temporalcontext_within4weeks_before_initiation_of_anakinra_treatment
     patient_has_undergone_intra_articular_injection_inthepast4weeks)
:named REQ1_AUXILIARY0)) ;; "intra-articular injection in the 4 weeks preceding the initiation of anakinra treatment"

;; Qualifier variable implies corresponding stem variable for NSAID exposure
(assert
(! (=> patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast4weeks@@dose_changed
     patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast4weeks)
:named REQ1_AUXILIARY1)) ;; "change in the doses of non-steroidal anti-inflammatory drug"

;; Qualifier variable implies corresponding stem variable for NSAID dose change temporal context
(assert
(! (=> patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast4weeks@@temporalcontext_within4weeks_before_initiation_of_anakinra_treatment
     patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast4weeks@@dose_changed)
:named REQ1_AUXILIARY2)) ;; "change in the doses of non-steroidal anti-inflammatory drug in the 4 weeks preceding the initiation of anakinra treatment"

;; Qualifier variable implies corresponding stem variable for corticosteroid exposure
(assert
(! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks@@dose_changed
     patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks)
:named REQ1_AUXILIARY3)) ;; "change in the doses of corticosteroid"

;; Qualifier variable implies corresponding stem variable for corticosteroid dose change temporal context
(assert
(! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks@@temporalcontext_within4weeks_before_initiation_of_anakinra_treatment
     patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks@@dose_changed)
:named REQ1_AUXILIARY4)) ;; "change in the doses of corticosteroid in the 4 weeks preceding the initiation of anakinra treatment"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have had an intra-articular injection OR (change in NSAID dose AND change in corticosteroid dose) in the 4 weeks before anakinra
(assert
(! (not
     (or
       patient_has_undergone_intra_articular_injection_inthepast4weeks@@temporalcontext_within4weeks_before_initiation_of_anakinra_treatment
       (and
         patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_inthepast4weeks@@temporalcontext_within4weeks_before_initiation_of_anakinra_treatment
         patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast4weeks@@temporalcontext_within4weeks_before_initiation_of_anakinra_treatment
       )
     )
   )
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has had an intra-articular injection or has had a change in the doses of non-steroidal anti-inflammatory drug and has had a change in the doses of corticosteroid in the 4 weeks preceding the initiation of anakinra treatment."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_exposed_to_immunosuppressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to an immunosuppressant.","when_to_set_to_false":"Set to false if the patient is currently not receiving or exposed to an immunosuppressant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to an immunosuppressant.","meaning":"Boolean indicating whether the patient is currently exposed to (receiving) an immunosuppressant."} ;; "the patient is receiving treatment with another immunosuppressive drug"

(declare-const patient_is_receiving_treatment_with_disease_modifying_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment with another disease-modifying drug.","when_to_set_to_false":"Set to false if the patient is currently not receiving treatment with another disease-modifying drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving treatment with another disease-modifying drug.","meaning":"Boolean indicating whether the patient is currently receiving treatment with another disease-modifying drug."} ;; "the patient is receiving treatment with another disease-modifying drug"

(declare-const patient_is_receiving_treatment_with_disease_modifying_drug_now@@could_not_be_stopped_before_inclusion_for_duration_depending_on_pharmacokinetic_properties Bool) ;; {"when_to_set_to_true":"Set to true if the disease-modifying drug could not be stopped before inclusion for a duration depending on the drug's pharmacokinetic properties.","when_to_set_to_false":"Set to false if the disease-modifying drug could be stopped before inclusion for a duration depending on the drug's pharmacokinetic properties.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease-modifying drug could be stopped before inclusion for a duration depending on the drug's pharmacokinetic properties.","meaning":"Boolean indicating whether the disease-modifying drug could not be stopped before inclusion for a duration depending on the drug's pharmacokinetic properties."} ;; "the patient is receiving treatment with another disease-modifying drug that could not be stopped before inclusion for a duration depending on the drug pharmacokinetic properties"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_receiving_treatment_with_disease_modifying_drug_now@@could_not_be_stopped_before_inclusion_for_duration_depending_on_pharmacokinetic_properties
      patient_is_receiving_treatment_with_disease_modifying_drug_now)
   :named REQ2_AUXILIARY0)) ;; "the patient is receiving treatment with another disease-modifying drug that could not be stopped before inclusion for a duration depending on the drug pharmacokinetic properties"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_is_exposed_to_immunosuppressant_now
            patient_is_receiving_treatment_with_disease_modifying_drug_now@@could_not_be_stopped_before_inclusion_for_duration_depending_on_pharmacokinetic_properties))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is receiving treatment with another immunosuppressive drug) OR (the patient is receiving treatment with another disease-modifying drug that could not be stopped before inclusion for a duration depending on the drug pharmacokinetic properties))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_contraindication_to_anakinra_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication to the use of anakinra, regardless of the specific type (e.g., infection, allergy).","when_to_set_to_false":"Set to false if the patient currently does not have any contraindication to the use of anakinra.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication to the use of anakinra.","meaning":"Boolean indicating whether the patient currently has any contraindication to the use of anakinra."} ;; "contra-indication to the use of anakinra"
(declare-const patient_has_ongoing_active_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an ongoing active infection.","when_to_set_to_false":"Set to false if the patient currently does not have an ongoing active infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an ongoing active infection.","meaning":"Boolean indicating whether the patient currently has an ongoing active infection."} ;; "ongoing active infection"
(declare-const patient_has_allergy_to_escherichia_coli_derivative_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to Escherichia coli derivative.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to Escherichia coli derivative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to Escherichia coli derivative.","meaning":"Boolean indicating whether the patient currently has an allergy to Escherichia coli derivative."} ;; "allergy to Escherichia coli derivative"
(declare-const patient_has_allergy_to_other_component_of_anakinra_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to any other component of the drug anakinra.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to any other component of the drug anakinra.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to any other component of the drug anakinra.","meaning":"Boolean indicating whether the patient currently has an allergy to any other component of the drug anakinra."} ;; "allergy to other component of the drug"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_ongoing_active_infection_now
           patient_has_allergy_to_escherichia_coli_derivative_now
           patient_has_allergy_to_other_component_of_anakinra_now)
       patient_has_contraindication_to_anakinra_now)
   :named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (ongoing active infection, allergy to Escherichia coli derivative, allergy to other component of the drug)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_contraindication_to_anakinra_now)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a contra-indication to the use of anakinra with non-exhaustive examples (ongoing active infection, allergy to Escherichia coli derivative, allergy to other component of the drug)))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplastic disease (malignancy) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplastic disease (malignancy) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplastic disease (malignancy) in their history."} ;; "the patient has a previous history of malignancy"
(declare-const patient_has_diagnosis_of_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with heart failure (heart insufficiency) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with heart failure (heart insufficiency) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with heart failure (heart insufficiency).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of heart failure (heart insufficiency) in their history."} ;; "the patient has a previous history of heart insufficiency"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous history of malignancy."

(assert
  (! (not patient_has_diagnosis_of_heart_failure_inthehistory)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous history of heart insufficiency."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "the patient has asthma"
(declare-const patient_has_been_assessed_by_pneumonologist_previously Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously been assessed by a pneumonologist.","when_to_set_to_false":"Set to false if the patient has not previously been assessed by a pneumonologist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously been assessed by a pneumonologist.","meaning":"Boolean indicating whether the patient has previously been assessed by a pneumonologist."} ;; "the patient has NOT been previously assessed by a pneumonologist"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and patient_has_diagnosis_of_asthma_now
             (not patient_has_been_assessed_by_pneumonologist_previously)))
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has asthma) AND (the patient has NOT been previously assessed by a pneumonologist))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_will_undergo_therapeutic_procedure_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected to undergo a therapeutic procedure in the future.","when_to_set_to_false":"Set to false if the patient is not expected to undergo a therapeutic procedure in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo a therapeutic procedure in the future.","meaning":"Boolean indicating whether the patient is expected to undergo a therapeutic procedure in the future."} ;; "therapeutic intervention"
(declare-const patient_will_undergo_therapeutic_procedure_inthefuture@@obvious_need Bool) ;; {"when_to_set_to_true":"Set to true if the patient's need for a therapeutic procedure in the future is considered obvious.","when_to_set_to_false":"Set to false if the patient's need for a therapeutic procedure in the future is not considered obvious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the need is obvious.","meaning":"Boolean indicating whether the patient's need for a therapeutic procedure in the future is considered obvious."} ;; "obvious need of therapeutic intervention"
(declare-const patient_will_undergo_therapeutic_procedure_inthefuture@@before_study_completion Bool) ;; {"when_to_set_to_true":"Set to true if the therapeutic procedure is expected to occur before study completion.","when_to_set_to_false":"Set to false if the therapeutic procedure is not expected to occur before study completion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure will occur before study completion.","meaning":"Boolean indicating whether the therapeutic procedure is expected to occur before study completion."} ;; "before study completion"
(declare-const patient_will_undergo_surgical_procedure_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected to undergo a surgical procedure in the future.","when_to_set_to_false":"Set to false if the patient is not expected to undergo a surgical procedure in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo a surgical procedure in the future.","meaning":"Boolean indicating whether the patient is expected to undergo a surgical procedure in the future."} ;; "surgery"
(declare-const patient_will_undergo_surgical_procedure_inthefuture@@before_study_completion Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure is expected to occur before study completion.","when_to_set_to_false":"Set to false if the surgical procedure is not expected to occur before study completion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure will occur before study completion.","meaning":"Boolean indicating whether the surgical procedure is expected to occur before study completion."} ;; "surgery before study completion"
(declare-const patient_will_undergo_intra_articular_injection_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected to undergo intra-articular injection in the future.","when_to_set_to_false":"Set to false if the patient is not expected to undergo intra-articular injection in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo intra-articular injection in the future.","meaning":"Boolean indicating whether the patient is expected to undergo intra-articular injection in the future."} ;; "intra-articular injection"
(declare-const patient_will_undergo_intra_articular_injection_inthefuture@@before_study_completion Bool) ;; {"when_to_set_to_true":"Set to true if the intra-articular injection is expected to occur before study completion.","when_to_set_to_false":"Set to false if the intra-articular injection is not expected to occur before study completion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure will occur before study completion.","meaning":"Boolean indicating whether the intra-articular injection is expected to occur before study completion."} ;; "intra-articular injection before study completion"
(declare-const patient_will_undergo_live_vaccine_administration_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected to undergo live vaccine administration in the future.","when_to_set_to_false":"Set to false if the patient is not expected to undergo live vaccine administration in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo live vaccine administration in the future.","meaning":"Boolean indicating whether the patient is expected to undergo live vaccine administration in the future."} ;; "live vaccine administration"
(declare-const patient_will_undergo_live_vaccine_administration_inthefuture@@before_study_completion Bool) ;; {"when_to_set_to_true":"Set to true if the live vaccine administration is expected to occur before study completion.","when_to_set_to_false":"Set to false if the live vaccine administration is not expected to occur before study completion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure will occur before study completion.","meaning":"Boolean indicating whether the live vaccine administration is expected to occur before study completion."} ;; "live vaccine administration before study completion"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples imply umbrella term (obvious need of therapeutic intervention before study completion)
(assert
(! (=> (or patient_will_undergo_surgical_procedure_inthefuture@@before_study_completion
          patient_will_undergo_intra_articular_injection_inthefuture@@before_study_completion
          patient_will_undergo_live_vaccine_administration_inthefuture@@before_study_completion)
     (and patient_will_undergo_therapeutic_procedure_inthefuture@@obvious_need
          patient_will_undergo_therapeutic_procedure_inthefuture@@before_study_completion))
:named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (surgery, intra-articular injection, live vaccine administration)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_will_undergo_therapeutic_procedure_inthefuture@@obvious_need
      patient_will_undergo_therapeutic_procedure_inthefuture)
:named REQ6_AUXILIARY1)) ;; "obvious need of therapeutic intervention"

(assert
(! (=> patient_will_undergo_therapeutic_procedure_inthefuture@@before_study_completion
      patient_will_undergo_therapeutic_procedure_inthefuture)
:named REQ6_AUXILIARY2)) ;; "before study completion"

(assert
(! (=> patient_will_undergo_surgical_procedure_inthefuture@@before_study_completion
      patient_will_undergo_surgical_procedure_inthefuture)
:named REQ6_AUXILIARY3)) ;; "surgery before study completion"

(assert
(! (=> patient_will_undergo_intra_articular_injection_inthefuture@@before_study_completion
      patient_will_undergo_intra_articular_injection_inthefuture)
:named REQ6_AUXILIARY4)) ;; "intra-articular injection before study completion"

(assert
(! (=> patient_will_undergo_live_vaccine_administration_inthefuture@@before_study_completion
      patient_will_undergo_live_vaccine_administration_inthefuture)
:named REQ6_AUXILIARY5)) ;; "live vaccine administration before study completion"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (and patient_will_undergo_therapeutic_procedure_inthefuture@@obvious_need
             patient_will_undergo_therapeutic_procedure_inthefuture@@before_study_completion))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an obvious need of therapeutic intervention before study completion with non-exhaustive examples (surgery, intra-articular injection, live vaccine administration)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_10e9_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current white blood cell count in 10^9/L is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current white blood cell count in 10^9/L."} ;; "leucocyte count < 3.6 x 10^9/L"
(declare-const patient_polymorphonuclear_leukocyte_count_value_recorded_now_withunit_10e9_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current polymorphonuclear neutrophil count in 10^9/L is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current polymorphonuclear neutrophil count in 10^9/L."} ;; "polymorphonuclear neutrophil count < 1.5 x 10^9/L"
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_10e3_per_mm3 Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current platelet count in 10^3/mm^3 is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current platelet count in 10^3/mm^3."} ;; "platelet count < 150,000/mm^3"
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum creatinine concentration in mg/dL is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum creatinine concentration in mg/dL."} ;; "serum creatinine concentration > 1.5 times the upper limit of normal range for age"
(declare-const patient_upper_limit_of_normal_serum_creatinine_for_age_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the reference value if the upper limit of normal serum creatinine for the patient's age in mg/dL is available.","when_to_set_to_null":"Set to null if no such reference value is available or the value is indeterminate.","meaning":"Numeric value for the upper limit of normal serum creatinine for the patient's age in mg/dL at the current time."} ;; "upper limit of normal range for age (creatinine)"
(declare-const patient_alt_serum_measurement_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum ALT concentration in U/L is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum ALT concentration in U/L."} ;; "serum alanine transaminase concentration > 2 times the upper limit of the normal range"
(declare-const patient_upper_limit_of_normal_serum_alt_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the reference value if the upper limit of normal serum ALT in U/L is available.","when_to_set_to_null":"Set to null if no such reference value is available or the value is indeterminate.","meaning":"Numeric value for the upper limit of normal serum ALT in U/L at the current time."} ;; "upper limit of normal range (ALT)"
(declare-const patient_ast_serum_measurement_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current AST concentration in U/L is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum AST concentration in U/L."} ;; "serum aspartate transaminase concentration > 2 times the upper limit of the normal range"
(declare-const patient_upper_limit_of_normal_serum_ast_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the reference value if the upper limit of normal serum AST in U/L is available.","when_to_set_to_null":"Set to null if no such reference value is available or the value is indeterminate.","meaning":"Numeric value for the upper limit of normal serum AST in U/L at the current time."} ;; "upper limit of normal range (AST)"
(declare-const patient_serum_bilirubin_measurement_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum bilirubin concentration in mg/dL is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum bilirubin concentration in mg/dL."} ;; "serum bilirubin concentration > 2 times the upper limit of the normal range"
(declare-const patient_upper_limit_of_normal_serum_bilirubin_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the reference value if the upper limit of normal serum bilirubin in mg/dL is available.","when_to_set_to_null":"Set to null if no such reference value is available or the value is indeterminate.","meaning":"Numeric value for the upper limit of normal serum bilirubin in mg/dL at the current time."} ;; "upper limit of normal range (bilirubin)"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (< patient_white_blood_cell_count_value_recorded_now_withunit_10e9_per_l 3.6))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "leucocyte count < 3.6 x 10^9/L"

(assert
(! (not (< patient_polymorphonuclear_leukocyte_count_value_recorded_now_withunit_10e9_per_l 1.5))
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "polymorphonuclear neutrophil count < 1.5 x 10^9/L"

(assert
(! (not (< patient_platelet_count_finding_value_recorded_now_withunit_10e3_per_mm3 150))
:named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "platelet count < 150,000/mm^3" (note: 150,000/mm^3 = 150 x 10^3/mm^3)

(assert
(! (not (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl
           (* 1.5 patient_upper_limit_of_normal_serum_creatinine_for_age_now_withunit_mg_per_dl)))
:named REQ7_COMPONENT3_OTHER_REQUIREMENTS)) ;; "serum creatinine concentration > 1.5 times the upper limit of normal range for age"

(assert
(! (not (> patient_alt_serum_measurement_value_recorded_now_withunit_u_per_l
           (* 2 patient_upper_limit_of_normal_serum_alt_now_withunit_u_per_l)))
:named REQ7_COMPONENT4_OTHER_REQUIREMENTS)) ;; "serum alanine transaminase concentration > 2 times the upper limit of the normal range"

(assert
(! (not (> patient_ast_serum_measurement_value_recorded_now_withunit_u_per_l
           (* 2 patient_upper_limit_of_normal_serum_ast_now_withunit_u_per_l)))
:named REQ7_COMPONENT5_OTHER_REQUIREMENTS)) ;; "serum aspartate transaminase concentration > 2 times the upper limit of the normal range"

(assert
(! (not (> patient_serum_bilirubin_measurement_value_recorded_now_withunit_mg_per_dl
           (* 2 patient_upper_limit_of_normal_serum_bilirubin_now_withunit_mg_per_dl)))
:named REQ7_COMPONENT6_OTHER_REQUIREMENTS)) ;; "serum bilirubin concentration > 2 times the upper limit of the normal range"
