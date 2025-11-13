;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_rapid_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of rapid atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of rapid atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has rapid atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has rapid atrial fibrillation."} ;; "rapid atrial fibrillation"
(declare-const patient_has_finding_of_serious_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a serious arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have a serious arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a serious arrhythmia.","meaning":"Boolean indicating whether the patient currently has a serious arrhythmia."} ;; "serious arrhythmia"
(declare-const patient_has_finding_of_ventricular_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ventricular tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ventricular tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ventricular tachycardia.","meaning":"Boolean indicating whether the patient currently has ventricular tachycardia."} ;; "ventricular tachycardia"
(declare-const patient_heart_rate_value_recorded_now_withunit_per_minute Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's heart rate per minute as currently recorded.","when_to_set_to_null":"Set to null if the patient's current heart rate per minute is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's heart rate per minute as currently recorded."} ;; "heart rate > 160 per minute"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or (and patient_has_finding_of_rapid_atrial_fibrillation_now
                (> patient_heart_rate_value_recorded_now_withunit_per_minute 160))
           patient_has_finding_of_ventricular_tachycardia_now)
        patient_has_finding_of_serious_arrhythmia_now)
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples ((rapid atrial fibrillation with heart rate > 160 per minute) OR (ventricular tachycardia))."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_serious_arrhythmia_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serious arrhythmia with non-exhaustive examples ((rapid atrial fibrillation with heart rate > 160 per minute) OR (ventricular tachycardia))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_brainstem_death_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of brainstem death.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of brainstem death.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has brainstem death.","meaning":"Boolean indicating whether the patient currently has brainstem death."} ;; "brain death"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_brainstem_death_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has brain death."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_dopamine_containing_product_value_recorded_inthehistory_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours the patient has received open label administration of dopamine-containing product in the past.","when_to_set_to_null":"Set to null if the total duration is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total hours of open label dopamine-containing product administration in the patient's history."} ;; "dopamine"
(declare-const patient_norepinephrine_containing_product_value_recorded_inthehistory_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours the patient has received open label administration of norepinephrine-containing product in the past.","when_to_set_to_null":"Set to null if the total duration is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total hours of open label norepinephrine-containing product administration in the patient's history."} ;; "norepinephrine"
(declare-const patient_epinephrine_containing_product_value_recorded_inthehistory_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours the patient has received open label administration of epinephrine-containing product in the past.","when_to_set_to_null":"Set to null if the total duration is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total hours of open label epinephrine-containing product administration in the patient's history."} ;; "epinephrine"
(declare-const patient_phenylephrine_containing_product_value_recorded_inthehistory_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours the patient has received open label administration of phenylephrine-containing product in the past.","when_to_set_to_null":"Set to null if the total duration is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total hours of open label phenylephrine-containing product administration in the patient's history."} ;; "phenylephrine"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not (> patient_dopamine_containing_product_value_recorded_inthehistory_withunit_hours 4.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received open label administration of dopamine for more than 4 hours."

(assert
  (! (not (> patient_norepinephrine_containing_product_value_recorded_inthehistory_withunit_hours 4.0))
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received open label administration of norepinephrine for more than 4 hours."

(assert
  (! (not (> patient_epinephrine_containing_product_value_recorded_inthehistory_withunit_hours 4.0))
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received open label administration of epinephrine for more than 4 hours."

(assert
  (! (not (> patient_phenylephrine_containing_product_value_recorded_inthehistory_withunit_hours 4.0))
     :named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received open label administration of phenylephrine for more than 4 hours."
