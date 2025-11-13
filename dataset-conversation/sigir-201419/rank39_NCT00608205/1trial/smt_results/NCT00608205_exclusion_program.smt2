;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_nasopharynx_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary malignant neoplasm of the nasopharynx.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary malignant neoplasm of the nasopharynx.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of primary malignant neoplasm of the nasopharynx.","meaning":"Boolean indicating whether the patient currently has a diagnosis of primary malignant neoplasm of the nasopharynx."} ;; "primary cancer of the nasopharynx"

(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_accessory_sinus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary malignant neoplasm of the accessory (paranasal) sinus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary malignant neoplasm of the accessory (paranasal) sinus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of primary malignant neoplasm of the accessory (paranasal) sinus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of primary malignant neoplasm of the accessory (paranasal) sinus."} ;; "primary cancer of the paranasal sinus"

(declare-const patient_has_diagnosis_of_primary_malignant_neoplasm_of_salivary_gland_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of primary malignant neoplasm of the salivary gland.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of primary malignant neoplasm of the salivary gland.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of primary malignant neoplasm of the salivary gland.","meaning":"Boolean indicating whether the patient currently has a diagnosis of primary malignant neoplasm of the salivary gland."} ;; "primary cancer of the salivary gland"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_primary_malignant_neoplasm_of_nasopharynx_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a primary cancer of the nasopharynx."

(assert
(! (not patient_has_diagnosis_of_primary_malignant_neoplasm_of_accessory_sinus_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a primary cancer of the paranasal sinus."

(assert
(! (not patient_has_diagnosis_of_primary_malignant_neoplasm_of_salivary_gland_now)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a primary cancer of the salivary gland."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_preinfarction_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of unstable angina (preinfarction syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of unstable angina (preinfarction syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable angina (preinfarction syndrome).","meaning":"Boolean indicating whether the patient currently has unstable angina (preinfarction syndrome)."} ;; "unstable angina"

(declare-const patient_has_finding_of_angina_control_poor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of uncontrolled angina (poorly controlled angina).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of uncontrolled angina (poorly controlled angina).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled angina (poorly controlled angina).","meaning":"Boolean indicating whether the patient currently has uncontrolled angina (poorly controlled angina)."} ;; "uncontrolled angina"

(declare-const patient_has_finding_of_jaundice_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of jaundice.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of jaundice.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has jaundice.","meaning":"Boolean indicating whether the patient currently has jaundice."} ;; "jaundice"

(declare-const patient_has_finding_of_jaundice_now@@clinically_apparent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's jaundice is clinically apparent.","when_to_set_to_false":"Set to false if the patient's jaundice is not clinically apparent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's jaundice is clinically apparent.","meaning":"Boolean indicating whether the patient's jaundice is clinically apparent."} ;; "clinically apparent jaundice"

(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} ;; "infection"

(declare-const patient_has_finding_of_disorder_due_to_infection_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's infection is active.","when_to_set_to_false":"Set to false if the patient's infection is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's infection is active.","meaning":"Boolean indicating whether the patient's infection is active."} ;; "active infection"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable for jaundice
(assert
(! (=> patient_has_finding_of_jaundice_now@@clinically_apparent
      patient_has_finding_of_jaundice_now)
:named REQ1_AUXILIARY0)) ;; "clinically apparent jaundice"

;; Qualifier variable implies corresponding stem variable for infection
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@active
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ1_AUXILIARY1)) ;; "active infection"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have unstable angina
(assert
(! (not patient_has_finding_of_preinfarction_syndrome_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable angina."

;; Exclusion: patient must NOT have uncontrolled angina
(assert
(! (not patient_has_finding_of_angina_control_poor_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled angina."

;; Exclusion: patient must NOT have clinically apparent jaundice
(assert
(! (not patient_has_finding_of_jaundice_now@@clinically_apparent)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically apparent jaundice."

;; Exclusion: patient must NOT have active infection
(assert
(! (not patient_has_finding_of_disorder_due_to_infection_now@@active)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active infection."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_disease_free_duration_value_recorded_in_years Real) ;; {"when_to_set_to_value":"Set to the number of years the patient has been continuously disease-free.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many years the patient has been continuously disease-free.","meaning":"Numeric value indicating the duration, in years, that the patient has been continuously disease-free."} ;; "the patient has NOT been continuously disease-free for at least five years"
(declare-const patient_has_been_continuously_disease_free_for_at_least_5_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been continuously disease-free for at least five years.","when_to_set_to_false":"Set to false if the patient has not been continuously disease-free for at least five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been continuously disease-free for at least five years.","meaning":"Boolean indicating whether the patient has been continuously disease-free for at least five years."} ;; "the patient has NOT been continuously disease-free for at least five years"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with any malignant neoplastic disease at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with any malignant neoplastic disease at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with any malignant neoplastic disease.","meaning":"Boolean indicating whether the patient has ever been diagnosed with any malignant neoplastic disease in their history."} ;; "the patient has a history of any other malignancy"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@excludes_squamous_cell_skin_cancer_basal_cell_skin_cancer_cervical_carcinoma_in_situ Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of malignant neoplastic disease excludes squamous cell skin cancer, basal cell skin cancer, and cervical carcinoma in-situ.","when_to_set_to_false":"Set to false if the diagnosis of malignant neoplastic disease includes any of squamous cell skin cancer, basal cell skin cancer, or cervical carcinoma in-situ.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis excludes these specific cancer types.","meaning":"Boolean indicating whether the diagnosis of malignant neoplastic disease excludes squamous cell skin cancer, basal cell skin cancer, and cervical carcinoma in-situ."} ;; "EXCEPT squamous cell skin cancer OR basal cell skin cancer OR cervical carcinoma in-situ"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@excludes_squamous_cell_skin_cancer_basal_cell_skin_cancer_cervical_carcinoma_in_situ
      patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory)
:named REQ2_AUXILIARY0)) ;; "EXCEPT squamous cell skin cancer OR basal cell skin cancer OR cervical carcinoma in-situ"

;; Disease-free duration defines the Boolean variable
(assert
(! (= patient_has_been_continuously_disease_free_for_at_least_5_years
      (>= patient_disease_free_duration_value_recorded_in_years 5))
:named REQ2_AUXILIARY1)) ;; "continuously disease-free for at least five years"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: history of any other malignancy (excluding the listed exceptions) AND NOT disease-free for at least five years
(assert
(! (not (and patient_has_diagnosis_of_malignant_neoplastic_disease_inthehistory@@excludes_squamous_cell_skin_cancer_basal_cell_skin_cancer_cervical_carcinoma_in_situ
             (not patient_has_been_continuously_disease_free_for_at_least_5_years)))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of any other malignancy EXCEPT squamous cell skin cancer OR basal cell skin cancer OR cervical carcinoma in-situ) AND (the patient has NOT been continuously disease-free for at least five years)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_histologic_diagnosis_of_squamous_cell_carcinoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a histologic diagnosis of squamous cell carcinoma.","when_to_set_to_false":"Set to false if the patient currently does not have a histologic diagnosis of squamous cell carcinoma (i.e., has any other histologic diagnosis or none).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a histologic diagnosis of squamous cell carcinoma.","meaning":"Boolean indicating whether the patient currently has a histologic diagnosis of squamous cell carcinoma."} ;; "histologic diagnosis of squamous cell carcinoma"
(declare-const patient_has_histologic_diagnosis_of_squamous_cell_carcinoma_now@@other_than_squamous_cell_carcinoma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current histologic diagnosis is other than squamous cell carcinoma.","when_to_set_to_false":"Set to false if the patient's current histologic diagnosis is squamous cell carcinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current histologic diagnosis is other than squamous cell carcinoma.","meaning":"Boolean indicating whether the patient's current histologic diagnosis is other than squamous cell carcinoma."} ;; "any histologic diagnosis other than squamous cell carcinoma"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_histologic_diagnosis_of_squamous_cell_carcinoma_now@@other_than_squamous_cell_carcinoma
     patient_has_histologic_diagnosis_of_squamous_cell_carcinoma_now)
:named REQ3_AUXILIARY0)) ;; "other than squamous cell carcinoma" implies a histologic diagnosis is present

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_histologic_diagnosis_of_squamous_cell_carcinoma_now@@other_than_squamous_cell_carcinoma)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any histologic diagnosis other than squamous cell carcinoma."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_at_risk_for_noncompliance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently considered at risk for noncompliance (poor compliance risk).","when_to_set_to_false":"Set to false if the patient is currently not considered at risk for noncompliance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently at risk for noncompliance.","meaning":"Boolean indicating whether the patient is currently considered at risk for noncompliance."} ;; "poor-compliance risk"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_at_risk_for_noncompliance_now)
:named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient might be a poor-compliance risk."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding as documented or reported.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breastfeeding.","meaning":"Boolean indicating whether the patient is currently breastfeeding."} ;; "breastfeeding"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Link alternate breastfeeding variable to main breastfeeding variable
(assert
(! (= patient_is_breastfeeding_now patients_breastfeeding_is_positive_now)
:named REQ5_AUXILIARY0)) ;; "the patient is breastfeeding"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
(assert
(! (not patient_is_breastfeeding_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breastfeeding."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the biological potential to bear children.","when_to_set_to_false":"Set to false if the patient currently does not have the biological potential to bear children.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has the biological potential to bear children."} ;; "the patient is of reproductive potential"

(declare-const patient_has_finding_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently practicing any form of contraception (birth control).","when_to_set_to_false":"Set to false if the patient is currently not practicing any form of contraception (birth control).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently practicing contraception (birth control).","meaning":"Boolean indicating whether the patient is currently practicing any form of contraception (birth control)."} ;; "birth control"

(declare-const patient_has_finding_of_contraception_now@@acceptable_method_to_prevent_pregnancy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently practicing contraception (birth control) and the method used is considered acceptable to prevent pregnancy.","when_to_set_to_false":"Set to false if the patient is currently practicing contraception (birth control) but the method used is not considered acceptable to prevent pregnancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the method of contraception is acceptable to prevent pregnancy.","meaning":"Boolean indicating whether the patient's current contraception method is considered acceptable to prevent pregnancy."} ;; "acceptable methods of birth control to prevent pregnancy"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_contraception_now@@acceptable_method_to_prevent_pregnancy
      patient_has_finding_of_contraception_now)
:named REQ6_AUXILIARY0)) ;; "acceptable methods of birth control to prevent pregnancy" implies "birth control"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: (the patient is of reproductive potential) AND (the patient is not willing to practice acceptable methods of birth control to prevent pregnancy)
(assert
(! (not (and patient_has_childbearing_potential_now
             (not patient_has_finding_of_contraception_now@@acceptable_method_to_prevent_pregnancy)))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is of reproductive potential) AND (the patient is not willing to practice acceptable methods of birth control to prevent pregnancy)."
