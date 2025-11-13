;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_signed_informed_consent_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed the informed consent form.","when_to_set_to_false":"Set to false if the patient has not signed the informed consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed the informed consent form.","meaning":"Boolean indicating whether the patient has signed the informed consent form."}  ;; "To be included, the patient must sign the informed consent form."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_signed_informed_consent_form
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must sign the informed consent form."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_presented_at_hospital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently presenting at a hospital.","when_to_set_to_false":"Set to false if the patient is currently not presenting at a hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently presenting at a hospital.","meaning":"Boolean indicating whether the patient is currently presenting at a hospital."}  ;; "present at a hospital"
(declare-const patient_presented_at_clinic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently presenting at a clinic.","when_to_set_to_false":"Set to false if the patient is currently not presenting at a clinic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently presenting at a clinic.","meaning":"Boolean indicating whether the patient is currently presenting at a clinic."}  ;; "present at a clinic"
(declare-const patient_presented_at_physicians_office_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently presenting at a physician's office.","when_to_set_to_false":"Set to false if the patient is currently not presenting at a physician's office.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently presenting at a physician's office.","meaning":"Boolean indicating whether the patient is currently presenting at a physician's office."}  ;; "present at a physician's office"
(declare-const patient_has_clinical_signs_of_respiratory_tract_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical signs of a respiratory tract infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical signs of a respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical signs of a respiratory tract infection.","meaning":"Boolean indicating whether the patient currently has the clinical signs of a respiratory tract infection."}  ;; "have the signs of a respiratory tract infection"
(declare-const patient_has_symptoms_of_respiratory_tract_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the symptoms of a respiratory tract infection.","when_to_set_to_false":"Set to false if the patient currently does not have the symptoms of a respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the symptoms of a respiratory tract infection.","meaning":"Boolean indicating whether the patient currently has the symptoms of a respiratory tract infection."}  ;; "have the symptoms of a respiratory tract infection"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must present at a hospital OR clinic OR physician's office
(assert
  (! (or patient_presented_at_hospital_now
         patient_presented_at_clinic_now
         patient_presented_at_physicians_office_now)
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "present at a hospital OR present at a clinic OR present at a physician's office"

;; Component 1: Patient must have the signs of a respiratory tract infection
(assert
  (! patient_has_clinical_signs_of_respiratory_tract_infection_now
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have the signs of a respiratory tract infection"

;; Component 2: Patient must have the symptoms of a respiratory tract infection
(assert
  (! patient_has_symptoms_of_respiratory_tract_infection_now
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "have the symptoms of a respiratory tract infection"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_acute_respiratory_infections_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute respiratory infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute respiratory infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute respiratory infection.","meaning":"Boolean indicating whether the patient currently has an acute respiratory infection."}  ;; "the patient must have an acute respiratory infection"
(declare-const patient_has_finding_of_acute_respiratory_infections_now@@suspected_of_being_caused_by_influenza_virus Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current acute respiratory infection is suspected of being caused by an influenza virus.","when_to_set_to_false":"Set to false if the patient's current acute respiratory infection is not suspected of being caused by an influenza virus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current acute respiratory infection is suspected of being caused by an influenza virus.","meaning":"Boolean indicating whether the patient's current acute respiratory infection is suspected of being caused by an influenza virus."}  ;; "the acute respiratory infection is suspected of being caused by an influenza virus"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the stem variable (definition of qualifier)
(assert
  (! (=> patient_has_finding_of_acute_respiratory_infections_now@@suspected_of_being_caused_by_influenza_virus
         patient_has_finding_of_acute_respiratory_infections_now)
     :named REQ2_AUXILIARY0)) ;; "the acute respiratory infection is suspected of being caused by an influenza virus" ⇒ "the patient must have an acute respiratory infection"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: The patient must have an acute respiratory infection.
(assert
  (! patient_has_finding_of_acute_respiratory_infections_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have an acute respiratory infection"

;; Component 1: The acute respiratory infection is suspected of being caused by an influenza virus.
(assert
  (! patient_has_finding_of_acute_respiratory_infections_now@@suspected_of_being_caused_by_influenza_virus
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the acute respiratory infection is suspected of being caused by an influenza virus"
