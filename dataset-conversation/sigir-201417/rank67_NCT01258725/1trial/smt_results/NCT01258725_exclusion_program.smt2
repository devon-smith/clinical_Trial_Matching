;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_preterm_premature_rupture_of_membranes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of preterm premature rupture of membranes.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of preterm premature rupture of membranes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of preterm premature rupture of membranes.","meaning":"Boolean indicating whether the patient currently has preterm premature rupture of membranes."} ;; "preterm premature rupture of membranes"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_preterm_premature_rupture_of_membranes_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has preterm premature rupture of membranes."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_structural_anomaly_in_fetus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a fetus with a structural anomaly.","when_to_set_to_false":"Set to false if the patient currently does not have a fetus with a structural anomaly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a fetus with a structural anomaly.","meaning":"Boolean indicating whether the patient currently has a fetus with a structural anomaly."} ;; "the patient has a fetus with a structural anomaly"
(declare-const patient_has_finding_of_structural_anomaly_in_fetus_now@@detected_at_prenatal_ultrasonography Bool) ;; {"when_to_set_to_true":"Set to true if the fetus's structural anomaly is detected at prenatal ultrasonography.","when_to_set_to_false":"Set to false if the fetus's structural anomaly is not detected at prenatal ultrasonography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fetus's structural anomaly is detected at prenatal ultrasonography.","meaning":"Boolean indicating whether the fetus's structural anomaly is detected at prenatal ultrasonography."} ;; "structural anomaly detected at prenatal ultrasonography"
(declare-const patient_has_finding_of_chromosomal_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chromosomal disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a chromosomal disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chromosomal disorder.","meaning":"Boolean indicating whether the patient currently has a chromosomal disorder."} ;; "chromosomal abnormality"
(declare-const patient_has_finding_of_chromosomal_disorder_now@@involves_autosomes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current chromosomal disorder involves autosomes.","when_to_set_to_false":"Set to false if the patient's current chromosomal disorder does not involve autosomes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current chromosomal disorder involves autosomes.","meaning":"Boolean indicating whether the patient's current chromosomal disorder involves autosomes."} ;; "chromosomal abnormality involving autosomes"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable for structural anomaly
(assert
(! (=> patient_has_finding_of_structural_anomaly_in_fetus_now@@detected_at_prenatal_ultrasonography
      patient_has_finding_of_structural_anomaly_in_fetus_now)
:named REQ1_AUXILIARY0)) ;; "structural anomaly detected at prenatal ultrasonography"

;; Qualifier variable implies corresponding stem variable for chromosomal disorder
(assert
(! (=> patient_has_finding_of_chromosomal_disorder_now@@involves_autosomes
      patient_has_finding_of_chromosomal_disorder_now)
:named REQ1_AUXILIARY1)) ;; "chromosomal abnormality involving autosomes"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have either (structural anomaly detected at prenatal ultrasonography) OR (chromosomal abnormality involving autosomes)
(assert
(! (not (or patient_has_finding_of_structural_anomaly_in_fetus_now@@detected_at_prenatal_ultrasonography
            patient_has_finding_of_chromosomal_disorder_now@@involves_autosomes))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a fetus with a structural anomaly detected at prenatal ultrasonography) OR (the patient has a fetus with a chromosomal abnormality involving autosomes)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const gestational_age_value_recorded_at_symptom_onset_in_weeks Real) ;; {"when_to_set_to_value":"Set to the gestational age in weeks at the time the symptoms referring to incomplete abortion occurred.","when_to_set_to_null":"Set to null if the gestational age at symptom onset is unknown, not documented, or cannot be determined.","meaning":"Numeric value of gestational age in weeks at the time of symptom onset referring to incomplete abortion."} ;; "gestational age in weeks at the time the symptoms referring to incomplete abortion occurred"

(declare-const patient_has_symptoms_referring_to_incomplete_abortion_before_24_weeks_gestation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has symptoms that refer to incomplete abortion and these symptoms occurred before twenty-four weeks of gestation.","when_to_set_to_false":"Set to false if the patient does not have symptoms that refer to incomplete abortion occurring before twenty-four weeks of gestation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has symptoms referring to incomplete abortion occurring before twenty-four weeks of gestation.","meaning":"Boolean indicating whether the patient has symptoms referring to incomplete abortion occurring before twenty-four weeks of gestation."} ;; "symptoms referring to incomplete abortion occurring before twenty-four weeks of gestation"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_symptoms_referring_to_incomplete_abortion_before_24_weeks_gestation)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptoms referring to incomplete abortion occurring before twenty-four weeks of gestation."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_maternal_contraindication_to_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a maternal contraindication to the intervention.","when_to_set_to_false":"Set to false if the patient currently does not have a maternal contraindication to the intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a maternal contraindication to the intervention.","meaning":"Boolean indicating whether the patient currently has a maternal contraindication to the intervention."} ;; "the patient has a maternal contraindication to intervention"
(declare-const patient_has_maternal_contraindication_to_prolongation_of_pregnancy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a maternal contraindication to prolongation of pregnancy.","when_to_set_to_false":"Set to false if the patient currently does not have a maternal contraindication to prolongation of pregnancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a maternal contraindication to prolongation of pregnancy.","meaning":"Boolean indicating whether the patient currently has a maternal contraindication to prolongation of pregnancy."} ;; "the patient has a maternal contraindication to prolongation of pregnancy"
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have a disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has a disease, condition, or clinical finding."} ;; "medical condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the disease, condition, or clinical finding present now is severe.","when_to_set_to_false":"Set to false if the disease, condition, or clinical finding present now is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease, condition, or clinical finding present now is severe.","meaning":"Boolean indicating whether the disease, condition, or clinical finding present now is severe."} ;; "severe medical condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@occurs_in_pregnancy Bool) ;; {"when_to_set_to_true":"Set to true if the disease, condition, or clinical finding present now occurs during pregnancy.","when_to_set_to_false":"Set to false if the disease, condition, or clinical finding present now does not occur during pregnancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease, condition, or clinical finding present now occurs during pregnancy.","meaning":"Boolean indicating whether the disease, condition, or clinical finding present now occurs during pregnancy."} ;; "medical condition in pregnancy"
(declare-const patient_has_finding_of_disease_condition_finding_now@@makes_intervention_risky Bool) ;; {"when_to_set_to_true":"Set to true if the disease, condition, or clinical finding present now makes the intervention risky.","when_to_set_to_false":"Set to false if the disease, condition, or clinical finding present now does not make the intervention risky.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease, condition, or clinical finding present now makes the intervention risky.","meaning":"Boolean indicating whether the disease, condition, or clinical finding present now makes the intervention risky."} ;; "medical condition that makes the intervention risky"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; "including a severe medical condition in pregnancy that makes the intervention risky" is a non-exhaustive example for maternal contraindication to prolongation of pregnancy
(assert
(! (=> (and patient_has_finding_of_disease_condition_finding_now
            patient_has_finding_of_disease_condition_finding_now@@is_severe
            patient_has_finding_of_disease_condition_finding_now@@occurs_in_pregnancy
            patient_has_finding_of_disease_condition_finding_now@@makes_intervention_risky)
        patient_has_maternal_contraindication_to_prolongation_of_pregnancy_now)
   :named REQ3_AUXILIARY0)) ;; "including a severe medical condition in pregnancy that makes the intervention risky"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@is_severe
       patient_has_finding_of_disease_condition_finding_now)
   :named REQ3_AUXILIARY1)) ;; "severe medical condition"

(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@occurs_in_pregnancy
       patient_has_finding_of_disease_condition_finding_now)
   :named REQ3_AUXILIARY2)) ;; "medical condition in pregnancy"

(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@makes_intervention_risky
       patient_has_finding_of_disease_condition_finding_now)
   :named REQ3_AUXILIARY3)) ;; "medical condition that makes the intervention risky"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_maternal_contraindication_to_intervention_now)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a maternal contraindication to intervention."

(assert
(! (not patient_has_maternal_contraindication_to_prolongation_of_pregnancy_now)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a maternal contraindication to prolongation of pregnancy, including a severe medical condition in pregnancy that makes the intervention risky."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "patient is currently pregnant"

(declare-const patient_has_finding_of_premature_labor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently experiencing premature labor.","when_to_set_to_false":"Set to false if the patient is currently not experiencing premature labor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently experiencing premature labor.","meaning":"Boolean indicating whether the patient currently has premature labor."} ;; "premature labor"

(declare-const patient_has_finding_of_premature_labor_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current premature labor is active.","when_to_set_to_false":"Set to false if the patient's current premature labor is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current premature labor is active.","meaning":"Boolean indicating whether the patient's current premature labor is active."} ;; "active premature labor"

(declare-const patient_has_finding_of_premature_labor_now@@after_24_weeks_of_gestation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current premature labor occurs after 24 weeks of gestation.","when_to_set_to_false":"Set to false if the patient's current premature labor does not occur after 24 weeks of gestation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current premature labor occurs after 24 weeks of gestation.","meaning":"Boolean indicating whether the patient's current premature labor occurs after 24 weeks of gestation."} ;; "premature labor after 24 weeks of gestation"

(declare-const patient_cervical_length_value_recorded_now_withunit_mm Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current cervical length in millimeters is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current cervical length in millimeters."} ;; "shortened cervix less than 15 mm"

(declare-const patient_cervical_dilatation_value_recorded_now_withunit_cm Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current cervical dilatation in centimeters is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current cervical dilatation in centimeters."} ;; "less than 3 cm of cervical dilatation"

(declare-const patient_uterine_contraction_value_recorded_now_withunit_per_hour Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the number of uterine contractions per hour the patient is currently experiencing is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the number of uterine contractions per hour the patient is currently experiencing."} ;; "more than 6 uterine contractions per hour"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_premature_labor_now@@active
      patient_has_finding_of_premature_labor_now)
:named REQ4_AUXILIARY0)) ;; "active premature labor implies premature labor"

(assert
(! (=> patient_has_finding_of_premature_labor_now@@after_24_weeks_of_gestation
      patient_has_finding_of_premature_labor_now)
:named REQ4_AUXILIARY1)) ;; "premature labor after 24 weeks of gestation implies premature labor"

;; Definition of "active premature labor after 24 weeks of gestation" per requirement
(assert
(! (= (and patient_has_finding_of_premature_labor_now@@active
           patient_has_finding_of_premature_labor_now@@after_24_weeks_of_gestation)
      (or (< patient_cervical_length_value_recorded_now_withunit_mm 15)
          (< patient_cervical_dilatation_value_recorded_now_withunit_cm 3)
          (> patient_uterine_contraction_value_recorded_now_withunit_per_hour 6)))
:named REQ4_AUXILIARY2)) ;; "active premature labor after 24 weeks of gestation, defined as a shortened cervix less than 15 mm, less than 3 cm of cervical dilatation, or more than 6 uterine contractions per hour"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_has_finding_of_premature_labor_now@@active
             patient_has_finding_of_premature_labor_now@@after_24_weeks_of_gestation))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has active premature labor after 24 weeks of gestation, defined as a shortened cervix less than 15 mm, less than 3 cm of cervical dilatation, or more than 6 uterine contractions per hour."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_undergoing_cerclage_of_uterine_cervix_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cerclage of the uterine cervix in place.","when_to_set_to_false":"Set to false if the patient does not currently have a cerclage of the uterine cervix in place.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cerclage of the uterine cervix in place.","meaning":"Boolean indicating whether the patient currently has a cerclage of the uterine cervix in place."} ;; "cervical cerclage in place"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_is_undergoing_cerclage_of_uterine_cervix_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a cervical cerclage in place."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tachycardia.","meaning":"Boolean indicating whether the patient currently has tachycardia."} ;; "maternal tachycardia greater than one hundred per minute"
(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current heart rate in beats per minute is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current heart rate in beats per minute."} ;; "maternal tachycardia greater than one hundred per minute"
(declare-const patient_body_temperature_value_recorded_now_withunit_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body temperature in degrees Celsius is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body temperature in degrees Celsius."} ;; "maternal temperature greater than thirty-eight degrees Celsius"
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_cells_per_milliliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current white blood cell count in cells per milliliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current white blood cell count in cells per milliliter."} ;; "maternal white blood cell count greater than fifteen thousand per milliliter"
(declare-const patient_c_reactive_protein_value_recorded_now_withunit_milligrams_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current C-reactive protein level in milligrams per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current C-reactive protein level in milligrams per liter."} ;; "maternal C-reactive protein greater than twenty milligrams per liter"
(declare-const patient_has_finding_of_tender_body_of_uterus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has uterine tenderness.","when_to_set_to_false":"Set to false if the patient currently does not have uterine tenderness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uterine tenderness.","meaning":"Boolean indicating whether the patient currently has uterine tenderness."} ;; "uterine tenderness"
(declare-const patient_has_finding_of_vaginal_discharge_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has vaginal discharge.","when_to_set_to_false":"Set to false if the patient currently does not have vaginal discharge.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has vaginal discharge.","meaning":"Boolean indicating whether the patient currently has vaginal discharge."} ;; "vaginal discharge"
(declare-const patient_has_finding_of_vaginal_discharge_now@@foul_smelling Bool) ;; {"when_to_set_to_true":"Set to true if the patient's vaginal discharge is foul-smelling.","when_to_set_to_false":"Set to false if the patient's vaginal discharge is not foul-smelling.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's vaginal discharge is foul-smelling.","meaning":"Boolean indicating whether the patient's vaginal discharge is foul-smelling."} ;; "foul-smelling vaginal discharge"
(declare-const patient_has_finding_of_fetal_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fetal tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have fetal tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fetal tachycardia.","meaning":"Boolean indicating whether the patient currently has fetal tachycardia."} ;; "fetal tachycardia greater than one hundred sixty beats per minute"
(declare-const patient_has_diagnosis_of_infectious_disorder_of_the_fetus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of infectious disorder of the fetus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of infectious disorder of the fetus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of infectious disorder of the fetus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of infectious disorder of the fetus."} ;; "fetal infection"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Maternal tachycardia finding: heart rate > 100
(assert
(! (= patient_has_finding_of_tachycardia_now
(> patient_heart_rate_value_recorded_now_withunit_beats_per_minute 100))
:named REQ6_AUXILIARY0)) ;; "maternal tachycardia greater than one hundred per minute"

;; Maternal temperature finding: temperature > 38°C
;; "maternal temperature greater than thirty-eight degrees Celsius"
;; No Boolean for fever, so use numeric directly in count

;; Maternal WBC finding: WBC > 15000/ml
;; "maternal white blood cell count greater than fifteen thousand per milliliter"
;; No Boolean for leukocytosis, so use numeric directly in count

;; Maternal CRP finding: CRP > 20 mg/L
;; "maternal C-reactive protein greater than twenty milligrams per liter"
;; No Boolean for CRP, so use numeric directly in count

;; Foul-smelling vaginal discharge implies vaginal discharge
(assert
(! (=> patient_has_finding_of_vaginal_discharge_now@@foul_smelling
patient_has_finding_of_vaginal_discharge_now)
:named REQ6_AUXILIARY1)) ;; "foul-smelling vaginal discharge"

;; Maternal infection: clear signs = at least 2 of the listed findings
;; List: (1) maternal tachycardia > 100/min, (2) maternal temperature > 38°C, (3) maternal WBC > 15000/ml, (4) maternal CRP > 20 mg/L, (5) uterine tenderness, (6) foul-smelling vaginal discharge
;; Each finding is a Boolean (except for numeric thresholds, which are used directly)
(define-fun maternal_infection_sign_count () Int
  (+ (ite patient_has_finding_of_tachycardia_now 1 0)
     (ite (> patient_body_temperature_value_recorded_now_withunit_celsius 38.0) 1 0)
     (ite (> patient_white_blood_cell_count_value_recorded_now_withunit_cells_per_milliliter 15000.0) 1 0)
     (ite (> patient_c_reactive_protein_value_recorded_now_withunit_milligrams_per_liter 20.0) 1 0)
     (ite patient_has_finding_of_tender_body_of_uterus_now 1 0)
     (ite patient_has_finding_of_vaginal_discharge_now@@foul_smelling 1 0)
  )
) ;; "clear signs of maternal infection: at least two of the listed findings"

;; Fetal infection: clear signs = at least 2 of the listed findings
;; List: (1) fetal tachycardia > 160 bpm
;; Only one finding in the list, so cannot reach 2 unless more findings are present; but per requirement, at least two of the listed findings (so must be false unless more findings are present)
(define-fun fetal_infection_sign_count () Int
  (+ (ite (and patient_has_finding_of_fetal_tachycardia_now) 1 0)
  )
) ;; "clear signs of fetal infection: at least two of the listed findings"

;; Maternal infection: clear signs present if count >= 2
(declare-const patient_has_clear_signs_of_maternal_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least two of the listed findings for maternal infection.","when_to_set_to_false":"Set to false if the patient currently has fewer than two of the listed findings for maternal infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has at least two of the listed findings for maternal infection.","meaning":"Boolean indicating whether the patient currently has clear signs of maternal infection (at least two of the listed findings)."}

(assert
(! (= patient_has_clear_signs_of_maternal_infection_now
(>= maternal_infection_sign_count 2))
:named REQ6_AUXILIARY2)) ;; "clear signs of maternal infection: at least two of the listed findings"

;; Fetal infection: clear signs present if count >= 2
(declare-const patient_has_clear_signs_of_fetal_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least two of the listed findings for fetal infection.","when_to_set_to_false":"Set to false if the patient currently has fewer than two of the listed findings for fetal infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has at least two of the listed findings for fetal infection.","meaning":"Boolean indicating whether the patient currently has clear signs of fetal infection (at least two of the listed findings)."}

(assert
(! (= patient_has_clear_signs_of_fetal_infection_now
(>= fetal_infection_sign_count 2))
:named REQ6_AUXILIARY3)) ;; "clear signs of fetal infection: at least two of the listed findings"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have clear signs of maternal infection
(assert
(! (not patient_has_clear_signs_of_maternal_infection_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clear signs of maternal infection with non-exhaustive examples ... where clear signs are defined as at least two of the listed findings."

;; Exclusion: patient must NOT have clear signs of fetal infection
(assert
(! (not patient_has_clear_signs_of_fetal_infection_now)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clear signs of fetal infection with non-exhaustive examples ... where clear signs are defined as at least two of the listed findings."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_bleeding_episode_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently experiencing a bleeding episode.","when_to_set_to_false":"Set to false if the patient is currently not experiencing a bleeding episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently experiencing a bleeding episode.","meaning":"Boolean indicating whether the patient is currently experiencing a bleeding episode."} ;; "bleeding episodes"
(declare-const patient_has_suspicion_of_placental_abruption_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected of having placental abruption, regardless of the specific clinical indicators.","when_to_set_to_false":"Set to false if the patient is currently not suspected of having placental abruption.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected of having placental abruption.","meaning":"Boolean indicating whether the patient is currently suspected of having placental abruption."} ;; "suspicion of placental abruption"
(declare-const patient_has_finding_of_tender_body_of_uterus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has uterine tenderness.","when_to_set_to_false":"Set to false if the patient currently does not have uterine tenderness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uterine tenderness.","meaning":"Boolean indicating whether the patient currently has uterine tenderness."} ;; "uterine tenderness"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Definition: suspicion of placental abruption is indicated by (uterine tenderness AND bleeding episodes)
(assert
(! (= patient_has_suspicion_of_placental_abruption_now
     (and patient_has_finding_of_tender_body_of_uterus_now
          patient_has_finding_of_bleeding_episode_now))
:named REQ7_AUXILIARY0)) ;; "indicated by (uterine tenderness AND bleeding episodes)"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_suspicion_of_placental_abruption_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspicion of placental abruption, indicated by (uterine tenderness AND bleeding episodes)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any procedure at any time in the past (history).","when_to_set_to_false":"Set to false if the patient has not undergone any procedure at any time in the past (history).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any procedure in the past.","meaning":"Boolean indicating whether the patient has undergone any procedure in the past."} ;; "procedure"
(declare-const patient_has_undergone_procedure_inthehistory@@is_invasive Bool) ;; {"when_to_set_to_true":"Set to true if the procedure undergone by the patient in the past is invasive.","when_to_set_to_false":"Set to false if the procedure undergone by the patient in the past is not invasive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is invasive.","meaning":"Boolean indicating whether the procedure undergone by the patient in the past is invasive."} ;; "invasive procedure"
(declare-const patient_has_undergone_procedure_inthehistory@@occurred_in_pregnancy Bool) ;; {"when_to_set_to_true":"Set to true if the procedure undergone by the patient in the past occurred during the current pregnancy.","when_to_set_to_false":"Set to false if the procedure undergone by the patient in the past did not occur during the current pregnancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred during the current pregnancy.","meaning":"Boolean indicating whether the procedure undergone by the patient in the past occurred during the current pregnancy."} ;; "procedure in the pregnancy"
(declare-const patient_has_undergone_procedure_inthehistory@@is_invasive@@occurred_in_pregnancy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone at least one invasive procedure in the past that occurred during the current pregnancy.","when_to_set_to_false":"Set to false if the patient has not undergone any invasive procedure in the past that occurred during the current pregnancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any invasive procedure in the past that occurred during the current pregnancy.","meaning":"Boolean indicating whether the patient has undergone any invasive procedure in the past that occurred during the current pregnancy."} ;; "at least one previous invasive procedure in the pregnancy"
(declare-const patient_number_of_invasive_procedures_in_pregnancy_value_recorded_in_pregnancy_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of invasive procedures the patient has undergone during the current pregnancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many invasive procedures the patient has undergone during the current pregnancy.","meaning":"Numeric value indicating the number of invasive procedures the patient has undergone during the current pregnancy, recorded as a count."} ;; "number of invasive procedures in the pregnancy"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Definitional: patient_has_undergone_procedure_inthehistory@@is_invasive@@occurred_in_pregnancy is true iff at least one invasive procedure occurred in the pregnancy
(assert
(! (= patient_has_undergone_procedure_inthehistory@@is_invasive@@occurred_in_pregnancy
     (>= patient_number_of_invasive_procedures_in_pregnancy_value_recorded_in_pregnancy_withunit_count 1))
:named REQ8_AUXILIARY0)) ;; "at least one previous invasive procedure in the pregnancy"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_undergone_procedure_inthehistory@@is_invasive@@occurred_in_pregnancy)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had at least one previous invasive procedure in the pregnancy."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_fetal_condition_mandating_immediate_delivery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a fetal condition that mandates immediate delivery.","when_to_set_to_false":"Set to false if the patient currently does not have a fetal condition that mandates immediate delivery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a fetal condition mandating immediate delivery.","meaning":"Boolean indicating whether the patient currently has a fetal condition mandating immediate delivery."} ;; "has a fetal condition mandating immediate delivery"

(declare-const patient_is_undergoing_human_parturition_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing the process of delivery (parturition).","when_to_set_to_false":"Set to false if the patient is currently not undergoing the process of delivery (parturition).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing delivery.","meaning":"Boolean indicating whether the patient is currently undergoing delivery (parturition)."} ;; "delivery"

(declare-const patient_is_undergoing_human_parturition_function_now@@immediate Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current delivery (parturition) is immediate (mandated to occur without delay).","when_to_set_to_false":"Set to false if the patient's current delivery is not immediate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the delivery is immediate.","meaning":"Boolean indicating whether the patient's current delivery is immediate."} ;; "immediate delivery"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_human_parturition_function_now@@immediate
      patient_is_undergoing_human_parturition_function_now)
   :named REQ9_AUXILIARY0)) ;; "immediate delivery" implies "delivery"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_fetal_condition_mandating_immediate_delivery_now)
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a fetal condition mandating immediate delivery."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_bleeds_profusely_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe bleeding (bleeds profusely).","when_to_set_to_false":"Set to false if the patient currently does not have severe bleeding (bleeds profusely).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe bleeding (bleeds profusely).","meaning":"Boolean indicating whether the patient currently has severe bleeding (bleeds profusely) at the present time."} ;; "severe bleeding at present"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_bleeds_profusely_now)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe bleeding at present."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of human immunodeficiency virus infection (HIV).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of human immunodeficiency virus infection (HIV).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of human immunodeficiency virus infection (HIV).","meaning":"Boolean indicating whether the patient currently has a diagnosis of human immunodeficiency virus infection (HIV)."} ;; "human immunodeficiency virus infection"
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now@@maternal Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of human immunodeficiency virus infection is present in the patient's mother (maternal HIV infection).","when_to_set_to_false":"Set to false if the diagnosis of human immunodeficiency virus infection is not present in the patient's mother.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of human immunodeficiency virus infection is present in the patient's mother.","meaning":"Boolean indicating whether the diagnosis of human immunodeficiency virus infection is present in the patient's mother (maternal HIV infection)."} ;; "maternal human immunodeficiency virus infection"
(declare-const patient_has_diagnosis_of_type_b_viral_hepatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hepatitis B virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hepatitis B virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hepatitis B virus infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hepatitis B virus infection."} ;; "hepatitis B virus infection"
(declare-const patient_has_diagnosis_of_type_b_viral_hepatitis_now@@maternal Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of hepatitis B virus infection is present in the patient's mother (maternal hepatitis B infection).","when_to_set_to_false":"Set to false if the diagnosis of hepatitis B virus infection is not present in the patient's mother.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of hepatitis B virus infection is present in the patient's mother.","meaning":"Boolean indicating whether the diagnosis of hepatitis B virus infection is present in the patient's mother (maternal hepatitis B infection)."} ;; "maternal hepatitis B virus infection"
(declare-const patient_has_diagnosis_of_viral_hepatitis_c_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hepatitis C virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hepatitis C virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hepatitis C virus infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hepatitis C virus infection."} ;; "hepatitis C virus infection"
(declare-const patient_has_diagnosis_of_viral_hepatitis_c_now@@maternal Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of hepatitis C virus infection is present in the patient's mother (maternal hepatitis C infection).","when_to_set_to_false":"Set to false if the diagnosis of hepatitis C virus infection is not present in the patient's mother.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of hepatitis C virus infection is present in the patient's mother.","meaning":"Boolean indicating whether the diagnosis of hepatitis C virus infection is present in the patient's mother (maternal hepatitis C infection)."} ;; "maternal hepatitis C virus infection"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now@@maternal
      patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now)
    :named REQ11_AUXILIARY0)) ;; "maternal human immunodeficiency virus infection"

(assert
(! (=> patient_has_diagnosis_of_type_b_viral_hepatitis_now@@maternal
      patient_has_diagnosis_of_type_b_viral_hepatitis_now)
    :named REQ11_AUXILIARY1)) ;; "maternal hepatitis B virus infection"

(assert
(! (=> patient_has_diagnosis_of_viral_hepatitis_c_now@@maternal
      patient_has_diagnosis_of_viral_hepatitis_c_now)
    :named REQ11_AUXILIARY2)) ;; "maternal hepatitis C virus infection"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now@@maternal)
    :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has maternal human immunodeficiency virus infection."

(assert
(! (not patient_has_diagnosis_of_type_b_viral_hepatitis_now@@maternal)
    :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has maternal hepatitis B virus infection."

(assert
(! (not patient_has_diagnosis_of_viral_hepatitis_c_now@@maternal)
    :named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has maternal hepatitis C virus infection."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_multiple_gestation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a multiple gestation.","when_to_set_to_false":"Set to false if the patient currently does not have a multiple gestation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a multiple gestation.","meaning":"Boolean indicating whether the patient currently has a multiple gestation."} ;; "The patient is excluded if the patient has a multiple gestation."

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
  (! (not patient_has_finding_of_multiple_gestation_now)
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a multiple gestation."
