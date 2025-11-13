;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."}  ;; "a man"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."}  ;; "a woman"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 50 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be (a man OR a woman)
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (a man OR a woman)."

;; Component 1: The patient must be aged ≥ 50 years
(assert
  (! (>= patient_age_value_recorded_now_in_years 50)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 50 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disease."} ;; "medical disease"
(declare-const patient_is_being_treated_for_medical_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment for a medical disease.","when_to_set_to_false":"Set to false if the patient is currently not receiving treatment for a medical disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated for a medical disease.","meaning":"Boolean indicating whether the patient is currently being treated for a medical disease."} ;; "treated for medical disease"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The requirement is always satisfiable (no restriction imposed)
(assert
  (! true
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient may be treated for medical disease."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_exposed_to_diuretic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to diuretic substances (e.g., is taking diuretic medication now).","when_to_set_to_false":"Set to false if the patient is currently not exposed to diuretic substances.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to diuretic substances.","meaning":"Boolean indicating whether the patient is currently exposed to diuretic substances."} ;; "diuretic medication"
(declare-const patient_is_undergoing_antihypertensive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing antihypertensive therapy (e.g., is receiving medication for hypertension now).","when_to_set_to_false":"Set to false if the patient is currently not undergoing antihypertensive therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing antihypertensive therapy.","meaning":"Boolean indicating whether the patient is currently undergoing antihypertensive therapy."} ;; "medication for hypertension"
(declare-const patient_is_undergoing_lipid_lowering_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing lipid-lowering therapy (e.g., is receiving medication for hypercholesterolemia now).","when_to_set_to_false":"Set to false if the patient is currently not undergoing lipid-lowering therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing lipid-lowering therapy.","meaning":"Boolean indicating whether the patient is currently undergoing lipid-lowering therapy."} ;; "medication for hypercholesterolemia"
(declare-const patient_is_undergoing_blood_glucose_lowering_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving blood glucose-lowering treatment.","when_to_set_to_false":"Set to false if the patient is currently not receiving blood glucose-lowering treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving blood glucose-lowering treatment.","meaning":"Boolean indicating whether the patient is currently receiving blood glucose-lowering treatment."} ;; "blood glucose-lowering treatment"
(declare-const patient_is_undergoing_blood_glucose_lowering_treatment_now@@administered_daily Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current blood glucose-lowering treatment is administered daily.","when_to_set_to_false":"Set to false if the patient's current blood glucose-lowering treatment is not administered daily.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current blood glucose-lowering treatment is administered daily.","meaning":"Boolean indicating whether the patient's current blood glucose-lowering treatment is administered daily."} ;; "daily blood glucose-lowering treatment"
(declare-const patient_is_exposed_to_inotropic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to inotropic agents (e.g., is taking medication that strengthens the heart now).","when_to_set_to_false":"Set to false if the patient is currently not exposed to inotropic agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to inotropic agents.","meaning":"Boolean indicating whether the patient is currently exposed to inotropic agents."} ;; "medication that strengthens the heart"
(declare-const patient_has_symptoms_of_arthropathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently experiencing symptoms of arthropathy (joint disease).","when_to_set_to_false":"Set to false if the patient is currently not experiencing symptoms of arthropathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently experiencing symptoms of arthropathy.","meaning":"Boolean indicating whether the patient is currently experiencing symptoms of arthropathy."} ;; "joint disease"
(declare-const patient_is_exposed_to_symptom_relieving_medication_for_joint_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to symptom-relieving medication for joint disease.","when_to_set_to_false":"Set to false if the patient is currently not exposed to symptom-relieving medication for joint disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to symptom-relieving medication for joint disease.","meaning":"Boolean indicating whether the patient is currently exposed to symptom-relieving medication for joint disease."} ;; "symptom-relieving medication for joint disease"
(declare-const patient_is_exposed_to_symptom_relieving_medication_for_joint_disease_now@@administered_daily Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current symptom-relieving medication for joint disease is administered daily.","when_to_set_to_false":"Set to false if the patient's current symptom-relieving medication for joint disease is not administered daily.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current symptom-relieving medication for joint disease is administered daily.","meaning":"Boolean indicating whether the patient's current symptom-relieving medication for joint disease is administered daily."} ;; "daily symptom-relieving medication for joint disease"
(declare-const patient_is_receiving_other_daily_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving other daily medication not otherwise specified.","when_to_set_to_false":"Set to false if the patient is currently not receiving other daily medication not otherwise specified.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving other daily medication not otherwise specified.","meaning":"Boolean indicating whether the patient is currently receiving other daily medication not otherwise specified."} ;; "other daily medication"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_is_undergoing_blood_glucose_lowering_treatment_now@@administered_daily
         patient_is_undergoing_blood_glucose_lowering_treatment_now)
     :named REQ2_AUXILIARY0)) ;; "daily blood glucose-lowering treatment" implies "blood glucose-lowering treatment"

(assert
  (! (=> patient_is_exposed_to_symptom_relieving_medication_for_joint_disease_now@@administered_daily
         patient_is_exposed_to_symptom_relieving_medication_for_joint_disease_now)
     :named REQ2_AUXILIARY1)) ;; "daily symptom-relieving medication for joint disease" implies "symptom-relieving medication for joint disease"

;; Non-exhaustive examples: each example implies the umbrella (receiving daily medication)
(declare-const patient_is_receiving_daily_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving any daily medication (including all listed examples and other daily medication).","when_to_set_to_false":"Set to false if the patient is currently not receiving any daily medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving any daily medication.","meaning":"Boolean indicating whether the patient is currently receiving any daily medication."} ;; "daily medication"

(assert
  (! (=> (or patient_is_exposed_to_diuretic_now
             patient_is_undergoing_antihypertensive_therapy_now
             patient_is_undergoing_lipid_lowering_therapy_now
             patient_is_undergoing_blood_glucose_lowering_treatment_now@@administered_daily
             patient_is_exposed_to_inotropic_agent_now
             patient_is_exposed_to_symptom_relieving_medication_for_joint_disease_now@@administered_daily)
         patient_is_receiving_daily_medication_now)
     :named REQ2_AUXILIARY2)) ;; Non-exhaustive examples imply umbrella

(assert
  (! (=> patient_is_receiving_other_daily_medication_now
         patient_is_receiving_daily_medication_now)
     :named REQ2_AUXILIARY3)) ;; "other daily medication" implies umbrella

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: patient must be receiving daily medication (either listed or other)
(assert
  (! patient_is_receiving_daily_medication_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient may receive daily medication with non-exhaustive examples ... OR other daily medication."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_fish_derived_omega_3_fatty_acid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to fish-derived omega-3 fatty acid (fish oil).","when_to_set_to_false":"Set to false if the patient is currently not exposed to fish-derived omega-3 fatty acid (fish oil).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to fish-derived omega-3 fatty acid (fish oil).","meaning":"Boolean indicating whether the patient is currently exposed to fish-derived omega-3 fatty acid (fish oil)."} ;; "n-3 fatty acid (fish oil)"
(declare-const patient_is_exposed_to_fish_derived_omega_3_fatty_acid_now@@dosage_is_fixed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to fish-derived omega-3 fatty acid (fish oil) is at a fixed dosage.","when_to_set_to_false":"Set to false if the patient's current exposure to fish-derived omega-3 fatty acid (fish oil) is not at a fixed dosage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dosage is fixed.","meaning":"Boolean indicating whether the patient's current exposure to fish-derived omega-3 fatty acid (fish oil) is at a fixed dosage."} ;; "the dosage of n-3 fatty acid (fish oil) is fixed"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_exposed_to_fish_derived_omega_3_fatty_acid_now@@dosage_is_fixed
         patient_is_exposed_to_fish_derived_omega_3_fatty_acid_now)
     :named REQ3_AUXILIARY0)) ;; "the dosage of n-3 fatty acid (fish oil) is fixed" implies "use n-3 fatty acid (fish oil)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Inclusion: patient may use n-3 fatty acid (fish oil) only if the dosage is fixed
(assert
  (! (or (not patient_is_exposed_to_fish_derived_omega_3_fatty_acid_now)
         patient_is_exposed_to_fish_derived_omega_3_fatty_acid_now@@dosage_is_fixed)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "patient may use n-3 fatty acid (fish oil) if (the dosage ... is fixed)"
