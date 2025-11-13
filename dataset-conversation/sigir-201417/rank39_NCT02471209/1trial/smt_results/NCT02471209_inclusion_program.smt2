;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_persistent_yellow_skin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has yellow skin that is persistent.","when_to_set_to_false":"Set to false if the patient currently does not have yellow skin that is persistent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has persistent yellow skin.","meaning":"Boolean indicating whether the patient currently has persistent yellow skin."}  ;; "To be included, the patient must have persistent yellow skin."
(declare-const patient_has_finding_of_persistent_yellow_sclera_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has yellow sclera that is persistent.","when_to_set_to_false":"Set to false if the patient currently does not have yellow sclera that is persistent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has persistent yellow sclera.","meaning":"Boolean indicating whether the patient currently has persistent yellow sclera."}  ;; "To be included, the patient must have persistent yellow sclera."
(declare-const patient_has_finding_of_acholic_stool_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pale stool (acholic stool).","when_to_set_to_false":"Set to false if the patient currently does not have pale stool (acholic stool).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pale stool (acholic stool).","meaning":"Boolean indicating whether the patient currently has pale stool (acholic stool)."}  ;; "To be included, the patient must have pale stool (which may be clay-like stool in severe cases)."
(declare-const patient_has_finding_of_large_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatomegaly (enlarged liver).","when_to_set_to_false":"Set to false if the patient currently does not have hepatomegaly (enlarged liver).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatomegaly (enlarged liver).","meaning":"Boolean indicating whether the patient currently has hepatomegaly (enlarged liver)."}  ;; "To be included, the patient must have hepatomegaly."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_persistent_yellow_skin_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have persistent yellow skin."

(assert
  (! patient_has_finding_of_persistent_yellow_sclera_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have persistent yellow sclera."

(assert
  (! patient_has_finding_of_acholic_stool_now
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have pale stool (which may be clay-like stool in severe cases)."

(assert
  (! patient_has_finding_of_large_liver_now
     :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have hepatomegaly."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_serum_bilirubin_raised_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of increased serum bilirubin.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of increased serum bilirubin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has increased serum bilirubin.","meaning":"Boolean indicating whether the patient currently has increased serum bilirubin."}  ;; "To be included, the patient must have increased serum bilirubin (which may be progressively increased OR show no decline after increase)."
(declare-const patient_has_finding_of_serum_bilirubin_raised_now@@progressive_or_no_decline_after_increase Bool) ;; {"when_to_set_to_true":"Set to true if the patient's increased serum bilirubin is either progressively increasing or shows no decline after the initial increase.","when_to_set_to_false":"Set to false if the patient's increased serum bilirubin is not progressive and shows a decline after the initial increase.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the increase is progressive or shows no decline after increase.","meaning":"Boolean indicating whether the patient's increased serum bilirubin is progressive or shows no decline after increase."}  ;; "which may be progressively increased OR show no decline after increase"
(declare-const patient_has_finding_of_elevated_total_bilirubin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of increased total bilirubin.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of increased total bilirubin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has increased total bilirubin.","meaning":"Boolean indicating whether the patient currently has increased total bilirubin."}  ;; "To be included, the patient must have increased total bilirubin"
(declare-const patient_has_finding_of_elevated_total_bilirubin_now@@dominated_by_direct_bilirubin_with_ratio_above_60_percent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's increased total bilirubin is dominated by increased direct bilirubin and the ratio of direct bilirubin to total bilirubin is above 60%.","when_to_set_to_false":"Set to false if the patient's increased total bilirubin is not dominated by increased direct bilirubin or the ratio is 60% or less.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the increase is dominated by direct bilirubin with the required ratio.","meaning":"Boolean indicating whether the patient's increased total bilirubin is dominated by increased direct bilirubin with direct bilirubin / total bilirubin > 60%."}  ;; "where increased total bilirubin is dominated by increased direct bilirubin with direct bilirubin / total bilirubin > 60%"
(declare-const direct_bilirubin_value_recorded_now_in_micromol_per_l Real) ;; {"when_to_set_to_value":"Set to the patient's direct bilirubin value in micromoles per liter as recorded at the current time.","when_to_set_to_null":"Set to null if the direct bilirubin value is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value of the patient's direct bilirubin in micromoles per liter, recorded now."}  ;; "direct bilirubin"
(declare-const total_bilirubin_value_recorded_now_in_micromol_per_l Real) ;; {"when_to_set_to_value":"Set to the patient's total bilirubin value in micromoles per liter as recorded at the current time.","when_to_set_to_null":"Set to null if the total bilirubin value is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value of the patient's total bilirubin in micromoles per liter, recorded now."}  ;; "total bilirubin"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable (serum bilirubin progressive/no decline)
(assert
  (! (=> patient_has_finding_of_serum_bilirubin_raised_now@@progressive_or_no_decline_after_increase
         patient_has_finding_of_serum_bilirubin_raised_now)
     :named REQ1_AUXILIARY0)) ;; "which may be progressively increased OR show no decline after increase"

;; Qualifier variable implies corresponding stem variable (total bilirubin dominated by direct bilirubin)
(assert
  (! (=> patient_has_finding_of_elevated_total_bilirubin_now@@dominated_by_direct_bilirubin_with_ratio_above_60_percent
         patient_has_finding_of_elevated_total_bilirubin_now)
     :named REQ1_AUXILIARY1)) ;; "where increased total bilirubin is dominated by increased direct bilirubin with direct bilirubin / total bilirubin > 60%"

;; Definitional equality for "dominated by direct bilirubin with direct bilirubin / total bilirubin > 60%"
(assert
  (! (= patient_has_finding_of_elevated_total_bilirubin_now@@dominated_by_direct_bilirubin_with_ratio_above_60_percent
        (and patient_has_finding_of_elevated_total_bilirubin_now
             (> (/ direct_bilirubin_value_recorded_now_in_micromol_per_l
                   total_bilirubin_value_recorded_now_in_micromol_per_l) 0.6)))
     :named REQ1_AUXILIARY2)) ;; "direct bilirubin / total bilirubin > 60%"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have increased serum bilirubin (progressive or no decline after increase)
(assert
  (! patient_has_finding_of_serum_bilirubin_raised_now@@progressive_or_no_decline_after_increase
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have increased serum bilirubin (which may be progressively increased OR show no decline after increase)."

;; Component 1: Must have increased total bilirubin dominated by increased direct bilirubin with direct bilirubin / total bilirubin > 60%
(assert
  (! patient_has_finding_of_elevated_total_bilirubin_now@@dominated_by_direct_bilirubin_with_ratio_above_60_percent
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have increased total bilirubin (where increased total bilirubin is dominated by increased direct bilirubin with direct bilirubin / total bilirubin > 60%)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_elevated_liver_enzymes_level_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of elevated liver enzyme levels.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of elevated liver enzyme levels.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of elevated liver enzyme levels.","meaning":"Boolean indicating whether the patient currently has elevated liver enzyme levels."}  ;; "To be included, the patient must have elevated liver enzyme levels."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_elevated_liver_enzymes_level_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have elevated liver enzyme levels."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_ultrasound_confirmation_of_poor_gallbladder_filling_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ultrasound confirmation of poor gallbladder filling.","when_to_set_to_false":"Set to false if the patient currently does not have ultrasound confirmation of poor gallbladder filling.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ultrasound confirmation of poor gallbladder filling.","meaning":"Boolean indicating whether the patient currently has ultrasound confirmation of poor gallbladder filling."}  ;; "To be included, the patient must have ultrasound confirmation of poor gallbladder filling."
(declare-const patient_has_ultrasound_confirmation_of_signs_of_liver_fibrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ultrasound confirmation of signs of liver fibrosis.","when_to_set_to_false":"Set to false if the patient currently does not have ultrasound confirmation of signs of liver fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ultrasound confirmation of signs of liver fibrosis.","meaning":"Boolean indicating whether the patient currently has ultrasound confirmation of signs of liver fibrosis."}  ;; "To be included, the patient must have ultrasound confirmation of signs of liver fibrosis."
(declare-const patient_has_undergone_ultrasonography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone ultrasonography now.","when_to_set_to_false":"Set to false if the patient has not undergone ultrasonography now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone ultrasonography now.","meaning":"Boolean indicating whether the patient has undergone ultrasonography now."}  ;; "ultrasound"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: The patient must have ultrasound confirmation of poor gallbladder filling.
(assert
  (! patient_has_ultrasound_confirmation_of_poor_gallbladder_filling_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ultrasound confirmation of poor gallbladder filling."

;; Component 1: The patient must have ultrasound confirmation of signs of liver fibrosis.
(assert
  (! patient_has_ultrasound_confirmation_of_signs_of_liver_fibrosis_now
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ultrasound confirmation of signs of liver fibrosis."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_undergone_nuclear_medicine_imaging_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a nuclear medicine imaging procedure (radionuclide imaging) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a nuclear medicine imaging procedure (radionuclide imaging) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a nuclear medicine imaging procedure (radionuclide imaging).","meaning":"Boolean indicating whether the patient has ever undergone a nuclear medicine imaging procedure (radionuclide imaging) in the past."}  ;; "radionuclide imaging"
(declare-const patients_bile_secretion_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bile secretion (biliary excretion) is currently abnormal.","when_to_set_to_false":"Set to false if the patient's bile secretion (biliary excretion) is currently normal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bile secretion (biliary excretion) is currently abnormal.","meaning":"Boolean indicating whether the patient's bile secretion (biliary excretion) is currently abnormal."}  ;; "biliary excretion"
(declare-const patients_bile_secretion_is_abnormal_now@@obstructed Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal bile secretion (biliary excretion) is specifically due to obstruction.","when_to_set_to_false":"Set to false if the abnormal bile secretion (biliary excretion) is not due to obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal bile secretion (biliary excretion) is due to obstruction.","meaning":"Boolean indicating whether the abnormal bile secretion (biliary excretion) is specifically obstructed."}  ;; "obstructed biliary excretion"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable for obstruction implies abnormal bile secretion
(assert
  (! (=> patients_bile_secretion_is_abnormal_now@@obstructed
         patients_bile_secretion_is_abnormal_now)
     :named REQ4_AUXILIARY0)) ;; "obstructed biliary excretion" is a type of abnormal biliary excretion

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: Must have radionuclide imaging confirmation of obstructed biliary excretion
(assert
  (! (and patient_has_undergone_nuclear_medicine_imaging_procedure_inthehistory
          patients_bile_secretion_is_abnormal_now@@obstructed)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have radionuclide imaging confirmation of obstructed biliary excretion."
