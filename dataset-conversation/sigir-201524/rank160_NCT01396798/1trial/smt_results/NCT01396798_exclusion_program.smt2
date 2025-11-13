;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_traumatic_injury_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a traumatic injury at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a traumatic injury at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a traumatic injury.","meaning":"Boolean indicating whether the patient has ever had a traumatic injury in their history."} ;; "trauma"
(declare-const patient_has_finding_of_traumatic_injury_inthehistory@@recent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's traumatic injury occurred recently (as defined by the study protocol or clinical context).","when_to_set_to_false":"Set to false if the patient's traumatic injury did not occur recently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the traumatic injury is recent.","meaning":"Boolean indicating whether the patient's traumatic injury is recent."} ;; "recent trauma"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_traumatic_injury_inthehistory@@recent
      patient_has_finding_of_traumatic_injury_inthehistory)
:named REQ0_AUXILIARY0)) ;; "recent trauma" implies "trauma"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_traumatic_injury_inthehistory@@recent)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recent trauma."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_disorder_of_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of disorder of the nervous system (neurological condition).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of disorder of the nervous system (neurological condition).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of disorder of the nervous system.","meaning":"Boolean indicating whether the patient currently has a disorder of the nervous system."} ;; "neurological condition"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_disorder_of_nervous_system_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a neurological condition."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_poisoning_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of poisoning (intoxication).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of poisoning (intoxication).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of poisoning (intoxication).","meaning":"Boolean indicating whether the patient currently has poisoning (intoxication) now."} ;; "intoxication"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_poisoning_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intoxication."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric (mental) disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a psychiatric (mental) disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a psychiatric (mental) disorder.","meaning":"Boolean indicating whether the patient currently has a psychiatric (mental) disorder."} ;; "psychiatric disorder"
(declare-const patient_has_finding_of_behavioural_disorder_without_somatic_cause_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a behavioural disorder and there is no somatic cause identified for the disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a behavioural disorder, or if any behavioural disorder present is explained by a somatic cause.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a behavioural disorder without a somatic cause.","meaning":"Boolean indicating whether the patient currently has a behavioural disorder that occurs without a somatic cause."} ;; "behavioural disorder without a somatic cause"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_has_finding_of_mental_disorder_now
            patient_has_finding_of_behavioural_disorder_without_somatic_cause_now))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a psychiatric disorder) OR (the patient has a behavioural disorder without a somatic cause)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic disease.","meaning":"Boolean indicating whether the patient currently has a chronic disease."} ;; "chronic condition"
(declare-const patient_has_finding_of_chronic_disease_now@@in_acute_exacerbation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic disease is currently in acute exacerbation.","when_to_set_to_false":"Set to false if the patient's chronic disease is currently not in acute exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic disease is in acute exacerbation.","meaning":"Boolean indicating whether the patient's chronic disease is in acute exacerbation."} ;; "acute exacerbation of a chronic condition"
(declare-const patient_has_finding_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has asthma.","when_to_set_to_false":"Set to false if the patient currently does not have asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has asthma.","meaning":"Boolean indicating whether the patient currently has asthma."} ;; "asthma"
(declare-const patient_has_finding_of_asthma_now@@in_acute_exacerbation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's asthma is currently in acute exacerbation.","when_to_set_to_false":"Set to false if the patient's asthma is currently not in acute exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's asthma is in acute exacerbation.","meaning":"Boolean indicating whether the patient's asthma is in acute exacerbation."} ;; "acute exacerbation of asthma"
(declare-const patient_has_finding_of_known_immunodeficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known immunodeficiency.","when_to_set_to_false":"Set to false if the patient currently does not have a known immunodeficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known immunodeficiency.","meaning":"Boolean indicating whether the patient currently has a known immunodeficiency."} ;; "known immunodeficiency"
(declare-const patient_has_finding_of_known_immunodeficiency_now@@in_acute_exacerbation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's known immunodeficiency is currently in acute exacerbation.","when_to_set_to_false":"Set to false if the patient's known immunodeficiency is currently not in acute exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's known immunodeficiency is in acute exacerbation.","meaning":"Boolean indicating whether the patient's known immunodeficiency is in acute exacerbation."} ;; "acute exacerbation of known immunodeficiency"
(declare-const patient_has_finding_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus."} ;; "diabetes mellitus"
(declare-const patient_has_finding_of_diabetes_mellitus_now@@in_acute_exacerbation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diabetes mellitus is currently in acute exacerbation.","when_to_set_to_false":"Set to false if the patient's diabetes mellitus is currently not in acute exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diabetes mellitus is in acute exacerbation.","meaning":"Boolean indicating whether the patient's diabetes mellitus is in acute exacerbation."} ;; "acute exacerbation of diabetes mellitus"
(declare-const patient_has_finding_of_cystic_fibrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cystic fibrosis.","when_to_set_to_false":"Set to false if the patient currently does not have cystic fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cystic fibrosis.","meaning":"Boolean indicating whether the patient currently has cystic fibrosis."} ;; "cystic fibrosis"
(declare-const patient_has_finding_of_cystic_fibrosis_now@@in_acute_exacerbation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cystic fibrosis is currently in acute exacerbation.","when_to_set_to_false":"Set to false if the patient's cystic fibrosis is currently not in acute exacerbation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cystic fibrosis is in acute exacerbation.","meaning":"Boolean indicating whether the patient's cystic fibrosis is in acute exacerbation."} ;; "acute exacerbation of cystic fibrosis"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_asthma_now@@in_acute_exacerbation
           patient_has_finding_of_known_immunodeficiency_now@@in_acute_exacerbation
           patient_has_finding_of_diabetes_mellitus_now@@in_acute_exacerbation
           patient_has_finding_of_cystic_fibrosis_now@@in_acute_exacerbation)
       patient_has_finding_of_chronic_disease_now@@in_acute_exacerbation)
   :named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (asthma, known immunodeficiency, diabetes mellitus, cystic fibrosis)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_chronic_disease_now@@in_acute_exacerbation
       patient_has_finding_of_chronic_disease_now)
   :named REQ4_AUXILIARY1)) ;; "acute exacerbation of a chronic condition"

(assert
(! (=> patient_has_finding_of_asthma_now@@in_acute_exacerbation
       patient_has_finding_of_asthma_now)
   :named REQ4_AUXILIARY2)) ;; "acute exacerbation of asthma"

(assert
(! (=> patient_has_finding_of_known_immunodeficiency_now@@in_acute_exacerbation
       patient_has_finding_of_known_immunodeficiency_now)
   :named REQ4_AUXILIARY3)) ;; "acute exacerbation of known immunodeficiency"

(assert
(! (=> patient_has_finding_of_diabetes_mellitus_now@@in_acute_exacerbation
       patient_has_finding_of_diabetes_mellitus_now)
   :named REQ4_AUXILIARY4)) ;; "acute exacerbation of diabetes mellitus"

(assert
(! (=> patient_has_finding_of_cystic_fibrosis_now@@in_acute_exacerbation
       patient_has_finding_of_cystic_fibrosis_now)
   :named REQ4_AUXILIARY5)) ;; "acute exacerbation of cystic fibrosis"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_chronic_disease_now@@in_acute_exacerbation)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an acute exacerbation of a chronic condition with non-exhaustive examples (asthma, known immunodeficiency, diabetes mellitus, cystic fibrosis)."
