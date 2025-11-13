;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_elevated_blood_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of elevated blood pressure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of elevated blood pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of elevated blood pressure.","meaning":"Boolean indicating whether the patient currently has elevated blood pressure."} ;; "increase in blood pressure"
(declare-const patient_has_finding_of_elevated_blood_pressure_now@@due_to_non_correctable_secondary_cause Bool) ;; {"when_to_set_to_true":"Set to true if the patient's elevated blood pressure is due to a non-correctable secondary cause.","when_to_set_to_false":"Set to false if the patient's elevated blood pressure is not due to a non-correctable secondary cause.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the elevated blood pressure is due to a non-correctable secondary cause.","meaning":"Boolean indicating whether the patient's elevated blood pressure is due to a non-correctable secondary cause."} ;; "non-correctable secondary cause of increase in blood pressure"
(declare-const patient_has_finding_of_decreased_blood_pressure_not_hypotension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of decreased blood pressure (not hypotension).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of decreased blood pressure (not hypotension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of decreased blood pressure (not hypotension).","meaning":"Boolean indicating whether the patient currently has decreased blood pressure (not hypotension)."} ;; "decrease in blood pressure"
(declare-const patient_has_finding_of_decreased_blood_pressure_not_hypotension_now@@due_to_non_correctable_secondary_cause Bool) ;; {"when_to_set_to_true":"Set to true if the patient's decreased blood pressure (not hypotension) is due to a non-correctable secondary cause.","when_to_set_to_false":"Set to false if the patient's decreased blood pressure (not hypotension) is not due to a non-correctable secondary cause.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the decreased blood pressure (not hypotension) is due to a non-correctable secondary cause.","meaning":"Boolean indicating whether the patient's decreased blood pressure (not hypotension) is due to a non-correctable secondary cause."} ;; "non-correctable secondary cause of decrease in blood pressure"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_elevated_blood_pressure_now@@due_to_non_correctable_secondary_cause
      patient_has_finding_of_elevated_blood_pressure_now)
   :named REQ0_AUXILIARY0)) ;; "elevated blood pressure due to non-correctable secondary cause implies elevated blood pressure"

(assert
(! (=> patient_has_finding_of_decreased_blood_pressure_not_hypotension_now@@due_to_non_correctable_secondary_cause
      patient_has_finding_of_decreased_blood_pressure_not_hypotension_now)
   :named REQ0_AUXILIARY1)) ;; "decreased blood pressure (not hypotension) due to non-correctable secondary cause implies decreased blood pressure (not hypotension)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or patient_has_finding_of_elevated_blood_pressure_now@@due_to_non_correctable_secondary_cause
            patient_has_finding_of_decreased_blood_pressure_not_hypotension_now@@due_to_non_correctable_secondary_cause))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has any non-correctable secondary cause of increase in blood pressure) OR (the patient has any non-correctable secondary cause of decrease in blood pressure)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_prognosis_outlook_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding related to prognosis (i.e., their prognosis is altered by a pathology).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding related to prognosis (i.e., their prognosis is not altered by a pathology).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a prognosis-related finding.","meaning":"Boolean indicating whether the patient currently has a prognosis-related clinical finding."} ;; "prognosis"
(declare-const patient_has_finding_of_prognosis_outlook_finding_now@@altered_before_registry_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prognosis was altered by a pathology before the patient's entrance into this registry.","when_to_set_to_false":"Set to false if the patient's prognosis was not altered by a pathology before the patient's entrance into this registry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's prognosis was altered by a pathology before registry entry.","meaning":"Boolean indicating whether the patient's prognosis was altered by a pathology before registry entry."} ;; "a pathology that alters the prognosis before the entrance of the patient into this registry"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_prognosis_outlook_finding_now@@altered_before_registry_entry
      patient_has_finding_of_prognosis_outlook_finding_now)
:named REQ1_AUXILIARY0)) ;; "prognosis was altered by a pathology before registry entry implies a prognosis-related finding"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_prognosis_outlook_finding_now@@altered_before_registry_entry)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a pathology that alters the prognosis before the entrance of the patient into this registry."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding or diagnosis of kidney disease (nephropathy) at any time in the past (prior to now).","when_to_set_to_false":"Set to false if the patient has never had a clinical finding or diagnosis of kidney disease (nephropathy) at any time in the past (prior to now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding or diagnosis of kidney disease (nephropathy) at any time in the past.","meaning":"Boolean indicating whether the patient has ever had a finding or diagnosis of kidney disease (nephropathy) at any time in the past."} ;; "nephropathy"
(declare-const patient_has_finding_of_kidney_disease_inthehistory@@temporalcontext_prior_to_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's finding or diagnosis of kidney disease (nephropathy) occurred prior to the admission event.","when_to_set_to_false":"Set to false if the patient's finding or diagnosis of kidney disease (nephropathy) did not occur prior to the admission event.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's finding or diagnosis of kidney disease (nephropathy) occurred prior to the admission event.","meaning":"Boolean indicating whether the patient's finding or diagnosis of kidney disease (nephropathy) occurred prior to the admission event."} ;; "prior to admission"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_kidney_disease_inthehistory@@temporalcontext_prior_to_admission
      patient_has_finding_of_kidney_disease_inthehistory)
:named REQ2_AUXILIARY0)) ;; "prior to admission" implies "nephropathy in history"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_kidney_disease_inthehistory@@temporalcontext_prior_to_admission)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has nephropathy prior to admission."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_dyslipidemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dyslipidemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dyslipidemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dyslipidemia.","meaning":"Boolean indicating whether the patient currently has dyslipidemia."} ;; "dyslipidemia"
(declare-const patient_has_finding_of_dyslipidemia_now@@familial Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dyslipidemia is familial.","when_to_set_to_false":"Set to false if the patient's dyslipidemia is not familial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dyslipidemia is familial.","meaning":"Boolean indicating whether the patient's dyslipidemia is familial."} ;; "familial dyslipidemia"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_dyslipidemia_now@@familial
       patient_has_finding_of_dyslipidemia_now)
   :named REQ3_AUXILIARY0)) ;; "familial dyslipidemia" implies "dyslipidemia"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_dyslipidemia_now@@familial)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has familial dyslipidemia."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_bypass_of_stomach_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a gastric bypass (bypass of stomach) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a gastric bypass (bypass of stomach) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a gastric bypass (bypass of stomach).","meaning":"Boolean indicating whether the patient has ever undergone a gastric bypass (bypass of stomach) at any time in the past."} ;; "gastric bypass"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_undergone_bypass_of_stomach_inthehistory)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a previous gastric bypass."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_heart_failure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with heart failure prior to study entry (i.e., pre-existing).","when_to_set_to_false":"Set to false if the patient has never been diagnosed with heart failure prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with heart failure prior to study entry.","meaning":"Boolean indicating whether the patient has a pre-existing diagnosis of heart failure."} ;; "pre-existing heart failure"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_heart_failure_inthehistory)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pre-existing heart failure."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_cardiotoxicity_now_caused_by_chemotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cardiotoxicity and the cardiotoxicity is caused by chemotherapy.","when_to_set_to_false":"Set to false if the patient currently does not have cardiotoxicity caused by chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cardiotoxicity caused by chemotherapy.","meaning":"Boolean indicating whether the patient currently has cardiotoxicity that is induced by chemotherapy."} ;; "chemotherapy-induced cardiotoxicity"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_finding_of_cardiotoxicity_now_caused_by_chemotherapy)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chemotherapy-induced cardiotoxicity."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_arrhythmogenic_right_ventricular_dysplasia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has arrhythmogenic right ventricular dysplasia as a clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have arrhythmogenic right ventricular dysplasia as a clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has arrhythmogenic right ventricular dysplasia.","meaning":"Boolean indicating whether the patient currently has arrhythmogenic right ventricular dysplasia."} ;; "arrhythmogenic right ventricular dysplasia"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_arrhythmogenic_right_ventricular_dysplasia_now)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has arrhythmogenic right ventricular dysplasia."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_long_qt_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of long QT syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of long QT syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of long QT syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of long QT syndrome."} ;; "long QT syndrome"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_diagnosis_of_long_qt_syndrome_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has long QT syndrome."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_hypertrophic_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertrophic cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertrophic cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertrophic cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertrophic cardiomyopathy."} ;; "hypertrophic cardiomyopathy"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_diagnosis_of_hypertrophic_cardiomyopathy_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypertrophic cardiomyopathy."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_restrictive_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of restrictive cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of restrictive cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has restrictive cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has restrictive cardiomyopathy."} ;; "restrictive cardiomyopathy"

(declare-const patient_has_finding_of_sudden_death_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sudden death syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have sudden death syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sudden death syndrome.","meaning":"Boolean indicating whether the patient currently has sudden death syndrome."} ;; "sudden death syndrome"

(declare-const patient_has_finding_of_sudden_death_syndrome_now@@not_due_to_coronary_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sudden death syndrome is not due to coronary disease.","when_to_set_to_false":"Set to false if the patient's current sudden death syndrome is due to coronary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current sudden death syndrome is due to coronary disease.","meaning":"Boolean indicating whether the patient's current sudden death syndrome is not due to coronary disease."} ;; "sudden death syndrome that is NOT due to coronary disease"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_sudden_death_syndrome_now@@not_due_to_coronary_disease
      patient_has_finding_of_sudden_death_syndrome_now)
   :named REQ10_AUXILIARY0)) ;; "sudden death syndrome that is NOT due to coronary disease"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (or patient_has_finding_of_restrictive_cardiomyopathy_now
            patient_has_finding_of_sudden_death_syndrome_now@@not_due_to_coronary_disease))
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has restrictive cardiomyopathy) OR (the patient has sudden death syndrome that is NOT due to coronary disease)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_diagnosis_of_complete_trisomy_21_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of complete trisomy 21 syndrome (Down syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of complete trisomy 21 syndrome (Down syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of complete trisomy 21 syndrome (Down syndrome).","meaning":"Boolean indicating whether the patient currently has a diagnosis of complete trisomy 21 syndrome (Down syndrome)."} ;; "Down syndrome"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_diagnosis_of_complete_trisomy_21_syndrome_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Down syndrome."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_kidney_count_before_registry_entry_in_unit_count Real) ;; {"when_to_set_to_value":"Set to the number of kidneys the patient has before entering this registry, as determined by clinical history, imaging, or surgical records. Use integer values (e.g., 0, 1, 2).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many kidneys the patient has before entering this registry.","meaning":"Numeric variable representing the total number of kidneys the patient has before entering this registry, measured in count."} ;; "has only one single kidney before entering this registry"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
  (! (not (= patient_kidney_count_before_registry_entry_in_unit_count 1))
     :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has only one single kidney before entering this registry."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_diagnosis_of_multiple_congenital_cysts_of_kidney_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of polycystic kidney disease (multiple congenital cysts of kidney).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of polycystic kidney disease (multiple congenital cysts of kidney).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of polycystic kidney disease (multiple congenital cysts of kidney).","meaning":"Boolean indicating whether the patient currently has a diagnosis of polycystic kidney disease (multiple congenital cysts of kidney)."} ;; "polycystic kidney disease"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
  (! (not patient_has_diagnosis_of_multiple_congenital_cysts_of_kidney_now)
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has polycystic kidney disease."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of disability.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of disability.","meaning":"Boolean indicating whether the patient currently has a disability."} ;; "disability"

(declare-const patient_has_finding_of_disability_now@@prevents_continuation_of_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disability and that disability prevents continuation of treatment.","when_to_set_to_false":"Set to false if the patient currently has a disability but it does not prevent continuation of treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disability prevents continuation of treatment.","meaning":"Boolean indicating whether the patient's current disability prevents continuation of treatment."} ;; "disability to continue with the treatment"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disability_now@@prevents_continuation_of_treatment
      patient_has_finding_of_disability_now)
:named REQ14_AUXILIARY0)) ;; "disability to continue with the treatment""

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_disability_now@@prevents_continuation_of_treatment)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a disability to continue with the treatment."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_history_of_organ_transplantation_other_than_cornea Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an organ transplantation of any organ except the cornea.","when_to_set_to_false":"Set to false if the patient has not had any organ transplantation, or only had cornea transplantation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an organ transplantation other than cornea transplantation.","meaning":"Boolean indicating whether the patient has had an organ transplantation, excluding cornea transplantation."} ;; "The patient is excluded if the patient has had an organ transplantation other than cornea transplantation."

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
  (! (not patient_has_history_of_organ_transplantation_other_than_cornea)
     :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had an organ transplantation other than cornea transplantation."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human immunodeficiency virus infection and is positive for it.","when_to_set_to_false":"Set to false if the patient currently does not have human immunodeficiency virus infection or is not positive for it.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus infection and is positive for it.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection and is positive for it."} ;; "The patient is excluded if the patient is positive for human immunodeficiency virus infection."

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_finding_of_human_immunodeficiency_virus_infection_now)
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is positive for human immunodeficiency virus infection."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_diagnosis_of_homocystinuria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of homocystinuria.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of homocystinuria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of homocystinuria.","meaning":"Boolean indicating whether the patient currently has a diagnosis of homocystinuria."} ;; "homocystinuria"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_diagnosis_of_homocystinuria_now)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has homocystinuria."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_diagnosis_of_meningomyelocele_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with meningomyelocele (myelomeningocele) at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with meningomyelocele (myelomeningocele) at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with meningomyelocele (myelomeningocele).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of meningomyelocele (myelomeningocele) in their medical history."} ;; "myelomeningocele"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_has_diagnosis_of_meningomyelocele_inthehistory)
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has myelomeningocele."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_finding_of_autoimmune_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of autoimmune disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of autoimmune disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of autoimmune disease.","meaning":"Boolean indicating whether the patient currently has autoimmune disease."} ;; "autoimmune disease"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_finding_of_autoimmune_disease_now)
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has autoimmune disease."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_has_finding_of_paraplegia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has paraplegia.","when_to_set_to_false":"Set to false if the patient currently does not have paraplegia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has paraplegia.","meaning":"Boolean indicating whether the patient currently has paraplegia."} ;; "paraplegia"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
  (! (not patient_has_finding_of_paraplegia_now)
     :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has paraplegia."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_has_finding_of_chronic_infectious_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic infectious disease.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic infectious disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic infectious disease.","meaning":"Boolean indicating whether the patient currently has a chronic infectious disease."} ;; "chronic infection"
(declare-const patient_has_finding_of_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tuberculosis.","meaning":"Boolean indicating whether the patient currently has tuberculosis."} ;; "tuberculosis"

;; ===================== Auxiliary Assertions (REQ 21) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> patient_has_finding_of_tuberculosis_now
      patient_has_finding_of_chronic_infectious_disease_now)
   :named REQ21_AUXILIARY0)) ;; "with non-exhaustive examples (tuberculosis)."

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
(! (not patient_has_finding_of_chronic_infectious_disease_now)
   :named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic infection with non-exhaustive examples (tuberculosis)."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_has_finding_of_myocarditis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of myocarditis, regardless of cause.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of myocarditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has myocarditis.","meaning":"Boolean indicating whether the patient currently has myocarditis of any cause."} ;; "myocarditis of any cause"

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not patient_has_finding_of_myocarditis_now)
:named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has myocarditis of any cause."

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_has_finding_of_disorder_of_cellular_component_of_blood_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the cellular component of blood (blood dyscrasia).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the cellular component of blood (blood dyscrasia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the cellular component of blood (blood dyscrasia).","meaning":"Boolean indicating whether the patient currently has a disorder of the cellular component of blood (blood dyscrasia)."} ;; "blood dyscrasia"
(declare-const patient_has_finding_of_disorder_of_cellular_component_of_blood_now@@accompanied_by_coagulation_disorder Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the cellular component of blood (blood dyscrasia) is accompanied by a coagulation disorder.","when_to_set_to_false":"Set to false if the patient's current disorder of the cellular component of blood (blood dyscrasia) is not accompanied by a coagulation disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of the cellular component of blood (blood dyscrasia) is accompanied by a coagulation disorder.","meaning":"Boolean indicating whether the patient's current disorder of the cellular component of blood (blood dyscrasia) is accompanied by a coagulation disorder."} ;; "blood dyscrasia with coagulation disorder"

;; ===================== Auxiliary Assertions (REQ 23) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_cellular_component_of_blood_now@@accompanied_by_coagulation_disorder
      patient_has_finding_of_disorder_of_cellular_component_of_blood_now)
:named REQ23_AUXILIARY0)) ;; "blood dyscrasia with coagulation disorder"

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
(! (not patient_has_finding_of_disorder_of_cellular_component_of_blood_now@@accompanied_by_coagulation_disorder)
:named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has blood dyscrasia with coagulation disorder."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_has_diagnosis_of_pulmonary_embolism_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with pulmonary embolism at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with pulmonary embolism at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with pulmonary embolism.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of pulmonary embolism in their history."} ;; "pulmonary embolism"

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
(! (not patient_has_diagnosis_of_pulmonary_embolism_inthehistory)
:named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of pulmonary embolism."
