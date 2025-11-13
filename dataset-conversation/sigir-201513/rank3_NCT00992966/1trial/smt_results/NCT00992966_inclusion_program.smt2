;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const parent_is_able_and_willing_to_read_and_understand_informed_consent_form_and_provides_written_informed_consent_for_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if a parent is currently able and willing to read the informed consent form, understands the informed consent form, and provides written informed consent for the patient.","when_to_set_to_false":"Set to false if a parent is currently not able and/or not willing to read the informed consent form, does not understand the informed consent form, or does not provide written informed consent for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a parent is able and willing to read and understand the informed consent form and provides written informed consent for the patient.","meaning":"Boolean indicating whether a parent is currently able and willing to read and understand the informed consent form and provides written informed consent for the patient."} ;; "a parent who is able AND willing to read the informed consent form AND who understands the informed consent form AND who provides written informed consent for the patient"
(declare-const legal_guardian_is_able_and_willing_to_read_and_understand_informed_consent_form_and_provides_written_informed_consent_for_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if a legal guardian is currently able and willing to read the informed consent form, understands the informed consent form, and provides written informed consent for the patient.","when_to_set_to_false":"Set to false if a legal guardian is currently not able and/or not willing to read the informed consent form, does not understand the informed consent form, or does not provide written informed consent for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a legal guardian is able and willing to read and understand the informed consent form and provides written informed consent for the patient.","meaning":"Boolean indicating whether a legal guardian is currently able and willing to read and understand the informed consent form and provides written informed consent for the patient."} ;; "a legal guardian who is able AND willing to read the informed consent form AND who understands the informed consent form AND who provides written informed consent for the patient"
(declare-const legal_guardian_provides_written_informed_consent_for_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the legal guardian currently provides written informed consent for the patient.","when_to_set_to_false":"Set to false if the legal guardian currently does not provide written informed consent for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the legal guardian currently provides written informed consent for the patient.","meaning":"Boolean indicating whether the legal guardian currently provides written informed consent for the patient."} ;; "legal guardian ... provides written informed consent for the patient"
(declare-const minor_child_is_able_to_give_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient (minor child) is currently able to give consent.","when_to_set_to_false":"Set to false if the patient (minor child) is currently not able to give consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient (minor child) is able to give consent.","meaning":"Boolean indicating whether the patient (minor child) is currently able to give consent."} ;; "if the patient (minor child) is able to give consent"
(declare-const minor_child_provides_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient (minor child) currently provides written informed consent.","when_to_set_to_false":"Set to false if the patient (minor child) currently does not provide written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient (minor child) currently provides written informed consent.","meaning":"Boolean indicating whether the patient (minor child) currently provides written informed consent."} ;; "the patient must provide written informed consent"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "if the patient (minor child) is able to give consent"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; No additional auxiliary assertions are required, as all logic is directly encoded in the constraint assertions.

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must have (a parent OR a legal guardian) (who is able AND willing to read the informed consent form AND who understands the informed consent form AND who provides written informed consent for the patient).
(assert
  (! (or parent_is_able_and_willing_to_read_and_understand_informed_consent_form_and_provides_written_informed_consent_for_patient_now
         legal_guardian_is_able_and_willing_to_read_and_understand_informed_consent_form_and_provides_written_informed_consent_for_patient_now)
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have (a parent OR a legal guardian) (who is able AND willing to read the informed consent form AND who understands the informed consent form AND who provides written informed consent for the patient)"

;; Component 1: If the patient (minor child) is able to give consent, the patient must provide written informed consent in addition to the written informed consent of the legal guardian of the patient.
(assert
  (! (or (not minor_child_is_able_to_give_consent_now)
         (and minor_child_provides_written_informed_consent_now
              legal_guardian_provides_written_informed_consent_for_patient_now))
     :named REQ0_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient (minor child) is able to give consent, the patient must provide written informed consent in addition to the written informed consent of the legal guardian of the patient"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is female.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not female.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current recorded sex is female."} ;; "the patient must be (a boy OR a girl)"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is male.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not male.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current recorded sex is male."} ;; "the patient must be (a boy OR a girl)"
;; patient_age_value_recorded_now_in_years is already declared and reusable

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: The patient must be (a boy OR a girl)
(assert
  (! (or patient_sex_is_female_now patient_sex_is_male_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be (a boy OR a girl)"

;; Component 1: The patient must be (aged ≥ 3 years AND ≤ 18 years)
(assert
  (! (and (>= patient_age_value_recorded_now_in_years 3)
          (<= patient_age_value_recorded_now_in_years 18))
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be (aged ≥ 3 years AND ≤ 18 years)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_acute_respiratory_complaints_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute respiratory complaints.","when_to_set_to_false":"Set to false if the patient currently does not have acute respiratory complaints.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute respiratory complaints.","meaning":"Boolean indicating whether the patient currently has acute respiratory complaints."} ;; "acute respiratory complaints"
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cough.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cough.","meaning":"Boolean indicating whether the patient currently has cough."} ;; "cough"
(declare-const patient_has_finding_of_cough_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cough is acute.","when_to_set_to_false":"Set to false if the patient's current cough is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cough is acute.","meaning":"Boolean indicating whether the patient's current cough is acute."} ;; "acute cough"
(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of shortness of breath.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of shortness of breath.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of shortness of breath.","meaning":"Boolean indicating whether the patient currently has shortness of breath."} ;; "shortness of breath"
(declare-const patient_has_finding_of_dyspnea_now@@onset Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current shortness of breath is of onset (newly developed or acute).","when_to_set_to_false":"Set to false if the patient's current shortness of breath is not of onset.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current shortness of breath is of onset.","meaning":"Boolean indicating whether the patient's current shortness of breath is of onset."} ;; "onset of shortness of breath"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of fever.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of fever.","meaning":"Boolean indicating whether the patient currently has fever."} ;; "fever"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_cough_now@@acute
         patient_has_finding_of_cough_now)
     :named REQ2_AUXILIARY0)) ;; "acute cough" implies "cough"

(assert
  (! (=> patient_has_finding_of_dyspnea_now@@onset
         patient_has_finding_of_dyspnea_now)
     :named REQ2_AUXILIARY1)) ;; "onset of shortness of breath" implies "shortness of breath"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must have presented with (acute respiratory complaints OR acute cough OR onset of shortness of breath OR fever).
(assert
  (! (or patient_has_finding_of_acute_respiratory_complaints_now
         patient_has_finding_of_cough_now@@acute
         patient_has_finding_of_dyspnea_now@@onset
         patient_has_finding_of_fever_now)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have presented with (acute respiratory complaints OR acute cough OR onset of shortness of breath OR fever)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_been_referred_by_emergency_department_physician Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been referred by an emergency department physician.","when_to_set_to_false":"Set to false if the patient has not been referred by an emergency department physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been referred by an emergency department physician.","meaning":"Boolean indicating whether the patient has been referred by an emergency department physician."} ;; "the patient must have been referred by an emergency department physician"
(declare-const patient_has_presented_for_chest_x_ray Bool) ;; {"when_to_set_to_true":"Set to true if the patient has presented for a chest x-ray.","when_to_set_to_false":"Set to false if the patient has not presented for a chest x-ray.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has presented for a chest x-ray.","meaning":"Boolean indicating whether the patient has presented for a chest x-ray."} ;; "the patient must have presented for chest x-ray"
(declare-const patient_has_undergone_plain_chest_x_ray_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a plain chest x-ray at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a plain chest x-ray in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a plain chest x-ray in their history.","meaning":"Boolean indicating whether the patient has undergone a plain chest x-ray at any time in their history."} ;; "chest x-ray"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: The patient must have been referred by an emergency department physician.
(assert
  (! patient_has_been_referred_by_emergency_department_physician
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have been referred by an emergency department physician"

;; Component 1: The patient must have presented for chest x-ray.
(assert
  (! patient_has_presented_for_chest_x_ray
     :named REQ3_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have presented for chest x-ray"
