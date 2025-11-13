;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; "the patient must be female" {"when_to_set_to_true":"Set to true if the patient's current recorded sex is female.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not female (i.e., male or other).","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current recorded sex is female."}

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must be female.
(assert
  (! patient_sex_is_female_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be female."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; "aged greater than or equal to 45 years AND aged less than or equal to 55 years" {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: patient must be aged greater than or equal to 45 years
(assert
  (! (>= patient_age_value_recorded_now_in_years 45)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged greater than or equal to 45 years"

;; Component 1: patient must be aged less than or equal to 55 years
(assert
  (! (<= patient_age_value_recorded_now_in_years 55)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "aged less than or equal to 55 years"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_caucasian Bool) ;; "the patient must be Caucasian" {"when_to_set_to_true":"Set to true if the patient is identified as Caucasian.","when_to_set_to_false":"Set to false if the patient is identified as not Caucasian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is Caucasian.","meaning":"Boolean indicating whether the patient is identified as Caucasian."}

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_caucasian
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be Caucasian"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_cigarette_smoker_value_recorded_now_withunit_cigarettes_per_day Real) ;; "smoker of up to 10 cigarettes per day (smoker of greater than or equal to 1 cigarette per day AND smoker of less than or equal to 10 cigarettes per day)" {"when_to_set_to_value":"Set to the measured or reported number of cigarettes the patient currently smokes per day.","when_to_set_to_null":"Set to null if no such measurement or report is available or the value is indeterminate.","meaning":"Numeric value representing the number of cigarettes the patient currently smokes per day."}
(declare-const patient_has_finding_of_cigarette_smoker_now Bool) ;; "smoker" {"when_to_set_to_true":"Set to true if the patient is currently a cigarette smoker.","when_to_set_to_false":"Set to false if the patient is currently not a cigarette smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a cigarette smoker.","meaning":"Boolean indicating whether the patient is currently a cigarette smoker."}
(declare-const patient_has_finding_of_non_smoker_now Bool) ;; "non-smoker" {"when_to_set_to_true":"Set to true if the patient is currently a non-smoker.","when_to_set_to_false":"Set to false if the patient is currently a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a non-smoker.","meaning":"Boolean indicating whether the patient is currently a non-smoker."}

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: being a non-smoker means not being a cigarette smoker
(assert
  (! (= patient_has_finding_of_non_smoker_now
        (not patient_has_finding_of_cigarette_smoker_now))
     :named REQ3_AUXILIARY0)) ;; "non-smoker" and "smoker" are mutually exclusive

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must be (a non-smoker OR a smoker of up to 10 cigarettes per day (smoker of greater than or equal to 1 cigarette per day AND smoker of less than or equal to 10 cigarettes per day)).
(assert
  (! (or patient_has_finding_of_non_smoker_now
         (and patient_has_finding_of_cigarette_smoker_now
              (>= patient_cigarette_smoker_value_recorded_now_withunit_cigarettes_per_day 1)
              (<= patient_cigarette_smoker_value_recorded_now_withunit_cigarettes_per_day 10)))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "a non-smoker OR a smoker of up to 10 cigarettes per day (smoker of greater than or equal to 1 cigarette per day AND smoker of less than or equal to 10 cigarettes per day)"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_finding_of_menstrual_bleeding_value_recorded_now_withunit_years Real) ;; "years since last spontaneous menstrual bleeding greater than or equal to 1 year AND years since last spontaneous menstrual bleeding less than or equal to 3 years" {"when_to_set_to_value":"Set to the number of years since the patient's last spontaneous menstrual bleeding, if this value is recorded now.","when_to_set_to_null":"Set to null if the number of years since last spontaneous menstrual bleeding is not recorded now or is indeterminate.","meaning":"Numeric value (in years) representing the time since the patient's last spontaneous menstrual bleeding, as of now."}
(declare-const patient_follicle_stimulating_hormone_measurement_value_recorded_now_withunit_international_units_per_milliliter Real) ;; "follicle-stimulating hormone concentration greater than 75 international units per milliliter" {"when_to_set_to_value":"Set to the measured value of follicle-stimulating hormone concentration (in international units per milliliter) if recorded now.","when_to_set_to_null":"Set to null if the FSH concentration is not recorded now or is indeterminate.","meaning":"Numeric value (in international units per milliliter) representing the patient's current follicle-stimulating hormone concentration."}
(declare-const patient_estradiol_measurement_value_recorded_now_withunit_nanograms_per_liter Real) ;; "17-estradiol concentration less than 20 nanograms per liter" {"when_to_set_to_value":"Set to the measured value of 17-estradiol concentration (in nanograms per liter) if recorded now.","when_to_set_to_null":"Set to null if the 17-estradiol concentration is not recorded now or is indeterminate.","meaning":"Numeric value (in nanograms per liter) representing the patient's current 17-estradiol concentration."}
(declare-const patient_has_postmenopausal_hormone_status_now Bool) ;; "postmenopausal hormone status defined as (years since last spontaneous menstrual bleeding greater than or equal to 1 year AND years since last spontaneous menstrual bleeding less than or equal to 3 years) AND follicle-stimulating hormone concentration greater than 75 international units per milliliter AND 17-estradiol concentration less than 20 nanograms per liter" {"when_to_set_to_true":"Set to true if the patient currently meets the definition of postmenopausal hormone status, specifically: years since last spontaneous menstrual bleeding is between 1 and 3 years inclusive, follicle-stimulating hormone concentration is greater than 75 international units per milliliter, and 17-estradiol concentration is less than 20 nanograms per liter.","when_to_set_to_false":"Set to false if the patient currently does not meet the definition of postmenopausal hormone status as specified above.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets the definition of postmenopausal hormone status as specified above.","meaning":"Boolean indicating whether the patient currently has postmenopausal hormone status as defined by the eligibility requirement."}

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition in the requirement: postmenopausal hormone status is defined by all three conditions
(assert
  (! (= patient_has_postmenopausal_hormone_status_now
        (and (>= patient_finding_of_menstrual_bleeding_value_recorded_now_withunit_years 1.0)
             (<= patient_finding_of_menstrual_bleeding_value_recorded_now_withunit_years 3.0)
             (> patient_follicle_stimulating_hormone_measurement_value_recorded_now_withunit_international_units_per_milliliter 75.0)
             (< patient_estradiol_measurement_value_recorded_now_withunit_nanograms_per_liter 20.0)))
     :named REQ4_AUXILIARY0)) ;; "postmenopausal hormone status defined as (years since last spontaneous menstrual bleeding greater than or equal to 1 year AND years since last spontaneous menstrual bleeding less than or equal to 3 years) AND follicle-stimulating hormone concentration greater than 75 international units per milliliter AND 17-estradiol concentration less than 20 nanograms per liter"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: years since last spontaneous menstrual bleeding between 1 and 3 years inclusive
(assert
  (! (and (>= patient_finding_of_menstrual_bleeding_value_recorded_now_withunit_years 1.0)
          (<= patient_finding_of_menstrual_bleeding_value_recorded_now_withunit_years 3.0))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "years since last spontaneous menstrual bleeding greater than or equal to 1 year AND years since last spontaneous menstrual bleeding less than or equal to 3 years"

;; Component 1: follicle-stimulating hormone concentration greater than 75 IU/mL
(assert
  (! (> patient_follicle_stimulating_hormone_measurement_value_recorded_now_withunit_international_units_per_milliliter 75.0)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "follicle-stimulating hormone concentration greater than 75 international units per milliliter"

;; Component 2: 17-estradiol concentration less than 20 ng/L
(assert
  (! (< patient_estradiol_measurement_value_recorded_now_withunit_nanograms_per_liter 20.0)
     :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "17-estradiol concentration less than 20 nanograms per liter"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_menopause_value_recorded_now_withunit_years Real) ;; "years since menopause" {"when_to_set_to_value":"Set to the number of years since the patient's menopause if this value is available and recorded now.","when_to_set_to_null":"Set to null if the number of years since menopause is unknown, not documented, or cannot be determined as of now.","meaning":"Numeric value (in years) representing the time elapsed since the patient's menopause, recorded now."}

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: "years since menopause greater than or equal to 1 year"
(assert
  (! (>= patient_menopause_value_recorded_now_withunit_years 1)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "years since menopause greater than or equal to 1 year"

;; Component 1: "years since menopause less than or equal to 3 years"
(assert
  (! (<= patient_menopause_value_recorded_now_withunit_years 3)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "years since menopause less than or equal to 3 years"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_normal_menopause_inthehistory Bool) ;; "had natural menopause" {"when_to_set_to_true":"Set to true if the patient has had natural menopause at any time in their history.","when_to_set_to_false":"Set to false if the patient has not had natural menopause at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had natural menopause in their history.","meaning":"Boolean indicating whether the patient has had natural menopause at any time in their history."}
(declare-const patient_has_undergone_total_abdominal_hysterectomy_with_bilateral_salpingo_oophorectomy_inthehistory Bool) ;; "had total hysterectomy with bilateral salpingo-oophorectomy" {"when_to_set_to_true":"Set to true if the patient has undergone total abdominal hysterectomy with bilateral salpingo-oophorectomy at any time in their history.","when_to_set_to_false":"Set to false if the patient has not undergone total abdominal hysterectomy with bilateral salpingo-oophorectomy at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone total abdominal hysterectomy with bilateral salpingo-oophorectomy in their history.","meaning":"Boolean indicating whether the patient has undergone total abdominal hysterectomy with bilateral salpingo-oophorectomy at any time in their history."}

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: To be included, the patient must have (had natural menopause OR had total hysterectomy with bilateral salpingo-oophorectomy).
(assert
  (! (or patient_has_finding_of_normal_menopause_inthehistory
         patient_has_undergone_total_abdominal_hysterectomy_with_bilateral_salpingo_oophorectomy_inthehistory)
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (had natural menopause OR had total hysterectomy with bilateral salpingo-oophorectomy)."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_estradiol_measurement_is_within_inclusion_criteria_range_now_withunit_nanograms_per_liter Bool) ;; "the patient has 17-estradiol results within the inclusion criteria range" {"when_to_set_to_true":"Set to true if the patient's current 17-estradiol measurement value (in nanograms per liter) is within the inclusion criteria range.","when_to_set_to_false":"Set to false if the patient's current 17-estradiol measurement value (in nanograms per liter) is not within the inclusion criteria range.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current 17-estradiol measurement value (in nanograms per liter) is within the inclusion criteria range.","meaning":"Boolean indicating whether the patient's current 17-estradiol measurement value (in nanograms per liter) is within the inclusion criteria range."}
(declare-const patient_will_be_assessed_on_individual_basis Bool) ;; "the patient will be assessed on an individual basis" {"when_to_set_to_true":"Set to true if the patient will be assessed on an individual basis for eligibility.","when_to_set_to_false":"Set to false if the patient will not be assessed on an individual basis for eligibility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will be assessed on an individual basis for eligibility.","meaning":"Boolean indicating whether the patient will be assessed on an individual basis for eligibility."}

;; ===================== Constraint Assertions (REQ 7) =====================
;; If (the patient has 17-estradiol results within the inclusion criteria range AND follicle-stimulating hormone concentration less than 75 IU/mL), the patient will be assessed on an individual basis.
(assert
  (! (=> (and patient_estradiol_measurement_is_within_inclusion_criteria_range_now_withunit_nanograms_per_liter
              (< patient_follicle_stimulating_hormone_measurement_value_recorded_now_withunit_international_units_per_milliliter 75))
         patient_will_be_assessed_on_individual_basis)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_is_assessed_as_age_related_healthy_based_on_pre_study_examination Bool) ;; "To be included, the patient must be assessed as age-related healthy (based on a pre-study examination...)" {"when_to_set_to_true":"Set to true if the patient is assessed as age-related healthy based on a pre-study examination.","when_to_set_to_false":"Set to false if the patient is not assessed as age-related healthy based on a pre-study examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is assessed as age-related healthy based on a pre-study examination.","meaning":"Boolean indicating whether the patient is assessed as age-related healthy based on a pre-study examination."}
(declare-const patient_is_assessed_as_age_related_healthy_based_on_pre_study_examination@@pre_study_examination_includes_medical_history_physical_examination_electrocardiogram_vital_signs_clinical_laboratory_examination Bool) ;; "pre-study examination including medical history, physical examination, electrocardiogram, vital signs, and clinical laboratory examination" {"when_to_set_to_true":"Set to true if the pre-study examination includes medical history, physical examination, electrocardiogram, vital signs, and clinical laboratory examination.","when_to_set_to_false":"Set to false if the pre-study examination does not include all of these components.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pre-study examination includes all of these components.","meaning":"Boolean indicating whether the pre-study examination includes medical history, physical examination, electrocardiogram, vital signs, and clinical laboratory examination."}
(declare-const patient_is_assessed_as_age_related_healthy_based_on_pre_study_examination@@performed_by_medical_doctor_at_study_site Bool) ;; "performed by a medical doctor at the study site" {"when_to_set_to_true":"Set to true if the pre-study examination was performed by a medical doctor at the study site.","when_to_set_to_false":"Set to false if the pre-study examination was not performed by a medical doctor at the study site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pre-study examination was performed by a medical doctor at the study site.","meaning":"Boolean indicating whether the pre-study examination was performed by a medical doctor at the study site."}
(declare-const patient_is_assessed_as_age_related_healthy_based_on_pre_study_examination@@performed_within_greater_than_or_equal_to_1_month_and_less_than_or_equal_to_2_months_prior_to_planned_study_start Bool) ;; "performed ... within greater than or equal to 1 month AND less than or equal to 2 months prior to planned study start" {"when_to_set_to_true":"Set to true if the pre-study examination was performed within greater than or equal to 1 month and less than or equal to 2 months prior to planned study start for the individual patient.","when_to_set_to_false":"Set to false if the pre-study examination was performed outside this window.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pre-study examination was performed within this window.","meaning":"Boolean indicating whether the pre-study examination was performed within greater than or equal to 1 month and less than or equal to 2 months prior to planned study start for the individual patient."}

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_is_assessed_as_age_related_healthy_based_on_pre_study_examination@@pre_study_examination_includes_medical_history_physical_examination_electrocardiogram_vital_signs_clinical_laboratory_examination
         patient_is_assessed_as_age_related_healthy_based_on_pre_study_examination)
     :named REQ8_AUXILIARY0)) ;; "pre-study examination including medical history, physical examination, electrocardiogram, vital signs, and clinical laboratory examination"

(assert
  (! (=> patient_is_assessed_as_age_related_healthy_based_on_pre_study_examination@@performed_by_medical_doctor_at_study_site
         patient_is_assessed_as_age_related_healthy_based_on_pre_study_examination)
     :named REQ8_AUXILIARY1)) ;; "performed by a medical doctor at the study site"

(assert
  (! (=> patient_is_assessed_as_age_related_healthy_based_on_pre_study_examination@@performed_within_greater_than_or_equal_to_1_month_and_less_than_or_equal_to_2_months_prior_to_planned_study_start
         patient_is_assessed_as_age_related_healthy_based_on_pre_study_examination)
     :named REQ8_AUXILIARY2)) ;; "performed ... within greater than or equal to 1 month AND less than or equal to 2 months prior to planned study start"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (and patient_is_assessed_as_age_related_healthy_based_on_pre_study_examination
          patient_is_assessed_as_age_related_healthy_based_on_pre_study_examination@@pre_study_examination_includes_medical_history_physical_examination_electrocardiogram_vital_signs_clinical_laboratory_examination
          patient_is_assessed_as_age_related_healthy_based_on_pre_study_examination@@performed_by_medical_doctor_at_study_site
          patient_is_assessed_as_age_related_healthy_based_on_pre_study_examination@@performed_within_greater_than_or_equal_to_1_month_and_less_than_or_equal_to_2_months_prior_to_planned_study_start)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be assessed as age-related healthy (based on a pre-study examination including medical history, physical examination, electrocardiogram, vital signs, and clinical laboratory examination, performed by a medical doctor at the study site within greater than or equal to 1 month AND less than or equal to 2 months prior to planned study start for the individual patient)."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_is_willing_to_give_written_informed_consent_now Bool) ;; "willingness to give written informed consent" {"when_to_set_to_true":"Set to true if the patient is currently willing to give written informed consent.","when_to_set_to_false":"Set to false if the patient is currently not willing to give written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to give written informed consent.","meaning":"Boolean indicating whether the patient is currently willing to give written informed consent."}
(declare-const patient_is_able_to_give_written_informed_consent_now Bool) ;; "ability to give written informed consent" {"when_to_set_to_true":"Set to true if the patient is currently able to give written informed consent.","when_to_set_to_false":"Set to false if the patient is currently not able to give written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to give written informed consent.","meaning":"Boolean indicating whether the patient is currently able to give written informed consent."}
(declare-const patient_is_willing_to_understand_study_requirements_now Bool) ;; "willingness to understand the study requirements" {"when_to_set_to_true":"Set to true if the patient is currently willing to understand the study requirements.","when_to_set_to_false":"Set to false if the patient is currently not willing to understand the study requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to understand the study requirements.","meaning":"Boolean indicating whether the patient is currently willing to understand the study requirements."}
(declare-const patient_is_willing_to_participate_in_study_now Bool) ;; "willingness to participate in the study" {"when_to_set_to_true":"Set to true if the patient is currently willing to participate in the study.","when_to_set_to_false":"Set to false if the patient is currently not willing to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to participate in the study.","meaning":"Boolean indicating whether the patient is currently willing to participate in the study."}
(declare-const patient_is_willing_to_comply_with_study_requirements_now Bool) ;; "willingness to comply with the study requirements" {"when_to_set_to_true":"Set to true if the patient is currently willing to comply with the study requirements.","when_to_set_to_false":"Set to false if the patient is currently not willing to comply with the study requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently willing to comply with the study requirements.","meaning":"Boolean indicating whether the patient is currently willing to comply with the study requirements."}
(declare-const patient_is_able_to_understand_study_requirements_now Bool) ;; "ability to understand the study requirements" {"when_to_set_to_true":"Set to true if the patient is currently able to understand the study requirements.","when_to_set_to_false":"Set to false if the patient is currently not able to understand the study requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to understand the study requirements.","meaning":"Boolean indicating whether the patient is currently able to understand the study requirements."}
(declare-const patient_is_able_to_participate_in_study_now Bool) ;; "ability to participate in the study" {"when_to_set_to_true":"Set to true if the patient is currently able to participate in the study.","when_to_set_to_false":"Set to false if the patient is currently not able to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to participate in the study.","meaning":"Boolean indicating whether the patient is currently able to participate in the study."}
(declare-const patient_is_able_to_comply_with_study_requirements_now Bool) ;; "ability to comply with the study requirements" {"when_to_set_to_true":"Set to true if the patient is currently able to comply with the study requirements.","when_to_set_to_false":"Set to false if the patient is currently not able to comply with the study requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to comply with the study requirements.","meaning":"Boolean indicating whether the patient is currently able to comply with the study requirements."}

;; ===================== Constraint Assertions (REQ 9) =====================
;; Component 0: willingness to give written informed consent
(assert
  (! patient_is_willing_to_give_written_informed_consent_now
     :named REQ9_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have willingness to give written informed consent."

;; Component 1: ability to give written informed consent
(assert
  (! patient_is_able_to_give_written_informed_consent_now
     :named REQ9_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have ability to give written informed consent."

;; Component 2: willingness to understand, to participate, and to comply with the study requirements
(assert
  (! (and patient_is_willing_to_understand_study_requirements_now
          patient_is_willing_to_participate_in_study_now
          patient_is_willing_to_comply_with_study_requirements_now)
     :named REQ9_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have willingness to understand, to participate, and to comply with the study requirements."

;; Component 3: ability to understand, to participate, and to comply with the study requirements
(assert
  (! (and patient_is_able_to_understand_study_requirements_now
          patient_is_able_to_participate_in_study_now
          patient_is_able_to_comply_with_study_requirements_now)
     :named REQ9_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have ability to understand, to participate, and to comply with the study requirements."

;; ===================== Declarations for the inclusion criterion (REQ 10) =====================
(declare-const patient_has_ability_to_understand_english_language Bool) ;; "the ability to understand the English language" {"when_to_set_to_true":"Set to true if the patient has the ability to understand the English language.","when_to_set_to_false":"Set to false if the patient does not have the ability to understand the English language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the ability to understand the English language.","meaning":"Boolean indicating whether the patient has the ability to understand the English language."}
(declare-const patient_has_ability_to_speak_english_language Bool) ;; "the ability to speak the English language" {"when_to_set_to_true":"Set to true if the patient has the ability to speak the English language.","when_to_set_to_false":"Set to false if the patient does not have the ability to speak the English language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the ability to speak the English language.","meaning":"Boolean indicating whether the patient has the ability to speak the English language."}
(declare-const patient_has_ability_to_read_english_language Bool) ;; "the ability to read the English language" {"when_to_set_to_true":"Set to true if the patient has the ability to read the English language.","when_to_set_to_false":"Set to false if the patient does not have the ability to read the English language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the ability to read the English language.","meaning":"Boolean indicating whether the patient has the ability to read the English language."}
(declare-const patient_has_ability_to_write_english_language Bool) ;; "the ability to write the English language" {"when_to_set_to_true":"Set to true if the patient has the ability to write the English language.","when_to_set_to_false":"Set to false if the patient does not have the ability to write the English language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has the ability to write the English language.","meaning":"Boolean indicating whether the patient has the ability to write the English language."}

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: Ability to understand English
(assert
  (! patient_has_ability_to_understand_english_language
     :named REQ10_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the ability to understand the English language"

;; Component 1: Ability to speak English
(assert
  (! patient_has_ability_to_speak_english_language
     :named REQ10_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the ability to speak the English language"

;; Component 2: Ability to read English
(assert
  (! patient_has_ability_to_read_english_language
     :named REQ10_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the ability to read the English language"

;; Component 3: Ability to write English
(assert
  (! patient_has_ability_to_write_english_language
     :named REQ10_COMPONENT3_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the ability to write the English language"
