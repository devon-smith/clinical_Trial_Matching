;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_allergy_to_levodopa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to levodopa.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to levodopa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to levodopa.","meaning":"Boolean indicating whether the patient currently has an allergy to levodopa."} ;; "the patient has a known allergy to levodopa"
(declare-const patient_has_allergy_to_tetrazine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to tetrazine.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to tetrazine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to tetrazine.","meaning":"Boolean indicating whether the patient currently has an allergy to tetrazine."} ;; "the patient has a known allergy to tetrazine"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_allergy_to_levodopa_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to levodopa."

(assert
  (! (not patient_has_allergy_to_tetrazine_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to tetrazine."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_medication_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented finding of medication abuse at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a documented finding of medication abuse at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of medication abuse.","meaning":"Boolean indicating whether the patient has ever had a finding of medication abuse at any time in their history."} ;; "the patient has a history of medication abuse"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented finding relating to drug misuse behavior at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a documented finding relating to drug misuse behavior at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding relating to drug misuse behavior.","meaning":"Boolean indicating whether the patient has ever had a finding relating to drug misuse behavior at any time in their history."} ;; "the patient has a history of drug abuse"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (or patient_has_finding_of_medication_abuse_inthehistory
              patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of medication abuse) OR (the patient has a history of drug abuse)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_nicotine_withdrawal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently experiencing nicotine withdrawal.","when_to_set_to_false":"Set to false if the patient is currently not experiencing nicotine withdrawal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently experiencing nicotine withdrawal.","meaning":"Boolean indicating whether the patient is currently experiencing nicotine withdrawal."} ;; "nicotine withdrawal"

(declare-const patient_has_finding_of_nicotine_withdrawal_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently experiencing acute nicotine withdrawal.","when_to_set_to_false":"Set to false if the patient is currently experiencing nicotine withdrawal but it is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the nicotine withdrawal is acute.","meaning":"Boolean indicating whether the patient's current nicotine withdrawal is acute."} ;; "acute nicotine withdrawal"

(declare-const patient_tobacco_smoking_behavior_finding_value_recorded_now_withunit_cigarettes_per_day Real) ;; {"when_to_set_to_value":"Set to the measured or reported number of cigarettes the patient currently smokes per day.","when_to_set_to_null":"Set to null if no such measurement or report is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current number of cigarettes smoked per day."} ;; "smokes more than fifteen cigarettes per day"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_nicotine_withdrawal_now@@acute
       patient_has_finding_of_nicotine_withdrawal_now)
   :named REQ2_AUXILIARY0)) ;; "acute nicotine withdrawal" implies "nicotine withdrawal"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient is experiencing acute nicotine withdrawal OR smokes more than fifteen cigarettes per day
(assert
(! (not (or patient_has_finding_of_nicotine_withdrawal_now@@acute
            (> patient_tobacco_smoking_behavior_finding_value_recorded_now_withunit_cigarettes_per_day 15)))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is experiencing acute nicotine withdrawal) OR (the patient smokes more than fifteen cigarettes per day)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_coffee_value_recorded_now_withunit_cups_per_day Real) ;; {"when_to_set_to_value":"Set to the number of cups of coffee the patient currently consumes per day if available.","when_to_set_to_null":"Set to null if the number of cups of coffee consumed per day is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the number of cups of coffee the patient currently consumes per day."} ;; "the patient consumes more than six cups of coffee per day"
(declare-const patient_coffee_value_recorded_now_withunit_glasses_per_day Real) ;; {"when_to_set_to_value":"Set to the number of glasses of coffee the patient currently consumes per day if available.","when_to_set_to_null":"Set to null if the number of glasses of coffee consumed per day is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the number of glasses of coffee the patient currently consumes per day."} ;; "the patient consumes more than six glasses of coffee per day"
(declare-const patient_caffeine_drinks_value_recorded_now_withunit_cups_per_day Real) ;; {"when_to_set_to_value":"Set to the number of cups of caffeine drinks the patient currently consumes per day if available.","when_to_set_to_null":"Set to null if the number of cups of caffeine drinks consumed per day is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the number of cups of caffeine drinks the patient currently consumes per day."} ;; "the patient consumes more than six cups of caffeine drinks per day"
(declare-const patient_caffeine_drinks_value_recorded_now_withunit_glasses_per_day Real) ;; {"when_to_set_to_value":"Set to the number of glasses of caffeine drinks the patient currently consumes per day if available.","when_to_set_to_null":"Set to null if the number of glasses of caffeine drinks consumed per day is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the number of glasses of caffeine drinks the patient currently consumes per day."} ;; "the patient consumes more than six glasses of caffeine drinks per day"
(declare-const patient_energy_drinks_value_recorded_now_withunit_cups_per_day Real) ;; {"when_to_set_to_value":"Set to the number of cups of energy drinks the patient currently consumes per day if available.","when_to_set_to_null":"Set to null if the number of cups of energy drinks consumed per day is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the number of cups of energy drinks the patient currently consumes per day."} ;; "the patient consumes more than six cups of energy drinks per day"
(declare-const patient_energy_drinks_value_recorded_now_withunit_glasses_per_day Real) ;; {"when_to_set_to_value":"Set to the number of glasses of energy drinks the patient currently consumes per day if available.","when_to_set_to_null":"Set to null if the number of glasses of energy drinks consumed per day is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the number of glasses of energy drinks the patient currently consumes per day."} ;; "the patient consumes more than six glasses of energy drinks per day"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (> patient_coffee_value_recorded_now_withunit_cups_per_day 6))
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient consumes more than six cups of coffee per day."

(assert
(! (not (> patient_coffee_value_recorded_now_withunit_glasses_per_day 6))
:named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient consumes more than six glasses of coffee per day."

(assert
(! (not (> patient_caffeine_drinks_value_recorded_now_withunit_cups_per_day 6))
:named REQ3_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient consumes more than six cups of caffeine drinks per day."

(assert
(! (not (> patient_caffeine_drinks_value_recorded_now_withunit_glasses_per_day 6))
:named REQ3_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient consumes more than six glasses of caffeine drinks per day."

(assert
(! (not (> patient_energy_drinks_value_recorded_now_withunit_cups_per_day 6))
:named REQ3_COMPONENT4_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient consumes more than six cups of energy drinks per day."

(assert
(! (not (> patient_energy_drinks_value_recorded_now_withunit_glasses_per_day 6))
:named REQ3_COMPONENT5_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient consumes more than six glasses of energy drinks per day."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_alcohol_value_recorded_now_withunit_grams Real) ;; {"when_to_set_to_value":"Set to the measured or reported amount of alcohol the patient consumes per day, in grams, recorded now.","when_to_set_to_null":"Set to null if the amount of alcohol consumed per day is unknown, not documented, or cannot be determined for the patient now.","meaning":"Numeric value representing the patient's current daily alcohol consumption in grams."} ;; "consumes more than fifty grams of alcohol per day"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (> patient_alcohol_value_recorded_now_withunit_grams 50))
:named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient consumes more than fifty grams of alcohol per day."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_increased_muscle_tone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of increased muscle tone (hypertonia).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of increased muscle tone (hypertonia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has increased muscle tone (hypertonia).","meaning":"Boolean indicating whether the patient currently has increased muscle tone (hypertonia)."} ;; "hypertonia"

(declare-const patient_has_finding_of_increased_muscle_tone_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe increased muscle tone (severe hypertonia).","when_to_set_to_false":"Set to false if the patient currently has increased muscle tone but it is not severe, or does not have increased muscle tone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe increased muscle tone (severe hypertonia).","meaning":"Boolean indicating whether the patient currently has severe increased muscle tone (severe hypertonia)."} ;; "severe hypertonia"

(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current systolic blood pressure in mmHg is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in mmHg."} ;; "systolic blood pressure"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: severe hypertonia = systolic blood pressure > 160 mmHg
(assert
(! (= patient_has_finding_of_increased_muscle_tone_now@@severe
     (> patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 160))
   :named REQ5_AUXILIARY0)) ;; "defined as systolic blood pressure greater than one hundred sixty millimeters of mercury"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_increased_muscle_tone_now@@severe
       patient_has_finding_of_increased_muscle_tone_now)
   :named REQ5_AUXILIARY1)) ;; "severe hypertonia" implies "hypertonia"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_increased_muscle_tone_now@@severe)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hypertonia (defined as systolic blood pressure greater than one hundred sixty millimeters of mercury)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_severe_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe arteriosclerosis.","when_to_set_to_false":"Set to false if the patient currently does not have severe arteriosclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe arteriosclerosis.","meaning":"Boolean indicating whether the patient currently has severe arteriosclerosis."} ;; "The patient is excluded if the patient has severe arteriosclerosis."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_severe_arteriosclerosis_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe arteriosclerosis."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes"
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "asthma"
(declare-const patient_has_diagnosis_of_glaucoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of glaucoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of glaucoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of glaucoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of glaucoma."} ;; "glaucoma"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_diagnosis_of_diabetes_mellitus_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes."

(assert
(! (not patient_has_diagnosis_of_asthma_now)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has asthma."

(assert
(! (not patient_has_diagnosis_of_glaucoma_now)
:named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has glaucoma."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_severe_hearing_loss_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe hearing loss.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe hearing loss.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe hearing loss.","meaning":"Boolean indicating whether the patient currently has severe hearing loss."} ;; "severe hearing disability"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_severe_hearing_loss_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a severe hearing disability."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_lesion_of_brain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any lesions of the brain.","when_to_set_to_false":"Set to false if the patient currently does not have any lesions of the brain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lesions of the brain.","meaning":"Boolean indicating whether the patient currently has lesions of the brain."} ;; "brain lesions"
(declare-const patient_has_finding_of_lesion_of_brain_now@@focal Bool) ;; {"when_to_set_to_true":"Set to true if the patient's brain lesions are focal in nature.","when_to_set_to_false":"Set to false if the patient's brain lesions are not focal in nature.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's brain lesions are focal.","meaning":"Boolean indicating whether the patient's brain lesions are focal."} ;; "focal brain lesions"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_lesion_of_brain_now@@focal
       patient_has_finding_of_lesion_of_brain_now)
   :named REQ9_AUXILIARY0)) ;; "focal brain lesions" means the patient has brain lesions and those lesions are focal

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_lesion_of_brain_now@@focal)
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has focal brain lesions."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_premorbid_depression Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of premorbid depression (depression present prior to the current illness or event).","when_to_set_to_false":"Set to false if the patient does not have a documented history of premorbid depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of premorbid depression.","meaning":"Boolean indicating whether the patient has a history of premorbid depression (depression present prior to the current illness or event)."} ;; "the patient has premorbid depression"
(declare-const patient_has_finding_of_premorbid_psychosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of premorbid psychosis (psychosis present prior to the current illness or event).","when_to_set_to_false":"Set to false if the patient does not have a documented history of premorbid psychosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of premorbid psychosis.","meaning":"Boolean indicating whether the patient has a history of premorbid psychosis (psychosis present prior to the current illness or event)."} ;; "the patient has premorbid psychosis"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_premorbid_depression)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has premorbid depression."

(assert
(! (not patient_has_finding_of_premorbid_psychosis)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has premorbid psychosis."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_taking_dopamine_receptor_agonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a medication that contains a dopamine receptor agonist.","when_to_set_to_false":"Set to false if the patient is currently not taking any medication that contains a dopamine receptor agonist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a dopamine receptor agonist-containing medication.","meaning":"Boolean indicating whether the patient is currently taking a dopamine receptor agonist-containing product."} ;; "medication with dopamine agonists"
(declare-const patient_is_taking_dopamine_receptor_antagonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a medication that contains a dopamine receptor antagonist.","when_to_set_to_false":"Set to false if the patient is currently not taking any medication that contains a dopamine receptor antagonist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a dopamine receptor antagonist-containing medication.","meaning":"Boolean indicating whether the patient is currently taking a dopamine receptor antagonist-containing product."} ;; "medication with dopamine antagonists"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_taking_dopamine_receptor_agonist_containing_product_now)
    :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking medication with dopamine agonists."

(assert
(! (not patient_is_taking_dopamine_receptor_antagonist_containing_product_now)
    :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking medication with dopamine antagonists."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_parkinsonian_features_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical findings consistent with Parkinsonian features (symptoms or signs of parkinsonism).","when_to_set_to_false":"Set to false if the patient currently does not have clinical findings consistent with Parkinsonian features.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Parkinsonian features.","meaning":"Boolean indicating whether the patient currently has Parkinsonian features."} ;; "The patient is excluded if the patient has Parkinsonian symptoms."

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_parkinsonian_features_now)
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Parkinsonian symptoms."
