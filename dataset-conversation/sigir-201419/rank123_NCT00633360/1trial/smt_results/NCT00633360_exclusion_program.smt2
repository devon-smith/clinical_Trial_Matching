;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_amenorrhea_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had amenorrhea at any time during the past six months.","when_to_set_to_false":"Set to false if the patient has not had amenorrhea at any time during the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had amenorrhea during the past six months.","meaning":"Boolean indicating whether the patient has had amenorrhea during the past six months."} ;; "amenorrhea during the past six months"

(declare-const patient_has_finding_of_irregular_menstrual_periods_unable_to_predict_within_seven_days_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had irregular menstrual periods, defined as unable to predict irregular menstrual periods within seven days, at any time during the past six months.","when_to_set_to_false":"Set to false if the patient has not had irregular menstrual periods, defined as unable to predict irregular menstrual periods within seven days, at any time during the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had irregular menstrual periods, defined as unable to predict irregular menstrual periods within seven days, during the past six months.","meaning":"Boolean indicating whether the patient has had irregular menstrual periods, defined as unable to predict irregular menstrual periods within seven days, during the past six months."} ;; "irregular menstrual periods (defined as unable to predict irregular menstrual periods within seven days) during the past six months"

(declare-const patient_has_finding_of_irregular_periods_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had irregular menstrual periods at any time during the past six months.","when_to_set_to_false":"Set to false if the patient has not had irregular menstrual periods at any time during the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had irregular menstrual periods during the past six months.","meaning":"Boolean indicating whether the patient has had irregular menstrual periods during the past six months."} ;; "irregular menstrual periods during the past six months"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: "irregular menstrual periods (defined as unable to predict irregular menstrual periods within seven days)"
(assert
(! (= patient_has_finding_of_irregular_menstrual_periods_unable_to_predict_within_seven_days_inthepast6months
     patient_has_finding_of_irregular_periods_inthepast6months)
:named REQ0_AUXILIARY0)) ;; "irregular menstrual periods (defined as unable to predict irregular menstrual periods within seven days) during the past six months"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have amenorrhea during the past six months
(assert
(! (not patient_has_finding_of_amenorrhea_inthepast6months)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has amenorrhea during the past six months."

;; Exclusion: patient must NOT have irregular menstrual periods (defined as unable to predict irregular menstrual periods within seven days) during the past six months
(assert
(! (not patient_has_finding_of_irregular_menstrual_periods_unable_to_predict_within_seven_days_inthepast6months)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has irregular menstrual periods (defined as unable to predict irregular menstrual periods within seven days) during the past six months."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently known not to be breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breastfeeding.","meaning":"Boolean indicating whether the patient is currently breastfeeding."} ;; "breastfeeding"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable for breastfeeding
(assert
(! (=> patients_breastfeeding_is_positive_now patient_is_breastfeeding_now)
:named REQ1_AUXILIARY0)) ;; "breastfeeding" implies "the patient is breastfeeding"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_is_pregnant_now patient_is_breastfeeding_now))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is pregnant) OR (the patient is breastfeeding)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "the patient is a woman"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is older than thirty-four years"
(declare-const patient_currently_smokes_cigarettes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as smoking cigarettes.","when_to_set_to_false":"Set to false if the patient is currently documented as not smoking cigarettes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently smokes cigarettes.","meaning":"Boolean indicating whether the patient currently smokes cigarettes."} ;; "the patient currently smokes cigarettes"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and patient_sex_is_female_now
             (> patient_age_value_recorded_now_in_years 34)
             patient_currently_smokes_cigarettes_now))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a woman AND the patient is older than thirty-four years AND the patient currently smokes cigarettes)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_mania_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with mania at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with mania at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with mania.","meaning":"Boolean indicating whether the patient has ever been diagnosed with mania in their history."} ;; "any history of mania"
(declare-const patient_has_diagnosis_of_hypomania_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with hypomania at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with hypomania at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with hypomania.","meaning":"Boolean indicating whether the patient has ever been diagnosed with hypomania in their history."} ;; "any history of hypomania"
(declare-const patient_has_diagnosis_of_psychotic_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a psychotic disorder at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a psychotic disorder at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a psychotic disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with a psychotic disorder in their history."} ;; "any lifetime history of a psychotic disorder"
(declare-const patient_has_diagnosis_of_mental_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a mental disorder (psychiatric disorder) at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a mental disorder (psychiatric disorder) at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a mental disorder (psychiatric disorder).","meaning":"Boolean indicating whether the patient has ever been diagnosed with a mental disorder (psychiatric disorder) in their history."} ;; "psychiatric disorders"
(declare-const patient_has_diagnosis_of_mental_disorder_inthehistory@@diagnosed_by_mini_international_neuropsychiatric_interview_at_baseline_study_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of mental disorder (psychiatric disorder) was made based on administration of the Mini International Neuropsychiatric Interview at the baseline study visit.","when_to_set_to_false":"Set to false if the patient's diagnosis of mental disorder (psychiatric disorder) was not made based on administration of the Mini International Neuropsychiatric Interview at the baseline study visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made based on administration of the Mini International Neuropsychiatric Interview at the baseline study visit.","meaning":"Boolean indicating whether the patient's diagnosis of mental disorder (psychiatric disorder) was made based on administration of the Mini International Neuropsychiatric Interview at the baseline study visit."} ;; "psychiatric disorders, based on administration of the Mini International Neuropsychiatric Interview at the baseline study visit"
(declare-const patient_has_diagnosis_of_psychoactive_substance_use_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a psychoactive substance use disorder at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a psychoactive substance use disorder at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a psychoactive substance use disorder.","meaning":"Boolean indicating whether the patient has ever been diagnosed with a psychoactive substance use disorder in their history."} ;; "substance use disorders"
(declare-const patient_has_diagnosis_of_psychoactive_substance_use_disorder_inthehistory@@diagnosed_by_mini_international_neuropsychiatric_interview_at_baseline_study_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of psychoactive substance use disorder was made based on administration of the Mini International Neuropsychiatric Interview at the baseline study visit.","when_to_set_to_false":"Set to false if the patient's diagnosis of psychoactive substance use disorder was not made based on administration of the Mini International Neuropsychiatric Interview at the baseline study visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made based on administration of the Mini International Neuropsychiatric Interview at the baseline study visit.","meaning":"Boolean indicating whether the patient's diagnosis of psychoactive substance use disorder was made based on administration of the Mini International Neuropsychiatric Interview at the baseline study visit."} ;; "substance use disorders, based on administration of the Mini International Neuropsychiatric Interview at the baseline study visit"
(declare-const patient_has_diagnosis_of_psychotic_disorder_inthehistory@@diagnosed_by_mini_international_neuropsychiatric_interview_at_baseline_study_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of psychotic disorder was made based on administration of the Mini International Neuropsychiatric Interview at the baseline study visit.","when_to_set_to_false":"Set to false if the patient's diagnosis of psychotic disorder was not made based on administration of the Mini International Neuropsychiatric Interview at the baseline study visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made based on administration of the Mini International Neuropsychiatric Interview at the baseline study visit.","meaning":"Boolean indicating whether the patient's diagnosis of psychotic disorder was made based on administration of the Mini International Neuropsychiatric Interview at the baseline study visit."} ;; "psychotic disorder, based on administration of the Mini International Neuropsychiatric Interview at the baseline study visit"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_mental_disorder_inthehistory@@diagnosed_by_mini_international_neuropsychiatric_interview_at_baseline_study_visit
      patient_has_diagnosis_of_mental_disorder_inthehistory)
    :named REQ3_AUXILIARY0)) ;; "psychiatric disorders, based on administration of the Mini International Neuropsychiatric Interview at the baseline study visit"

(assert
(! (=> patient_has_diagnosis_of_psychoactive_substance_use_disorder_inthehistory@@diagnosed_by_mini_international_neuropsychiatric_interview_at_baseline_study_visit
      patient_has_diagnosis_of_psychoactive_substance_use_disorder_inthehistory)
    :named REQ3_AUXILIARY1)) ;; "substance use disorders, based on administration of the Mini International Neuropsychiatric Interview at the baseline study visit"

(assert
(! (=> patient_has_diagnosis_of_psychotic_disorder_inthehistory@@diagnosed_by_mini_international_neuropsychiatric_interview_at_baseline_study_visit
      patient_has_diagnosis_of_psychotic_disorder_inthehistory)
    :named REQ3_AUXILIARY2)) ;; "psychotic disorder, based on administration of the Mini International Neuropsychiatric Interview at the baseline study visit"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exhaustive subcategories: (any history of mania suggesting bipolar disorder) OR (any history of hypomania suggesting bipolar disorder) OR (any lifetime history of a psychotic disorder)
(assert
(! (not (or patient_has_diagnosis_of_mania_inthehistory
            patient_has_diagnosis_of_hypomania_inthehistory
            patient_has_diagnosis_of_psychotic_disorder_inthehistory@@diagnosed_by_mini_international_neuropsychiatric_interview_at_baseline_study_visit))
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "any history of mania suggesting bipolar disorder OR any history of hypomania suggesting bipolar disorder OR any lifetime history of a psychotic disorder, based on administration of the Mini International Neuropsychiatric Interview at the baseline study visit"

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_depressive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of depressive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has depressive disorder.","meaning":"Boolean indicating whether the patient currently has depressive disorder."} ;; "depression"

(declare-const patient_has_finding_of_depressive_disorder_now@@deemed_by_physician_investigator_too_severe_to_be_treated_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has depressive disorder and the physician investigator has deemed its severity too great to be treated in the study.","when_to_set_to_false":"Set to false if the patient currently has depressive disorder but the physician investigator has not deemed its severity too great to be treated in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the physician investigator has deemed the depressive disorder too severe to be treated in the study.","meaning":"Boolean indicating whether the patient's depressive disorder is deemed by the physician investigator to be too severe to be treated in the study."} ;; "depression is deemed by the physician investigator to be too severe to be treated in the study"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_depressive_disorder_now@@deemed_by_physician_investigator_too_severe_to_be_treated_in_study
      patient_has_finding_of_depressive_disorder_now)
:named REQ4_AUXILIARY0)) ;; "depression is deemed by the physician investigator to be too severe to be treated in the study""

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_depressive_disorder_now@@deemed_by_physician_investigator_too_severe_to_be_treated_in_study)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's depression is deemed by the physician investigator to be too severe to be treated in the study."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_exposed_to_benzodiazepine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to benzodiazepines.","when_to_set_to_false":"Set to false if the patient is currently not exposed to benzodiazepines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to benzodiazepines.","meaning":"Boolean indicating whether the patient is currently exposed to benzodiazepines."} ;; "uses benzodiazepines"

(declare-const patient_is_exposed_to_anti_psychotic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to antipsychotic agents.","when_to_set_to_false":"Set to false if the patient is currently not exposed to antipsychotic agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to antipsychotic agents.","meaning":"Boolean indicating whether the patient is currently exposed to antipsychotic agents."} ;; "uses antipsychotics"

(declare-const patient_is_exposed_to_anti_psychotic_agent_now@@used_to_target_premenstrual_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to antipsychotic agents and the exposure is specifically for targeting premenstrual symptoms.","when_to_set_to_false":"Set to false if the patient is currently exposed to antipsychotic agents but not for targeting premenstrual symptoms, or not exposed at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to antipsychotic agents is for targeting premenstrual symptoms.","meaning":"Boolean indicating whether the patient is currently exposed to antipsychotic agents specifically for targeting premenstrual symptoms."} ;; "uses antipsychotics to target premenstrual symptoms"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_anti_psychotic_agent_now@@used_to_target_premenstrual_symptoms
      patient_is_exposed_to_anti_psychotic_agent_now)
:named REQ5_AUXILIARY0)) ;; "uses antipsychotics to target premenstrual symptoms" implies "uses antipsychotics"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_exposed_to_benzodiazepine_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient uses benzodiazepines"

(assert
(! (not patient_is_exposed_to_anti_psychotic_agent_now@@used_to_target_premenstrual_symptoms)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient uses antipsychotics to target premenstrual symptoms"

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_exposed_to_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to an antidepressant.","when_to_set_to_false":"Set to false if the patient is currently not exposed to an antidepressant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to an antidepressant.","meaning":"Boolean indicating whether the patient is currently exposed to an antidepressant."} ;; "antidepressant"
(declare-const patient_is_exposed_to_antidepressant_now@@subject_to_luteal_phase_dose_adjustment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to an antidepressant and that antidepressant is subject to a luteal-phase dose adjustment.","when_to_set_to_false":"Set to false if the patient is currently exposed to an antidepressant and that antidepressant is not subject to a luteal-phase dose adjustment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antidepressant is subject to a luteal-phase dose adjustment.","meaning":"Boolean indicating whether the antidepressant the patient is currently exposed to is subject to a luteal-phase dose adjustment."} ;; "luteal-phase dose adjustment of the antidepressant"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_antidepressant_now@@subject_to_luteal_phase_dose_adjustment
      patient_is_exposed_to_antidepressant_now)
   :named REQ6_AUXILIARY0)) ;; "luteal-phase dose adjustment of the antidepressant""

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_exposed_to_antidepressant_now@@subject_to_luteal_phase_dose_adjustment)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a luteal-phase dose adjustment of the antidepressant."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_hormone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a hormone substance.","when_to_set_to_false":"Set to false if the patient is currently not exposed to a hormone substance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a hormone substance.","meaning":"Boolean indicating whether the patient is currently exposed to a hormone substance."} ;; "hormone"
(declare-const patient_is_exposed_to_hormone_now@@via_intrauterine_device Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to hormone is specifically via an intrauterine device.","when_to_set_to_false":"Set to false if the patient's current exposure to hormone is not via an intrauterine device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hormone exposure is via an intrauterine device.","meaning":"Boolean indicating whether the patient's current hormone exposure is specifically via an intrauterine device."} ;; "hormone-releasing intrauterine device"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_hormone_now@@via_intrauterine_device
      patient_is_exposed_to_hormone_now)
:named REQ7_AUXILIARY0)) ;; "hormone-releasing intrauterine device"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_exposed_to_hormone_now@@via_intrauterine_device)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses a hormone-releasing intrauterine device."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_used_oral_contraceptive_pill_in_past_2_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used an oral contraceptive pill at any time within the past two months.","when_to_set_to_false":"Set to false if the patient has not used an oral contraceptive pill within the past two months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used an oral contraceptive pill in the past two months.","meaning":"Boolean indicating whether the patient has used an oral contraceptive pill within the past two months."} ;; "The patient is excluded if the patient has used an oral contraceptive pill in the past two months."

(declare-const patient_has_used_oral_preparations_of_androgens_in_past_2_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used oral preparations of androgens at any time within the past two months.","when_to_set_to_false":"Set to false if the patient has not used oral preparations of androgens within the past two months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used oral preparations of androgens in the past two months.","meaning":"Boolean indicating whether the patient has used oral preparations of androgens within the past two months."} ;; "oral preparations of androgens in the past two months"

(declare-const patient_has_used_oral_preparations_of_estrogens_in_past_2_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used oral preparations of estrogens at any time within the past two months.","when_to_set_to_false":"Set to false if the patient has not used oral preparations of estrogens within the past two months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used oral preparations of estrogens in the past two months.","meaning":"Boolean indicating whether the patient has used oral preparations of estrogens within the past two months."} ;; "oral preparations of estrogens in the past two months"

(declare-const patient_has_used_oral_preparations_of_progestins_in_past_2_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used oral preparations of progestins at any time within the past two months.","when_to_set_to_false":"Set to false if the patient has not used oral preparations of progestins within the past two months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used oral preparations of progestins in the past two months.","meaning":"Boolean indicating whether the patient has used oral preparations of progestins within the past two months."} ;; "oral preparations of progestins in the past two months"

(declare-const patient_has_used_transdermal_preparations_of_androgens_in_past_2_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used transdermal preparations of androgens at any time within the past two months.","when_to_set_to_false":"Set to false if the patient has not used transdermal preparations of androgens within the past two months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used transdermal preparations of androgens in the past two months.","meaning":"Boolean indicating whether the patient has used transdermal preparations of androgens within the past two months."} ;; "transdermal preparations of androgens in the past two months"

(declare-const patient_has_used_transdermal_preparations_of_estrogens_in_past_2_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used transdermal preparations of estrogens at any time within the past two months.","when_to_set_to_false":"Set to false if the patient has not used transdermal preparations of estrogens within the past two months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used transdermal preparations of estrogens in the past two months.","meaning":"Boolean indicating whether the patient has used transdermal preparations of estrogens within the past two months."} ;; "transdermal preparations of estrogens in the past two months"

(declare-const patient_has_used_transdermal_preparations_of_progestins_in_past_2_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used transdermal preparations of progestins at any time within the past two months.","when_to_set_to_false":"Set to false if the patient has not used transdermal preparations of progestins within the past two months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used transdermal preparations of progestins in the past two months.","meaning":"Boolean indicating whether the patient has used transdermal preparations of progestins within the past two months."} ;; "transdermal preparations of progestins in the past two months"

(declare-const patient_has_used_injection_preparations_of_androgens_in_past_2_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used injection preparations of androgens at any time within the past two months.","when_to_set_to_false":"Set to false if the patient has not used injection preparations of androgens within the past two months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used injection preparations of androgens in the past two months.","meaning":"Boolean indicating whether the patient has used injection preparations of androgens within the past two months."} ;; "injection preparations of androgens in the past two months"

(declare-const patient_has_used_injection_preparations_of_estrogens_in_past_2_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used injection preparations of estrogens at any time within the past two months.","when_to_set_to_false":"Set to false if the patient has not used injection preparations of estrogens within the past two months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used injection preparations of estrogens in the past two months.","meaning":"Boolean indicating whether the patient has used injection preparations of estrogens within the past two months."} ;; "injection preparations of estrogens in the past two months"

(declare-const patient_has_used_injection_preparations_of_progestins_in_past_2_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used injection preparations of progestins at any time within the past two months.","when_to_set_to_false":"Set to false if the patient has not used injection preparations of progestins within the past two months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used injection preparations of progestins in the past two months.","meaning":"Boolean indicating whether the patient has used injection preparations of progestins within the past two months."} ;; "injection preparations of progestins in the past two months"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Exhaustive subcategories for "other systemic hormonal therapies" in the past two months
;; Define umbrella variable for "other systemic hormonal therapies" as the OR of all listed subcategories
(declare-const patient_has_used_other_systemic_hormonal_therapies_in_past_2_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any of the listed systemic hormonal therapies (oral preparations of androgens, oral preparations of estrogens, oral preparations of progestins, transdermal preparations of androgens, transdermal preparations of estrogens, transdermal preparations of progestins, injection preparations of androgens, injection preparations of estrogens, injection preparations of progestins) at any time within the past two months.","when_to_set_to_false":"Set to false if the patient has not used any of the listed systemic hormonal therapies within the past two months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any of the listed systemic hormonal therapies in the past two months.","meaning":"Boolean indicating whether the patient has used any of the listed other systemic hormonal therapies within the past two months."} ;; "other systemic hormonal therapies (oral preparations of androgens, oral preparations of estrogens, oral preparations of progestins, transdermal preparations of androgens, transdermal preparations of estrogens, transdermal preparations of progestins, injection preparations of androgens, injection preparations of estrogens, injection preparations of progestins) in the past two months"

(assert
(! (= patient_has_used_other_systemic_hormonal_therapies_in_past_2_months
      (or patient_has_used_oral_preparations_of_androgens_in_past_2_months
          patient_has_used_oral_preparations_of_estrogens_in_past_2_months
          patient_has_used_oral_preparations_of_progestins_in_past_2_months
          patient_has_used_transdermal_preparations_of_androgens_in_past_2_months
          patient_has_used_transdermal_preparations_of_estrogens_in_past_2_months
          patient_has_used_transdermal_preparations_of_progestins_in_past_2_months
          patient_has_used_injection_preparations_of_androgens_in_past_2_months
          patient_has_used_injection_preparations_of_estrogens_in_past_2_months
          patient_has_used_injection_preparations_of_progestins_in_past_2_months))
   :named REQ8_AUXILIARY0)) ;; "other systemic hormonal therapies with exhaustive subcategories ((oral preparations of androgens) OR (oral preparations of estrogens) OR (oral preparations of progestins) OR (transdermal preparations of androgens) OR (transdermal preparations of estrogens) OR (transdermal preparations of progestins) OR (injection preparations of androgens) OR (injection preparations of estrogens) OR (injection preparations of progestins)) in the past two months."

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient must NOT have used oral contraceptive pill in past 2 months
(assert
(! (not patient_has_used_oral_contraceptive_pill_in_past_2_months)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used an oral contraceptive pill in the past two months."

;; Exclusion: patient must NOT have used other systemic hormonal therapies in past 2 months (as defined by exhaustive subcategories)
(assert
(! (not patient_has_used_other_systemic_hormonal_therapies_in_past_2_months)
   :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used other systemic hormonal therapies (oral preparations of androgens OR oral preparations of estrogens OR oral preparations of progestins OR transdermal preparations of androgens OR transdermal preparations of estrogens OR transdermal preparations of progestins OR injection preparations of androgens OR injection preparations of estrogens OR injection preparations of progestins) in the past two months."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_contraindication_to_oral_contraceptive_pill_therapy_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had any contraindication to any oral contraceptive pill therapy.","when_to_set_to_false":"Set to false if the patient has never had any contraindication to any oral contraceptive pill therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had any contraindication to any oral contraceptive pill therapy.","meaning":"Boolean indicating whether the patient has ever had any contraindication to any oral contraceptive pill therapy."} ;; "the patient has any contraindication to any oral contraceptive pill therapy"
(declare-const patient_has_adverse_event_to_oral_contraceptive_pill_therapy_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had any previous adverse event to any oral contraceptive pill therapy.","when_to_set_to_false":"Set to false if the patient has never had any previous adverse event to any oral contraceptive pill therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had any previous adverse event to any oral contraceptive pill therapy.","meaning":"Boolean indicating whether the patient has ever had any previous adverse event to any oral contraceptive pill therapy."} ;; "the patient has any previous adverse event to any oral contraceptive pill therapy"
(declare-const patient_has_finding_of_oral_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any clinical finding related to oral contraceptive pill therapy (such as a contraindication or adverse event).","when_to_set_to_false":"Set to false if the patient currently does not have any clinical finding related to oral contraceptive pill therapy (such as a contraindication or adverse event).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any clinical finding related to oral contraceptive pill therapy.","meaning":"Boolean indicating whether the patient currently has any clinical finding (e.g., contraindication or adverse event) related to oral contraceptive pill therapy."} ;; "oral contraceptive pill therapy"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_contraindication_to_oral_contraceptive_pill_therapy_ever)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has any contraindication to any oral contraceptive pill therapy"

(assert
(! (not patient_has_adverse_event_to_oral_contraceptive_pill_therapy_ever)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has any previous adverse event to any oral contraceptive pill therapy"

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_exposed_to_ketoconazole_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to ketoconazole.","when_to_set_to_false":"Set to false if the patient is currently not exposed to ketoconazole.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to ketoconazole.","meaning":"Boolean indicating whether the patient is currently exposed to ketoconazole."} ;; "ketoconazole"
(declare-const patient_is_exposed_to_rifampin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to rifampin.","when_to_set_to_false":"Set to false if the patient is currently not exposed to rifampin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to rifampin.","meaning":"Boolean indicating whether the patient is currently exposed to rifampin."} ;; "rifampin"
(declare-const patient_is_exposed_to_carbamazepine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to carbamazepine.","when_to_set_to_false":"Set to false if the patient is currently not exposed to carbamazepine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to carbamazepine.","meaning":"Boolean indicating whether the patient is currently exposed to carbamazepine."} ;; "carbamazepine"
(declare-const patient_is_exposed_to_topiramate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to topiramate.","when_to_set_to_false":"Set to false if the patient is currently not exposed to topiramate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to topiramate.","meaning":"Boolean indicating whether the patient is currently exposed to topiramate."} ;; "topiramate"
(declare-const patient_is_exposed_to_oxcarbazepine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to oxcarbazepine.","when_to_set_to_false":"Set to false if the patient is currently not exposed to oxcarbazepine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to oxcarbazepine.","meaning":"Boolean indicating whether the patient is currently exposed to oxcarbazepine."} ;; "oxcarbazepine"
(declare-const patient_is_exposed_to_modafinil_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to modafinil.","when_to_set_to_false":"Set to false if the patient is currently not exposed to modafinil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to modafinil.","meaning":"Boolean indicating whether the patient is currently exposed to modafinil."} ;; "modafinil"
(declare-const patient_is_exposed_to_phenytoin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to phenytoin.","when_to_set_to_false":"Set to false if the patient is currently not exposed to phenytoin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to phenytoin.","meaning":"Boolean indicating whether the patient is currently exposed to phenytoin."} ;; "phenytoin"
(declare-const patient_is_exposed_to_phenobarbital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to phenobarbital.","when_to_set_to_false":"Set to false if the patient is currently not exposed to phenobarbital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to phenobarbital.","meaning":"Boolean indicating whether the patient is currently exposed to phenobarbital."} ;; "phenobarbital"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_exposed_to_ketoconazole_now)
:named REQ10_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient currently uses ketoconazole."
(assert
(! (not patient_is_exposed_to_rifampin_now)
:named REQ10_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient currently uses rifampin."
(assert
(! (not patient_is_exposed_to_carbamazepine_now)
:named REQ10_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient currently uses carbamazepine."
(assert
(! (not patient_is_exposed_to_topiramate_now)
:named REQ10_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient currently uses topiramate."
(assert
(! (not patient_is_exposed_to_oxcarbazepine_now)
:named REQ10_COMPONENT4_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient currently uses oxcarbazepine."
(assert
(! (not patient_is_exposed_to_modafinil_now)
:named REQ10_COMPONENT5_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient currently uses modafinil."
(assert
(! (not patient_is_exposed_to_phenytoin_now)
:named REQ10_COMPONENT6_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient currently uses phenytoin."
(assert
(! (not patient_is_exposed_to_phenobarbital_now)
:named REQ10_COMPONENT7_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient currently uses phenobarbital."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_taking_aldosterone_receptor_antagonist_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an aldosterone antagonist.","when_to_set_to_false":"Set to false if the patient is currently not taking an aldosterone antagonist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an aldosterone antagonist.","meaning":"Boolean indicating whether the patient is currently taking an aldosterone antagonist."} ;; "aldosterone antagonists"
(declare-const patient_is_taking_angiotensin_converting_enzyme_inhibitor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an angiotensin-converting enzyme inhibitor.","when_to_set_to_false":"Set to false if the patient is currently not taking an angiotensin-converting enzyme inhibitor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an angiotensin-converting enzyme inhibitor.","meaning":"Boolean indicating whether the patient is currently taking an angiotensin-converting enzyme inhibitor."} ;; "angiotensin-converting enzyme inhibitors"
(declare-const patient_is_taking_angiotensin_ii_receptor_antagonist_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an angiotensin II receptor antagonist.","when_to_set_to_false":"Set to false if the patient is currently not taking an angiotensin II receptor antagonist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an angiotensin II receptor antagonist.","meaning":"Boolean indicating whether the patient is currently taking an angiotensin II receptor antagonist."} ;; "angiotensin II receptor antagonists"
(declare-const patient_is_taking_heparin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking heparin.","when_to_set_to_false":"Set to false if the patient is currently not taking heparin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking heparin.","meaning":"Boolean indicating whether the patient is currently taking heparin."} ;; "heparin"
(declare-const patient_is_taking_non_steroidal_anti_inflammatory_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a nonsteroidal anti-inflammatory drug.","when_to_set_to_false":"Set to false if the patient is currently not taking a nonsteroidal anti-inflammatory drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a nonsteroidal anti-inflammatory drug.","meaning":"Boolean indicating whether the patient is currently taking a nonsteroidal anti-inflammatory drug."} ;; "nonsteroidal anti-inflammatory drugs"
(declare-const patient_is_taking_potassium_sparing_diuretic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a potassium-sparing diuretic.","when_to_set_to_false":"Set to false if the patient is currently not taking a potassium-sparing diuretic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a potassium-sparing diuretic.","meaning":"Boolean indicating whether the patient is currently taking a potassium-sparing diuretic."} ;; "potassium-sparing diuretics"
(declare-const patient_is_taking_potassium_supplement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a potassium supplement.","when_to_set_to_false":"Set to false if the patient is currently not taking a potassium supplement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a potassium supplement.","meaning":"Boolean indicating whether the patient is currently taking a potassium supplement."} ;; "potassium supplements"
(declare-const patient_is_taking_spironolactone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking spironolactone.","when_to_set_to_false":"Set to false if the patient is currently not taking spironolactone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking spironolactone.","meaning":"Boolean indicating whether the patient is currently taking spironolactone."} ;; "spironolactone"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Non-exhaustive examples: spironolactone is an example of potassium-sparing diuretic
(assert
(! (=> patient_is_taking_spironolactone_now
      patient_is_taking_potassium_sparing_diuretic_now)
    :named REQ11_AUXILIARY0)) ;; "potassium-sparing diuretics with non-exhaustive examples (spironolactone)"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_taking_potassium_sparing_diuretic_now)
    :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently uses potassium-sparing diuretics (such as spironolactone)."

(assert
(! (not patient_is_taking_angiotensin_converting_enzyme_inhibitor_now)
    :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently uses angiotensin-converting enzyme inhibitors."

(assert
(! (not patient_is_taking_angiotensin_ii_receptor_antagonist_now)
    :named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently uses angiotensin II receptor antagonists."

(assert
(! (not patient_is_taking_heparin_now)
    :named REQ11_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently uses heparin."

(assert
(! (not patient_is_taking_aldosterone_receptor_antagonist_now)
    :named REQ11_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently uses aldosterone antagonists."

(assert
(! (not patient_is_taking_non_steroidal_anti_inflammatory_agent_now)
    :named REQ11_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently uses nonsteroidal anti-inflammatory drugs."

(assert
(! (not patient_is_taking_potassium_supplement_now)
    :named REQ11_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently uses potassium supplements."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_abnormal_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of abnormal liver function (hepatic dysfunction).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of abnormal liver function (hepatic dysfunction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal liver function (hepatic dysfunction).","meaning":"Boolean indicating whether the patient currently has abnormal liver function (hepatic dysfunction)."} ;; "hepatic dysfunction"
(declare-const patient_has_finding_of_abnormal_liver_function_now@@risk_when_treated_with_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal liver function may put the patient at risk when treated with study medication.","when_to_set_to_false":"Set to false if the patient's abnormal liver function does not put the patient at risk when treated with study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's abnormal liver function may put the patient at risk when treated with study medication.","meaning":"Boolean indicating whether the patient's abnormal liver function may put the patient at risk when treated with study medication."} ;; "hepatic dysfunction that may put the patient at risk when treated with study medication"

(declare-const patient_has_finding_of_renal_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal insufficiency.","meaning":"Boolean indicating whether the patient currently has renal insufficiency."} ;; "renal insufficiency"
(declare-const patient_has_finding_of_renal_insufficiency_now@@risk_when_treated_with_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal insufficiency may put the patient at risk when treated with study medication.","when_to_set_to_false":"Set to false if the patient's renal insufficiency does not put the patient at risk when treated with study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's renal insufficiency may put the patient at risk when treated with study medication.","meaning":"Boolean indicating whether the patient's renal insufficiency may put the patient at risk when treated with study medication."} ;; "renal insufficiency that may put the patient at risk when treated with study medication"

(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of disorder of lung (pulmonary disease).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of disorder of lung (pulmonary disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of lung (pulmonary disease).","meaning":"Boolean indicating whether the patient currently has a disorder of lung (pulmonary disease)."} ;; "pulmonary diseases"
(declare-const patient_has_finding_of_disorder_of_lung_now@@risk_when_treated_with_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disorder of lung may put the patient at risk when treated with study medication.","when_to_set_to_false":"Set to false if the patient's disorder of lung does not put the patient at risk when treated with study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disorder of lung may put the patient at risk when treated with study medication.","meaning":"Boolean indicating whether the patient's disorder of lung may put the patient at risk when treated with study medication."} ;; "pulmonary diseases that may put the patient at risk when treated with study medication"

(declare-const patient_has_finding_of_disorder_of_adrenal_gland_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of disorder of adrenal gland (adrenal disease).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of disorder of adrenal gland (adrenal disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of adrenal gland (adrenal disease).","meaning":"Boolean indicating whether the patient currently has a disorder of adrenal gland (adrenal disease)."} ;; "adrenal diseases"
(declare-const patient_has_finding_of_disorder_of_adrenal_gland_now@@risk_when_treated_with_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disorder of adrenal gland may put the patient at risk when treated with study medication.","when_to_set_to_false":"Set to false if the patient's disorder of adrenal gland does not put the patient at risk when treated with study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disorder of adrenal gland may put the patient at risk when treated with study medication.","meaning":"Boolean indicating whether the patient's disorder of adrenal gland may put the patient at risk when treated with study medication."} ;; "adrenal diseases that may put the patient at risk when treated with study medication"

(declare-const patient_has_finding_of_metabolic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of metabolic disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of metabolic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a metabolic disease.","meaning":"Boolean indicating whether the patient currently has a metabolic disease."} ;; "metabolic diseases"
(declare-const patient_has_finding_of_metabolic_disease_now@@risk_when_treated_with_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's metabolic disease may put the patient at risk when treated with study medication.","when_to_set_to_false":"Set to false if the patient's metabolic disease does not put the patient at risk when treated with study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's metabolic disease may put the patient at risk when treated with study medication.","meaning":"Boolean indicating whether the patient's metabolic disease may put the patient at risk when treated with study medication."} ;; "metabolic diseases that may put the patient at risk when treated with study medication"

(declare-const patient_has_finding_of_raised_serum_potassium_level_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of raised serum potassium level.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of raised serum potassium level.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a raised serum potassium level.","meaning":"Boolean indicating whether the patient currently has a raised serum potassium level."} ;; "elevated serum potassium levels"
(declare-const patient_has_finding_of_raised_serum_potassium_level_now@@risk_when_treated_with_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's raised serum potassium level may put the patient at risk when treated with study medication.","when_to_set_to_false":"Set to false if the patient's raised serum potassium level does not put the patient at risk when treated with study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's raised serum potassium level may put the patient at risk when treated with study medication.","meaning":"Boolean indicating whether the patient's raised serum potassium level may put the patient at risk when treated with study medication."} ;; "elevated serum potassium levels that may put the patient at risk when treated with study medication"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_abnormal_liver_function_now@@risk_when_treated_with_study_medication
      patient_has_finding_of_abnormal_liver_function_now)
:named REQ12_AUXILIARY0)) ;; "hepatic dysfunction that may put the patient at risk when treated with study medication"

(assert
(! (=> patient_has_finding_of_renal_insufficiency_now@@risk_when_treated_with_study_medication
      patient_has_finding_of_renal_insufficiency_now)
:named REQ12_AUXILIARY1)) ;; "renal insufficiency that may put the patient at risk when treated with study medication"

(assert
(! (=> patient_has_finding_of_disorder_of_lung_now@@risk_when_treated_with_study_medication
      patient_has_finding_of_disorder_of_lung_now)
:named REQ12_AUXILIARY2)) ;; "pulmonary diseases that may put the patient at risk when treated with study medication"

(assert
(! (=> patient_has_finding_of_disorder_of_adrenal_gland_now@@risk_when_treated_with_study_medication
      patient_has_finding_of_disorder_of_adrenal_gland_now)
:named REQ12_AUXILIARY3)) ;; "adrenal diseases that may put the patient at risk when treated with study medication"

(assert
(! (=> patient_has_finding_of_metabolic_disease_now@@risk_when_treated_with_study_medication
      patient_has_finding_of_metabolic_disease_now)
:named REQ12_AUXILIARY4)) ;; "metabolic diseases that may put the patient at risk when treated with study medication"

(assert
(! (=> patient_has_finding_of_raised_serum_potassium_level_now@@risk_when_treated_with_study_medication
      patient_has_finding_of_raised_serum_potassium_level_now)
:named REQ12_AUXILIARY5)) ;; "elevated serum potassium levels that may put the patient at risk when treated with study medication"

;; Non-exhaustive example: elevated serum potassium levels is an example of metabolic disease
(assert
(! (=> patient_has_finding_of_raised_serum_potassium_level_now@@risk_when_treated_with_study_medication
      patient_has_finding_of_metabolic_disease_now@@risk_when_treated_with_study_medication)
:named REQ12_AUXILIARY6)) ;; "metabolic diseases with non-exhaustive examples (elevated serum potassium levels, if known) that may put the patient at risk when treated with study medication"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_abnormal_liver_function_now@@risk_when_treated_with_study_medication)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "hepatic dysfunction that may put the patient at risk when treated with study medication"

(assert
(! (not patient_has_finding_of_renal_insufficiency_now@@risk_when_treated_with_study_medication)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "renal insufficiency that may put the patient at risk when treated with study medication"

(assert
(! (not patient_has_finding_of_disorder_of_lung_now@@risk_when_treated_with_study_medication)
:named REQ12_COMPONENT2_OTHER_REQUIREMENTS)) ;; "pulmonary diseases that may put the patient at risk when treated with study medication"

(assert
(! (not patient_has_finding_of_disorder_of_adrenal_gland_now@@risk_when_treated_with_study_medication)
:named REQ12_COMPONENT3_OTHER_REQUIREMENTS)) ;; "adrenal diseases that may put the patient at risk when treated with study medication"

(assert
(! (not patient_has_finding_of_metabolic_disease_now@@risk_when_treated_with_study_medication)
:named REQ12_COMPONENT4_OTHER_REQUIREMENTS)) ;; "metabolic diseases (such as elevated serum potassium levels, if known) that may put the patient at risk when treated with study medication"
