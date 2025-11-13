;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_self_identifies_as_african_american_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently self-identifies as African American.","when_to_set_to_false":"Set to false if the patient currently does not self-identify as African American.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently self-identifies as African American.","meaning":"Boolean indicating whether the patient currently self-identifies as African American."}  ;; "To be included, the patient must self-identify as African American."
(declare-const patient_birth_country_now String) ;; {"when_to_set_to_value":"Set to the name of the country where the patient was born.","when_to_set_to_null":"Set to null if the country of birth is unknown, not documented, or cannot be determined.","meaning":"String indicating the country where the patient was born."}  ;; "be born in the United States" / "be born in Africa"
(declare-const parent_1_birth_country_now String) ;; {"when_to_set_to_value":"Set to the name of the country where the patient's first parent was born.","when_to_set_to_null":"Set to null if the country of birth for the first parent is unknown, not documented, or cannot be determined.","meaning":"String indicating the country where the patient's first parent was born."}  ;; "both parents were born in the United States" / "both parents were born in Africa"
(declare-const parent_2_birth_country_now String) ;; {"when_to_set_to_value":"Set to the name of the country where the patient's second parent was born.","when_to_set_to_null":"Set to null if the country of birth for the second parent is unknown, not documented, or cannot be determined.","meaning":"String indicating the country where the patient's second parent was born."}  ;; "both parents were born in the United States" / "both parents were born in Africa"
(declare-const patient_current_country_of_residence_now String) ;; {"when_to_set_to_value":"Set to the name of the country where the patient is currently living.","when_to_set_to_null":"Set to null if the current country of residence is unknown, not documented, or cannot be determined.","meaning":"String indicating the country where the patient is currently living."}  ;; "be living in the United States"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Define Boolean for "patient and both parents born in the United States"
(define-fun patient_and_parents_born_in_us () Bool
  (and (= patient_birth_country_now "United States")
       (= parent_1_birth_country_now "United States")
       (= parent_2_birth_country_now "United States"))) ;; "be born in the United States AND both parents were born in the United States"

;; Define Boolean for "patient and both parents born in Africa"
(define-fun patient_and_parents_born_in_africa () Bool
  (and (= patient_birth_country_now "Africa")
       (= parent_1_birth_country_now "Africa")
       (= parent_2_birth_country_now "Africa"))) ;; "be born in Africa AND both parents were born in Africa"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must self-identify as African American
(assert
  (! patient_self_identifies_as_african_american_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must self-identify as African American."

;; Component 1: Patient and both parents born in US OR patient and both parents born in Africa
(assert
  (! (or patient_and_parents_born_in_us
         patient_and_parents_born_in_africa)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((be born in the United States AND both parents were born in the United States) OR (be born in Africa AND both parents were born in Africa))."

;; Component 2: Patient must be living in the United States
(assert
  (! (= patient_current_country_of_residence_now "United States")
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be living in the United States."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "be aged ≥ 18 years AND be aged ≤ 70 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be aged ≥ 18 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 1: To be included, the patient must be aged ≤ 70 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 70)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 70 years."

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_general_health_good_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have good general health.","when_to_set_to_false":"Set to false if the patient is currently not considered to have good general health.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has good general health.","meaning":"Boolean indicating whether the patient currently has good general health."}  ;; "good health"
(declare-const patient_has_finding_of_general_health_good_now@@confirmed_by_medical_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient's good general health is confirmed by medical history.","when_to_set_to_false":"Set to false if the patient's good general health is not confirmed by medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's good general health is confirmed by medical history.","meaning":"Boolean indicating whether the patient's good general health is confirmed by medical history."}  ;; "have good health confirmed by medical history"
(declare-const patient_has_finding_of_general_health_good_now@@confirmed_by_physical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's good general health is confirmed by physical examination.","when_to_set_to_false":"Set to false if the patient's good general health is not confirmed by physical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's good general health is confirmed by physical examination.","meaning":"Boolean indicating whether the patient's good general health is confirmed by physical examination."}  ;; "have good health confirmed by physical examination"
(declare-const patient_has_finding_of_general_health_good_now@@confirmed_by_laboratory_test_results_performed_as_part_of_the_screening_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's good general health is confirmed by laboratory test results performed as part of the screening visit.","when_to_set_to_false":"Set to false if the patient's good general health is not confirmed by laboratory test results performed as part of the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's good general health is confirmed by laboratory test results performed as part of the screening visit.","meaning":"Boolean indicating whether the patient's good general health is confirmed by laboratory test results performed as part of the screening visit."}  ;; "have good health confirmed by laboratory test results performed as part of the screening visit"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply the stem variable (if confirmed by X, then must have good health)
(assert
  (! (=> patient_has_finding_of_general_health_good_now@@confirmed_by_medical_history
         patient_has_finding_of_general_health_good_now)
     :named REQ2_AUXILIARY0)) ;; "have good health confirmed by medical history" implies "good health"

(assert
  (! (=> patient_has_finding_of_general_health_good_now@@confirmed_by_physical_examination
         patient_has_finding_of_general_health_good_now)
     :named REQ2_AUXILIARY1)) ;; "have good health confirmed by physical examination" implies "good health"

(assert
  (! (=> patient_has_finding_of_general_health_good_now@@confirmed_by_laboratory_test_results_performed_as_part_of_the_screening_visit
         patient_has_finding_of_general_health_good_now)
     :named REQ2_AUXILIARY2)) ;; "have good health confirmed by laboratory test results performed as part of the screening visit" implies "good health"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: patient must identify as a patient with good health
(assert
  (! patient_has_finding_of_general_health_good_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must identify as a patient with good health."

;; Component 1: patient must have good health confirmed by medical history
(assert
  (! patient_has_finding_of_general_health_good_now@@confirmed_by_medical_history
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have good health confirmed by medical history."

;; Component 2: patient must have good health confirmed by physical examination
(assert
  (! patient_has_finding_of_general_health_good_now@@confirmed_by_physical_examination
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have good health confirmed by physical examination."

;; Component 3: patient must have good health confirmed by laboratory test results performed as part of the screening visit
(assert
  (! patient_has_finding_of_general_health_good_now@@confirmed_by_laboratory_test_results_performed_as_part_of_the_screening_visit
     :named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have good health confirmed by laboratory test results performed as part of the screening visit."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myocardial infarction in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myocardial infarction in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of myocardial infarction.","meaning":"Boolean indicating whether the patient has a diagnosis of myocardial infarction in their medical history."}  ;; "medical history of myocardial infarction"
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass graft surgery in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass graft surgery in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of coronary artery bypass graft surgery.","meaning":"Boolean indicating whether the patient has undergone coronary artery bypass graft surgery in their medical history."}  ;; "medical history of coronary artery bypass surgery"
(declare-const patient_has_undergone_coronary_angioplasty_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone percutaneous transluminal coronary angioplasty in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone percutaneous transluminal coronary angioplasty in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of percutaneous transluminal coronary angioplasty.","meaning":"Boolean indicating whether the patient has undergone percutaneous transluminal coronary angioplasty in their medical history."}  ;; "medical history of percutaneous transluminal coronary angioplasty"
(declare-const patient_has_finding_of_angina_pectoris_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has angina pectoris.","meaning":"Boolean indicating whether the patient currently has angina pectoris."}  ;; "currently having angina pectoris"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient may have (at least one of: history of MI OR CABG OR angioplasty) IF NOT currently having angina pectoris.
(assert
  (! (=> (not patient_has_finding_of_angina_pectoris_now)
         (or patient_has_diagnosis_of_myocardial_infarction_inthehistory
             patient_has_undergone_coronary_artery_bypass_graft_inthehistory
             patient_has_undergone_coronary_angioplasty_inthehistory))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient may have (at least one of the following: medical history of myocardial infarction OR medical history of coronary artery bypass surgery OR medical history of percutaneous transluminal coronary angioplasty) IF NOT currently having angina pectoris."
