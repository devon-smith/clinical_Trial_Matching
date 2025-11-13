;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_chronic_renal_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic renal failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic renal failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic renal failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic renal failure."} ;; "chronic renal failure"
(declare-const patient_is_undergoing_dialysis_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing dialysis treatment.","when_to_set_to_false":"Set to false if the patient is currently not undergoing dialysis treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing dialysis treatment.","meaning":"Boolean indicating whether the patient is currently undergoing dialysis treatment."} ;; "already receiving dialysis treatment"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (and patient_has_diagnosis_of_chronic_renal_failure_now
               patient_is_undergoing_dialysis_procedure_now))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic renal failure AND the patient is already receiving dialysis treatment."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_acute_coronary_syndrome_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of acute coronary syndrome within the past twelve months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of acute coronary syndrome within the past twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of acute coronary syndrome within the past twelve months.","meaning":"Boolean indicating whether the patient has had a diagnosis of acute coronary syndrome within the past twelve months."} ;; "acute coronary syndrome within the past twelve months"

(declare-const new_york_heart_association_classification_value_recorded_past12months_withunit_integer Real) ;; {"when_to_set_to_value":"Set to the most recent NYHA classification value (as an integer 1–4) recorded for the patient within the past twelve months.","when_to_set_to_null":"Set to null if the NYHA classification value within the past twelve months is unknown, not documented, or cannot be determined.","meaning":"Numeric variable indicating the most recent NYHA classification value recorded for the patient within the past twelve months, as an integer (unitless NYHA class I–IV, represented as 1–4)."} ;; "New York Heart Association classification greater than three"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (and patient_has_diagnosis_of_acute_coronary_syndrome_inthepast12months
               (> new_york_heart_association_classification_value_recorded_past12months_withunit_integer 3)))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had acute coronary syndrome within the past twelve months) AND (the patient has New York Heart Association classification greater than three)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_can_undergo_resuscitation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently judged to be subject to resuscitative measures (i.e., eligible for resuscitation).","when_to_set_to_false":"Set to false if the patient is currently judged not to be subject to resuscitative measures (i.e., not eligible for resuscitation).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently subject to resuscitative measures.","meaning":"Boolean indicating whether the patient can currently undergo resuscitation."} ;; "resuscitative measures"
(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has comorbid conditions.","when_to_set_to_false":"Set to false if the patient currently does not have comorbid conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has comorbid conditions.","meaning":"Boolean indicating whether the patient currently has comorbid conditions."} ;; "comorbidity"
(declare-const patient_has_finding_of_severity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently judged to have a severe condition at the time of admission.","when_to_set_to_false":"Set to false if the patient is currently judged not to have a severe condition at the time of admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently judged to have a severe condition at the time of admission.","meaning":"Boolean indicating whether the patient currently has a finding of severity at the time of admission."} ;; "severity"

;; ===================== Constraint Assertions (REQ 2) =====================
;; "A patient is excluded if the patient is judged at admission not to be subject to resuscitative measures due to severity and comorbidity."
(assert
(! (not (and (not patient_can_undergo_resuscitation_now)
             patient_has_finding_of_severity_now
             patient_has_finding_of_co_morbid_conditions_now))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bleeding.","meaning":"Boolean indicating whether the patient currently has bleeding."} ;; "hemorrhage"

(declare-const patient_has_finding_of_bleeding_now@@massive Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bleeding is massive.","when_to_set_to_false":"Set to false if the patient's current bleeding is not massive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bleeding is massive.","meaning":"Boolean indicating whether the patient's current bleeding is massive."} ;; "massive hemorrhage"

(declare-const patient_has_finding_of_bleeding_now@@located_in_operating_room Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bleeding is located in the operating room.","when_to_set_to_false":"Set to false if the patient's current bleeding is not located in the operating room.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bleeding is located in the operating room.","meaning":"Boolean indicating whether the patient's current bleeding is located in the operating room."} ;; "in the operating room"

(declare-const patient_has_finding_of_bleeding_now@@occurs_in_immediate_perioperative_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bleeding occurs in the immediate perioperative period.","when_to_set_to_false":"Set to false if the patient's current bleeding does not occur in the immediate perioperative period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bleeding occurs in the immediate perioperative period.","meaning":"Boolean indicating whether the patient's current bleeding occurs in the immediate perioperative period."} ;; "in the immediate perioperative period"

(declare-const patient_has_undergone_transfusion_of_blood_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone transfusion of blood products now.","when_to_set_to_false":"Set to false if the patient has not undergone transfusion of blood products now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone transfusion of blood products now.","meaning":"Boolean indicating whether the patient has undergone transfusion of blood products now."} ;; "need for blood transfusions"

(declare-const patient_packed_red_blood_cells_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the number of units of packed red blood cells (erythrocyte concentrates) the patient has received now.","when_to_set_to_null":"Set to null if the number of units received now is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of units of packed red blood cells (erythrocyte concentrates) the patient has received now."} ;; "abundant blood products greater than five units of erythrocyte concentrates"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_bleeding_now@@massive
       patient_has_finding_of_bleeding_now)
   :named REQ3_AUXILIARY0)) ;; "massive hemorrhage"

(assert
(! (=> patient_has_finding_of_bleeding_now@@located_in_operating_room
       patient_has_finding_of_bleeding_now)
   :named REQ3_AUXILIARY1)) ;; "in the operating room"

(assert
(! (=> patient_has_finding_of_bleeding_now@@occurs_in_immediate_perioperative_period
       patient_has_finding_of_bleeding_now)
   :named REQ3_AUXILIARY2)) ;; "in the immediate perioperative period"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion 1: massive hemorrhage in the operating room
(assert
(! (not (and patient_has_finding_of_bleeding_now@@massive
             patient_has_finding_of_bleeding_now@@located_in_operating_room))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has massive hemorrhage in the operating room."

;; Exclusion 2: massive hemorrhage in the immediate perioperative period AND need for blood transfusions AND abundant blood products > 5 units
(assert
(! (not (and patient_has_finding_of_bleeding_now@@massive
             patient_has_finding_of_bleeding_now@@occurs_in_immediate_perioperative_period
             patient_has_undergone_transfusion_of_blood_product_now
             (> patient_packed_red_blood_cells_value_recorded_now_withunit_unit 5)))
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has massive hemorrhage in the immediate perioperative period AND the patient has need for blood transfusions AND the patient has need for abundant blood products greater than five units of erythrocyte concentrates."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_will_undergo_orthotopic_liver_transplant_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo an orthotopic liver transplantation at any point in the future.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo an orthotopic liver transplantation at any point in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled to undergo an orthotopic liver transplantation in the future.","meaning":"Boolean indicating whether the patient is scheduled to undergo an orthotopic liver transplantation in the future."} ;; "scheduled for orthotopic liver transplantation"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_will_undergo_orthotopic_liver_transplant_inthefuture)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is scheduled for orthotopic liver transplantation."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "younger than eighteen years old"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than eighteen years old."
