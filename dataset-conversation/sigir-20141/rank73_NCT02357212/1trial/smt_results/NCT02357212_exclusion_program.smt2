;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute ST-segment elevation myocardial infarction (STEMI).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute ST-segment elevation myocardial infarction (STEMI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute ST-segment elevation myocardial infarction (STEMI).","meaning":"Boolean indicating whether the patient currently has acute ST-segment elevation myocardial infarction."} ;; "ST-elevation myocardial infarction"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ST-elevation myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_cardiogenic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiogenic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiogenic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cardiogenic shock.","meaning":"Boolean indicating whether the patient currently has the clinical finding of cardiogenic shock."} ;; "cardiogenic shock"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_cardiogenic_shock_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiogenic shock."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} ;; "congestive heart failure"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_congestive_heart_failure_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congestive heart failure."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_hemodynamic_instability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hemodynamic instability.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hemodynamic instability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hemodynamic instability.","meaning":"Boolean indicating whether the patient currently has hemodynamic instability."} ;; "hemodynamic instability"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_hemodynamic_instability_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hemodynamic instability."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_thrombolytic_therapy_inthepast96hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone thrombolytic (fibrinolytic) therapy at any time within the past 96 hours.","when_to_set_to_false":"Set to false if the patient has not undergone thrombolytic (fibrinolytic) therapy within the past 96 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone thrombolytic (fibrinolytic) therapy within the past 96 hours.","meaning":"Boolean indicating whether the patient has undergone thrombolytic (fibrinolytic) therapy within the past 96 hours."} ;; "fibrinolytic therapy within the last ninety-six hours"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_undergone_thrombolytic_therapy_inthepast96hours)
:named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used fibrinolytic therapy within the last ninety-six hours."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bleeding.","meaning":"Boolean indicating whether the patient currently has bleeding."} ;; "current bleeding"

(declare-const patient_has_finding_of_bleeding_now@@current Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bleeding is current (present at the current time).","when_to_set_to_false":"Set to false if the patient's bleeding is not current (not present at the current time).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bleeding is current.","meaning":"Boolean indicating whether the patient's bleeding is current (present at the current time)."} ;; "current bleeding"

(declare-const patient_has_finding_of_blood_coagulation_disorder_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a blood coagulation disorder (bleeding disorder) within the past three months.","when_to_set_to_false":"Set to false if the patient has not had a blood coagulation disorder (bleeding disorder) within the past three months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a blood coagulation disorder (bleeding disorder) within the past three months.","meaning":"Boolean indicating whether the patient has had a blood coagulation disorder (bleeding disorder) within the past three months."} ;; "bleeding disorder within the last three months"

(declare-const patient_has_finding_of_blood_coagulation_disorder_inthepast3months@@required_transfusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a blood coagulation disorder (bleeding disorder) within the past three months and that disorder required transfusion.","when_to_set_to_false":"Set to false if the patient has had a blood coagulation disorder (bleeding disorder) within the past three months and that disorder did not require transfusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bleeding disorder within the past three months required transfusion.","meaning":"Boolean indicating whether the patient's blood coagulation disorder (bleeding disorder) within the past three months required transfusion."} ;; "bleeding disorder within the last three months that required transfusion"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable for current bleeding implies stem variable
(assert
(! (=> patient_has_finding_of_bleeding_now@@current
       patient_has_finding_of_bleeding_now)
   :named REQ5_AUXILIARY0)) ;; "current bleeding"

;; Qualifier variable for bleeding disorder requiring transfusion implies stem variable
(assert
(! (=> patient_has_finding_of_blood_coagulation_disorder_inthepast3months@@required_transfusion
       patient_has_finding_of_blood_coagulation_disorder_inthepast3months)
   :named REQ5_AUXILIARY1)) ;; "bleeding disorder within the last three months that required transfusion"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (or patient_has_finding_of_bleeding_now@@current
            patient_has_finding_of_blood_coagulation_disorder_inthepast3months@@required_transfusion))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has current bleeding) OR (the patient has had a bleeding disorder within the last three months that required transfusion)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_contraindication_to_heparin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to heparin.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to heparin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to heparin.","meaning":"Boolean indicating whether the patient currently has a contraindication to heparin."} ;; "the patient has a contraindication to heparin"
(declare-const patient_has_contraindication_to_clopidogrel_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to clopidogrel.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to clopidogrel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to clopidogrel.","meaning":"Boolean indicating whether the patient currently has a contraindication to clopidogrel."} ;; "the patient has a contraindication to clopidogrel"
(declare-const patient_has_contraindication_to_glycoprotein_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to glycoprotein IIb/III inhibitor.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to glycoprotein IIb/III inhibitor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to glycoprotein IIb/III inhibitor.","meaning":"Boolean indicating whether the patient currently has a contraindication to glycoprotein IIb/III inhibitor."} ;; "the patient has a contraindication to glycoprotein IIb/III inhibitor"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not (or patient_has_contraindication_to_heparin_now
              patient_has_contraindication_to_clopidogrel_now
              patient_has_contraindication_to_glycoprotein_now))
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a contraindication to heparin) OR (the patient has a contraindication to clopidogrel) OR (the patient has a contraindication to glycoprotein IIb/III inhibitor)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone percutaneous coronary intervention within the past six months.","when_to_set_to_false":"Set to false if the patient has not undergone percutaneous coronary intervention within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone percutaneous coronary intervention within the past six months.","meaning":"Boolean indicating whether the patient has undergone percutaneous coronary intervention within the past six months."} ;; "percutaneous coronary intervention within the last six months"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_undergone_percutaneous_coronary_intervention_inthepast6months)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had percutaneous coronary intervention within the last six months."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary artery bypass grafting at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass grafting at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass grafting.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass grafting at any time in the past."} ;; "coronary artery bypass grafting"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior coronary artery bypass grafting."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_able_to_provide_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide written informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide written informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide written informed consent."} ;; "The patient is excluded if the patient is unable to provide written informed consent."

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_able_to_provide_written_informed_consent_now)
:named REQ10_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to provide written informed consent."
