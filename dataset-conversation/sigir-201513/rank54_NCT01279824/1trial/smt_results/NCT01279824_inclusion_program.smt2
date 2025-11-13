;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a cerebrovascular accident (stroke) documented in their history.","when_to_set_to_false":"Set to false if the patient has never had a cerebrovascular accident (stroke) documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever had a cerebrovascular accident (stroke) in their history."} // "must have had a stroke"
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory@@identified_by_neurological_examination_and_radiological_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of cerebrovascular accident (stroke) is identified by both neurological examination and radiological examination.","when_to_set_to_false":"Set to false if the patient's history of cerebrovascular accident (stroke) is not identified by both neurological examination and radiological examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether both neurological and radiological examinations identified the stroke.","meaning":"Boolean indicating whether the patient's history of cerebrovascular accident (stroke) is identified by both neurological and radiological examination."} // "as identified by neurological examination AND radiological examination"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_cerebrovascular_accident_inthehistory@@identified_by_neurological_examination_and_radiological_examination
         patient_has_finding_of_cerebrovascular_accident_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "as identified by neurological examination AND radiological examination" implies "stroke in history"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_cerebrovascular_accident_inthehistory@@identified_by_neurological_examination_and_radiological_examination
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must have had a stroke (as identified by neurological examination AND radiological examination)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_oropharyngeal_dysphagia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of oropharyngeal dysphagia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of oropharyngeal dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has oropharyngeal dysphagia.","meaning":"Boolean indicating whether the patient currently has oropharyngeal dysphagia."} // "must have oropharyngeal dysphagia"
(declare-const patient_has_finding_of_oropharyngeal_dysphagia_now@@confirmed_by_clinical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's oropharyngeal dysphagia is confirmed by clinical examination.","when_to_set_to_false":"Set to false if the patient's oropharyngeal dysphagia is not confirmed by clinical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether clinical examination confirms oropharyngeal dysphagia.","meaning":"Boolean indicating whether the patient's oropharyngeal dysphagia is confirmed by clinical examination."} // "as confirmed by clinical examination"
(declare-const patient_has_finding_of_oropharyngeal_dysphagia_now@@confirmed_by_radiological_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's oropharyngeal dysphagia is confirmed by radiological examination.","when_to_set_to_false":"Set to false if the patient's oropharyngeal dysphagia is not confirmed by radiological examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether radiological examination confirms oropharyngeal dysphagia.","meaning":"Boolean indicating whether the patient's oropharyngeal dysphagia is confirmed by radiological examination."} // "as confirmed by radiological examination"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_oropharyngeal_dysphagia_now@@confirmed_by_clinical_examination
         patient_has_finding_of_oropharyngeal_dysphagia_now)
     :named REQ1_AUXILIARY0)) ;; "as confirmed by clinical examination"

(assert
  (! (=> patient_has_finding_of_oropharyngeal_dysphagia_now@@confirmed_by_radiological_examination
         patient_has_finding_of_oropharyngeal_dysphagia_now)
     :named REQ1_AUXILIARY1)) ;; "as confirmed by radiological examination"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have oropharyngeal dysphagia confirmed by BOTH clinical AND radiological examination
(assert
  (! (and patient_has_finding_of_oropharyngeal_dysphagia_now@@confirmed_by_clinical_examination
          patient_has_finding_of_oropharyngeal_dysphagia_now@@confirmed_by_radiological_examination)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "as confirmed by clinical examination AND radiological examination"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_oropharyngeal_dysphagia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had oropharyngeal dysphagia at any time in the past, regardless of how it was reported.","when_to_set_to_false":"Set to false if the patient has never had oropharyngeal dysphagia at any time in the past, regardless of how it was reported.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had oropharyngeal dysphagia in the past.","meaning":"Boolean indicating whether the patient has ever had oropharyngeal dysphagia in the past."} // "prior history of oropharyngeal dysphagia"
(declare-const patient_has_finding_of_oropharyngeal_dysphagia_inthehistory@@reported_by_patient Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of oropharyngeal dysphagia is reported by the patient.","when_to_set_to_false":"Set to false if the patient's history of oropharyngeal dysphagia is not reported by the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history is reported by the patient.","meaning":"Boolean indicating whether the patient's history of oropharyngeal dysphagia is reported by the patient."} // "by patient report"
(declare-const patient_has_finding_of_oropharyngeal_dysphagia_inthehistory@@reported_by_caregiver Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of oropharyngeal dysphagia is reported by a caregiver.","when_to_set_to_false":"Set to false if the patient's history of oropharyngeal dysphagia is not reported by a caregiver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the history is reported by a caregiver.","meaning":"Boolean indicating whether the patient's history of oropharyngeal dysphagia is reported by a caregiver."} // "by caregiver report"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply the stem variable (if reported by patient or caregiver, then history exists)
(assert
  (! (=> patient_has_finding_of_oropharyngeal_dysphagia_inthehistory@@reported_by_patient
         patient_has_finding_of_oropharyngeal_dysphagia_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "by patient report"

(assert
  (! (=> patient_has_finding_of_oropharyngeal_dysphagia_inthehistory@@reported_by_caregiver
         patient_has_finding_of_oropharyngeal_dysphagia_inthehistory)
     :named REQ2_AUXILIARY1)) ;; "by caregiver report"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must NOT have prior history of oropharyngeal dysphagia by patient report OR caregiver report.
(assert
  (! (not (or patient_has_finding_of_oropharyngeal_dysphagia_inthehistory@@reported_by_patient
              patient_has_finding_of_oropharyngeal_dysphagia_inthehistory@@reported_by_caregiver))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT have prior history of oropharyngeal dysphagia (by patient report OR caregiver report)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_operative_procedure_on_head_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an operative procedure on the head at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone an operative procedure on the head.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an operative procedure on the head.","meaning":"Boolean indicating whether the patient has ever undergone an operative procedure on the head."} // "previous head surgery"
(declare-const patient_has_undergone_operation_on_neck_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an operative procedure on the neck at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone an operative procedure on the neck.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an operative procedure on the neck.","meaning":"Boolean indicating whether the patient has ever undergone an operative procedure on the neck."} // "previous neck surgery"
(declare-const patient_has_finding_of_injury_of_head_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an injury of the head at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had an injury of the head.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an injury of the head.","meaning":"Boolean indicating whether the patient has ever had an injury of the head."} // "previous head trauma"
(declare-const patient_has_finding_of_injury_of_neck_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an injury of the neck at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had an injury of the neck.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an injury of the neck.","meaning":"Boolean indicating whether the patient has ever had an injury of the neck."} // "previous neck trauma"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must NOT have had previous head surgery (that may impact swallowing ability)
;; The patient must NOT have had previous neck surgery (that may impact swallowing ability)
;; The patient must NOT have had previous head trauma (that may impact swallowing ability)
;; The patient must NOT have had previous neck trauma (that may impact swallowing ability)
(assert
  (! (and (not patient_has_undergone_operative_procedure_on_head_inthehistory)
          (not patient_has_undergone_operation_on_neck_inthehistory)
          (not patient_has_finding_of_injury_of_head_inthehistory)
          (not patient_has_finding_of_injury_of_neck_inthehistory))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have had previous head surgery (that may impact swallowing ability) AND NOT have had previous neck surgery (that may impact swallowing ability) AND NOT have had previous head trauma (that may impact swallowing ability) AND NOT have had previous neck trauma (that may impact swallowing ability)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_disorder_of_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the nervous system.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the nervous system.","meaning":"Boolean indicating whether the patient currently has a disorder of the nervous system."} // "neurological disorder"
(declare-const patient_has_finding_of_disorder_of_nervous_system_now@@impacts_oropharyngeal_swallowing_ability Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the nervous system would impact oropharyngeal swallowing ability.","when_to_set_to_false":"Set to false if the patient's current disorder of the nervous system would not impact oropharyngeal swallowing ability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder would impact oropharyngeal swallowing ability.","meaning":"Boolean indicating whether the patient's current disorder of the nervous system would impact oropharyngeal swallowing ability."} // "that would impact oropharyngeal swallowing ability"
(declare-const patient_has_finding_of_disorder_of_nervous_system_now@@excludes_post_stroke_deficits Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the nervous system excludes post-stroke deficits.","when_to_set_to_false":"Set to false if the patient's current disorder of the nervous system includes post-stroke deficits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether post-stroke deficits are excluded.","meaning":"Boolean indicating whether the patient's current disorder of the nervous system excludes post-stroke deficits."} // "this does NOT include post-stroke deficits"
(declare-const patient_has_finding_of_parkinson_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has Parkinson's disease.","when_to_set_to_false":"Set to false if the patient currently does not have Parkinson's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has Parkinson's disease.","meaning":"Boolean indicating whether the patient currently has Parkinson's disease."} // "Parkinson's disease (example of concomitant neurological disorder)"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive example: Parkinson's disease is a type of disorder of nervous system
(assert
  (! (=> patient_has_finding_of_parkinson_s_disease_now
         patient_has_finding_of_disorder_of_nervous_system_now)
     :named REQ4_AUXILIARY0)) ;; "Parkinson's disease" is a non-exhaustive example of concomitant neurological disorder

;; If a disorder of nervous system is said to impact oropharyngeal swallowing ability and excludes post-stroke deficits, then it must be a disorder of nervous system
(assert
  (! (=> (and patient_has_finding_of_disorder_of_nervous_system_now@@impacts_oropharyngeal_swallowing_ability
              patient_has_finding_of_disorder_of_nervous_system_now@@excludes_post_stroke_deficits)
         patient_has_finding_of_disorder_of_nervous_system_now)
     :named REQ4_AUXILIARY1)) ;; qualifier variables imply stem variable

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient must NOT have any other neurological disorder (that would impact oropharyngeal swallowing ability) AND NOT have concomitant neurological disorder (e.g., Parkinson's disease) (that would impact oropharyngeal swallowing ability), excluding post-stroke deficits.
(assert
  (! (not (and patient_has_finding_of_disorder_of_nervous_system_now@@impacts_oropharyngeal_swallowing_ability
               patient_has_finding_of_disorder_of_nervous_system_now@@excludes_post_stroke_deficits))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must NOT have other neurological disorder (that would impact oropharyngeal swallowing ability) (this does NOT include post-stroke deficits)"

;; ===================== Declarations for the inclusion criterion (REQ 5) =====================
(declare-const physician_agreement_to_participate Bool) ;; {"when_to_set_to_true":"Set to true if a physician has agreed to the patient's participation.","when_to_set_to_false":"Set to false if a physician has not agreed to the patient's participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a physician has agreed to the patient's participation.","meaning":"Boolean indicating whether a physician has agreed to the patient's participation."} // "the patient must have physician agreement to participate"
(declare-const patient_agreement_to_participate Bool) ;; {"when_to_set_to_true":"Set to true if the patient has agreed to participate.","when_to_set_to_false":"Set to false if the patient has not agreed to participate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has agreed to participate.","meaning":"Boolean indicating whether the patient has agreed to participate."} // "the patient must have patient agreement to participate"
(declare-const family_agreement_to_participate Bool) ;; {"when_to_set_to_true":"Set to true if the patient's family has agreed to the patient's participation.","when_to_set_to_false":"Set to false if the patient's family has not agreed to the patient's participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's family has agreed to the patient's participation.","meaning":"Boolean indicating whether the patient's family has agreed to the patient's participation."} // "the patient must have family agreement to participate"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: "the patient must have physician agreement"
(assert
  (! physician_agreement_to_participate
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have physician agreement to participate"

;; Component 1: "the patient must have (patient agreement OR family agreement) to participate"
(assert
  (! (or patient_agreement_to_participate family_agreement_to_participate)
     :named REQ5_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have (patient agreement OR family agreement) to participate"
