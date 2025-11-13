;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of myocardial infarction within the past two weeks.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of myocardial infarction within the past two weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of myocardial infarction within the past two weeks.","meaning":"Boolean indicating whether the patient has had a diagnosis of myocardial infarction within the past two weeks."} ;; "myocardial infarction within the past two weeks"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_diagnosis_of_myocardial_infarction_inthepast2weeks)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a myocardial infarction within the past two weeks."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_at_high_risk_of_dysrhythmias_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently at high risk of dysrhythmias.","when_to_set_to_false":"Set to false if the patient is currently not at high risk of dysrhythmias.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently at high risk of dysrhythmias.","meaning":"Boolean indicating whether the patient is currently at high risk of dysrhythmias."} ;; "is at high risk of dysrhythmias"

(declare-const patient_has_finding_of_bundle_branch_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of bundle branch block.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of bundle branch block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of bundle branch block.","meaning":"Boolean indicating whether the patient currently has a bundle branch block."} ;; "bundle branch block"

(declare-const patient_has_finding_of_prolonged_qt_interval_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of prolonged QT interval.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of prolonged QT interval.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of prolonged QT interval.","meaning":"Boolean indicating whether the patient currently has a prolonged QT interval."} ;; "QT interval prolongation"

(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "heart failure"

(declare-const patient_has_implanted_cardiac_device_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an implanted cardiac device.","when_to_set_to_false":"Set to false if the patient currently does not have an implanted cardiac device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an implanted cardiac device.","meaning":"Boolean indicating whether the patient currently has an implanted cardiac device."} ;; "implanted cardiac device"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_bundle_branch_block_now
           patient_has_finding_of_prolonged_qt_interval_now
           patient_has_finding_of_heart_failure_now
           patient_has_implanted_cardiac_device_now)
       patient_is_at_high_risk_of_dysrhythmias_now)
   :named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples ((bundle branch block) OR (QT interval prolongation) OR (class IV heart failure) OR (implanted cardiac device))."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_at_high_risk_of_dysrhythmias_now)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is at high risk of dysrhythmias with non-exhaustive examples ((bundle branch block) OR (QT interval prolongation) OR (class IV heart failure) OR (implanted cardiac device))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_intolerance_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intolerance to any drug or medicament.","when_to_set_to_false":"Set to false if the patient currently does not have intolerance to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intolerance to any drug or medicament.","meaning":"Boolean indicating whether the patient currently has intolerance to any drug or medicament."} ;; "medication"
(declare-const patient_has_intolerance_to_drug_or_medicament_now@@restricted_to_enteric_route Bool) ;; {"when_to_set_to_true":"Set to true if the intolerance to drug or medicament is specifically for medications administered via the enteric (gastrointestinal) route.","when_to_set_to_false":"Set to false if the intolerance to drug or medicament is not specifically for enteric medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the intolerance is specific to enteric medications.","meaning":"Boolean indicating whether the intolerance to drug or medicament is specifically for enteric medications."} ;; "unable to tolerate enteric medication"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for enteric route intolerance implies general drug intolerance
(assert
(! (=> patient_has_intolerance_to_drug_or_medicament_now@@restricted_to_enteric_route
       patient_has_intolerance_to_drug_or_medicament_now)
    :named REQ2_AUXILIARY0)) ;; "unable to tolerate enteric medication" (enteric intolerance implies general drug intolerance)

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_intolerance_to_drug_or_medicament_now@@restricted_to_enteric_route)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to tolerate enteric medication."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_mania_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding or diagnosis of mania at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding or diagnosis of mania in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding or diagnosis of mania.","meaning":"Boolean indicating whether the patient has ever had a clinical finding or diagnosis of mania in their medical history."} ;; "mania"
(declare-const patient_has_finding_of_mania_inthehistory@@stimulant_induced Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of mania was specifically induced by stimulant exposure.","when_to_set_to_false":"Set to false if the patient's history of mania was not induced by stimulant exposure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of mania was induced by stimulant exposure.","meaning":"Boolean indicating whether the patient's history of mania was specifically induced by stimulant exposure."} ;; "stimulant-induced mania"
(declare-const patient_has_finding_of_psychotic_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding or diagnosis of psychotic disorder (psychosis) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding or diagnosis of psychotic disorder (psychosis) in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding or diagnosis of psychotic disorder (psychosis).","meaning":"Boolean indicating whether the patient has ever had a clinical finding or diagnosis of psychotic disorder (psychosis) in their medical history."} ;; "psychosis"
(declare-const patient_has_finding_of_psychotic_disorder_inthehistory@@stimulant_induced Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of psychotic disorder (psychosis) was specifically induced by stimulant exposure.","when_to_set_to_false":"Set to false if the patient's history of psychotic disorder (psychosis) was not induced by stimulant exposure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of psychotic disorder (psychosis) was induced by stimulant exposure.","meaning":"Boolean indicating whether the patient's history of psychotic disorder (psychosis) was specifically induced by stimulant exposure."} ;; "stimulant-induced psychosis"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_mania_inthehistory@@stimulant_induced
      patient_has_finding_of_mania_inthehistory)
   :named REQ3_AUXILIARY0)) ;; "stimulant-induced mania implies history of mania"

(assert
(! (=> patient_has_finding_of_psychotic_disorder_inthehistory@@stimulant_induced
      patient_has_finding_of_psychotic_disorder_inthehistory)
   :named REQ3_AUXILIARY1)) ;; "stimulant-induced psychosis implies history of psychosis"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_has_finding_of_mania_inthehistory@@stimulant_induced
            patient_has_finding_of_psychotic_disorder_inthehistory@@stimulant_induced))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of stimulant-induced mania) OR (the patient has a history of stimulant-induced psychosis)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_disorder_of_nervous_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a disorder of the nervous system at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a disorder of the nervous system at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a disorder of the nervous system in their history.","meaning":"Boolean indicating whether the patient has ever had a disorder of the nervous system in their history."} ;; "neurologic disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_disorder_of_nervous_system_inthehistory)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a pre-existing neurologic disease."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_undergone_transfer_of_care_from_hospital_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a transfer of care from an outside hospital at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a transfer of care from an outside hospital at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a transfer of care from an outside hospital.","meaning":"Boolean indicating whether the patient has ever undergone a transfer of care from an outside hospital in their history."} ;; "transferred from an outside hospital"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_undergone_transfer_of_care_from_hospital_inthehistory)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been transferred from an outside hospital."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if there is documented evidence that the patient is currently pregnant.","when_to_set_to_false":"Set to false if there is documented evidence that the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_alcohol_withdrawal_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently experiencing alcohol withdrawal syndrome.","when_to_set_to_false":"Set to false if the patient is currently not experiencing alcohol withdrawal syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently experiencing alcohol withdrawal syndrome.","meaning":"Boolean indicating whether the patient is currently experiencing alcohol withdrawal syndrome."} ;; "alcohol withdrawal"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_alcohol_withdrawal_syndrome_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is experiencing alcohol withdrawal."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_end_stage_liver_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with end stage liver disease at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with end stage liver disease at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with end stage liver disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of end stage liver disease in their history."} ;; "end stage liver disease (Child-Turcotte-Pugh class B or worse)"

(declare-const patient_has_diagnosis_of_end_stage_liver_disease_inthehistory@@child_turcotte_pugh_class_b_or_worse Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of end stage liver disease meets the severity threshold of Child-Turcotte-Pugh class B or worse.","when_to_set_to_false":"Set to false if the patient's history of end stage liver disease does not meet the severity threshold of Child-Turcotte-Pugh class B or worse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity threshold of Child-Turcotte-Pugh class B or worse is met for the patient's history of end stage liver disease.","meaning":"Boolean indicating whether the patient's history of end stage liver disease meets the severity threshold of Child-Turcotte-Pugh class B or worse."} ;; "Child-Turcotte-Pugh class B or worse"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_end_stage_liver_disease_inthehistory@@child_turcotte_pugh_class_b_or_worse
       patient_has_diagnosis_of_end_stage_liver_disease_inthehistory)
   :named REQ8_AUXILIARY0)) ;; "Child-Turcotte-Pugh class B or worse" implies "end stage liver disease"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_diagnosis_of_end_stage_liver_disease_inthehistory@@child_turcotte_pugh_class_b_or_worse)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of end stage liver disease (Child-Turcotte-Pugh class B or worse)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_hopeless_prognosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a prognosis that is considered hopeless.","when_to_set_to_false":"Set to false if the patient currently does not have a prognosis that is considered hopeless.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a prognosis that is considered hopeless.","meaning":"Boolean indicating whether the patient currently has a prognosis that is considered hopeless."} ;; "prognosis is considered hopeless"

(declare-const patient_has_finding_of_hopeless_prognosis_now@@comfort_measures_only_cmo Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hopeless prognosis is associated with a care plan of comfort measures only (CMO).","when_to_set_to_false":"Set to false if the patient's current hopeless prognosis is not associated with a care plan of comfort measures only (CMO).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hopeless prognosis is associated with a care plan of comfort measures only (CMO).","meaning":"Boolean indicating whether the patient's current hopeless prognosis is associated with a care plan of comfort measures only (CMO)."} ;; "comfort measures only, CMO: comfort measures only"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hopeless_prognosis_now@@comfort_measures_only_cmo
      patient_has_finding_of_hopeless_prognosis_now)
:named REQ9_AUXILIARY0)) ;; "comfort measures only, CMO: comfort measures only""

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (or patient_has_finding_of_hopeless_prognosis_now
            patient_has_finding_of_hopeless_prognosis_now@@comfort_measures_only_cmo))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's prognosis is considered hopeless (comfort measures only, CMO: comfort measures only)."
