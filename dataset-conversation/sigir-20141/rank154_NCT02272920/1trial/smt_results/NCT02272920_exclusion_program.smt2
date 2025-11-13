;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bleeding.","meaning":"Boolean indicating whether the patient currently has bleeding."} ;; "bleeding"
(declare-const patient_has_finding_of_bleeding_now@@pathological Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bleeding is pathological.","when_to_set_to_false":"Set to false if the patient's current bleeding is not pathological.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bleeding is pathological.","meaning":"Boolean indicating whether the patient's current bleeding is pathological."} ;; "pathological bleeding"
(declare-const patient_has_increased_risk_of_pathological_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an increased risk of pathological bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have an increased risk of pathological bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an increased risk of pathological bleeding.","meaning":"Boolean indicating whether the patient currently has an increased risk of pathological bleeding."} ;; "increased risk of pathological bleeding"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_increased_risk_of_pathological_bleeding_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has increased risk of pathological bleeding."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's office systolic blood pressure in mmHg is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's office systolic blood pressure measured now, in mmHg."} ;; "systolic blood pressure"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (< patient_systolic_blood_pressure_value_recorded_now_withunit_mmhg 120))
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has office systolic blood pressure < 120 mmHg."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_renal_artery_abnormality_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a renal artery abnormality.","when_to_set_to_false":"Set to false if the patient currently does not have a renal artery abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a renal artery abnormality.","meaning":"Boolean indicating whether the patient currently has a renal artery abnormality."} ;; "The patient is excluded if the patient has renal artery abnormality."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_finding_of_renal_artery_abnormality_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal artery abnormality."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_ml_per_min Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's glomerular filtration rate (GFR) in mL/min is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's glomerular filtration rate (GFR) in mL/min, recorded now."} ;; "glomerular filtration rate"
(declare-const patient_glomerular_filtration_rate_value_recorded_now_withunit_ml_per_min@@estimated Bool) ;; {"when_to_set_to_true":"Set to true if the recorded glomerular filtration rate (GFR) value is an estimated value (eGFR).","when_to_set_to_false":"Set to false if the recorded GFR value is not estimated (i.e., directly measured).","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the GFR value is estimated.","meaning":"Boolean indicating whether the recorded GFR value is an estimated value (eGFR)."} ;; "estimated glomerular filtration rate"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (and patient_glomerular_filtration_rate_value_recorded_now_withunit_ml_per_min@@estimated
               (< patient_glomerular_filtration_rate_value_recorded_now_withunit_ml_per_min 30)))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has estimated glomerular filtration rate < 30 mL/min."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_implantable_cardioverter_defibrillator_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an implantable cardioverter-defibrillator.","when_to_set_to_false":"Set to false if the patient currently does not have an implantable cardioverter-defibrillator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an implantable cardioverter-defibrillator.","meaning":"Boolean indicating whether the patient currently has an implantable cardioverter-defibrillator."} ;; "the patient has an implantable cardioverter-defibrillator"
(declare-const patient_has_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pacemaker.","when_to_set_to_false":"Set to false if the patient currently does not have a pacemaker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pacemaker.","meaning":"Boolean indicating whether the patient currently has a pacemaker."} ;; "the patient has a pacemaker"
(declare-const patient_has_metallic_implant_not_compatible_with_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any metallic implant that is NOT compatible with magnetic resonance imaging.","when_to_set_to_false":"Set to false if the patient currently does not have any metallic implant that is NOT compatible with magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any metallic implant that is NOT compatible with magnetic resonance imaging.","meaning":"Boolean indicating whether the patient currently has any metallic implant that is NOT compatible with magnetic resonance imaging."} ;; "the patient has any other metallic implant NOT compatible with magnetic resonance imaging"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_implantable_cardioverter_defibrillator_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an implantable cardioverter-defibrillator."

(assert
  (! (not patient_has_pacemaker_now)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a pacemaker."

(assert
  (! (not patient_has_metallic_implant_not_compatible_with_magnetic_resonance_imaging_now)
     :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other metallic implant NOT compatible with magnetic resonance imaging."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_survival_time_value_recorded_now_withunit_years Real) ;; {"when_to_set_to_value":"Set to the estimated survival time in years if a current estimate is available.","when_to_set_to_null":"Set to null if no current estimate of survival time is available or the value is indeterminate.","meaning":"Numeric value representing the patient's estimated survival time in years, recorded now."} ;; "survival time"
(declare-const patient_survival_time_value_recorded_now_withunit_years@@estimated Bool) ;; {"when_to_set_to_true":"Set to true if the survival time value is an estimate.","when_to_set_to_false":"Set to false if the survival time value is not an estimate (i.e., is an exact measurement).","when_to_set_to_null":"Set to null if it is unknown whether the survival time value is an estimate or not.","meaning":"Boolean indicating whether the survival time value is an estimate."} ;; "estimated survival time"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (< patient_survival_time_value_recorded_now_withunit_years 1))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has estimated survival time < 1 year."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_oriented_to_person_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently oriented to person.","when_to_set_to_false":"Set to false if the patient is currently NOT oriented to person.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently oriented to person.","meaning":"Boolean indicating whether the patient is currently oriented to person."} ;; "oriented to person"
(declare-const patient_has_finding_of_oriented_to_place_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently oriented to place.","when_to_set_to_false":"Set to false if the patient is currently NOT oriented to place.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently oriented to place.","meaning":"Boolean indicating whether the patient is currently oriented to place."} ;; "oriented to place"
(declare-const patient_has_finding_of_oriented_to_time_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently oriented to time.","when_to_set_to_false":"Set to false if the patient is currently NOT oriented to time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently oriented to time.","meaning":"Boolean indicating whether the patient is currently oriented to time."} ;; "oriented to time"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (or (not patient_has_finding_of_oriented_to_person_now)
            (not patient_has_finding_of_oriented_to_place_now)
            (not patient_has_finding_of_oriented_to_time_now)))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is NOT oriented to person) OR (the patient is NOT oriented to place) OR (the patient is NOT oriented to time)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_akatamathesia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of inability to understand (akatamathesia).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of inability to understand (akatamathesia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to understand (akatamathesia).","meaning":"Boolean indicating whether the patient currently has inability to understand (akatamathesia)."} ;; "inability to understand given information about the study"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_akatamathesia_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inability to understand given information about the study."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_fertility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of fertility.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of fertility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of fertility.","meaning":"Boolean indicating whether the patient currently has a clinical finding of fertility."} ;; "fertility"
(declare-const patient_is_able_to_be_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to become pregnant (has fertility).","when_to_set_to_false":"Set to false if the patient is currently not able to become pregnant (does not have fertility).","when_to_set_to_null":"Set to null if the patient's ability to become pregnant is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently able to become pregnant (has fertility)."} ;; "the patient has fertility"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "the patient is female"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; "the patient is able to be pregnant" is implied by "the patient has a clinical finding of fertility"
(assert
(! (=> patient_has_finding_of_fertility_now
       patient_is_able_to_be_pregnant_now)
   :named REQ8_AUXILIARY0)) ;; "the patient has fertility" ⇒ "the patient is able to be pregnant"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: (the patient is female) AND (the patient has fertility)
(assert
(! (not (and patient_sex_is_female_now
             patient_is_able_to_be_pregnant_now))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is female) AND (the patient has fertility)."
