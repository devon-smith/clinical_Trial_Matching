;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_type_2_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 2 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 2 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 2 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 2 diabetes mellitus."} ;; "type 2 diabetes mellitus"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_type_2_diabetes_mellitus_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has type 2 diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_type_1_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 1 diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 1 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 1 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 1 diabetes mellitus."} ;; "type 1 diabetes mellitus"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_type_1_diabetes_mellitus_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has type 1 diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of kidney disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has kidney disease.","meaning":"Boolean indicating whether the patient currently has kidney disease."} ;; "kidney disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_finding_of_kidney_disease_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has kidney disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of liver disease.","meaning":"Boolean indicating whether the patient currently has liver disease."} ;; "liver disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_disease_of_liver_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has liver disease."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_blood_chemistry_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal clinical chemistry findings.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal clinical chemistry findings.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal clinical chemistry findings.","meaning":"Boolean indicating whether the patient currently has abnormal clinical chemistry findings."} ;; "abnormal clinical chemistry findings"
(declare-const patient_has_finding_of_blood_chemistry_abnormal_now@@present_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal clinical chemistry findings are present at the time of screening.","when_to_set_to_false":"Set to false if the abnormal clinical chemistry findings are not present at the time of screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether abnormal clinical chemistry findings are present at screening.","meaning":"Boolean indicating whether abnormal clinical chemistry findings are present at screening."} ;; "abnormal clinical chemistry findings at screening"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_blood_chemistry_abnormal_now@@present_at_screening
      patient_has_finding_of_blood_chemistry_abnormal_now)
:named REQ4_AUXILIARY0)) ;; "abnormal clinical chemistry findings at screening"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_blood_chemistry_abnormal_now@@present_at_screening)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has abnormal clinical chemistry findings at screening."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_physical_exercise_value_recorded_inthehistory_withunit_hours_per_week Real) ;; {"when_to_set_to_value":"Set to the total number of hours per week if the patient's physical exercise duration per week over their history is known and recorded.","when_to_set_to_null":"Set to null if the patient's total duration of physical exercise per week over their history is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's total duration of physical exercise per week over their history."} ;; "physical exercise with total duration greater than 2 hours per week"
(declare-const patient_physical_exercise_value_recorded_inthehistory_withunit_hours_per_week@@is_intense Bool) ;; {"when_to_set_to_true":"Set to true if the recorded physical exercise is intense.","when_to_set_to_false":"Set to false if the recorded physical exercise is not intense.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the physical exercise is intense.","meaning":"Boolean indicating whether the recorded physical exercise is intense."} ;; "intense physical exercise"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and patient_physical_exercise_value_recorded_inthehistory_withunit_hours_per_week@@is_intense
             (> patient_physical_exercise_value_recorded_inthehistory_withunit_hours_per_week 2)))
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient engages in intense physical exercise with total duration greater than 2 hours per week."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_exposed_to_hmg_coa_reductase_inhibitor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to statin drugs (HMG-CoA reductase inhibitors).","when_to_set_to_false":"Set to false if the patient is currently not exposed to statin drugs (HMG-CoA reductase inhibitors).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to statin drugs (HMG-CoA reductase inhibitors).","meaning":"Boolean indicating whether the patient is currently exposed to statin drugs (HMG-CoA reductase inhibitors)."} ;; "statin drugs"
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} ;; "drugs"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@affects_energy_metabolism Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient is currently exposed affects energy metabolism.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient is currently exposed does not affect energy metabolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament to which the patient is currently exposed affects energy metabolism.","meaning":"Boolean indicating whether the drug or medicament to which the patient is currently exposed affects energy metabolism."} ;; "drugs affecting energy metabolism"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@affects_energy_metabolism
      patient_is_exposed_to_drug_or_medicament_now)
:named REQ6_AUXILIARY0)) ;; "drugs affecting energy metabolism" implies "drugs"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_exposed_to_hmg_coa_reductase_inhibitor_now)
:named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient uses statin drugs."

(assert
(! (not patient_is_exposed_to_drug_or_medicament_now@@affects_energy_metabolism)
:named REQ6_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient uses drugs affecting energy metabolism."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_dietary_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently following any diet (of any type).","when_to_set_to_false":"Set to false if the patient is currently not following any diet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently following any diet.","meaning":"Boolean indicating whether the patient currently has any dietary finding (is following any diet)."} ;; "diets"
(declare-const patient_has_finding_of_dietary_finding_now@@diet_is_extreme Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently following a diet that is considered extreme.","when_to_set_to_false":"Set to false if the patient is currently following a diet that is not considered extreme.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diet is extreme.","meaning":"Boolean indicating whether the patient's current diet is extreme."} ;; "extreme diets"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_dietary_finding_now@@diet_is_extreme
       patient_has_finding_of_dietary_finding_now)
   :named REQ7_AUXILIARY0)) ;; "uses extreme diets"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_dietary_finding_now@@diet_is_extreme)
   :named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient uses extreme diets."
