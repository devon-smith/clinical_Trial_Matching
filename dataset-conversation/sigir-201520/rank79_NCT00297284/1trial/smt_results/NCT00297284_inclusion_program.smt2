;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_systemic_lupus_erythematosus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of systemic lupus erythematosus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of systemic lupus erythematosus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of systemic lupus erythematosus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of systemic lupus erythematosus."} // "systemic lupus erythematosus"
(declare-const patient_has_diagnosis_of_systemic_lupus_erythematosus_now@@confirmed_by_american_college_of_rheumatology_classification_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of systemic lupus erythematosus is confirmed according to American College of Rheumatology classification criteria.","when_to_set_to_false":"Set to false if the patient's diagnosis of systemic lupus erythematosus is not confirmed according to American College of Rheumatology classification criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is confirmed according to American College of Rheumatology classification criteria.","meaning":"Boolean indicating whether the patient's diagnosis of systemic lupus erythematosus is confirmed according to American College of Rheumatology classification criteria."} // "confirmed by American College of Rheumatology classification criteria"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_systemic_lupus_erythematosus_now@@confirmed_by_american_college_of_rheumatology_classification_criteria
         patient_has_diagnosis_of_systemic_lupus_erythematosus_now)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must fulfill American College of Rheumatology classification criteria for systemic lupus erythematosus."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_systemic_lupus_erythematosus_now@@confirmed_by_american_college_of_rheumatology_classification_criteria
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must fulfill American College of Rheumatology classification criteria for systemic lupus erythematosus."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "older than 18 years AND younger than 60 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be older than 18 years.
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be older than 18 years."

;; Component 1: To be included, the patient must be younger than 60 years.
(assert
  (! (< patient_age_value_recorded_now_in_years 60)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be younger than 60 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_able_to_speak_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to speak English.","when_to_set_to_false":"Set to false if the patient is currently not able to speak English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to speak English.","meaning":"Boolean indicating whether the patient is currently able to speak English."} // "be able to speak English"
(declare-const patient_is_able_to_read_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to read English.","when_to_set_to_false":"Set to false if the patient is currently not able to read English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to read English.","meaning":"Boolean indicating whether the patient is currently able to read English."} // "be able to read English"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_able_to_speak_english_now
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be able to speak English."

(assert
  (! patient_is_able_to_read_english_now
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be able to read English."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_treating_rheumatologist_at_hospital_for_special_surgery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a treating rheumatologist at the Hospital for Special Surgery.","when_to_set_to_false":"Set to false if the patient currently does not have a treating rheumatologist at the Hospital for Special Surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a treating rheumatologist at the Hospital for Special Surgery.","meaning":"Boolean indicating whether the patient currently has a treating rheumatologist at the Hospital for Special Surgery."} // "must have a treating rheumatologist at the Hospital for Special Surgery"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_treating_rheumatologist_at_hospital_for_special_surgery_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have a treating rheumatologist at the Hospital for Special Surgery"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_verbal_intelligence_quotient_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's estimated premorbid verbal intelligence quotient score is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric score representing the patient's estimated premorbid verbal intelligence quotient measured now."} // "estimated premorbid verbal intelligence quotient"
(declare-const patient_verbal_intelligence_quotient_value_recorded_now_withunit_score@@measured_by_north_american_adult_reading_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient's verbal intelligence quotient score was measured using the North American Adult Reading Test.","when_to_set_to_false":"Set to false if the patient's verbal intelligence quotient score was not measured using the North American Adult Reading Test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the North American Adult Reading Test was used to measure the verbal intelligence quotient.","meaning":"Boolean indicating whether the patient's verbal intelligence quotient score was measured using the North American Adult Reading Test."} // "as measured by the North American Adult Reading Test"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable is set (if measured by NAART, the score must exist)
(assert
  (! (=> patient_verbal_intelligence_quotient_value_recorded_now_withunit_score@@measured_by_north_american_adult_reading_test
         true)
     :named REQ4_AUXILIARY0)) ;; "as measured by the North American Adult Reading Test"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Must have estimated premorbid verbal IQ > 80 as measured by NAART
(assert
  (! (and patient_verbal_intelligence_quotient_value_recorded_now_withunit_score@@measured_by_north_american_adult_reading_test
          (> patient_verbal_intelligence_quotient_value_recorded_now_withunit_score 80))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "estimated premorbid verbal intelligence quotient greater than 80 as measured by the North American Adult Reading Test"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const cognitive_symptoms_inventory_positive_endorsement_item_count_now Real) ;; {"when_to_set_to_value":"Set to the number of items currently positively endorsed by the patient on the Cognitive Symptoms Inventory.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many items are currently positively endorsed by the patient on the Cognitive Symptoms Inventory.","meaning":"Numeric value indicating the number of items currently positively endorsed by the patient on the Cognitive Symptoms Inventory."} // "positive endorsement of ≥ 6 items on the Cognitive Symptoms Inventory (which is a 21-item, self-report questionnaire designed to assess ability to perform everyday activities in patients with rheumatic disease)"
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cognitive dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cognitive dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cognitive dysfunction.","meaning":"Boolean indicating whether the patient currently has cognitive dysfunction."} // "cognitive dysfunction"
(declare-const patient_has_finding_of_impaired_cognition_now@@assessed_by_cognitive_symptoms_inventory Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cognitive dysfunction is assessed by the Cognitive Symptoms Inventory.","when_to_set_to_false":"Set to false if the patient's cognitive dysfunction is not assessed by the Cognitive Symptoms Inventory.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cognitive dysfunction is assessed by the Cognitive Symptoms Inventory.","meaning":"Boolean indicating whether the patient's cognitive dysfunction is assessed by the Cognitive Symptoms Inventory."} // "cognitive dysfunction ... assessed by the Cognitive Symptoms Inventory"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_impaired_cognition_now@@assessed_by_cognitive_symptoms_inventory
         patient_has_finding_of_impaired_cognition_now)
     :named REQ5_AUXILIARY0)) ;; "cognitive dysfunction ... assessed by the Cognitive Symptoms Inventory" implies "cognitive dysfunction"

;; Definition: cognitive dysfunction assessed by CSI is present iff positive endorsement of ≥ 6 items on CSI
(assert
  (! (= patient_has_finding_of_impaired_cognition_now@@assessed_by_cognitive_symptoms_inventory
         (>= cognitive_symptoms_inventory_positive_endorsement_item_count_now 6))
     :named REQ5_AUXILIARY1)) ;; "cognitive dysfunction ... defined as positive endorsement of ≥ 6 items on the Cognitive Symptoms Inventory"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Inclusion: patient must have functional difficulties due to cognitive dysfunction (defined as positive endorsement of ≥ 6 items on CSI)
(assert
  (! patient_has_finding_of_impaired_cognition_now@@assessed_by_cognitive_symptoms_inventory
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have functional difficulties due to cognitive dysfunction (defined as positive endorsement of ≥ 6 items on the Cognitive Symptoms Inventory)"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_physical_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a physical disability.","when_to_set_to_false":"Set to false if the patient currently does not have a physical disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a physical disability.","meaning":"Boolean indicating whether the patient currently has a physical disability."} // "physical disabilities"
(declare-const patient_has_finding_of_physical_disability_now@@precludes_or_confounds_neuropsychological_testing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's physical disability would preclude or confound the results of neuropsychological testing.","when_to_set_to_false":"Set to false if the patient's physical disability would not preclude or confound the results of neuropsychological testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the physical disability would preclude or confound neuropsychological testing.","meaning":"Boolean indicating whether the patient's physical disability would preclude or confound neuropsychological testing."} // "physical disabilities that would preclude or confound the results of neuropsychological testing"
(declare-const patient_has_finding_of_mental_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disability.","when_to_set_to_false":"Set to false if the patient currently does not have a mental disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental disability.","meaning":"Boolean indicating whether the patient currently has a mental disability."} // "mental disabilities"
(declare-const patient_has_finding_of_mental_disability_now@@precludes_or_confounds_neuropsychological_testing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's mental disability would preclude or confound the results of neuropsychological testing.","when_to_set_to_false":"Set to false if the patient's mental disability would not preclude or confound the results of neuropsychological testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mental disability would preclude or confound neuropsychological testing.","meaning":"Boolean indicating whether the patient's mental disability would preclude or confound neuropsychological testing."} // "mental disabilities that would preclude or confound the results of neuropsychological testing"
(declare-const patient_has_finding_of_impairment_of_hand_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has impairment of hand function (compromised use of hands).","when_to_set_to_false":"Set to false if the patient currently does not have impairment of hand function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impairment of hand function.","meaning":"Boolean indicating whether the patient currently has impairment of hand function."} // "compromised use of hands"
(declare-const patient_has_finding_of_impairment_of_hand_function_now@@precludes_or_confounds_neuropsychological_testing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impairment of hand function would preclude or confound the results of neuropsychological testing.","when_to_set_to_false":"Set to false if the patient's impairment of hand function would not preclude or confound the results of neuropsychological testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the impairment of hand function would preclude or confound neuropsychological testing.","meaning":"Boolean indicating whether the patient's impairment of hand function would preclude or confound neuropsychological testing."} // "compromised use of hands that would preclude or confound the results of neuropsychological testing"
(declare-const patient_has_finding_of_severe_visual_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe visual impairment.","when_to_set_to_false":"Set to false if the patient currently does not have severe visual impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe visual impairment.","meaning":"Boolean indicating whether the patient currently has severe visual impairment."} // "severe visual impairment"
(declare-const patient_has_finding_of_severe_visual_impairment_now@@precludes_or_confounds_neuropsychological_testing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's severe visual impairment would preclude or confound the results of neuropsychological testing.","when_to_set_to_false":"Set to false if the patient's severe visual impairment would not preclude or confound the results of neuropsychological testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severe visual impairment would preclude or confound neuropsychological testing.","meaning":"Boolean indicating whether the patient's severe visual impairment would preclude or confound neuropsychological testing."} // "severe visual impairment that would preclude or confound the results of neuropsychological testing"
(declare-const patient_has_finding_of_severe_hearing_loss_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe hearing loss.","when_to_set_to_false":"Set to false if the patient currently does not have severe hearing loss.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe hearing loss.","meaning":"Boolean indicating whether the patient currently has severe hearing loss."} // "severe hearing impairment"
(declare-const patient_has_finding_of_severe_hearing_loss_now@@precludes_or_confounds_neuropsychological_testing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's severe hearing loss would preclude or confound the results of neuropsychological testing.","when_to_set_to_false":"Set to false if the patient's severe hearing loss would not preclude or confound the results of neuropsychological testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severe hearing loss would preclude or confound neuropsychological testing.","meaning":"Boolean indicating whether the patient's severe hearing loss would preclude or confound neuropsychological testing."} // "severe hearing impairment that would preclude or confound the results of neuropsychological testing"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_physical_disability_now@@precludes_or_confounds_neuropsychological_testing
         patient_has_finding_of_physical_disability_now)
     :named REQ6_AUXILIARY0)) ;; "physical disabilities that would preclude or confound the results of neuropsychological testing"

(assert
  (! (=> patient_has_finding_of_mental_disability_now@@precludes_or_confounds_neuropsychological_testing
         patient_has_finding_of_mental_disability_now)
     :named REQ6_AUXILIARY1)) ;; "mental disabilities that would preclude or confound the results of neuropsychological testing"

(assert
  (! (=> patient_has_finding_of_impairment_of_hand_function_now@@precludes_or_confounds_neuropsychological_testing
         patient_has_finding_of_impairment_of_hand_function_now)
     :named REQ6_AUXILIARY2)) ;; "compromised use of hands that would preclude or confound the results of neuropsychological testing"

(assert
  (! (=> patient_has_finding_of_severe_visual_impairment_now@@precludes_or_confounds_neuropsychological_testing
         patient_has_finding_of_severe_visual_impairment_now)
     :named REQ6_AUXILIARY3)) ;; "severe visual impairment that would preclude or confound the results of neuropsychological testing"

(assert
  (! (=> patient_has_finding_of_severe_hearing_loss_now@@precludes_or_confounds_neuropsychological_testing
         patient_has_finding_of_severe_hearing_loss_now)
     :named REQ6_AUXILIARY4)) ;; "severe hearing impairment that would preclude or confound the results of neuropsychological testing"

;; Non-exhaustive examples imply umbrella subclass
(assert
  (! (=> (or patient_has_finding_of_impairment_of_hand_function_now@@precludes_or_confounds_neuropsychological_testing
            patient_has_finding_of_severe_visual_impairment_now@@precludes_or_confounds_neuropsychological_testing
            patient_has_finding_of_severe_hearing_loss_now@@precludes_or_confounds_neuropsychological_testing)
         patient_has_finding_of_physical_disability_now@@precludes_or_confounds_neuropsychological_testing)
     :named REQ6_AUXILIARY5)) ;; "compromised use of hands, severe visual impairment, severe hearing impairment" as non-exhaustive examples for physical disability

(assert
  (! (=> (or patient_has_finding_of_impairment_of_hand_function_now@@precludes_or_confounds_neuropsychological_testing
            patient_has_finding_of_severe_visual_impairment_now@@precludes_or_confounds_neuropsychological_testing
            patient_has_finding_of_severe_hearing_loss_now@@precludes_or_confounds_neuropsychological_testing)
         patient_has_finding_of_mental_disability_now@@precludes_or_confounds_neuropsychological_testing)
     :named REQ6_AUXILIARY6)) ;; "compromised use of hands, severe visual impairment, severe hearing impairment" as non-exhaustive examples for mental disability

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: Must NOT have physical disabilities that would preclude or confound neuropsychological testing
(assert
  (! (not patient_has_finding_of_physical_disability_now@@precludes_or_confounds_neuropsychological_testing)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT have (physical disabilities that would preclude or confound the results of neuropsychological testing)"

;; Component 1: Must NOT have mental disabilities that would preclude or confound neuropsychological testing
(assert
  (! (not patient_has_finding_of_mental_disability_now@@precludes_or_confounds_neuropsychological_testing)
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "must NOT have (mental disabilities that would preclude or confound the results of neuropsychological testing)"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_is_able_to_read_normal_newsprint_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to read normal newsprint.","when_to_set_to_false":"Set to false if the patient is currently unable to read normal newsprint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to read normal newsprint.","meaning":"Boolean indicating whether the patient is currently able to read normal newsprint."} // "be able to read normal newsprint"
(declare-const patient_is_able_to_hear_normal_speaking_voice_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to hear a normal speaking voice.","when_to_set_to_false":"Set to false if the patient is currently unable to hear a normal speaking voice.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to hear a normal speaking voice.","meaning":"Boolean indicating whether the patient is currently able to hear a normal speaking voice."} // "be able to hear a normal speaking voice"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_is_able_to_read_normal_newsprint_now
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to read normal newsprint."

(assert
  (! patient_is_able_to_hear_normal_speaking_voice_now
     :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to hear a normal speaking voice."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_finding_of_normal_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has normal blood pressure (is normotensive).","when_to_set_to_false":"Set to false if the patient currently does not have normal blood pressure (is not normotensive).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has normal blood pressure.","meaning":"Boolean indicating whether the patient currently has normal blood pressure."} // "normotensive"
(declare-const patient_has_finding_of_normal_blood_pressure_now@@temporalcontext_at_time_of_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has normal blood pressure specifically at the time of enrollment.","when_to_set_to_false":"Set to false if the patient does not have normal blood pressure at the time of enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has normal blood pressure at the time of enrollment.","meaning":"Boolean indicating whether the patient has normal blood pressure at the time of enrollment."} // "normotensive at the time of enrollment"
(declare-const patient_is_receiving_antihypertensive_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving antihypertensive medication.","when_to_set_to_false":"Set to false if the patient is currently not receiving antihypertensive medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving antihypertensive medication.","meaning":"Boolean indicating whether the patient is currently receiving antihypertensive medication."} // "with or without antihypertensive medication"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_normal_blood_pressure_now@@temporalcontext_at_time_of_enrollment
         patient_has_finding_of_normal_blood_pressure_now)
     :named REQ8_AUXILIARY0)) ;; "normotensive at the time of enrollment"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Inclusion: patient must be normotensive at the time of enrollment (regardless of antihypertensive medication)
(assert
  (! patient_has_finding_of_normal_blood_pressure_now@@temporalcontext_at_time_of_enrollment
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be normotensive at the time of enrollment (with or without antihypertensive medication)."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_has_finding_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has cardiac arrhythmia."} // "arrhythmia"
(declare-const patient_has_finding_of_cardiac_arrhythmia_now@@detected_on_electrocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiac arrhythmia is detected on electrocardiogram.","when_to_set_to_false":"Set to false if the patient's cardiac arrhythmia is not detected on electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiac arrhythmia is detected on electrocardiogram.","meaning":"Boolean indicating whether the patient's cardiac arrhythmia is detected on electrocardiogram."} // "arrhythmia on electrocardiogram"
(declare-const patient_has_finding_of_left_ventricular_hypertrophy_now@@detected_on_electrocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left ventricular hypertrophy is detected on electrocardiogram.","when_to_set_to_false":"Set to false if the patient's left ventricular hypertrophy is not detected on electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's left ventricular hypertrophy is detected on electrocardiogram.","meaning":"Boolean indicating whether the patient's left ventricular hypertrophy is detected on electrocardiogram."} // "left ventricular hypertrophy on electrocardiogram"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_cardiac_arrhythmia_now@@detected_on_electrocardiogram
         patient_has_finding_of_cardiac_arrhythmia_now)
     :named REQ9_AUXILIARY0)) ;; "arrhythmia on electrocardiogram" implies "arrhythmia"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Component 0: To be included, the patient must NOT have arrhythmia on electrocardiogram.
(assert
  (! (not patient_has_finding_of_cardiac_arrhythmia_now@@detected_on_electrocardiogram)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT have arrhythmia on electrocardiogram"

;; Component 1: To be included, the patient must NOT have left ventricular hypertrophy on electrocardiogram.
(assert
  (! (not patient_has_finding_of_left_ventricular_hypertrophy_now@@detected_on_electrocardiogram)
     :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "must NOT have left ventricular hypertrophy on electrocardiogram"

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_is_using_adequate_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using adequate contraception.","when_to_set_to_false":"Set to false if the patient is currently not using adequate contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using adequate contraception.","meaning":"Boolean indicating whether the patient is currently using adequate contraception."} // "must use adequate contraception"
(declare-const patient_is_using_adequate_contraception_now@@contraception_is_barrier_method Bool) ;; {"when_to_set_to_true":"Set to true if the contraception method currently used by the patient is a barrier method.","when_to_set_to_false":"Set to false if the contraception method currently used by the patient is not a barrier method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception method currently used by the patient is a barrier method.","meaning":"Boolean indicating whether the contraception method currently used by the patient is a barrier method."} // "barrier method"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_using_adequate_contraception_now@@contraception_is_barrier_method
         patient_is_using_adequate_contraception_now)
     :named REQ10_AUXILIARY0)) ;; "barrier method" is a type of adequate contraception

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: patient must use adequate contraception (barrier method)
(assert
  (! patient_is_using_adequate_contraception_now@@contraception_is_barrier_method
     :named REQ10_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must use adequate contraception (barrier method)"
