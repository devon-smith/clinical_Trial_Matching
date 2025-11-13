;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_lesion_of_liver_inthehistory Bool) ;; "To be included, the patient must have been diagnosed with de novo focal liver lesion at standard ultrasound." {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a lesion of the liver.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a lesion of the liver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a lesion of the liver.","meaning":"Boolean indicating whether the patient has ever been diagnosed with a lesion of the liver."}
(declare-const patient_has_diagnosis_of_lesion_of_liver_inthehistory@@is_de_novo Bool) ;; "de novo" {"when_to_set_to_true":"Set to true if the diagnosed liver lesion is de novo (newly arisen, not recurrent or pre-existing).","when_to_set_to_false":"Set to false if the diagnosed liver lesion is not de novo (i.e., recurrent or pre-existing).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosed liver lesion is de novo.","meaning":"Boolean indicating whether the diagnosed liver lesion is de novo."}
(declare-const patient_has_diagnosis_of_lesion_of_liver_inthehistory@@is_focal Bool) ;; "focal" {"when_to_set_to_true":"Set to true if the diagnosed liver lesion is focal (localized, not diffuse).","when_to_set_to_false":"Set to false if the diagnosed liver lesion is not focal (diffuse or multifocal).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosed liver lesion is focal.","meaning":"Boolean indicating whether the diagnosed liver lesion is focal."}
(declare-const patient_has_diagnosis_of_lesion_of_liver_inthehistory@@detected_at_standard_ultrasound Bool) ;; "at standard ultrasound" {"when_to_set_to_true":"Set to true if the diagnosed liver lesion was detected at standard ultrasound.","when_to_set_to_false":"Set to false if the diagnosed liver lesion was not detected at standard ultrasound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosed liver lesion was detected at standard ultrasound.","meaning":"Boolean indicating whether the diagnosed liver lesion was detected at standard ultrasound."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_diagnosis_of_lesion_of_liver_inthehistory@@is_de_novo
         patient_has_diagnosis_of_lesion_of_liver_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "de novo"

(assert
  (! (=> patient_has_diagnosis_of_lesion_of_liver_inthehistory@@is_focal
         patient_has_diagnosis_of_lesion_of_liver_inthehistory)
     :named REQ0_AUXILIARY1)) ;; "focal"

(assert
  (! (=> patient_has_diagnosis_of_lesion_of_liver_inthehistory@@detected_at_standard_ultrasound
         patient_has_diagnosis_of_lesion_of_liver_inthehistory)
     :named REQ0_AUXILIARY2)) ;; "at standard ultrasound"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (and patient_has_diagnosis_of_lesion_of_liver_inthehistory@@is_de_novo
          patient_has_diagnosis_of_lesion_of_liver_inthehistory@@is_focal
          patient_has_diagnosis_of_lesion_of_liver_inthehistory@@detected_at_standard_ultrasound)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have been diagnosed with de novo focal liver lesion at standard ultrasound."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; "age > 18 years" {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 18.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age > 18 years)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_provided_informed_consent_for_contrast_enhanced_ultrasound_study Bool) ;; "To be included, the patient must have provided informed consent for the contrast enhanced ultrasound study." {"when_to_set_to_true":"Set to true if the patient has provided informed consent for participation in the contrast enhanced ultrasound study.","when_to_set_to_false":"Set to false if the patient has not provided informed consent for participation in the contrast enhanced ultrasound study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent for participation in the contrast enhanced ultrasound study.","meaning":"Boolean indicating whether the patient has provided informed consent specifically for participation in the contrast enhanced ultrasound study."}
(declare-const patient_has_undergone_ultrasonography_with_contrast_inthehistory Bool) ;; "contrast enhanced ultrasound" {"when_to_set_to_true":"Set to true if the patient has ever undergone ultrasonography with contrast (contrast enhanced ultrasound) at any time in the past or present.","when_to_set_to_false":"Set to false if the patient has never undergone ultrasonography with contrast (contrast enhanced ultrasound) at any time in the past or present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone ultrasonography with contrast (contrast enhanced ultrasound).","meaning":"Boolean indicating whether the patient has ever undergone ultrasonography with contrast (contrast enhanced ultrasound) at any time in the past or present."}

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have provided informed consent for the contrast enhanced ultrasound study.
(assert
  (! patient_has_provided_informed_consent_for_contrast_enhanced_ultrasound_study
     :named REQ2_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have provided informed consent for the contrast enhanced ultrasound study."
