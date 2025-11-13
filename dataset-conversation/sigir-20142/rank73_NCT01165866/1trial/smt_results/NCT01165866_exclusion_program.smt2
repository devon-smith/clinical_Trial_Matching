;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_operation_on_abdominal_region_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an operation on the abdominal region at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone an operation on the abdominal region at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an operation on the abdominal region.","meaning":"Boolean indicating whether the patient has ever undergone an operation on the abdominal region at any time in the past."} ;; "previous abdominal surgery"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_undergone_operation_on_abdominal_region_inthehistory)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous abdominal surgery."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_suspicion_of_disorder_of_abdomen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have a disorder of the abdomen (i.e., there is clinical suspicion of a surgical abdominal condition at present).","when_to_set_to_false":"Set to false if the patient is currently not suspected to have a disorder of the abdomen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have a disorder of the abdomen.","meaning":"Boolean indicating whether the patient is currently suspected to have a disorder of the abdomen."} ;; "suspicion of a surgical abdominal condition"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_suspicion_of_disorder_of_abdomen_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspicion of a surgical abdominal condition."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_bilious_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bilious vomiting (bile-stained vomitus).","when_to_set_to_false":"Set to false if the patient currently does not have bilious vomiting (bile-stained vomitus).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bilious vomiting (bile-stained vomitus).","meaning":"Boolean indicating whether the patient currently has bilious vomiting (bile-stained vomitus)."} ;; "bile-stained vomitus"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_bilious_vomiting_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bile-stained vomitus."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_disease_of_liver_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with liver disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with liver disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with liver disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of liver disease in their medical history."} ;; "hepatic illness"
(declare-const patient_has_diagnosis_of_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with kidney disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with kidney disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with kidney disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of kidney disease in their medical history."} ;; "renal illness"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_disease_of_liver_inthehistory)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hepatic illness."

(assert
(! (not patient_has_diagnosis_of_kidney_disease_inthehistory)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of renal illness."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_inborn_error_of_metabolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of inborn error of metabolism.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of inborn error of metabolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of inborn error of metabolism.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of inborn error of metabolism."} ;; "in-born error of metabolism"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_inborn_error_of_metabolism_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an in-born error of metabolism."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "child"

(declare-const patient_has_finding_of_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of shock.","meaning":"Boolean indicating whether the patient currently has shock."} ;; "shock"

(declare-const patient_has_finding_of_shock_now@@in_a_child Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current shock occurs in a child.","when_to_set_to_false":"Set to false if the patient's current shock does not occur in a child.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current shock occurs in a child.","meaning":"Boolean indicating whether the patient's current shock occurs in a child."} ;; "child with shock"

(declare-const patient_has_finding_of_impending_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impending shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impending shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of impending shock.","meaning":"Boolean indicating whether the patient currently has impending shock."} ;; "impending shock"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_shock_now@@in_a_child
      patient_has_finding_of_shock_now)
:named REQ5_AUXILIARY0)) ;; "child with shock"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient is a child with shock OR patient is a child with impending shock
(assert
(! (not (or patient_has_finding_of_shock_now@@in_a_child
            patient_has_finding_of_impending_shock_now))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a child with shock) OR (the patient is a child with impending shock)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_severe_dehydration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe dehydration.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe dehydration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe dehydration.","meaning":"Boolean indicating whether the patient currently has severe dehydration."} ;; "severe dehydration"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_severe_dehydration_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe dehydration."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_metoclopramide Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypersensitivity is specifically to metoclopramide.","when_to_set_to_false":"Set to false if the patient's hypersensitivity is not to metoclopramide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity is to metoclopramide.","meaning":"Boolean indicating whether the patient's hypersensitivity is specifically to metoclopramide."} ;; "previous hypersensitivity to metoclopramide"
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_ondansetron Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypersensitivity is specifically to ondansetron.","when_to_set_to_false":"Set to false if the patient's hypersensitivity is not to ondansetron.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity is to ondansetron.","meaning":"Boolean indicating whether the patient's hypersensitivity is specifically to ondansetron."} ;; "previous hypersensitivity to ondansetron"
(declare-const patient_has_finding_of_metoclopramide_adverse_reaction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented clinical finding of abnormal reaction to metoclopramide at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a documented clinical finding of abnormal reaction to metoclopramide at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had abnormal reaction to metoclopramide.","meaning":"Boolean indicating whether the patient has ever had abnormal reaction to metoclopramide."} ;; "previous abnormal reaction to metoclopramide"
(declare-const patient_has_finding_of_abnormal_patient_reaction_inthehistory@@to_ondansetron Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal reaction is specifically to ondansetron.","when_to_set_to_false":"Set to false if the patient's abnormal reaction is not to ondansetron.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal reaction is to ondansetron.","meaning":"Boolean indicating whether the patient's abnormal reaction is specifically to ondansetron."} ;; "previous abnormal reaction to ondansetron"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_metoclopramide)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous hypersensitivity to metoclopramide."

(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@to_ondansetron)
    :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous hypersensitivity to ondansetron."

(assert
(! (not patient_has_finding_of_metoclopramide_adverse_reaction_inthehistory)
    :named REQ7_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous abnormal reaction to metoclopramide."

(assert
(! (not patient_has_finding_of_abnormal_patient_reaction_inthehistory@@to_ondansetron)
    :named REQ7_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous abnormal reaction to ondansetron."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const antiemetic_treatment_time_since_last_received_prior_to_presentation_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours since the patient last received antiemetic treatment prior to presentation, if known.","when_to_set_to_null":"Set to null if the time since last antiemetic treatment prior to presentation is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of hours since the patient last received antiemetic treatment prior to presentation."} ;; "number of hours since the patient last received antiemetic treatment prior to presentation"
(declare-const patient_has_received_antiemetic_treatment_within_48_hours_prior_to_presentation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received antiemetic treatment within the forty-eight hours prior to presentation.","when_to_set_to_false":"Set to false if the patient has not received antiemetic treatment within the forty-eight hours prior to presentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received antiemetic treatment within the forty-eight hours prior to presentation.","meaning":"Boolean indicating whether the patient has received antiemetic treatment within the forty-eight hours prior to presentation."} ;; "received antiemetic treatment within forty-eight hours prior to presentation"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Definition: patient_has_received_antiemetic_treatment_within_48_hours_prior_to_presentation is true iff antiemetic_treatment_time_since_last_received_prior_to_presentation_in_hours < 48
(assert
(! (= patient_has_received_antiemetic_treatment_within_48_hours_prior_to_presentation
    (< antiemetic_treatment_time_since_last_received_prior_to_presentation_in_hours 48))
:named REQ8_AUXILIARY0)) ;; "has received antiemetic treatment within forty-eight hours prior to presentation"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_received_antiemetic_treatment_within_48_hours_prior_to_presentation)
:named REQ8_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has received antiemetic treatment within forty-eight hours prior to presentation."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_seizure_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of seizure disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of seizure disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of seizure disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of seizure disorder."} ;; "seizure disorder"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_diagnosis_of_seizure_disorder_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a seizure disorder."
