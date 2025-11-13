;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the measured value if a Mini-Mental State Examination score is recorded for the patient now.","when_to_set_to_null":"Set to null if no Mini-Mental State Examination score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's Mini-Mental State Examination score recorded now."} ;; "Mini-Mental State Examination score"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_mini_mental_state_examination_score_value_recorded_now_withunit_none 15))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a Mini-Mental State Examination score < 15."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_delirium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has delirium (i.e., delirium is present at baseline).","when_to_set_to_false":"Set to false if the patient currently does not have delirium (i.e., delirium is absent at baseline).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has delirium at baseline.","meaning":"Boolean indicating whether the patient currently has delirium."} ;; "delirium at baseline"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_delirium_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has delirium at baseline."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_unable_to_speak_english Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to speak English.","when_to_set_to_false":"Set to false if the patient is able to speak English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to speak English.","meaning":"Boolean indicating whether the patient is unable to speak English."} ;; "the patient is unable to speak English"
(declare-const patient_is_unable_to_understand_english Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to understand English.","when_to_set_to_false":"Set to false if the patient is able to understand English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to understand English.","meaning":"Boolean indicating whether the patient is unable to understand English."} ;; "the patient is unable to understand English"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not (and patient_is_unable_to_speak_english
               patient_is_unable_to_understand_english))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is unable to speak English) AND (the patient is unable to understand English)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_severe_hearing_loss_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe hearing loss.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe hearing loss.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe hearing loss.","meaning":"Boolean indicating whether the patient currently has severe hearing loss."} ;; "severe hearing impairment"
(declare-const patient_has_finding_of_severe_hearing_loss_now@@results_in_inability_to_converse Bool) ;; {"when_to_set_to_true":"Set to true if the patient's severe hearing loss results in inability to converse.","when_to_set_to_false":"Set to false if the patient's severe hearing loss does not result in inability to converse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's severe hearing loss results in inability to converse.","meaning":"Boolean indicating whether the patient's severe hearing loss results in inability to converse."} ;; "severe hearing impairment resulting in inability to converse"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_severe_hearing_loss_now@@results_in_inability_to_converse
      patient_has_finding_of_severe_hearing_loss_now)
   :named REQ3_AUXILIARY0)) ;; "severe hearing impairment resulting in inability to converse" implies "severe hearing impairment"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_severe_hearing_loss_now@@results_in_inability_to_converse)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hearing impairment resulting in inability to converse."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_exposed_to_ketamine_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planned to be exposed to ketamine in the future (e.g., as part of a scheduled procedure).","when_to_set_to_false":"Set to false if the patient is not planned to be exposed to ketamine in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planned to be exposed to ketamine in the future.","meaning":"Boolean indicating whether the patient is planned to be exposed to ketamine in the future."} ;; "ketamine"
(declare-const patient_is_exposed_to_ketamine_inthefuture@@intraoperative_context Bool) ;; {"when_to_set_to_true":"Set to true if the planned future exposure to ketamine is specifically intraoperative (i.e., during a surgical procedure).","when_to_set_to_false":"Set to false if the planned future exposure to ketamine is not intraoperative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the planned future exposure to ketamine is intraoperative.","meaning":"Boolean indicating whether the planned future exposure to ketamine is intraoperative."} ;; "intraoperative ketamine"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_ketamine_inthefuture@@intraoperative_context
      patient_is_exposed_to_ketamine_inthefuture)
:named REQ4_AUXILIARY0)) ;; "intraoperative ketamine" implies "ketamine"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_exposed_to_ketamine_inthefuture@@intraoperative_context)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has planned use of intraoperative ketamine."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_taking_remifentanil_containing_product_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planned to take a remifentanil-containing product intraoperatively in the future.","when_to_set_to_false":"Set to false if the patient is not planned to take a remifentanil-containing product intraoperatively in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planned to take a remifentanil-containing product intraoperatively in the future.","meaning":"Boolean indicating whether the patient is planned to take a remifentanil-containing product intraoperatively in the future."} ;; "intraoperative remifentanil"
(declare-const patient_is_taking_remifentanil_containing_product_inthefuture@@planned_use_not_limited_to_airway_management_preincision Bool) ;; {"when_to_set_to_true":"Set to true if the planned use of intraoperative remifentanil-containing product is NOT limited to airway management pre-incision.","when_to_set_to_false":"Set to false if the planned use of intraoperative remifentanil-containing product is limited only to airway management pre-incision.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the planned use is limited to airway management pre-incision.","meaning":"Boolean indicating whether the planned use of intraoperative remifentanil-containing product is NOT limited to airway management pre-incision."} ;; "the planned use of intraoperative remifentanil is NOT limited to airway management pre-incision"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_taking_remifentanil_containing_product_inthefuture@@planned_use_not_limited_to_airway_management_preincision
     patient_is_taking_remifentanil_containing_product_inthefuture)
:named REQ5_AUXILIARY0)) ;; "the planned use of intraoperative remifentanil is NOT limited to airway management pre-incision""

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and patient_is_taking_remifentanil_containing_product_inthefuture
             patient_is_taking_remifentanil_containing_product_inthefuture@@planned_use_not_limited_to_airway_management_preincision))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has planned use of intraoperative remifentanil) AND (the planned use of intraoperative remifentanil is NOT limited to airway management pre-incision)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_arterial_catheter_planned_to_be_inserted Bool) ;; {"when_to_set_to_true":"Set to true if the patient has an arterial catheter planned to be inserted.","when_to_set_to_false":"Set to false if the patient does not have an arterial catheter planned to be inserted.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an arterial catheter planned to be inserted.","meaning":"Boolean indicating whether the patient has an arterial catheter planned to be inserted."} ;; "the patient does NOT have an arterial catheter planned to be inserted"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_arterial_catheter_planned_to_be_inserted)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT have an arterial catheter planned to be inserted."
