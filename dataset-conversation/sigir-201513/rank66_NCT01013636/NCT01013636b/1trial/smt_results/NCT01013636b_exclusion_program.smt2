;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "less than ten years old"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 10))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is less than ten years old."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_diagnosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis (other than the index condition).","when_to_set_to_false":"Set to false if the patient currently does not have any other diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another diagnosis.","meaning":"Boolean indicating whether the patient currently has another diagnosis."} ;; "diagnosis"
(declare-const patient_has_diagnosis_of_diagnosis_now@@can_explain_clinical_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient's other diagnosis can explain clinical symptoms.","when_to_set_to_false":"Set to false if the patient's other diagnosis cannot explain clinical symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis can explain clinical symptoms.","meaning":"Boolean indicating whether the patient's other diagnosis can explain clinical symptoms."} ;; "the patient has another diagnosis that can explain clinical symptoms"
(declare-const patient_has_diagnosis_of_diagnosis_now@@can_explain_biological_abnormalities Bool) ;; {"when_to_set_to_true":"Set to true if the patient's other diagnosis can explain biological abnormalities.","when_to_set_to_false":"Set to false if the patient's other diagnosis cannot explain biological abnormalities.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis can explain biological abnormalities.","meaning":"Boolean indicating whether the patient's other diagnosis can explain biological abnormalities."} ;; "the patient has another diagnosis that can explain biological abnormalities"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_diagnosis_now@@can_explain_clinical_symptoms
      patient_has_diagnosis_of_diagnosis_now)
   :named REQ2_AUXILIARY0)) ;; "the patient has another diagnosis that can explain clinical symptoms"

(assert
(! (=> patient_has_diagnosis_of_diagnosis_now@@can_explain_biological_abnormalities
      patient_has_diagnosis_of_diagnosis_now)
   :named REQ2_AUXILIARY1)) ;; "the patient has another diagnosis that can explain biological abnormalities"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_diagnosis_now@@can_explain_clinical_symptoms)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another diagnosis that can explain clinical symptoms."

(assert
(! (not patient_has_diagnosis_of_diagnosis_now@@can_explain_biological_abnormalities)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another diagnosis that can explain biological abnormalities."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_antibiotic_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antibiotic therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone antibiotic therapy in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone antibiotic therapy in the past.","meaning":"Boolean indicating whether the patient has undergone antibiotic therapy at any time in the past."} ;; "antibiotic therapy"
(declare-const patient_has_undergone_antibiotic_therapy_inthehistory@@with_cyclins Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antibiotic therapy in the past and the therapy was with cyclins.","when_to_set_to_false":"Set to false if the patient has undergone antibiotic therapy in the past but not with cyclins.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibiotic therapy was with cyclins.","meaning":"Boolean indicating whether the patient's past antibiotic therapy was with cyclins."} ;; "antibiotic therapy with cyclins"
(declare-const patient_has_undergone_antibiotic_therapy_inthehistory@@temporalcontext_within_days_before_inclusion Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antibiotic therapy in the past and the therapy occurred during the days before inclusion.","when_to_set_to_false":"Set to false if the patient has undergone antibiotic therapy in the past but not during the days before inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibiotic therapy occurred during the days before inclusion.","meaning":"Boolean indicating whether the patient's past antibiotic therapy occurred during the days before inclusion."} ;; "antibiotic therapy during the days before inclusion"
(declare-const patient_has_undergone_antibiotic_therapy_inthehistory@@temporalcontext_within_days_before_inclusion@@with_cyclins Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antibiotic therapy with cyclins during the days before inclusion.","when_to_set_to_false":"Set to false if the patient has not undergone antibiotic therapy with cyclins during the days before inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone antibiotic therapy with cyclins during the days before inclusion.","meaning":"Boolean indicating whether the patient has undergone antibiotic therapy with cyclins during the days before inclusion."} ;; "antibiotic therapy with cyclins during the days before inclusion"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_antibiotic_therapy_inthehistory@@with_cyclins
      patient_has_undergone_antibiotic_therapy_inthehistory)
:named REQ3_AUXILIARY0)) ;; "antibiotic therapy with cyclins" implies "antibiotic therapy"

(assert
(! (=> patient_has_undergone_antibiotic_therapy_inthehistory@@temporalcontext_within_days_before_inclusion
      patient_has_undergone_antibiotic_therapy_inthehistory)
:named REQ3_AUXILIARY1)) ;; "antibiotic therapy during the days before inclusion" implies "antibiotic therapy"

(assert
(! (=> patient_has_undergone_antibiotic_therapy_inthehistory@@temporalcontext_within_days_before_inclusion@@with_cyclins
      (and patient_has_undergone_antibiotic_therapy_inthehistory@@with_cyclins
           patient_has_undergone_antibiotic_therapy_inthehistory@@temporalcontext_within_days_before_inclusion))
:named REQ3_AUXILIARY2)) ;; "antibiotic therapy with cyclins during the days before inclusion" implies both "antibiotic therapy with cyclins" and "antibiotic therapy during the days before inclusion"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_antibiotic_therapy_inthehistory@@temporalcontext_within_days_before_inclusion@@with_cyclins)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received antibiotic therapy with cyclins during the days before inclusion."
