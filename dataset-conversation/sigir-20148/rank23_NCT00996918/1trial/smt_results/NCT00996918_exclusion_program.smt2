;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_medical_contraindication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any medical contraindication.","when_to_set_to_false":"Set to false if the patient currently does not have any medical contraindication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any medical contraindication.","meaning":"Boolean indicating whether the patient currently has any medical contraindication."} ;; "The patient is excluded if the patient has any medical contraindication."

(declare-const patient_has_psychiatric_contraindication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any psychiatric contraindication.","when_to_set_to_false":"Set to false if the patient currently does not have any psychiatric contraindication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any psychiatric contraindication.","meaning":"Boolean indicating whether the patient currently has any psychiatric contraindication."} ;; "The patient is excluded if the patient has any psychiatric contraindication."

(declare-const patient_has_clinically_significant_abnormality_investigator_judged_substantially_increases_study_risk_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any clinically significant abnormality that, in the investigator's judgment, will substantially increase the risk associated with the patient's participation in and completion of the study.","when_to_set_to_false":"Set to false if the patient currently does not have any clinically significant abnormality that, in the investigator's judgment, will substantially increase the risk associated with the patient's participation in and completion of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any clinically significant abnormality that, in the investigator's judgment, will substantially increase the risk associated with the patient's participation in and completion of the study.","meaning":"Boolean indicating whether the patient currently has any clinically significant abnormality that, in the investigator's judgment, will substantially increase the risk associated with the patient's participation in and completion of the study."} ;; "The patient is excluded if the patient has any clinically significant abnormality that, in the investigator's judgment, will substantially increase the risk associated with the patient's participation in and completion of the study."

(declare-const patient_has_clinically_significant_abnormality_investigator_judged_could_preclude_evaluation_of_response_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any clinically significant abnormality that, in the investigator's judgment, could preclude the evaluation of the patient's response.","when_to_set_to_false":"Set to false if the patient currently does not have any clinically significant abnormality that, in the investigator's judgment, could preclude the evaluation of the patient's response.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any clinically significant abnormality that, in the investigator's judgment, could preclude the evaluation of the patient's response.","meaning":"Boolean indicating whether the patient currently has any clinically significant abnormality that, in the investigator's judgment, could preclude the evaluation of the patient's response."} ;; "The patient is excluded if the patient has any clinically significant abnormality that, in the investigator's judgment, could preclude the evaluation of the patient's response."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_medical_contraindication_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any medical contraindication."

(assert
  (! (not patient_has_psychiatric_contraindication_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any psychiatric contraindication."

(assert
  (! (not patient_has_clinically_significant_abnormality_investigator_judged_substantially_increases_study_risk_now)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any clinically significant abnormality that, in the investigator's judgment, will substantially increase the risk associated with the patient's participation in and completion of the study."

(assert
  (! (not patient_has_clinically_significant_abnormality_investigator_judged_could_preclude_evaluation_of_response_now)
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any clinically significant abnormality that, in the investigator's judgment, could preclude the evaluation of the patient's response."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_significant_abnormality_of_the_brain_on_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any significant abnormality of the brain detected on magnetic resonance imaging.","when_to_set_to_false":"Set to false if the patient currently does not have any significant abnormality of the brain detected on magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any significant abnormality of the brain detected on magnetic resonance imaging.","meaning":"Boolean indicating whether the patient currently has any significant abnormality of the brain detected on magnetic resonance imaging."} ;; "The patient is excluded if the patient has any significant abnormality of the brain on magnetic resonance imaging."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_significant_abnormality_of_the_brain_on_magnetic_resonance_imaging_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any significant abnormality of the brain on magnetic resonance imaging."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_used_investigational_device_inthepast_60_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any investigational device within the past 60 days prior to screening.","when_to_set_to_false":"Set to false if the patient has not used any investigational device within the past 60 days prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any investigational device within the past 60 days prior to screening.","meaning":"Boolean indicating whether the patient has used any investigational device within the past 60 days prior to screening."} ;; "the patient has used any investigational device within the last sixty days prior to screening"

(declare-const patient_is_exposed_to_drug_or_medicament_inthepast60days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past 60 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past 60 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past 60 days.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past 60 days."} ;; "the patient has used any investigational drug other than bapineuzumab within the last sixty days prior to screening"

(declare-const patient_is_exposed_to_drug_or_medicament_inthepast60days@@is_investigational_and_other_than_bapineuzumab Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient was exposed to within the past 60 days is investigational and is not bapineuzumab.","when_to_set_to_false":"Set to false if the drug or medicament the patient was exposed to within the past 60 days is not investigational or is bapineuzumab.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is investigational and is not bapineuzumab.","meaning":"Boolean indicating whether the drug or medicament the patient was exposed to within the past 60 days is investigational and is not bapineuzumab."} ;; "the patient has used any investigational drug other than bapineuzumab within the last sixty days prior to screening"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast60days@@is_investigational_and_other_than_bapineuzumab
      patient_is_exposed_to_drug_or_medicament_inthepast60days)
:named REQ2_AUXILIARY0)) ;; "drug or medicament the patient was exposed to within the past 60 days is investigational and is not bapineuzumab"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_is_exposed_to_drug_or_medicament_inthepast60days@@is_investigational_and_other_than_bapineuzumab
            patient_has_used_investigational_device_inthepast_60_days))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has used any investigational drug other than bapineuzumab within the last sixty days prior to screening) OR (the patient has used any investigational device within the last sixty days prior to screening))."
