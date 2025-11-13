;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_congenital_long_qt_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or known history of diagnosis of congenital long-QTc syndrome at any point in their history.","when_to_set_to_false":"Set to false if the patient does not have a documented or known history of diagnosis of congenital long-QTc syndrome at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of diagnosis of congenital long-QTc syndrome.","meaning":"Boolean indicating whether the patient has a diagnosis of congenital long-QTc syndrome at any point in their history."} ;; "congenital long-QTc syndrome"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_congenital_long_qt_syndrome_inthehistory)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known history of congenital long-QTc syndrome."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding as documented or reported.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
  (! (not patient_is_breastfeeding_now)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breast-feeding."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_hypersensitivity_to_telithromycin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to telithromycin.","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to telithromycin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to telithromycin.","meaning":"Boolean indicating whether the patient currently has hypersensitivity to telithromycin."} ;; "the patient has hypersensitivity to telithromycin"
(declare-const patient_has_finding_of_allergy_to_azithromycin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of allergy to azithromycin.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of allergy to azithromycin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of allergy to azithromycin.","meaning":"Boolean indicating whether the patient currently has a clinical finding of allergy to azithromycin."} ;; "the patient has hypersensitivity to azithromycin"
(declare-const patient_has_hypersensitivity_to_macrolide_antibacterial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to any macrolide class antibacterial agent.","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to any macrolide class antibacterial agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to any macrolide class antibacterial agent.","meaning":"Boolean indicating whether the patient currently has hypersensitivity to macrolide class antibacterial agents."} ;; "the patient has hypersensitivity to macrolide class antibiotics"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not (or patient_has_hypersensitivity_to_telithromycin_now
              patient_has_finding_of_allergy_to_azithromycin_now
              patient_has_hypersensitivity_to_macrolide_antibacterial_now))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has hypersensitivity to telithromycin) OR (the patient has hypersensitivity to azithromycin) OR (the patient has hypersensitivity to macrolide class antibiotics)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_requires_treatment_with_rifampin_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with rifampin at any time in the two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient does not require treatment with rifampin at any time in the two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with rifampin in the two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient requires treatment with rifampin in the two weeks prior to Visit 1."} ;; "requires treatment with rifampin within two weeks prior to Visit 1"
(declare-const patient_is_taking_rifampin_containing_product_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is taking a rifampin-containing product at any time in the two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient is not taking a rifampin-containing product at any time in the two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is taking a rifampin-containing product in the two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient is taking a rifampin-containing product in the two weeks prior to Visit 1."} ;; "receives treatment with rifampin within two weeks prior to Visit 1"
(declare-const patient_requires_treatment_with_phenytoin_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with phenytoin at any time in the two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient does not require treatment with phenytoin at any time in the two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with phenytoin in the two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient requires treatment with phenytoin in the two weeks prior to Visit 1."} ;; "requires treatment with phenytoin within two weeks prior to Visit 1"
(declare-const patient_is_taking_phenytoin_containing_product_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is taking a phenytoin-containing product at any time in the two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient is not taking a phenytoin-containing product at any time in the two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is taking a phenytoin-containing product in the two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient is taking a phenytoin-containing product in the two weeks prior to Visit 1."} ;; "receives treatment with phenytoin within two weeks prior to Visit 1"
(declare-const patient_requires_treatment_with_carbamazepine_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with carbamazepine at any time in the two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient does not require treatment with carbamazepine at any time in the two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with carbamazepine in the two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient requires treatment with carbamazepine in the two weeks prior to Visit 1."} ;; "requires treatment with carbamazepine within two weeks prior to Visit 1"
(declare-const patient_is_taking_carbamazepine_containing_product_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is taking a carbamazepine-containing product at any time in the two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient is not taking a carbamazepine-containing product at any time in the two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is taking a carbamazepine-containing product in the two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient is taking a carbamazepine-containing product in the two weeks prior to Visit 1."} ;; "receives treatment with carbamazepine within two weeks prior to Visit 1"
(declare-const patient_requires_treatment_with_phenobarbital_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with phenobarbital at any time in the two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient does not require treatment with phenobarbital at any time in the two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with phenobarbital in the two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient requires treatment with phenobarbital in the two weeks prior to Visit 1."} ;; "requires treatment with phenobarbital within two weeks prior to Visit 1"
(declare-const patient_is_taking_phenobarbital_containing_product_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is taking a phenobarbital-containing product at any time in the two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient is not taking a phenobarbital-containing product at any time in the two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is taking a phenobarbital-containing product in the two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient is taking a phenobarbital-containing product in the two weeks prior to Visit 1."} ;; "receives treatment with phenobarbital within two weeks prior to Visit 1"
(declare-const patient_requires_treatment_with_hypericum_perforatum_extract_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with Hypericum perforatum extract (St. John's wort) at any time in the two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient does not require treatment with Hypericum perforatum extract (St. John's wort) at any time in the two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with Hypericum perforatum extract (St. John's wort) in the two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient requires treatment with Hypericum perforatum extract (St. John's wort) in the two weeks prior to Visit 1."} ;; "requires treatment with St. John's wort (herbal supplement) within two weeks prior to Visit 1"
(declare-const patient_is_exposed_to_hypericum_perforatum_extract_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is exposed to Hypericum perforatum extract (St. John's wort) at any time in the two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient is not exposed to Hypericum perforatum extract (St. John's wort) at any time in the two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is exposed to Hypericum perforatum extract (St. John's wort) in the two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient is exposed to Hypericum perforatum extract (St. John's wort) in the two weeks prior to Visit 1."} ;; "receives treatment with St. John's wort (herbal supplement) within two weeks prior to Visit 1"
(declare-const patient_requires_treatment_with_rifampin_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with rifampin at any time during the study (after Visit 1).","when_to_set_to_false":"Set to false if the patient does not require treatment with rifampin at any time during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with rifampin during the study.","meaning":"Boolean indicating whether the patient requires treatment with rifampin during the study."} ;; "requires treatment with rifampin during the study"
(declare-const patient_is_taking_rifampin_containing_product_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is taking a rifampin-containing product at any time during the study (after Visit 1).","when_to_set_to_false":"Set to false if the patient is not taking a rifampin-containing product at any time during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is taking a rifampin-containing product during the study.","meaning":"Boolean indicating whether the patient is taking a rifampin-containing product during the study."} ;; "receives treatment with rifampin during the study"
(declare-const patient_requires_treatment_with_phenytoin_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with phenytoin at any time during the study (after Visit 1).","when_to_set_to_false":"Set to false if the patient does not require treatment with phenytoin at any time during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with phenytoin during the study.","meaning":"Boolean indicating whether the patient requires treatment with phenytoin during the study."} ;; "requires treatment with phenytoin during the study"
(declare-const patient_is_taking_phenytoin_containing_product_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is taking a phenytoin-containing product at any time during the study (after Visit 1).","when_to_set_to_false":"Set to false if the patient is not taking a phenytoin-containing product at any time during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is taking a phenytoin-containing product during the study.","meaning":"Boolean indicating whether the patient is taking a phenytoin-containing product during the study."} ;; "receives treatment with phenytoin during the study"
(declare-const patient_requires_treatment_with_carbamazepine_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with carbamazepine at any time during the study (after Visit 1).","when_to_set_to_false":"Set to false if the patient does not require treatment with carbamazepine at any time during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with carbamazepine during the study.","meaning":"Boolean indicating whether the patient requires treatment with carbamazepine during the study."} ;; "requires treatment with carbamazepine during the study"
(declare-const patient_is_taking_carbamazepine_containing_product_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is taking a carbamazepine-containing product at any time during the study (after Visit 1).","when_to_set_to_false":"Set to false if the patient is not taking a carbamazepine-containing product at any time during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is taking a carbamazepine-containing product during the study.","meaning":"Boolean indicating whether the patient is taking a carbamazepine-containing product during the study."} ;; "receives treatment with carbamazepine during the study"
(declare-const patient_requires_treatment_with_phenobarbital_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with phenobarbital at any time during the study (after Visit 1).","when_to_set_to_false":"Set to false if the patient does not require treatment with phenobarbital at any time during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with phenobarbital during the study.","meaning":"Boolean indicating whether the patient requires treatment with phenobarbital during the study."} ;; "requires treatment with phenobarbital during the study"
(declare-const patient_is_taking_phenobarbital_containing_product_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is taking a phenobarbital-containing product at any time during the study (after Visit 1).","when_to_set_to_false":"Set to false if the patient is not taking a phenobarbital-containing product at any time during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is taking a phenobarbital-containing product during the study.","meaning":"Boolean indicating whether the patient is taking a phenobarbital-containing product during the study."} ;; "receives treatment with phenobarbital during the study"
(declare-const patient_requires_treatment_with_hypericum_perforatum_extract_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with Hypericum perforatum extract (St. John's wort) at any time during the study (after Visit 1).","when_to_set_to_false":"Set to false if the patient does not require treatment with Hypericum perforatum extract (St. John's wort) at any time during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with Hypericum perforatum extract (St. John's wort) during the study.","meaning":"Boolean indicating whether the patient requires treatment with Hypericum perforatum extract (St. John's wort) during the study."} ;; "requires treatment with St. John's wort (herbal supplement) during the study"
(declare-const patient_is_exposed_to_hypericum_perforatum_extract_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is exposed to Hypericum perforatum extract (St. John's wort) at any time during the study (after Visit 1).","when_to_set_to_false":"Set to false if the patient is not exposed to Hypericum perforatum extract (St. John's wort) at any time during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is exposed to Hypericum perforatum extract (St. John's wort) during the study.","meaning":"Boolean indicating whether the patient is exposed to Hypericum perforatum extract (St. John's wort) during the study."} ;; "receives treatment with St. John's wort (herbal supplement) during the study"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_requires_treatment_with_rifampin_inthepast2weeks)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with rifampin within two weeks prior to Visit 1."

(assert
(! (not patient_is_taking_rifampin_containing_product_inthepast2weeks)
:named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient receives treatment with rifampin within two weeks prior to Visit 1."

(assert
(! (not patient_requires_treatment_with_phenytoin_inthepast2weeks)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with phenytoin within two weeks prior to Visit 1."

(assert
(! (not patient_is_taking_phenytoin_containing_product_inthepast2weeks)
:named REQ3_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient receives treatment with phenytoin within two weeks prior to Visit 1."

(assert
(! (not patient_requires_treatment_with_carbamazepine_inthepast2weeks)
:named REQ3_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with carbamazepine within two weeks prior to Visit 1."

(assert
(! (not patient_is_taking_carbamazepine_containing_product_inthepast2weeks)
:named REQ3_COMPONENT5_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient receives treatment with carbamazepine within two weeks prior to Visit 1."

(assert
(! (not patient_requires_treatment_with_phenobarbital_inthepast2weeks)
:named REQ3_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with phenobarbital within two weeks prior to Visit 1."

(assert
(! (not patient_is_taking_phenobarbital_containing_product_inthepast2weeks)
:named REQ3_COMPONENT7_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient receives treatment with phenobarbital within two weeks prior to Visit 1."

(assert
(! (not patient_requires_treatment_with_hypericum_perforatum_extract_inthepast2weeks)
:named REQ3_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with St. John's wort (herbal supplement) within two weeks prior to Visit 1."

(assert
(! (not patient_is_exposed_to_hypericum_perforatum_extract_inthepast2weeks)
:named REQ3_COMPONENT9_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient receives treatment with St. John's wort (herbal supplement) within two weeks prior to Visit 1."

(assert
(! (not patient_requires_treatment_with_rifampin_inthefuture)
:named REQ3_COMPONENT10_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with rifampin during the study."

(assert
(! (not patient_is_taking_rifampin_containing_product_inthefuture)
:named REQ3_COMPONENT11_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient receives treatment with rifampin during the study."

(assert
(! (not patient_requires_treatment_with_phenytoin_inthefuture)
:named REQ3_COMPONENT12_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with phenytoin during the study."

(assert
(! (not patient_is_taking_phenytoin_containing_product_inthefuture)
:named REQ3_COMPONENT13_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient receives treatment with phenytoin during the study."

(assert
(! (not patient_requires_treatment_with_carbamazepine_inthefuture)
:named REQ3_COMPONENT14_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with carbamazepine during the study."

(assert
(! (not patient_is_taking_carbamazepine_containing_product_inthefuture)
:named REQ3_COMPONENT15_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient receives treatment with carbamazepine during the study."

(assert
(! (not patient_requires_treatment_with_phenobarbital_inthefuture)
:named REQ3_COMPONENT16_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with phenobarbital during the study."

(assert
(! (not patient_is_taking_phenobarbital_containing_product_inthefuture)
:named REQ3_COMPONENT17_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient receives treatment with phenobarbital during the study."

(assert
(! (not patient_requires_treatment_with_hypericum_perforatum_extract_inthefuture)
:named REQ3_COMPONENT18_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with St. John's wort (herbal supplement) during the study."

(assert
(! (not patient_is_exposed_to_hypericum_perforatum_extract_inthefuture)
:named REQ3_COMPONENT19_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient receives treatment with St. John's wort (herbal supplement) during the study."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_taking_ergot_alkaloid_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an ergot alkaloid containing product.","when_to_set_to_false":"Set to false if the patient is not currently taking an ergot alkaloid containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an ergot alkaloid containing product.","meaning":"Boolean indicating whether the patient is currently taking an ergot alkaloid containing product."} ;; "the patient requires treatment during the study with ergot alkaloid derivatives"
(declare-const patient_is_exposed_to_cisapride_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to cisapride.","when_to_set_to_false":"Set to false if the patient is not currently exposed to cisapride.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to cisapride.","meaning":"Boolean indicating whether the patient is currently exposed to cisapride."} ;; "the patient requires treatment with cisapride during the study"
(declare-const patient_is_exposed_to_pimozide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to pimozide.","when_to_set_to_false":"Set to false if the patient is not currently exposed to pimozide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to pimozide.","meaning":"Boolean indicating whether the patient is currently exposed to pimozide."} ;; "the patient requires treatment with pimozide during the study"
(declare-const patient_is_exposed_to_bromocriptine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to bromocriptine.","when_to_set_to_false":"Set to false if the patient is not currently exposed to bromocriptine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to bromocriptine.","meaning":"Boolean indicating whether the patient is currently exposed to bromocriptine."} ;; "the patient requires treatment with bromocriptine during the study"
(declare-const patient_is_exposed_to_cabergoline_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to cabergoline.","when_to_set_to_false":"Set to false if the patient is not currently exposed to cabergoline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to cabergoline.","meaning":"Boolean indicating whether the patient is currently exposed to cabergoline."} ;; "the patient requires treatment with cabergoline during the study"
(declare-const patient_is_exposed_to_pergolide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to pergolide.","when_to_set_to_false":"Set to false if the patient is not currently exposed to pergolide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to pergolide.","meaning":"Boolean indicating whether the patient is currently exposed to pergolide."} ;; "the patient requires treatment with pergolide during the study"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_taking_ergot_alkaloid_containing_product_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment during the study with ergot alkaloid derivatives."

(assert
(! (not patient_is_exposed_to_cisapride_now)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with cisapride during the study."

(assert
(! (not patient_is_exposed_to_pimozide_now)
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with pimozide during the study."

(assert
(! (not patient_is_exposed_to_bromocriptine_now)
:named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with bromocriptine during the study."

(assert
(! (not patient_is_exposed_to_cabergoline_now)
:named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with cabergoline during the study."

(assert
(! (not patient_is_exposed_to_pergolide_now)
:named REQ4_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with pergolide during the study."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_previously_participated_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated in this study.","when_to_set_to_false":"Set to false if the patient has not previously participated in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated in this study.","meaning":"Boolean indicating whether the patient has previously participated in this study."} ;; "The patient is excluded if the patient has previously participated in this study."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_previously_participated_in_this_study)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously participated in this study."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_myasthenia_gravis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myasthenia gravis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myasthenia gravis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myasthenia gravis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of myasthenia gravis in their medical history."} ;; "previous history of myasthenia gravis"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_myasthenia_gravis_inthehistory)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous history of myasthenia gravis."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_acute_respiratory_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute respiratory failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute respiratory failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute respiratory failure.","meaning":"Boolean indicating whether the patient currently has acute respiratory failure."} ;; "the patient has current acute respiratory failure"

(declare-const patient_is_undergoing_airway_management_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing airway management.","when_to_set_to_false":"Set to false if the patient is currently not undergoing airway management.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing airway management.","meaning":"Boolean indicating whether the patient is currently undergoing airway management."} ;; "the patient requires aggressive airway management"

(declare-const patient_is_undergoing_airway_management_now@@aggressive Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing aggressive airway management.","when_to_set_to_false":"Set to false if the patient is currently undergoing airway management but it is not aggressive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the airway management is aggressive.","meaning":"Boolean indicating whether the patient is currently undergoing aggressive airway management."} ;; "the patient requires aggressive airway management"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_airway_management_now@@aggressive
       patient_is_undergoing_airway_management_now)
   :named REQ7_AUXILIARY0)) ;; "aggressive airway management" implies "airway management"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_acute_respiratory_failure_now)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current acute respiratory failure."

(assert
(! (not patient_is_undergoing_airway_management_now@@aggressive)
   :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires aggressive airway management."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_patient_in_hospital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hospitalized (admitted to a hospital at the present time).","when_to_set_to_false":"Set to false if the patient is currently not hospitalized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hospitalized.","meaning":"Boolean indicating whether the patient is currently hospitalized."} ;; "hospitalized"
(declare-const patient_is_from_institutional_care_facility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently from an institutional care facility (e.g., nursing home, long-term care institution, rehabilitation center, or similar).","when_to_set_to_false":"Set to false if the patient is currently not from an institutional care facility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently from an institutional care facility.","meaning":"Boolean indicating whether the patient is currently from an institutional care facility."} ;; "from an institutional care facility"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_patient_in_hospital_now)
:named REQ8_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is hospitalized."

(assert
(! (not patient_is_from_institutional_care_facility_now)
:named REQ8_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is from an institutional care facility."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_been_treated_with_oral_antibiotics_within_14_days_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been treated with oral antibiotics within fourteen days prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not been treated with oral antibiotics within fourteen days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been treated with oral antibiotics within fourteen days prior to enrollment.","meaning":"Boolean indicating whether the patient has been treated with oral antibiotics within fourteen days prior to enrollment."} ;; "the patient has been treated with oral antibiotics within fourteen days prior to enrollment"

(declare-const patient_has_been_treated_with_parenteral_antibiotics_within_14_days_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been treated with parenteral antibiotics within fourteen days prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not been treated with parenteral antibiotics within fourteen days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been treated with parenteral antibiotics within fourteen days prior to enrollment.","meaning":"Boolean indicating whether the patient has been treated with parenteral antibiotics within fourteen days prior to enrollment."} ;; "the patient has been treated with parenteral antibiotics within fourteen days prior to enrollment"

(declare-const patient_is_taking_drug_or_medicament_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is taking a drug or medicament during the treatment period (in the future).","when_to_set_to_false":"Set to false if the patient is not taking any drug or medicament during the treatment period (in the future).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will take a drug or medicament during the treatment period.","meaning":"Boolean indicating whether the patient is taking a drug or medicament in the future (during the treatment period)."} ;; "the patient plans to take antibiotics other than the study drug during the treatment period"

(declare-const patient_is_taking_drug_or_medicament_inthefuture@@not_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament being taken in the future is not the study drug.","when_to_set_to_false":"Set to false if the drug or medicament being taken in the future is the study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament being taken in the future is the study drug.","meaning":"Boolean indicating whether the drug or medicament being taken in the future is not the study drug."} ;; "the patient plans to take antibiotics other than the study drug during the treatment period"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_taking_drug_or_medicament_inthefuture@@not_study_drug
       patient_is_taking_drug_or_medicament_inthefuture)
    :named REQ9_AUXILIARY0)) ;; "the drug or medicament being taken in the future is not the study drug"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (or patient_has_been_treated_with_oral_antibiotics_within_14_days_prior_to_enrollment
            patient_has_been_treated_with_parenteral_antibiotics_within_14_days_prior_to_enrollment
            patient_is_taking_drug_or_medicament_inthefuture@@not_study_drug))
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has been treated with oral antibiotics within fourteen days prior to enrollment) OR (the patient has been treated with parenteral antibiotics within fourteen days prior to enrollment) OR (the patient plans to take antibiotics other than the study drug during the treatment period)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any disease."} ;; "other disease conditions"
(declare-const patient_has_diagnosis_of_disease_now@@could_interfere_with_evaluation_of_drug_efficacy_or_safety Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any disease and that disease could interfere with the evaluation of drug efficacy or safety.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of any disease but that disease could not interfere with the evaluation of drug efficacy or safety.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease could interfere with the evaluation of drug efficacy or safety.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any disease that could interfere with the evaluation of drug efficacy or safety."} ;; "other disease conditions that could interfere with the evaluation of drug efficacy or safety"
(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any disorder due to infection."} ;; "other infections"
(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now@@could_interfere_with_evaluation_of_drug_efficacy_or_safety Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any disorder due to infection and that infection could interfere with the evaluation of drug efficacy or safety.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of any disorder due to infection but that infection could not interfere with the evaluation of drug efficacy or safety.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection could interfere with the evaluation of drug efficacy or safety.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any disorder due to infection that could interfere with the evaluation of drug efficacy or safety."} ;; "other infections that could interfere with the evaluation of drug efficacy or safety"
(declare-const patient_is_receiving_systemic_antimicrobial_agents_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving systemic antimicrobial agents.","when_to_set_to_false":"Set to false if the patient is not currently receiving systemic antimicrobial agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving systemic antimicrobial agents.","meaning":"Boolean indicating whether the patient is currently receiving systemic antimicrobial agents."} ;; "systemic antimicrobial agents"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Non-exhaustive example: systemic antimicrobial agents is an example of other medications
(assert
(! (=> patient_is_receiving_systemic_antimicrobial_agents_now
patient_is_taking_drug_or_medicament_inthefuture@@not_study_drug)
:named REQ10_AUXILIARY0)) ;; "systemic antimicrobial agents" is a non-exhaustive example of "other medications"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_disease_now@@could_interfere_with_evaluation_of_drug_efficacy_or_safety
patient_has_diagnosis_of_disease_now)
:named REQ10_AUXILIARY1)) ;; "other disease conditions that could interfere with the evaluation of drug efficacy or safety"

(assert
(! (=> patient_has_diagnosis_of_disorder_due_to_infection_now@@could_interfere_with_evaluation_of_drug_efficacy_or_safety
patient_has_diagnosis_of_disorder_due_to_infection_now)
:named REQ10_AUXILIARY2)) ;; "other infections that could interfere with the evaluation of drug efficacy or safety"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient must NOT be receiving other medications (including systemic antimicrobial agents as a non-exhaustive example)
(assert
(! (not patient_is_taking_drug_or_medicament_inthefuture@@not_study_drug)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient is receiving other medications with non-exhaustive examples (systemic antimicrobial agents)"

;; Exclusion: patient must NOT have other disease conditions that could interfere with evaluation
(assert
(! (not patient_has_diagnosis_of_disease_now@@could_interfere_with_evaluation_of_drug_efficacy_or_safety)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has other disease conditions that could interfere with the evaluation of drug efficacy or safety"

;; Exclusion: patient must NOT have other infections that could interfere with evaluation
(assert
(! (not patient_has_diagnosis_of_disorder_due_to_infection_now@@could_interfere_with_evaluation_of_drug_efficacy_or_safety)
:named REQ10_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has other infections that could interfere with the evaluation of drug efficacy or safety"

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_clinically_relevant_cardiovascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinically relevant cardiovascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinically relevant cardiovascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically relevant cardiovascular disease.","meaning":"Boolean indicating whether the patient currently has a clinically relevant cardiovascular disease."} ;; "clinically relevant cardiovascular disease"
(declare-const patient_has_finding_of_clinically_relevant_cardiovascular_disease_now@@makes_protocol_implementation_or_result_interpretation_difficult Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinically relevant cardiovascular disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_false":"Set to false if the patient's clinically relevant cardiovascular disease does not make either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's clinically relevant cardiovascular disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","meaning":"Boolean indicating whether the patient's clinically relevant cardiovascular disease makes either implementation of the protocol difficult or interpretation of the study results difficult."} ;; "clinically relevant cardiovascular disease ... that makes either (implementation of the protocol difficult) OR (interpretation of the study results difficult)"
(declare-const patient_has_finding_of_clinically_relevant_hepatic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinically relevant hepatic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinically relevant hepatic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically relevant hepatic disease.","meaning":"Boolean indicating whether the patient currently has a clinically relevant hepatic disease."} ;; "clinically relevant hepatic disease"
(declare-const patient_has_finding_of_clinically_relevant_hepatic_disease_now@@makes_protocol_implementation_or_result_interpretation_difficult Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinically relevant hepatic disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_false":"Set to false if the patient's clinically relevant hepatic disease does not make either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's clinically relevant hepatic disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","meaning":"Boolean indicating whether the patient's clinically relevant hepatic disease makes either implementation of the protocol difficult or interpretation of the study results difficult."} ;; "clinically relevant hepatic disease ... that makes either (implementation of the protocol difficult) OR (interpretation of the study results difficult)"
(declare-const patient_has_finding_of_clinically_relevant_neurologic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinically relevant neurologic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinically relevant neurologic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically relevant neurologic disease.","meaning":"Boolean indicating whether the patient currently has a clinically relevant neurologic disease."} ;; "clinically relevant neurologic disease"
(declare-const patient_has_finding_of_clinically_relevant_neurologic_disease_now@@makes_protocol_implementation_or_result_interpretation_difficult Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinically relevant neurologic disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_false":"Set to false if the patient's clinically relevant neurologic disease does not make either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's clinically relevant neurologic disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","meaning":"Boolean indicating whether the patient's clinically relevant neurologic disease makes either implementation of the protocol difficult or interpretation of the study results difficult."} ;; "clinically relevant neurologic disease ... that makes either (implementation of the protocol difficult) OR (interpretation of the study results difficult)"
(declare-const patient_has_finding_of_clinically_relevant_endocrine_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinically relevant endocrine disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinically relevant endocrine disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically relevant endocrine disease.","meaning":"Boolean indicating whether the patient currently has a clinically relevant endocrine disease."} ;; "clinically relevant endocrine disease"
(declare-const patient_has_finding_of_clinically_relevant_endocrine_disease_now@@makes_protocol_implementation_or_result_interpretation_difficult Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinically relevant endocrine disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_false":"Set to false if the patient's clinically relevant endocrine disease does not make either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's clinically relevant endocrine disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","meaning":"Boolean indicating whether the patient's clinically relevant endocrine disease makes either implementation of the protocol difficult or interpretation of the study results difficult."} ;; "clinically relevant endocrine disease ... that makes either (implementation of the protocol difficult) OR (interpretation of the study results difficult)"
(declare-const patient_has_finding_of_major_systemic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a major systemic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a major systemic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a major systemic disease.","meaning":"Boolean indicating whether the patient currently has a major systemic disease."} ;; "other major systemic disease"
(declare-const patient_has_finding_of_major_systemic_disease_now@@makes_protocol_implementation_or_result_interpretation_difficult Bool) ;; {"when_to_set_to_true":"Set to true if the patient's major systemic disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_false":"Set to false if the patient's major systemic disease does not make either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's major systemic disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","meaning":"Boolean indicating whether the patient's major systemic disease makes either implementation of the protocol difficult or interpretation of the study results difficult."} ;; "other major systemic disease ... that makes either (implementation of the protocol difficult) OR (interpretation of the study results difficult)"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_clinically_relevant_cardiovascular_disease_now@@makes_protocol_implementation_or_result_interpretation_difficult
           patient_has_finding_of_clinically_relevant_hepatic_disease_now@@makes_protocol_implementation_or_result_interpretation_difficult
           patient_has_finding_of_clinically_relevant_neurologic_disease_now@@makes_protocol_implementation_or_result_interpretation_difficult
           patient_has_finding_of_clinically_relevant_endocrine_disease_now@@makes_protocol_implementation_or_result_interpretation_difficult
           patient_has_finding_of_major_systemic_disease_now@@makes_protocol_implementation_or_result_interpretation_difficult)
        patient_has_diagnosis_of_disease_now@@could_interfere_with_evaluation_of_drug_efficacy_or_safety)
:named REQ11_AUXILIARY0)) ;; "with non-exhaustive examples ((clinically relevant cardiovascular disease) OR (clinically relevant hepatic disease) OR (clinically relevant neurologic disease) OR (clinically relevant endocrine disease) OR (other major systemic disease))"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_clinically_relevant_cardiovascular_disease_now@@makes_protocol_implementation_or_result_interpretation_difficult
      patient_has_finding_of_clinically_relevant_cardiovascular_disease_now)
:named REQ11_AUXILIARY1)) ;; "clinically relevant cardiovascular disease ... that makes either (implementation of the protocol difficult) OR (interpretation of the study results difficult)"

(assert
(! (=> patient_has_finding_of_clinically_relevant_hepatic_disease_now@@makes_protocol_implementation_or_result_interpretation_difficult
      patient_has_finding_of_clinically_relevant_hepatic_disease_now)
:named REQ11_AUXILIARY2)) ;; "clinically relevant hepatic disease ... that makes either (implementation of the protocol difficult) OR (interpretation of the study results difficult)"

(assert
(! (=> patient_has_finding_of_clinically_relevant_neurologic_disease_now@@makes_protocol_implementation_or_result_interpretation_difficult
      patient_has_finding_of_clinically_relevant_neurologic_disease_now)
:named REQ11_AUXILIARY3)) ;; "clinically relevant neurologic disease ... that makes either (implementation of the protocol difficult) OR (interpretation of the study results difficult)"

(assert
(! (=> patient_has_finding_of_clinically_relevant_endocrine_disease_now@@makes_protocol_implementation_or_result_interpretation_difficult
      patient_has_finding_of_clinically_relevant_endocrine_disease_now)
:named REQ11_AUXILIARY4)) ;; "clinically relevant endocrine disease ... that makes either (implementation of the protocol difficult) OR (interpretation of the study results difficult)"

(assert
(! (=> patient_has_finding_of_major_systemic_disease_now@@makes_protocol_implementation_or_result_interpretation_difficult
      patient_has_finding_of_major_systemic_disease_now)
:named REQ11_AUXILIARY5)) ;; "other major systemic disease ... that makes either (implementation of the protocol difficult) OR (interpretation of the study results difficult)"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_diagnosis_of_disease_now@@could_interfere_with_evaluation_of_drug_efficacy_or_safety)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a concomitant condition with non-exhaustive examples ... that makes either (implementation of the protocol difficult) OR (interpretation of the study results difficult)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_progressively_fatal_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a progressively fatal disease.","when_to_set_to_false":"Set to false if the patient currently does not have a progressively fatal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a progressively fatal disease.","meaning":"Boolean indicating whether the patient currently has a progressively fatal disease."} ;; "the patient has a progressively fatal disease"
(declare-const patient_life_expectancy_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's life expectancy in months, recorded at the current time.","when_to_set_to_null":"Set to null if the patient's life expectancy in months is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value indicating the patient's life expectancy in months, recorded at the current time."} ;; "the patient has a life expectancy of less than 3 months"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_progressively_fatal_disease_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a progressively fatal disease."

(assert
(! (not (< patient_life_expectancy_value_recorded_now_in_months 3))
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a life expectancy of less than 3 months."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_received_investigational_drug_within_1_month_prior_to_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received any investigational drug within 1 month prior to study entry.","when_to_set_to_false":"Set to false if the patient has not received any investigational drug within 1 month prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received any investigational drug within 1 month prior to study entry.","meaning":"Boolean indicating whether the patient has received any investigational drug within 1 month prior to study entry."} ;; "the patient has received any other investigational drug within 1 month prior to study entry"

(declare-const patient_has_received_investigational_device_within_1_month_prior_to_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received any investigational device within 1 month prior to study entry.","when_to_set_to_false":"Set to false if the patient has not received any investigational device within 1 month prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received any investigational device within 1 month prior to study entry.","meaning":"Boolean indicating whether the patient has received any investigational device within 1 month prior to study entry."} ;; "the patient has received any investigational device within 1 month prior to study entry"

(declare-const patient_has_treatment_with_investigational_drug_or_device_planned_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient has treatment with any investigational drug or device planned during the study period.","when_to_set_to_false":"Set to false if the patient does not have treatment with any investigational drug or device planned during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has treatment with any investigational drug or device planned during the study period.","meaning":"Boolean indicating whether the patient has treatment with any investigational drug or device planned during the study period."} ;; "the patient has such treatment planned during the study period"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not (or patient_has_received_investigational_drug_within_1_month_prior_to_study_entry
            patient_has_received_investigational_device_within_1_month_prior_to_study_entry
            patient_has_treatment_with_investigational_drug_or_device_planned_during_study_period))
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has received any other investigational drug within 1 month prior to study entry) OR (the patient has received any investigational device within 1 month prior to study entry) OR (the patient has such treatment planned during the study period)."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_drug_abuse_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of drug abuse occurring within the previous 3 months.","when_to_set_to_false":"Set to false if the patient does not have a documented history of drug abuse within the previous 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of drug abuse within the previous 3 months.","meaning":"Boolean indicating whether the patient has a history of drug abuse within the previous 3 months."} ;; "the patient has a history of drug abuse within the previous 3 months"

(declare-const patient_has_finding_of_alcohol_abuse_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of alcohol abuse occurring within the previous 3 months.","when_to_set_to_false":"Set to false if the patient does not have a documented history of alcohol abuse within the previous 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol abuse within the previous 3 months.","meaning":"Boolean indicating whether the patient has a history of alcohol abuse within the previous 3 months."} ;; "the patient has a history of alcohol abuse within the previous 3 months"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_drug_abuse_inthepast3months)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of drug abuse within the previous 3 months."

(assert
(! (not patient_has_finding_of_alcohol_abuse_inthepast3months)
:named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of alcohol abuse within the previous 3 months."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_patient_immunocompromised_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently immunocompromised.","when_to_set_to_false":"Set to false if the patient is currently not immunocompromised.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently immunocompromised.","meaning":"Boolean indicating whether the patient is currently immunocompromised."} ;; "immunocompromised"

(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a known human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has a known human immunodeficiency virus infection."} ;; "has known human immunodeficiency virus infection"

(declare-const patient_absolute_cd4_count_procedure_value_recorded_now_withunit_cells_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current absolute CD4 count in cells per cubic millimeter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current absolute CD4 count in cells per cubic millimeter."} ;; "CD4 count < 200 per cubic millimeter"

(declare-const patient_has_finding_of_neutropenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has known neutropenia.","when_to_set_to_false":"Set to false if the patient currently does not have known neutropenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has known neutropenia.","meaning":"Boolean indicating whether the patient currently has known neutropenia."} ;; "has known neutropenia"

(declare-const patient_has_finding_of_hyposplenism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has known hyposplenia.","when_to_set_to_false":"Set to false if the patient currently does not have known hyposplenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has known hyposplenia.","meaning":"Boolean indicating whether the patient currently has known hyposplenia."} ;; "has known hyposplenia"

(declare-const patient_has_finding_of_asplenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has known asplenia.","when_to_set_to_false":"Set to false if the patient currently does not have known asplenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has known asplenia.","meaning":"Boolean indicating whether the patient currently has known asplenia."} ;; "has known asplenia"

(declare-const patient_is_undergoing_chronic_corticosteroid_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing chronic corticosteroid therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing chronic corticosteroid therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing chronic corticosteroid therapy.","meaning":"Boolean indicating whether the patient is currently undergoing chronic corticosteroid therapy."} ;; "has chronic corticosteroid therapy"

(declare-const patient_is_undergoing_chronic_corticosteroid_therapy_now@@duration_at_least_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic corticosteroid therapy has been administered for at least the past 3 months.","when_to_set_to_false":"Set to false if the patient's chronic corticosteroid therapy has not been administered for at least the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic corticosteroid therapy has been administered for at least the past 3 months.","meaning":"Boolean indicating whether the patient's chronic corticosteroid therapy has been administered for at least the past 3 months."} ;; "prednisolone therapy or equivalent dosage ≥ 10 milligrams per day for at least the past 3 months"

(declare-const patient_chronic_corticosteroid_therapy_daily_dosage_value_recorded_now_withunit_mg_per_day Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current daily dosage of chronic corticosteroid therapy in milligrams per day is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current daily dosage of chronic corticosteroid therapy in milligrams per day."} ;; "prednisolone therapy or equivalent dosage ≥ 10 milligrams per day for at least the past 3 months"

(declare-const patient_is_undergoing_prednisolone_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing prednisolone therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing prednisolone therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing prednisolone therapy.","meaning":"Boolean indicating whether the patient is currently undergoing prednisolone therapy."} ;; "prednisolone therapy"

(declare-const patient_is_undergoing_prednisolone_therapy_now@@duration_at_least_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prednisolone therapy has been administered for at least the past 3 months.","when_to_set_to_false":"Set to false if the patient's prednisolone therapy has not been administered for at least the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's prednisolone therapy has been administered for at least the past 3 months.","meaning":"Boolean indicating whether the patient's prednisolone therapy has been administered for at least the past 3 months."} ;; "prednisolone therapy ... for at least the past 3 months"

(declare-const patient_prednisolone_therapy_daily_dosage_value_recorded_now_withunit_mg_per_day Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current daily dosage of prednisolone therapy in milligrams per day is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current daily dosage of prednisolone therapy in milligrams per day."} ;; "prednisolone therapy ... dosage ≥ 10 milligrams per day"

(declare-const patient_has_undergone_immunosuppressant_drug_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone immunosuppressant drug therapy in their history.","when_to_set_to_false":"Set to false if the patient has never undergone immunosuppressant drug therapy in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone immunosuppressant drug therapy.","meaning":"Boolean indicating whether the patient has ever undergone immunosuppressant drug therapy in their history."} ;; "immunosuppressant treatment"

(declare-const patient_has_undergone_immunosuppressant_drug_therapy_inthehistory@@temporalcontext_within6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone immunosuppressant drug therapy within the previous 6 months.","when_to_set_to_false":"Set to false if the patient has not undergone immunosuppressant drug therapy within the previous 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone immunosuppressant drug therapy within the previous 6 months.","meaning":"Boolean indicating whether the patient has undergone immunosuppressant drug therapy within the previous 6 months."} ;; "immunosuppressant treatment ... within the previous 6 months"

(declare-const patient_has_undergone_immunosuppressant_drug_therapy_inthehistory@@excludes_corticosteroids Bool) ;; {"when_to_set_to_true":"Set to true if the immunosuppressant drug therapy excludes corticosteroids.","when_to_set_to_false":"Set to false if the immunosuppressant drug therapy includes corticosteroids.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether corticosteroids are excluded from the immunosuppressant drug therapy.","meaning":"Boolean indicating whether the immunosuppressant drug therapy excludes corticosteroids."} ;; "immunosuppressant treatment other than corticosteroids"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> 
  (or
    ;; HIV infection with CD4 < 200
    (and patient_has_finding_of_human_immunodeficiency_virus_infection_now
         (< patient_absolute_cd4_count_procedure_value_recorded_now_withunit_cells_per_cubic_millimeter 200))
    ;; Neutropenia (neutrophil count < 1500)
    patient_has_finding_of_neutropenia_now
    ;; Chronic corticosteroid therapy (prednisolone or equivalent ≥ 10 mg/day for ≥ 3 months)
    (or
      (and patient_is_undergoing_chronic_corticosteroid_therapy_now
           patient_is_undergoing_chronic_corticosteroid_therapy_now@@duration_at_least_3_months
           (>= patient_chronic_corticosteroid_therapy_daily_dosage_value_recorded_now_withunit_mg_per_day 10))
      (and patient_is_undergoing_prednisolone_therapy_now
           patient_is_undergoing_prednisolone_therapy_now@@duration_at_least_3_months
           (>= patient_prednisolone_therapy_daily_dosage_value_recorded_now_withunit_mg_per_day 10))
    )
    ;; Immunosuppressant treatment other than corticosteroids within previous 6 months
    (and patient_has_undergone_immunosuppressant_drug_therapy_inthehistory@@temporalcontext_within6months
         patient_has_undergone_immunosuppressant_drug_therapy_inthehistory@@excludes_corticosteroids)
    ;; Splenectomized
    ;; Note: No explicit variable for "splenectomized" in new_variable_declarations, so not included.
    ;; Hyposplenia
    patient_has_finding_of_hyposplenism_now
    ;; Asplenia
    patient_has_finding_of_asplenia_now
  )
  patient_has_finding_of_patient_immunocompromised_now)
:named REQ15_AUXILIARY0)) ;; "with non-exhaustive examples ((has known human immunodeficiency virus infection (CD4 count < 200 per cubic millimeter)) OR (has known neutropenia (neutrophil count < 1500 per cubic millimeter)) OR (has chronic corticosteroid therapy (prednisolone therapy or equivalent dosage ≥ 10 milligrams per day for at least the past 3 months)) OR (has immunosuppressant treatment other than corticosteroids within the previous 6 months) OR (is splenectomized) OR (has known hyposplenia) OR (has known asplenia))"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_undergoing_chronic_corticosteroid_therapy_now@@duration_at_least_3_months
      patient_is_undergoing_chronic_corticosteroid_therapy_now)
:named REQ15_AUXILIARY1)) ;; "chronic corticosteroid therapy ... for at least the past 3 months"

(assert
(! (=> patient_is_undergoing_prednisolone_therapy_now@@duration_at_least_3_months
      patient_is_undergoing_prednisolone_therapy_now)
:named REQ15_AUXILIARY2)) ;; "prednisolone therapy ... for at least the past 3 months"

(assert
(! (=> patient_has_undergone_immunosuppressant_drug_therapy_inthehistory@@temporalcontext_within6months
      patient_has_undergone_immunosuppressant_drug_therapy_inthehistory)
:named REQ15_AUXILIARY3)) ;; "immunosuppressant treatment ... within the previous 6 months"

(assert
(! (=> patient_has_undergone_immunosuppressant_drug_therapy_inthehistory@@excludes_corticosteroids
      patient_has_undergone_immunosuppressant_drug_therapy_inthehistory)
:named REQ15_AUXILIARY4)) ;; "immunosuppressant treatment other than corticosteroids"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_patient_immunocompromised_now)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is immunocompromised with non-exhaustive examples ..."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental disorder.","meaning":"Boolean indicating whether the patient currently has a mental disorder."} ;; "mental conditions"

(declare-const patient_has_finding_of_mental_disorder_now@@renders_patient_unable_to_understand_study_nature_scope_consequences Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current mental disorder renders the patient unable to understand the nature, scope, and possible consequences of the study.","when_to_set_to_false":"Set to false if the patient's current mental disorder does not render the patient unable to understand the nature, scope, and possible consequences of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current mental disorder renders the patient unable to understand the nature, scope, and possible consequences of the study.","meaning":"Boolean indicating whether the patient's current mental disorder renders the patient unable to understand the nature, scope, and possible consequences of the study."} ;; "mental conditions that render the patient unable to understand the nature, scope, AND possible consequences of the study."

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_mental_disorder_now@@renders_patient_unable_to_understand_study_nature_scope_consequences
      patient_has_finding_of_mental_disorder_now)
   :named REQ16_AUXILIARY0)) ;; "mental conditions that render the patient unable to understand the nature, scope, AND possible consequences of the study."

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_finding_of_mental_disorder_now@@renders_patient_unable_to_understand_study_nature_scope_consequences)
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has mental conditions that render the patient unable to understand the nature, scope, AND possible consequences of the study."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_uncooperative_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has uncooperative behavior (e.g., an uncooperative attitude).","when_to_set_to_false":"Set to false if the patient currently does not have uncooperative behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncooperative behavior.","meaning":"Boolean indicating whether the patient currently has uncooperative behavior."} ;; "has an uncooperative attitude"
(declare-const patient_has_inability_to_return_for_follow_up_visits_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an inability to return for follow-up visits.","when_to_set_to_false":"Set to false if the patient currently does not have an inability to return for follow-up visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an inability to return for follow-up visits.","meaning":"Boolean indicating whether the patient currently has an inability to return for follow-up visits."} ;; "has an inability to return for follow-up visits"
(declare-const patient_is_unlikely_to_complete_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unlikely to complete the study.","when_to_set_to_false":"Set to false if the patient is currently likely to complete the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unlikely to complete the study.","meaning":"Boolean indicating whether the patient is currently unlikely to complete the study."} ;; "is unlikely to complete the study"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not (or patient_has_finding_of_uncooperative_behavior_now
            patient_has_inability_to_return_for_follow_up_visits_now
            patient_is_unlikely_to_complete_study_now))
   :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unlikely to comply with the protocol with non-exhaustive examples ((has an uncooperative attitude) OR (has an inability to return for follow-up visits) OR (is unlikely to complete the study))."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_finding_of_decreased_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impaired (decreased) hepatic function.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impaired (decreased) hepatic function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired (decreased) hepatic function.","meaning":"Boolean indicating whether the patient currently has impaired (decreased) hepatic function."} ;; "impaired hepatic function"
(declare-const patient_has_finding_of_decreased_liver_function_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impaired hepatic function is known (previously established or documented).","when_to_set_to_false":"Set to false if the patient's impaired hepatic function is not known (not previously established or documented, e.g., only suspected or undiagnosed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the impaired hepatic function is known.","meaning":"Boolean indicating whether the patient's impaired hepatic function is known (previously established or documented)."} ;; "known impaired hepatic function"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_decreased_liver_function_now@@known
      patient_has_finding_of_decreased_liver_function_now)
:named REQ18_AUXILIARY0)) ;; "known impaired hepatic function"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_has_finding_of_decreased_liver_function_now@@known)
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known impaired hepatic function."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impaired renal function (renal impairment).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impaired renal function (renal impairment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired renal function (renal impairment).","meaning":"Boolean indicating whether the patient currently has impaired renal function (renal impairment)."} ;; "impaired renal function"
(declare-const patient_has_finding_of_renal_impairment_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impaired renal function (renal impairment) is known (documented or established).","when_to_set_to_false":"Set to false if the patient's impaired renal function (renal impairment) is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's impaired renal function (renal impairment) is known.","meaning":"Boolean indicating whether the patient's impaired renal function (renal impairment) is known (documented or established)."} ;; "known impaired renal function"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_renal_impairment_now@@known
      patient_has_finding_of_renal_impairment_now)
    :named REQ19_AUXILIARY0)) ;; "known impaired renal function"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_finding_of_renal_impairment_now@@known)
    :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known impaired renal function."
