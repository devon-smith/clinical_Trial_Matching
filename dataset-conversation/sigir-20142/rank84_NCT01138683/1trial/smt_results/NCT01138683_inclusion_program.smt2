;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "older than 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be older than 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of cardiac ejection fraction recorded now is available.","when_to_set_to_null":"Set to null if no such percentage measurement recorded now is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current cardiac ejection fraction."} // "ejection fraction"
(declare-const patient_has_finding_of_systolic_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of systolic heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of systolic heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has systolic heart failure.","meaning":"Boolean indicating whether the patient currently has systolic heart failure."} // "systolic heart failure"
(declare-const patient_has_finding_of_systolic_heart_failure_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's systolic heart failure is classified as severe.","when_to_set_to_false":"Set to false if the patient's systolic heart failure is not classified as severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's systolic heart failure is severe.","meaning":"Boolean indicating whether the patient's systolic heart failure is severe."} // "severe systolic heart failure"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for severe implies stem variable for systolic heart failure
(assert
  (! (=> patient_has_finding_of_systolic_heart_failure_now@@severe
         patient_has_finding_of_systolic_heart_failure_now)
     :named REQ1_AUXILIARY0)) ;; "severe systolic heart failure"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have severe systolic heart failure AND ejection fraction < 40%
(assert
  (! (and patient_has_finding_of_systolic_heart_failure_now@@severe
          (< patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent 40.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "severe systolic heart failure with ejection fraction less than 40 percent"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_been_hospitalized_for_decompensated_heart_failure_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been hospitalized specifically for decompensated heart failure at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been hospitalized specifically for decompensated heart failure at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been hospitalized specifically for decompensated heart failure.","meaning":"Boolean indicating whether the patient has ever been hospitalized specifically for decompensated heart failure in their medical history."} // "must have been hospitalized for decompensated heart failure"
(declare-const patient_has_finding_of_decompensated_cardiac_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with decompensated heart failure at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with decompensated heart failure at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with decompensated heart failure.","meaning":"Boolean indicating whether the patient has ever been diagnosed with decompensated heart failure in their medical history."} // "decompensated heart failure"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; If the patient has been hospitalized for decompensated heart failure, they must have a history of decompensated heart failure
(assert
  (! (=> patient_has_been_hospitalized_for_decompensated_heart_failure_in_the_history
         patient_has_finding_of_decompensated_cardiac_failure_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "must have been hospitalized for decompensated heart failure" implies "history of decompensated heart failure"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_been_hospitalized_for_decompensated_heart_failure_in_the_history
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must have been hospitalized for decompensated heart failure"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_classified_as_nyha_class_iii_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as NYHA class III.","when_to_set_to_false":"Set to false if the patient is currently not classified as NYHA class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as NYHA class III.","meaning":"Boolean indicating whether the patient is currently classified as NYHA class III."} // "classified as New York Heart Association class III"
(declare-const patient_is_classified_as_nyha_class_iv_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as NYHA class IV.","when_to_set_to_false":"Set to false if the patient is currently not classified as NYHA class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as NYHA class IV.","meaning":"Boolean indicating whether the patient is currently classified as NYHA class IV."} // "classified as New York Heart Association class IV"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must be classified as NYHA class III OR NYHA class IV
(assert
  (! (or patient_is_classified_as_nyha_class_iii_now
         patient_is_classified_as_nyha_class_iv_now)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be (classified as New York Heart Association class III OR classified as New York Heart Association class IV)"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_jugular_venous_engorgement_value_recorded_now_withunit_centimeter Real) ;; {"when_to_set_to_value":"Set to the measured value in centimeters if a current jugular vein distension measurement is available.","when_to_set_to_null":"Set to null if no current jugular vein distension measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current jugular vein distension in centimeters."} // "jugular vein distension greater than 6 centimeters"
(declare-const patient_doppler_ultrasonography_of_heart_tissue_value_recorded_now_withunit_centimeter_per_second Real) ;; {"when_to_set_to_value":"Set to the measured value in centimeters per second if a current tissue Doppler mitral annulus lateral velocity measurement is available.","when_to_set_to_null":"Set to null if no current tissue Doppler mitral annulus lateral velocity measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current tissue Doppler mitral annulus lateral velocity in centimeters per second."} // "tissue Doppler mitral annulus lateral velocity greater than 12 centimeters per second" and "tissue Doppler mitral annulus medial velocity greater than 15 centimeters per second"
(declare-const patient_doppler_ultrasonography_of_heart_tissue_value_recorded_now_withunit_centimeter_per_second@@site_mitral_annulus_lateral Bool) ;; {"when_to_set_to_true":"Set to true if the measurement is specifically from the mitral annulus lateral site.","when_to_set_to_false":"Set to false if the measurement is not from the mitral annulus lateral site.","when_to_set_to_null":"Set to null if the measurement site is unknown or indeterminate.","meaning":"Boolean indicating whether the tissue Doppler velocity measurement is from the mitral annulus lateral site."} // "tissue Doppler mitral annulus lateral velocity"
(declare-const patient_doppler_ultrasonography_of_heart_tissue_value_recorded_now_withunit_centimeter_per_second@@site_mitral_annulus_medial Bool) ;; {"when_to_set_to_true":"Set to true if the measurement is specifically from the mitral annulus medial site.","when_to_set_to_false":"Set to false if the measurement is not from the mitral annulus medial site.","when_to_set_to_null":"Set to null if the measurement site is unknown or indeterminate.","meaning":"Boolean indicating whether the tissue Doppler velocity measurement is from the mitral annulus medial site."} // "tissue Doppler mitral annulus medial velocity"
(declare-const patient_has_finding_of_pulmonary_edema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary edema.","when_to_set_to_false":"Set to false if the patient currently does not have pulmonary edema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary edema.","meaning":"Boolean indicating whether the patient currently has pulmonary edema."} // "pulmonary edema"
(declare-const patient_has_finding_of_pulmonary_edema_now@@identified_by_chest_x_ray Bool) ;; {"when_to_set_to_true":"Set to true if pulmonary edema is identified by chest X-ray.","when_to_set_to_false":"Set to false if pulmonary edema is not identified by chest X-ray.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether pulmonary edema is identified by chest X-ray.","meaning":"Boolean indicating whether pulmonary edema is identified by chest X-ray."} // "chest X-ray showing pulmonary edema"
(declare-const patient_has_finding_of_pleural_effusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pleural effusion.","when_to_set_to_false":"Set to false if the patient currently does not have pleural effusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pleural effusion.","meaning":"Boolean indicating whether the patient currently has pleural effusion."} // "pleural effusion"
(declare-const patient_has_finding_of_pleural_effusion_now@@identified_by_chest_x_ray Bool) ;; {"when_to_set_to_true":"Set to true if pleural effusion is identified by chest X-ray.","when_to_set_to_false":"Set to false if pleural effusion is not identified by chest X-ray.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether pleural effusion is identified by chest X-ray.","meaning":"Boolean indicating whether pleural effusion is identified by chest X-ray."} // "chest X-ray showing pleural effusion"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_pulmonary_edema_now@@identified_by_chest_x_ray
         patient_has_finding_of_pulmonary_edema_now)
     :named REQ4_AUXILIARY0)) ;; "chest X-ray showing pulmonary edema" implies "pulmonary edema"

(assert
  (! (=> patient_has_finding_of_pleural_effusion_now@@identified_by_chest_x_ray
         patient_has_finding_of_pleural_effusion_now)
     :named REQ4_AUXILIARY1)) ;; "chest X-ray showing pleural effusion" implies "pleural effusion"

;; ===================== Constraint Assertions (REQ 4) =====================
;; At least one of the following must be true:
;; (jugular vein distension > 6 cm) OR
;; (tissue Doppler mitral annulus lateral velocity > 12 cm/s) OR
;; (tissue Doppler mitral annulus medial velocity > 15 cm/s) OR
;; (chest X-ray showing pulmonary edema) OR
;; (chest X-ray showing pleural effusion)
(assert
  (! (or
        (> patient_jugular_venous_engorgement_value_recorded_now_withunit_centimeter 6.0) ;; "jugular vein distension greater than 6 centimeters"
        (and patient_doppler_ultrasonography_of_heart_tissue_value_recorded_now_withunit_centimeter_per_second@@site_mitral_annulus_lateral
             (> patient_doppler_ultrasonography_of_heart_tissue_value_recorded_now_withunit_centimeter_per_second 12.0)) ;; "tissue Doppler mitral annulus lateral velocity greater than 12 centimeters per second"
        (and patient_doppler_ultrasonography_of_heart_tissue_value_recorded_now_withunit_centimeter_per_second@@site_mitral_annulus_medial
             (> patient_doppler_ultrasonography_of_heart_tissue_value_recorded_now_withunit_centimeter_per_second 15.0)) ;; "tissue Doppler mitral annulus medial velocity greater than 15 centimeters per second"
        patient_has_finding_of_pulmonary_edema_now@@identified_by_chest_x_ray ;; "chest X-ray showing pulmonary edema"
        patient_has_finding_of_pleural_effusion_now@@identified_by_chest_x_ray ;; "chest X-ray showing pleural effusion"
     )
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS))
