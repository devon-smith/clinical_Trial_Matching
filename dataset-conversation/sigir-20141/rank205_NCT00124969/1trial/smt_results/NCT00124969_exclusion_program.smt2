;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_low_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypotension (low blood pressure).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypotension (low blood pressure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypotension (low blood pressure).","meaning":"Boolean indicating whether the patient currently has hypotension (low blood pressure)." } ;; "hypotension"

(declare-const patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current systolic blood pressure in millimeters of mercury is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current systolic blood pressure in millimeters of mercury."} ;; "systolic blood pressure < 90 millimeters of mercury"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (and patient_has_finding_of_low_blood_pressure_now
               (< patient_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 90)))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypotension with systolic blood pressure < 90 millimeters of mercury."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_aortic_valve_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of aortic valve stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of aortic valve stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of aortic valve stenosis.","meaning":"Boolean indicating whether the patient currently has aortic valve stenosis."} ;; "aortic stenosis"
(declare-const patient_has_finding_of_aortic_valve_stenosis_now@@high_grade Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has aortic valve stenosis and the stenosis is high-grade.","when_to_set_to_false":"Set to false if the patient currently has aortic valve stenosis but the stenosis is not high-grade.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's aortic valve stenosis is high-grade.","meaning":"Boolean indicating whether the patient's current aortic valve stenosis is high-grade."} ;; "high-grade aortic stenosis"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_aortic_valve_stenosis_now@@high_grade
      patient_has_finding_of_aortic_valve_stenosis_now)
:named REQ1_AUXILIARY0)) ;; "high-grade aortic stenosis" implies "aortic stenosis"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_aortic_valve_stenosis_now@@high_grade)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has high-grade aortic stenosis."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "heart failure"
(declare-const patient_has_finding_of_heart_failure_now@@nyha_stage_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's heart failure is classified as New York Heart Association stage III.","when_to_set_to_false":"Set to false if the patient's heart failure is not classified as New York Heart Association stage III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart failure is classified as New York Heart Association stage III.","meaning":"Boolean indicating whether the patient's heart failure is classified as New York Heart Association stage III."} ;; "heart failure of New York Heart Association stage III"
(declare-const patient_has_finding_of_heart_failure_now@@nyha_stage_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient's heart failure is classified as New York Heart Association stage IV.","when_to_set_to_false":"Set to false if the patient's heart failure is not classified as New York Heart Association stage IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart failure is classified as New York Heart Association stage IV.","meaning":"Boolean indicating whether the patient's heart failure is classified as New York Heart Association stage IV."} ;; "heart failure of New York Heart Association stage IV"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_failure_now@@nyha_stage_iii
       patient_has_finding_of_heart_failure_now)
   :named REQ2_AUXILIARY0)) ;; "heart failure of New York Heart Association stage III"

(assert
(! (=> patient_has_finding_of_heart_failure_now@@nyha_stage_iv
       patient_has_finding_of_heart_failure_now)
   :named REQ2_AUXILIARY1)) ;; "heart failure of New York Heart Association stage IV"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_heart_failure_now@@nyha_stage_iii)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart failure of New York Heart Association stage III."

(assert
(! (not patient_has_finding_of_heart_failure_now@@nyha_stage_iv)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has heart failure of New York Heart Association stage IV."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_acute_myocardial_infarction_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of acute myocardial infarction within the past 4 weeks.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of acute myocardial infarction within the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of acute myocardial infarction within the past 4 weeks.","meaning":"Boolean indicating whether the patient has had a diagnosis of acute myocardial infarction within the past 4 weeks."} ;; "acute myocardial infarction within the last 4 weeks"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_acute_myocardial_infarction_inthepast4weeks)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had an acute myocardial infarction within the last 4 weeks."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_acute_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute heart failure.","meaning":"Boolean indicating whether the patient currently has acute heart failure."} ;; "acute heart failure"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_acute_heart_failure_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute heart failure."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_allergy_to_amlodipine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has allergy to amlodipine.","when_to_set_to_false":"Set to false if the patient currently does not have allergy to amlodipine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has allergy to amlodipine.","meaning":"Boolean indicating whether the patient currently has allergy to amlodipine."} ;; "allergy to the medicament amlodipine"
(declare-const patient_has_finding_of_allergy_to_amlodipine_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to amlodipine is known (documented or established).","when_to_set_to_false":"Set to false if the patient's allergy to amlodipine is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to amlodipine is known.","meaning":"Boolean indicating whether the patient's allergy to amlodipine is known."} ;; "known allergy to the medicament amlodipine"
(declare-const patient_has_allergy_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has allergy to drug or medicament.","when_to_set_to_false":"Set to false if the patient currently does not have allergy to drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has allergy to drug or medicament.","meaning":"Boolean indicating whether the patient currently has allergy to drug or medicament."} ;; "medicament"
(declare-const patient_has_allergy_to_drug_or_medicament_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to drug or medicament is known (documented or established).","when_to_set_to_false":"Set to false if the patient's allergy to drug or medicament is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to drug or medicament is known.","meaning":"Boolean indicating whether the patient's allergy to drug or medicament is known."} ;; "known allergy to drug or medicament"
(declare-const patient_has_allergy_to_drug_or_medicament_now@@restricted_to_other_constituents_of_the_medicament Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to drug or medicament is specifically to other constituents of the medicament (excluding amlodipine).","when_to_set_to_false":"Set to false if the patient's allergy to drug or medicament is not specifically to other constituents of the medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy is specifically to other constituents of the medicament.","meaning":"Boolean indicating whether the patient's allergy to drug or medicament is specifically to other constituents of the medicament (excluding amlodipine)."} ;; "known allergy to other constituents of the medicament"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable (amlodipine)
(assert
(! (=> patient_has_finding_of_allergy_to_amlodipine_now@@known
      patient_has_finding_of_allergy_to_amlodipine_now)
    :named REQ5_AUXILIARY0)) ;; "known allergy to the medicament amlodipine"

;; Qualifier variable implies corresponding stem variable (drug or medicament)
(assert
(! (=> patient_has_allergy_to_drug_or_medicament_now@@known
      patient_has_allergy_to_drug_or_medicament_now)
    :named REQ5_AUXILIARY1)) ;; "known allergy to drug or medicament"

;; Qualifier variable for other constituents implies corresponding stem variable
(assert
(! (=> patient_has_allergy_to_drug_or_medicament_now@@restricted_to_other_constituents_of_the_medicament
      patient_has_allergy_to_drug_or_medicament_now@@known)
    :named REQ5_AUXILIARY2)) ;; "known allergy to other constituents of the medicament"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have a known allergy to amlodipine
(assert
(! (not patient_has_finding_of_allergy_to_amlodipine_now@@known)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to the medicament amlodipine."

;; Exclusion: patient must NOT have a known allergy to other constituents of the medicament
(assert
(! (not patient_has_allergy_to_drug_or_medicament_now@@restricted_to_other_constituents_of_the_medicament)
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to other constituents of the medicament."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_abnormal_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abnormal liver function.","when_to_set_to_false":"Set to false if the patient currently does not have abnormal liver function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abnormal liver function.","meaning":"Boolean indicating whether the patient currently has abnormal liver function."} ;; "disorder of liver function"
(declare-const patient_has_finding_of_abnormal_liver_function_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal liver function is classified as severe.","when_to_set_to_false":"Set to false if the patient's abnormal liver function is not classified as severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's abnormal liver function is severe.","meaning":"Boolean indicating whether the patient's abnormal liver function is severe."} ;; "severe disorder of liver function"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_abnormal_liver_function_now@@severity_severe
      patient_has_finding_of_abnormal_liver_function_now)
:named REQ6_AUXILIARY0)) ;; "severe disorder of liver function""

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_abnormal_liver_function_now@@severity_severe)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe disorder of liver function."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently known not to be breast-feeding.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breast-feeding.","meaning":"Boolean indicating whether the patient is currently breast-feeding."} ;; "breast-feeding"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable for breast-feeding
(assert
(! (=> patients_breastfeeding_is_positive_now patient_is_breastfeeding_now)
:named REQ7_AUXILIARY0)) ;; "breast-feeding"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_breastfeeding_now)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breast-feeding."
