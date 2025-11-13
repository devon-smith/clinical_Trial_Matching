;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_esophagogastroduodenoscopy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding (such as contraindication) related to esophagogastroduodenoscopy.","when_to_set_to_false":"Set to false if the patient currently does not have any finding related to esophagogastroduodenoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding related to esophagogastroduodenoscopy.","meaning":"Boolean indicating whether the patient currently has a finding related to esophagogastroduodenoscopy."} ;; "esophagogastroduodenoscopy"
(declare-const patient_has_finding_of_esophagogastroduodenoscopy_now@@contraindication Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to esophagogastroduodenoscopy.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to esophagogastroduodenoscopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to esophagogastroduodenoscopy.","meaning":"Boolean indicating whether the patient currently has a contraindication to esophagogastroduodenoscopy."} ;; "contraindication to esophagogastroduodenoscopy"
(declare-const patient_has_finding_of_biopsy_of_esophagus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding (such as contraindication) related to biopsy of esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have any finding related to biopsy of esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding related to biopsy of esophagus.","meaning":"Boolean indicating whether the patient currently has a finding related to biopsy of esophagus."} ;; "esophageal biopsy"
(declare-const patient_has_finding_of_biopsy_of_esophagus_now@@contraindication Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to biopsy of esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to biopsy of esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to biopsy of esophagus.","meaning":"Boolean indicating whether the patient currently has a contraindication to biopsy of esophagus."} ;; "contraindication to esophageal biopsy"
(declare-const patient_has_finding_of_spontaneous_rupture_of_esophagus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of spontaneous rupture of esophagus (Boerhaave's syndrome) in their history.","when_to_set_to_false":"Set to false if the patient has never had a finding of spontaneous rupture of esophagus (Boerhaave's syndrome) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of spontaneous rupture of esophagus (Boerhaave's syndrome) in their history.","meaning":"Boolean indicating whether the patient has ever had a finding of spontaneous rupture of esophagus (Boerhaave's syndrome) in their history."} ;; "Boerhaave's syndrome"
(declare-const patient_has_finding_of_blood_coagulation_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of blood coagulation disorder (bleeding disorder) in their history.","when_to_set_to_false":"Set to false if the patient has never had a finding of blood coagulation disorder (bleeding disorder) in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of blood coagulation disorder (bleeding disorder) in their history.","meaning":"Boolean indicating whether the patient has ever had a finding of blood coagulation disorder (bleeding disorder) in their history."} ;; "bleeding disorder"
(declare-const patient_has_finding_of_inr_raised_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of raised international normalized ratio (INR).","when_to_set_to_false":"Set to false if the patient currently does not have a finding of raised international normalized ratio (INR).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of raised international normalized ratio (INR).","meaning":"Boolean indicating whether the patient currently has a finding of raised international normalized ratio (INR)."} ;; "elevated international normalized ratio"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_esophagogastroduodenoscopy_now@@contraindication
      patient_has_finding_of_esophagogastroduodenoscopy_now)
   :named REQ0_AUXILIARY0)) ;; "contraindication to esophagogastroduodenoscopy"

(assert
(! (=> patient_has_finding_of_biopsy_of_esophagus_now@@contraindication
      patient_has_finding_of_biopsy_of_esophagus_now)
   :named REQ0_AUXILIARY1)) ;; "contraindication to esophageal biopsy"

;; Non-exhaustive example: Boerhaave's syndrome implies contraindication to esophageal biopsy
(assert
(! (=> patient_has_finding_of_spontaneous_rupture_of_esophagus_inthehistory
      patient_has_finding_of_biopsy_of_esophagus_now@@contraindication)
   :named REQ0_AUXILIARY2)) ;; "with non-exhaustive examples (Boerhaave's syndrome)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_esophagogastroduodenoscopy_now@@contraindication)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to esophagogastroduodenoscopy."

(assert
(! (not patient_has_finding_of_biopsy_of_esophagus_now@@contraindication)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to esophageal biopsy with non-exhaustive examples (Boerhaave's syndrome)."

(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_inthehistory)
   :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of bleeding disorder."

(assert
(! (not patient_has_finding_of_inr_raised_now)
   :named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an elevated international normalized ratio."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_able_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide informed consent."} ;; "unable to provide informed consent"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_able_to_provide_informed_consent_now)
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to provide informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_esophageal_varices_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of esophageal varices.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of esophageal varices.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of esophageal varices.","meaning":"Boolean indicating whether the patient currently has esophageal varices."} ;; "esophageal varices"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_esophageal_varices_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has esophageal varices."
