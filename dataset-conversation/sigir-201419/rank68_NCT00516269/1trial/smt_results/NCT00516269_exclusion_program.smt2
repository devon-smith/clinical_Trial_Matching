;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_hypersensitivity_reaction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a hypersensitivity reaction at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a hypersensitivity reaction at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a hypersensitivity reaction.","meaning":"Boolean indicating whether the patient has ever had a hypersensitivity reaction in their medical history."} ;; "hypersensitivity reaction"
(declare-const patient_has_finding_of_hypersensitivity_reaction_inthehistory@@caused_by_methylphenidate Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypersensitivity reaction in their medical history was caused by methylphenidate.","when_to_set_to_false":"Set to false if the patient's hypersensitivity reaction in their medical history was not caused by methylphenidate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether methylphenidate caused the hypersensitivity reaction.","meaning":"Boolean indicating whether the patient's hypersensitivity reaction in their medical history was caused by methylphenidate."} ;; "hypersensitivity reaction to methylphenidate"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypersensitivity_reaction_inthehistory@@caused_by_methylphenidate
      patient_has_finding_of_hypersensitivity_reaction_inthehistory)
   :named REQ0_AUXILIARY0)) ;; "hypersensitivity reaction in their medical history was caused by methylphenidate" implies "hypersensitivity reaction in their medical history"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_hypersensitivity_reaction_inthehistory@@caused_by_methylphenidate)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity reaction to methylphenidate."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_seizure_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with seizure disorder in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with seizure disorder in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with seizure disorder.","meaning":"Boolean indicating whether the patient has a history of seizure disorder."} ;; "the patient has a history of seizure disorder"
(declare-const patient_has_diagnosis_of_seizure_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of seizure disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of seizure disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of seizure disorder.","meaning":"Boolean indicating whether the patient currently has seizure disorder."} ;; "the patient has current seizure disorder"
(declare-const patient_has_diagnosis_of_glaucoma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with glaucoma in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with glaucoma in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with glaucoma.","meaning":"Boolean indicating whether the patient has a history of glaucoma."} ;; "the patient has a history of glaucoma"
(declare-const patient_has_diagnosis_of_glaucoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of glaucoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of glaucoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of glaucoma.","meaning":"Boolean indicating whether the patient currently has glaucoma."} ;; "the patient has current glaucoma"
(declare-const patient_has_diagnosis_of_major_psychiatric_diagnosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a major psychiatric diagnosis in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a major psychiatric diagnosis in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a major psychiatric diagnosis.","meaning":"Boolean indicating whether the patient has a history of major psychiatric diagnosis."} ;; "the patient has a history of major psychiatric diagnosis"
(declare-const patient_has_diagnosis_of_major_psychiatric_diagnosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a major psychiatric diagnosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a major psychiatric diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a major psychiatric diagnosis.","meaning":"Boolean indicating whether the patient currently has a major psychiatric diagnosis."} ;; "the patient has current major psychiatric diagnosis"
(declare-const patient_has_diagnosis_of_narcolepsy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with narcolepsy in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with narcolepsy in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with narcolepsy.","meaning":"Boolean indicating whether the patient has a history of narcolepsy."} ;; "the patient has a history of narcolepsy"
(declare-const patient_has_diagnosis_of_narcolepsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of narcolepsy.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of narcolepsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of narcolepsy.","meaning":"Boolean indicating whether the patient currently has narcolepsy."} ;; "the patient has current narcolepsy"
(declare-const patient_has_diagnosis_of_gilles_de_la_tourette_s_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with Tourette's syndrome in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with Tourette's syndrome in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with Tourette's syndrome.","meaning":"Boolean indicating whether the patient has a history of Tourette's syndrome."} ;; "the patient has a history of Tourette's syndrome"
(declare-const patient_has_diagnosis_of_gilles_de_la_tourette_s_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Tourette's syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Tourette's syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Tourette's syndrome.","meaning":"Boolean indicating whether the patient currently has Tourette's syndrome."} ;; "the patient has current Tourette's syndrome"
(declare-const patient_has_finding_of_tension_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of tension in the past.","when_to_set_to_false":"Set to false if the patient has never had a finding of tension in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of tension.","meaning":"Boolean indicating whether the patient has a history of tension."} ;; "the patient has a history of tension"
(declare-const patient_has_finding_of_tension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of tension.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of tension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of tension.","meaning":"Boolean indicating whether the patient currently has tension."} ;; "the patient has current tension"
(declare-const patient_has_finding_of_feeling_agitated_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of agitation in the past.","when_to_set_to_false":"Set to false if the patient has never had a finding of agitation in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of agitation.","meaning":"Boolean indicating whether the patient has a history of agitation."} ;; "the patient has a history of agitation"
(declare-const patient_has_finding_of_feeling_agitated_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of agitation.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of agitation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of agitation.","meaning":"Boolean indicating whether the patient currently has agitation."} ;; "the patient has current agitation"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_seizure_disorder_inthehistory)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of seizure disorder."

(assert
(! (not patient_has_diagnosis_of_seizure_disorder_now)
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current seizure disorder."

(assert
(! (not patient_has_diagnosis_of_glaucoma_inthehistory)
    :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of glaucoma."

(assert
(! (not patient_has_diagnosis_of_glaucoma_now)
    :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current glaucoma."

(assert
(! (not patient_has_diagnosis_of_major_psychiatric_diagnosis_inthehistory)
    :named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of major psychiatric diagnosis."

(assert
(! (not patient_has_diagnosis_of_major_psychiatric_diagnosis_now)
    :named REQ1_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current major psychiatric diagnosis."

(assert
(! (not patient_has_diagnosis_of_narcolepsy_inthehistory)
    :named REQ1_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of narcolepsy."

(assert
(! (not patient_has_diagnosis_of_narcolepsy_now)
    :named REQ1_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current narcolepsy."

(assert
(! (not patient_has_diagnosis_of_gilles_de_la_tourette_s_syndrome_inthehistory)
    :named REQ1_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of Tourette's syndrome."

(assert
(! (not patient_has_diagnosis_of_gilles_de_la_tourette_s_syndrome_now)
    :named REQ1_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current Tourette's syndrome."

(assert
(! (not patient_has_finding_of_tension_inthehistory)
    :named REQ1_COMPONENT10_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of tension."

(assert
(! (not patient_has_finding_of_tension_now)
    :named REQ1_COMPONENT11_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current tension."

(assert
(! (not patient_has_finding_of_feeling_agitated_inthehistory)
    :named REQ1_COMPONENT12_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of agitation."

(assert
(! (not patient_has_finding_of_feeling_agitated_now)
    :named REQ1_COMPONENT13_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current agitation."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_heart_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with heart disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with heart disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with heart disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of heart disease in their history."} ;; "history of cardiac disease"
(declare-const patient_has_diagnosis_of_heart_disease_inthehistory@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of heart disease is considered clinically significant.","when_to_set_to_false":"Set to false if the patient's history of heart disease is not considered clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of heart disease is clinically significant.","meaning":"Boolean indicating whether the patient's history of heart disease is clinically significant."} ;; "history of clinically significant cardiac disease"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_heart_disease_inthehistory@@clinically_significant
      patient_has_diagnosis_of_heart_disease_inthehistory)
   :named REQ2_AUXILIARY0)) ;; "clinically significant" is a qualifier of "history of cardiac disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_heart_disease_inthehistory@@clinically_significant)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of clinically significant cardiac disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_poor_hypertension_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of uncontrolled (poorly controlled) hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of uncontrolled (poorly controlled) hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled hypertension.","meaning":"Boolean indicating whether the patient currently has uncontrolled (poorly controlled) hypertension."} ;; "uncontrolled hypertension"

(declare-const patient_has_been_on_stable_antihypertensive_treatment_dose_for_past_1_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been on a stable dose of antihypertensive treatment for the past one month.","when_to_set_to_false":"Set to false if the patient has not been on a stable dose of antihypertensive treatment for the past one month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been on a stable dose of antihypertensive treatment for the past one month.","meaning":"Boolean indicating whether the patient has been on a stable dose of antihypertensive treatment for the past one month."} ;; "NOT having been on a stable treatment dose for the past one month"

(declare-const patient_systolic_blood_pressure_readings_count_above_150_mm_hg_in_past_30_days Real) ;; {"when_to_set_to_value":"Set to the count of systolic blood pressure readings above 150 mm Hg recorded within the past 30 days.","when_to_set_to_null":"Set to null if no such measurements are available or the value is indeterminate.","meaning":"Numeric value representing the count of systolic blood pressure readings above 150 mm Hg in the past 30 days."} ;; "systolic blood pressure readings above 150 mm Hg in past 30 days"

(declare-const patient_systolic_blood_pressure_value_recorded_inthepast30days_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value(s) if systolic blood pressure readings in millimeters of mercury are recorded within the past 30 days.","when_to_set_to_null":"Set to null if no such measurements are available or the value is indeterminate.","meaning":"Numeric value(s) representing the patient's systolic blood pressure measurements within the past 30 days, in millimeters of mercury."} ;; "systolic blood pressure in past 30 days"

(declare-const patient_diastolic_blood_pressure_readings_count_above_85_mm_hg_in_past_30_days Real) ;; {"when_to_set_to_value":"Set to the count of diastolic blood pressure readings above 85 mm Hg recorded within the past 30 days.","when_to_set_to_null":"Set to null if no such measurements are available or the value is indeterminate.","meaning":"Numeric value representing the count of diastolic blood pressure readings above 85 mm Hg in the past 30 days."} ;; "diastolic blood pressure readings above 85 mm Hg in past 30 days"

(declare-const patient_diastolic_blood_pressure_value_recorded_inthepast30days_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value(s) if diastolic blood pressure readings in millimeters of mercury are recorded within the past 30 days.","when_to_set_to_null":"Set to null if no such measurements are available or the value is indeterminate.","meaning":"Numeric value(s) representing the patient's diastolic blood pressure measurements within the past 30 days, in millimeters of mercury."} ;; "diastolic blood pressure in past 30 days"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: uncontrolled hypertension = NOT having been on a stable treatment dose for the past one month
(assert
(! (= patient_has_finding_of_poor_hypertension_control_now
    (not patient_has_been_on_stable_antihypertensive_treatment_dose_for_past_1_month))
:named REQ3_AUXILIARY0)) ;; "uncontrolled hypertension, defined as NOT having been on a stable treatment dose for the past one month"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient has uncontrolled hypertension (per definition)
(assert
(! (not patient_has_finding_of_poor_hypertension_control_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled hypertension, defined as NOT having been on a stable treatment dose for the past one month."

;; Exclusion: patient has systolic blood pressure consistently > 150 mm Hg (three consecutive readings in past 30 days)
(assert
(! (not (>= patient_systolic_blood_pressure_readings_count_above_150_mm_hg_in_past_30_days 3))
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has systolic blood pressure consistently (defined as three consecutive blood pressure readings within the last thirty days) greater than one hundred fifty millimeters of mercury."

;; Exclusion: patient has diastolic blood pressure consistently > 85 mm Hg (three consecutive readings in past 30 days)
(assert
(! (not (>= patient_diastolic_blood_pressure_readings_count_above_85_mm_hg_in_past_30_days 3))
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diastolic blood pressure consistently (defined as three consecutive blood pressure readings within the last thirty days) greater than eighty-five millimeters of mercury."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_fibromyalgia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with fibromyalgia at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with fibromyalgia at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with fibromyalgia.","meaning":"Boolean indicating whether the patient has ever been diagnosed with fibromyalgia in their medical history."} ;; "fibromyalgia"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_diagnosis_of_fibromyalgia_inthehistory)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of fibromyalgia."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_exposed_to_alcohol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to alcohol.","when_to_set_to_false":"Set to false if the patient is currently not exposed to alcohol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to alcohol.","meaning":"Boolean indicating whether the patient is currently exposed to alcohol."} ;; "alcohol"
(declare-const patient_is_exposed_to_alcohol_now@@during_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to alcohol and this exposure occurs during participation in the study.","when_to_set_to_false":"Set to false if the patient is currently exposed to alcohol but not during study participation, or not exposed at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current alcohol exposure occurs during study participation.","meaning":"Boolean indicating whether the patient's current alcohol exposure occurs during study participation."} ;; "uses alcohol while participating in the study"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_is_exposed_to_alcohol_now@@during_study_participation
      patient_is_exposed_to_alcohol_now)
   :named REQ5_AUXILIARY0)) ;; "uses alcohol while participating in the study"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_exposed_to_alcohol_now@@during_study_participation)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses alcohol while participating in the study."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_currently_uses_illicit_drugs Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using illicit drugs.","when_to_set_to_false":"Set to false if the patient is currently not using illicit drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using illicit drugs.","meaning":"Boolean indicating whether the patient is currently using illicit drugs."} ;; "the patient currently uses illicit drugs"
(declare-const patient_has_finding_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of alcohol abuse documented at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of alcohol abuse documented at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of alcohol abuse.","meaning":"Boolean indicating whether the patient has ever had alcohol abuse in their history."} ;; "the patient has a history of alcohol abuse"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding relating to drug misuse behavior (drug abuse) documented at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding relating to drug misuse behavior (drug abuse) documented at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding relating to drug misuse behavior (drug abuse).","meaning":"Boolean indicating whether the patient has ever had drug abuse in their history."} ;; "the patient has a history of drug abuse"
(declare-const patient_has_finding_of_abuse_potential_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of abuse potential documented at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of abuse potential documented at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of abuse potential.","meaning":"Boolean indicating whether the patient has ever had abuse potential in their history."} ;; "the patient has a history of abuse potential"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (or patient_currently_uses_illicit_drugs
            patient_has_finding_of_alcohol_abuse_inthehistory
            patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory
            patient_has_finding_of_abuse_potential_inthehistory))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient currently uses illicit drugs) OR (the patient has a history of alcohol abuse) OR (the patient has a history of drug abuse) OR (the patient has a history of abuse potential)."

;; --- verifier-bypassed (attempt 8/8) 2025-10-26T04:34:57.378042 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const beck_depression_index_ii_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's Beck Depression Index II score recorded at the current time, in points.","when_to_set_to_null":"Set to null if the Beck Depression Index II score is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the patient's Beck Depression Index II score, recorded at the current time, in points."} ;; "Beck Depression Index II score, recorded at the current time, in points"

(declare-const patient_has_finding_of_moderate_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of moderate depression.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of moderate depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has moderate depression.","meaning":"Boolean indicating whether the patient currently has moderate depression."} ;; "moderate depression"

(declare-const patient_has_finding_of_severe_depression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe depression.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe depression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe depression.","meaning":"Boolean indicating whether the patient currently has severe depression."} ;; "severe depression"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Definition: moderate depression = Beck Depression Index II score >= 20
(assert
(! (= patient_has_finding_of_moderate_depression_now
    (>= beck_depression_index_ii_score_value_recorded_now_withunit_points 20))
:named REQ7_AUXILIARY0)) ;; "moderate depression, defined as a score greater than or equal to twenty on the Beck Depression Index II"

;; Definition: severe depression = Beck Depression Index II score >= 20
(assert
(! (= patient_has_finding_of_severe_depression_now
    (>= beck_depression_index_ii_score_value_recorded_now_withunit_points 20))
:named REQ7_AUXILIARY1)) ;; "severe depression, defined as a score greater than or equal to twenty on the Beck Depression Index II"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have moderate depression
(assert
(! (not patient_has_finding_of_moderate_depression_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has moderate depression, defined as a score greater than or equal to twenty on the Beck Depression Index II."

;; Exclusion: patient must NOT have severe depression
(assert
(! (not patient_has_finding_of_severe_depression_now)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe depression, defined as a score greater than or equal to twenty on the Beck Depression Index II."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_taking_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking antidepressant medication.","when_to_set_to_false":"Set to false if the patient is currently not taking antidepressant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking antidepressant medication.","meaning":"Boolean indicating whether the patient is currently taking antidepressant medication."} ;; "the patient is taking antidepressant medication"
(declare-const patient_has_had_change_in_antidepressant_dose_in_the_past_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had any change in the dose of antidepressant medication in the past thirty days.","when_to_set_to_false":"Set to false if the patient has not had any change in the dose of antidepressant medication in the past thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had any change in the dose of antidepressant medication in the past thirty days.","meaning":"Boolean indicating whether the patient has had any change in the dose of antidepressant medication in the past thirty days."} ;; "the patient has had changes in dose in the last thirty days"
(declare-const patient_has_undergone_antidepressant_therapy_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has started a new course of antidepressant therapy in the past thirty days.","when_to_set_to_false":"Set to false if the patient has not started a new course of antidepressant therapy in the past thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has started a new course of antidepressant therapy in the past thirty days.","meaning":"Boolean indicating whether the patient has started a new course of antidepressant therapy in the past thirty days."} ;; "the patient has started a new course of antidepressant treatment in the last thirty days"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not (and patient_is_taking_antidepressant_now
               (or patient_has_had_change_in_antidepressant_dose_in_the_past_30_days
                   patient_has_undergone_antidepressant_therapy_inthepast30days)))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is taking antidepressant medication) AND ((the patient has had changes in dose in the last thirty days) OR (the patient has started a new course of antidepressant treatment in the last thirty days))."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_taking_psychostimulant_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking psychostimulant medication.","when_to_set_to_false":"Set to false if the patient is currently not taking psychostimulant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking psychostimulant medication.","meaning":"Boolean indicating whether the patient is currently taking psychostimulant medication."} ;; "the patient is currently taking psychostimulant medication"
(declare-const patient_is_taking_appetite_suppressant_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking appetite suppressant medication.","when_to_set_to_false":"Set to false if the patient is currently not taking appetite suppressant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking appetite suppressant medication.","meaning":"Boolean indicating whether the patient is currently taking appetite suppressant medication."} ;; "including appetite suppressant medication"
(declare-const patient_is_taking_monoamine_oxidase_inhibitor_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a monoamine oxidase inhibitor containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a monoamine oxidase inhibitor containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a monoamine oxidase inhibitor containing product.","meaning":"Boolean indicating whether the patient is currently taking a monoamine oxidase inhibitor containing product."} ;; "the patient is currently taking monoamine oxidase inhibitor medication"
(declare-const patient_is_undergoing_anticoagulant_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing anticoagulant therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing anticoagulant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing anticoagulant therapy.","meaning":"Boolean indicating whether the patient is currently undergoing anticoagulant therapy."} ;; "the patient is currently taking anticoagulant therapy"
(declare-const patient_is_undergoing_anticonvulsant_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing anticonvulsant therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing anticonvulsant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing anticonvulsant therapy.","meaning":"Boolean indicating whether the patient is currently undergoing anticonvulsant therapy."} ;; "the patient is currently taking anticonvulsant therapy"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_taking_psychostimulant_medication_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently taking psychostimulant medication (including appetite suppressant medication)."

(assert
(! (not patient_is_taking_appetite_suppressant_medication_now)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "including appetite suppressant medication"

(assert
(! (not patient_is_taking_monoamine_oxidase_inhibitor_containing_product_now)
:named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently taking monoamine oxidase inhibitor medication."

(assert
(! (not patient_is_undergoing_anticoagulant_therapy_now)
:named REQ9_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently taking anticoagulant therapy."

(assert
(! (not patient_is_undergoing_anticonvulsant_therapy_now)
:named REQ9_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently taking anticonvulsant therapy."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a corticosteroid or corticosteroid-derivative containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a corticosteroid or corticosteroid-derivative containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a corticosteroid or corticosteroid-derivative containing product.","meaning":"Boolean indicating whether the patient is currently taking a corticosteroid or corticosteroid-derivative containing product."} ;; "the patient is currently using corticosteroid medication"
(declare-const patient_is_taking_other_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any other medication, excluding corticosteroids and psychostimulants.","when_to_set_to_false":"Set to false if the patient is currently not taking any other medication, excluding corticosteroids and psychostimulants.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any other medication, excluding corticosteroids and psychostimulants.","meaning":"Boolean indicating whether the patient is currently taking any other medication (excluding corticosteroids and psychostimulants)."} ;; "the patient is currently using other medication"
(declare-const patient_is_taking_stimulant_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking stimulant medication (e.g., vivarin).","when_to_set_to_false":"Set to false if the patient is currently not taking stimulant medication (e.g., vivarin).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking stimulant medication (e.g., vivarin).","meaning":"Boolean indicating whether the patient is currently taking stimulant medication (e.g., vivarin)."} ;; "the patient is currently using stimulant medication (e.g., vivarin)"
(declare-const patient_is_taking_stimulant_medication_now@@used_to_improve_fatigue_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current stimulant medication (e.g., vivarin) is used to improve fatigue symptoms.","when_to_set_to_false":"Set to false if the patient's current stimulant medication (e.g., vivarin) is not used to improve fatigue symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current stimulant medication (e.g., vivarin) is used to improve fatigue symptoms.","meaning":"Boolean indicating whether the patient's current stimulant medication (e.g., vivarin) is used to improve fatigue symptoms."} ;; "the patient is currently using stimulant medication (e.g., vivarin) used to improve fatigue symptoms"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_taking_stimulant_medication_now@@used_to_improve_fatigue_symptoms
      patient_is_taking_stimulant_medication_now)
    :named REQ10_AUXILIARY0)) ;; "stimulant medication (e.g., vivarin) used to improve fatigue symptoms"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently using corticosteroid medication."

(assert
(! (not patient_is_taking_other_medication_now)
    :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently using other medication."

(assert
(! (not patient_is_taking_stimulant_medication_now@@used_to_improve_fatigue_symptoms)
    :named REQ10_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently using stimulant medication (e.g., vivarin) used to improve fatigue symptoms."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past one month.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past one month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past one month.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past one month."} ;; "medication"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast1months@@investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient was exposed within the past one month is investigational.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient was exposed within the past one month is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament to which the patient was exposed within the past one month is investigational.","meaning":"Boolean indicating whether the drug or medicament to which the patient was exposed within the past one month is investigational."} ;; "investigational medication within the past one month"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast1months@@investigational
      patient_is_exposed_to_drug_or_medicament_inthepast1months)
:named REQ11_AUXILIARY0)) ;; "investigational medication within the past one month"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_inthepast1months@@investigational)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used an investigational medication within the past one month."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_taking_herbal_medicine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any herbal medicine.","when_to_set_to_false":"Set to false if the patient is currently not taking any herbal medicine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any herbal medicine.","meaning":"Boolean indicating whether the patient is currently taking any herbal medicine."} ;; "herbal medications"
(declare-const patient_is_taking_herbal_medicine_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any herbal medicine and the medicine is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently taking any herbal medicine but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the herbal medicine is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently taking any herbal medicine for fatigue relief."} ;; "herbal medications for fatigue relief"
(declare-const patient_is_exposed_to_dehydroepiandrosterone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to dehydroepiandrosterone.","when_to_set_to_false":"Set to false if the patient is currently not exposed to dehydroepiandrosterone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to dehydroepiandrosterone.","meaning":"Boolean indicating whether the patient is currently exposed to dehydroepiandrosterone."} ;; "dehydroepiandrosterone"
(declare-const patient_is_exposed_to_dehydroepiandrosterone_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to dehydroepiandrosterone and it is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently exposed to dehydroepiandrosterone but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether dehydroepiandrosterone is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently exposed to dehydroepiandrosterone for fatigue relief."} ;; "dehydroepiandrosterone for fatigue relief"
(declare-const patient_is_exposed_to_ademetionine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to ademetionine.","when_to_set_to_false":"Set to false if the patient is currently not exposed to ademetionine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to ademetionine.","meaning":"Boolean indicating whether the patient is currently exposed to ademetionine."} ;; "S-adenosyl methionine"
(declare-const patient_is_exposed_to_ginkgo_biloba_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to ginkgo biloba.","when_to_set_to_false":"Set to false if the patient is currently not exposed to ginkgo biloba.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to ginkgo biloba.","meaning":"Boolean indicating whether the patient is currently exposed to ginkgo biloba."} ;; "ginkgo"
(declare-const patient_is_exposed_to_ginseng_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to ginseng.","when_to_set_to_false":"Set to false if the patient is currently not exposed to ginseng.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to ginseng.","meaning":"Boolean indicating whether the patient is currently exposed to ginseng."} ;; "ginseng"
(declare-const patient_is_exposed_to_ginseng_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to ginseng and it is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently exposed to ginseng but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether ginseng is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently exposed to ginseng for fatigue relief."} ;; "ginseng for fatigue relief"
(declare-const patient_is_exposed_to_st_johns_wort_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to St. John's Wort.","when_to_set_to_false":"Set to false if the patient is currently not exposed to St. John's Wort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to St. John's Wort.","meaning":"Boolean indicating whether the patient is currently exposed to St. John's Wort."} ;; "St. John's Wort"
(declare-const patient_is_exposed_to_st_johns_wort_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to St. John's Wort and it is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently exposed to St. John's Wort but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether St. John's Wort is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently exposed to St. John's Wort for fatigue relief."} ;; "St. John's Wort for fatigue relief"
(declare-const patient_is_exposed_to_metabolite_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any metabolite.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any metabolite.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any metabolite.","meaning":"Boolean indicating whether the patient is currently exposed to any metabolite."} ;; "metabolite"
(declare-const patient_is_exposed_to_ephedrine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to ephedrine.","when_to_set_to_false":"Set to false if the patient is currently not exposed to ephedrine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to ephedrine.","meaning":"Boolean indicating whether the patient is currently exposed to ephedrine."} ;; "ephedrine"
(declare-const patient_is_exposed_to_basil_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to basil.","when_to_set_to_false":"Set to false if the patient is currently not exposed to basil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to basil.","meaning":"Boolean indicating whether the patient is currently exposed to basil."} ;; "basil"
(declare-const patient_is_exposed_to_citronella_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to citronella.","when_to_set_to_false":"Set to false if the patient is currently not exposed to citronella.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to citronella.","meaning":"Boolean indicating whether the patient is currently exposed to citronella."} ;; "citronella"
(declare-const patient_is_exposed_to_citronella_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to citronella and it is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently exposed to citronella but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether citronella is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently exposed to citronella for fatigue relief."} ;; "citronella for fatigue relief"
(declare-const patient_is_exposed_to_fennel_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to fennel.","when_to_set_to_false":"Set to false if the patient is currently not exposed to fennel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to fennel.","meaning":"Boolean indicating whether the patient is currently exposed to fennel."} ;; "fennel"
(declare-const patient_is_exposed_to_horseradish_root_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to horseradish root.","when_to_set_to_false":"Set to false if the patient is currently not exposed to horseradish root.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to horseradish root.","meaning":"Boolean indicating whether the patient is currently exposed to horseradish root."} ;; "horseradish root"
(declare-const patient_is_exposed_to_horseradish_root_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to horseradish root and it is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently exposed to horseradish root but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether horseradish root is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently exposed to horseradish root for fatigue relief."} ;; "horseradish root for fatigue relief"
(declare-const patient_is_exposed_to_lavender_flower_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to lavender flower.","when_to_set_to_false":"Set to false if the patient is currently not exposed to lavender flower.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to lavender flower.","meaning":"Boolean indicating whether the patient is currently exposed to lavender flower."} ;; "lavender flower"
(declare-const patient_is_exposed_to_lavender_flower_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to lavender flower and it is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently exposed to lavender flower but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether lavender flower is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently exposed to lavender flower for fatigue relief."} ;; "lavender flower for fatigue relief"
(declare-const patient_is_exposed_to_lemon_verbena_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to lemon verbena.","when_to_set_to_false":"Set to false if the patient is currently not exposed to lemon verbena.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to lemon verbena.","meaning":"Boolean indicating whether the patient is currently exposed to lemon verbena."} ;; "lemon verbena"
(declare-const patient_is_exposed_to_lemon_verbena_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to lemon verbena and it is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently exposed to lemon verbena but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether lemon verbena is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently exposed to lemon verbena for fatigue relief."} ;; "lemon verbena for fatigue relief"
(declare-const patient_is_exposed_to_marjoram_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to marjoram.","when_to_set_to_false":"Set to false if the patient is currently not exposed to marjoram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to marjoram.","meaning":"Boolean indicating whether the patient is currently exposed to marjoram."} ;; "marjoram"
(declare-const patient_is_exposed_to_mint_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to mint.","when_to_set_to_false":"Set to false if the patient is currently not exposed to mint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to mint.","meaning":"Boolean indicating whether the patient is currently exposed to mint."} ;; "mint"
(declare-const patient_is_exposed_to_nettle_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to nettle.","when_to_set_to_false":"Set to false if the patient is currently not exposed to nettle.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to nettle.","meaning":"Boolean indicating whether the patient is currently exposed to nettle."} ;; "nettle"
(declare-const patient_is_exposed_to_nettle_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to nettle and it is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently exposed to nettle but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether nettle is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently exposed to nettle for fatigue relief."} ;; "nettle for fatigue relief"
(declare-const patient_is_exposed_to_pine_needle_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to pine needle.","when_to_set_to_false":"Set to false if the patient is currently not exposed to pine needle.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to pine needle.","meaning":"Boolean indicating whether the patient is currently exposed to pine needle."} ;; "pine needle"
(declare-const patient_is_exposed_to_pine_needle_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to pine needle and it is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently exposed to pine needle but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether pine needle is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently exposed to pine needle for fatigue relief."} ;; "pine needle for fatigue relief"
(declare-const patient_is_exposed_to_rosemary_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to rosemary.","when_to_set_to_false":"Set to false if the patient is currently not exposed to rosemary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to rosemary.","meaning":"Boolean indicating whether the patient is currently exposed to rosemary."} ;; "rosemary"
(declare-const patient_is_exposed_to_sage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to sage.","when_to_set_to_false":"Set to false if the patient is currently not exposed to sage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to sage.","meaning":"Boolean indicating whether the patient is currently exposed to sage."} ;; "sage"
(declare-const patient_is_exposed_to_savory_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to savory.","when_to_set_to_false":"Set to false if the patient is currently not exposed to savory.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to savory.","meaning":"Boolean indicating whether the patient is currently exposed to savory."} ;; "savory"
(declare-const patient_is_exposed_to_savory_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to savory and it is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently exposed to savory but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether savory is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently exposed to savory for fatigue relief."} ;; "savory for fatigue relief"
(declare-const patient_is_exposed_to_thyme_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to thyme.","when_to_set_to_false":"Set to false if the patient is currently not exposed to thyme.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to thyme.","meaning":"Boolean indicating whether the patient is currently exposed to thyme."} ;; "thyme"
(declare-const patient_is_exposed_to_bay_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to bay.","when_to_set_to_false":"Set to false if the patient is currently not exposed to bay.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to bay.","meaning":"Boolean indicating whether the patient is currently exposed to bay."} ;; "bay"
(declare-const patient_is_exposed_to_bay_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to bay and it is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently exposed to bay but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether bay is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently exposed to bay for fatigue relief."} ;; "bay for fatigue relief"
(declare-const patient_is_exposed_to_cayenne_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to cayenne.","when_to_set_to_false":"Set to false if the patient is currently not exposed to cayenne.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to cayenne.","meaning":"Boolean indicating whether the patient is currently exposed to cayenne."} ;; "cayenne pepper"
(declare-const patient_is_exposed_to_cinnamon_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to cinnamon.","when_to_set_to_false":"Set to false if the patient is currently not exposed to cinnamon.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to cinnamon.","meaning":"Boolean indicating whether the patient is currently exposed to cinnamon."} ;; "cinnamon"
(declare-const patient_is_exposed_to_eucalyptus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to eucalyptus.","when_to_set_to_false":"Set to false if the patient is currently not exposed to eucalyptus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to eucalyptus.","meaning":"Boolean indicating whether the patient is currently exposed to eucalyptus."} ;; "eucalyptus"
(declare-const patient_is_exposed_to_eucalyptus_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to eucalyptus and it is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently exposed to eucalyptus but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether eucalyptus is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently exposed to eucalyptus for fatigue relief."} ;; "eucalyptus for fatigue relief"
(declare-const patient_is_exposed_to_hyssop_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to hyssop.","when_to_set_to_false":"Set to false if the patient is currently not exposed to hyssop.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to hyssop.","meaning":"Boolean indicating whether the patient is currently exposed to hyssop."} ;; "hyssop"
(declare-const patient_is_exposed_to_hyssop_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to hyssop and it is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently exposed to hyssop but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether hyssop is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently exposed to hyssop for fatigue relief."} ;; "hyssop for fatigue relief"
(declare-const patient_is_exposed_to_myrrh_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to myrrh.","when_to_set_to_false":"Set to false if the patient is currently not exposed to myrrh.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to myrrh.","meaning":"Boolean indicating whether the patient is currently exposed to myrrh."} ;; "myrrh"
(declare-const patient_is_exposed_to_oregano_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to oregano.","when_to_set_to_false":"Set to false if the patient is currently not exposed to oregano.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to oregano.","meaning":"Boolean indicating whether the patient is currently exposed to oregano."} ;; "oregano"
(declare-const patient_is_exposed_to_peppermint_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to peppermint.","when_to_set_to_false":"Set to false if the patient is currently not exposed to peppermint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to peppermint.","meaning":"Boolean indicating whether the patient is currently exposed to peppermint."} ;; "peppermint"
(declare-const patient_is_exposed_to_green_tea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to green tea.","when_to_set_to_false":"Set to false if the patient is currently not exposed to green tea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to green tea.","meaning":"Boolean indicating whether the patient is currently exposed to green tea."} ;; "green tea"
(declare-const patient_is_exposed_to_black_tea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to black tea.","when_to_set_to_false":"Set to false if the patient is currently not exposed to black tea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to black tea.","meaning":"Boolean indicating whether the patient is currently exposed to black tea."} ;; "black tea"
(declare-const patient_is_exposed_to_black_tea_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to black tea and it is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently exposed to black tea but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether black tea is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently exposed to black tea for fatigue relief."} ;; "black tea for fatigue relief"
(declare-const patient_is_exposed_to_chinese_tea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to Chinese tea.","when_to_set_to_false":"Set to false if the patient is currently not exposed to Chinese tea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to Chinese tea.","meaning":"Boolean indicating whether the patient is currently exposed to Chinese tea."} ;; "Chinese tea"
(declare-const patient_is_exposed_to_chinese_tea_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to Chinese tea and it is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently exposed to Chinese tea but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether Chinese tea is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently exposed to Chinese tea for fatigue relief."} ;; "Chinese tea for fatigue relief"
(declare-const patient_is_exposed_to_ephedra_sinica_extract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to ephedra sinica extract.","when_to_set_to_false":"Set to false if the patient is currently not exposed to ephedra sinica extract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to ephedra sinica extract.","meaning":"Boolean indicating whether the patient is currently exposed to ephedra sinica extract."} ;; "ephedra (ma-huang)"
(declare-const patient_is_exposed_to_ephedra_sinica_extract_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to ephedra sinica extract and it is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently exposed to ephedra sinica extract but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether ephedra sinica extract is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently exposed to ephedra sinica extract for fatigue relief."} ;; "ephedra (ma-huang) for fatigue relief"
(declare-const patient_is_exposed_to_popotillo_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to popotillo.","when_to_set_to_false":"Set to false if the patient is currently not exposed to popotillo.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to popotillo.","meaning":"Boolean indicating whether the patient is currently exposed to popotillo."} ;; "popotillo"
(declare-const patient_is_exposed_to_popotillo_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to popotillo and it is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently exposed to popotillo but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether popotillo is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently exposed to popotillo for fatigue relief."} ;; "popotillo for fatigue relief"
(declare-const patient_is_exposed_to_mormon_tea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to Mormon tea.","when_to_set_to_false":"Set to false if the patient is currently not exposed to Mormon tea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to Mormon tea.","meaning":"Boolean indicating whether the patient is currently exposed to Mormon tea."} ;; "Mormon tea"
(declare-const patient_is_exposed_to_mormon_tea_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to Mormon tea and it is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently exposed to Mormon tea but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether Mormon tea is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently exposed to Mormon tea for fatigue relief."} ;; "Mormon tea for fatigue relief"
(declare-const patient_is_exposed_to_nutritional_supplement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any nutritional supplement.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any nutritional supplement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any nutritional supplement.","meaning":"Boolean indicating whether the patient is currently exposed to any nutritional supplement."} ;; "supplements"
(declare-const patient_is_exposed_to_nutritional_supplement_now@@used_for_fatigue_relief Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any nutritional supplement and the supplement is used for fatigue relief.","when_to_set_to_false":"Set to false if the patient is currently exposed to any nutritional supplement but not for fatigue relief.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the nutritional supplement is used for fatigue relief.","meaning":"Boolean indicating whether the patient is currently exposed to any nutritional supplement for fatigue relief."} ;; "supplements for fatigue relief"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Exhaustive subcategories define the umbrella exactly:
(assert
(! (= patient_is_taking_herbal_medicine_now
(or patient_is_exposed_to_dehydroepiandrosterone_now
    patient_is_exposed_to_ademetionine_now
    patient_is_exposed_to_ginkgo_biloba_now
    patient_is_exposed_to_ginseng_now
    patient_is_exposed_to_st_johns_wort_now
    patient_is_exposed_to_metabolite_now
    patient_is_exposed_to_ephedrine_now
    patient_is_exposed_to_basil_now
    patient_is_exposed_to_citronella_now
    patient_is_exposed_to_fennel_now
    patient_is_exposed_to_horseradish_root_now
    patient_is_exposed_to_lavender_flower_now
    patient_is_exposed_to_lemon_verbena_now
    patient_is_exposed_to_marjoram_now
    patient_is_exposed_to_mint_now
    patient_is_exposed_to_nettle_now
    patient_is_exposed_to_pine_needle_now
    patient_is_exposed_to_rosemary_now
    patient_is_exposed_to_sage_now
    patient_is_exposed_to_savory_now
    patient_is_exposed_to_thyme_now
    patient_is_exposed_to_bay_now
    patient_is_exposed_to_cayenne_now
    patient_is_exposed_to_cinnamon_now
    patient_is_exposed_to_eucalyptus_now
    patient_is_exposed_to_hyssop_now
    patient_is_exposed_to_myrrh_now
    patient_is_exposed_to_oregano_now
    patient_is_exposed_to_peppermint_now
    patient_is_exposed_to_green_tea_now
    patient_is_exposed_to_black_tea_now
    patient_is_exposed_to_chinese_tea_now
    patient_is_exposed_to_ephedra_sinica_extract_now
    patient_is_exposed_to_popotillo_now
    patient_is_exposed_to_mormon_tea_now
    patient_is_exposed_to_nutritional_supplement_now))
:named REQ12_AUXILIARY0)) ;; "with exhaustive subcategories (dehydroepiandrosterone, S-adenosyl methionine, ... Mormon tea, supplements)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_taking_herbal_medicine_now@@used_for_fatigue_relief
      patient_is_taking_herbal_medicine_now)
:named REQ12_AUXILIARY1)) ;; "herbal medications for fatigue relief"

(assert
(! (=> patient_is_exposed_to_dehydroepiandrosterone_now@@used_for_fatigue_relief
      patient_is_exposed_to_dehydroepiandrosterone_now)
:named REQ12_AUXILIARY2)) ;; "dehydroepiandrosterone for fatigue relief"

(assert
(! (=> patient_is_exposed_to_ginseng_now@@used_for_fatigue_relief
      patient_is_exposed_to_ginseng_now)
:named REQ12_AUXILIARY3)) ;; "ginseng for fatigue relief"

(assert
(! (=> patient_is_exposed_to_st_johns_wort_now@@used_for_fatigue_relief
      patient_is_exposed_to_st_johns_wort_now)
:named REQ12_AUXILIARY4)) ;; "St. John's Wort for fatigue relief"

(assert
(! (=> patient_is_exposed_to_citronella_now@@used_for_fatigue_relief
      patient_is_exposed_to_citronella_now)
:named REQ12_AUXILIARY5)) ;; "citronella for fatigue relief"

(assert
(! (=> patient_is_exposed_to_horseradish_root_now@@used_for_fatigue_relief
      patient_is_exposed_to_horseradish_root_now)
:named REQ12_AUXILIARY6)) ;; "horseradish root for fatigue relief"

(assert
(! (=> patient_is_exposed_to_lavender_flower_now@@used_for_fatigue_relief
      patient_is_exposed_to_lavender_flower_now)
:named REQ12_AUXILIARY7)) ;; "lavender flower for fatigue relief"

(assert
(! (=> patient_is_exposed_to_lemon_verbena_now@@used_for_fatigue_relief
      patient_is_exposed_to_lemon_verbena_now)
:named REQ12_AUXILIARY8)) ;; "lemon verbena for fatigue relief"

(assert
(! (=> patient_is_exposed_to_nettle_now@@used_for_fatigue_relief
      patient_is_exposed_to_nettle_now)
:named REQ12_AUXILIARY9)) ;; "nettle for fatigue relief"

(assert
(! (=> patient_is_exposed_to_pine_needle_now@@used_for_fatigue_relief
      patient_is_exposed_to_pine_needle_now)
:named REQ12_AUXILIARY10)) ;; "pine needle for fatigue relief"

(assert
(! (=> patient_is_exposed_to_savory_now@@used_for_fatigue_relief
      patient_is_exposed_to_savory_now)
:named REQ12_AUXILIARY11)) ;; "savory for fatigue relief"

(assert
(! (=> patient_is_exposed_to_bay_now@@used_for_fatigue_relief
      patient_is_exposed_to_bay_now)
:named REQ12_AUXILIARY12)) ;; "bay for fatigue relief"

(assert
(! (=> patient_is_exposed_to_eucalyptus_now@@used_for_fatigue_relief
      patient_is_exposed_to_eucalyptus_now)
:named REQ12_AUXILIARY13)) ;; "eucalyptus for fatigue relief"

(assert
(! (=> patient_is_exposed_to_hyssop_now@@used_for_fatigue_relief
      patient_is_exposed_to_hyssop_now)
:named REQ12_AUXILIARY14)) ;; "hyssop for fatigue relief"

(assert
(! (=> patient_is_exposed_to_chinese_tea_now@@used_for_fatigue_relief
      patient_is_exposed_to_chinese_tea_now)
:named REQ12_AUXILIARY15)) ;; "Chinese tea for fatigue relief"

(assert
(! (=> patient_is_exposed_to_ephedra_sinica_extract_now@@used_for_fatigue_relief
      patient_is_exposed_to_ephedra_sinica_extract_now)
:named REQ12_AUXILIARY16)) ;; "ephedra (ma-huang) for fatigue relief"

(assert
(! (=> patient_is_exposed_to_popotillo_now@@used_for_fatigue_relief
      patient_is_exposed_to_popotillo_now)
:named REQ12_AUXILIARY17)) ;; "popotillo for fatigue relief"

(assert
(! (=> patient_is_exposed_to_mormon_tea_now@@used_for_fatigue_relief
      patient_is_exposed_to_mormon_tea_now)
:named REQ12_AUXILIARY18)) ;; "Mormon tea for fatigue relief"

(assert
(! (=> patient_is_exposed_to_nutritional_supplement_now@@used_for_fatigue_relief
      patient_is_exposed_to_nutritional_supplement_now)
:named REQ12_AUXILIARY19)) ;; "supplements for fatigue relief"

(assert
(! (=> patient_is_exposed_to_black_tea_now@@used_for_fatigue_relief
      patient_is_exposed_to_black_tea_now)
:named REQ12_AUXILIARY20)) ;; "black tea for fatigue relief"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_is_taking_herbal_medicine_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently using at least one of the following herbal medications or supplements for fatigue relief with exhaustive subcategories (dehydroepiandrosterone, S-adenosyl methionine, ... Mormon tea, supplements)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_diagnosis_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any disease, condition, or clinical finding."} ;; "medical condition"
(declare-const patient_has_diagnosis_of_disease_condition_finding_now@@likely_to_interfere_with_safe_administration_of_methylphenidate Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any disease, condition, or clinical finding that is likely to interfere with the safe administration of methylphenidate.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of any disease, condition, or clinical finding, but it is not likely to interfere with the safe administration of methylphenidate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the condition is likely to interfere with the safe administration of methylphenidate.","meaning":"Boolean indicating whether the patient's current disease/condition is likely to interfere with the safe administration of methylphenidate."} ;; "medical condition that is likely to interfere with the safe administration of methylphenidate"
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (taking or receiving) any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} ;; "medication"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a drug or medicament that is concomitant (i.e., taken at the same time as methylphenidate).","when_to_set_to_false":"Set to false if the patient is currently exposed to a drug or medicament, but it is not concomitant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medication is concomitant.","meaning":"Boolean indicating whether the patient's current drug or medicament exposure is concomitant with methylphenidate administration."} ;; "concomitant medication"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@likely_to_interfere_with_safe_administration_of_methylphenidate Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a drug or medicament that is likely to interfere with the safe administration of methylphenidate.","when_to_set_to_false":"Set to false if the patient is currently exposed to a drug or medicament, but it is not likely to interfere with the safe administration of methylphenidate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medication is likely to interfere with the safe administration of methylphenidate.","meaning":"Boolean indicating whether the patient's current drug or medicament exposure is likely to interfere with the safe administration of methylphenidate."} ;; "concomitant medication that is likely to interfere with the safe administration of methylphenidate"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies stem variable for medical condition
(assert
(! (=> patient_has_diagnosis_of_disease_condition_finding_now@@likely_to_interfere_with_safe_administration_of_methylphenidate
      patient_has_diagnosis_of_disease_condition_finding_now)
    :named REQ13_AUXILIARY0)) ;; "medical condition that is likely to interfere with the safe administration of methylphenidate"

;; Qualifier variable implies stem variable for concomitant medication
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@concomitant
      patient_is_exposed_to_drug_or_medicament_now)
    :named REQ13_AUXILIARY1)) ;; "concomitant medication"

;; Qualifier variable implies stem variable for medication likely to interfere
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@likely_to_interfere_with_safe_administration_of_methylphenidate
      patient_is_exposed_to_drug_or_medicament_now)
    :named REQ13_AUXILIARY2)) ;; "medication likely to interfere with safe administration of methylphenidate"

;; Concomitant AND likely to interfere implies likely to interfere
(assert
(! (=> (and patient_is_exposed_to_drug_or_medicament_now@@concomitant
            patient_is_exposed_to_drug_or_medicament_now@@likely_to_interfere_with_safe_administration_of_methylphenidate)
      patient_is_exposed_to_drug_or_medicament_now@@likely_to_interfere_with_safe_administration_of_methylphenidate)
    :named REQ13_AUXILIARY3)) ;; "the patient is taking any concomitant medication that is likely to interfere with the safe administration of methylphenidate"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_diagnosis_of_disease_condition_finding_now@@likely_to_interfere_with_safe_administration_of_methylphenidate)
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has any coexisting medical condition that is likely to interfere with the safe administration of methylphenidate"

(assert
(! (not patient_is_exposed_to_drug_or_medicament_now@@likely_to_interfere_with_safe_administration_of_methylphenidate)
    :named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is taking any concomitant medication that is likely to interfere with the safe administration of methylphenidate"

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const epoetin_start_date_value_recorded_in_days_prior_to_enrollment Real) ;; {"when_to_set_to_value":"Set to the number of days prior to enrollment that epoetin was started for the patient.","when_to_set_to_null":"Set to null if the start date of epoetin relative to enrollment is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of days prior to enrollment that epoetin was started for the patient."} ;; "the number of days prior to enrollment that epoetin was started"

(declare-const patient_started_epoetin_within_30_days_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient started epoetin within the 30 days prior to enrollment.","when_to_set_to_false":"Set to false if the patient did not start epoetin within the 30 days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient started epoetin within the 30 days prior to enrollment.","meaning":"Boolean indicating whether the patient started epoetin within the 30 days prior to enrollment."} ;; "the patient started epoetin within thirty days prior to enrollment"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Definitional link: patient_started_epoetin_within_30_days_prior_to_enrollment is true iff epoetin_start_date_value_recorded_in_days_prior_to_enrollment is between 0 and 30 (inclusive)
(assert
(! (= patient_started_epoetin_within_30_days_prior_to_enrollment
     (and (>= epoetin_start_date_value_recorded_in_days_prior_to_enrollment 0)
          (<= epoetin_start_date_value_recorded_in_days_prior_to_enrollment 30)))
:named REQ14_AUXILIARY0)) ;; "started epoetin within thirty days prior to enrollment"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_started_epoetin_within_30_days_prior_to_enrollment)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient started epoetin within thirty days prior to enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_started_epoetin_during_first_week_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient started taking epoetin during the first week of the study.","when_to_set_to_false":"Set to false if the patient did not start taking epoetin during the first week of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient started taking epoetin during the first week of the study.","meaning":"Boolean indicating whether the patient started taking epoetin during the first week of the study."} ;; "The patient is excluded if the patient starts taking epoetin during the first week of the study."

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
  (! (not patient_has_started_epoetin_during_first_week_of_study)
     :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient starts taking epoetin during the first week of the study."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_hemoglobin_finding_value_recorded_now_withunit_grams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured hemoglobin value in grams per deciliter if a current measurement is available.","when_to_set_to_null":"Set to null if no current hemoglobin measurement in grams per deciliter is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current hemoglobin concentration in grams per deciliter."} ;; "hemoglobin value"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not (< patient_hemoglobin_finding_value_recorded_now_withunit_grams_per_deciliter 8.0))
    :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a hemoglobin value less than 8.0 grams per deciliter."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_thyroid_stimulating_hormone_measurement_value_recorded_now_withunit_unknown Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric thyroid-stimulating hormone measurement (TSH) is recorded for the patient now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current thyroid-stimulating hormone measurement (TSH)."} ;; "thyroid-stimulating hormone value"
(declare-const upper_limit_of_normal_for_thyroid_stimulating_hormone_value_now_in_milliunits_per_liter Real) ;; {"when_to_set_to_value":"Set to the laboratory-defined upper limit of normal for TSH in milliunits per liter, as applicable to the patient now.","when_to_set_to_null":"Set to null if the upper limit of normal for TSH is not available, not documented, or indeterminate for the patient now.","meaning":"Numeric value representing the current upper limit of normal for thyroid-stimulating hormone (TSH) in milliunits per liter."} ;; "upper limit of normal for thyroid-stimulating hormone value"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not (>= patient_thyroid_stimulating_hormone_measurement_value_recorded_now_withunit_unknown
            (* 1.5 upper_limit_of_normal_for_thyroid_stimulating_hormone_value_now_in_milliunits_per_liter)))
   :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a thyroid-stimulating hormone value greater than or equal to 1.5 times the upper limit of normal."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const albumin_lower_limit_of_normal_value_withunit_g_per_dl Real) ;; {"when_to_set_to_value":"Set to the laboratory-defined lower limit of normal for albumin in g/dL if available.","when_to_set_to_null":"Set to null if the lower limit of normal for albumin is not available or indeterminate.","meaning":"Numeric value representing the lower limit of normal for albumin in g/dL as defined by the laboratory reference range."} ;; "lower limit of normal for albumin"
(declare-const patient_albumin_level_finding_value_recorded_now_withunit_g_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a current albumin level (in g/dL) is available for the patient.","when_to_set_to_null":"Set to null if no current albumin level measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current albumin level in grams per deciliter (g/dL)."} ;; "albumin value"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not (<= patient_albumin_level_finding_value_recorded_now_withunit_g_per_dl
            (* 0.5 albumin_lower_limit_of_normal_value_withunit_g_per_dl)))
   :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an albumin value less than or equal to 0.5 times the lower limit of normal."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_bilirubin_total_measurement_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a current total bilirubin measurement in mg/dL is available for the patient.","when_to_set_to_null":"Set to null if no current total bilirubin measurement in mg/dL is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current total bilirubin measurement in milligrams per deciliter (mg/dL)."} ;; "total bilirubin value"
(declare-const upper_limit_of_normal_for_total_bilirubin_value_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for total bilirubin in mg/dL as defined by the laboratory or clinical standard.","when_to_set_to_null":"Set to null if the reference value for the upper limit of normal for total bilirubin in mg/dL is not available or indeterminate.","meaning":"Numeric value representing the current upper limit of normal for total bilirubin in mg/dL."} ;; "upper limit of normal for total bilirubin"
(declare-const patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a current serum glutamate pyruvate transaminase (alanine aminotransferase) measurement in U/L is available for the patient.","when_to_set_to_null":"Set to null if no current serum glutamate pyruvate transaminase (alanine aminotransferase) measurement in U/L is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum glutamate pyruvate transaminase (alanine aminotransferase) measurement in units per liter (U/L)."} ;; "serum glutamate pyruvate transaminase value"
(declare-const upper_limit_of_normal_for_serum_glutamate_pyruvate_transaminase_value_now_withunit_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for serum glutamate pyruvate transaminase (alanine aminotransferase) in U/L as defined by the laboratory or clinical standard.","when_to_set_to_null":"Set to null if the reference value for the upper limit of normal for serum glutamate pyruvate transaminase (alanine aminotransferase) in U/L is not available or indeterminate.","meaning":"Numeric value representing the current upper limit of normal for serum glutamate pyruvate transaminase (alanine aminotransferase) in U/L."} ;; "upper limit of normal for serum glutamate pyruvate transaminase"
(declare-const patient_has_evidence_of_hepatic_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of hepatic impairment as defined by clinical or laboratory criteria.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of hepatic impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of hepatic impairment.","meaning":"Boolean indicating whether the patient currently has evidence of hepatic impairment."} ;; "evidence of hepatic impairment"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Definition: evidence of hepatic impairment = (total bilirubin >= 2.5x ULN) OR (ALT >= 2.5x ULN)
(assert
(! (= patient_has_evidence_of_hepatic_impairment_now
     (or (>= patient_bilirubin_total_measurement_value_recorded_now_withunit_milligrams_per_deciliter
             (* 2.5 upper_limit_of_normal_for_total_bilirubin_value_now_withunit_milligrams_per_deciliter))
         (>= patient_alanine_aminotransferase_measurement_value_recorded_now_withunit_units_per_liter
             (* 2.5 upper_limit_of_normal_for_serum_glutamate_pyruvate_transaminase_value_now_withunit_units_per_liter))))
   :named REQ19_AUXILIARY0)) ;; "defined as (total bilirubin value greater than or equal to 2.5 times the upper limit of normal ... OR serum glutamate pyruvate transaminase value greater than or equal to 2.5 times the upper limit of normal)"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_evidence_of_hepatic_impairment_now)
   :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of hepatic impairment, defined as ..."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of renal impairment.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of renal impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of renal impairment.","meaning":"Boolean indicating whether the patient currently has evidence of renal impairment."} ;; "renal impairment"
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's current serum creatinine (mg/dL) is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum creatinine level in milligrams per deciliter."} ;; "serum creatinine value"

;; ===================== Auxiliary Assertions (REQ 20) =====================
;; Definition in the requirement: renal impairment = serum creatinine > 2.5 × upper limit of normal (upper limit of normal = 1.5 mg/dL)
(assert
(! (= patient_has_finding_of_renal_impairment_now
     (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter
        (* 2.5 1.5)))
:named REQ20_AUXILIARY0)) ;; "evidence of renal impairment (defined as serum creatinine value > 2.5 × upper limit of normal (upper limit of normal range: 1.5 milligrams per deciliter))."

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
(! (not patient_has_finding_of_renal_impairment_now)
:named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of renal impairment (defined as serum creatinine value > 2.5 × upper limit of normal (upper limit of normal range: 1.5 milligrams per deciliter))."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_has_finding_of_gastrointestinal_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has narrowing (stenosis) of the gastrointestinal tract.","when_to_set_to_false":"Set to false if the patient currently does not have narrowing (stenosis) of the gastrointestinal tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has narrowing (stenosis) of the gastrointestinal tract.","meaning":"Boolean indicating whether the patient currently has narrowing (stenosis) of the gastrointestinal tract."} ;; "narrowing (pathological OR iatrogenic) of the gastrointestinal tract"
(declare-const patient_has_finding_of_gastrointestinal_stenosis_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's narrowing (stenosis) of the gastrointestinal tract is severe.","when_to_set_to_false":"Set to false if the patient's narrowing (stenosis) of the gastrointestinal tract is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the narrowing is severe.","meaning":"Boolean indicating whether the patient's narrowing (stenosis) of the gastrointestinal tract is severe."} ;; "severe narrowing (pathological OR iatrogenic) of the gastrointestinal tract"
(declare-const patient_has_finding_of_gastrointestinal_stenosis_now@@etiology_pathological_or_iatrogenic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's narrowing (stenosis) of the gastrointestinal tract is pathological or iatrogenic in origin.","when_to_set_to_false":"Set to false if the patient's narrowing (stenosis) of the gastrointestinal tract is not pathological or iatrogenic in origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the etiology is pathological or iatrogenic.","meaning":"Boolean indicating whether the patient's narrowing (stenosis) of the gastrointestinal tract is pathological or iatrogenic in origin."} ;; "narrowing (pathological OR iatrogenic) of the gastrointestinal tract"
(declare-const patient_has_finding_of_gastrointestinal_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has obstruction of the gastrointestinal tract.","when_to_set_to_false":"Set to false if the patient currently does not have obstruction of the gastrointestinal tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obstruction of the gastrointestinal tract.","meaning":"Boolean indicating whether the patient currently has obstruction of the gastrointestinal tract."} ;; "obstruction of the gastrointestinal tract"
(declare-const patient_has_finding_of_malabsorption_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has gastrointestinal malabsorption syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have gastrointestinal malabsorption syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has gastrointestinal malabsorption syndrome.","meaning":"Boolean indicating whether the patient currently has gastrointestinal malabsorption syndrome."} ;; "gastrointestinal malabsorption"

;; ===================== Auxiliary Assertions (REQ 21) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_gastrointestinal_stenosis_now@@severe
       patient_has_finding_of_gastrointestinal_stenosis_now)
   :named REQ21_AUXILIARY0)) ;; "severe narrowing (pathological OR iatrogenic) of the gastrointestinal tract"

(assert
(! (=> patient_has_finding_of_gastrointestinal_stenosis_now@@etiology_pathological_or_iatrogenic
       patient_has_finding_of_gastrointestinal_stenosis_now)
   :named REQ21_AUXILIARY1)) ;; "narrowing (pathological OR iatrogenic) of the gastrointestinal tract"

;; ===================== Constraint Assertions (REQ 21) =====================
;; Exclusion 1: severe narrowing (pathological OR iatrogenic) of the gastrointestinal tract
(assert
(! (not (and patient_has_finding_of_gastrointestinal_stenosis_now@@severe
             patient_has_finding_of_gastrointestinal_stenosis_now@@etiology_pathological_or_iatrogenic))
   :named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe narrowing (pathological OR iatrogenic) of the gastrointestinal tract."

;; Exclusion 2: obstruction of the gastrointestinal tract
(assert
(! (not patient_has_finding_of_gastrointestinal_obstruction_now)
   :named REQ21_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has obstruction of the gastrointestinal tract."

;; Exclusion 3: gastrointestinal malabsorption
(assert
(! (not patient_has_finding_of_malabsorption_syndrome_now)
   :named REQ21_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has gastrointestinal malabsorption."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_is_taking_anxiolytic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an anxiolytic agent.","when_to_set_to_false":"Set to false if the patient is not currently taking an anxiolytic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an anxiolytic agent.","meaning":"Boolean indicating whether the patient is currently taking an anxiolytic agent."} ;; "anxiolytic medication"
(declare-const patient_has_had_change_in_anxiolytic_agent_dose_in_last_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a change in the dose of anxiolytic medication in the last 30 days.","when_to_set_to_false":"Set to false if the patient has not had a change in the dose of anxiolytic medication in the last 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a change in the dose of anxiolytic medication in the last 30 days.","meaning":"Boolean indicating whether the patient has had a change in the dose of anxiolytic medication in the last 30 days."} ;; "the patient has had changes in dose in the last 30 days (anxiolytic)"
(declare-const patient_has_started_new_course_of_anxiolytic_agent_in_last_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has started a new course of anxiolytic medication in the last 30 days.","when_to_set_to_false":"Set to false if the patient has not started a new course of anxiolytic medication in the last 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has started a new course of anxiolytic medication in the last 30 days.","meaning":"Boolean indicating whether the patient has started a new course of anxiolytic medication in the last 30 days."} ;; "the patient has started a new course of treatment in the last 30 days (anxiolytic)"
(declare-const patient_is_taking_hypnotic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a hypnotic agent.","when_to_set_to_false":"Set to false if the patient is not currently taking a hypnotic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a hypnotic agent.","meaning":"Boolean indicating whether the patient is currently taking a hypnotic agent."} ;; "hypnotic medication"
(declare-const patient_has_had_change_in_hypnotic_agent_dose_in_last_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a change in the dose of hypnotic medication in the last 30 days.","when_to_set_to_false":"Set to false if the patient has not had a change in the dose of hypnotic medication in the last 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a change in the dose of hypnotic medication in the last 30 days.","meaning":"Boolean indicating whether the patient has had a change in the dose of hypnotic medication in the last 30 days."} ;; "the patient has had changes in dose in the last 30 days (hypnotic)"
(declare-const patient_has_started_new_course_of_hypnotic_agent_in_last_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has started a new course of hypnotic medication in the last 30 days.","when_to_set_to_false":"Set to false if the patient has not started a new course of hypnotic medication in the last 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has started a new course of hypnotic medication in the last 30 days.","meaning":"Boolean indicating whether the patient has started a new course of hypnotic medication in the last 30 days."} ;; "the patient has started a new course of treatment in the last 30 days (hypnotic)"

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not (and patient_is_taking_anxiolytic_agent_now
             (or patient_has_had_change_in_anxiolytic_agent_dose_in_last_30_days
                 patient_has_started_new_course_of_anxiolytic_agent_in_last_30_days)))
   :named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is taking anxiolytic medication AND ((the patient has had changes in dose in the last 30 days) OR (the patient has started a new course of treatment in the last 30 days)))."

(assert
(! (not (and patient_is_taking_hypnotic_agent_now
             (or patient_has_had_change_in_hypnotic_agent_dose_in_last_30_days
                 patient_has_started_new_course_of_hypnotic_agent_in_last_30_days)))
   :named REQ22_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is taking hypnotic medication AND ((the patient has had changes in dose in the last 30 days) OR (the patient has started a new course of treatment in the last 30 days)))."

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_ctcae_grade_of_nausea_now_in_integer Real) ;; {"when_to_set_to_value":"Set to the integer value representing the CTCAE grade of nausea the patient currently has.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the CTCAE grade of nausea is for the patient currently.","meaning":"Numeric value representing the CTCAE grade of nausea the patient currently has."} ;; "CTCAE grade of nausea"
(declare-const patient_ctcae_grade_of_vomiting_now_in_integer Real) ;; {"when_to_set_to_value":"Set to the integer value representing the CTCAE grade of vomiting the patient currently has.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the CTCAE grade of vomiting is for the patient currently.","meaning":"Numeric value representing the CTCAE grade of vomiting the patient currently has."} ;; "CTCAE grade of vomiting"
(declare-const patient_ctcae_grade_of_diarrhea_now_in_integer Real) ;; {"when_to_set_to_value":"Set to the integer value representing the CTCAE grade of diarrhea the patient currently has.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the CTCAE grade of diarrhea is for the patient currently.","meaning":"Numeric value representing the CTCAE grade of diarrhea the patient currently has."} ;; "CTCAE grade of diarrhea"
(declare-const patient_has_finding_of_nausea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has nausea.","when_to_set_to_false":"Set to false if the patient currently does not have nausea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has nausea.","meaning":"Boolean indicating whether the patient currently has nausea."} ;; "nausea"
(declare-const patient_has_finding_of_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has vomiting.","when_to_set_to_false":"Set to false if the patient currently does not have vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has vomiting.","meaning":"Boolean indicating whether the patient currently has vomiting."} ;; "vomiting"
(declare-const patient_has_finding_of_diarrhea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diarrhea.","when_to_set_to_false":"Set to false if the patient currently does not have diarrhea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diarrhea.","meaning":"Boolean indicating whether the patient currently has diarrhea."} ;; "diarrhea"

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
(! (not (and patient_has_finding_of_nausea_now
             (>= patient_ctcae_grade_of_nausea_now_in_integer 3)))
   :named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has nausea of Common Terminology Criteria for Adverse Events (CTCAE) grade III or higher."

(assert
(! (not (and patient_has_finding_of_vomiting_now
             (>= patient_ctcae_grade_of_vomiting_now_in_integer 3)))
   :named REQ23_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has vomiting of Common Terminology Criteria for Adverse Events (CTCAE) grade III or higher."

(assert
(! (not (and patient_has_finding_of_diarrhea_now
             (>= patient_ctcae_grade_of_diarrhea_now_in_integer 3)))
   :named REQ23_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diarrhea of Common Terminology Criteria for Adverse Events (CTCAE) grade III or higher."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_is_undergoing_anticonvulsant_therapy_now@@indication_sensory_neuropathy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current anticonvulsant therapy is for the indication of sensory neuropathy.","when_to_set_to_false":"Set to false if the patient's current anticonvulsant therapy is not for sensory neuropathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current anticonvulsant therapy is for sensory neuropathy.","meaning":"Boolean indicating whether the current anticonvulsant therapy is for sensory neuropathy."} ;; "anticonvulsant medication for sensory neuropathy"

(declare-const patient_is_undergoing_anticonvulsant_therapy_now@@dose_changed_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current anticonvulsant therapy has had a dose change in the last 30 days.","when_to_set_to_false":"Set to false if the patient's current anticonvulsant therapy has not had a dose change in the last 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there was a dose change in the last 30 days.","meaning":"Boolean indicating whether the current anticonvulsant therapy has had a dose change in the last 30 days."} ;; "the patient has had changes in dose in the last 30 days (anticonvulsant)"

(declare-const patient_is_undergoing_anticonvulsant_therapy_now@@new_course_started_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current anticonvulsant therapy was started as a new course in the last 30 days.","when_to_set_to_false":"Set to false if the patient's current anticonvulsant therapy was not started as a new course in the last 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a new course was started in the last 30 days.","meaning":"Boolean indicating whether the current anticonvulsant therapy was started as a new course in the last 30 days."} ;; "the patient has started a new course of treatment in the last 30 days (anticonvulsant)"

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
(! (not (and patient_is_undergoing_anticonvulsant_therapy_now
             patient_is_undergoing_anticonvulsant_therapy_now@@indication_sensory_neuropathy
             (or patient_is_undergoing_anticonvulsant_therapy_now@@dose_changed_inthepast30days
                 patient_is_undergoing_anticonvulsant_therapy_now@@new_course_started_inthepast30days)))
   :named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient is taking anticonvulsant medication for sensory neuropathy (gabapentin OR pregabalin) AND ((the patient has had changes in dose in the last 30 days) OR (the patient has started a new course of treatment in the last 30 days))"
