;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_active_acute_graft_versus_host_disease_grade_ii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active acute graft-versus-host disease of grade II.","when_to_set_to_false":"Set to false if the patient currently does not have active acute graft-versus-host disease of grade II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active acute graft-versus-host disease of grade II.","meaning":"Boolean indicating whether the patient currently has active acute graft-versus-host disease of grade II."} ;; "the patient has active acute graft-versus-host disease grade II"

(declare-const patient_has_active_acute_graft_versus_host_disease_grade_iii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active acute graft-versus-host disease of grade III.","when_to_set_to_false":"Set to false if the patient currently does not have active acute graft-versus-host disease of grade III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active acute graft-versus-host disease of grade III.","meaning":"Boolean indicating whether the patient currently has active acute graft-versus-host disease of grade III."} ;; "the patient has active acute graft-versus-host disease grade III"

(declare-const patient_has_active_acute_graft_versus_host_disease_grade_iv_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active acute graft-versus-host disease of grade IV.","when_to_set_to_false":"Set to false if the patient currently does not have active acute graft-versus-host disease of grade IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active acute graft-versus-host disease of grade IV.","meaning":"Boolean indicating whether the patient currently has active acute graft-versus-host disease of grade IV."} ;; "the patient has active acute graft-versus-host disease grade IV"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_active_acute_graft_versus_host_disease_grade_ii_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active acute graft-versus-host disease grade II."

(assert
  (! (not patient_has_active_acute_graft_versus_host_disease_grade_iii_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active acute graft-versus-host disease grade III."

(assert
  (! (not patient_has_active_acute_graft_versus_host_disease_grade_iv_now)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active acute graft-versus-host disease grade IV."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_bacterial_infectious_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a bacterial infectious disease.","when_to_set_to_false":"Set to false if the patient currently does not have a bacterial infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a bacterial infectious disease.","meaning":"Boolean indicating whether the patient currently has a bacterial infectious disease."} ;; "bacterial infection"
(declare-const patient_has_finding_of_bacterial_infectious_disease_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a bacterial infectious disease and the infection is uncontrolled.","when_to_set_to_false":"Set to false if the patient currently has a bacterial infectious disease and the infection is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bacterial infectious disease is uncontrolled.","meaning":"Boolean indicating whether the patient's current bacterial infectious disease is uncontrolled."} ;; "uncontrolled bacterial infection"
(declare-const patient_has_finding_of_mycosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mycosis (fungal infection).","when_to_set_to_false":"Set to false if the patient currently does not have a mycosis (fungal infection).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mycosis (fungal infection).","meaning":"Boolean indicating whether the patient currently has a mycosis (fungal infection)."} ;; "fungal infection"
(declare-const patient_has_finding_of_mycosis_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mycosis (fungal infection) and the infection is uncontrolled.","when_to_set_to_false":"Set to false if the patient currently has a mycosis (fungal infection) and the infection is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mycosis (fungal infection) is uncontrolled.","meaning":"Boolean indicating whether the patient's current mycosis (fungal infection) is uncontrolled."} ;; "uncontrolled fungal infection"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_bacterial_infectious_disease_now@@uncontrolled
      patient_has_finding_of_bacterial_infectious_disease_now)
   :named REQ1_AUXILIARY0)) ;; "uncontrolled bacterial infection"

(assert
(! (=> patient_has_finding_of_mycosis_now@@uncontrolled
      patient_has_finding_of_mycosis_now)
   :named REQ1_AUXILIARY1)) ;; "uncontrolled fungal infection"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_bacterial_infectious_disease_now@@uncontrolled)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an uncontrolled bacterial infection."

(assert
(! (not patient_has_finding_of_mycosis_now@@uncontrolled)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an uncontrolled fungal infection."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (malignancy)."} ;; "malignancy"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_relapse Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of malignant neoplastic disease is a relapse.","when_to_set_to_false":"Set to false if the patient's current diagnosis of malignant neoplastic disease is not a relapse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current diagnosis of malignant neoplastic disease is a relapse.","meaning":"Boolean indicating whether the patient's current diagnosis of malignant neoplastic disease is a relapse."} ;; "relapse of malignancy"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of malignant neoplastic disease is uncontrolled.","when_to_set_to_false":"Set to false if the patient's current diagnosis of malignant neoplastic disease is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current diagnosis of malignant neoplastic disease is uncontrolled.","meaning":"Boolean indicating whether the patient's current diagnosis of malignant neoplastic disease is uncontrolled."} ;; "uncontrolled malignancy"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_relapse
      patient_has_diagnosis_of_malignant_neoplastic_disease_now)
:named REQ2_AUXILIARY0)) ;; "relapse of malignancy"

(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_uncontrolled
      patient_has_diagnosis_of_malignant_neoplastic_disease_now)
:named REQ2_AUXILIARY1)) ;; "uncontrolled malignancy"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have an uncontrolled relapse of malignancy
(assert
(! (not (and patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_relapse
             patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_uncontrolled))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an uncontrolled relapse of malignancy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_taken_lymphocyte_immunoglobulin_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received anti-thymocyte globulin (lymphocyte immunoglobulin containing product) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never received anti-thymocyte globulin (lymphocyte immunoglobulin containing product) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received anti-thymocyte globulin (lymphocyte immunoglobulin containing product) at any time in the past.","meaning":"Boolean indicating whether the patient has ever received anti-thymocyte globulin (lymphocyte immunoglobulin containing product) at any time in the past."} ;; "the patient has received an infusion of anti-thymocyte globulin"
(declare-const patient_has_taken_lymphocyte_immunoglobulin_containing_product_inthehistory@@received_as_infusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient received anti-thymocyte globulin (lymphocyte immunoglobulin containing product) by infusion.","when_to_set_to_false":"Set to false if the patient received anti-thymocyte globulin (lymphocyte immunoglobulin containing product) by a route other than infusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product was received by infusion.","meaning":"Boolean indicating whether the product was received by infusion."} ;; "the patient has received an infusion of anti-thymocyte globulin"
(declare-const patient_is_exposed_to_alemtuzumab_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to alemtuzumab at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to alemtuzumab at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to alemtuzumab at any time in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to alemtuzumab at any time in the past."} ;; "the patient has received an infusion of alemtuzumab"
(declare-const patient_is_exposed_to_alemtuzumab_inthehistory@@received_as_infusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to alemtuzumab by infusion.","when_to_set_to_false":"Set to false if the patient was exposed to alemtuzumab by a route other than infusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was by infusion.","meaning":"Boolean indicating whether the exposure was by infusion."} ;; "the patient has received an infusion of alemtuzumab"
(declare-const patient_is_exposed_to_alemtuzumab_inthehistory@@temporalcontext_within2weeks_of_viral_specific_t_cell_infusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to alemtuzumab within two weeks of viral specific T-cell infusion.","when_to_set_to_false":"Set to false if the patient was exposed to alemtuzumab outside the two-week window of viral specific T-cell infusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within two weeks of viral specific T-cell infusion.","meaning":"Boolean indicating whether the exposure occurred within two weeks of viral specific T-cell infusion."} ;; "the patient has received an infusion of alemtuzumab within two weeks of viral specific T-cell infusion"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable for anti-thymocyte globulin infusion implies stem variable
(assert
(! (=> patient_has_taken_lymphocyte_immunoglobulin_containing_product_inthehistory@@received_as_infusion
       patient_has_taken_lymphocyte_immunoglobulin_containing_product_inthehistory)
   :named REQ3_AUXILIARY0)) ;; "the patient has received an infusion of anti-thymocyte globulin"

;; Qualifier variable for alemtuzumab infusion implies stem variable
(assert
(! (=> patient_is_exposed_to_alemtuzumab_inthehistory@@received_as_infusion
       patient_is_exposed_to_alemtuzumab_inthehistory)
   :named REQ3_AUXILIARY1)) ;; "the patient has received an infusion of alemtuzumab"

;; Temporal context qualifier for alemtuzumab implies stem variable
(assert
(! (=> patient_is_exposed_to_alemtuzumab_inthehistory@@temporalcontext_within2weeks_of_viral_specific_t_cell_infusion
       patient_is_exposed_to_alemtuzumab_inthehistory)
   :named REQ3_AUXILIARY2)) ;; "the patient has received an infusion of alemtuzumab within two weeks of viral specific T-cell infusion"

;; Both qualifiers (infusion and temporal context) together imply both stem and each other
(assert
(! (=> (and patient_is_exposed_to_alemtuzumab_inthehistory@@received_as_infusion
            patient_is_exposed_to_alemtuzumab_inthehistory@@temporalcontext_within2weeks_of_viral_specific_t_cell_infusion)
       (and patient_is_exposed_to_alemtuzumab_inthehistory
            patient_is_exposed_to_alemtuzumab_inthehistory@@received_as_infusion
            patient_is_exposed_to_alemtuzumab_inthehistory@@temporalcontext_within2weeks_of_viral_specific_t_cell_infusion))
   :named REQ3_AUXILIARY3)) ;; "the patient has received an infusion of alemtuzumab within two weeks of viral specific T-cell infusion"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient has received an infusion of anti-thymocyte globulin
(assert
(! (not patient_has_taken_lymphocyte_immunoglobulin_containing_product_inthehistory@@received_as_infusion)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has received an infusion of anti-thymocyte globulin"

;; Exclusion: patient has received an infusion of alemtuzumab within two weeks of viral specific T-cell infusion
(assert
(! (not (and patient_is_exposed_to_alemtuzumab_inthehistory@@received_as_infusion
             patient_is_exposed_to_alemtuzumab_inthehistory@@temporalcontext_within2weeks_of_viral_specific_t_cell_infusion))
   :named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has received an infusion of alemtuzumab within two weeks of viral specific T-cell infusion"
