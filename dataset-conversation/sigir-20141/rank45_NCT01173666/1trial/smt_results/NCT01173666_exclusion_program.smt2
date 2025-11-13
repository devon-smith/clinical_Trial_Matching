;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_atherosclerotic_renal_artery_stenosis_percentage_stenosis_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of percentage stenosis in atherosclerotic renal artery stenosis is recorded now.","when_to_set_to_null":"Set to null if no such percentage measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current degree of stenosis in atherosclerotic renal artery stenosis."} ;; "percentage stenosis > 80 percent"
(declare-const patient_has_finding_of_atherosclerotic_renal_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has atherosclerotic renal artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have atherosclerotic renal artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atherosclerotic renal artery stenosis.","meaning":"Boolean indicating whether the patient currently has atherosclerotic renal artery stenosis."} ;; "atherosclerotic renal artery stenosis"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (and patient_has_finding_of_atherosclerotic_renal_artery_stenosis_now
               (> patient_atherosclerotic_renal_artery_stenosis_percentage_stenosis_value_recorded_now_withunit_percent 80)))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has atherosclerotic renal artery stenosis with percentage stenosis > 80 percent."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_renal_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of renal artery stenosis.","meaning":"Boolean indicating whether the patient currently has renal artery stenosis."} ;; "renal artery stenosis"
(declare-const patient_has_finding_of_renal_artery_stenosis_now@@secondary_to_fibromuscular_dysplasia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current renal artery stenosis is secondary to fibromuscular dysplasia.","when_to_set_to_false":"Set to false if the patient's current renal artery stenosis is not secondary to fibromuscular dysplasia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current renal artery stenosis is secondary to fibromuscular dysplasia.","meaning":"Boolean indicating whether the patient's current renal artery stenosis is secondary to fibromuscular dysplasia."} ;; "renal artery stenosis secondary to fibromuscular dysplasia"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_renal_artery_stenosis_now@@secondary_to_fibromuscular_dysplasia
      patient_has_finding_of_renal_artery_stenosis_now)
   :named REQ1_AUXILIARY0)) ;; "renal artery stenosis secondary to fibromuscular dysplasia" implies "renal artery stenosis"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_renal_artery_stenosis_now@@secondary_to_fibromuscular_dysplasia)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal artery stenosis secondary to fibromuscular dysplasia."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_acute_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute myocardial infarction.","meaning":"Boolean indicating whether the patient currently has acute myocardial infarction."} ;; "acute myocardial infarction"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_acute_myocardial_infarction_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_single_functioning_kidney_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has only one functioning kidney.","when_to_set_to_false":"Set to false if the patient currently has more than one functioning kidney.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a single functioning kidney.","meaning":"Boolean indicating whether the patient currently has a single functioning kidney."} ;; "the patient has a single functioning kidney"

(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum creatinine level in milligrams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum creatinine level in milligrams per deciliter."} ;; "serum creatinine > 4 milligrams per deciliter"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (or patient_has_single_functioning_kidney_now
              (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 4)))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a single functioning kidney) OR (the patient has serum creatinine > 4 milligrams per deciliter)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_aortic_valve_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of aortic valve stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of aortic valve stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has aortic valve stenosis.","meaning":"Boolean indicating whether the patient currently has aortic valve stenosis."} ;; "aortic valve stenosis"
(declare-const patient_has_finding_of_aortic_valve_stenosis_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has aortic valve stenosis and the severity is severe.","when_to_set_to_false":"Set to false if the patient currently has aortic valve stenosis but the severity is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of aortic valve stenosis is severe.","meaning":"Boolean indicating whether the patient's current aortic valve stenosis is severe."} ;; "severe aortic valve stenosis"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_aortic_valve_stenosis_now@@severity_severe
      patient_has_finding_of_aortic_valve_stenosis_now)
:named REQ4_AUXILIARY0)) ;; "severe aortic valve stenosis" implies "aortic valve stenosis"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_aortic_valve_stenosis_now@@severity_severe)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe aortic valve stenosis."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_aortic_aneurysm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an aortic aneurysm.","when_to_set_to_false":"Set to false if the patient currently does not have an aortic aneurysm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an aortic aneurysm.","meaning":"Boolean indicating whether the patient currently has an aortic aneurysm."} ;; "aortic aneurysm"
(declare-const patient_has_finding_of_aortic_aneurysm_now@@necessitates_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current aortic aneurysm necessitates surgery.","when_to_set_to_false":"Set to false if the patient's current aortic aneurysm does not necessitate surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current aortic aneurysm necessitates surgery.","meaning":"Boolean indicating whether the patient's current aortic aneurysm necessitates surgery."} ;; "aortic aneurysm necessitating surgery"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_aortic_aneurysm_now@@necessitates_surgery
      patient_has_finding_of_aortic_aneurysm_now)
:named REQ5_AUXILIARY0)) ;; "aortic aneurysm necessitating surgery" implies "aortic aneurysm"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_aortic_aneurysm_now@@necessitates_surgery)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an aortic aneurysm necessitating surgery."
