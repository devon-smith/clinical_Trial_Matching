;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder (bleeding tendency).","when_to_set_to_false":"Set to false if the patient currently does not have a blood coagulation disorder (bleeding tendency).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a blood coagulation disorder (bleeding tendency).","meaning":"Boolean indicating whether the patient currently has a blood coagulation disorder (bleeding tendency) at the present time."} ;; "bleeding tendency"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a bleeding tendency."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_contraindication_to_colony_stimulating_factor_granulocytic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to granulocyte colony stimulating factor (colony_stimulating_factor_granulocytic).","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to granulocyte colony stimulating factor (colony_stimulating_factor_granulocytic).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to granulocyte colony stimulating factor (colony_stimulating_factor_granulocytic).","meaning":"Boolean indicating whether the patient currently has a contraindication to granulocyte colony stimulating factor (colony_stimulating_factor_granulocytic)."} ;; "contraindication to granulocyte colony stimulating factor"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_contraindication_to_colony_stimulating_factor_granulocytic_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to granulocyte colony stimulating factor."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cardiogenic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiogenic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiogenic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cardiogenic shock.","meaning":"Boolean indicating whether the patient currently has cardiogenic shock."} ;; "cardiogenic shock"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_cardiogenic_shock_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiogenic shock."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_hemodynamic_instability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hemodynamic instability.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hemodynamic instability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hemodynamic instability.","meaning":"Boolean indicating whether the patient currently has hemodynamic instability."} ;; "hemodynamic instability"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_hemodynamic_instability_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hemodynamic instability."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic disease (disease of liver).","when_to_set_to_false":"Set to false if the patient currently does not have hepatic disease (disease of liver).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic disease (disease of liver).","meaning":"Boolean indicating whether the patient currently has hepatic disease (disease of liver)."} ;; "hepatic disease"
(declare-const patient_has_finding_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal disease (kidney disease).","when_to_set_to_false":"Set to false if the patient currently does not have renal disease (kidney disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal disease (kidney disease).","meaning":"Boolean indicating whether the patient currently has renal disease (kidney disease)."} ;; "renal disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_has_finding_of_disease_of_liver_now
            patient_has_finding_of_kidney_disease_now))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has hepatic disease) OR (the patient has renal disease)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_multi_vessel_coronary_artery_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of multivessel coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of multivessel coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has multivessel coronary artery disease.","meaning":"Boolean indicating whether the patient currently has multivessel coronary artery disease."} ;; "multivessel disease"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_multi_vessel_coronary_artery_disease_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has multivessel disease."
