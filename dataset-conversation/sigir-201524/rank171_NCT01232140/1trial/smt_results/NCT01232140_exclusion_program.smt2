;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const patient_is_woman_of_childbearing_age_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a woman of childbearing age.","when_to_set_to_false":"Set to false if the patient is currently not a woman of childbearing age.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a woman of childbearing age.","meaning":"Boolean indicating whether the patient is currently a woman of childbearing age."} ;; "the patient is a woman of childbearing age"
(declare-const patient_is_woman_of_childbearing_age_now@@not_using_acceptable_method_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a woman of childbearing age and is NOT using an acceptable method of contraception.","when_to_set_to_false":"Set to false if the patient is currently a woman of childbearing age and IS using an acceptable method of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a woman of childbearing age and is NOT using an acceptable method of contraception.","meaning":"Boolean indicating whether the patient is currently a woman of childbearing age and is NOT using an acceptable method of contraception."} ;; "the patient is a woman of childbearing age not using an acceptable method of contraception"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential.","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "the patient is a woman of childbearing age"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_woman_of_childbearing_age_now@@not_using_acceptable_method_of_contraception_now
     patient_is_woman_of_childbearing_age_now)
:named REQ0_AUXILIARY0)) ;; "the patient is a woman of childbearing age not using an acceptable method of contraception"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient is pregnant OR patient is lactating OR (patient is a woman of childbearing age AND NOT using acceptable contraception)
(assert
(! (not (or patient_is_pregnant_now
            patient_is_lactating_now
            patient_is_woman_of_childbearing_age_now@@not_using_acceptable_method_of_contraception_now))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is pregnant) OR (the patient is lactating) OR ((the patient is a woman of childbearing age) AND (the patient is NOT using an acceptable method of contraception)))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_administration_of_steroid_value_recorded_now_withunit_mg Real) ;; {"when_to_set_to_value":"Set to the cumulative dose in mg if corticosteroid therapy has been administered to the patient for the present exacerbation and the total dose is known.","when_to_set_to_null":"Set to null if corticosteroid therapy has not been administered for the present exacerbation or the cumulative dose is unknown.","meaning":"Numeric value representing the cumulative dose (in mg) of corticosteroid therapy administered to the patient now."} ;; "corticosteroid therapy (cumulative dose > 210 mg)"

(declare-const patient_administration_of_steroid_value_recorded_now_withunit_mg@@for_present_exacerbation Bool) ;; {"when_to_set_to_true":"Set to true if the corticosteroid therapy administered to the patient now was specifically for the present exacerbation.","when_to_set_to_false":"Set to false if the corticosteroid therapy administered to the patient now was not for the present exacerbation.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the corticosteroid therapy administered now was for the present exacerbation.","meaning":"Boolean indicating whether the corticosteroid therapy administered now was for the present exacerbation."} ;; "for the present exacerbation"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and patient_administration_of_steroid_value_recorded_now_withunit_mg@@for_present_exacerbation
             (> patient_administration_of_steroid_value_recorded_now_withunit_mg 210)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received pretreatment with corticosteroid therapy (cumulative dose > 210 mg) for the present exacerbation."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_progression_of_radiographic_abnormality_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has progression of radiographic abnormality.","when_to_set_to_false":"Set to false if the patient currently does not have progression of radiographic abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has progression of radiographic abnormality.","meaning":"Boolean indicating whether the patient currently has progression of radiographic abnormality."} ;; "the patient has progression of radiographic abnormality"
(declare-const patient_has_new_radiographic_abnormality_on_chest_xray_compatible_with_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a new radiographic abnormality on chest X-ray compatible with pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a new radiographic abnormality on chest X-ray compatible with pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a new radiographic abnormality on chest X-ray compatible with pneumonia.","meaning":"Boolean indicating whether the patient currently has a new radiographic abnormality on chest X-ray compatible with pneumonia."} ;; "the patient has a new radiographic abnormality on chest X-ray compatible with pneumonia"
(declare-const patient_has_new_radiographic_abnormality_on_computed_tomography_scan_compatible_with_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a new radiographic abnormality on computed tomography scan compatible with pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a new radiographic abnormality on computed tomography scan compatible with pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a new radiographic abnormality on computed tomography scan compatible with pneumonia.","meaning":"Boolean indicating whether the patient currently has a new radiographic abnormality on computed tomography scan compatible with pneumonia."} ;; "the patient has a new radiographic abnormality on computed tomography scan compatible with pneumonia"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_progression_of_radiographic_abnormality_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has progression of radiographic abnormality."

(assert
(! (not patient_has_new_radiographic_abnormality_on_chest_xray_compatible_with_pneumonia_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a new radiographic abnormality on chest X-ray compatible with pneumonia."

(assert
(! (not patient_has_new_radiographic_abnormality_on_computed_tomography_scan_compatible_with_pneumonia_now)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a new radiographic abnormality on computed tomography scan compatible with pneumonia."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_bronchiectasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bronchiectasis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bronchiectasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bronchiectasis.","meaning":"Boolean indicating whether the patient currently has bronchiectasis."} ;; "bronchiectasis"
(declare-const patient_has_finding_of_bronchiectasis_now@@confirmed_by_high_resolution_computed_tomography Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bronchiectasis diagnosis is confirmed by high-resolution computed tomography.","when_to_set_to_false":"Set to false if the patient's bronchiectasis diagnosis is not confirmed by high-resolution computed tomography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether high-resolution computed tomography confirms the diagnosis of bronchiectasis.","meaning":"Boolean indicating whether the patient's bronchiectasis diagnosis is confirmed by high-resolution computed tomography."} ;; "bronchiectasis confirmed by high-resolution computed tomography"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_bronchiectasis_now@@confirmed_by_high_resolution_computed_tomography
      patient_has_finding_of_bronchiectasis_now)
:named REQ3_AUXILIARY0)) ;; "bronchiectasis confirmed by high-resolution computed tomography"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_bronchiectasis_now@@confirmed_by_high_resolution_computed_tomography)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bronchiectasis confirmed by high-resolution computed tomography."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_cystic_fibrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cystic fibrosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cystic fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cystic fibrosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cystic fibrosis."} ;; "cystic fibrosis"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_cystic_fibrosis_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cystic fibrosis."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tuberculosis.","meaning":"Boolean indicating whether the patient currently has tuberculosis."} ;; "tuberculosis"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_tuberculosis_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tuberculosis."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_immunodeficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of immunodeficiency disorder."} ;; "immunodeficiency disorder"

(declare-const patient_has_diagnosis_of_acquired_immunodeficiency_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acquired immunodeficiency syndrome (AIDS).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acquired immunodeficiency syndrome (AIDS).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acquired immunodeficiency syndrome (AIDS).","meaning":"Boolean indicating whether the patient currently has a diagnosis of acquired immunodeficiency syndrome (AIDS)."} ;; "acquired immunodeficiency syndrome"

(declare-const patient_has_diagnosis_of_humoral_immune_defect_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of humoral immune defect.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of humoral immune defect.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of humoral immune defect.","meaning":"Boolean indicating whether the patient currently has a diagnosis of humoral immune defect."} ;; "humoral immune defect"

(declare-const patient_has_diagnosis_of_ciliary_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ciliary dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ciliary dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ciliary dysfunction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ciliary dysfunction."} ;; "ciliary dysfunction"

(declare-const patient_is_undergoing_immunosuppressive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing immunosuppressive drug therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing immunosuppressive drug therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing immunosuppressive drug therapy.","meaning":"Boolean indicating whether the patient is currently undergoing immunosuppressive drug therapy."} ;; "immunosuppressive drug therapy"

(declare-const patient_is_using_prednisolone_maintenance_dose_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using prednisolone as maintenance drug therapy.","when_to_set_to_false":"Set to false if the patient is currently not using prednisolone as maintenance drug therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using prednisolone as maintenance drug therapy.","meaning":"Boolean indicating whether the patient is currently using prednisolone as maintenance drug therapy."} ;; "prednisolone maintenance drug therapy"

(declare-const prednisolone_maintenance_dose_value_now_in_mg_per_day Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current daily maintenance dose of prednisolone in milligrams per day.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the patient's current daily maintenance dose of prednisolone is.","meaning":"Numeric value indicating the current daily maintenance dose of prednisolone the patient is receiving, in milligrams per day."} ;; "maintenance dose > 30 mg prednisolone per day"

(declare-const prednisolone_maintenance_dose_duration_value_now_in_weeks Real) ;; {"when_to_set_to_value":"Set to the numeric value of the duration in weeks for which the patient has been receiving the current maintenance dose of prednisolone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many weeks the patient has been receiving the current maintenance dose of prednisolone.","meaning":"Numeric value indicating the duration in weeks for which the patient has been receiving the current maintenance dose of prednisolone."} ;; "for > 4 weeks"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_acquired_immunodeficiency_syndrome_now
           patient_has_diagnosis_of_humoral_immune_defect_now
           patient_has_diagnosis_of_ciliary_dysfunction_now)
       patient_has_diagnosis_of_immunodeficiency_disorder_now)
   :named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (acquired immunodeficiency syndrome, humoral immune defect, ciliary dysfunction)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_using_prednisolone_maintenance_dose_now
       patient_is_undergoing_immunosuppressive_therapy_now)
   :named REQ6_AUXILIARY1)) ;; "prednisolone maintenance drug therapy is a type of immunosuppressive drug therapy"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have immunodeficiency disorder
(assert
(! (not patient_has_diagnosis_of_immunodeficiency_disorder_now)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has immunodeficiency disorder..."

;; Exclusion: patient must NOT be using immunosuppressive drug therapy with maintenance dose > 30 mg prednisolone per day or equivalent for > 4 weeks
(assert
(! (not (and patient_is_using_prednisolone_maintenance_dose_now
             (> prednisolone_maintenance_dose_value_now_in_mg_per_day 30)
             (> prednisolone_maintenance_dose_duration_value_now_in_weeks 4)))
   :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses immunosuppressive drug therapy (maintenance dose > 30 mg prednisolone per day or equivalent for > 4 weeks)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_malignant_tumor_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant tumor of the lung.","when_to_set_to_false":"Set to false if the patient currently does not have a malignant tumor of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant tumor of the lung.","meaning":"Boolean indicating whether the patient currently has a malignant tumor of the lung."} ;; "lung malignancy"
(declare-const patient_has_finding_of_malignant_tumor_of_lung_now@@recent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current malignant tumor of the lung is recent.","when_to_set_to_false":"Set to false if the patient's current malignant tumor of the lung is not recent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current malignant tumor of the lung is recent.","meaning":"Boolean indicating whether the patient's current malignant tumor of the lung is recent."} ;; "recent lung malignancy"
(declare-const patient_has_finding_of_malignant_tumor_of_lung_now@@unresolved Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current malignant tumor of the lung is unresolved.","when_to_set_to_false":"Set to false if the patient's current malignant tumor of the lung is not unresolved.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current malignant tumor of the lung is unresolved.","meaning":"Boolean indicating whether the patient's current malignant tumor of the lung is unresolved."} ;; "unresolved lung malignancy"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_malignant_tumor_of_lung_now@@recent
      patient_has_finding_of_malignant_tumor_of_lung_now)
:named REQ7_AUXILIARY0)) ;; "recent lung malignancy"

(assert
(! (=> patient_has_finding_of_malignant_tumor_of_lung_now@@unresolved
      patient_has_finding_of_malignant_tumor_of_lung_now)
:named REQ7_AUXILIARY1)) ;; "unresolved lung malignancy"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_malignant_tumor_of_lung_now@@recent)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recent lung malignancy."

(assert
(! (not patient_has_finding_of_malignant_tumor_of_lung_now@@unresolved)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unresolved lung malignancy."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any disease."} ;; "disease"
(declare-const patient_has_diagnosis_of_disease_now@@likely_to_require_antibiotic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the disease diagnosis is of a disease that is likely to require antibiotic therapy.","when_to_set_to_false":"Set to false if the disease diagnosis is of a disease that is not likely to require antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease diagnosis is of a disease likely to require antibiotic therapy.","meaning":"Boolean indicating whether the disease diagnosis is of a disease likely to require antibiotic therapy."} ;; "likely to require antibiotic therapy"

(declare-const patient_has_diagnosis_of_recurrent_sinusitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of recurrent sinusitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of recurrent sinusitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of recurrent sinusitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of recurrent sinusitis."} ;; "recurrent sinusitis"
(declare-const patient_has_diagnosis_of_urinary_tract_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of urinary tract infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of urinary tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of urinary tract infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of urinary tract infection."} ;; "urinary tract infection"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_recurrent_sinusitis_now
          patient_has_diagnosis_of_urinary_tract_infection_now)
     patient_has_diagnosis_of_disease_now@@likely_to_require_antibiotic_therapy)
:named REQ8_AUXILIARY0)) ;; "with non-exhaustive examples (recurrent sinusitis, urinary tract infection)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disease_now@@likely_to_require_antibiotic_therapy
       patient_has_diagnosis_of_disease_now)
:named REQ8_AUXILIARY1)) ;; "disease likely to require antibiotic therapy"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_diagnosis_of_disease_now@@likely_to_require_antibiotic_therapy)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another disease likely to require antibiotic therapy with non-exhaustive examples (recurrent sinusitis, urinary tract infection)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the gastrointestinal tract.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the gastrointestinal tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the gastrointestinal tract.","meaning":"Boolean indicating whether the patient currently has a disorder of the gastrointestinal tract."} ;; "gastrointestinal condition"
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the gastrointestinal tract is significant.","when_to_set_to_false":"Set to false if the patient's current disorder of the gastrointestinal tract is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of the gastrointestinal tract is significant.","meaning":"Boolean indicating whether the patient's current disorder of the gastrointestinal tract is significant."} ;; "significant gastrointestinal condition"
(declare-const patient_has_finding_of_other_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other condition.","when_to_set_to_false":"Set to false if the patient currently does not have any other condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any other condition.","meaning":"Boolean indicating whether the patient currently has any other condition."} ;; "other condition"
(declare-const patient_has_finding_of_other_condition_now@@may_affect_study_drug_absorption Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current other condition may affect study drug absorption.","when_to_set_to_false":"Set to false if the patient's current other condition does not affect study drug absorption.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current other condition may affect study drug absorption.","meaning":"Boolean indicating whether the patient's current other condition may affect study drug absorption."} ;; "other condition that may affect study drug absorption"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable for significant gastrointestinal condition implies stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@is_significant
      patient_has_finding_of_disorder_of_gastrointestinal_tract_now)
:named REQ9_AUXILIARY0)) ;; "significant gastrointestinal condition"

;; Qualifier variable for other condition affecting absorption implies stem variable
(assert
(! (=> patient_has_finding_of_other_condition_now@@may_affect_study_drug_absorption
      patient_has_finding_of_other_condition_now)
:named REQ9_AUXILIARY1)) ;; "other condition that may affect study drug absorption"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@is_significant)
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant gastrointestinal condition."

(assert
(! (not patient_has_finding_of_other_condition_now@@may_affect_study_drug_absorption)
    :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other condition that may affect study drug absorption."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} ;; "congestive heart failure"

(declare-const patient_has_finding_of_congestive_heart_failure_now@@class_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congestive heart failure and it is classified as class III.","when_to_set_to_false":"Set to false if the patient currently has congestive heart failure but it is not classified as class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's congestive heart failure is class III.","meaning":"Boolean indicating whether the patient's current congestive heart failure is class III."} ;; "class III congestive heart failure"

(declare-const patient_has_finding_of_congestive_heart_failure_now@@class_iv Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congestive heart failure and it is classified as class IV.","when_to_set_to_false":"Set to false if the patient currently has congestive heart failure but it is not classified as class IV.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's congestive heart failure is class IV.","meaning":"Boolean indicating whether the patient's current congestive heart failure is class IV."} ;; "class IV congestive heart failure"

(declare-const patient_has_finding_of_cerebrovascular_accident_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a history of stroke (cerebrovascular accident).","when_to_set_to_false":"Set to false if the patient currently does not have a history of stroke (cerebrovascular accident).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a history of stroke (cerebrovascular accident).","meaning":"Boolean indicating whether the patient currently has a history of stroke (cerebrovascular accident)."} ;; "stroke"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_congestive_heart_failure_now@@class_iii
      patient_has_finding_of_congestive_heart_failure_now)
    :named REQ10_AUXILIARY0)) ;; "class III congestive heart failure" implies "congestive heart failure"

(assert
(! (=> patient_has_finding_of_congestive_heart_failure_now@@class_iv
      patient_has_finding_of_congestive_heart_failure_now)
    :named REQ10_AUXILIARY1)) ;; "class IV congestive heart failure" implies "congestive heart failure"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_congestive_heart_failure_now@@class_iii)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has class III congestive heart failure."

(assert
(! (not patient_has_finding_of_congestive_heart_failure_now@@class_iv)
    :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has class IV congestive heart failure."

(assert
(! (not patient_has_finding_of_cerebrovascular_accident_now)
    :named REQ10_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has stroke."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_diagnosis_of_pulmonary_embolism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pulmonary embolism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pulmonary embolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pulmonary embolism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pulmonary embolism."} ;; "pulmonary embolism"
(declare-const patient_has_diagnosis_of_pulmonary_embolism_now@@newly_diagnosed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of pulmonary embolism is newly made (i.e., recently established).","when_to_set_to_false":"Set to false if the patient's current diagnosis of pulmonary embolism is not newly made (i.e., it is a chronic or longstanding diagnosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of pulmonary embolism is newly made.","meaning":"Boolean indicating whether the current diagnosis of pulmonary embolism is newly made."} ;; "newly diagnosed pulmonary embolism"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_pulmonary_embolism_now@@newly_diagnosed
      patient_has_diagnosis_of_pulmonary_embolism_now)
   :named REQ11_AUXILIARY0)) ;; "newly diagnosed pulmonary embolism" implies "pulmonary embolism"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_diagnosis_of_pulmonary_embolism_now@@newly_diagnosed)
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has newly diagnosed pulmonary embolism."
