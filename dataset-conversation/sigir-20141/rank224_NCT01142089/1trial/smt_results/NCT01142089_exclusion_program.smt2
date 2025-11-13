;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_body_temperature_value_recorded_now_withunit_degrees_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body temperature in degrees Celsius is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body temperature in degrees Celsius."} ;; "body temperature > 38 degrees Celsius"
(declare-const patient_body_temperature_value_recorded_now_withunit_degrees_fahrenheit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body temperature in degrees Fahrenheit is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body temperature in degrees Fahrenheit."} ;; "body temperature > 100.4 degrees Fahrenheit"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of fever.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of fever.","meaning":"Boolean indicating whether the patient currently has fever."} ;; "the patient has fever"
(declare-const patient_has_finding_of_signs_of_systemic_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has signs of systemic infection.","when_to_set_to_false":"Set to false if the patient currently does not have signs of systemic infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has signs of systemic infection.","meaning":"Boolean indicating whether the patient currently has signs of systemic infection."} ;; "the patient has presence of signs of systemic infection"
(declare-const patient_has_finding_of_symptoms_of_systemic_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of systemic infection.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of systemic infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of systemic infection.","meaning":"Boolean indicating whether the patient currently has symptoms of systemic infection."} ;; "the patient has presence of symptoms of systemic infection"
(declare-const patient_has_received_antipyretic_medication_within_6_hours_before_assessment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received antipyretic medication within 6 hours before this assessment.","when_to_set_to_false":"Set to false if the patient has not received antipyretic medication within 6 hours before this assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received antipyretic medication within 6 hours before this assessment.","meaning":"Boolean indicating whether the patient has received antipyretic medication within 6 hours before this assessment."} ;; "the patient has NOT received antipyretic medication within 6 hours before this assessment"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and
    (or
        patient_has_finding_of_fever_now ;; "the patient has fever"
        (> patient_body_temperature_value_recorded_now_withunit_degrees_fahrenheit 100.4) ;; "body temperature > 100.4 degrees Fahrenheit"
        (> patient_body_temperature_value_recorded_now_withunit_degrees_celsius 38) ;; "body temperature > 38 degrees Celsius"
        patient_has_finding_of_signs_of_systemic_infection_now ;; "presence of signs of systemic infection"
        patient_has_finding_of_symptoms_of_systemic_infection_now ;; "presence of symptoms of systemic infection"
    )
    (not patient_has_received_antipyretic_medication_within_6_hours_before_assessment) ;; "the patient has NOT received antipyretic medication within 6 hours before this assessment"
))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has fever (body temperature > 100.4 degrees Fahrenheit) OR (body temperature > 38 degrees Celsius) OR (the patient has presence of signs of systemic infection) OR (the patient has presence of symptoms of systemic infection)) AND (the patient has NOT received antipyretic medication within 6 hours before this assessment))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a disorder due to infection at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a disorder due to infection at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a disorder due to infection.","meaning":"Boolean indicating whether the patient has ever had a disorder due to infection in the past."} ;; "infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_inthehistory@@known_infection Bool) ;; {"when_to_set_to_true":"Set to true if the infection is known (confirmed diagnosis).","when_to_set_to_false":"Set to false if the infection is not known (not confirmed, e.g., only suspected).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is known.","meaning":"Boolean indicating whether the infection is known (confirmed)."} ;; "known infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_inthehistory@@non_bacterial_pathogen Bool) ;; {"when_to_set_to_true":"Set to true if the infection is due to a non-bacterial pathogen.","when_to_set_to_false":"Set to false if the infection is not due to a non-bacterial pathogen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is due to a non-bacterial pathogen.","meaning":"Boolean indicating whether the infection is due to a non-bacterial pathogen."} ;; "non-bacterial pathogen"
(declare-const patient_has_finding_of_disorder_due_to_infection_inthehistory@@temporalcontext_before_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the infection occurred before randomization.","when_to_set_to_false":"Set to false if the infection did not occur before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection occurred before randomization.","meaning":"Boolean indicating whether the infection occurred before randomization."} ;; "before randomization"
(declare-const patient_has_finding_of_disorder_due_to_infection_inthehistory@@suspected_infection Bool) ;; {"when_to_set_to_true":"Set to true if the infection is suspected (not confirmed, but clinically suspected).","when_to_set_to_false":"Set to false if the infection is not suspected (e.g., confirmed or ruled out).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is suspected.","meaning":"Boolean indicating whether the infection is suspected."} ;; "suspected infection"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_inthehistory@@known_infection
      patient_has_finding_of_disorder_due_to_infection_inthehistory)
   :named REQ1_AUXILIARY0)) ;; "known infection"

(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_inthehistory@@suspected_infection
      patient_has_finding_of_disorder_due_to_infection_inthehistory)
   :named REQ1_AUXILIARY1)) ;; "suspected infection"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have known infection with non-bacterial pathogen before randomization
(assert
(! (not (and patient_has_finding_of_disorder_due_to_infection_inthehistory@@known_infection
             patient_has_finding_of_disorder_due_to_infection_inthehistory@@non_bacterial_pathogen
             patient_has_finding_of_disorder_due_to_infection_inthehistory@@temporalcontext_before_randomization))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known infection with non-bacterial pathogen before randomization."

;; Exclusion: patient must NOT have suspected infection with non-bacterial pathogen before randomization
(assert
(! (not (and patient_has_finding_of_disorder_due_to_infection_inthehistory@@suspected_infection
             patient_has_finding_of_disorder_due_to_infection_inthehistory@@non_bacterial_pathogen
             patient_has_finding_of_disorder_due_to_infection_inthehistory@@temporalcontext_before_randomization))
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected infection with non-bacterial pathogen before randomization."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_diarrhea_value_recorded_now_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours the patient has had diarrhea if this information is available now.","when_to_set_to_null":"Set to null if the duration in hours of diarrhea is unknown, not documented, or cannot be determined for the patient as of now.","meaning":"Numeric value representing the duration in hours that the patient has had diarrhea as of now."} ;; "diarrhea for duration > 72 hours"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (> patient_diarrhea_value_recorded_now_withunit_hours 72))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diarrhea for duration > 72 hours."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_hematochezia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hematochezia (bloody stool).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hematochezia (bloody stool).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hematochezia (bloody stool).","meaning":"Boolean indicating whether the patient currently has hematochezia (bloody stool)."} ;; "bloody stool"
(declare-const patient_has_finding_of_hematochezia_now@@grossly_bloody Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hematochezia (bloody stool) is grossly bloody.","when_to_set_to_false":"Set to false if the patient's hematochezia (bloody stool) is not grossly bloody.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hematochezia (bloody stool) is grossly bloody.","meaning":"Boolean indicating whether the patient's hematochezia (bloody stool) is grossly bloody."} ;; "grossly bloody stool"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hematochezia_now@@grossly_bloody
      patient_has_finding_of_hematochezia_now)
    :named REQ3_AUXILIARY0)) ;; "grossly bloody stool" implies "bloody stool"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_hematochezia_now@@grossly_bloody)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has grossly bloody stool."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_dehydration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dehydration.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dehydration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dehydration.","meaning":"Boolean indicating whether the patient currently has dehydration."} ;; "dehydration"
(declare-const patient_has_finding_of_dehydration_now@@requires_treatment_with_intravenous_fluids Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current dehydration requires treatment with intravenous fluids.","when_to_set_to_false":"Set to false if the patient's current dehydration does not require treatment with intravenous fluids.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current dehydration requires treatment with intravenous fluids.","meaning":"Boolean indicating whether the patient's current dehydration requires treatment with intravenous fluids."} ;; "dehydration requiring treatment with intravenous fluids"
(declare-const patient_has_finding_of_moderate_dehydration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of moderate dehydration.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of moderate dehydration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has moderate dehydration.","meaning":"Boolean indicating whether the patient currently has moderate dehydration."} ;; "moderate dehydration"
(declare-const patient_has_finding_of_orthostatic_hypotension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of orthostatic hypotension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of orthostatic hypotension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has orthostatic hypotension.","meaning":"Boolean indicating whether the patient currently has orthostatic hypotension."} ;; "orthostatic hypotension"
(declare-const patient_has_finding_of_severe_dehydration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe dehydration.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe dehydration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe dehydration.","meaning":"Boolean indicating whether the patient currently has severe dehydration."} ;; "severe dehydration"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: moderate dehydration = orthostatic hypotension OR dehydration requiring IV fluids
(assert
(! (= patient_has_finding_of_moderate_dehydration_now
      (or patient_has_finding_of_orthostatic_hypotension_now
          patient_has_finding_of_dehydration_now@@requires_treatment_with_intravenous_fluids))
    :named REQ4_AUXILIARY0)) ;; "moderate dehydration (defined as presence of orthostatic hypotension OR dehydration requiring treatment with intravenous fluids)"

;; Definition: severe dehydration = orthostatic hypotension OR dehydration requiring IV fluids
(assert
(! (= patient_has_finding_of_severe_dehydration_now
      (or patient_has_finding_of_orthostatic_hypotension_now
          patient_has_finding_of_dehydration_now@@requires_treatment_with_intravenous_fluids))
    :named REQ4_AUXILIARY1)) ;; "severe dehydration (defined as presence of orthostatic hypotension OR dehydration requiring treatment with intravenous fluids)"

;; Qualifier variable implies stem variable for dehydration
(assert
(! (=> patient_has_finding_of_dehydration_now@@requires_treatment_with_intravenous_fluids
       patient_has_finding_of_dehydration_now)
    :named REQ4_AUXILIARY2)) ;; "dehydration requiring treatment with intravenous fluids" implies "dehydration"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_moderate_dehydration_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has moderate dehydration (defined as presence of orthostatic hypotension OR dehydration requiring treatment with intravenous fluids)."

(assert
(! (not patient_has_finding_of_severe_dehydration_now)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe dehydration (defined as presence of orthostatic hypotension OR dehydration requiring treatment with intravenous fluids)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_ulcerative_colitis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with ulcerative colitis.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with ulcerative colitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with ulcerative colitis.","meaning":"Boolean indicating whether the patient has a history of ulcerative colitis."} ;; "The patient is excluded if the patient has a history of ulcerative colitis."

(declare-const patient_has_diagnosis_of_irritable_bowel_syndrome_with_diarrhea_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with diarrhea-predominant irritable bowel syndrome.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with diarrhea-predominant irritable bowel syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with diarrhea-predominant irritable bowel syndrome.","meaning":"Boolean indicating whether the patient has a history of diarrhea-predominant irritable bowel syndrome."} ;; "The patient is excluded if the patient has a history of diarrhea-predominant irritable bowel syndrome."

(declare-const patient_has_diagnosis_of_crohn_s_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with Crohn's disease.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with Crohn's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with Crohn's disease.","meaning":"Boolean indicating whether the patient has a history of Crohn's disease."} ;; "The patient is excluded if the patient has a history of Crohn's disease."

(declare-const patient_has_diagnosis_of_celiac_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with celiac disease.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with celiac disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with celiac disease.","meaning":"Boolean indicating whether the patient has a history of celiac disease."} ;; "The patient is excluded if the patient has a history of celiac sprue (gluten-enteropathy)."

(declare-const patient_has_diagnosis_of_chronic_pancreatitis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with chronic pancreatitis.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with chronic pancreatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with chronic pancreatitis.","meaning":"Boolean indicating whether the patient has a history of chronic pancreatitis."} ;; "The patient is excluded if the patient has a history of chronic pancreatitis."

(declare-const patient_has_diagnosis_of_malabsorption_syndrome_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with malabsorption syndrome.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with malabsorption syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with malabsorption syndrome.","meaning":"Boolean indicating whether the patient has a history of malabsorption syndrome."} ;; "The patient is excluded if the patient has a history of malabsorption."

(declare-const patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a disorder of the gastrointestinal tract.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a disorder of the gastrointestinal tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a disorder of the gastrointestinal tract.","meaning":"Boolean indicating whether the patient has a history of gastrointestinal disease."} ;; "The patient is excluded if the patient has a history of gastrointestinal disease associated with diarrhea..."

(declare-const patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_inthehistory@@associated_with_diarrhea Bool) ;; {"when_to_set_to_true":"Set to true if the patient's gastrointestinal disorder is associated with diarrhea.","when_to_set_to_false":"Set to false if the patient's gastrointestinal disorder is not associated with diarrhea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the gastrointestinal disorder is associated with diarrhea.","meaning":"Boolean indicating whether the patient's gastrointestinal disorder is associated with diarrhea."} ;; "gastrointestinal disease associated with diarrhea"

(declare-const patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_inthehistory@@excludes_lactose_intolerance_treated_with_lactase_supplements_if_regimen_maintained_during_study Bool) ;; {"when_to_set_to_true":"Set to true if lactose intolerance treated with lactase supplements (with regimen maintained during the study) is excluded from the gastrointestinal disorder finding.","when_to_set_to_false":"Set to false if lactose intolerance treated with lactase supplements (with regimen maintained during the study) is not excluded.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether lactose intolerance treated with lactase supplements (with regimen maintained during the study) is excluded.","meaning":"Boolean indicating whether lactose intolerance treated with lactase supplements (with regimen maintained during the study) is excluded from the gastrointestinal disorder finding."} ;; "EXCEPT for lactose intolerance treated with lactase supplements if this regimen was maintained during the study"

(declare-const patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_inthehistory@@excludes_lactose_intolerance_treated_with_lactose_free_diet_if_regimen_maintained_during_study Bool) ;; {"when_to_set_to_true":"Set to true if lactose intolerance treated with a lactose-free diet (with regimen maintained during the study) is excluded from the gastrointestinal disorder finding.","when_to_set_to_false":"Set to false if lactose intolerance treated with a lactose-free diet (with regimen maintained during the study) is not excluded.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether lactose intolerance treated with a lactose-free diet (with regimen maintained during the study) is excluded.","meaning":"Boolean indicating whether lactose intolerance treated with a lactose-free diet (with regimen maintained during the study) is excluded from the gastrointestinal disorder finding."} ;; "EXCEPT for lactose intolerance treated with a lactose-free diet if this regimen was maintained during the study"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_inthehistory@@associated_with_diarrhea
      patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_inthehistory)
:named REQ5_AUXILIARY0)) ;; "gastrointestinal disease associated with diarrhea"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_ulcerative_colitis_inthehistory)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of ulcerative colitis."

(assert
(! (not patient_has_diagnosis_of_irritable_bowel_syndrome_with_diarrhea_inthehistory)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of diarrhea-predominant irritable bowel syndrome."

(assert
(! (not patient_has_diagnosis_of_crohn_s_disease_inthehistory)
:named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of Crohn's disease."

(assert
(! (not patient_has_diagnosis_of_celiac_disease_inthehistory)
:named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of celiac sprue (gluten-enteropathy)."

(assert
(! (not patient_has_diagnosis_of_chronic_pancreatitis_inthehistory)
:named REQ5_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of chronic pancreatitis."

(assert
(! (not patient_has_diagnosis_of_malabsorption_syndrome_inthehistory)
:named REQ5_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of malabsorption."

;; Exclusion for gastrointestinal disease associated with diarrhea, except for lactose intolerance treated with lactase supplements or lactose-free diet if regimen maintained during study
(assert
(! (not (and
         patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_inthehistory@@associated_with_diarrhea
         (not patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_inthehistory@@excludes_lactose_intolerance_treated_with_lactase_supplements_if_regimen_maintained_during_study)
         (not patient_has_diagnosis_of_disorder_of_gastrointestinal_tract_inthehistory@@excludes_lactose_intolerance_treated_with_lactose_free_diet_if_regimen_maintained_during_study)
      ))
:named REQ5_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of gastrointestinal disease associated with diarrhea EXCEPT for lactose intolerance treated with lactase supplements if this regimen was maintained during the study OR lactose intolerance treated with a lactose-free diet if this regimen was maintained during the study."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const antidiarrheal_medication_dose_count_received_within_24_hours_before_randomization Real) ;; {"when_to_set_to_value":"Set to the total number of doses of antidiarrheal medication received by the patient within the 24 hours before randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many doses of antidiarrheal medication the patient received within the 24 hours before randomization.","meaning":"Numeric value representing the total number of doses of antidiarrheal medication received by the patient within the 24 hours before randomization."} ;; "has received > 2 doses of antidiarrheal medication ... within 24 hours before randomization"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (> antidiarrheal_medication_dose_count_received_within_24_hours_before_randomization 2))
:named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has received > 2 doses of antidiarrheal medication ... within 24 hours before randomization."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_taken_azithromycin_containing_product_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken an azithromycin containing product at any time in the past 7 days.","when_to_set_to_false":"Set to false if the patient has not taken an azithromycin containing product at any time in the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken an azithromycin containing product in the past 7 days.","meaning":"Boolean indicating whether the patient has taken an azithromycin containing product at any time in the past 7 days."} ;; "azithromycin within 7 days before randomization"
(declare-const patient_has_taken_fluoroquinolone_antibiotic_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a fluoroquinolone antibiotic at any time in the past 7 days.","when_to_set_to_false":"Set to false if the patient has not taken a fluoroquinolone antibiotic at any time in the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a fluoroquinolone antibiotic in the past 7 days.","meaning":"Boolean indicating whether the patient has taken a fluoroquinolone antibiotic at any time in the past 7 days."} ;; "fluoroquinolone antibiotic within 7 days before randomization"
(declare-const patient_has_taken_sulfamethoxazole_and_trimethoprim_containing_product_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a sulfamethoxazole and trimethoprim containing product at any time in the past 7 days.","when_to_set_to_false":"Set to false if the patient has not taken a sulfamethoxazole and trimethoprim containing product at any time in the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a sulfamethoxazole and trimethoprim containing product in the past 7 days.","meaning":"Boolean indicating whether the patient has taken a sulfamethoxazole and trimethoprim containing product at any time in the past 7 days."} ;; "trimethoprim-sulfamethoxazole within 7 days before randomization"
(declare-const patient_is_exposed_to_rifaximin_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to rifaximin at any time in the past 7 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to rifaximin at any time in the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to rifaximin in the past 7 days.","meaning":"Boolean indicating whether the patient has been exposed to rifaximin at any time in the past 7 days."} ;; "rifaximin within 7 days before randomization"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or patient_has_taken_azithromycin_containing_product_inthepast7days
            patient_has_taken_fluoroquinolone_antibiotic_inthepast7days
            patient_has_taken_sulfamethoxazole_and_trimethoprim_containing_product_inthepast7days
            patient_is_exposed_to_rifaximin_inthepast7days))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received at least one of the following antibiotics, which are active against gram negative bacteria: trimethoprim-sulfamethoxazole OR fluoroquinolone antibiotic OR azithromycin OR rifaximin within 7 days before randomization."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} ;; "the patient is female"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as not currently pregnant.","when_to_set_to_null":"Set to null if the patient's pregnancy status is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is documented as not currently breastfeeding.","when_to_set_to_null":"Set to null if the patient's breastfeeding status is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"
(declare-const patient_is_using_adequate_birth_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently using adequate birth control.","when_to_set_to_false":"Set to false if the patient is documented as not currently using adequate birth control.","when_to_set_to_null":"Set to null if the patient's use of adequate birth control is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient is currently using adequate birth control."} ;; "the patient is not using adequate birth control"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (and patient_sex_is_female_now
             (or patient_is_pregnant_now
                 patient_is_breastfeeding_now
                 (not patient_is_using_adequate_birth_control_now))))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is female) AND ((the patient is pregnant) OR (the patient is breastfeeding) OR (the patient is not using adequate birth control))."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_intolerance_to_rifamycin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intolerance to rifamycin.","when_to_set_to_false":"Set to false if the patient currently does not have intolerance to rifamycin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intolerance to rifamycin.","meaning":"Boolean indicating whether the patient currently has intolerance to rifamycin."} ;; "the patient has known intolerance to rifamycin"
(declare-const patient_has_intolerance_to_rifamycin_related_antibiotic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intolerance to any rifamycin-related antibiotic.","when_to_set_to_false":"Set to false if the patient currently does not have intolerance to any rifamycin-related antibiotic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intolerance to any rifamycin-related antibiotic.","meaning":"Boolean indicating whether the patient currently has intolerance to any rifamycin-related antibiotic."} ;; "the patient has known intolerance to rifamycin-related antibiotic"
(declare-const patient_has_intolerance_to_any_excipient_in_study_medications_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intolerance to any excipient included in the study medications.","when_to_set_to_false":"Set to false if the patient currently does not have intolerance to any excipient included in the study medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intolerance to any excipient included in the study medications.","meaning":"Boolean indicating whether the patient currently has intolerance to any excipient included in the study medications."} ;; "the patient has known intolerance to any excipient included in the study medications"
(declare-const patient_has_hypersensitivity_to_rifamycin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to rifamycin.","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to rifamycin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to rifamycin.","meaning":"Boolean indicating whether the patient currently has hypersensitivity to rifamycin."} ;; "the patient has hypersensitivity to rifamycin"
(declare-const patient_has_hypersensitivity_to_rifamycin_related_antibiotic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to any rifamycin-related antibiotic.","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to any rifamycin-related antibiotic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to any rifamycin-related antibiotic.","meaning":"Boolean indicating whether the patient currently has hypersensitivity to any rifamycin-related antibiotic."} ;; "the patient has hypersensitivity to rifamycin-related antibiotic"
(declare-const patient_has_hypersensitivity_to_any_excipient_in_study_medications_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to any excipient included in the study medications.","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to any excipient included in the study medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to any excipient included in the study medications.","meaning":"Boolean indicating whether the patient currently has hypersensitivity to any excipient included in the study medications."} ;; "the patient has hypersensitivity to any excipient included in the study medications"
(declare-const patient_has_resistance_to_rifamycin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has resistance to rifamycin.","when_to_set_to_false":"Set to false if the patient currently does not have resistance to rifamycin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has resistance to rifamycin.","meaning":"Boolean indicating whether the patient currently has resistance to rifamycin."} ;; "the patient has resistance to rifamycin"
(declare-const patient_has_resistance_to_rifamycin_related_antibiotic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has resistance to any rifamycin-related antibiotic.","when_to_set_to_false":"Set to false if the patient currently does not have resistance to any rifamycin-related antibiotic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has resistance to any rifamycin-related antibiotic.","meaning":"Boolean indicating whether the patient currently has resistance to any rifamycin-related antibiotic."} ;; "the patient has resistance to rifamycin-related antibiotic"
(declare-const patient_has_resistance_to_any_excipient_in_study_medications_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has resistance to any excipient included in the study medications.","when_to_set_to_false":"Set to false if the patient currently does not have resistance to any excipient included in the study medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has resistance to any excipient included in the study medications.","meaning":"Boolean indicating whether the patient currently has resistance to any excipient included in the study medications."} ;; "the patient has resistance to any excipient included in the study medications"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not patient_has_intolerance_to_rifamycin_now)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known intolerance to rifamycin."

(assert
  (! (not patient_has_intolerance_to_rifamycin_related_antibiotic_now)
     :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known intolerance to rifamycin-related antibiotic."

(assert
  (! (not patient_has_intolerance_to_any_excipient_in_study_medications_now)
     :named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known intolerance to any excipient included in the study medications."

(assert
  (! (not patient_has_hypersensitivity_to_rifamycin_now)
     :named REQ9_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to rifamycin."

(assert
  (! (not patient_has_hypersensitivity_to_rifamycin_related_antibiotic_now)
     :named REQ9_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to rifamycin-related antibiotic."

(assert
  (! (not patient_has_hypersensitivity_to_any_excipient_in_study_medications_now)
     :named REQ9_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to any excipient included in the study medications."

(assert
  (! (not patient_has_resistance_to_rifamycin_now)
     :named REQ9_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has resistance to rifamycin."

(assert
  (! (not patient_has_resistance_to_rifamycin_related_antibiotic_now)
     :named REQ9_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has resistance to rifamycin-related antibiotic."

(assert
  (! (not patient_has_resistance_to_any_excipient_in_study_medications_now)
     :named REQ9_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has resistance to any excipient included in the study medications."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_unable_to_comply_with_study_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to comply with the study protocol for any reason.","when_to_set_to_false":"Set to false if the patient is currently able to comply with the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to comply with the study protocol.","meaning":"Boolean indicating whether the patient is currently unable to comply with the study protocol for any reason."} ;; "the patient is unable to comply with the study protocol"
(declare-const patient_is_unable_to_comply_with_study_protocol_now@@due_to_travel_schedule Bool) ;; {"when_to_set_to_true":"Set to true if the patient's inability to comply with the study protocol is due to travel schedule.","when_to_set_to_false":"Set to false if the patient's inability to comply with the study protocol is not due to travel schedule.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's inability to comply with the study protocol is due to travel schedule.","meaning":"Boolean indicating whether the patient's inability to comply with the study protocol is due to travel schedule."} ;; "unable to comply with the study protocol due to travel schedule"
(declare-const patient_is_unwilling_to_comply_with_study_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to comply with the study protocol for any reason.","when_to_set_to_false":"Set to false if the patient is currently willing to comply with the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unwilling to comply with the study protocol.","meaning":"Boolean indicating whether the patient is currently unwilling to comply with the study protocol for any reason."} ;; "the patient is unwilling to comply with the study protocol"
(declare-const patient_has_finding_of_alcoholism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of alcoholism.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of alcoholism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of alcoholism.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of alcoholism."} ;; "unable to comply with the study protocol due to alcoholism"
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of mental disorder.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of mental disorder."} ;; "unable to comply with the study protocol due to mental illness"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Non-exhaustive examples imply umbrella term (unable to comply)
(assert
(! (=> (or patient_has_finding_of_alcoholism_now
           patient_has_finding_of_mental_disorder_now
           patient_is_unable_to_comply_with_study_protocol_now@@due_to_travel_schedule)
    patient_is_unable_to_comply_with_study_protocol_now)
:named REQ10_AUXILIARY0)) ;; "with non-exhaustive examples ((the patient is unable to comply with the study protocol due to alcoholism) OR (the patient is unable to comply with the study protocol due to mental illness) OR (the patient is unable to comply with the study protocol due to travel schedule))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_unable_to_comply_with_study_protocol_now@@due_to_travel_schedule
    patient_is_unable_to_comply_with_study_protocol_now)
:named REQ10_AUXILIARY1)) ;; "unable to comply with the study protocol due to travel schedule"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_is_unable_to_comply_with_study_protocol_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to comply with the study protocol."

(assert
(! (not patient_is_unwilling_to_comply_with_study_protocol_now)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unwilling to comply with the study protocol."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a drug or medicament within the past 30 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to a drug or medicament within the past 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a drug or medicament within the past 30 days.","meaning":"Boolean indicating whether the patient has been exposed to a drug or medicament within the past 30 days."} ;; "has participated in a clinical study with another investigational drug within the thirty days prior to randomization"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@investigational_drug_used_in_another_clinical_study Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient was exposed to within the past 30 days is an investigational drug used in another clinical study.","when_to_set_to_false":"Set to false if the drug or medicament the patient was exposed to within the past 30 days is not an investigational drug used in another clinical study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament was investigational and used in another clinical study.","meaning":"Boolean indicating whether the drug or medicament the patient was exposed to within the past 30 days is an investigational drug used in another clinical study."} ;; "has participated in a clinical study with another investigational drug within the thirty days prior to randomization"
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a drug or medicament.","when_to_set_to_false":"Set to false if the patient is not currently exposed to a drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to a drug or medicament."} ;; "participates in a clinical study with another investigational drug while participating in this study"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@investigational_drug_used_in_another_clinical_study_while_participating_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament the patient is currently exposed to is an investigational drug used in another clinical study while the patient is participating in this study.","when_to_set_to_false":"Set to false if the drug or medicament the patient is currently exposed to is not an investigational drug used in another clinical study while the patient is participating in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is investigational and used in another clinical study while the patient is participating in this study.","meaning":"Boolean indicating whether the drug or medicament the patient is currently exposed to is an investigational drug used in another clinical study while the patient is participating in this study."} ;; "participates in a clinical study with another investigational drug while participating in this study"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable (past 30 days)
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@investigational_drug_used_in_another_clinical_study
      patient_is_exposed_to_drug_or_medicament_inthepast30days)
    :named REQ11_AUXILIARY0)) ;; "the patient has participated in a clinical study with another investigational drug within the thirty days prior to randomization"

;; Qualifier variable implies corresponding stem variable (now)
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@investigational_drug_used_in_another_clinical_study_while_participating_in_this_study
      patient_is_exposed_to_drug_or_medicament_now)
    :named REQ11_AUXILIARY1)) ;; "the patient participates in a clinical study with another investigational drug while participating in this study"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (or patient_is_exposed_to_drug_or_medicament_inthepast30days@@investigational_drug_used_in_another_clinical_study
            patient_is_exposed_to_drug_or_medicament_now@@investigational_drug_used_in_another_clinical_study_while_participating_in_this_study))
    :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has participated in a clinical study with another investigational drug within the thirty days prior to randomization) OR (the patient participates in a clinical study with another investigational drug while participating in this study)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_previously_participated_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated in this study.","when_to_set_to_false":"Set to false if the patient has not previously participated in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated in this study.","meaning":"Boolean indicating whether the patient has previously participated in this study."} ;; "The patient is excluded if the patient has previously participated in this study."

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_previously_participated_in_this_study)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously participated in this study."
