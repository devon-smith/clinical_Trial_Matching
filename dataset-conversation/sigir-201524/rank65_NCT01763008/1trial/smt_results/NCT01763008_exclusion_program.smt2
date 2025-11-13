;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not lactating as documented or reported.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
(assert
  (! (not patient_is_lactating_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_hypersensitivity_to_doripenem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to doripenem.","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to doripenem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to doripenem.","meaning":"Boolean indicating whether the patient currently has hypersensitivity to doripenem."} ;; "the patient has hypersensitivity to doripenem"
(declare-const patient_has_finding_of_hypersensitivity_to_derivatives_of_doripenem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to derivatives of doripenem.","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to derivatives of doripenem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to derivatives of doripenem.","meaning":"Boolean indicating whether the patient currently has hypersensitivity to derivatives of doripenem."} ;; "the patient has hypersensitivity to derivatives of doripenem"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (or patient_has_finding_of_hypersensitivity_to_doripenem_now
              patient_has_finding_of_hypersensitivity_to_derivatives_of_doripenem_now))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has hypersensitivity to doripenem) OR (the patient has hypersensitivity to derivatives of doripenem)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is known at study entry to currently have a disorder due to infection.","when_to_set_to_false":"Set to false if the patient is known at study entry to not currently have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is known at study entry to currently have a disorder due to infection.","meaning":"Boolean indicating whether the patient is known at study entry to currently have a disorder due to infection."} ;; "infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@caused_by_pathogen_resistant_to_doripenem Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection and the infection is caused by a pathogen resistant to doripenem.","when_to_set_to_false":"Set to false if the patient currently has a disorder due to infection but the infection is not caused by a pathogen resistant to doripenem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is caused by a pathogen resistant to doripenem.","meaning":"Boolean indicating whether the patient's current infection is caused by a pathogen resistant to doripenem."} ;; "infection caused by pathogen resistant to doripenem"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@caused_by_pathogens_resistant_to_doripenem Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection and the infection is caused by pathogens resistant to doripenem.","when_to_set_to_false":"Set to false if the patient currently has a disorder due to infection but the infection is not caused by pathogens resistant to doripenem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is caused by pathogens resistant to doripenem.","meaning":"Boolean indicating whether the patient's current infection is caused by pathogens resistant to doripenem."} ;; "infection caused by pathogens resistant to doripenem"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@caused_by_pathogen_resistant_to_doripenem
       patient_has_finding_of_disorder_due_to_infection_now)
   :named REQ2_AUXILIARY0)) ;; "infection caused by pathogen resistant to doripenem"

(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@caused_by_pathogens_resistant_to_doripenem
       patient_has_finding_of_disorder_due_to_infection_now)
   :named REQ2_AUXILIARY1)) ;; "infection caused by pathogens resistant to doripenem"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_disorder_due_to_infection_now@@caused_by_pathogen_resistant_to_doripenem)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is known at study entry to have an infection caused by pathogen resistant to doripenem."

(assert
(! (not patient_has_finding_of_disorder_due_to_infection_now@@caused_by_pathogens_resistant_to_doripenem)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is known at study entry to have an infection caused by pathogens resistant to doripenem."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_taking_probenecid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking probenecid.","when_to_set_to_false":"Set to false if the patient is currently not taking probenecid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking probenecid.","meaning":"Boolean indicating whether the patient is currently taking probenecid."} ;; "probenecid"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_taking_probenecid_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking probenecid."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_allergy_to_penicillin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergy to penicillin at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had an allergy to penicillin at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergy to penicillin.","meaning":"Boolean indicating whether the patient has ever had an allergy to penicillin."} ;; "penicillins"
(declare-const patient_has_allergy_to_penicillin_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to penicillin in history is severe.","when_to_set_to_false":"Set to false if the patient's allergy to penicillin in history is not severe.","when_to_set_to_null":"Set to null if severity of the allergy to penicillin in history is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's allergy to penicillin in history is severe."} ;; "severe allergy to penicillins"
(declare-const patient_has_allergy_to_cephalosporin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergy to cephalosporin at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had an allergy to cephalosporin at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergy to cephalosporin.","meaning":"Boolean indicating whether the patient has ever had an allergy to cephalosporin."} ;; "cephalosporins"
(declare-const patient_has_allergy_to_cephalosporin_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to cephalosporin in history is severe.","when_to_set_to_false":"Set to false if the patient's allergy to cephalosporin in history is not severe.","when_to_set_to_null":"Set to null if severity of the allergy to cephalosporin in history is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's allergy to cephalosporin in history is severe."} ;; "severe allergy to cephalosporins"
(declare-const patient_has_allergy_to_carbapenem_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergy to carbapenem at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had an allergy to carbapenem at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergy to carbapenem.","meaning":"Boolean indicating whether the patient has ever had an allergy to carbapenem."} ;; "carbapenems"
(declare-const patient_has_allergy_to_carbapenem_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to carbapenem in history is severe.","when_to_set_to_false":"Set to false if the patient's allergy to carbapenem in history is not severe.","when_to_set_to_null":"Set to null if severity of the allergy to carbapenem in history is unknown or indeterminate.","meaning":"Boolean indicating whether the patient's allergy to carbapenem in history is severe."} ;; "severe allergy to carbapenems"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_allergy_to_penicillin_inthehistory@@severe
      patient_has_allergy_to_penicillin_inthehistory)
:named REQ4_AUXILIARY0)) ;; "severe allergy to penicillins"

(assert
(! (=> patient_has_allergy_to_cephalosporin_inthehistory@@severe
      patient_has_allergy_to_cephalosporin_inthehistory)
:named REQ4_AUXILIARY1)) ;; "severe allergy to cephalosporins"

(assert
(! (=> patient_has_allergy_to_carbapenem_inthehistory@@severe
      patient_has_allergy_to_carbapenem_inthehistory)
:named REQ4_AUXILIARY2)) ;; "severe allergy to carbapenems"

;; Non-exhaustive examples: penicillins, cephalosporins, carbapenems are examples of antibiotics
;; (No umbrella variable for "antibiotics" is declared, so no implication needed here.)

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_allergy_to_penicillin_inthehistory@@severe)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of severe allergy to antibiotics with non-exhaustive examples (penicillins)."

(assert
(! (not patient_has_allergy_to_cephalosporin_inthehistory@@severe)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of severe allergy to antibiotics with non-exhaustive examples (cephalosporins)."

(assert
(! (not patient_has_allergy_to_carbapenem_inthehistory@@severe)
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of severe allergy to antibiotics with non-exhaustive examples (carbapenems)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_severe_impairment_of_renal_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe impairment of renal function.","when_to_set_to_false":"Set to false if the patient currently does not have severe impairment of renal function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe impairment of renal function.","meaning":"Boolean indicating whether the patient currently has severe impairment of renal function."} ;; "severe impairment of renal function"
(declare-const patient_measurement_of_renal_clearance_of_creatinine_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's calculated creatinine clearance is recorded now in milliliters per minute.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's calculated creatinine clearance measured now in milliliters per minute."} ;; "calculated creatinine clearance < 10 milliliters per minute"
(declare-const patient_is_undergoing_peritoneal_dialysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing peritoneal dialysis.","when_to_set_to_false":"Set to false if the patient is not currently undergoing peritoneal dialysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing peritoneal dialysis.","meaning":"Boolean indicating whether the patient is currently undergoing peritoneal dialysis."} ;; "requirement for peritoneal dialysis"
(declare-const patient_is_undergoing_hemodialysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing hemodialysis.","when_to_set_to_false":"Set to false if the patient is not currently undergoing hemodialysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing hemodialysis.","meaning":"Boolean indicating whether the patient is currently undergoing hemodialysis."} ;; "requirement for hemodialysis"
(declare-const patient_is_undergoing_hemofiltration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing hemofiltration.","when_to_set_to_false":"Set to false if the patient is not currently undergoing hemofiltration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing hemofiltration.","meaning":"Boolean indicating whether the patient is currently undergoing hemofiltration."} ;; "requirement for hemofiltration"
(declare-const patient_has_finding_of_oliguria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of oliguria.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of oliguria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has oliguria.","meaning":"Boolean indicating whether the patient currently has oliguria."} ;; "oliguria"
(declare-const patient_measurement_of_urine_output_value_recorded_over_24_hours_withunit_milliliters_per_hour Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's urine output over 24 hours is recorded in milliliters per hour.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's urine output measured over 24 hours in milliliters per hour."} ;; "urine output < 20 milliliters per hour over 24 hours"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples imply umbrella term for severe impairment of renal function
(assert
(! (=> (or (< patient_measurement_of_renal_clearance_of_creatinine_value_recorded_now_withunit_milliliters_per_minute 10)
           patient_is_undergoing_peritoneal_dialysis_now
           patient_is_undergoing_hemodialysis_now
           patient_is_undergoing_hemofiltration_now)
        patient_has_finding_of_severe_impairment_of_renal_function_now)
   :named REQ5_AUXILIARY0)) ;; "including (a calculated creatinine clearance < 10 milliliters per minute) OR (requirement for peritoneal dialysis) OR (requirement for hemodialysis) OR (requirement for hemofiltration)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_severe_impairment_of_renal_function_now)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe impairment of renal function, including (a calculated creatinine clearance < 10 milliliters per minute OR requirement for peritoneal dialysis OR requirement for hemodialysis OR requirement for hemofiltration)."

(assert
(! (not patient_has_finding_of_oliguria_now)
   :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has oliguria (urine output < 20 milliliters per hour over 24 hours)."
