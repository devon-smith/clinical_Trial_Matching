;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "age ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age ≥ 18 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (solid organ cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (solid organ cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (solid organ cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (solid organ cancer)."} // "To be included, the patient must have (histologically proven solid organ cancer)."
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@histologically_proven Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant neoplastic disease (solid organ cancer) is histologically proven.","when_to_set_to_false":"Set to false if the patient's diagnosis of malignant neoplastic disease (solid organ cancer) is not histologically proven.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is histologically proven.","meaning":"Boolean indicating whether the patient's diagnosis of malignant neoplastic disease (solid organ cancer) is histologically proven."} // "To be included, the patient must have (histologically proven solid organ cancer)."

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@histologically_proven
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ1_AUXILIARY0)) ;; "To be included, the patient must have (histologically proven solid organ cancer)."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_malignant_neoplastic_disease_now@@histologically_proven
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (histologically proven solid organ cancer)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const eastern_cooperative_oncology_group_performance_status_value_recorded_now_withunit_integer Int) ;; {"when_to_set_to_value":"Set to the integer value (0, 1, or 2) that represents the patient's ECOG performance status as recorded now.","when_to_set_to_null":"Set to null if the ECOG performance status is unknown, not documented, or cannot be determined.","meaning":"Numeric variable representing the patient's ECOG performance status value as recorded now, with unit as integer."} // "Eastern Cooperative Oncology Group performance status = 0, 1, or 2"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (or (= eastern_cooperative_oncology_group_performance_status_value_recorded_now_withunit_integer 0)
         (= eastern_cooperative_oncology_group_performance_status_value_recorded_now_withunit_integer 1)
         (= eastern_cooperative_oncology_group_performance_status_value_recorded_now_withunit_integer 2))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (Eastern Cooperative Oncology Group performance status = 0) OR (Eastern Cooperative Oncology Group performance status = 1) OR (Eastern Cooperative Oncology Group performance status = 2)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_longevity_value_recorded_now_withunit_months Real) ;; {"when_to_set_to_value":"Set to the measured or estimated value if the patient's current life expectancy in months is available.","when_to_set_to_null":"Set to null if no such measurement or estimate is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current life expectancy in months."} // "life expectancy > 3 months"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (> patient_longevity_value_recorded_now_withunit_months 3.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (life expectancy > 3 months)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_exposed_to_fluorouracil_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to fluorouracil.","when_to_set_to_false":"Set to false if the patient is currently not exposed to fluorouracil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to fluorouracil.","meaning":"Boolean indicating whether the patient is currently exposed to fluorouracil."} // "fluorouracil"
(declare-const patient_is_exposed_to_fluorouracil_now@@administered_as_part_of_first_line_first_cycle_chemotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to fluorouracil and the exposure is as part of a first line and first cycle chemotherapy regimen.","when_to_set_to_false":"Set to false if the patient is currently exposed to fluorouracil but not as part of a first line and first cycle chemotherapy regimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to fluorouracil is as part of a first line and first cycle chemotherapy regimen.","meaning":"Boolean indicating whether the patient is currently exposed to fluorouracil as part of a first line and first cycle chemotherapy regimen."} // "fluorouracil as part of first line, first cycle chemotherapy"
(declare-const patient_is_exposed_to_folinic_acid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to folinic acid.","when_to_set_to_false":"Set to false if the patient is currently not exposed to folinic acid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to folinic acid.","meaning":"Boolean indicating whether the patient is currently exposed to folinic acid."} // "folinic acid"
(declare-const patient_is_exposed_to_folinic_acid_now@@administered_as_part_of_first_line_first_cycle_chemotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to folinic acid and the exposure is as part of a first line and first cycle chemotherapy regimen.","when_to_set_to_false":"Set to false if the patient is currently exposed to folinic acid but not as part of a first line and first cycle chemotherapy regimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to folinic acid is as part of a first line and first cycle chemotherapy regimen.","meaning":"Boolean indicating whether the patient is currently exposed to folinic acid as part of a first line and first cycle chemotherapy regimen."} // "folinic acid as part of first line, first cycle chemotherapy"
(declare-const patient_is_exposed_to_irinotecan_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to irinotecan.","when_to_set_to_false":"Set to false if the patient is currently not exposed to irinotecan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to irinotecan.","meaning":"Boolean indicating whether the patient is currently exposed to irinotecan."} // "irinotecan"
(declare-const patient_is_exposed_to_irinotecan_now@@administered_as_part_of_first_line_first_cycle_chemotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to irinotecan and the exposure is as part of a first line and first cycle chemotherapy regimen.","when_to_set_to_false":"Set to false if the patient is currently exposed to irinotecan but not as part of a first line and first cycle chemotherapy regimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to irinotecan is as part of a first line and first cycle chemotherapy regimen.","meaning":"Boolean indicating whether the patient is currently exposed to irinotecan as part of a first line and first cycle chemotherapy regimen."} // "irinotecan as part of first line, first cycle chemotherapy"
(declare-const patient_is_exposed_to_oxaliplatin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to oxaliplatin.","when_to_set_to_false":"Set to false if the patient is currently not exposed to oxaliplatin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to oxaliplatin.","meaning":"Boolean indicating whether the patient is currently exposed to oxaliplatin."} // "oxaliplatin"
(declare-const patient_is_exposed_to_oxaliplatin_now@@administered_as_part_of_first_line_first_cycle_chemotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to oxaliplatin and the exposure is as part of a first line and first cycle chemotherapy regimen.","when_to_set_to_false":"Set to false if the patient is currently exposed to oxaliplatin but not as part of a first line and first cycle chemotherapy regimen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to oxaliplatin is as part of a first line and first cycle chemotherapy regimen.","meaning":"Boolean indicating whether the patient is currently exposed to oxaliplatin as part of a first line and first cycle chemotherapy regimen."} // "oxaliplatin as part of first line, first cycle chemotherapy"
(declare-const patient_is_scheduled_to_receive_first_line_first_cycle_folinic_acid_fluorouracil_irinotecan_chemotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to receive first line and first cycle folinic acid, fluorouracil, and irinotecan chemotherapy.","when_to_set_to_false":"Set to false if the patient is not scheduled to receive first line and first cycle folinic acid, fluorouracil, and irinotecan chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to receive first line and first cycle folinic acid, fluorouracil, and irinotecan chemotherapy.","meaning":"Boolean indicating whether the patient is scheduled to receive first line and first cycle folinic acid, fluorouracil, and irinotecan chemotherapy."} // "scheduled to receive first line, first cycle folinic acid, fluorouracil, and irinotecan chemotherapy"
(declare-const patient_is_scheduled_to_receive_first_line_first_cycle_folinic_acid_fluorouracil_oxaliplatin_chemotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to receive first line and first cycle folinic acid, fluorouracil, and oxaliplatin chemotherapy.","when_to_set_to_false":"Set to false if the patient is not scheduled to receive first line and first cycle folinic acid, fluorouracil, and oxaliplatin chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to receive first line and first cycle folinic acid, fluorouracil, and oxaliplatin chemotherapy.","meaning":"Boolean indicating whether the patient is scheduled to receive first line and first cycle folinic acid, fluorouracil, and oxaliplatin chemotherapy."} // "scheduled to receive first line, first cycle folinic acid, fluorouracil, and oxaliplatin chemotherapy"
(declare-const patient_is_undergoing_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing chemotherapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing chemotherapy.","meaning":"Boolean indicating whether the patient is currently undergoing chemotherapy."} // "chemotherapy"
(declare-const patient_is_undergoing_chemotherapy_now@@first_line_first_cycle Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing chemotherapy and the chemotherapy is first line and first cycle.","when_to_set_to_false":"Set to false if the patient is currently undergoing chemotherapy but it is not first line and first cycle.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy is first line and first cycle.","meaning":"Boolean indicating whether the patient is currently undergoing chemotherapy as first line and first cycle."} // "chemotherapy as first line, first cycle"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_is_exposed_to_fluorouracil_now@@administered_as_part_of_first_line_first_cycle_chemotherapy
         patient_is_exposed_to_fluorouracil_now)
     :named REQ4_AUXILIARY0)) ;; "fluorouracil as part of first line, first cycle chemotherapy"

(assert
  (! (=> patient_is_exposed_to_folinic_acid_now@@administered_as_part_of_first_line_first_cycle_chemotherapy
         patient_is_exposed_to_folinic_acid_now)
     :named REQ4_AUXILIARY1)) ;; "folinic acid as part of first line, first cycle chemotherapy"

(assert
  (! (=> patient_is_exposed_to_irinotecan_now@@administered_as_part_of_first_line_first_cycle_chemotherapy
         patient_is_exposed_to_irinotecan_now)
     :named REQ4_AUXILIARY2)) ;; "irinotecan as part of first line, first cycle chemotherapy"

(assert
  (! (=> patient_is_exposed_to_oxaliplatin_now@@administered_as_part_of_first_line_first_cycle_chemotherapy
         patient_is_exposed_to_oxaliplatin_now)
     :named REQ4_AUXILIARY3)) ;; "oxaliplatin as part of first line, first cycle chemotherapy"

;; Definitions for scheduled chemotherapy regimens
(assert
  (! (= patient_is_scheduled_to_receive_first_line_first_cycle_folinic_acid_fluorouracil_oxaliplatin_chemotherapy
        (and patient_is_exposed_to_folinic_acid_now@@administered_as_part_of_first_line_first_cycle_chemotherapy
             patient_is_exposed_to_fluorouracil_now@@administered_as_part_of_first_line_first_cycle_chemotherapy
             patient_is_exposed_to_oxaliplatin_now@@administered_as_part_of_first_line_first_cycle_chemotherapy))
     :named REQ4_AUXILIARY4)) ;; "scheduled to receive first line, first cycle folinic acid, fluorouracil, and oxaliplatin chemotherapy"

(assert
  (! (= patient_is_scheduled_to_receive_first_line_first_cycle_folinic_acid_fluorouracil_irinotecan_chemotherapy
        (and patient_is_exposed_to_folinic_acid_now@@administered_as_part_of_first_line_first_cycle_chemotherapy
             patient_is_exposed_to_fluorouracil_now@@administered_as_part_of_first_line_first_cycle_chemotherapy
             patient_is_exposed_to_irinotecan_now@@administered_as_part_of_first_line_first_cycle_chemotherapy))
     :named REQ4_AUXILIARY5)) ;; "scheduled to receive first line, first cycle folinic acid, fluorouracil, and irinotecan chemotherapy"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (or patient_is_scheduled_to_receive_first_line_first_cycle_folinic_acid_fluorouracil_oxaliplatin_chemotherapy
         patient_is_scheduled_to_receive_first_line_first_cycle_folinic_acid_fluorouracil_irinotecan_chemotherapy)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (scheduled to receive (first line AND first cycle folinic acid, fluorouracil, and oxaliplatin chemotherapy) OR (first line AND first cycle folinic acid, fluorouracil, and irinotecan chemotherapy))."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_signed_informed_consent_for_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed an informed consent for participation in the study.","when_to_set_to_false":"Set to false if the patient has not signed an informed consent for participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed an informed consent for participation in the study.","meaning":"Boolean indicating whether the patient has signed an informed consent for participation in the study."} // "sign an informed consent indicating that the patient is aware of the investigational nature of the study in keeping with the policy of the hospital"
(declare-const patient_has_signed_informed_consent_for_study_participation@@indicates_patient_awareness_of_investigational_nature_per_hospital_policy Bool) ;; {"when_to_set_to_true":"Set to true if the signed informed consent explicitly indicates that the patient is aware of the investigational nature of the study, in keeping with the policy of the hospital.","when_to_set_to_false":"Set to false if the signed informed consent does not indicate that the patient is aware of the investigational nature of the study, or is not in keeping with the policy of the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the signed informed consent indicates patient awareness of the investigational nature of the study per hospital policy.","meaning":"Boolean indicating whether the signed informed consent explicitly indicates patient awareness of the investigational nature of the study per hospital policy."} // "sign an informed consent indicating that the patient is aware of the investigational nature of the study in keeping with the policy of the hospital"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_signed_informed_consent_for_study_participation@@indicates_patient_awareness_of_investigational_nature_per_hospital_policy
         patient_has_signed_informed_consent_for_study_participation)
     :named REQ5_AUXILIARY0)) ;; "sign an informed consent indicating that the patient is aware of the investigational nature of the study in keeping with the policy of the hospital"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_signed_informed_consent_for_study_participation@@indicates_patient_awareness_of_investigational_nature_per_hospital_policy
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "sign an informed consent indicating that the patient is aware of the investigational nature of the study in keeping with the policy of the hospital"
