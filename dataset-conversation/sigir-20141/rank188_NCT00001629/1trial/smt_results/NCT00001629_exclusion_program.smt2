;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_preinfarction_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of unstable angina pectoris (preinfarction syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of unstable angina pectoris (preinfarction syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable angina pectoris (preinfarction syndrome).","meaning":"Boolean indicating whether the patient currently has unstable angina pectoris (preinfarction syndrome)."} ;; "unstable angina pectoris"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_preinfarction_syndrome_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable angina pectoris."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_left_main_coronary_artery_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of left main coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of left main coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left main coronary artery disease.","meaning":"Boolean indicating whether the patient currently has left main coronary artery disease."} ;; "left main coronary artery disease"

(declare-const stenosis_of_left_main_coronary_artery_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the recorded percentage value if the degree of stenosis of the left main coronary artery is measured and documented at the present time.","when_to_set_to_null":"Set to null if the degree of stenosis of the left main coronary artery is not measured, not documented, or cannot be determined at the present time.","meaning":"Numeric value representing the percentage of stenosis of the left main coronary artery at the present time, in percent (%)."} ;; "stenosis of the left main coronary artery > 50 %"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (and patient_has_finding_of_left_main_coronary_artery_disease_now
               (> stenosis_of_left_main_coronary_artery_value_recorded_now_withunit_percent 50)))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant left main coronary artery disease (stenosis of the left main coronary artery > 50 %)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const myocardial_infarction_time_since_onset_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient's most recent myocardial infarction occurred, if known.","when_to_set_to_null":"Set to null if the time since the patient's most recent myocardial infarction is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of months since the patient's most recent myocardial infarction occurred."} ;; "myocardial infarction occurred < 1 month ago"

(declare-const patient_has_finding_of_myocardial_infarction_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a myocardial infarction that occurred within the past 1 month.","when_to_set_to_false":"Set to false if the patient has not had a myocardial infarction within the past 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a myocardial infarction within the past 1 month.","meaning":"Boolean indicating whether the patient has had a myocardial infarction within the past 1 month."} ;; "myocardial infarction occurred < 1 month ago"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: myocardial infarction within the past 1 month
(assert
(! (= patient_has_finding_of_myocardial_infarction_inthepast1months
    (< myocardial_infarction_time_since_onset_in_months 1))
:named REQ2_AUXILIARY0)) ;; "myocardial infarction occurred < 1 month ago"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_myocardial_infarction_inthepast1months)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a recent myocardial infarction (myocardial infarction occurred < 1 month ago)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not lactating as documented or reported.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient has lactation"
(declare-const patient_has_finding_of_finding_of_lactation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of lactation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of lactation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of lactation.","meaning":"Boolean indicating whether the patient currently has the clinical finding of lactation."} ;; "lactation"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Link: clinical finding of lactation implies patient is lactating
(assert
(! (=> patient_has_finding_of_finding_of_lactation_now
       patient_is_lactating_now)
   :named REQ3_AUXILIARY0)) ;; "lactation" ⇒ "the patient has lactation"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT be pregnant or lactating
(assert
(! (not (or patient_is_pregnant_now
            patient_is_lactating_now))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is pregnant) OR (the patient has lactation)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_allergy_to_losartan_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to losartan.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to losartan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to losartan.","meaning":"Boolean indicating whether the patient currently has an allergy to losartan."} ;; "The patient is excluded if the patient has an allergy to losartan."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_allergy_to_losartan_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to losartan."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_creatinine_measurement_serum_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if a serum creatinine measurement in mg/dl is recorded for the patient at the present time.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum creatinine in mg/dl."} ;; "serum creatinine"
(declare-const patient_has_finding_of_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal failure syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal failure syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal failure syndrome.","meaning":"Boolean indicating whether the patient currently has renal failure syndrome."} ;; "renal failure"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: renal failure (serum creatinine > 2.5 mg/dl)
(assert
(! (= patient_has_finding_of_renal_failure_syndrome_now
     (> patient_creatinine_measurement_serum_value_recorded_now_withunit_mg_per_dl 2.5))
:named REQ5_AUXILIARY0)) ;; "renal failure (serum creatinine > 2.5 mg/dl)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_renal_failure_syndrome_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal failure (serum creatinine > 2.5 mg/dl)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_undergoing_angiotensin_converting_enzyme_inhibitor_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing angiotensin converting enzyme inhibitor therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing angiotensin converting enzyme inhibitor therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing angiotensin converting enzyme inhibitor therapy.","meaning":"Boolean indicating whether the patient is currently undergoing angiotensin converting enzyme inhibitor therapy."} ;; "angiotensin converting enzyme inhibitor therapy"
(declare-const patient_is_undergoing_angiotensin_converting_enzyme_inhibitor_therapy_now@@inability_to_withdraw Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing angiotensin converting enzyme inhibitor therapy and is unable to withdraw this therapy.","when_to_set_to_false":"Set to false if the patient is currently undergoing angiotensin converting enzyme inhibitor therapy and is able to withdraw this therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to withdraw angiotensin converting enzyme inhibitor therapy.","meaning":"Boolean indicating whether the patient is currently undergoing angiotensin converting enzyme inhibitor therapy and has an inability to withdraw this therapy."} ;; "inability to withdraw angiotensin converting enzyme inhibitor therapy"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_is_undergoing_angiotensin_converting_enzyme_inhibitor_therapy_now@@inability_to_withdraw
      patient_is_undergoing_angiotensin_converting_enzyme_inhibitor_therapy_now)
   :named REQ6_AUXILIARY0)) ;; "inability to withdraw angiotensin converting enzyme inhibitor therapy" implies "angiotensin converting enzyme inhibitor therapy"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_undergoing_angiotensin_converting_enzyme_inhibitor_therapy_now@@inability_to_withdraw)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an inability to withdraw angiotensin converting enzyme inhibitor therapy."
