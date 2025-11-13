;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus."}  ;; "have diabetes"
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypertensive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypertensive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypertensive disorder.","meaning":"Boolean indicating whether the patient currently has hypertensive disorder."}  ;; "have hypertension"
(declare-const patient_has_finding_of_osteoporosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of osteoporosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of osteoporosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has osteoporosis.","meaning":"Boolean indicating whether the patient currently has osteoporosis."}  ;; "have osteoporosis"
(declare-const patient_has_finding_of_infertility_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has infertility.","when_to_set_to_false":"Set to false if the patient currently does not have infertility.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has infertility.","meaning":"Boolean indicating whether the patient currently has infertility."}  ;; "have infertility"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_has_finding_of_diabetes_mellitus_now
         patient_has_finding_of_hypertensive_disorder_now
         patient_has_finding_of_osteoporosis_now
         patient_has_finding_of_infertility_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have diabetes) OR (have hypertension) OR (have osteoporosis) OR (have infertility))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_currently_receiving_treatment_for_alcohol_problems Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment for alcohol problems.","when_to_set_to_false":"Set to false if the patient is currently not receiving treatment for alcohol problems.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving treatment for alcohol problems.","meaning":"Boolean indicating whether the patient is currently receiving treatment for alcohol problems."}  ;; "NOT currently be receiving treatment for alcohol problems"
(declare-const patient_is_currently_receiving_treatment_for_drug_problems Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment for drug problems.","when_to_set_to_false":"Set to false if the patient is currently not receiving treatment for drug problems.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving treatment for drug problems.","meaning":"Boolean indicating whether the patient is currently receiving treatment for drug problems."}  ;; "NOT currently be receiving treatment for drug problems"
(declare-const patient_is_currently_receiving_treatment_for_substance_related_medical_illness Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving treatment for substance related medical illness.","when_to_set_to_false":"Set to false if the patient is currently not receiving treatment for substance related medical illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving treatment for substance related medical illness.","meaning":"Boolean indicating whether the patient is currently receiving treatment for substance related medical illness."}  ;; "NOT currently be receiving treatment for substance related medical illness"

;; ===================== Constraint Assertions (REQ 1) =====================
;; To be included, the patient must ((NOT currently be receiving treatment for alcohol problems) OR (NOT currently be receiving treatment for drug problems) OR (NOT currently be receiving treatment for substance related medical illness)).
(assert
  (! (or (not patient_is_currently_receiving_treatment_for_alcohol_problems)
         (not patient_is_currently_receiving_treatment_for_drug_problems)
         (not patient_is_currently_receiving_treatment_for_substance_related_medical_illness))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((NOT currently be receiving treatment for alcohol problems) OR (NOT currently be receiving treatment for drug problems) OR (NOT currently be receiving treatment for substance related medical illness))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_exposed_to_alcohol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (using or consuming) alcohol.","when_to_set_to_false":"Set to false if the patient is not currently exposed to (using or consuming) alcohol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to alcohol.","meaning":"Boolean indicating whether the patient is currently exposed to alcohol."}  ;; "currently be experiencing physical dependence on alcohol"
(declare-const patient_is_exposed_to_alcohol_now@@physical_dependence_is_occurring Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently physically dependent on alcohol.","when_to_set_to_false":"Set to false if the patient is currently not physically dependent on alcohol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently physically dependent on alcohol.","meaning":"Boolean indicating whether the patient is currently physically dependent on alcohol."}  ;; "currently be experiencing physical dependence on alcohol"
(declare-const patient_is_exposed_to_alcohol_now@@dependence_requires_medically_supervised_detoxification Bool) ;; {"when_to_set_to_true":"Set to true if the patient's physical dependence on alcohol requires medically supervised detoxification.","when_to_set_to_false":"Set to false if the patient's physical dependence on alcohol does not require medically supervised detoxification.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's physical dependence on alcohol requires medically supervised detoxification.","meaning":"Boolean indicating whether the patient's physical dependence on alcohol requires medically supervised detoxification."}  ;; "requiring medically supervised detoxification"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for physical dependence implies current alcohol exposure
(assert
  (! (=> patient_is_exposed_to_alcohol_now@@physical_dependence_is_occurring
         patient_is_exposed_to_alcohol_now)
     :named REQ2_AUXILIARY0)) ;; If patient is physically dependent on alcohol, they must be currently exposed to alcohol

;; Qualifier variable for dependence requiring detoxification implies physical dependence
(assert
  (! (=> patient_is_exposed_to_alcohol_now@@dependence_requires_medically_supervised_detoxification
         patient_is_exposed_to_alcohol_now@@physical_dependence_is_occurring)
     :named REQ2_AUXILIARY1)) ;; If dependence requires medically supervised detoxification, physical dependence must be present

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must NOT currently be experiencing physical dependence on alcohol (requiring medically supervised detoxification)
(assert
  (! (not patient_is_exposed_to_alcohol_now@@dependence_requires_medically_supervised_detoxification)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT currently be experiencing physical dependence on alcohol (requiring medically supervised detoxification)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_opioid_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently abusing opiates (opioid abuse).","when_to_set_to_false":"Set to false if the patient is currently not abusing opiates.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently abusing opiates.","meaning":"Boolean indicating whether the patient is currently abusing opiates (opioid abuse)."}  ;; "abusing opiates"
(declare-const patient_has_finding_of_opioid_dependence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently physically dependent on opiates (opioid dependence).","when_to_set_to_false":"Set to false if the patient is currently not physically dependent on opiates.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently physically dependent on opiates.","meaning":"Boolean indicating whether the patient is currently physically dependent on opiates (opioid dependence)."}  ;; "physically dependent on opiates"
(declare-const patient_has_finding_of_cocaine_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently abusing cocaine (cocaine abuse).","when_to_set_to_false":"Set to false if the patient is currently not abusing cocaine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently abusing cocaine.","meaning":"Boolean indicating whether the patient is currently abusing cocaine (cocaine abuse)."}  ;; "abusing cocaine"
(declare-const patient_has_finding_of_cocaine_dependence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently physically dependent on cocaine (cocaine dependence).","when_to_set_to_false":"Set to false if the patient is currently not physically dependent on cocaine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently physically dependent on cocaine.","meaning":"Boolean indicating whether the patient is currently physically dependent on cocaine (cocaine dependence)."}  ;; "physically dependent on cocaine"
(declare-const patient_has_finding_of_illicit_medication_use_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently abusing other illicit drugs (illicit medication use).","when_to_set_to_false":"Set to false if the patient is currently not abusing other illicit drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently abusing other illicit drugs.","meaning":"Boolean indicating whether the patient is currently abusing other illicit drugs (illicit medication use)."}  ;; "abusing other illicit drugs"
(declare-const patient_has_finding_of_illicit_drug_dependence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently physically dependent on other illicit drugs.","when_to_set_to_false":"Set to false if the patient is currently not physically dependent on other illicit drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently physically dependent on other illicit drugs.","meaning":"Boolean indicating whether the patient is currently physically dependent on other illicit drugs."}  ;; "physically dependent on other illicit drugs"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must ((NOT currently be abusing opiates) OR (NOT currently be physically dependent on opiates) OR (NOT currently be abusing cocaine) OR (NOT currently be physically dependent on cocaine) OR (NOT currently be abusing other illicit drugs) OR (NOT currently be physically dependent on other illicit drugs)).
(assert
  (! (or (not patient_has_finding_of_opioid_abuse_now)
         (not patient_has_finding_of_opioid_dependence_now)
         (not patient_has_finding_of_cocaine_abuse_now)
         (not patient_has_finding_of_cocaine_dependence_now)
         (not patient_has_finding_of_illicit_medication_use_now)
         (not patient_has_finding_of_illicit_drug_dependence_now))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((NOT currently be abusing opiates) OR (NOT currently be physically dependent on opiates) OR (NOT currently be abusing cocaine) OR (NOT currently be physically dependent on cocaine) OR (NOT currently be abusing other illicit drugs) OR (NOT currently be physically dependent on other illicit drugs))."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."}  ;; "must NOT currently be pregnant"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must NOT currently be pregnant."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding (nursing) at the present time.","when_to_set_to_false":"Set to false if the patient is not currently breastfeeding (nursing) at the present time.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is currently breastfeeding (nursing).","meaning":"Boolean value indicating whether the patient is currently breastfeeding (nursing) at the present time."}  ;; "must NOT currently be nursing"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_is_breastfeeding_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT currently be nursing."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_able_to_complete_study_measures_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to complete all required study measures.","when_to_set_to_false":"Set to false if the patient is currently unable to complete all required study measures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to complete all required study measures.","meaning":"Boolean indicating whether the patient is currently able to complete the study measures required by the protocol."} ;; "the patient must be able to complete study measures"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_is_able_to_complete_study_measures_now
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be able to complete study measures"
