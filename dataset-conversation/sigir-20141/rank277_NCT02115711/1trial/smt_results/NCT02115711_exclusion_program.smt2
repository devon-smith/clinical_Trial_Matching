;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_bed_ridden_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently bed-ridden.","when_to_set_to_false":"Set to false if the patient is currently not bed-ridden.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently bed-ridden.","meaning":"Boolean indicating whether the patient is currently bed-ridden."} ;; "bed-bound"
(declare-const patient_has_finding_of_bed_ridden_now@@caused_by_acute_illness Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bed-ridden status is caused by an acute illness.","when_to_set_to_false":"Set to false if the patient's current bed-ridden status is not caused by an acute illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bed-ridden status is caused by an acute illness.","meaning":"Boolean indicating whether the patient's current bed-ridden status is caused by an acute illness."} ;; "bed-bound because of acute illness"
(declare-const patient_has_finding_of_bed_ridden_now@@caused_by_chronic_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bed-ridden status is caused by a chronic condition.","when_to_set_to_false":"Set to false if the patient's current bed-ridden status is not caused by a chronic condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bed-ridden status is caused by a chronic condition.","meaning":"Boolean indicating whether the patient's current bed-ridden status is caused by a chronic condition."} ;; "bed-bound because of chronic condition"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the patient is currently bed-ridden
(assert
(! (=> patient_has_finding_of_bed_ridden_now@@caused_by_acute_illness
      patient_has_finding_of_bed_ridden_now)
   :named REQ0_AUXILIARY0)) ;; "bed-bound because of acute illness"

(assert
(! (=> patient_has_finding_of_bed_ridden_now@@caused_by_chronic_condition
      patient_has_finding_of_bed_ridden_now)
   :named REQ0_AUXILIARY1)) ;; "bed-bound because of chronic condition"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient is bed-bound because of acute illness OR has a chronic condition that makes the patient bed-bound
(assert
(! (not (or patient_has_finding_of_bed_ridden_now@@caused_by_acute_illness
            patient_has_finding_of_bed_ridden_now@@caused_by_chronic_condition))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is bed-bound because of acute illness) OR (the patient has a chronic condition that makes the patient bed-bound)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_refused_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has refused consent at the current time.","when_to_set_to_false":"Set to false if the patient has not refused consent at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has refused consent at the current time.","meaning":"Boolean indicating whether the patient has refused consent at the current time."} ;; "The patient is excluded if the patient refuses consent."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_refused_consent_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient refuses consent."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_visiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently only visiting.","when_to_set_to_false":"Set to false if the patient is not currently only visiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently only visiting.","meaning":"Boolean indicating whether the patient is currently only visiting."} ;; "the patient is only visiting"
(declare-const patient_resides_in_community_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently resides in the community.","when_to_set_to_false":"Set to false if the patient does not currently reside in the community.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently resides in the community.","meaning":"Boolean indicating whether the patient currently resides in the community."} ;; "the patient does NOT reside in the community"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and (not patient_resides_in_community_now)
             patient_is_visiting_now))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "(the patient does NOT reside in the community AND the patient is only visiting), making the patient unlikely to be available for continuous follow up."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_length_of_stay_in_study_area_value_recorded_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient has stayed in the study area.","when_to_set_to_null":"Set to null if the duration of the patient's stay in the study area is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of months the patient has stayed in the study area."} ;; "the patient has stayed less than six months in the study area"
(declare-const patient_name_is_on_voter_list_of_study_area Bool) ;; {"when_to_set_to_true":"Set to true if the patient's name is present on the voter list of the study area.","when_to_set_to_false":"Set to false if the patient's name is not present on the voter list of the study area.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's name is present on the voter list of the study area.","meaning":"Boolean indicating whether the patient's name is present on the voter list of the study area."} ;; "the name of the patient is NOT on the voter list of the area"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (< patient_length_of_stay_in_study_area_value_recorded_in_months 6))
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has stayed less than six months in the study area"

(assert
(! (not (not patient_name_is_on_voter_list_of_study_area))
:named REQ3_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the name of the patient is NOT on the voter list of the area"

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_blindness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has blindness.","when_to_set_to_false":"Set to false if the patient currently does not have blindness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has blindness.","meaning":"Boolean indicating whether the patient currently has blindness."} ;; "blindness"
(declare-const patient_has_finding_of_blindness_now@@significant_disability_prevents_participation_in_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has blindness and this disability is significant enough to prevent participation in the intervention.","when_to_set_to_false":"Set to false if the patient currently has blindness but it is not significant enough to prevent participation in the intervention, or if the disability does not prevent participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the blindness is significant and prevents participation in the intervention.","meaning":"Boolean indicating whether the patient's blindness is significant and prevents participation in the intervention."} ;; "blindness, significant disability prevents participation in intervention"
(declare-const patient_has_finding_of_deafness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has deafness.","when_to_set_to_false":"Set to false if the patient currently does not have deafness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has deafness.","meaning":"Boolean indicating whether the patient currently has deafness."} ;; "deafness"
(declare-const patient_has_finding_of_deafness_now@@significant_disability_prevents_participation_in_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has deafness and this disability is significant enough to prevent participation in the intervention.","when_to_set_to_false":"Set to false if the patient currently has deafness but it is not significant enough to prevent participation in the intervention, or if the disability does not prevent participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the deafness is significant and prevents participation in the intervention.","meaning":"Boolean indicating whether the patient's deafness is significant and prevents participation in the intervention."} ;; "deafness, significant disability prevents participation in intervention"
(declare-const patient_has_finding_of_intellectual_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of intellectual disability.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of intellectual disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of intellectual disability.","meaning":"Boolean indicating whether the patient currently has intellectual disability."} ;; "intellectual disability"
(declare-const patient_has_finding_of_intellectual_disability_now@@significant_disability_prevents_participation_in_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intellectual disability and this disability is significant enough to prevent participation in the intervention.","when_to_set_to_false":"Set to false if the patient currently has intellectual disability but it is not significant enough to prevent participation in the intervention, or if the disability does not prevent participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the intellectual disability is significant and prevents participation in the intervention.","meaning":"Boolean indicating whether the patient's intellectual disability is significant and prevents participation in the intervention."} ;; "intellectual disability, significant disability prevents participation in intervention"
(declare-const patient_has_finding_of_significant_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a significant disability.","when_to_set_to_false":"Set to false if the patient currently does not have a significant disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a significant disability.","meaning":"Boolean indicating whether the patient currently has a significant disability."} ;; "significant disability"
(declare-const patient_has_finding_of_significant_disability_now@@significant_disability_prevents_participation_in_intervention Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a significant disability and this disability is significant enough to prevent participation in the intervention.","when_to_set_to_false":"Set to false if the patient currently has a significant disability but it is not significant enough to prevent participation in the intervention, or if the disability does not prevent participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the significant disability is significant and prevents participation in the intervention.","meaning":"Boolean indicating whether the patient's significant disability is significant and prevents participation in the intervention."} ;; "significant disability prevents participation in intervention"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_blindness_now@@significant_disability_prevents_participation_in_intervention
           patient_has_finding_of_deafness_now@@significant_disability_prevents_participation_in_intervention
           patient_has_finding_of_intellectual_disability_now@@significant_disability_prevents_participation_in_intervention)
    patient_has_finding_of_significant_disability_now@@significant_disability_prevents_participation_in_intervention)
:named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (blindness, deafness, intellectual disability)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_blindness_now@@significant_disability_prevents_participation_in_intervention
       patient_has_finding_of_blindness_now)
:named REQ4_AUXILIARY1)) ;; "blindness, significant disability prevents participation in intervention"
(assert
(! (=> patient_has_finding_of_deafness_now@@significant_disability_prevents_participation_in_intervention
       patient_has_finding_of_deafness_now)
:named REQ4_AUXILIARY2)) ;; "deafness, significant disability prevents participation in intervention"
(assert
(! (=> patient_has_finding_of_intellectual_disability_now@@significant_disability_prevents_participation_in_intervention
       patient_has_finding_of_intellectual_disability_now)
:named REQ4_AUXILIARY3)) ;; "intellectual disability, significant disability prevents participation in intervention"
(assert
(! (=> patient_has_finding_of_significant_disability_now@@significant_disability_prevents_participation_in_intervention
       patient_has_finding_of_significant_disability_now)
:named REQ4_AUXILIARY4)) ;; "significant disability prevents participation in intervention"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_significant_disability_now@@significant_disability_prevents_participation_in_intervention)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is NOT able to participate in the intervention due to significant disabilities with non-exhaustive examples (blindness, deafness, intellectual disability)."
