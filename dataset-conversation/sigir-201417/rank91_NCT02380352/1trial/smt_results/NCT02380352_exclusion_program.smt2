;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_cystic_fibrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cystic fibrosis.","when_to_set_to_false":"Set to false if the patient currently does not have cystic fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cystic fibrosis.","meaning":"Boolean indicating whether the patient currently has cystic fibrosis."} ;; "The patient is excluded if the patient has cystic fibrosis."

(declare-const patient_has_finding_of_anatomic_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has anatomic lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have anatomic lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has anatomic lung disease.","meaning":"Boolean indicating whether the patient currently has anatomic lung disease."} ;; "The patient is excluded if the patient has anatomic lung disease."

(declare-const patient_has_finding_of_bronchiectasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bronchiectasis.","when_to_set_to_false":"Set to false if the patient currently does not have bronchiectasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bronchiectasis.","meaning":"Boolean indicating whether the patient currently has bronchiectasis."} ;; "The patient is excluded if the patient has bronchiectasis."

(declare-const patient_has_finding_of_congenital_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congenital heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have congenital heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congenital heart disease.","meaning":"Boolean indicating whether the patient currently has congenital heart disease."} ;; "The patient is excluded if the patient has congenital heart disease."

(declare-const patient_has_finding_of_history_of_repeated_aspiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a history of repeated aspiration.","when_to_set_to_false":"Set to false if the patient currently does not have a history of repeated aspiration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a history of repeated aspiration.","meaning":"Boolean indicating whether the patient currently has a history of repeated aspiration."} ;; "The patient is excluded if the patient has a history of repeated aspiration."

(declare-const patient_has_finding_of_velopharyngeal_incompetence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has velopharyngeal incompetence.","when_to_set_to_false":"Set to false if the patient currently does not have velopharyngeal incompetence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has velopharyngeal incompetence.","meaning":"Boolean indicating whether the patient currently has velopharyngeal incompetence."} ;; "The patient is excluded if the patient has a history of velopharyngeal incompetence."

(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malignancy.","when_to_set_to_false":"Set to false if the patient currently does not have malignancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignancy.","meaning":"Boolean indicating whether the patient currently has malignancy."} ;; "The patient is excluded if the patient has malignancy."

(declare-const patient_has_finding_of_conditions_requiring_treatment_with_immune_suppressants_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has conditions requiring treatment with immune suppressants.","when_to_set_to_false":"Set to false if the patient currently does not have conditions requiring treatment with immune suppressants.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has conditions requiring treatment with immune suppressants.","meaning":"Boolean indicating whether the patient currently has conditions requiring treatment with immune suppressants."} ;; "The patient is excluded if the patient has conditions requiring treatment with immune suppressants."

(declare-const patient_has_finding_of_primary_immune_deficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has primary immunodeficiency.","when_to_set_to_false":"Set to false if the patient currently does not have primary immunodeficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has primary immunodeficiency.","meaning":"Boolean indicating whether the patient currently has primary immunodeficiency."} ;; "The patient is excluded if the patient has primary immunodeficiency."

(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection."} ;; "The patient is excluded if the patient has advanced human immunodeficiency virus infection."

(declare-const hospital_admission_duration_value_recorded_inthehistory_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours for each hospital admission in the patient's history.","when_to_set_to_null":"Set to null if the duration of hospital admission is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in hours of each hospital admission in the patient's history."} ;; "The patient is excluded if the patient has prolonged admissions to hospital with duration > 48 hours within the past 2 months."

(declare-const hospital_admission_time_since_value_recorded_inthehistory_withunit_months Real) ;; {"when_to_set_to_value":"Set to the number of months since each hospital admission in the patient's history.","when_to_set_to_null":"Set to null if the time since hospital admission is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the time in months since each hospital admission in the patient's history."} ;; "The patient is excluded if the patient has prolonged admissions to hospital with duration > 48 hours within the past 2 months."

(declare-const pneumonia_time_since_diagnosis_value_recorded_inthehistory_withunit_months Real) ;; {"when_to_set_to_value":"Set to the number of months since pneumonia was previously diagnosed in the patient's history.","when_to_set_to_null":"Set to null if the time since pneumonia diagnosis is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the time in months since pneumonia was previously diagnosed in the patient's history."} ;; "The patient is excluded if the patient has pneumonia previously diagnosed within the past 1 month."

(declare-const patient_has_finding_of_abscess_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has lung abscess.","when_to_set_to_false":"Set to false if the patient currently does not have lung abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lung abscess.","meaning":"Boolean indicating whether the patient currently has lung abscess."} ;; "The patient is excluded if the patient has lung abscess diagnosed within the past 6 months."

(declare-const lung_abscess_time_since_diagnosis_value_recorded_inthehistory_withunit_months Real) ;; {"when_to_set_to_value":"Set to the number of months since lung abscess was diagnosed in the patient's history.","when_to_set_to_null":"Set to null if the time since lung abscess diagnosis is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the time in months since lung abscess was diagnosed in the patient's history."} ;; "The patient is excluded if the patient has lung abscess diagnosed within the past 6 months."

(declare-const beta_lactam_antibiotic_therapy_duration_value_recorded_at_presentation_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours of beta-lactam antibiotic therapy already received at presentation to the emergency department.","when_to_set_to_null":"Set to null if the duration of beta-lactam antibiotic therapy is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in hours of beta-lactam antibiotic therapy already received at presentation to the emergency department."} ;; "The patient is excluded if the patient has received > 24 hours of beta-lactam antibiotic therapy already received at presentation to the emergency department."

(declare-const amoxicillin_course_duration_value_recorded_inthehistory_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days of the most recent course of amoxicillin taken by the patient prior to presenting to the emergency department.","when_to_set_to_null":"Set to null if the duration of the amoxicillin course is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in days of the most recent course of amoxicillin taken by the patient prior to presenting to the emergency department."} ;; "The patient is excluded if the patient has received at least a 5 day course of amoxicillin less than 72 hours prior to presenting to the emergency department."

(declare-const amoxicillin_time_since_last_course_value_recorded_at_presentation_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours since the patient completed the most recent course of amoxicillin prior to presenting to the emergency department.","when_to_set_to_null":"Set to null if the time since last amoxicillin course is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the time in hours since the patient completed the most recent course of amoxicillin prior to presenting to the emergency department."} ;; "The patient is excluded if the patient has received at least a 5 day course of amoxicillin less than 72 hours prior to presenting to the emergency department."

(declare-const patient_has_received_intravenous_cephalosporin_in_emergency_department_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received intravenous cephalosporin in the emergency department at presentation.","when_to_set_to_false":"Set to false if the patient has not received intravenous cephalosporin in the emergency department at presentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received intravenous cephalosporin in the emergency department at presentation.","meaning":"Boolean indicating whether the patient has received intravenous cephalosporin in the emergency department at presentation."} ;; "The patient is excluded if the patient has received intravenous cephalosporin in the emergency department."

(declare-const patient_has_received_intravenous_azithromycin_in_emergency_department_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received intravenous azithromycin in the emergency department at presentation.","when_to_set_to_false":"Set to false if the patient has not received intravenous azithromycin in the emergency department at presentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received intravenous azithromycin in the emergency department at presentation.","meaning":"Boolean indicating whether the patient has received intravenous azithromycin in the emergency department at presentation."} ;; "The patient is excluded if the patient has received intravenous azithromycin in the emergency department."

(declare-const patient_has_finding_of_allergy_to_penicillin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has suspected allergy to penicillin.","when_to_set_to_false":"Set to false if the patient currently does not have suspected allergy to penicillin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has suspected allergy to penicillin.","meaning":"Boolean indicating whether the patient currently has suspected allergy to penicillin."} ;; "The patient is excluded if the patient has suspected allergy to penicillin."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_cystic_fibrosis_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cystic fibrosis."

(assert
(! (not patient_has_finding_of_anatomic_lung_disease_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has anatomic lung disease."

(assert
(! (not patient_has_finding_of_bronchiectasis_now)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bronchiectasis."

(assert
(! (not patient_has_finding_of_congenital_heart_disease_now)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congenital heart disease."

(assert
(! (not patient_has_finding_of_history_of_repeated_aspiration_now)
:named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of repeated aspiration."

(assert
(! (not patient_has_finding_of_velopharyngeal_incompetence_now)
:named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of velopharyngeal incompetence."

(assert
(! (not patient_has_finding_of_malignant_neoplastic_disease_now)
:named REQ0_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignancy."

(assert
(! (not patient_has_finding_of_conditions_requiring_treatment_with_immune_suppressants_now)
:named REQ0_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has conditions requiring treatment with immune suppressants."

(assert
(! (not patient_has_finding_of_primary_immune_deficiency_disorder_now)
:named REQ0_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has primary immunodeficiency."

(assert
(! (not patient_has_finding_of_human_immunodeficiency_virus_infection_now)
:named REQ0_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has advanced human immunodeficiency virus infection."

(assert
(! (not (exists ((admission_duration Real) (admission_time_since Real))
        (and
            (= admission_duration hospital_admission_duration_value_recorded_inthehistory_withunit_hours)
            (= admission_time_since hospital_admission_time_since_value_recorded_inthehistory_withunit_months)
            (> admission_duration 48)
            (<= admission_time_since 2)
        )))
:named REQ0_COMPONENT10_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has prolonged admissions to hospital with duration > 48 hours within the past 2 months."

(assert
(! (not (<= pneumonia_time_since_diagnosis_value_recorded_inthehistory_withunit_months 1))
:named REQ0_COMPONENT11_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pneumonia previously diagnosed within the past 1 month."

(assert
(! (not (<= lung_abscess_time_since_diagnosis_value_recorded_inthehistory_withunit_months 6))
:named REQ0_COMPONENT12_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has lung abscess diagnosed within the past 6 months."

(assert
(! (not (> beta_lactam_antibiotic_therapy_duration_value_recorded_at_presentation_withunit_hours 24))
:named REQ0_COMPONENT13_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received > 24 hours of beta-lactam antibiotic therapy already received at presentation to the emergency department."

(assert
(! (not (and (>= amoxicillin_course_duration_value_recorded_inthehistory_withunit_days 5)
             (< amoxicillin_time_since_last_course_value_recorded_at_presentation_withunit_hours 72)))
:named REQ0_COMPONENT14_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received at least a 5 day course of amoxicillin less than 72 hours prior to presenting to the emergency department."

(assert
(! (not patient_has_received_intravenous_cephalosporin_in_emergency_department_now)
:named REQ0_COMPONENT15_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received intravenous cephalosporin in the emergency department."

(assert
(! (not patient_has_received_intravenous_azithromycin_in_emergency_department_now)
:named REQ0_COMPONENT16_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received intravenous azithromycin in the emergency department."

(assert
(! (not patient_has_finding_of_allergy_to_penicillin_now)
:named REQ0_COMPONENT17_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected allergy to penicillin."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_participated_in_this_study_before Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated in this specific study.","when_to_set_to_false":"Set to false if the patient has not previously participated in this specific study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated in this specific study.","meaning":"Boolean indicating whether the patient has previously participated in this specific study."} ;; "The patient is excluded if the patient has already participated in the study."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_participated_in_this_study_before)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has already participated in the study."
