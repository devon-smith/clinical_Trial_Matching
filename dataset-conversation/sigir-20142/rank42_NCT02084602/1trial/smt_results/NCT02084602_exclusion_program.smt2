;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_clinical_signs_of_malaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of malaria.","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs of malaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs of malaria.","meaning":"Boolean indicating whether the patient currently has clinical signs of malaria."} ;; "malaria"
(declare-const patient_has_clinical_signs_of_malaria_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of malaria and those signs meet criteria for severe malaria.","when_to_set_to_false":"Set to false if the patient currently has clinical signs of malaria but those signs do not meet criteria for severe malaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical signs of malaria are severe.","meaning":"Boolean indicating whether the patient currently has clinical signs of malaria that are severe."} ;; "severe malaria"
(declare-const patient_has_clinical_signs_of_malaria_now@@defined_by_world_health_organization Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of malaria and the definition of severe malaria is according to World Health Organization criteria.","when_to_set_to_false":"Set to false if the patient currently has clinical signs of malaria but the definition of severe malaria is not according to World Health Organization criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the definition of severe malaria is according to World Health Organization criteria.","meaning":"Boolean indicating whether the patient currently has clinical signs of malaria and the definition of severe malaria is according to World Health Organization criteria."} ;; "as defined by the World Health Organization"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_clinical_signs_of_malaria_now@@severe
       patient_has_clinical_signs_of_malaria_now)
   :named REQ0_AUXILIARY0)) ;; "severe malaria"

(assert
(! (=> patient_has_clinical_signs_of_malaria_now@@defined_by_world_health_organization
       patient_has_clinical_signs_of_malaria_now)
   :named REQ0_AUXILIARY1)) ;; "as defined by the World Health Organization"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_has_clinical_signs_of_malaria_now@@severe
             patient_has_clinical_signs_of_malaria_now@@defined_by_world_health_organization))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has signs of severe malaria (as defined by the World Health Organization)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_cerebral_malaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cerebral malaria.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cerebral malaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cerebral malaria.","meaning":"Boolean indicating whether the patient currently has cerebral malaria."} ;; "cerebral malaria"
(declare-const patient_has_finding_of_irreversible_coma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has irreversible coma.","when_to_set_to_false":"Set to false if the patient currently does not have irreversible coma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has irreversible coma.","meaning":"Boolean indicating whether the patient currently has irreversible coma."} ;; "irreversible coma"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; "cerebral malaria (irreversible coma)" -- definition in requirement
(assert
(! (= patient_has_finding_of_cerebral_malaria_now
     patient_has_finding_of_irreversible_coma_now)
:named REQ1_AUXILIARY0)) ;; "cerebral malaria (irreversible coma)."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_cerebral_malaria_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cerebral malaria (irreversible coma)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const hematocrit_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the patient's current hematocrit value in percent if available.","when_to_set_to_null":"Set to null if the patient's current hematocrit value in percent is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current hematocrit in percent."} ;; "hematocrit < 15 percent"
(declare-const patient_has_clinical_signs_of_anemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of anemia.","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs of anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs of anemia.","meaning":"Boolean indicating whether the patient currently has clinical signs of anemia."} ;; "signs of anemia that are clinical"
(declare-const patient_has_finding_of_anemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of anemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has anemia.","meaning":"Boolean indicating whether the patient currently has anemia."} ;; "anemia"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: severe anemia (hematocrit < 15 percent)
(assert
(! (not (< hematocrit_value_recorded_now_withunit_percent 15))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has anemia that is severe (hematocrit < 15 percent)."

;; Exclusion: clinical signs of anemia
(assert
(! (not patient_has_clinical_signs_of_anemia_now)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has signs of anemia that are clinical."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_clinical_signs_of_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of renal failure syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs of renal failure syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs of renal failure syndrome.","meaning":"Boolean indicating whether the patient currently has clinical signs of renal failure syndrome."} ;; "signs of kidney failure that are clinical"
(declare-const serum_creatinine_value_recorded_now_in_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the patient's current serum creatinine value in milligrams per deciliter if available.","when_to_set_to_null":"Set to null if the patient's current serum creatinine value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current serum creatinine level in milligrams per deciliter."} ;; "serum creatinine > 3 milligrams per deciliter"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive example: serum creatinine > 3 mg/dL is an example of clinical signs of kidney failure
(assert
(! (=> (> serum_creatinine_value_recorded_now_in_milligrams_per_deciliter 3)
        patient_has_clinical_signs_of_renal_failure_syndrome_now)
    :named REQ3_AUXILIARY0)) ;; "e.g., serum creatinine > 3 milligrams per deciliter"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_clinical_signs_of_renal_failure_syndrome_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has signs of kidney failure that are clinical (e.g., serum creatinine > 3 milligrams per deciliter)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_pulmonary_edema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary edema.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary edema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pulmonary edema.","meaning":"Boolean indicating whether the patient currently has pulmonary edema."} ;; "pulmonary edema"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_pulmonary_edema_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pulmonary edema."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_blood_glucose_value_now_in_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the patient's current blood glucose value in milligrams per deciliter if available.","when_to_set_to_null":"Set to null if the patient's current blood glucose value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current blood glucose concentration in milligrams per deciliter."} ;; "glucose in the blood < 40 milligrams per deciliter"
(declare-const patient_has_clinical_signs_of_hypoglycemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of hypoglycemia.","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs of hypoglycemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs of hypoglycemia.","meaning":"Boolean indicating whether the patient currently has clinical signs of hypoglycemia."} ;; "signs of hypoglycemia that are clinical"
(declare-const patient_has_finding_of_hypoglycemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypoglycemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypoglycemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypoglycemia.","meaning":"Boolean indicating whether the patient currently has hypoglycemia."} ;; "hypoglycemia"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Numeric threshold for hypoglycemia
(assert
(! (=> (< patient_blood_glucose_value_now_in_mg_per_dl 40)
       patient_has_finding_of_hypoglycemia_now)
   :named REQ5_AUXILIARY0)) ;; "hypoglycemia (glucose in the blood < 40 milligrams per deciliter)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_clinical_signs_of_hypoglycemia_now
       patient_has_finding_of_hypoglycemia_now)
   :named REQ5_AUXILIARY1)) ;; "signs of hypoglycemia that are clinical"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_hypoglycemia_now)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypoglycemia (glucose in the blood < 40 milligrams per deciliter)."

(assert
(! (not patient_has_clinical_signs_of_hypoglycemia_now)
   :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has signs of hypoglycemia that are clinical."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "adults"
(declare-const patient_has_finding_of_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of shock.","meaning":"Boolean indicating whether the patient currently has shock."} ;; "shock"
(declare-const systolic_arterial_pressure_value_recorded_now_in_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the patient's current systolic arterial pressure in millimeters of mercury if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current systolic arterial pressure in millimeters of mercury is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current systolic arterial pressure measured in millimeters of mercury."} ;; "systolic arterial pressure < 70 millimeters of mercury in adults" and "systolic arterial pressure < 50 millimeters of mercury in children"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have shock with low systolic arterial pressure in adults or children
(assert
(! (not
     (or
       (and
         patient_has_finding_of_shock_now
         (>= patient_age_value_recorded_now_in_years 18) ;; "adults" defined as age >= 18 years
         (< systolic_arterial_pressure_value_recorded_now_in_millimeters_of_mercury 70) ;; "systolic arterial pressure < 70 millimeters of mercury in adults"
       )
       (and
         patient_has_finding_of_shock_now
         (< patient_age_value_recorded_now_in_years 18) ;; "children" defined as age < 18 years
         (< systolic_arterial_pressure_value_recorded_now_in_millimeters_of_mercury 50) ;; "systolic arterial pressure < 50 millimeters of mercury in children"
       )
     )
   )
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has shock (systolic arterial pressure < 70 millimeters of mercury in adults)) OR (the patient has shock (systolic arterial pressure < 50 millimeters of mercury in children))."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_spontaneous_hemorrhage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of spontaneous bleeding (spontaneous hemorrhage).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of spontaneous bleeding (spontaneous hemorrhage).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has spontaneous bleeding (spontaneous hemorrhage).","meaning":"Boolean indicating whether the patient currently has spontaneous bleeding (spontaneous hemorrhage)."} ;; "spontaneous bleeding"
(declare-const patient_has_finding_of_disseminated_intravascular_coagulation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of disseminated intravascular coagulation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of disseminated intravascular coagulation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has disseminated intravascular coagulation.","meaning":"Boolean indicating whether the patient currently has disseminated intravascular coagulation."} ;; "disseminated intravascular coagulation"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_spontaneous_hemorrhage_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has spontaneous bleeding."

(assert
(! (not patient_has_finding_of_disseminated_intravascular_coagulation_now)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has disseminated intravascular coagulation."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_generalized_seizure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of generalized seizures (generalized convulsions).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of generalized seizures (generalized convulsions).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has generalized seizures (generalized convulsions).","meaning":"Boolean indicating whether the patient currently has generalized seizures (generalized convulsions)."} ;; "convulsions that are both generalized"
(declare-const patient_has_finding_of_generalized_seizure_now@@recurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's generalized seizures (generalized convulsions) are recurrent.","when_to_set_to_false":"Set to false if the patient's generalized seizures (generalized convulsions) are not recurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's generalized seizures (generalized convulsions) are recurrent.","meaning":"Boolean indicating whether the patient's generalized seizures (generalized convulsions) are recurrent."} ;; "convulsions that are both generalized and recurrent"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_generalized_seizure_now@@recurrent
      patient_has_finding_of_generalized_seizure_now)
:named REQ8_AUXILIARY0)) ;; "convulsions that are both generalized and recurrent"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (and patient_has_finding_of_generalized_seizure_now
             patient_has_finding_of_generalized_seizure_now@@recurrent))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has convulsions that are both generalized and recurrent."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_acidemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acidemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acidemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acidemia.","meaning":"Boolean indicating whether the patient currently has acidemia."} ;; "acidemia"
(declare-const patient_has_finding_of_acidosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acidosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acidosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acidosis.","meaning":"Boolean indicating whether the patient currently has acidosis as a clinical finding."} ;; "acidosis"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not (or patient_has_finding_of_acidemia_now
              patient_has_finding_of_acidosis_now))
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acidemia or acidosis (signs of acidemia or acidosis that are clinical)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_hemoglobinuria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hemoglobinuria.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hemoglobinuria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hemoglobinuria.","meaning":"Boolean indicating whether the patient currently has hemoglobinuria."} ;; "hemoglobinuria"
(declare-const patient_has_finding_of_hemoglobinuria_now@@is_macroscopic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hemoglobinuria is macroscopic.","when_to_set_to_false":"Set to false if the patient's hemoglobinuria is not macroscopic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hemoglobinuria is macroscopic.","meaning":"Boolean indicating whether the patient's hemoglobinuria is macroscopic."} ;; "hemoglobinuria that is macroscopic"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_hemoglobinuria_now@@is_macroscopic
      patient_has_finding_of_hemoglobinuria_now)
   :named REQ10_AUXILIARY0)) ;; "hemoglobinuria that is macroscopic"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_hemoglobinuria_now@@is_macroscopic)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hemoglobinuria that is macroscopic."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_jaundice_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of jaundice, regardless of how it is determined (laboratory or clinical criteria).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of jaundice.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has jaundice.","meaning":"Boolean indicating whether the patient currently has jaundice."} ;; "jaundice"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_jaundice_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has jaundice. (If laboratory tests for measuring jaundice are not available at the study site, clinical criteria for jaundice may be used at the discretion of the study physician.)"

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_chronic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of chronic disease.","when_to_set_to_false":"Set to false if the patient does not have a history of chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of chronic disease.","meaning":"Boolean indicating whether the patient has a history of chronic disease."} ;; "diseases that are chronic"
(declare-const patient_has_finding_of_chronic_disease_inthehistory@@determined_by_medical_history_and_physical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of chronic disease is determined clinically by medical history and physical examination.","when_to_set_to_false":"Set to false if the patient's history of chronic disease is not determined clinically by medical history and physical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of chronic disease is determined clinically by medical history and physical examination.","meaning":"Boolean indicating whether the patient's history of chronic disease is determined clinically by medical history and physical examination."} ;; "determined clinically by medical history AND physical examination"
(declare-const patient_has_finding_of_heart_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of heart disease.","when_to_set_to_false":"Set to false if the patient does not have a history of heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of heart disease.","meaning":"Boolean indicating whether the patient has a history of heart disease."} ;; "heart disease"
(declare-const patient_has_finding_of_heart_disease_inthehistory@@determined_by_medical_history_and_physical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of heart disease is determined clinically by medical history and physical examination.","when_to_set_to_false":"Set to false if the patient's history of heart disease is not determined clinically by medical history and physical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of heart disease is determined clinically by medical history and physical examination.","meaning":"Boolean indicating whether the patient's history of heart disease is determined clinically by medical history and physical examination."} ;; "determined clinically by medical history AND physical examination"
(declare-const patient_has_finding_of_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of kidney disease.","when_to_set_to_false":"Set to false if the patient does not have a history of kidney disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of kidney disease.","meaning":"Boolean indicating whether the patient has a history of kidney disease."} ;; "kidney disease"
(declare-const patient_has_finding_of_kidney_disease_inthehistory@@determined_by_medical_history_and_physical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of kidney disease is determined clinically by medical history and physical examination.","when_to_set_to_false":"Set to false if the patient's history of kidney disease is not determined clinically by medical history and physical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of kidney disease is determined clinically by medical history and physical examination.","meaning":"Boolean indicating whether the patient's history of kidney disease is determined clinically by medical history and physical examination."} ;; "determined clinically by medical history AND physical examination"
(declare-const patient_has_finding_of_disease_of_liver_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of liver disease.","when_to_set_to_false":"Set to false if the patient does not have a history of liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of liver disease.","meaning":"Boolean indicating whether the patient has a history of liver disease."} ;; "liver disease"
(declare-const patient_has_finding_of_disease_of_liver_inthehistory@@determined_by_medical_history_and_physical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of liver disease is determined clinically by medical history and physical examination.","when_to_set_to_false":"Set to false if the patient's history of liver disease is not determined clinically by medical history and physical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of liver disease is determined clinically by medical history and physical examination.","meaning":"Boolean indicating whether the patient's history of liver disease is determined clinically by medical history and physical examination."} ;; "determined clinically by medical history AND physical examination"
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient does not have a history of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient has a history of human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory@@chronic_or_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of human immunodeficiency virus infection is chronic or severe.","when_to_set_to_false":"Set to false if the patient's history of human immunodeficiency virus infection is not chronic or severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of human immunodeficiency virus infection is chronic or severe.","meaning":"Boolean indicating whether the patient's history of human immunodeficiency virus infection is chronic or severe."} ;; "chronic OR severe"
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory@@determined_by_medical_history_and_physical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of human immunodeficiency virus infection is determined clinically by medical history and physical examination.","when_to_set_to_false":"Set to false if the patient's history of human immunodeficiency virus infection is not determined clinically by medical history and physical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of human immunodeficiency virus infection is determined clinically by medical history and physical examination.","meaning":"Boolean indicating whether the patient's history of human immunodeficiency virus infection is determined clinically by medical history and physical examination."} ;; "determined clinically by medical history AND physical examination"
(declare-const patient_has_finding_of_aids_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of acquired immunodeficiency syndrome (AIDS).","when_to_set_to_false":"Set to false if the patient does not have a history of acquired immunodeficiency syndrome (AIDS).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of acquired immunodeficiency syndrome (AIDS).","meaning":"Boolean indicating whether the patient has a history of acquired immunodeficiency syndrome (AIDS)."} ;; "acquired immunodeficiency syndrome"
(declare-const patient_has_finding_of_malnutrition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of malnutrition.","when_to_set_to_false":"Set to false if the patient does not have a history of malnutrition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of malnutrition.","meaning":"Boolean indicating whether the patient has a history of malnutrition."} ;; "malnutrition"
(declare-const patient_has_finding_of_malnutrition_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of malnutrition is severe.","when_to_set_to_false":"Set to false if the patient's history of malnutrition is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of malnutrition is severe.","meaning":"Boolean indicating whether the patient's history of malnutrition is severe."} ;; "malnutrition that is severe"
(declare-const patient_has_finding_of_malnutrition_inthehistory@@determined_by_medical_history_and_physical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of malnutrition is determined clinically by medical history and physical examination.","when_to_set_to_false":"Set to false if the patient's history of malnutrition is not determined clinically by medical history and physical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of malnutrition is determined clinically by medical history and physical examination.","meaning":"Boolean indicating whether the patient's history of malnutrition is determined clinically by medical history and physical examination."} ;; "determined clinically by medical history AND physical examination"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Non-exhaustive examples imply umbrella term (chronic/severe disease history)
(assert
(! (=> (or patient_has_finding_of_heart_disease_inthehistory@@determined_by_medical_history_and_physical_examination
           patient_has_finding_of_kidney_disease_inthehistory@@determined_by_medical_history_and_physical_examination
           patient_has_finding_of_disease_of_liver_inthehistory@@determined_by_medical_history_and_physical_examination
           patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory@@chronic_or_severe
           patient_has_finding_of_aids_inthehistory
           patient_has_finding_of_malnutrition_inthehistory@@severe)
        (or patient_has_finding_of_chronic_disease_inthehistory@@determined_by_medical_history_and_physical_examination
            ;; Note: severe disease not separately declared, so only chronic disease with this qualifier is used
        ))
:named REQ12_AUXILIARY0)) ;; "with non-exhaustive examples ((heart disease) OR (kidney disease) OR (liver disease) OR (human immunodeficiency virus infection/acquired immunodeficiency syndrome) OR (malnutrition that is severe)), determined clinically by medical history AND physical examination."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_chronic_disease_inthehistory@@determined_by_medical_history_and_physical_examination
       patient_has_finding_of_chronic_disease_inthehistory)
:named REQ12_AUXILIARY1)) ;; "determined clinically by medical history AND physical examination"

(assert
(! (=> patient_has_finding_of_heart_disease_inthehistory@@determined_by_medical_history_and_physical_examination
       patient_has_finding_of_heart_disease_inthehistory)
:named REQ12_AUXILIARY2)) ;; "determined clinically by medical history AND physical examination"

(assert
(! (=> patient_has_finding_of_kidney_disease_inthehistory@@determined_by_medical_history_and_physical_examination
       patient_has_finding_of_kidney_disease_inthehistory)
:named REQ12_AUXILIARY3)) ;; "determined clinically by medical history AND physical examination"

(assert
(! (=> patient_has_finding_of_disease_of_liver_inthehistory@@determined_by_medical_history_and_physical_examination
       patient_has_finding_of_disease_of_liver_inthehistory)
:named REQ12_AUXILIARY4)) ;; "determined clinically by medical history AND physical examination"

(assert
(! (=> patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory@@chronic_or_severe
       patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory)
:named REQ12_AUXILIARY5)) ;; "chronic OR severe"

(assert
(! (=> patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory@@determined_by_medical_history_and_physical_examination
       patient_has_finding_of_human_immunodeficiency_virus_infection_inthehistory)
:named REQ12_AUXILIARY6)) ;; "determined clinically by medical history AND physical examination"

(assert
(! (=> patient_has_finding_of_malnutrition_inthehistory@@severe
       patient_has_finding_of_malnutrition_inthehistory)
:named REQ12_AUXILIARY7)) ;; "malnutrition that is severe"

(assert
(! (=> patient_has_finding_of_malnutrition_inthehistory@@determined_by_medical_history_and_physical_examination
       patient_has_finding_of_malnutrition_inthehistory)
:named REQ12_AUXILIARY8)) ;; "determined clinically by medical history AND physical examination"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (or patient_has_finding_of_chronic_disease_inthehistory@@determined_by_medical_history_and_physical_examination))
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of diseases that are chronic OR severe with non-exhaustive examples ((heart disease) OR (kidney disease) OR (liver disease) OR (human immunodeficiency virus infection/acquired immunodeficiency syndrome) OR (malnutrition that is severe)), determined clinically by medical history AND physical examination."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_hypersensitivity_to_artesunate_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to artesunate.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity to artesunate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to artesunate.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to artesunate."} ;; "artesunate"
(declare-const patient_has_hypersensitivity_to_mefloquine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to mefloquine.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity to mefloquine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to mefloquine.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to mefloquine."} ;; "mefloquine"
(declare-const patient_has_hypersensitivity_to_quinine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to quinine.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity to quinine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to quinine.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to quinine."} ;; "quinine"
(declare-const patient_has_hypersensitivity_to_tetracycline_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to tetracycline.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity to tetracycline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to tetracycline.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to tetracycline."} ;; "tetracycline"
(declare-const patient_has_hypersensitivity_to_clindamycin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to clindamycin.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity to clindamycin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to clindamycin.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to clindamycin."} ;; "clindamycin"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_hypersensitivity_to_artesunate_inthehistory)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to artesunate."

(assert
(! (not patient_has_hypersensitivity_to_mefloquine_inthehistory)
:named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to mefloquine."

(assert
(! (not patient_has_hypersensitivity_to_quinine_inthehistory)
:named REQ13_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to quinine."

(assert
(! (not patient_has_hypersensitivity_to_tetracycline_inthehistory)
:named REQ13_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to tetracycline."

(assert
(! (not patient_has_hypersensitivity_to_clindamycin_inthehistory)
:named REQ13_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to clindamycin."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if there is evidence from a serum pregnancy test or medical history that the patient is currently pregnant.","when_to_set_to_false":"Set to false if there is evidence from a serum pregnancy test or medical history that the patient is not currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined from available information.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant based on a serum pregnancy test OR medical history"

(declare-const patient_desires_to_become_pregnant_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses a desire to become pregnant during the study period.","when_to_set_to_false":"Set to false if the patient does not express a desire to become pregnant during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient desires to become pregnant during the study period.","meaning":"Boolean indicating whether the patient desires to become pregnant during the study period."} ;; "the patient desires to become pregnant during the study period"

(declare-const patient_is_sexually_active_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently sexually active.","when_to_set_to_false":"Set to false if the patient is currently not sexually active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently sexually active.","meaning":"Boolean indicating whether the patient is currently sexually active."} ;; "the patient is sexually active"

(declare-const patient_is_using_family_planning_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using any method of family planning.","when_to_set_to_false":"Set to false if the patient is currently not using any method of family planning.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using any method of family planning.","meaning":"Boolean indicating whether the patient is currently using any method of family planning."} ;; "the patient is not using any method of family planning"

(declare-const patient_is_using_family_planning_now@@confirmed_by_urine_pregnancy_test Bool) ;; {"when_to_set_to_true":"Set to true if the patient's use of family planning is confirmed by a urine pregnancy test.","when_to_set_to_false":"Set to false if the patient's use of family planning is not confirmed by a urine pregnancy test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's use of family planning is confirmed by a urine pregnancy test.","meaning":"Boolean indicating whether the patient's use of family planning is confirmed by a urine pregnancy test."} ;; "confirmed by urine pregnancy test"

(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential (e.g., is of reproductive age and has not undergone sterilization or menopause).","when_to_set_to_false":"Set to false if the patient does not have childbearing potential (e.g., due to sterilization, menopause, or other reasons).","when_to_set_to_null":"Set to null if the patient's childbearing potential is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "the patient is sexually active"

(declare-const patient_is_able_to_be_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to become pregnant (e.g., has childbearing potential and is not infertile).","when_to_set_to_false":"Set to false if the patient is not able to become pregnant (e.g., due to surgical sterilization, menopause, or other reasons).","when_to_set_to_null":"Set to null if the patient's ability to become pregnant is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently able to become pregnant."} ;; "the patient desires to become pregnant during the study period"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_using_family_planning_now@@confirmed_by_urine_pregnancy_test
      patient_is_using_family_planning_now)
:named REQ14_AUXILIARY0)) ;; "confirmed by urine pregnancy test"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not
      (or patient_is_pregnant_now
          patient_desires_to_become_pregnant_during_study_period
          (and patient_is_sexually_active_now
               (not patient_is_using_family_planning_now@@confirmed_by_urine_pregnancy_test))
      )
   )
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is pregnant based on a serum pregnancy test OR medical history) OR (the patient desires to become pregnant during the study period) OR ((the patient is sexually active) AND (the patient is not using any method of family planning, confirmed by urine pregnancy test))."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const child_being_breastfed_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the age in months of the child currently being breastfed by the patient, if known.","when_to_set_to_null":"Set to null if the age in months of the child currently being breastfed by the patient is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the age in months of the child currently being breastfed by the patient."} ;; "child who is under six months old"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding any child.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding any child.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding a child"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breastfeeding.","meaning":"Boolean indicating whether the patient is currently breastfeeding."} ;; "breastfeeding"
(declare-const patients_breastfeeding_is_positive_now@@of_child_under_six_months_old Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding a child who is under six months old.","when_to_set_to_false":"Set to false if the patient is currently breastfeeding but the child is not under six months old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the child being breastfed is under six months old.","meaning":"Boolean indicating whether the patient is currently breastfeeding a child who is under six months old."} ;; "the patient is breastfeeding a child who is under six months old"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patients_breastfeeding_is_positive_now@@of_child_under_six_months_old
     patients_breastfeeding_is_positive_now)
:named REQ15_AUXILIARY0)) ;; "patients_breastfeeding_is_positive_now@@of_child_under_six_months_old implies patients_breastfeeding_is_positive_now"

;; Qualifier variable definition: patient is breastfeeding a child AND child is under 6 months old
(assert
(! (= patients_breastfeeding_is_positive_now@@of_child_under_six_months_old
     (and patient_is_breastfeeding_now
          (< child_being_breastfed_age_value_recorded_now_in_months 6)))
:named REQ15_AUXILIARY1)) ;; "patients_breastfeeding_is_positive_now@@of_child_under_six_months_old = patient_is_breastfeeding_now AND child_being_breastfed_age_value_recorded_now_in_months < 6"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patients_breastfeeding_is_positive_now@@of_child_under_six_months_old)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breastfeeding a child who is under six months old."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_is_exposed_to_antimalarial_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received or been exposed to any antimalarial substance in the previous seven days.","when_to_set_to_false":"Set to false if the patient has not received or been exposed to any antimalarial substance in the previous seven days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to antimalarial substances in the previous seven days.","meaning":"Boolean indicating whether the patient has been exposed to antimalarial substances in the previous seven days."} ;; "drugs that are antimalarial in the previous seven days"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_is_exposed_to_antimalarial_inthepast7days)
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received drugs that are antimalarial in the previous seven days."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_finding_of_unable_to_eat_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to eat.","when_to_set_to_false":"Set to false if the patient currently does not have inability to eat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to eat.","meaning":"Boolean indicating whether the patient currently has inability to eat."} ;; "inability to eat"
(declare-const patient_has_finding_of_unable_to_drink_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to drink.","when_to_set_to_false":"Set to false if the patient currently does not have inability to drink.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to drink.","meaning":"Boolean indicating whether the patient currently has inability to drink."} ;; "inability to drink"
(declare-const patient_vomiting_value_recorded_inthepast24hours_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of vomiting episodes recorded for the patient in the past 24 hours.","when_to_set_to_null":"Set to null if the number of vomiting episodes in the past 24 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric count of vomiting episodes in the past 24 hours."} ;; "vomiting more than twice in the last twenty-four hours"
(declare-const patient_seizure_value_recorded_inthepast24hours_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of seizure episodes recorded for the patient in the past 24 hours.","when_to_set_to_null":"Set to null if the number of seizure episodes in the past 24 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric count of seizure episodes in the past 24 hours."} ;; "history of seizures that is recent, defined as one or more in the previous twenty-four hours"
(declare-const patient_has_finding_of_disturbance_of_consciousness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an altered level of consciousness.","when_to_set_to_false":"Set to false if the patient currently does not have an altered level of consciousness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an altered level of consciousness.","meaning":"Boolean indicating whether the patient currently has an altered level of consciousness."} ;; "altered level of consciousness"
(declare-const patient_has_finding_of_unable_to_sit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to sit.","when_to_set_to_false":"Set to false if the patient currently does not have inability to sit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to sit.","meaning":"Boolean indicating whether the patient currently has inability to sit."} ;; "inability to sit"
(declare-const patient_has_finding_of_unable_to_stand_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to stand.","when_to_set_to_false":"Set to false if the patient currently does not have inability to stand.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to stand.","meaning":"Boolean indicating whether the patient currently has inability to stand."} ;; "inability to stand"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_finding_of_unable_to_eat_now)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inability to eat."

(assert
(! (not patient_has_finding_of_unable_to_drink_now)
:named REQ17_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inability to drink."

(assert
(! (not (> patient_vomiting_value_recorded_inthepast24hours_withunit_count 2))
:named REQ17_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has vomiting more than twice in the last twenty-four hours."

(assert
(! (not (>= patient_seizure_value_recorded_inthepast24hours_withunit_count 1))
:named REQ17_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has a history of seizures that is recent, defined as one or more in the previous twenty-four hours."

(assert
(! (not patient_has_finding_of_disturbance_of_consciousness_now)
:named REQ17_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an altered level of consciousness."

(assert
(! (not patient_has_finding_of_unable_to_sit_now)
:named REQ17_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inability to sit."

(assert
(! (not patient_has_finding_of_unable_to_stand_now)
:named REQ17_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inability to stand."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_undergone_splenectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if there is evidence that the patient has ever undergone a splenectomy at any point in their medical history.","when_to_set_to_false":"Set to false if there is evidence that the patient has never undergone a splenectomy at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a splenectomy.","meaning":"Boolean indicating whether the patient has ever undergone a splenectomy in their medical history."} ;; "The patient is excluded if the patient has a history of splenectomy."

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_has_undergone_splenectomy_inthehistory)
    :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of splenectomy."
