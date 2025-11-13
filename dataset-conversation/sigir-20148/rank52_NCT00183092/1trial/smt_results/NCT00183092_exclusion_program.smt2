;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_history_of_significant_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or clinically determined history of any other significant disease not otherwise specified as a life-threatening disease (such as cancer, end-stage liver disease, end-stage renal disease, or severe heart disease).","when_to_set_to_false":"Set to false if the patient does not have a history of any other significant disease, as determined by clinical judgment or documentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of any other significant disease.","meaning":"Boolean indicating whether the patient has a history of any other significant disease, as determined by clinical judgment or documentation, excluding those already specified as life-threatening diseases."} ;; "The patient is excluded if the patient has a history of other significant disease."

(declare-const patient_has_history_of_life_threatening_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or clinically determined history of any other life-threatening disease, including but not limited to cancer, end-stage liver disease, end-stage renal disease, or severe heart disease.","when_to_set_to_false":"Set to false if the patient does not have a history of any other life-threatening disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of any other life-threatening disease.","meaning":"Boolean indicating whether the patient has a history of any other life-threatening disease, including but not limited to cancer, end-stage liver disease, end-stage renal disease, or severe heart disease."} ;; "The patient is excluded if the patient has a history of other life-threatening disease..."

(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malignant neoplastic disease (cancer) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malignant neoplastic disease (cancer) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of malignant neoplastic disease (cancer) in their history."} ;; "history of cancer"

(declare-const patient_has_diagnosis_of_end_stage_liver_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with end-stage liver disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with end-stage liver disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with end-stage liver disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of end-stage liver disease in their history."} ;; "history of end-stage liver disease"

(declare-const patient_has_diagnosis_of_end_stage_renal_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with end-stage renal disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with end-stage renal disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with end-stage renal disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of end-stage renal disease in their history."} ;; "history of end-stage renal disease"

(declare-const patient_has_diagnosis_of_heart_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with heart disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with heart disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with heart disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of heart disease in their history."} ;; "history of heart disease"

(declare-const patient_has_diagnosis_of_heart_disease_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of heart disease in their history and the heart disease is severe.","when_to_set_to_false":"Set to false if the patient has ever had a diagnosis of heart disease in their history but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the heart disease in the patient's history is severe.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of severe heart disease in their history."} ;; "history of severe heart disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term for life-threatening disease
(assert
(! (=> (or patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory
           patient_has_diagnosis_of_end_stage_liver_disease_inthehistory
           patient_has_diagnosis_of_end_stage_renal_disease_inthehistory
           patient_has_diagnosis_of_heart_disease_inthehistory@@severe)
        patient_has_history_of_life_threatening_disease)
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples ((the patient has a history of cancer) OR (the patient has a history of end-stage liver disease) OR (the patient has a history of end-stage renal disease) OR (the patient has a history of severe heart disease)))"

;; Qualifier variable implies corresponding stem variable for severe heart disease
(assert
(! (=> patient_has_diagnosis_of_heart_disease_inthehistory@@severe
       patient_has_diagnosis_of_heart_disease_inthehistory)
:named REQ0_AUXILIARY1)) ;; "history of severe heart disease" implies "history of heart disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_history_of_significant_disease)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of other significant disease."

(assert
(! (not patient_has_history_of_life_threatening_disease)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of other life-threatening disease with non-exhaustive examples..."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with any disease at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with any disease in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with any disease in their history.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of any disease in their history."} ;; "disease"
(declare-const patient_has_diagnosis_of_disease_inthehistory@@requires_regular_supportive_care Bool) ;; {"when_to_set_to_true":"Set to true if the disease diagnosed in the patient's history requires regular supportive care.","when_to_set_to_false":"Set to false if the disease diagnosed in the patient's history does not require regular supportive care.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease diagnosed in the patient's history requires regular supportive care.","meaning":"Boolean indicating whether the disease diagnosed in the patient's history requires regular supportive care."} ;; "requiring regular supportive care"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disease_inthehistory@@requires_regular_supportive_care
      patient_has_diagnosis_of_disease_inthehistory)
:named REQ1_AUXILIARY0)) ;; "requiring regular supportive care" implies "disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_disease_inthehistory@@requires_regular_supportive_care)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of other disease requiring regular supportive care."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_liver_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has liver disease.","meaning":"Boolean indicating whether the patient currently has liver disease."} ;; "The patient is excluded if the patient has liver disease."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_finding_of_liver_disease_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has liver disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_alcoholism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of alcoholism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of alcoholism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of alcoholism.","meaning":"Boolean indicating whether the patient currently has alcoholism."} ;; "alcoholism"
(declare-const patient_has_finding_of_alcoholism_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current alcoholism is active.","when_to_set_to_false":"Set to false if the patient's current alcoholism is not active (e.g., in remission, inactive, or resolved).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current alcoholism is active.","meaning":"Boolean indicating whether the patient's current alcoholism is active."} ;; "active alcoholism"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_alcoholism_now@@active
       patient_has_finding_of_alcoholism_now)
   :named REQ3_AUXILIARY0)) ;; "active alcoholism" implies "alcoholism"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_alcoholism_now@@active)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active alcoholism."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_myelosuppression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bone marrow suppression (myelosuppression).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bone marrow suppression (myelosuppression).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bone marrow suppression (myelosuppression).","meaning":"Boolean indicating whether the patient currently has bone marrow suppression (myelosuppression)."} ;; "bone marrow suppression"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_myelosuppression_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bone marrow suppression."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_low_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of low blood pressure (hypotension).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of low blood pressure (hypotension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of low blood pressure (hypotension).","meaning":"Boolean indicating whether the patient currently has low blood pressure (hypotension)."} ;; "hypotension"
(declare-const patient_has_finding_of_low_blood_pressure_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current low blood pressure (hypotension) is severe.","when_to_set_to_false":"Set to false if the patient's current low blood pressure (hypotension) is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current low blood pressure (hypotension) is severe.","meaning":"Boolean indicating whether the patient's current low blood pressure (hypotension) is severe."} ;; "severe hypotension"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_low_blood_pressure_now@@severe
      patient_has_finding_of_low_blood_pressure_now)
   :named REQ5_AUXILIARY0)) ;; "severe hypotension" (qualifier implies stem)

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_low_blood_pressure_now@@severe)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hypotension."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_psoriasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of psoriasis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of psoriasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of psoriasis.","meaning":"Boolean indicating whether the patient currently has psoriasis."} ;; "psoriasis"
(declare-const patient_has_finding_of_psoriasis_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has psoriasis and the psoriasis is severe.","when_to_set_to_false":"Set to false if the patient currently has psoriasis and the psoriasis is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's psoriasis is severe.","meaning":"Boolean indicating whether the patient's current psoriasis is severe."} ;; "severe psoriasis"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_psoriasis_now@@severe
      patient_has_finding_of_psoriasis_now)
   :named REQ6_AUXILIARY0)) ;; "severe psoriasis"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_psoriasis_now@@severe)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe psoriasis."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_diabetic_poor_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of poorly controlled diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of poorly controlled diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poorly controlled diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has poorly controlled diabetes mellitus."} ;; "poorly controlled diabetes mellitus"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_has_finding_of_diabetic_poor_control_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has poorly controlled diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is documented as currently not breast-feeding.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} ;; "the patient is a woman"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breast-feeding.","meaning":"Boolean indicating whether the patient is currently breast-feeding."} ;; "breast-feeding"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; "the patient is a woman who is pregnant" = "patient_sex_is_female_now AND patient_is_pregnant_now"
(assert
(! (= (and patient_sex_is_female_now patient_is_pregnant_now)
      (and patient_sex_is_female_now patient_is_pregnant_now))
    :named REQ8_AUXILIARY0)) ;; "the patient is a woman who is pregnant"

;; "the patient is a woman who is breast-feeding" = "patient_sex_is_female_now AND patient_is_breastfeeding_now"
(assert
(! (= (and patient_sex_is_female_now patient_is_breastfeeding_now)
      (and patient_sex_is_female_now patient_is_breastfeeding_now))
    :named REQ8_AUXILIARY1)) ;; "the patient is a woman who is breast-feeding"

;; Link: patients_breastfeeding_is_positive_now ≡ patient_is_breastfeeding_now
(assert
(! (= patients_breastfeeding_is_positive_now patient_is_breastfeeding_now)
    :named REQ8_AUXILIARY2)) ;; "breast-feeding"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient is a woman who is pregnant
(assert
(! (not (and patient_sex_is_female_now patient_is_pregnant_now))
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is pregnant."

;; Exclusion: patient is a woman who is breast-feeding
(assert
(! (not (and patient_sex_is_female_now patient_is_breastfeeding_now))
    :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is breast-feeding."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential, regardless of sex.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential, regardless of sex.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has childbearing potential.","meaning":"Boolean value indicating whether the patient currently has childbearing potential, regardless of sex."} ;; "childbearing age"
(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently practicing contraception.","when_to_set_to_false":"Set to false if the patient is currently not practicing contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently practicing contraception.","meaning":"Boolean indicating whether the patient is currently practicing contraception."} ;; "contraception"
(declare-const patient_has_finding_of_contraception_now@@reliable Bool) ;; {"when_to_set_to_true":"Set to true if the contraception being practiced by the patient is considered reliable.","when_to_set_to_false":"Set to false if the contraception being practiced by the patient is not considered reliable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraception being practiced by the patient is reliable.","meaning":"Boolean indicating whether the contraception being practiced by the patient is reliable."} ;; "reliable contraception"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently male.","when_to_set_to_false":"Set to false if the patient is currently not male.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently male.","meaning":"Boolean indicating whether the patient is currently male."} ;; "the patient is a man"
;; patient_sex_is_female_now is already declared and reused

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_contraception_now@@reliable
      patient_has_finding_of_contraception_now)
:named REQ9_AUXILIARY0)) ;; "contraception is reliable implies contraception is being practiced"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: (man of childbearing age not practicing reliable contraception) OR (woman of childbearing age not practicing reliable contraception)
(assert
(! (not (or
         (and patient_sex_is_male_now
              patient_has_childbearing_potential_now
              (not patient_has_finding_of_contraception_now@@reliable))
         (and patient_sex_is_female_now
              patient_has_childbearing_potential_now
              (not patient_has_finding_of_contraception_now@@reliable))))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a man of childbearing age who is not practicing reliable contraception) OR (the patient is a woman of childbearing age who is not practicing reliable contraception)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_allergy_to_quinacrine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to quinacrine.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to quinacrine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to quinacrine.","meaning":"Boolean indicating whether the patient currently has an allergy to quinacrine."} ;; "allergy to quinacrine"
(declare-const patient_has_finding_of_allergy_to_quinacrine_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current allergy to quinacrine is serious.","when_to_set_to_false":"Set to false if the patient's current allergy to quinacrine is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current allergy to quinacrine is serious.","meaning":"Boolean indicating whether the patient's current allergy to quinacrine is serious."} ;; "serious allergy to quinacrine"
(declare-const patient_has_finding_of_allergy_to_acridine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to acridine.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to acridine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to acridine.","meaning":"Boolean indicating whether the patient currently has an allergy to acridine."} ;; "allergy to acridine"
(declare-const patient_has_finding_of_allergy_to_acridine_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current allergy to acridine is serious.","when_to_set_to_false":"Set to false if the patient's current allergy to acridine is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current allergy to acridine is serious.","meaning":"Boolean indicating whether the patient's current allergy to acridine is serious."} ;; "serious allergy to acridine"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_allergy_to_quinacrine_now@@serious
       patient_has_finding_of_allergy_to_quinacrine_now)
   :named REQ10_AUXILIARY0)) ;; "serious allergy to quinacrine"

(assert
(! (=> patient_has_finding_of_allergy_to_acridine_now@@serious
       patient_has_finding_of_allergy_to_acridine_now)
   :named REQ10_AUXILIARY1)) ;; "serious allergy to acridine"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (or patient_has_finding_of_allergy_to_quinacrine_now@@serious
            patient_has_finding_of_allergy_to_acridine_now@@serious))
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a serious allergy to quinacrine) OR (the patient has a serious allergy to acridine)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_taking_quinacrine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a quinacrine-containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking a quinacrine-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a quinacrine-containing product.","meaning":"Boolean indicating whether the patient is currently taking a quinacrine-containing product."} ;; "current use of quinacrine"
(declare-const patient_has_taken_quinacrine_containing_product_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a quinacrine-containing product within the past six months.","when_to_set_to_false":"Set to false if the patient has not taken a quinacrine-containing product within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a quinacrine-containing product within the past six months.","meaning":"Boolean indicating whether the patient has taken a quinacrine-containing product within the past six months."} ;; "recent use of quinacrine within six months"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_taking_quinacrine_containing_product_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current use of quinacrine."

(assert
(! (not patient_has_taken_quinacrine_containing_product_inthepast6months)
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recent use of quinacrine within six months."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is less than eighteen years of age"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is less than eighteen years of age."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_quinacrine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any clinical finding that is a contraindication to quinacrine (excluding allergy to quinacrine).","when_to_set_to_false":"Set to false if the patient currently does not have any clinical finding that is a contraindication to quinacrine (excluding allergy to quinacrine).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication to quinacrine (excluding allergy).","meaning":"Boolean indicating whether the patient currently has any clinical finding that is a contraindication to quinacrine, other than allergy to quinacrine."} ;; "any other contraindication to taking quinacrine"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_finding_of_quinacrine_now)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other contraindication to taking quinacrine."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_prion_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had prion disease at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never had prion disease prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had prion disease prior to now.","meaning":"Boolean indicating whether the patient has ever had prion disease (any form) prior to now."} ;; "prion disease"

(declare-const patient_has_finding_of_prion_disease_inthehistory@@genetic_form Bool) ;; {"when_to_set_to_true":"Set to true if the prion disease present in the patient is a genetic form.","when_to_set_to_false":"Set to false if the prion disease present in the patient is not a genetic form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the prion disease is a genetic form.","meaning":"Boolean indicating whether the prion disease present in the patient is a genetic form."} ;; "genetic form of prion disease"

(declare-const patient_has_finding_of_prion_disease_inthehistory@@identified_prior_to_study_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the prion disease was identified before the patient enrolled in the study.","when_to_set_to_false":"Set to false if the prion disease was not identified before study enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the prion disease was identified prior to study enrollment.","meaning":"Boolean indicating whether the prion disease was identified prior to study enrollment."} ;; "identified prior to study enrollment"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_prion_disease_inthehistory@@genetic_form
      patient_has_finding_of_prion_disease_inthehistory)
:named REQ14_AUXILIARY0)) ;; "genetic form of prion disease"

(assert
(! (=> patient_has_finding_of_prion_disease_inthehistory@@identified_prior_to_study_enrollment
      patient_has_finding_of_prion_disease_inthehistory)
:named REQ14_AUXILIARY1)) ;; "identified prior to study enrollment"

;; ===================== Constraint Assertions (REQ 14) =====================
;; Exclusion: patient must NOT have a genetic form of prion disease identified prior to study enrollment
(assert
(! (not (and patient_has_finding_of_prion_disease_inthehistory@@genetic_form
             patient_has_finding_of_prion_disease_inthehistory@@identified_prior_to_study_enrollment))
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a genetic form of prion disease identified prior to study enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_is_exposed_to_antiarrhythmic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using or exposed to an antiarrhythmic agent.","when_to_set_to_false":"Set to false if the patient is not currently using or exposed to an antiarrhythmic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using or exposed to an antiarrhythmic agent.","meaning":"Boolean indicating whether the patient is currently exposed to (using/taking) an antiarrhythmic agent."} ;; "current use of anti-arrhythmic drug (at discretion of investigator)."

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_is_exposed_to_antiarrhythmic_agent_now)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current use of anti-arrhythmic drug (at discretion of investigator)."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_glucose_6_phosphate_dehydrogenase_deficiency_anemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has glucose-6-phosphate dehydrogenase deficiency anemia.","when_to_set_to_false":"Set to false if the patient currently does not have glucose-6-phosphate dehydrogenase deficiency anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has glucose-6-phosphate dehydrogenase deficiency anemia.","meaning":"Boolean indicating whether the patient currently has glucose-6-phosphate dehydrogenase deficiency anemia."} ;; "glucose-6-phosphate dehydrogenase deficiency"

(declare-const patient_has_finding_of_glucose_6_phosphate_dehydrogenase_deficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has glucose-6-phosphate dehydrogenase deficiency.","when_to_set_to_false":"Set to false if the patient currently does not have glucose-6-phosphate dehydrogenase deficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has glucose-6-phosphate dehydrogenase deficiency.","meaning":"Boolean indicating whether the patient currently has glucose-6-phosphate dehydrogenase deficiency."} ;; "glucose-6-phosphate dehydrogenase deficiency"

(declare-const patient_has_finding_of_glucose_6_phosphate_dehydrogenase_deficiency_now@@at_discretion_of_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the determination of glucose-6-phosphate dehydrogenase deficiency is made at the discretion of the investigator.","when_to_set_to_false":"Set to false if the determination of glucose-6-phosphate dehydrogenase deficiency is not made at the discretion of the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the determination is made at the discretion of the investigator.","meaning":"Boolean indicating whether the determination of glucose-6-phosphate dehydrogenase deficiency is made at the discretion of the investigator."} ;; "at discretion of investigator"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_glucose_6_phosphate_dehydrogenase_deficiency_now@@at_discretion_of_investigator
      patient_has_finding_of_glucose_6_phosphate_dehydrogenase_deficiency_now)
:named REQ16_AUXILIARY0)) ;; "at discretion of investigator"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_finding_of_glucose_6_phosphate_dehydrogenase_deficiency_now@@at_discretion_of_investigator)
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has glucose-6-phosphate dehydrogenase deficiency (at discretion of investigator)."
