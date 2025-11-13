;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_nausea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of nausea.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of nausea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of nausea.","meaning":"Boolean indicating whether the patient currently has nausea."} ;; "nausea"
(declare-const patient_has_finding_of_nausea_now@@caused_by_other_reasons Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current nausea is caused by reasons other than the study intervention, such as central nervous system metastases or gastrointestinal obstruction.","when_to_set_to_false":"Set to false if the patient's current nausea is not caused by other reasons, or is caused by the study intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current nausea is caused by other reasons.","meaning":"Boolean indicating whether the patient's current nausea is caused by reasons other than the study intervention."} ;; "nausea caused by other reasons"
(declare-const patient_has_finding_of_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of vomiting.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of vomiting.","meaning":"Boolean indicating whether the patient currently has vomiting."} ;; "vomiting"
(declare-const patient_has_finding_of_vomiting_now@@caused_by_other_reasons Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current vomiting is caused by reasons other than the study intervention, such as central nervous system metastases or gastrointestinal obstruction.","when_to_set_to_false":"Set to false if the patient's current vomiting is not caused by other reasons, or is caused by the study intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current vomiting is caused by other reasons.","meaning":"Boolean indicating whether the patient's current vomiting is caused by reasons other than the study intervention."} ;; "vomiting caused by other reasons"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_nausea_now@@caused_by_other_reasons
       patient_has_finding_of_nausea_now)
   :named REQ0_AUXILIARY0)) ;; "nausea caused by other reasons"

(assert
(! (=> patient_has_finding_of_vomiting_now@@caused_by_other_reasons
       patient_has_finding_of_vomiting_now)
   :named REQ0_AUXILIARY1)) ;; "vomiting caused by other reasons"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_nausea_now@@caused_by_other_reasons)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has nausea caused by other reasons with non-exhaustive examples (central nervous system metastases, gastrointestinal obstruction)."

(assert
(! (not patient_has_finding_of_vomiting_now@@caused_by_other_reasons)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has vomiting caused by other reasons with non-exhaustive examples (central nervous system metastases, gastrointestinal obstruction)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_chemotherapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any chemotherapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone any chemotherapy in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone chemotherapy in the past.","meaning":"Boolean indicating whether the patient has undergone any chemotherapy at any time in the past."} ;; "chemotherapy"
(declare-const patient_has_undergone_chemotherapy_inthehistory@@excluding_adjuvant_fluorouracil_or_leucovorin_chemotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone chemotherapy in the past, and the chemotherapy was not adjuvant fluorouracil or leucovorin chemotherapy.","when_to_set_to_false":"Set to false if the patient has only undergone adjuvant fluorouracil or leucovorin chemotherapy in the past, or has not undergone chemotherapy at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone chemotherapy in the past, or the type of chemotherapy is unknown.","meaning":"Boolean indicating whether the patient has undergone chemotherapy in the past, excluding adjuvant fluorouracil or leucovorin chemotherapy."} ;; "chemotherapy other than adjuvant fluorouracil chemotherapy or leucovorin chemotherapy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_chemotherapy_inthehistory@@excluding_adjuvant_fluorouracil_or_leucovorin_chemotherapy
      patient_has_undergone_chemotherapy_inthehistory)
:named REQ1_AUXILIARY0)) ;; "chemotherapy other than adjuvant fluorouracil chemotherapy or leucovorin chemotherapy""

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_chemotherapy_inthehistory@@excluding_adjuvant_fluorouracil_or_leucovorin_chemotherapy)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was exposed previously to any chemotherapy other than adjuvant fluorouracil chemotherapy or leucovorin chemotherapy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_administration_of_antineoplastic_agent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone administration of an antineoplastic agent (chemotherapy) in the past.","when_to_set_to_false":"Set to false if the patient has never undergone administration of an antineoplastic agent (chemotherapy) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone administration of an antineoplastic agent (chemotherapy) in the past.","meaning":"Boolean indicating whether the patient has ever undergone administration of an antineoplastic agent (chemotherapy) in the past."} ;; "chemotherapy"

(declare-const patient_is_exposed_to_anti_emetic_drug_inthehistory@@temporalcontext_within72hours_before_administration_of_antineoplastic_agent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to anti-emetic drugs within seventy-two hours prior to administration of an antineoplastic agent (chemotherapy).","when_to_set_to_false":"Set to false if the patient has not been exposed to anti-emetic drugs within seventy-two hours prior to administration of an antineoplastic agent (chemotherapy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to anti-emetic drugs within seventy-two hours prior to administration of an antineoplastic agent (chemotherapy).","meaning":"Boolean indicating whether the patient has been exposed to anti-emetic drugs within seventy-two hours prior to administration of an antineoplastic agent (chemotherapy)."} ;; "the patient takes anti-emetic drugs within seventy-two hours prior to administration of chemotherapy"

(declare-const patient_is_exposed_to_dopamine_receptor_antagonist_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to dopamine receptor antagonist drugs in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to dopamine receptor antagonist drugs in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to dopamine receptor antagonist drugs in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to dopamine receptor antagonist drugs in the past."} ;; "dopamine antagonist drugs"

(declare-const patient_is_exposed_to_dopamine_receptor_antagonist_inthehistory@@temporalcontext_within72hours_before_administration_of_antineoplastic_agent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to dopamine receptor antagonist drugs within seventy-two hours prior to administration of an antineoplastic agent (chemotherapy).","when_to_set_to_false":"Set to false if the patient has not been exposed to dopamine receptor antagonist drugs within seventy-two hours prior to administration of an antineoplastic agent (chemotherapy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to dopamine receptor antagonist drugs within seventy-two hours prior to administration of an antineoplastic agent (chemotherapy).","meaning":"Boolean indicating whether the patient has been exposed to dopamine receptor antagonist drugs within seventy-two hours prior to administration of an antineoplastic agent (chemotherapy)."} ;; "the patient takes dopamine antagonist drugs within seventy-two hours prior to administration of chemotherapy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_exposed_to_anti_emetic_drug_inthehistory@@temporalcontext_within72hours_before_administration_of_antineoplastic_agent)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient takes anti-emetic drugs within seventy-two hours prior to administration of chemotherapy."

(assert
(! (not patient_is_exposed_to_dopamine_receptor_antagonist_inthehistory@@temporalcontext_within72hours_before_administration_of_antineoplastic_agent)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient takes dopamine antagonist drugs within seventy-two hours prior to administration of chemotherapy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_taking_other_drugs_that_may_affect_serum_level_of_biomarkers_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any other drugs that may affect the serum level of biomarkers, regardless of drug class or specific example.","when_to_set_to_false":"Set to false if the patient is currently not taking any other drugs that may affect the serum level of biomarkers.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any other drugs that may affect the serum level of biomarkers.","meaning":"Boolean indicating whether the patient is currently taking any other drugs that may affect the serum level of biomarkers."} ;; "other drugs that may affect serum level of biomarkers"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_taking_other_drugs_that_may_affect_serum_level_of_biomarkers_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient takes other drugs that may affect serum level of biomarkers with non-exhaustive examples (steroid drugs, megesterol drugs, hormone replacement therapy drugs, parenteral nutrition)."
