;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged > 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged > 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_capable_of_providing_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient is capable of providing informed consent.","when_to_set_to_false":"Set to false if the patient is not capable of providing informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is capable of providing informed consent.","meaning":"Boolean indicating whether the patient is capable of providing informed consent."} ;; "To be included, the patient must be capable of providing informed consent."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_capable_of_providing_informed_consent
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be capable of providing informed consent."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_carcinomatosis_of_peritoneal_cavity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of peritoneal carcinomatosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of peritoneal carcinomatosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of peritoneal carcinomatosis.","meaning":"Boolean indicating whether the patient currently has peritoneal carcinomatosis."} ;; "peritoneal carcinomatosis"
(declare-const patient_has_finding_of_carcinomatosis_of_peritoneal_cavity_now@@histologically_confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's peritoneal carcinomatosis diagnosis is histologically confirmed.","when_to_set_to_false":"Set to false if the patient's peritoneal carcinomatosis diagnosis is not histologically confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the peritoneal carcinomatosis diagnosis is histologically confirmed.","meaning":"Boolean indicating whether the patient's peritoneal carcinomatosis diagnosis is histologically confirmed."} ;; "histologically confirmed peritoneal carcinomatosis"
(declare-const patient_has_finding_of_carcinomatosis_of_peritoneal_cavity_now@@from_appendiceal_colorectal_ovarian_mesothelioma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's peritoneal carcinomatosis is from appendiceal carcinoma, colorectal carcinoma, ovarian carcinoma, or primary mesothelioma.","when_to_set_to_false":"Set to false if the patient's peritoneal carcinomatosis is not from any of these sources.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the peritoneal carcinomatosis is from one of these sources.","meaning":"Boolean indicating whether the patient's peritoneal carcinomatosis is from appendiceal carcinoma, colorectal carcinoma, ovarian carcinoma, or primary mesothelioma."} ;; "peritoneal carcinomatosis from appendiceal carcinoma, colorectal carcinoma, ovarian carcinoma, or primary mesothelioma"
(declare-const patient_has_finding_of_systemic_metastases_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has systemic metastases.","when_to_set_to_false":"Set to false if the patient currently does not have systemic metastases.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has systemic metastases.","meaning":"Boolean indicating whether the patient currently has systemic metastases."} ;; "no systemic metastases"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_carcinomatosis_of_peritoneal_cavity_now@@histologically_confirmed
         patient_has_finding_of_carcinomatosis_of_peritoneal_cavity_now)
     :named REQ2_AUXILIARY0)) ;; "histologically confirmed peritoneal carcinomatosis"

(assert
  (! (=> patient_has_finding_of_carcinomatosis_of_peritoneal_cavity_now@@from_appendiceal_colorectal_ovarian_mesothelioma
         patient_has_finding_of_carcinomatosis_of_peritoneal_cavity_now)
     :named REQ2_AUXILIARY1)) ;; "peritoneal carcinomatosis from appendiceal carcinoma, colorectal carcinoma, ovarian carcinoma, or primary mesothelioma"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Must have histologically confirmed peritoneal carcinomatosis from exhaustive subcategories
(assert
  (! (and patient_has_finding_of_carcinomatosis_of_peritoneal_cavity_now@@histologically_confirmed
          patient_has_finding_of_carcinomatosis_of_peritoneal_cavity_now@@from_appendiceal_colorectal_ovarian_mesothelioma)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "histologically confirmed peritoneal carcinomatosis from appendiceal carcinoma, colorectal carcinoma, ovarian carcinoma, or primary mesothelioma"

;; Component 1: Must have no systemic metastases
(assert
  (! (not patient_has_finding_of_systemic_metastases_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "no systemic metastases"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_disorder_of_peritoneum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of peritoneal disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of peritoneal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peritoneal disease.","meaning":"Boolean indicating whether the patient currently has peritoneal disease."} ;; "evidence of peritoneal disease"
(declare-const patient_has_finding_of_disorder_of_peritoneum_now@@low_volume_by_peritoneal_cancer_index_lt_10_by_imaging_or_laparoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peritoneal disease and the disease is low-volume, defined as PCI < 10 by cross-sectional imaging or diagnostic laparoscopy findings.","when_to_set_to_false":"Set to false if the patient currently has peritoneal disease but the disease is not low-volume by this definition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's peritoneal disease is low-volume by PCI < 10 by imaging or laparoscopy.","meaning":"Boolean indicating whether the patient's current peritoneal disease is low-volume as defined by PCI < 10 by imaging or laparoscopy."} ;; "low-volume peritoneal disease defined by peritoneal cancer index < 10 based on imaging or laparoscopy"
(declare-const peritoneal_cancer_index_value_recorded_now_withunit_integer Int) ;; {"when_to_set_to_value":"Set to the integer value of the patient's peritoneal cancer index as recorded now.","when_to_set_to_null":"Set to null if the patient's peritoneal cancer index value is unknown, not documented, or cannot be determined as recorded now.","meaning":"Numeric value representing the patient's peritoneal cancer index (PCI) as recorded now, measured as an integer."} ;; "peritoneal cancer index"
(declare-const peritoneal_cancer_index_value_recorded_now_withunit_integer@@based_on_cross_sectional_imaging_or_diagnostic_laparoscopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's PCI value recorded now is determined based on cross-sectional imaging findings or diagnostic laparoscopy findings.","when_to_set_to_false":"Set to false if the patient's PCI value recorded now is not determined based on cross-sectional imaging findings or diagnostic laparoscopy findings.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the PCI value recorded now is based on cross-sectional imaging findings or diagnostic laparoscopy findings.","meaning":"Boolean indicating whether the patient's PCI value recorded now is determined based on cross-sectional imaging findings or diagnostic laparoscopy findings."} ;; "PCI based on cross-sectional imaging or diagnostic laparoscopy"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_disorder_of_peritoneum_now@@low_volume_by_peritoneal_cancer_index_lt_10_by_imaging_or_laparoscopy
         patient_has_finding_of_disorder_of_peritoneum_now)
     :named REQ3_AUXILIARY0)) ;; "low-volume peritoneal disease defined by PCI < 10 by imaging or laparoscopy" implies "peritoneal disease"

;; PCI value based on imaging or laparoscopy is required for the definition
(assert
  (! (=> peritoneal_cancer_index_value_recorded_now_withunit_integer@@based_on_cross_sectional_imaging_or_diagnostic_laparoscopy
         true)
     :named REQ3_AUXILIARY1)) ;; "PCI value is based on imaging or laparoscopy"

;; Definition: low-volume peritoneal disease by PCI < 10 based on imaging or laparoscopy
(assert
  (! (= patient_has_finding_of_disorder_of_peritoneum_now@@low_volume_by_peritoneal_cancer_index_lt_10_by_imaging_or_laparoscopy
        (and patient_has_finding_of_disorder_of_peritoneum_now
             peritoneal_cancer_index_value_recorded_now_withunit_integer@@based_on_cross_sectional_imaging_or_diagnostic_laparoscopy
             (< peritoneal_cancer_index_value_recorded_now_withunit_integer 10)))
     :named REQ3_AUXILIARY2)) ;; "low-volume peritoneal disease defined by PCI < 10 based on imaging or laparoscopy"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_disorder_of_peritoneum_now@@low_volume_by_peritoneal_cancer_index_lt_10_by_imaging_or_laparoscopy
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have evidence of low-volume peritoneal disease defined by PCI < 10 based on imaging or laparoscopy"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const eastern_cooperative_oncology_group_performance_status_value_recorded_now_withunit_integer Int) ;; {"when_to_set_to_value":"Set to the integer value (0, 1, or 2) if the patient's ECOG performance status is recorded at the current time.","when_to_set_to_null":"Set to null if the patient's ECOG performance status is not recorded, unknown, or cannot be determined at the current time.","meaning":"Numeric value representing the patient's ECOG performance status at the current time, as an integer."} ;; "Eastern Cooperative Oncology Group performance status recorded at the current time"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (or (= eastern_cooperative_oncology_group_performance_status_value_recorded_now_withunit_integer 0)
         (= eastern_cooperative_oncology_group_performance_status_value_recorded_now_withunit_integer 1)
         (= eastern_cooperative_oncology_group_performance_status_value_recorded_now_withunit_integer 2))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((Eastern Cooperative Oncology Group performance status = 0) OR (Eastern Cooperative Oncology Group performance status = 1) OR (Eastern Cooperative Oncology Group performance status = 2))."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_can_undergo_surgical_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo a surgical procedure.","when_to_set_to_false":"Set to false if the patient is currently not able to undergo a surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to undergo a surgical procedure.","meaning":"Boolean indicating whether the patient is currently able to undergo a surgical procedure."} ;; "medically fit for surgery"
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has secondary malignant neoplasm of the liver (hepatic metastases).","when_to_set_to_false":"Set to false if the patient currently does not have secondary malignant neoplasm of the liver (hepatic metastases).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary malignant neoplasm of the liver (hepatic metastases).","meaning":"Boolean indicating whether the patient currently has secondary malignant neoplasm of the liver (hepatic metastases)."} ;; "parenchymal hepatic metastases"
(declare-const patient_has_finding_of_jaundice_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has jaundice.","when_to_set_to_false":"Set to false if the patient currently does not have jaundice.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has jaundice.","meaning":"Boolean indicating whether the patient currently has jaundice."} ;; "clinical jaundice"
(declare-const patient_serum_bilirubin_level_finding_value_recorded_now_withunit_micromol_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if a current serum bilirubin level in micromol/L is available.","when_to_set_to_null":"Set to null if no current serum bilirubin measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum bilirubin level in micromol/L."} ;; "biochemical abnormally elevated serum bilirubin"
(declare-const patient_alkaline_phosphatase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if a current serum alkaline phosphatase level in U/L is available.","when_to_set_to_null":"Set to null if no current serum alkaline phosphatase measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum alkaline phosphatase level in U/L."} ;; "biochemical abnormally elevated alkaline phosphatase"
(declare-const patient_has_finding_of_obstruction_of_biliary_tree_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has obstruction of the biliary tree (biliary obstruction).","when_to_set_to_false":"Set to false if the patient currently does not have obstruction of the biliary tree (biliary obstruction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has obstruction of the biliary tree (biliary obstruction).","meaning":"Boolean indicating whether the patient currently has obstruction of the biliary tree (biliary obstruction)."} ;; "radiological biliary obstruction"
(declare-const patient_has_finding_of_obstruction_of_biliary_tree_now@@confirmed_by_ultrasound Bool) ;; {"when_to_set_to_true":"Set to true if the finding of biliary obstruction is confirmed by ultrasound.","when_to_set_to_false":"Set to false if the finding of biliary obstruction is not confirmed by ultrasound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether ultrasound confirms the finding.","meaning":"Boolean indicating whether the finding of biliary obstruction is confirmed by ultrasound."} ;; "radiological biliary obstruction on ultrasound"
(declare-const patient_has_finding_of_obstruction_of_biliary_tree_now@@confirmed_by_computed_tomography Bool) ;; {"when_to_set_to_true":"Set to true if the finding of biliary obstruction is confirmed by computed tomography.","when_to_set_to_false":"Set to false if the finding of biliary obstruction is not confirmed by computed tomography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether computed tomography confirms the finding.","meaning":"Boolean indicating whether the finding of biliary obstruction is confirmed by computed tomography."} ;; "radiological biliary obstruction on computed tomography"
(declare-const patient_has_finding_of_obstruction_of_biliary_tree_now@@confirmed_by_magnetic_resonance_imaging Bool) ;; {"when_to_set_to_true":"Set to true if the finding of biliary obstruction is confirmed by magnetic resonance imaging.","when_to_set_to_false":"Set to false if the finding of biliary obstruction is not confirmed by magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether magnetic resonance imaging confirms the finding.","meaning":"Boolean indicating whether the finding of biliary obstruction is confirmed by magnetic resonance imaging."} ;; "radiological biliary obstruction on magnetic resonance imaging"
(declare-const patient_has_finding_of_small_bowel_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has small bowel obstruction.","when_to_set_to_false":"Set to false if the patient currently does not have small bowel obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has small bowel obstruction.","meaning":"Boolean indicating whether the patient currently has small bowel obstruction."} ;; "small bowel obstruction"
(declare-const patient_has_finding_of_small_bowel_obstruction_now@@multi_segmental Bool) ;; {"when_to_set_to_true":"Set to true if the small bowel obstruction is multi-segmental.","when_to_set_to_false":"Set to false if the small bowel obstruction is not multi-segmental.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the small bowel obstruction is multi-segmental.","meaning":"Boolean indicating whether the patient's current small bowel obstruction is multi-segmental."} ;; "multi-segmental small bowel obstruction"
(declare-const patient_has_finding_of_small_bowel_obstruction_now@@at_more_than_one_site Bool) ;; {"when_to_set_to_true":"Set to true if the small bowel obstruction occurs at more than one site.","when_to_set_to_false":"Set to false if the small bowel obstruction does not occur at more than one site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the small bowel obstruction occurs at more than one site.","meaning":"Boolean indicating whether the patient's current small bowel obstruction occurs at more than one site."} ;; "multi-segmental small bowel obstruction at more than one site"
(declare-const patient_has_finding_of_small_bowel_loops_matted_together_on_cross_sectional_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if cross-sectional imaging currently shows small bowel loops matted together.","when_to_set_to_false":"Set to false if cross-sectional imaging currently does not show small bowel loops matted together.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether cross-sectional imaging currently shows small bowel loops matted together.","meaning":"Boolean indicating whether the patient currently has cross-sectional imaging findings of small bowel loops matted together."} ;; "small bowel loops matted together"
(declare-const patient_has_finding_of_gross_disease_of_small_bowel_mesentery_with_distortion_on_cross_sectional_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if cross-sectional imaging currently shows gross disease of the small bowel mesentery characterized by distortion.","when_to_set_to_false":"Set to false if cross-sectional imaging currently does not show gross disease of the small bowel mesentery characterized by distortion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether cross-sectional imaging currently shows gross disease of the small bowel mesentery characterized by distortion.","meaning":"Boolean indicating whether the patient currently has cross-sectional imaging findings of gross disease of the small bowel mesentery characterized by distortion."} ;; "gross disease of the small bowel mesentery characterized by distortion"
(declare-const patient_has_finding_of_gross_disease_of_small_bowel_mesentery_with_thickening_on_cross_sectional_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if cross-sectional imaging currently shows gross disease of the small bowel mesentery characterized by thickening.","when_to_set_to_false":"Set to false if cross-sectional imaging currently does not show gross disease of the small bowel mesentery characterized by thickening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether cross-sectional imaging currently shows gross disease of the small bowel mesentery characterized by thickening.","meaning":"Boolean indicating whether the patient currently has cross-sectional imaging findings of gross disease of the small bowel mesentery characterized by thickening."} ;; "gross disease of the small bowel mesentery characterized by thickening"
(declare-const patient_has_finding_of_gross_disease_of_small_bowel_mesentery_with_loss_of_mesenteric_vascular_clarity_on_cross_sectional_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if cross-sectional imaging currently shows gross disease of the small bowel mesentery characterized by loss of mesenteric vascular clarity.","when_to_set_to_false":"Set to false if cross-sectional imaging currently does not show gross disease of the small bowel mesentery characterized by loss of mesenteric vascular clarity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether cross-sectional imaging currently shows gross disease of the small bowel mesentery characterized by loss of mesenteric vascular clarity.","meaning":"Boolean indicating whether the patient currently has cross-sectional imaging findings of gross disease of the small bowel mesentery characterized by loss of mesenteric vascular clarity."} ;; "gross disease of the small bowel mesentery characterized by loss of mesenteric vascular clarity"
(declare-const patient_has_finding_of_hematogenous_metastasis_on_clinical_evidence_now Bool) ;; {"when_to_set_to_true":"Set to true if there is clinical evidence that the patient currently has hematogenous metastasis.","when_to_set_to_false":"Set to false if there is no clinical evidence that the patient currently has hematogenous metastasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is clinical evidence of hematogenous metastasis.","meaning":"Boolean indicating whether the patient currently has clinical evidence of hematogenous metastasis."} ;; "clinical evidence of hematogenous metastasis"
(declare-const patient_has_finding_of_hematogenous_metastasis_on_radiological_evidence_now Bool) ;; {"when_to_set_to_true":"Set to true if there is radiological evidence that the patient currently has hematogenous metastasis.","when_to_set_to_false":"Set to false if there is no radiological evidence that the patient currently has hematogenous metastasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is radiological evidence of hematogenous metastasis.","meaning":"Boolean indicating whether the patient currently has radiological evidence of hematogenous metastasis."} ;; "radiological evidence of hematogenous metastasis"
(declare-const patient_has_finding_of_distant_nodal_metastasis_in_retroperitoneal_lymph_nodes_on_clinical_evidence_now Bool) ;; {"when_to_set_to_true":"Set to true if there is clinical evidence that the patient currently has distant nodal metastasis in retroperitoneal lymph nodes.","when_to_set_to_false":"Set to false if there is no clinical evidence that the patient currently has distant nodal metastasis in retroperitoneal lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is clinical evidence of distant nodal metastasis in retroperitoneal lymph nodes.","meaning":"Boolean indicating whether the patient currently has clinical evidence of distant nodal metastasis in retroperitoneal lymph nodes."} ;; "clinical evidence of distant nodal metastasis in retroperitoneal lymph nodes"
(declare-const patient_has_finding_of_distant_nodal_metastasis_in_pelvic_lymph_nodes_on_clinical_evidence_now Bool) ;; {"when_to_set_to_true":"Set to true if there is clinical evidence that the patient currently has distant nodal metastasis in pelvic lymph nodes.","when_to_set_to_false":"Set to false if there is no clinical evidence that the patient currently has distant nodal metastasis in pelvic lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is clinical evidence of distant nodal metastasis in pelvic lymph nodes.","meaning":"Boolean indicating whether the patient currently has clinical evidence of distant nodal metastasis in pelvic lymph nodes."} ;; "clinical evidence of distant nodal metastasis in pelvic lymph nodes"
(declare-const patient_has_finding_of_distant_nodal_metastasis_in_mediastinal_lymph_nodes_on_clinical_evidence_now Bool) ;; {"when_to_set_to_true":"Set to true if there is clinical evidence that the patient currently has distant nodal metastasis in mediastinal lymph nodes.","when_to_set_to_false":"Set to false if there is no clinical evidence that the patient currently has distant nodal metastasis in mediastinal lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is clinical evidence of distant nodal metastasis in mediastinal lymph nodes.","meaning":"Boolean indicating whether the patient currently has clinical evidence of distant nodal metastasis in mediastinal lymph nodes."} ;; "clinical evidence of distant nodal metastasis in mediastinal lymph nodes"
(declare-const patient_has_finding_of_distant_nodal_metastasis_in_peri_portal_lymph_nodes_on_clinical_evidence_now Bool) ;; {"when_to_set_to_true":"Set to true if there is clinical evidence that the patient currently has distant nodal metastasis in peri-portal lymph nodes.","when_to_set_to_false":"Set to false if there is no clinical evidence that the patient currently has distant nodal metastasis in peri-portal lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is clinical evidence of distant nodal metastasis in peri-portal lymph nodes.","meaning":"Boolean indicating whether the patient currently has clinical evidence of distant nodal metastasis in peri-portal lymph nodes."} ;; "clinical evidence of distant nodal metastasis in peri-portal lymph nodes"
(declare-const patient_has_finding_of_distant_nodal_metastasis_in_peri_aortic_lymph_nodes_on_clinical_evidence_now Bool) ;; {"when_to_set_to_true":"Set to true if there is clinical evidence that the patient currently has distant nodal metastasis in peri-aortic lymph nodes.","when_to_set_to_false":"Set to false if there is no clinical evidence that the patient currently has distant nodal metastasis in peri-aortic lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is clinical evidence of distant nodal metastasis in peri-aortic lymph nodes.","meaning":"Boolean indicating whether the patient currently has clinical evidence of distant nodal metastasis in peri-aortic lymph nodes."} ;; "clinical evidence of distant nodal metastasis in peri-aortic lymph nodes"
(declare-const patient_has_finding_of_distant_nodal_metastasis_in_retroperitoneal_lymph_nodes_on_radiological_evidence_now Bool) ;; {"when_to_set_to_true":"Set to true if there is radiological evidence that the patient currently has distant nodal metastasis in retroperitoneal lymph nodes.","when_to_set_to_false":"Set to false if there is no radiological evidence that the patient currently has distant nodal metastasis in retroperitoneal lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is radiological evidence of distant nodal metastasis in retroperitoneal lymph nodes.","meaning":"Boolean indicating whether the patient currently has radiological evidence of distant nodal metastasis in retroperitoneal lymph nodes."} ;; "radiological evidence of distant nodal metastasis in retroperitoneal lymph nodes"
(declare-const patient_has_finding_of_distant_nodal_metastasis_in_pelvic_lymph_nodes_on_radiological_evidence_now Bool) ;; {"when_to_set_to_true":"Set to true if there is radiological evidence that the patient currently has distant nodal metastasis in pelvic lymph nodes.","when_to_set_to_false":"Set to false if there is no radiological evidence that the patient currently has distant nodal metastasis in pelvic lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is radiological evidence of distant nodal metastasis in pelvic lymph nodes.","meaning":"Boolean indicating whether the patient currently has radiological evidence of distant nodal metastasis in pelvic lymph nodes."} ;; "radiological evidence of distant nodal metastasis in pelvic lymph nodes"
(declare-const patient_has_finding_of_distant_nodal_metastasis_in_mediastinal_lymph_nodes_on_radiological_evidence_now Bool) ;; {"when_to_set_to_true":"Set to true if there is radiological evidence that the patient currently has distant nodal metastasis in mediastinal lymph nodes.","when_to_set_to_false":"Set to false if there is no radiological evidence that the patient currently has distant nodal metastasis in mediastinal lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is radiological evidence of distant nodal metastasis in mediastinal lymph nodes.","meaning":"Boolean indicating whether the patient currently has radiological evidence of distant nodal metastasis in mediastinal lymph nodes."} ;; "radiological evidence of distant nodal metastasis in mediastinal lymph nodes"
(declare-const patient_has_finding_of_distant_nodal_metastasis_in_peri_portal_lymph_nodes_on_radiological_evidence_now Bool) ;; {"when_to_set_to_true":"Set to true if there is radiological evidence that the patient currently has distant nodal metastasis in peri-portal lymph nodes.","when_to_set_to_false":"Set to false if there is no radiological evidence that the patient currently has distant nodal metastasis in peri-portal lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is radiological evidence of distant nodal metastasis in peri-portal lymph nodes.","meaning":"Boolean indicating whether the patient currently has radiological evidence of distant nodal metastasis in peri-portal lymph nodes."} ;; "radiological evidence of distant nodal metastasis in peri-portal lymph nodes"
(declare-const patient_has_finding_of_distant_nodal_metastasis_in_peri_aortic_lymph_nodes_on_radiological_evidence_now Bool) ;; {"when_to_set_to_true":"Set to true if there is radiological evidence that the patient currently has distant nodal metastasis in peri-aortic lymph nodes.","when_to_set_to_false":"Set to false if there is no radiological evidence that the patient currently has distant nodal metastasis in peri-aortic lymph nodes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is radiological evidence of distant nodal metastasis in peri-aortic lymph nodes.","meaning":"Boolean indicating whether the patient currently has radiological evidence of distant nodal metastasis in peri-aortic lymph nodes."} ;; "radiological evidence of distant nodal metastasis in peri-aortic lymph nodes"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Biliary obstruction confirmed by imaging implies biliary obstruction
(assert
  (! (=> patient_has_finding_of_obstruction_of_biliary_tree_now@@confirmed_by_ultrasound
         patient_has_finding_of_obstruction_of_biliary_tree_now)
     :named REQ5_AUXILIARY0)) ;; "radiological biliary obstruction on ultrasound"

(assert
  (! (=> patient_has_finding_of_obstruction_of_biliary_tree_now@@confirmed_by_computed_tomography
         patient_has_finding_of_obstruction_of_biliary_tree_now)
     :named REQ5_AUXILIARY1)) ;; "radiological biliary obstruction on computed tomography"

(assert
  (! (=> patient_has_finding_of_obstruction_of_biliary_tree_now@@confirmed_by_magnetic_resonance_imaging
         patient_has_finding_of_obstruction_of_biliary_tree_now)
     :named REQ5_AUXILIARY2)) ;; "radiological biliary obstruction on magnetic resonance imaging"

;; Multi-segmental small bowel obstruction at >1 site implies multi-segmental SBO
(assert
  (! (=> (and patient_has_finding_of_small_bowel_obstruction_now@@multi_segmental
              patient_has_finding_of_small_bowel_obstruction_now@@at_more_than_one_site)
         patient_has_finding_of_small_bowel_obstruction_now)
     :named REQ5_AUXILIARY3)) ;; "cross-sectional imaging findings indicative of multi-segmental small bowel obstruction at more than one site"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (and
      patient_can_undergo_surgical_procedure_now
      (not patient_has_finding_of_secondary_malignant_neoplasm_of_liver_now) ;; "NOT parenchymal hepatic metastases"
      (not patient_has_finding_of_jaundice_now) ;; "NOT evidence of clinical jaundice"
      (not (> patient_serum_bilirubin_level_finding_value_recorded_now_withunit_micromol_per_l 21.0)) ;; "NOT evidence of biochemical abnormally elevated serum bilirubin" (threshold 21.0 µmol/L, typical upper limit)
      (not (> patient_alkaline_phosphatase_value_recorded_now_withunit_u_per_l 120.0)) ;; "NOT evidence of biochemical abnormally elevated alkaline phosphatase" (threshold 120 U/L, typical upper limit)
      (not patient_has_finding_of_obstruction_of_biliary_tree_now@@confirmed_by_ultrasound) ;; "NOT evidence of radiological biliary obstruction on ultrasound"
      (not patient_has_finding_of_obstruction_of_biliary_tree_now@@confirmed_by_computed_tomography) ;; "NOT evidence of radiological biliary obstruction on computed tomography"
      (not patient_has_finding_of_obstruction_of_biliary_tree_now@@confirmed_by_magnetic_resonance_imaging) ;; "NOT evidence of radiological biliary obstruction on magnetic resonance imaging"
      (not (and patient_has_finding_of_small_bowel_obstruction_now@@multi_segmental
                patient_has_finding_of_small_bowel_obstruction_now@@at_more_than_one_site)) ;; "NOT cross-sectional imaging findings indicative of multi-segmental small bowel obstruction at more than one site"
      (not patient_has_finding_of_small_bowel_loops_matted_together_on_cross_sectional_imaging_now) ;; "NOT cross-sectional imaging findings of small bowel loops matted together"
      (not patient_has_finding_of_gross_disease_of_small_bowel_mesentery_with_distortion_on_cross_sectional_imaging_now) ;; "NOT cross-sectional imaging findings of gross disease of the small bowel mesentery characterized by distortion"
      (not patient_has_finding_of_gross_disease_of_small_bowel_mesentery_with_thickening_on_cross_sectional_imaging_now) ;; "NOT cross-sectional imaging findings of gross disease of the small bowel mesentery characterized by thickening"
      (not patient_has_finding_of_gross_disease_of_small_bowel_mesentery_with_loss_of_mesenteric_vascular_clarity_on_cross_sectional_imaging_now) ;; "NOT cross-sectional imaging findings of gross disease of the small bowel mesentery characterized by loss of mesenteric vascular clarity"
      (not patient_has_finding_of_hematogenous_metastasis_on_clinical_evidence_now) ;; "NOT clinical evidence of hematogenous metastasis"
      (not patient_has_finding_of_hematogenous_metastasis_on_radiological_evidence_now) ;; "NOT radiological evidence of hematogenous metastasis"
      (not patient_has_finding_of_distant_nodal_metastasis_in_retroperitoneal_lymph_nodes_on_clinical_evidence_now) ;; "NOT clinical evidence of distant nodal metastasis in retroperitoneal lymph nodes"
      (not patient_has_finding_of_distant_nodal_metastasis_in_pelvic_lymph_nodes_on_clinical_evidence_now) ;; "NOT clinical evidence of distant nodal metastasis in pelvic lymph nodes"
      (not patient_has_finding_of_distant_nodal_metastasis_in_mediastinal_lymph_nodes_on_clinical_evidence_now) ;; "NOT clinical evidence of distant nodal metastasis in mediastinal lymph nodes"
      (not patient_has_finding_of_distant_nodal_metastasis_in_peri_portal_lymph_nodes_on_clinical_evidence_now) ;; "NOT clinical evidence of distant nodal metastasis in peri-portal lymph nodes"
      (not patient_has_finding_of_distant_nodal_metastasis_in_peri_aortic_lymph_nodes_on_clinical_evidence_now) ;; "NOT clinical evidence of distant nodal metastasis in peri-aortic lymph nodes"
      (not patient_has_finding_of_distant_nodal_metastasis_in_retroperitoneal_lymph_nodes_on_radiological_evidence_now) ;; "NOT radiological evidence of distant nodal metastasis in retroperitoneal lymph nodes"
      (not patient_has_finding_of_distant_nodal_metastasis_in_pelvic_lymph_nodes_on_radiological_evidence_now) ;; "NOT radiological evidence of distant nodal metastasis in pelvic lymph nodes"
      (not patient_has_finding_of_distant_nodal_metastasis_in_mediastinal_lymph_nodes_on_radiological_evidence_now) ;; "NOT radiological evidence of distant nodal metastasis in mediastinal lymph nodes"
      (not patient_has_finding_of_distant_nodal_metastasis_in_peri_portal_lymph_nodes_on_radiological_evidence_now) ;; "NOT radiological evidence of distant nodal metastasis in peri-portal lymph nodes"
      (not patient_has_finding_of_distant_nodal_metastasis_in_peri_aortic_lymph_nodes_on_radiological_evidence_now) ;; "NOT radiological evidence of distant nodal metastasis in peri-aortic lymph nodes"
     )
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "medically fit for surgery as defined by all listed NOT conditions"

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const patient_absolute_neutrophil_count_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if a current absolute neutrophil count (per cubic millimeter) is available for the patient.","when_to_set_to_null":"Set to null if no current absolute neutrophil count (per cubic millimeter) is available or the value is indeterminate.","meaning":"Numeric value of the patient's current absolute neutrophil count per cubic millimeter."} ;; "absolute neutrophil count > 1200 per cubic millimeter"
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if a current white blood cell count (per cubic millimeter) is available for the patient.","when_to_set_to_null":"Set to null if no current white blood cell count (per cubic millimeter) is available or the value is indeterminate.","meaning":"Numeric value of the patient's current white blood cell count per cubic millimeter."} ;; "white blood cell count > 4000 per cubic millimeter"
(declare-const patient_platelet_count_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if a current platelet count (per cubic millimeter) is available for the patient.","when_to_set_to_null":"Set to null if no current platelet count (per cubic millimeter) is available or the value is indeterminate.","meaning":"Numeric value of the patient's current platelet count per cubic millimeter."} ;; "platelet count > 150,000 per cubic millimeter"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: absolute neutrophil count > 1200 per cubic millimeter
(assert
  (! (> patient_absolute_neutrophil_count_value_recorded_now_withunit_per_cubic_millimeter 1200)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "absolute neutrophil count > 1200 per cubic millimeter"

;; Component 1: white blood cell count > 4000 per cubic millimeter
(assert
  (! (> patient_white_blood_cell_count_value_recorded_now_withunit_per_cubic_millimeter 4000)
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "white blood cell count > 4000 per cubic millimeter"

;; Component 2: platelet count > 150,000 per cubic millimeter
(assert
  (! (> patient_platelet_count_value_recorded_now_withunit_per_cubic_millimeter 150000)
     :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "platelet count > 150,000 per cubic millimeter"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_international_normalized_ratio_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured INR value if a numeric measurement of the patient's current international normalized ratio is available.","when_to_set_to_null":"Set to null if no such INR measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current international normalized ratio (INR)."} ;; "international normalized ratio"
(declare-const patient_is_therapeutically_anticoagulated_for_unrelated_medical_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently therapeutically anticoagulated for unrelated medical conditions (such as atrial fibrillation).","when_to_set_to_false":"Set to false if the patient is not currently therapeutically anticoagulated for unrelated medical conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently therapeutically anticoagulated for unrelated medical conditions.","meaning":"Boolean indicating whether the patient is currently therapeutically anticoagulated for unrelated medical conditions (such as atrial fibrillation)."} ;; "therapeutically anticoagulated for unrelated medical conditions such as atrial fibrillation"
(declare-const patient_can_undergo_surgical_procedure_now@@antithrombotic_treatment_can_be_withheld_for_procedure Bool) ;; {"when_to_set_to_true":"Set to true if antithrombotic treatment can be withheld for the surgical procedure (operation) now.","when_to_set_to_false":"Set to false if antithrombotic treatment cannot be withheld for the surgical procedure (operation) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether antithrombotic treatment can be withheld for the surgical procedure (operation) now.","meaning":"Boolean indicating whether antithrombotic treatment can be withheld for the surgical procedure (operation) now."} ;; "antithrombotic treatment can be withheld for operation"
(declare-const patient_has_diagnosis_of_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has a diagnosis of atrial fibrillation."} ;; "atrial fibrillation"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive example: atrial fibrillation is an example of unrelated medical conditions for anticoagulation
(assert
  (! (=> patient_has_diagnosis_of_atrial_fibrillation_now
         patient_is_therapeutically_anticoagulated_for_unrelated_medical_conditions_now)
     :named REQ7_AUXILIARY0)) ;; "such as atrial fibrillation" is a non-exhaustive example for unrelated medical conditions

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_can_undergo_surgical_procedure_now@@antithrombotic_treatment_can_be_withheld_for_procedure
         patient_can_undergo_surgical_procedure_now)
     :named REQ7_AUXILIARY1)) ;; "antithrombotic treatment can be withheld for operation" is a qualifier for surgical procedure

;; ===================== Constraint Assertions (REQ 7) =====================
;; Component 0: To be included, the patient must have ((international normalized ratio ≤ 1.5) OR ((therapeutically anticoagulated for unrelated medical conditions such as atrial fibrillation) AND (antithrombotic treatment can be withheld for operation))).
(assert
  (! (or (<= patient_international_normalized_ratio_value_recorded_now_withunit_ratio 1.5)
         (and patient_is_therapeutically_anticoagulated_for_unrelated_medical_conditions_now
              patient_can_undergo_surgical_procedure_now@@antithrombotic_treatment_can_be_withheld_for_procedure))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((international normalized ratio ≤ 1.5) OR ((therapeutically anticoagulated for unrelated medical conditions such as atrial fibrillation) AND (antithrombotic treatment can be withheld for operation)))."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_alkaline_phosphatase_upper_limit_of_normal_value_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the reference value if the current upper limit of normal for alkaline phosphatase in U/L is available.","when_to_set_to_null":"Set to null if no such reference value is available or the value is indeterminate.","meaning":"Numeric value representing the current upper limit of normal for the patient's alkaline phosphatase in U/L."} ;; "upper limit of normal for alkaline phosphatase"
(declare-const patient_aspartate_aminotransferase_upper_limit_of_normal_value_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the reference value if the current upper limit of normal for aspartate aminotransferase in U/L is available.","when_to_set_to_null":"Set to null if no such reference value is available or the value is indeterminate.","meaning":"Numeric value representing the current upper limit of normal for the patient's aspartate aminotransferase in U/L."} ;; "upper limit of normal for aspartate transaminase"
(declare-const patient_aspartate_aminotransferase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current aspartate transaminase in U/L is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current aspartate transaminase in U/L."} ;; "aspartate transaminase"
(declare-const patient_bilirubin_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current total serum bilirubin in mg/dL is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current total serum bilirubin in mg/dL."} ;; "total serum bilirubin"
(declare-const patient_has_diagnosis_of_gilberts_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Gilbert's syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Gilbert's syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Gilbert's syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Gilbert's syndrome."} ;; "Gilbert's syndrome"
(declare-const patient_has_finding_of_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has adequate liver function as evidenced by the specified laboratory criteria.","when_to_set_to_false":"Set to false if the patient currently does not have adequate liver function as evidenced by the specified laboratory criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has adequate liver function.","meaning":"Boolean indicating whether the patient currently has adequate liver function."} ;; "adequate hepatic function"

(assert
  (! (= patient_has_finding_of_liver_function_now
        (and
          (or
            (<= patient_bilirubin_value_recorded_now_withunit_mg_per_dl 1.5)
            (and
              (> patient_bilirubin_value_recorded_now_withunit_mg_per_dl 1.5)
              patient_has_diagnosis_of_gilberts_syndrome_now
            )
          )
          (or
            (< patient_alkaline_phosphatase_value_recorded_now_withunit_u_per_l
               (* 2.5 patient_alkaline_phosphatase_upper_limit_of_normal_value_now_withunit_u_per_l))
            (< patient_aspartate_aminotransferase_value_recorded_now_withunit_u_per_l
               (* 1.5 patient_aspartate_aminotransferase_upper_limit_of_normal_value_now_withunit_u_per_l))
          )
          (not
            (and
              (> patient_alkaline_phosphatase_value_recorded_now_withunit_u_per_l
                 patient_alkaline_phosphatase_upper_limit_of_normal_value_now_withunit_u_per_l)
              (> patient_aspartate_aminotransferase_value_recorded_now_withunit_u_per_l
                 patient_aspartate_aminotransferase_upper_limit_of_normal_value_now_withunit_u_per_l)
            )
          )
        )
     )
     :named REQ8_AUXILIARY0)) ;; "adequate hepatic function as evidenced by ((total serum bilirubin ≤ 1.5 mg/dL) OR ((total serum bilirubin > 1.5 mg/dL) AND (Gilbert's syndrome))) AND ((alkaline phosphatase < 2.5 x ULN) OR (AST < 1.5 x ULN)) AND NOT ((alkaline phosphatase > ULN) AND (AST > ULN))"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: Bilirubin/Gilbert's syndrome
(assert
  (! (or
        (<= patient_bilirubin_value_recorded_now_withunit_mg_per_dl 1.5)
        (and
          (> patient_bilirubin_value_recorded_now_withunit_mg_per_dl 1.5)
          patient_has_diagnosis_of_gilberts_syndrome_now
        )
     )
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "((total serum bilirubin ≤ 1.5 mg/dL) OR ((total serum bilirubin > 1.5 mg/dL) AND (Gilbert's syndrome)))"

;; Component 1: Alkaline phosphatase or AST
(assert
  (! (or
        (< patient_alkaline_phosphatase_value_recorded_now_withunit_u_per_l
           (* 2.5 patient_alkaline_phosphatase_upper_limit_of_normal_value_now_withunit_u_per_l))
        (< patient_aspartate_aminotransferase_value_recorded_now_withunit_u_per_l
           (* 1.5 patient_aspartate_aminotransferase_upper_limit_of_normal_value_now_withunit_u_per_l))
     )
     :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "((alkaline phosphatase < 2.5 x ULN) OR (AST < 1.5 x ULN))"

;; Component 2: NOT (alkaline phosphatase > ULN AND AST > ULN)
(assert
  (! (not
        (and
          (> patient_alkaline_phosphatase_value_recorded_now_withunit_u_per_l
             patient_alkaline_phosphatase_upper_limit_of_normal_value_now_withunit_u_per_l)
          (> patient_aspartate_aminotransferase_value_recorded_now_withunit_u_per_l
             patient_aspartate_aminotransferase_upper_limit_of_normal_value_now_withunit_u_per_l)
        )
     )
     :named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "NOT ((alkaline phosphatase > ULN) AND (AST > ULN))"

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patients_serum_renal_functional_parameters_are_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's serum renal functional parameters are currently within normal limits.","when_to_set_to_false":"Set to false if the patient's serum renal functional parameters are currently outside normal limits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's serum renal functional parameters are within normal limits.","meaning":"Boolean indicating whether the patient's serum renal functional parameters are currently within normal limits."} ;; "serum renal functional parameters within normal limits"
(declare-const patients_urea_nitrogen_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's blood urea nitrogen is currently within normal limits.","when_to_set_to_false":"Set to false if the patient's blood urea nitrogen is currently outside normal limits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's blood urea nitrogen is within normal limits.","meaning":"Boolean indicating whether the patient's blood urea nitrogen is currently within normal limits."} ;; "blood urea nitrogen within normal limits"
(declare-const patients_creatinine_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's creatinine is currently within normal limits.","when_to_set_to_false":"Set to false if the patient's creatinine is currently outside normal limits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's creatinine is within normal limits.","meaning":"Boolean indicating whether the patient's creatinine is currently within normal limits."} ;; "creatinine within normal limits"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! patients_serum_renal_functional_parameters_are_normal_now
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "serum renal functional parameters within normal limits"

(assert
  (! patients_urea_nitrogen_is_normal_now
     :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "blood urea nitrogen within normal limits"

(assert
  (! patients_creatinine_is_normal_now
     :named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "creatinine within normal limits"

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_has_finding_of_satisfactory_cardiopulmonary_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has satisfactory cardiopulmonary function.","when_to_set_to_false":"Set to false if the patient currently does not have satisfactory cardiopulmonary function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has satisfactory cardiopulmonary function.","meaning":"Boolean indicating whether the patient currently has satisfactory cardiopulmonary function."} ;; "have satisfactory cardiopulmonary function"
(declare-const patient_has_diagnosis_of_heart_failure_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical diagnosis of heart failure was severe.","when_to_set_to_false":"Set to false if the patient's historical diagnosis of heart failure was not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's historical diagnosis of heart failure was severe.","meaning":"Boolean indicating whether the patient's historical diagnosis of heart failure was severe."} ;; "NOT have a history of severe congestive heart failure"
(declare-const patient_has_diagnosis_of_pulmonary_disease_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with severe pulmonary disease at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with severe pulmonary disease at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with severe pulmonary disease.","meaning":"Boolean indicating whether the patient has ever been diagnosed with severe pulmonary disease in their history."} ;; "NOT have a history of severe pulmonary disease"
(declare-const patient_can_undergo_debulking_of_neoplasm_of_abdominal_cavity_now@@major Bool) ;; {"when_to_set_to_true":"Set to true if the abdominal cytoreductive surgery the patient can currently undergo is major.","when_to_set_to_false":"Set to false if the abdominal cytoreductive surgery the patient can currently undergo is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abdominal cytoreductive surgery the patient can currently undergo is major.","meaning":"Boolean indicating whether the abdominal cytoreductive surgery the patient can currently undergo is major."} ;; "major abdominal cytoreductive surgery"
(declare-const patient_has_clinically_acceptable_risk_to_undergo_major_abdominal_cytoreductive_surgery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinically acceptable risks to undergo major abdominal cytoreductive surgery.","when_to_set_to_false":"Set to false if the patient currently does not have clinically acceptable risks to undergo major abdominal cytoreductive surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinically acceptable risks to undergo major abdominal cytoreductive surgery.","meaning":"Boolean indicating whether the patient currently has clinically acceptable risks to undergo major abdominal cytoreductive surgery."} ;; "have clinically acceptable risks to undergo major abdominal cytoreductive surgery"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: Satisfactory cardiopulmonary function
(assert
  (! patient_has_finding_of_satisfactory_cardiopulmonary_function_now
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "have satisfactory cardiopulmonary function"

;; Component 1: NOT history of severe congestive heart failure
(assert
  (! (not patient_has_diagnosis_of_heart_failure_inthehistory@@severe)
     :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "NOT have a history of severe congestive heart failure"

;; Component 2: NOT history of severe pulmonary disease
(assert
  (! (not patient_has_diagnosis_of_pulmonary_disease_inthehistory@@severe)
     :named REQ10_COMPONENT2_OTHER_REQUIREMENTS)) ;; "NOT have a history of severe pulmonary disease"

;; Component 3: Clinically acceptable risks to undergo major abdominal cytoreductive surgery
(assert
  (! (and patient_can_undergo_debulking_of_neoplasm_of_abdominal_cavity_now@@major
          patient_has_clinically_acceptable_risk_to_undergo_major_abdominal_cytoreductive_surgery_now)
     :named REQ10_COMPONENT3_OTHER_REQUIREMENTS)) ;; "have clinically acceptable risks to undergo major abdominal cytoreductive surgery"

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_has_finding_of_acute_myocardial_infarction_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented clinical history of acute myocardial infarction that occurred within the past six months prior to registration.","when_to_set_to_false":"Set to false if the patient does not have a documented clinical history of acute myocardial infarction within the past six months prior to registration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a clinical history of acute myocardial infarction within the past six months prior to registration.","meaning":"Boolean indicating whether the patient has a clinical history of acute myocardial infarction within the past six months."} ;; "clinical history of acute myocardial infarction within six months of registration"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (not patient_has_finding_of_acute_myocardial_infarction_inthepast6months)
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have a clinical history of acute myocardial infarction within six months of registration."

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_has_undergone_revascularization_procedure_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any revascularization procedure in the past.","when_to_set_to_false":"Set to false if the patient has not undergone any revascularization procedure in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any revascularization procedure in the past.","meaning":"Boolean indicating whether the patient has undergone any revascularization procedure in the history."} ;; "patient who is status post revascularization procedures"
(declare-const patient_has_finding_of_cardiac_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of cardiac function (regardless of status).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of cardiac function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of cardiac function.","meaning":"Boolean indicating whether the patient currently has a clinical finding of cardiac function."} ;; "cardiac function"
(declare-const patient_has_finding_of_cardiac_function_now@@satisfactory_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cardiac function is currently satisfactory.","when_to_set_to_false":"Set to false if the patient's cardiac function is currently unsatisfactory.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's cardiac function is satisfactory.","meaning":"Boolean indicating whether the patient's cardiac function is satisfactory."} ;; "satisfactory cardiac function"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_cardiac_function_now@@satisfactory_status
         patient_has_finding_of_cardiac_function_now)
     :named REQ12_AUXILIARY0)) ;; "satisfactory cardiac function" implies "cardiac function"

;; ===================== Constraint Assertions (REQ 12) =====================
;; If patient is status post revascularization procedures, must have satisfactory cardiac function
(assert
  (! (=> patient_has_undergone_revascularization_procedure_in_the_history
         patient_has_finding_of_cardiac_function_now@@satisfactory_status)
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "patient who is status post revascularization procedures must have satisfactory cardiac function"

;; ===================== Declarations for the criterion (REQ 13) =====================
(declare-const patient_has_history_of_medical_problem@@would_preclude_major_abdominal_operation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a significant history of a medical problem and that problem would preclude the patient from undergoing a major abdominal operation.","when_to_set_to_false":"Set to false if the patient has a significant history of a medical problem but that problem would not preclude the patient from undergoing a major abdominal operation, or if the patient does not have a significant history of a medical problem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a significant history of a medical problem that would preclude a major abdominal operation.","meaning":"Boolean indicating whether the patient has a significant history of a medical problem that would preclude a major abdominal operation."} ;; "NOT have a significant history of a medical problem that would preclude the patient from undergoing a major abdominal operation"
(declare-const patient_has_diagnosis_of_co_morbid_conditions_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of co-morbid conditions in their history.","when_to_set_to_false":"Set to false if the patient does not have a diagnosis of co-morbid conditions in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of co-morbid conditions in their history.","meaning":"Boolean indicating whether the patient has a diagnosis of co-morbid conditions in their history."} ;; "significant history of a co-morbidity"
(declare-const patient_has_diagnosis_of_co_morbid_conditions_inthehistory@@would_preclude_major_abdominal_operation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of co-morbid conditions in their history and the co-morbidity would preclude major abdominal operation.","when_to_set_to_false":"Set to false if the patient has a diagnosis of co-morbid conditions in their history but the co-morbidity would not preclude major abdominal operation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the co-morbidity would preclude major abdominal operation.","meaning":"Boolean indicating whether the patient's co-morbid condition in history would preclude major abdominal operation."} ;; "NOT have a significant history of a co-morbidity that would preclude the patient from undergoing a major abdominal operation"
(declare-const patient_has_diagnosis_of_heart_failure_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's historical diagnosis of heart failure was severe.","when_to_set_to_false":"Set to false if the patient's historical diagnosis of heart failure was not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's historical diagnosis of heart failure was severe.","meaning":"Boolean indicating whether the patient's historical diagnosis of heart failure was severe."} ;; "history of severe congestive heart failure"
(assert
  (! (=> (or patient_has_diagnosis_of_heart_failure_inthehistory@@severe
             patient_has_finding_of_acute_myocardial_infarction_inthepast6months)
         patient_has_history_of_medical_problem@@would_preclude_major_abdominal_operation)
     :named REQ13_AUXILIARY0)) ;; "history of severe congestive heart failure, history of active ischemic heart disease" are non-exhaustive examples of medical problems that would preclude major abdominal operation

(assert
  (! (=> (or patient_has_diagnosis_of_heart_failure_inthehistory@@severe
             patient_has_finding_of_acute_myocardial_infarction_inthepast6months)
         patient_has_diagnosis_of_co_morbid_conditions_inthehistory@@would_preclude_major_abdominal_operation)
     :named REQ13_AUXILIARY1)) ;; "history of severe congestive heart failure, history of active ischemic heart disease" are non-exhaustive examples of co-morbidities that would preclude major abdominal operation

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_co_morbid_conditions_inthehistory@@would_preclude_major_abdominal_operation
         patient_has_diagnosis_of_co_morbid_conditions_inthehistory)
     :named REQ13_AUXILIARY2)) ;; qualifier implies stem for co-morbid conditions

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
  (! (and (not patient_has_history_of_medical_problem@@would_preclude_major_abdominal_operation)
          (not patient_has_diagnosis_of_co_morbid_conditions_inthehistory@@would_preclude_major_abdominal_operation))
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "NOT have a significant history of a medical problem that would preclude the patient from undergoing a major abdominal operation" AND "NOT have a significant history of a co-morbidity that would preclude the patient from undergoing a major abdominal operation"

;; ===================== Declarations for the criterion (REQ 14) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (malignancy)."} ;; "malignancy"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_second_malignancy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current malignant neoplastic disease is a second malignancy (distinct from the primary malignancy).","when_to_set_to_false":"Set to false if the patient's current malignant neoplastic disease is not a second malignancy (i.e., it is the first or only malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current malignant neoplastic disease is a second malignancy.","meaning":"Boolean indicating whether the patient's current malignant neoplastic disease is a second malignancy."} ;; "second malignancy"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_concurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current malignant neoplastic disease is concurrent with the index disease (present at the same time).","when_to_set_to_false":"Set to false if the patient's current malignant neoplastic disease is not concurrent (not present at the same time as the index disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current malignant neoplastic disease is concurrent.","meaning":"Boolean indicating whether the patient's current malignant neoplastic disease is concurrent with the index disease."} ;; "concurrent"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@requires_systemic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current malignant neoplastic disease requires systemic therapy.","when_to_set_to_false":"Set to false if the patient's current malignant neoplastic disease does not require systemic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current malignant neoplastic disease requires systemic therapy.","meaning":"Boolean indicating whether the patient's current malignant neoplastic disease requires systemic therapy."} ;; "requiring systemic therapy"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_concurrent@@is_second_malignancy@@requires_systemic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease that is concurrent with the index disease, is a second malignancy, and requires systemic therapy.","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease that is concurrent with the index disease, is a second malignancy, and requires systemic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease that is concurrent, is a second malignancy, and requires systemic therapy.","meaning":"Boolean indicating whether the patient currently has a concurrent second malignancy requiring systemic therapy."} ;; "concurrent second malignancy requiring systemic therapy"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Definitional equality for the composite concept "concurrent second malignancy requiring systemic therapy"
(assert
  (! (= patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_concurrent@@is_second_malignancy@@requires_systemic_therapy
        (and patient_has_diagnosis_of_malignant_neoplastic_disease_now
             patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_concurrent
             patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_second_malignancy
             patient_has_diagnosis_of_malignant_neoplastic_disease_now@@requires_systemic_therapy))
     :named REQ14_AUXILIARY0)) ;; "concurrent second malignancy requiring systemic therapy"

;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_concurrent
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ14_AUXILIARY1)) ;; "concurrent"

(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_second_malignancy
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ14_AUXILIARY2)) ;; "second malignancy"

(assert
  (! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@requires_systemic_therapy
         patient_has_diagnosis_of_malignant_neoplastic_disease_now)
     :named REQ14_AUXILIARY3)) ;; "requiring systemic therapy"

;; ===================== Constraint Assertions (REQ 14) =====================
;; Component 0: To be included, the patient must NOT have a concurrent second malignancy requiring systemic therapy.
(assert
  (! (not patient_has_diagnosis_of_malignant_neoplastic_disease_now@@is_concurrent@@is_second_malignancy@@requires_systemic_therapy)
     :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have a concurrent second malignancy requiring systemic therapy."

;; ===================== Declarations for the inclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychiatric disorder (mental disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a psychiatric disorder (mental disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a psychiatric disorder (mental disorder).","meaning":"Boolean indicating whether the patient currently has a psychiatric disorder (mental disorder)."} ;; "psychiatric disorder"
(declare-const patient_has_finding_of_addictive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an addictive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have an addictive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an addictive disorder.","meaning":"Boolean indicating whether the patient currently has an addictive disorder."} ;; "addictive disorder"
(declare-const patient_has_finding_of_addictive_disorder_now@@would_preclude_patient_from_meeting_study_requirements Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current addictive disorder would preclude the patient from meeting the study requirements.","when_to_set_to_false":"Set to false if the patient's current addictive disorder would not preclude the patient from meeting the study requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current addictive disorder would preclude the patient from meeting the study requirements.","meaning":"Boolean indicating whether the patient's current addictive disorder would preclude the patient from meeting the study requirements."} ;; "addictive disorder that would preclude the patient from meeting the study requirements"
(declare-const patient_has_finding_of_other_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other condition.","when_to_set_to_false":"Set to false if the patient currently does not have any other condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any other condition.","meaning":"Boolean indicating whether the patient currently has any other condition."} ;; "any other condition"
(declare-const patient_has_finding_of_other_condition_now@@would_preclude_patient_from_meeting_study_requirements Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current other condition would preclude the patient from meeting the study requirements.","when_to_set_to_false":"Set to false if the patient's current other condition would not preclude the patient from meeting the study requirements.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current other condition would preclude the patient from meeting the study requirements.","meaning":"Boolean indicating whether the patient's current other condition would preclude the patient from meeting the study requirements."} ;; "any other condition that would preclude the patient from meeting the study requirements"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variable for addictive disorder implies stem variable
(assert
  (! (=> patient_has_finding_of_addictive_disorder_now@@would_preclude_patient_from_meeting_study_requirements
         patient_has_finding_of_addictive_disorder_now)
     :named REQ15_AUXILIARY0)) ;; "addictive disorder that would preclude the patient from meeting the study requirements" implies "addictive disorder"

;; Qualifier variable for other condition implies stem variable
(assert
  (! (=> patient_has_finding_of_other_condition_now@@would_preclude_patient_from_meeting_study_requirements
         patient_has_finding_of_other_condition_now)
     :named REQ15_AUXILIARY1)) ;; "any other condition that would preclude the patient from meeting the study requirements" implies "any other condition"

;; ===================== Constraint Assertions (REQ 15) =====================
;; Component 0: NOT have a psychiatric disorder that would preclude the patient from meeting the study requirements
(assert
  (! (not patient_has_finding_of_mental_disorder_now)
     :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "NOT have a psychiatric disorder that would preclude the patient from meeting the study requirements"

;; Component 1: NOT have an addictive disorder that would preclude the patient from meeting the study requirements
(assert
  (! (not patient_has_finding_of_addictive_disorder_now@@would_preclude_patient_from_meeting_study_requirements)
     :named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "NOT have an addictive disorder that would preclude the patient from meeting the study requirements"

;; Component 2: NOT have any other condition that would preclude the patient from meeting the study requirements
(assert
  (! (not patient_has_finding_of_other_condition_now@@would_preclude_patient_from_meeting_study_requirements)
     :named REQ15_COMPONENT2_OTHER_REQUIREMENTS)) ;; "NOT have any other condition that would preclude the patient from meeting the study requirements"
