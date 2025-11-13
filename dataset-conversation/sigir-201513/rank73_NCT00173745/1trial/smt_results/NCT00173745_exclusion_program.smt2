;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is below 6 years of age OR the patient is above 21 years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 6))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is below 6 years of age."

(assert
(! (not (> patient_age_value_recorded_now_in_years 21))
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is above 21 years of age."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_allergy_to_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has allergy to the study medication.","when_to_set_to_false":"Set to false if the patient currently does not have allergy to the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has allergy to the study medication.","meaning":"Boolean indicating whether the patient currently has allergy to the study medication."} ;; "the patient has a known allergy to the study medication"
(declare-const patient_has_finding_of_allergy_to_drug_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to the study medication is known (documented or established).","when_to_set_to_false":"Set to false if the patient's allergy to the study medication is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to the study medication is known.","meaning":"Boolean indicating whether the patient's allergy to the study medication is known."} ;; "the patient has a known allergy to the study medication"
(declare-const patient_has_finding_of_propensity_to_adverse_reactions_to_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sensitivity (propensity to adverse reactions) to the study medication.","when_to_set_to_false":"Set to false if the patient currently does not have sensitivity (propensity to adverse reactions) to the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sensitivity (propensity to adverse reactions) to the study medication.","meaning":"Boolean indicating whether the patient currently has sensitivity (propensity to adverse reactions) to the study medication."} ;; "the patient has a known sensitivity to the study medication"
(declare-const patient_has_finding_of_propensity_to_adverse_reactions_to_drug_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sensitivity to the study medication is known (documented or established).","when_to_set_to_false":"Set to false if the patient's sensitivity to the study medication is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sensitivity to the study medication is known.","meaning":"Boolean indicating whether the patient's sensitivity to the study medication is known."} ;; "the patient has a known sensitivity to the study medication"
(declare-const patient_has_finding_of_allergy_to_component_of_study_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has allergy to a component of the study medication.","when_to_set_to_false":"Set to false if the patient currently does not have allergy to a component of the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has allergy to a component of the study medication.","meaning":"Boolean indicating whether the patient currently has allergy to a component of the study medication."} ;; "the patient has a known allergy to a component of the study medication"
(declare-const patient_has_finding_of_allergy_to_component_of_study_medication_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to a component of the study medication is known (documented or established).","when_to_set_to_false":"Set to false if the patient's allergy to a component of the study medication is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to a component of the study medication is known.","meaning":"Boolean indicating whether the patient's allergy to a component of the study medication is known."} ;; "the patient has a known allergy to a component of the study medication"
(declare-const patient_has_finding_of_propensity_to_adverse_reactions_to_component_of_study_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sensitivity (propensity to adverse reactions) to a component of the study medication.","when_to_set_to_false":"Set to false if the patient currently does not have sensitivity (propensity to adverse reactions) to a component of the study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sensitivity (propensity to adverse reactions) to a component of the study medication.","meaning":"Boolean indicating whether the patient currently has sensitivity (propensity to adverse reactions) to a component of the study medication."} ;; "the patient has a known sensitivity to a component of the study medication"
(declare-const patient_has_finding_of_propensity_to_adverse_reactions_to_component_of_study_medication_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sensitivity to a component of the study medication is known (documented or established).","when_to_set_to_false":"Set to false if the patient's sensitivity to a component of the study medication is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sensitivity to a component of the study medication is known.","meaning":"Boolean indicating whether the patient's sensitivity to a component of the study medication is known."} ;; "the patient has a known sensitivity to a component of the study medication"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_allergy_to_drug_now@@known
      patient_has_finding_of_allergy_to_drug_now)
   :named REQ1_AUXILIARY0)) ;; "the patient has a known allergy to the study medication"

(assert
(! (=> patient_has_finding_of_propensity_to_adverse_reactions_to_drug_now@@known
      patient_has_finding_of_propensity_to_adverse_reactions_to_drug_now)
   :named REQ1_AUXILIARY1)) ;; "the patient has a known sensitivity to the study medication"

(assert
(! (=> patient_has_finding_of_allergy_to_component_of_study_medication_now@@known
      patient_has_finding_of_allergy_to_component_of_study_medication_now)
   :named REQ1_AUXILIARY2)) ;; "the patient has a known allergy to a component of the study medication"

(assert
(! (=> patient_has_finding_of_propensity_to_adverse_reactions_to_component_of_study_medication_now@@known
      patient_has_finding_of_propensity_to_adverse_reactions_to_component_of_study_medication_now)
   :named REQ1_AUXILIARY3)) ;; "the patient has a known sensitivity to a component of the study medication"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_allergy_to_drug_now@@known)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to the study medication."

(assert
(! (not patient_has_finding_of_propensity_to_adverse_reactions_to_drug_now@@known)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known sensitivity to the study medication."

(assert
(! (not patient_has_finding_of_allergy_to_component_of_study_medication_now@@known)
   :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to a component of the study medication."

(assert
(! (not patient_has_finding_of_propensity_to_adverse_reactions_to_component_of_study_medication_now@@known)
   :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known sensitivity to a component of the study medication."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_myasthenia_gravis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of myasthenia gravis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of myasthenia gravis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of myasthenia gravis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of myasthenia gravis."} ;; "the patient has a diagnosis of myasthenia gravis"

(declare-const patient_has_diagnosis_of_amyotrophic_lateral_sclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of amyotrophic lateral sclerosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of amyotrophic lateral sclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of amyotrophic lateral sclerosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of amyotrophic lateral sclerosis."} ;; "the patient has a diagnosis of amyotrophic lateral sclerosis"

(declare-const patient_has_diagnosis_of_disease_that_might_interfere_with_neuromuscular_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any disease that might interfere with neuromuscular function.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any disease that might interfere with neuromuscular function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any disease that might interfere with neuromuscular function.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any disease that might interfere with neuromuscular function."} ;; "the patient has a diagnosis of any other disease that might interfere with neuromuscular function"

(declare-const patient_has_diagnosis_of_disease_that_might_interfere_with_neuromuscular_function_now@@might_interfere_with_neuromuscular_function Bool) ;; {"when_to_set_to_true":"Set to true if the disease diagnosed in the patient might interfere with neuromuscular function.","when_to_set_to_false":"Set to false if the disease diagnosed in the patient does not interfere with neuromuscular function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease diagnosed in the patient might interfere with neuromuscular function.","meaning":"Boolean indicating whether the disease diagnosed in the patient might interfere with neuromuscular function."} ;; "the patient has a diagnosis of any other disease that might interfere with neuromuscular function"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disease_that_might_interfere_with_neuromuscular_function_now@@might_interfere_with_neuromuscular_function
      patient_has_diagnosis_of_disease_that_might_interfere_with_neuromuscular_function_now)
:named REQ2_AUXILIARY0)) ;; "The qualifier specifies that the disease has the potential to interfere with neuromuscular function."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_myasthenia_gravis_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of myasthenia gravis."

(assert
(! (not patient_has_diagnosis_of_amyotrophic_lateral_sclerosis_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of amyotrophic lateral sclerosis."

(assert
(! (not patient_has_diagnosis_of_disease_that_might_interfere_with_neuromuscular_function_now)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of any other disease that might interfere with neuromuscular function."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_operation_on_submaxillary_gland_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a surgical procedure on the submandibular gland at any time in their history (prior to now).","when_to_set_to_false":"Set to false if the patient has never undergone a surgical procedure on the submandibular gland at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a surgical procedure on the submandibular gland.","meaning":"Boolean indicating whether the patient has ever undergone a surgical procedure on the submandibular gland at any time in their history."} ;; "the patient has had prior surgery of the submandibular gland"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_operation_on_submaxillary_gland_inthehistory)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior surgery of the submandibular gland."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_receiving_medication_that_affects_drooling_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving any medication that affects drooling.","when_to_set_to_false":"Set to false if the patient is currently not receiving any medication that affects drooling.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving any medication that affects drooling.","meaning":"Boolean indicating whether the patient is currently receiving any medication that affects drooling."} ;; "the patient is receiving medication that affects drooling"
(declare-const patient_is_exposed_to_acetylcholine_receptor_antagonist_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to an acetylcholine receptor antagonist (anticholinergic drug).","when_to_set_to_false":"Set to false if the patient is currently not exposed to an acetylcholine receptor antagonist (anticholinergic drug).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to an acetylcholine receptor antagonist (anticholinergic drug).","meaning":"Boolean indicating whether the patient is currently exposed to an acetylcholine receptor antagonist (anticholinergic drug)."} ;; "anticholinergic drug"
(declare-const patient_has_finding_of_dribbling_from_mouth_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of drooling (dribbling from mouth).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of drooling (dribbling from mouth).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has drooling (dribbling from mouth).","meaning":"Boolean indicating whether the patient currently has drooling (dribbling from mouth)."} ;; "drooling"
(declare-const patient_has_finding_of_dribbling_from_mouth_now@@affected_by_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current drooling (dribbling from mouth) is affected by medication.","when_to_set_to_false":"Set to false if the patient's current drooling (dribbling from mouth) is not affected by medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current drooling (dribbling from mouth) is affected by medication.","meaning":"Boolean indicating whether the patient's current drooling (dribbling from mouth) is affected by medication."} ;; "drooling affected by medication"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive example: anticholinergic drug is an example of medication that affects drooling
(assert
(! (=> patient_is_exposed_to_acetylcholine_receptor_antagonist_now
      patient_is_receiving_medication_that_affects_drooling_now)
:named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (anticholinergic drug)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_dribbling_from_mouth_now@@affected_by_medication
      patient_has_finding_of_dribbling_from_mouth_now)
:named REQ4_AUXILIARY1)) ;; "drooling affected by medication" implies "drooling"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_receiving_medication_that_affects_drooling_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving medication that affects drooling with non-exhaustive examples (anticholinergic drug)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_inability_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an inability to give informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have an inability to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an inability to give informed consent.","meaning":"Boolean indicating whether the patient currently has an inability to give informed consent."} ;; "the patient has an inability to give informed consent"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_inability_to_give_informed_consent_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an inability to give informed consent."
