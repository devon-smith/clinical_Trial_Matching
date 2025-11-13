;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current systolic blood pressure in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no current systolic blood pressure measurement in millimeters of mercury is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in millimeters of mercury."} ;; "systolic blood pressure"

(declare-const patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current diastolic blood pressure in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no current diastolic blood pressure measurement in millimeters of mercury is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current diastolic blood pressure in millimeters of mercury."} ;; "diastolic blood pressure"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (> patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 170))
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has systolic blood pressure greater than 170 millimeters of mercury."

(assert
(! (not (> patient_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 100))
:named REQ0_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has diastolic blood pressure greater than 100 millimeters of mercury."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of heart valve disorder (valvular heart disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of heart valve disorder (valvular heart disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of heart valve disorder (valvular heart disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of heart valve disorder (valvular heart disease)."} ;; "valvular heart disease"
(declare-const patient_has_diagnosis_of_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cardiomyopathy."} ;; "cardiomyopathy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_heart_valve_disorder_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has valvular heart disease."

(assert
(! (not patient_has_diagnosis_of_cardiomyopathy_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiomyopathy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_myocardial_infarction_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the past 6 months.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the past 6 months."} ;; "myocardial infarction within less than 6 months"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_finding_of_myocardial_infarction_inthepast6months)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a myocardial infarction within less than 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_preinfarction_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of unstable angina (preinfarction syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of unstable angina (preinfarction syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable angina (preinfarction syndrome).","meaning":"Boolean indicating whether the patient currently has unstable angina (preinfarction syndrome)."} ;; "unstable angina"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_preinfarction_syndrome_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable angina."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} ;; "congestive cardiac failure"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_congestive_heart_failure_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congestive cardiac failure."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const hemoglobin_value_recorded_now_withunit_grams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the patient's current hemoglobin concentration in grams per deciliter if available.","when_to_set_to_null":"Set to null if the patient's current hemoglobin concentration in grams per deciliter is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current hemoglobin concentration measured in grams per deciliter."} ;; "hemoglobin 7 grams per deciliter"
(declare-const patient_has_finding_of_anemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of anemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has anemia.","meaning":"Boolean indicating whether the patient currently has anemia."} ;; "anemia"

(declare-const patient_has_finding_of_anemia_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe anemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe anemia.","meaning":"Boolean indicating whether the patient currently has severe anemia."} ;; "severe anemia"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: severe anemia = anemia AND hemoglobin 7 grams per deciliter
(assert
(! (= patient_has_finding_of_anemia_now@@severe
(and patient_has_finding_of_anemia_now
(<= hemoglobin_value_recorded_now_withunit_grams_per_deciliter 7)))
:named REQ5_AUXILIARY0)) ;; "severe anemia (hemoglobin 7 grams per deciliter)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_anemia_now@@severe
patient_has_finding_of_anemia_now)
:named REQ5_AUXILIARY1)) ;; "severe anemia" implies "anemia"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_anemia_now@@severe)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe anemia (hemoglobin 7 grams per deciliter)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cardiac arrhythmia."} ;; "cardiac arrhythmias"
(declare-const patient_has_diagnosis_of_second_degree_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of second degree atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of second degree atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of second degree atrioventricular block.","meaning":"Boolean indicating whether the patient currently has a diagnosis of second degree atrioventricular block."} ;; "second degree atrioventricular block"
(declare-const patient_has_diagnosis_of_complete_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of complete (third degree) atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of complete (third degree) atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of complete (third degree) atrioventricular block.","meaning":"Boolean indicating whether the patient currently has a diagnosis of complete (third degree) atrioventricular block."} ;; "third degree atrioventricular block"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (or patient_has_diagnosis_of_cardiac_arrhythmia_now
            patient_has_diagnosis_of_second_degree_atrioventricular_block_now
            patient_has_diagnosis_of_complete_atrioventricular_block_now))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has cardiac arrhythmias) OR (the patient has second degree atrioventricular block) OR (the patient has third degree atrioventricular block)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_decreased_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of decreased liver function (liver dysfunction).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of decreased liver function (liver dysfunction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has decreased liver function (liver dysfunction).","meaning":"Boolean indicating whether the patient currently has decreased liver function (liver dysfunction)."} ;; "liver dysfunction"
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal impairment (renal dysfunction).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal impairment (renal dysfunction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal impairment (renal dysfunction).","meaning":"Boolean indicating whether the patient currently has renal impairment (renal dysfunction)."} ;; "renal dysfunction"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_decreased_liver_function_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant liver dysfunction."

(assert
(! (not patient_has_finding_of_renal_impairment_now)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant renal dysfunction."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_type_1_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of type 1 diabetes mellitus (insulin-dependent diabetes mellitus).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of type 1 diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of type 1 diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of type 1 diabetes mellitus."} ;; "insulin-dependent diabetes mellitus (Type-1 diabetes mellitus)"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_diagnosis_of_type_1_diabetes_mellitus_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has insulin-dependent diabetes mellitus (Type-1 diabetes mellitus)."

;; ===================== Constraint Assertions (REQ 9) =====================
;; "The patient is excluded if the patient has systolic blood pressure less than 100 millimeters of mercury."
(assert
(! (not (< patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 100))
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has systolic blood pressure less than 100 millimeters of mercury."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding (nursing).","when_to_set_to_false":"Set to false if the patient is currently known not to be breastfeeding (nursing).","when_to_set_to_null":"Set to null if the patient's current breastfeeding (nursing) status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding (nursing)."} ;; "the patient is nursing"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_breastfeeding_now)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is nursing."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_allergy_to_nicorandil_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known allergy (hypersensitivity) to nicorandil.","when_to_set_to_false":"Set to false if the patient currently does not have a known allergy (hypersensitivity) to nicorandil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known allergy (hypersensitivity) to nicorandil.","meaning":"Boolean indicating whether the patient currently has a known allergy (hypersensitivity) to nicorandil."} ;; "hypersensitivity to nicorandil"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (not patient_has_finding_of_allergy_to_nicorandil_now)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to nicorandil."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_undergoing_calcium_channel_blocker_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving calcium channel blocker therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving calcium channel blocker therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving calcium channel blocker therapy.","meaning":"Boolean indicating whether the patient is currently receiving calcium channel blocker therapy."} ;; "calcium channel blocker therapy"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_is_undergoing_calcium_channel_blocker_therapy_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving calcium channel blocker therapy."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_can_undergo_single_photon_emission_computerized_tomography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently eligible to undergo single-photon emission computed tomography.","when_to_set_to_false":"Set to false if the patient is currently not eligible to undergo single-photon emission computed tomography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently eligible to undergo single-photon emission computed tomography.","meaning":"Boolean indicating whether the patient is currently eligible to undergo single-photon emission computed tomography."} ;; "single-photon emission computed tomography"
(declare-const patient_is_exposed_to_technetium_99m_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to technetium-99m.","when_to_set_to_false":"Set to false if the patient is currently not exposed to technetium-99m.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to technetium-99m.","meaning":"Boolean indicating whether the patient is currently exposed to technetium-99m."} ;; "technetium-99m"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_can_undergo_single_photon_emission_computerized_tomography_now)
:named REQ13_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is not eligible for technetium-99m single-photon emission computed tomography."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const beta_blocker_therapy_is_contraindicated_for_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if beta blocker therapy is currently contraindicated for the patient.","when_to_set_to_false":"Set to false if beta blocker therapy is currently not contraindicated for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether beta blocker therapy is currently contraindicated for the patient.","meaning":"Boolean indicating whether beta blocker therapy is currently contraindicated for the patient."} ;; "beta blocker therapy is contraindicated for the patient."

(declare-const patient_is_undergoing_beta_adrenergic_receptor_blocking_agent_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing beta adrenergic receptor blocking agent therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing beta adrenergic receptor blocking agent therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing beta adrenergic receptor blocking agent therapy.","meaning":"Boolean indicating whether the patient is currently undergoing beta adrenergic receptor blocking agent therapy."} ;; "beta blocker therapy"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not beta_blocker_therapy_is_contraindicated_for_patient_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if beta blocker therapy is contraindicated for the patient."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_geographical_inaccessibility_for_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has geographical inaccessibility for treatment.","when_to_set_to_false":"Set to false if the patient currently does not have geographical inaccessibility for treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has geographical inaccessibility for treatment.","meaning":"Boolean indicating whether the patient currently has geographical inaccessibility for treatment."} ;; "geographical inaccessibility for treatment"
(declare-const patient_has_geographical_inaccessibility_for_follow_up_evaluations_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has geographical inaccessibility for follow-up evaluations.","when_to_set_to_false":"Set to false if the patient currently does not have geographical inaccessibility for follow-up evaluations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has geographical inaccessibility for follow-up evaluations.","meaning":"Boolean indicating whether the patient currently has geographical inaccessibility for follow-up evaluations."} ;; "geographical inaccessibility for follow-up evaluations"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_geographical_inaccessibility_for_treatment_now)
:named REQ15_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has geographical inaccessibility for treatment."

(assert
(! (not patient_has_geographical_inaccessibility_for_follow_up_evaluations_now)
:named REQ15_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has geographical inaccessibility for follow-up evaluations."
