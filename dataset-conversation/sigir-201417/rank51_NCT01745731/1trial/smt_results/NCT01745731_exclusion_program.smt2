;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_tumor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a tumor as a disease.","when_to_set_to_false":"Set to false if the patient currently does not have a tumor as a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a tumor as a disease.","meaning":"Boolean indicating whether the patient currently has a tumor as a disease."} ;; "tumor as a current disease"
(declare-const patient_has_finding_of_tumor_now@@different_from_index_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current tumor is different from the index disease under study.","when_to_set_to_false":"Set to false if the patient's current tumor is not different from the index disease under study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current tumor is different from the index disease under study.","meaning":"Boolean indicating whether the patient's current tumor is different from the index disease under study."} ;; "different tumor as a current disease"
(declare-const patient_has_finding_of_disorder_of_cellular_component_of_blood_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of cellular component of blood (hematologic disease).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of cellular component of blood (hematologic disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of cellular component of blood (hematologic disease).","meaning":"Boolean indicating whether the patient currently has a disorder of cellular component of blood (hematologic disease)."} ;; "hematologic disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_tumor_now@@different_from_index_disease
      patient_has_finding_of_tumor_now)
:named REQ0_AUXILIARY0)) ;; "different tumor as a current disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_tumor_now@@different_from_index_disease)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a different tumor as a current disease."

(assert
(! (not patient_has_finding_of_disorder_of_cellular_component_of_blood_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any hematologic disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_poor_hypertension_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of poor hypertension control (uncontrolled hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of poor hypertension control (uncontrolled hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor hypertension control (uncontrolled hypertension).","meaning":"Boolean indicating whether the patient currently has poor hypertension control (uncontrolled hypertension)."} ;; "uncontrolled hypertension"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_poor_hypertension_control_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "heart failure"
(declare-const patient_has_finding_of_heart_failure_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart failure is severe.","when_to_set_to_false":"Set to false if the patient's current heart failure is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart failure is severe.","meaning":"Boolean indicating whether the patient's current heart failure is severe."} ;; "severe heart failure"
(declare-const patient_has_finding_of_heart_failure_now@@new_york_heart_association_class_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart failure is classified as New York Heart Association class IV.","when_to_set_to_false":"Set to false if the patient's current heart failure is not classified as New York Heart Association class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart failure is classified as New York Heart Association class IV.","meaning":"Boolean indicating whether the patient's current heart failure is classified as New York Heart Association class IV."} ;; "New York Heart Association class IV heart failure"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; NYHA class IV is a specific subclass of severe heart failure
(assert
(! (=> patient_has_finding_of_heart_failure_now@@new_york_heart_association_class_iv
      patient_has_finding_of_heart_failure_now@@severe)
    :named REQ2_AUXILIARY0)) ;; "New York Heart Association class IV" ⇒ "severe heart failure"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_heart_failure_now@@severe
      patient_has_finding_of_heart_failure_now)
    :named REQ2_AUXILIARY1)) ;; "severe heart failure" ⇒ "heart failure"

(assert
(! (=> patient_has_finding_of_heart_failure_now@@new_york_heart_association_class_iv
      patient_has_finding_of_heart_failure_now)
    :named REQ2_AUXILIARY2)) ;; "New York Heart Association class IV heart failure" ⇒ "heart failure"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_heart_failure_now@@new_york_heart_association_class_iv)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe heart failure (New York Heart Association class IV)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_ventricular_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ventricular arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ventricular arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of ventricular arrhythmia.","meaning":"Boolean indicating whether the patient currently has ventricular arrhythmia."} ;; "ventricular arrhythmias"
(declare-const patient_has_finding_of_ventricular_arrhythmia_now@@malignant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ventricular arrhythmia is malignant.","when_to_set_to_false":"Set to false if the patient's current ventricular arrhythmia is not malignant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ventricular arrhythmia is malignant.","meaning":"Boolean indicating whether the patient's current ventricular arrhythmia is malignant."} ;; "malignant ventricular arrhythmias"
(declare-const patient_has_finding_of_angina_pectoris_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of angina pectoris.","meaning":"Boolean indicating whether the patient currently has angina pectoris."} ;; "angina"
(declare-const patient_has_finding_of_angina_pectoris_now@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current angina pectoris is unstable.","when_to_set_to_false":"Set to false if the patient's current angina pectoris is not unstable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current angina pectoris is unstable.","meaning":"Boolean indicating whether the patient's current angina pectoris is unstable."} ;; "unstable angina"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_ventricular_arrhythmia_now@@malignant
       patient_has_finding_of_ventricular_arrhythmia_now)
   :named REQ3_AUXILIARY0)) ;; "malignant ventricular arrhythmias""

(assert
(! (=> patient_has_finding_of_angina_pectoris_now@@unstable
       patient_has_finding_of_angina_pectoris_now)
   :named REQ3_AUXILIARY1)) ;; "unstable angina"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_ventricular_arrhythmia_now@@malignant)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignant ventricular arrhythmias."

(assert
(! (not patient_has_finding_of_angina_pectoris_now@@unstable)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable angina."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_deep_venous_thrombosis_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of deep vein thrombosis within the past three months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of deep vein thrombosis within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of deep vein thrombosis within the past three months.","meaning":"Boolean indicating whether the patient has had a diagnosis of deep vein thrombosis within the past three months."} ;; "deep vein thrombosis within the previous three months"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_deep_venous_thrombosis_inthepast3months)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a diagnosis of deep vein thrombosis within the previous three months."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_receiving_vasoactive_agents_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving vasoactive agents therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving vasoactive agents therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving vasoactive agents therapy.","meaning":"Boolean indicating whether the patient is currently receiving vasoactive agents therapy."} ;; "vasoactive agents therapy"
(declare-const patient_is_receiving_vasoactive_substances_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving vasoactive substances therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving vasoactive substances therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving vasoactive substances therapy.","meaning":"Boolean indicating whether the patient is currently receiving vasoactive substances therapy."} ;; "vasoactive substances therapy"
(declare-const patient_is_taking_angiogenesis_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an angiogenesis inhibitor-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking an angiogenesis inhibitor-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an angiogenesis inhibitor-containing product.","meaning":"Boolean indicating whether the patient is currently taking an angiogenesis inhibitor-containing product."} ;; "angiogenesis inhibitors therapy"
(declare-const patient_is_taking_angiogenesis_inhibitor_containing_product_now@@adjunctive_therapy_context Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an angiogenesis inhibitor-containing product and it is being used as adjunctive therapy.","when_to_set_to_false":"Set to false if the patient is currently taking an angiogenesis inhibitor-containing product but it is not being used as adjunctive therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapy is adjunctive.","meaning":"Boolean indicating whether the patient's current angiogenesis inhibitor-containing product is adjunctive."} ;; "angiogenesis inhibitors therapy as adjunctive therapy"
(declare-const patient_is_taking_angiogenesis_inhibitor_containing_product_now@@against_cyclooxygenase_2 Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an angiogenesis inhibitor-containing product and it is being used against cyclooxygenase-2.","when_to_set_to_false":"Set to false if the patient is currently taking an angiogenesis inhibitor-containing product but it is not being used against cyclooxygenase-2.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product is being used against cyclooxygenase-2.","meaning":"Boolean indicating whether the patient's current angiogenesis inhibitor-containing product is being used against cyclooxygenase-2."} ;; "angiogenesis inhibitors therapy against cyclooxygenase-2"
(declare-const patient_is_undergoing_hyperbaric_oxygen_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing hyperbaric oxygen therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing hyperbaric oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing hyperbaric oxygen therapy.","meaning":"Boolean indicating whether the patient is currently undergoing hyperbaric oxygen therapy."} ;; "hyperbaric oxygen therapy"
(declare-const patient_is_undergoing_hyperbaric_oxygen_therapy_now@@adjunctive_therapy_context Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing hyperbaric oxygen therapy and it is being used as adjunctive therapy.","when_to_set_to_false":"Set to false if the patient is currently undergoing hyperbaric oxygen therapy but it is not being used as adjunctive therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapy is adjunctive.","meaning":"Boolean indicating whether the patient's current hyperbaric oxygen therapy is adjunctive."} ;; "hyperbaric oxygen therapy as adjunctive therapy"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_taking_angiogenesis_inhibitor_containing_product_now@@adjunctive_therapy_context
      patient_is_taking_angiogenesis_inhibitor_containing_product_now)
:named REQ5_AUXILIARY0)) ;; "angiogenesis inhibitors therapy as adjunctive therapy"

(assert
(! (=> patient_is_taking_angiogenesis_inhibitor_containing_product_now@@against_cyclooxygenase_2
      patient_is_taking_angiogenesis_inhibitor_containing_product_now)
:named REQ5_AUXILIARY1)) ;; "angiogenesis inhibitors therapy against cyclooxygenase-2"

(assert
(! (=> patient_is_undergoing_hyperbaric_oxygen_therapy_now@@adjunctive_therapy_context
      patient_is_undergoing_hyperbaric_oxygen_therapy_now)
:named REQ5_AUXILIARY2)) ;; "hyperbaric oxygen therapy as adjunctive therapy"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (or patient_is_undergoing_hyperbaric_oxygen_therapy_now
            patient_is_receiving_vasoactive_substances_therapy_now
            patient_is_receiving_vasoactive_agents_therapy_now
            patient_is_taking_angiogenesis_inhibitor_containing_product_now@@adjunctive_therapy_context
            patient_is_taking_angiogenesis_inhibitor_containing_product_now@@against_cyclooxygenase_2))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving adjunctive therapy with non-exhaustive examples (hyperbaric oxygen therapy, vasoactive substances therapy, vasoactive agents therapy, angiogenesis inhibitors therapy against cyclooxygenase-2)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of the patient's body mass index (in kilograms per square meter) recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kilograms per square meter."} ;; "body mass index"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (> patient_body_mass_index_value_recorded_now_withunit_kilograms_per_square_meter 40))
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a body mass index greater than forty kilograms per square meter."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_alcoholism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has active alcoholism (i.e., is currently alcoholic with ongoing alcohol use disorder).","when_to_set_to_false":"Set to false if the patient currently does not have active alcoholism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has active alcoholism.","meaning":"Boolean indicating whether the patient currently has active alcoholism (alcohol use disorder) now."} ;; "alcoholic with active alcoholism"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_alcoholism_now)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient is alcoholic with active alcoholism."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_proliferative_retinopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of proliferative retinopathy.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of proliferative retinopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of proliferative retinopathy.","meaning":"Boolean indicating whether the patient currently has proliferative retinopathy."} ;; "proliferative retinopathy"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_proliferative_retinopathy_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has proliferative retinopathy."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease.","when_to_set_to_false":"Set to false if the patient currently does not have a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease.","meaning":"Boolean indicating whether the patient currently has a disease."} ;; "disease"
(declare-const patient_has_finding_of_disease_now@@is_concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the disease present in the patient is concomitant.","when_to_set_to_false":"Set to false if the disease present in the patient is not concomitant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease present in the patient is concomitant.","meaning":"Boolean indicating whether the disease present in the patient is concomitant."} ;; "concomitant disease"
(declare-const patient_has_finding_of_disease_now@@reduces_life_expectancy_to_less_than_one_year Bool) ;; {"when_to_set_to_true":"Set to true if the disease present in the patient reduces life expectancy to less than one year.","when_to_set_to_false":"Set to false if the disease present in the patient does not reduce life expectancy to less than one year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease present in the patient reduces life expectancy to less than one year.","meaning":"Boolean indicating whether the disease present in the patient reduces life expectancy to less than one year."} ;; "disease reduces life expectancy to less than one year"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_now@@is_concomitant
      patient_has_finding_of_disease_now)
:named REQ9_AUXILIARY0)) ;; "concomitant disease"

(assert
(! (=> patient_has_finding_of_disease_now@@reduces_life_expectancy_to_less_than_one_year
      patient_has_finding_of_disease_now)
:named REQ9_AUXILIARY1)) ;; "disease reduces life expectancy to less than one year"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient must NOT have a concomitant disease that reduces life expectancy to less than one year
(assert
(! (not (and patient_has_finding_of_disease_now@@is_concomitant
             patient_has_finding_of_disease_now@@reduces_life_expectancy_to_less_than_one_year))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a concomitant disease that reduces life expectancy to less than one year."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_monitoring_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a problem or difficulty with monitoring.","when_to_set_to_false":"Set to false if the patient currently does not have a problem or difficulty with monitoring.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a problem or difficulty with monitoring.","meaning":"Boolean indicating whether the patient currently has a problem or difficulty with monitoring."} ;; "difficulty in monitoring"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_monitoring_problem_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has difficulty in monitoring."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
;; "heart failure"
;; Variable already declared and reused:
;; (declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "heart failure"

(declare-const patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if a numeric measurement of the patient's cardiac ejection fraction recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent representing the patient's current cardiac ejection fraction."} ;; "ejection fraction less than 30 percent"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion: patient must NOT have heart failure
(assert
(! (not patient_has_finding_of_heart_failure_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart failure."

;; Exclusion: patient must NOT have ejection fraction less than 30 percent
(assert
(! (not (< patient_cardiac_ejection_fraction_value_recorded_now_withunit_percent 30))
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an ejection fraction less than 30 percent."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebrovascular accident (stroke) within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had a cerebrovascular accident (stroke) within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebrovascular accident (stroke) within the past 3 months.","meaning":"Boolean indicating whether the patient has had a cerebrovascular accident (stroke) within the past 3 months."} ;; "stroke within the last 3 months"
(declare-const patient_has_finding_of_myocardial_infarction_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the past 3 months.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the past 3 months."} ;; "myocardial infarction within the last 3 months"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthepast3months)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a stroke within the last 3 months."

(assert
(! (not patient_has_finding_of_myocardial_infarction_inthepast3months)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a myocardial infarction within the last 3 months."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered to have childbearing potential (e.g., premenopausal female, not sterilized).","when_to_set_to_false":"Set to false if the patient does not have childbearing potential (e.g., postmenopausal, sterilized, or male).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "the patient is a woman of childbearing age"
(declare-const patient_has_adequate_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has contraception that is considered adequate (i.e., sufficient to prevent pregnancy according to clinical standards).","when_to_set_to_false":"Set to false if the patient currently does not have contraception or has contraception that is not considered adequate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has adequate contraception.","meaning":"Boolean indicating whether the patient currently has adequate contraception."} ;; "the patient does NOT have adequate contraception"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Exclusion: patient is excluded if (pregnant) OR ((woman of childbearing age) AND (does NOT have adequate contraception))
(assert
(! (not (or patient_is_pregnant_now
            (and patient_has_childbearing_potential_now
                 (not patient_has_adequate_contraception_now))))
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is pregnant) OR ((the patient is a woman of childbearing age) AND (the patient does NOT have adequate contraception))."
