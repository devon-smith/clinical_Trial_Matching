;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_clotting_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clotting disorder at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a clotting disorder at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clotting disorder.","meaning":"Boolean indicating whether the patient has ever had a clotting disorder at any time in their history."} ;; "clotting disorder"
(declare-const patient_has_finding_of_clotting_disorder_inthehistory@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of clotting disorder is documented in the medical record.","when_to_set_to_false":"Set to false if the patient's history of clotting disorder is not documented in the medical record.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of clotting disorder is documented.","meaning":"Boolean indicating whether the patient's history of clotting disorder is documented in the medical record."} ;; "documented clotting disorder"
(declare-const patient_has_finding_of_blood_coagulation_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a blood coagulation disorder at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a blood coagulation disorder at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a blood coagulation disorder.","meaning":"Boolean indicating whether the patient has ever had a blood coagulation disorder at any time in their history."} ;; "coagulation disorder"
(declare-const patient_has_finding_of_blood_coagulation_disorder_inthehistory@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of blood coagulation disorder is documented in the medical record.","when_to_set_to_false":"Set to false if the patient's history of blood coagulation disorder is not documented in the medical record.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of blood coagulation disorder is documented.","meaning":"Boolean indicating whether the patient's history of blood coagulation disorder is documented in the medical record."} ;; "documented coagulation disorder"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_clotting_disorder_inthehistory@@documented)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of documented clotting disorder."

(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_inthehistory@@documented)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of documented coagulation disorder."

;; ===================== Auxiliary Assertions (REQ 0) =====================
(assert
(! (=> patient_has_finding_of_clotting_disorder_inthehistory@@documented
      patient_has_finding_of_clotting_disorder_inthehistory)
:named REQ0_AUXILIARY0)) ;; "documented clotting disorder implies history of clotting disorder"

(assert
(! (=> patient_has_finding_of_blood_coagulation_disorder_inthehistory@@documented
      patient_has_finding_of_blood_coagulation_disorder_inthehistory)
:named REQ0_AUXILIARY1)) ;; "documented coagulation disorder implies history of coagulation disorder"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast1years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of malignant neoplastic disease (cancer) at any time within the past one year.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of malignant neoplastic disease (cancer) at any time within the past one year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of malignant neoplastic disease (cancer) within the past one year.","meaning":"Boolean indicating whether the patient has had a diagnosis of malignant neoplastic disease (cancer) within the past one year."} ;; "has a history of cancer within the last one year."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast1years)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of cancer within the last one year."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_requiring_anti_coagulation_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any diagnosis that requires anti-coagulation therapy.","when_to_set_to_false":"Set to false if the patient currently does not have any diagnosis that requires anti-coagulation therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any diagnosis that requires anti-coagulation therapy.","meaning":"Boolean indicating whether the patient currently has any diagnosis that requires anti-coagulation therapy."} ;; "any diagnosis requiring anti-coagulation therapy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_diagnosis_requiring_anti_coagulation_therapy_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any diagnosis requiring anti-coagulation therapy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_hypersensitivity_reaction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a hypersensitivity reaction at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a hypersensitivity reaction at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a hypersensitivity reaction.","meaning":"Boolean indicating whether the patient has ever had a hypersensitivity reaction in their history."} ;; "hypersensitivity reaction"
(declare-const patient_has_finding_of_hypersensitivity_reaction_inthehistory@@caused_by_apixaban Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a hypersensitivity reaction in their history and that reaction was caused by apixaban.","when_to_set_to_false":"Set to false if the patient has ever had a hypersensitivity reaction in their history but none were caused by apixaban.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any hypersensitivity reaction in the patient's history was caused by apixaban.","meaning":"Boolean indicating whether the patient's historical hypersensitivity reaction was caused by apixaban."} ;; "hypersensitivity reaction to apixaban"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypersensitivity_reaction_inthehistory@@caused_by_apixaban
      patient_has_finding_of_hypersensitivity_reaction_inthehistory)
:named REQ3_AUXILIARY0)) ;; "hypersensitivity reaction to apixaban" implies "hypersensitivity reaction"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_hypersensitivity_reaction_inthehistory@@caused_by_apixaban)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity reaction to apixaban."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bleeding.","meaning":"Boolean indicating whether the patient currently has bleeding."} ;; "bleeding"
(declare-const patient_has_finding_of_bleeding_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bleeding is active.","when_to_set_to_false":"Set to false if the patient's current bleeding is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bleeding is active.","meaning":"Boolean indicating whether the patient's current bleeding is active."} ;; "active"
(declare-const patient_has_finding_of_bleeding_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bleeding is clinically significant.","when_to_set_to_false":"Set to false if the patient's current bleeding is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bleeding is clinically significant.","meaning":"Boolean indicating whether the patient's current bleeding is clinically significant."} ;; "clinically significant"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_bleeding_now@@active
       patient_has_finding_of_bleeding_now)
   :named REQ4_AUXILIARY0)) ;; "active"

(assert
(! (=> patient_has_finding_of_bleeding_now@@clinically_significant
       patient_has_finding_of_bleeding_now)
   :named REQ4_AUXILIARY1)) ;; "clinically significant"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_has_finding_of_bleeding_now@@active
             patient_has_finding_of_bleeding_now@@clinically_significant))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active clinically significant bleeding."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's creatinine concentration in milligrams per deciliter is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine concentration in milligrams per deciliter."} ;; "creatinine concentration greater than 1.5 milligrams per deciliter"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (> patient_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 1.5))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has creatinine concentration greater than 1.5 milligrams per deciliter."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_receiving_anticoagulation_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving any type of anticoagulation medication.","when_to_set_to_false":"Set to false if the patient is not currently receiving any type of anticoagulation medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving any type of anticoagulation medication.","meaning":"Boolean indicating whether the patient is currently receiving any type of anticoagulation medication."} ;; "currently receiving any type of anticoagulation medication"
(declare-const patient_is_receiving_blood_thinning_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving any type of blood thinning medication.","when_to_set_to_false":"Set to false if the patient is not currently receiving any type of blood thinning medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving any type of blood thinning medication.","meaning":"Boolean indicating whether the patient is currently receiving any type of blood thinning medication."} ;; "currently receiving any type of blood thinning medication"
(declare-const patient_is_exposed_to_heparin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to heparin.","when_to_set_to_false":"Set to false if the patient is not currently receiving or exposed to heparin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to heparin.","meaning":"Boolean indicating whether the patient is currently exposed to heparin."} ;; "heparin"
(declare-const patient_is_exposed_to_low_molecular_weight_heparin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to low molecular weight heparin.","when_to_set_to_false":"Set to false if the patient is not currently receiving or exposed to low molecular weight heparin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to low molecular weight heparin.","meaning":"Boolean indicating whether the patient is currently exposed to low molecular weight heparin."} ;; "low molecular weight heparin"
(declare-const patient_is_exposed_to_clopidogrel_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to clopidogrel.","when_to_set_to_false":"Set to false if the patient is not currently receiving or exposed to clopidogrel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to clopidogrel.","meaning":"Boolean indicating whether the patient is currently exposed to clopidogrel."} ;; "clopidogrel"
(declare-const patient_is_exposed_to_aspirin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to aspirin.","when_to_set_to_false":"Set to false if the patient is not currently receiving or exposed to aspirin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to aspirin.","meaning":"Boolean indicating whether the patient is currently exposed to aspirin."} ;; "aspirin"
(declare-const patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to a nonsteroidal anti-inflammatory agent.","when_to_set_to_false":"Set to false if the patient is not currently receiving or exposed to a nonsteroidal anti-inflammatory agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to a nonsteroidal anti-inflammatory agent.","meaning":"Boolean indicating whether the patient is currently exposed to a nonsteroidal anti-inflammatory agent."} ;; "nonsteroidal anti-inflammatory drug"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples imply the umbrella term for blood thinning medication
(assert
(! (=> (or patient_is_exposed_to_heparin_now
           patient_is_exposed_to_low_molecular_weight_heparin_now
           patient_is_exposed_to_clopidogrel_now
           patient_is_exposed_to_aspirin_now
           patient_is_exposed_to_non_steroidal_anti_inflammatory_agent_now)
        patient_is_receiving_blood_thinning_medication_now)
   :named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (heparin, low molecular weight heparin, clopidogrel, aspirin, nonsteroidal anti-inflammatory drug)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_receiving_anticoagulation_medication_now)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently receiving any type of anticoagulation medication."

(assert
(! (not patient_is_receiving_blood_thinning_medication_now)
   :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently receiving any type of blood thinning medication with non-exhaustive examples (heparin, low molecular weight heparin, clopidogrel, aspirin, nonsteroidal anti-inflammatory drug)."

;; --- verifier-bypassed (attempt 8/8) 2025-10-24T10:23:09.818715 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (taking or receiving) any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} ;; "medications"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_now)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is taking any of the excluded medications."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_taking_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not taking any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any drug or medicament.","meaning":"Boolean indicating whether the patient is currently taking any drug or medicament."} ;; "medication"
(declare-const patient_is_taking_drug_or_medicament_now@@is_p_glycoprotein_inhibitor_and_strong_cytochrome_p450_3a4_inhibitor Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament currently being taken by the patient is both a P-glycoprotein inhibitor and a strong cytochrome P450 3A4 inhibitor.","when_to_set_to_false":"Set to false if the drug or medicament currently being taken by the patient is not both a P-glycoprotein inhibitor and a strong cytochrome P450 3A4 inhibitor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament currently being taken by the patient is both a P-glycoprotein inhibitor and a strong cytochrome P450 3A4 inhibitor.","meaning":"Boolean indicating that the drug or medicament currently being taken by the patient is both a P-glycoprotein inhibitor and a strong cytochrome P450 3A4 inhibitor."} ;; "a medication that is both a P-glycoprotein inhibitor AND a strong cytochrome P450 3A4 inhibitor (i.e., a combined inhibitor)"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_is_taking_drug_or_medicament_now@@is_p_glycoprotein_inhibitor_and_strong_cytochrome_p450_3a4_inhibitor
      patient_is_taking_drug_or_medicament_now)
   :named REQ8_AUXILIARY0)) ;; "a medication that is both a P-glycoprotein inhibitor AND a strong cytochrome P450 3A4 inhibitor (i.e., a combined inhibitor)"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_taking_drug_or_medicament_now@@is_p_glycoprotein_inhibitor_and_strong_cytochrome_p450_3a4_inhibitor)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking a medication that is both a P-glycoprotein inhibitor AND a strong cytochrome P450 3A4 inhibitor (i.e., a combined inhibitor)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_taking_drug_or_medicament_now@@is_p_glycoprotein_inhibitor_and_moderate_cytochrome_p450_3a4_inhibitor Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament currently being taken by the patient is both a P-glycoprotein inhibitor and a moderate cytochrome P450 3A4 inhibitor.","when_to_set_to_false":"Set to false if the drug or medicament currently being taken by the patient is not both a P-glycoprotein inhibitor and a moderate cytochrome P450 3A4 inhibitor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament currently being taken by the patient is both a P-glycoprotein inhibitor and a moderate cytochrome P450 3A4 inhibitor.","meaning":"Boolean indicating whether the drug or medicament currently being taken by the patient is both a P-glycoprotein inhibitor and a moderate cytochrome P450 3A4 inhibitor."} ;; "a medication that is both a P-glycoprotein inhibitor AND a moderate cytochrome P450 3A4 inhibitor (i.e., a combined inhibitor)"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_taking_drug_or_medicament_now@@is_p_glycoprotein_inhibitor_and_moderate_cytochrome_p450_3a4_inhibitor)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking a medication that is both a P-glycoprotein inhibitor AND a moderate cytochrome P450 3A4 inhibitor (i.e., a combined inhibitor)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_exposed_to_cytochrome_p450_cyp3a4_enzyme_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to cytochrome P450 3A4 (CYP3A4) enzyme.","when_to_set_to_false":"Set to false if the patient is currently not exposed to cytochrome P450 3A4 (CYP3A4) enzyme.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to cytochrome P450 3A4 (CYP3A4) enzyme.","meaning":"Boolean indicating whether the patient is currently exposed to cytochrome P450 3A4 (CYP3A4) enzyme."} ;; "cytochrome P450 3A4 (CYP3A4)"
(declare-const patient_is_taking_combined_p_glycoprotein_inducer_and_strong_cytochrome_p450_cyp3a4_inducer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a medication that is both a P-glycoprotein (P-gp) inducer and a strong cytochrome P450 3A4 (CYP3A4) inducer.","when_to_set_to_false":"Set to false if the patient is currently not taking a medication that is both a P-glycoprotein (P-gp) inducer and a strong cytochrome P450 3A4 (CYP3A4) inducer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a medication that is both a P-glycoprotein (P-gp) inducer and a strong cytochrome P450 3A4 (CYP3A4) inducer.","meaning":"Boolean indicating whether the patient is currently taking a medication that is both a P-glycoprotein (P-gp) inducer and a strong cytochrome P450 3A4 (CYP3A4) inducer."} ;; "taking a combined P-glycoprotein (P-gp) inducer and strong cytochrome P450 3A4 (CYP3A4) inducer"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_taking_combined_p_glycoprotein_inducer_and_strong_cytochrome_p450_cyp3a4_inducer_now)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking a combined P-glycoprotein (P-gp) inducer and strong cytochrome P450 3A4 (CYP3A4) inducer."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_taking_p_glycoprotein_inducer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a P-glycoprotein (P-gp) inducer.","when_to_set_to_false":"Set to false if the patient is currently not taking a P-glycoprotein (P-gp) inducer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a P-glycoprotein (P-gp) inducer.","meaning":"Boolean indicating whether the patient is currently taking a P-glycoprotein (P-gp) inducer."} ;; "The patient is excluded if the patient is taking a P-glycoprotein (P-gp) inducer."

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_taking_p_glycoprotein_inducer_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking a P-glycoprotein (P-gp) inducer."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_taking_cytochrome_p450_cyp3a4_enzyme_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a cytochrome P450 3A4 (CYP3A4) inducer.","when_to_set_to_false":"Set to false if the patient is currently not taking a cytochrome P450 3A4 (CYP3A4) inducer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a cytochrome P450 3A4 (CYP3A4) inducer.","meaning":"Boolean indicating whether the patient is currently taking a cytochrome P450 3A4 (CYP3A4) inducer."} ;; "cytochrome P450 3A4 (CYP3A4) inducer"
(declare-const patient_is_taking_cytochrome_p450_cyp3a4_enzyme_now@@is_strong_inducer Bool) ;; {"when_to_set_to_true":"Set to true if the cytochrome P450 3A4 (CYP3A4) inducer the patient is currently taking is classified as strong.","when_to_set_to_false":"Set to false if the cytochrome P450 3A4 (CYP3A4) inducer the patient is currently taking is not classified as strong.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cytochrome P450 3A4 (CYP3A4) inducer the patient is currently taking is strong.","meaning":"Boolean indicating whether the patient is currently taking a cytochrome P450 3A4 (CYP3A4) inducer the patient is currently taking is strong."} ;; "strong cytochrome P450 3A4 (CYP3A4) inducer"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_taking_cytochrome_p450_cyp3a4_enzyme_now@@is_strong_inducer
      patient_is_taking_cytochrome_p450_cyp3a4_enzyme_now)
:named REQ12_AUXILIARY0)) ;; "strong cytochrome P450 3A4 (CYP3A4) inducer" implies "cytochrome P450 3A4 (CYP3A4) inducer"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_is_taking_cytochrome_p450_cyp3a4_enzyme_now@@is_strong_inducer)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking a strong cytochrome P450 3A4 (CYP3A4) inducer."
