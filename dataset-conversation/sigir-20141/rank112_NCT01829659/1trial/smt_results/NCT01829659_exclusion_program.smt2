;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_indication_for_antithrombotic_treatment_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any clinical indication for antithrombotic treatment during the study period.","when_to_set_to_false":"Set to false if the patient does not have any clinical indication for antithrombotic treatment during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any clinical indication for antithrombotic treatment during the study period.","meaning":"Boolean indicating whether the patient has any clinical indication for antithrombotic treatment during the study period."} ;; "any indication for antithrombotic treatment during the study period"

(declare-const patient_has_diagnosis_of_atrial_fibrillation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with atrial fibrillation at any time in the history, including the study period.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with atrial fibrillation at any time in the history, including the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with atrial fibrillation.","meaning":"Boolean indicating whether the patient has ever been diagnosed with atrial fibrillation at any time in the history."} ;; "atrial fibrillation"

(declare-const patient_has_diagnosis_of_mitral_valve_stenosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with mitral valve stenosis at any time in the history, including the study period.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with mitral valve stenosis at any time in the history, including the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with mitral valve stenosis.","meaning":"Boolean indicating whether the patient has ever been diagnosed with mitral valve stenosis at any time in the history."} ;; "mitral stenosis"

(declare-const patient_has_diagnosis_of_prosthetic_heart_valve_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with prosthetic heart valve at any time in the history, including the study period.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with prosthetic heart valve at any time in the history, including the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with prosthetic heart valve.","meaning":"Boolean indicating whether the patient has ever been diagnosed with prosthetic heart valve at any time in the history."} ;; "prosthetic heart valve"

(declare-const patient_has_diagnosis_of_pulmonary_embolism_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with pulmonary embolism at any time in the history, including the study period.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with pulmonary embolism at any time in the history, including the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with pulmonary embolism.","meaning":"Boolean indicating whether the patient has ever been diagnosed with pulmonary embolism at any time in the history."} ;; "pulmonary embolism"

(declare-const patient_has_diagnosis_of_deep_venous_thrombosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with deep venous thrombosis at any time in the history, including the study period.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with deep venous thrombosis at any time in the history, including the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with deep venous thrombosis.","meaning":"Boolean indicating whether the patient has ever been diagnosed with deep venous thrombosis at any time in the history."} ;; "deep vein thrombosis"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_atrial_fibrillation_inthehistory
           patient_has_diagnosis_of_mitral_valve_stenosis_inthehistory
           patient_has_diagnosis_of_prosthetic_heart_valve_inthehistory
           patient_has_diagnosis_of_pulmonary_embolism_inthehistory
           patient_has_diagnosis_of_deep_venous_thrombosis_inthehistory)
        patient_has_indication_for_antithrombotic_treatment_during_study_period)
   :named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples ((atrial fibrillation) OR (mitral stenosis) OR (prosthetic heart valve) OR (pulmonary embolism) OR (deep vein thrombosis))."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_indication_for_antithrombotic_treatment_during_study_period)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any indication for antithrombotic treatment during the study period."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_thrombolytic_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone thrombolytic therapy at any time in the past, regardless of timing relative to randomization.","when_to_set_to_false":"Set to false if the patient has never undergone thrombolytic therapy in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone thrombolytic therapy.","meaning":"Boolean indicating whether the patient has ever undergone thrombolytic therapy in the past."} ;; "fibrinolytic therapy"
(declare-const patient_has_undergone_thrombolytic_therapy_inthehistory@@temporalcontext_within48hours_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone thrombolytic therapy within forty-eight hours before randomization.","when_to_set_to_false":"Set to false if the patient has not undergone thrombolytic therapy within forty-eight hours before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone thrombolytic therapy within forty-eight hours before randomization.","meaning":"Boolean indicating whether the patient has undergone thrombolytic therapy within forty-eight hours before randomization."} ;; "within forty-eight hours before randomization"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_thrombolytic_therapy_inthehistory@@temporalcontext_within48hours_before_randomization
      patient_has_undergone_thrombolytic_therapy_inthehistory)
:named REQ1_AUXILIARY0)) ;; "fibrinolytic therapy within forty-eight hours before randomization"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_thrombolytic_therapy_inthehistory@@temporalcontext_within48hours_before_randomization)
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has received fibrinolytic therapy within forty-eight hours before randomization."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is not currently receiving or exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to a drug or medicament."} ;; "drug"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@has_possible_interaction_with_ticagrelor Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient is currently exposed has a possible interaction with ticagrelor.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient is currently exposed does not have a possible interaction with ticagrelor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament has a possible interaction with ticagrelor.","meaning":"Boolean indicating whether the drug or medicament has a possible interaction with ticagrelor."} ;; "possible interaction with ticagrelor"
(declare-const patient_is_exposed_to_cytochrome_p450_cyp3a_enzyme_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to cytochrome P-450 3A enzyme.","when_to_set_to_false":"Set to false if the patient is not currently receiving or exposed to cytochrome P-450 3A enzyme.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to cytochrome P-450 3A enzyme.","meaning":"Boolean indicating whether the patient is currently exposed to cytochrome P-450 3A enzyme."} ;; "cytochrome P-450 3A"
(declare-const patient_is_exposed_to_cytochrome_p450_cyp3a_enzyme_now@@is_strong_inhibitor Bool) ;; {"when_to_set_to_true":"Set to true if the cytochrome P-450 3A enzyme to which the patient is currently exposed is a strong inhibitor.","when_to_set_to_false":"Set to false if the cytochrome P-450 3A enzyme to which the patient is currently exposed is not a strong inhibitor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cytochrome P-450 3A enzyme is a strong inhibitor.","meaning":"Boolean indicating whether the cytochrome P-450 3A enzyme is a strong inhibitor."} ;; "strong cytochrome P-450 3A inhibitor"
(declare-const patient_is_exposed_to_cytochrome_p450_cyp3a_enzyme_now@@is_strong_inducer Bool) ;; {"when_to_set_to_true":"Set to true if the cytochrome P-450 3A enzyme to which the patient is currently exposed is a strong inducer.","when_to_set_to_false":"Set to false if the cytochrome P-450 3A enzyme to which the patient is currently exposed is not a strong inducer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cytochrome P-450 3A enzyme is a strong inducer.","meaning":"Boolean indicating whether the cytochrome P-450 3A enzyme is a strong inducer."} ;; "strong cytochrome P-450 3A inducer"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_exposed_to_cytochrome_p450_cyp3a_enzyme_now@@is_strong_inhibitor
           patient_is_exposed_to_cytochrome_p450_cyp3a_enzyme_now@@is_strong_inducer)
     patient_is_exposed_to_drug_or_medicament_now@@has_possible_interaction_with_ticagrelor)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples ((concomitant therapy with a strong cytochrome P-450 3A inhibitor) OR (concomitant therapy with a strong cytochrome P-450 3A inducer))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@has_possible_interaction_with_ticagrelor
       patient_is_exposed_to_drug_or_medicament_now)
:named REQ2_AUXILIARY1)) ;; "drug having possible interaction with ticagrelor"

(assert
(! (=> patient_is_exposed_to_cytochrome_p450_cyp3a_enzyme_now@@is_strong_inhibitor
       patient_is_exposed_to_cytochrome_p450_cyp3a_enzyme_now)
:named REQ2_AUXILIARY2)) ;; "strong cytochrome P-450 3A inhibitor"

(assert
(! (=> patient_is_exposed_to_cytochrome_p450_cyp3a_enzyme_now@@is_strong_inducer
       patient_is_exposed_to_cytochrome_p450_cyp3a_enzyme_now)
:named REQ2_AUXILIARY3)) ;; "strong cytochrome P-450 3A inducer"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_now@@has_possible_interaction_with_ticagrelor)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving concomitant therapy with a drug having possible interaction with ticagrelor."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_high_risk_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of high risk of bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of high risk of bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of high risk of bleeding.","meaning":"Boolean indicating whether the patient currently has a high risk of bleeding."} ;; "increased bleeding risk"

(declare-const patient_has_finding_of_gastrointestinal_hemorrhage_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a clinical finding of gastrointestinal hemorrhage within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not had a clinical finding of gastrointestinal hemorrhage within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a clinical finding of gastrointestinal hemorrhage within the past 30 days.","meaning":"Boolean indicating whether the patient has had gastrointestinal hemorrhage within the past 30 days."} ;; "recent gastrointestinal bleeding within thirty days"

(declare-const patient_has_finding_of_intracranial_hemorrhage_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any history of intracranial hemorrhage.","when_to_set_to_false":"Set to false if the patient does not have any history of intracranial hemorrhage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any history of intracranial hemorrhage.","meaning":"Boolean indicating whether the patient has any history of intracranial hemorrhage."} ;; "any history of intracranial bleeding"

(declare-const patient_has_finding_of_intraocular_hemorrhage_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any history of intraocular hemorrhage.","when_to_set_to_false":"Set to false if the patient does not have any history of intraocular hemorrhage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any history of intraocular hemorrhage.","meaning":"Boolean indicating whether the patient has any history of intraocular hemorrhage."} ;; "any history of intraocular bleeding"

(declare-const patient_has_finding_of_retroperitoneal_hemorrhage_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any history of retroperitoneal hemorrhage.","when_to_set_to_false":"Set to false if the patient does not have any history of retroperitoneal hemorrhage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any history of retroperitoneal hemorrhage.","meaning":"Boolean indicating whether the patient has any history of retroperitoneal hemorrhage."} ;; "any history of retroperitoneal bleeding"

(declare-const patient_has_finding_of_bleeding_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any history of bleeding.","when_to_set_to_false":"Set to false if the patient does not have any history of bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any history of bleeding.","meaning":"Boolean indicating whether the patient has any history of bleeding."} ;; "any history of bleeding"

(declare-const patient_has_finding_of_bleeding_inthehistory@@located_in_spine Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of bleeding is located in the spine.","when_to_set_to_false":"Set to false if the patient's history of bleeding is not located in the spine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of bleeding is located in the spine.","meaning":"Boolean indicating whether the patient's history of bleeding is located in the spine."} ;; "any history of spinal bleeding"

(declare-const patient_has_finding_of_traumatic_injury_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a clinical finding of traumatic injury within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not had a clinical finding of traumatic injury within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a clinical finding of traumatic injury within the past 30 days.","meaning":"Boolean indicating whether the patient has had traumatic injury within the past 30 days."} ;; "recent major trauma within thirty days of dosing"

(declare-const patient_has_finding_of_traumatic_injury_inthepast30days@@major Bool) ;; {"when_to_set_to_true":"Set to true if the patient's traumatic injury within the past 30 days is major.","when_to_set_to_false":"Set to false if the patient's traumatic injury within the past 30 days is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's traumatic injury within the past 30 days is major.","meaning":"Boolean indicating whether the patient's traumatic injury within the past 30 days is major."} ;; "recent major trauma within thirty days of dosing"

(declare-const patient_has_finding_of_traumatic_injury_inthepast30days@@temporalcontext_within30days_of_dosing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's traumatic injury occurred within 30 days of dosing.","when_to_set_to_false":"Set to false if the patient's traumatic injury did not occur within 30 days of dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's traumatic injury occurred within 30 days of dosing.","meaning":"Boolean indicating whether the patient's traumatic injury occurred within 30 days of dosing."} ;; "recent major trauma within thirty days of dosing"

(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of hypertensive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of hypertensive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of hypertensive disorder.","meaning":"Boolean indicating whether the patient currently has hypertensive disorder."} ;; "hypertension"

(declare-const patient_has_finding_of_hypertensive_disorder_now@@sustained_uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypertensive disorder is sustained and uncontrolled.","when_to_set_to_false":"Set to false if the patient's current hypertensive disorder is not sustained and uncontrolled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hypertensive disorder is sustained and uncontrolled.","meaning":"Boolean indicating whether the patient's current hypertensive disorder is sustained and uncontrolled."} ;; "sustained uncontrolled hypertension"

(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current systolic blood pressure in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in millimeters of mercury."} ;; "systolic blood pressure greater than one hundred eighty millimeters of mercury"

(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current diastolic blood pressure in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current diastolic blood pressure in millimeters of mercury."} ;; "diastolic blood pressure greater than one hundred millimeters of mercury"

(declare-const patient_has_finding_of_bleeding_inthehistory@@hemorrhagic_disorder_that_can_increase_risk_of_bleeding Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of bleeding is due to hemorrhagic disorders that can increase the risk of bleeding.","when_to_set_to_false":"Set to false if the patient's history of bleeding is not due to hemorrhagic disorders that can increase the risk of bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of bleeding is due to hemorrhagic disorders that can increase the risk of bleeding.","meaning":"Boolean indicating whether the patient's history of bleeding is due to hemorrhagic disorders that can increase the risk of bleeding."} ;; "history of hemorrhagic disorders that can increase the risk of bleeding"

(declare-const patient_platelet_count_finding_value_recorded_now_withunit_thousands_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current platelet count in thousands per cubic millimeter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count in thousands per cubic millimeter."} ;; "platelet count less than one hundred thousand per cubic millimeter"

(declare-const patient_hemoglobin_value_recorded_now_withunit_grams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current hemoglobin concentration in grams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current hemoglobin concentration in grams per deciliter."} ;; "hemoglobin less than ten grams per deciliter"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_gastrointestinal_hemorrhage_inthepast30days
           patient_has_finding_of_intracranial_hemorrhage_inthehistory
           patient_has_finding_of_intraocular_hemorrhage_inthehistory
           patient_has_finding_of_retroperitoneal_hemorrhage_inthehistory
           patient_has_finding_of_bleeding_inthehistory@@located_in_spine
           (and patient_has_finding_of_traumatic_injury_inthepast30days@@major
                patient_has_finding_of_traumatic_injury_inthepast30days@@temporalcontext_within30days_of_dosing)
           patient_has_finding_of_hypertensive_disorder_now@@sustained_uncontrolled
           (< patient_platelet_count_finding_value_recorded_now_withunit_thousands_per_cubic_millimeter 100)
           (< patient_hemoglobin_value_recorded_now_withunit_grams_per_deciliter 10)
           patient_has_finding_of_bleeding_inthehistory@@hemorrhagic_disorder_that_can_increase_risk_of_bleeding
           (or (> patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 180)
               (> patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 100)))
        patient_has_finding_of_high_risk_of_bleeding_now)
:named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples ((recent gastrointestinal bleeding within thirty days) OR (any history of intracranial bleeding) OR (any history of intraocular bleeding) OR (any history of retroperitoneal bleeding) OR (any history of spinal bleeding) OR (recent major trauma within thirty days of dosing) OR (sustained uncontrolled hypertension defined as (systolic blood pressure greater than one hundred eighty millimeters of mercury OR diastolic blood pressure greater than one hundred millimeters of mercury)) OR (history of hemorrhagic disorders that can increase the risk of bleeding) OR (platelet count less than one hundred thousand per cubic millimeter) OR (hemoglobin less than ten grams per deciliter))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_bleeding_inthehistory@@located_in_spine
       patient_has_finding_of_bleeding_inthehistory)
:named REQ3_AUXILIARY1)) ;; "any history of spinal bleeding"

(assert
(! (=> patient_has_finding_of_bleeding_inthehistory@@hemorrhagic_disorder_that_can_increase_risk_of_bleeding
       patient_has_finding_of_bleeding_inthehistory)
:named REQ3_AUXILIARY2)) ;; "history of hemorrhagic disorders that can increase the risk of bleeding"

(assert
(! (=> patient_has_finding_of_traumatic_injury_inthepast30days@@major
       patient_has_finding_of_traumatic_injury_inthepast30days)
:named REQ3_AUXILIARY3)) ;; "recent major trauma within thirty days of dosing"

(assert
(! (=> patient_has_finding_of_traumatic_injury_inthepast30days@@temporalcontext_within30days_of_dosing
       patient_has_finding_of_traumatic_injury_inthepast30days)
:named REQ3_AUXILIARY4)) ;; "recent major trauma within thirty days of dosing"

(assert
(! (=> patient_has_finding_of_hypertensive_disorder_now@@sustained_uncontrolled
       patient_has_finding_of_hypertensive_disorder_now)
:named REQ3_AUXILIARY5)) ;; "sustained uncontrolled hypertension"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_high_risk_of_bleeding_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has increased bleeding risk with non-exhaustive examples ..."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any history of cerebrovascular accident (stroke), regardless of type.","when_to_set_to_false":"Set to false if the patient does not have any history of cerebrovascular accident (stroke).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has any history of cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has any history of cerebrovascular accident (stroke), regardless of type."} ;; "stroke"
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory@@hemorrhagic_type Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of cerebrovascular accident (stroke) is specifically of hemorrhagic type.","when_to_set_to_false":"Set to false if the patient's history of cerebrovascular accident (stroke) is not of hemorrhagic type.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of cerebrovascular accident (stroke) is of hemorrhagic type.","meaning":"Boolean indicating whether the patient's history of cerebrovascular accident (stroke) is of hemorrhagic type."} ;; "hemorrhagic stroke"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_cerebrovascular_accident_inthehistory@@hemorrhagic_type
      patient_has_finding_of_cerebrovascular_accident_inthehistory)
:named REQ4_AUXILIARY0)) ;; "hemorrhagic stroke" is a type of "cerebrovascular accident (stroke)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthehistory@@hemorrhagic_type)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any history of hemorrhagic stroke."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_contraindication_to_aspirin_or_ticagrelor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication or other reason that acetylsalicylic acid (aspirin) or ticagrelor should not be administered.","when_to_set_to_false":"Set to false if the patient currently does not have any contraindication or other reason that acetylsalicylic acid (aspirin) or ticagrelor should not be administered.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication or other reason that acetylsalicylic acid (aspirin) or ticagrelor should not be administered.","meaning":"Boolean indicating whether the patient currently has a contraindication or other reason that acetylsalicylic acid (aspirin) or ticagrelor should not be administered."} ;; "contraindication or other reason that acetylsalicylic acid or ticagrelor should not be administered"

(declare-const patient_has_finding_of_hypersensitivity_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of hypersensitivity.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of hypersensitivity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of hypersensitivity.","meaning":"Boolean indicating whether the patient currently has a clinical finding of hypersensitivity."} ;; "hypersensitivity"

(declare-const patient_has_hypersensitivity_to_aspirin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypersensitivity to aspirin (acetylsalicylic acid).","when_to_set_to_false":"Set to false if the patient currently does not have a hypersensitivity to aspirin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypersensitivity to aspirin.","meaning":"Boolean indicating whether the patient currently has a hypersensitivity to aspirin."} ;; "hypersensitivity to acetylsalicylic acid"

(declare-const patient_has_hypersensitivity_to_ticagrelor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypersensitivity to ticagrelor.","when_to_set_to_false":"Set to false if the patient currently does not have a hypersensitivity to ticagrelor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypersensitivity to ticagrelor.","meaning":"Boolean indicating whether the patient currently has a hypersensitivity to ticagrelor."} ;; "hypersensitivity to ticagrelor"

(declare-const patient_has_finding_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of bleeding.","meaning":"Boolean indicating whether the patient currently has a clinical finding of bleeding."} ;; "bleeding"

(declare-const patient_has_finding_of_bleeding_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active bleeding.","when_to_set_to_false":"Set to false if the patient currently has bleeding but it is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bleeding is active.","meaning":"Boolean indicating whether the patient's current bleeding is active."} ;; "active bleeding"

(declare-const patient_has_undergone_surgical_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a surgical procedure in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure in the past.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure in the past."} ;; "major surgery"

(declare-const patient_has_undergone_surgical_procedure_inthehistory@@temporalcontext_within30days_before_dosing Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure within thirty days before dosing.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure within thirty days before dosing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure within thirty days before dosing.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure within thirty days before dosing."} ;; "major surgery within thirty days of dosing"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_hypersensitivity_condition_now
           patient_has_hypersensitivity_to_aspirin_now
           patient_has_hypersensitivity_to_ticagrelor_now
           patient_has_finding_of_bleeding_now@@active
           patient_has_undergone_surgical_procedure_inthehistory@@temporalcontext_within30days_before_dosing)
        patient_has_contraindication_to_aspirin_or_ticagrelor_now)
   :named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples ((hypersensitivity) OR (active bleeding) OR (major surgery within thirty days of dosing))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_bleeding_now@@active
       patient_has_finding_of_bleeding_now)
   :named REQ5_AUXILIARY1)) ;; "active bleeding"

(assert
(! (=> patient_has_undergone_surgical_procedure_inthehistory@@temporalcontext_within30days_before_dosing
       patient_has_undergone_surgical_procedure_inthehistory)
   :named REQ5_AUXILIARY2)) ;; "major surgery within thirty days of dosing"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_contraindication_to_aspirin_or_ticagrelor_now)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication or other reason that acetylsalicylic acid or ticagrelor should not be administered."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's creatinine renal clearance in milliliters per minute is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine renal clearance in milliliters per minute."} ;; "creatinine clearance less than thirty milliliters per minute"
(declare-const patient_has_finding_of_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of renal failure syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of renal failure syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal failure syndrome.","meaning":"Boolean indicating whether the patient currently has renal failure syndrome."} ;; "renal failure"
(declare-const patient_is_undergoing_dialysis_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing dialysis procedure.","when_to_set_to_false":"Set to false if the patient is not currently undergoing dialysis procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing dialysis procedure.","meaning":"Boolean indicating whether the patient is currently undergoing dialysis procedure."} ;; "requires dialysis"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: severe renal failure = (creatinine clearance < 30 mL/min) OR (requires dialysis)
(assert
(! (= patient_has_finding_of_renal_failure_syndrome_now
     (or (< patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute 30)
         patient_is_undergoing_dialysis_procedure_now))
:named REQ6_AUXILIARY0)) ;; "severe renal failure defined as ((creatinine clearance less than thirty milliliters per minute) OR (requires dialysis))."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_renal_failure_syndrome_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe renal failure defined as ((creatinine clearance less than thirty milliliters per minute) OR (requires dialysis))."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_history_of_moderate_hepatic_impairment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of moderate hepatic impairment.","when_to_set_to_false":"Set to false if the patient does not have a documented history of moderate hepatic impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of moderate hepatic impairment.","meaning":"Boolean indicating whether the patient has a history of moderate hepatic impairment."} ;; "history of moderate hepatic impairment"

(declare-const patient_has_history_of_severe_hepatic_impairment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of severe hepatic impairment.","when_to_set_to_false":"Set to false if the patient does not have a documented history of severe hepatic impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of severe hepatic impairment.","meaning":"Boolean indicating whether the patient has a history of severe hepatic impairment."} ;; "history of severe hepatic impairment"

(declare-const patient_aspartate_aminotransferase_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of aspartate aminotransferase recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current aspartate aminotransferase measurement."} ;; "aspartate aminotransferase > 1.5 times the upper limit of the reference range"

(declare-const aspartate_aminotransferase_upper_limit_of_reference_range_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the upper limit value if the reference range for aspartate aminotransferase is available.","when_to_set_to_null":"Set to null if the reference range upper limit is not available or indeterminate.","meaning":"Numeric value representing the upper limit of the reference range for aspartate aminotransferase."} ;; "aspartate aminotransferase > 1.5 times the upper limit of the reference range"

(declare-const patient_alanine_aminotransferase_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of alanine aminotransferase recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current alanine aminotransferase measurement."} ;; "alanine aminotransferase > 1.5 times the upper limit of the reference range"

(declare-const alanine_aminotransferase_upper_limit_of_reference_range_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the upper limit value if the reference range for alanine aminotransferase is available.","when_to_set_to_null":"Set to null if the reference range upper limit is not available or indeterminate.","meaning":"Numeric value representing the upper limit of the reference range for alanine aminotransferase."} ;; "alanine aminotransferase > 1.5 times the upper limit of the reference range"

(declare-const patient_bilirubin_total_measurement_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of total bilirubin recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current total bilirubin measurement."} ;; "total bilirubin > 1.5 times the upper limit of the reference range"

(declare-const bilirubin_total_upper_limit_of_reference_range_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the upper limit value if the reference range for total bilirubin is available.","when_to_set_to_null":"Set to null if the reference range upper limit is not available or indeterminate.","meaning":"Numeric value representing the upper limit of the reference range for total bilirubin."} ;; "total bilirubin > 1.5 times the upper limit of the reference range"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: history of moderate hepatic impairment
(assert
(! (not patient_has_history_of_moderate_hepatic_impairment)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of moderate hepatic impairment."

;; Exclusion: history of severe hepatic impairment with any of the following:
;; aspartate aminotransferase > 1.5x ULN, alanine aminotransferase > 1.5x ULN, or total bilirubin > 1.5x ULN
(assert
(! (not (and patient_has_history_of_severe_hepatic_impairment
             (or
               (> patient_aspartate_aminotransferase_value_recorded_now_withunit_unit
                  (* 1.5 aspartate_aminotransferase_upper_limit_of_reference_range_withunit_unit))
               (> patient_alanine_aminotransferase_value_recorded_now_withunit_unit
                  (* 1.5 alanine_aminotransferase_upper_limit_of_reference_range_withunit_unit))
               (> patient_bilirubin_total_measurement_value_recorded_now_withunit_unit
                  (* 1.5 bilirubin_total_upper_limit_of_reference_range_withunit_unit)))))
    :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of severe hepatic impairment with aspartate aminotransferase > 1.5 times the upper limit of the reference range, alanine aminotransferase > 1.5 times the upper limit of the reference range, or total bilirubin > 1.5 times the upper limit of the reference range."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently known not to be lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
  (! (not patient_is_lactating_now)
     :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_exposed_to_glycoprotein_inthepast8hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to glycoprotein within the past 8 hours.","when_to_set_to_false":"Set to false if the patient has not been exposed to glycoprotein within the past 8 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to glycoprotein within the past 8 hours.","meaning":"Boolean indicating whether the patient has been exposed to glycoprotein within the past 8 hours."} ;; "receiving any glycoprotein IIb/IIIa inhibitor less than eight hours before platelet reactivity testing"
(declare-const patient_is_exposed_to_glycoprotein_inthepast8hours@@temporalcontext_before_platelet_reactivity_testing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to glycoprotein within the past 8 hours occurred before platelet reactivity testing.","when_to_set_to_false":"Set to false if the patient's exposure to glycoprotein within the past 8 hours did not occur before platelet reactivity testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred before platelet reactivity testing.","meaning":"Boolean indicating whether the patient's exposure to glycoprotein within the past 8 hours occurred before platelet reactivity testing."} ;; "receiving any glycoprotein IIb/IIIa inhibitor less than eight hours before platelet reactivity testing"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_is_exposed_to_glycoprotein_inthepast8hours@@temporalcontext_before_platelet_reactivity_testing
      patient_is_exposed_to_glycoprotein_inthepast8hours)
:named REQ9_AUXILIARY0)) ;; "less than eight hours before platelet reactivity testing"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_exposed_to_glycoprotein_inthepast8hours@@temporalcontext_before_platelet_reactivity_testing)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving any glycoprotein IIb/IIIa inhibitor less than eight hours before platelet reactivity testing."
