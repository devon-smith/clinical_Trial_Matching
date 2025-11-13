;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_disorder_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder of lung.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disorder of lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disorder of lung.","meaning":"Boolean indicating whether the patient currently has a diagnosis of disorder of lung."} ;; "pulmonary disease"
(declare-const patient_has_diagnosis_of_disorder_of_lung_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of disorder of lung is chronic.","when_to_set_to_false":"Set to false if the patient's current diagnosis of disorder of lung is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of disorder of lung is chronic.","meaning":"Boolean indicating whether the patient's current diagnosis of disorder of lung is chronic."} ;; "chronic"
(declare-const patient_has_diagnosis_of_disorder_of_lung_now@@sino_pulmonary Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of disorder of lung is sino-pulmonary.","when_to_set_to_false":"Set to false if the patient's current diagnosis of disorder of lung is not sino-pulmonary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of disorder of lung is sino-pulmonary.","meaning":"Boolean indicating whether the patient's current diagnosis of disorder of lung is sino-pulmonary."} ;; "sino-pulmonary"
(declare-const patient_has_undergone_standard_clinical_evaluation_to_rule_out_other_cause_of_chronic_sino_pulmonary_disease_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a standard clinical evaluation in the past to rule out other potential causes of chronic sino-pulmonary disease.","when_to_set_to_false":"Set to false if the patient has not undergone a standard clinical evaluation in the past to rule out other potential causes of chronic sino-pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a standard clinical evaluation in the past to rule out other potential causes of chronic sino-pulmonary disease.","meaning":"Boolean indicating whether the patient has undergone a standard clinical evaluation in the history to rule out other potential causes of chronic sino-pulmonary disease."} ;; "has NOT had a standard clinical evaluation to rule out other potential cause of chronic sino-pulmonary disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (not patient_has_undergone_standard_clinical_evaluation_to_rule_out_other_cause_of_chronic_sino_pulmonary_disease_in_the_history))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has NOT had a standard clinical evaluation to rule out other potential cause of chronic sino-pulmonary disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_cystic_fibrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cystic fibrosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cystic fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cystic fibrosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cystic fibrosis."} ;; "the patient has a known diagnosis of cystic fibrosis"

(declare-const patient_has_diagnosis_of_cystic_fibrosis_now@@classic_clinical_presentation Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cystic fibrosis and the presentation is classic clinical presentation.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of cystic fibrosis but the presentation is not classic clinical presentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the presentation is classic clinical presentation.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cystic fibrosis with classic clinical presentation."} ;; "with classic clinical presentation"

(declare-const sweat_chloride_level_value_recorded_now_withunit_mmol_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's sweat chloride level measured now, in mmol/L.","when_to_set_to_null":"Set to null if the sweat chloride level is not measured, not documented, or cannot be determined now.","meaning":"Numeric value indicating the patient's sweat chloride level measured now, in mmol/L."} ;; "sweat chloride level"

(declare-const sweat_chloride_level_value_recorded_now_withunit_mmol_per_l@@elevated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sweat chloride level measured now is considered elevated.","when_to_set_to_false":"Set to false if the patient's sweat chloride level measured now is not considered elevated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sweat chloride level measured now is elevated.","meaning":"Boolean indicating whether the patient's sweat chloride level measured now is elevated."} ;; "elevated sweat chloride level"

(declare-const patient_has_two_known_disease_causing_mutations_in_cftr_gene_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has two known disease-causing mutations in the CFTR gene.","when_to_set_to_false":"Set to false if the patient currently does not have two known disease-causing mutations in the CFTR gene.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has two known disease-causing mutations in the CFTR gene.","meaning":"Boolean indicating whether the patient currently has two known disease-causing mutations in the CFTR gene."} ;; "two known disease-causing mutations in the cystic fibrosis transmembrane conductance regulator (CFTR) gene"

(declare-const patient_has_diagnosis_of_cystic_fibrosis_now@@defined_by_two_known_disease_causing_mutations_in_cftr_gene Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cystic fibrosis and the diagnosis is defined by two known disease-causing mutations in the CFTR gene.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of cystic fibrosis but the diagnosis is not defined by two known disease-causing mutations in the CFTR gene.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is defined by two known disease-causing mutations in the CFTR gene.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cystic fibrosis defined by two known disease-causing mutations in the CFTR gene."} ;; "diagnosis of cystic fibrosis defined by two known disease-causing mutations in the CFTR gene"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_cystic_fibrosis_now@@classic_clinical_presentation
      patient_has_diagnosis_of_cystic_fibrosis_now)
:named REQ1_AUXILIARY0)) ;; "classic clinical presentation""

(assert
(! (=> patient_has_diagnosis_of_cystic_fibrosis_now@@defined_by_two_known_disease_causing_mutations_in_cftr_gene
      patient_has_diagnosis_of_cystic_fibrosis_now)
:named REQ1_AUXILIARY1)) ;; "diagnosis defined by two known disease-causing mutations in CFTR gene"

;; Definitional link: diagnosis defined by two mutations iff two mutations present
(assert
(! (= patient_has_diagnosis_of_cystic_fibrosis_now@@defined_by_two_known_disease_causing_mutations_in_cftr_gene
      patient_has_two_known_disease_causing_mutations_in_cftr_gene_now)
:named REQ1_AUXILIARY2)) ;; "diagnosis defined by two known disease-causing mutations in CFTR gene = two known disease-causing mutations in CFTR gene"

;; Definitional link: sweat chloride level elevated iff value is above threshold (commonly > 60 mmol/L, but not specified in requirement, so only use the Boolean variable)
;; No assertion needed unless threshold is specified.

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT satisfy the exclusion criterion
(assert
(! (not (and
          patient_has_diagnosis_of_cystic_fibrosis_now@@classic_clinical_presentation
          (or sweat_chloride_level_value_recorded_now_withunit_mmol_per_l@@elevated
              patient_has_two_known_disease_causing_mutations_in_cftr_gene_now)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a known diagnosis of cystic fibrosis with classic clinical presentation) AND ((the patient has an elevated sweat chloride level) OR (the patient has two known disease-causing mutations in the cystic fibrosis transmembrane conductance regulator (CFTR) gene)))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_tuberculosis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of tuberculosis at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of tuberculosis.","meaning":"Boolean indicating whether the patient has a history of tuberculosis."} ;; "the patient has a history of tuberculosis"

(declare-const patient_has_finding_of_bronchiectasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bronchiectasis.","when_to_set_to_false":"Set to false if the patient currently does not have bronchiectasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bronchiectasis.","meaning":"Boolean indicating whether the patient currently has bronchiectasis."} ;; "bronchiectasis"

(declare-const patient_has_finding_of_bronchiectasis_now@@has_known_explanation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bronchiectasis has a known explanation.","when_to_set_to_false":"Set to false if the patient's current bronchiectasis does not have a known explanation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bronchiectasis has a known explanation.","meaning":"Boolean indicating whether the patient's current bronchiectasis has a known explanation."} ;; "bronchiectasis has a known explanation"

(declare-const patient_has_finding_of_alpha_1_antitrypsin_deficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has alpha 1-antitrypsin deficiency.","when_to_set_to_false":"Set to false if the patient currently does not have alpha 1-antitrypsin deficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alpha 1-antitrypsin deficiency.","meaning":"Boolean indicating whether the patient currently has alpha 1-antitrypsin deficiency."} ;; "alpha 1-antitrypsin deficiency"

(declare-const patient_has_finding_of_alpha_1_antitrypsin_deficiency_now@@genotype_is_zz_or_zs Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current alpha 1-antitrypsin deficiency is of ZZ or ZS genotype.","when_to_set_to_false":"Set to false if the patient's current alpha 1-antitrypsin deficiency is not of ZZ or ZS genotype.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current alpha 1-antitrypsin deficiency is of ZZ or ZS genotype.","meaning":"Boolean indicating whether the patient's current alpha 1-antitrypsin deficiency is of ZZ or ZS genotype."} ;; "alpha 1-antitrypsin deficiency (ZZ or ZS)"

(declare-const patient_has_finding_of_primary_ciliary_dyskinesia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has primary ciliary dyskinesia.","when_to_set_to_false":"Set to false if the patient currently does not have primary ciliary dyskinesia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has primary ciliary dyskinesia.","meaning":"Boolean indicating whether the patient currently has primary ciliary dyskinesia."} ;; "primary ciliary dyskinesia"

(declare-const patient_has_finding_of_primary_ciliary_dyskinesia_now@@is_confirmed_or_probable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current primary ciliary dyskinesia is confirmed or probable.","when_to_set_to_false":"Set to false if the patient's current primary ciliary dyskinesia is not confirmed or probable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current primary ciliary dyskinesia is confirmed or probable.","meaning":"Boolean indicating whether the patient's current primary ciliary dyskinesia is confirmed or probable."} ;; "confirmed or probable primary ciliary dyskinesia"

(declare-const patient_has_finding_of_inflammatory_bowel_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inflammatory bowel disease.","when_to_set_to_false":"Set to false if the patient currently does not have inflammatory bowel disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inflammatory bowel disease.","meaning":"Boolean indicating whether the patient currently has inflammatory bowel disease."} ;; "inflammatory bowel disease"

(declare-const patient_has_finding_of_rheumatoid_arthritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient currently does not have rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has rheumatoid arthritis.","meaning":"Boolean indicating whether the patient currently has rheumatoid arthritis."} ;; "rheumatoid arthritis"

(declare-const patient_has_finding_of_sj_gren_s_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Sjogren's syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have Sjogren's syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Sjogren's syndrome.","meaning":"Boolean indicating whether the patient currently has Sjogren's syndrome."} ;; "Sjogren's syndrome"

(declare-const patient_has_finding_of_allergic_bronchopulmonary_aspergillosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has allergic bronchopulmonary aspergillosis.","when_to_set_to_false":"Set to false if the patient currently does not have allergic bronchopulmonary aspergillosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has allergic bronchopulmonary aspergillosis.","meaning":"Boolean indicating whether the patient currently has allergic bronchopulmonary aspergillosis."} ;; "allergic bronchopulmonary aspergillosis"

(declare-const patient_has_finding_of_allergic_bronchopulmonary_aspergillosis_now@@is_documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current allergic bronchopulmonary aspergillosis is documented.","when_to_set_to_false":"Set to false if the patient's current allergic bronchopulmonary aspergillosis is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current allergic bronchopulmonary aspergillosis is documented.","meaning":"Boolean indicating whether the patient's current allergic bronchopulmonary aspergillosis is documented."} ;; "documented allergic bronchopulmonary aspergillosis"

(declare-const patient_has_finding_of_primary_immunodeficiency_now@@is_documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has primary immunodeficiency and the diagnosis is documented.","when_to_set_to_false":"Set to false if the patient currently does not have primary immunodeficiency or the diagnosis is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has primary immunodeficiency and the diagnosis is documented.","meaning":"Boolean indicating whether the patient currently has primary immunodeficiency and the diagnosis is documented."} ;; "documented primary immunodeficiency"

(declare-const patient_has_finding_of_acquired_immunodeficiency_now@@is_documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acquired immunodeficiency and the diagnosis is documented.","when_to_set_to_false":"Set to false if the patient currently does not have acquired immunodeficiency or the diagnosis is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acquired immunodeficiency and the diagnosis is documented.","meaning":"Boolean indicating whether the patient currently has acquired immunodeficiency and the diagnosis is documented."} ;; "documented acquired immunodeficiency"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term (other known explanation for bronchiectasis)
(assert
(! (=> (or
        (and patient_has_finding_of_alpha_1_antitrypsin_deficiency_now
             patient_has_finding_of_alpha_1_antitrypsin_deficiency_now@@genotype_is_zz_or_zs)
        patient_has_finding_of_primary_ciliary_dyskinesia_now@@is_confirmed_or_probable
        patient_has_finding_of_inflammatory_bowel_disease_now
        patient_has_finding_of_rheumatoid_arthritis_now
        patient_has_finding_of_sj_gren_s_syndrome_now
        patient_has_finding_of_allergic_bronchopulmonary_aspergillosis_now@@is_documented
        patient_has_finding_of_primary_immunodeficiency_now@@is_documented
        patient_has_finding_of_acquired_immunodeficiency_now@@is_documented)
    patient_has_finding_of_bronchiectasis_now@@has_known_explanation)
:named REQ2_AUXILIARY0)) ;; "other known explanation for bronchiectasis with non-exhaustive examples (alpha 1-antitrypsin deficiency (ZZ or ZS), confirmed or probable primary ciliary dyskinesia, inflammatory bowel disease, rheumatoid arthritis, Sjogren's syndrome, allergic bronchopulmonary aspergillosis, documented primary immunodeficiency, documented acquired immunodeficiency)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_bronchiectasis_now@@has_known_explanation
      patient_has_finding_of_bronchiectasis_now)
:named REQ2_AUXILIARY1)) ;; "bronchiectasis has a known explanation"

(assert
(! (=> patient_has_finding_of_alpha_1_antitrypsin_deficiency_now@@genotype_is_zz_or_zs
      patient_has_finding_of_alpha_1_antitrypsin_deficiency_now)
:named REQ2_AUXILIARY2)) ;; "alpha 1-antitrypsin deficiency (ZZ or ZS)"

(assert
(! (=> patient_has_finding_of_primary_ciliary_dyskinesia_now@@is_confirmed_or_probable
      patient_has_finding_of_primary_ciliary_dyskinesia_now)
:named REQ2_AUXILIARY3)) ;; "confirmed or probable primary ciliary dyskinesia"

(assert
(! (=> patient_has_finding_of_allergic_bronchopulmonary_aspergillosis_now@@is_documented
      patient_has_finding_of_allergic_bronchopulmonary_aspergillosis_now)
:named REQ2_AUXILIARY4)) ;; "documented allergic bronchopulmonary aspergillosis"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_tuberculosis_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of tuberculosis."

(assert
(! (not patient_has_finding_of_bronchiectasis_now@@has_known_explanation)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other known explanation for bronchiectasis with non-exhaustive examples (alpha 1-antitrypsin deficiency (ZZ or ZS), confirmed or probable primary ciliary dyskinesia, inflammatory bowel disease, rheumatoid arthritis, Sjogren's syndrome, allergic bronchopulmonary aspergillosis, documented primary immunodeficiency, documented acquired immunodeficiency)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker (actively smokes tobacco now).","when_to_set_to_false":"Set to false if the patient is not currently a smoker (does not actively smoke tobacco now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} ;; "current smoker"
(declare-const tobacco_use_history_value_recorded_in_pack_years Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's cumulative tobacco use history in pack-years, as documented in the medical record.","when_to_set_to_null":"Set to null if the patient's tobacco use history in pack-years is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's cumulative tobacco use history in pack-years."} ;; "tobacco use history greater than 10 pack-years"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (or patient_has_finding_of_smoker_now
              (> tobacco_use_history_value_recorded_in_pack_years 10)))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is a current smoker) OR (the patient has a tobacco use history greater than 10 pack-years))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_solid_organ_transplant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a solid organ transplant at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone a solid organ transplant at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a solid organ transplant.","meaning":"Boolean indicating whether the patient has ever undergone a solid organ transplant at any time in their medical history."} ;; "solid organ transplant"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_undergone_solid_organ_transplant_inthehistory)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a prior solid organ transplant."
