;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_undergoing_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a clinical trial.","when_to_set_to_false":"Set to false if the patient is currently not participating in a clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a clinical trial.","meaning":"Boolean indicating whether the patient is currently participating in a clinical trial."} ;; "currently participating in another clinical trial"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_undergoing_clinical_trial_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently participating in another clinical trial."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_myocardial_infarction_inthepast4days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an acute myocardial infarction within the past four days.","when_to_set_to_false":"Set to false if the patient has not had an acute myocardial infarction within the past four days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an acute myocardial infarction within the past four days.","meaning":"Boolean indicating whether the patient has had an acute myocardial infarction within the past four days."} ;; "acute myocardial infarction within the past four days"

(declare-const patient_has_finding_of_acute_myocardial_infarction_inthepast4days@@treated_with_thrombolytic_agent Bool) ;; {"when_to_set_to_true":"Set to true if the acute myocardial infarction within the past four days was treated with a thrombolytic agent.","when_to_set_to_false":"Set to false if the acute myocardial infarction within the past four days was not treated with a thrombolytic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute myocardial infarction within the past four days was treated with a thrombolytic agent.","meaning":"Boolean indicating whether the acute myocardial infarction within the past four days was treated with a thrombolytic agent."} ;; "acute myocardial infarction within the past four days treated with a thrombolytic agent"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_acute_myocardial_infarction_inthepast4days@@treated_with_thrombolytic_agent
      patient_has_finding_of_acute_myocardial_infarction_inthepast4days)
:named REQ1_AUXILIARY0)) ;; "acute myocardial infarction within the past four days treated with a thrombolytic agent" implies "acute myocardial infarction within the past four days"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_acute_myocardial_infarction_inthepast4days@@treated_with_thrombolytic_agent)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had acute myocardial infarction treated with a thrombolytic agent within the preceding four days."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure (in mmHg) is recorded now.","when_to_set_to_null":"Set to null if no systolic blood pressure measurement is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's systolic blood pressure (mmHg) measured now."} ;; "systolic blood pressure"
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_on_one_measurement Bool) ;; {"when_to_set_to_true":"Set to true if the systolic blood pressure value recorded now is from a single measurement.","when_to_set_to_false":"Set to false if the systolic blood pressure value recorded now is not from a single measurement (e.g., averaged or multiple readings).","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the value is from a single measurement.","meaning":"Indicates whether the systolic blood pressure value recorded now is from a single measurement."} ;; "systolic blood pressure greater than 180 millimeters of mercury on one measurement"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's diastolic blood pressure (in mmHg) is recorded now.","when_to_set_to_null":"Set to null if no diastolic blood pressure measurement is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's diastolic blood pressure (mmHg) measured now."} ;; "diastolic blood pressure"
(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_on_one_measurement Bool) ;; {"when_to_set_to_true":"Set to true if the diastolic blood pressure value recorded now is from a single measurement.","when_to_set_to_false":"Set to false if the diastolic blood pressure value recorded now is not from a single measurement (e.g., averaged or multiple readings).","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the value is from a single measurement.","meaning":"Indicates whether the diastolic blood pressure value recorded now is from a single measurement."} ;; "diastolic blood pressure greater than 100 millimeters of mercury on one measurement"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or
         (and patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_on_one_measurement
              (> patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 180))
         (and patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury@@measured_on_one_measurement
              (> patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 100))
      ))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has systolic blood pressure greater than 180 millimeters of mercury on one measurement) OR (the patient has diastolic blood pressure greater than 100 millimeters of mercury on one measurement)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_blood_coagulation_disorder_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a blood coagulation disorder within the past six months.","when_to_set_to_false":"Set to false if the patient has not had a blood coagulation disorder within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a blood coagulation disorder within the past six months.","meaning":"Boolean indicating whether the patient has had a blood coagulation disorder within the past six months."} ;; "bleeding disorder within the past six months"
(declare-const patient_has_finding_of_blood_coagulation_disorder_inthepast6months@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the blood coagulation disorder within the past six months is significant.","when_to_set_to_false":"Set to false if the blood coagulation disorder within the past six months is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the blood coagulation disorder within the past six months is significant.","meaning":"Boolean indicating whether the blood coagulation disorder within the past six months is significant."} ;; "significant bleeding disorder within the past six months"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_blood_coagulation_disorder_inthepast6months@@is_significant
       patient_has_finding_of_blood_coagulation_disorder_inthepast6months)
   :named REQ3_AUXILIARY0)) ;; "significant bleeding disorder within the past six months" (qualifier implies stem)

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_inthepast6months@@is_significant)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a significant bleeding disorder within the past six months."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_surgical_procedure_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any surgical procedure within the past three months.","when_to_set_to_false":"Set to false if the patient has not undergone any surgical procedure within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any surgical procedure within the past three months.","meaning":"Boolean indicating whether the patient has undergone any surgical procedure within the past three months."} ;; "major surgery within the past three months"
(declare-const patient_has_undergone_surgical_procedure_inthepast3months@@is_major Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure undergone within the past three months is major.","when_to_set_to_false":"Set to false if the surgical procedure undergone within the past three months is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure is major.","meaning":"Boolean indicating whether the surgical procedure undergone within the past three months is major."} ;; "major surgery within the past three months"
(declare-const patient_has_undergone_biopsy_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any biopsy procedure within the past three months.","when_to_set_to_false":"Set to false if the patient has not undergone any biopsy procedure within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any biopsy procedure within the past three months.","meaning":"Boolean indicating whether the patient has undergone any biopsy procedure within the past three months."} ;; "biopsy of a parenchymal organ within the past three months"
(declare-const patient_has_undergone_biopsy_inthepast3months@@of_parenchymal_organ Bool) ;; {"when_to_set_to_true":"Set to true if the biopsy procedure undergone within the past three months is of a parenchymal organ.","when_to_set_to_false":"Set to false if the biopsy procedure undergone within the past three months is not of a parenchymal organ.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biopsy procedure is of a parenchymal organ.","meaning":"Boolean indicating whether the biopsy procedure undergone within the past three months is of a parenchymal organ."} ;; "biopsy of a parenchymal organ within the past three months"
(declare-const patient_has_finding_of_traumatic_injury_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had any traumatic injury within the past three months.","when_to_set_to_false":"Set to false if the patient has not had any traumatic injury within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had any traumatic injury within the past three months.","meaning":"Boolean indicating whether the patient has had any traumatic injury within the past three months."} ;; "significant trauma within the past three months"
(declare-const patient_has_finding_of_traumatic_injury_inthepast3months@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the traumatic injury within the past three months is significant.","when_to_set_to_false":"Set to false if the traumatic injury within the past three months is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the traumatic injury is significant.","meaning":"Boolean indicating whether the traumatic injury within the past three months is significant."} ;; "significant trauma within the past three months"
(declare-const patient_has_finding_of_acute_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have an acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute myocardial infarction.","meaning":"Boolean indicating whether the patient currently has an acute myocardial infarction."} ;; "acute myocardial infarction"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_surgical_procedure_inthepast3months@@is_major
      patient_has_undergone_surgical_procedure_inthepast3months)
    :named REQ4_AUXILIARY0)) ;; "major surgery within the past three months"

(assert
(! (=> patient_has_undergone_biopsy_inthepast3months@@of_parenchymal_organ
      patient_has_undergone_biopsy_inthepast3months)
    :named REQ4_AUXILIARY1)) ;; "biopsy of a parenchymal organ within the past three months"

(assert
(! (=> patient_has_finding_of_traumatic_injury_inthepast3months@@is_significant
      patient_has_finding_of_traumatic_injury_inthepast3months)
    :named REQ4_AUXILIARY2)) ;; "significant trauma within the past three months"

;; Non-exhaustive example: any trauma associated with the current acute myocardial infarction
(assert
(! (=> (and patient_has_finding_of_traumatic_injury_inthepast3months
            patient_has_finding_of_acute_myocardial_infarction_now)
      patient_has_finding_of_traumatic_injury_inthepast3months@@is_significant)
    :named REQ4_AUXILIARY3)) ;; "any trauma associated with the current acute myocardial infarction" is a non-exhaustive example of significant trauma

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_undergone_surgical_procedure_inthepast3months@@is_major)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "major surgery within the past three months"

(assert
(! (not patient_has_undergone_biopsy_inthepast3months@@of_parenchymal_organ)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "biopsy of a parenchymal organ within the past three months"

(assert
(! (not patient_has_finding_of_traumatic_injury_inthepast3months@@is_significant)
    :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "significant trauma within the past three months with non-exhaustive examples (any trauma associated with the current acute myocardial infarction)"

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cerebrovascular accident (stroke) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cerebrovascular accident (stroke) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of cerebrovascular accident (stroke) in their history."} ;; "stroke"

(declare-const patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with transient cerebral ischemia (transient ischaemic attack) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with transient cerebral ischemia (transient ischaemic attack) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with transient cerebral ischemia (transient ischaemic attack).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of transient cerebral ischemia (transient ischaemic attack) in their history."} ;; "transient ischaemic attack"

(declare-const patient_has_history_of_central_nervous_system_structural_damage Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had central nervous system structural damage at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had central nervous system structural damage at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had central nervous system structural damage.","meaning":"Boolean indicating whether the patient has ever had a history of central nervous system structural damage."} ;; "central nervous system structural damage"

(declare-const patient_has_history_of_central_nervous_system_structural_damage@@with_examples_neoplasm_aneurysm_intracranial_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of central nervous system structural damage includes (but is not limited to) neoplasm, aneurysm, or intracranial surgery.","when_to_set_to_false":"Set to false if the patient's history of central nervous system structural damage does not include neoplasm, aneurysm, or intracranial surgery, or if there is no history of such damage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of central nervous system structural damage includes neoplasm, aneurysm, or intracranial surgery.","meaning":"Boolean indicating whether the patient's history of central nervous system structural damage includes (but is not limited to) neoplasm, aneurysm, or intracranial surgery."} ;; "central nervous system structural damage with non-exhaustive examples (neoplasm, aneurysm, intracranial surgery)"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> patient_has_history_of_central_nervous_system_structural_damage@@with_examples_neoplasm_aneurysm_intracranial_surgery
      patient_has_history_of_central_nervous_system_structural_damage)
:named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (neoplasm, aneurysm, intracranial surgery)"

;; Qualifier variable implies corresponding stem variable
;; (already covered above, no further auxiliary needed)

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_cerebrovascular_accident_inthehistory)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of stroke."

(assert
(! (not patient_has_diagnosis_of_transient_cerebral_ischemia_inthehistory)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of transient ischaemic attack."

(assert
(! (not patient_has_history_of_central_nervous_system_structural_damage)
:named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of central nervous system structural damage with non-exhaustive examples (neoplasm, aneurysm, intracranial surgery)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_undergoing_anticoagulant_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving anticoagulant therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving anticoagulant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving anticoagulant therapy.","meaning":"Boolean indicating whether the patient is currently undergoing anticoagulant therapy."} ;; "anticoagulation therapy"
(declare-const patient_is_undergoing_anticoagulant_therapy_now@@route_oral Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing anticoagulant therapy and the route of administration is oral.","when_to_set_to_false":"Set to false if the patient is currently undergoing anticoagulant therapy and the route of administration is not oral.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the route of administration for current anticoagulant therapy is oral.","meaning":"Boolean indicating whether the patient is currently undergoing anticoagulant therapy via the oral route."} ;; "oral anticoagulation therapy"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_anticoagulant_therapy_now@@route_oral
       patient_is_undergoing_anticoagulant_therapy_now)
   :named REQ6_AUXILIARY0)) ;; "oral anticoagulation therapy" implies "anticoagulation therapy"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_undergoing_anticoagulant_therapy_now@@route_oral)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving oral anticoagulation therapy."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_undergone_puncture_of_vessel_inthepast10days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a vascular puncture procedure within the past ten days.","when_to_set_to_false":"Set to false if the patient has not undergone a vascular puncture procedure within the past ten days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a vascular puncture procedure within the past ten days.","meaning":"Boolean indicating whether the patient has undergone a vascular puncture procedure within the past ten days."} ;; "vascular puncture within the past ten days"
(declare-const patient_has_undergone_puncture_of_vessel_inthepast10days@@non_compressible Bool) ;; {"when_to_set_to_true":"Set to true if the vascular puncture procedure undergone by the patient within the past ten days was non-compressible.","when_to_set_to_false":"Set to false if the vascular puncture procedure undergone by the patient within the past ten days was compressible.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the vascular puncture procedure was non-compressible.","meaning":"Boolean indicating whether the vascular puncture procedure within the past ten days was non-compressible."} ;; "non-compressible vascular puncture within the past ten days"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_puncture_of_vessel_inthepast10days@@non_compressible
      patient_has_undergone_puncture_of_vessel_inthepast10days)
:named REQ7_AUXILIARY0)) ;; "non-compressible vascular puncture within the past ten days"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_undergone_puncture_of_vessel_inthepast10days@@non_compressible)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has had a non-compressible vascular puncture within the past ten days."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if there is evidence that the patient is currently pregnant, such as a positive urine pregnancy test.","when_to_set_to_false":"Set to false if there is evidence that the patient is not currently pregnant, such as a negative pregnancy test or clinical documentation of non-pregnancy.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant with definition (positive urine pregnancy test)"

(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if there is evidence that the patient is currently lactating (producing breast milk).","when_to_set_to_false":"Set to false if there is evidence that the patient is not currently lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

(declare-const patients_lactation_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently lactating.","meaning":"Boolean indicating whether the patient is currently lactating."} ;; "lactating"

(declare-const patients_human_parturition_function_is_positive_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had parturition (childbirth) in the past 30 days.","when_to_set_to_false":"Set to false if the patient has not had parturition (childbirth) in the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had parturition (childbirth) in the past 30 days.","meaning":"Boolean indicating whether the patient has had parturition (childbirth) in the past 30 days."} ;; "the patient has had parturition within the previous thirty days"

(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have childbearing potential (e.g., premenopausal female without sterilization or other permanent infertility).","when_to_set_to_false":"Set to false if the patient is not considered to have childbearing potential (e.g., postmenopausal, surgically sterile, or otherwise permanently infertile).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "the patient is a female of childbearing potential"

(declare-const patient_is_using_adequate_birth_control_now Bool) ;; {"when_to_set_to_true":"Set to true if there is evidence that the patient is currently using adequate birth control.","when_to_set_to_false":"Set to false if there is evidence that the patient is currently not using adequate birth control.","when_to_set_to_null":"Set to null if the patient's current birth control status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently using adequate birth control."} ;; "the patient is not using adequate birth control"

(declare-const patient_is_using_adequate_birth_control_now@@oral_contraception Bool) ;; {"when_to_set_to_true":"Set to true if there is evidence that the patient is currently using oral contraception as a form of adequate birth control.","when_to_set_to_false":"Set to false if there is evidence that the patient is currently not using oral contraception as a form of adequate birth control.","when_to_set_to_null":"Set to null if the patient's current use of oral contraception as birth control is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently using oral contraception as a form of adequate birth control."} ;; "oral contraception"

(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female."} ;; "the patient has had parturition within the previous thirty days"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Definition: pregnancy = positive urine pregnancy test (direct mapping, so no auxiliary needed)

;; Exhaustive subcategories for adequate birth control: oral contraception
(assert
(! (= patient_is_using_adequate_birth_control_now
     patient_is_using_adequate_birth_control_now@@oral_contraception)
:named REQ8_AUXILIARY0)) ;; "adequate birth control with exhaustive subcategories (oral contraception)"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient is excluded if the patient is pregnant with definition (positive urine pregnancy test)"

(assert
(! (not (or patient_is_lactating_now patients_lactation_is_positive_now))
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is excluded if the patient is lactating"

(assert
(! (not patients_human_parturition_function_is_positive_inthepast30days)
:named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient is excluded if the patient has had parturition within the previous thirty days"

(assert
(! (not (and patient_has_childbearing_potential_now
             (not patient_is_using_adequate_birth_control_now)))
:named REQ8_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is excluded if (the patient is a female of childbearing potential) AND (the patient is not using adequate birth control with exhaustive subcategories (oral contraception))"

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has liver disease.","meaning":"Boolean indicating whether the patient currently has liver disease."} ;; "liver disease"
(declare-const patient_has_finding_of_disease_of_liver_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has liver disease and the disease is severe.","when_to_set_to_false":"Set to false if the patient currently has liver disease but the disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the liver disease is severe.","meaning":"Boolean indicating whether the patient's current liver disease is severe."} ;; "severe liver disease"
(declare-const patient_has_finding_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic failure.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic failure.","meaning":"Boolean indicating whether the patient currently has hepatic failure."} ;; "hepatic failure"
(declare-const patient_has_finding_of_cirrhosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cirrhosis.","when_to_set_to_false":"Set to false if the patient currently does not have cirrhosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cirrhosis.","meaning":"Boolean indicating whether the patient currently has cirrhosis."} ;; "cirrhosis"
(declare-const patient_has_finding_of_portal_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has portal hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have portal hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has portal hypertension.","meaning":"Boolean indicating whether the patient currently has portal hypertension."} ;; "portal hypertension"
(declare-const patient_has_finding_of_portal_hypertension_now@@with_oesophageal_varices Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current portal hypertension is accompanied by oesophageal varices.","when_to_set_to_false":"Set to false if the patient's current portal hypertension is not accompanied by oesophageal varices.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current portal hypertension is accompanied by oesophageal varices.","meaning":"Boolean indicating whether the patient's current portal hypertension is accompanied by oesophageal varices."} ;; "portal hypertension with non-exhaustive examples (oesophageal varices)"
(declare-const patient_has_finding_of_inflammatory_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hepatitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hepatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatitis.","meaning":"Boolean indicating whether the patient currently has hepatitis."} ;; "hepatitis"
(declare-const patient_has_finding_of_inflammatory_disease_of_liver_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatitis and the hepatitis is active.","when_to_set_to_false":"Set to false if the patient currently has hepatitis but the hepatitis is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hepatitis is active.","meaning":"Boolean indicating whether the patient's current hepatitis is active."} ;; "active hepatitis"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Non-exhaustive examples imply umbrella term (hepatic failure, cirrhosis, portal hypertension, active hepatitis ⇒ severe liver disease)
(assert
(! (=> (or patient_has_finding_of_hepatic_failure_now
          patient_has_finding_of_cirrhosis_now
          patient_has_finding_of_portal_hypertension_now
          patient_has_finding_of_inflammatory_disease_of_liver_now@@active)
     patient_has_finding_of_disease_of_liver_now@@severe)
:named REQ9_AUXILIARY0)) ;; "with non-exhaustive examples (hepatic failure, cirrhosis, portal hypertension, active hepatitis)"

;; Non-exhaustive example: oesophageal varices implies portal hypertension
(assert
(! (=> patient_has_finding_of_portal_hypertension_now@@with_oesophageal_varices
     patient_has_finding_of_portal_hypertension_now)
:named REQ9_AUXILIARY1)) ;; "portal hypertension with non-exhaustive examples (oesophageal varices)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disease_of_liver_now@@severe
     patient_has_finding_of_disease_of_liver_now)
:named REQ9_AUXILIARY2)) ;; "severe liver disease"

(assert
(! (=> patient_has_finding_of_inflammatory_disease_of_liver_now@@active
     patient_has_finding_of_inflammatory_disease_of_liver_now)
:named REQ9_AUXILIARY3)) ;; "active hepatitis"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_disease_of_liver_now@@severe)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe liver disease with non-exhaustive examples (hepatic failure, cirrhosis, portal hypertension with non-exhaustive examples (oesophageal varices), active hepatitis)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes"
(declare-const patient_has_history_of_retinopathy_definite Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a definite history of retinopathy.","when_to_set_to_false":"Set to false if the patient does not have a definite history of retinopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a definite history of retinopathy.","meaning":"Boolean indicating whether the patient has a definite history of retinopathy."} ;; "definite history of retinopathy"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (and patient_has_diagnosis_of_diabetes_mellitus_now
             patient_has_history_of_retinopathy_definite))
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has (diabetes AND a definite history of retinopathy)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_serious_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another serious illness (other than those separately specified).","when_to_set_to_false":"Set to false if the patient currently does not have another serious illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another serious illness.","meaning":"Boolean indicating whether the patient currently has another serious illness (other than those separately specified)."} ;; "another serious illness"

(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease."} ;; "malignancy"

(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant neoplastic disease is considered serious.","when_to_set_to_false":"Set to false if the patient's malignant neoplastic disease is not considered serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's malignant neoplastic disease is serious.","meaning":"Boolean indicating whether the patient's malignant neoplastic disease is serious."} ;; "malignancy (serious)"

(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} ;; "active infection"

(declare-const patient_has_finding_of_disorder_due_to_infection_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disorder due to infection is active.","when_to_set_to_false":"Set to false if the patient's disorder due to infection is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disorder due to infection is active.","meaning":"Boolean indicating whether the patient's disorder due to infection is active."} ;; "active infection"

(declare-const patient_has_finding_of_disorder_due_to_infection_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disorder due to infection is considered serious.","when_to_set_to_false":"Set to false if the patient's disorder due to infection is not considered serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disorder due to infection is serious.","meaning":"Boolean indicating whether the patient's disorder due to infection is serious."} ;; "serious infection"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_malignant_neoplastic_disease_now
          patient_has_finding_of_disorder_due_to_infection_now@@active)
patient_has_finding_of_serious_illness_now)
:named REQ11_AUXILIARY0)) ;; "with non-exhaustive examples (malignancy OR active infection)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@serious
patient_has_finding_of_malignant_neoplastic_disease_now)
:named REQ11_AUXILIARY1)) ;; "malignancy (serious)"

(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@active
patient_has_finding_of_disorder_due_to_infection_now)
:named REQ11_AUXILIARY2)) ;; "active infection"

(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@serious
patient_has_finding_of_disorder_due_to_infection_now)
:named REQ11_AUXILIARY3)) ;; "serious infection"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_serious_illness_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another serious illness with non-exhaustive examples (malignancy OR active infection)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_bacterial_endocarditis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bacterial endocarditis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bacterial endocarditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bacterial endocarditis.","meaning":"Boolean indicating whether the patient currently has bacterial endocarditis."} ;; "bacterial endocarditis"
(declare-const patient_has_finding_of_bacterial_pericarditis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bacterial pericarditis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bacterial pericarditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bacterial pericarditis.","meaning":"Boolean indicating whether the patient currently has bacterial pericarditis."} ;; "bacterial pericarditis"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_bacterial_endocarditis_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bacterial endocarditis."

(assert
(! (not patient_has_finding_of_bacterial_pericarditis_now)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bacterial pericarditis."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_acute_pancreatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute pancreatitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute pancreatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute pancreatitis.","meaning":"Boolean indicating whether the patient currently has acute pancreatitis."} ;; "acute pancreatitis"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_finding_of_acute_pancreatitis_now)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute pancreatitis."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a disorder of the gastrointestinal tract that occurred within the past 3 months.","when_to_set_to_false":"Set to false if the patient does not have a disorder of the gastrointestinal tract that occurred within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a disorder of the gastrointestinal tract that occurred within the past 3 months.","meaning":"Boolean indicating whether the patient has a disorder of the gastrointestinal tract that occurred within the past 3 months."} ;; "documented ulcerative gastrointestinal disease during the last three months"
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_inthepast3months@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the disorder of the gastrointestinal tract within the past 3 months is documented in the patient's record.","when_to_set_to_false":"Set to false if the disorder of the gastrointestinal tract within the past 3 months is not documented in the patient's record.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disorder of the gastrointestinal tract within the past 3 months is documented.","meaning":"Boolean indicating whether the disorder of the gastrointestinal tract within the past 3 months is documented."} ;; "documented ulcerative gastrointestinal disease during the last three months"
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_inthepast3months@@ulcerative Bool) ;; {"when_to_set_to_true":"Set to true if the disorder of the gastrointestinal tract within the past 3 months is ulcerative in nature.","when_to_set_to_false":"Set to false if the disorder of the gastrointestinal tract within the past 3 months is not ulcerative in nature.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disorder of the gastrointestinal tract within the past 3 months is ulcerative.","meaning":"Boolean indicating whether the disorder of the gastrointestinal tract within the past 3 months is ulcerative."} ;; "documented ulcerative gastrointestinal disease during the last three months"
(declare-const patient_has_finding_of_arterial_aneurysm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has arterial aneurysms.","when_to_set_to_false":"Set to false if the patient currently does not have arterial aneurysms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has arterial aneurysms.","meaning":"Boolean indicating whether the patient currently has arterial aneurysms."} ;; "arterial aneurysms"
(declare-const patient_has_finding_of_arterial_malformation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has arterial malformations.","when_to_set_to_false":"Set to false if the patient currently does not have arterial malformations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has arterial malformations.","meaning":"Boolean indicating whether the patient currently has arterial malformations."} ;; "arterial malformations"
(declare-const patient_has_finding_of_venous_malformation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has venous malformations.","when_to_set_to_false":"Set to false if the patient currently does not have venous malformations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has venous malformations.","meaning":"Boolean indicating whether the patient currently has venous malformations."} ;; "venous malformations"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variables imply corresponding stem variable for GI disorder
(assert
(! (=> patient_has_finding_of_disorder_of_gastrointestinal_tract_inthepast3months@@documented
      patient_has_finding_of_disorder_of_gastrointestinal_tract_inthepast3months)
    :named REQ14_AUXILIARY0)) ;; "documented ulcerative gastrointestinal disease during the last three months"

(assert
(! (=> patient_has_finding_of_disorder_of_gastrointestinal_tract_inthepast3months@@ulcerative
      patient_has_finding_of_disorder_of_gastrointestinal_tract_inthepast3months)
    :named REQ14_AUXILIARY1)) ;; "ulcerative gastrointestinal disease during the last three months"

;; ===================== Constraint Assertions (REQ 14) =====================
;; Exclusion: patient must NOT have documented ulcerative GI disease in past 3 months
(assert
(! (not (and patient_has_finding_of_disorder_of_gastrointestinal_tract_inthepast3months
             patient_has_finding_of_disorder_of_gastrointestinal_tract_inthepast3months@@documented
             patient_has_finding_of_disorder_of_gastrointestinal_tract_inthepast3months@@ulcerative))
    :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "documented ulcerative gastrointestinal disease during the last three months"

;; Exclusion: patient must NOT have arterial aneurysms
(assert
(! (not patient_has_finding_of_arterial_aneurysm_now)
    :named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "arterial aneurysms"

;; Exclusion: patient must NOT have arterial malformations
(assert
(! (not patient_has_finding_of_arterial_malformation_now)
    :named REQ14_COMPONENT2_OTHER_REQUIREMENTS)) ;; "arterial malformations"

;; Exclusion: patient must NOT have venous malformations
(assert
(! (not patient_has_finding_of_venous_malformation_now)
    :named REQ14_COMPONENT3_OTHER_REQUIREMENTS)) ;; "venous malformations"

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_serious_illness_now@@investigator_feels_condition_poses_significant_hazard_if_investigational_therapy_initiated
      patient_has_finding_of_serious_illness_now)
:named REQ15_AUXILIARY0)) ;; "any other condition that the investigator feels would pose a significant hazard..."

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_serious_illness_now@@investigator_feels_condition_poses_significant_hazard_if_investigational_therapy_initiated)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other condition that the investigator feels would pose a significant hazard to the patient if the investigational therapy was to be initiated."
