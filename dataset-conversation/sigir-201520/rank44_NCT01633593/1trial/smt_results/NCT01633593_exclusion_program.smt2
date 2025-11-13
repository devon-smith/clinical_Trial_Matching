;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_unable_to_swallow_tablet_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of inability to swallow tablets (pills).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of inability to swallow tablets (pills).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of inability to swallow tablets (pills).","meaning":"Boolean indicating whether the patient currently has an inability to swallow tablets (pills)."} ;; "inability to swallow pills"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_unable_to_swallow_tablet_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inability to swallow pills."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_allergy_to_donepezil_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergy to donepezil.","when_to_set_to_false":"Set to false if the patient has never had an allergy to donepezil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergy to donepezil.","meaning":"Boolean indicating whether the patient has ever had an allergy to donepezil."} ;; "The patient is excluded if the patient has allergy to donepezil."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_allergy_to_donepezil_ever)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has allergy to donepezil."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_second_degree_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has atrioventricular block of second degree.","when_to_set_to_false":"Set to false if the patient currently does not have atrioventricular block of second degree.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atrioventricular block of second degree.","meaning":"Boolean indicating whether the patient currently has atrioventricular block of second degree."} ;; "atrioventricular block of second degree"
(declare-const patient_has_finding_of_complete_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has atrioventricular block of third degree (complete AV block).","when_to_set_to_false":"Set to false if the patient currently does not have atrioventricular block of third degree (complete AV block).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atrioventricular block of third degree (complete AV block).","meaning":"Boolean indicating whether the patient currently has atrioventricular block of third degree (complete AV block)."} ;; "atrioventricular block of third degree"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_second_degree_atrioventricular_block_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has atrioventricular block of second degree."

(assert
(! (not patient_has_finding_of_complete_atrioventricular_block_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has atrioventricular block of third degree."
