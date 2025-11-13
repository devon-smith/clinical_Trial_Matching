;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic disease.","meaning":"Boolean indicating whether the patient currently has a chronic disease."} ;; "chronic illness"
(declare-const patient_has_finding_of_chronic_disease_now@@not_atopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic disease is not atopy.","when_to_set_to_false":"Set to false if the patient's chronic disease is atopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic disease is atopy.","meaning":"Boolean indicating whether the patient's chronic disease is not atopy."} ;; "the chronic illness is NOT atopy"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_chronic_disease_now@@not_atopy
       patient_has_finding_of_chronic_disease_now)
   :named REQ0_AUXILIARY0)) ;; "the chronic illness is NOT atopy" implies "the patient has a chronic illness"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_chronic_disease_now@@not_atopy)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a chronic illness) AND (the chronic illness is NOT atopy)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_systemic_corticosteroid_treatment_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone systemic corticosteroid treatment at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone systemic corticosteroid treatment at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone systemic corticosteroid treatment in their medical history.","meaning":"Boolean indicating whether the patient has ever undergone systemic corticosteroid treatment at any time in their medical history."} ;; "previous systemic corticosteroid treatment"
(declare-const patient_has_undergone_inhaled_steroid_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone inhaled corticosteroid therapy at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone inhaled corticosteroid therapy at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone inhaled corticosteroid therapy.","meaning":"Boolean indicating whether the patient has ever undergone inhaled corticosteroid therapy at any time in their medical history."} ;; "previous inhaled corticosteroid treatment"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (or patient_has_undergone_systemic_corticosteroid_treatment_inthehistory
              patient_has_undergone_inhaled_steroid_therapy_inthehistory))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had previous systemic corticosteroid treatment) OR (the patient has had previous inhaled corticosteroid treatment)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_participating_in_another_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in another study.","when_to_set_to_false":"Set to false if the patient is currently not participating in another study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in another study.","meaning":"Boolean indicating whether the patient is currently participating in another study."} ;; "The patient is excluded if the patient is participating in another study."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_participating_in_another_study_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is participating in another study."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_varicella_immune_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently immune to varicella.","when_to_set_to_false":"Set to false if the patient is currently not immune to varicella.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently immune to varicella.","meaning":"Boolean indicating whether the patient is currently immune to varicella."} ;; "immune to varicella"
(declare-const patient_has_finding_of_varicella_infection_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been previously infected with varicella at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been previously infected with varicella at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been previously infected with varicella.","meaning":"Boolean indicating whether the patient has ever been previously infected with varicella in their history."} ;; "previously infected with varicella"
(declare-const patient_has_finding_of_varicella_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had contact with varicella at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had contact with varicella at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had contact with varicella.","meaning":"Boolean indicating whether the patient has ever had contact with varicella in their history."} ;; "varicella contact"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: previously intact = NOT previously infected with varicella AND NOT immune to varicella
(declare-const patient_is_previously_intact Bool) ;; {"when_to_set_to_true":"Set to true if the patient has NOT ever been previously infected with varicella AND is NOT currently immune to varicella.","when_to_set_to_false":"Set to false if the patient has ever been previously infected with varicella OR is currently immune to varicella.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been previously infected with varicella or is currently immune to varicella.","meaning":"Boolean indicating whether the patient is previously intact (i.e., not previously infected with varicella AND not immune to varicella)."} ;; "previously intact (defined as NOT previously infected with varicella AND NOT immune to varicella)"

(assert
(! (= patient_is_previously_intact
     (and (not patient_has_finding_of_varicella_infection_in_the_history)
          (not patient_has_finding_of_varicella_immune_now)))
:named REQ3_AUXILIARY0)) ;; "previously intact (defined as NOT previously infected with varicella AND NOT immune to varicella)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (and patient_has_finding_of_varicella_inthehistory
             patient_is_previously_intact))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had contact with varicella) AND (the patient is previously intact (defined as NOT previously infected with varicella AND NOT immune to varicella))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_needs_intensive_care_unit_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently needs intensive care unit treatment.","when_to_set_to_false":"Set to false if the patient currently does not need intensive care unit treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently needs intensive care unit treatment.","meaning":"Boolean indicating whether the patient currently needs intensive care unit treatment."} ;; "The patient is excluded if the patient needs intensive care unit treatment."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_needs_intensive_care_unit_treatment_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs intensive care unit treatment."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_poor_understanding_of_finnish_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poor understanding of Finnish.","when_to_set_to_false":"Set to false if the patient currently does not have poor understanding of Finnish.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor understanding of Finnish.","meaning":"Boolean indicating whether the patient currently has poor understanding of Finnish."} ;; "The patient is excluded if the patient has poor understanding of Finnish."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_poor_understanding_of_finnish_now)
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has poor understanding of Finnish."
