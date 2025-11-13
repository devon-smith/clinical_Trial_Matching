;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} // "To be included, the patient must be male or female."
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} // "To be included, the patient must be male or female."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_sex_is_female_now
         patient_sex_is_male_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged between 15 years old and 40 years old"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (and (>= patient_age_value_recorded_now_in_years 15.0)
          (<= patient_age_value_recorded_now_in_years 40.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged between 15 years old and 40 years old."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_spontaneous_pneumothorax_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a spontaneous pneumothorax documented in their history.","when_to_set_to_false":"Set to false if the patient has never had a spontaneous pneumothorax documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a spontaneous pneumothorax.","meaning":"Boolean indicating whether the patient has ever had a spontaneous pneumothorax in their history."} // "To be included, the patient must have a first episode of spontaneous pneumothorax."
(declare-const patient_has_finding_of_spontaneous_pneumothorax_inthehistory@@first_episode Bool) ;; {"when_to_set_to_true":"Set to true if the patient's spontaneous pneumothorax in history is the first episode (i.e., no prior episodes).","when_to_set_to_false":"Set to false if the patient's spontaneous pneumothorax in history is not the first episode (i.e., there were prior episodes).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the spontaneous pneumothorax is the first episode.","meaning":"Boolean indicating whether the patient's spontaneous pneumothorax in history is the first episode."} // "To be included, the patient must have a first episode of spontaneous pneumothorax."

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_finding_of_spontaneous_pneumothorax_inthehistory@@first_episode
         patient_has_finding_of_spontaneous_pneumothorax_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "first episode" implies "spontaneous pneumothorax in history"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_spontaneous_pneumothorax_inthehistory@@first_episode
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a first episode of spontaneous pneumothorax."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_symptoms_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of chest pain.","meaning":"Boolean indicating whether the patient currently has symptoms of chest pain."} // "have chest pain"
(declare-const patient_has_symptoms_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of dyspnea.","meaning":"Boolean indicating whether the patient currently has symptoms of dyspnea."} // "have dyspnea"
(declare-const patient_is_undergoing_aspiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing aspiration.","when_to_set_to_false":"Set to false if the patient is currently not undergoing aspiration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing aspiration.","meaning":"Boolean indicating whether the patient is currently undergoing aspiration."} // "requiring simple aspiration"
(declare-const patient_is_undergoing_aspiration_now@@aspiration_is_simple Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing aspiration and the aspiration is simple.","when_to_set_to_false":"Set to false if the patient is currently undergoing aspiration and the aspiration is not simple.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the aspiration is simple.","meaning":"Boolean indicating whether the patient is currently undergoing aspiration and the aspiration is simple."} // "requiring simple aspiration"
(declare-const rim_of_air_value_recorded_now_in_cm Real) ;; {"when_to_set_to_value":"Set to the numeric value (in centimeters) of the rim of air measured on chest X-ray, recorded now.","when_to_set_to_null":"Set to null if the rim of air measurement on chest X-ray is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the rim of air measured on chest X-ray, recorded now, in centimeters."} // "the rim of air must be greater than 2 cm on chest X-ray"
(declare-const rim_of_air_value_recorded_now_in_cm@@measured_on_chest_xray Bool) ;; {"when_to_set_to_true":"Set to true if the rim of air value is measured on chest X-ray.","when_to_set_to_false":"Set to false if the rim of air value is not measured on chest X-ray.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the rim of air value is measured on chest X-ray.","meaning":"Boolean indicating whether the rim of air value is measured on chest X-ray."} // "on chest X-ray"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable for aspiration implies stem variable
(assert
  (! (=> patient_is_undergoing_aspiration_now@@aspiration_is_simple
         patient_is_undergoing_aspiration_now)
     :named REQ3_AUXILIARY0)) ;; "requiring simple aspiration"

;; Qualifier variable for rim of air measurement implies rim of air is measured on chest X-ray
(assert
  (! (=> rim_of_air_value_recorded_now_in_cm@@measured_on_chest_xray
         true)
     :named REQ3_AUXILIARY1)) ;; "rim of air measured on chest X-ray"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must be symptomatic (dyspnea or chest pain) OR rim of air > 2 cm on chest X-ray requiring simple aspiration
(assert
  (! (or
        (or patient_has_symptoms_of_dyspnea_now
            patient_has_symptoms_of_chest_pain_now)
        (and rim_of_air_value_recorded_now_in_cm@@measured_on_chest_xray
             (> rim_of_air_value_recorded_now_in_cm 2.0)
             patient_is_undergoing_aspiration_now@@aspiration_is_simple))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be symptomatic (have dyspnea or have chest pain) or the rim of air must be greater than 2 cm on chest X-ray requiring simple aspiration."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_complete_lung_expansion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has complete lung expansion.","when_to_set_to_false":"Set to false if the patient currently does not have complete lung expansion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has complete lung expansion.","meaning":"Boolean indicating whether the patient currently has complete lung expansion."} // "complete lung expansion"
(declare-const patient_has_finding_of_nearly_complete_lung_expansion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has nearly complete lung expansion.","when_to_set_to_false":"Set to false if the patient currently does not have nearly complete lung expansion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has nearly complete lung expansion.","meaning":"Boolean indicating whether the patient currently has nearly complete lung expansion."} // "nearly complete lung expansion"
(declare-const patient_has_finding_of_persistent_lung_expansion_now@@immediately_following_manual_aspiration Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has persistent lung expansion and this occurs immediately following manual aspiration.","when_to_set_to_false":"Set to false if the patient currently does not have persistent lung expansion immediately following manual aspiration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has persistent lung expansion immediately following manual aspiration.","meaning":"Boolean indicating whether the patient currently has persistent lung expansion immediately following manual aspiration."} // "persistent lung expansion immediately following manual aspiration"
(declare-const patient_has_undergone_aspiration_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone the procedure of aspiration at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone the procedure of aspiration at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone aspiration.","meaning":"Boolean indicating whether the patient has ever undergone aspiration (removal of air or fluid from the lung) at any time in the past."} // "aspiration"
(declare-const patient_has_undergone_aspiration_inthehistory@@manual Bool) ;; {"when_to_set_to_true":"Set to true if the aspiration procedure was performed manually.","when_to_set_to_false":"Set to false if the aspiration procedure was not performed manually (e.g., was automated or by another method).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the aspiration was performed manually.","meaning":"Boolean indicating whether the aspiration procedure was performed manually."} // "manual aspiration"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable for persistent lung expansion is a specific context, no further auxiliary needed.

;; Qualifier variable for manual aspiration implies aspiration in history
(assert
  (! (=> patient_has_undergone_aspiration_inthehistory@@manual
         patient_has_undergone_aspiration_inthehistory)
     :named REQ4_AUXILIARY0)) ;; "manual aspiration" implies "aspiration in history"

;; ===================== Constraint Assertions (REQ 4) =====================
;; To be included, the patient must have complete lung expansion OR (nearly complete lung expansion AND persistent lung expansion immediately following manual aspiration)
(assert
  (! (or patient_has_finding_of_complete_lung_expansion_now
         (and patient_has_finding_of_nearly_complete_lung_expansion_now
              patient_has_finding_of_persistent_lung_expansion_now@@immediately_following_manual_aspiration))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have complete lung expansion or nearly complete lung expansion and persistent lung expansion immediately following manual aspiration."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_grams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current hemoglobin concentration in grams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current hemoglobin concentration in grams per deciliter."} // "hemoglobin concentration greater than 10 grams per deciliter"
(declare-const patient_neutrophil_count_value_recorded_now_withunit_10power9_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current absolute neutrophil count in 10^9 per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current absolute neutrophil count in 10^9 per liter."} // "absolute neutrophil count greater than 1.5 times 10 to the power of 9 per liter"
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_10power9_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current platelet count in 10^9 per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value of the patient's current platelet count in 10^9 per liter."} // "platelet count greater than 100 times 10 to the power of 9 per liter"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: Adequate hematological function, defined as all three thresholds met
(assert
  (! (and
        (> patient_hemoglobin_concentration_dipstick_finding_value_recorded_now_withunit_grams_per_deciliter 10.0) ;; "hemoglobin concentration greater than 10 grams per deciliter"
        (> patient_neutrophil_count_value_recorded_now_withunit_10power9_per_liter 1.5) ;; "absolute neutrophil count greater than 1.5 times 10 to the power of 9 per liter"
        (> patient_platelet_count_finding_value_recorded_now_withunit_10power9_per_liter 100.0)) ;; "platelet count greater than 100 times 10 to the power of 9 per liter"
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const serum_creatinine_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the patient's current serum creatinine concentration in mg/dL if available.","when_to_set_to_null":"Set to null if the patient's current serum creatinine concentration in mg/dL is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current serum creatinine concentration in mg/dL."} // "serum creatinine concentration less than one times the upper limit of normal"
(declare-const serum_creatinine_upper_limit_of_normal_value_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the current upper limit of normal for serum creatinine concentration in mg/dL as defined by the laboratory reference range.","when_to_set_to_null":"Set to null if the current upper limit of normal for serum creatinine concentration in mg/dL is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the current upper limit of normal for serum creatinine concentration in mg/dL for the patient."} // "serum creatinine concentration less than one times the upper limit of normal"
(declare-const serum_alanine_aminotransferase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the patient's current serum ALT concentration in U/L if available.","when_to_set_to_null":"Set to null if the patient's current serum ALT concentration in U/L is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current serum ALT concentration in U/L."} // "serum alanine aminotransferase (ALT) concentration less than two point five times the upper limit of normal"
(declare-const serum_alanine_aminotransferase_upper_limit_of_normal_value_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the current upper limit of normal for serum ALT concentration in U/L as defined by the laboratory reference range.","when_to_set_to_null":"Set to null if the current upper limit of normal for serum ALT concentration in U/L is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the current upper limit of normal for serum ALT concentration in U/L for the patient."} // "serum alanine aminotransferase (ALT) concentration less than two point five times the upper limit of normal"
(declare-const serum_aspartate_aminotransferase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the patient's current serum AST concentration in U/L if available.","when_to_set_to_null":"Set to null if the patient's current serum AST concentration in U/L is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current serum AST concentration in U/L."} // "serum aspartate aminotransferase (AST) concentration less than two point five times the upper limit of normal"
(declare-const serum_aspartate_aminotransferase_upper_limit_of_normal_value_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the current upper limit of normal for serum AST concentration in U/L as defined by the laboratory reference range.","when_to_set_to_null":"Set to null if the current upper limit of normal for serum AST concentration in U/L is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the current upper limit of normal for serum AST concentration in U/L for the patient."} // "serum aspartate aminotransferase (AST) concentration less than two point five times the upper limit of normal"
(declare-const alkaline_phosphatase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the patient's current alkaline phosphatase concentration in U/L if available.","when_to_set_to_null":"Set to null if the patient's current alkaline phosphatase concentration in U/L is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current alkaline phosphatase concentration in U/L."} // "alkaline phosphatase concentration less than five times the upper limit of normal"
(declare-const alkaline_phosphatase_upper_limit_of_normal_value_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the current upper limit of normal for alkaline phosphatase concentration in U/L as defined by the laboratory reference range.","when_to_set_to_null":"Set to null if the current upper limit of normal for alkaline phosphatase concentration in U/L is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the current upper limit of normal for alkaline phosphatase concentration in U/L for the patient."} // "alkaline phosphatase concentration less than five times the upper limit of normal"
(declare-const patient_has_finding_of_normal_renal_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of normal renal function.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of normal renal function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has normal renal function.","meaning":"Boolean indicating whether the patient currently has normal renal function."} // "normal renal function"
(declare-const patients_liver_function_is_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has normal liver function.","when_to_set_to_false":"Set to false if the patient currently does not have normal liver function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has normal liver function.","meaning":"Boolean indicating whether the patient currently has normal liver function."} // "normal hepatic function"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: normal renal function is defined as serum creatinine < 1 x ULN
(assert
  (! (= patient_has_finding_of_normal_renal_function_now
        (< serum_creatinine_value_recorded_now_withunit_mg_per_dl
           serum_creatinine_upper_limit_of_normal_value_now_withunit_mg_per_dl))
     :named REQ6_AUXILIARY0)) ;; "serum creatinine concentration less than one times the upper limit of normal"

;; Definition: normal hepatic function is defined as
;; ALT < 2.5 x ULN, AST < 2.5 x ULN, and alkaline phosphatase < 5 x ULN
(assert
  (! (= patients_liver_function_is_normal_now
        (and (< serum_alanine_aminotransferase_value_recorded_now_withunit_u_per_l
                (* 2.5 serum_alanine_aminotransferase_upper_limit_of_normal_value_now_withunit_u_per_l))
             (< serum_aspartate_aminotransferase_value_recorded_now_withunit_u_per_l
                (* 2.5 serum_aspartate_aminotransferase_upper_limit_of_normal_value_now_withunit_u_per_l))
             (< alkaline_phosphatase_value_recorded_now_withunit_u_per_l
                (* 5.0 alkaline_phosphatase_upper_limit_of_normal_value_now_withunit_u_per_l))))
     :named REQ6_AUXILIARY1)) ;; "serum alanine aminotransferase (ALT) concentration and serum aspartate aminotransferase (AST) concentration less than two point five times the upper limit of normal, and alkaline phosphatase concentration less than five times the upper limit of normal"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (and patient_has_finding_of_normal_renal_function_now
          patients_liver_function_is_normal_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have normal renal function and normal hepatic function, defined as serum creatinine concentration less than one times the upper limit of normal, serum alanine aminotransferase (ALT) concentration and serum aspartate aminotransferase (AST) concentration less than two point five times the upper limit of normal, and alkaline phosphatase concentration less than five times the upper limit of normal."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} // "To be included, the patient must provide written informed consent."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must provide written informed consent."
