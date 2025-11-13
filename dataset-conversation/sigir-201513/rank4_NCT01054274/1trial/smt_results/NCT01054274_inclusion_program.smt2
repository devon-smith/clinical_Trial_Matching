;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_malignant_tumor_of_esophagus_now Bool) ;; "cancer of the esophagus" {"when_to_set_to_true":"Set to true if the patient currently has a malignant tumor of the esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have a malignant tumor of the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant tumor of the esophagus.","meaning":"Boolean indicating whether the patient currently has a malignant tumor of the esophagus."}
(declare-const patient_has_finding_of_malignant_tumor_of_esophagus_now@@endoscopically_confirmed Bool) ;; "endoscopically confirmed cancer of the esophagus" {"when_to_set_to_true":"Set to true if the patient's malignant tumor of the esophagus is confirmed by endoscopy.","when_to_set_to_false":"Set to false if the patient's malignant tumor of the esophagus is not confirmed by endoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant tumor of the esophagus is endoscopically confirmed.","meaning":"Boolean indicating whether the patient's malignant tumor of the esophagus is endoscopically confirmed."}
(declare-const patient_has_finding_of_malignant_tumor_of_esophagus_now@@histologically_confirmed Bool) ;; "histologically confirmed cancer of the esophagus" {"when_to_set_to_true":"Set to true if the patient's malignant tumor of the esophagus is confirmed by histology.","when_to_set_to_false":"Set to false if the patient's malignant tumor of the esophagus is not confirmed by histology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant tumor of the esophagus is histologically confirmed.","meaning":"Boolean indicating whether the patient's malignant tumor of the esophagus is histologically confirmed."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_malignant_tumor_of_esophagus_now@@endoscopically_confirmed
         patient_has_finding_of_malignant_tumor_of_esophagus_now)
     :named REQ0_AUXILIARY0)) ;; "endoscopically confirmed cancer of the esophagus"

(assert
  (! (=> patient_has_finding_of_malignant_tumor_of_esophagus_now@@histologically_confirmed
         patient_has_finding_of_malignant_tumor_of_esophagus_now)
     :named REQ0_AUXILIARY1)) ;; "histologically confirmed cancer of the esophagus"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Endoscopically confirmed cancer of the esophagus
(assert
  (! patient_has_finding_of_malignant_tumor_of_esophagus_now@@endoscopically_confirmed
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have endoscopically confirmed cancer of the esophagus."

;; Component 1: Histologically confirmed cancer of the esophagus
(assert
  (! patient_has_finding_of_malignant_tumor_of_esophagus_now@@histologically_confirmed
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have histologically confirmed cancer of the esophagus."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_dysphagia_now Bool) ;; "dysphagia" {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dysphagia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dysphagia.","meaning":"Boolean indicating whether the patient currently has dysphagia."}
(declare-const patient_has_finding_of_dysphagia_now@@progressive Bool) ;; "progressive dysphagia" {"when_to_set_to_true":"Set to true if the patient's current dysphagia is progressive.","when_to_set_to_false":"Set to false if the patient's current dysphagia is not progressive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current dysphagia is progressive.","meaning":"Boolean indicating whether the patient's current dysphagia is progressive."}
(declare-const patient_has_finding_of_dysphagia_now@@caused_by_esophageal_cancer Bool) ;; "dysphagia caused by esophageal cancer" {"when_to_set_to_true":"Set to true if the patient's current dysphagia is caused by esophageal cancer.","when_to_set_to_false":"Set to false if the patient's current dysphagia is not caused by esophageal cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current dysphagia is caused by esophageal cancer.","meaning":"Boolean indicating whether the patient's current dysphagia is caused by esophageal cancer."}
(declare-const patient_dysphagia_grade_value_recorded_now_withunit_stooler_standard Real) ;; "grade of dysphagia (Stooler standard)" {"when_to_set_to_value":"Set to the numeric value corresponding to the patient's current grade of dysphagia according to the Stooler standard.","when_to_set_to_null":"Set to null if the patient's current grade of dysphagia according to the Stooler standard is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the patient's current grade of dysphagia, measured by the Stooler standard."}

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_finding_of_dysphagia_now@@progressive
         patient_has_finding_of_dysphagia_now)
     :named REQ1_AUXILIARY0)) ;; "progressive dysphagia"

(assert
  (! (=> patient_has_finding_of_dysphagia_now@@caused_by_esophageal_cancer
         patient_has_finding_of_dysphagia_now)
     :named REQ1_AUXILIARY1)) ;; "dysphagia caused by esophageal cancer"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: progressive dysphagia caused by esophageal cancer
(assert
  (! (and patient_has_finding_of_dysphagia_now@@progressive
          patient_has_finding_of_dysphagia_now@@caused_by_esophageal_cancer)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "progressive dysphagia caused by esophageal cancer"

;; Component 1: grade of dysphagia = level II or level III (Stooler standard)
(assert
  (! (or (= patient_dysphagia_grade_value_recorded_now_withunit_stooler_standard 2.0)
         (= patient_dysphagia_grade_value_recorded_now_withunit_stooler_standard 3.0))
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "grade of dysphagia = level II [Stooler standard] OR grade of dysphagia = level III [Stooler standard]"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_malignant_esophageal_stricture_now Bool) ;; "severe stricture of the cancer of the esophagus" {"when_to_set_to_true":"Set to true if the patient currently has a malignant esophageal stricture (severe stricture of the cancer of the esophagus).","when_to_set_to_false":"Set to false if the patient currently does not have a malignant esophageal stricture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant esophageal stricture.","meaning":"Boolean indicating whether the patient currently has a malignant esophageal stricture."}
(declare-const patient_has_finding_of_malignant_esophageal_stricture_now@@makes_barium_difficult_to_pass_through Bool) ;; "severe stricture of the cancer of the esophagus that makes the barium difficult to pass through" {"when_to_set_to_true":"Set to true if the patient's malignant esophageal stricture makes the barium difficult to pass through during the procedure.","when_to_set_to_false":"Set to false if the patient's malignant esophageal stricture does not make the barium difficult to pass through.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant esophageal stricture makes the barium difficult to pass through.","meaning":"Boolean indicating whether the patient's malignant esophageal stricture makes the barium difficult to pass through."}
(declare-const patient_has_finding_of_superior_normal_esophagus_broaden_now Bool) ;; "the superior normal esophagus broaden" {"when_to_set_to_true":"Set to true if the patient currently has a broadened superior normal esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have a broadened superior normal esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a broadened superior normal esophagus.","meaning":"Boolean indicating whether the patient currently has a broadened superior normal esophagus."}
(declare-const patient_has_finding_of_superior_normal_esophagus_broaden_now@@observed_in_barium_meal_of_esophagus Bool) ;; "the superior normal esophagus broaden observed in barium meal of esophagus" {"when_to_set_to_true":"Set to true if the broadening of the superior normal esophagus is observed in barium meal of esophagus.","when_to_set_to_false":"Set to false if the broadening of the superior normal esophagus is not observed in barium meal of esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the broadening of the superior normal esophagus is observed in barium meal of esophagus.","meaning":"Boolean indicating whether the broadening of the superior normal esophagus is observed in barium meal of esophagus."}
(declare-const patient_has_undergone_fluoroscopy_of_esophagus_with_barium_now Bool) ;; "barium meal of esophagus" {"when_to_set_to_true":"Set to true if the patient has undergone a fluoroscopy of the esophagus with barium (barium meal of esophagus) at the present time.","when_to_set_to_false":"Set to false if the patient has not undergone a fluoroscopy of the esophagus with barium (barium meal of esophagus) at the present time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a fluoroscopy of the esophagus with barium at the present time.","meaning":"Boolean indicating whether the patient has undergone a fluoroscopy of the esophagus with barium (barium meal of esophagus) now."}

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for stricture implies stem variable
(assert
  (! (=> patient_has_finding_of_malignant_esophageal_stricture_now@@makes_barium_difficult_to_pass_through
         patient_has_finding_of_malignant_esophageal_stricture_now)
     :named REQ2_AUXILIARY0)) ;; "severe stricture of the cancer of the esophagus that makes the barium difficult to pass through"

;; Qualifier variable for broadened esophagus implies stem variable
(assert
  (! (=> patient_has_finding_of_superior_normal_esophagus_broaden_now@@observed_in_barium_meal_of_esophagus
         patient_has_finding_of_superior_normal_esophagus_broaden_now)
     :named REQ2_AUXILIARY1)) ;; "the superior normal esophagus broaden observed in barium meal of esophagus"

;; Both findings are observed in barium meal, so the patient must have undergone the procedure if either is present
(assert
  (! (=> (or patient_has_finding_of_malignant_esophageal_stricture_now@@makes_barium_difficult_to_pass_through
             patient_has_finding_of_superior_normal_esophagus_broaden_now@@observed_in_barium_meal_of_esophagus)
         patient_has_undergone_fluoroscopy_of_esophagus_with_barium_now)
     :named REQ2_AUXILIARY2)) ;; "in barium meal of esophagus"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: severe malignant stricture that makes barium difficult to pass through, observed in barium meal
(assert
  (! patient_has_finding_of_malignant_esophageal_stricture_now@@makes_barium_difficult_to_pass_through
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "severe stricture of the cancer of the esophagus that makes the barium difficult to pass through in barium meal of esophagus"

;; Component 1: superior normal esophagus broaden, observed in barium meal
(assert
  (! patient_has_finding_of_superior_normal_esophagus_broaden_now@@observed_in_barium_meal_of_esophagus
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the superior normal esophagus broaden in barium meal of esophagus"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const bulk_of_esophageal_cancer_displayed_by_computed_tomography_three_dimensional_reconstruction_present Bool) ;; "the bulk of the esophageal cancer displayed by computed tomography three-dimensional reconstruction" {"when_to_set_to_true":"Set to true if the bulk of the esophageal cancer is displayed by computed tomography three-dimensional reconstruction.","when_to_set_to_false":"Set to false if the bulk of the esophageal cancer is not displayed by computed tomography three-dimensional reconstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bulk of the esophageal cancer is displayed by computed tomography three-dimensional reconstruction.","meaning":"Boolean indicating whether the bulk of the esophageal cancer is displayed by computed tomography three-dimensional reconstruction."}
(declare-const patient_has_finding_of_malignant_tumor_of_esophagus_now@@displayed_by_computed_tomography_three_dimensional_reconstruction Bool) ;; "malignant tumor of the esophagus displayed by computed tomography three-dimensional reconstruction" {"when_to_set_to_true":"Set to true if the patient's malignant tumor of the esophagus (esophageal cancer) is displayed by computed tomography three-dimensional reconstruction.","when_to_set_to_false":"Set to false if the patient's malignant tumor of the esophagus (esophageal cancer) is not displayed by computed tomography three-dimensional reconstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's malignant tumor of the esophagus (esophageal cancer) is displayed by computed tomography three-dimensional reconstruction.","meaning":"Boolean indicating whether the patient's malignant tumor of the esophagus (esophageal cancer) is displayed by computed tomography three-dimensional reconstruction."}
(declare-const shape_of_esophageal_cancer_displayed_by_computed_tomography_three_dimensional_reconstruction_present Bool) ;; "the shape of the esophageal cancer displayed by computed tomography three-dimensional reconstruction" {"when_to_set_to_true":"Set to true if the shape of the esophageal cancer is displayed by computed tomography three-dimensional reconstruction.","when_to_set_to_false":"Set to false if the shape of the esophageal cancer is not displayed by computed tomography three-dimensional reconstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the shape of the esophageal cancer is displayed by computed tomography three-dimensional reconstruction.","meaning":"Boolean indicating whether the shape of the esophageal cancer is displayed by computed tomography three-dimensional reconstruction."}

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_malignant_tumor_of_esophagus_now@@displayed_by_computed_tomography_three_dimensional_reconstruction
         patient_has_finding_of_malignant_tumor_of_esophagus_now)
     :named REQ3_AUXILIARY0)) ;; "malignant tumor of the esophagus displayed by computed tomography three-dimensional reconstruction"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: bulk of esophageal cancer displayed by CT 3D reconstruction
(assert
  (! bulk_of_esophageal_cancer_displayed_by_computed_tomography_three_dimensional_reconstruction_present
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the bulk of the esophageal cancer displayed by computed tomography three-dimensional reconstruction"

;; Component 1: shape of esophageal cancer displayed by CT 3D reconstruction
(assert
  (! shape_of_esophageal_cancer_displayed_by_computed_tomography_three_dimensional_reconstruction_present
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the shape of the esophageal cancer displayed by computed tomography three-dimensional reconstruction"

;; ===================== Declarations for the inclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_awake_now Bool) ;; "clear consciousness" {"when_to_set_to_true":"Set to true if the patient is currently awake (has clear consciousness).","when_to_set_to_false":"Set to false if the patient is currently not awake (does not have clear consciousness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently awake (has clear consciousness).","meaning":"Boolean indicating whether the patient is currently awake (has clear consciousness)."}
(declare-const patient_has_finding_of_cooperation_now Bool) ;; "cooperation" {"when_to_set_to_true":"Set to true if the patient is currently cooperative.","when_to_set_to_false":"Set to false if the patient is currently not cooperative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently cooperative.","meaning":"Boolean indicating whether the patient is currently cooperative."}
(declare-const ecog_performance_status_value_recorded_now_withunit_none Real) ;; "ECOG performance status" {"when_to_set_to_value":"Set to the value of the patient's ECOG performance status as recorded now (0, 1, 2, 3, 4, or 5).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's ECOG performance status is as recorded now.","meaning":"Numeric value indicating the patient's ECOG performance status as recorded now, unitless (standard ECOG scale: 0, 1, 2, 3, 4, 5)."}

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: clear consciousness
(assert
  (! patient_has_finding_of_awake_now
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have clear consciousness."

;; Component 1: cooperation
(assert
  (! patient_has_finding_of_cooperation_now
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have cooperation."

;; Component 2: ECOG performance status = 0 OR 1 OR 3
(assert
  (! (or (= ecog_performance_status_value_recorded_now_withunit_none 0)
         (= ecog_performance_status_value_recorded_now_withunit_none 1)
         (= ecog_performance_status_value_recorded_now_withunit_none 3))
     :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (ECOG performance status = 0) OR (ECOG performance status = 1) OR (ECOG performance status = 3)."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_provided_informed_consent_authorization Bool) ;; "To be included, the patient must provide informed consent: authorization." {"when_to_set_to_true":"Set to true if the patient has provided authorization as part of the informed consent process.","when_to_set_to_false":"Set to false if the patient has not provided authorization as part of the informed consent process.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided authorization as part of the informed consent process.","meaning":"Boolean indicating whether the patient has provided authorization as part of the informed consent process."}
(declare-const patient_has_provided_informed_consent_signature Bool) ;; "To be included, the patient must provide informed consent: signature." {"when_to_set_to_true":"Set to true if the patient has provided a signature as part of the informed consent process.","when_to_set_to_false":"Set to false if the patient has not provided a signature as part of the informed consent process.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided a signature as part of the informed consent process.","meaning":"Boolean indicating whether the patient has provided a signature as part of the informed consent process."}

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_provided_informed_consent_authorization
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide informed consent: authorization."

(assert
  (! patient_has_provided_informed_consent_signature
     :named REQ5_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide informed consent: signature."
