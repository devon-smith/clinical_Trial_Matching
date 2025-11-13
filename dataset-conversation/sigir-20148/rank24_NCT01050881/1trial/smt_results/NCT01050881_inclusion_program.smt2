;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_blood_donor_status_deferred_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood donor status that is deferred.","when_to_set_to_false":"Set to false if the patient currently does not have a blood donor status that is deferred (e.g., eligible, permanent deferral, or other status).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a deferred blood donor status.","meaning":"Boolean indicating whether the patient currently has a blood donor status that is deferred."} ;; "To be included, the patient must have deferred blood donor status."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_blood_donor_status_deferred_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have deferred blood donor status."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with human immunodeficiency virus infection in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with human immunodeficiency virus infection in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with human immunodeficiency virus infection in the past.","meaning":"Boolean indicating whether the patient has ever been diagnosed with human immunodeficiency virus infection in the past."} ;; "have been deferred due to a positive result of a routine blood test for human immunodeficiency virus infection"
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory@@detected_by_routine_blood_test Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis was detected by a routine blood test.","when_to_set_to_false":"Set to false if the diagnosis was not detected by a routine blood test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was detected by a routine blood test.","meaning":"Boolean indicating whether the diagnosis was detected by a routine blood test."} ;; "have been deferred due to a positive result of a routine blood test for human immunodeficiency virus infection"

(declare-const patient_has_diagnosis_of_type_b_viral_hepatitis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with hepatitis B infection in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with hepatitis B infection in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with hepatitis B infection in the past.","meaning":"Boolean indicating whether the patient has ever been diagnosed with hepatitis B infection in the past."} ;; "have been deferred due to a positive result of a routine blood test for hepatitis B infection"
(declare-const patient_has_diagnosis_of_type_b_viral_hepatitis_inthehistory@@detected_by_routine_blood_test Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis was detected by a routine blood test.","when_to_set_to_false":"Set to false if the diagnosis was not detected by a routine blood test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was detected by a routine blood test.","meaning":"Boolean indicating whether the diagnosis was detected by a routine blood test."} ;; "have been deferred due to a positive result of a routine blood test for hepatitis B infection"

(declare-const patient_has_diagnosis_of_viral_hepatitis_c_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with hepatitis C infection in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with hepatitis C infection in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with hepatitis C infection in the past.","meaning":"Boolean indicating whether the patient has ever been diagnosed with hepatitis C infection in the past."} ;; "have been deferred due to a positive result of a routine blood test for hepatitis C infection"
(declare-const patient_has_diagnosis_of_viral_hepatitis_c_inthehistory@@detected_by_routine_blood_test Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis was detected by a routine blood test.","when_to_set_to_false":"Set to false if the diagnosis was not detected by a routine blood test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was detected by a routine blood test.","meaning":"Boolean indicating whether the diagnosis was detected by a routine blood test."} ;; "have been deferred due to a positive result of a routine blood test for hepatitis C infection"

(declare-const patient_has_diagnosis_of_infection_caused_by_human_t_lymphotropic_virus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with human T-lymphotropic virus infection in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with human T-lymphotropic virus infection in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with human T-lymphotropic virus infection in the past.","meaning":"Boolean indicating whether the patient has ever been diagnosed with human T-lymphotropic virus infection in the past."} ;; "have been deferred due to a positive result of a routine blood test for human T-lymphotropic virus infection"
(declare-const patient_has_diagnosis_of_infection_caused_by_human_t_lymphotropic_virus_inthehistory@@confirmed_by_positive_result Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis was confirmed by a positive result.","when_to_set_to_false":"Set to false if the diagnosis was not confirmed by a positive result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was confirmed by a positive result.","meaning":"Boolean indicating whether the diagnosis was confirmed by a positive result."} ;; "have been deferred due to a positive result of a routine blood test for human T-lymphotropic virus infection"
(declare-const patient_has_diagnosis_of_infection_caused_by_human_t_lymphotropic_virus_inthehistory@@detected_by_routine_blood_test Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis was detected by a routine blood test.","when_to_set_to_false":"Set to false if the diagnosis was not detected by a routine blood test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was detected by a routine blood test.","meaning":"Boolean indicating whether the diagnosis was detected by a routine blood test."} ;; "have been deferred due to a positive result of a routine blood test for human T-lymphotropic virus infection"

(declare-const patient_has_finding_of_at_risk_of_variant_creutzfeldt_jakob_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been identified as at risk of variant Creutzfeldt-Jakob disease infection in the past.","when_to_set_to_false":"Set to false if the patient has never been identified as at risk of variant Creutzfeldt-Jakob disease infection in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been identified as at risk of variant Creutzfeldt-Jakob disease infection in the past.","meaning":"Boolean indicating whether the patient has ever been identified as at risk of variant Creutzfeldt-Jakob disease infection in the past."} ;; "have been identified as at risk of variant Creutzfeldt-Jakob disease infection"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory@@detected_by_routine_blood_test
         patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "diagnosis of HIV infection detected by routine blood test implies diagnosis of HIV infection"

(assert
  (! (=> patient_has_diagnosis_of_type_b_viral_hepatitis_inthehistory@@detected_by_routine_blood_test
         patient_has_diagnosis_of_type_b_viral_hepatitis_inthehistory)
     :named REQ1_AUXILIARY1)) ;; "diagnosis of hepatitis B detected by routine blood test implies diagnosis of hepatitis B"

(assert
  (! (=> patient_has_diagnosis_of_viral_hepatitis_c_inthehistory@@detected_by_routine_blood_test
         patient_has_diagnosis_of_viral_hepatitis_c_inthehistory)
     :named REQ1_AUXILIARY2)) ;; "diagnosis of hepatitis C detected by routine blood test implies diagnosis of hepatitis C"

(assert
  (! (=> patient_has_diagnosis_of_infection_caused_by_human_t_lymphotropic_virus_inthehistory@@detected_by_routine_blood_test
         patient_has_diagnosis_of_infection_caused_by_human_t_lymphotropic_virus_inthehistory)
     :named REQ1_AUXILIARY3)) ;; "diagnosis of HTLV infection detected by routine blood test implies diagnosis of HTLV infection"

(assert
  (! (=> patient_has_diagnosis_of_infection_caused_by_human_t_lymphotropic_virus_inthehistory@@confirmed_by_positive_result
         patient_has_diagnosis_of_infection_caused_by_human_t_lymphotropic_virus_inthehistory)
     :named REQ1_AUXILIARY4)) ;; "diagnosis of HTLV infection confirmed by positive result implies diagnosis of HTLV infection"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Inclusion if any of the following is true
(assert
  (! (or
        patient_has_diagnosis_of_human_immunodeficiency_virus_infection_inthehistory@@detected_by_routine_blood_test
        patient_has_diagnosis_of_type_b_viral_hepatitis_inthehistory@@detected_by_routine_blood_test
        patient_has_diagnosis_of_viral_hepatitis_c_inthehistory@@detected_by_routine_blood_test
        patient_has_diagnosis_of_infection_caused_by_human_t_lymphotropic_virus_inthehistory@@detected_by_routine_blood_test
        patient_has_finding_of_at_risk_of_variant_creutzfeldt_jakob_disease_inthehistory
     )
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have been deferred due to a positive result of a routine blood test for HIV) OR (hepatitis B) OR (hepatitis C) OR (HTLV) OR (at risk of vCJD))"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_deferral_in_2005 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a deferral that occurred in 2005.","when_to_set_to_false":"Set to false if the patient has not had a deferral that occurred in 2005.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a deferral in 2005.","meaning":"Boolean indicating whether the patient has had a deferral in 2005."} ;; "deferral must have occurred in 2005"
(declare-const patient_has_deferral_in_2007_for_pilot Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a deferral that occurred in 2007 for the pilot.","when_to_set_to_false":"Set to false if the patient has not had a deferral that occurred in 2007 for the pilot.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a deferral in 2007 for the pilot.","meaning":"Boolean indicating whether the patient has had a deferral in 2007 for the pilot."} ;; "deferral must have occurred in 2007 for the pilot"
(declare-const patient_has_deferral_in_2008 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a deferral that occurred in 2008.","when_to_set_to_false":"Set to false if the patient has not had a deferral that occurred in 2008.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a deferral in 2008.","meaning":"Boolean indicating whether the patient has had a deferral in 2008."} ;; "deferral must have occurred in 2008"
(declare-const patient_has_deferral_in_2009 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a deferral that occurred in 2009.","when_to_set_to_false":"Set to false if the patient has not had a deferral that occurred in 2009.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a deferral in 2009.","meaning":"Boolean indicating whether the patient has had a deferral in 2009."} ;; "deferral must have occurred in 2009"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Deferral must have occurred ((in 2008) OR (in 2009) OR (in 2007 for the pilot) OR ((in 2005) AND (the patient has been identified as at risk of variant Creutzfeldt-Jakob disease infection)))
(assert
  (! (or patient_has_deferral_in_2008
         patient_has_deferral_in_2009
         patient_has_deferral_in_2007_for_pilot
         (and patient_has_deferral_in_2005
              patient_has_finding_of_at_risk_of_variant_creutzfeldt_jakob_disease_inthehistory))
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "deferral must have occurred ((in 2008) OR (in 2009) OR (in 2007 for the pilot) OR ((in 2005) AND (the patient has been identified as at risk of variant Creutzfeldt-Jakob disease infection)))"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_is_registered_blood_donor_at_nhsbt_centre_in_england_or_wales Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a blood donor and is registered at a National Health Service Blood and Transplant centre (English Blood Service) located in England or Wales.","when_to_set_to_false":"Set to false if the patient is not a blood donor registered at a National Health Service Blood and Transplant centre (English Blood Service) in England or Wales.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a blood donor registered at a National Health Service Blood and Transplant centre (English Blood Service) in England or Wales.","meaning":"Boolean indicating whether the patient is a blood donor registered at a National Health Service Blood and Transplant centre (English Blood Service) in England or Wales."} ;; "To be included, the patient must be a blood donor registered at one of the National Health Service Blood and Transplant centres (English Blood Service in England and Wales)."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_is_registered_blood_donor_at_nhsbt_centre_in_england_or_wales
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a blood donor registered at one of the National Health Service Blood and Transplant centres (English Blood Service in England and Wales)."
