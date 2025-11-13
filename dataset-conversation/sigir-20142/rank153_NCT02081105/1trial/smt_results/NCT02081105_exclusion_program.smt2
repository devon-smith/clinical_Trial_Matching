;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_pneumothorax_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumothorax.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumothorax.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pneumothorax.","meaning":"Boolean indicating whether the patient currently has pneumothorax."} ;; "pneumothorax"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_pneumothorax_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pneumothorax."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_pleural_effusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pleural effusion.","when_to_set_to_false":"Set to false if the patient currently does not have pleural effusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pleural effusion.","meaning":"Boolean indicating whether the patient currently has pleural effusion."} ;; "pleural effusion"

(declare-const patient_has_pleural_effusion_now@@measured_by_ultrasonography Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pleural effusion is identified or confirmed by ultrasonography.","when_to_set_to_false":"Set to false if the patient's current pleural effusion is not identified or confirmed by ultrasonography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pleural effusion is identified or confirmed by ultrasonography.","meaning":"Boolean indicating whether the patient's current pleural effusion is identified or confirmed by ultrasonography."} ;; "as measured by ultrasonography"

(declare-const patient_pleural_effusion_value_recorded_now_withunit_milliliters Real) ;; {"when_to_set_to_value":"Set to the measured estimated volume in milliliters if pleural effusion is present and its volume is measured by ultrasonography now.","when_to_set_to_null":"Set to null if no such measurement is available now, or if pleural effusion is not present, or if measurement by ultrasonography is not performed.","meaning":"Numeric value representing the patient's current estimated pleural effusion volume measured by ultrasonography, in milliliters."} ;; "estimated volume > 500 milliliters as measured by ultrasonography"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_pleural_effusion_now@@measured_by_ultrasonography
      patient_has_pleural_effusion_now)
:named REQ1_AUXILIARY0)) ;; "pleural effusion measured by ultrasonography implies pleural effusion"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have pleural effusion measured by ultrasonography with volume > 500 mL
(assert
(! (not (and patient_has_pleural_effusion_now@@measured_by_ultrasonography
             (> patient_pleural_effusion_value_recorded_now_withunit_milliliters 500)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pleural effusion with estimated volume > 500 milliliters as measured by ultrasonography."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_surgical_procedure_on_thorax_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure on the thorax within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure on the thorax within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure on the thorax within the past 3 months.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure on the thorax within the past 3 months."} ;; "thoracic surgery within the last 3 months"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_surgical_procedure_on_thorax_inthepast3months)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had thoracic surgery within the last 3 months."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_can_undergo_plain_chest_x_ray_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can currently undergo a plain chest X-ray (i.e., no contraindication exists).","when_to_set_to_false":"Set to false if the patient currently cannot undergo a plain chest X-ray due to a contraindication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo a plain chest X-ray.","meaning":"Boolean indicating whether the patient can currently undergo a plain chest X-ray."} ;; "chest X-ray"
(declare-const patient_has_contraindication_to_chest_x_ray_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to chest X-ray.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to chest X-ray.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to chest X-ray.","meaning":"Boolean indicating whether the patient currently has a contraindication to chest X-ray."} ;; "contraindication to chest X-ray"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Contraindication to chest X-ray means the patient cannot undergo the procedure
(assert
(! (= patient_has_contraindication_to_chest_x_ray_now
    (not patient_can_undergo_plain_chest_x_ray_now))
:named REQ3_AUXILIARY0)) ;; "contraindication to chest X-ray" defines inability to undergo chest X-ray

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_contraindication_to_chest_x_ray_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to chest X-ray."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_contraindication_to_positive_end_expiratory_pressure_value_of_15_centimeters_of_water_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to positive end-expiratory pressure (PEEP) of 15 centimeters of water.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to positive end-expiratory pressure (PEEP) of 15 centimeters of water.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to positive end-expiratory pressure (PEEP) of 15 centimeters of water.","meaning":"Boolean indicating whether the patient currently has a contraindication to positive end-expiratory pressure (PEEP) of 15 centimeters of water."} ;; "contraindication to positive end-expiratory pressure of 15 centimeters of water"

(declare-const patient_positive_end_expiratory_pressure_value_recorded_now_withunit_centimeters_of_water Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current positive end-expiratory pressure (PEEP) in centimeters of water is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current positive end-expiratory pressure (PEEP) in centimeters of water."} ;; "positive end-expiratory pressure"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_contraindication_to_positive_end_expiratory_pressure_value_of_15_centimeters_of_water_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to positive end-expiratory pressure of 15 centimeters of water."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not (or patient_has_contraindication_to_positive_end_expiratory_pressure_value_of_15_centimeters_of_water_now
              positive_end_expiratory_pressure_value_mandated_now_in_centimeters_of_water))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a contraindication to positive end-expiratory pressure of 15 centimeters of water) OR (positive end-expiratory pressure of 15 centimeters of water is mandated for the patient)."
