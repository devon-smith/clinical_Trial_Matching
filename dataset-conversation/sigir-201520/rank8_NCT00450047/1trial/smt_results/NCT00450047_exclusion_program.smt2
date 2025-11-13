;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_undergoing_risk_management_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing management of a medical risk.","when_to_set_to_false":"Set to false if the patient is not currently undergoing management of a medical risk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing management of a medical risk.","meaning":"Boolean indicating whether the patient is currently undergoing management of a medical risk."} ;; "requires management of a medical risk"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_undergoing_risk_management_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires management of a medical risk."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_disorder_of_musculoskeletal_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the musculoskeletal system (orthopedic disease).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the musculoskeletal system (orthopedic disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the musculoskeletal system (orthopedic disease).","meaning":"Boolean indicating whether the patient currently has a disorder of the musculoskeletal system (orthopedic disease)."} ;; "orthopedic disease"
(declare-const patient_has_finding_of_disorder_of_musculoskeletal_system_now@@located_in_lower_extremities Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disorder of the musculoskeletal system (orthopedic disease) is located in the lower extremities.","when_to_set_to_false":"Set to false if the patient's disorder of the musculoskeletal system (orthopedic disease) is not located in the lower extremities.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder of the musculoskeletal system (orthopedic disease) is located in the lower extremities.","meaning":"Boolean indicating whether the patient's disorder of the musculoskeletal system (orthopedic disease) is located in the lower extremities."} ;; "orthopedic disease of the lower extremities"
(declare-const patient_has_finding_of_surgical_disease_of_lower_extremities_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a surgical disease of the lower extremities.","when_to_set_to_false":"Set to false if the patient currently does not have a surgical disease of the lower extremities.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a surgical disease of the lower extremities.","meaning":"Boolean indicating whether the patient currently has a surgical disease of the lower extremities."} ;; "surgical disease of the lower extremities"
(declare-const patient_has_finding_of_paralysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has paralysis.","when_to_set_to_false":"Set to false if the patient currently does not have paralysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has paralysis.","meaning":"Boolean indicating whether the patient currently has paralysis."} ;; "central nerve paralysis"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_musculoskeletal_system_now@@located_in_lower_extremities
      patient_has_finding_of_disorder_of_musculoskeletal_system_now)
:named REQ1_AUXILIARY0)) ;; "orthopedic disease of the lower extremities"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have impaired ability to pedal the ergometer because of (an orthopedic disease of the lower extremities OR a surgical disease of the lower extremities OR central nerve paralysis)
(assert
(! (not (or patient_has_finding_of_disorder_of_musculoskeletal_system_now@@located_in_lower_extremities
            patient_has_finding_of_surgical_disease_of_lower_extremities_now
            patient_has_finding_of_paralysis_now))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has impaired ability to pedal the ergometer because of (an orthopedic disease of the lower extremities OR a surgical disease of the lower extremities OR central nerve paralysis)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_history_of_bicycle_use_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever used or ridden a bicycle at any point in their life.","when_to_set_to_false":"Set to false if the patient has never used or ridden a bicycle at any point in their life.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever used or ridden a bicycle.","meaning":"Boolean indicating whether the patient has ever used or ridden a bicycle at any point in their life."} ;; "has never been on a bicycle"
(declare-const patient_is_capable_of_pedaling_well_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of pedaling well.","when_to_set_to_false":"Set to false if the patient is currently incapable of pedaling well.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently capable of pedaling well.","meaning":"Boolean indicating whether the patient is currently capable of pedaling well."} ;; "is incapable of pedaling well"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and (not patient_has_history_of_bicycle_use_ever)
             (not patient_is_capable_of_pedaling_well_now)))
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "A patient is excluded if the patient has never been on a bicycle and is incapable of pedaling well."
