;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_contraindication_to_spinal_anesthesia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to spinal anesthesia.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to spinal anesthesia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to spinal anesthesia.","meaning":"Boolean indicating whether the patient currently has a contraindication to spinal anesthesia."} ;; "contraindication to spinal anesthesia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_contraindication_to_spinal_anesthesia_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to spinal anesthesia."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_allergy_to_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any allergy to any drug.","when_to_set_to_false":"Set to false if the patient currently does not have any allergy to any drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any allergy to any drug.","meaning":"Boolean indicating whether the patient currently has any allergy to any drug."} ;; "allergy to any medication"

(declare-const patient_has_finding_of_allergy_to_drug_now@@medication_included_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any allergy to any drug and the drug is included in the study.","when_to_set_to_false":"Set to false if the patient currently has any allergy to any drug but the drug is not included in the study, or if the patient does not have any allergy to any drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any allergy to any drug included in the study.","meaning":"Boolean indicating whether the patient currently has any allergy to any drug included in the study."} ;; "allergy to any medication included in the study"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_allergy_to_drug_now@@medication_included_in_study
       patient_has_finding_of_allergy_to_drug_now)
   :named REQ1_AUXILIARY0)) ;; "any allergy to any medication included in the study" implies "any allergy to any drug"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_allergy_to_drug_now@@medication_included_in_study)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any allergy to any medication included in the study."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_pregnancy_induced_hypertension_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had pregnancy-induced hypertension at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had pregnancy-induced hypertension documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had pregnancy-induced hypertension.","meaning":"Boolean indicating whether the patient has ever had pregnancy-induced hypertension in their history."} ;; "history of pregnancy-induced hypertension"
(declare-const patient_has_finding_of_pre_eclampsia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had preeclampsia at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had preeclampsia documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had preeclampsia.","meaning":"Boolean indicating whether the patient has ever had preeclampsia in their history."} ;; "history of preeclampsia"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_pregnancy_induced_hypertension_inthehistory)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of pregnancy-induced hypertension."

(assert
(! (not patient_has_finding_of_pre_eclampsia_inthehistory)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of preeclampsia."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_hypertensive_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of any hypertensive disorder (including essential hypertension, secondary hypertension, pregnancy-induced hypertension, preeclampsia, etc.).","when_to_set_to_false":"Set to false if the patient does not have a documented history of any hypertensive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of any hypertensive disorder.","meaning":"Boolean indicating whether the patient has a history of any hypertensive disorder."} ;; "history of hypertension"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_hypertensive_disorder_inthehistory)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diabetes mellitus."} ;; "diabetes mellitus"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_diabetes_mellitus_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_hyperemesis_gravidarum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hyperemesis gravidarum.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hyperemesis gravidarum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hyperemesis gravidarum.","meaning":"Boolean indicating whether the patient currently has hyperemesis gravidarum."} ;; "hyperemesis gravidarum"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_finding_of_hyperemesis_gravidarum_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hyperemesis gravidarum."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_nausea_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had the clinical finding of nausea at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had the clinical finding of nausea at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had the clinical finding of nausea in their history.","meaning":"Boolean indicating whether the patient has ever had nausea in their history."} ;; "history of perioperative nausea"
(declare-const patient_has_finding_of_nausea_inthehistory@@perioperative_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of nausea occurred during the perioperative period.","when_to_set_to_false":"Set to false if the patient's history of nausea did not occur during the perioperative period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of nausea occurred during the perioperative period.","meaning":"Boolean indicating whether the patient's history of nausea occurred during the perioperative period."} ;; "history of perioperative nausea"
(declare-const patient_has_finding_of_vomiting_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had the clinical finding of vomiting at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had the clinical finding of vomiting at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had the clinical finding of vomiting in their history.","meaning":"Boolean indicating whether the patient has ever had vomiting in their history."} ;; "history of perioperative vomiting"
(declare-const patient_has_finding_of_vomiting_inthehistory@@perioperative_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of vomiting occurred during the perioperative period.","when_to_set_to_false":"Set to false if the patient's history of vomiting did not occur during the perioperative period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of vomiting occurred during the perioperative period.","meaning":"Boolean indicating whether the patient's history of vomiting occurred during the perioperative period."} ;; "history of perioperative vomiting"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_nausea_inthehistory@@perioperative_period
      patient_has_finding_of_nausea_inthehistory)
   :named REQ6_AUXILIARY0)) ;; "history of perioperative nausea"

(assert
(! (=> patient_has_finding_of_vomiting_inthehistory@@perioperative_period
      patient_has_finding_of_vomiting_inthehistory)
   :named REQ6_AUXILIARY1)) ;; "history of perioperative vomiting"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_nausea_inthehistory@@perioperative_period)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of perioperative nausea."

(assert
(! (not patient_has_finding_of_vomiting_inthehistory@@perioperative_period)
   :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of perioperative vomiting."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_motion_sickness_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had motion sickness documented at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had motion sickness documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had motion sickness.","meaning":"Boolean indicating whether the patient has ever had motion sickness in their medical history."} ;; "history of motion sickness"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_motion_sickness_inthehistory)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of motion sickness."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_fetal_anomaly_present_in_specimen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently carrying a fetus with a known abnormality (fetal anomaly present in specimen).","when_to_set_to_false":"Set to false if the patient is currently not carrying a fetus with a known abnormality (fetal anomaly present in specimen).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently carrying a fetus with a known abnormality (fetal anomaly present in specimen).","meaning":"Boolean indicating whether the patient is currently carrying a fetus with a known abnormality (fetal anomaly present in specimen)."} ;; "fetus with a known abnormality"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is carrying a fetus"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_fetal_anomaly_present_in_specimen_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is carrying a fetus with a known abnormality."
