;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_undergoing_assisted_breathing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing assisted breathing (ventilatory support).","when_to_set_to_false":"Set to false if the patient is currently not undergoing assisted breathing (ventilatory support).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing assisted breathing (ventilatory support).","meaning":"Boolean indicating whether the patient is currently undergoing assisted breathing (ventilatory support)."} ;; "need for ventilatory support"
(declare-const patient_has_finding_of_dyspnea_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dyspnea and the dyspnea is severe.","when_to_set_to_false":"Set to false if the patient currently has dyspnea but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dyspnea is severe.","meaning":"Boolean indicating whether the patient currently has severe dyspnea."} ;; "severe dyspnea"
(declare-const patient_has_finding_of_dyspnea_now@@failed_to_respond_to_emergency_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dyspnea and the dyspnea has failed to respond to emergency treatment.","when_to_set_to_false":"Set to false if the patient currently has dyspnea and the dyspnea has responded to emergency treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dyspnea has failed to respond to emergency treatment.","meaning":"Boolean indicating whether the patient currently has dyspnea that has failed to respond to emergency treatment."} ;; "failure to respond to emergency treatment"
(declare-const patient_has_finding_of_hypoxemia_now@@persistent Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypoxemia and the hypoxemia is persistent.","when_to_set_to_false":"Set to false if the patient currently has hypoxemia but it is not persistent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypoxemia is persistent.","meaning":"Boolean indicating whether the patient currently has persistent hypoxemia."} ;; "persistent hypoxemia"
(declare-const patient_is_undergoing_oxygen_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing oxygen therapy (oxygen administration).","when_to_set_to_false":"Set to false if the patient is currently not undergoing oxygen therapy (oxygen administration).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing oxygen therapy (oxygen administration).","meaning":"Boolean indicating whether the patient is currently undergoing oxygen therapy (oxygen administration)."} ;; "despite oxygen administration"
(declare-const patient_has_finding_of_respiratory_acidosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory acidosis.","when_to_set_to_false":"Set to false if the patient currently does not have respiratory acidosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory acidosis.","meaning":"Boolean indicating whether the patient currently has respiratory acidosis."} ;; "respiratory acidosis"
(declare-const patient_has_finding_of_clouded_consciousness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clouded consciousness (mental confusion).","when_to_set_to_false":"Set to false if the patient currently does not have clouded consciousness (mental confusion).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clouded consciousness (mental confusion).","meaning":"Boolean indicating whether the patient currently has clouded consciousness (mental confusion)."} ;; "mental confusion"
(declare-const patient_has_finding_of_circulatory_insufficiency_now@@requires_vasopressor_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current circulatory insufficiency requires vasopressor therapy.","when_to_set_to_false":"Set to false if the patient's current circulatory insufficiency does not require vasopressor therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current circulatory insufficiency requires vasopressor therapy.","meaning":"Boolean indicating whether the patient's current circulatory insufficiency requires vasopressor therapy."} ;; "circulatory insufficiency (need of vasopressor therapy)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Ventilatory support is indicated by (severe dyspnea AND failure to respond to emergency treatment)
(assert
(! (=> (and patient_has_finding_of_dyspnea_now@@severe
            patient_has_finding_of_dyspnea_now@@failed_to_respond_to_emergency_treatment)
       patient_is_undergoing_assisted_breathing_now)
:named REQ0_AUXILIARY0)) ;; "need for ventilatory support (indicated by (severe dyspnea AND failure to respond to emergency treatment))"

;; Persistent hypoxemia is present if patient has persistent hypoxemia AND is undergoing oxygen therapy
(assert
(! (=> (and patient_has_finding_of_hypoxemia_now@@persistent
            patient_is_undergoing_oxygen_therapy_now)
       patient_has_finding_of_hypoxemia_now@@persistent)
:named REQ0_AUXILIARY1)) ;; "persistent hypoxemia (partial pressure of oxygen in arterial blood less than 50 millimeters of mercury despite oxygen administration)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; 0.1: Exclusion if need for ventilatory support (indicated by (severe dyspnea AND failure to respond to emergency treatment))
(assert
(! (not patient_is_undergoing_assisted_breathing_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "need for ventilatory support (indicated by (severe dyspnea AND failure to respond to emergency treatment))"

;; 0.2: Exclusion if persistent hypoxemia (partial pressure of oxygen in arterial blood less than 50 millimeters of mercury despite oxygen administration)
(assert
(! (not patient_has_finding_of_hypoxemia_now@@persistent)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "persistent hypoxemia (partial pressure of oxygen in arterial blood less than 50 millimeters of mercury despite oxygen administration)"

;; 0.3: Exclusion if respiratory acidosis (arterial blood pH less than 7.35 AND partial pressure of carbon dioxide in arterial blood greater than 45 millimeters of mercury)
(assert
(! (not patient_has_finding_of_respiratory_acidosis_now)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "respiratory acidosis (arterial blood pH less than 7.35 AND partial pressure of carbon dioxide in arterial blood greater than 45 millimeters of mercury)"

;; 0.4: Exclusion if mental confusion
(assert
(! (not patient_has_finding_of_clouded_consciousness_now)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "mental confusion"

;; 0.5: Exclusion if circulatory insufficiency (need of vasopressor therapy)
(assert
(! (not patient_has_finding_of_circulatory_insufficiency_now@@requires_vasopressor_therapy)
:named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "circulatory insufficiency (need of vasopressor therapy)"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_body_temperature_value_recorded_now_withunit_celsius Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body temperature in degrees Celsius is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body temperature in degrees Celsius."} ;; "body temperature"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of fever.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} ;; "fever"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: fever = body temperature > 38.5°C
(assert
(! (= patient_has_finding_of_fever_now
     (> patient_body_temperature_value_recorded_now_withunit_celsius 38.5))
   :named REQ1_AUXILIARY0)) ;; "fever (body temperature greater than 38.5 degrees Celsius)."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_fever_now)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has fever (body temperature greater than 38.5 degrees Celsius)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_decreased_liver_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has impaired hepatic (liver) function.","when_to_set_to_false":"Set to false if the patient currently does not have impaired hepatic (liver) function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired hepatic (liver) function.","meaning":"Boolean indicating whether the patient currently has impaired hepatic (liver) function."} ;; "impaired hepatic function"
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has impaired renal (kidney) function.","when_to_set_to_false":"Set to false if the patient currently does not have impaired renal (kidney) function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired renal (kidney) function.","meaning":"Boolean indicating whether the patient currently has impaired renal (kidney) function."} ;; "impaired renal function"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_decreased_liver_function_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has impaired hepatic function."

(assert
(! (not patient_has_finding_of_renal_impairment_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has impaired renal function."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of tuberculosis.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of tuberculosis.","meaning":"Boolean indicating whether the patient currently has tuberculosis."} ;; "tuberculosis infection"
(declare-const patient_has_finding_of_tuberculosis_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current tuberculosis infection is active.","when_to_set_to_false":"Set to false if the patient's current tuberculosis infection is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current tuberculosis infection is active.","meaning":"Boolean indicating whether the patient's current tuberculosis infection is active."} ;; "active tuberculosis infection"
(declare-const patient_has_finding_of_tuberculosis_now@@located_in_respiratory_tract Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current tuberculosis infection is located in the respiratory tract.","when_to_set_to_false":"Set to false if the patient's current tuberculosis infection is not located in the respiratory tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current tuberculosis infection is located in the respiratory tract.","meaning":"Boolean indicating whether the patient's current tuberculosis infection is located in the respiratory tract."} ;; "tuberculosis infection of the respiratory tract"
(declare-const patient_has_suspicion_of_tuberculosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected to have tuberculosis.","when_to_set_to_false":"Set to false if the patient is currently not suspected to have tuberculosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suspected to have tuberculosis.","meaning":"Boolean indicating whether the patient is currently suspected to have tuberculosis."} ;; "suspected tuberculosis infection"
(declare-const patient_has_suspicion_of_tuberculosis_now@@located_in_respiratory_tract Bool) ;; {"when_to_set_to_true":"Set to true if the patient's suspected tuberculosis infection is located in the respiratory tract.","when_to_set_to_false":"Set to false if the patient's suspected tuberculosis infection is not located in the respiratory tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's suspected tuberculosis infection is located in the respiratory tract.","meaning":"Boolean indicating whether the patient's suspected tuberculosis infection is located in the respiratory tract."} ;; "suspected tuberculosis infection of the respiratory tract"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_tuberculosis_now@@active
      patient_has_finding_of_tuberculosis_now)
:named REQ3_AUXILIARY0)) ;; "active tuberculosis infection"

(assert
(! (=> patient_has_finding_of_tuberculosis_now@@located_in_respiratory_tract
      patient_has_finding_of_tuberculosis_now)
:named REQ3_AUXILIARY1)) ;; "tuberculosis infection of the respiratory tract"

(assert
(! (=> patient_has_suspicion_of_tuberculosis_now@@located_in_respiratory_tract
      patient_has_suspicion_of_tuberculosis_now)
:named REQ3_AUXILIARY2)) ;; "suspected tuberculosis infection of the respiratory tract"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have active tuberculosis infection of the respiratory tract
(assert
(! (not (and patient_has_finding_of_tuberculosis_now@@active
             patient_has_finding_of_tuberculosis_now@@located_in_respiratory_tract))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active tuberculosis infection of the respiratory tract."

;; Exclusion: patient must NOT have suspected tuberculosis infection of the respiratory tract
(assert
(! (not patient_has_suspicion_of_tuberculosis_now@@located_in_respiratory_tract)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected tuberculosis infection of the respiratory tract."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_acute_exacerbation_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute exacerbation of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have acute exacerbation of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute exacerbation of asthma.","meaning":"Boolean indicating whether the patient currently has acute exacerbation of asthma."} ;; "The patient is excluded if the patient has acute exacerbation of asthma."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_finding_of_acute_exacerbation_of_asthma_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute exacerbation of asthma."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_hypersensitivity_to_sultamicillin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to sultamicillin.","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to sultamicillin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to sultamicillin.","meaning":"Boolean indicating whether the patient currently has hypersensitivity to sultamicillin."} ;; "hypersensitivity to sultamicillin"
(declare-const patient_has_suspicion_of_sultamicillin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently is suspected to have hypersensitivity to sultamicillin.","when_to_set_to_false":"Set to false if the patient currently is not suspected to have hypersensitivity to sultamicillin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently is suspected to have hypersensitivity to sultamicillin.","meaning":"Boolean indicating whether the patient currently is suspected to have hypersensitivity to sultamicillin."} ;; "suspected hypersensitivity to sultamicillin"
(declare-const patient_has_intolerance_to_sultamicillin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intolerance or serious adverse reaction to sultamicillin.","when_to_set_to_false":"Set to false if the patient currently does not have intolerance or serious adverse reaction to sultamicillin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intolerance or serious adverse reaction to sultamicillin.","meaning":"Boolean indicating whether the patient currently has intolerance or serious adverse reaction to sultamicillin."} ;; "serious adverse reaction to sultamicillin"
(declare-const patient_has_hypersensitivity_to_allergic_reaction_caused_by_penicillin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to penicillins.","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to penicillins.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to penicillins.","meaning":"Boolean indicating whether the patient currently has hypersensitivity to penicillins."} ;; "hypersensitivity to penicillins"
(declare-const patient_has_suspicion_of_allergy_to_penicillin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently is suspected to have hypersensitivity to penicillins.","when_to_set_to_false":"Set to false if the patient currently is not suspected to have hypersensitivity to penicillins.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently is suspected to have hypersensitivity to penicillins.","meaning":"Boolean indicating whether the patient currently is suspected to have hypersensitivity to penicillins."} ;; "suspected hypersensitivity to penicillins"
(declare-const patient_has_hypersensitivity_to_allergy_to_cephalosporin_antibacterial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypersensitivity to cephalosporins.","when_to_set_to_false":"Set to false if the patient currently does not have hypersensitivity to cephalosporins.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypersensitivity to cephalosporins.","meaning":"Boolean indicating whether the patient currently has hypersensitivity to cephalosporins."} ;; "hypersensitivity to cephalosporins"
(declare-const patient_has_suspicion_of_allergy_to_cephalosporin_antibacterial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently is suspected to have hypersensitivity to cephalosporins.","when_to_set_to_false":"Set to false if the patient currently is not suspected to have hypersensitivity to cephalosporins.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently is suspected to have hypersensitivity to cephalosporins.","meaning":"Boolean indicating whether the patient currently is suspected to have hypersensitivity to cephalosporins."} ;; "suspected hypersensitivity to cephalosporins"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_hypersensitivity_to_sultamicillin_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to sultamicillin."

(assert
(! (not patient_has_suspicion_of_sultamicillin_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected hypersensitivity to sultamicillin."

(assert
(! (not patient_has_intolerance_to_sultamicillin_now)
:named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serious adverse reaction to sultamicillin."

(assert
(! (not patient_has_hypersensitivity_to_allergic_reaction_caused_by_penicillin_now)
:named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to penicillins."

(assert
(! (not patient_has_suspicion_of_allergy_to_penicillin_now)
:named REQ5_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected hypersensitivity to penicillins."

(assert
(! (not patient_has_hypersensitivity_to_allergy_to_cephalosporin_antibacterial_now)
:named REQ5_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to cephalosporins."

(assert
(! (not patient_has_suspicion_of_allergy_to_cephalosporin_antibacterial_now)
:named REQ5_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected hypersensitivity to cephalosporins."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_immunosuppression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of immunosuppression.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of immunosuppression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has immunosuppression.","meaning":"Boolean indicating whether the patient currently has immunosuppression."} ;; "immunosuppression"
(declare-const patient_is_undergoing_immunosuppressive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving immunosuppressive therapy.","when_to_set_to_false":"Set to false if the patient is not currently receiving immunosuppressive therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving immunosuppressive therapy.","meaning":"Boolean indicating whether the patient is currently undergoing immunosuppressive therapy."} ;; "immunosuppressive therapy"
(declare-const patient_has_undergone_administration_of_antineoplastic_agent_inthepast28days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone administration of an antineoplastic agent (cytostatic chemotherapy) within the past 28 days.","when_to_set_to_false":"Set to false if the patient has not undergone administration of an antineoplastic agent (cytostatic chemotherapy) within the past 28 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone administration of an antineoplastic agent (cytostatic chemotherapy) within the past 28 days.","meaning":"Boolean indicating whether the patient has undergone administration of an antineoplastic agent (cytostatic chemotherapy) within the past 28 days."} ;; "cytostatic chemotherapy within last 28 days"
(declare-const patient_has_finding_of_neutropenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of neutropenia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of neutropenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has neutropenia.","meaning":"Boolean indicating whether the patient currently has neutropenia."} ;; "neutropenia"
(declare-const patient_prednisolone_value_recorded_now_withunit_milligrams_per_day Real) ;; {"when_to_set_to_value":"Set to the measured or prescribed daily dose of prednisolone equivalent in milligrams per day if available.","when_to_set_to_null":"Set to null if no such measurement or prescription is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current daily dose of prednisolone equivalent in milligrams per day."} ;; "prednisolone equivalent greater than or equal to 20 milligrams per day"
(declare-const patient_prednisolone_value_recorded_now_withunit_milligrams_per_day@@duration_greater_than_14_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current daily dose of prednisolone equivalent in milligrams per day has been administered for more than 14 days.","when_to_set_to_false":"Set to false if the patient's current daily dose of prednisolone equivalent in milligrams per day has not been administered for more than 14 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose has been administered for more than 14 days.","meaning":"Boolean indicating whether the patient's current daily dose of prednisolone equivalent in milligrams per day has been administered for more than 14 days."} ;; "for more than 14 days"
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"
(declare-const patient_has_finding_of_immunosuppression_now@@temporalcontext_after_organ_transplant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current immunosuppression occurred after organ transplant.","when_to_set_to_false":"Set to false if the patient's current immunosuppression did not occur after organ transplant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunosuppression occurred after organ transplant.","meaning":"Boolean indicating whether the patient's current immunosuppression occurred after organ transplant."} ;; "immunosuppression after organ transplant"
(declare-const patient_has_finding_of_immunosuppression_now@@temporalcontext_after_bone_marrow_transplant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current immunosuppression occurred after bone marrow transplant.","when_to_set_to_false":"Set to false if the patient's current immunosuppression did not occur after bone marrow transplant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunosuppression occurred after bone marrow transplant.","meaning":"Boolean indicating whether the patient's current immunosuppression occurred after bone marrow transplant."} ;; "immunosuppression after bone marrow transplant"
(declare-const patient_has_finding_of_secondary_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of secondary malignant neoplastic disease (metastatic malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of secondary malignant neoplastic disease (metastatic malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary malignant neoplastic disease (metastatic malignancy).","meaning":"Boolean indicating whether the patient currently has secondary malignant neoplastic disease (metastatic malignancy)."} ;; "metastatic malignancy"
(declare-const patient_has_finding_of_malignant_tumor_of_lymphoid_hemopoietic_and_related_tissue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of malignant tumor of lymphoid, hemopoietic, or related tissue (hematological malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of malignant tumor of lymphoid, hemopoietic, or related tissue (hematological malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant tumor of lymphoid, hemopoietic, or related tissue (hematological malignancy).","meaning":"Boolean indicating whether the patient currently has a malignant tumor of lymphoid, hemopoietic, or related tissue (hematological malignancy)."} ;; "hematological malignancy"
(declare-const patient_has_finding_of_splenectomy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of having undergone splenectomy (is splenectomized).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of having undergone splenectomy (is not splenectomized).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of having undergone splenectomy.","meaning":"Boolean indicating whether the patient currently has a clinical finding of having undergone splenectomy (is splenectomized)."} ;; "is splenectomized"
(declare-const patient_has_finding_of_hyposplenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of hyposplenia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of hyposplenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of hyposplenia.","meaning":"Boolean indicating whether the patient currently has a clinical finding of hyposplenia."} ;; "hyposplenia"
(declare-const patient_has_finding_of_asplenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of asplenia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of asplenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has asplenia.","meaning":"Boolean indicating whether the patient currently has asplenia."} ;; "asplenia"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_immunosuppression_now@@temporalcontext_after_organ_transplant
      patient_has_finding_of_immunosuppression_now)
   :named REQ6_AUXILIARY0)) ;; "immunosuppression after organ transplant"

(assert
(! (=> patient_has_finding_of_immunosuppression_now@@temporalcontext_after_bone_marrow_transplant
      patient_has_finding_of_immunosuppression_now)
   :named REQ6_AUXILIARY1)) ;; "immunosuppression after bone marrow transplant"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have any of the following
(assert
(! (not (or
  patient_has_finding_of_immunosuppression_now
  patient_is_undergoing_immunosuppressive_therapy_now
  patient_has_undergone_administration_of_antineoplastic_agent_inthepast28days
  patient_has_finding_of_neutropenia_now
  (and (>= patient_prednisolone_value_recorded_now_withunit_milligrams_per_day 20)
       patient_prednisolone_value_recorded_now_withunit_milligrams_per_day@@duration_greater_than_14_days)
  patient_has_finding_of_human_immunodeficiency_virus_infection_now
  patient_has_finding_of_immunosuppression_now@@temporalcontext_after_organ_transplant
  patient_has_finding_of_immunosuppression_now@@temporalcontext_after_bone_marrow_transplant
  patient_has_finding_of_secondary_malignant_neoplastic_disease_now
  patient_has_finding_of_malignant_tumor_of_lymphoid_hemopoietic_and_related_tissue_now
  patient_has_finding_of_splenectomy_now
  patient_has_finding_of_hyposplenia_now
  patient_has_finding_of_asplenia_now
))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has immunosuppression OR the patient is receiving immunosuppressive therapy (cytostatic chemotherapy within last 28 days OR neutropenia (neutrophil count less than 1000 per microliter) OR systemic corticosteroid therapy (prednisolone equivalent greater than or equal to 20 milligrams per day for more than 14 days) OR human immunodeficiency virus infection OR immunosuppression after organ transplant OR immunosuppression after bone marrow transplant)) OR the patient has metastatic malignancy OR the patient has hematological malignancy OR the patient is splenectomized OR the patient has hyposplenia OR the patient has asplenia."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_antibiotic_administration_count_prior_to_randomization Real) ;; {"when_to_set_to_value":"Set to the total number of antibiotic administrations the patient has received prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many antibiotic administrations the patient has received prior to randomization.","meaning":"Numeric value indicating the total number of antibiotic administrations the patient has received prior to randomization."} ;; "only a singular administration of antibiotics prior to randomization"
(declare-const patient_has_undergone_oral_antibiotic_therapy_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone oral antibiotic therapy within the past 30 days prior to randomization.","when_to_set_to_false":"Set to false if the patient has not undergone oral antibiotic therapy within the past 30 days prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone oral antibiotic therapy within the past 30 days prior to randomization.","meaning":"Boolean indicating whether the patient has undergone oral antibiotic therapy within the past 30 days prior to randomization."} ;; "oral antibiotic use within 30 days prior to randomization"
(declare-const patient_has_undergone_parenteral_antibiotic_use_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone parenteral antibiotic use within the past 30 days prior to randomization.","when_to_set_to_false":"Set to false if the patient has not undergone parenteral antibiotic use within the past 30 days prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone parenteral antibiotic use within the past 30 days prior to randomization.","meaning":"Boolean indicating whether the patient has undergone parenteral antibiotic use within the past 30 days prior to randomization."} ;; "parenteral antibiotic use within 30 days prior to randomization"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (and
         (or patient_has_undergone_oral_antibiotic_therapy_inthepast30days
             patient_has_undergone_parenteral_antibiotic_use_inthepast30days)
         (not (= patient_antibiotic_administration_count_prior_to_randomization 1))
      ))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "(the patient has had oral antibiotic use within 30 days prior to randomization OR the patient has had parenteral antibiotic use within 30 days prior to randomization) AND NOT (the patient has had only a singular administration of antibiotics prior to randomization)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const days_since_last_inpatient_treatment Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient's most recent in-patient treatment, if known.","when_to_set_to_null":"Set to null if the date of the most recent in-patient treatment is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of days since the patient's most recent in-patient treatment."} ;; "number of days since the patient's most recent in-patient treatment"

(declare-const patient_has_undergone_inpatient_treatment_within_last_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone in-patient treatment at any time within the last 30 days.","when_to_set_to_false":"Set to false if the patient has not undergone in-patient treatment within the last 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone in-patient treatment within the last 30 days.","meaning":"Boolean indicating whether the patient has undergone in-patient treatment within the last 30 days."} ;; "has had in-patient treatment within the last 30 days"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Definition: patient_has_undergone_inpatient_treatment_within_last_30_days is true iff days_since_last_inpatient_treatment < 30
(assert
(! (= patient_has_undergone_inpatient_treatment_within_last_30_days
     (< days_since_last_inpatient_treatment 30))
:named REQ8_AUXILIARY0)) ;; "has had in-patient treatment within the last 30 days"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_undergone_inpatient_treatment_within_last_30_days)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had in-patient treatment within the last 30 days."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const antibiotic_is_clearly_indicated_for_treatment_of_known_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if an antibiotic is clearly indicated for treatment of a known infection in the patient at the current time.","when_to_set_to_false":"Set to false if an antibiotic is not clearly indicated for treatment of a known infection in the patient at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether an antibiotic is clearly indicated for treatment of a known infection in the patient at the current time.","meaning":"Boolean indicating whether an antibiotic is clearly indicated for treatment of a known infection in the patient at the current time."} ;; "an antibiotic is clearly indicated for treatment of a known infection"

(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder due to infection."} ;; "infection"

(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now@@infection_is_known Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder due to infection and the infection is known (i.e., confirmed and not merely suspected).","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of a disorder due to infection but the infection is not known (e.g., only suspected or undiagnosed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is known.","meaning":"Boolean indicating whether the patient's current diagnosis of disorder due to infection is known."} ;; "known infection"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_diagnosis_of_disorder_due_to_infection_now@@infection_is_known
      patient_has_diagnosis_of_disorder_due_to_infection_now)
   :named REQ9_AUXILIARY0)) ;; "infection is known" implies "infection"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not antibiotic_is_clearly_indicated_for_treatment_of_known_infection_now)
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if an antibiotic is clearly indicated for treatment of a known infection."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_methicillin_resistant_staphylococcus_aureus_colonization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has methicillin-resistant Staphylococcus aureus colonization.","when_to_set_to_false":"Set to false if the patient currently does not have methicillin-resistant Staphylococcus aureus colonization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has methicillin-resistant Staphylococcus aureus colonization.","meaning":"Boolean indicating whether the patient currently has methicillin-resistant Staphylococcus aureus colonization."} ;; "methicillin-resistant Staphylococcus aureus colonization"
(declare-const patient_has_finding_of_methicillin_resistant_staphylococcus_aureus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of methicillin-resistant Staphylococcus aureus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of methicillin-resistant Staphylococcus aureus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of methicillin-resistant Staphylococcus aureus infection.","meaning":"Boolean indicating whether the patient currently has a methicillin-resistant Staphylococcus aureus infection."} ;; "methicillin-resistant Staphylococcus aureus infection"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_methicillin_resistant_staphylococcus_aureus_colonization_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has methicillin-resistant Staphylococcus aureus colonization."

(assert
(! (not patient_has_finding_of_methicillin_resistant_staphylococcus_aureus_infection_now)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has methicillin-resistant Staphylococcus aureus infection."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_diagnosis_of_bronchiectasis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bronchiectasis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bronchiectasis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bronchiectasis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bronchiectasis."} ;; "bronchiectasis"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_diagnosis_of_bronchiectasis_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bronchiectasis."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_microbial_culture_of_sputum_value_recorded_inthepast1years_withunit_count Real) ;; {"when_to_set_to_value":"Set to the count of positive microbial cultures of sputum recorded for the patient in the previous 1 year.","when_to_set_to_null":"Set to null if the count of positive microbial cultures of sputum in the previous 1 year is unknown, not documented, or cannot be determined.","meaning":"Numeric count of positive microbial cultures of sputum for the patient in the previous 1 year."} ;; "number of positive sputum cultures in the previous year"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (> patient_microbial_culture_of_sputum_value_recorded_inthepast1years_withunit_count 3))
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bacterial airway colonization (number of positive sputum cultures in the previous year > 3)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease.","when_to_set_to_false":"Set to false if the patient currently does not have any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease.","meaning":"Boolean indicating whether the patient currently has any disease."} ;; "disease"
(declare-const patient_has_finding_of_disease_now@@progressively_fatal Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease and that disease is progressively fatal.","when_to_set_to_false":"Set to false if the patient currently has a disease and that disease is not progressively fatal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease is progressively fatal.","meaning":"Boolean indicating whether the patient's current disease is progressively fatal."} ;; "progressively fatal disease"
(declare-const life_expectancy_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's life expectancy in months, as recorded at the current time.","when_to_set_to_null":"Set to null if the patient's life expectancy in months at the current time is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's life expectancy in months, recorded at the current time."} ;; "life expectancy ≤ 6 months"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_now@@progressively_fatal
       patient_has_finding_of_disease_now)
   :named REQ13_AUXILIARY0)) ;; "progressively fatal disease"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Exclusion: patient must NOT have a progressively fatal disease
(assert
(! (not patient_has_finding_of_disease_now@@progressively_fatal)
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a progressively fatal disease."

;; Exclusion: patient must NOT have life expectancy ≤ 6 months
(assert
(! (not (<= life_expectancy_value_recorded_now_in_months 6))
   :named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has life expectancy ≤ 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_diagnosis_of_infectious_mononucleosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of infectious mononucleosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of infectious mononucleosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of infectious mononucleosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of infectious mononucleosis."} ;; "mononucleosis"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
  (! (not patient_has_diagnosis_of_infectious_mononucleosis_now)
     :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has mononucleosis."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_lymphatic_leukemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has lymphatic leukemia.","when_to_set_to_false":"Set to false if the patient currently does not have lymphatic leukemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lymphatic leukemia.","meaning":"Boolean indicating whether the patient currently has lymphatic leukemia."} ;; "The patient is excluded if the patient has lymphatic leukemia."

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
  (! (not patient_has_finding_of_lymphatic_leukemia_now)
     :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has lymphatic leukemia."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the gastrointestinal tract.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the gastrointestinal tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the gastrointestinal tract.","meaning":"Boolean indicating whether the patient currently has a disorder of the gastrointestinal tract."} ;; "gastro-intestinal disorder"
(declare-const patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disorder of the gastrointestinal tract is severe.","when_to_set_to_false":"Set to false if the patient's disorder of the gastrointestinal tract is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disorder is severe.","meaning":"Boolean indicating whether the patient's disorder of the gastrointestinal tract is severe."} ;; "severe gastro-intestinal disorder"
(declare-const patient_has_finding_of_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has vomiting.","when_to_set_to_false":"Set to false if the patient currently does not have vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has vomiting.","meaning":"Boolean indicating whether the patient currently has vomiting."} ;; "vomiting"
(declare-const patient_has_finding_of_diarrhea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diarrhea.","when_to_set_to_false":"Set to false if the patient currently does not have diarrhea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diarrhea.","meaning":"Boolean indicating whether the patient currently has diarrhea."} ;; "diarrhea"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@severe
      patient_has_finding_of_disorder_of_gastrointestinal_tract_now)
    :named REQ16_AUXILIARY0)) ;; "severe gastro-intestinal disorder"

;; ===================== Constraint Assertions (REQ 16) =====================
;; Exclusion if (severe GI disorder with vomiting) OR (severe GI disorder with diarrhea)
(assert
(! (not (or (and patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@severe
                 patient_has_finding_of_vomiting_now)
            (and patient_has_finding_of_disorder_of_gastrointestinal_tract_now@@severe
                 patient_has_finding_of_diarrhea_now)))
    :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has severe gastro-intestinal disorder with vomiting) OR (the patient has severe gastro-intestinal disorder with diarrhea)."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_is_woman Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a woman.","when_to_set_to_false":"Set to false if the patient is not a woman.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a woman.","meaning":"Boolean indicating whether the patient is a woman."} ;; "the patient is a woman"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breastfeeding.","meaning":"Boolean indicating whether the patient is currently breastfeeding."} ;; "the patient is breast feeding"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
  (! (not (and patient_is_woman patients_breastfeeding_is_positive_now))
     :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a woman) AND (the patient is breast feeding)."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_taken_pharmaceutical_biologic_product_inthepast1months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any pharmaceutical or biologic product within the past 1 month.","when_to_set_to_false":"Set to false if the patient has not taken any pharmaceutical or biologic product within the past 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any pharmaceutical or biologic product within the past 1 month.","meaning":"Boolean indicating whether the patient has taken any pharmaceutical or biologic product within the past 1 month."} ;; "the patient has received treatment with any other investigational drug within 1 month prior to study entry"
(declare-const patient_has_taken_pharmaceutical_biologic_product_inthepast1months@@is_investigational Bool) ;; {"when_to_set_to_true":"Set to true if the pharmaceutical or biologic product taken within the past 1 month is investigational.","when_to_set_to_false":"Set to false if the product taken is not investigational.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the product is investigational.","meaning":"Boolean indicating whether the product taken is investigational."} ;; "investigational drug"
(declare-const patient_has_taken_pharmaceutical_biologic_product_inthepast1months@@is_not_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the pharmaceutical or biologic product taken within the past 1 month is not the study drug.","when_to_set_to_false":"Set to false if the product taken is the study drug.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the product is the study drug.","meaning":"Boolean indicating whether the product taken is not the study drug."} ;; "any other investigational drug"

(declare-const patient_will_undergo_pharmaceutical_biologic_product_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient has planned to take any pharmaceutical or biologic product in the future.","when_to_set_to_false":"Set to false if the patient does not have any such plan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has such a plan.","meaning":"Boolean indicating whether the patient has planned to take any pharmaceutical or biologic product in the future."} ;; "the patient has treatment with any other investigational drug planned for the study period"
(declare-const patient_will_undergo_pharmaceutical_biologic_product_inthefuture@@is_investigational Bool) ;; {"when_to_set_to_true":"Set to true if the pharmaceutical or biologic product planned for future use is investigational.","when_to_set_to_false":"Set to false if the product planned is not investigational.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the product is investigational.","meaning":"Boolean indicating whether the product planned for future use is investigational."} ;; "investigational drug planned"
(declare-const patient_will_undergo_pharmaceutical_biologic_product_inthefuture@@is_not_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the pharmaceutical or biologic product planned for future use is not the study drug.","when_to_set_to_false":"Set to false if the product planned is the study drug.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the product is the study drug.","meaning":"Boolean indicating whether the product planned for future use is not the study drug."} ;; "any other investigational drug planned"
(declare-const patient_will_undergo_pharmaceutical_biologic_product_inthefuture@@planned_for_treatment_phase Bool) ;; {"when_to_set_to_true":"Set to true if the pharmaceutical or biologic product planned for future use is scheduled for the treatment phase of the study period.","when_to_set_to_false":"Set to false if the product planned is not scheduled for the treatment phase.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the product is scheduled for the treatment phase.","meaning":"Boolean indicating whether the product planned for future use is scheduled for the treatment phase of the study period."} ;; "planned for the study period during treatment phase"
(declare-const patient_will_undergo_pharmaceutical_biologic_product_inthefuture@@planned_for_follow_up_phase Bool) ;; {"when_to_set_to_true":"Set to true if the pharmaceutical or biologic product planned for future use is scheduled for the follow up phase of the study period.","when_to_set_to_false":"Set to false if the product planned is not scheduled for the follow up phase.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the product is scheduled for the follow up phase.","meaning":"Boolean indicating whether the product planned for future use is scheduled for the follow up phase of the study period."} ;; "planned for the study period during follow up phase"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_taken_pharmaceutical_biologic_product_inthepast1months@@is_investigational
      patient_has_taken_pharmaceutical_biologic_product_inthepast1months)
    :named REQ18_AUXILIARY0)) ;; "investigational drug within 1 month prior to study entry"

(assert
(! (=> patient_has_taken_pharmaceutical_biologic_product_inthepast1months@@is_not_study_drug
      patient_has_taken_pharmaceutical_biologic_product_inthepast1months)
    :named REQ18_AUXILIARY1)) ;; "any other investigational drug within 1 month prior to study entry"

(assert
(! (=> (and patient_has_taken_pharmaceutical_biologic_product_inthepast1months@@is_investigational
           patient_has_taken_pharmaceutical_biologic_product_inthepast1months@@is_not_study_drug)
      (and patient_has_taken_pharmaceutical_biologic_product_inthepast1months@@is_investigational
           patient_has_taken_pharmaceutical_biologic_product_inthepast1months@@is_not_study_drug))
    :named REQ18_AUXILIARY2)) ;; "any other investigational drug within 1 month prior to study entry"

(assert
(! (=> patient_will_undergo_pharmaceutical_biologic_product_inthefuture@@is_investigational
      patient_will_undergo_pharmaceutical_biologic_product_inthefuture)
    :named REQ18_AUXILIARY3)) ;; "investigational drug planned for the study period"

(assert
(! (=> patient_will_undergo_pharmaceutical_biologic_product_inthefuture@@is_not_study_drug
      patient_will_undergo_pharmaceutical_biologic_product_inthefuture)
    :named REQ18_AUXILIARY4)) ;; "any other investigational drug planned for the study period"

(assert
(! (=> patient_will_undergo_pharmaceutical_biologic_product_inthefuture@@planned_for_treatment_phase
      patient_will_undergo_pharmaceutical_biologic_product_inthefuture)
    :named REQ18_AUXILIARY5)) ;; "planned for the study period during treatment phase"

(assert
(! (=> patient_will_undergo_pharmaceutical_biologic_product_inthefuture@@planned_for_follow_up_phase
      patient_will_undergo_pharmaceutical_biologic_product_inthefuture)
    :named REQ18_AUXILIARY6)) ;; "planned for the study period during follow up phase"

;; ===================== Constraint Assertions (REQ 18) =====================
;; Exclusion 1: The patient has received treatment with any other investigational drug within 1 month prior to study entry.
(assert
(! (not (and patient_has_taken_pharmaceutical_biologic_product_inthepast1months@@is_investigational
             patient_has_taken_pharmaceutical_biologic_product_inthepast1months@@is_not_study_drug))
    :named REQ18_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has received treatment with any other investigational drug within 1 month prior to study entry"

;; Exclusion 2: The patient has treatment with any other investigational drug planned for the study period during treatment phase.
(assert
(! (not (and patient_will_undergo_pharmaceutical_biologic_product_inthefuture@@is_investigational
             patient_will_undergo_pharmaceutical_biologic_product_inthefuture@@is_not_study_drug
             patient_will_undergo_pharmaceutical_biologic_product_inthefuture@@planned_for_treatment_phase))
    :named REQ18_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has treatment with any other investigational drug planned for the study period during treatment phase"

;; Exclusion 3: The patient has treatment with any other investigational drug planned for the study period during follow up phase.
(assert
(! (not (and patient_will_undergo_pharmaceutical_biologic_product_inthefuture@@is_investigational
             patient_will_undergo_pharmaceutical_biologic_product_inthefuture@@is_not_study_drug
             patient_will_undergo_pharmaceutical_biologic_product_inthefuture@@planned_for_follow_up_phase))
    :named REQ18_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has treatment with any other investigational drug planned for the study period during follow up phase"

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_mental_condition_rendering_patient_unable_to_understand_study_consequences_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental condition that renders the patient unable to understand the nature, scope, and possible consequences of the study.","when_to_set_to_false":"Set to false if the patient currently does not have a mental condition that renders the patient unable to understand the nature, scope, and possible consequences of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental condition that renders the patient unable to understand the nature, scope, and possible consequences of the study.","meaning":"Boolean indicating whether the patient currently has a mental condition that renders the patient unable to understand the nature, scope, and possible consequences of the study."} ;; "mental condition rendering the patient unable to understand the nature, scope, and possible consequences of the study."

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_mental_condition_rendering_patient_unable_to_understand_study_consequences_now)
    :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has mental condition rendering the patient unable to understand the nature, scope, and possible consequences of the study."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_has_finding_of_uncooperative_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has uncooperative behavior (uncooperative attitude).","when_to_set_to_false":"Set to false if the patient currently does not have uncooperative behavior (uncooperative attitude).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncooperative behavior (uncooperative attitude).","meaning":"Boolean indicating whether the patient currently has uncooperative behavior (uncooperative attitude)."} ;; "uncooperative attitude"
(declare-const patient_has_finding_of_uncooperative_behavior_now@@relevant_only_if_makes_patient_unlikely_to_comply_with_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current uncooperative behavior (uncooperative attitude) is relevant because it makes the patient unlikely to comply with the protocol.","when_to_set_to_false":"Set to false if the patient's current uncooperative behavior (uncooperative attitude) does not make the patient unlikely to comply with the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's uncooperative behavior (uncooperative attitude) makes the patient unlikely to comply with the protocol.","meaning":"Boolean indicating whether the patient's current uncooperative behavior (uncooperative attitude) is relevant only if it makes the patient unlikely to comply with the protocol."} ;; "uncooperative attitude relevant only if makes patient unlikely to comply with protocol"
(declare-const patient_is_unable_to_return_for_follow_up_visits Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to return for follow up visits.","when_to_set_to_false":"Set to false if the patient is able to return for follow up visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to return for follow up visits.","meaning":"Boolean indicating whether the patient is unable to return for follow up visits."} ;; "unable to return for follow up visits"
(declare-const patient_is_unlikely_to_complete_the_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unlikely to complete the study.","when_to_set_to_false":"Set to false if the patient is likely to complete the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unlikely to complete the study.","meaning":"Boolean indicating whether the patient is unlikely to complete the study."} ;; "unlikely to complete the study"
(declare-const patient_is_unlikely_to_comply_with_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unlikely to comply with the protocol for any reason.","when_to_set_to_false":"Set to false if the patient is likely to comply with the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unlikely to comply with the protocol.","meaning":"Boolean indicating whether the patient is unlikely to comply with the protocol for any reason."} ;; "unlikely to comply with the protocol"

;; ===================== Auxiliary Assertions (REQ 20) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_uncooperative_behavior_now@@relevant_only_if_makes_patient_unlikely_to_comply_with_protocol
           patient_is_unable_to_return_for_follow_up_visits
           patient_is_unlikely_to_complete_the_study)
       patient_is_unlikely_to_comply_with_protocol)
   :named REQ20_AUXILIARY0)) ;; "with non-exhaustive examples ((the patient has an uncooperative attitude) OR (the patient is unable to return for follow up visits) OR (the patient is unlikely to complete the study))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_uncooperative_behavior_now@@relevant_only_if_makes_patient_unlikely_to_comply_with_protocol
       patient_has_finding_of_uncooperative_behavior_now)
   :named REQ20_AUXILIARY1)) ;; "uncooperative attitude relevant only if makes patient unlikely to comply with protocol"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
(! (not patient_is_unlikely_to_comply_with_protocol)
   :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unlikely to comply with the protocol with non-exhaustive examples ((the patient has an uncooperative attitude) OR (the patient is unable to return for follow up visits) OR (the patient is unlikely to complete the study))."
