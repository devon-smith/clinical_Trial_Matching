;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_asthma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of asthma at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of asthma at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of asthma.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of asthma in their history."} ;; "the patient has a history of asthma"
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "the patient has a current diagnosis of asthma"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (or patient_has_diagnosis_of_asthma_inthehistory
              patient_has_diagnosis_of_asthma_now))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of asthma) OR (the patient has a current diagnosis of asthma)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an acute exacerbation of chronic obstructive pulmonary disease (COPD) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had an acute exacerbation of chronic obstructive pulmonary disease (COPD) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an acute exacerbation of chronic obstructive pulmonary disease (COPD).","meaning":"Boolean indicating whether the patient has ever had an acute exacerbation of chronic obstructive pulmonary disease (COPD) in the past."} ;; "acute chronic obstructive pulmonary disease exacerbation"
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_within3months_before_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the acute COPD exacerbation occurred within three months prior to Visit 1.","when_to_set_to_false":"Set to false if the acute COPD exacerbation did not occur within three months prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute COPD exacerbation occurred within three months prior to Visit 1.","meaning":"Boolean indicating whether the acute COPD exacerbation occurred within three months prior to Visit 1."} ;; "within three months prior to Visit 1"
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@resulted_in_hospitalization Bool) ;; {"when_to_set_to_true":"Set to true if the acute COPD exacerbation resulted in hospitalization.","when_to_set_to_false":"Set to false if the acute COPD exacerbation did not result in hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute COPD exacerbation resulted in hospitalization.","meaning":"Boolean indicating whether the acute COPD exacerbation resulted in hospitalization."} ;; "hospitalized for an acute chronic obstructive pulmonary disease exacerbation"
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@resulted_in_hospitalization@@temporalcontext_within3months_before_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an acute exacerbation of COPD that resulted in hospitalization and occurred within three months prior to Visit 1.","when_to_set_to_false":"Set to false if the patient has not had an acute exacerbation of COPD that resulted in hospitalization and occurred within three months prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an acute exacerbation of COPD that resulted in hospitalization and occurred within three months prior to Visit 1.","meaning":"Boolean indicating whether the patient has had an acute exacerbation of COPD that resulted in hospitalization and occurred within three months prior to Visit 1."} ;; "hospitalized for an acute chronic obstructive pulmonary disease exacerbation within three months prior to Visit 1"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_within3months_before_visit_1
      patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory)
:named REQ1_AUXILIARY0)) ;; "acute COPD exacerbation occurred within three months prior to Visit 1"

(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@resulted_in_hospitalization
      patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory)
:named REQ1_AUXILIARY1)) ;; "acute COPD exacerbation resulted in hospitalization"

(assert
(! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@resulted_in_hospitalization@@temporalcontext_within3months_before_visit_1
      (and patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@resulted_in_hospitalization
           patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_within3months_before_visit_1))
:named REQ1_AUXILIARY2)) ;; "hospitalized for an acute COPD exacerbation within three months prior to Visit 1"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@resulted_in_hospitalization@@temporalcontext_within3months_before_visit_1)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been hospitalized for an acute chronic obstructive pulmonary disease exacerbation within three months prior to Visit 1."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_respiratory_tract_infection_inthehistory@@temporalcontext_within6weeks_before_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had any respiratory tract infection within six weeks before Visit 1.","when_to_set_to_false":"Set to false if the patient has not had any respiratory tract infection within six weeks before Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had any respiratory tract infection within six weeks before Visit 1.","meaning":"Boolean indicating whether the patient has had any respiratory tract infection within six weeks before Visit 1."} ;; "the patient has had any respiratory tract infection within six weeks before Visit 1"

(declare-const patient_has_finding_of_upper_respiratory_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an upper respiratory tract infection at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had an upper respiratory tract infection at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an upper respiratory tract infection.","meaning":"Boolean indicating whether the patient has ever had an upper respiratory tract infection in the past."} ;; "upper respiratory tract infection"

(declare-const patient_has_finding_of_upper_respiratory_infection_inthehistory@@temporalcontext_within6weeks_before_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an upper respiratory tract infection within six weeks before Visit 1.","when_to_set_to_false":"Set to false if the patient has not had an upper respiratory tract infection within six weeks before Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an upper respiratory tract infection within six weeks before Visit 1.","meaning":"Boolean indicating whether the patient has had an upper respiratory tract infection within six weeks before Visit 1."} ;; "the patient has had any upper respiratory tract infection within six weeks before Visit 1"

(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_within6weeks_before_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an acute exacerbation of chronic obstructive pulmonary disease within six weeks before Visit 1.","when_to_set_to_false":"Set to false if the patient has not had an acute exacerbation of chronic obstructive pulmonary disease within six weeks before Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an acute exacerbation of chronic obstructive pulmonary disease within six weeks before Visit 1.","meaning":"Boolean indicating whether the patient has had an acute exacerbation of chronic obstructive pulmonary disease within six weeks before Visit 1."} ;; "the patient has had any chronic obstructive pulmonary disease exacerbation within six weeks before Visit 1"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable for upper respiratory tract infection
(assert
(! (=> patient_has_finding_of_upper_respiratory_infection_inthehistory@@temporalcontext_within6weeks_before_visit_1
       patient_has_finding_of_upper_respiratory_infection_inthehistory)
   :named REQ2_AUXILIARY0)) ;; "upper respiratory tract infection within six weeks before Visit 1" implies "upper respiratory tract infection ever"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_respiratory_tract_infection_inthehistory@@temporalcontext_within6weeks_before_visit_1)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had any respiratory tract infection within six weeks before Visit 1."

(assert
(! (not patient_has_finding_of_upper_respiratory_infection_inthehistory@@temporalcontext_within6weeks_before_visit_1)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had any upper respiratory tract infection within six weeks before Visit 1."

(assert
(! (not patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthehistory@@temporalcontext_within6weeks_before_visit_1)
   :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had any chronic obstructive pulmonary disease exacerbation within six weeks before Visit 1."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_clinically_significant_respiratory_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any clinically significant respiratory condition.","when_to_set_to_false":"Set to false if the patient currently does not have any clinically significant respiratory condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any clinically significant respiratory condition.","meaning":"Boolean indicating whether the patient currently has any clinically significant respiratory condition."} ;; "any clinically significant respiratory condition"
(declare-const patient_has_clinically_significant_respiratory_condition_now@@excluding_chronic_obstructive_pulmonary_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinically significant respiratory condition is not chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient's clinically significant respiratory condition is chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's clinically significant respiratory condition is chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient's clinically significant respiratory condition is not chronic obstructive pulmonary disease."} ;; "any clinically significant respiratory condition other than chronic obstructive pulmonary disease"
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic obstructive pulmonary disease (COPD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD).","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic obstructive pulmonary disease (COPD)."} ;; "chronic obstructive pulmonary disease"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_clinically_significant_respiratory_condition_now@@excluding_chronic_obstructive_pulmonary_disease
      patient_has_clinically_significant_respiratory_condition_now)
:named REQ3_AUXILIARY0)) ;; "any clinically significant respiratory condition other than chronic obstructive pulmonary disease"

;; Definition: Excluding COPD means clinically significant respiratory condition AND NOT COPD
(assert
(! (= patient_has_clinically_significant_respiratory_condition_now@@excluding_chronic_obstructive_pulmonary_disease
      (and patient_has_clinically_significant_respiratory_condition_now
           (not patient_has_diagnosis_of_chronic_obstructive_lung_disease_now)))
:named REQ3_AUXILIARY1)) ;; "other than chronic obstructive pulmonary disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_clinically_significant_respiratory_condition_now@@excluding_chronic_obstructive_pulmonary_disease)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any clinically significant respiratory condition other than chronic obstructive pulmonary disease."
