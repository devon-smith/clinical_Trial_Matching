;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_contraindication_for_contrast_enhanced_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication for a contrast enhanced study, regardless of the specific reason.","when_to_set_to_false":"Set to false if the patient currently has no contraindication for a contrast enhanced study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication for a contrast enhanced study.","meaning":"Boolean indicating whether the patient currently has any contraindication for undergoing a contrast enhanced study."} ;; "contraindication for contrast enhanced study"

(declare-const patient_has_diagnosis_of_acute_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with acute myocardial infarction at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with acute myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of acute myocardial infarction."} ;; "acute cardiac infarction"

(declare-const patient_has_diagnosis_of_new_york_heart_association_classification_class_iii_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with NYHA class III cardiac insufficiency at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with NYHA class III cardiac insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with NYHA class III cardiac insufficiency.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of NYHA class III cardiac insufficiency."} ;; "class III cardiac insufficiency"

(declare-const patient_has_diagnosis_of_new_york_heart_association_classification_class_iv_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with NYHA class IV cardiac insufficiency at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with NYHA class IV cardiac insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with NYHA class IV cardiac insufficiency.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of NYHA class IV cardiac insufficiency."} ;; "class IV cardiac insufficiency"

(declare-const patient_has_diagnosis_of_conduction_disorder_of_the_heart_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a conduction disorder of the heart at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a conduction disorder of the heart.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a conduction disorder of the heart.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of a conduction disorder of the heart."} ;; "cardiac rhythm disorder"

(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "is pregnant"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_acute_myocardial_infarction_inthehistory
          patient_has_diagnosis_of_new_york_heart_association_classification_class_iii_inthehistory
          patient_has_diagnosis_of_new_york_heart_association_classification_class_iv_inthehistory
          patient_has_diagnosis_of_conduction_disorder_of_the_heart_inthehistory
          patient_is_pregnant_now)
    patient_has_contraindication_for_contrast_enhanced_study_now)
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples ((acute cardiac infarction) OR (class III cardiac insufficiency) OR (class IV cardiac insufficiency) OR (cardiac rhythm disorder) OR (is pregnant))."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_contraindication_for_contrast_enhanced_study_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication for contrast enhanced study with non-exhaustive examples ((acute cardiac infarction) OR (class III cardiac insufficiency) OR (class IV cardiac insufficiency) OR (cardiac rhythm disorder) OR (is pregnant))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_cyst_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with a cyst.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with a cyst.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with a cyst.","meaning":"Boolean indicating whether the patient is currently diagnosed with a cyst."} ;; "cyst"
(declare-const patient_has_diagnosis_of_cyst_of_biliary_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with a cyst of the biliary tract.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with a cyst of the biliary tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with a cyst of the biliary tract.","meaning":"Boolean indicating whether the patient is currently diagnosed with a cyst of the biliary tract."} ;; "biliary cyst"
(declare-const patient_has_diagnosis_of_simple_biliary_cyst_now@@diagnosed_at_standard_ultrasound Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with a simple biliary cyst and the diagnosis was made at a standard ultrasound.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with a simple biliary cyst or the diagnosis was not made at a standard ultrasound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with a simple biliary cyst at a standard ultrasound.","meaning":"Boolean indicating whether the patient is currently diagnosed with a simple biliary cyst at a standard ultrasound."} ;; "simple biliary cyst at standard ultrasound"
(declare-const patient_has_diagnosis_of_simple_hydatid_cyst_now@@diagnosed_at_standard_ultrasound Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with a simple hydatid cyst and the diagnosis was made at a standard ultrasound.","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with a simple hydatid cyst or the diagnosis was not made at a standard ultrasound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with a simple hydatid cyst at a standard ultrasound.","meaning":"Boolean indicating whether the patient is currently diagnosed with a simple hydatid cyst at a standard ultrasound."} ;; "simple hydatid cyst at standard ultrasound"
(declare-const patient_has_undergone_ultrasonography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone ultrasonography (ultrasound) now.","when_to_set_to_false":"Set to false if the patient has not undergone ultrasonography (ultrasound) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone ultrasonography (ultrasound) now.","meaning":"Boolean indicating whether the patient has undergone ultrasonography (ultrasound) now."} ;; "ultrasound"
(declare-const patient_has_undergone_ultrasonography_now@@ultrasound_is_standard Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a standard ultrasonography (ultrasound) now.","when_to_set_to_false":"Set to false if the patient has undergone ultrasonography (ultrasound) now but it is not standard.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ultrasonography (ultrasound) now is standard.","meaning":"Boolean indicating whether the patient has undergone a standard ultrasonography (ultrasound) now."} ;; "ultrasound is standard"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for simple biliary cyst at standard ultrasound implies cyst of biliary tract
(assert
(! (=> patient_has_diagnosis_of_simple_biliary_cyst_now@@diagnosed_at_standard_ultrasound
      patient_has_diagnosis_of_cyst_of_biliary_tract_now)
:named REQ1_AUXILIARY0)) ;; "simple biliary cyst at standard ultrasound" implies "cyst of biliary tract"

;; Qualifier variable for simple biliary cyst at standard ultrasound implies cyst
(assert
(! (=> patient_has_diagnosis_of_simple_biliary_cyst_now@@diagnosed_at_standard_ultrasound
      patient_has_diagnosis_of_cyst_now)
:named REQ1_AUXILIARY1)) ;; "simple biliary cyst at standard ultrasound" implies "cyst"

;; Qualifier variable for simple hydatid cyst at standard ultrasound implies cyst
(assert
(! (=> patient_has_diagnosis_of_simple_hydatid_cyst_now@@diagnosed_at_standard_ultrasound
      patient_has_diagnosis_of_cyst_now)
:named REQ1_AUXILIARY2)) ;; "simple hydatid cyst at standard ultrasound" implies "cyst"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_simple_biliary_cyst_now@@diagnosed_at_standard_ultrasound)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is diagnosed with simple biliary cyst at standard ultrasound."

(assert
(! (not patient_has_diagnosis_of_simple_hydatid_cyst_now@@diagnosed_at_standard_ultrasound)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is diagnosed with simple hydatid cyst at standard ultrasound."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const contrast_study_is_performed_now Bool) ;; {"when_to_set_to_true":"Set to true if a contrast study is performed now.","when_to_set_to_false":"Set to false if a contrast study is not performed now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a contrast study is performed now.","meaning":"Boolean indicating whether a contrast study is performed now."} ;; "contrast study is used for follow up"
(declare-const contrast_study_is_performed_now@@used_for_follow_up_of_known_focal_liver_lesion Bool) ;; {"when_to_set_to_true":"Set to true if the contrast study performed now is used for follow up of a known focal liver lesion.","when_to_set_to_false":"Set to false if the contrast study performed now is not used for follow up of a known focal liver lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contrast study performed now is used for follow up of a known focal liver lesion.","meaning":"Boolean indicating whether the contrast study performed now is used for follow up of a known focal liver lesion."} ;; "for which the contrast study is used for follow up"
(declare-const patient_has_finding_of_lesion_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lesion of the liver.","when_to_set_to_false":"Set to false if the patient currently does not have a lesion of the liver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a lesion of the liver.","meaning":"Boolean indicating whether the patient currently has a lesion of the liver."} ;; "liver lesion"
(declare-const patient_has_finding_of_lesion_of_liver_now@@is_focal Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current liver lesion is focal.","when_to_set_to_false":"Set to false if the patient's current liver lesion is not focal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current liver lesion is focal.","meaning":"Boolean indicating whether the patient's current liver lesion is focal."} ;; "focal liver lesion"
(declare-const patient_has_finding_of_lesion_of_liver_now@@is_known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current liver lesion is known (previously identified or documented).","when_to_set_to_false":"Set to false if the patient's current liver lesion is not known (not previously identified or documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current liver lesion is known.","meaning":"Boolean indicating whether the patient's current liver lesion is known (previously identified or documented)."} ;; "known focal liver lesion"
(declare-const patient_has_undergone_percutaneous_treatment_of_liver_lesion_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous treatment of a liver lesion in the past.","when_to_set_to_false":"Set to false if the patient has not undergone percutaneous treatment of a liver lesion in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone percutaneous treatment of a liver lesion in the past.","meaning":"Boolean indicating whether the patient has undergone percutaneous treatment of a liver lesion in the history."} ;; "after percutaneous treatment"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> contrast_study_is_performed_now@@used_for_follow_up_of_known_focal_liver_lesion
      contrast_study_is_performed_now)
   :named REQ2_AUXILIARY0)) ;; "contrast study is performed now and is used for follow up of known focal liver lesion"

(assert
(! (=> patient_has_finding_of_lesion_of_liver_now@@is_focal
      patient_has_finding_of_lesion_of_liver_now)
   :named REQ2_AUXILIARY1)) ;; "focal liver lesion implies liver lesion"

(assert
(! (=> patient_has_finding_of_lesion_of_liver_now@@is_known
      patient_has_finding_of_lesion_of_liver_now)
   :named REQ2_AUXILIARY2)) ;; "known liver lesion implies liver lesion"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have a known focal liver lesion (possibly after percutaneous treatment) for which the contrast study is used for follow up
(assert
(! (not (and patient_has_finding_of_lesion_of_liver_now@@is_known
             patient_has_finding_of_lesion_of_liver_now@@is_focal
             (or (not patient_has_undergone_percutaneous_treatment_of_liver_lesion_in_the_history)
                 patient_has_undergone_percutaneous_treatment_of_liver_lesion_in_the_history) ;; "for example, after percutaneous treatment" is a non-exhaustive example
             contrast_study_is_performed_now@@used_for_follow_up_of_known_focal_liver_lesion))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known focal liver lesion (for example, after percutaneous treatment) for which the contrast study is used for follow up."
