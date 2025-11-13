;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_hypersensitivity_to_macrolide_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to macrolides.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity to macrolides.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to macrolides.","meaning":"Boolean indicating whether the patient has a known hypersensitivity to macrolides at any point in their medical history."} ;; "the patient has known hypersensitivity to macrolides"

(declare-const patient_has_intolerance_to_macrolide_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of intolerance to macrolides.","when_to_set_to_false":"Set to false if the patient does not have a documented history of intolerance to macrolides.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of intolerance to macrolides.","meaning":"Boolean indicating whether the patient has previously been intolerant of macrolides at any point in their medical history."} ;; "the patient has previously been intolerant of macrolides"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_hypersensitivity_to_macrolide_inthehistory)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to macrolides."

(assert
  (! (not patient_has_intolerance_to_macrolide_inthehistory)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously been intolerant of macrolides."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an illness.","when_to_set_to_false":"Set to false if the patient currently does not have an illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an illness.","meaning":"Boolean indicating whether the patient currently has an illness."} ;; "illness"
(declare-const patient_has_finding_of_illness_now@@severe_enough_to_warrant_hospitalization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current illness is severe enough to warrant hospitalization.","when_to_set_to_false":"Set to false if the patient's current illness is not severe enough to warrant hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current illness is severe enough to warrant hospitalization.","meaning":"Boolean indicating whether the patient's current illness is severe enough to warrant hospitalization."} ;; "illness severe enough to warrant hospitalization"
(declare-const patient_has_finding_of_illness_now@@severe_enough_to_warrant_parenteral_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current illness is severe enough to warrant parenteral therapy.","when_to_set_to_false":"Set to false if the patient's current illness is not severe enough to warrant parenteral therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current illness is severe enough to warrant parenteral therapy.","meaning":"Boolean indicating whether the patient's current illness is severe enough to warrant parenteral therapy."} ;; "illness severe enough to warrant parenteral therapy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_illness_now@@severe_enough_to_warrant_hospitalization
      patient_has_finding_of_illness_now)
   :named REQ1_AUXILIARY0)) ;; "illness severe enough to warrant hospitalization" implies "illness"

(assert
(! (=> patient_has_finding_of_illness_now@@severe_enough_to_warrant_parenteral_therapy
      patient_has_finding_of_illness_now)
   :named REQ1_AUXILIARY1)) ;; "illness severe enough to warrant parenteral therapy" implies "illness"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_illness_now@@severe_enough_to_warrant_hospitalization)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an illness severe enough to warrant hospitalization."

(assert
(! (not patient_has_finding_of_illness_now@@severe_enough_to_warrant_parenteral_therapy)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an illness severe enough to warrant parenteral therapy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (i.e., taking or using) any drug or medicament.","when_to_set_to_false":"Set to false if the patient is not currently exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} ;; "medication"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@specified_in_study_exclusion_list Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient is currently exposed is specified in the study exclusion list.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient is currently exposed is not specified in the study exclusion list.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is specified in the study exclusion list.","meaning":"Boolean indicating whether the drug or medicament to which the patient is currently exposed is specified in the study exclusion list."} ;; "medication specified in the study exclusion list"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@specified_in_study_exclusion_list
     patient_is_exposed_to_drug_or_medicament_now)
:named REQ2_AUXILIARY0)) ;; "medication specified in the study exclusion list" implies "medication"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_now@@specified_in_study_exclusion_list)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has concomitant use of any medication specified in the study exclusion list."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
;; No new variable declarations needed; all required variables are already declared.

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient is excluded if the patient uses at least one drug metabolized by cytochrome P450 3A isozyme with non-exhaustive examples (alprazolam, astemizole, carbamazepine, cilostazol, cisapride, cyclosporin, disopyramide, ergot alkaloids, lovastatin, methylprednisolone, midazolam, omeprazole, oral anticoagulants (with non-exhaustive examples (warfarin)), pimozide, quinidine, rifabutin, sildenafil, simvastatin, tacrolimus, terfenadine, triazolam, vinblastine).
(assert
(! (not patient_is_exposed_to_drug_or_medicament_now@@specified_in_study_exclusion_list)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses at least one drug metabolized by cytochrome P450 3A isozyme with non-exhaustive examples (alprazolam, astemizole, carbamazepine, cilostazol, cisapride, cyclosporin, disopyramide, ergot alkaloids, lovastatin, methylprednisolone, midazolam, omeprazole, oral anticoagulants (with non-exhaustive examples (warfarin)), pimozide, quinidine, rifabutin, sildenafil, simvastatin, tacrolimus, terfenadine, triazolam, vinblastine)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_exposed_to_cytochrome_p450_enzyme_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to at least one drug metabolized by isozymes within the cytochrome P450 enzyme system.","when_to_set_to_false":"Set to false if the patient is not currently exposed to any drug metabolized by isozymes within the cytochrome P450 enzyme system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to drugs metabolized by isozymes within the cytochrome P450 enzyme system.","meaning":"Boolean indicating whether the patient is currently exposed to the cytochrome P450 enzyme system."} ;; "cytochrome P450 enzyme system"
(declare-const patient_is_exposed_to_phenytoin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to phenytoin.","when_to_set_to_false":"Set to false if the patient is not currently exposed to phenytoin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to phenytoin.","meaning":"Boolean indicating whether the patient is currently exposed to phenytoin."} ;; "phenytoin"
(declare-const patient_is_exposed_to_theophylline_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to theophylline.","when_to_set_to_false":"Set to false if the patient is not currently exposed to theophylline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to theophylline.","meaning":"Boolean indicating whether the patient is currently exposed to theophylline."} ;; "theophylline"
(declare-const patient_is_exposed_to_valproate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to valproate.","when_to_set_to_false":"Set to false if the patient is not currently exposed to valproate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to valproate.","meaning":"Boolean indicating whether the patient is currently exposed to valproate."} ;; "valproate"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_exposed_to_phenytoin_now
           patient_is_exposed_to_theophylline_now
           patient_is_exposed_to_valproate_now)
       patient_is_exposed_to_cytochrome_p450_enzyme_now)
   :named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (phenytoin, theophylline, valproate)."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_exposed_to_cytochrome_p450_enzyme_now)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses at least one drug metabolized by other isozymes within the cytochrome P450 enzyme system with non-exhaustive examples (phenytoin, theophylline, valproate)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_taking_colchicine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing colchicine.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing colchicine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing colchicine.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing colchicine."} ;; "colchicine"
(declare-const patient_is_taking_digoxin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any medicinal product containing digoxin.","when_to_set_to_false":"Set to false if the patient is currently not taking any medicinal product containing digoxin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any medicinal product containing digoxin.","meaning":"Boolean indicating whether the patient is currently taking any medicinal product containing digoxin."} ;; "digoxin"
(declare-const patient_is_taking_antiretroviral_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any antiretroviral medication.","when_to_set_to_false":"Set to false if the patient is currently not taking any antiretroviral medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any antiretroviral medication.","meaning":"Boolean indicating whether the patient is currently taking any antiretroviral medication."} ;; "antiretroviral medications"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples: zidovudine, ritonavir are examples of antiretroviral medications
(declare-const patient_is_taking_zidovudine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking zidovudine.","when_to_set_to_false":"Set to false if the patient is currently not taking zidovudine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking zidovudine.","meaning":"Boolean indicating whether the patient is currently taking zidovudine."} ;; "zidovudine"
(declare-const patient_is_taking_ritonavir_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking ritonavir.","when_to_set_to_false":"Set to false if the patient is currently not taking ritonavir.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking ritonavir.","meaning":"Boolean indicating whether the patient is currently taking ritonavir."} ;; "ritonavir"

(assert
(! (=> (or patient_is_taking_zidovudine_now
           patient_is_taking_ritonavir_now)
       patient_is_taking_antiretroviral_medication_now)
   :named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (zidovudine, ritonavir)."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (or patient_is_taking_colchicine_containing_product_now
            patient_is_taking_digoxin_containing_product_now
            patient_is_taking_antiretroviral_medication_now))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses at least one of the following: colchicine, digoxin, or antiretroviral medications with non-exhaustive examples (zidovudine, ritonavir)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_immunodeficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have an immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has an immunodeficiency disorder."} ;; "immunodeficiency"
(declare-const patient_has_finding_of_immunodeficiency_disorder_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an immunodeficiency disorder and the disorder is severe.","when_to_set_to_false":"Set to false if the patient currently has an immunodeficiency disorder but the disorder is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunodeficiency disorder is severe.","meaning":"Boolean indicating whether the patient's current immunodeficiency disorder is severe."} ;; "severe immunodeficiency"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_immunodeficiency_disorder_now@@severity_severe
      patient_has_finding_of_immunodeficiency_disorder_now)
   :named REQ6_AUXILIARY0)) ;; "severe immunodeficiency" implies "immunodeficiency"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_immunodeficiency_disorder_now@@severity_severe)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe immunodeficiency."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one chronic disease condition.","when_to_set_to_false":"Set to false if the patient currently does not have any chronic disease condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any chronic disease condition.","meaning":"Boolean indicating whether the patient currently has a chronic disease condition."} ;; "chronic disease condition"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_chronic_disease_now)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has at least one chronic disease condition."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal impairment.","meaning":"Boolean indicating whether the patient currently has renal impairment."} ;; "renal impairment"
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of creatinine clearance (in milliliters per minute) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine clearance in milliliters per minute."} ;; "creatinine clearance under 30 milliliters per minute"
(declare-const patient_has_finding_of_hepatic_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic impairment.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic impairment.","meaning":"Boolean indicating whether the patient currently has hepatic impairment."} ;; "hepatic impairment"
(declare-const patient_aspartate_transaminase_level_value_recorded_now_withunit_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of aspartate aminotransferase (AST) level (in units per liter) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current aspartate aminotransferase (AST) level in units per liter."} ;; "aspartate aminotransferase level"
(declare-const normal_aspartate_aminotransferase_level_value_withunit_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the reference value for normal aspartate aminotransferase (AST) level in units per liter.","when_to_set_to_null":"Set to null if the normal reference value is not available or indeterminate.","meaning":"Numeric value representing the normal reference level for aspartate aminotransferase (AST) in units per liter."} ;; "normal aspartate aminotransferase level"
(declare-const patient_alanine_aminotransferase_value_recorded_now_withunit_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of alanine aminotransferase (ALT) level (in units per liter) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current alanine aminotransferase (ALT) level in units per liter."} ;; "alanine aminotransferase"
(declare-const normal_alanine_aminotransferase_level_value_withunit_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the reference value for normal alanine aminotransferase (ALT) level in units per liter.","when_to_set_to_null":"Set to null if the normal reference value is not available or indeterminate.","meaning":"Numeric value representing the normal reference level for alanine aminotransferase (ALT) in units per liter."} ;; "normal alanine aminotransferase level"
(declare-const patient_gamma_glutamyltransferase_value_recorded_now_withunit_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of gamma-glutamyltransferase (GGT) level (in units per liter) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current gamma-glutamyltransferase (GGT) level in units per liter."} ;; "gamma-glutamyltransferase"
(declare-const normal_gamma_glutamyltransferase_level_value_withunit_units_per_liter Real) ;; {"when_to_set_to_value":"Set to the reference value for normal gamma-glutamyltransferase (GGT) level in units per liter.","when_to_set_to_null":"Set to null if the normal reference value is not available or indeterminate.","meaning":"Numeric value representing the normal reference level for gamma-glutamyltransferase (GGT) in units per liter."} ;; "normal gamma-glutamyltransferase level"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: The patient is excluded if the patient has renal impairment defined as creatinine clearance under 30 milliliters per minute.
(assert
(! (not (and patient_has_finding_of_renal_impairment_now
             (< patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute 30)))
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal impairment defined as creatinine clearance under 30 milliliters per minute."

;; Exclusion: The patient is excluded if the patient has hepatic impairment defined as aspartate aminotransferase level equal to or more than 3 times higher than the normal level.
(assert
(! (not (and patient_has_finding_of_hepatic_impairment_now
             (>= patient_aspartate_transaminase_level_value_recorded_now_withunit_units_per_liter
                 (* 3 normal_aspartate_aminotransferase_level_value_withunit_units_per_liter))))
    :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hepatic impairment defined as aspartate aminotransferase level equal to or more than 3 times higher than the normal level."

;; Exclusion: The patient is excluded if the patient has hepatic impairment defined as alanine aminotransferase level equal to or more than 3 times higher than the normal level.
(assert
(! (not (and patient_has_finding_of_hepatic_impairment_now
             (>= patient_alanine_aminotransferase_value_recorded_now_withunit_units_per_liter
                 (* 3 normal_alanine_aminotransferase_level_value_withunit_units_per_liter))))
    :named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hepatic impairment defined as alanine aminotransferase level equal to or more than 3 times higher than the normal level."

;; Exclusion: The patient is excluded if the patient has hepatic impairment defined as gamma-glutamyltransferase level equal to or more than 3 times higher than the normal level.
(assert
(! (not (and patient_has_finding_of_hepatic_impairment_now
             (>= patient_gamma_glutamyltransferase_value_recorded_now_withunit_units_per_liter
                 (* 3 normal_gamma_glutamyltransferase_level_value_withunit_units_per_liter))))
    :named REQ8_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hepatic impairment defined as gamma-glutamyltransferase level equal to or more than 3 times higher than the normal level."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_mental_condition_rendering_unable_to_understand_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental condition that renders the patient unable to understand the nature of the study.","when_to_set_to_false":"Set to false if the patient currently does not have a mental condition that renders the patient unable to understand the nature of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental condition that renders the patient unable to understand the nature of the study.","meaning":"Boolean indicating whether the patient currently has a mental condition that renders the patient unable to understand the nature of the study."} ;; "has a mental condition rendering the patient unable to understand the nature of the study"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not patient_has_mental_condition_rendering_unable_to_understand_study_now)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a mental condition rendering the patient unable to understand the nature of the study."
