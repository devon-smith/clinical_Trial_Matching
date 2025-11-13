;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_woman_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a pregnant woman.","when_to_set_to_false":"Set to false if the patient is currently not a pregnant woman.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a pregnant woman.","meaning":"Boolean indicating whether the patient is currently a pregnant woman."} ;; "The patient is excluded if the patient is a pregnant woman."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_pregnant_woman_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a pregnant woman."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_operation_on_esophagus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone any surgical procedure on the esophagus at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone any surgical procedure on the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone esophageal surgery.","meaning":"Boolean indicating whether the patient has a history of esophageal surgery."} ;; "the patient has a past history of oesophageal surgery"
(declare-const patient_has_finding_of_esophageal_varices_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding or diagnosis of esophageal varices at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a finding or diagnosis of esophageal varices.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had esophageal varices.","meaning":"Boolean indicating whether the patient has a history of esophageal varices."} ;; "the patient has a past history of oesophageal varices"
(declare-const patient_has_finding_of_stricture_of_esophagus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding or diagnosis of esophageal stricture at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a finding or diagnosis of esophageal stricture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had esophageal stricture.","meaning":"Boolean indicating whether the patient has a history of esophageal stricture."} ;; "the patient has a past history of oesophageal stricture"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_operation_on_esophagus_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a past history of oesophageal surgery."

(assert
(! (not patient_has_finding_of_esophageal_varices_inthehistory)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a past history of oesophageal varices."

(assert
(! (not patient_has_finding_of_stricture_of_esophagus_inthehistory)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a past history of oesophageal stricture."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_received_antiemetic_medication_in_past_24_hours_before_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received antiemetic medication in the twenty-four hours before surgery.","when_to_set_to_false":"Set to false if the patient has not received antiemetic medication in the twenty-four hours before surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received antiemetic medication in the twenty-four hours before surgery.","meaning":"Boolean indicating whether the patient has received antiemetic medication in the twenty-four hours before surgery."} ;; "The patient is excluded if the patient has received antiemetic medication in the twenty-four hours before surgery."

(declare-const patient_will_undergo_surgical_procedure_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo a surgical procedure in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo a surgical procedure in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to undergo a surgical procedure in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo a surgical procedure in the future."} ;; "surgery"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_received_antiemetic_medication_in_past_24_hours_before_surgery)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has received antiemetic medication in the twenty-four hours before surgery."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_undergoing_emergency_operation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing an emergency operation.","when_to_set_to_false":"Set to false if the patient is not currently undergoing an emergency operation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing an emergency operation.","meaning":"Boolean indicating whether the patient is currently undergoing an emergency operation."} ;; "emergency surgery"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_undergoing_emergency_operation_now)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is undergoing emergency surgery."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_motion_sickness_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of motion sickness at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of motion sickness at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of motion sickness.","meaning":"Boolean indicating whether the patient has ever had motion sickness in their history."} ;; "the patient has a prior history of motion sickness"

(declare-const patient_has_finding_of_postoperative_nausea_and_vomiting_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of postoperative nausea and vomiting at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of postoperative nausea and vomiting at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of postoperative nausea and vomiting.","meaning":"Boolean indicating whether the patient has ever had postoperative nausea and vomiting in their history."} ;; "the patient has a prior history of postoperative nausea and vomiting (PONV)"

(declare-const patient_has_finding_of_vertigo_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of vertigo at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of vertigo at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of vertigo.","meaning":"Boolean indicating whether the patient has ever had vertigo in their history."} ;; "the patient has a prior history of vertigo"

(declare-const patient_has_finding_of_migraine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of migraine at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of migraine at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of migraine.","meaning":"Boolean indicating whether the patient has ever had migraine in their history."} ;; "the patient has a prior history of migraine headaches"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_motion_sickness_inthehistory)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior history of motion sickness."

(assert
(! (not patient_has_finding_of_postoperative_nausea_and_vomiting_inthehistory)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior history of postoperative nausea and vomiting (PONV)."

(assert
(! (not patient_has_finding_of_vertigo_inthehistory)
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior history of vertigo."

(assert
(! (not patient_has_finding_of_migraine_inthehistory)
:named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior history of migraine headaches."
