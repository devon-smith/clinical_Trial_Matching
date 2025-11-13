;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "greater than seventy-five years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (> patient_age_value_recorded_now_in_years 75))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is greater than seventy-five years of age."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_exposed_to_metal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any metal (regardless of location or type).","when_to_set_to_false":"Set to false if the patient is currently not exposed to any metal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any metal.","meaning":"Boolean indicating whether the patient is currently exposed to metal (of any kind or location)."} ;; "presence of metal"
(declare-const patient_is_exposed_to_metal_now@@located_in_head Bool) ;; {"when_to_set_to_true":"Set to true if the metal exposure is specifically located in the head.","when_to_set_to_false":"Set to false if the metal exposure is not located in the head.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the metal exposure is located in the head.","meaning":"Boolean indicating whether the metal exposure is located in the head."} ;; "metal in the head"
(declare-const patient_is_exposed_to_metal_now@@excludes_dental_hardware Bool) ;; {"when_to_set_to_true":"Set to true if dental hardware is excluded from the definition of metal exposure in the head.","when_to_set_to_false":"Set to false if dental hardware is not excluded from the definition of metal exposure in the head.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether dental hardware is excluded from the definition of metal exposure in the head.","meaning":"Boolean indicating whether dental hardware is excluded from the definition of metal exposure in the head."} ;; "other than dental hardware"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_metal_now@@located_in_head
      patient_is_exposed_to_metal_now)
   :named REQ1_AUXILIARY0)) ;; "metal in the head"

(assert
(! (=> patient_is_exposed_to_metal_now@@excludes_dental_hardware
      patient_is_exposed_to_metal_now@@located_in_head)
   :named REQ1_AUXILIARY1)) ;; "other than dental hardware"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_exposed_to_metal_now@@excludes_dental_hardware)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has presence of metal in the head other than dental hardware."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_broken_skin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of broken skin.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of broken skin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of broken skin.","meaning":"Boolean indicating whether the patient currently has broken skin."} ;; "broken skin"
(declare-const patient_has_finding_of_broken_skin_now@@located_in_area_of_stimulating_electrodes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's broken skin is located in the area of the stimulating electrodes.","when_to_set_to_false":"Set to false if the patient's broken skin is not located in the area of the stimulating electrodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's broken skin is located in the area of the stimulating electrodes.","meaning":"Boolean indicating whether the patient's broken skin is located in the area of the stimulating electrodes."} ;; "broken skin in the area of the stimulating electrodes"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_broken_skin_now@@located_in_area_of_stimulating_electrodes
       patient_has_finding_of_broken_skin_now)
   :named REQ2_AUXILIARY0)) ;; "broken skin in the area of the stimulating electrodes" implies "broken skin"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_broken_skin_now@@located_in_area_of_stimulating_electrodes)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has broken skin in the area of the stimulating electrodes."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_behavioral_disorder_that_makes_testing_impossible_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any behavioral disorder that makes testing impossible.","when_to_set_to_false":"Set to false if the patient currently does not have any behavioral disorder that makes testing impossible.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any behavioral disorder that makes testing impossible.","meaning":"Boolean indicating whether the patient currently has any behavioral disorder that makes testing impossible."} ;; "has any behavioral disorder that makes testing impossible"
(declare-const patient_has_behavioral_disorder_that_makes_testing_impossible_now@@makes_testing_impossible Bool) ;; {"when_to_set_to_true":"Set to true if the behavioral disorder present in the patient makes testing impossible.","when_to_set_to_false":"Set to false if the behavioral disorder present in the patient does not make testing impossible.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the behavioral disorder present in the patient makes testing impossible.","meaning":"Boolean indicating whether the behavioral disorder present in the patient makes testing impossible."} ;; "that makes testing impossible"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_behavioral_disorder_that_makes_testing_impossible_now@@makes_testing_impossible
      patient_has_behavioral_disorder_that_makes_testing_impossible_now)
:named REQ3_AUXILIARY0)) ;; "that makes testing impossible"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_behavioral_disorder_that_makes_testing_impossible_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any behavioral disorder that makes testing impossible."

;; ===================== Constraint Assertions (REQ 4) =====================
;; "The patient is excluded if the patient is a child."
;; Here, we operationalize "child" as age < 18 years (unless otherwise specified in the protocol).
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a child."
