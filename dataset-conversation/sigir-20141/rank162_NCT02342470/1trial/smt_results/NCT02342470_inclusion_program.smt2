;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "male"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged > 19 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_sex_is_female_now patient_sex_is_male_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (male OR female)."
(assert
  (! (> patient_age_value_recorded_now_in_years 19)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged > 19 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertensive disorder (hypertension)."} // "hypertension"
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} // "diabetes"
(declare-const patient_has_diagnosis_of_ischemic_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ischemic heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ischemic heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ischemic heart disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ischemic heart disease."} // "ischemic heart disease"
(declare-const patient_has_diagnosis_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cardiac arrhythmia."} // "arrhythmia"
(declare-const patient_has_diagnosis_of_dyslipidemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dyslipidemia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dyslipidemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dyslipidemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dyslipidemia."} // "dyslipidemia"
(declare-const patient_is_exposed_to_aspirin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (receiving or taking) aspirin.","when_to_set_to_false":"Set to false if the patient is currently not exposed to aspirin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to aspirin.","meaning":"Boolean indicating whether the patient is currently exposed to aspirin."} // "aspirin"
(declare-const patient_is_exposed_to_aspirin_now@@continuous_administration Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to aspirin and the administration is continuous.","when_to_set_to_false":"Set to false if the patient is currently exposed to aspirin but the administration is not continuous.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the administration of aspirin is continuous.","meaning":"Boolean indicating whether the patient is currently exposed to aspirin and the administration is continuous."} // "require continuous administration"
(declare-const patient_is_exposed_to_aspirin_now_value_recorded_now_withunit_mg Real) ;; {"when_to_set_to_value":"Set to the numeric value (in mg) of aspirin the patient is currently exposed to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what dose of aspirin the patient is currently exposed to.","meaning":"Numeric value indicating the dose in milligrams of aspirin the patient is currently exposed to now."} // "low-dose aspirin (100 mg)"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for continuous administration implies exposure to aspirin
(assert
  (! (=> patient_is_exposed_to_aspirin_now@@continuous_administration
         patient_is_exposed_to_aspirin_now)
     :named REQ1_AUXILIARY0)) ;; "require continuous administration of low-dose aspirin (100 mg)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have at least one of the listed diagnoses
(assert
  (! (or patient_has_diagnosis_of_hypertensive_disorder_now
         patient_has_diagnosis_of_diabetes_mellitus_now
         patient_has_diagnosis_of_ischemic_heart_disease_now
         patient_has_diagnosis_of_cardiac_arrhythmia_now
         patient_has_diagnosis_of_dyslipidemia_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((have hypertension) OR (have diabetes) OR (have ischemic heart disease) OR (have arrhythmia) OR (have dyslipidemia))"

;; Component 1: Must require continuous administration of low-dose aspirin (100 mg)
(assert
  (! (and patient_is_exposed_to_aspirin_now@@continuous_administration
          (= patient_is_exposed_to_aspirin_now_value_recorded_now_withunit_mg 100.0))
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "require continuous administration of low-dose aspirin (100 mg)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_endoscopy_finding_value_recorded_inthehistory_withunit_score Real) ;; {"when_to_set_to_value":"Set to the numeric value of the Modified Lanza Score as determined by endoscopic findings during the screening period.","when_to_set_to_null":"Set to null if the Modified Lanza Score is not available, not recorded, or indeterminate for the screening period.","meaning":"Numeric value representing the patient's Modified Lanza Score from endoscopic findings during the screening period."} // "Modified Lanza Score = 0 in the screening period (according to endoscopic findings)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (= patient_endoscopy_finding_value_recorded_inthehistory_withunit_score 0.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a Modified Lanza Score = 0 in the screening period (according to endoscopic findings)."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_stomach_ulcer_scar_in_screening_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a stomach ulcer scar identified during the screening period.","when_to_set_to_false":"Set to false if the patient does not have a stomach ulcer scar identified during the screening period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a stomach ulcer scar during the screening period.","meaning":"Boolean indicating whether the patient has a stomach ulcer scar during the screening period."} // "have a stomach ulcer scar in the screening period"
(declare-const patient_has_finding_of_stomach_ulcer_scar_in_screening_period@@according_to_endoscopic_findings Bool) ;; {"when_to_set_to_true":"Set to true if the stomach ulcer scar during the screening period is identified according to endoscopic findings.","when_to_set_to_false":"Set to false if the stomach ulcer scar during the screening period is not identified according to endoscopic findings.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the stomach ulcer scar during the screening period is identified according to endoscopic findings.","meaning":"Boolean indicating whether the stomach ulcer scar during the screening period is identified according to endoscopic findings."} // "according to endoscopic findings"
(declare-const patient_has_finding_of_duodenal_ulcer_scar_in_screening_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a duodenal ulcer scar identified during the screening period.","when_to_set_to_false":"Set to false if the patient does not have a duodenal ulcer scar identified during the screening period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a duodenal ulcer scar during the screening period.","meaning":"Boolean indicating whether the patient has a duodenal ulcer scar during the screening period."} // "have a duodenal ulcer scar in the screening period"
(declare-const patient_has_finding_of_duodenal_ulcer_scar_in_screening_period@@according_to_endoscopic_findings Bool) ;; {"when_to_set_to_true":"Set to true if the duodenal ulcer scar during the screening period is identified according to endoscopic findings.","when_to_set_to_false":"Set to false if the duodenal ulcer scar during the screening period is not identified according to endoscopic findings.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duodenal ulcer scar during the screening period is identified according to endoscopic findings.","meaning":"Boolean indicating whether the duodenal ulcer scar during the screening period is identified according to endoscopic findings."} // "according to endoscopic findings"
(declare-const patient_has_finding_of_scar_caused_by_other_disorders_in_screening_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a scar caused by other disorders during the screening period.","when_to_set_to_false":"Set to false if the patient does not have a scar caused by other disorders during the screening period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a scar caused by other disorders during the screening period.","meaning":"Boolean indicating whether the patient has a scar caused by other disorders during the screening period."} // "have a scar caused by other disorders"
(declare-const patient_has_finding_of_scar_caused_by_endoscopic_treatment_in_screening_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a scar caused by endoscopic treatment during the screening period.","when_to_set_to_false":"Set to false if the patient does not have a scar caused by endoscopic treatment during the screening period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a scar caused by endoscopic treatment during the screening period.","meaning":"Boolean indicating whether the patient has a scar caused by endoscopic treatment during the screening period."} // "have a scar caused by endoscopic treatment"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables for stomach ulcer scar
(assert
  (! (=> patient_has_finding_of_stomach_ulcer_scar_in_screening_period@@according_to_endoscopic_findings
         patient_has_finding_of_stomach_ulcer_scar_in_screening_period)
     :named REQ3_AUXILIARY0)) ;; "stomach ulcer scar in the screening period (according to endoscopic findings)"

;; Qualifier variables imply corresponding stem variables for duodenal ulcer scar
(assert
  (! (=> patient_has_finding_of_duodenal_ulcer_scar_in_screening_period@@according_to_endoscopic_findings
         patient_has_finding_of_duodenal_ulcer_scar_in_screening_period)
     :named REQ3_AUXILIARY1)) ;; "duodenal ulcer scar in the screening period (according to endoscopic findings)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Must have (stomach ulcer scar OR duodenal ulcer scar) in screening period, both according to endoscopic findings
(assert
  (! (or patient_has_finding_of_stomach_ulcer_scar_in_screening_period@@according_to_endoscopic_findings
         patient_has_finding_of_duodenal_ulcer_scar_in_screening_period@@according_to_endoscopic_findings)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have a stomach ulcer scar in the screening period (according to endoscopic findings) OR have a duodenal ulcer scar in the screening period (according to endoscopic findings)"

;; Component 1: Must NOT have (scar caused by other disorders OR scar caused by endoscopic treatment) in screening period
(assert
  (! (not (or patient_has_finding_of_scar_caused_by_other_disorders_in_screening_period
              patient_has_finding_of_scar_caused_by_endoscopic_treatment_in_screening_period))
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "NOT (have a scar caused by other disorders OR have a scar caused by endoscopic treatment)"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_digestive_symptom_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any digestive symptom in the screening period.","when_to_set_to_false":"Set to false if the patient currently does not have any digestive symptom in the screening period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any digestive symptom in the screening period.","meaning":"Boolean indicating whether the patient currently has any digestive symptom in the screening period."} // "digestive symptoms in the screening period"
(declare-const patient_has_finding_of_physconia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has physconia in the screening period.","when_to_set_to_false":"Set to false if the patient currently does not have physconia in the screening period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has physconia in the screening period.","meaning":"Boolean indicating whether the patient currently has physconia in the screening period."} // "physconia"
(declare-const patient_has_finding_of_physconia_now@@mild Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current physconia in the screening period is mild.","when_to_set_to_false":"Set to false if the patient's current physconia in the screening period is not mild.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current physconia in the screening period is mild.","meaning":"Boolean indicating whether the patient's current physconia in the screening period is mild."} // "mild physconia"
(declare-const patient_has_finding_of_abdominal_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abdominal pain in the screening period.","when_to_set_to_false":"Set to false if the patient currently does not have abdominal pain in the screening period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abdominal pain in the screening period.","meaning":"Boolean indicating whether the patient currently has abdominal pain in the screening period."} // "abdominal pain"
(declare-const patient_has_finding_of_diarrhea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diarrhea in the screening period.","when_to_set_to_false":"Set to false if the patient currently does not have diarrhea in the screening period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diarrhea in the screening period.","meaning":"Boolean indicating whether the patient currently has diarrhea in the screening period."} // "diarrhea"
(declare-const patient_has_finding_of_vomit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has vomit in the screening period.","when_to_set_to_false":"Set to false if the patient currently does not have vomit in the screening period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has vomit in the screening period.","meaning":"Boolean indicating whether the patient currently has vomit in the screening period."} // "vomit"
(declare-const patient_has_finding_of_vomit_now@@mild Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current vomit in the screening period is mild.","when_to_set_to_false":"Set to false if the patient's current vomit in the screening period is not mild.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current vomit in the screening period is mild.","meaning":"Boolean indicating whether the patient's current vomit in the screening period is mild."} // "mild vomit"
(declare-const patient_has_finding_of_nausea_and_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has nausea and vomiting in the screening period.","when_to_set_to_false":"Set to false if the patient currently does not have nausea and vomiting in the screening period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has nausea and vomiting in the screening period.","meaning":"Boolean indicating whether the patient currently has nausea and vomiting in the screening period."} // "nausea-vomiting"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_physconia_now@@mild
         patient_has_finding_of_physconia_now)
     :named REQ4_AUXILIARY0)) ;; "mild physconia" implies "physconia"

(assert
  (! (=> patient_has_finding_of_vomit_now@@mild
         patient_has_finding_of_vomit_now)
     :named REQ4_AUXILIARY1)) ;; "mild vomit" implies "vomit"

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient must NOT have digestive symptoms in the screening period, EXCEPT (have mild physconia OR have mild abdominal pain OR have mild diarrhea OR have mild vomit OR have mild nausea-vomiting).
;; That is, the only allowed digestive symptoms are: mild physconia, mild abdominal pain, mild diarrhea, mild vomit, mild nausea-vomiting.
;; If the patient has any digestive symptom, it must be one of these and must be mild (where specified).

(assert
  (! (or
        (not patient_has_finding_of_digestive_symptom_now)
        (or
          patient_has_finding_of_physconia_now@@mild
          patient_has_finding_of_abdominal_pain_now
          patient_has_finding_of_diarrhea_now
          patient_has_finding_of_vomit_now@@mild
          patient_has_finding_of_nausea_and_vomiting_now
        )
     )
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have digestive symptoms in the screening period, EXCEPT (have mild physconia OR have mild abdominal pain OR have mild diarrhea OR have mild vomit OR have mild nausea-vomiting)."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_signed_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed the written informed consent.","when_to_set_to_false":"Set to false if the patient has not signed the written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed the written informed consent.","meaning":"Boolean indicating whether the patient has signed the written informed consent."} // "the patient must have signed the written informed consent"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_signed_written_informed_consent
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have signed the written informed consent"
