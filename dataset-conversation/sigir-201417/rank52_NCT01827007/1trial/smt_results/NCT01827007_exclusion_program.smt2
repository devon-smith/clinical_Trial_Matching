;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_contraindication_to_elevation_of_positive_end_expiratory_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication to elevation of positive end-expiratory pressure (PEEP), including but not limited to elevated intracranial pressure, pulmonary hypertension, or other relevant contraindications.","when_to_set_to_false":"Set to false if the patient currently does not have any contraindication to elevation of positive end-expiratory pressure (PEEP).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication to elevation of positive end-expiratory pressure (PEEP).","meaning":"Boolean indicating whether the patient currently has any contraindication to elevation of positive end-expiratory pressure (PEEP), including but not limited to elevated intracranial pressure, pulmonary hypertension, or other relevant contraindications."} ;; "contraindication to elevation of positive end-expiratory pressure"

(declare-const patient_has_contraindication_to_elevation_of_positive_end_expiratory_pressure_now@@other_contraindication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's contraindication to elevation of positive end-expiratory pressure (PEEP) is due to another relevant contraindication not specified as elevated intracranial pressure or pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient's contraindication to elevation of positive end-expiratory pressure (PEEP) is not due to another relevant contraindication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's contraindication to elevation of positive end-expiratory pressure (PEEP) is due to another relevant contraindication.","meaning":"Boolean indicating whether the patient's contraindication to elevation of positive end-expiratory pressure (PEEP) is due to another relevant contraindication not specified as elevated intracranial pressure or pulmonary hypertension."} ;; "other contraindication to elevation of positive end-expiratory pressure"

(declare-const patient_has_finding_of_pulmonary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pulmonary hypertension.","meaning":"Boolean indicating whether the patient currently has pulmonary hypertension."} ;; "pulmonary hypertension"

(declare-const patient_has_finding_of_raised_intracranial_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of raised intracranial pressure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of raised intracranial pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of raised intracranial pressure.","meaning":"Boolean indicating whether the patient currently has raised intracranial pressure."} ;; "elevated intracranial pressure"

(declare-const patients_positive_end_expiratory_pressure_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has positive end-expiratory pressure (PEEP) applied.","when_to_set_to_false":"Set to false if the patient currently does not have positive end-expiratory pressure (PEEP) applied.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has positive end-expiratory pressure (PEEP) applied.","meaning":"Boolean indicating whether the patient currently has positive end-expiratory pressure (PEEP) applied."} ;; "positive end-expiratory pressure"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_raised_intracranial_pressure_now
          patient_has_finding_of_pulmonary_hypertension_now
          patient_has_contraindication_to_elevation_of_positive_end_expiratory_pressure_now@@other_contraindication)
    patient_has_contraindication_to_elevation_of_positive_end_expiratory_pressure_now)
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples ((elevated intracranial pressure) OR (pulmonary hypertension) OR (other contraindication to elevation of positive end-expiratory pressure))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_contraindication_to_elevation_of_positive_end_expiratory_pressure_now@@other_contraindication
    patient_has_contraindication_to_elevation_of_positive_end_expiratory_pressure_now)
:named REQ0_AUXILIARY1)) ;; "other contraindication to elevation of positive end-expiratory pressure"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_contraindication_to_elevation_of_positive_end_expiratory_pressure_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to elevation of positive end-expiratory pressure with non-exhaustive examples ((elevated intracranial pressure) OR (pulmonary hypertension) OR (other contraindication to elevation of positive end-expiratory pressure))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_contraindication_to_fluid_challenge_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to fluid challenge.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to fluid challenge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to fluid challenge.","meaning":"Boolean indicating whether the patient currently has a contraindication to fluid challenge."} ;; "contraindication to fluid challenge"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_contraindication_to_fluid_challenge_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to fluid challenge."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_contraindication_to_transesophageal_echocardiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to transesophageal echocardiography.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to transesophageal echocardiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to transesophageal echocardiography.","meaning":"Boolean indicating whether the patient currently has a contraindication to transesophageal echocardiography."} ;; "contraindication to transesophageal echocardiography"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_contraindication_to_transesophageal_echocardiography_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to transesophageal echocardiography."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had heart failure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had heart failure in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had heart failure.","meaning":"Boolean indicating whether the patient has ever had heart failure in the past."} ;; "previous heart failure"
(declare-const patient_has_finding_of_heart_valve_stenosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had heart valve stenosis at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had heart valve stenosis in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had heart valve stenosis.","meaning":"Boolean indicating whether the patient has ever had heart valve stenosis in the past."} ;; "previous heart valve stenosis"
(declare-const patient_has_finding_of_heart_valve_regurgitation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had heart valve regurgitation (insufficiency) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had heart valve regurgitation (insufficiency) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had heart valve regurgitation (insufficiency).","meaning":"Boolean indicating whether the patient has ever had heart valve regurgitation (insufficiency) in the past."} ;; "previous heart valve insufficiency"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_finding_of_heart_failure_inthehistory)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous heart failure."

(assert
  (! (not patient_has_finding_of_heart_valve_stenosis_inthehistory)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous heart valve stenosis."

(assert
  (! (not patient_has_finding_of_heart_valve_regurgitation_inthehistory)
     :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous heart valve insufficiency."
