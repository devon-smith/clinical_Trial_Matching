;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_lung_mass_value_recorded_now_withunit_millimeters Real) ;; {"when_to_set_to_value":"Set to the measured greatest dimension in millimeters if a lung mass is present and its largest dimension is recorded now.","when_to_set_to_null":"Set to null if no lung mass is present, no measurement is available, or the value is indeterminate.","meaning":"Numeric value representing the greatest dimension (in millimeters) of any lung mass present in the patient now."} ;; "lung masses with greatest dimension > 30 millimeters"
(declare-const patient_lung_nodule_value_recorded_now_withunit_millimeters Real) ;; {"when_to_set_to_value":"Set to the measured greatest dimension in millimeters if a lung nodule is present and its largest dimension is recorded now.","when_to_set_to_null":"Set to null if no lung nodule is present, no measurement is available, or the value is indeterminate.","meaning":"Numeric value representing the greatest dimension (in millimeters) of any lung nodule present in the patient now."} ;; "lung nodules with greatest dimension > 30 millimeters"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (> patient_lung_nodule_value_recorded_now_withunit_millimeters 30))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has lung nodules with greatest dimension > 30 millimeters."

(assert
  (! (not (> patient_lung_mass_value_recorded_now_withunit_millimeters 30))
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has lung masses with greatest dimension > 30 millimeters."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_multiple_nodules_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of multiple nodules of the lung.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of multiple nodules of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has multiple nodules of the lung.","meaning":"Boolean indicating whether the patient currently has multiple nodules of the lung."} ;; "lung nodules"
(declare-const patient_has_finding_of_multiple_nodules_of_lung_now@@has_solid_calcification Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current multiple lung nodules have solid calcification.","when_to_set_to_false":"Set to false if the patient's current multiple lung nodules do not have solid calcification.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current multiple lung nodules have solid calcification.","meaning":"Boolean indicating whether the patient's current multiple lung nodules have solid calcification."} ;; "lung nodules with solid calcification"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_multiple_nodules_of_lung_now@@has_solid_calcification
      patient_has_finding_of_multiple_nodules_of_lung_now)
   :named REQ1_AUXILIARY0)) ;; "lung nodules with solid calcification" implies "lung nodules"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_multiple_nodules_of_lung_now@@has_solid_calcification)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has lung nodules with solid calcification."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_lung_nodule_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lung nodule.","when_to_set_to_false":"Set to false if the patient currently does not have a lung nodule.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient currently has a lung nodule.","meaning":"Boolean indicating whether the patient currently has a lung nodule."} ;; "lung nodules"
(declare-const patient_has_finding_of_lung_mass_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lung mass.","when_to_set_to_false":"Set to false if the patient currently does not have a lung mass.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient currently has a lung mass.","meaning":"Boolean indicating whether the patient currently has a lung mass."} ;; "lung masses"
(declare-const patient_has_finding_of_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an obstruction.","when_to_set_to_false":"Set to false if the patient currently does not have an obstruction.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient currently has an obstruction.","meaning":"Boolean indicating whether the patient currently has an obstruction."} ;; "obstruction"
(declare-const patient_has_finding_of_obstruction_now@@partial Bool) ;; {"when_to_set_to_true":"Set to true if the obstruction is partial.","when_to_set_to_false":"Set to false if the obstruction is not partial.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the obstruction is partial.","meaning":"Boolean indicating whether the obstruction is partial."} ;; "partial obstruction"
(declare-const patient_has_finding_of_obstruction_now@@complete Bool) ;; {"when_to_set_to_true":"Set to true if the obstruction is complete.","when_to_set_to_false":"Set to false if the obstruction is not complete.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the obstruction is complete.","meaning":"Boolean indicating whether the obstruction is complete."} ;; "complete obstruction"
(declare-const patient_has_finding_of_obstruction_now@@located_in_lobar_bronchus Bool) ;; {"when_to_set_to_true":"Set to true if the obstruction is located in a lobar bronchus.","when_to_set_to_false":"Set to false if the obstruction is not located in a lobar bronchus.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the obstruction is located in a lobar bronchus.","meaning":"Boolean indicating whether the obstruction is located in a lobar bronchus."} ;; "obstruction of a lobar bronchus"
(declare-const patient_has_finding_of_obstruction_now@@located_in_main_stem_bronchus Bool) ;; {"when_to_set_to_true":"Set to true if the obstruction is located in a main stem bronchus.","when_to_set_to_false":"Set to false if the obstruction is not located in a main stem bronchus.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the obstruction is located in a main stem bronchus.","meaning":"Boolean indicating whether the obstruction is located in a main stem bronchus."} ;; "obstruction of a main stem bronchus"
(declare-const patient_has_finding_of_obstruction_now@@located_in_trachea Bool) ;; {"when_to_set_to_true":"Set to true if the obstruction is located in the trachea.","when_to_set_to_false":"Set to false if the obstruction is not located in the trachea.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the obstruction is located in the trachea.","meaning":"Boolean indicating whether the obstruction is located in the trachea."} ;; "obstruction of the trachea"
(declare-const patient_has_undergone_computerized_axial_tomography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a computed tomography (CT) scan now.","when_to_set_to_false":"Set to false if the patient has not undergone a computed tomography (CT) scan now.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has undergone a computed tomography (CT) scan now.","meaning":"Boolean indicating whether the patient has undergone a computed tomography (CT) scan now."} ;; "computed tomography"

;; ===================== Constraint Assertions (REQ 2) =====================
;; "The patient is excluded if ((the patient has lung nodules with computed tomography evidence of partial obstruction of a lobar bronchus) ... etc.)"
(assert
(! (not (or
  (and patient_has_finding_of_lung_nodule_now
       patient_has_undergone_computerized_axial_tomography_now
       patient_has_finding_of_obstruction_now@@partial
       patient_has_finding_of_obstruction_now@@located_in_lobar_bronchus)
  ;; 2
  (and patient_has_finding_of_lung_nodule_now
       patient_has_undergone_computerized_axial_tomography_now
       patient_has_finding_of_obstruction_now@@complete
       patient_has_finding_of_obstruction_now@@located_in_lobar_bronchus)
  ;; 3
  (and patient_has_finding_of_lung_nodule_now
       patient_has_undergone_computerized_axial_tomography_now
       patient_has_finding_of_obstruction_now@@partial
       patient_has_finding_of_obstruction_now@@located_in_main_stem_bronchus)
  ;; 4
  (and patient_has_finding_of_lung_nodule_now
       patient_has_undergone_computerized_axial_tomography_now
       patient_has_finding_of_obstruction_now@@complete
       patient_has_finding_of_obstruction_now@@located_in_main_stem_bronchus)
  ;; 5
  (and patient_has_finding_of_lung_nodule_now
       patient_has_undergone_computerized_axial_tomography_now
       patient_has_finding_of_obstruction_now@@partial
       patient_has_finding_of_obstruction_now@@located_in_trachea)
  ;; 6
  (and patient_has_finding_of_lung_nodule_now
       patient_has_undergone_computerized_axial_tomography_now
       patient_has_finding_of_obstruction_now@@complete
       patient_has_finding_of_obstruction_now@@located_in_trachea)
  ;; 7
  (and patient_has_finding_of_lung_mass_now
       patient_has_undergone_computerized_axial_tomography_now
       patient_has_finding_of_obstruction_now@@partial
       patient_has_finding_of_obstruction_now@@located_in_lobar_bronchus)
  ;; 8
  (and patient_has_finding_of_lung_mass_now
       patient_has_undergone_computerized_axial_tomography_now
       patient_has_finding_of_obstruction_now@@complete
       patient_has_finding_of_obstruction_now@@located_in_lobar_bronchus)
  ;; 9
  (and patient_has_finding_of_lung_mass_now
       patient_has_undergone_computerized_axial_tomography_now
       patient_has_finding_of_obstruction_now@@partial
       patient_has_finding_of_obstruction_now@@located_in_main_stem_bronchus)
  ;; 10
  (and patient_has_finding_of_lung_mass_now
       patient_has_undergone_computerized_axial_tomography_now
       patient_has_finding_of_obstruction_now@@complete
       patient_has_finding_of_obstruction_now@@located_in_main_stem_bronchus)
  ;; 11
  (and patient_has_finding_of_lung_mass_now
       patient_has_undergone_computerized_axial_tomography_now
       patient_has_finding_of_obstruction_now@@partial
       patient_has_finding_of_obstruction_now@@located_in_trachea)
  ;; 12
  (and patient_has_finding_of_lung_mass_now
       patient_has_undergone_computerized_axial_tomography_now
       patient_has_finding_of_obstruction_now@@complete
       patient_has_finding_of_obstruction_now@@located_in_trachea)
))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has lung nodules with computed tomography evidence of partial obstruction of a lobar bronchus) OR ... etc.)"

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplastic disease (cancer) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplastic disease (cancer) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplastic disease (cancer) in their history."} ;; "history of prior cancer"

(declare-const patient_has_diagnosis_of_malignant_neoplasm_of_skin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplasm of skin (skin cancer) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplasm of skin (skin cancer) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant neoplasm of skin (skin cancer).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplasm of skin (skin cancer) in their history."} ;; "skin cancer"

(declare-const patient_has_diagnosis_of_malignant_neoplasm_of_skin_inthehistory@@non_melanoma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of malignant neoplasm of skin (skin cancer) in their history is non-melanoma.","when_to_set_to_false":"Set to false if the patient's diagnosis of malignant neoplasm of skin (skin cancer) in their history is melanoma or not non-melanoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the skin cancer diagnosis is non-melanoma.","meaning":"Boolean indicating whether the patient's skin cancer diagnosis in their history is non-melanoma."} ;; "non-melanoma skin cancer"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplasm_of_skin_inthehistory@@non_melanoma
       patient_has_diagnosis_of_malignant_neoplasm_of_skin_inthehistory)
:named REQ3_AUXILIARY0)) ;; "non-melanoma skin cancer is a type of skin cancer"

;; Skin cancer is a type of cancer
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplasm_of_skin_inthehistory
       patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
:named REQ3_AUXILIARY1)) ;; "skin cancer is a type of cancer"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient is excluded if they have a history of prior cancer, except if the only prior cancer is non-melanoma skin cancer
(assert
(! (not
      (or
        (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
        ;; Only prior cancer is non-melanoma skin cancer
        (and
          patient_has_diagnosis_of_malignant_neoplasm_of_skin_inthehistory@@non_melanoma
          (= patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory
             patient_has_diagnosis_of_malignant_neoplasm_of_skin_inthehistory)
        )
      )
   )
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of prior cancer, EXCEPT if the only prior cancer is non-melanoma skin cancer."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_longevity_value_recorded_now_withunit_months Real) ;; {"when_to_set_to_value":"Set to the patient's estimated life expectancy in months if such a value is currently available.","when_to_set_to_null":"Set to null if the patient's current life expectancy in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current life expectancy in months."} ;; "life expectancy < 6 months"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (< patient_longevity_value_recorded_now_withunit_months 6))
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has life expectancy < 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_given_oral_consent_for_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has given oral consent for participation in the study.","when_to_set_to_false":"Set to false if the patient has not given oral consent for participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has given oral consent for participation in the study.","meaning":"Boolean indicating whether the patient has given oral consent for participation in the study."} ;; "the patient does NOT give oral consent for participation"
(declare-const patient_has_given_written_consent_for_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has given written consent for participation in the study.","when_to_set_to_false":"Set to false if the patient has not given written consent for participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has given written consent for participation in the study.","meaning":"Boolean indicating whether the patient has given written consent for participation in the study."} ;; "the patient does NOT give written consent for participation"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_given_oral_consent_for_participation)
    :named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient does NOT give oral consent for participation"

(assert
(! (not patient_has_given_written_consent_for_participation)
    :named REQ5_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient does NOT give written consent for participation"
