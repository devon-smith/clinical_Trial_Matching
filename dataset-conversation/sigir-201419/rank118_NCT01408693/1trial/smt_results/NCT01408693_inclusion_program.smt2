;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 60 years"
(declare-const patient_was_ambulatory_before_trauma Bool) ;; {"when_to_set_to_true":"Set to true if the patient was ambulatory before the trauma event, with or without use of walking aids.","when_to_set_to_false":"Set to false if the patient was not ambulatory before the trauma event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was ambulatory before the trauma event.","meaning":"Boolean indicating whether the patient was ambulatory before the trauma event, regardless of use of walking aids."}  ;; "have been ambulatory (with or without use of walking aids) before trauma"
(declare-const patient_was_ambulatory_before_trauma@@with_or_without_use_of_walking_aids Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ambulatory status before trauma includes both with and without use of walking aids.","when_to_set_to_false":"Set to false if the patient's ambulatory status before trauma does not include both with and without use of walking aids.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ambulatory status before trauma includes both with and without use of walking aids.","meaning":"Boolean indicating whether the patient's ambulatory status before trauma includes both with and without use of walking aids."}  ;; "ambulatory (with or without use of walking aids) before trauma"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_was_ambulatory_before_trauma@@with_or_without_use_of_walking_aids
         patient_was_ambulatory_before_trauma)
     :named REQ0_AUXILIARY0)) ;; "ambulatory (with or without use of walking aids) before trauma" implies "ambulatory before trauma"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be aged ≥ 60 years
(assert
  (! (>= patient_age_value_recorded_now_in_years 60.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be aged ≥ 60 years"

;; Component 1: patient must have been ambulatory (with or without use of walking aids) before trauma
(assert
  (! patient_was_ambulatory_before_trauma@@with_or_without_use_of_walking_aids
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have been ambulatory (with or without use of walking aids) before trauma"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_fracture_of_neck_of_femur_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of fracture of the neck of femur (femoral neck fracture).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of fracture of the neck of femur.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of fracture of the neck of femur.","meaning":"Boolean indicating whether the patient currently has a fracture of the neck of femur."}  ;; "femoral neck fracture"
(declare-const patient_has_finding_of_fracture_of_neck_of_femur_now@@eligible_for_hemiarthroplasty_per_university_hospital_basel_algorithm Bool) ;; {"when_to_set_to_true":"Set to true if the patient's femoral neck fracture is eligible for hemi-arthroplasty according to the algorithm used at University hospital Basel.","when_to_set_to_false":"Set to false if the patient's femoral neck fracture is not eligible for hemi-arthroplasty according to the algorithm used at University hospital Basel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's femoral neck fracture is eligible for hemi-arthroplasty per the algorithm.","meaning":"Boolean indicating whether the patient's femoral neck fracture is eligible for hemi-arthroplasty per the University hospital Basel algorithm."}  ;; "eligible for hemi-arthroplasty in accordance with the algorithm for patients with femoral neck fracture used at the University hospital Basel"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable (if eligible for hemi-arthroplasty per algorithm, must have femoral neck fracture)
(assert
  (! (=> patient_has_finding_of_fracture_of_neck_of_femur_now@@eligible_for_hemiarthroplasty_per_university_hospital_basel_algorithm
         patient_has_finding_of_fracture_of_neck_of_femur_now)
     :named REQ1_AUXILIARY0)) ;; "eligible for hemi-arthroplasty in accordance with the algorithm for patients with femoral neck fracture used at the University hospital Basel" implies "femoral neck fracture"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have femoral neck fracture eligible for hemi-arthroplasty per algorithm
(assert
  (! patient_has_finding_of_fracture_of_neck_of_femur_now@@eligible_for_hemiarthroplasty_per_university_hospital_basel_algorithm
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have a femoral neck fracture eligible for hemi-arthroplasty in accordance with the algorithm for patients with femoral neck fracture used at the University hospital Basel"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_provided_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent.","when_to_set_to_false":"Set to false if the patient has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent."}  ;; "the patient must provide informed consent"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_provided_informed_consent
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must provide informed consent"
