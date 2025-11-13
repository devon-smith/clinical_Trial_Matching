;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_significant_cardiovascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cardiovascular disease that, in the opinion of the Investigator, is significant because it either puts the patient at risk due to trial participation, influences trial results, or affects the patient's ability to participate in the trial.","when_to_set_to_false":"Set to false if the patient currently does not have cardiovascular disease, or if present, it is not considered significant by the Investigator as per the specified criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has significant cardiovascular disease as defined.","meaning":"Boolean indicating whether the patient currently has significant cardiovascular disease as defined by the Investigator's opinion regarding risk, influence on results, or ability to participate."} ;; "significant cardiovascular disease (where significant disease is defined as a disease which, in the opinion of the Investigator, either puts the patient at risk because of participation in the trial OR influences the results of the trial OR the patient's ability to participate in the trial)"

(declare-const patient_has_significant_renal_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal disease that, in the opinion of the Investigator, is significant because it either puts the patient at risk due to trial participation, influences trial results, or affects the patient's ability to participate in the trial.","when_to_set_to_false":"Set to false if the patient currently does not have renal disease, or if present, it is not considered significant by the Investigator as per the specified criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has significant renal disease as defined.","meaning":"Boolean indicating whether the patient currently has significant renal disease as defined by the Investigator's opinion regarding risk, influence on results, or ability to participate."} ;; "significant renal disease (where significant disease is defined as a disease which, in the opinion of the Investigator, either puts the patient at risk because of participation in the trial OR influences the results of the trial OR the patient's ability to participate in the trial)"

(declare-const patient_has_significant_hepatic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic disease that, in the opinion of the Investigator, is significant because it either puts the patient at risk due to trial participation, influences trial results, or affects the patient's ability to participate in the trial.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic disease, or if present, it is not considered significant by the Investigator as per the specified criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has significant hepatic disease as defined.","meaning":"Boolean indicating whether the patient currently has significant hepatic disease as defined by the Investigator's opinion regarding risk, influence on results, or ability to participate."} ;; "significant hepatic disease (where significant disease is defined as a disease which, in the opinion of the Investigator, either puts the patient at risk because of participation in the trial OR influences the results of the trial OR the patient's ability to participate in the trial)"

(declare-const patient_has_significant_endocrine_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has endocrine disease that, in the opinion of the Investigator, is significant because it either puts the patient at risk due to trial participation, influences trial results, or affects the patient's ability to participate in the trial.","when_to_set_to_false":"Set to false if the patient currently does not have endocrine disease, or if present, it is not considered significant by the Investigator as per the specified criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has significant endocrine disease as defined.","meaning":"Boolean indicating whether the patient currently has significant endocrine disease as defined by the Investigator's opinion regarding risk, influence on results, or ability to participate."} ;; "significant endocrine disease (where significant disease is defined as a disease which, in the opinion of the Investigator, either puts the patient at risk because of participation in the trial OR influences the results of the trial OR the patient's ability to participate in the trial)"

(declare-const patient_has_significant_metabolic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has metabolic disease that, in the opinion of the Investigator, is significant because it either puts the patient at risk due to trial participation, influences trial results, or affects the patient's ability to participate in the trial.","when_to_set_to_false":"Set to false if the patient currently does not have metabolic disease, or if present, it is not considered significant by the Investigator as per the specified criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has significant metabolic disease as defined.","meaning":"Boolean indicating whether the patient currently has significant metabolic disease as defined by the Investigator's opinion regarding risk, influence on results, or ability to participate."} ;; "significant metabolic disease (where significant disease is defined as a disease which, in the opinion of the Investigator, either puts the patient at risk because of participation in the trial OR influences the results of the trial OR the patient's ability to participate in the trial)"

(declare-const patient_has_significant_neurologic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has neurologic disease that, in the opinion of the Investigator, is significant because it either puts the patient at risk due to trial participation, influences trial results, or affects the patient's ability to participate in the trial.","when_to_set_to_false":"Set to false if the patient currently does not have neurologic disease, or if present, it is not considered significant by the Investigator as per the specified criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has significant neurologic disease as defined.","meaning":"Boolean indicating whether the patient currently has significant neurologic disease as defined by the Investigator's opinion regarding risk, influence on results, or ability to participate."} ;; "significant neurologic disease (where significant disease is defined as a disease which, in the opinion of the Investigator, either puts the patient at risk because of participation in the trial OR influences the results of the trial OR the patient's ability to participate in the trial)"

(declare-const patient_has_significant_other_systemic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another systemic disease that, in the opinion of the Investigator, is significant because it either puts the patient at risk due to trial participation, influences trial results, or affects the patient's ability to participate in the trial.","when_to_set_to_false":"Set to false if the patient currently does not have another systemic disease, or if present, it is not considered significant by the Investigator as per the specified criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has significant other systemic disease as defined.","meaning":"Boolean indicating whether the patient currently has significant other systemic disease as defined by the Investigator's opinion regarding risk, influence on results, or ability to participate."} ;; "significant other systemic disease (where significant disease is defined as a disease which, in the opinion of the Investigator, either puts the patient at risk because of participation in the trial OR influences the results of the trial OR the patient's ability to participate in the trial)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_significant_cardiovascular_disease_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant cardiovascular disease (where significant disease is defined as a disease which, in the opinion of the Investigator, either puts the patient at risk because of participation in the trial OR influences the results of the trial OR the patient's ability to participate in the trial)."

(assert
(! (not patient_has_significant_renal_disease_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant renal disease (where significant disease is defined as a disease which, in the opinion of the Investigator, either puts the patient at risk because of participation in the trial OR influences the results of the trial OR the patient's ability to participate in the trial)."

(assert
(! (not patient_has_significant_hepatic_disease_now)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant hepatic disease (where significant disease is defined as a disease which, in the opinion of the Investigator, either puts the patient at risk because of participation in the trial OR influences the results of the trial OR the patient's ability to participate in the trial)."

(assert
(! (not patient_has_significant_endocrine_disease_now)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant endocrine disease (where significant disease is defined as a disease which, in the opinion of the Investigator, either puts the patient at risk because of participation in the trial OR influences the results of the trial OR the patient's ability to participate in the trial)."

(assert
(! (not patient_has_significant_metabolic_disease_now)
:named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant metabolic disease (where significant disease is defined as a disease which, in the opinion of the Investigator, either puts the patient at risk because of participation in the trial OR influences the results of the trial OR the patient's ability to participate in the trial)."

(assert
(! (not patient_has_significant_neurologic_disease_now)
:named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant neurologic disease (where significant disease is defined as a disease which, in the opinion of the Investigator, either puts the patient at risk because of participation in the trial OR influences the results of the trial OR the patient's ability to participate in the trial)."

(assert
(! (not patient_has_significant_other_systemic_disease_now)
:named REQ0_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant other systemic disease (where significant disease is defined as a disease which, in the opinion of the Investigator, either puts the patient at risk because of participation in the trial OR influences the results of the trial OR the patient's ability to participate in the trial)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_respiratory_crackles_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of rales (respiratory crackles).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of rales (respiratory crackles).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has rales (respiratory crackles).","meaning":"Boolean indicating whether the patient currently has rales (respiratory crackles) now."} ;; "rales"
(declare-const patient_has_finding_of_respiratory_crackles_now@@suggestive_of_lower_respiratory_tract_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's rales (respiratory crackles) are suggestive of a lower respiratory tract infection.","when_to_set_to_false":"Set to false if the patient's rales (respiratory crackles) are not suggestive of a lower respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's rales (respiratory crackles) are suggestive of a lower respiratory tract infection.","meaning":"Boolean indicating whether the patient's rales (respiratory crackles) are suggestive of a lower respiratory tract infection."} ;; "rales suggestive of a lower respiratory tract infection"
(declare-const patient_has_finding_of_wheeze_rhonchi_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of rhonchi (wheeze/rhonchi).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of rhonchi (wheeze/rhonchi).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has rhonchi (wheeze/rhonchi).","meaning":"Boolean indicating whether the patient currently has rhonchi (wheeze/rhonchi) now."} ;; "rhonchi"
(declare-const patient_has_finding_of_wheeze_rhonchi_now@@suggestive_of_lower_respiratory_tract_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's rhonchi (wheeze/rhonchi) are suggestive of a lower respiratory tract infection.","when_to_set_to_false":"Set to false if the patient's rhonchi (wheeze/rhonchi) are not suggestive of a lower respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's rhonchi (wheeze/rhonchi) are suggestive of a lower respiratory tract infection.","meaning":"Boolean indicating whether the patient's rhonchi (wheeze/rhonchi) are suggestive of a lower respiratory tract infection."} ;; "rhonchi suggestive of a lower respiratory tract infection"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_respiratory_crackles_now@@suggestive_of_lower_respiratory_tract_infection
      patient_has_finding_of_respiratory_crackles_now)
:named REQ1_AUXILIARY0)) ;; "rales suggestive of a lower respiratory tract infection"

(assert
(! (=> patient_has_finding_of_wheeze_rhonchi_now@@suggestive_of_lower_respiratory_tract_infection
      patient_has_finding_of_wheeze_rhonchi_now)
:named REQ1_AUXILIARY1)) ;; "rhonchi suggestive of a lower respiratory tract infection"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_respiratory_crackles_now@@suggestive_of_lower_respiratory_tract_infection)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has presence of rales suggestive of a lower respiratory tract infection."

(assert
(! (not patient_has_finding_of_wheeze_rhonchi_now@@suggestive_of_lower_respiratory_tract_infection)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has presence of rhonchi suggestive of a lower respiratory tract infection."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_oral_temperature_value_recorded_now_withunit_degrees_fahrenheit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's oral temperature in degrees Fahrenheit is recorded now.","when_to_set_to_null":"Set to null if no oral temperature measurement in degrees Fahrenheit is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's oral temperature measured now in degrees Fahrenheit."} ;; "oral temperature > 102 degrees Fahrenheit"
(declare-const patient_equivalent_temperature_value_recorded_now_withunit_degrees_fahrenheit Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's equivalent temperature in degrees Fahrenheit is recorded now.","when_to_set_to_null":"Set to null if no equivalent temperature measurement in degrees Fahrenheit is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's equivalent temperature measured now in degrees Fahrenheit."} ;; "equivalent temperature > 102 degrees Fahrenheit"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (> patient_oral_temperature_value_recorded_now_withunit_degrees_fahrenheit 102))
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has an oral temperature > 102 degrees Fahrenheit."

(assert
(! (not (> patient_equivalent_temperature_value_recorded_now_withunit_degrees_fahrenheit 102))
:named REQ2_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has an equivalent temperature > 102 degrees Fahrenheit."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_otitis_media_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of otitis media.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of otitis media.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of otitis media.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of otitis media."} ;; "presence of otitis media"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_otitis_media_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has presence of otitis media."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_initiating_immunotherapy_regimen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is initiating an immunotherapy regimen during the course of this trial.","when_to_set_to_false":"Set to false if the patient is not initiating an immunotherapy regimen during the course of this trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is initiating an immunotherapy regimen during the course of this trial.","meaning":"Boolean indicating whether the patient is initiating an immunotherapy regimen during the course of this trial."} ;; "the patient is initiating an immunotherapy regimen during the course of this trial"

(declare-const patient_is_advancing_immunotherapy_regimen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is advancing an immunotherapy regimen during the course of this trial.","when_to_set_to_false":"Set to false if the patient is not advancing an immunotherapy regimen during the course of this trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is advancing an immunotherapy regimen during the course of this trial.","meaning":"Boolean indicating whether the patient is advancing an immunotherapy regimen during the course of this trial."} ;; "the patient is advancing an immunotherapy regimen during the course of this trial"

(declare-const patient_is_undergoing_immunological_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing immunological therapy (including initiation of a regimen) during the course of this trial.","when_to_set_to_false":"Set to false if the patient is not currently undergoing immunological therapy during the course of this trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing immunological therapy during the course of this trial.","meaning":"Boolean indicating whether the patient is currently undergoing immunological therapy."} ;; "immunotherapy"

(declare-const patient_is_undergoing_immunological_therapy_now@@maintenance_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing immunological therapy and the regimen is a maintenance dose.","when_to_set_to_false":"Set to false if the patient is currently undergoing immunological therapy and the regimen is not a maintenance dose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunological therapy regimen is a maintenance dose.","meaning":"Boolean indicating whether the patient is currently undergoing immunological therapy as a maintenance dose."} ;; "Patients receiving a maintenance dose of immunotherapy are eligible."

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_is_undergoing_immunological_therapy_now@@maintenance_dose
      patient_is_undergoing_immunological_therapy_now)
:named REQ4_AUXILIARY0)) ;; "Patients receiving a maintenance dose of immunotherapy are eligible."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_is_initiating_immunotherapy_regimen_now
            patient_is_advancing_immunotherapy_regimen_now))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is initiating an immunotherapy regimen during the course of this trial) OR (the patient is advancing an immunotherapy regimen during the course of this trial). Patients receiving a maintenance dose of immunotherapy are eligible."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_intolerance_to_acetylcholine_receptor_antagonist_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known intolerance to acetylcholine receptor antagonist containing products (anticholinergic drugs).","when_to_set_to_false":"Set to false if the patient currently does not have a known intolerance to acetylcholine receptor antagonist containing products (anticholinergic drugs).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known intolerance to acetylcholine receptor antagonist containing products (anticholinergic drugs).","meaning":"Boolean indicating whether the patient currently has a known intolerance to acetylcholine receptor antagonist containing products (anticholinergic drugs)."} ;; "known intolerance to anticholinergic drugs"
(declare-const patient_has_hypersensitivity_to_benzalkonium_chloride_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known hypersensitivity to benzalkonium chloride.","when_to_set_to_false":"Set to false if the patient currently does not have a known hypersensitivity to benzalkonium chloride.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known hypersensitivity to benzalkonium chloride.","meaning":"Boolean indicating whether the patient currently has a known hypersensitivity to benzalkonium chloride."} ;; "known hypersensitivity to benzalkonium chloride"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_intolerance_to_acetylcholine_receptor_antagonist_containing_product_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known intolerance to anticholinergic drugs."

(assert
(! (not patient_has_hypersensitivity_to_benzalkonium_chloride_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to benzalkonium chloride."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_taken_decongestant_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken decongestant drugs within the past 24 hours before the reference timepoint (e.g., Visit 1).","when_to_set_to_false":"Set to false if the patient has not taken decongestant drugs within the past 24 hours before the reference timepoint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken decongestant drugs within the past 24 hours before the reference timepoint.","meaning":"Boolean indicating whether the patient has taken decongestant drugs within the past 24 hours before the reference timepoint."} ;; "the patient has taken over-the-counter decongestant drugs within 24 hours before Visit 1"
(declare-const patient_has_taken_decongestant_inthepast24hours@@temporalcontext_within24hours_before_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the 24-hour window is anchored to the period before Visit 1.","when_to_set_to_false":"Set to false if the 24-hour window is not anchored to Visit 1.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the 24-hour window is anchored to Visit 1.","meaning":"Boolean indicating whether the timeframe for taking decongestant drugs is specifically the 24 hours before Visit 1."} ;; "within 24 hours before Visit 1"
(declare-const patient_has_taken_decongestant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken decongestant drugs at any time during the trial period.","when_to_set_to_false":"Set to false if the patient has not taken decongestant drugs at any time during the trial period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken decongestant drugs during the trial period.","meaning":"Boolean indicating whether the patient has taken decongestant drugs at any time during the trial period."} ;; "the patient has taken over-the-counter decongestant drugs during the trial"
(declare-const patient_has_taken_cromolyn_containing_product_in_nasal_dose_form_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken nasal cromolyn within the past 24 hours before the reference timepoint (e.g., Visit 1).","when_to_set_to_false":"Set to false if the patient has not taken nasal cromolyn within the past 24 hours before the reference timepoint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken nasal cromolyn within the past 24 hours before the reference timepoint.","meaning":"Boolean indicating whether the patient has taken nasal cromolyn within the past 24 hours before the reference timepoint."} ;; "the patient has taken nasal cromolyn within 24 hours before Visit 1"
(declare-const patient_has_taken_cromolyn_containing_product_in_nasal_dose_form_inthepast24hours@@temporalcontext_within24hours_before_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the 24-hour window is anchored to the period before Visit 1.","when_to_set_to_false":"Set to false if the 24-hour window is not anchored to Visit 1.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the 24-hour window is anchored to Visit 1.","meaning":"Boolean indicating whether the timeframe for taking nasal cromolyn is specifically the 24 hours before Visit 1."} ;; "within 24 hours before Visit 1"
(declare-const patient_has_taken_cromolyn_containing_product_in_nasal_dose_form_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken nasal cromolyn at any time during the trial period.","when_to_set_to_false":"Set to false if the patient has not taken nasal cromolyn at any time during the trial period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken nasal cromolyn during the trial period.","meaning":"Boolean indicating whether the patient has taken nasal cromolyn at any time during the trial period."} ;; "the patient has taken nasal cromolyn during the trial"
(declare-const patient_has_taken_cromolyn_containing_product_in_ocular_dose_form_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken ocular cromolyn within the past 24 hours before the reference timepoint (e.g., Visit 1).","when_to_set_to_false":"Set to false if the patient has not taken ocular cromolyn within the past 24 hours before the reference timepoint.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken ocular cromolyn within the past 24 hours before the reference timepoint.","meaning":"Boolean indicating whether the patient has taken ocular cromolyn within the past 24 hours before the reference timepoint (e.g., Visit 1)."} ;; "the patient has taken ocular cromolyn within 24 hours before Visit 1"
(declare-const patient_has_taken_cromolyn_containing_product_in_ocular_dose_form_inthepast24hours@@temporalcontext_within24hours_before_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the 24-hour window is anchored to the period before Visit 1.","when_to_set_to_false":"Set to false if the 24-hour window is not anchored to Visit 1.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the 24-hour window is anchored to Visit 1.","meaning":"Boolean indicating whether the timeframe for taking ocular cromolyn is specifically the 24 hours before Visit 1."} ;; "within 24 hours before Visit 1"
(declare-const patient_has_taken_cromolyn_containing_product_in_ocular_dose_form_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken ocular cromolyn at any time during the trial period.","when_to_set_to_false":"Set to false if the patient has not taken ocular cromolyn at any time during the trial period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken ocular cromolyn during the trial period.","meaning":"Boolean indicating whether the patient has taken ocular cromolyn at any time during the trial period."} ;; "the patient has taken ocular cromolyn during the trial"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (or
  (and patient_has_taken_decongestant_inthepast24hours patient_has_taken_decongestant_inthepast24hours@@temporalcontext_within24hours_before_visit_1) ;; "the patient has taken over-the-counter decongestant drugs within 24 hours before Visit 1"
  patient_has_taken_decongestant_inthehistory ;; "the patient has taken over-the-counter decongestant drugs during the trial"
  (and patient_has_taken_cromolyn_containing_product_in_nasal_dose_form_inthepast24hours patient_has_taken_cromolyn_containing_product_in_nasal_dose_form_inthepast24hours@@temporalcontext_within24hours_before_visit_1) ;; "the patient has taken nasal cromolyn within 24 hours before Visit 1"
  patient_has_taken_cromolyn_containing_product_in_nasal_dose_form_inthehistory ;; "the patient has taken nasal cromolyn during the trial"
  (and patient_has_taken_cromolyn_containing_product_in_ocular_dose_form_inthepast24hours patient_has_taken_cromolyn_containing_product_in_ocular_dose_form_inthepast24hours@@temporalcontext_within24hours_before_visit_1) ;; "the patient has taken ocular cromolyn within 24 hours before Visit 1"
  patient_has_taken_cromolyn_containing_product_in_ocular_dose_form_inthehistory ;; "the patient has taken ocular cromolyn during the trial"
))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has taken over-the-counter decongestant drugs within 24 hours before Visit 1) OR (the patient has taken over-the-counter decongestant drugs during the trial) OR (the patient has taken nasal cromolyn within 24 hours before Visit 1) OR (the patient has taken nasal cromolyn during the trial) OR (the patient has taken ocular cromolyn within 24 hours before Visit 1) OR (the patient has taken ocular cromolyn during the trial)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_taken_acetylcholine_receptor_antagonist_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken an acetylcholine receptor antagonist containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken an acetylcholine receptor antagonist containing product in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken an acetylcholine receptor antagonist containing product in the past.","meaning":"Boolean indicating whether the patient has ever taken an acetylcholine receptor antagonist containing product in the past."} ;; "anticholinergic drugs"

(declare-const patient_has_taken_acetylcholine_receptor_antagonist_containing_product_inthehistory@@temporalcontext_within3days_before_visit1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken an acetylcholine receptor antagonist containing product within 3 days before Visit 1.","when_to_set_to_false":"Set to false if the patient has not taken an acetylcholine receptor antagonist containing product within 3 days before Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken an acetylcholine receptor antagonist containing product within 3 days before Visit 1.","meaning":"Boolean indicating whether the patient has taken an acetylcholine receptor antagonist containing product within 3 days before Visit 1."} ;; "anticholinergic drugs within 3 days before Visit 1"

(declare-const patient_has_taken_acetylcholine_receptor_antagonist_containing_product_inthehistory@@temporalcontext_during_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken an acetylcholine receptor antagonist containing product during the trial.","when_to_set_to_false":"Set to false if the patient has not taken an acetylcholine receptor antagonist containing product during the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken an acetylcholine receptor antagonist containing product during the trial.","meaning":"Boolean indicating whether the patient has taken an acetylcholine receptor antagonist containing product during the trial."} ;; "anticholinergic drugs during the trial"

(declare-const patient_has_taken_over_the_counter_antihistamine_drugs_inthehistory@@temporalcontext_within3days_before_visit1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken over-the-counter antihistamine drugs within 3 days before Visit 1.","when_to_set_to_false":"Set to false if the patient has not taken over-the-counter antihistamine drugs within 3 days before Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken over-the-counter antihistamine drugs within 3 days before Visit 1.","meaning":"Boolean indicating whether the patient has taken over-the-counter antihistamine drugs within 3 days before Visit 1."} ;; "over-the-counter antihistamine drugs within 3 days before Visit 1"

(declare-const patient_has_taken_over_the_counter_antihistamine_drugs_inthehistory@@temporalcontext_during_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken over-the-counter antihistamine drugs during the trial.","when_to_set_to_false":"Set to false if the patient has not taken over-the-counter antihistamine drugs during the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken over-the-counter antihistamine drugs during the trial.","meaning":"Boolean indicating whether the patient has taken over-the-counter antihistamine drugs during the trial."} ;; "over-the-counter antihistamine drugs during the trial"

(declare-const patient_has_taken_sympathomimetic_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken a sympathomimetic product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken a sympathomimetic product in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken a sympathomimetic product in the past.","meaning":"Boolean indicating whether the patient has ever taken a sympathomimetic product in the past."} ;; "sympathomimetic decongestant drugs"

(declare-const patient_has_taken_sympathomimetic_product_inthehistory@@temporalcontext_within3days_before_visit1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a sympathomimetic product within 3 days before Visit 1.","when_to_set_to_false":"Set to false if the patient has not taken a sympathomimetic product within 3 days before Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a sympathomimetic product within 3 days before Visit 1.","meaning":"Boolean indicating whether the patient has taken a sympathomimetic product within 3 days before Visit 1."} ;; "sympathomimetic decongestant drugs within 3 days before Visit 1"

(declare-const patient_has_taken_sympathomimetic_product_inthehistory@@temporalcontext_during_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a sympathomimetic product during the trial.","when_to_set_to_false":"Set to false if the patient has not taken a sympathomimetic product during the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a sympathomimetic product during the trial.","meaning":"Boolean indicating whether the patient has taken a sympathomimetic product during the trial."} ;; "sympathomimetic decongestant drugs during the trial"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_taken_acetylcholine_receptor_antagonist_containing_product_inthehistory@@temporalcontext_within3days_before_visit1
      patient_has_taken_acetylcholine_receptor_antagonist_containing_product_inthehistory)
:named REQ7_AUXILIARY0)) ;; "anticholinergic drugs within 3 days before Visit 1"

(assert
(! (=> patient_has_taken_acetylcholine_receptor_antagonist_containing_product_inthehistory@@temporalcontext_during_trial
      patient_has_taken_acetylcholine_receptor_antagonist_containing_product_inthehistory)
:named REQ7_AUXILIARY1)) ;; "anticholinergic drugs during the trial"

(assert
(! (=> patient_has_taken_over_the_counter_antihistamine_drugs_inthehistory@@temporalcontext_within3days_before_visit1
      patient_has_taken_over_the_counter_antihistamine_drugs_inthehistory@@temporalcontext_within3days_before_visit1)
:named REQ7_AUXILIARY2)) ;; "over-the-counter antihistamine drugs within 3 days before Visit 1"

(assert
(! (=> patient_has_taken_over_the_counter_antihistamine_drugs_inthehistory@@temporalcontext_during_trial
      patient_has_taken_over_the_counter_antihistamine_drugs_inthehistory@@temporalcontext_during_trial)
:named REQ7_AUXILIARY3)) ;; "over-the-counter antihistamine drugs during the trial"

(assert
(! (=> patient_has_taken_sympathomimetic_product_inthehistory@@temporalcontext_within3days_before_visit1
      patient_has_taken_sympathomimetic_product_inthehistory)
:named REQ7_AUXILIARY4)) ;; "sympathomimetic decongestant drugs within 3 days before Visit 1"

(assert
(! (=> patient_has_taken_sympathomimetic_product_inthehistory@@temporalcontext_during_trial
      patient_has_taken_sympathomimetic_product_inthehistory)
:named REQ7_AUXILIARY5)) ;; "sympathomimetic decongestant drugs during the trial"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_taken_acetylcholine_receptor_antagonist_containing_product_inthehistory@@temporalcontext_within3days_before_visit1)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has taken anticholinergic drugs within 3 days before Visit 1."

(assert
(! (not patient_has_taken_acetylcholine_receptor_antagonist_containing_product_inthehistory@@temporalcontext_during_trial)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has taken anticholinergic drugs during the trial."

(assert
(! (not patient_has_taken_over_the_counter_antihistamine_drugs_inthehistory@@temporalcontext_within3days_before_visit1)
:named REQ7_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has taken over-the-counter antihistamine drugs within 3 days before Visit 1."

(assert
(! (not patient_has_taken_over_the_counter_antihistamine_drugs_inthehistory@@temporalcontext_during_trial)
:named REQ7_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has taken over-the-counter antihistamine drugs during the trial."

(assert
(! (not patient_has_taken_sympathomimetic_product_inthehistory@@temporalcontext_within3days_before_visit1)
:named REQ7_COMPONENT4_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has taken sympathomimetic decongestant drugs within 3 days before Visit 1."

(assert
(! (not patient_has_taken_sympathomimetic_product_inthehistory@@temporalcontext_during_trial)
:named REQ7_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has taken sympathomimetic decongestant drugs during the trial."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_taken_fexofenadine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken fexofenadine at any time in the past (history).","when_to_set_to_false":"Set to false if the patient has never taken fexofenadine at any time in the past (history).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken fexofenadine in the past.","meaning":"Boolean indicating whether the patient has ever taken fexofenadine in the past (history)."} ;; "fexofenadine"
(declare-const patient_has_taken_fexofenadine_inthehistory@@temporalcontext_within_5_days_before_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken fexofenadine within 5 days before Visit 1.","when_to_set_to_false":"Set to false if the patient has not taken fexofenadine within 5 days before Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken fexofenadine within 5 days before Visit 1.","meaning":"Boolean indicating whether the patient has taken fexofenadine within 5 days before Visit 1."} ;; "the patient has taken fexofenadine within 5 days before Visit 1"
(declare-const patient_has_taken_fexofenadine_inthehistory@@temporalcontext_during_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken fexofenadine at any time during the trial.","when_to_set_to_false":"Set to false if the patient has not taken fexofenadine at any time during the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken fexofenadine during the trial.","meaning":"Boolean indicating whether the patient has taken fexofenadine during the trial."} ;; "the patient has taken fexofenadine during the trial"
(declare-const patient_has_taken_loratadine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken loratadine at any time in the past (history).","when_to_set_to_false":"Set to false if the patient has never taken loratadine at any time in the past (history).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken loratadine in the past.","meaning":"Boolean indicating whether the patient has ever taken loratadine in the past (history)."} ;; "loratadine"
(declare-const patient_has_taken_loratadine_inthehistory@@temporalcontext_within_5_days_before_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken loratadine within 5 days before Visit 1.","when_to_set_to_false":"Set to false if the patient has not taken loratadine within 5 days before Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken loratadine within 5 days before Visit 1.","meaning":"Boolean indicating whether the patient has taken loratadine within 5 days before Visit 1."} ;; "the patient has taken loratadine within 5 days before Visit 1"
(declare-const patient_has_taken_loratadine_inthehistory@@temporalcontext_during_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken loratadine at any time during the trial.","when_to_set_to_false":"Set to false if the patient has not taken loratadine at any time during the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken loratadine during the trial.","meaning":"Boolean indicating whether the patient has taken loratadine during the trial."} ;; "the patient has taken loratadine during the trial"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (or patient_has_taken_fexofenadine_inthehistory@@temporalcontext_within_5_days_before_visit_1
            patient_has_taken_fexofenadine_inthehistory@@temporalcontext_during_trial
            patient_has_taken_loratadine_inthehistory@@temporalcontext_within_5_days_before_visit_1
            patient_has_taken_loratadine_inthehistory@@temporalcontext_during_trial))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has taken fexofenadine within 5 days before Visit 1) OR (the patient has taken fexofenadine during the trial) OR (the patient has taken loratadine within 5 days before Visit 1) OR (the patient has taken loratadine during the trial)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_exposed_to_cetirizine_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to cetirizine at any time during the 7 days prior to the reference point.","when_to_set_to_false":"Set to false if the patient was not exposed to cetirizine during the 7 days prior to the reference point.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to cetirizine during the 7 days prior to the reference point.","meaning":"Boolean indicating whether the patient was exposed to cetirizine during the 7 days prior to the reference point."} ;; "the patient has taken cetirizine within 7 days before Visit 1"
(declare-const patient_is_exposed_to_cetirizine_inthepast7days@@temporalcontext_within7days_before_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the 7-day window is anchored to the period before Visit 1.","when_to_set_to_false":"Set to false if the 7-day window is not anchored to the period before Visit 1.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the 7-day window is anchored to Visit 1.","meaning":"Boolean indicating whether the 7-day window for cetirizine exposure is anchored to the period before Visit 1."} ;; "within 7 days before Visit 1"
(declare-const patient_is_exposed_to_cetirizine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to cetirizine at any time during the trial period.","when_to_set_to_false":"Set to false if the patient was not exposed to cetirizine during the trial period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to cetirizine during the trial period.","meaning":"Boolean indicating whether the patient was exposed to cetirizine during the trial period."} ;; "the patient has taken cetirizine during the trial"

(declare-const patient_is_exposed_to_hydroxyzine_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to hydroxyzine at any time during the 7 days prior to the reference point.","when_to_set_to_false":"Set to false if the patient was not exposed to hydroxyzine during the 7 days prior to the reference point.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to hydroxyzine during the 7 days prior to the reference point.","meaning":"Boolean indicating whether the patient was exposed to hydroxyzine during the 7 days prior to the reference point."} ;; "the patient has taken antihistamine drugs such as hydroxyzine within 7 days before Visit 1"
(declare-const patient_is_exposed_to_hydroxyzine_inthepast7days@@temporalcontext_within7days_before_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the 7-day window is anchored to the period before Visit 1.","when_to_set_to_false":"Set to false if the 7-day window is not anchored to the period before Visit 1.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the 7-day window is anchored to Visit 1.","meaning":"Boolean indicating whether the 7-day window for hydroxyzine exposure is anchored to the period before Visit 1."} ;; "within 7 days before Visit 1"
(declare-const patient_is_exposed_to_hydroxyzine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to hydroxyzine at any time during the trial period.","when_to_set_to_false":"Set to false if the patient was not exposed to hydroxyzine during the trial period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to hydroxyzine during the trial period.","meaning":"Boolean indicating whether the patient was exposed to hydroxyzine during the trial period."} ;; "the patient has taken antihistamine drugs such as hydroxyzine during the trial"

(declare-const patient_is_exposed_to_antihistamine_drugs_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to any antihistamine drugs at any time during the 7 days prior to the reference point.","when_to_set_to_false":"Set to false if the patient was not exposed to any antihistamine drugs during the 7 days prior to the reference point.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to any antihistamine drugs during the 7 days prior to the reference point.","meaning":"Boolean indicating whether the patient was exposed to any antihistamine drugs during the 7 days prior to the reference point."} ;; "the patient has taken antihistamine drugs such as hydroxyzine within 7 days before Visit 1"
(declare-const patient_is_exposed_to_antihistamine_drugs_inthepast7days@@temporalcontext_within7days_before_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the 7-day window is anchored to the period before Visit 1.","when_to_set_to_false":"Set to false if the 7-day window is not anchored to the period before Visit 1.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the 7-day window is anchored to Visit 1.","meaning":"Boolean indicating whether the 7-day window for antihistamine drugs exposure is anchored to the period before Visit 1."} ;; "within 7 days before Visit 1"
(declare-const patient_is_exposed_to_antihistamine_drugs_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to any antihistamine drugs at any time during the trial period.","when_to_set_to_false":"Set to false if the patient was not exposed to any antihistamine drugs during the trial period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to any antihistamine drugs during the trial period.","meaning":"Boolean indicating whether the patient was exposed to any antihistamine drugs during the trial period."} ;; "the patient has taken antihistamine drugs such as hydroxyzine during the trial"

(declare-const patient_is_exposed_to_doxepin_hydrochloride_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to doxepin hydrochloride at any time during the 7 days prior to the reference point.","when_to_set_to_false":"Set to false if the patient was not exposed to doxepin hydrochloride during the 7 days prior to the reference point.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to doxepin hydrochloride during the 7 days prior to the reference point.","meaning":"Boolean indicating whether the patient was exposed to doxepin hydrochloride during the 7 days prior to the reference point."} ;; "the patient has taken doxepin hydrochloride within 7 days before Visit 1"
(declare-const patient_is_exposed_to_doxepin_hydrochloride_inthepast7days@@temporalcontext_within7days_before_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the 7-day window is anchored to the period before Visit 1.","when_to_set_to_false":"Set to false if the 7-day window is not anchored to the period before Visit 1.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the 7-day window is anchored to Visit 1.","meaning":"Boolean indicating whether the 7-day window for doxepin hydrochloride exposure is anchored to the period before Visit 1."} ;; "within 7 days before Visit 1"
(declare-const patient_is_exposed_to_doxepin_hydrochloride_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to doxepin hydrochloride at any time during the trial period.","when_to_set_to_false":"Set to false if the patient was not exposed to doxepin hydrochloride during the trial period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to doxepin hydrochloride during the trial period.","meaning":"Boolean indicating whether the patient was exposed to doxepin hydrochloride during the trial period."} ;; "the patient has taken doxepin hydrochloride during the trial"

(declare-const patient_is_exposed_to_antidepressant_drugs_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to any antidepressant drugs at any time during the 7 days prior to the reference point.","when_to_set_to_false":"Set to false if the patient was not exposed to any antidepressant drugs during the 7 days prior to the reference point.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to any antidepressant drugs during the 7 days prior to the reference point.","meaning":"Boolean indicating whether the patient was exposed to any antidepressant drugs during the 7 days prior to the reference point."} ;; "the patient has taken antidepressant drugs within 7 days before Visit 1"
(declare-const patient_is_exposed_to_antidepressant_drugs_inthepast7days@@temporalcontext_within7days_before_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the 7-day window is anchored to the period before Visit 1.","when_to_set_to_false":"Set to false if the 7-day window is not anchored to the period before Visit 1.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the 7-day window is anchored to Visit 1.","meaning":"Boolean indicating whether the 7-day window for antidepressant drugs exposure is anchored to the period before Visit 1."} ;; "within 7 days before Visit 1"
(declare-const patient_is_exposed_to_antidepressant_drugs_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to any antidepressant drugs at any time during the trial period.","when_to_set_to_false":"Set to false if the patient was not exposed to any antidepressant drugs during the trial period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to any antidepressant drugs during the trial period.","meaning":"Boolean indicating whether the patient was exposed to any antidepressant drugs during the trial period."} ;; "the patient has taken antidepressant drugs during the trial"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Non-exhaustive examples: hydroxyzine is an example of antihistamine drugs
(assert
(! (=> patient_is_exposed_to_hydroxyzine_inthepast7days
      patient_is_exposed_to_antihistamine_drugs_inthepast7days)
    :named REQ9_AUXILIARY0)) ;; "antihistamine drugs such as hydroxyzine within 7 days before Visit 1"

(assert
(! (=> patient_is_exposed_to_hydroxyzine_inthehistory
      patient_is_exposed_to_antihistamine_drugs_inthehistory)
    :named REQ9_AUXILIARY1)) ;; "antihistamine drugs such as hydroxyzine during the trial"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_cetirizine_inthepast7days@@temporalcontext_within7days_before_visit_1
      patient_is_exposed_to_cetirizine_inthepast7days)
    :named REQ9_AUXILIARY2)) ;; "within 7 days before Visit 1" for cetirizine

(assert
(! (=> patient_is_exposed_to_hydroxyzine_inthepast7days@@temporalcontext_within7days_before_visit_1
      patient_is_exposed_to_hydroxyzine_inthepast7days)
    :named REQ9_AUXILIARY3)) ;; "within 7 days before Visit 1" for hydroxyzine

(assert
(! (=> patient_is_exposed_to_antihistamine_drugs_inthepast7days@@temporalcontext_within7days_before_visit_1
      patient_is_exposed_to_antihistamine_drugs_inthepast7days)
    :named REQ9_AUXILIARY4)) ;; "within 7 days before Visit 1" for antihistamine drugs

(assert
(! (=> patient_is_exposed_to_doxepin_hydrochloride_inthepast7days@@temporalcontext_within7days_before_visit_1
      patient_is_exposed_to_doxepin_hydrochloride_inthepast7days)
    :named REQ9_AUXILIARY5)) ;; "within 7 days before Visit 1" for doxepin hydrochloride

(assert
(! (=> patient_is_exposed_to_antidepressant_drugs_inthepast7days@@temporalcontext_within7days_before_visit_1
      patient_is_exposed_to_antidepressant_drugs_inthepast7days)
    :named REQ9_AUXILIARY6)) ;; "within 7 days before Visit 1" for antidepressant drugs

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_is_exposed_to_cetirizine_inthehistory)
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has taken cetirizine during the trial"

(assert
(! (not patient_is_exposed_to_antihistamine_drugs_inthehistory)
    :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has taken antihistamine drugs such as hydroxyzine during the trial"

(assert
(! (not patient_is_exposed_to_doxepin_hydrochloride_inthehistory)
    :named REQ9_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has taken doxepin hydrochloride during the trial"

(assert
(! (not patient_is_exposed_to_antidepressant_drugs_inthehistory)
    :named REQ9_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient has taken antidepressant drugs during the trial"

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_taken_steroid_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any steroid-containing product at any time in their history.","when_to_set_to_false":"Set to false if the patient has never taken any steroid-containing product in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken any steroid-containing product.","meaning":"Boolean indicating whether the patient has taken any steroid-containing product at any time in their history."} ;; "steroid drugs"
(declare-const patient_has_taken_steroid_containing_product_inthehistory@@temporalcontext_during_the_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any steroid-containing product during the trial period.","when_to_set_to_false":"Set to false if the patient has not taken any steroid-containing product during the trial period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any steroid-containing product during the trial period.","meaning":"Boolean indicating whether the patient has taken any steroid-containing product during the trial period."} ;; "the patient has taken intranasal steroid drugs during the trial"
(declare-const patient_has_taken_steroid_containing_product_inthepast14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any steroid-containing product within the past 14 days.","when_to_set_to_false":"Set to false if the patient has not taken any steroid-containing product within the past 14 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any steroid-containing product within the past 14 days.","meaning":"Boolean indicating whether the patient has taken any steroid-containing product within the past 14 days."} ;; "steroid drugs"
(declare-const patient_has_taken_steroid_containing_product_inthepast14days@@temporalcontext_within14days_before_visit_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any steroid-containing product within the 14 days before Visit 1.","when_to_set_to_false":"Set to false if the patient has not taken any steroid-containing product within the 14 days before Visit 1.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any steroid-containing product within the 14 days before Visit 1.","meaning":"Boolean indicating whether the patient has taken any steroid-containing product within the 14 days before Visit 1."} ;; "the patient has taken intranasal steroid drugs within fourteen days before Visit 1"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable for "during the trial" implies stem variable
(assert
(! (=> patient_has_taken_steroid_containing_product_inthehistory@@temporalcontext_during_the_trial
       patient_has_taken_steroid_containing_product_inthehistory)
:named REQ10_AUXILIARY0)) ;; "the patient has taken intranasal steroid drugs during the trial"

;; Qualifier variable for "within 14 days before Visit 1" implies stem variable
(assert
(! (=> patient_has_taken_steroid_containing_product_inthepast14days@@temporalcontext_within14days_before_visit_1
       patient_has_taken_steroid_containing_product_inthepast14days)
:named REQ10_AUXILIARY1)) ;; "the patient has taken intranasal steroid drugs within fourteen days before Visit 1"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient must NOT have taken intranasal steroid drugs within 14 days before Visit 1
(assert
(! (not patient_has_taken_steroid_containing_product_inthepast14days@@temporalcontext_within14days_before_visit_1)
    :named REQ10_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has taken intranasal steroid drugs within fourteen days before Visit 1"

;; Exclusion: patient must NOT have taken intranasal steroid drugs during the trial
(assert
(! (not patient_has_taken_steroid_containing_product_inthehistory@@temporalcontext_during_the_trial)
    :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has taken intranasal steroid drugs during the trial"

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast28days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past 28 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past 28 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past 28 days.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past 28 days."} ;; "within twenty-eight days before Visit 1"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast28days@@is_steroid_drug Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament is a steroid drug.","when_to_set_to_false":"Set to false if the drug or medicament is not a steroid drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is a steroid drug.","meaning":"Boolean indicating whether the drug or medicament is a steroid drug."} ;; "oral steroid drugs" or "injectable steroid drugs" within twenty-eight days before Visit 1
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast28days@@administered_orally Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament was administered orally.","when_to_set_to_false":"Set to false if the drug or medicament was not administered orally.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament was administered orally.","meaning":"Boolean indicating whether the drug or medicament was administered orally."} ;; "oral steroid drugs" within twenty-eight days before Visit 1
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast28days@@administered_by_injection Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament was administered by injection.","when_to_set_to_false":"Set to false if the drug or medicament was not administered by injection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament was administered by injection.","meaning":"Boolean indicating whether the drug or medicament was administered by injection."} ;; "injectable steroid drugs" within twenty-eight days before Visit 1
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast28days@@is_leukotriene_modifier_drug Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament is a leukotriene modifier drug.","when_to_set_to_false":"Set to false if the drug or medicament is not a leukotriene modifier drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is a leukotriene modifier drug.","meaning":"Boolean indicating whether the drug or medicament is a leukotriene modifier drug."} ;; "leukotriene modifier drugs with non-exhaustive examples (zafirlukast, montelukast)" within twenty-eight days before Visit 1
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast28days@@is_other_investigational_drug Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament is an other investigational drug.","when_to_set_to_false":"Set to false if the drug or medicament is not an other investigational drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is an other investigational drug.","meaning":"Boolean indicating whether the drug or medicament is an other investigational drug."} ;; "other investigational drugs" within twenty-eight days before Visit 1

(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament during the trial.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament during the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament during the trial.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament during the trial."} ;; "during the trial"
(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory@@is_steroid_drug Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament is a steroid drug.","when_to_set_to_false":"Set to false if the drug or medicament is not a steroid drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is a steroid drug.","meaning":"Boolean indicating whether the drug or medicament is a steroid drug."} ;; "oral steroid drugs" or "injectable steroid drugs" during the trial
(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory@@administered_orally Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament was administered orally.","when_to_set_to_false":"Set to false if the drug or medicament was not administered orally.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament was administered orally.","meaning":"Boolean indicating whether the drug or medicament was administered orally."} ;; "oral steroid drugs" during the trial
(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory@@administered_by_injection Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament was administered by injection.","when_to_set_to_false":"Set to false if the drug or medicament was not administered by injection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament was administered by injection.","meaning":"Boolean indicating whether the drug or medicament was administered by injection."} ;; "injectable steroid drugs" during the trial
(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory@@is_leukotriene_modifier_drug Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament is a leukotriene modifier drug.","when_to_set_to_false":"Set to false if the drug or medicament is not a leukotriene modifier drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is a leukotriene modifier drug.","meaning":"Boolean indicating whether the drug or medicament is a leukotriene modifier drug."} ;; "leukotriene modifier drugs with non-exhaustive examples (zafirlukast, montelukast)" during the trial
(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory@@is_other_investigational_drug Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament is an other investigational drug.","when_to_set_to_false":"Set to false if the drug or medicament is not an other investigational drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is an other investigational drug.","meaning":"Boolean indicating whether the drug or medicament is an other investigational drug."} ;; "other investigational drugs" during the trial

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Non-exhaustive examples: zafirlukast, montelukast imply leukotriene modifier drug
(declare-const patient_is_exposed_to_zafirlukast_inthepast28days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to zafirlukast within the past 28 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to zafirlukast within the past 28 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to zafirlukast within the past 28 days.","meaning":"Boolean indicating whether the patient has been exposed to zafirlukast within the past 28 days."} ;; "zafirlukast within twenty-eight days before Visit 1"
(declare-const patient_is_exposed_to_montelukast_inthepast28days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to montelukast within the past 28 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to montelukast within the past 28 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to montelukast within the past 28 days.","meaning":"Boolean indicating whether the patient has been exposed to montelukast within the past 28 days."} ;; "montelukast within twenty-eight days before Visit 1"
(declare-const patient_is_exposed_to_zafirlukast_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to zafirlukast during the trial.","when_to_set_to_false":"Set to false if the patient has not been exposed to zafirlukast during the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to zafirlukast during the trial.","meaning":"Boolean indicating whether the patient has been exposed to zafirlukast during the trial."} ;; "zafirlukast during the trial"
(declare-const patient_is_exposed_to_montelukast_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to montelukast during the trial.","when_to_set_to_false":"Set to false if the patient has not been exposed to montelukast during the trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to montelukast during the trial.","meaning":"Boolean indicating whether the patient has been exposed to montelukast during the trial."} ;; "montelukast during the trial"

;; Non-exhaustive examples imply umbrella term (leukotriene modifier drug)
(assert
(! (=> (or patient_is_exposed_to_zafirlukast_inthepast28days
           patient_is_exposed_to_montelukast_inthepast28days)
       patient_is_exposed_to_drug_or_medicament_inthepast28days@@is_leukotriene_modifier_drug)
:named REQ11_AUXILIARY0)) ;; "leukotriene modifier drugs with non-exhaustive examples (zafirlukast, montelukast) within twenty-eight days before Visit 1"

(assert
(! (=> (or patient_is_exposed_to_zafirlukast_inthehistory
           patient_is_exposed_to_montelukast_inthehistory)
       patient_is_exposed_to_drug_or_medicament_inthehistory@@is_leukotriene_modifier_drug)
:named REQ11_AUXILIARY1)) ;; "leukotriene modifier drugs with non-exhaustive examples (zafirlukast, montelukast) during the trial"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> (and patient_is_exposed_to_drug_or_medicament_inthepast28days@@is_steroid_drug
            patient_is_exposed_to_drug_or_medicament_inthepast28days@@administered_orally)
       patient_is_exposed_to_drug_or_medicament_inthepast28days)
:named REQ11_AUXILIARY2)) ;; "oral steroid drugs within twenty-eight days before Visit 1"

(assert
(! (=> (and patient_is_exposed_to_drug_or_medicament_inthepast28days@@is_steroid_drug
            patient_is_exposed_to_drug_or_medicament_inthepast28days@@administered_by_injection)
       patient_is_exposed_to_drug_or_medicament_inthepast28days)
:named REQ11_AUXILIARY3)) ;; "injectable steroid drugs within twenty-eight days before Visit 1"

(assert
(! (=> (and patient_is_exposed_to_drug_or_medicament_inthepast28days@@is_leukotriene_modifier_drug)
       patient_is_exposed_to_drug_or_medicament_inthepast28days)
:named REQ11_AUXILIARY4)) ;; "leukotriene modifier drugs within twenty-eight days before Visit 1"

(assert
(! (=> (and patient_is_exposed_to_drug_or_medicament_inthepast28days@@is_other_investigational_drug)
       patient_is_exposed_to_drug_or_medicament_inthepast28days)
:named REQ11_AUXILIARY5)) ;; "other investigational drugs within twenty-eight days before Visit 1"

(assert
(! (=> (and patient_is_exposed_to_drug_or_medicament_inthehistory@@is_steroid_drug
            patient_is_exposed_to_drug_or_medicament_inthehistory@@administered_orally)
       patient_is_exposed_to_drug_or_medicament_inthehistory)
:named REQ11_AUXILIARY6)) ;; "oral steroid drugs during the trial"

(assert
(! (=> (and patient_is_exposed_to_drug_or_medicament_inthehistory@@is_steroid_drug
            patient_is_exposed_to_drug_or_medicament_inthehistory@@administered_by_injection)
       patient_is_exposed_to_drug_or_medicament_inthehistory)
:named REQ11_AUXILIARY7)) ;; "injectable steroid drugs during the trial"

(assert
(! (=> (and patient_is_exposed_to_drug_or_medicament_inthehistory@@is_leukotriene_modifier_drug)
       patient_is_exposed_to_drug_or_medicament_inthehistory)
:named REQ11_AUXILIARY8)) ;; "leukotriene modifier drugs during the trial"

(assert
(! (=> (and patient_is_exposed_to_drug_or_medicament_inthehistory@@is_other_investigational_drug)
       patient_is_exposed_to_drug_or_medicament_inthehistory)
:named REQ11_AUXILIARY9)) ;; "other investigational drugs during the trial"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion: patient must NOT have taken any of the specified drugs in the specified timeframes
(assert
(! (not (or
  (and patient_is_exposed_to_drug_or_medicament_inthepast28days@@is_steroid_drug
       patient_is_exposed_to_drug_or_medicament_inthepast28days@@administered_orally) ;; oral steroid drugs within 28 days before Visit 1
  (and patient_is_exposed_to_drug_or_medicament_inthehistory@@is_steroid_drug
       patient_is_exposed_to_drug_or_medicament_inthehistory@@administered_orally) ;; oral steroid drugs during the trial
  (and patient_is_exposed_to_drug_or_medicament_inthepast28days@@is_steroid_drug
       patient_is_exposed_to_drug_or_medicament_inthepast28days@@administered_by_injection) ;; injectable steroid drugs within 28 days before Visit 1
  (and patient_is_exposed_to_drug_or_medicament_inthehistory@@is_steroid_drug
       patient_is_exposed_to_drug_or_medicament_inthehistory@@administered_by_injection) ;; injectable steroid drugs during the trial
  patient_is_exposed_to_drug_or_medicament_inthepast28days@@is_leukotriene_modifier_drug ;; leukotriene modifier drugs (e.g., zafirlukast, montelukast) within 28 days before Visit 1
  patient_is_exposed_to_drug_or_medicament_inthehistory@@is_leukotriene_modifier_drug ;; leukotriene modifier drugs (e.g., zafirlukast, montelukast) during the trial
  patient_is_exposed_to_drug_or_medicament_inthepast28days@@is_other_investigational_drug ;; other investigational drugs within 28 days before Visit 1
  patient_is_exposed_to_drug_or_medicament_inthehistory@@is_other_investigational_drug ;; other investigational drugs during the trial
))
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has taken oral steroid drugs within twenty-eight days before Visit 1) OR (the patient has taken oral steroid drugs during the trial) OR (the patient has taken injectable steroid drugs within twenty-eight days before Visit 1) OR (the patient has taken injectable steroid drugs during the trial) OR (the patient has taken leukotriene modifier drugs with non-exhaustive examples (zafirlukast, montelukast) within twenty-eight days before Visit 1) OR (the patient has taken leukotriene modifier drugs with non-exhaustive examples (zafirlukast, montelukast) during the trial) OR (the patient has taken other investigational drugs within twenty-eight days before Visit 1) OR (the patient has taken other investigational drugs during the trial)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_participated_in_trial_with_investigational_drug_within_30_days_before_screening_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in any clinical trial involving an investigational drug within 30 days before the screening visit.","when_to_set_to_false":"Set to false if the patient has not participated in any clinical trial involving an investigational drug within 30 days before the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in any clinical trial involving an investigational drug within 30 days before the screening visit.","meaning":"Boolean indicating whether the patient has participated in any clinical trial involving an investigational drug within 30 days before the screening visit."} ;; "has participated in any trial with an investigational drug within thirty days of the screening visit"

(declare-const patient_is_exposed_to_drug_or_medicament_inthepast28days@@temporalcontext_within30days_before_screening_visit Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to drug or medicament occurred within 30 days before the screening visit.","when_to_set_to_false":"Set to false if the exposure did not occur within 30 days before the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within 30 days before the screening visit.","meaning":"Boolean indicating whether the exposure to drug or medicament occurred within 30 days before the screening visit."} ;; "within thirty days of the screening visit"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_participated_in_trial_with_investigational_drug_within_30_days_before_screening_visit)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has participated in any trial with an investigational drug within thirty days of the screening visit."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_nasal_obstruction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of nasal obstruction is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current degree of nasal obstruction at the present time."} ;; "nasal obstruction greater than fifty percent"
(declare-const patient_nasal_obstruction_value_recorded_now_withunit_percent@@would_prevent_deposition_of_trial_drug Bool) ;; {"when_to_set_to_true":"Set to true if the degree of nasal obstruction present now would prevent deposition of the trial drug.","when_to_set_to_false":"Set to false if the degree of nasal obstruction present now would not prevent deposition of the trial drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the degree of nasal obstruction would prevent deposition of the trial drug.","meaning":"Boolean indicating whether the current degree of nasal obstruction would prevent deposition of the trial drug."} ;; "that would prevent deposition of trial drug"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not (and
           (> patient_nasal_obstruction_value_recorded_now_withunit_percent 50)
           patient_nasal_obstruction_value_recorded_now_withunit_percent@@would_prevent_deposition_of_trial_drug))
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has nasal obstruction greater than fifty percent that would prevent deposition of trial drug."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const parent_has_disability_that_impairs_compliance_or_visits_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's parent currently has a disability that could impair compliance with the protocol or visits to the trial center.","when_to_set_to_false":"Set to false if the patient's parent currently does not have a disability that could impair compliance with the protocol or visits to the trial center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's parent currently has a disability that could impair compliance with the protocol or visits to the trial center.","meaning":"Boolean indicating whether the patient's parent currently has a disability that could impair compliance with the protocol or visits to the trial center."} ;; "the patient has a parent who has a disability that could impair compliance with the protocol or visits to the trial center"

(declare-const parent_lives_in_geographical_location_that_impairs_compliance_or_visits_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's parent currently lives in a geographical location that could impair compliance with the protocol or visits to the trial center.","when_to_set_to_false":"Set to false if the patient's parent currently does not live in a geographical location that could impair compliance with the protocol or visits to the trial center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's parent currently lives in a geographical location that could impair compliance with the protocol or visits to the trial center.","meaning":"Boolean indicating whether the patient's parent currently lives in a geographical location that could impair compliance with the protocol or visits to the trial center."} ;; "the patient has a parent who lives in a geographical location that could impair compliance with the protocol or visits to the trial center"

(declare-const legal_guardian_has_disability_that_impairs_compliance_or_visits_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's legal guardian currently has a disability that could impair compliance with the protocol or visits to the trial center.","when_to_set_to_false":"Set to false if the patient's legal guardian currently does not have a disability that could impair compliance with the protocol or visits to the trial center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's legal guardian currently has a disability that could impair compliance with the protocol or visits to the trial center.","meaning":"Boolean indicating whether the patient's legal guardian currently has a disability that could impair compliance with the protocol or visits to the trial center."} ;; "the patient has a legal guardian who has a disability that could impair compliance with the protocol or visits to the trial center"

(declare-const legal_guardian_lives_in_geographical_location_that_impairs_compliance_or_visits_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's legal guardian currently lives in a geographical location that could impair compliance with the protocol or visits to the trial center.","when_to_set_to_false":"Set to false if the patient's legal guardian currently does not live in a geographical location that could impair compliance with the protocol or visits to the trial center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's legal guardian currently lives in a geographical location that could impair compliance with the protocol or visits to the trial center.","meaning":"Boolean indicating whether the patient's legal guardian currently lives in a geographical location that could impair compliance with the protocol or visits to the trial center."} ;; "the patient has a legal guardian who lives in a geographical location that could impair compliance with the protocol or visits to the trial center"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not parent_has_disability_that_impairs_compliance_or_visits_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a parent who has a disability that could impair compliance with the protocol or visits to the trial center"

(assert
(! (not parent_lives_in_geographical_location_that_impairs_compliance_or_visits_now)
:named REQ14_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has a parent who lives in a geographical location that could impair compliance with the protocol or visits to the trial center"

(assert
(! (not legal_guardian_has_disability_that_impairs_compliance_or_visits_now)
:named REQ14_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has a legal guardian who has a disability that could impair compliance with the protocol or visits to the trial center"

(assert
(! (not legal_guardian_lives_in_geographical_location_that_impairs_compliance_or_visits_now)
:named REQ14_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has a legal guardian who lives in a geographical location that could impair compliance with the protocol or visits to the trial center"
