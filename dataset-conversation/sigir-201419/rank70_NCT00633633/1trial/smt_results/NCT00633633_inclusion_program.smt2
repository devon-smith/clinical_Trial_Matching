;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of heart failure."}  ;; "To be included, the patient must have ((a diagnosis of New York Heart Association class I heart failure) OR (a diagnosis of New York Heart Association class II heart failure) OR (a diagnosis of New York Heart Association class III heart failure))..."
(declare-const patient_has_diagnosis_of_heart_failure_now@@nyha_class_i Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of heart failure and the diagnosis is New York Heart Association class I.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of heart failure but it is not New York Heart Association class I.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is New York Heart Association class I.","meaning":"Boolean indicating whether the patient currently has a diagnosis of heart failure and the diagnosis is New York Heart Association class I."}  ;; "a diagnosis of New York Heart Association class I heart failure"
(declare-const patient_has_diagnosis_of_heart_failure_now@@nyha_class_ii Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of heart failure and the diagnosis is New York Heart Association class II.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of heart failure but it is not New York Heart Association class II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is New York Heart Association class II.","meaning":"Boolean indicating whether the patient currently has a diagnosis of heart failure and the diagnosis is New York Heart Association class II."}  ;; "a diagnosis of New York Heart Association class II heart failure"
(declare-const patient_has_diagnosis_of_heart_failure_now@@nyha_class_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of heart failure and the diagnosis is New York Heart Association class III.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of heart failure but it is not New York Heart Association class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is New York Heart Association class III.","meaning":"Boolean indicating whether the patient currently has a diagnosis of heart failure and the diagnosis is New York Heart Association class III."}  ;; "a diagnosis of New York Heart Association class III heart failure"
(declare-const patient_has_diagnosis_of_heart_failure_now@@identified_by_at_least_one_of_physical_findings_or_pulmonary_edema_on_chest_xray_or_brain_natriuretic_peptide_gt_100_pg_per_ml_or_at_least_two_of_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of heart failure and the diagnosis is identified by at least one of the following: physical findings of heart failure, pulmonary edema on chest x-ray, brain natriuretic peptide > 100 picograms per milliliter, or at least two of the following symptoms: paroxysmal nocturnal dyspnea, shortness of breath, swelling, fatigue.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of heart failure but the identification criteria are not met.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the identification criteria are met.","meaning":"Boolean indicating whether the patient currently has a diagnosis of heart failure and the diagnosis is identified by the specified criteria."}  ;; "as identified by (at least one of the following: ...)"
(declare-const patient_has_physical_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has physical findings of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have physical findings of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has physical findings of heart failure.","meaning":"Boolean indicating whether the patient currently has physical findings of heart failure."}  ;; "physical findings of heart failure"
(declare-const patient_has_physical_finding_of_heart_failure_now@@examples_jugular_venous_distension_crackles_edema_third_heart_sound Bool) ;; {"when_to_set_to_true":"Set to true if the patient's physical findings of heart failure include any of the following examples: jugular venous distension, crackles, edema, or third heart sound.","when_to_set_to_false":"Set to false if the patient's physical findings of heart failure do not include any of the listed examples.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's physical findings of heart failure include any of the listed examples.","meaning":"Boolean indicating whether the patient's physical findings of heart failure include any of the listed examples."}  ;; "physical findings of heart failure (with non-exhaustive examples (jugular venous distension, crackles, edema, third heart sound))"
(declare-const patient_has_finding_of_pulmonary_edema_on_chest_xray_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary edema on chest x-ray.","when_to_set_to_false":"Set to false if the patient currently does not have pulmonary edema on chest x-ray.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary edema on chest x-ray.","meaning":"Boolean indicating whether the patient currently has pulmonary edema on chest x-ray."}  ;; "pulmonary edema on chest x-ray"
(declare-const brain_natriuretic_peptide_value_recorded_now_withunit_picograms_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the value of the patient's brain natriuretic peptide level recorded now, in picograms per milliliter.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's brain natriuretic peptide level recorded now, in picograms per milliliter."}  ;; "brain natriuretic peptide > 100 picograms per milliliter"
(declare-const patient_has_symptom_of_paroxysmal_nocturnal_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has paroxysmal nocturnal dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not have paroxysmal nocturnal dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has paroxysmal nocturnal dyspnea.","meaning":"Boolean indicating whether the patient currently has paroxysmal nocturnal dyspnea."}  ;; "paroxysmal nocturnal dyspnea"
(declare-const patient_has_symptom_of_shortness_of_breath_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has shortness of breath.","when_to_set_to_false":"Set to false if the patient currently does not have shortness of breath.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has shortness of breath.","meaning":"Boolean indicating whether the patient currently has shortness of breath."}  ;; "shortness of breath"
(declare-const patient_has_symptom_of_swelling_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has swelling.","when_to_set_to_false":"Set to false if the patient currently does not have swelling.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has swelling.","meaning":"Boolean indicating whether the patient currently has swelling."}  ;; "swelling"
(declare-const patient_has_symptom_of_fatigue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fatigue.","when_to_set_to_false":"Set to false if the patient currently does not have fatigue.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fatigue.","meaning":"Boolean indicating whether the patient currently has fatigue."}  ;; "fatigue"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_heart_failure_now@@nyha_class_i
         patient_has_diagnosis_of_heart_failure_now)
     :named REQ0_AUXILIARY0)) ;; "a diagnosis of New York Heart Association class I heart failure"

(assert
  (! (=> patient_has_diagnosis_of_heart_failure_now@@nyha_class_ii
         patient_has_diagnosis_of_heart_failure_now)
     :named REQ0_AUXILIARY1)) ;; "a diagnosis of New York Heart Association class II heart failure"

(assert
  (! (=> patient_has_diagnosis_of_heart_failure_now@@nyha_class_iii
         patient_has_diagnosis_of_heart_failure_now)
     :named REQ0_AUXILIARY2)) ;; "a diagnosis of New York Heart Association class III heart failure"

(assert
  (! (=> patient_has_diagnosis_of_heart_failure_now@@identified_by_at_least_one_of_physical_findings_or_pulmonary_edema_on_chest_xray_or_brain_natriuretic_peptide_gt_100_pg_per_ml_or_at_least_two_of_symptoms
         patient_has_diagnosis_of_heart_failure_now)
     :named REQ0_AUXILIARY3)) ;; "as identified by (at least one of the following: ...)"

;; Non-exhaustive examples imply umbrella for physical findings
(assert
  (! (=> (or patient_has_physical_finding_of_heart_failure_now@@examples_jugular_venous_distension_crackles_edema_third_heart_sound)
         patient_has_physical_finding_of_heart_failure_now)
     :named REQ0_AUXILIARY4)) ;; "physical findings of heart failure (with non-exhaustive examples (jugular venous distension, crackles, edema, third heart sound))"

;; Definition: identification by at least one of the listed criteria
(define-fun REQ0_identification_criteria_met () Bool
  (or
    patient_has_physical_finding_of_heart_failure_now
    patient_has_finding_of_pulmonary_edema_on_chest_xray_now
    (> brain_natriuretic_peptide_value_recorded_now_withunit_picograms_per_milliliter 100.0)
    (let ((symptom_count
            (+ (ite patient_has_symptom_of_paroxysmal_nocturnal_dyspnea_now 1 0)
               (ite patient_has_symptom_of_shortness_of_breath_now 1 0)
               (ite patient_has_symptom_of_swelling_now 1 0)
               (ite patient_has_symptom_of_fatigue_now 1 0))))
      (>= symptom_count 2))
  )
) ;; "as identified by (at least one of the following: ...)"

;; Link the identification criteria to the qualifier variable
(assert
  (! (= patient_has_diagnosis_of_heart_failure_now@@identified_by_at_least_one_of_physical_findings_or_pulmonary_edema_on_chest_xray_or_brain_natriuretic_peptide_gt_100_pg_per_ml_or_at_least_two_of_symptoms
        REQ0_identification_criteria_met)
     :named REQ0_AUXILIARY5)) ;; "as identified by (at least one of the following: ...)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Inclusion: must have NYHA class I, II, or III heart failure diagnosis, and it must be identified by at least one of the specified criteria
(assert
  (! (and
        (or patient_has_diagnosis_of_heart_failure_now@@nyha_class_i
            patient_has_diagnosis_of_heart_failure_now@@nyha_class_ii
            patient_has_diagnosis_of_heart_failure_now@@nyha_class_iii)
        patient_has_diagnosis_of_heart_failure_now@@identified_by_at_least_one_of_physical_findings_or_pulmonary_edema_on_chest_xray_or_brain_natriuretic_peptide_gt_100_pg_per_ml_or_at_least_two_of_symptoms)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((a diagnosis of New York Heart Association class I heart failure) OR (a diagnosis of New York Heart Association class II heart failure) OR (a diagnosis of New York Heart Association class III heart failure)) as identified by (at least one of the following: ...)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with heart failure at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with heart failure at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with heart failure.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of heart failure in their history."}  ;; "the patient must have had previous chemotherapy that contributed to the development of heart failure"
(declare-const patient_has_diagnosis_of_heart_failure_inthehistory@@developed_or_worsened_after_chemotherapy_and_no_other_obvious_explanation Bool) ;; {"when_to_set_to_true":"Set to true if the patient’s heart failure developed or worsened after receiving chemotherapy and there is no other obvious explanation for heart failure.","when_to_set_to_false":"Set to false if the patient’s heart failure did not develop or worsen after chemotherapy, or if there is another obvious explanation for heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the heart failure developed or worsened after chemotherapy and no other obvious explanation exists.","meaning":"Boolean indicating whether the patient’s heart failure developed or worsened after chemotherapy and no other obvious explanation exists."}  ;; "heart failure develops or worsens after receiving chemotherapy AND there is no other obvious explanation for heart failure"
(declare-const patient_has_history_of_receiving_chemotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received chemotherapy in the past.","when_to_set_to_false":"Set to false if the patient has never received chemotherapy in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received chemotherapy in the past.","meaning":"Boolean indicating whether the patient has ever received chemotherapy in the past."}  ;; "the patient must have had previous chemotherapy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_heart_failure_inthehistory@@developed_or_worsened_after_chemotherapy_and_no_other_obvious_explanation
         patient_has_diagnosis_of_heart_failure_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "heart failure develops or worsens after receiving chemotherapy AND there is no other obvious explanation for heart failure" implies "heart failure in history"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have had previous chemotherapy that contributed to the development of heart failure (defined as heart failure develops or worsens after receiving chemotherapy AND there is no other obvious explanation for heart failure).
(assert
  (! (and patient_has_history_of_receiving_chemotherapy
          patient_has_diagnosis_of_heart_failure_inthehistory@@developed_or_worsened_after_chemotherapy_and_no_other_obvious_explanation)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have had previous chemotherapy that contributed to the development of heart failure (defined as heart failure develops or worsens after receiving chemotherapy AND there is no other obvious explanation for heart failure)."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_oriented_to_person_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently oriented to person.","when_to_set_to_false":"Set to false if the patient is currently not oriented to person.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently oriented to person.","meaning":"Boolean indicating whether the patient is currently oriented to person."}  ;; "To be included, the patient must be oriented to person."
(declare-const patient_has_finding_of_oriented_to_place_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently oriented to place.","when_to_set_to_false":"Set to false if the patient is currently not oriented to place.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently oriented to place.","meaning":"Boolean indicating whether the patient is currently oriented to place."}  ;; "To be included, the patient must be oriented to place."
(declare-const patient_has_finding_of_oriented_to_time_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently oriented to time.","when_to_set_to_false":"Set to false if the patient is currently not oriented to time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently oriented to time.","meaning":"Boolean indicating whether the patient is currently oriented to time."}  ;; "To be included, the patient must be oriented to time."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_oriented_to_person_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be oriented to person."

(assert
  (! patient_has_finding_of_oriented_to_place_now
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be oriented to place."

(assert
  (! patient_has_finding_of_oriented_to_time_now
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be oriented to time."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_living_in_houston_area_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently living in the Houston area (Harris county or a contiguous county).","when_to_set_to_false":"Set to false if the patient is currently not living in the Houston area (Harris county or a contiguous county).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently living in the Houston area (Harris county or a contiguous county).","meaning":"Boolean indicating whether the patient is currently living in the Houston area, defined as Harris county or a contiguous county."}  ;; "be living in the Houston area (defined as Harris county or a contiguous county)"
(declare-const patient_is_planning_to_stay_in_houston_area_for_next_sixteen_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning to stay in the Houston area (Harris county or a contiguous county) for at least the next sixteen weeks.","when_to_set_to_false":"Set to false if the patient is not planning to stay in the Houston area (Harris county or a contiguous county) for at least the next sixteen weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planning to stay in the Houston area (Harris county or a contiguous county) for at least the next sixteen weeks.","meaning":"Boolean indicating whether the patient is planning to stay in the Houston area (Harris county or a contiguous county) for at least the next sixteen weeks."}  ;; "be planning to stay in the Houston area (defined as Harris county or a contiguous county) for at least the next sixteen weeks"

;; ===================== Constraint Assertions (REQ 3) =====================
;; To be included, the patient must ((be living in the Houston area (defined as Harris county or a contiguous county)) OR (be planning to stay in the Houston area (defined as Harris county or a contiguous county) for at least the next sixteen weeks)).
(assert
  (! (or patient_is_living_in_houston_area_now
         patient_is_planning_to_stay_in_houston_area_for_next_sixteen_weeks)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged eighteen years or older"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged eighteen years or older."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a documented diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."}  ;; "To be included, the patient must have a diagnosis of cancer."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_diagnosis_of_malignant_neoplastic_disease_now
     :named REQ5_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a diagnosis of cancer."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_completed_cancer_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has completed all cancer treatment.","when_to_set_to_false":"Set to false if the patient has not completed all cancer treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has completed all cancer treatment.","meaning":"Boolean indicating whether the patient has completed cancer treatment."} ;; "have completed cancer treatment"
(declare-const patient_is_undergoing_administration_of_antineoplastic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing administration of antineoplastic agent (chemotherapy).","when_to_set_to_false":"Set to false if the patient is not currently undergoing administration of antineoplastic agent (chemotherapy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing administration of antineoplastic agent (chemotherapy).","meaning":"Boolean indicating whether the patient is currently undergoing administration of antineoplastic agent (chemotherapy)."} ;; "be on long-term adjuvant chemotherapy only" or "be on long-term maintenance chemotherapy only"
(declare-const patient_is_undergoing_administration_of_antineoplastic_agent_now@@is_long_term Bool) ;; {"when_to_set_to_true":"Set to true if the chemotherapy is long-term.","when_to_set_to_false":"Set to false if the chemotherapy is not long-term.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy is long-term.","meaning":"Boolean indicating whether the chemotherapy is long-term."} ;; "long-term adjuvant chemotherapy" or "long-term maintenance chemotherapy"
(declare-const patient_is_undergoing_administration_of_antineoplastic_agent_now@@is_adjuvant Bool) ;; {"when_to_set_to_true":"Set to true if the chemotherapy is adjuvant.","when_to_set_to_false":"Set to false if the chemotherapy is not adjuvant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy is adjuvant.","meaning":"Boolean indicating whether the chemotherapy is adjuvant."} ;; "adjuvant chemotherapy"
(declare-const patient_is_undergoing_administration_of_antineoplastic_agent_now@@is_maintenance Bool) ;; {"when_to_set_to_true":"Set to true if the chemotherapy is maintenance.","when_to_set_to_false":"Set to false if the chemotherapy is not maintenance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy is maintenance.","meaning":"Boolean indicating whether the chemotherapy is maintenance."} ;; "maintenance chemotherapy"
(declare-const patient_is_undergoing_administration_of_antineoplastic_agent_now@@is_only_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the chemotherapy is the only treatment the patient is receiving.","when_to_set_to_false":"Set to false if the chemotherapy is not the only treatment the patient is receiving.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy is the only treatment.","meaning":"Boolean indicating whether the chemotherapy is the only treatment the patient is receiving."} ;; "adjuvant chemotherapy only" or "maintenance chemotherapy only"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_is_undergoing_administration_of_antineoplastic_agent_now@@is_long_term
         patient_is_undergoing_administration_of_antineoplastic_agent_now)
     :named REQ6_AUXILIARY0)) ;; "long-term adjuvant/maintenance chemotherapy only"

(assert
  (! (=> patient_is_undergoing_administration_of_antineoplastic_agent_now@@is_adjuvant
         patient_is_undergoing_administration_of_antineoplastic_agent_now)
     :named REQ6_AUXILIARY1)) ;; "adjuvant chemotherapy only"

(assert
  (! (=> patient_is_undergoing_administration_of_antineoplastic_agent_now@@is_maintenance
         patient_is_undergoing_administration_of_antineoplastic_agent_now)
     :named REQ6_AUXILIARY2)) ;; "maintenance chemotherapy only"

(assert
  (! (=> patient_is_undergoing_administration_of_antineoplastic_agent_now@@is_only_treatment
         patient_is_undergoing_administration_of_antineoplastic_agent_now)
     :named REQ6_AUXILIARY3)) ;; "adjuvant/maintenance chemotherapy only"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must ((have completed cancer treatment) OR (be on long-term adjuvant chemotherapy only) OR (be on long-term maintenance chemotherapy only)).
(assert
  (! (or
        patient_has_completed_cancer_treatment
        (and patient_is_undergoing_administration_of_antineoplastic_agent_now
             patient_is_undergoing_administration_of_antineoplastic_agent_now@@is_long_term
             patient_is_undergoing_administration_of_antineoplastic_agent_now@@is_adjuvant
             patient_is_undergoing_administration_of_antineoplastic_agent_now@@is_only_treatment)
        (and patient_is_undergoing_administration_of_antineoplastic_agent_now
             patient_is_undergoing_administration_of_antineoplastic_agent_now@@is_long_term
             patient_is_undergoing_administration_of_antineoplastic_agent_now@@is_maintenance
             patient_is_undergoing_administration_of_antineoplastic_agent_now@@is_only_treatment)
     )
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have completed cancer treatment) OR (be on long-term adjuvant chemotherapy only) OR (be on long-term maintenance chemotherapy only))."
