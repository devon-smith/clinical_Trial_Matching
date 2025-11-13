;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "less than eighteen years old"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is less than eighteen years old."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_spinal_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a confirmed diagnosis of spinal injury.","when_to_set_to_false":"Set to false if the patient currently does not have a confirmed diagnosis of spinal injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a confirmed diagnosis of spinal injury.","meaning":"Boolean indicating whether the patient currently has a confirmed diagnosis of spinal injury."} ;; "actual spinal injury"
(declare-const patient_has_suspicion_of_spinal_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have a spinal injury.","when_to_set_to_false":"Set to false if the patient is currently not suspected to have a spinal injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have a spinal injury.","meaning":"Boolean indicating whether the patient is currently suspected to have a spinal injury."} ;; "suspected spinal injury"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_suspicion_of_spinal_injury_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a suspected spinal injury."

(assert
(! (not patient_has_diagnosis_of_spinal_injury_now)
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an actual spinal injury."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_pressure_ulcer_of_sacral_region_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a sacral pressure ulcer at any time in their history prior to study entry.","when_to_set_to_false":"Set to false if the patient has never had a sacral pressure ulcer at any time in their history prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a sacral pressure ulcer in their history.","meaning":"Boolean indicating whether the patient has ever had a sacral pressure ulcer in their history."} ;; "pre-existing sacral pressure ulcer"
(declare-const patient_has_finding_of_pressure_ulcer_of_heel_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a heel pressure ulcer at any time in their history prior to study entry.","when_to_set_to_false":"Set to false if the patient has never had a heel pressure ulcer at any time in their history prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a heel pressure ulcer in their history.","meaning":"Boolean indicating whether the patient has ever had a heel pressure ulcer in their history."} ;; "pre-existing heel pressure ulcer"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_pressure_ulcer_of_sacral_region_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a pre-existing sacral pressure ulcer."

(assert
(! (not patient_has_finding_of_pressure_ulcer_of_heel_inthehistory)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a pre-existing heel pressure ulcer."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_traumatic_injury_of_sacrum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of traumatic injury of the sacrum.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of traumatic injury of the sacrum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of traumatic injury of the sacrum.","meaning":"Boolean indicating whether the patient currently has a traumatic injury of the sacrum."} ;; "trauma to the sacral area"
(declare-const patient_has_finding_of_heel_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of heel injury.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of heel injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of heel injury.","meaning":"Boolean indicating whether the patient currently has a heel injury."} ;; "trauma to the heel area"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_finding_of_traumatic_injury_of_sacrum_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has trauma to the sacral area."

(assert
  (! (not patient_has_finding_of_heel_injury_now)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has trauma to the heel area."
