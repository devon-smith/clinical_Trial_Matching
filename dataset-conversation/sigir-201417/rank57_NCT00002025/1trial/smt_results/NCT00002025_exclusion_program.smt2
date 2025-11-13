;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_cytomegalovirus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cytomegalovirus infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cytomegalovirus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cytomegalovirus infection.","meaning":"Boolean indicating whether the patient currently has cytomegalovirus infection."} ;; "cytomegalovirus disease"
(declare-const patient_meets_criteria_for_treatment_investigational_new_drug_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets the criteria for a treatment investigational new drug protocol.","when_to_set_to_false":"Set to false if the patient currently does not meet the criteria for a treatment investigational new drug protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets the criteria for a treatment investigational new drug protocol.","meaning":"Boolean indicating whether the patient currently meets the criteria for a treatment investigational new drug protocol."} ;; "meets the criteria for a treatment investigational new drug protocol"
(declare-const patient_meets_criteria_for_other_clinical_studies_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently meets the criteria for other clinical studies.","when_to_set_to_false":"Set to false if the patient currently does not meet the criteria for other clinical studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently meets the criteria for other clinical studies.","meaning":"Boolean indicating whether the patient currently meets the criteria for other clinical studies."} ;; "meets the criteria for other clinical studies"
(declare-const patient_has_finding_of_cytomegaloviral_retinitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cytomegaloviral retinitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cytomegaloviral retinitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cytomegaloviral retinitis.","meaning":"Boolean indicating whether the patient currently has cytomegaloviral retinitis."} ;; "cytomegalovirus retinitis"
(declare-const patient_has_finding_of_cytomegaloviral_retinitis_now@@located_in_peripheral_retina Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cytomegaloviral retinitis is located in the peripheral retina.","when_to_set_to_false":"Set to false if the patient's cytomegaloviral retinitis is not located in the peripheral retina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cytomegaloviral retinitis is located in the peripheral retina.","meaning":"Boolean indicating whether the patient's cytomegaloviral retinitis is located in the peripheral retina."} ;; "cytomegaloviral retinitis located in peripheral retina"
(declare-const patient_has_finding_of_aids_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acquired immunodeficiency syndrome (AIDS).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acquired immunodeficiency syndrome (AIDS).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acquired immunodeficiency syndrome (AIDS).","meaning":"Boolean indicating whether the patient currently has acquired immunodeficiency syndrome (AIDS)."} ;; "acquired immunodeficiency syndrome"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive example: controlled clinical studies of anticytomegalovirus therapy in peripheral cytomegalovirus retinitis in patients with AIDS implies "other clinical studies"
(assert
(! (=> (and patient_has_finding_of_cytomegaloviral_retinitis_now@@located_in_peripheral_retina
           patient_has_finding_of_aids_now)
       patient_meets_criteria_for_other_clinical_studies_now)
:named REQ0_AUXILIARY0)) ;; "controlled clinical studies of anticytomegalovirus therapy in peripheral cytomegalovirus retinitis in patients with acquired immunodeficiency syndrome" is a non-exhaustive example of other clinical studies

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_cytomegaloviral_retinitis_now@@located_in_peripheral_retina
       patient_has_finding_of_cytomegaloviral_retinitis_now)
:named REQ0_AUXILIARY1)) ;; "cytomegaloviral retinitis located in peripheral retina" implies "cytomegaloviral retinitis"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion 1: cytomegalovirus disease AND meets criteria for treatment investigational new drug protocol
(assert
(! (not (and patient_has_finding_of_cytomegalovirus_infection_now
             patient_meets_criteria_for_treatment_investigational_new_drug_protocol_now))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cytomegalovirus disease AND the patient meets the criteria for a treatment investigational new drug protocol."

;; Exclusion 2: cytomegalovirus disease AND meets criteria for other clinical studies (including non-exhaustive example)
(assert
(! (not (and patient_has_finding_of_cytomegalovirus_infection_now
             patient_meets_criteria_for_other_clinical_studies_now))
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cytomegalovirus disease AND the patient meets the criteria for other clinical studies with non-exhaustive examples (controlled clinical studies of anticytomegalovirus therapy in peripheral cytomegalovirus retinitis in patients with acquired immunodeficiency syndrome)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_mild_cytomegalovirus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has mild cytomegalovirus infection.","when_to_set_to_false":"Set to false if the patient currently does not have mild cytomegalovirus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has mild cytomegalovirus infection.","meaning":"Boolean indicating whether the patient currently has mild cytomegalovirus infection."} ;; "mild cytomegalovirus infection"
(declare-const patient_has_finding_of_moderate_cytomegalovirus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has moderate cytomegalovirus infection.","when_to_set_to_false":"Set to false if the patient currently does not have moderate cytomegalovirus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has moderate cytomegalovirus infection.","meaning":"Boolean indicating whether the patient currently has moderate cytomegalovirus infection."} ;; "moderate cytomegalovirus infection"
(declare-const patient_has_finding_of_cytomegalovirus_infection_now@@fails_to_meet_severity_criteria_not_immediately_life_threatening Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cytomegalovirus infection and fails to meet severity criteria, and the infection is not considered immediately life-threatening.","when_to_set_to_false":"Set to false if the patient currently has cytomegalovirus infection but does not fail to meet severity criteria, or the infection is considered immediately life-threatening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient fails to meet severity criteria or whether the infection is immediately life-threatening.","meaning":"Boolean indicating whether the patient currently has cytomegalovirus infection and fails to meet severity criteria, with the infection not considered immediately life-threatening."} ;; "fails to meet the severity criteria ... not considered immediately life-threatening"
(declare-const patient_has_finding_of_cytomegalovirus_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cytomegalovirus syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have cytomegalovirus syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cytomegalovirus syndrome.","meaning":"Boolean indicating whether the patient currently has cytomegalovirus syndrome."} ;; "cytomegalovirus syndrome"
(declare-const patient_has_finding_of_cytopenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cytopenia.","when_to_set_to_false":"Set to false if the patient currently does not have cytopenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cytopenia.","meaning":"Boolean indicating whether the patient currently has cytopenia."} ;; "cytopenia"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} ;; "fever"
(declare-const patient_liver_enzyme_level_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's liver enzyme level recorded now, in units of U/L.","when_to_set_to_null":"Set to null if the patient's liver enzyme level is not recorded now or the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's liver enzyme level recorded now, in units of U/L."} ;; "increased liver enzyme level"
(declare-const patient_viremia_value_recorded_now_withunit_copies_per_ml Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's viremia level recorded now, in units of copies/mL.","when_to_set_to_null":"Set to null if the patient's viremia level is not recorded now or the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's viremia level recorded now, in units of copies/mL."} ;; "viremia"
(declare-const patient_viruria_value_recorded_now_withunit_copies_per_ml Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's viruria level recorded now, in units of copies/mL.","when_to_set_to_null":"Set to null if the patient's viruria level is not recorded now or the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's viruria level recorded now, in units of copies/mL."} ;; "viruria"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples: cytomegalovirus syndrome is implied by any of the listed findings
(assert
(! (=> (or patient_has_finding_of_cytopenia_now
          (> patient_liver_enzyme_level_value_recorded_now_withunit_u_per_l 0) ;; "increased liver enzyme level" (presence of any elevation)
          patient_has_finding_of_fever_now
          (> patient_viremia_value_recorded_now_withunit_copies_per_ml 0)      ;; "viremia" (presence of any viremia)
          (> patient_viruria_value_recorded_now_withunit_copies_per_ml 0))     ;; "viruria" (presence of any viruria)
    patient_has_finding_of_cytomegalovirus_syndrome_now)
:named REQ1_AUXILIARY0)) ;; "cytomegalovirus syndrome with non-exhaustive examples (cytopenia, increased liver enzyme level, fever, viremia, viruria)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: mild cytomegalovirus infection
(assert
(! (not patient_has_finding_of_mild_cytomegalovirus_infection_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has mild cytomegalovirus infection."

;; Exclusion: moderate cytomegalovirus infection AND fails to meet severity criteria (not immediately life-threatening)
(assert
(! (not (and patient_has_finding_of_moderate_cytomegalovirus_infection_now
             patient_has_finding_of_cytomegalovirus_infection_now@@fails_to_meet_severity_criteria_not_immediately_life_threatening))
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has moderate cytomegalovirus infection AND the patient fails to meet the severity criteria ... not considered immediately life-threatening."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_transplant_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a transplant patient (i.e., has undergone a transplant and is considered a transplant recipient at present).","when_to_set_to_false":"Set to false if the patient is not currently a transplant patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a transplant patient.","meaning":"Boolean indicating whether the patient is currently a transplant patient."} ;; "transplant patient"
(declare-const patient_can_undergo_immunosuppressive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if a trial reduction of immunosuppressive drug treatment is currently feasible for the patient.","when_to_set_to_false":"Set to false if a trial reduction of immunosuppressive drug treatment is not currently feasible for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a trial reduction of immunosuppressive drug treatment is currently feasible for the patient.","meaning":"Boolean indicating whether a trial reduction of immunosuppressive drug treatment is currently feasible for the patient."} ;; "trial reduction of immunosuppressive drug treatment is feasible for the patient"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and patient_has_finding_of_transplant_present_now
             patient_can_undergo_immunosuppressive_therapy_now))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a transplant patient) AND (trial reduction of immunosuppressive drug treatment is feasible for the patient)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is a child"

(declare-const patient_has_finding_of_congenital_cytomegalovirus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congenital cytomegalovirus infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congenital cytomegalovirus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congenital cytomegalovirus infection.","meaning":"Boolean indicating whether the patient currently has congenital cytomegalovirus infection."} ;; "congenital cytomegalovirus infection"

(declare-const patient_has_finding_of_congenital_cytomegalovirus_infection_now@@patient_is_a_child Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a child.","when_to_set_to_false":"Set to false if the patient is not a child.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a child.","meaning":"Boolean indicating whether the patient is a child."} ;; "the patient is a child with congenital cytomegalovirus infection"

(declare-const patient_has_finding_of_neonatal_cytomegalovirus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of neonatal cytomegalovirus infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of neonatal cytomegalovirus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has neonatal cytomegalovirus infection.","meaning":"Boolean indicating whether the patient currently has neonatal cytomegalovirus infection."} ;; "neonatal cytomegalovirus infection"

(declare-const patient_has_finding_of_primary_immune_deficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of primary immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of primary immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has primary immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has primary immunodeficiency disorder."} ;; "primary immunodeficiency"

(declare-const patient_has_finding_of_primary_immune_deficiency_disorder_now@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's primary immunodeficiency disorder is documented.","when_to_set_to_false":"Set to false if the patient's primary immunodeficiency disorder is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's primary immunodeficiency disorder is documented.","meaning":"Boolean indicating whether the patient's primary immunodeficiency disorder is documented."} ;; "documented primary immunodeficiency"

(declare-const patient_has_finding_of_immunodeficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has immunodeficiency disorder."} ;; "immunodeficiency"

(declare-const patient_has_finding_of_immunodeficiency_disorder_now@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's immunodeficiency disorder is documented.","when_to_set_to_false":"Set to false if the patient's immunodeficiency disorder is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's immunodeficiency disorder is documented.","meaning":"Boolean indicating whether the patient's immunodeficiency disorder is documented."} ;; "documented immunodeficiency"

(declare-const patient_has_finding_of_immunodeficiency_disorder_now@@acquired Bool) ;; {"when_to_set_to_true":"Set to true if the patient's immunodeficiency disorder is acquired.","when_to_set_to_false":"Set to false if the patient's immunodeficiency disorder is not acquired.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's immunodeficiency disorder is acquired.","meaning":"Boolean indicating whether the patient's immunodeficiency disorder is acquired."} ;; "acquired immunodeficiency"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable for congenital CMV infection: patient is a child
(assert
(! (=> patient_has_finding_of_congenital_cytomegalovirus_infection_now@@patient_is_a_child
      patient_has_finding_of_congenital_cytomegalovirus_infection_now)
    :named REQ3_AUXILIARY0)) ;; "the patient is a child with congenital cytomegalovirus infection"

;; Qualifier variable for documented primary immunodeficiency
(assert
(! (=> patient_has_finding_of_primary_immune_deficiency_disorder_now@@documented
      patient_has_finding_of_primary_immune_deficiency_disorder_now)
    :named REQ3_AUXILIARY1)) ;; "documented primary immunodeficiency"

;; Qualifier variable for documented immunodeficiency
(assert
(! (=> patient_has_finding_of_immunodeficiency_disorder_now@@documented
      patient_has_finding_of_immunodeficiency_disorder_now)
    :named REQ3_AUXILIARY2)) ;; "documented immunodeficiency"

;; Qualifier variable for acquired immunodeficiency
(assert
(! (=> patient_has_finding_of_immunodeficiency_disorder_now@@acquired
      patient_has_finding_of_immunodeficiency_disorder_now)
    :named REQ3_AUXILIARY3)) ;; "acquired immunodeficiency"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: The patient is excluded if the patient is a child with congenital cytomegalovirus infection.
(assert
(! (not patient_has_finding_of_congenital_cytomegalovirus_infection_now@@patient_is_a_child)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a child with congenital cytomegalovirus infection."

;; Component 1: The patient is excluded if the patient is a child with neonatal cytomegalovirus infection AND (the patient does NOT have a documented primary immunodeficiency OR the patient does NOT have a documented acquired immunodeficiency).
(assert
(! (not (and
          patient_has_finding_of_neonatal_cytomegalovirus_infection_now
          (< patient_age_value_recorded_now_in_years 18) ;; "the patient is a child"
          (or
            (not patient_has_finding_of_primary_immune_deficiency_disorder_now@@documented) ;; "does NOT have a documented primary immunodeficiency"
            (not (and patient_has_finding_of_immunodeficiency_disorder_now@@documented
                      patient_has_finding_of_immunodeficiency_disorder_now@@acquired)) ;; "does NOT have a documented acquired immunodeficiency"
          )
        ))
    :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a child with neonatal cytomegalovirus infection AND (the patient does NOT have a documented primary immunodeficiency OR the patient does NOT have a documented acquired immunodeficiency)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_allergy_to_acyclovir_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity (allergy) to acyclovir.","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity (allergy) to acyclovir.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity (allergy) to acyclovir.","meaning":"Boolean indicating whether the patient currently has hypersensitivity (allergy) to acyclovir."} ;; "hypersensitivity to acyclovir"
(declare-const patient_has_finding_of_allergy_to_ganciclovir_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity (allergy) to ganciclovir.","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity (allergy) to ganciclovir.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity (allergy) to ganciclovir.","meaning":"Boolean indicating whether the patient currently has hypersensitivity (allergy) to ganciclovir."} ;; "hypersensitivity to ganciclovir"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_finding_of_allergy_to_acyclovir_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to acyclovir."

(assert
  (! (not patient_has_finding_of_allergy_to_ganciclovir_now)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to ganciclovir."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_receiving_antimetabolite_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving antimetabolite treatment.","when_to_set_to_false":"Set to false if the patient is not currently receiving antimetabolite treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving antimetabolite treatment.","meaning":"Boolean indicating whether the patient is currently receiving antimetabolite treatment."} ;; "the patient is receiving antimetabolite treatment"
(declare-const antimetabolite_treatment_cannot_be_discontinued_for_patient Bool) ;; {"when_to_set_to_true":"Set to true if antimetabolite treatment cannot be discontinued for the patient.","when_to_set_to_false":"Set to false if antimetabolite treatment can be discontinued for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether antimetabolite treatment can be discontinued for the patient.","meaning":"Boolean indicating whether antimetabolite treatment cannot be discontinued for the patient."} ;; "antimetabolite treatment cannot be discontinued for the patient"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and patient_is_receiving_antimetabolite_treatment_now
             antimetabolite_treatment_cannot_be_discontinued_for_patient))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is receiving antimetabolite treatment) AND (antimetabolite treatment cannot be discontinued for the patient)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_taking_alkylating_agent_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any alkylating agent containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any alkylating agent containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any alkylating agent containing product.","meaning":"Boolean indicating whether the patient is currently taking an alkylating agent containing product."} ;; "alkylating agent medication"

(declare-const patient_is_taking_nucleoside_analog_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any nucleoside analog containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any nucleoside analog containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any nucleoside analog containing product.","meaning":"Boolean indicating whether the patient is currently taking a nucleoside analog containing product."} ;; "nucleoside analog medication"

(declare-const patient_is_taking_nucleoside_analog_containing_product_now@@not_topical_ophthalmic_medication Bool) ;; {"when_to_set_to_true":"Set to true if the nucleoside analog containing product being taken is not a topical ophthalmic medication.","when_to_set_to_false":"Set to false if the nucleoside analog containing product being taken is a topical ophthalmic medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the nucleoside analog containing product is a topical ophthalmic medication.","meaning":"Boolean indicating whether the nucleoside analog containing product being taken is not a topical ophthalmic medication."} ;; "nucleoside analog medication (except topical ophthalmic medication)"

(declare-const patient_is_taking_interferon_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any interferon containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any interferon containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any interferon containing product.","meaning":"Boolean indicating whether the patient is currently taking an interferon containing product."} ;; "interferon medication"

(declare-const patient_is_taking_foscarnet_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking foscarnet containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any foscarnet containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking foscarnet containing product.","meaning":"Boolean indicating whether the patient is currently taking foscarnet containing product."} ;; "foscarnet medication"

(declare-const patient_is_taking_cytokine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any cytokine containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking any cytokine containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any cytokine containing product.","meaning":"Boolean indicating whether the patient is currently taking cytokine containing product."} ;; "cytokine medication"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable for nucleoside analog: not topical ophthalmic medication implies nucleoside analog
(assert
(! (=> patient_is_taking_nucleoside_analog_containing_product_now@@not_topical_ophthalmic_medication
      patient_is_taking_nucleoside_analog_containing_product_now)
    :named REQ6_AUXILIARY0)) ;; "nucleoside analog medication (except topical ophthalmic medication)"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exhaustive subcategories: patient is excluded if receiving any of the listed concurrent medications
(assert
(! (not (or patient_is_receiving_antimetabolite_treatment_now
            patient_is_taking_alkylating_agent_containing_product_now
            patient_is_taking_nucleoside_analog_containing_product_now@@not_topical_ophthalmic_medication
            patient_is_taking_interferon_containing_product_now
            patient_is_taking_foscarnet_containing_product_now
            patient_is_taking_cytokine_containing_product_now))
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving at least one of the following concurrent medications with exhaustive subcategories (antimetabolite medication, alkylating agent medication, nucleoside analog medication (except topical ophthalmic medication), interferon medication, foscarnet medication, cytokine medication)."
