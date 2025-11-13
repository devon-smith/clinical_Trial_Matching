;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_documented_contraindication_to_fibrinolytic_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented contraindication to the use of fibrinolytic therapy.","when_to_set_to_false":"Set to false if the patient currently does not have a documented contraindication to the use of fibrinolytic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a documented contraindication to the use of fibrinolytic therapy.","meaning":"Boolean indicating whether the patient currently has a documented contraindication to the use of fibrinolytic therapy."} ;; "documented contraindication to the use of fibrinolytic therapy"

(declare-const patient_has_finding_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bleeding.","meaning":"Boolean indicating whether the patient currently has bleeding."} ;; "internal active bleeding"

(declare-const patient_has_finding_of_bleeding_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bleeding is active.","when_to_set_to_false":"Set to false if the patient's current bleeding is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bleeding is active.","meaning":"Boolean indicating whether the patient's current bleeding is active."} ;; "active bleeding"

(declare-const patient_has_finding_of_bleeding_now@@internal Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bleeding is internal.","when_to_set_to_false":"Set to false if the patient's current bleeding is not internal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bleeding is internal.","meaning":"Boolean indicating whether the patient's current bleeding is internal."} ;; "internal bleeding"

(declare-const patient_has_finding_of_hemorrhagic_diathesis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a known history of hemorrhagic diathesis.","when_to_set_to_false":"Set to false if the patient does not have a known history of hemorrhagic diathesis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a known history of hemorrhagic diathesis.","meaning":"Boolean indicating whether the patient has a known history of hemorrhagic diathesis."} ;; "known history of hemorrhagic diathesis"

(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a cerebrovascular accident at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a cerebrovascular accident.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a cerebrovascular accident.","meaning":"Boolean indicating whether the patient has ever had a cerebrovascular accident in the past."} ;; "history of previous cerebrovascular accident of any kind at any time"

(declare-const patient_has_finding_of_intracranial_tumor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an intracranial tumor.","when_to_set_to_false":"Set to false if the patient currently does not have an intracranial tumor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an intracranial tumor.","meaning":"Boolean indicating whether the patient currently has an intracranial tumor."} ;; "intracranial tumor"

(declare-const patient_has_finding_of_arteriovenous_malformation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has arteriovenous malformation.","when_to_set_to_false":"Set to false if the patient currently does not have arteriovenous malformation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has arteriovenous malformation.","meaning":"Boolean indicating whether the patient currently has arteriovenous malformation."} ;; "arteriovenous malformation"

(declare-const patient_has_finding_of_intracranial_aneurysm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an intracranial aneurysm.","when_to_set_to_false":"Set to false if the patient currently does not have an intracranial aneurysm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an intracranial aneurysm.","meaning":"Boolean indicating whether the patient currently has an intracranial aneurysm."} ;; "intracranial aneurysm"

(declare-const patient_has_history_of_cerebral_aneurysm_repair_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of cerebral aneurysm repair at any time.","when_to_set_to_false":"Set to false if the patient does not have a history of cerebral aneurysm repair at any time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of cerebral aneurysm repair at any time.","meaning":"Boolean indicating whether the patient has a history of cerebral aneurysm repair at any time."} ;; "history of cerebral aneurysm repair"

(declare-const patient_has_undergone_major_surgery_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone major surgery in the 6 weeks prior to randomization.","when_to_set_to_false":"Set to false if the patient has not undergone major surgery in the 6 weeks prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone major surgery in the 6 weeks prior to randomization.","meaning":"Boolean indicating whether the patient has undergone major surgery in the 6 weeks prior to randomization."} ;; "history of major surgery in the 6 weeks prior to randomization"

(declare-const patient_has_undergone_biopsy_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone biopsy in the past 6 weeks.","when_to_set_to_false":"Set to false if the patient has not undergone biopsy in the past 6 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone biopsy in the past 6 weeks.","meaning":"Boolean indicating whether the patient has undergone biopsy in the past 6 weeks."} ;; "history of parenchymal biopsy in the 6 weeks prior to randomization"

(declare-const patient_has_undergone_biopsy_inthepast6weeks@@parenchymal Bool) ;; {"when_to_set_to_true":"Set to true if the patient's biopsy in the past 6 weeks is parenchymal.","when_to_set_to_false":"Set to false if the patient's biopsy in the past 6 weeks is not parenchymal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's biopsy in the past 6 weeks is parenchymal.","meaning":"Boolean indicating whether the patient's biopsy in the past 6 weeks is parenchymal."} ;; "parenchymal biopsy in the 6 weeks prior to randomization"

(declare-const patient_has_undergone_surgical_procedure_on_eye_proper_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone ocular surgery in the past 6 weeks.","when_to_set_to_false":"Set to false if the patient has not undergone ocular surgery in the past 6 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone ocular surgery in the past 6 weeks.","meaning":"Boolean indicating whether the patient has undergone ocular surgery in the past 6 weeks."} ;; "history of ocular surgery in the 6 weeks prior to randomization"

(declare-const patient_has_finding_of_traumatic_injury_inthepast6weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had traumatic injury in the past 6 weeks.","when_to_set_to_false":"Set to false if the patient has not had traumatic injury in the past 6 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had traumatic injury in the past 6 weeks.","meaning":"Boolean indicating whether the patient has had traumatic injury in the past 6 weeks."} ;; "history of severe traumatism in the 6 weeks prior to randomization"

(declare-const patient_has_finding_of_traumatic_injury_inthepast6weeks@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's traumatic injury in the past 6 weeks is severe.","when_to_set_to_false":"Set to false if the patient's traumatic injury in the past 6 weeks is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's traumatic injury in the past 6 weeks is severe.","meaning":"Boolean indicating whether the patient's traumatic injury in the past 6 weeks is severe."} ;; "severe traumatism in the 6 weeks prior to randomization"

(declare-const patient_has_finding_of_unexplained_puncture_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an unexplained puncture in the last 24 hours prior to randomization.","when_to_set_to_false":"Set to false if the patient has not had an unexplained puncture in the last 24 hours prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an unexplained puncture in the last 24 hours prior to randomization.","meaning":"Boolean indicating whether the patient has had an unexplained puncture in the last 24 hours prior to randomization."} ;; "unexplained puncture in a non-compressible vascular location in the last 24 hours prior to randomization"

(declare-const patient_has_finding_of_unexplained_puncture_inthepast24hours@@in_non_compressible_vascular_location Bool) ;; {"when_to_set_to_true":"Set to true if the patient's unexplained puncture in the last 24 hours prior to randomization is located in a non-compressible vascular location.","when_to_set_to_false":"Set to false if the patient's unexplained puncture in the last 24 hours prior to randomization is not located in a non-compressible vascular location.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's unexplained puncture in the last 24 hours prior to randomization is located in a non-compressible vascular location.","meaning":"Boolean indicating whether the patient's unexplained puncture in the last 24 hours prior to randomization is located in a non-compressible vascular location."} ;; "unexplained puncture in a non-compressible vascular location in the last 24 hours prior to randomization"

(declare-const patient_systolic_arterial_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current systolic arterial pressure in mmHg is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic arterial pressure in mmHg."} ;; "confirmed arterial hypertension with a reliable measurement of systolic arterial pressure > 180 mmHg"

(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current diastolic arterial pressure in mmHg is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current diastolic arterial pressure in mmHg."} ;; "confirmed arterial hypertension with a reliable measurement of diastolic arterial pressure > 110 mmHg"

(declare-const patient_has_finding_of_thrombocytopenic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has thrombocytopenia.","when_to_set_to_false":"Set to false if the patient currently does not have thrombocytopenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has thrombocytopenia.","meaning":"Boolean indicating whether the patient currently has thrombocytopenia."} ;; "known thrombocytopenia with platelet count < 100,000 platelets/mL"

(declare-const patient_platelet_count_finding_value_recorded_now_withunit_platelets_per_ml Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current platelet count in platelets/mL is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count in platelets/mL."} ;; "platelet count < 100,000 platelets/mL"

(declare-const patient_has_undergone_cardiopulmonary_resuscitation_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone cardiopulmonary resuscitation in the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not undergone cardiopulmonary resuscitation in the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone cardiopulmonary resuscitation in the past 2 weeks.","meaning":"Boolean indicating whether the patient has undergone cardiopulmonary resuscitation in the past 2 weeks."} ;; "history of prolonged cardiopulmonary resuscitation > 20 minutes in the 2 weeks prior to randomization" and "history of traumatic cardiopulmonary resuscitation in the 2 weeks prior to randomization"

(declare-const patient_has_undergone_cardiopulmonary_resuscitation_inthepast2weeks@@prolonged_greater_than_20_minutes Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiopulmonary resuscitation in the past 2 weeks lasted more than 20 minutes.","when_to_set_to_false":"Set to false if the patient's cardiopulmonary resuscitation in the past 2 weeks did not last more than 20 minutes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiopulmonary resuscitation in the past 2 weeks lasted more than 20 minutes.","meaning":"Boolean indicating whether the patient's cardiopulmonary resuscitation in the past 2 weeks lasted more than 20 minutes."} ;; "history of prolonged cardiopulmonary resuscitation > 20 minutes in the 2 weeks prior to randomization"

(declare-const patient_has_undergone_cardiopulmonary_resuscitation_inthepast2weeks@@traumatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiopulmonary resuscitation in the past 2 weeks was traumatic.","when_to_set_to_false":"Set to false if the patient's cardiopulmonary resuscitation in the past 2 weeks was not traumatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiopulmonary resuscitation in the past 2 weeks was traumatic.","meaning":"Boolean indicating whether the patient's cardiopulmonary resuscitation in the past 2 weeks was traumatic."} ;; "history of traumatic cardiopulmonary resuscitation in the 2 weeks prior to randomization"

(declare-const patient_has_finding_of_dissection_of_aorta_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has aortic dissection.","when_to_set_to_false":"Set to false if the patient currently does not have aortic dissection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has aortic dissection.","meaning":"Boolean indicating whether the patient currently has aortic dissection."} ;; "history suggesting aortic dissection" and "signs suggesting aortic dissection"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or
        (and patient_has_finding_of_bleeding_now@@internal patient_has_finding_of_bleeding_now@@active)
        patient_has_finding_of_hemorrhagic_diathesis_inthehistory
        patient_has_finding_of_cerebrovascular_accident_inthehistory
        patient_has_finding_of_intracranial_tumor_now
        patient_has_finding_of_arteriovenous_malformation_now
        patient_has_finding_of_intracranial_aneurysm_now
        patient_has_history_of_cerebral_aneurysm_repair_inthehistory
        patient_has_undergone_major_surgery_inthepast6weeks
        patient_has_undergone_biopsy_inthepast6weeks@@parenchymal
        patient_has_undergone_surgical_procedure_on_eye_proper_inthepast6weeks
        patient_has_finding_of_traumatic_injury_inthepast6weeks@@severe
        patient_has_finding_of_unexplained_puncture_inthepast24hours@@in_non_compressible_vascular_location
        (> patient_systolic_arterial_pressure_value_recorded_now_withunit_mmhg 180)
        (> patient_diastolic_blood_pressure_value_recorded_now_withunit_mmhg 110)
        (and patient_has_finding_of_thrombocytopenic_disorder_now
             (< patient_platelet_count_finding_value_recorded_now_withunit_platelets_per_ml 100000))
        patient_has_undergone_cardiopulmonary_resuscitation_inthepast2weeks@@prolonged_greater_than_20_minutes
        patient_has_undergone_cardiopulmonary_resuscitation_inthepast2weeks@@traumatic
        patient_has_finding_of_dissection_of_aorta_now
    )
    patient_has_documented_contraindication_to_fibrinolytic_therapy_now)
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples (((internal active bleeding) OR (known history of hemorrhagic diathesis) OR (history of previous cerebrovascular accident of any kind at any time) OR (intracranial tumor) OR (arteriovenous malformation) OR (intracranial aneurysm) OR (history of cerebral aneurysm repair) OR (history of major surgery in the 6 weeks prior to randomization) OR (history of parenchymal biopsy in the 6 weeks prior to randomization) OR (history of ocular surgery in the 6 weeks prior to randomization) OR (history of severe traumatism in the 6 weeks prior to randomization) OR (unexplained puncture in a non-compressible vascular location in the last 24 hours prior to randomization) OR (confirmed arterial hypertension with a reliable measurement of systolic arterial pressure > 180 mmHg) OR (confirmed arterial hypertension with a reliable measurement of diastolic arterial pressure > 110 mmHg) OR (known thrombocytopenia with platelet count < 100,000 platelets/mL) OR (history of prolonged cardiopulmonary resuscitation > 20 minutes in the 2 weeks prior to randomization) OR (history of traumatic cardiopulmonary resuscitation in the 2 weeks prior to randomization) OR (history suggesting aortic dissection) OR (signs suggesting aortic dissection)))"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_bleeding_now@@active
      patient_has_finding_of_bleeding_now)
:named REQ0_AUXILIARY1)) ;; "active bleeding"

(assert
(! (=> patient_has_finding_of_bleeding_now@@internal
      patient_has_finding_of_bleeding_now)
:named REQ0_AUXILIARY2)) ;; "internal bleeding"

(assert
(! (=> patient_has_finding_of_traumatic_injury_inthepast6weeks@@severe
      patient_has_finding_of_traumatic_injury_inthepast6weeks)
:named REQ0_AUXILIARY3)) ;; "severe traumatism in the 6 weeks prior to randomization"

(assert
(! (=> patient_has_undergone_biopsy_inthepast6weeks@@parenchymal
      patient_has_undergone_biopsy_inthepast6weeks)
:named REQ0_AUXILIARY4)) ;; "parenchymal biopsy in the 6 weeks prior to randomization"

(assert
(! (=> patient_has_finding_of_unexplained_puncture_inthepast24hours@@in_non_compressible_vascular_location
      patient_has_finding_of_unexplained_puncture_inthepast24hours)
:named REQ0_AUXILIARY5)) ;; "unexplained puncture in a non-compressible vascular location in the last 24 hours prior to randomization"

(assert
(! (=> patient_has_undergone_cardiopulmonary_resuscitation_inthepast2weeks@@prolonged_greater_than_20_minutes
      patient_has_undergone_cardiopulmonary_resuscitation_inthepast2weeks)
:named REQ0_AUXILIARY6)) ;; "history of prolonged cardiopulmonary resuscitation > 20 minutes in the 2 weeks prior to randomization"

(assert
(! (=> patient_has_undergone_cardiopulmonary_resuscitation_inthepast2weeks@@traumatic
      patient_has_undergone_cardiopulmonary_resuscitation_inthepast2weeks)
:named REQ0_AUXILIARY7)) ;; "history of traumatic cardiopulmonary resuscitation in the 2 weeks prior to randomization"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_documented_contraindication_to_fibrinolytic_therapy_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a documented contraindication to the use of fibrinolytic therapy with non-exhaustive examples (((internal active bleeding) OR (known history of hemorrhagic diathesis) OR (history of previous cerebrovascular accident of any kind at any time) OR (intracranial tumor) OR (arteriovenous malformation) OR (intracranial aneurysm) OR (history of cerebral aneurysm repair) OR (history of major surgery in the 6 weeks prior to randomization) OR (history of parenchymal biopsy in the 6 weeks prior to randomization) OR (history of ocular surgery in the 6 weeks prior to randomization) OR (history of severe traumatism in the 6 weeks prior to randomization) OR (unexplained puncture in a non-compressible vascular location in the last 24 hours prior to randomization) OR (confirmed arterial hypertension with a reliable measurement of systolic arterial pressure > 180 mmHg) OR (confirmed arterial hypertension with a reliable measurement of diastolic arterial pressure > 110 mmHg) OR (known thrombocytopenia with platelet count < 100,000 platelets/mL) OR (history of prolonged cardiopulmonary resuscitation > 20 minutes in the 2 weeks prior to randomization) OR (history of traumatic cardiopulmonary resuscitation in the 2 weeks prior to randomization) OR (history suggesting aortic dissection) OR (signs suggesting aortic dissection)))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_cardiogenic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiogenic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiogenic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cardiogenic shock.","meaning":"Boolean indicating whether the patient currently has cardiogenic shock."} ;; "cardiogenic shock"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_cardiogenic_shock_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiogenic shock."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_time_from_arrival_at_facility_to_administration_of_parenteral_treatment_value_recorded_now_withunit_minutes Real) ;; {"when_to_set_to_value":"Set to the estimated number of minutes from the patient's arrival at the facility to administration of parenteral treatment, if this value is available now.","when_to_set_to_null":"Set to null if the estimated door-to-needle time in minutes is not available or cannot be determined now.","meaning":"Numeric value (in minutes) representing the patient's estimated time from arrival at the facility to administration of parenteral treatment, recorded now."} ;; "door-to-needle time"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (> patient_time_from_arrival_at_facility_to_administration_of_parenteral_treatment_value_recorded_now_withunit_minutes 120))
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient's estimated door-to-needle time > 120 minutes."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_thrombolytic_therapy_inthepast14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone administration of thrombolytic therapy within the 14 days prior to randomization.","when_to_set_to_false":"Set to false if the patient has not undergone administration of thrombolytic therapy within the 14 days prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone administration of thrombolytic therapy within the 14 days prior to randomization.","meaning":"Boolean indicating whether the patient has undergone thrombolytic therapy in the past 14 days."} ;; "fibrinolytic therapy in the 14 days prior to randomization"

(declare-const patient_has_undergone_thrombolytic_therapy_inthepast14days@@temporalcontext_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the administration of thrombolytic therapy in the past 14 days occurred prior to randomization.","when_to_set_to_false":"Set to false if the administration of thrombolytic therapy in the past 14 days did not occur prior to randomization (e.g., after randomization).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the administration of thrombolytic therapy in the past 14 days occurred prior to randomization.","meaning":"Boolean indicating whether the thrombolytic therapy in the past 14 days was administered prior to randomization."} ;; "fibrinolytic therapy in the 14 days prior to randomization"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_thrombolytic_therapy_inthepast14days@@temporalcontext_prior_to_randomization
      patient_has_undergone_thrombolytic_therapy_inthepast14days)
:named REQ3_AUXILIARY0)) ;; "thrombolytic therapy in the past 14 days, specifically in the period prior to randomization"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_thrombolytic_therapy_inthepast14days@@temporalcontext_prior_to_randomization)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received administration of fibrinolytic therapy in the 14 days prior to randomization."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const glycoprotein_iia_iiib_inhibitor_administration_time_value_recorded_prior_to_randomization_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours prior to randomization when glycoprotein IIa/IIIb inhibitor administration occurred.","when_to_set_to_null":"Set to null if the time of glycoprotein IIa/IIIb inhibitor administration prior to randomization is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the time in hours prior to randomization when glycoprotein IIa/IIIb inhibitor administration occurred."} ;; "administration of any glycoprotein IIa/IIIb inhibitor in the 24 hours prior to randomization"

(declare-const patient_has_received_administration_of_glycoprotein_iia_iiib_inhibitor_in_24_hours_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received administration of any glycoprotein IIa/IIIb inhibitor within the 24 hours prior to randomization.","when_to_set_to_false":"Set to false if the patient has not received administration of any glycoprotein IIa/IIIb inhibitor within the 24 hours prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received administration of any glycoprotein IIa/IIIb inhibitor within the 24 hours prior to randomization.","meaning":"Boolean indicating whether the patient has received administration of any glycoprotein IIa/IIIb inhibitor in the 24 hours prior to randomization."} ;; "administration of any glycoprotein IIa/IIIb inhibitor in the 24 hours prior to randomization"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_received_administration_of_glycoprotein_iia_iiib_inhibitor_in_24_hours_prior_to_randomization)
:named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has received administration of any glycoprotein IIa/IIIb inhibitor in the 24 hours prior to randomization."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_taken_low_molecular_weight_heparin_containing_product_inthepast8hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received administration of any low molecular weight heparin-containing product in the 8 hours prior to randomization.","when_to_set_to_false":"Set to false if the patient has not received administration of any low molecular weight heparin-containing product in the 8 hours prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received administration of any low molecular weight heparin-containing product in the 8 hours prior to randomization.","meaning":"Boolean indicating whether the patient has received administration of any low molecular weight heparin-containing product in the 8 hours prior to randomization."} ;; "received administration of any low molecular weight heparin in the 8 hours prior to randomization"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_taken_low_molecular_weight_heparin_containing_product_inthepast8hours)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received administration of any low molecular weight heparin in the 8 hours prior to randomization."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_exposed_to_anticoagulant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to anticoagulant substances (e.g., receiving anticoagulant treatment now).","when_to_set_to_false":"Set to false if the patient is currently not exposed to anticoagulant substances.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to anticoagulant substances.","meaning":"Boolean indicating whether the patient is currently exposed to anticoagulant substances."} ;; "The patient is receiving actual oral anticoagulant treatment."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_exposed_to_anticoagulant_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving actual oral anticoagulant treatment."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_suspicion_of_acute_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient is currently not suspected to have acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have acute myocardial infarction.","meaning":"Boolean indicating whether the patient is currently suspected to have acute myocardial infarction."} ;; "acute myocardial infarction"
(declare-const patient_has_suspicion_of_acute_myocardial_infarction_now@@secondary_to_occlusion_of_one_coronary_artery_lesion Bool) ;; {"when_to_set_to_true":"Set to true if the suspicion of acute myocardial infarction is secondary to occlusion of one coronary artery lesion.","when_to_set_to_false":"Set to false if the suspicion of acute myocardial infarction is not secondary to occlusion of one coronary artery lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the suspicion of acute myocardial infarction is secondary to occlusion of one coronary artery lesion.","meaning":"Boolean indicating whether the suspicion of acute myocardial infarction is secondary to occlusion of one coronary artery lesion."} ;; "suspected acute myocardial infarction secondary to occlusion of one coronary artery lesion"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous coronary intervention within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not undergone percutaneous coronary intervention within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone percutaneous coronary intervention within the past 30 days.","meaning":"Boolean indicating whether the patient has undergone percutaneous coronary intervention within the past 30 days."} ;; "percutaneous coronary intervention within the previous 30 days"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthepast30days@@for_coronary_angioplasty Bool) ;; {"when_to_set_to_true":"Set to true if the percutaneous coronary intervention within the past 30 days was for coronary angioplasty.","when_to_set_to_false":"Set to false if the percutaneous coronary intervention within the past 30 days was not for coronary angioplasty.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the percutaneous coronary intervention within the past 30 days was for coronary angioplasty.","meaning":"Boolean indicating whether the percutaneous coronary intervention within the past 30 days was for coronary angioplasty."} ;; "percutaneous coronary intervention within the previous 30 days for coronary angioplasty"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthepast30days@@for_conventional_coronary_stent Bool) ;; {"when_to_set_to_true":"Set to true if the percutaneous coronary intervention within the past 30 days was for conventional coronary stent.","when_to_set_to_false":"Set to false if the percutaneous coronary intervention within the past 30 days was not for conventional coronary stent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the percutaneous coronary intervention within the past 30 days was for conventional coronary stent.","meaning":"Boolean indicating whether the percutaneous coronary intervention within the past 30 days was for conventional coronary stent."} ;; "percutaneous coronary intervention within the previous 30 days for conventional coronary stent"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous coronary intervention within the past 12 months.","when_to_set_to_false":"Set to false if the patient has not undergone percutaneous coronary intervention within the past 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone percutaneous coronary intervention within the past 12 months.","meaning":"Boolean indicating whether the patient has undergone percutaneous coronary intervention within the past 12 months."} ;; "percutaneous coronary intervention within the previous 12 months"
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthepast12months@@for_coated_coronary_stent Bool) ;; {"when_to_set_to_true":"Set to true if the percutaneous coronary intervention within the past 12 months was for coated coronary stent.","when_to_set_to_false":"Set to false if the percutaneous coronary intervention within the past 12 months was not for coated coronary stent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the percutaneous coronary intervention within the past 12 months was for coated coronary stent.","meaning":"Boolean indicating whether the percutaneous coronary intervention within the past 12 months was for coated coronary stent."} ;; "percutaneous coronary intervention within the previous 12 months for coated coronary stent"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_suspicion_of_acute_myocardial_infarction_now@@secondary_to_occlusion_of_one_coronary_artery_lesion
      patient_has_suspicion_of_acute_myocardial_infarction_now)
:named REQ7_AUXILIARY0)) ;; "suspected acute myocardial infarction secondary to occlusion of one coronary artery lesion"

(assert
(! (=> patient_has_undergone_percutaneous_coronary_intervention_inthepast30days@@for_coronary_angioplasty
      patient_has_undergone_percutaneous_coronary_intervention_inthepast30days)
:named REQ7_AUXILIARY1)) ;; "percutaneous coronary intervention within the previous 30 days for coronary angioplasty"

(assert
(! (=> patient_has_undergone_percutaneous_coronary_intervention_inthepast30days@@for_conventional_coronary_stent
      patient_has_undergone_percutaneous_coronary_intervention_inthepast30days)
:named REQ7_AUXILIARY2)) ;; "percutaneous coronary intervention within the previous 30 days for conventional coronary stent"

(assert
(! (=> patient_has_undergone_percutaneous_coronary_intervention_inthepast12months@@for_coated_coronary_stent
      patient_has_undergone_percutaneous_coronary_intervention_inthepast12months)
:named REQ7_AUXILIARY3)) ;; "percutaneous coronary intervention within the previous 12 months for coated coronary stent"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (and patient_has_suspicion_of_acute_myocardial_infarction_now@@secondary_to_occlusion_of_one_coronary_artery_lesion
             patient_has_undergone_percutaneous_coronary_intervention_inthepast30days@@for_coronary_angioplasty))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected acute myocardial infarction secondary to occlusion of one coronary artery lesion treated previously with percutaneous coronary intervention within the previous 30 days for coronary angioplasty."

(assert
(! (not (and patient_has_suspicion_of_acute_myocardial_infarction_now@@secondary_to_occlusion_of_one_coronary_artery_lesion
             patient_has_undergone_percutaneous_coronary_intervention_inthepast30days@@for_conventional_coronary_stent))
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected acute myocardial infarction secondary to occlusion of one coronary artery lesion treated previously with percutaneous coronary intervention within the previous 30 days for conventional coronary stent."

(assert
(! (not (and patient_has_suspicion_of_acute_myocardial_infarction_now@@secondary_to_occlusion_of_one_coronary_artery_lesion
             patient_has_undergone_percutaneous_coronary_intervention_inthepast12months@@for_coated_coronary_stent))
:named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected acute myocardial infarction secondary to occlusion of one coronary artery lesion treated previously with percutaneous coronary intervention within the previous 12 months for coated coronary stent."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has dementia at the time of randomization.","when_to_set_to_false":"Set to false if the patient does not have dementia at the time of randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has dementia at the time of randomization.","meaning":"Boolean indicating whether the patient has dementia at the time of randomization."} ;; "dementia at the time of randomization"
(declare-const patient_has_finding_of_delirium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has an acute confusional state (delirium) at the time of randomization.","when_to_set_to_false":"Set to false if the patient does not have an acute confusional state (delirium) at the time of randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an acute confusional state (delirium) at the time of randomization.","meaning":"Boolean indicating whether the patient has an acute confusional state (delirium) at the time of randomization."} ;; "acute confusional state at the time of randomization"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_dementia_now)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia at the time of randomization."

(assert
(! (not patient_has_finding_of_delirium_now)
    :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute confusional state at the time of randomization."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_capable_of_giving_informed_consent_at_least_verbally_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of giving informed consent at least verbally.","when_to_set_to_false":"Set to false if the patient is currently incapable of giving informed consent at least verbally.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently capable of giving informed consent at least verbally.","meaning":"Boolean indicating whether the patient is currently capable of giving informed consent at least verbally."} ;; "incapable of giving informed consent at least verbally"
(declare-const patient_is_willing_to_give_informed_consent_at_least_verbally_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently willing to give informed consent at least verbally.","when_to_set_to_false":"Set to false if the patient is currently unwilling to give informed consent at least verbally.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to give informed consent at least verbally.","meaning":"Boolean indicating whether the patient is currently willing to give informed consent at least verbally."} ;; "unwilling to give informed consent at least verbally"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (or (not patient_is_capable_of_giving_informed_consent_at_least_verbally_now)
            (not patient_is_willing_to_give_informed_consent_at_least_verbally_now)))
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is incapable of giving informed consent at least verbally OR unwilling to give informed consent at least verbally."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of renal failure syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of renal failure syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of renal failure syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of renal failure syndrome."} ;; "renal failure"
(declare-const patient_has_diagnosis_of_renal_failure_syndrome_now@@diagnosis_is_known Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of renal failure syndrome is known (confirmed, not suspected or uncertain).","when_to_set_to_false":"Set to false if the diagnosis of renal failure syndrome is not known (i.e., it is only suspected or uncertain).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of renal failure syndrome is known.","meaning":"Boolean indicating whether the diagnosis of renal failure syndrome is known (confirmed, not suspected or uncertain)."} ;; "known renal failure"
(declare-const patient_creatinine_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's creatinine (in mg/dl) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's creatinine measurement (in mg/dl) recorded now."} ;; "creatinine"
(declare-const patient_creatinine_value_recorded_now_withunit_mg_per_dl@@basal_value Bool) ;; {"when_to_set_to_true":"Set to true if the creatinine value recorded now represents the patient's basal (baseline) creatinine.","when_to_set_to_false":"Set to false if the creatinine value recorded now does not represent the basal (baseline) creatinine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the creatinine value is basal.","meaning":"Boolean indicating whether the creatinine value recorded now is the patient's basal (baseline) creatinine."} ;; "basal creatinine"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable for renal failure
(assert
(! (=> patient_has_diagnosis_of_renal_failure_syndrome_now@@diagnosis_is_known
       patient_has_diagnosis_of_renal_failure_syndrome_now)
   :named REQ10_AUXILIARY0)) ;; "known renal failure"

;; Qualifier variable implies corresponding stem variable for basal creatinine
(assert
(! (=> patient_creatinine_value_recorded_now_withunit_mg_per_dl@@basal_value
       true)
   :named REQ10_AUXILIARY1)) ;; "basal creatinine"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (and patient_has_diagnosis_of_renal_failure_syndrome_now@@diagnosis_is_known
             patient_creatinine_value_recorded_now_withunit_mg_per_dl@@basal_value
             (> patient_creatinine_value_recorded_now_withunit_mg_per_dl 2.5)))
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known renal failure AND the patient's basal creatinine is >2.5 mg/dl."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const life_expectancy_value_recorded_now_withunit_months Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's current life expectancy in months.","when_to_set_to_null":"Set to null if the patient's current life expectancy in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current life expectancy in months."} ;; "life expectancy < 12 months"
(declare-const life_expectancy_value_recorded_now_withunit_months@@reduced_due_to_advanced_concomitant_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current life expectancy in months is reduced due to an advanced concomitant condition.","when_to_set_to_false":"Set to false if the patient's current life expectancy in months is not reduced due to an advanced concomitant condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the reduction in life expectancy is due to an advanced concomitant condition.","meaning":"Boolean indicating whether the reduction in the patient's current life expectancy in months is due to an advanced concomitant condition."} ;; "reduced life expectancy < 12 months due to advanced concomitant condition"
(declare-const life_expectancy_value_recorded_now_withunit_months@@reduced_due_to_terminal_concomitant_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current life expectancy in months is reduced due to a terminal concomitant condition.","when_to_set_to_false":"Set to false if the patient's current life expectancy in months is not reduced due to a terminal concomitant condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the reduction in life expectancy is due to a terminal concomitant condition.","meaning":"Boolean indicating whether the reduction in the patient's current life expectancy in months is due to a terminal concomitant condition."} ;; "reduced life expectancy < 12 months due to terminal concomitant condition"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (not (and
            (< life_expectancy_value_recorded_now_withunit_months 12)
            life_expectancy_value_recorded_now_withunit_months@@reduced_due_to_advanced_concomitant_condition))
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has reduced life expectancy < 12 months due to advanced concomitant condition."

(assert
  (! (not (and
            (< life_expectancy_value_recorded_now_withunit_months 12)
            life_expectancy_value_recorded_now_withunit_months@@reduced_due_to_terminal_concomitant_condition))
     :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has reduced life expectancy < 12 months due to terminal concomitant condition."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_participated_in_clinical_trial_assessing_drug_in_thepast30days_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in another clinical trial assessing a drug in the 30 days prior to randomization.","when_to_set_to_false":"Set to false if the patient has not participated in another clinical trial assessing a drug in the 30 days prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in another clinical trial assessing a drug in the 30 days prior to randomization.","meaning":"Boolean indicating whether the patient has participated in another clinical trial assessing a drug in the 30 days prior to randomization."} ;; "the patient has participated in another clinical trial assessing a drug in the 30 days prior to randomization"
(declare-const patient_has_participated_in_clinical_trial_assessing_device_in_thepast30days_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in another clinical trial assessing a device in the 30 days prior to randomization.","when_to_set_to_false":"Set to false if the patient has not participated in another clinical trial assessing a device in the 30 days prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in another clinical trial assessing a device in the 30 days prior to randomization.","meaning":"Boolean indicating whether the patient has participated in another clinical trial assessing a device in the 30 days prior to randomization."} ;; "the patient has participated in another clinical trial assessing a device in the 30 days prior to randomization"
(declare-const patient_has_taken_pharmaceutical_biologic_product_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a pharmaceutical or biologic product (drug) within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not taken a pharmaceutical or biologic product (drug) within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a pharmaceutical or biologic product (drug) within the past 30 days.","meaning":"Boolean indicating whether the patient has taken a pharmaceutical or biologic product (drug) within the past 30 days."} ;; "drug"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_participated_in_clinical_trial_assessing_drug_in_thepast30days_prior_to_randomization)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in another clinical trial assessing a drug in the 30 days prior to randomization."

(assert
(! (not patient_has_participated_in_clinical_trial_assessing_device_in_thepast30days_prior_to_randomization)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in another clinical trial assessing a device in the 30 days prior to randomization."
