;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (i.e., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} // "the patient must be male or female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (i.e., female or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is male."} // "the patient must be male or female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "18 years of age or older"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: The patient must be male or female.
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be male or female"

;; Component 1: The patient must be 18 years of age or older.
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "18 years of age or older"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} // "the patient must have provided written informed consent"
(declare-const surrogate_consent_provided_by_legally_authorized_representative Bool) ;; {"when_to_set_to_true":"Set to true if surrogate consent has been provided by a legally authorized representative.","when_to_set_to_false":"Set to false if surrogate consent has not been provided by a legally authorized representative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether surrogate consent has been provided by a legally authorized representative.","meaning":"Boolean indicating whether surrogate consent has been provided by a legally authorized representative."} // "have surrogate consent provided by a legally authorized representative"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have provided written informed consent OR have surrogate consent provided by a legally authorized representative.
(assert
  (! (or patient_has_provided_written_informed_consent
         surrogate_consent_provided_by_legally_authorized_representative)
     :named REQ1_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have provided written informed consent OR have surrogate consent provided by a legally authorized representative"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_blunt_injury_of_abdomen_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of blunt injury of the abdomen (blunt abdominal trauma).","when_to_set_to_false":"Set to false if the patient does not have a documented history of blunt injury of the abdomen (blunt abdominal trauma).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of blunt injury of the abdomen (blunt abdominal trauma).","meaning":"Boolean indicating whether the patient has ever had blunt injury of the abdomen (blunt abdominal trauma) in their history."} // "blunt abdominal trauma"
(declare-const patient_has_finding_of_penetrating_wound_of_abdomen_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of penetrating wound of the abdomen (penetrating abdominal trauma).","when_to_set_to_false":"Set to false if the patient does not have a documented history of penetrating wound of the abdomen (penetrating abdominal trauma).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of penetrating wound of the abdomen (penetrating abdominal trauma).","meaning":"Boolean indicating whether the patient has ever had penetrating wound of the abdomen (penetrating abdominal trauma) in their history."} // "penetrating abdominal trauma"
(declare-const patient_has_undergone_laparotomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of undergoing laparotomy.","when_to_set_to_false":"Set to false if the patient does not have a documented history of undergoing laparotomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone laparotomy.","meaning":"Boolean indicating whether the patient has ever undergone laparotomy in their history."} // "laparotomy"
(declare-const patient_has_undergone_laparotomy_inthehistory@@includes_primary_closure Bool) ;; {"when_to_set_to_true":"Set to true if the patient's laparotomy included primary closure.","when_to_set_to_false":"Set to false if the patient's laparotomy did not include primary closure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's laparotomy included primary closure.","meaning":"Boolean indicating whether the patient's laparotomy included primary closure."} // "primary closure"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for primary closure implies laparotomy in history
(assert
  (! (=> patient_has_undergone_laparotomy_inthehistory@@includes_primary_closure
         patient_has_undergone_laparotomy_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "laparotomy with primary closure"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have (experienced blunt abdominal trauma requiring open abdominal laparotomy with primary closure)
;; OR (experienced penetrating abdominal trauma requiring open abdominal laparotomy with primary closure)
(assert
  (! (or
        (and patient_has_finding_of_blunt_injury_of_abdomen_inthehistory
             patient_has_undergone_laparotomy_inthehistory@@includes_primary_closure)
        (and patient_has_finding_of_penetrating_wound_of_abdomen_inthehistory
             patient_has_undergone_laparotomy_inthehistory@@includes_primary_closure)
     )
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "blunt or penetrating abdominal trauma requiring open abdominal laparotomy with primary closure"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_acute_abdomen_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented finding of acute surgical abdomen at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented finding of acute surgical abdomen in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of acute surgical abdomen.","meaning":"Boolean indicating whether the patient has ever had a finding of acute surgical abdomen in their medical history."} // "acute surgical abdomen"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (and patient_has_finding_of_acute_abdomen_inthehistory
          patient_has_undergone_laparotomy_inthehistory
          patient_has_undergone_laparotomy_inthehistory@@includes_primary_closure)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have experienced acute surgical abdomen requiring open abdominal laparotomy with primary closure."
