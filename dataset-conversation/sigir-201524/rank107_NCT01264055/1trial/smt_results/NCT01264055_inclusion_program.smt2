;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_standard_diagnostic_evaluation_inthehistory@@performed_according_to_current_clinical_practice Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a standard diagnostic evaluation at any time in the past, and the evaluation was performed according to current clinical practice.","when_to_set_to_false":"Set to false if the patient has never undergone a standard diagnostic evaluation at any time in the past, or the evaluation was not performed according to current clinical practice.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a standard diagnostic evaluation performed according to current clinical practice.","meaning":"Boolean indicating whether the patient has ever undergone a standard diagnostic evaluation performed according to current clinical practice in the past."} ;; "the patient must have received a standard diagnostic evaluation (current clinical practice)"
(declare-const patient_has_undergone_ct_of_chest_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a computed tomography scan of the chest at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a computed tomography scan of the chest at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a computed tomography scan of the chest.","meaning":"Boolean indicating whether the patient has ever undergone a computed tomography scan of the chest in the past."} ;; "have received a computed tomography scan of the chest"
(declare-const patient_has_undergone_ct_of_chest_inthehistory@@temporalcontext_prior_to_enrolling_in_consortium_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's computed tomography scan of the chest occurred prior to enrolling in the Consortium study.","when_to_set_to_false":"Set to false if the patient's computed tomography scan of the chest did not occur prior to enrolling in the Consortium study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scan occurred prior to enrolling in the Consortium study.","meaning":"Boolean indicating whether the patient's CT scan of the chest occurred prior to enrolling in the Consortium study."} ;; "prior to enrolling in the Consortium study"
(declare-const patient_has_undergone_ct_of_chest_inthehistory@@performed_to_document_bronchiectasis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's computed tomography scan of the chest was performed specifically to document bronchiectasis.","when_to_set_to_false":"Set to false if the patient's computed tomography scan of the chest was not performed to document bronchiectasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scan was performed to document bronchiectasis.","meaning":"Boolean indicating whether the patient's CT scan of the chest was performed to document bronchiectasis."} ;; "to document bronchiectasis"
(declare-const patient_has_diagnosis_of_bronchiectasis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of bronchiectasis at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of bronchiectasis at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of bronchiectasis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of bronchiectasis in the past."} ;; "bronchiectasis"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for CT scan performed to document bronchiectasis implies CT scan occurred
(assert
  (! (=> patient_has_undergone_ct_of_chest_inthehistory@@performed_to_document_bronchiectasis
         patient_has_undergone_ct_of_chest_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "computed tomography scan of the chest to document bronchiectasis"

;; Qualifier variable for CT scan prior to enrolling implies CT scan occurred
(assert
  (! (=> patient_has_undergone_ct_of_chest_inthehistory@@temporalcontext_prior_to_enrolling_in_consortium_study
         patient_has_undergone_ct_of_chest_inthehistory)
     :named REQ0_AUXILIARY1)) ;; "computed tomography scan of the chest prior to enrolling in the Consortium study"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Standard diagnostic evaluation (current clinical practice)
(assert
  (! patient_has_undergone_standard_diagnostic_evaluation_inthehistory@@performed_according_to_current_clinical_practice
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have received a standard diagnostic evaluation (current clinical practice)"

;; Component 1: CT scan of chest to document bronchiectasis prior to enrolling
(assert
  (! (and patient_has_undergone_ct_of_chest_inthehistory@@performed_to_document_bronchiectasis
          patient_has_undergone_ct_of_chest_inthehistory@@temporalcontext_prior_to_enrolling_in_consortium_study)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have received a computed tomography scan of the chest to document bronchiectasis prior to enrolling in the Consortium study"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient must be an adult (age greater than or equal to 18 years)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must be an adult (age >= 18 years)
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be an adult (age greater than or equal to 18 years)"

;; Component 1: The patient must have bronchiectasis
(assert
  (! patient_has_diagnosis_of_bronchiectasis_inthehistory
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have bronchiectasis"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_male Bool) ;; {"when_to_set_to_true":"Set to true if the patient is male.","when_to_set_to_false":"Set to false if the patient is not male.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is male.","meaning":"Boolean indicating whether the patient is male."} ;; "be male"
(declare-const patient_is_female Bool) ;; {"when_to_set_to_true":"Set to true if the patient is female.","when_to_set_to_false":"Set to false if the patient is not female.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is female.","meaning":"Boolean indicating whether the patient is female."} ;; "be female"
(assert
  (! (or patient_is_male
         (and patient_is_female
              (>= patient_age_value_recorded_now_in_years 18)))
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be male) OR (be female AND have age greater than or equal to 18 years))."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_chronic_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic cough.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chronic cough.","meaning":"Boolean indicating whether the patient currently has chronic cough."} ;; "the patient must have a chronic cough."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_chronic_cough_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have a chronic cough."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_undergone_ct_of_chest_inthehistory@@available_on_compact_disc Bool) ;; {"when_to_set_to_true":"Set to true if the patient's computed tomography scan of the chest is available on a compact disc.","when_to_set_to_false":"Set to false if the patient's computed tomography scan of the chest is not available on a compact disc.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scan is available on a compact disc.","meaning":"Boolean indicating whether the patient's computed tomography scan of the chest is available on a compact disc."} ;; "the patient must have an available computed tomography scan of the chest (on a compact disc)"
(declare-const patient_has_finding_of_dilated_airways_on_ct_of_chest Bool) ;; {"when_to_set_to_true":"Set to true if the patient's computed tomography scan of the chest shows evidence of dilated airways.","when_to_set_to_false":"Set to false if the patient's computed tomography scan of the chest does not show evidence of dilated airways.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's computed tomography scan of the chest shows evidence of dilated airways.","meaning":"Boolean indicating whether the patient's computed tomography scan of the chest shows evidence of dilated airways."} ;; "scan must show evidence of dilated airways"
(declare-const patient_has_finding_of_dilated_airways_on_ct_of_chest@@fulfills_radiographic_criteria_for_bronchiectasis Bool) ;; {"when_to_set_to_true":"Set to true if the dilated airways on the patient's computed tomography scan of the chest fulfill radiographic criteria for bronchiectasis.","when_to_set_to_false":"Set to false if the dilated airways on the patient's computed tomography scan of the chest do not fulfill radiographic criteria for bronchiectasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dilated airways on the patient's computed tomography scan of the chest fulfill radiographic criteria for bronchiectasis.","meaning":"Boolean indicating whether the dilated airways on the patient's computed tomography scan of the chest fulfill radiographic criteria for bronchiectasis."} ;; "fulfilling radiographic criteria for bronchiectasis"
(declare-const patient_has_finding_of_dilated_airways_on_ct_of_chest@@present_in_more_than_one_lobe Bool) ;; {"when_to_set_to_true":"Set to true if the dilated airways on the patient's computed tomography scan of the chest are present in more than one lobe.","when_to_set_to_false":"Set to false if the dilated airways on the patient's computed tomography scan of the chest are present in only one lobe or not present at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dilated airways on the patient's computed tomography scan of the chest are present in more than one lobe.","meaning":"Boolean indicating whether the dilated airways on the patient's computed tomography scan of the chest are present in more than one lobe."} ;; "in more than one lobe"
(declare-const patient_has_diagnosis_of_bronchiectasis_inthehistory@@present_in_more_than_one_lobe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bronchiectasis is present in more than one lobe.","when_to_set_to_false":"Set to false if the patient's bronchiectasis is present in only one lobe or not present at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bronchiectasis is present in more than one lobe.","meaning":"Boolean indicating whether the patient's bronchiectasis is present in more than one lobe."} ;; "bronchiectasis in more than one lobe"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_undergone_ct_of_chest_inthehistory@@available_on_compact_disc
         patient_has_undergone_ct_of_chest_inthehistory)
     :named REQ4_AUXILIARY0)) ;; "the patient must have an available computed tomography scan of the chest (on a compact disc)"

(assert
  (! (=> patient_has_finding_of_dilated_airways_on_ct_of_chest@@fulfills_radiographic_criteria_for_bronchiectasis
         patient_has_finding_of_dilated_airways_on_ct_of_chest)
     :named REQ4_AUXILIARY1)) ;; "scan must show evidence of dilated airways fulfilling radiographic criteria for bronchiectasis"

(assert
  (! (=> patient_has_finding_of_dilated_airways_on_ct_of_chest@@present_in_more_than_one_lobe
         patient_has_finding_of_dilated_airways_on_ct_of_chest)
     :named REQ4_AUXILIARY2)) ;; "scan must show evidence of dilated airways in more than one lobe"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: patient must have an available CT scan of the chest (on a compact disc)
(assert
  (! patient_has_undergone_ct_of_chest_inthehistory@@available_on_compact_disc
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have an available computed tomography scan of the chest (on a compact disc)"

;; Component 1: scan must show evidence of dilated airways fulfilling radiographic criteria for bronchiectasis in more than one lobe
(assert
  (! (and patient_has_finding_of_dilated_airways_on_ct_of_chest@@fulfills_radiographic_criteria_for_bronchiectasis
          patient_has_finding_of_dilated_airways_on_ct_of_chest@@present_in_more_than_one_lobe)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "scan must show evidence of dilated airways fulfilling radiographic criteria for bronchiectasis in more than one lobe"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_ability_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to provide informed consent, including HIPAA consent.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to provide informed consent, including HIPAA consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to provide informed consent, including HIPAA consent.","meaning":"Boolean indicating whether the patient currently has the ability to provide informed consent, including HIPAA consent."} ;; "the patient must have the ability to provide informed consent (including Health Insurance Portability and Accountability Act consent)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_ability_to_provide_informed_consent_now
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have the ability to provide informed consent (including Health Insurance Portability and Accountability Act consent)"
