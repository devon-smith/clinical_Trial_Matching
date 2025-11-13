;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the gastrointestinal tract.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the gastrointestinal tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the gastrointestinal tract.","meaning":"Boolean indicating whether the patient currently has a disorder of the gastrointestinal tract."} ;; "gastrointestinal tract disease"
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@results_in_inability_to_take_oral_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the gastrointestinal tract results in an inability to take oral medication.","when_to_set_to_false":"Set to false if the patient's current disorder of the gastrointestinal tract does not result in an inability to take oral medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder results in inability to take oral medication.","meaning":"Boolean indicating whether the patient's current disorder of the gastrointestinal tract results in inability to take oral medication."} ;; "gastrointestinal tract disease resulting in an inability to take oral medication"
(declare-const patient_has_finding_of_intestinal_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an intestinal obstruction.","when_to_set_to_false":"Set to false if the patient currently does not have an intestinal obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an intestinal obstruction.","meaning":"Boolean indicating whether the patient currently has an intestinal obstruction."} ;; "bowel obstruction"
(declare-const patient_has_finding_of_unable_to_swallow_tablet_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an inability to swallow oral medication tablets.","when_to_set_to_false":"Set to false if the patient currently does not have an inability to swallow oral medication tablets.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an inability to swallow oral medication tablets.","meaning":"Boolean indicating whether the patient currently has an inability to swallow oral medication tablets."} ;; "inability to swallow oral medication tablets"
(declare-const patient_has_finding_of_uncontrolled_diarrhea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has uncontrolled diarrhea.","when_to_set_to_false":"Set to false if the patient currently does not have uncontrolled diarrhea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled diarrhea.","meaning":"Boolean indicating whether the patient currently has uncontrolled diarrhea."} ;; "uncontrolled diarrhea"
(declare-const patient_has_finding_of_uncontrolled_nausea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has uncontrolled nausea.","when_to_set_to_false":"Set to false if the patient currently does not have uncontrolled nausea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled nausea.","meaning":"Boolean indicating whether the patient currently has uncontrolled nausea."} ;; "uncontrolled nausea"
(declare-const patient_has_finding_of_uncontrolled_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has uncontrolled vomiting.","when_to_set_to_false":"Set to false if the patient currently does not have uncontrolled vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled vomiting.","meaning":"Boolean indicating whether the patient currently has uncontrolled vomiting."} ;; "uncontrolled vomiting"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples: each listed finding implies the umbrella qualifier
(assert
(! (=> patient_has_finding_of_uncontrolled_nausea_now
      patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@results_in_inability_to_take_oral_medication)
:named REQ0_AUXILIARY0)) ;; "uncontrolled nausea" is an example of GI tract disease resulting in inability to take oral medication

(assert
(! (=> patient_has_finding_of_uncontrolled_vomiting_now
      patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@results_in_inability_to_take_oral_medication)
:named REQ0_AUXILIARY1)) ;; "uncontrolled vomiting" is an example of GI tract disease resulting in inability to take oral medication

(assert
(! (=> patient_has_finding_of_uncontrolled_diarrhea_now
      patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@results_in_inability_to_take_oral_medication)
:named REQ0_AUXILIARY2)) ;; "uncontrolled diarrhea" is an example of GI tract disease resulting in inability to take oral medication

(assert
(! (=> patient_has_finding_of_intestinal_obstruction_now
      patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@results_in_inability_to_take_oral_medication)
:named REQ0_AUXILIARY3)) ;; "bowel obstruction" is an example of GI tract disease resulting in inability to take oral medication

(assert
(! (=> patient_has_finding_of_unable_to_swallow_tablet_now
      patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@results_in_inability_to_take_oral_medication)
:named REQ0_AUXILIARY4)) ;; "inability to swallow oral medication tablets" is an example of GI tract disease resulting in inability to take oral medication

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@results_in_inability_to_take_oral_medication
      patient_has_finding_of_disorder_of_gastrointestinal_tract_now)
:named REQ0_AUXILIARY5)) ;; "results in inability to take oral medication" implies "gastrointestinal tract disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@results_in_inability_to_take_oral_medication)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has gastrointestinal tract disease resulting in an inability to take oral medication, such as ulcerative gastrointestinal tract disease, uncontrolled nausea, uncontrolled vomiting, uncontrolled diarrhea, bowel obstruction, or inability to swallow oral medication tablets."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart disease.","meaning":"Boolean indicating whether the patient currently has heart disease."} ;; "cardiac disease"
(declare-const patient_has_finding_of_heart_disease_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart disease is active.","when_to_set_to_false":"Set to false if the patient's current heart disease is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart disease is active.","meaning":"Boolean indicating whether the patient's current heart disease is active."} ;; "active cardiac disease"
(declare-const patient_has_finding_of_heart_disease_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart disease is significant.","when_to_set_to_false":"Set to false if the patient's current heart disease is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart disease is significant.","meaning":"Boolean indicating whether the patient's current heart disease is significant."} ;; "significant cardiac disease"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_disease_now@@active
       patient_has_finding_of_heart_disease_now)
   :named REQ1_AUXILIARY0)) ;; "active cardiac disease"

(assert
(! (=> patient_has_finding_of_heart_disease_now@@significant
       patient_has_finding_of_heart_disease_now)
   :named REQ1_AUXILIARY1)) ;; "significant cardiac disease"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have significant active cardiac disease
(assert
(! (not (and patient_has_finding_of_heart_disease_now@@significant
             patient_has_finding_of_heart_disease_now@@active))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has significant active cardiac disease."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_taking_diuretic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a diuretic medication.","when_to_set_to_false":"Set to false if the patient is currently not taking a diuretic medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a diuretic medication.","meaning":"Boolean indicating whether the patient is currently taking a diuretic medication."} ;; "diuretic medication"
(declare-const patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an angiotensin-converting enzyme inhibitor containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking an angiotensin-converting enzyme inhibitor containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an angiotensin-converting enzyme inhibitor containing product.","meaning":"Boolean indicating whether the patient is currently taking an angiotensin-converting enzyme inhibitor containing product."} ;; "angiotensin-converting enzyme inhibitor medication"
(declare-const patient_is_taking_non_steroidal_anti_inflammatory_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a nonsteroidal anti-inflammatory agent.","when_to_set_to_false":"Set to false if the patient is currently not taking a nonsteroidal anti-inflammatory agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a nonsteroidal anti-inflammatory agent.","meaning":"Boolean indicating whether the patient is currently taking a nonsteroidal anti-inflammatory agent."} ;; "nonsteroidal anti-inflammatory drug medication"
(declare-const patient_is_taking_non_steroidal_anti_inflammatory_agent_now@@excludes_aspirin_or_sulindac Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a nonsteroidal anti-inflammatory agent and this excludes aspirin or sulindac medications.","when_to_set_to_false":"Set to false if the patient is currently taking a nonsteroidal anti-inflammatory agent and this does not exclude aspirin or sulindac medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether aspirin or sulindac are excluded from the nonsteroidal anti-inflammatory agent the patient is taking.","meaning":"Boolean indicating whether the patient is currently taking a nonsteroidal anti-inflammatory agent, excluding aspirin or sulindac medications."} ;; "nonsteroidal anti-inflammatory drug medication (except aspirin medication or sulindac medication)"
(declare-const patient_is_taking_anti_psychotic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an anti-psychotic agent.","when_to_set_to_false":"Set to false if the patient is currently not taking an anti-psychotic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an anti-psychotic agent.","meaning":"Boolean indicating whether the patient is currently taking an anti-psychotic agent."} ;; "neuroleptic medication"
(declare-const patient_is_taking_tetracycline_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a tetracycline-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a tetracycline-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a tetracycline-containing product.","meaning":"Boolean indicating whether the patient is currently taking a tetracycline-containing product."} ;; "tetracycline medication"
(declare-const patient_is_taking_cox_2_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a cyclooxygenase-2 inhibitor containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a cyclooxygenase-2 inhibitor containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a cyclooxygenase-2 inhibitor containing product.","meaning":"Boolean indicating whether the patient is currently taking a cyclooxygenase-2 inhibitor containing product."} ;; "cyclooxygenase-2 inhibitor medication"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_taking_non_steroidal_anti_inflammatory_agent_now@@excludes_aspirin_or_sulindac
      patient_is_taking_non_steroidal_anti_inflammatory_agent_now)
    :named REQ2_AUXILIARY0)) ;; "nonsteroidal anti-inflammatory drug medication (except aspirin medication or sulindac medication)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_is_taking_diuretic_now
            patient_is_taking_angiotensin_converting_enzyme_inhibitor_containing_product_now
            patient_is_taking_non_steroidal_anti_inflammatory_agent_now@@excludes_aspirin_or_sulindac
            patient_is_taking_anti_psychotic_agent_now
            patient_is_taking_tetracycline_containing_product_now
            patient_is_taking_cox_2_inhibitor_containing_product_now))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient is taking any of the following medications: diuretic medication, angiotensin-converting enzyme inhibitor medication, nonsteroidal anti-inflammatory drug medication (except aspirin medication or sulindac medication), neuroleptic medication, tetracycline medication, or cyclooxygenase-2 inhibitor medication."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_taking_lithium_carbonate_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any lithium carbonate-containing medication.","when_to_set_to_false":"Set to false if the patient is not currently taking any lithium carbonate-containing medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any lithium carbonate-containing medication.","meaning":"Boolean indicating whether the patient is currently taking any lithium carbonate-containing medication."} ;; "lithium carbonate medication"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_is_taking_lithium_carbonate_containing_product_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient is already taking lithium carbonate medication for any reason."
