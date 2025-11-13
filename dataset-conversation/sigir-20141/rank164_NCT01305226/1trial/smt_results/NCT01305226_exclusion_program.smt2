;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_had_previous_administration_of_staphylokinase Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever previously received administration of staphylokinase at any time in the past.","when_to_set_to_false":"Set to false if the patient has never previously received administration of staphylokinase.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever previously received administration of staphylokinase.","meaning":"Boolean indicating whether the patient has ever previously received administration of staphylokinase."} ;; "has had previous administration of staphylokinase"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_had_previous_administration_of_staphylokinase)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous administration of staphylokinase."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bleeding.","meaning":"Boolean indicating whether the patient currently has bleeding."} ;; "bleeding"
(declare-const patient_has_finding_of_bleeding_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bleeding is active.","when_to_set_to_false":"Set to false if the patient's current bleeding is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bleeding is active.","meaning":"Boolean indicating whether the patient's current bleeding is active."} ;; "active bleeding"
(declare-const patient_has_finding_of_hemorrhagic_diathesis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hemorrhagic diathesis.","when_to_set_to_false":"Set to false if the patient currently does not have hemorrhagic diathesis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hemorrhagic diathesis.","meaning":"Boolean indicating whether the patient currently has hemorrhagic diathesis."} ;; "hemorrhagic diathesis"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for active bleeding implies general bleeding
(assert
(! (=> patient_has_finding_of_bleeding_now@@active
       patient_has_finding_of_bleeding_now)
   :named REQ1_AUXILIARY0)) ;; "active bleeding" implies "bleeding"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have active bleeding
(assert
(! (not patient_has_finding_of_bleeding_now@@active)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active bleeding."

;; Exclusion: patient must NOT have hemorrhagic diathesis
(assert
(! (not patient_has_finding_of_hemorrhagic_diathesis_now)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hemorrhagic diathesis."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of stroke (cerebrovascular accident) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of stroke (cerebrovascular accident) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of stroke (cerebrovascular accident).","meaning":"Boolean indicating whether the patient has any history of stroke (cerebrovascular accident)."} ;; "stroke"

(declare-const patient_has_finding_of_transient_cerebral_ischemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of transient ischemic attack (TIA) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of transient ischemic attack (TIA) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of transient ischemic attack (TIA).","meaning":"Boolean indicating whether the patient has any history of transient ischemic attack (TIA)."} ;; "transient ischemic attack"

(declare-const patient_has_finding_of_dementia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of dementia at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of dementia at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of dementia.","meaning":"Boolean indicating whether the patient has any history of dementia."} ;; "dementia"

(declare-const patient_has_finding_of_structural_central_nervous_system_damage_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had structural central nervous system damage at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had structural central nervous system damage at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had structural central nervous system damage.","meaning":"Boolean indicating whether the patient has any history of structural central nervous system damage."} ;; "structural central nervous system damage"

(declare-const patient_has_finding_of_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of neoplastic disease at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of neoplastic disease at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of neoplastic disease.","meaning":"Boolean indicating whether the patient has any history of neoplastic disease."} ;; "neoplasm"

(declare-const patient_has_finding_of_neoplastic_disease_inthehistory@@located_in_structural_central_nervous_system Bool) ;; {"when_to_set_to_true":"Set to true if the patient's neoplastic disease is located in the structural central nervous system.","when_to_set_to_false":"Set to false if the patient's neoplastic disease is not located in the structural central nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the neoplastic disease is located in the structural central nervous system.","meaning":"Boolean indicating whether the patient's neoplastic disease is located in the structural central nervous system."} ;; "neoplasm located in structural central nervous system"

(declare-const patient_has_finding_of_aneurysm_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of aneurysm at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of aneurysm at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of aneurysm.","meaning":"Boolean indicating whether the patient has any history of aneurysm."} ;; "aneurysm"

(declare-const patient_has_finding_of_aneurysm_inthehistory@@located_in_structural_central_nervous_system Bool) ;; {"when_to_set_to_true":"Set to true if the patient's aneurysm is located in the structural central nervous system.","when_to_set_to_false":"Set to false if the patient's aneurysm is not located in the structural central nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the aneurysm is located in the structural central nervous system.","meaning":"Boolean indicating whether the patient's aneurysm is located in the structural central nervous system."} ;; "aneurysm located in structural central nervous system"

(declare-const patient_has_finding_of_arteriovenous_malformation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an arteriovenous malformation at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had an arteriovenous malformation at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an arteriovenous malformation.","meaning":"Boolean indicating whether the patient has any history of arteriovenous malformation."} ;; "arteriovenous malformation"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term for structural central nervous system damage
(assert
(! (=> (or patient_has_finding_of_neoplastic_disease_inthehistory@@located_in_structural_central_nervous_system
           patient_has_finding_of_aneurysm_inthehistory@@located_in_structural_central_nervous_system
           patient_has_finding_of_arteriovenous_malformation_inthehistory)
        patient_has_finding_of_structural_central_nervous_system_damage_inthehistory)
:named REQ2_AUXILIARY0)) ;; "structural central nervous system damage with non-exhaustive examples (neoplasm, aneurysm, arteriovenous malformation)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_neoplastic_disease_inthehistory@@located_in_structural_central_nervous_system
       patient_has_finding_of_neoplastic_disease_inthehistory)
:named REQ2_AUXILIARY1)) ;; "neoplasm located in structural central nervous system"

(assert
(! (=> patient_has_finding_of_aneurysm_inthehistory@@located_in_structural_central_nervous_system
       patient_has_finding_of_aneurysm_inthehistory)
:named REQ2_AUXILIARY2)) ;; "aneurysm located in structural central nervous system"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any history of stroke."

(assert
(! (not patient_has_finding_of_transient_cerebral_ischemia_inthehistory)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any history of transient ischemic attack."

(assert
(! (not patient_has_finding_of_dementia_inthehistory)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any history of dementia."

(assert
(! (not patient_has_finding_of_structural_central_nervous_system_damage_inthehistory)
:named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any history of structural central nervous system damage with non-exhaustive examples (neoplasm, aneurysm, arteriovenous malformation)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_surgical_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a surgical procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a surgical procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a surgical procedure.","meaning":"Boolean indicating whether the patient has ever undergone a surgical procedure in the past."} ;; "the patient has had major surgery"
(declare-const patient_has_undergone_surgical_procedure_inthehistory@@major Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure undergone by the patient was major.","when_to_set_to_false":"Set to false if the surgical procedure undergone by the patient was not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure was major.","meaning":"Boolean indicating whether the surgical procedure was major."} ;; "major surgery"
(declare-const patient_has_finding_of_traumatic_injury_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a traumatic injury within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had a traumatic injury within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a traumatic injury within the past 3 months.","meaning":"Boolean indicating whether the patient has had a traumatic injury within the past 3 months."} ;; "trauma within the past 3 months"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_surgical_procedure_inthehistory@@major
      patient_has_undergone_surgical_procedure_inthehistory)
:named REQ3_AUXILIARY0)) ;; "major surgery" implies "surgical procedure"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have had major surgery OR trauma within the past 3 months
(assert
(! (not (or patient_has_undergone_surgical_procedure_inthehistory@@major
            patient_has_finding_of_traumatic_injury_inthepast3months))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had major surgery) OR (the patient has had trauma within the past 3 months)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a systolic blood pressure measurement (in millimeters of mercury) is available at any time in the patient's history (specifically, from admission to randomization).","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's systolic blood pressure (mmHg) measured at any time in the patient's history."} ;; "systolic blood pressure"
(declare-const patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@temporalcontext_from_admission_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the systolic blood pressure measurement was taken during the period from admission to randomization.","when_to_set_to_false":"Set to false if the measurement was not taken during this period.","when_to_set_to_null":"Set to null if it is unknown whether the measurement was taken during this period.","meaning":"Boolean indicating whether the systolic blood pressure measurement was taken from admission to randomization."} ;; "systolic blood pressure ... at any time from admission to randomization"
(declare-const patient_diastolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if a diastolic blood pressure measurement (in millimeters of mercury) is available at any time in the patient's history (specifically, from admission to randomization).","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's diastolic blood pressure (mmHg) measured at any time in the patient's history."} ;; "diastolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@temporalcontext_from_admission_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the diastolic blood pressure measurement was taken during the period from admission to randomization.","when_to_set_to_false":"Set to false if the measurement was not taken during this period.","when_to_set_to_null":"Set to null if it is unknown whether the measurement was taken during this period.","meaning":"Boolean indicating whether the diastolic blood pressure measurement was taken from admission to randomization."} ;; "diastolic blood pressure ... at any time from admission to randomization"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or
    (and patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@temporalcontext_from_admission_to_randomization
         (>= patient_systolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury 180))
    (and patient_diastolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury@@temporalcontext_from_admission_to_randomization
         (>= patient_diastolic_blood_pressure_value_recorded_inthehistory_withunit_millimeters_of_mercury 110))
    ))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has systolic blood pressure greater than or equal to 180 millimeters of mercury at any time from admission to randomization) OR (the patient has diastolic blood pressure greater than or equal to 110 millimeters of mercury at any time from admission to randomization)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_currently_being_treated_with_vitamin_k_antagonist Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with a vitamin K antagonist.","when_to_set_to_false":"Set to false if the patient is not currently being treated with a vitamin K antagonist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with a vitamin K antagonist.","meaning":"Boolean indicating whether the patient is currently being treated with a vitamin K antagonist."} ;; "the patient is currently being treated with vitamin K antagonist"
(declare-const patient_international_normalized_ratio_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured INR value if a numeric measurement of the patient's international normalized ratio (INR) is recorded now.","when_to_set_to_null":"Set to null if no such INR measurement is available for the current time or the value is indeterminate.","meaning":"Numeric value representing the patient's current international normalized ratio (INR)."} ;; "international normalized ratio greater than 1.5"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and patient_is_currently_being_treated_with_vitamin_k_antagonist
             (> patient_international_normalized_ratio_value_recorded_now_withunit_ratio 1.5)))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently being treated with vitamin K antagonist resulting in international normalized ratio greater than 1.5."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_difficult_venous_access_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently assessed or documented as having difficulty with vascular access.","when_to_set_to_false":"Set to false if the patient is currently assessed or documented as not having difficulty with vascular access.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has difficulty with vascular access.","meaning":"Boolean indicating whether the patient currently has difficulty with vascular access."} ;; "difficulty with vascular access"
(declare-const patient_has_finding_of_difficult_venous_access_now@@anticipated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's difficulty with vascular access is anticipated (expected or predicted, even if not currently present).","when_to_set_to_false":"Set to false if the patient's difficulty with vascular access is not anticipated (i.e., not expected or predicted).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether difficulty with vascular access is anticipated.","meaning":"Boolean indicating whether the patient's difficulty with vascular access is anticipated (expected or predicted)."} ;; "anticipated to have difficulty with vascular access"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_difficult_venous_access_now@@anticipated
      patient_has_finding_of_difficult_venous_access_now)
   :named REQ6_AUXILIARY0)) ;; "anticipated to have difficulty with vascular access"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_difficult_venous_access_now@@anticipated)
   :named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is anticipated to have difficulty with vascular access."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_cardiopulmonary_resuscitation_value_recorded_inthehistory_withunit_minutes Real) ;; {"when_to_set_to_value":"Set to the duration in minutes of the most relevant episode of CPR the patient has undergone in their history, if available.","when_to_set_to_null":"Set to null if the duration in minutes of CPR is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in minutes of the most relevant episode of CPR the patient has undergone in their history."} ;; "cardiopulmonary resuscitation with duration greater than 10 minutes"

(declare-const patient_has_undergone_cardiopulmonary_resuscitation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone cardiopulmonary resuscitation (CPR) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone cardiopulmonary resuscitation (CPR) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone cardiopulmonary resuscitation (CPR).","meaning":"Boolean indicating whether the patient has ever undergone cardiopulmonary resuscitation (CPR) in their history."} ;; "cardiopulmonary resuscitation"

(declare-const patient_has_undergone_cardiopulmonary_resuscitation_inthehistory@@prolonged Bool) ;; {"when_to_set_to_true":"Set to true if the instance of CPR undergone by the patient was prolonged.","when_to_set_to_false":"Set to false if the instance of CPR undergone by the patient was not prolonged.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the CPR was prolonged.","meaning":"Boolean indicating whether the CPR undergone by the patient was prolonged."} ;; "prolonged cardiopulmonary resuscitation"

(declare-const patient_has_finding_of_cardiogenic_shock_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding or diagnosis of cardiogenic shock at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a finding or diagnosis of cardiogenic shock at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding or diagnosis of cardiogenic shock.","meaning":"Boolean indicating whether the patient has ever had a finding or diagnosis of cardiogenic shock in their history."} ;; "cardiogenic shock"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Definition: Prolonged CPR = CPR with duration > 10 minutes
(assert
(! (= patient_has_undergone_cardiopulmonary_resuscitation_inthehistory@@prolonged
(and patient_has_undergone_cardiopulmonary_resuscitation_inthehistory
(> patient_cardiopulmonary_resuscitation_value_recorded_inthehistory_withunit_minutes 10)))
:named REQ7_AUXILIARY0)) ;; "prolonged cardiopulmonary resuscitation with duration greater than 10 minutes"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_cardiopulmonary_resuscitation_inthehistory@@prolonged
patient_has_undergone_cardiopulmonary_resuscitation_inthehistory)
:named REQ7_AUXILIARY1)) ;; "prolonged CPR implies CPR"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have had prolonged CPR (>10 min) OR cardiogenic shock
(assert
(! (not (or patient_has_undergone_cardiopulmonary_resuscitation_inthehistory@@prolonged
            patient_has_finding_of_cardiogenic_shock_inthehistory))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had prolonged cardiopulmonary resuscitation with duration greater than 10 minutes) OR (the patient has had cardiogenic shock)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_clinical_drug_trial_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a clinical drug trial at any time within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not undergone a clinical drug trial within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a clinical drug trial within the past 30 days.","meaning":"Boolean indicating whether the patient has undergone a clinical drug trial within the past 30 days."} ;; "investigational drug study within the past 30 days"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_undergone_clinical_drug_trial_inthepast30days)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in investigational drug study within the past 30 days."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const patient_has_given_birth_within_previous_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has given birth within the previous 30 days.","when_to_set_to_false":"Set to false if the patient has not given birth within the previous 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has given birth within the previous 30 days.","meaning":"Boolean indicating whether the patient has given birth within the previous 30 days."} ;; "the patient has given birth within the previous 30 days"
(declare-const days_since_patient_last_gave_birth_value_recorded_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient last gave birth, recorded in days.","when_to_set_to_null":"Set to null if the number of days since the patient last gave birth is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of days since the patient last gave birth, recorded in days."} ;; "number of days since the patient last gave birth"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Definition: patient_has_given_birth_within_previous_30_days is true iff days_since_patient_last_gave_birth_value_recorded_in_days >= 0 and < 30
(assert
(! (= patient_has_given_birth_within_previous_30_days
    (and (>= days_since_patient_last_gave_birth_value_recorded_in_days 0)
         (< days_since_patient_last_gave_birth_value_recorded_in_days 30)))
:named REQ9_AUXILIARY0)) ;; "the patient has given birth within the previous 30 days"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_lactating_now)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

(assert
(! (not patient_has_given_birth_within_previous_30_days)
:named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has given birth within the previous 30 days."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_serious_concomitant_systemic_disorder_incompatible_with_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any serious concomitant systemic disorder that would be incompatible with the trial.","when_to_set_to_false":"Set to false if the patient currently does not have any serious concomitant systemic disorder that would be incompatible with the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any serious concomitant systemic disorder that would be incompatible with the trial.","meaning":"Boolean indicating whether the patient currently has any serious concomitant systemic disorder that would be incompatible with the trial."} ;; "serious concomitant systemic disorder that would be incompatible with the trial"

(declare-const patient_has_finding_of_serious_concomitant_life_limiting_disorder_incompatible_with_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any serious concomitant life-limiting disorder that would be incompatible with the trial.","when_to_set_to_false":"Set to false if the patient currently does not have any serious concomitant life-limiting disorder that would be incompatible with the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any serious concomitant life-limiting disorder that would be incompatible with the trial.","meaning":"Boolean indicating whether the patient currently has any serious concomitant life-limiting disorder that would be incompatible with the trial."} ;; "serious concomitant life-limiting disorder that would be incompatible with the trial"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_serious_concomitant_systemic_disorder_incompatible_with_trial_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any serious concomitant systemic disorder that would be incompatible with the trial."

(assert
(! (not patient_has_finding_of_serious_concomitant_life_limiting_disorder_incompatible_with_trial_now)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any serious concomitant life-limiting disorder that would be incompatible with the trial."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a malignant neoplastic disease (malignant disease) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a malignant neoplastic disease (malignant disease) in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a malignant neoplastic disease (malignant disease) in their medical history.","meaning":"Boolean indicating whether the patient has ever had a malignant neoplastic disease (malignant disease) in their medical history."} ;; "malignant disease"
(declare-const patient_has_finding_of_life_limiting_malignant_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a life-limiting malignant disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a life-limiting malignant disease in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a life-limiting malignant disease in their medical history.","meaning":"Boolean indicating whether the patient has ever had a life-limiting malignant disease in their medical history."} ;; "life-limiting malignant disease"
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding or diagnosis of human immunodeficiency virus (HIV) infection at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a finding or diagnosis of human immunodeficiency virus (HIV) infection in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding or diagnosis of human immunodeficiency virus (HIV) infection in their medical history.","meaning":"Boolean indicating whether the patient has ever had a finding or diagnosis of human immunodeficiency virus (HIV) infection in their medical history."} ;; "human immunodeficiency virus infection"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_malignant_neoplastic_disease_inthehistory)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of malignant disease."

(assert
(! (not patient_has_finding_of_life_limiting_malignant_disease_inthehistory)
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of life-limiting malignant disease."

(assert
(! (not patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory)
:named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of human immunodeficiency virus infection."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_abnormal_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of abnormal liver function (hepatic dysfunction).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of abnormal liver function (hepatic dysfunction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal liver function (hepatic dysfunction).","meaning":"Boolean indicating whether the patient currently has abnormal liver function (hepatic dysfunction)."} ;; "hepatic dysfunction"
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal impairment (renal dysfunction).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal impairment (renal dysfunction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal impairment (renal dysfunction).","meaning":"Boolean indicating whether the patient currently has renal impairment (renal dysfunction)."} ;; "renal dysfunction"
(declare-const patient_has_finding_of_condition_unsuitable_for_study_entry_investigator_opinion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any condition which, in the opinion of the Investigator, makes the patient unsuitable for study entry.","when_to_set_to_false":"Set to false if the patient currently does not have any condition which, in the opinion of the Investigator, makes the patient unsuitable for study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any condition which, in the opinion of the Investigator, makes the patient unsuitable for study entry.","meaning":"Boolean indicating whether the patient currently has any condition which, in the opinion of the Investigator, makes the patient unsuitable for study entry."} ;; "any other condition which, in the opinion of the Investigator, makes the patient unsuitable for study entry"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_abnormal_liver_function_now)
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hepatic dysfunction."

(assert
(! (not patient_has_finding_of_renal_impairment_now)
    :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal dysfunction."

(assert
(! (not patient_has_finding_of_condition_unsuitable_for_study_entry_investigator_opinion_now)
    :named REQ12_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other condition which, in the opinion of the Investigator, makes the patient unsuitable for study entry."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_previously_participated_in_this_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated in this specific clinical trial.","when_to_set_to_false":"Set to false if the patient has not previously participated in this specific clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated in this specific clinical trial.","meaning":"Boolean indicating whether the patient has previously participated in this specific clinical trial."} ;; "The patient is excluded if the patient has previously participated in this trial."

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_previously_participated_in_this_trial)
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously participated in this trial."
