;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_congenital_long_qt_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with congenital long-QTc syndrome at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with congenital long-QTc syndrome at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with congenital long-QTc syndrome.","meaning":"Boolean indicating whether the patient has ever been diagnosed with congenital long-QTc syndrome in their history."} ;; "congenital long-QTc syndrome"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_congenital_long_qt_syndrome_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known history of congenital long-QTc syndrome."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently known not to be breast-feeding.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breast-feeding.","meaning":"Boolean indicating whether the patient is currently breast-feeding."} ;; "breast-feeding"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Equate alternative breast-feeding variable names for completeness
(assert
(! (= patient_is_breastfeeding_now patients_breastfeeding_is_positive_now)
:named REQ1_AUXILIARY0)) ;; "the patient is breast-feeding" / "breast-feeding"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT be pregnant
(assert
(! (not patient_is_pregnant_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; Exclusion: patient must NOT be breast-feeding
(assert
(! (not patient_is_breastfeeding_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breast-feeding."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_hypersensitivity_to_telithromycin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to telithromycin.","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to telithromycin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to telithromycin.","meaning":"Boolean indicating whether the patient currently has hypersensitivity to telithromycin."} ;; "the patient has hypersensitivity to telithromycin"
(declare-const patient_has_finding_of_allergy_to_azithromycin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to azithromycin.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to azithromycin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to azithromycin.","meaning":"Boolean indicating whether the patient currently has an allergy to azithromycin."} ;; "the patient has hypersensitivity to azithromycin"
(declare-const patient_has_finding_of_hypersensitivity_to_macrolide_class_antibiotics_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to macrolide class antibiotics.","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to macrolide class antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to macrolide class antibiotics.","meaning":"Boolean indicating whether the patient currently has hypersensitivity to macrolide class antibiotics."} ;; "the patient has hypersensitivity to macrolide class antibiotics"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_finding_of_hypersensitivity_to_telithromycin_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to telithromycin."

(assert
  (! (not patient_has_finding_of_allergy_to_azithromycin_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to azithromycin."

(assert
  (! (not patient_has_finding_of_hypersensitivity_to_macrolide_class_antibiotics_now)
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to macrolide class antibiotics."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_requires_treatment_with_rifampin_within_2_weeks_prior_to_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with rifampin within two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient does not require treatment with rifampin within two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with rifampin within two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient requires treatment with rifampin within two weeks prior to Visit 1."} ;; "the patient requires treatment with rifampin within two weeks prior to Visit 1."
(declare-const patient_receives_treatment_with_rifampin_within_2_weeks_prior_to_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient receives treatment with rifampin within two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient does not receive treatment with rifampin within two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient receives treatment with rifampin within two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient receives treatment with rifampin within two weeks prior to Visit 1."} ;; "the patient receives treatment with rifampin within two weeks prior to Visit 1."
(declare-const patient_requires_treatment_with_phenytoin_within_2_weeks_prior_to_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with phenytoin within two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient does not require treatment with phenytoin within two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with phenytoin within two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient requires treatment with phenytoin within two weeks prior to Visit 1."} ;; "the patient requires treatment with phenytoin within two weeks prior to Visit 1."
(declare-const patient_receives_treatment_with_phenytoin_within_2_weeks_prior_to_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient receives treatment with phenytoin within two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient does not receive treatment with phenytoin within two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient receives treatment with phenytoin within two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient receives treatment with phenytoin within two weeks prior to Visit 1."} ;; "the patient receives treatment with phenytoin within two weeks prior to Visit 1."
(declare-const patient_requires_treatment_with_carbamazepine_within_2_weeks_prior_to_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with carbamazepine within two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient does not require treatment with carbamazepine within two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with carbamazepine within two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient requires treatment with carbamazepine within two weeks prior to Visit 1."} ;; "the patient requires treatment with carbamazepine within two weeks prior to Visit 1."
(declare-const patient_receives_treatment_with_carbamazepine_within_2_weeks_prior_to_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient receives treatment with carbamazepine within two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient does not receive treatment with carbamazepine within two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient receives treatment with carbamazepine within two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient receives treatment with carbamazepine within two weeks prior to Visit 1."} ;; "the patient receives treatment with carbamazepine within two weeks prior to Visit 1."
(declare-const patient_requires_treatment_with_phenobarbital_within_2_weeks_prior_to_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with phenobarbital within two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient does not require treatment with phenobarbital within two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with phenobarbital within two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient requires treatment with phenobarbital within two weeks prior to Visit 1."} ;; "the patient requires treatment with phenobarbital within two weeks prior to Visit 1."
(declare-const patient_receives_treatment_with_phenobarbital_within_2_weeks_prior_to_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient receives treatment with phenobarbital within two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient does not receive treatment with phenobarbital within two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient receives treatment with phenobarbital within two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient receives treatment with phenobarbital within two weeks prior to Visit 1."} ;; "the patient receives treatment with phenobarbital within two weeks prior to Visit 1."
(declare-const patient_requires_treatment_with_st_johns_wort_within_2_weeks_prior_to_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with St. John's wort (herbal supplement) within two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient does not require treatment with St. John's wort (herbal supplement) within two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with St. John's wort (herbal supplement) within two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient requires treatment with St. John's wort (herbal supplement) within two weeks prior to Visit 1."} ;; "the patient requires treatment with St. John's wort (herbal supplement) within two weeks prior to Visit 1."
(declare-const patient_receives_treatment_with_st_johns_wort_within_2_weeks_prior_to_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient receives treatment with St. John's wort (herbal supplement) within two weeks prior to Visit 1.","when_to_set_to_false":"Set to false if the patient does not receive treatment with St. John's wort (herbal supplement) within two weeks prior to Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient receives treatment with St. John's wort (herbal supplement) within two weeks prior to Visit 1.","meaning":"Boolean indicating whether the patient receives treatment with St. John's wort (herbal supplement) within two weeks prior to Visit 1."} ;; "the patient receives treatment with St. John's wort (herbal supplement) within two weeks prior to Visit 1."
(declare-const patient_requires_treatment_with_rifampin_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with rifampin during the study.","when_to_set_to_false":"Set to false if the patient does not require treatment with rifampin during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with rifampin during the study.","meaning":"Boolean indicating whether the patient requires treatment with rifampin during the study."} ;; "the patient requires treatment with rifampin during the study."
(declare-const patient_receives_treatment_with_rifampin_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient receives treatment with rifampin during the study.","when_to_set_to_false":"Set to false if the patient does not receive treatment with rifampin during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient receives treatment with rifampin during the study.","meaning":"Boolean indicating whether the patient receives treatment with rifampin during the study."} ;; "the patient receives treatment with rifampin during the study."
(declare-const patient_requires_treatment_with_phenytoin_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with phenytoin during the study.","when_to_set_to_false":"Set to false if the patient does not require treatment with phenytoin during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with phenytoin during the study.","meaning":"Boolean indicating whether the patient requires treatment with phenytoin during the study."} ;; "the patient requires treatment with phenytoin during the study."
(declare-const patient_receives_treatment_with_phenytoin_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient receives treatment with phenytoin during the study.","when_to_set_to_false":"Set to false if the patient does not receive treatment with phenytoin during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient receives treatment with phenytoin during the study.","meaning":"Boolean indicating whether the patient receives treatment with phenytoin during the study."} ;; "the patient receives treatment with phenytoin during the study."
(declare-const patient_requires_treatment_with_carbamazepine_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with carbamazepine during the study.","when_to_set_to_false":"Set to false if the patient does not require treatment with carbamazepine during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with carbamazepine during the study.","meaning":"Boolean indicating whether the patient requires treatment with carbamazepine during the study."} ;; "the patient requires treatment with carbamazepine during the study."
(declare-const patient_receives_treatment_with_carbamazepine_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient receives treatment with carbamazepine during the study.","when_to_set_to_false":"Set to false if the patient does not receive treatment with carbamazepine during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient receives treatment with carbamazepine during the study.","meaning":"Boolean indicating whether the patient receives treatment with carbamazepine during the study."} ;; "the patient receives treatment with carbamazepine during the study."
(declare-const patient_requires_treatment_with_phenobarbital_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with phenobarbital during the study.","when_to_set_to_false":"Set to false if the patient does not require treatment with phenobarbital during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with phenobarbital during the study.","meaning":"Boolean indicating whether the patient requires treatment with phenobarbital during the study."} ;; "the patient requires treatment with phenobarbital during the study."
(declare-const patient_receives_treatment_with_phenobarbital_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient receives treatment with phenobarbital during the study.","when_to_set_to_false":"Set to false if the patient does not receive treatment with phenobarbital during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient receives treatment with phenobarbital during the study.","meaning":"Boolean indicating whether the patient receives treatment with phenobarbital during the study."} ;; "the patient receives treatment with phenobarbital during the study."
(declare-const patient_requires_treatment_with_st_johns_wort_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with St. John's wort (herbal supplement) during the study.","when_to_set_to_false":"Set to false if the patient does not require treatment with St. John's wort (herbal supplement) during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with St. John's wort (herbal supplement) during the study.","meaning":"Boolean indicating whether the patient requires treatment with St. John's wort (herbal supplement) during the study."} ;; "the patient requires treatment with St. John's wort (herbal supplement) during the study."
(declare-const patient_receives_treatment_with_st_johns_wort_during_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient receives treatment with St. John's wort (herbal supplement) during the study.","when_to_set_to_false":"Set to false if the patient does not receive treatment with St. John's wort (herbal supplement) during the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient receives treatment with St. John's wort (herbal supplement) during the study.","meaning":"Boolean indicating whether the patient receives treatment with St. John's wort (herbal supplement) during the study."} ;; "the patient receives treatment with St. John's wort (herbal supplement) during the study."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_requires_treatment_with_rifampin_within_2_weeks_prior_to_visit_1)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with rifampin within two weeks prior to Visit 1."

(assert
(! (not patient_requires_treatment_with_phenytoin_within_2_weeks_prior_to_visit_1)
    :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with phenytoin within two weeks prior to Visit 1."

(assert
(! (not patient_requires_treatment_with_carbamazepine_within_2_weeks_prior_to_visit_1)
    :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with carbamazepine within two weeks prior to Visit 1."

(assert
(! (not patient_requires_treatment_with_phenobarbital_within_2_weeks_prior_to_visit_1)
    :named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with phenobarbital within two weeks prior to Visit 1."

(assert
(! (not patient_requires_treatment_with_st_johns_wort_within_2_weeks_prior_to_visit_1)
    :named REQ3_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with St. John's wort (herbal supplement) within two weeks prior to Visit 1."

(assert
(! (not patient_requires_treatment_with_rifampin_during_study)
    :named REQ3_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with rifampin during the study."

(assert
(! (not patient_receives_treatment_with_rifampin_during_study)
    :named REQ3_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient receives treatment with rifampin during the study."

(assert
(! (not patient_requires_treatment_with_phenytoin_during_study)
    :named REQ3_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with phenytoin during the study."

(assert
(! (not patient_receives_treatment_with_phenytoin_during_study)
    :named REQ3_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient receives treatment with phenytoin during the study."

(assert
(! (not patient_requires_treatment_with_carbamazepine_during_study)
    :named REQ3_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with carbamazepine during the study."

(assert
(! (not patient_receives_treatment_with_carbamazepine_during_study)
    :named REQ3_COMPONENT10_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient receives treatment with carbamazepine during the study."

(assert
(! (not patient_requires_treatment_with_phenobarbital_during_study)
    :named REQ3_COMPONENT11_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with phenobarbital during the study."

(assert
(! (not patient_receives_treatment_with_phenobarbital_during_study)
    :named REQ3_COMPONENT12_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient receives treatment with phenobarbital during the study."

(assert
(! (not patient_requires_treatment_with_st_johns_wort_during_study)
    :named REQ3_COMPONENT13_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment with St. John's wort (herbal supplement) during the study."

(assert
(! (not patient_receives_treatment_with_st_johns_wort_during_study)
    :named REQ3_COMPONENT14_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient receives treatment with St. John's wort (herbal supplement) during the study."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_requires_treatment_during_study_with_ergot_alkaloid_derivatives Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with ergot alkaloid derivatives at any time during the study period.","when_to_set_to_false":"Set to false if the patient does not require treatment with ergot alkaloid derivatives at any time during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with ergot alkaloid derivatives during the study.","meaning":"Boolean indicating whether the patient requires treatment during the study with ergot alkaloid derivatives."} ;; "the patient requires treatment during the study with ergot alkaloid derivatives"
(declare-const patient_requires_treatment_during_study_with_cisapride Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with cisapride at any time during the study period.","when_to_set_to_false":"Set to false if the patient does not require treatment with cisapride at any time during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with cisapride during the study.","meaning":"Boolean indicating whether the patient requires treatment during the study with cisapride."} ;; "the patient requires treatment during the study with cisapride"
(declare-const patient_requires_treatment_during_study_with_pimozide Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with pimozide at any time during the study period.","when_to_set_to_false":"Set to false if the patient does not require treatment with pimozide at any time during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with pimozide during the study.","meaning":"Boolean indicating whether the patient requires treatment during the study with pimozide."} ;; "the patient requires treatment during the study with pimozide"
(declare-const patient_requires_treatment_during_study_with_bromocriptine Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with bromocriptine at any time during the study period.","when_to_set_to_false":"Set to false if the patient does not require treatment with bromocriptine at any time during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with bromocriptine during the study.","meaning":"Boolean indicating whether the patient requires treatment during the study with bromocriptine."} ;; "the patient requires treatment during the study with bromocriptine"
(declare-const patient_requires_treatment_during_study_with_cabergoline Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with cabergoline at any time during the study period.","when_to_set_to_false":"Set to false if the patient does not require treatment with cabergoline at any time during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with cabergoline during the study.","meaning":"Boolean indicating whether the patient requires treatment during the study with cabergoline."} ;; "the patient requires treatment during the study with cabergoline"
(declare-const patient_requires_treatment_during_study_with_pergolide Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires treatment with pergolide at any time during the study period.","when_to_set_to_false":"Set to false if the patient does not require treatment with pergolide at any time during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires treatment with pergolide during the study.","meaning":"Boolean indicating whether the patient requires treatment during the study with pergolide."} ;; "the patient requires treatment during the study with pergolide"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_requires_treatment_during_study_with_ergot_alkaloid_derivatives)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment during the study with ergot alkaloid derivatives."

(assert
(! (not patient_requires_treatment_during_study_with_cisapride)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment during the study with cisapride."

(assert
(! (not patient_requires_treatment_during_study_with_pimozide)
    :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment during the study with pimozide."

(assert
(! (not patient_requires_treatment_during_study_with_bromocriptine)
    :named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment during the study with bromocriptine."

(assert
(! (not patient_requires_treatment_during_study_with_cabergoline)
    :named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment during the study with cabergoline."

(assert
(! (not patient_requires_treatment_during_study_with_pergolide)
    :named REQ4_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires treatment during the study with pergolide."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_previously_participated_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated in this study.","when_to_set_to_false":"Set to false if the patient has not previously participated in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated in this study.","meaning":"Boolean indicating whether the patient has previously participated in this study."} ;; "The patient is excluded if the patient has previously participated in this study."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_previously_participated_in_this_study)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously participated in this study."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_myasthenia_gravis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with myasthenia gravis at any point in their medical history, regardless of current status.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with myasthenia gravis at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with myasthenia gravis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of myasthenia gravis in their medical history."} ;; "myasthenia gravis"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_myasthenia_gravis_inthehistory)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previous history of myasthenia gravis."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_acute_respiratory_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute respiratory failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute respiratory failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute respiratory failure.","meaning":"Boolean indicating whether the patient currently has acute respiratory failure."} ;; "acute respiratory failure"

(declare-const patient_is_undergoing_airway_management_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing airway management.","when_to_set_to_false":"Set to false if the patient is currently not undergoing airway management.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing airway management.","meaning":"Boolean indicating whether the patient is currently undergoing airway management."} ;; "airway management"

(declare-const patient_is_undergoing_airway_management_now@@aggressive Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing airway management and the airway management is aggressive.","when_to_set_to_false":"Set to false if the patient is currently undergoing airway management and the airway management is not aggressive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the airway management is aggressive.","meaning":"Boolean indicating whether the patient's current airway management is aggressive."} ;; "aggressive airway management"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_airway_management_now@@aggressive
      patient_is_undergoing_airway_management_now)
:named REQ7_AUXILIARY0)) ;; "aggressive airway management" implies "airway management"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or patient_has_finding_of_acute_respiratory_failure_now
            patient_is_undergoing_airway_management_now@@aggressive))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has current acute respiratory failure) OR (the patient requires aggressive airway management)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_patient_in_hospital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently hospitalized (admitted to a hospital) now.","when_to_set_to_false":"Set to false if the patient is currently not hospitalized now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently hospitalized.","meaning":"Boolean indicating whether the patient is currently hospitalized (admitted to a hospital) at the present time."} ;; "hospitalized"
(declare-const patient_is_from_institutional_care_facility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently from an institutional care facility.","when_to_set_to_false":"Set to false if the patient is currently not from an institutional care facility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently from an institutional care facility.","meaning":"Boolean indicating whether the patient is currently from an institutional care facility."} ;; "the patient is from an institutional care facility"

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

(declare-const patient_is_taking_antibiotics_other_than_study_drug_during_treatment_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient plans to take antibiotics other than the study drug during the treatment period.","when_to_set_to_false":"Set to false if the patient does not plan to take antibiotics other than the study drug during the treatment period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient plans to take antibiotics other than the study drug during the treatment period.","meaning":"Boolean indicating whether the patient plans to take antibiotics other than the study drug during the treatment period."} ;; "the patient plans to take antibiotics other than the study drug during the treatment period"

(declare-const patient_is_taking_drug_or_medicament_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient will take a drug or medicament in the future.","when_to_set_to_false":"Set to false if the patient will not take a drug or medicament in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will take a drug or medicament in the future.","meaning":"Boolean indicating whether the patient will take a drug or medicament in the future."} ;; "drug"

(declare-const patient_is_taking_drug_or_medicament_inthefuture@@is_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament being taken in the future is the study drug.","when_to_set_to_false":"Set to false if the drug or medicament being taken in the future is not the study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament being taken in the future is the study drug.","meaning":"Boolean indicating whether the drug or medicament being taken in the future is the study drug."} ;; "drug is the study drug"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; "The patient plans to take antibiotics other than the study drug during the treatment period" is true iff the patient will take a drug or medicament in the future and it is not the study drug
(assert
(! (= patient_is_taking_antibiotics_other_than_study_drug_during_treatment_period
     (and patient_is_taking_drug_or_medicament_inthefuture
          (not patient_is_taking_drug_or_medicament_inthefuture@@is_study_drug)))
:named REQ9_AUXILIARY0)) ;; "the patient plans to take antibiotics other than the study drug during the treatment period"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_is_taking_drug_or_medicament_inthefuture@@is_study_drug
       patient_is_taking_drug_or_medicament_inthefuture)
:named REQ9_AUXILIARY1)) ;; "drug is the study drug" implies "drug"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_been_treated_with_oral_antibiotics_within_14_days_prior_to_enrollment)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has been treated with oral antibiotics within fourteen days prior to enrollment"

(assert
(! (not patient_has_been_treated_with_parenteral_antibiotics_within_14_days_prior_to_enrollment)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has been treated with parenteral antibiotics within fourteen days prior to enrollment"

(assert
(! (not patient_is_taking_antibiotics_other_than_study_drug_during_treatment_period)
:named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient plans to take antibiotics other than the study drug during the treatment period"

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_receiving_other_medications_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving any medications other than the study drug.","when_to_set_to_false":"Set to false if the patient is not currently receiving any medications other than the study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving any medications other than the study drug.","meaning":"Boolean indicating whether the patient is currently receiving any medications other than the study drug."} ;; "the patient is receiving other medications"

(declare-const patient_is_receiving_other_medications_now@@is_systemic_antimicrobial_agent Bool) ;; {"when_to_set_to_true":"Set to true if the medication the patient is currently receiving is a systemic antimicrobial agent.","when_to_set_to_false":"Set to false if the medication the patient is currently receiving is not a systemic antimicrobial agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medication the patient is currently receiving is a systemic antimicrobial agent.","meaning":"Boolean indicating whether the medication the patient is currently receiving is a systemic antimicrobial agent."} ;; "systemic antimicrobial agents"

(declare-const patient_has_diagnosis_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any disease."} ;; "other disease conditions"

(declare-const patient_has_diagnosis_of_disease_now@@could_interfere_with_evaluation_of_drug_efficacy_or_safety Bool) ;; {"when_to_set_to_true":"Set to true if the disease diagnosis could interfere with the evaluation of drug efficacy or safety.","when_to_set_to_false":"Set to false if the disease diagnosis could not interfere with the evaluation of drug efficacy or safety.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease diagnosis could interfere with the evaluation of drug efficacy or safety.","meaning":"Boolean indicating whether the disease diagnosis could interfere with the evaluation of drug efficacy or safety."} ;; "other disease conditions that could interfere with the evaluation of drug efficacy or safety"

(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any disorder due to infection."} ;; "other infections"

(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now@@could_interfere_with_evaluation_of_drug_efficacy_or_safety Bool) ;; {"when_to_set_to_true":"Set to true if the infection diagnosis could interfere with the evaluation of drug efficacy or safety.","when_to_set_to_false":"Set to false if the infection diagnosis could not interfere with the evaluation of drug efficacy or safety.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection diagnosis could interfere with the evaluation of drug efficacy or safety.","meaning":"Boolean indicating whether the infection diagnosis could interfere with the evaluation of drug efficacy or safety."} ;; "other infections that could interfere with the evaluation of drug efficacy or safety"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Non-exhaustive example: systemic antimicrobial agents are a subclass of other medications
(assert
(! (=> patient_is_receiving_other_medications_now@@is_systemic_antimicrobial_agent
     patient_is_receiving_other_medications_now)
:named REQ10_AUXILIARY0)) ;; "systemic antimicrobial agents" is a non-exhaustive example of "other medications"

;; Qualifier variables imply corresponding stem variables (disease)
(assert
(! (=> patient_has_diagnosis_of_disease_now@@could_interfere_with_evaluation_of_drug_efficacy_or_safety
     patient_has_diagnosis_of_disease_now)
:named REQ10_AUXILIARY1)) ;; "other disease conditions that could interfere with the evaluation of drug efficacy or safety"

;; Qualifier variables imply corresponding stem variables (infection)
(assert
(! (=> patient_has_diagnosis_of_disorder_due_to_infection_now@@could_interfere_with_evaluation_of_drug_efficacy_or_safety
     patient_has_diagnosis_of_disorder_due_to_infection_now)
:named REQ10_AUXILIARY2)) ;; "other infections that could interfere with the evaluation of drug efficacy or safety"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_receiving_other_medications_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient is receiving other medications with non-exhaustive examples (systemic antimicrobial agents)"

(assert
(! (not patient_has_diagnosis_of_disease_now@@could_interfere_with_evaluation_of_drug_efficacy_or_safety)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has other disease conditions that could interfere with the evaluation of drug efficacy or safety"

(assert
(! (not patient_has_diagnosis_of_disorder_due_to_infection_now@@could_interfere_with_evaluation_of_drug_efficacy_or_safety)
:named REQ10_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has other infections that could interfere with the evaluation of drug efficacy or safety"

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_clinically_relevant_cardiovascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinically relevant cardiovascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinically relevant cardiovascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically relevant cardiovascular disease.","meaning":"Boolean indicating whether the patient currently has a clinically relevant cardiovascular disease."} ;; "clinically relevant cardiovascular disease"
(declare-const patient_has_finding_of_clinically_relevant_cardiovascular_disease_now@@makes_protocol_implementation_or_study_interpretation_difficult Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinically relevant cardiovascular disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_false":"Set to false if the patient's clinically relevant cardiovascular disease does not make either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's clinically relevant cardiovascular disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","meaning":"Boolean indicating whether the patient's clinically relevant cardiovascular disease makes either implementation of the protocol difficult or interpretation of the study results difficult."} ;; "clinically relevant cardiovascular disease ... that makes either implementation of the protocol difficult or interpretation of the study results difficult"
(declare-const patient_has_finding_of_clinically_relevant_hepatic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinically relevant hepatic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinically relevant hepatic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically relevant hepatic disease.","meaning":"Boolean indicating whether the patient currently has a clinically relevant hepatic disease."} ;; "clinically relevant hepatic disease"
(declare-const patient_has_finding_of_clinically_relevant_hepatic_disease_now@@makes_protocol_implementation_or_study_interpretation_difficult Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinically relevant hepatic disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_false":"Set to false if the patient's clinically relevant hepatic disease does not make either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's clinically relevant hepatic disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","meaning":"Boolean indicating whether the patient's clinically relevant hepatic disease makes either implementation of the protocol difficult or interpretation of the study results difficult."} ;; "clinically relevant hepatic disease ... that makes either implementation of the protocol difficult or interpretation of the study results difficult"
(declare-const patient_has_finding_of_clinically_relevant_neurologic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinically relevant neurologic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinically relevant neurologic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically relevant neurologic disease.","meaning":"Boolean indicating whether the patient currently has a clinically relevant neurologic disease."} ;; "clinically relevant neurologic disease"
(declare-const patient_has_finding_of_clinically_relevant_neurologic_disease_now@@makes_protocol_implementation_or_study_interpretation_difficult Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinically relevant neurologic disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_false":"Set to false if the patient's clinically relevant neurologic disease does not make either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's clinically relevant neurologic disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","meaning":"Boolean indicating whether the patient's clinically relevant neurologic disease makes either implementation of the protocol difficult or interpretation of the study results difficult."} ;; "clinically relevant neurologic disease ... that makes either implementation of the protocol difficult or interpretation of the study results difficult"
(declare-const patient_has_finding_of_clinically_relevant_endocrine_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinically relevant endocrine disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinically relevant endocrine disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinically relevant endocrine disease.","meaning":"Boolean indicating whether the patient currently has a clinically relevant endocrine disease."} ;; "clinically relevant endocrine disease"
(declare-const patient_has_finding_of_clinically_relevant_endocrine_disease_now@@makes_protocol_implementation_or_study_interpretation_difficult Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinically relevant endocrine disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_false":"Set to false if the patient's clinically relevant endocrine disease does not make either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's clinically relevant endocrine disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","meaning":"Boolean indicating whether the patient's clinically relevant endocrine disease makes either implementation of the protocol difficult or interpretation of the study results difficult."} ;; "clinically relevant endocrine disease ... that makes either implementation of the protocol difficult or interpretation of the study results difficult"
(declare-const patient_has_finding_of_major_systemic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a major systemic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a major systemic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a major systemic disease.","meaning":"Boolean indicating whether the patient currently has a major systemic disease."} ;; "other major systemic disease"
(declare-const patient_has_finding_of_major_systemic_disease_now@@makes_protocol_implementation_or_study_interpretation_difficult Bool) ;; {"when_to_set_to_true":"Set to true if the patient's major systemic disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_false":"Set to false if the patient's major systemic disease does not make either implementation of the protocol difficult or interpretation of the study results difficult.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's major systemic disease makes either implementation of the protocol difficult or interpretation of the study results difficult.","meaning":"Boolean indicating whether the patient's major systemic disease makes either implementation of the protocol difficult or interpretation of the study results difficult."} ;; "other major systemic disease ... that makes either implementation of the protocol difficult or interpretation of the study results difficult"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Non-exhaustive examples: listed diseases are examples of concomitant conditions
(assert
(! (=> (or patient_has_finding_of_clinically_relevant_cardiovascular_disease_now@@makes_protocol_implementation_or_study_interpretation_difficult
          patient_has_finding_of_clinically_relevant_hepatic_disease_now@@makes_protocol_implementation_or_study_interpretation_difficult
          patient_has_finding_of_clinically_relevant_neurologic_disease_now@@makes_protocol_implementation_or_study_interpretation_difficult
          patient_has_finding_of_clinically_relevant_endocrine_disease_now@@makes_protocol_implementation_or_study_interpretation_difficult
          patient_has_finding_of_major_systemic_disease_now@@makes_protocol_implementation_or_study_interpretation_difficult)
     patient_has_diagnosis_of_disease_now@@could_interfere_with_evaluation_of_drug_efficacy_or_safety)
:named REQ11_AUXILIARY0)) ;; "with non-exhaustive examples ((clinically relevant cardiovascular disease) OR (clinically relevant hepatic disease) OR (clinically relevant neurologic disease) OR (clinically relevant endocrine disease) OR (other major systemic disease))"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_clinically_relevant_cardiovascular_disease_now@@makes_protocol_implementation_or_study_interpretation_difficult
      patient_has_finding_of_clinically_relevant_cardiovascular_disease_now)
:named REQ11_AUXILIARY1)) ;; "clinically relevant cardiovascular disease ... that makes either implementation of the protocol difficult or interpretation of the study results difficult"

(assert
(! (=> patient_has_finding_of_clinically_relevant_hepatic_disease_now@@makes_protocol_implementation_or_study_interpretation_difficult
      patient_has_finding_of_clinically_relevant_hepatic_disease_now)
:named REQ11_AUXILIARY2)) ;; "clinically relevant hepatic disease ... that makes either implementation of the protocol difficult or interpretation of the study results difficult"

(assert
(! (=> patient_has_finding_of_clinically_relevant_neurologic_disease_now@@makes_protocol_implementation_or_study_interpretation_difficult
      patient_has_finding_of_clinically_relevant_neurologic_disease_now)
:named REQ11_AUXILIARY3)) ;; "clinically relevant neurologic disease ... that makes either implementation of the protocol difficult or interpretation of the study results difficult"

(assert
(! (=> patient_has_finding_of_clinically_relevant_endocrine_disease_now@@makes_protocol_implementation_or_study_interpretation_difficult
      patient_has_finding_of_clinically_relevant_endocrine_disease_now)
:named REQ11_AUXILIARY4)) ;; "clinically relevant endocrine disease ... that makes either implementation of the protocol difficult or interpretation of the study results difficult"

(assert
(! (=> patient_has_finding_of_major_systemic_disease_now@@makes_protocol_implementation_or_study_interpretation_difficult
      patient_has_finding_of_major_systemic_disease_now)
:named REQ11_AUXILIARY5)) ;; "other major systemic disease ... that makes either implementation of the protocol difficult or interpretation of the study results difficult"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_diagnosis_of_disease_now@@could_interfere_with_evaluation_of_drug_efficacy_or_safety)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a concomitant condition ... that makes either implementation of the protocol difficult or interpretation of the study results difficult."

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
(declare-const patient_has_investigational_device_treatment_planned_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient has investigational device treatment planned during the study period.","when_to_set_to_false":"Set to false if the patient does not have investigational device treatment planned during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has investigational device treatment planned during the study period.","meaning":"Boolean indicating whether the patient has investigational device treatment planned during the study period."} ;; "the patient has such treatment planned during the study period"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_received_investigational_drug_within_1_month_prior_to_study_entry)
    :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has received any other investigational drug within 1 month prior to study entry"

(assert
(! (not patient_has_received_investigational_device_within_1_month_prior_to_study_entry)
    :named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has received any investigational device within 1 month prior to study entry"

(assert
(! (not patient_has_investigational_device_treatment_planned_during_study_period)
    :named REQ13_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has such treatment planned during the study period"

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_drug_abuse_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of drug abuse that occurred within the previous 3 months.","when_to_set_to_false":"Set to false if the patient does not have a documented history of drug abuse within the previous 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of drug abuse within the previous 3 months.","meaning":"Boolean indicating whether the patient has a history of drug abuse within the previous 3 months."} ;; "the patient has a history of drug abuse within the previous 3 months"
(declare-const patient_has_finding_of_alcohol_abuse_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of alcohol abuse that occurred within the previous 3 months.","when_to_set_to_false":"Set to false if the patient does not have a documented history of alcohol abuse within the previous 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol abuse within the previous 3 months.","meaning":"Boolean indicating whether the patient has a history of alcohol abuse within the previous 3 months."} ;; "the patient has a history of alcohol abuse within the previous 3 months"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_drug_abuse_inthepast3months)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of drug abuse within the previous 3 months."

(assert
(! (not patient_has_finding_of_alcohol_abuse_inthepast3months)
:named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of alcohol abuse within the previous 3 months."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_patient_immunocompromised_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently immunocompromised.","when_to_set_to_false":"Set to false if the patient is currently not immunocompromised.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently immunocompromised.","meaning":"Boolean indicating whether the patient is currently immunocompromised."} ;; "immunocompromised"

(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of human immunodeficiency virus infection."} ;; "has known human immunodeficiency virus infection"

(declare-const patient_absolute_cd4_count_procedure_value_recorded_now_withunit_cells_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if a CD4 count (cells per cubic millimeter) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's most recent CD4 count (cells per cubic millimeter) recorded now."} ;; "CD4 count < 200 cells per cubic millimeter"

(declare-const patient_has_finding_of_neutropenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has neutropenia.","when_to_set_to_false":"Set to false if the patient currently does not have neutropenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has neutropenia.","meaning":"Boolean indicating whether the patient currently has neutropenia."} ;; "has known neutropenia"

(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a corticosteroid or corticosteroid derivative containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a corticosteroid or corticosteroid derivative containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a corticosteroid or corticosteroid derivative containing product.","meaning":"Boolean indicating whether the patient is currently taking a corticosteroid or corticosteroid derivative containing product."} ;; "is receiving chronic corticosteroid therapy"

(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@chronic_use_at_least_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a corticosteroid or corticosteroid derivative containing product and has been doing so for at least the past 3 months.","when_to_set_to_false":"Set to false if the patient is currently taking a corticosteroid or corticosteroid derivative containing product but not for at least the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been taking corticosteroids for at least the past 3 months.","meaning":"Boolean indicating whether the patient is currently taking corticosteroids and the therapy has been chronic for at least 3 months."} ;; "chronic corticosteroid therapy (for at least the past 3 months)"

(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@prednisolone_or_equivalent_dose_at_least_10_mg_per_day Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a corticosteroid or corticosteroid derivative containing product at a dose of prednisolone or equivalent at least 10 mg per day.","when_to_set_to_false":"Set to false if the patient is currently taking a corticosteroid or corticosteroid derivative containing product but at a dose less than 10 mg per day.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose is at least 10 mg per day.","meaning":"Boolean indicating whether the patient is currently taking corticosteroids at a dose of prednisolone or equivalent at least 10 mg per day."} ;; "prednisolone therapy or equivalent dose ≥ 10 milligrams per day"

(declare-const patient_prednisolone_or_equivalent_dose_value_recorded_now_withunit_mg_per_day Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current daily dose of prednisolone or equivalent corticosteroid is recorded, in milligrams per day.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current daily dose of prednisolone or equivalent corticosteroid, in milligrams per day."} ;; "prednisolone therapy or equivalent dose ≥ 10 milligrams per day"

(declare-const patient_has_received_prednisolone_or_equivalent_therapy_for_at_least_3_months_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received prednisolone or equivalent corticosteroid therapy for at least the past 3 months as of now.","when_to_set_to_false":"Set to false if the patient has not received prednisolone or equivalent corticosteroid therapy for at least the past 3 months as of now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received prednisolone or equivalent corticosteroid therapy for at least the past 3 months as of now.","meaning":"Boolean indicating whether the patient has received prednisolone or equivalent corticosteroid therapy for at least the past 3 months as of now."} ;; "prednisolone therapy or equivalent for at least the past 3 months"

(declare-const patient_has_undergone_immunosuppressant_drug_therapy_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone immunosuppressant drug therapy within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not undergone immunosuppressant drug therapy within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone immunosuppressant drug therapy within the past 6 months.","meaning":"Boolean indicating whether the patient has undergone immunosuppressant drug therapy within the past 6 months."} ;; "is receiving immunosuppressant treatment ... within the previous 6 months"

(declare-const patient_has_undergone_immunosuppressant_drug_therapy_inthepast6months@@excludes_corticosteroids Bool) ;; {"when_to_set_to_true":"Set to true if the immunosuppressant drug therapy undergone within the past 6 months excludes corticosteroids.","when_to_set_to_false":"Set to false if the immunosuppressant drug therapy includes corticosteroids.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether corticosteroids were excluded.","meaning":"Boolean indicating whether the immunosuppressant drug therapy undergone within the past 6 months excludes corticosteroids."} ;; "immunosuppressant treatment other than corticosteroids within the previous 6 months"

(declare-const patient_has_finding_of_splenectomy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone splenectomy and is currently splenectomized.","when_to_set_to_false":"Set to false if the patient has not undergone splenectomy and is not currently splenectomized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone splenectomy.","meaning":"Boolean indicating whether the patient currently has undergone splenectomy (is splenectomized)."} ;; "is splenectomized"

(declare-const patient_has_finding_of_hyposplenism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hyposplenism.","when_to_set_to_false":"Set to false if the patient currently does not have hyposplenism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hyposplenism.","meaning":"Boolean indicating whether the patient currently has hyposplenism."} ;; "has known hyposplenia"

(declare-const patient_has_finding_of_asplenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has asplenia.","when_to_set_to_false":"Set to false if the patient currently does not have asplenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has asplenia.","meaning":"Boolean indicating whether the patient currently has asplenia."} ;; "has known asplenia"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> 
      (or 
        (and patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now
             (< patient_absolute_cd4_count_procedure_value_recorded_now_withunit_cells_per_cubic_millimeter 200))
        patient_has_finding_of_neutropenia_now
        (and patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now
             patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@chronic_use_at_least_3_months
             patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@prednisolone_or_equivalent_dose_at_least_10_mg_per_day)
        (and patient_has_received_prednisolone_or_equivalent_therapy_for_at_least_3_months_now
             (>= patient_prednisolone_or_equivalent_dose_value_recorded_now_withunit_mg_per_day 10))
        (and patient_has_undergone_immunosuppressant_drug_therapy_inthepast6months
             patient_has_undergone_immunosuppressant_drug_therapy_inthepast6months@@excludes_corticosteroids)
        patient_has_finding_of_splenectomy_now
        patient_has_finding_of_hyposplenism_now
        patient_has_finding_of_asplenia_now)
    patient_has_finding_of_patient_immunocompromised_now)
:named REQ15_AUXILIARY0)) ;; "with non-exhaustive examples ((has known human immunodeficiency virus infection (CD4 count < 200 cells per cubic millimeter)) OR (has known neutropenia (neutrophil count < 1500 cells per cubic millimeter)) OR (is receiving chronic corticosteroid therapy (prednisolone therapy or equivalent dose ≥ 10 milligrams per day for at least the past 3 months)) OR (is receiving immunosuppressant treatment other than corticosteroids within the previous 6 months) OR (is splenectomized) OR (has known hyposplenia) OR (has known asplenia))"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@chronic_use_at_least_3_months
      patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
:named REQ15_AUXILIARY1)) ;; "chronic corticosteroid therapy (for at least the past 3 months)"

(assert
(! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@prednisolone_or_equivalent_dose_at_least_10_mg_per_day
      patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
:named REQ15_AUXILIARY2)) ;; "prednisolone therapy or equivalent dose ≥ 10 milligrams per day"

(assert
(! (=> patient_has_undergone_immunosuppressant_drug_therapy_inthepast6months@@excludes_corticosteroids
      patient_has_undergone_immunosuppressant_drug_therapy_inthepast6months)
:named REQ15_AUXILIARY3)) ;; "immunosuppressant treatment other than corticosteroids within the previous 6 months"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_patient_immunocompromised_now)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is immunocompromised with non-exhaustive examples ..."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental disorder.","meaning":"Boolean indicating whether the patient currently has a mental disorder."} ;; "mental conditions"

(declare-const patient_has_finding_of_mental_disorder_now@@renders_patient_unable_to_understand_study_nature_scope_consequences Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder and the disorder renders the patient unable to understand the nature, scope, and possible consequences of the study.","when_to_set_to_false":"Set to false if the patient currently has a mental disorder but the disorder does not render the patient unable to understand the nature, scope, and possible consequences of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mental disorder renders the patient unable to understand the nature, scope, and possible consequences of the study.","meaning":"Boolean indicating whether the patient's mental disorder renders them unable to understand the nature, scope, and possible consequences of the study."} ;; "mental conditions that render the patient unable to understand the nature, scope, AND possible consequences of the study."

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
(declare-const patient_has_finding_of_uncooperative_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of uncooperative behavior (e.g., an uncooperative attitude).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of uncooperative behavior.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncooperative behavior.","meaning":"Boolean indicating whether the patient currently has uncooperative behavior."} ;; "has an uncooperative attitude"
(declare-const patient_has_inability_to_return_for_follow_up_visits Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to return for follow-up visits as required by the protocol.","when_to_set_to_false":"Set to false if the patient is able to return for follow-up visits as required by the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to return for follow-up visits as required by the protocol.","meaning":"Boolean indicating whether the patient has an inability to return for follow-up visits."} ;; "has an inability to return for follow-up visits"
(declare-const patient_is_unlikely_to_complete_the_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is judged to be unlikely to complete the study for any reason.","when_to_set_to_false":"Set to false if the patient is judged to be likely to complete the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unlikely to complete the study.","meaning":"Boolean indicating whether the patient is unlikely to complete the study."} ;; "is unlikely to complete the study"

(declare-const patient_is_unlikely_to_comply_with_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient is judged to be unlikely to comply with the study protocol for any reason, including but not limited to uncooperative attitude, inability to return for follow-up visits, or being unlikely to complete the study.","when_to_set_to_false":"Set to false if the patient is judged to be likely to comply with the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unlikely to comply with the protocol.","meaning":"Boolean indicating whether the patient is unlikely to comply with the study protocol."} ;; "unlikely to comply with the protocol"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_uncooperative_behavior_now
           patient_has_inability_to_return_for_follow_up_visits
           patient_is_unlikely_to_complete_the_study)
       patient_is_unlikely_to_comply_with_protocol)
   :named REQ17_AUXILIARY0)) ;; "with non-exhaustive examples ((has an uncooperative attitude) OR (has an inability to return for follow-up visits) OR (is unlikely to complete the study))."

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_is_unlikely_to_comply_with_protocol)
   :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unlikely to comply with the protocol with non-exhaustive examples ((has an uncooperative attitude) OR (has an inability to return for follow-up visits) OR (is unlikely to complete the study))."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_clinically_relevant_hepatic_disease_now@@known
       patient_has_finding_of_clinically_relevant_hepatic_disease_now)
   :named REQ18_AUXILIARY0)) ;; "known impaired hepatic function"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_has_finding_of_clinically_relevant_hepatic_disease_now@@known)
   :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known impaired hepatic function."
