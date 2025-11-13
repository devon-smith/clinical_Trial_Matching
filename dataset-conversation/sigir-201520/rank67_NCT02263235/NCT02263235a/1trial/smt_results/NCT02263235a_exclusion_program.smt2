;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_deprived_of_liberty_by_administrative_decision_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently deprived of liberty by administrative decision.","when_to_set_to_false":"Set to false if the patient is currently not deprived of liberty by administrative decision.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently deprived of liberty by administrative decision.","meaning":"Boolean indicating whether the patient is currently deprived of liberty by administrative decision."} ;; "the patient is deprived of liberty by administrative decision"
(declare-const patient_is_deprived_of_liberty_by_judicial_decision_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently deprived of liberty by judicial decision.","when_to_set_to_false":"Set to false if the patient is currently not deprived of liberty by judicial decision.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently deprived of liberty by judicial decision.","meaning":"Boolean indicating whether the patient is currently deprived of liberty by judicial decision."} ;; "the patient is deprived of liberty by judicial decision"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_deprived_of_liberty_by_judicial_decision_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is deprived of liberty by judicial decision."

(assert
(! (not patient_is_deprived_of_liberty_by_administrative_decision_now)
    :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is deprived of liberty by administrative decision."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_major_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a legal major (has reached the age of majority as defined by law).","when_to_set_to_false":"Set to false if the patient is currently not a legal major (has not reached the age of majority as defined by law).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a legal major.","meaning":"Boolean indicating whether the patient is currently a legal major."} ;; "the patient is a major"
(declare-const patient_is_major_now@@protected_by_law Bool) ;; {"when_to_set_to_true":"Set to true if the patient's status as a legal major is protected by law.","when_to_set_to_false":"Set to false if the patient's status as a legal major is not protected by law.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's status as a legal major is protected by law.","meaning":"Boolean indicating whether the patient's status as a legal major is protected by law."} ;; "the patient is a major protected by law"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_major_now@@protected_by_law
      patient_is_major_now)
   :named REQ1_AUXILIARY0)) ;; "protected by law" implies "major"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_major_now@@protected_by_law)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a major protected by law."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a woman of childbearing age and at risk of pregnancy.","when_to_set_to_false":"Set to false if the patient is not a woman of childbearing age or is not at risk of pregnancy.","when_to_set_to_null":"Set to null if it is unknown whether the patient has childbearing potential.","meaning":"Boolean value indicating whether the patient currently has childbearing potential (i.e., is a woman of childbearing age and at risk of pregnancy)."} ;; "the patient is a woman of childbearing age with risk of pregnancy"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently known not to be breast-feeding.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not (or patient_is_pregnant_now
              patient_has_childbearing_potential_now
              patient_is_breastfeeding_now))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is pregnant) OR (the patient is a woman of childbearing age with risk of pregnancy) OR (the patient is breast-feeding)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"
(declare-const patient_has_finding_of_hepatitis_b_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatitis B virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have hepatitis B virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatitis B virus infection.","meaning":"Boolean indicating whether the patient currently has hepatitis B virus infection."} ;; "hepatitis B virus infection"
(declare-const patient_has_finding_of_hepatitis_c_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatitis C virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have hepatitis C virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatitis C virus infection.","meaning":"Boolean indicating whether the patient currently has hepatitis C virus infection."} ;; "hepatitis C virus infection"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Exhaustive subcategories define the umbrella exactly:
;; "transmissible viral disease with exhaustive subcategories ((human immunodeficiency virus infection) OR (hepatitis B virus infection) OR (hepatitis C virus infection))."
(declare-const patient_has_finding_of_transmissible_viral_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any transmissible viral disease as defined by the exhaustive subcategories (HIV, hepatitis B, or hepatitis C).","when_to_set_to_false":"Set to false if the patient currently does not have any of the listed transmissible viral diseases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any of the listed transmissible viral diseases.","meaning":"Boolean indicating whether the patient currently has a transmissible viral disease as defined by the exhaustive subcategories (HIV, hepatitis B, or hepatitis C)."} ;; "transmissible viral disease (exhaustive: HIV, hepatitis B, hepatitis C)"

(assert
(! (= patient_has_finding_of_transmissible_viral_disease_now
     (or patient_has_finding_of_human_immunodeficiency_virus_infection_now
         patient_has_finding_of_hepatitis_b_virus_infection_now
         patient_has_finding_of_hepatitis_c_virus_infection_now))
:named REQ3_AUXILIARY0)) ;; "transmissible viral disease with exhaustive subcategories ((human immunodeficiency virus infection) OR (hepatitis B virus infection) OR (hepatitis C virus infection))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_human_immunodeficiency_virus_infection_now
      patient_has_finding_of_transmissible_viral_disease_now)
:named REQ3_AUXILIARY1)) ;; "human immunodeficiency virus infection is a transmissible viral disease"

(assert
(! (=> patient_has_finding_of_hepatitis_b_virus_infection_now
      patient_has_finding_of_transmissible_viral_disease_now)
:named REQ3_AUXILIARY2)) ;; "hepatitis B virus infection is a transmissible viral disease"

(assert
(! (=> patient_has_finding_of_hepatitis_c_virus_infection_now
      patient_has_finding_of_transmissible_viral_disease_now)
:named REQ3_AUXILIARY3)) ;; "hepatitis C virus infection is a transmissible viral disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_human_immunodeficiency_virus_infection_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has human immunodeficiency virus infection."

(assert
(! (not patient_has_finding_of_hepatitis_b_virus_infection_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hepatitis B virus infection."

(assert
(! (not patient_has_finding_of_hepatitis_c_virus_infection_now)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hepatitis C virus infection."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_undergoing_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently included in a clinical trial.","when_to_set_to_false":"Set to false if the patient is currently not included in a clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently included in a clinical trial.","meaning":"Boolean indicating whether the patient is currently included in a clinical trial."} ;; "clinical trial"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_undergoing_clinical_trial_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is included in a clinical trial."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_disorder_of_cardiac_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiac dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiac dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cardiac dysfunction.","meaning":"Boolean indicating whether the patient currently has cardiac dysfunction."} ;; "cardiac dysfunction"
(declare-const patient_has_finding_of_disorder_of_cardiac_function_now@@inadequate Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiac dysfunction is considered inadequate.","when_to_set_to_false":"Set to false if the patient's cardiac dysfunction is not considered inadequate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiac dysfunction is inadequate.","meaning":"Boolean indicating whether the patient's cardiac dysfunction is inadequate."} ;; "inadequate cardiac dysfunction"
(declare-const patient_has_finding_of_abnormal_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hepatic (liver) dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hepatic (liver) dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic (liver) dysfunction.","meaning":"Boolean indicating whether the patient currently has hepatic (liver) dysfunction."} ;; "hepatic dysfunction"
(declare-const patient_has_finding_of_abnormal_liver_function_now@@inadequate Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hepatic dysfunction is considered inadequate.","when_to_set_to_false":"Set to false if the patient's hepatic dysfunction is not considered inadequate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hepatic dysfunction is inadequate.","meaning":"Boolean indicating whether the patient's hepatic dysfunction is inadequate."} ;; "inadequate hepatic dysfunction"
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal (kidney) dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal (kidney) dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal (kidney) dysfunction.","meaning":"Boolean indicating whether the patient currently has renal (kidney) dysfunction."} ;; "renal dysfunction"
(declare-const patient_has_finding_of_renal_impairment_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal dysfunction is considered severe.","when_to_set_to_false":"Set to false if the patient's renal dysfunction is not considered severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's renal dysfunction is severe.","meaning":"Boolean indicating whether the patient's renal dysfunction is severe."} ;; "severe renal dysfunction"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disorder_of_cardiac_function_now@@inadequate
      patient_has_finding_of_disorder_of_cardiac_function_now)
   :named REQ5_AUXILIARY0)) ;; "inadequate cardiac dysfunction"

(assert
(! (=> patient_has_finding_of_abnormal_liver_function_now@@inadequate
      patient_has_finding_of_abnormal_liver_function_now)
   :named REQ5_AUXILIARY1)) ;; "inadequate hepatic dysfunction"

(assert
(! (=> patient_has_finding_of_renal_impairment_now@@severe
      patient_has_finding_of_renal_impairment_now)
   :named REQ5_AUXILIARY2)) ;; "severe renal dysfunction"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_disorder_of_cardiac_function_now@@inadequate)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inadequate cardiac dysfunction."

(assert
(! (not patient_has_finding_of_abnormal_liver_function_now@@inadequate)
   :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inadequate hepatic dysfunction."

(assert
(! (not patient_has_finding_of_renal_impairment_now@@severe)
   :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe renal dysfunction."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_disease_of_amino_acid_metabolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease of amino acid metabolism.","when_to_set_to_false":"Set to false if the patient currently does not have a disease of amino acid metabolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease of amino acid metabolism.","meaning":"Boolean indicating whether the patient currently has a disease of amino acid metabolism."} ;; "disease of amino acid metabolism"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive example: leucinose is an example of disease of amino acid metabolism
(declare-const patient_has_finding_of_leucinose_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has leucinose.","when_to_set_to_false":"Set to false if the patient currently does not have leucinose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has leucinose.","meaning":"Boolean indicating whether the patient currently has leucinose."} ;; "leucinose"
(assert
(! (=> patient_has_finding_of_leucinose_now
      patient_has_finding_of_disease_of_amino_acid_metabolism_now)
   :named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (leucinose)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_disease_of_amino_acid_metabolism_now)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a disease of amino acid metabolism with non-exhaustive examples (leucinose)."
