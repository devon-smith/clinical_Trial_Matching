;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 20 years AND aged ≤ 90 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 20)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 20 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 90)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 90 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_traumatic_and_or_non_traumatic_brain_injury_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with traumatic and/or non-traumatic brain injury at any point in their medical history, regardless of localization or type.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with traumatic and/or non-traumatic brain injury at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with traumatic and/or non-traumatic brain injury.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of traumatic and/or non-traumatic brain injury in their medical history."} ;; "the patient must have a history of brain injury (with no specific localization of brain injury OR type of brain injury required for inclusion)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_traumatic_and_or_non_traumatic_brain_injury_inthehistory
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have a history of brain injury (with no specific localization of brain injury OR type of brain injury required for inclusion)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_pharyngeal_dysphagia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pharyngeal phase dysphagia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pharyngeal phase dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pharyngeal phase dysphagia.","meaning":"Boolean indicating whether the patient currently has pharyngeal phase dysphagia."} ;; "pharyngeal phase dysphagia"
(declare-const patient_has_finding_of_pharyngeal_dysphagia_now@@occurs_following_brain_injury Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pharyngeal phase dysphagia occurs following brain injury.","when_to_set_to_false":"Set to false if the patient's current pharyngeal phase dysphagia does not occur following brain injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pharyngeal phase dysphagia occurs following brain injury.","meaning":"Boolean indicating whether the patient's current pharyngeal phase dysphagia occurs following brain injury."} ;; "pharyngeal phase dysphagia following brain injury"
(declare-const patient_has_finding_of_pharyngeal_dysphagia_now@@places_patient_at_risk_for_aspiration Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pharyngeal phase dysphagia places the patient at risk for aspiration.","when_to_set_to_false":"Set to false if the patient's current pharyngeal phase dysphagia does not place the patient at risk for aspiration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pharyngeal phase dysphagia places the patient at risk for aspiration.","meaning":"Boolean indicating whether the patient's current pharyngeal phase dysphagia places the patient at risk for aspiration."} ;; "pharyngeal phase dysphagia ... that places the patient at risk for aspiration"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies stem variable (pharyngeal phase dysphagia occurs following brain injury)
(assert
  (! (=> patient_has_finding_of_pharyngeal_dysphagia_now@@occurs_following_brain_injury
         patient_has_finding_of_pharyngeal_dysphagia_now)
     :named REQ2_AUXILIARY0)) ;; "pharyngeal phase dysphagia following brain injury"

;; Qualifier variable implies stem variable (pharyngeal phase dysphagia places patient at risk for aspiration)
(assert
  (! (=> patient_has_finding_of_pharyngeal_dysphagia_now@@places_patient_at_risk_for_aspiration
         patient_has_finding_of_pharyngeal_dysphagia_now)
     :named REQ2_AUXILIARY1)) ;; "pharyngeal phase dysphagia ... that places the patient at risk for aspiration"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have evidence of pharyngeal phase dysphagia following brain injury that places the patient at risk for aspiration.
(assert
  (! (and patient_has_finding_of_pharyngeal_dysphagia_now@@occurs_following_brain_injury
          patient_has_finding_of_pharyngeal_dysphagia_now@@places_patient_at_risk_for_aspiration)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "evidence of pharyngeal phase dysphagia following brain injury that places the patient at risk for aspiration"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_at_risk_for_aspiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently at risk for aspiration.","when_to_set_to_false":"Set to false if the patient is currently not at risk for aspiration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently at risk for aspiration.","meaning":"Boolean indicating whether the patient is currently at risk for aspiration."} ;; "risk for aspiration"
(declare-const patient_has_finding_of_at_risk_for_aspiration_now@@based_on_medical_history_and_videofluoroscopic_swallowing_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's risk for aspiration is determined based on both medical history and evidence from a videofluoroscopic swallowing study.","when_to_set_to_false":"Set to false if the patient's risk for aspiration is not determined based on both medical history and evidence from a videofluoroscopic swallowing study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the risk for aspiration is based on both medical history and videofluoroscopic swallowing study evidence.","meaning":"Boolean indicating whether the patient's risk for aspiration is determined based on both medical history and videofluoroscopic swallowing study evidence."} ;; "risk for aspiration ... based on (medical history AND evidence from a videofluoroscopic swallowing study)"
(declare-const patient_has_finding_of_at_risk_for_aspiration_now@@deemed_present_due_to_impaired_pharyngeal_phase_as_judged_by_expert Bool) ;; {"when_to_set_to_true":"Set to true if the patient's risk for aspiration is deemed present due to impaired pharyngeal phase of swallowing as judged by an expert experienced in dysphagia evaluation.","when_to_set_to_false":"Set to false if the patient's risk for aspiration is not deemed present due to impaired pharyngeal phase of swallowing as judged by an expert experienced in dysphagia evaluation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether risk for aspiration is deemed present due to impaired pharyngeal phase of swallowing as judged by an expert experienced in dysphagia evaluation.","meaning":"Boolean indicating whether the patient's risk for aspiration is deemed present due to impaired pharyngeal phase of swallowing as judged by an expert experienced in dysphagia evaluation."} ;; "risk for aspiration deemed present due to impaired pharyngeal phase of swallowing as judged by an expert experienced in the evaluation of dysphagia"
(declare-const patient_has_finding_of_at_risk_for_aspiration_now@@demonstrated_in_previous_assessment_and_preliminary_studies Bool) ;; {"when_to_set_to_true":"Set to true if the patient's risk for aspiration is demonstrated in both previous assessment and preliminary studies.","when_to_set_to_false":"Set to false if the patient's risk for aspiration is not demonstrated in both previous assessment and preliminary studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether risk for aspiration is demonstrated in both previous assessment and preliminary studies.","meaning":"Boolean indicating whether the patient's risk for aspiration is demonstrated in both previous assessment and preliminary studies."} ;; "risk for aspiration ... demonstrated in previous assessment AND during preliminary studies"
(declare-const patient_has_finding_of_pulmonary_aspiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has frank aspiration.","when_to_set_to_false":"Set to false if the patient currently does not have frank aspiration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has frank aspiration.","meaning":"Boolean indicating whether the patient currently has frank aspiration."} ;; "frank aspiration"
(declare-const patient_has_finding_of_pulmonary_aspiration_now@@based_on_medical_history_and_videofluoroscopic_swallowing_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's frank aspiration is determined based on both medical history and evidence from a videofluoroscopic swallowing study.","when_to_set_to_false":"Set to false if the patient's frank aspiration is not determined based on both medical history and evidence from a videofluoroscopic swallowing study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether frank aspiration is based on both medical history and videofluoroscopic swallowing study evidence.","meaning":"Boolean indicating whether the patient's frank aspiration is determined based on both medical history and videofluoroscopic swallowing study evidence."} ;; "frank aspiration ... based on (medical history AND evidence from a videofluoroscopic swallowing study)"
(declare-const patient_has_finding_of_pulmonary_aspiration_now@@demonstrated_in_previous_assessment_and_preliminary_studies Bool) ;; {"when_to_set_to_true":"Set to true if the patient's aspiration is demonstrated in both previous assessment and preliminary studies.","when_to_set_to_false":"Set to false if the patient's aspiration is not demonstrated in both previous assessment and preliminary studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether aspiration is demonstrated in both previous assessment and preliminary studies.","meaning":"Boolean indicating whether the patient's aspiration is demonstrated in both previous assessment and preliminary studies."} ;; "frank aspiration ... demonstrated in previous assessment AND during preliminary studies"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_at_risk_for_aspiration_now@@based_on_medical_history_and_videofluoroscopic_swallowing_study
         patient_has_finding_of_at_risk_for_aspiration_now)
     :named REQ3_AUXILIARY0)) ;; "risk for aspiration ... based on (medical history AND evidence from a videofluoroscopic swallowing study)"

(assert
  (! (=> patient_has_finding_of_at_risk_for_aspiration_now@@deemed_present_due_to_impaired_pharyngeal_phase_as_judged_by_expert
         patient_has_finding_of_at_risk_for_aspiration_now)
     :named REQ3_AUXILIARY1)) ;; "risk for aspiration deemed present due to impaired pharyngeal phase of swallowing as judged by an expert experienced in the evaluation of dysphagia"

(assert
  (! (=> patient_has_finding_of_at_risk_for_aspiration_now@@demonstrated_in_previous_assessment_and_preliminary_studies
         patient_has_finding_of_at_risk_for_aspiration_now)
     :named REQ3_AUXILIARY2)) ;; "risk for aspiration ... demonstrated in previous assessment AND during preliminary studies"

(assert
  (! (=> patient_has_finding_of_pulmonary_aspiration_now@@based_on_medical_history_and_videofluoroscopic_swallowing_study
         patient_has_finding_of_pulmonary_aspiration_now)
     :named REQ3_AUXILIARY3)) ;; "frank aspiration ... based on (medical history AND evidence from a videofluoroscopic swallowing study)"

(assert
  (! (=> patient_has_finding_of_pulmonary_aspiration_now@@demonstrated_in_previous_assessment_and_preliminary_studies
         patient_has_finding_of_pulmonary_aspiration_now)
     :named REQ3_AUXILIARY4)) ;; "frank aspiration ... demonstrated in previous assessment AND during preliminary studies"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Inclusion: patient must have (risk for aspiration OR frank aspiration) based on (medical history AND videofluoroscopic swallowing study),
;; OR risk for aspiration deemed present due to impaired pharyngeal phase of swallowing as judged by expert.
;; If the patient does NOT demonstrate (aspiration OR risk for aspiration) in previous assessment AND during preliminary studies, the patient will be excluded.
(assert
  (! (or
        ;; (risk for aspiration OR frank aspiration) based on (medical history AND videofluoroscopic swallowing study)
        (or patient_has_finding_of_at_risk_for_aspiration_now@@based_on_medical_history_and_videofluoroscopic_swallowing_study
            patient_has_finding_of_pulmonary_aspiration_now@@based_on_medical_history_and_videofluoroscopic_swallowing_study)
        ;; risk for aspiration deemed present due to impaired pharyngeal phase of swallowing as judged by expert
        patient_has_finding_of_at_risk_for_aspiration_now@@deemed_present_due_to_impaired_pharyngeal_phase_as_judged_by_expert
        ;; (aspiration OR risk for aspiration) demonstrated in previous assessment AND preliminary studies
        (or patient_has_finding_of_at_risk_for_aspiration_now@@demonstrated_in_previous_assessment_and_preliminary_studies
            patient_has_finding_of_pulmonary_aspiration_now@@demonstrated_in_previous_assessment_and_preliminary_studies)
     )
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (risk for aspiration OR frank aspiration) based on (medical history AND evidence from a videofluoroscopic swallowing study), OR (risk for aspiration deemed present due to impaired pharyngeal phase of swallowing as judged by an expert experienced in the evaluation of dysphagia). If the patient does NOT demonstrate (aspiration OR risk for aspiration) in previous assessment AND during preliminary studies, the patient will be excluded from participation."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_pharyngeal_delay_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pharyngeal delay during the pharyngeal phase of swallowing.","when_to_set_to_false":"Set to false if the patient currently does not have pharyngeal delay during the pharyngeal phase of swallowing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pharyngeal delay during the pharyngeal phase of swallowing.","meaning":"Boolean indicating whether the patient currently has pharyngeal delay during the pharyngeal phase of swallowing."} ;; "pharyngeal delay"
(declare-const patient_has_finding_of_reduced_hyolaryngeal_elevation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has reduced hyolaryngeal elevation during the pharyngeal phase of swallowing.","when_to_set_to_false":"Set to false if the patient currently does not have reduced hyolaryngeal elevation during the pharyngeal phase of swallowing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has reduced hyolaryngeal elevation during the pharyngeal phase of swallowing.","meaning":"Boolean indicating whether the patient currently has reduced hyolaryngeal elevation during the pharyngeal phase of swallowing."} ;; "reduced hyolaryngeal elevation"
(declare-const patient_has_finding_of_reduced_laryngeal_closure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has reduced laryngeal closure during the pharyngeal phase of swallowing.","when_to_set_to_false":"Set to false if the patient currently does not have reduced laryngeal closure during the pharyngeal phase of swallowing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has reduced laryngeal closure during the pharyngeal phase of swallowing.","meaning":"Boolean indicating whether the patient currently has reduced laryngeal closure during the pharyngeal phase of swallowing."} ;; "reduced laryngeal closure"
(declare-const patient_has_finding_of_reduced_pharyngeal_clearance_of_bolus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has reduced pharyngeal clearance of the bolus during the pharyngeal phase of swallowing.","when_to_set_to_false":"Set to false if the patient currently does not have reduced pharyngeal clearance of the bolus during the pharyngeal phase of swallowing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has reduced pharyngeal clearance of the bolus during the pharyngeal phase of swallowing.","meaning":"Boolean indicating whether the patient currently has reduced pharyngeal clearance of the bolus during the pharyngeal phase of swallowing."} ;; "reduced pharyngeal clearance of the bolus"
(declare-const patient_has_finding_of_pharyngeal_dysphagia_now@@may_be_evidenced_by_pharyngeal_delay_or_reduced_hyolaryngeal_elevation_or_reduced_laryngeal_closure_or_reduced_pharyngeal_clearance_of_bolus Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impaired pharyngeal phase of swallowing (pharyngeal dysphagia) may be evidenced by any of the following: pharyngeal delay, reduced hyolaryngeal elevation, reduced laryngeal closure, or reduced pharyngeal clearance of the bolus.","when_to_set_to_false":"Set to false if the patient's impaired pharyngeal phase of swallowing (pharyngeal dysphagia) is not evidenced by any of these findings.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the impairment is evidenced by any of these findings.","meaning":"Boolean indicating whether the patient's impaired pharyngeal phase of swallowing (pharyngeal dysphagia) may be evidenced by pharyngeal delay, reduced hyolaryngeal elevation, reduced laryngeal closure, or reduced pharyngeal clearance of the bolus."} ;; "may be evidenced by (pharyngeal delay OR reduced hyolaryngeal elevation OR reduced laryngeal closure OR reduced pharyngeal clearance of the bolus)"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: The qualifier variable is true if any of the evidentiary findings are present
(assert
  (! (= patient_has_finding_of_pharyngeal_dysphagia_now@@may_be_evidenced_by_pharyngeal_delay_or_reduced_hyolaryngeal_elevation_or_reduced_laryngeal_closure_or_reduced_pharyngeal_clearance_of_bolus
        (or patient_has_finding_of_pharyngeal_delay_now
            patient_has_finding_of_reduced_hyolaryngeal_elevation_now
            patient_has_finding_of_reduced_laryngeal_closure_now
            patient_has_finding_of_reduced_pharyngeal_clearance_of_bolus_now))
     :named REQ4_AUXILIARY0)) ;; "may be evidenced by (pharyngeal delay OR reduced hyolaryngeal elevation OR reduced laryngeal closure OR reduced pharyngeal clearance of the bolus)"

;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_pharyngeal_dysphagia_now@@may_be_evidenced_by_pharyngeal_delay_or_reduced_hyolaryngeal_elevation_or_reduced_laryngeal_closure_or_reduced_pharyngeal_clearance_of_bolus
         patient_has_finding_of_pharyngeal_dysphagia_now)
     :named REQ4_AUXILIARY1)) ;; "impaired pharyngeal phase of swallowing, which may be evidenced by ..."

;; ===================== Constraint Assertions (REQ 4) =====================
;; Inclusion: patient must have impaired pharyngeal phase of swallowing, which may be evidenced by any of the listed findings
(assert
  (! (and patient_has_finding_of_pharyngeal_dysphagia_now
          patient_has_finding_of_pharyngeal_dysphagia_now@@may_be_evidenced_by_pharyngeal_delay_or_reduced_hyolaryngeal_elevation_or_reduced_laryngeal_closure_or_reduced_pharyngeal_clearance_of_bolus)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have impaired pharyngeal phase of swallowing, which may be evidenced by (pharyngeal delay OR reduced hyolaryngeal elevation OR reduced laryngeal closure OR reduced pharyngeal clearance of the bolus)."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_dysphagia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dysphagia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dysphagia.","meaning":"Boolean indicating whether the patient currently has dysphagia."} ;; "the patient must have chronic dysphagia as a result of (stroke OR other brain injury)"
(declare-const patient_has_finding_of_dysphagia_now@@is_chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current dysphagia is chronic.","when_to_set_to_false":"Set to false if the patient's current dysphagia is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current dysphagia is chronic.","meaning":"Boolean indicating whether the patient's current dysphagia is chronic."} ;; "chronic dysphagia"
(declare-const patient_has_finding_of_dysphagia_now@@occurs_following_brain_injury Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current dysphagia is a result of stroke or other brain injury.","when_to_set_to_false":"Set to false if the patient's current dysphagia is not a result of stroke or other brain injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current dysphagia is a result of stroke or other brain injury.","meaning":"Boolean indicating whether the patient's current dysphagia is a result of stroke or other brain injury."} ;; "dysphagia as a result of (stroke OR other brain injury)"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_dysphagia_now@@is_chronic
         patient_has_finding_of_dysphagia_now)
     :named REQ5_AUXILIARY0)) ;; "chronic dysphagia"

(assert
  (! (=> patient_has_finding_of_dysphagia_now@@occurs_following_brain_injury
         patient_has_finding_of_dysphagia_now)
     :named REQ5_AUXILIARY1)) ;; "dysphagia as a result of (stroke OR other brain injury)"

;; ===================== Constraint Assertions (REQ 5) =====================
;; The patient must have chronic dysphagia as a result of (stroke OR other brain injury)
(assert
  (! (and patient_has_finding_of_dysphagia_now@@is_chronic
          patient_has_finding_of_dysphagia_now@@occurs_following_brain_injury)
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have chronic dysphagia as a result of (stroke OR other brain injury)"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_age_value_recorded_inthehistory_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the onset of brain injury for the patient, as recorded in the patient's history.","when_to_set_to_null":"Set to null if the number of months since the onset of brain injury is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of months since the onset of brain injury for the patient."} ;; "≥ 4 months post-onset of brain injury"
(declare-const patient_months_since_onset_of_dysphagia_value_recorded_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the onset of dysphagia for the patient, as recorded in the patient's history.","when_to_set_to_null":"Set to null if the number of months since the onset of dysphagia is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of months since the onset of dysphagia for the patient."} ;; "≥ 4 months post-onset of dysphagia"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (>= patient_age_value_recorded_inthehistory_in_months 4)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be ≥ 4 months post-onset of brain injury."

(assert
  (! (>= patient_months_since_onset_of_dysphagia_value_recorded_in_months 4)
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be ≥ 4 months post-onset of dysphagia."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes mellitus"
(declare-const patient_has_finding_of_arteriosclerotic_coronary_vascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has arteriosclerotic coronary vascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have arteriosclerotic coronary vascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has arteriosclerotic coronary vascular disease.","meaning":"Boolean indicating whether the patient currently has arteriosclerotic coronary vascular disease."} ;; "arteriosclerotic coronary vascular disease"
(declare-const patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history or finding of tobacco smoking behavior at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history or finding of tobacco smoking behavior at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history or finding of tobacco smoking behavior.","meaning":"Boolean indicating whether the patient has a history or finding of tobacco smoking behavior."} ;; "history of smoking"
(declare-const patient_has_other_health_problems_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has other health problems not otherwise specified (excluding diabetes mellitus, arteriosclerotic coronary vascular disease, and history of smoking).","when_to_set_to_false":"Set to false if the patient currently does not have other health problems not otherwise specified.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has other health problems not otherwise specified.","meaning":"Boolean indicating whether the patient currently has other health problems not otherwise specified."} ;; "other health problems not otherwise specified"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples imply the umbrella "other health problems"
(assert
  (! (=> (or patient_has_diagnosis_of_diabetes_mellitus_now
             patient_has_finding_of_arteriosclerotic_coronary_vascular_disease_now
             patient_has_finding_of_tobacco_smoking_behavior_finding_inthehistory)
         patient_has_other_health_problems_now)
     :named REQ7_AUXILIARY0)) ;; "other health problems with non-exhaustive examples (diabetes mellitus, arteriosclerotic coronary vascular disease, history of smoking)"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Inclusion: The presence of other health problems (including diabetes mellitus, arteriosclerotic coronary vascular disease, or history of smoking) is NOT cause for automatic exclusion.
;; No exclusion constraint is imposed; patients with these conditions may be included.
(assert
  (! true
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "which will NOT be cause for automatic exclusion, but will be examined on an individual basis by the otolaryngologist"

;; ===================== Declarations for the inclusion criterion (REQ 8) =====================
(declare-const otolaryngologist_has_determined_patient_is_appropriate_candidate_for_study Bool) ;; {"when_to_set_to_true":"Set to true if the otolaryngologist has determined that the patient with tracheostomy is an appropriate candidate for the study.","when_to_set_to_false":"Set to false if the otolaryngologist has determined that the patient with tracheostomy is not an appropriate candidate for the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the otolaryngologist has determined the patient with tracheostomy is an appropriate candidate for the study.","meaning":"Boolean indicating whether the otolaryngologist has determined that the patient with tracheostomy is an appropriate candidate for the study."} ;; "the otolaryngologist will determine if an individual with tracheostomy is an appropriate candidate for the study"
(declare-const patient_has_undergone_incision_of_trachea_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone incision of trachea (tracheostomy) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone incision of trachea (tracheostomy) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone incision of trachea (tracheostomy).","meaning":"Boolean indicating whether the patient has ever undergone incision of trachea (tracheostomy) in the past."} ;; "prior history of tracheostomy"
(declare-const patient_is_undergoing_incision_of_trachea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing incision of trachea (tracheostomy).","when_to_set_to_false":"Set to false if the patient is not currently undergoing incision of trachea (tracheostomy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing incision of trachea (tracheostomy).","meaning":"Boolean indicating whether the patient is currently undergoing incision of trachea (tracheostomy)."} ;; "current tracheostomy"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; None needed: the requirement does not define umbrella relationships or equivalences.

;; ===================== Constraint Assertions (REQ 8) =====================
;; The patient may have (prior history of tracheostomy OR current tracheostomy), and the otolaryngologist will determine if an individual with tracheostomy is an appropriate candidate for the study.
(assert
  (! (or (not (or patient_has_undergone_incision_of_trachea_inthehistory
                  patient_is_undergoing_incision_of_trachea_now))
         otolaryngologist_has_determined_patient_is_appropriate_candidate_for_study)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient may have (prior history of tracheostomy OR current tracheostomy), and the otolaryngologist will determine if an individual with tracheostomy is an appropriate candidate for the study."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_has_finding_of_restricted_diet_pattern_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently on a restricted diet pattern or level.","when_to_set_to_false":"Set to false if the patient is currently not on a restricted diet pattern or level.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently on a restricted diet pattern or level.","meaning":"Boolean indicating whether the patient is currently on a restricted diet pattern."} ;; "restricted diet level"
(declare-const patient_is_exposed_to_liquidized_food_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to or consuming pureed solids (liquidized food).","when_to_set_to_false":"Set to false if the patient is currently not exposed to or consuming pureed solids (liquidized food).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to or consuming pureed solids (liquidized food).","meaning":"Boolean indicating whether the patient is currently exposed to or consuming pureed solids (liquidized food)."} ;; "pureed solids"
(declare-const patient_is_exposed_to_chopped_food_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to or consuming chopped solids.","when_to_set_to_false":"Set to false if the patient is currently not exposed to or consuming chopped solids.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to or consuming chopped solids.","meaning":"Boolean indicating whether the patient is currently exposed to or consuming chopped solids."} ;; "chopped solids"
(declare-const patient_is_exposed_to_solid_food_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to or consuming certain solid food items.","when_to_set_to_false":"Set to false if the patient is currently not exposed to or consuming certain solid food items.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to or consuming certain solid food items.","meaning":"Boolean indicating whether the patient is currently exposed to or consuming certain solid food items."} ;; "solid food items"
(declare-const patient_is_exposed_to_thickened_fluid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to or consuming thickened liquids.","when_to_set_to_false":"Set to false if the patient is currently not exposed to or consuming thickened liquids.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to or consuming thickened liquids.","meaning":"Boolean indicating whether the patient is currently exposed to or consuming thickened liquids."} ;; "thickened liquids"
(declare-const patient_has_undergone_percutaneous_endoscopic_gastrostomy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous endoscopic gastrostomy now.","when_to_set_to_false":"Set to false if the patient has not undergone percutaneous endoscopic gastrostomy now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone percutaneous endoscopic gastrostomy now.","meaning":"Boolean indicating whether the patient has undergone percutaneous endoscopic gastrostomy now."} ;; "percutaneous endoscopic gastrostomy"
(declare-const patient_has_undergone_creation_of_jejunostomy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone creation of jejunostomy now.","when_to_set_to_false":"Set to false if the patient has not undergone creation of jejunostomy now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone creation of jejunostomy now.","meaning":"Boolean indicating whether the patient has undergone creation of jejunostomy now."} ;; "jejunostomy"
(declare-const patient_has_undergone_creation_of_jejunostomy_now@@percutaneous_endoscopic_approach Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone creation of jejunostomy now using a percutaneous endoscopic approach.","when_to_set_to_false":"Set to false if the patient has undergone creation of jejunostomy now but not using a percutaneous endoscopic approach.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure was performed using a percutaneous endoscopic approach.","meaning":"Boolean indicating whether the patient has undergone creation of jejunostomy now using a percutaneous endoscopic approach."} ;; "percutaneous endoscopic jejunostomy"
(declare-const patient_is_taking_peripheral_line_feeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving peripheral parenteral nutrition.","when_to_set_to_false":"Set to false if the patient is currently not receiving peripheral parenteral nutrition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving peripheral parenteral nutrition.","meaning":"Boolean indicating whether the patient is currently receiving peripheral parenteral nutrition."} ;; "peripheral parenteral nutrition"
(declare-const patient_is_taking_total_parenteral_nutrition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving total parenteral nutrition.","when_to_set_to_false":"Set to false if the patient is currently not receiving total parenteral nutrition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving total parenteral nutrition.","meaning":"Boolean indicating whether the patient is currently receiving total parenteral nutrition."} ;; "total parenteral nutrition"
(declare-const patients_nutrition_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving nutrition (by any means).","when_to_set_to_false":"Set to false if the patient is currently not receiving nutrition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving nutrition.","meaning":"Boolean indicating whether the patient is currently receiving nutrition."} ;; "nutrition"
(declare-const patients_nutrition_is_positive_now@@received_by_alternate_means Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving nutrition by alternate means (not orally).","when_to_set_to_false":"Set to false if the patient is currently not receiving nutrition by alternate means (i.e., only orally).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving nutrition by alternate means.","meaning":"Boolean indicating whether the patient is currently receiving nutrition by alternate means (not orally)."} ;; "alternate means of nutrition"
(declare-const patients_nutrition_is_positive_now@@all_intake_oral Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving all of their nutritional intake orally.","when_to_set_to_false":"Set to false if the patient is currently not receiving all of their nutritional intake orally.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving all of their nutritional intake orally.","meaning":"Boolean indicating whether the patient is currently receiving all of their nutritional intake orally."} ;; "all of their nutritional intake orally"
(declare-const patients_hydration_status_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving hydration (by any means).","when_to_set_to_false":"Set to false if the patient is currently not receiving hydration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving hydration.","meaning":"Boolean indicating whether the patient is currently receiving hydration."} ;; "hydration"
(declare-const patients_hydration_status_is_positive_now@@received_by_alternate_means Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving hydration by alternate means (not orally).","when_to_set_to_false":"Set to false if the patient is currently not receiving hydration by alternate means (i.e., only orally).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving hydration by alternate means.","meaning":"Boolean indicating whether the patient is currently receiving hydration by alternate means (not orally)."} ;; "alternate means of hydration"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Non-exhaustive examples for restricted diet pattern: pureed solids, chopped solids, restrictions to certain solid food items, thickened liquids
(assert
  (! (=> (or patient_is_exposed_to_liquidized_food_now
            patient_is_exposed_to_chopped_food_now
            patient_is_exposed_to_solid_food_now
            patient_is_exposed_to_thickened_fluid_now)
         patient_has_finding_of_restricted_diet_pattern_now)
     :named REQ9_AUXILIARY0)) ;; "diet level restriction with non-exhaustive examples (pureed solids, chopped solids), restrictions to certain solid food items, or thickened liquids"

;; Non-exhaustive examples for alternate means of nutrition: percutaneous endoscopic gastrostomy, percutaneous endoscopic jejunostomy, peripheral parenteral nutrition, total parenteral nutrition
(assert
  (! (=> (or patient_has_undergone_percutaneous_endoscopic_gastrostomy_now
            patient_has_undergone_creation_of_jejunostomy_now@@percutaneous_endoscopic_approach
            patient_is_taking_peripheral_line_feeding_now
            patient_is_taking_total_parenteral_nutrition_now)
         patients_nutrition_is_positive_now@@received_by_alternate_means)
     :named REQ9_AUXILIARY1)) ;; "alternate means of nutrition (with non-exhaustive examples (percutaneous endoscopic gastrostomy, percutaneous endoscopic jejunostomy, peripheral parenteral nutrition, total parenteral nutrition))"

;; Qualifier variable implies stem variable for jejunostomy
(assert
  (! (=> patient_has_undergone_creation_of_jejunostomy_now@@percutaneous_endoscopic_approach
         patient_has_undergone_creation_of_jejunostomy_now)
     :named REQ9_AUXILIARY2)) ;; "percutaneous endoscopic jejunostomy"

;; Qualifier variable implies stem variable for nutrition
(assert
  (! (=> patients_nutrition_is_positive_now@@received_by_alternate_means
         patients_nutrition_is_positive_now)
     :named REQ9_AUXILIARY3)) ;; "alternate means of nutrition"

;; Qualifier variable implies stem variable for hydration
(assert
  (! (=> patients_hydration_status_is_positive_now@@received_by_alternate_means
         patients_hydration_status_is_positive_now)
     :named REQ9_AUXILIARY4)) ;; "alternate means of hydration"

;; Qualifier variable implies stem variable for all oral intake
(assert
  (! (=> patients_nutrition_is_positive_now@@all_intake_oral
         patients_nutrition_is_positive_now)
     :named REQ9_AUXILIARY5)) ;; "all of their nutritional intake orally"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Inclusion: patient must be on a restricted diet level
(assert
  (! patient_has_finding_of_restricted_diet_pattern_now
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be on a restricted diet level (which may include ...)"

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const mini_mental_state_examination_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's Mini-Mental State Examination score in points, recorded at the current time.","when_to_set_to_null":"Set to null if the score is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the patient's Mini-Mental State Examination score, recorded now, in points."} ;; "Mini-Mental State Examination score greater than or equal to 23"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! (>= mini_mental_state_examination_score_value_recorded_now_withunit_points 23)
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "Mini-Mental State Examination score greater than or equal to 23"

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_has_finding_of_patient_status_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medical status finding (e.g., stable, unstable, etc.).","when_to_set_to_false":"Set to false if the patient currently does not have any medical status finding or it is known to be absent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medical status finding.","meaning":"Boolean indicating whether the patient currently has a medical status finding."} ;; "medical status"
(declare-const patient_has_finding_of_patient_status_finding_now@@is_stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current medical status finding is stable.","when_to_set_to_false":"Set to false if the patient's current medical status finding is not stable (e.g., unstable, deteriorating, etc.).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current medical status finding is stable.","meaning":"Boolean indicating whether the patient's current medical status finding is stable."} ;; "stable medical status"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_patient_status_finding_now@@is_stable
         patient_has_finding_of_patient_status_finding_now)
     :named REQ11_AUXILIARY0)) ;; "stable medical status" means the patient has a medical status finding and that status is stable

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! patient_has_finding_of_patient_status_finding_now@@is_stable
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have stable medical status."

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_has_finding_of_vital_signs_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has stable vital signs.","when_to_set_to_false":"Set to false if the patient currently does not have stable vital signs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stable vital signs.","meaning":"Boolean indicating whether the patient currently has stable vital signs."} ;; "stable vital signs"
(declare-const patient_has_finding_of_vital_signs_finding_now@@assessed_prior_to_admission Bool) ;; {"when_to_set_to_true":"Set to true if the assessment of stable vital signs was performed prior to admission.","when_to_set_to_false":"Set to false if the assessment of stable vital signs was not performed prior to admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the assessment of stable vital signs was performed prior to admission.","meaning":"Boolean indicating whether the assessment of stable vital signs was performed prior to admission."} ;; "stable vital signs prior to admission"
(declare-const patient_has_provided_physician_letter_stating_medically_stable_and_may_participate Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided a letter from their physician stating that the patient is medically stable and may participate in the study.","when_to_set_to_false":"Set to false if the patient has not provided a letter from their physician stating that the patient is medically stable and may participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided a letter from their physician stating that the patient is medically stable and may participate in the study.","meaning":"Boolean indicating whether the patient has provided a letter from their physician stating that the patient is medically stable and may participate in the study."} ;; "provide a letter from their physician stating that the patient is medically stable and may participate in the study"
(declare-const patient_has_provided_physician_letter_stating_medically_stable_and_may_participate@@letter_assesses_stable_vital_signs_prior_to_admission Bool) ;; {"when_to_set_to_true":"Set to true if the physician's letter specifically assesses the patient's stable vital signs prior to admission.","when_to_set_to_false":"Set to false if the physician's letter does not specifically assess the patient's stable vital signs prior to admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the physician's letter specifically assesses the patient's stable vital signs prior to admission.","meaning":"Boolean indicating whether the physician's letter specifically assesses the patient's stable vital signs prior to admission."} ;; "letter ... assesses stable vital signs prior to admission"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_vital_signs_finding_now@@assessed_prior_to_admission
         patient_has_finding_of_vital_signs_finding_now)
     :named REQ12_AUXILIARY0)) ;; "stable vital signs prior to admission" implies "stable vital signs"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_provided_physician_letter_stating_medically_stable_and_may_participate@@letter_assesses_stable_vital_signs_prior_to_admission
         patient_has_provided_physician_letter_stating_medically_stable_and_may_participate)
     :named REQ12_AUXILIARY1)) ;; "letter ... assesses stable vital signs prior to admission" implies "letter stating medically stable and may participate"

;; ===================== Constraint Assertions (REQ 12) =====================
;; Component 0: patient must provide a letter from their physician stating medically stable and may participate in the study, to determine if the patient has stable vital signs prior to admission
(assert
  (! patient_has_provided_physician_letter_stating_medically_stable_and_may_participate
     :named REQ12_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must provide a letter from their physician stating that the patient is medically stable and may participate in the study"
