;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is younger than 18 years OR the patient is older than 80 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or (< patient_age_value_recorded_now_in_years 18)
            (> patient_age_value_recorded_now_in_years 80)))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is younger than 18 years) OR (the patient is older than 80 years))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_left_ventricular_thrombus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a left ventricular thrombus.","when_to_set_to_false":"Set to false if the patient currently does not have a left ventricular thrombus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a left ventricular thrombus.","meaning":"Boolean indicating whether the patient currently has a left ventricular thrombus."} ;; "left ventricular thrombus"

(declare-const patient_has_finding_of_left_ventricular_thrombus_now@@protruding Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left ventricular thrombus is protruding.","when_to_set_to_false":"Set to false if the patient's left ventricular thrombus is not protruding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's left ventricular thrombus is protruding.","meaning":"Boolean indicating whether the patient's left ventricular thrombus is protruding."} ;; "protruding left ventricular thrombus"

(declare-const patient_has_finding_of_left_ventricular_thrombus_now@@detected_on_pre_ablation_echocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left ventricular thrombus is detected on pre-ablation echocardiogram.","when_to_set_to_false":"Set to false if the patient's left ventricular thrombus is not detected on pre-ablation echocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's left ventricular thrombus is detected on pre-ablation echocardiogram.","meaning":"Boolean indicating whether the patient's left ventricular thrombus is detected on pre-ablation echocardiogram."} ;; "left ventricular thrombus on pre-ablation echocardiogram"

(declare-const patient_has_finding_of_left_ventricular_thrombus_now@@protruding@@detected_on_pre_ablation_echocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a protruding left ventricular thrombus detected on pre-ablation echocardiogram.","when_to_set_to_false":"Set to false if the patient currently does not have a protruding left ventricular thrombus detected on pre-ablation echocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a protruding left ventricular thrombus detected on pre-ablation echocardiogram.","meaning":"Boolean indicating whether the patient currently has a protruding left ventricular thrombus detected on pre-ablation echocardiogram."} ;; "protruding left ventricular thrombus on pre-ablation echocardiogram"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_left_ventricular_thrombus_now@@protruding
      patient_has_finding_of_left_ventricular_thrombus_now)
   :named REQ1_AUXILIARY0)) ;; "protruding left ventricular thrombus"

(assert
(! (=> patient_has_finding_of_left_ventricular_thrombus_now@@detected_on_pre_ablation_echocardiogram
      patient_has_finding_of_left_ventricular_thrombus_now)
   :named REQ1_AUXILIARY1)) ;; "left ventricular thrombus on pre-ablation echocardiogram"

(assert
(! (=> patient_has_finding_of_left_ventricular_thrombus_now@@protruding@@detected_on_pre_ablation_echocardiogram
      (and patient_has_finding_of_left_ventricular_thrombus_now@@protruding
           patient_has_finding_of_left_ventricular_thrombus_now@@detected_on_pre_ablation_echocardiogram))
   :named REQ1_AUXILIARY2)) ;; "protruding left ventricular thrombus on pre-ablation echocardiogram"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_left_ventricular_thrombus_now@@protruding@@detected_on_pre_ablation_echocardiogram)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a protruding left ventricular thrombus on pre-ablation echocardiogram."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_acute_myocardial_infarction_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of acute myocardial infarction within the past 1 month.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of acute myocardial infarction within the past 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of acute myocardial infarction within the past 1 month.","meaning":"Boolean indicating whether the patient has had a diagnosis of acute myocardial infarction within the past 1 month."} ;; "acute myocardial infarction within the preceding 1 month"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_diagnosis_of_acute_myocardial_infarction_inthepast1months)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had an acute myocardial infarction within the preceding 1 month."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "heart failure"
(declare-const patient_has_finding_of_heart_failure_now@@nyha_class_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart failure and the heart failure is classified as NYHA Class IV.","when_to_set_to_false":"Set to false if the patient currently has heart failure but it is not NYHA Class IV, or if the patient does not have heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart failure is NYHA Class IV.","meaning":"Boolean indicating whether the patient's current heart failure is NYHA Class IV."} ;; "New York Heart Association (NYHA) Class IV heart failure"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_failure_now@@nyha_class_iv
      patient_has_finding_of_heart_failure_now)
   :named REQ3_AUXILIARY0)) ;; "NYHA Class IV heart failure" implies "heart failure"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_heart_failure_now@@nyha_class_iv)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has New York Heart Association (NYHA) Class IV heart failure."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of heart valve disorder (valvular heart disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of heart valve disorder (valvular heart disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of heart valve disorder (valvular heart disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of heart valve disorder (valvular heart disease)."} ;; "valvular heart disease"
(declare-const patient_has_mechanical_heart_valve_that_precludes_access_to_left_ventricle_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mechanical heart valve that precludes access to the left ventricle.","when_to_set_to_false":"Set to false if the patient currently does not have a mechanical heart valve that precludes access to the left ventricle.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mechanical heart valve that precludes access to the left ventricle.","meaning":"Boolean indicating whether the patient currently has a mechanical heart valve that precludes access to the left ventricle."} ;; "mechanical heart valve that precludes access to the left ventricle"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_diagnosis_of_heart_valve_disorder_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has valvular heart disease."

(assert
  (! (not patient_has_mechanical_heart_valve_that_precludes_access_to_left_ventricle_now)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a mechanical heart valve that precludes access to the left ventricle."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_preinfarction_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of unstable angina (preinfarction syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of unstable angina (preinfarction syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable angina (preinfarction syndrome).","meaning":"Boolean indicating whether the patient currently has unstable angina (preinfarction syndrome)."} ;; "unstable angina"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_preinfarction_syndrome_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable angina."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const months_since_last_cardiac_surgery_involving_cardiotomy_not_cabg Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient's most recent cardiac surgery involving cardiotomy, excluding CABG.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined when the patient's most recent cardiac surgery involving cardiotomy (excluding CABG) occurred.","meaning":"Numeric value representing the number of months since the patient's most recent cardiac surgery involving cardiotomy, excluding CABG."} ;; "number of months since the patient's most recent cardiac surgery involving cardiotomy (NOT CABG)"
(declare-const patient_has_undergone_cardiac_surgery_involving_cardiotomy_not_cabg_within_past_2_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone cardiac surgery involving cardiotomy, and the surgery did not include coronary artery bypass grafting (CABG), and the surgery occurred within the past 2 months.","when_to_set_to_false":"Set to false if the patient has not undergone cardiac surgery involving cardiotomy, or the surgery included CABG, or the surgery did not occur within the past 2 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone cardiac surgery involving cardiotomy (excluding CABG) within the past 2 months.","meaning":"Boolean indicating whether the patient has undergone cardiac surgery involving cardiotomy, excluding CABG, within the past 2 months."} ;; "has had cardiac surgery involving cardiotomy (NOT CABG) within the past 2 months"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: patient_has_undergone_cardiac_surgery_involving_cardiotomy_not_cabg_within_past_2_months is true iff months_since_last_cardiac_surgery_involving_cardiotomy_not_cabg < 2
(assert
(! (= patient_has_undergone_cardiac_surgery_involving_cardiotomy_not_cabg_within_past_2_months
     (< months_since_last_cardiac_surgery_involving_cardiotomy_not_cabg 2))
:named REQ6_AUXILIARY0)) ;; "has had cardiac surgery involving cardiotomy (NOT CABG) within the past 2 months"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_undergone_cardiac_surgery_involving_cardiotomy_not_cabg_within_past_2_months)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had cardiac surgery involving cardiotomy (NOT coronary artery bypass grafting [CABG]) within the past 2 months."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_mmol_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's serum creatinine concentration in mmol/L is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum creatinine concentration in mmol/L."} ;; "serum creatinine concentration greater than 220 mmol/L (greater than 2.5 milligrams per deciliter)"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_mmol_per_l 220))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serum creatinine concentration greater than 220 mmol/L (greater than 2.5 milligrams per deciliter)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_thrombocytopenic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of thrombocytopenia (thrombocytopenic disorder).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of thrombocytopenia (thrombocytopenic disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has thrombocytopenia (thrombocytopenic disorder).","meaning":"Boolean indicating whether the patient currently has thrombocytopenia (thrombocytopenic disorder)."} ;; "thrombocytopenia"
(declare-const patient_has_finding_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of blood coagulation disorder (coagulopathy).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of blood coagulation disorder (coagulopathy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has blood coagulation disorder (coagulopathy).","meaning":"Boolean indicating whether the patient currently has blood coagulation disorder (coagulopathy)."} ;; "coagulopathy"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_thrombocytopenic_disorder_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has thrombocytopenia."

(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_now)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has coagulopathy."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_contraindication_to_heparin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any clinical finding that constitutes a contraindication to heparin.","when_to_set_to_false":"Set to false if the patient currently does not have any clinical finding that constitutes a contraindication to heparin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to heparin.","meaning":"Boolean indicating whether the patient currently has a contraindication to heparin."} ;; "contraindication to heparin"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_contraindication_to_heparin_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to heparin."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_acute_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute illness (acute disease).","when_to_set_to_false":"Set to false if the patient currently does not have an acute illness (acute disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute illness (acute disease).","meaning":"Boolean indicating whether the patient currently has an acute illness (acute disease) at the present time."} ;; "acute illness"
(declare-const patient_has_finding_of_sepsis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has systemic infection (sepsis).","when_to_set_to_false":"Set to false if the patient currently does not have systemic infection (sepsis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has systemic infection (sepsis).","meaning":"Boolean indicating whether the patient currently has systemic infection (sepsis) at the present time."} ;; "systemic infection"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (not (or patient_has_finding_of_acute_disease_now
              patient_has_finding_of_sepsis_now))
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has an acute illness) OR (the patient has an active systemic infection)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another disease process.","when_to_set_to_false":"Set to false if the patient currently does not have another disease process.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another disease process.","meaning":"Boolean indicating whether the patient currently has another disease process."} ;; "another disease process"
(declare-const patient_has_finding_of_disease_now@@likely_to_limit_survival_to_less_than_twelve_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another disease process and that disease is likely to limit survival to less than twelve months.","when_to_set_to_false":"Set to false if the patient currently has another disease process but that disease is not likely to limit survival to less than twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is likely to limit survival to less than twelve months.","meaning":"Boolean indicating whether the patient currently has another disease process and that disease is likely to limit survival to less than twelve months."} ;; "likely to limit survival to less than twelve months"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_now@@likely_to_limit_survival_to_less_than_twelve_months
      patient_has_finding_of_disease_now)
:named REQ12_AUXILIARY0)) ;; "another disease process likely to limit survival to less than twelve months"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_disease_now@@likely_to_limit_survival_to_less_than_twelve_months)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another disease process likely to limit survival to less than twelve months."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medical problem.","when_to_set_to_false":"Set to false if the patient currently does not have a medical problem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medical problem.","meaning":"Boolean indicating whether the patient currently has a medical problem."} ;; "medical problem"
(declare-const patient_has_finding_of_problem_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current medical problem is significant.","when_to_set_to_false":"Set to false if the patient's current medical problem is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current medical problem is significant.","meaning":"Boolean indicating whether the patient's current medical problem is significant."} ;; "significant medical problem"
(declare-const patient_has_finding_of_problem_now@@would_preclude_enrollment_in_study_in_opinion_of_principal_investigator Bool) ;; {"when_to_set_to_true":"Set to true if, in the opinion of the principal investigator, the patient's current medical problem would preclude enrollment in the study.","when_to_set_to_false":"Set to false if, in the opinion of the principal investigator, the patient's current medical problem would not preclude enrollment in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the opinion of the principal investigator, the patient's current medical problem would preclude enrollment in the study.","meaning":"Boolean indicating whether, in the opinion of the principal investigator, the patient's current medical problem would preclude enrollment in the study."} ;; "in the opinion of the principal investigator, would preclude enrollment in the study"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_problem_now@@significant
      patient_has_finding_of_problem_now)
:named REQ13_AUXILIARY0)) ;; "significant medical problem"

(assert
(! (=> patient_has_finding_of_problem_now@@would_preclude_enrollment_in_study_in_opinion_of_principal_investigator
      patient_has_finding_of_problem_now)
:named REQ13_AUXILIARY1)) ;; "in the opinion of the principal investigator, would preclude enrollment in the study"

;; Both qualifiers must be present for exclusion
(assert
(! (=> (and patient_has_finding_of_problem_now@@significant
            patient_has_finding_of_problem_now@@would_preclude_enrollment_in_study_in_opinion_of_principal_investigator)
       patient_has_finding_of_problem_now)
:named REQ13_AUXILIARY2)) ;; "significant medical problem that, in the opinion of the principal investigator, would preclude enrollment in the study"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not (and patient_has_finding_of_problem_now@@significant
             patient_has_finding_of_problem_now@@would_preclude_enrollment_in_study_in_opinion_of_principal_investigator))
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a significant medical problem that, in the opinion of the principal investigator, would preclude enrollment in the study."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_is_participating_in_another_investigational_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in another investigational study.","when_to_set_to_false":"Set to false if the patient is currently not participating in another investigational study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in another investigational study.","meaning":"Boolean indicating whether the patient is currently participating in another investigational study."} ;; "The patient is excluded if the patient is participating in another investigational study."

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_is_participating_in_another_investigational_study_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is participating in another investigational study."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_is_unwilling_to_participate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to participate in the study.","when_to_set_to_false":"Set to false if the patient is currently willing to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unwilling to participate in the study.","meaning":"Boolean indicating whether the patient is currently unwilling to participate in the study."} ;; "the patient is unwilling to participate"

(declare-const patient_lacks_availability_for_follow_up_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently lacks availability for follow-up.","when_to_set_to_false":"Set to false if the patient currently has availability for follow-up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently lacks availability for follow-up.","meaning":"Boolean indicating whether the patient currently lacks availability for follow-up."} ;; "the patient lacks availability for follow-up"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_is_unwilling_to_participate_now)
:named REQ15_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unwilling to participate."

(assert
(! (not patient_lacks_availability_for_follow_up_now)
:named REQ15_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient lacks availability for follow-up."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_ventricular_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ventricular tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ventricular tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of ventricular tachycardia.","meaning":"Boolean indicating whether the patient currently has ventricular tachycardia."} ;; "ventricular tachycardia"
(declare-const patient_has_finding_of_ventricular_tachycardia_now@@incessant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ventricular tachycardia is incessant.","when_to_set_to_false":"Set to false if the patient's ventricular tachycardia is not incessant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ventricular tachycardia is incessant.","meaning":"Boolean indicating whether the patient's ventricular tachycardia is incessant."} ;; "incessant ventricular tachycardia"
(declare-const patient_has_finding_of_electrical_storm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has electrical storm.","when_to_set_to_false":"Set to false if the patient currently does not have electrical storm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has electrical storm.","meaning":"Boolean indicating whether the patient currently has electrical storm."} ;; "electrical storm"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_ventricular_tachycardia_now@@incessant
       patient_has_finding_of_ventricular_tachycardia_now)
   :named REQ16_AUXILIARY0)) ;; "incessant ventricular tachycardia" implies "ventricular tachycardia"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not (or patient_has_finding_of_ventricular_tachycardia_now@@incessant
            patient_has_finding_of_electrical_storm_now))
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has incessant ventricular tachycardia) OR (the patient has electrical storm)."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_bundle_branch_reentrant_ventricular_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bundle branch reentrant ventricular tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bundle branch reentrant ventricular tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bundle branch reentrant ventricular tachycardia.","meaning":"Boolean indicating whether the patient currently has bundle branch reentrant ventricular tachycardia."} ;; "bundle branch reentry tachycardia"
(declare-const patient_has_finding_of_bundle_branch_reentrant_ventricular_tachycardia_now@@is_presenting_ventricular_tachycardia Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bundle branch reentrant ventricular tachycardia and it is the presenting ventricular tachycardia.","when_to_set_to_false":"Set to false if the patient currently has bundle branch reentrant ventricular tachycardia but it is not the presenting ventricular tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether bundle branch reentrant ventricular tachycardia is the presenting ventricular tachycardia.","meaning":"Boolean indicating whether bundle branch reentrant ventricular tachycardia is the presenting ventricular tachycardia."} ;; "bundle branch reentry tachycardia as the presenting ventricular tachycardia"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_bundle_branch_reentrant_ventricular_tachycardia_now@@is_presenting_ventricular_tachycardia
      patient_has_finding_of_bundle_branch_reentrant_ventricular_tachycardia_now)
:named REQ17_AUXILIARY0)) ;; "bundle branch reentry tachycardia as the presenting ventricular tachycardia"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_finding_of_bundle_branch_reentrant_ventricular_tachycardia_now@@is_presenting_ventricular_tachycardia)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bundle branch reentry tachycardia as the presenting ventricular tachycardia."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_preexisting_implantable_cardioverter_defibrillator Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a preexisting implantable cardioverter defibrillator.","when_to_set_to_false":"Set to false if the patient does not have a preexisting implantable cardioverter defibrillator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a preexisting implantable cardioverter defibrillator.","meaning":"Boolean indicating whether the patient has a preexisting implantable cardioverter defibrillator."} ;; "The patient is excluded if the patient has a preexisting implantable cardioverter defibrillator."

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_has_preexisting_implantable_cardioverter_defibrillator)
   :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a preexisting implantable cardioverter defibrillator."
