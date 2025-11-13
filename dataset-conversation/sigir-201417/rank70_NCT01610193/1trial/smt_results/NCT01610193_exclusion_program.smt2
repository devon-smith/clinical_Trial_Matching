;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "younger than eighteen years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than eighteen years of age."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_abdominal_discomfort_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of abdominal discomfort.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of abdominal discomfort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abdominal discomfort.","meaning":"Boolean indicating whether the patient currently has abdominal discomfort."} ;; "abdominal discomfort"

(declare-const patient_has_finding_of_abdominal_discomfort_now@@without_abdominal_tenderness_or_abdominal_rebound_or_clinical_suspicion_of_appendicitis Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abdominal discomfort and this occurs without abdominal tenderness, abdominal rebound, or clinical suspicion of appendicitis.","when_to_set_to_false":"Set to false if the patient currently has abdominal discomfort but this occurs with abdominal tenderness, abdominal rebound, or clinical suspicion of appendicitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether abdominal discomfort occurs without abdominal tenderness, abdominal rebound, or clinical suspicion of appendicitis.","meaning":"Boolean indicating whether the patient's abdominal discomfort occurs without abdominal tenderness, abdominal rebound, or clinical suspicion of appendicitis."} ;; "abdominal discomfort without abdominal tenderness or abdominal rebound or clinical suspicion of appendicitis"

(declare-const patient_has_finding_of_abdominal_tenderness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abdominal tenderness.","when_to_set_to_false":"Set to false if the patient currently does not have abdominal tenderness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abdominal tenderness.","meaning":"Boolean indicating whether the patient currently has abdominal tenderness."} ;; "abdominal tenderness"

(declare-const patient_has_finding_of_abdominal_rebound_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abdominal rebound.","when_to_set_to_false":"Set to false if the patient currently does not have abdominal rebound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abdominal rebound.","meaning":"Boolean indicating whether the patient currently has abdominal rebound."} ;; "abdominal rebound"

(declare-const patient_has_clinical_suspicion_of_appendicitis_now Bool) ;; {"when_to_set_to_true":"Set to true if there is current clinical suspicion of appendicitis in the patient.","when_to_set_to_false":"Set to false if there is currently no clinical suspicion of appendicitis in the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is current clinical suspicion of appendicitis in the patient.","meaning":"Boolean indicating whether there is current clinical suspicion of appendicitis in the patient."} ;; "clinical suspicion of appendicitis"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition of the qualifier variable: abdominal discomfort without abdominal tenderness or abdominal rebound or clinical suspicion of appendicitis
(assert
(! (= patient_has_finding_of_abdominal_discomfort_now@@without_abdominal_tenderness_or_abdominal_rebound_or_clinical_suspicion_of_appendicitis
(and patient_has_finding_of_abdominal_discomfort_now
(not (or patient_has_finding_of_abdominal_tenderness_now
         patient_has_finding_of_abdominal_rebound_now
         patient_has_clinical_suspicion_of_appendicitis_now))))
:named REQ1_AUXILIARY0)) ;; "abdominal discomfort without abdominal tenderness or abdominal rebound or clinical suspicion of appendicitis"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_abdominal_discomfort_now@@without_abdominal_tenderness_or_abdominal_rebound_or_clinical_suspicion_of_appendicitis
       patient_has_finding_of_abdominal_discomfort_now)
:named REQ1_AUXILIARY1)) ;; "abdominal discomfort without abdominal tenderness or abdominal rebound or clinical suspicion of appendicitis" implies "abdominal discomfort"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_abdominal_discomfort_now@@without_abdominal_tenderness_or_abdominal_rebound_or_clinical_suspicion_of_appendicitis)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has abdominal discomfort without abdominal tenderness or abdominal rebound or clinical suspicion of appendicitis."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_disturbance_of_consciousness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has impaired or disturbed consciousness.","when_to_set_to_false":"Set to false if the patient currently does not have impaired or disturbed consciousness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired or disturbed consciousness.","meaning":"Boolean indicating whether the patient currently has impaired or disturbed consciousness."} ;; "impaired consciousness"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_disturbance_of_consciousness_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has impaired consciousness."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_able_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide informed consent.","when_to_set_to_false":"Set to false if the patient is currently not able to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide informed consent."} ;; "The patient is excluded if the patient is NOT able to provide informed consent."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_able_to_provide_informed_consent_now)
:named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is NOT able to provide informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_will_undergo_appendectomy_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo appendectomy in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo appendectomy in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to undergo appendectomy in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo appendectomy in the future."} ;; "appendicectomy"
(declare-const patient_will_undergo_appendectomy_inthefuture@@as_part_of_another_elective_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient's future appendectomy is performed as part of another elective procedure.","when_to_set_to_false":"Set to false if the patient's future appendectomy is not performed as part of another elective procedure (i.e., it is standalone or part of an emergency procedure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the appendectomy is performed as part of another elective procedure.","meaning":"Boolean indicating whether the patient's future appendectomy is performed as part of another elective procedure."} ;; "as part of another elective procedure"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_will_undergo_appendectomy_inthefuture@@as_part_of_another_elective_procedure
      patient_will_undergo_appendectomy_inthefuture)
   :named REQ5_AUXILIARY0)) ;; "as part of another elective procedure" implies "appendicectomy"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_will_undergo_appendectomy_inthefuture@@as_part_of_another_elective_procedure)
   :named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient will receive appendicectomy as part of another elective procedure."
