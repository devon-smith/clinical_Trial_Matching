;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_currently_taking_another_probiotic_regularly Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking another probiotic regularly.","when_to_set_to_false":"Set to false if the patient is not currently taking another probiotic regularly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking another probiotic regularly.","meaning":"Boolean indicating whether the patient is currently taking another probiotic regularly."} ;; "currently taking another probiotic regularly"
(declare-const probiotic_intake_frequency_per_week Real) ;; {"when_to_set_to_value":"Set to the number of times per week the patient is currently taking another probiotic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many times per week the patient is currently taking another probiotic.","meaning":"Numeric value indicating the frequency per week at which the patient is currently taking another probiotic."} ;; "frequency greater than or equal to two times per week"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (and patient_is_currently_taking_another_probiotic_regularly
               (>= probiotic_intake_frequency_per_week 2)))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently taking another probiotic regularly with frequency greater than or equal to two times per week."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_allergic_disposition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergic disposition (allergy).","when_to_set_to_false":"Set to false if the patient currently does not have an allergic disposition (allergy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergic disposition (allergy).","meaning":"Boolean indicating whether the patient currently has an allergic disposition."} ;; "allergic"
(declare-const patient_has_finding_of_allergic_disposition_now@@to_ingredients_in_the_probiotic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergic disposition is specifically to ingredients in the probiotic.","when_to_set_to_false":"Set to false if the patient's allergic disposition is not to ingredients in the probiotic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergic disposition is to ingredients in the probiotic.","meaning":"Boolean indicating whether the patient's allergic disposition is to ingredients in the probiotic."} ;; "allergic to ingredients in the probiotic"
(declare-const patient_has_finding_of_allergic_disposition_now@@to_ingredients_in_the_placebo Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergic disposition is specifically to ingredients in the placebo.","when_to_set_to_false":"Set to false if the patient's allergic disposition is not to ingredients in the placebo.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergic disposition is to ingredients in the placebo.","meaning":"Boolean indicating whether the patient's allergic disposition is to ingredients in the placebo."} ;; "allergic to ingredients in the placebo"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_allergic_disposition_now@@to_ingredients_in_the_probiotic
      patient_has_finding_of_allergic_disposition_now)
:named REQ1_AUXILIARY0)) ;; "allergic to ingredients in the probiotic"

(assert
(! (=> patient_has_finding_of_allergic_disposition_now@@to_ingredients_in_the_placebo
      patient_has_finding_of_allergic_disposition_now)
:named REQ1_AUXILIARY1)) ;; "allergic to ingredients in the placebo"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_allergic_disposition_now@@to_ingredients_in_the_probiotic)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is allergic to ingredients in the probiotic."

(assert
(! (not patient_has_finding_of_allergic_disposition_now@@to_ingredients_in_the_placebo)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is allergic to ingredients in the placebo."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_immunodeficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any form of immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have any form of immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any form of immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has any form of immunodeficiency disorder."} ;; "immune deficiency"
(declare-const patient_may_react_adversely_to_probiotic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient may react adversely to the probiotic at the current time.","when_to_set_to_false":"Set to false if the patient may not react adversely to the probiotic at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient may react adversely to the probiotic at the current time.","meaning":"Boolean indicating whether the patient may react adversely to the probiotic at the current time."} ;; "may react adversely to the probiotic"
(declare-const patient_has_finding_of_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any form of chronic disease.","when_to_set_to_false":"Set to false if the patient currently does not have any form of chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any form of chronic disease.","meaning":"Boolean indicating whether the patient currently has any form of chronic disease."} ;; "chronic disease"
(declare-const patient_has_finding_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any form of disorder of lung (pulmonary disease).","when_to_set_to_false":"Set to false if the patient currently does not have any form of disorder of lung (pulmonary disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any form of disorder of lung (pulmonary disease).","meaning":"Boolean indicating whether the patient currently has any form of disorder of lung (pulmonary disease)."} ;; "pulmonary disease"
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any form of kidney disease (renal disease).","when_to_set_to_false":"Set to false if the patient currently does not have any form of kidney disease (renal disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any form of kidney disease (renal disease).","meaning":"Boolean indicating whether the patient currently has any form of kidney disease (renal disease)."} ;; "renal disease"
(declare-const patient_has_finding_of_cardiac_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any form of cardiac disorder.","when_to_set_to_false":"Set to false if the patient currently does not have any form of cardiac disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any form of cardiac disorder.","meaning":"Boolean indicating whether the patient currently has any form of cardiac disorder."} ;; "cardiac disorder"
(declare-const patient_has_finding_of_cardiac_disorder_now@@underlying_structural_heart_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cardiac disorder is specifically an underlying structural heart disease.","when_to_set_to_false":"Set to false if the patient's current cardiac disorder is not specifically an underlying structural heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cardiac disorder is specifically an underlying structural heart disease.","meaning":"Boolean indicating whether the patient's current cardiac disorder is specifically an underlying structural heart disease."} ;; "underlying structural heart disease"
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any form of disorder of gastrointestinal tract (gastrointestinal disease).","when_to_set_to_false":"Set to false if the patient currently does not have any form of disorder of gastrointestinal tract (gastrointestinal disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any form of disorder of gastrointestinal tract (gastrointestinal disease).","meaning":"Boolean indicating whether the patient currently has any form of disorder of gastrointestinal tract (gastrointestinal disease)."} ;; "gastrointestinal disease"
(declare-const patient_has_finding_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus."} ;; "diabetes mellitus"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples: listed diseases imply chronic disease
(assert
(! (=> (or patient_has_finding_of_disorder_of_lung_now
          patient_has_finding_of_kidney_disease_now
          patient_has_finding_of_cardiac_disorder_now
          patient_has_finding_of_disorder_of_gastrointestinal_tract_now
          patient_has_finding_of_diabetes_mellitus_now)
     patient_has_finding_of_chronic_disease_now)
:named REQ2_AUXILIARY0)) ;; "chronic disease with non-exhaustive examples (pulmonary disease, renal disease, cardiac disorder, gastrointestinal disease, diabetes mellitus)"

;; Non-exhaustive example: underlying structural heart disease implies cardiac disorder
(assert
(! (=> patient_has_finding_of_cardiac_disorder_now@@underlying_structural_heart_disease
     patient_has_finding_of_cardiac_disorder_now)
:named REQ2_AUXILIARY1)) ;; "cardiac disorder with non-exhaustive examples (underlying structural heart disease)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_cardiac_disorder_now@@underlying_structural_heart_disease
     patient_has_finding_of_cardiac_disorder_now)
:named REQ2_AUXILIARY2)) ;; "underlying structural heart disease is a cardiac disorder"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 1: The patient may react adversely to the probiotic due to any form of immune deficiency
(assert
(! (not (and patient_may_react_adversely_to_probiotic_now
             patient_has_finding_of_immunodeficiency_disorder_now))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "may react adversely to the probiotic due to any form of immune deficiency"

;; Component 2: The patient may react adversely to the probiotic due to any form of chronic disease
(assert
(! (not (and patient_may_react_adversely_to_probiotic_now
             patient_has_finding_of_chronic_disease_now))
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "may react adversely to the probiotic due to any form of chronic disease"

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_proficient_english_speaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a proficient English speaker.","when_to_set_to_false":"Set to false if the patient is currently not a proficient English speaker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a proficient English speaker.","meaning":"Boolean indicating whether the patient is currently a proficient English speaker."} ;; "The patient is excluded if the patient is not a proficient English speaker."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_proficient_english_speaker_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is not a proficient English speaker."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_agrees_to_consent_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to the consent form.","when_to_set_to_false":"Set to false if the patient does not agree to the consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to the consent form.","meaning":"Boolean indicating whether the patient agrees to the consent form."} ;; "the patient does not agree to the consent form"
(declare-const patient_agrees_to_assent_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to the assent form.","when_to_set_to_false":"Set to false if the patient does not agree to the assent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to the assent form.","meaning":"Boolean indicating whether the patient agrees to the assent form."} ;; "the patient does not agree to the assent form"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_agrees_to_consent_form)
:named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient does not agree to the consent form."

(assert
(! (not patient_agrees_to_assent_form)
:named REQ4_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient does not agree to the assent form."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_undergoing_administration_of_antibiotic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing administration of antibiotics (i.e., is using antibiotics at the present time).","when_to_set_to_false":"Set to false if the patient is not currently undergoing administration of antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing administration of antibiotics.","meaning":"Boolean indicating whether the patient is currently undergoing administration of antibiotics."} ;; "uses antibiotics"
(declare-const patient_has_undergone_administration_of_antibiotic_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone administration of antibiotics at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone administration of antibiotics in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone administration of antibiotics in the past.","meaning":"Boolean indicating whether the patient has ever undergone administration of antibiotics in the past (history)."} ;; "used antibiotics"
(declare-const patient_has_undergone_administration_of_antibiotic_inthehistory@@temporalcontext_within1month_before_study_start Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone administration of antibiotics within one month prior to the study start.","when_to_set_to_false":"Set to false if the patient has not undergone administration of antibiotics within one month prior to the study start.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone administration of antibiotics within one month prior to the study start.","meaning":"Boolean indicating whether the patient has undergone administration of antibiotics within one month prior to the study start."} ;; "has used antibiotics within one month prior to the study start"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_administration_of_antibiotic_inthehistory@@temporalcontext_within1month_before_study_start
      patient_has_undergone_administration_of_antibiotic_inthehistory)
:named REQ5_AUXILIARY0)) ;; "has used antibiotics within one month prior to the study start" implies "used antibiotics"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (or patient_is_undergoing_administration_of_antibiotic_now
            patient_has_undergone_administration_of_antibiotic_inthehistory@@temporalcontext_within1month_before_study_start))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient uses antibiotics) OR (the patient has used antibiotics within one month prior to the study start)."
