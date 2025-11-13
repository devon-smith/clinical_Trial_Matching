;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_type_1_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of insulin dependent diabetes mellitus (Type 1 diabetes mellitus).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of insulin dependent diabetes mellitus (Type 1 diabetes mellitus).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of insulin dependent diabetes mellitus (Type 1 diabetes mellitus).","meaning":"Boolean indicating whether the patient currently has a diagnosis of insulin dependent diabetes mellitus (Type 1 diabetes mellitus)."} ;; "insulin dependent diabetes mellitus"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_type_1_diabetes_mellitus_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has insulin dependent diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is nursing"
(declare-const patient_has_had_live_birth_within_past_4_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a live birth within the past four months.","when_to_set_to_false":"Set to false if the patient has not had a live birth within the past four months.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has had a live birth within the past four months.","meaning":"Boolean indicating whether the patient has had a live birth within the past four months."} ;; "the patient has had a baby within the past four months"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
  (! (not patient_is_breastfeeding_now)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is nursing."

(assert
  (! (not patient_has_had_live_birth_within_past_4_months)
     :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a baby within the past four months."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_eating_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of eating disorder at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of eating disorder at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of eating disorder.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of eating disorder in their history."} ;; "eating disorder"
(declare-const patient_has_finding_of_eating_disorder_inthehistory@@treated_for Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been treated for an eating disorder in their history.","when_to_set_to_false":"Set to false if the patient has never been treated for an eating disorder in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been treated for an eating disorder.","meaning":"Boolean indicating whether the patient has ever been treated for an eating disorder in their history."} ;; "has ever been treated for an eating disorder"
(declare-const patient_has_finding_of_anorexia_nervosa_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of anorexia nervosa at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of anorexia nervosa at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of anorexia nervosa.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of anorexia nervosa in their history."} ;; "anorexia nervosa"
(declare-const patient_has_finding_of_anorexia_nervosa_inthehistory@@treated_for Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been treated for anorexia nervosa in their history.","when_to_set_to_false":"Set to false if the patient has never been treated for anorexia nervosa in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been treated for anorexia nervosa.","meaning":"Boolean indicating whether the patient has ever been treated for anorexia nervosa in their history."} ;; "has ever been treated for anorexia nervosa"
(declare-const patient_has_finding_of_bulimia_nervosa_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of bulimia nervosa at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of bulimia nervosa at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of bulimia nervosa.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of bulimia nervosa in their history."} ;; "bulimia nervosa"
(declare-const patient_has_finding_of_bulimia_nervosa_inthehistory@@treated_for Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been treated for bulimia nervosa in their history.","when_to_set_to_false":"Set to false if the patient has never been treated for bulimia nervosa in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been treated for bulimia nervosa.","meaning":"Boolean indicating whether the patient has ever been treated for bulimia nervosa in their history."} ;; "has ever been treated for bulimia nervosa"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_anorexia_nervosa_inthehistory@@treated_for
           patient_has_finding_of_bulimia_nervosa_inthehistory@@treated_for)
       patient_has_finding_of_eating_disorder_inthehistory@@treated_for)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (anorexia nervosa, bulimia nervosa)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_eating_disorder_inthehistory@@treated_for
       patient_has_finding_of_eating_disorder_inthehistory)
:named REQ2_AUXILIARY1)) ;; "has ever been treated for an eating disorder"

(assert
(! (=> patient_has_finding_of_anorexia_nervosa_inthehistory@@treated_for
       patient_has_finding_of_anorexia_nervosa_inthehistory)
:named REQ2_AUXILIARY2)) ;; "has ever been treated for anorexia nervosa"

(assert
(! (=> patient_has_finding_of_bulimia_nervosa_inthehistory@@treated_for
       patient_has_finding_of_bulimia_nervosa_inthehistory)
:named REQ2_AUXILIARY3)) ;; "has ever been treated for bulimia nervosa"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_eating_disorder_inthehistory@@treated_for)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ever been treated for an eating disorder with non-exhaustive examples (anorexia nervosa, bulimia nervosa)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthepast2years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of myocardial infarction within the past two years.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of myocardial infarction within the past two years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of myocardial infarction within the past two years.","meaning":"Boolean indicating whether the patient has had a diagnosis of myocardial infarction within the past two years."} ;; "myocardial infarction within the past two years"
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthepast2years@@required_hospitalization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial infarction within the past two years required hospitalization.","when_to_set_to_false":"Set to false if the patient's myocardial infarction within the past two years did not require hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial infarction within the past two years required hospitalization.","meaning":"Boolean indicating whether the patient's myocardial infarction within the past two years required hospitalization."} ;; "the myocardial infarction required hospitalization"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_myocardial_infarction_inthepast2years@@required_hospitalization
      patient_has_diagnosis_of_myocardial_infarction_inthepast2years)
:named REQ3_AUXILIARY0)) ;; "the myocardial infarction required hospitalization" implies "myocardial infarction within the past two years"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have had a myocardial infarction within the past two years that required hospitalization
(assert
(! (not patient_has_diagnosis_of_myocardial_infarction_inthepast2years@@required_hospitalization)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a myocardial infarction within the past two years AND the myocardial infarction required hospitalization."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a cerebrovascular accident at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a cerebrovascular accident at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a cerebrovascular accident.","meaning":"Boolean indicating whether the patient has ever had a cerebrovascular accident in their history."} ;; "has ever had a cerebrovascular accident"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthehistory)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ever had a cerebrovascular accident."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} ;; "congestive heart failure"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_finding_of_congestive_heart_failure_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congestive heart failure."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_poor_hypertension_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of poor hypertension control (uncontrolled hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of poor hypertension control (uncontrolled hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor hypertension control (uncontrolled hypertension).","meaning":"Boolean indicating whether the patient currently has poor hypertension control (uncontrolled hypertension)."} ;; "uncontrolled hypertension"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_poor_hypertension_control_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_currently_participating_in_another_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in another study.","when_to_set_to_false":"Set to false if the patient is not currently participating in another study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in another study.","meaning":"Boolean indicating whether the patient is currently participating in another study."} ;; "the patient is currently participating in another study"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_currently_participating_in_another_study)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is currently participating in another study."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hepatic (liver) failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hepatic (liver) failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hepatic (liver) failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hepatic (liver) failure."} ;; "liver failure"
(declare-const patient_has_finding_of_therapeutic_diets_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently on a doctor-prescribed therapeutic diet.","when_to_set_to_false":"Set to false if the patient is currently not on a doctor-prescribed therapeutic diet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently on a doctor-prescribed therapeutic diet.","meaning":"Boolean indicating whether the patient is currently on a doctor-prescribed therapeutic diet."} ;; "doctor-prescribed diet"
(declare-const patient_has_finding_of_therapeutic_diets_now@@cannot_be_changed Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently on a doctor-prescribed therapeutic diet and this diet cannot be changed.","when_to_set_to_false":"Set to false if the patient is currently on a doctor-prescribed therapeutic diet and this diet can be changed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the doctor-prescribed therapeutic diet can be changed.","meaning":"Boolean indicating whether the patient is currently on a doctor-prescribed therapeutic diet that cannot be changed."} ;; "doctor-prescribed diet that cannot be changed"
(declare-const patient_is_exposed_to_protein_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to protein (i.e., protein is present in the patient's current diet).","when_to_set_to_false":"Set to false if the patient is currently not exposed to protein (i.e., protein is absent or restricted from the patient's current diet).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to protein.","meaning":"Boolean indicating whether the patient is currently exposed to protein."} ;; "protein"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive example: very low protein diet for a patient in liver failure implies umbrella term
(assert
(! (=> (and (not patient_is_exposed_to_protein_now)
            patient_has_diagnosis_of_hepatic_failure_now)
        patient_has_finding_of_therapeutic_diets_now@@cannot_be_changed)
:named REQ8_AUXILIARY0)) ;; "very low protein diet for a patient in liver failure" is a non-exhaustive example of "doctor-prescribed diet that cannot be changed"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_therapeutic_diets_now@@cannot_be_changed
        patient_has_finding_of_therapeutic_diets_now)
:named REQ8_AUXILIARY1)) ;; "doctor-prescribed diet that cannot be changed" implies "doctor-prescribed diet"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_therapeutic_diets_now@@cannot_be_changed)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on a doctor-prescribed diet that cannot be changed with non-exhaustive examples (very low protein diet for a patient in liver failure)."
