;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_accepts_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently accepts informed consent.","when_to_set_to_false":"Set to false if the patient currently does not accept informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently accepts informed consent.","meaning":"Boolean indicating whether the patient currently accepts informed consent."} ;; "The patient is excluded if the patient does NOT accept informed consent."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_accepts_informed_consent_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT accept informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const antibiotic_therapy_duration_before_consultation_in_days Real) ;; {"when_to_set_to_value":"Set to the total number of days the patient received antibiotic therapy before the consultation, in integer days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days the patient received antibiotic therapy before the consultation.","meaning":"Numeric value representing the total number of days of antibiotic therapy received by the patient before the consultation, in days."} ;; "for more than two days before consultation"

(declare-const patient_has_undergone_antibiotic_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone antibiotic therapy at any time in the past, regardless of duration or timing relative to consultation.","when_to_set_to_false":"Set to false if the patient has never undergone antibiotic therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone antibiotic therapy in the past.","meaning":"Boolean indicating whether the patient has ever undergone antibiotic therapy at any time in the past."} ;; "treatment with antibiotics"

(declare-const patient_has_undergone_antibiotic_therapy_inthehistory@@received_for_more_than_two_days_before_consultation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antibiotic therapy and the therapy was received for more than two days before the consultation.","when_to_set_to_false":"Set to false if the patient has undergone antibiotic therapy but it was not received for more than two days before the consultation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibiotic therapy was received for more than two days before the consultation.","meaning":"Boolean indicating whether the patient's antibiotic therapy was received for more than two days before the consultation."} ;; "received treatment with antibiotics for more than two days before consultation"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: patient_has_undergone_antibiotic_therapy_inthehistory@@received_for_more_than_two_days_before_consultation
(assert
(! (= patient_has_undergone_antibiotic_therapy_inthehistory@@received_for_more_than_two_days_before_consultation
     (and patient_has_undergone_antibiotic_therapy_inthehistory
          (> antibiotic_therapy_duration_before_consultation_in_days 2)))
:named REQ1_AUXILIARY0)) ;; "has received treatment with antibiotics for more than two days before consultation"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_antibiotic_therapy_inthehistory@@received_for_more_than_two_days_before_consultation
      patient_has_undergone_antibiotic_therapy_inthehistory)
:named REQ1_AUXILIARY1)) ;; "received treatment with antibiotics for more than two days before consultation" implies "treatment with antibiotics"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_antibiotic_therapy_inthehistory@@received_for_more_than_two_days_before_consultation)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received treatment with antibiotics for more than two days before consultation."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_non_obstructive_pulmonary_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a non-obstructive pulmonary disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a non-obstructive pulmonary disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a non-obstructive pulmonary disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a non-obstructive pulmonary disorder."} ;; "non-obstructive pulmonary disorder"
(declare-const patient_has_diagnosis_of_bronchiectasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bronchiectasis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bronchiectasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bronchiectasis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bronchiectasis."} ;; "bronchiectasis"
(declare-const patient_has_diagnosis_of_interstitial_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of interstitial lung disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of interstitial lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of interstitial lung disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of interstitial lung disease."} ;; "interstitial lung disease"
(declare-const patient_has_diagnosis_of_pulmonary_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pulmonary hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pulmonary hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pulmonary hypertension.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pulmonary hypertension."} ;; "pulmonary hypertension"
(declare-const patient_has_diagnosis_of_pulmonary_hypertension_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pulmonary hypertension and it is severe.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of pulmonary hypertension and it is not severe, or if severity is explicitly documented as not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pulmonary hypertension is severe.","meaning":"Boolean indicating whether the patient's current pulmonary hypertension is severe."} ;; "severe pulmonary hypertension"
(declare-const patient_has_diagnosis_of_hypoventilation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypoventilation.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypoventilation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypoventilation.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypoventilation."} ;; "hypoventilation"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease."} ;; "chronic obstructive pulmonary disease"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_pulmonary_hypertension_now@@severe
      patient_has_diagnosis_of_pulmonary_hypertension_now)
    :named REQ2_AUXILIARY0)) ;; "severe pulmonary hypertension" implies "pulmonary hypertension"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have another known pulmonary entity other than chronic obstructive pulmonary disease,
;; with non-exhaustive examples (non-obstructive pulmonary disorder OR bronchiectasis OR interstitial lung disease OR severe pulmonary hypertension OR hypoventilation)
(assert
(! (not
      (and
        (not patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)
        (or patient_has_diagnosis_of_non_obstructive_pulmonary_disorder_now
            patient_has_diagnosis_of_bronchiectasis_now
            patient_has_diagnosis_of_interstitial_lung_disease_now
            patient_has_diagnosis_of_pulmonary_hypertension_now@@severe
            patient_has_diagnosis_of_hypoventilation_now)))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another known pulmonary entity other than chronic obstructive pulmonary disease with non-exhaustive examples ((non-obstructive pulmonary disorder) OR (bronchiectasis) OR (interstitial lung disease) OR (severe pulmonary hypertension) OR (hypoventilation))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a corticosteroid or corticosteroid derivative-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a corticosteroid or corticosteroid derivative-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a corticosteroid or corticosteroid derivative-containing product.","meaning":"Boolean indicating whether the patient is currently taking a corticosteroid or corticosteroid derivative-containing product."} ;; "corticosteroid"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@chronic_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a corticosteroid or corticosteroid derivative-containing product as part of chronic treatment.","when_to_set_to_false":"Set to false if the patient is currently taking a corticosteroid or corticosteroid derivative-containing product but not as part of chronic treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a corticosteroid or corticosteroid derivative-containing product as part of chronic treatment.","meaning":"Boolean indicating whether the patient is currently taking a corticosteroid or corticosteroid derivative-containing product as part of chronic treatment."} ;; "chronic treatment with oral corticosteroid"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@oral_route Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a corticosteroid or corticosteroid derivative-containing product via the oral route.","when_to_set_to_false":"Set to false if the patient is currently taking a corticosteroid or corticosteroid derivative-containing product but not via the oral route.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a corticosteroid or corticosteroid derivative-containing product via the oral route.","meaning":"Boolean indicating whether the patient is currently taking a corticosteroid or corticosteroid derivative-containing product via the oral route."} ;; "oral corticosteroid"
(declare-const patient_is_exposed_to_immunosuppressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to an immunosuppressant.","when_to_set_to_false":"Set to false if the patient is currently not exposed to an immunosuppressant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to an immunosuppressant.","meaning":"Boolean indicating whether the patient is currently exposed to an immunosuppressant."} ;; "immunosuppressive drug"
(declare-const patient_is_exposed_to_immunosuppressant_now@@chronic_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to an immunosuppressant as part of chronic treatment.","when_to_set_to_false":"Set to false if the patient is currently exposed to an immunosuppressant but not as part of chronic treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to an immunosuppressant as part of chronic treatment.","meaning":"Boolean indicating whether the patient is currently exposed to an immunosuppressant as part of chronic treatment."} ;; "chronic treatment with immunosuppressive drug"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@chronic_treatment
      patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
    :named REQ3_AUXILIARY0)) ;; "chronic treatment with oral corticosteroid"

(assert
(! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@oral_route
      patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
    :named REQ3_AUXILIARY1)) ;; "oral corticosteroid"

(assert
(! (=> patient_is_exposed_to_immunosuppressant_now@@chronic_treatment
      patient_is_exposed_to_immunosuppressant_now)
    :named REQ3_AUXILIARY2)) ;; "chronic treatment with immunosuppressive drug"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT be on chronic treatment with oral corticosteroid
(assert
(! (not (and patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@chronic_treatment
             patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@oral_route))
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on chronic treatment with oral corticosteroid."

;; Exclusion: patient must NOT be on chronic treatment with immunosuppressive drug
(assert
(! (not patient_is_exposed_to_immunosuppressant_now@@chronic_treatment)
    :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on chronic treatment with immunosuppressive drug."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_organ_comorbidity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any organ comorbidity.","when_to_set_to_false":"Set to false if the patient currently does not have any organ comorbidity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any organ comorbidity.","meaning":"Boolean indicating whether the patient currently has any organ comorbidity."} ;; "organ comorbidity"
(declare-const patient_has_finding_of_organ_comorbidity_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any organ comorbidity and the comorbidity is severe.","when_to_set_to_false":"Set to false if the patient currently has any organ comorbidity but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the organ comorbidity is severe.","meaning":"Boolean indicating whether the patient's organ comorbidity is severe."} ;; "severe organ comorbidity"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has malignant neoplastic disease (cancer)."} ;; "cancer"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@terminal_phase Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malignant neoplastic disease (cancer) and the disease is in terminal phase.","when_to_set_to_false":"Set to false if the patient currently has malignant neoplastic disease (cancer) but it is not in terminal phase.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant neoplastic disease (cancer) is in terminal phase.","meaning":"Boolean indicating whether the patient's malignant neoplastic disease (cancer) is in terminal phase."} ;; "cancer in terminal phase"
(declare-const patient_has_finding_of_tumor_of_advanced_extent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a tumor of advanced extent (cancer in advanced phase).","when_to_set_to_false":"Set to false if the patient currently does not have a tumor of advanced extent (cancer in advanced phase).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a tumor of advanced extent (cancer in advanced phase).","meaning":"Boolean indicating whether the patient currently has a tumor of advanced extent (cancer in advanced phase)."} ;; "cancer in advanced phase"
(declare-const patient_has_finding_of_pulmonary_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have pulmonary tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary tuberculosis.","meaning":"Boolean indicating whether the patient currently has pulmonary tuberculosis."} ;; "pulmonary tuberculosis"
(declare-const patient_has_finding_of_pulmonary_tuberculosis_now@@important_involvement Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonary tuberculosis and the disease has important involvement.","when_to_set_to_false":"Set to false if the patient currently has pulmonary tuberculosis but it does not have important involvement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pulmonary tuberculosis has important involvement.","meaning":"Boolean indicating whether the patient's pulmonary tuberculosis has important involvement."} ;; "pulmonary tuberculosis with important involvement"
(declare-const patient_has_finding_of_pneumoconiosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumoconiosis.","when_to_set_to_false":"Set to false if the patient currently does not have pneumoconiosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pneumoconiosis.","meaning":"Boolean indicating whether the patient currently has pneumoconiosis."} ;; "pneumoconiosis"
(declare-const patient_has_finding_of_pneumoconiosis_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumoconiosis and the disease is severe.","when_to_set_to_false":"Set to false if the patient currently has pneumoconiosis but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pneumoconiosis is severe.","meaning":"Boolean indicating whether the patient's pneumoconiosis is severe."} ;; "severe pneumoconiosis"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_tumor_of_advanced_extent_now
           patient_has_finding_of_malignant_neoplastic_disease_now@@terminal_phase
           patient_has_finding_of_pulmonary_tuberculosis_now@@important_involvement
           patient_has_finding_of_pneumoconiosis_now@@severe)
       patient_has_finding_of_organ_comorbidity_now@@severe)
   :named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples ((cancer in advanced phase) OR (cancer in terminal phase) OR (pulmonary tuberculosis with important involvement) OR (severe pneumoconiosis))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_organ_comorbidity_now@@severe
       patient_has_finding_of_organ_comorbidity_now)
   :named REQ4_AUXILIARY1)) ;; "severe organ comorbidity"

(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@terminal_phase
       patient_has_finding_of_malignant_neoplastic_disease_now)
   :named REQ4_AUXILIARY2)) ;; "cancer in terminal phase"

(assert
(! (=> patient_has_finding_of_pulmonary_tuberculosis_now@@important_involvement
       patient_has_finding_of_pulmonary_tuberculosis_now)
   :named REQ4_AUXILIARY3)) ;; "pulmonary tuberculosis with important involvement"

(assert
(! (=> patient_has_finding_of_pneumoconiosis_now@@severe
       patient_has_finding_of_pneumoconiosis_now)
   :named REQ4_AUXILIARY4)) ;; "severe pneumoconiosis"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_organ_comorbidity_now@@severe)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe organ comorbidity with non-exhaustive examples ((cancer in advanced phase) OR (cancer in terminal phase) OR (pulmonary tuberculosis with important involvement) OR (severe pneumoconiosis))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_alteration_in_nutrition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an alteration in nutritional status.","when_to_set_to_false":"Set to false if the patient currently does not have an alteration in nutritional status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an alteration in nutritional status.","meaning":"Boolean indicating whether the patient currently has an alteration in nutritional status."} ;; "alteration of nutritional status"
(declare-const patient_has_finding_of_alteration_in_nutrition_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's alteration in nutritional status is severe.","when_to_set_to_false":"Set to false if the patient's alteration in nutritional status is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the alteration in nutritional status is severe.","meaning":"Boolean indicating whether the patient's alteration in nutritional status is severe."} ;; "severe alteration of nutritional status"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_alteration_in_nutrition_now@@severity_severe
       patient_has_finding_of_alteration_in_nutrition_now)
   :named REQ5_AUXILIARY0)) ;; "severe alteration of nutritional status" implies "alteration of nutritional status"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_alteration_in_nutrition_now@@severity_severe)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe alteration of nutritional status."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart disease.","meaning":"Boolean indicating whether the patient currently has heart disease."} ;; "heart disease"
(declare-const patient_has_finding_of_heart_disease_now@@evolved Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current heart disease is evolved.","when_to_set_to_false":"Set to false if the patient's current heart disease is not evolved.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current heart disease is evolved.","meaning":"Boolean indicating whether the patient's current heart disease is evolved."} ;; "evolved heart disease"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_disease_now@@evolved
      patient_has_finding_of_heart_disease_now)
:named REQ6_AUXILIARY0)) ;; "evolved heart disease" implies "heart disease"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_heart_disease_now@@evolved)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evolved heart disease."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_akatamathesia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a limitation for understanding (akatamathesia).","when_to_set_to_false":"Set to false if the patient currently does not have a limitation for understanding (akatamathesia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a limitation for understanding (akatamathesia).","meaning":"Boolean indicating whether the patient currently has a limitation for understanding (akatamathesia)."} ;; "limitation for understanding"

(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric disorder (mental disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a psychiatric disorder (mental disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a psychiatric disorder (mental disorder).","meaning":"Boolean indicating whether the patient currently has a psychiatric disorder (mental disorder)."} ;; "psychiatric disorder"

(declare-const patient_has_finding_of_language_difficulty_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a language difficulty (language problem).","when_to_set_to_false":"Set to false if the patient currently does not have a language difficulty (language problem).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a language difficulty (language problem).","meaning":"Boolean indicating whether the patient currently has a language difficulty (language problem)."} ;; "language problem"

(declare-const patient_has_finding_of_social_difference_limiting_study_understanding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a social difference that limits their ability to understand the study.","when_to_set_to_false":"Set to false if the patient currently does not have a social difference that limits their ability to understand the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a social difference that limits their ability to understand the study.","meaning":"Boolean indicating whether the patient currently has a social difference that limits their ability to understand the study."} ;; "social difference"

(declare-const patient_has_finding_of_cultural_difference_limiting_study_understanding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cultural difference that limits their ability to understand the study.","when_to_set_to_false":"Set to false if the patient currently does not have a cultural difference that limits their ability to understand the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cultural difference that limits their ability to understand the study.","meaning":"Boolean indicating whether the patient currently has a cultural difference that limits their ability to understand the study."} ;; "cultural difference"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_mental_disorder_now
           patient_has_finding_of_language_difficulty_now
           patient_has_finding_of_social_difference_limiting_study_understanding_now
           patient_has_finding_of_cultural_difference_limiting_study_understanding_now)
       patient_has_finding_of_akatamathesia_now)
   :named REQ7_AUXILIARY0)) ;; "with non-exhaustive examples ((psychiatric disorder) OR (language problem) OR (social difference) OR (cultural difference))."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_akatamathesia_now)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a limitation for understanding the study with non-exhaustive examples ((psychiatric disorder) OR (language problem) OR (social difference) OR (cultural difference))."
