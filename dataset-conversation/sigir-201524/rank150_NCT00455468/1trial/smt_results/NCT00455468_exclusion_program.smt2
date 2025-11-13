;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pneumonia.","meaning":"Boolean indicating whether the patient currently has pneumonia."} ;; "pneumonia"
(declare-const patient_has_finding_of_pneumonia_now@@very_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumonia and the pneumonia is classified as very severe.","when_to_set_to_false":"Set to false if the patient currently has pneumonia but it is not classified as very severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pneumonia is very severe.","meaning":"Boolean indicating whether the patient's current pneumonia is very severe."} ;; "very severe pneumonia"
(declare-const patient_has_finding_of_pneumonia_now@@non_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pneumonia and the pneumonia is classified as non-severe.","when_to_set_to_false":"Set to false if the patient currently has pneumonia but it is not classified as non-severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pneumonia is non-severe.","meaning":"Boolean indicating whether the patient's current pneumonia is non-severe."} ;; "non-severe pneumonia"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_pneumonia_now@@very_severe
       patient_has_finding_of_pneumonia_now)
   :named REQ0_AUXILIARY0)) ;; "very severe pneumonia" implies "pneumonia"

(assert
(! (=> patient_has_finding_of_pneumonia_now@@non_severe
       patient_has_finding_of_pneumonia_now)
   :named REQ0_AUXILIARY1)) ;; "non-severe pneumonia" implies "pneumonia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_pneumonia_now@@very_severe)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has very severe pneumonia."

(assert
(! (not patient_has_finding_of_pneumonia_now@@non_severe)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has non-severe pneumonia."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hospital_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hospital-acquired (nosocomial) pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hospital-acquired (nosocomial) pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hospital-acquired (nosocomial) pneumonia.","meaning":"Boolean indicating whether the patient currently has hospital-acquired pneumonia."} ;; "nosocomial pneumonia"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_finding_of_hospital_acquired_pneumonia_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has nosocomial pneumonia."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const hours_since_last_antibiotic_for_pneumonia_prior_to_enrollment_value_recorded_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours since the patient last took antibiotics for pneumonia prior to enrollment, recorded in hours.","when_to_set_to_null":"Set to null if the number of hours since last antibiotic for pneumonia prior to enrollment is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of hours since the patient last took antibiotics for pneumonia prior to enrollment, in hours."} ;; "number of hours since the patient last took antibiotics for pneumonia prior to enrollment"

(declare-const patient_has_history_of_taking_antibiotics_for_pneumonia_within_48_hours_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of taking antibiotics for pneumonia within forty-eight hours prior to enrollment.","when_to_set_to_false":"Set to false if the patient does not have a documented history of taking antibiotics for pneumonia within forty-eight hours prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of taking antibiotics for pneumonia within forty-eight hours prior to enrollment.","meaning":"Boolean indicating whether the patient has a history of taking antibiotics for pneumonia within forty-eight hours prior to enrollment."} ;; "history of taking antibiotics for pneumonia within forty-eight hours prior to enrollment"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: patient has history of taking antibiotics for pneumonia within 48 hours prior to enrollment if and only if hours since last antibiotic for pneumonia prior to enrollment is less than or equal to 48
(assert
(! (= patient_has_history_of_taking_antibiotics_for_pneumonia_within_48_hours_prior_to_enrollment
    (<= hours_since_last_antibiotic_for_pneumonia_prior_to_enrollment_value_recorded_in_hours 48))
:named REQ2_AUXILIARY0)) ;; "has a history of taking antibiotics for pneumonia within forty-eight hours prior to enrollment"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_history_of_taking_antibiotics_for_pneumonia_within_48_hours_prior_to_enrollment)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of taking antibiotics for pneumonia within forty-eight hours prior to enrollment."

;; --- verifier-bypassed (attempt 8/8) 2025-10-25T04:55:26.466581 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic disease (including but not limited to tuberculosis).","when_to_set_to_false":"Set to false if the patient currently does not have a chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic disease.","meaning":"Boolean indicating whether the patient currently has a chronic disease."} ;; "chronic illness"

(declare-const patient_has_finding_of_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tuberculosis.","meaning":"Boolean indicating whether the patient currently has tuberculosis."} ;; "tuberculosis"

(declare-const patient_has_finding_of_cystic_fibrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of cystic fibrosis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of cystic fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cystic fibrosis.","meaning":"Boolean indicating whether the patient currently has cystic fibrosis."} ;; "cystic fibrosis"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term (chronic illness)
(assert
(! (=> patient_has_finding_of_tuberculosis_now
      patient_has_finding_of_chronic_disease_now)
    :named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (tuberculosis)"

(assert
(! (=> patient_has_finding_of_cystic_fibrosis_now
      patient_has_finding_of_chronic_disease_now)
    :named REQ3_AUXILIARY1)) ;; "with non-exhaustive examples (cystic fibrosis)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_chronic_disease_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic illness with non-exhaustive examples (tuberculosis)."

(assert
(! (not patient_has_finding_of_chronic_disease_now)
    :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic illness with non-exhaustive examples (cystic fibrosis)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_congenital_deformity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a congenital deformity.","when_to_set_to_false":"Set to false if the patient currently does not have a congenital deformity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a congenital deformity.","meaning":"Boolean indicating whether the patient currently has a congenital deformity."} ;; "congenital deformity"
(declare-const patient_has_finding_of_congenital_anomaly_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a congenital anomaly.","when_to_set_to_false":"Set to false if the patient currently does not have a congenital anomaly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a congenital anomaly.","meaning":"Boolean indicating whether the patient currently has a congenital anomaly."} ;; "congenital anomaly"
(declare-const patient_has_finding_of_congenital_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congenital heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have congenital heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congenital heart disease.","meaning":"Boolean indicating whether the patient currently has congenital heart disease."} ;; "congenital heart disease"
(declare-const patient_has_finding_of_downs_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Down's syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have Down's syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Down's syndrome.","meaning":"Boolean indicating whether the patient currently has Down's syndrome."} ;; "Down's syndrome"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive example: Down's syndrome implies congenital anomaly
(assert
(! (=> patient_has_finding_of_downs_syndrome_now
      patient_has_finding_of_congenital_anomaly_now)
    :named REQ4_AUXILIARY0)) ;; "congenital anomaly with non-exhaustive examples (Down's syndrome)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_congenital_deformity_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congenital deformity."

(assert
(! (not patient_has_finding_of_congenital_anomaly_now)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congenital anomaly with non-exhaustive examples (Down's syndrome)."

(assert
(! (not patient_has_finding_of_congenital_heart_disease_now)
    :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congenital heart disease."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_immunodeficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have an immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has an immunodeficiency disorder."} ;; "immunodeficiency"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_immunodeficiency_disorder_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has immunodeficiency."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_traumatic_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a traumatic injury (trauma).","when_to_set_to_false":"Set to false if the patient currently does not have a traumatic injury (trauma).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a traumatic injury (trauma).","meaning":"Boolean indicating whether the patient currently has a traumatic injury (trauma)."} ;; "trauma"
(declare-const patient_has_finding_of_burn_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a burn.","when_to_set_to_false":"Set to false if the patient currently does not have a burn.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a burn.","meaning":"Boolean indicating whether the patient currently has a burn."} ;; "burn"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_traumatic_injury_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has trauma."

(assert
(! (not patient_has_finding_of_burn_now)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has burn."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_bronchiolitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bronchiolitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bronchiolitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bronchiolitis.","meaning":"Boolean indicating whether the patient currently has bronchiolitis."} ;; "bronchiolitis"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_has_finding_of_bronchiolitis_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bronchiolitis."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma (including bronchial asthma).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "bronchial asthma"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not patient_has_diagnosis_of_asthma_now)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bronchial asthma."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_distance_from_institute_of_child_health_and_shishu_hospital_in_kilometers Real) ;; {"when_to_set_to_value":"Set to the patient's straight-line distance from Institute of Child Health and Shishu Hospital in kilometers.","when_to_set_to_null":"Set to null if the patient's distance from Institute of Child Health and Shishu Hospital is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's straight-line distance from Institute of Child Health and Shishu Hospital in kilometers."} ;; "distance from Institute of Child Health and Shishu Hospital"
(declare-const patient_distance_from_radda_clinic_in_kilometers Real) ;; {"when_to_set_to_value":"Set to the patient's straight-line distance from Radda Clinic in kilometers.","when_to_set_to_null":"Set to null if the patient's distance from Radda Clinic is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's straight-line distance from Radda Clinic in kilometers."} ;; "distance from Radda Clinic"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (or (> patient_distance_from_radda_clinic_in_kilometers 5)
            (> patient_distance_from_institute_of_child_health_and_shishu_hospital_in_kilometers 5)))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient lives outside a five kilometer radius from the respective study site (Radda Clinic OR Institute of Child Health and Shishu Hospital)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const parents_or_guardians_have_given_consent_for_patient_inclusion_in_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the parents or guardians of the patient have given consent for inclusion of the child in the study at the current time.","when_to_set_to_false":"Set to false if the parents or guardians of the patient have NOT given consent for inclusion of the child in the study at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the parents or guardians of the patient have given consent for inclusion of the child in the study at the current time.","meaning":"Boolean indicating whether the parents or guardians of the patient have given consent for inclusion of the child in the study at the current time."} ;; "the parents or guardians of the patient do NOT consent to inclusion of the child of the parents or guardians in the study"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not parents_or_guardians_have_given_consent_for_patient_inclusion_in_study_now)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the parents or guardians of the patient do NOT consent to inclusion of the child of the parents or guardians in the study."
