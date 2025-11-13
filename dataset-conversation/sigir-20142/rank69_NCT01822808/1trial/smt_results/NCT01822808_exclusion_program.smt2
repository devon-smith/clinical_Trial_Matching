;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_taking_hydralazine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with a hydralazine-containing product.","when_to_set_to_false":"Set to false if the patient is currently not being treated with a hydralazine-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with a hydralazine-containing product.","meaning":"Boolean indicating whether the patient is currently taking a hydralazine-containing product."} ;; "the patient is currently being treated with hydralazine"
(declare-const patient_is_exposed_to_nitrate_salt_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with or exposed to a nitrate salt.","when_to_set_to_false":"Set to false if the patient is currently not being treated with or exposed to a nitrate salt.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with or exposed to a nitrate salt.","meaning":"Boolean indicating whether the patient is currently exposed to a nitrate salt."} ;; "the patient is currently being treated with nitrates"
(declare-const patient_has_history_of_intolerance_to_oral_therapy_with_hydralazine Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of intolerance to oral therapy with hydralazine.","when_to_set_to_false":"Set to false if the patient does not have a documented history of intolerance to oral therapy with hydralazine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of intolerance to oral therapy with hydralazine.","meaning":"Boolean indicating whether the patient has a history of intolerance to oral therapy with hydralazine."} ;; "the patient has a history of intolerance to oral therapy with hydralazine"
(declare-const patient_has_history_of_intolerance_to_oral_therapy_with_nitrates Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of intolerance to oral therapy with nitrates.","when_to_set_to_false":"Set to false if the patient does not have a documented history of intolerance to oral therapy with nitrates.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of intolerance to oral therapy with nitrates.","meaning":"Boolean indicating whether the patient has a history of intolerance to oral therapy with nitrates."} ;; "the patient has a history of intolerance to oral therapy with nitrates"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_taking_hydralazine_containing_product_now)
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is currently being treated with hydralazine."

(assert
(! (not patient_is_exposed_to_nitrate_salt_now)
:named REQ0_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is currently being treated with nitrates."

(assert
(! (not patient_has_history_of_intolerance_to_oral_therapy_with_hydralazine)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of intolerance to oral therapy with hydralazine."

(assert
(! (not patient_has_history_of_intolerance_to_oral_therapy_with_nitrates)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of intolerance to oral therapy with nitrates."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_receiving_intravenous_treatment_for_heart_failure_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient is receiving any intravenous treatment for heart failure at the time of screening.","when_to_set_to_false":"Set to false if the patient is not receiving any intravenous treatment for heart failure at the time of screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is receiving any intravenous treatment for heart failure at the time of screening.","meaning":"Boolean indicating whether the patient is receiving any intravenous treatment for heart failure at the time of screening."} ;; "the patient is receiving any intravenous treatment for heart failure at the time of screening"
(declare-const patient_is_receiving_intravenous_treatment_for_heart_failure_at_screening@@excluding_intravenous_furosemide Bool) ;; {"when_to_set_to_true":"Set to true if the intravenous treatment for heart failure at the time of screening excludes intravenous furosemide (i.e., the patient is receiving an intravenous treatment for heart failure other than furosemide).","when_to_set_to_false":"Set to false if the only intravenous treatment for heart failure at the time of screening is furosemide, or if no intravenous treatment for heart failure is being received.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the intravenous treatment for heart failure at the time of screening excludes intravenous furosemide.","meaning":"Boolean indicating whether the patient is receiving any intravenous treatment for heart failure at the time of screening, excluding intravenous furosemide."} ;; "EXCEPT intravenous furosemide"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_receiving_intravenous_treatment_for_heart_failure_at_screening@@excluding_intravenous_furosemide
      patient_is_receiving_intravenous_treatment_for_heart_failure_at_screening)
:named REQ1_AUXILIARY0)) ;; "excluding intravenous furosemide" implies "any intravenous treatment for heart failure"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_receiving_intravenous_treatment_for_heart_failure_at_screening@@excluding_intravenous_furosemide)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving any intravenous treatment for heart failure at the time of screening, EXCEPT intravenous furosemide."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's systolic blood pressure is recorded now in millimeters of mercury.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in millimeters of mercury."} ;; "systolic blood pressure"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (< patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 100))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has systolic blood pressure less than 100 millimeters of mercury."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_plan_for_revascularization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented plan for revascularization.","when_to_set_to_false":"Set to false if the patient currently does not have a documented plan for revascularization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a plan for revascularization.","meaning":"Boolean indicating whether the patient currently has a plan for revascularization."} ;; "the patient has a plan for revascularization"
(declare-const patient_has_plan_for_revascularization_now@@planned Bool) ;; {"when_to_set_to_true":"Set to true if the revascularization is planned (intended or scheduled) for the patient.","when_to_set_to_false":"Set to false if the revascularization is not planned for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether revascularization is planned for the patient.","meaning":"Boolean indicating whether revascularization is planned for the patient."} ;; "plan for revascularization (planned)"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_plan_for_revascularization_now@@planned
      patient_has_plan_for_revascularization_now)
:named REQ3_AUXILIARY0)) ;; "planned revascularization implies plan for revascularization"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_plan_for_revascularization_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a plan for revascularization."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const hours_since_hospital_admission_value_recorded_now_withunit_hour Real) ;; {"when_to_set_to_value":"Set to the number of hours that have elapsed since the patient's hospital admission, measured at the current time, in units of hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours have elapsed since the patient's hospital admission.","meaning":"Numeric variable indicating the number of hours that have elapsed since the patient's hospital admission, measured at the current time, in units of hours."} ;; "greater than 96 hours after admission"

(declare-const patient_has_undergone_hospital_admission_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone hospital admission in the past.","when_to_set_to_false":"Set to false if the patient has never undergone hospital admission in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone hospital admission in the past.","meaning":"Boolean indicating whether the patient has ever undergone hospital admission in the past."} ;; "admission"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not (> hours_since_hospital_admission_value_recorded_now_withunit_hour 96))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is greater than 96 hours after admission."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_acute_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute heart failure.","meaning":"Boolean indicating whether the patient currently has acute heart failure."} ;; "acute heart failure"
(declare-const patient_has_finding_of_acute_heart_failure_now@@due_to_reversible_etiology Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute heart failure is due to a reversible etiology.","when_to_set_to_false":"Set to false if the patient's acute heart failure is not due to a reversible etiology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the etiology of the patient's acute heart failure is reversible.","meaning":"Boolean indicating whether the patient's acute heart failure is due to a reversible etiology."} ;; "reversible etiology of acute heart failure"
(declare-const patient_has_finding_of_myocarditis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of myocarditis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of myocarditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of myocarditis.","meaning":"Boolean indicating whether the patient currently has myocarditis."} ;; "myocarditis"
(declare-const patient_has_finding_of_acute_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute myocardial infarction.","meaning":"Boolean indicating whether the patient currently has acute myocardial infarction."} ;; "acute myocardial infarction"
(declare-const patient_has_finding_of_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has arrhythmia.","meaning":"Boolean indicating whether the patient currently has arrhythmia."} ;; "arrhythmia"
(declare-const patient_has_finding_of_arrhythmia_now@@includes_unstable_heart_rate_above_120_per_minute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's arrhythmia includes unstable heart rates above 120 per minute.","when_to_set_to_false":"Set to false if the patient's arrhythmia does not include unstable heart rates above 120 per minute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's arrhythmia includes unstable heart rates above 120 per minute.","meaning":"Boolean indicating whether the patient's arrhythmia includes unstable heart rates above 120 per minute."} ;; "arrhythmia (including unstable heart rates above 120 per minute)"
(declare-const patient_has_finding_of_arrhythmia_now@@includes_unstable_heart_rate_below_50_per_minute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's arrhythmia includes unstable heart rates below 50 per minute.","when_to_set_to_false":"Set to false if the patient's arrhythmia does not include unstable heart rates below 50 per minute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's arrhythmia includes unstable heart rates below 50 per minute.","meaning":"Boolean indicating whether the patient's arrhythmia includes unstable heart rates below 50 per minute."} ;; "arrhythmia (including unstable heart rates below 50 per minute)"
(declare-const patient_heart_rate_value_recorded_now_withunit_per_minute Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's heart rate in beats per minute as recorded now.","when_to_set_to_null":"Set to null if the patient's heart rate value is unknown, not documented, or cannot be determined as recorded now.","meaning":"Numeric value indicating the patient's heart rate (beats per minute) recorded now."} ;; "heart rates above 120 per minute", "heart rates below 50 per minute"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_myocarditis_now
           patient_has_finding_of_acute_myocardial_infarction_now
           patient_has_finding_of_arrhythmia_now)
       patient_has_finding_of_acute_heart_failure_now@@due_to_reversible_etiology)
    :named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (myocarditis, acute myocardial infarction..., arrhythmia...)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_acute_heart_failure_now@@due_to_reversible_etiology
       patient_has_finding_of_acute_heart_failure_now)
    :named REQ5_AUXILIARY1)) ;; "due to reversible etiology"

(assert
(! (=> patient_has_finding_of_arrhythmia_now@@includes_unstable_heart_rate_above_120_per_minute
       patient_has_finding_of_arrhythmia_now)
    :named REQ5_AUXILIARY2)) ;; "arrhythmia includes unstable heart rates above 120 per minute"

(assert
(! (=> patient_has_finding_of_arrhythmia_now@@includes_unstable_heart_rate_below_50_per_minute
       patient_has_finding_of_arrhythmia_now)
    :named REQ5_AUXILIARY3)) ;; "arrhythmia includes unstable heart rates below 50 per minute"

;; Numeric heart rate values imply arrhythmia qualifiers
(assert
(! (=> (> patient_heart_rate_value_recorded_now_withunit_per_minute 120)
       patient_has_finding_of_arrhythmia_now@@includes_unstable_heart_rate_above_120_per_minute)
    :named REQ5_AUXILIARY4)) ;; "unstable heart rates above 120 per minute"

(assert
(! (=> (< patient_heart_rate_value_recorded_now_withunit_per_minute 50)
       patient_has_finding_of_arrhythmia_now@@includes_unstable_heart_rate_below_50_per_minute)
    :named REQ5_AUXILIARY5)) ;; "unstable heart rates below 50 per minute"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_acute_heart_failure_now@@due_to_reversible_etiology)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a reversible etiology of acute heart failure with non-exhaustive examples (myocarditis, acute myocardial infarction (defined as symptoms and major electrocardiogram changes (ST segment elevations)), arrhythmia (including unstable heart rates above 120 per minute, unstable heart rates below 50 per minute))))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_hypertrophic_obstructive_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypertrophic obstructive cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have hypertrophic obstructive cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypertrophic obstructive cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has hypertrophic obstructive cardiomyopathy."} ;; "the patient has hypertrophic obstructive cardiomyopathy"
(declare-const patient_has_finding_of_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any form of cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have any form of cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any form of cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has any form of cardiomyopathy."} ;; "cardiomyopathy"
(declare-const patient_has_finding_of_cardiomyopathy_now@@constrictive_subtype Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cardiomyopathy and the subtype is constrictive.","when_to_set_to_false":"Set to false if the patient currently has cardiomyopathy but the subtype is not constrictive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiomyopathy is constrictive subtype.","meaning":"Boolean indicating whether the patient's current cardiomyopathy is of the constrictive subtype."} ;; "constrictive cardiomyopathy"
(declare-const patient_has_finding_of_endomyocardial_fibroelastosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has endomyocardial fibroelastosis.","when_to_set_to_false":"Set to false if the patient currently does not have endomyocardial fibroelastosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has endomyocardial fibroelastosis.","meaning":"Boolean indicating whether the patient currently has endomyocardial fibroelastosis."} ;; "endomyocardial fibroelastosis"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_cardiomyopathy_now@@constrictive_subtype
       patient_has_finding_of_cardiomyopathy_now)
   :named REQ6_AUXILIARY0)) ;; "constrictive cardiomyopathy"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (or patient_has_finding_of_hypertrophic_obstructive_cardiomyopathy_now
            patient_has_finding_of_cardiomyopathy_now@@constrictive_subtype
            patient_has_finding_of_endomyocardial_fibroelastosis_now))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has hypertrophic obstructive cardiomyopathy) OR (the patient has constrictive cardiomyopathy) OR (the patient has endomyocardial fibroelastosis))."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_congenital_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congenital heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have congenital heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congenital heart disease.","meaning":"Boolean indicating whether the patient currently has congenital heart disease."} ;; "congenital heart disease"
(declare-const patient_has_finding_of_congenital_heart_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's congenital heart disease is severe.","when_to_set_to_false":"Set to false if the patient's congenital heart disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's congenital heart disease is severe.","meaning":"Boolean indicating whether the patient's congenital heart disease is severe."} ;; "severe congenital heart disease"
(declare-const patient_has_finding_of_tetralogy_of_fallot_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tetralogy of Fallot.","when_to_set_to_false":"Set to false if the patient currently does not have tetralogy of Fallot.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tetralogy of Fallot.","meaning":"Boolean indicating whether the patient currently has tetralogy of Fallot."} ;; "tetralogy of Fallot"
(declare-const patient_has_finding_of_tetralogy_of_fallot_now@@uncorrected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's tetralogy of Fallot is uncorrected.","when_to_set_to_false":"Set to false if the patient's tetralogy of Fallot is corrected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's tetralogy of Fallot is uncorrected.","meaning":"Boolean indicating whether the patient's tetralogy of Fallot is uncorrected."} ;; "uncorrected tetralogy of Fallot"
(declare-const patient_has_finding_of_transposition_of_aorta_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has transposition of the aorta.","when_to_set_to_false":"Set to false if the patient currently does not have transposition of the aorta.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has transposition of the aorta.","meaning":"Boolean indicating whether the patient currently has transposition of the aorta."} ;; "transposition of the aorta"
(declare-const patient_has_finding_of_transposition_of_aorta_now@@uncorrected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's transposition of the aorta is uncorrected.","when_to_set_to_false":"Set to false if the patient's transposition of the aorta is corrected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's transposition of the aorta is uncorrected.","meaning":"Boolean indicating whether the patient's transposition of the aorta is uncorrected."} ;; "uncorrected transposition of the aorta"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_tetralogy_of_fallot_now@@uncorrected
           patient_has_finding_of_transposition_of_aorta_now@@uncorrected)
        patient_has_finding_of_congenital_heart_disease_now@@severe)
   :named REQ7_AUXILIARY0)) ;; "with non-exhaustive examples (uncorrected tetralogy of Fallot, uncorrected transposition of the aorta)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_congenital_heart_disease_now@@severe
        patient_has_finding_of_congenital_heart_disease_now)
   :named REQ7_AUXILIARY1)) ;; "severe congenital heart disease"

(assert
(! (=> patient_has_finding_of_tetralogy_of_fallot_now@@uncorrected
        patient_has_finding_of_tetralogy_of_fallot_now)
   :named REQ7_AUXILIARY2)) ;; "uncorrected tetralogy of Fallot"

(assert
(! (=> patient_has_finding_of_transposition_of_aorta_now@@uncorrected
        patient_has_finding_of_transposition_of_aorta_now)
   :named REQ7_AUXILIARY3)) ;; "uncorrected transposition of the aorta"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_congenital_heart_disease_now@@severe)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has known severe congenital heart disease with non-exhaustive examples (uncorrected tetralogy of Fallot, uncorrected transposition of the aorta))."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_aortic_valve_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of aortic valve stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of aortic valve stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of aortic valve stenosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of aortic valve stenosis."} ;; "aortic stenosis"
(declare-const patient_has_diagnosis_of_aortic_valve_stenosis_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of aortic valve stenosis and the diagnosis is severe.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of aortic valve stenosis but the diagnosis is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of aortic valve stenosis is severe.","meaning":"Boolean indicating whether the patient currently has a diagnosis of aortic valve stenosis and the diagnosis is severe."} ;; "severe aortic stenosis"
(declare-const patient_has_diagnosis_of_mitral_valve_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mitral valve stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mitral valve stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mitral valve stenosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mitral valve stenosis."} ;; "mitral stenosis"
(declare-const patient_has_diagnosis_of_mitral_valve_stenosis_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mitral valve stenosis and the diagnosis is severe.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of mitral valve stenosis but the diagnosis is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of mitral valve stenosis is severe.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mitral valve stenosis and the diagnosis is severe."} ;; "severe mitral stenosis"
(declare-const patient_has_diagnosis_of_rheumatic_mitral_regurgitation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of rheumatic mitral regurgitation.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of rheumatic mitral regurgitation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of rheumatic mitral regurgitation.","meaning":"Boolean indicating whether the patient currently has a diagnosis of rheumatic mitral regurgitation."} ;; "rheumatic mitral regurgitation"
(declare-const patient_has_diagnosis_of_rheumatic_mitral_regurgitation_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of rheumatic mitral regurgitation and the diagnosis is severe.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of rheumatic mitral regurgitation but the diagnosis is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of rheumatic mitral regurgitation is severe.","meaning":"Boolean indicating whether the patient currently has a diagnosis of rheumatic mitral regurgitation and the diagnosis is severe."} ;; "severe rheumatic mitral regurgitation"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_aortic_valve_stenosis_now@@severe
      patient_has_diagnosis_of_aortic_valve_stenosis_now)
   :named REQ8_AUXILIARY0)) ;; "severe aortic stenosis"

(assert
(! (=> patient_has_diagnosis_of_mitral_valve_stenosis_now@@severe
      patient_has_diagnosis_of_mitral_valve_stenosis_now)
   :named REQ8_AUXILIARY1)) ;; "severe mitral stenosis"

(assert
(! (=> patient_has_diagnosis_of_rheumatic_mitral_regurgitation_now@@severe
      patient_has_diagnosis_of_rheumatic_mitral_regurgitation_now)
   :named REQ8_AUXILIARY2)) ;; "severe rheumatic mitral regurgitation"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_diagnosis_of_aortic_valve_stenosis_now@@severe)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe aortic stenosis."

(assert
(! (not patient_has_diagnosis_of_mitral_valve_stenosis_now@@severe)
   :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe mitral stenosis."

(assert
(! (not patient_has_diagnosis_of_rheumatic_mitral_regurgitation_now@@severe)
   :named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe rheumatic mitral regurgitation."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_creatinine_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a creatinine measurement in milligrams per deciliter is available now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine measurement in milligrams per deciliter."} ;; "creatinine greater than 3 milligrams per deciliter"
(declare-const patient_creatinine_value_recorded_now_withunit_milligrams_per_deciliter@@at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the creatinine value was measured at the time of screening.","when_to_set_to_false":"Set to false if the creatinine value was measured but not at the time of screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the creatinine value was measured at the time of screening.","meaning":"Boolean indicating whether the creatinine value was measured at the time of screening."} ;; "creatinine greater than 3 milligrams per deciliter at screening"
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal impairment.","meaning":"Boolean indicating whether the patient currently has renal impairment."} ;; "renal impairment"
(declare-const patient_has_finding_of_renal_impairment_now@@at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal impairment at the time of screening.","when_to_set_to_false":"Set to false if the patient currently has renal impairment but not at the time of screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal impairment at the time of screening.","meaning":"Boolean indicating whether the patient currently has renal impairment at the time of screening."} ;; "renal impairment at screening"
(declare-const patient_is_undergoing_dialysis_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing any type of dialysis procedure.","when_to_set_to_false":"Set to false if the patient is currently not undergoing any type of dialysis procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing dialysis.","meaning":"Boolean indicating whether the patient is currently undergoing dialysis."} ;; "the patient is on any type of dialysis"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Definition: renal impairment at screening is defined by creatinine > 3 mg/dL at screening
(assert
(! (= patient_has_finding_of_renal_impairment_now@@at_screening
(and patient_creatinine_value_recorded_now_withunit_milligrams_per_deciliter@@at_screening
     (> patient_creatinine_value_recorded_now_withunit_milligrams_per_deciliter 3)))
:named REQ9_AUXILIARY0)) ;; "renal impairment (defined by creatinine greater than 3 milligrams per deciliter) at screening"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_renal_impairment_now@@at_screening
       patient_has_finding_of_renal_impairment_now)
:named REQ9_AUXILIARY1)) ;; "renal impairment at screening" implies "renal impairment"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient must NOT have renal impairment at screening
(assert
(! (not patient_has_finding_of_renal_impairment_now@@at_screening)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has renal impairment (defined by creatinine greater than 3 milligrams per deciliter) at screening"

;; Exclusion: patient must NOT be undergoing any type of dialysis
(assert
(! (not patient_is_undergoing_dialysis_procedure_now)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is on any type of dialysis"

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_hepatic_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known hepatic impairment.","when_to_set_to_false":"Set to false if the patient currently does not have a known hepatic impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known hepatic impairment.","meaning":"Boolean indicating whether the patient currently has known hepatic impairment."} ;; "the patient has known hepatic impairment"

(declare-const patient_bilirubin_total_measurement_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a total bilirubin measurement (in milligrams per deciliter) is recorded for the patient now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's total bilirubin (mg/dL) measured now."} ;; "total bilirubin > 3 milligrams per deciliter"

(declare-const patient_ammonia_measurement_value_recorded_now_withunit_micromoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if an ammonia measurement (in micromoles per liter) is recorded for the patient now (at screening).","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's ammonia (μmol/L) measured now (at screening)."} ;; "ammonia levels"

(declare-const patient_ammonia_measurement_value_recorded_now_withunit_micromoles_per_liter@@measured_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the ammonia measurement was taken at the time of screening.","when_to_set_to_false":"Set to false if the ammonia measurement was not taken at screening.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the ammonia measurement was taken at screening.","meaning":"Indicates whether the ammonia measurement was taken at screening."} ;; "ammonia levels at screening"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; No explicit definition or umbrella logic in this requirement; all variables are atomic.

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion 1: The patient is excluded if the patient has known hepatic impairment (total bilirubin > 3 milligrams per deciliter).
(assert
(! (not (and patient_has_finding_of_hepatic_impairment_now
             (> patient_bilirubin_total_measurement_value_recorded_now_withunit_milligrams_per_deciliter 3)))
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hepatic impairment (total bilirubin > 3 milligrams per deciliter)."

;; Exclusion 2: The patient is excluded if the patient has increased ammonia levels at screening.
;; Note: "increased" is not numerically defined, so we use the presence of a measured value at screening as the atomic fact.
(assert
(! (not patient_ammonia_measurement_value_recorded_now_withunit_micromoles_per_liter@@measured_at_screening)
   :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has increased ammonia levels at screening."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_diagnosis_of_systemic_lupus_erythematosus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with systemic lupus erythematosus at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with systemic lupus erythematosus at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with systemic lupus erythematosus.","meaning":"Boolean indicating whether the patient has ever been diagnosed with systemic lupus erythematosus at any time in their history."} ;; "the patient has a history of systemic lupus erythematosus"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (not patient_has_diagnosis_of_systemic_lupus_erythematosus_inthehistory)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of systemic lupus erythematosus."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a cerebrovascular accident (stroke) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a cerebrovascular accident (stroke) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever had a cerebrovascular accident (stroke) in their history."} ;; "stroke"

(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory@@temporalcontext_within2weeks_before_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebrovascular accident (stroke) within 2 weeks before the screening date.","when_to_set_to_false":"Set to false if the patient has not had a cerebrovascular accident (stroke) within 2 weeks before the screening date.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebrovascular accident (stroke) within 2 weeks before the screening date.","meaning":"Boolean indicating whether the patient has had a cerebrovascular accident (stroke) within 2 weeks before screening."} ;; "stroke within 2 weeks from screening"

(declare-const patient_has_finding_of_transient_cerebral_ischemia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a transient cerebral ischemia (transient ischemic attack) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a transient cerebral ischemia (transient ischemic attack) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a transient cerebral ischemia (transient ischemic attack).","meaning":"Boolean indicating whether the patient has ever had a transient cerebral ischemia (transient ischemic attack) in their history."} ;; "transient ischemic attack"

(declare-const patient_has_finding_of_transient_cerebral_ischemia_inthehistory@@temporalcontext_within2weeks_before_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a transient cerebral ischemia (transient ischemic attack) within 2 weeks before the screening date.","when_to_set_to_false":"Set to false if the patient has not had a transient cerebral ischemia (transient ischemic attack) within 2 weeks before the screening date.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a transient cerebral ischemia (transient ischemic attack) within 2 weeks before the screening date.","meaning":"Boolean indicating whether the patient has had a transient cerebral ischemia (transient ischemic attack) within 2 weeks before screening."} ;; "transient ischemic attack within 2 weeks from screening"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_cerebrovascular_accident_inthehistory@@temporalcontext_within2weeks_before_screening
      patient_has_finding_of_cerebrovascular_accident_inthehistory)
    :named REQ12_AUXILIARY0)) ;; "stroke within 2 weeks from screening" implies "stroke in history"

(assert
(! (=> patient_has_finding_of_transient_cerebral_ischemia_inthehistory@@temporalcontext_within2weeks_before_screening
      patient_has_finding_of_transient_cerebral_ischemia_inthehistory)
    :named REQ12_AUXILIARY1)) ;; "transient ischemic attack within 2 weeks from screening" implies "transient ischemic attack in history"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthehistory@@temporalcontext_within2weeks_before_screening)
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a stroke within 2 weeks from screening."

(assert
(! (not patient_has_finding_of_transient_cerebral_ischemia_inthehistory@@temporalcontext_within2weeks_before_screening)
    :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a transient ischemic attack within 2 weeks from screening."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} ;; "the patient is a woman"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as not currently pregnant.","when_to_set_to_null":"Set to null if the patient's pregnancy status is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently lactating.","when_to_set_to_false":"Set to false if the patient is documented as not currently lactating.","when_to_set_to_null":"Set to null if the patient's lactation status is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not (and patient_sex_is_female_now patient_is_pregnant_now))
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is pregnant."

(assert
(! (not (and patient_sex_is_female_now patient_is_lactating_now))
    :named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is lactating."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_allergy_to_organic_nitrates Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or known allergy to organic nitrates.","when_to_set_to_false":"Set to false if the patient does not have a documented or known allergy to organic nitrates.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an allergy to organic nitrates.","meaning":"Boolean indicating whether the patient has an allergy specifically to organic nitrates."} ;; "The patient is excluded if the patient has an allergy to organic nitrates."

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
  (! (not patient_has_allergy_to_organic_nitrates)
     :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to organic nitrates."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_diagnosis_of_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with any other disease at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with any other disease at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with any other disease.","meaning":"Boolean indicating whether the patient has ever been diagnosed with any other disease at any time in the past."} ;; "the patient has a history of any other disease"
(declare-const patient_life_expectancy_value_recorded_inthehistory_in_months Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's estimated life expectancy in months, as determined by clinical assessment at any time in the past.","when_to_set_to_null":"Set to null if the patient's estimated life expectancy in months at any time in the past is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's estimated life expectancy in months, as determined by clinical assessment at any time in the past."} ;; "life expectancy < 12 months (in the history)"
(declare-const patient_has_diagnosis_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other disease.","when_to_set_to_false":"Set to false if the patient currently does not have any other disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any other disease.","meaning":"Boolean indicating whether the patient currently has any other disease."} ;; "presence of any other disease"
(declare-const patient_life_expectancy_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's current estimated life expectancy in months, as determined by clinical assessment.","when_to_set_to_null":"Set to null if the patient's current estimated life expectancy in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current estimated life expectancy in months, as determined by clinical assessment."} ;; "life expectancy < 12 months (now)"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignancy (malignant neoplastic disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignancy (malignant neoplastic disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignancy (malignant neoplastic disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignancy (malignant neoplastic disease)."} ;; "malignancy"
(declare-const patient_has_diagnosis_of_aids_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acquired immunodeficiency syndrome (AIDS).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acquired immunodeficiency syndrome (AIDS).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acquired immunodeficiency syndrome (AIDS).","meaning":"Boolean indicating whether the patient currently has a diagnosis of acquired immunodeficiency syndrome (AIDS)."} ;; "acquired immunodeficiency syndrome"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Non-exhaustive examples: malignancy or AIDS are examples of "any other disease with life expectancy < 12 months"
(assert
(! (=> (or patient_has_diagnosis_of_malignant_neoplastic_disease_now
           patient_has_diagnosis_of_aids_now)
     patient_has_diagnosis_of_disease_now)
:named REQ15_AUXILIARY0)) ;; "including but not limited to malignancy or acquired immunodeficiency syndrome"

;; ===================== Constraint Assertions (REQ 15) =====================
;; Exclusion if history of any other disease with life expectancy < 12 months
(assert
(! (not (and patient_has_diagnosis_of_disease_inthehistory
             (< patient_life_expectancy_value_recorded_inthehistory_in_months 12)))
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a history of any other disease with a life expectancy < 12 months"

;; Exclusion if presence of any other disease with life expectancy < 12 months
(assert
(! (not (and patient_has_diagnosis_of_disease_now
             (< patient_life_expectancy_value_recorded_now_in_months 12)))
:named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has presence of any other disease with a life expectancy < 12 months"
