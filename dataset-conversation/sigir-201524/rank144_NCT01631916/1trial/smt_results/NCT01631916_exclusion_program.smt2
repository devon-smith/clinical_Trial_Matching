;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chronic_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chronic lung disease.","meaning":"Boolean indicating whether the patient currently has chronic lung disease."} ;; "pulmonary chronic disease"
(declare-const patient_has_finding_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of asthma.","meaning":"Boolean indicating whether the patient currently has asthma."} ;; "asthma"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_chronic_lung_disease_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pulmonary chronic disease."

(assert
  (! (not patient_has_finding_of_asthma_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has asthma."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_immunodeficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have an immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has an immunodeficiency disorder."} ;; "immunodeficiency"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_immunodeficiency_disorder_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has immunodeficiency."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease.","when_to_set_to_false":"Set to false if the patient currently does not have any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease.","meaning":"Boolean indicating whether the patient currently has any disease."} ;; "disease"
(declare-const patient_has_finding_of_disease_now@@requires_corticosteroid_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease and that disease requires corticosteroid therapy.","when_to_set_to_false":"Set to false if the patient currently has a disease but it does not require corticosteroid therapy, or if the patient does not have any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease requires corticosteroid therapy.","meaning":"Boolean indicating whether the patient's current disease requires corticosteroid therapy."} ;; "disease which requires corticosteroid therapy"
(declare-const patient_has_finding_of_rheumatic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has rheumatic disease.","when_to_set_to_false":"Set to false if the patient currently does not have rheumatic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has rheumatic disease.","meaning":"Boolean indicating whether the patient currently has rheumatic disease."} ;; "rheumatic disease"
(declare-const patient_has_finding_of_rheumatic_disease_now@@requires_corticosteroid_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has rheumatic disease and that disease requires corticosteroid therapy.","when_to_set_to_false":"Set to false if the patient currently has rheumatic disease but it does not require corticosteroid therapy, or if the patient does not have rheumatic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current rheumatic disease requires corticosteroid therapy.","meaning":"Boolean indicating whether the patient's current rheumatic disease requires corticosteroid therapy."} ;; "rheumatic disease which requires corticosteroid therapy"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive example: rheumatic disease requiring corticosteroid therapy implies umbrella
(assert
(! (=> patient_has_finding_of_rheumatic_disease_now@@requires_corticosteroid_therapy
      patient_has_finding_of_disease_now@@requires_corticosteroid_therapy)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (rheumatic disease)"

;; Qualifier variable implies corresponding stem variable (disease)
(assert
(! (=> patient_has_finding_of_disease_now@@requires_corticosteroid_therapy
      patient_has_finding_of_disease_now)
:named REQ2_AUXILIARY1)) ;; "disease which requires corticosteroid therapy"

;; Qualifier variable implies corresponding stem variable (rheumatic disease)
(assert
(! (=> patient_has_finding_of_rheumatic_disease_now@@requires_corticosteroid_therapy
      patient_has_finding_of_rheumatic_disease_now)
:named REQ2_AUXILIARY2)) ;; "rheumatic disease which requires corticosteroid therapy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_disease_now@@requires_corticosteroid_therapy)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a disease which requires corticosteroid therapy with non-exhaustive examples (rheumatic disease)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_wheezing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of wheezing.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of wheezing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of wheezing.","meaning":"Boolean indicating whether the patient currently has wheezing."} ;; "wheezing"
(declare-const patient_has_finding_of_wheezing_now@@occurs_in_current_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current wheezing occurs in the context of the current disease episode.","when_to_set_to_false":"Set to false if the patient's current wheezing does not occur in the context of the current disease episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current wheezing occurs in the context of the current disease episode.","meaning":"Boolean indicating whether the patient's current wheezing occurs in the context of the current disease episode."} ;; "wheezing in the current disease"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_wheezing_now@@occurs_in_current_disease
       patient_has_finding_of_wheezing_now)
   :named REQ3_AUXILIARY0)) ;; "wheezing in the current disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_wheezing_now@@occurs_in_current_disease)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has wheezing in the current disease."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_inpatient_stay_value_recorded_inthepast14days_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of inpatient stays (hospitalizations) the patient had in the 14 days prior to the current admission.","when_to_set_to_null":"Set to null if the number of inpatient stays in the 14 days prior to admission is unknown, not documented, or cannot be determined.","meaning":"Numeric count of inpatient stays (hospitalizations) the patient had in the 14 days prior to admission."} ;; "had ≥ 1 previous hospitalization within fourteen days prior to admission"

(declare-const patient_inpatient_stay_value_recorded_inthepast14days_withunit_count@@temporalcontext_within14days_prior_to_admission Bool) ;; {"when_to_set_to_true":"Set to true if the count of inpatient stays is specifically anchored to the 14 days prior to the current admission event.","when_to_set_to_false":"Set to false if the count is not anchored to the 14 days prior to admission.","when_to_set_to_null":"Set to null if it is unknown whether the count is anchored to the 14 days prior to admission.","meaning":"Boolean indicating whether the count of inpatient stays is anchored to the 14 days prior to the current admission event."} ;; "within fourteen days prior to admission"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_inpatient_stay_value_recorded_inthepast14days_withunit_count@@temporalcontext_within14days_prior_to_admission
             (>= patient_inpatient_stay_value_recorded_inthepast14days_withunit_count 1)))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient had ≥ 1 previous hospitalization within fourteen days prior to admission."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_pleural_effusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient had pleural effusion present at the time of admission.","when_to_set_to_false":"Set to false if the patient did not have pleural effusion present at the time of admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had pleural effusion present at the time of admission.","meaning":"Boolean indicating whether the patient had pleural effusion present at the time of admission."} ;; "pleural effusion on admission"
(declare-const patient_has_finding_of_pleural_effusion_now@@present_on_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pleural effusion was present at the time of admission.","when_to_set_to_false":"Set to false if the patient's pleural effusion was not present at the time of admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pleural effusion was present at the time of admission.","meaning":"Boolean indicating whether the patient's pleural effusion was present at the time of admission."} ;; "pleural effusion on admission"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_pleural_effusion_now@@present_on_admission
       patient_has_finding_of_pleural_effusion_now)
   :named REQ5_AUXILIARY0)) ;; "pleural effusion on admission"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_pleural_effusion_now@@present_on_admission)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pleural effusion on admission."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_malnutrition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malnutrition.","when_to_set_to_false":"Set to false if the patient currently does not have malnutrition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malnutrition.","meaning":"Boolean indicating whether the patient currently has malnutrition."} ;; "The patient is excluded if the patient has malnutrition."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_malnutrition_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malnutrition."
