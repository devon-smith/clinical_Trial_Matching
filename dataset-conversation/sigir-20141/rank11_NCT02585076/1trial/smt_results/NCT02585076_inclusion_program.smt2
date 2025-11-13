;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_is_outpatient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as an outpatient.","when_to_set_to_false":"Set to false if the patient is currently not classified as an outpatient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as an outpatient.","meaning":"Boolean indicating whether the patient is currently classified as an outpatient."}  ;; "To be included, the patient must be an outpatient."
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."}  ;; "female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."}  ;; "male"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 60 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be an outpatient.
(assert
  (! patient_is_outpatient_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be an outpatient."

;; Component 1: The patient must be (female) OR (male AND aged ≥ 60 years).
(assert
  (! (or patient_sex_is_female_now
         (and patient_sex_is_male_now (>= patient_age_value_recorded_now_in_years 60)))
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be ((female) OR (male AND aged ≥ 60 years))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_hypertensive_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of hypertensive disorder (arterial hypertension) at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of hypertensive disorder (arterial hypertension) at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with hypertensive disorder (arterial hypertension).","meaning":"Boolean indicating whether the patient has ever been diagnosed with hypertensive disorder (arterial hypertension) at any point in their medical history."}  ;; "To be included, the patient must have been diagnosed with arterial hypertension."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_hypertensive_disorder_inthehistory
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have been diagnosed with arterial hypertension."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_atrial_fibrillation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with atrial fibrillation at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with atrial fibrillation at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with atrial fibrillation.","meaning":"Boolean indicating whether the patient has ever been diagnosed with atrial fibrillation in their medical history."}  ;; "if the patient does NOT have a history of diagnosis of atrial fibrillation"
(declare-const patient_has_undergone_12_lead_ecg_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a standard 12-lead electrocardiogram at the current study visit.","when_to_set_to_false":"Set to false if the patient has not undergone a standard 12-lead electrocardiogram at the current study visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a standard 12-lead electrocardiogram at the current study visit.","meaning":"Boolean indicating whether the patient has undergone a standard 12-lead electrocardiogram at the current study visit."}  ;; "standard 12-lead electrocardiogram"
(declare-const patient_has_undergone_12_lead_ecg_now@@decision_made_as_per_investigators_routine_practice Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a standard 12-lead electrocardiogram at the current study visit and the decision to perform the procedure was made as per the investigator's routine practice.","when_to_set_to_false":"Set to false if the patient has not undergone a standard 12-lead electrocardiogram at the current study visit, or if the decision to perform the procedure was not made as per the investigator's routine practice.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a standard 12-lead electrocardiogram at the current study visit and whether the decision to perform the procedure was made as per the investigator's routine practice.","meaning":"Boolean indicating whether the patient has undergone a standard 12-lead electrocardiogram at the current study visit and the decision to perform the procedure was made as per the investigator's routine practice."}  ;; "decision to perform electrocardiography testing ... standard 12-lead electrocardiogram ... made as per the investigator's routine practice"
(declare-const patient_has_undergone_ambulatory_ecg_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an ambulatory electrocardiogram at the current study visit.","when_to_set_to_false":"Set to false if the patient has not undergone an ambulatory electrocardiogram at the current study visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an ambulatory electrocardiogram at the current study visit.","meaning":"Boolean indicating whether the patient has undergone an ambulatory electrocardiogram at the current study visit."}  ;; "ambulatory electrocardiogram"
(declare-const patient_has_undergone_ambulatory_ecg_now@@decision_made_as_per_investigators_routine_practice Bool) ;; {"when_to_set_to_true":"Set to true if the decision to perform the ambulatory electrocardiogram at the current study visit was made as per the investigator's routine practice.","when_to_set_to_false":"Set to false if the decision to perform the ambulatory electrocardiogram at the current study visit was not made as per the investigator's routine practice.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the decision to perform the ambulatory electrocardiogram at the current study visit was made as per the investigator's routine practice.","meaning":"Boolean indicating whether the decision to perform the ambulatory electrocardiogram at the current study visit was made as per the investigator's routine practice."}  ;; "decision to perform electrocardiography testing ... ambulatory electrocardiogram ... made as per the investigator's routine practice"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_undergone_12_lead_ecg_now@@decision_made_as_per_investigators_routine_practice
         patient_has_undergone_12_lead_ecg_now)
     :named REQ2_AUXILIARY0)) ;; "decision to perform electrocardiography testing ... standard 12-lead electrocardiogram ... made as per the investigator's routine practice"

(assert
  (! (=> patient_has_undergone_ambulatory_ecg_now@@decision_made_as_per_investigators_routine_practice
         patient_has_undergone_ambulatory_ecg_now)
     :named REQ2_AUXILIARY1)) ;; "decision to perform electrocardiography testing ... ambulatory electrocardiogram ... made as per the investigator's routine practice"

;; Exhaustive subcategories: electrocardiography testing at study visit ≡ (12-lead OR ambulatory)
(declare-const patient_has_undergone_ecg_testing_at_study_visit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone either a standard 12-lead electrocardiogram or an ambulatory electrocardiogram at the current study visit.","when_to_set_to_false":"Set to false if the patient has not undergone either a standard 12-lead electrocardiogram or an ambulatory electrocardiogram at the current study visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone either a standard 12-lead electrocardiogram or an ambulatory electrocardiogram at the current study visit.","meaning":"Boolean indicating whether the patient has undergone electrocardiography testing (standard 12-lead or ambulatory) at the current study visit."}  ;; "electrocardiography testing (with exhaustive subcategories (standard 12-lead electrocardiogram OR ambulatory electrocardiogram)) at the study visit"
(assert
  (! (= patient_has_undergone_ecg_testing_at_study_visit_now
        (or patient_has_undergone_12_lead_ecg_now
            patient_has_undergone_ambulatory_ecg_now))
     :named REQ2_AUXILIARY2)) ;; "electrocardiography testing (with exhaustive subcategories (standard 12-lead electrocardiogram OR ambulatory electrocardiogram)) at the study visit"

;; Decision made as per investigator's routine practice for either ECG modality
(declare-const patient_has_undergone_ecg_testing_at_study_visit_now@@decision_made_as_per_investigators_routine_practice Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone either a standard 12-lead electrocardiogram or an ambulatory electrocardiogram at the current study visit, and the decision to perform the procedure was made as per the investigator's routine practice.","when_to_set_to_false":"Set to false if the patient has not undergone either a standard 12-lead electrocardiogram or an ambulatory electrocardiogram at the current study visit, or if the decision to perform the procedure was not made as per the investigator's routine practice.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone either a standard 12-lead electrocardiogram or an ambulatory electrocardiogram at the current study visit and whether the decision to perform the procedure was made as per the investigator's routine practice.","meaning":"Boolean indicating whether the patient has undergone electrocardiography testing (standard 12-lead or ambulatory) at the current study visit and the decision to perform the procedure was made as per the investigator's routine practice."}  ;; "decision to perform electrocardiography testing ... made as per the investigator's routine practice"
(assert
  (! (= patient_has_undergone_ecg_testing_at_study_visit_now@@decision_made_as_per_investigators_routine_practice
        (or patient_has_undergone_12_lead_ecg_now@@decision_made_as_per_investigators_routine_practice
            patient_has_undergone_ambulatory_ecg_now@@decision_made_as_per_investigators_routine_practice))
     :named REQ2_AUXILIARY3)) ;; "decision to perform electrocardiography testing ... made as per the investigator's routine practice"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_ecg_testing_at_study_visit_now@@decision_made_as_per_investigators_routine_practice
         patient_has_undergone_ecg_testing_at_study_visit_now)
     :named REQ2_AUXILIARY4)) ;; "decision to perform electrocardiography testing ... made as per the investigator's routine practice"

;; ===================== Constraint Assertions (REQ 2) =====================
;; If the patient does NOT have a history of diagnosis of atrial fibrillation, the decision to perform ECG testing (standard 12-lead or ambulatory) at the study visit must have been made as per the investigator's routine practice.
(assert
  (! (or patient_has_diagnosis_of_atrial_fibrillation_inthehistory
         patient_has_undergone_ecg_testing_at_study_visit_now@@decision_made_as_per_investigators_routine_practice)
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient does NOT have a history of diagnosis of atrial fibrillation, the decision to perform electrocardiography testing ... must have been made as per the investigator's routine practice"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_available_medical_records Bool) ;; {"when_to_set_to_true":"Set to true if the patient has medical records and those records are available for review.","when_to_set_to_false":"Set to false if the patient does not have medical records or the records are not available for review.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has available medical records.","meaning":"Boolean indicating whether the patient has medical records that are available for review."}  ;; "To be included, the patient must have available medical records."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_available_medical_records
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have available medical records."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_provided_written_signed_dated_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent and the consent document is written, signed, and dated.","when_to_set_to_false":"Set to false if the patient has not provided informed consent, or if the consent document is missing any of the following: written, signed, or dated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written, signed, and dated informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent that is written, signed, and dated."}  ;; "To be included, the patient must have provided written signed and dated informed consent."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_provided_written_signed_dated_informed_consent
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have provided written signed and dated informed consent."
