;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a psychiatric (mental) disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a psychiatric (mental) disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a psychiatric (mental) disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a psychiatric (mental) disorder."} ;; "psychiatric disorder"

(declare-const patient_has_diagnosis_of_mental_disorder_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of psychiatric (mental) disorder is known (documented or previously established).","when_to_set_to_false":"Set to false if the patient's current diagnosis of psychiatric (mental) disorder is not known or not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is known.","meaning":"Boolean indicating whether the patient's current diagnosis of psychiatric (mental) disorder is known (documented or previously established)."} ;; "known psychiatric disorder"

(declare-const patient_is_exposed_to_psychotropic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (using or taking) a psychiatric medication (psychotropic agent).","when_to_set_to_false":"Set to false if the patient is not currently exposed to (using or taking) a psychiatric medication (psychotropic agent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a psychiatric medication (psychotropic agent).","meaning":"Boolean indicating whether the patient is currently exposed to (using or taking) a psychiatric medication (psychotropic agent)."} ;; "current use of psychiatric medication"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_mental_disorder_now@@known
      patient_has_diagnosis_of_mental_disorder_now)
   :named REQ0_AUXILIARY0)) ;; "known psychiatric disorder"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have a known psychiatric disorder
(assert
(! (not patient_has_diagnosis_of_mental_disorder_now@@known)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known psychiatric disorder."

;; Exclusion: patient must NOT have current use of psychiatric medication
(assert
(! (not patient_is_exposed_to_psychotropic_agent_now)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current use of psychiatric medication."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_traumatic_and_or_non_traumatic_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a traumatic and/or non-traumatic injury.","when_to_set_to_false":"Set to false if the patient currently does not have a traumatic and/or non-traumatic injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a traumatic and/or non-traumatic injury.","meaning":"Boolean indicating whether the patient currently has a traumatic and/or non-traumatic injury."} ;; "injury"
(declare-const patient_has_finding_of_traumatic_and_or_non_traumatic_injury_now@@complex Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current traumatic and/or non-traumatic injury is complex.","when_to_set_to_false":"Set to false if the patient's current traumatic and/or non-traumatic injury is not complex.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current traumatic and/or non-traumatic injury is complex.","meaning":"Boolean indicating whether the patient's current traumatic and/or non-traumatic injury is complex."} ;; "complex injury"
(declare-const patient_has_need_for_complex_medical_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a need for complex medical treatment.","when_to_set_to_false":"Set to false if the patient currently does not have a need for complex medical treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a need for complex medical treatment.","meaning":"Boolean indicating whether the patient currently has a need for complex medical treatment."} ;; "need for complex medical treatment"
(declare-const patient_has_need_for_complex_medical_treatment_now@@example_operation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's need for complex medical treatment includes an operation as an example.","when_to_set_to_false":"Set to false if the patient's need for complex medical treatment does not include an operation as an example.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's need for complex medical treatment includes an operation as an example.","meaning":"Boolean indicating whether the patient's need for complex medical treatment includes an operation as an example."} ;; "need for complex medical treatment with non-exhaustive examples (an operation)"
(declare-const patient_has_undergone_transfusion_of_packed_red_blood_cells_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently undergone transfusion of packed red blood cells.","when_to_set_to_false":"Set to false if the patient has not currently undergone transfusion of packed red blood cells.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently undergone transfusion of packed red blood cells.","meaning":"Boolean indicating whether the patient has currently undergone transfusion of packed red blood cells."} ;; "packed red blood cell transfusion"
(declare-const patient_has_undergone_transfusion_of_packed_red_blood_cells_now@@need_for_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a need for transfusion of packed red blood cells.","when_to_set_to_false":"Set to false if the patient currently does not have a need for transfusion of packed red blood cells.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a need for transfusion of packed red blood cells.","meaning":"Boolean indicating whether the patient currently has a need for transfusion of packed red blood cells."} ;; "need for packed red blood cell transfusion"
(declare-const patient_has_undergone_hospital_admission_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted to the hospital.","when_to_set_to_false":"Set to false if the patient is not currently admitted to the hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted to the hospital.","meaning":"Boolean indicating whether the patient is currently admitted to the hospital."} ;; "hospital admission"
(declare-const patient_has_undergone_hospital_admission_now@@duration_hours Real) ;; {"when_to_set_to_true":"Set to true if the duration in hours of the patient's current hospital admission is known and recorded.","when_to_set_to_false":"Set to false if the duration in hours of the patient's current hospital admission is not known or not recorded.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the duration in hours of the patient's current hospital admission is.","meaning":"Numeric value indicating the duration in hours of the patient's current hospital admission."} ;; "hospital admission extending greater than or equal to 36 hours"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable for complex injury
(assert
(! (=> patient_has_finding_of_traumatic_and_or_non_traumatic_injury_now@@complex
       patient_has_finding_of_traumatic_and_or_non_traumatic_injury_now)
   :named REQ1_AUXILIARY0)) ;; "complex injury"

;; Non-exhaustive example: operation implies need for complex medical treatment
(assert
(! (=> patient_has_need_for_complex_medical_treatment_now@@example_operation
       patient_has_need_for_complex_medical_treatment_now)
   :named REQ1_AUXILIARY1)) ;; "need for complex medical treatment with non-exhaustive examples (an operation)"

;; Qualifier variable implies corresponding stem variable for packed red blood cell transfusion
(assert
(! (=> patient_has_undergone_transfusion_of_packed_red_blood_cells_now@@need_for_procedure
       patient_has_undergone_transfusion_of_packed_red_blood_cells_now)
   :named REQ1_AUXILIARY2)) ;; "need for packed red blood cell transfusion"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have a complex injury
(assert
(! (not patient_has_finding_of_traumatic_and_or_non_traumatic_injury_now@@complex)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a complex injury."

;; Exclusion: patient must NOT have a need for complex medical treatment
(assert
(! (not patient_has_need_for_complex_medical_treatment_now)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a need for complex medical treatment with non-exhaustive examples (an operation)."

;; Exclusion: patient must NOT have a need for packed red blood cell transfusion
(assert
(! (not patient_has_undergone_transfusion_of_packed_red_blood_cells_now@@need_for_procedure)
   :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a need for packed red blood cell transfusion."

;; Exclusion: patient must NOT have a need for hospital admission extending >= 36 hours
(assert
(! (not (and patient_has_undergone_hospital_admission_now
             (>= patient_has_undergone_hospital_admission_now@@duration_hours 36)))
   :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a need for hospital admission extending greater than or equal to 36 hours."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disorientated_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of disorientation (is disorientated).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of disorientation (is not disorientated).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has disorientation.","meaning":"Boolean indicating whether the patient currently has disorientation (is disorientated)."} ;; "disorientation"
(declare-const patient_has_finding_of_confusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of confusion.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of confusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has confusion.","meaning":"Boolean indicating whether the patient currently has confusion."} ;; "confusion"
(declare-const patient_has_finding_of_injury_of_head_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of head injury.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of head injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has head injury.","meaning":"Boolean indicating whether the patient currently has head injury."} ;; "head injury"
(declare-const patient_has_finding_of_loss_of_consciousness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of loss of consciousness.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of loss of consciousness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has loss of consciousness.","meaning":"Boolean indicating whether the patient currently has loss of consciousness."} ;; "loss of consciousness"
(declare-const patient_has_finding_of_neurological_deficit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of neurological deficit.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of neurological deficit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has neurological deficit.","meaning":"Boolean indicating whether the patient currently has neurological deficit."} ;; "neurological deficit"
(declare-const patient_has_finding_of_neurological_deficit_now@@major Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a major neurological deficit.","when_to_set_to_false":"Set to false if the patient currently has a neurological deficit that is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the neurological deficit is major.","meaning":"Boolean indicating whether the patient's neurological deficit is major."} ;; "major neurological deficit"
(declare-const patient_has_finding_of_intra_cranial_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of intra-cranial bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of intra-cranial bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intra-cranial bleeding.","meaning":"Boolean indicating whether the patient currently has intra-cranial bleeding."} ;; "intra-cranial bleeding (non-exhaustive example of head injury)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive example: intra-cranial bleeding implies head injury
(assert
(! (=> patient_has_finding_of_intra_cranial_bleeding_now
      patient_has_finding_of_injury_of_head_now)
    :named REQ2_AUXILIARY0)) ;; "head injury with non-exhaustive examples (intra-cranial bleeding)"

;; Qualifier variable implies corresponding stem variable (major neurological deficit ⇒ neurological deficit)
(assert
(! (=> patient_has_finding_of_neurological_deficit_now@@major
      patient_has_finding_of_neurological_deficit_now)
    :named REQ2_AUXILIARY1)) ;; "major neurological deficit"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_disorientated_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has disorientation."

(assert
(! (not patient_has_finding_of_confusion_now)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has confusion."

(assert
(! (not patient_has_finding_of_injury_of_head_now)
    :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has head injury with non-exhaustive examples (intra-cranial bleeding)."

(assert
(! (not patient_has_finding_of_loss_of_consciousness_now)
    :named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has loss of consciousness."

(assert
(! (not patient_has_finding_of_neurological_deficit_now@@major)
    :named REQ2_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a major neurological deficit."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_hypothalamic_pituitary_adrenal_axis_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypothalamic-pituitary-adrenal axis dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypothalamic-pituitary-adrenal axis dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypothalamic-pituitary-adrenal axis dysfunction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypothalamic-pituitary-adrenal axis dysfunction."} ;; "disorder of the hypothalamic-pituitary-adrenal axis"
(declare-const patient_has_diagnosis_of_hypothalamic_pituitary_adrenal_axis_dysfunction_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of hypothalamic-pituitary-adrenal axis dysfunction is known.","when_to_set_to_false":"Set to false if the patient's diagnosis of hypothalamic-pituitary-adrenal axis dysfunction is not known.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of hypothalamic-pituitary-adrenal axis dysfunction is known.","meaning":"Boolean indicating whether the patient's diagnosis of hypothalamic-pituitary-adrenal axis dysfunction is known."} ;; "known disorder of the hypothalamic-pituitary-adrenal axis"
(declare-const patient_has_taken_steroid_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken a steroid-containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken a steroid-containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken a steroid-containing product.","meaning":"Boolean indicating whether the patient has ever taken a steroid-containing product at any time in the past."} ;; "steroidal medication"
(declare-const patient_has_taken_steroid_containing_product_inthehistory@@temporalcontext_within3years Bool) ;; {"when_to_set_to_true":"Set to true if the patient's use of steroid-containing product occurred within the previous 3 years.","when_to_set_to_false":"Set to false if the patient's use of steroid-containing product did not occur within the previous 3 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's use of steroid-containing product occurred within the previous 3 years.","meaning":"Boolean indicating whether the patient's use of steroid-containing product occurred within the previous 3 years."} ;; "use of steroidal medication within the previous 3 years"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable for HPA axis disorder
(assert
(! (=> patient_has_diagnosis_of_hypothalamic_pituitary_adrenal_axis_dysfunction_now@@known
       patient_has_diagnosis_of_hypothalamic_pituitary_adrenal_axis_dysfunction_now)
   :named REQ3_AUXILIARY0)) ;; "known disorder of the hypothalamic-pituitary-adrenal axis"

;; Qualifier variable implies corresponding stem variable for steroid use
(assert
(! (=> patient_has_taken_steroid_containing_product_inthehistory@@temporalcontext_within3years
       patient_has_taken_steroid_containing_product_inthehistory)
   :named REQ3_AUXILIARY1)) ;; "use of steroidal medication within the previous 3 years"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have a known disorder of the hypothalamic-pituitary-adrenal axis
(assert
(! (not patient_has_diagnosis_of_hypothalamic_pituitary_adrenal_axis_dysfunction_now@@known)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known disorder of the hypothalamic-pituitary-adrenal axis."

;; Exclusion: patient must NOT have use of steroidal medication within the previous 3 years
(assert
(! (not patient_has_taken_steroid_containing_product_inthehistory@@temporalcontext_within3years)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has use of steroidal medication within the previous 3 years."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a disorder of the nervous system (neurological disease) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a disorder of the nervous system (neurological disease) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a disorder of the nervous system (neurological disease).","meaning":"Boolean indicating whether the patient has ever been diagnosed with a disorder of the nervous system (neurological disease) at any time in their history."} ;; "neurological disease"
(declare-const patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory@@known Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of disorder of nervous system is known (documented or confirmed) in the patient.","when_to_set_to_false":"Set to false if the diagnosis is not known (not documented, not confirmed, or only suspected).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is known.","meaning":"Boolean indicating whether the diagnosis of disorder of nervous system is known (documented or confirmed) in the patient."} ;; "known neurological disease"
(declare-const patient_has_undergone_operation_on_brain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an operation on the brain (brain surgery) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone an operation on the brain (brain surgery) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an operation on the brain (brain surgery).","meaning":"Boolean indicating whether the patient has ever undergone an operation on the brain (brain surgery) at any time in their history."} ;; "brain surgery"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory@@known
       patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory)
   :named REQ4_AUXILIARY0)) ;; "known neurological disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_has_diagnosis_of_disorder_of_nervous_system_inthehistory
            patient_has_undergone_operation_on_brain_inthehistory))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a known neurological disease) OR (the patient has had previous brain surgery)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_serious_physical_health_problem_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a serious physical health problem (major medical condition) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a serious physical health problem (major medical condition) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a serious physical health problem (major medical condition).","meaning":"Boolean indicating whether the patient has ever had a serious physical health problem (major medical condition) in their history."} ;; "major medical condition"

(declare-const patient_has_taken_drug_or_medicament_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken any drug or medicament at any time in their history.","when_to_set_to_false":"Set to false if the patient has never taken any drug or medicament in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken any drug or medicament.","meaning":"Boolean indicating whether the patient has ever taken any drug or medicament in their history."} ;; "medication"

(declare-const patient_has_taken_drug_or_medicament_inthehistory@@known_to_influence_hypothalamic_pituitary_adrenal_axis Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken a drug or medicament in their history that is known to influence the hypothalamic-pituitary-adrenal axis.","when_to_set_to_false":"Set to false if the patient has never taken a drug or medicament in their history that is known to influence the hypothalamic-pituitary-adrenal axis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken a drug or medicament known to influence the hypothalamic-pituitary-adrenal axis.","meaning":"Boolean indicating whether the patient has ever taken a drug or medicament known to influence the hypothalamic-pituitary-adrenal axis in their history."} ;; "use of medication known to influence the hypothalamic-pituitary-adrenal axis"

(declare-const patient_has_taken_drug_or_medicament_inthehistory@@known_to_influence_autonomic_nervous_system_axis Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken a drug or medicament in their history that is known to influence the autonomic nervous system axis.","when_to_set_to_false":"Set to false if the patient has never taken a drug or medicament in their history that is known to influence the autonomic nervous system axis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken a drug or medicament known to influence the autonomic nervous system axis.","meaning":"Boolean indicating whether the patient has ever taken a drug or medicament known to influence the autonomic nervous system axis in their history."} ;; "use of medication known to influence the autonomic nervous system axis"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_serious_physical_health_problem_inthehistory)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a major medical condition."

(assert
(! (not patient_has_taken_drug_or_medicament_inthehistory@@known_to_influence_hypothalamic_pituitary_adrenal_axis)
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has use of medication known to influence the hypothalamic-pituitary-adrenal axis."

(assert
(! (not patient_has_taken_drug_or_medicament_inthehistory@@known_to_influence_autonomic_nervous_system_axis)
    :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has use of medication known to influence the autonomic nervous system axis."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_alopecia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of alopecia (baldness).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of alopecia (baldness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alopecia (baldness).","meaning":"Boolean indicating whether the patient currently has alopecia (baldness) at the present time."} ;; "baldness"
(declare-const hair_length_value_recorded_now_in_centimeter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's hair length in centimeters as measured or recorded at the present time.","when_to_set_to_null":"Set to null if the patient's hair length in centimeters at the present time is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's hair length in centimeters at the present time."} ;; "hair shorter than 1 centimeter"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (or patient_has_finding_of_alopecia_now
            (< hair_length_value_recorded_now_in_centimeter 1)))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has baldness) OR (the patient has hair shorter than 1 centimeter)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_dye_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to or using color dye.","when_to_set_to_false":"Set to false if the patient is currently not exposed to or using color dye.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to or using color dye.","meaning":"Boolean indicating whether the patient is currently exposed to or using color dye."} ;; "the patient has use of color dye"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_exposed_to_dye_now)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient has use of color dye)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
