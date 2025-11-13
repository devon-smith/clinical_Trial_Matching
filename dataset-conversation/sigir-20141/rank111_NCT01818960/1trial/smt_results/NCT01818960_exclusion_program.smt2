;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "age less than or equal to 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (<= patient_age_value_recorded_now_in_years 18))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is age less than or equal to 18 years."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass graft surgery at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass graft surgery prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass graft surgery prior to now.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass graft surgery at any time in the past."} ;; "coronary artery bypass graft surgery"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior coronary artery bypass graft surgery."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_thrombolytic_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone administration of thrombolytic therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone administration of thrombolytic therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone administration of thrombolytic therapy.","meaning":"Boolean indicating whether the patient has ever undergone thrombolytic therapy at any time in the past."} ;; "thrombolytic therapy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_thrombolytic_therapy_inthehistory)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received administration of thrombolytic therapy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_stenosis_of_artery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a stenosis of an artery.","when_to_set_to_false":"Set to false if the patient currently does not have a stenosis of an artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a stenosis of an artery.","meaning":"Boolean indicating whether the patient currently has a stenosis of an artery."} ;; "artery stenosis"
(declare-const patient_has_finding_of_stenosis_of_artery_now@@non_infarct_related Bool) ;; {"when_to_set_to_true":"Set to true if the patient's artery stenosis is non-infarct-related.","when_to_set_to_false":"Set to false if the patient's artery stenosis is infarct-related.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the artery stenosis is non-infarct-related.","meaning":"Boolean indicating whether the patient's artery stenosis is non-infarct-related."} ;; "non-infarct-related artery stenosis"
(declare-const patient_has_finding_of_stenosis_of_artery_now@@chronic_total_occlusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient's artery stenosis is a chronic total occlusion.","when_to_set_to_false":"Set to false if the patient's artery stenosis is not a chronic total occlusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the artery stenosis is a chronic total occlusion.","meaning":"Boolean indicating whether the patient's artery stenosis is a chronic total occlusion."} ;; "chronic total occlusion"
(declare-const patient_has_finding_of_stenosis_of_artery_now@@located_in_left_main_artery Bool) ;; {"when_to_set_to_true":"Set to true if the patient's artery stenosis is located in the left main artery.","when_to_set_to_false":"Set to false if the patient's artery stenosis is not located in the left main artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the artery stenosis is located in the left main artery.","meaning":"Boolean indicating whether the patient's artery stenosis is located in the left main artery."} ;; "located in the left main artery"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_stenosis_of_artery_now@@non_infarct_related
       patient_has_finding_of_stenosis_of_artery_now)
   :named REQ3_AUXILIARY0)) ;; "non-infarct-related artery stenosis"

(assert
(! (=> patient_has_finding_of_stenosis_of_artery_now@@chronic_total_occlusion
       patient_has_finding_of_stenosis_of_artery_now)
   :named REQ3_AUXILIARY1)) ;; "chronic total occlusion"

(assert
(! (=> patient_has_finding_of_stenosis_of_artery_now@@located_in_left_main_artery
       patient_has_finding_of_stenosis_of_artery_now)
   :named REQ3_AUXILIARY2)) ;; "located in the left main artery"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have a non-infarct-related artery stenosis that is a chronic total occlusion
(assert
(! (not (and patient_has_finding_of_stenosis_of_artery_now@@non_infarct_related
             patient_has_finding_of_stenosis_of_artery_now@@chronic_total_occlusion))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a non-infarct-related artery stenosis that is a chronic total occlusion."

;; Exclusion: patient must NOT have a non-infarct-related artery stenosis that is located in the left main artery
(assert
(! (not (and patient_has_finding_of_stenosis_of_artery_now@@non_infarct_related
             patient_has_finding_of_stenosis_of_artery_now@@located_in_left_main_artery))
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a non-infarct-related artery stenosis that is located in the left main artery."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_hemodynamic_instability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hemodynamic instability.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hemodynamic instability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hemodynamic instability.","meaning":"Boolean indicating whether the patient currently has hemodynamic instability."} ;; "hemodynamic instability"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current systolic blood pressure in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in millimeters of mercury."} ;; "systolic blood pressure less than 90 millimeters of mercury"
(declare-const patient_killip_class_value_recorded_now Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current Killip class is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current Killip class."} ;; "Killip class greater than or equal to 2"
(declare-const patient_is_exposed_to_inotropic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being administered an inotropic agent.","when_to_set_to_false":"Set to false if the patient is currently not being administered an inotropic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being administered an inotropic agent.","meaning":"Boolean indicating whether the patient is currently exposed to (administered) an inotropic agent."} ;; "need for administration of inotropic agent"
(declare-const patient_is_exposed_to_vasopressor_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being administered a vasopressor agent.","when_to_set_to_false":"Set to false if the patient is currently not being administered a vasopressor agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being administered a vasopressor agent.","meaning":"Boolean indicating whether the patient is currently exposed to (administered) a vasopressor agent."} ;; "need for administration of vasopressor agent"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not (and patient_has_finding_of_hemodynamic_instability_now
               (< patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 90)))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hemodynamic instability evidenced by systolic blood pressure less than 90 millimeters of mercury."

(assert
  (! (not (and patient_has_finding_of_hemodynamic_instability_now
               (>= patient_killip_class_value_recorded_now 2)))
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hemodynamic instability evidenced by Killip class greater than or equal to 2."

(assert
  (! (not (and patient_has_finding_of_hemodynamic_instability_now
               patient_is_exposed_to_inotropic_agent_now))
     :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hemodynamic instability evidenced by need for administration of inotropic agent."

(assert
  (! (not (and patient_has_finding_of_hemodynamic_instability_now
               patient_is_exposed_to_vasopressor_agent_now))
     :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hemodynamic instability evidenced by need for administration of vasopressor agent."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_renal_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal insufficiency.","meaning":"Boolean indicating whether the patient currently has renal insufficiency."} ;; "renal insufficiency"
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current estimated glomerular filtration rate in milliliters per minute is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current estimated glomerular filtration rate in milliliters per minute."} ;; "glomerular filtration rate"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not (and patient_has_finding_of_renal_insufficiency_now
               (< patient_glomerular_filtration_rate_value_recorded_now_withunit_milliliters_per_minute 50)))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known renal insufficiency with estimated glomerular filtration rate less than 50 milliliters per minute."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_can_undergo_cardiac_mri_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo cardiac magnetic resonance imaging (cardiac MRI), i.e., has no contraindication to the procedure.","when_to_set_to_false":"Set to false if the patient cannot currently undergo cardiac magnetic resonance imaging (cardiac MRI), i.e., has a contraindication to the procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo cardiac magnetic resonance imaging (cardiac MRI).","meaning":"Boolean indicating whether the patient can currently undergo cardiac magnetic resonance imaging (cardiac MRI)."} ;; "contraindication to cardiac magnetic resonance imaging"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_can_undergo_cardiac_mri_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to cardiac magnetic resonance imaging."
