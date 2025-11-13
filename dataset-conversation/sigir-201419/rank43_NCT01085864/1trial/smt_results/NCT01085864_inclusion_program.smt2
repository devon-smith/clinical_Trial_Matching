;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 85 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 85)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 85 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_been_referred_to_oncologist_for_evaluation_of_peripheral_lung_nodules_found_on_ct_scan Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been referred to oncologists specifically for the evaluation of peripheral lung nodules found on CT scan.","when_to_set_to_false":"Set to false if the patient has not been referred to oncologists for the evaluation of peripheral lung nodules found on CT scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been referred to oncologists for the evaluation of peripheral lung nodules found on CT scan.","meaning":"Boolean indicating whether the patient has been referred to oncologists for the evaluation of peripheral lung nodules found on CT scan."} // "referred to oncologists for the evaluation of peripheral lung nodules found on computerized tomography scan"
(declare-const patient_has_been_referred_to_pulmonologist_for_evaluation_of_peripheral_lung_nodules_found_on_ct_scan Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been referred to pulmonologists specifically for the evaluation of peripheral lung nodules found on CT scan.","when_to_set_to_false":"Set to false if the patient has not been referred to pulmonologists for the evaluation of peripheral lung nodules found on CT scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been referred to pulmonologists for the evaluation of peripheral lung nodules found on CT scan.","meaning":"Boolean indicating whether the patient has been referred to pulmonologists for the evaluation of peripheral lung nodules found on CT scan."} // "referred to pulmonologists for the evaluation of peripheral lung nodules found on computerized tomography scan"
(declare-const patient_has_been_referred_to_thoracic_surgeon_for_evaluation_of_peripheral_lung_nodules_found_on_ct_scan Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been referred to thoracic surgeons specifically for the evaluation of peripheral lung nodules found on CT scan.","when_to_set_to_false":"Set to false if the patient has not been referred to thoracic surgeons for the evaluation of peripheral lung nodules found on CT scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been referred to thoracic surgeons for the evaluation of peripheral lung nodules found on CT scan.","meaning":"Boolean indicating whether the patient has been referred to thoracic surgeons for the evaluation of peripheral lung nodules found on CT scan."} // "referred to thoracic surgeons for the evaluation of peripheral lung nodules found on computerized tomography scan"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must be ((referred to pulmonologists for the evaluation of peripheral lung nodules found on computerized tomography scan) OR (referred to oncologists for the evaluation of peripheral lung nodules found on computerized tomography scan) OR (referred to thoracic surgeons for the evaluation of peripheral lung nodules found on computerized tomography scan)).
(assert
  (! (or patient_has_been_referred_to_pulmonologist_for_evaluation_of_peripheral_lung_nodules_found_on_ct_scan
         patient_has_been_referred_to_oncologist_for_evaluation_of_peripheral_lung_nodules_found_on_ct_scan
         patient_has_been_referred_to_thoracic_surgeon_for_evaluation_of_peripheral_lung_nodules_found_on_ct_scan)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be ((referred to pulmonologists for the evaluation of peripheral lung nodules found on computerized tomography scan) OR (referred to oncologists for the evaluation of peripheral lung nodules found on computerized tomography scan) OR (referred to thoracic surgeons for the evaluation of peripheral lung nodules found on computerized tomography scan))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_undergone_computerized_axial_tomography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone computerized axial tomography (CT) scans.","when_to_set_to_false":"Set to false if the patient has not currently undergone computerized axial tomography (CT) scans.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone computerized axial tomography (CT) scans.","meaning":"Boolean indicating whether the patient has currently undergone computerized axial tomography (CT) scans."} // "repeat computerized tomography scans"
(declare-const patient_has_undergone_computerized_axial_tomography_now@@clinically_indicated_to_determine_etiology_of_nodule Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone computerized axial tomography (CT) scans and the procedure was clinically indicated to determine the etiology of the nodule.","when_to_set_to_false":"Set to false if the patient has currently undergone computerized axial tomography (CT) scans but the procedure was not clinically indicated to determine the etiology of the nodule.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the CT scan was clinically indicated to determine the etiology of the nodule.","meaning":"Boolean indicating whether the CT scan was clinically indicated to determine the etiology of the nodule."} // "repeat computerized tomography scans clinically indicated to determine the etiology of the nodule"
(declare-const patient_has_undergone_biopsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone biopsy.","when_to_set_to_false":"Set to false if the patient has not currently undergone biopsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone biopsy.","meaning":"Boolean indicating whether the patient has currently undergone biopsy."} // "biopsy"
(declare-const patient_has_undergone_biopsy_now@@clinically_indicated_to_determine_etiology_of_nodule Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone biopsy and the procedure was clinically indicated to determine the etiology of the nodule.","when_to_set_to_false":"Set to false if the patient has currently undergone biopsy but the procedure was not clinically indicated to determine the etiology of the nodule.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biopsy was clinically indicated to determine the etiology of the nodule.","meaning":"Boolean indicating whether the biopsy was clinically indicated to determine the etiology of the nodule."} // "biopsy clinically indicated to determine the etiology of the nodule"
(declare-const patient_has_undergone_excision_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone surgical excision.","when_to_set_to_false":"Set to false if the patient has not currently undergone surgical excision.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone surgical excision.","meaning":"Boolean indicating whether the patient has currently undergone surgical excision."} // "surgical excision"
(declare-const patient_has_undergone_excision_now@@clinically_indicated_to_determine_etiology_of_nodule Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone surgical excision and the procedure was clinically indicated to determine the etiology of the nodule.","when_to_set_to_false":"Set to false if the patient has currently undergone surgical excision but the procedure was not clinically indicated to determine the etiology of the nodule.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical excision was clinically indicated to determine the etiology of the nodule.","meaning":"Boolean indicating whether the surgical excision was clinically indicated to determine the etiology of the nodule."} // "surgical excision clinically indicated to determine the etiology of the nodule"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_undergone_computerized_axial_tomography_now@@clinically_indicated_to_determine_etiology_of_nodule
         patient_has_undergone_computerized_axial_tomography_now)
     :named REQ2_AUXILIARY0)) ;; "repeat computerized tomography scans clinically indicated to determine the etiology of the nodule"

(assert
  (! (=> patient_has_undergone_biopsy_now@@clinically_indicated_to_determine_etiology_of_nodule
         patient_has_undergone_biopsy_now)
     :named REQ2_AUXILIARY1)) ;; "biopsy clinically indicated to determine the etiology of the nodule"

(assert
  (! (=> patient_has_undergone_excision_now@@clinically_indicated_to_determine_etiology_of_nodule
         patient_has_undergone_excision_now)
     :named REQ2_AUXILIARY2)) ;; "surgical excision clinically indicated to determine the etiology of the nodule"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (or patient_has_undergone_computerized_axial_tomography_now@@clinically_indicated_to_determine_etiology_of_nodule
         patient_has_undergone_biopsy_now@@clinically_indicated_to_determine_etiology_of_nodule
         patient_has_undergone_excision_now@@clinically_indicated_to_determine_etiology_of_nodule)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have repeat computerized tomography scans clinically indicated to determine the etiology of the nodule) OR (have biopsy clinically indicated to determine the etiology of the nodule) OR (have surgical excision clinically indicated to determine the etiology of the nodule))."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const lung_nodule_greatest_diameter_value_recorded_now_in_millimeters Real) ;; {"when_to_set_to_value":"Set to the numeric value (in millimeters) of the greatest diameter of a lung nodule, as recorded at the current time.","when_to_set_to_null":"Set to null if the greatest diameter of a lung nodule is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the greatest diameter of a lung nodule, recorded now, in millimeters."} // "greatest diameter of a lung nodule, recorded at the current time, in millimeters"
(declare-const patient_has_at_least_one_lung_nodule_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one lung nodule.","when_to_set_to_false":"Set to false if the patient currently does not have any lung nodules.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has at least one lung nodule.","meaning":"Boolean indicating whether the patient currently has at least one lung nodule."} // "patient currently has at least one lung nodule"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: At least one lung nodule with greatest diameter ≥ 8 millimeters
(assert
  (! (and patient_has_at_least_one_lung_nodule_now
          (>= lung_nodule_greatest_diameter_value_recorded_now_in_millimeters 8.0))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "at least one lung nodule with greatest diameter ≥ 8 millimeters"

;; Component 1: At least one lung nodule with greatest diameter ≤ 30 millimeters
(assert
  (! (and patient_has_at_least_one_lung_nodule_now
          (<= lung_nodule_greatest_diameter_value_recorded_now_in_millimeters 30.0))
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "at least one lung nodule with greatest diameter ≤ 30 millimeters"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_fully_informed_of_investigational_nature_of_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently fully informed of the investigational nature of the procedure.","when_to_set_to_false":"Set to false if the patient is currently not fully informed of the investigational nature of the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently fully informed of the investigational nature of the procedure.","meaning":"Boolean indicating whether the patient is currently fully informed of the investigational nature of the procedure."} // "be fully informed of the investigational nature of the procedure"
(declare-const patient_has_signed_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently signed an informed consent.","when_to_set_to_false":"Set to false if the patient has not currently signed an informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently signed an informed consent.","meaning":"Boolean indicating whether the patient has currently signed an informed consent."} // "sign an informed consent"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_fully_informed_of_investigational_nature_of_procedure_now
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be fully informed of the investigational nature of the procedure"
(assert
  (! patient_has_signed_informed_consent_now
     :named REQ4_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "sign an informed consent"
