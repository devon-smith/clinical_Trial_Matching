;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_previously_enrolled_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously enrolled in this study.","when_to_set_to_false":"Set to false if the patient has not previously enrolled in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously enrolled in this study.","meaning":"Boolean indicating whether the patient has previously enrolled in this study."} ;; "The patient is excluded if the patient has previously enrolled in this study."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_previously_enrolled_in_this_study)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously enrolled in this study."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const patient_is_unable_to_use_birth_control_measures_during_treatment_period_of_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to use birth control measures during the treatment period of this study.","when_to_set_to_false":"Set to false if the patient is able to use birth control measures during the treatment period of this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to use birth control measures during the treatment period of this study.","meaning":"Boolean indicating whether the patient is unable to use birth control measures during the treatment period of this study."} ;; "the patient is unable to use birth control measures during the treatment period of this study"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_lactating_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

(assert
(! (not patient_is_unable_to_use_birth_control_measures_during_treatment_period_of_this_study)
:named REQ1_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to use birth control measures during the treatment period of this study."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_taking_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not taking any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any drug or medicament.","meaning":"Boolean indicating whether the patient is currently taking a drug or medicament."} ;; "medication"
(declare-const patient_is_taking_drug_or_medicament_now@@is_chronic Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament currently being taken by the patient is chronic.","when_to_set_to_false":"Set to false if the drug or medicament currently being taken by the patient is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament currently being taken by the patient is chronic.","meaning":"Boolean indicating whether the drug or medicament currently being taken by the patient is chronic."} ;; "chronic medication"
(declare-const patient_is_taking_drug_or_medicament_now@@could_interfere_with_evaluation_of_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament currently being taken by the patient could interfere with evaluation of symptoms.","when_to_set_to_false":"Set to false if the drug or medicament currently being taken by the patient could not interfere with evaluation of symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament currently being taken by the patient could interfere with evaluation of symptoms.","meaning":"Boolean indicating whether the drug or medicament currently being taken by the patient could interfere with evaluation of symptoms."} ;; "could interfere with evaluation of symptoms"
(declare-const patient_is_taking_drug_or_medicament_now@@is_chronic@@could_interfere_with_evaluation_of_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a chronic drug or medicament that could interfere with evaluation of symptoms.","when_to_set_to_false":"Set to false if the patient is not currently taking a chronic drug or medicament that could interfere with evaluation of symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a chronic drug or medicament that could interfere with evaluation of symptoms.","meaning":"Boolean indicating whether the patient is currently taking a chronic drug or medicament that could interfere with evaluation of symptoms."} ;; "chronic medication that could interfere with evaluation of symptoms"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definitional: The triple-qualifier variable is true iff both qualifiers are true
(assert
(! (= patient_is_taking_drug_or_medicament_now@@is_chronic@@could_interfere_with_evaluation_of_symptoms
(and patient_is_taking_drug_or_medicament_now@@is_chronic
     patient_is_taking_drug_or_medicament_now@@could_interfere_with_evaluation_of_symptoms))
:named REQ2_AUXILIARY0)) ;; "chronic medication that could interfere with evaluation of symptoms"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_taking_drug_or_medicament_now@@is_chronic
       patient_is_taking_drug_or_medicament_now)
:named REQ2_AUXILIARY1)) ;; "chronic medication"

(assert
(! (=> patient_is_taking_drug_or_medicament_now@@could_interfere_with_evaluation_of_symptoms
       patient_is_taking_drug_or_medicament_now)
:named REQ2_AUXILIARY2)) ;; "could interfere with evaluation of symptoms"

(assert
(! (=> patient_is_taking_drug_or_medicament_now@@is_chronic@@could_interfere_with_evaluation_of_symptoms
       patient_is_taking_drug_or_medicament_now)
:named REQ2_AUXILIARY3)) ;; "chronic medication that could interfere with evaluation of symptoms"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_taking_drug_or_medicament_now@@is_chronic@@could_interfere_with_evaluation_of_symptoms)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking chronic medication that could interfere with evaluation of symptoms."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_taken_drug_or_medicament_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any drug or medicament at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken any drug or medicament in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any drug or medicament in the past.","meaning":"Boolean indicating whether the patient has taken any drug or medicament in the past."} ;; "medication"
(declare-const patient_has_taken_drug_or_medicament_inthehistory@@could_interfere_with_evaluation_of_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any drug or medicament in the past and that drug or medicament could interfere with the evaluation of symptoms.","when_to_set_to_false":"Set to false if the patient has taken any drug or medicament in the past but none could interfere with the evaluation of symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any drug or medicament taken in the past could interfere with the evaluation of symptoms.","meaning":"Boolean indicating whether any drug or medicament taken in the past could interfere with the evaluation of symptoms."} ;; "the patient has taken medication that could interfere with the evaluation of symptoms"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_taken_drug_or_medicament_inthehistory@@could_interfere_with_evaluation_of_symptoms
      patient_has_taken_drug_or_medicament_inthehistory)
   :named REQ3_AUXILIARY0)) ;; "has taken medication that could interfere with the evaluation of symptoms"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient is taking or has taken medication that could interfere with the evaluation of symptoms
(assert
(! (not (or patient_is_taking_drug_or_medicament_now@@could_interfere_with_evaluation_of_symptoms
            patient_has_taken_drug_or_medicament_inthehistory@@could_interfere_with_evaluation_of_symptoms))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is taking medication that could interfere with the evaluation of symptoms) OR (the patient has taken medication that could interfere with the evaluation of symptoms)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_allergy_to_ceftriaxone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypersensitivity (allergy) to ceftriaxone.","when_to_set_to_false":"Set to false if the patient currently does not have a hypersensitivity (allergy) to ceftriaxone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypersensitivity (allergy) to ceftriaxone.","meaning":"Boolean indicating whether the patient currently has a hypersensitivity (allergy) to ceftriaxone."} ;; "hypersensitivity to ceftriaxone"
(declare-const patient_has_finding_of_allergy_to_doxycycline_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypersensitivity (allergy) to doxycycline.","when_to_set_to_false":"Set to false if the patient currently does not have a hypersensitivity (allergy) to doxycycline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypersensitivity (allergy) to doxycycline.","meaning":"Boolean indicating whether the patient currently has a hypersensitivity (allergy) to doxycycline."} ;; "hypersensitivity to doxycycline"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_allergy_to_ceftriaxone_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to ceftriaxone."

(assert
(! (not patient_has_finding_of_allergy_to_doxycycline_now)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypersensitivity to doxycycline."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_synovitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of synovitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of synovitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of synovitis.","meaning":"Boolean indicating whether the patient currently has synovitis."} ;; "synovitis"
(declare-const patient_has_finding_of_synovitis_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current synovitis is active.","when_to_set_to_false":"Set to false if the patient's current synovitis is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current synovitis is active.","meaning":"Boolean indicating whether the patient's current synovitis is active."} ;; "active inflammatory synovitis"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_synovitis_now@@active
       patient_has_finding_of_synovitis_now)
   :named REQ5_AUXILIARY0)) ;; "active inflammatory synovitis" implies "synovitis"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_synovitis_now@@active)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active inflammatory synovitis."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_another_disease_that_could_account_for_symptoms_of_acute_lyme_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another disease that could account for the symptoms of acute Lyme disease.","when_to_set_to_false":"Set to false if the patient currently does not have another disease that could account for the symptoms of acute Lyme disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another disease that could account for the symptoms of acute Lyme disease.","meaning":"Boolean indicating whether the patient currently has another disease that could account for the symptoms of acute Lyme disease."} ;; "The patient is excluded if the patient has another disease that could account for symptoms of acute Lyme disease."

(declare-const patient_has_diagnosis_of_acute_lyme_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute Lyme disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute Lyme disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute Lyme disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute Lyme disease."} ;; "acute Lyme disease"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_another_disease_that_could_account_for_symptoms_of_acute_lyme_disease_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another disease that could account for symptoms of acute Lyme disease."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_another_serious_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another infection that is considered serious, distinct from the index infection.","when_to_set_to_false":"Set to false if the patient currently does not have another serious infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another serious infection.","meaning":"Boolean indicating whether the patient currently has another serious infection (distinct from the index infection)."} ;; "the patient has another serious infection"

(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder due to infection (any infection, regardless of activity or seriousness).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder due to infection (any infection, regardless of activity or seriousness)."} ;; "infection"

(declare-const patient_has_diagnosis_of_disorder_due_to_infection_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disorder due to infection and the infection is active.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of a disorder due to infection but the infection is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is active.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disorder due to infection and the infection is active."} ;; "the patient has another active infection"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disorder_due_to_infection_now@@active
       patient_has_diagnosis_of_disorder_due_to_infection_now)
   :named REQ7_AUXILIARY0)) ;; "active infection" implies "infection"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or patient_has_another_serious_infection_now
            patient_has_diagnosis_of_disorder_due_to_infection_now@@active))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has another serious infection) OR (the patient has another active infection)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_can_undergo_medication_administration_intravenous_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to tolerate intravenous administration.","when_to_set_to_false":"Set to false if the patient is currently unable to tolerate intravenous administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently tolerate intravenous administration.","meaning":"Boolean indicating whether the patient can currently tolerate intravenous administration."} ;; "intravenous administration"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_can_undergo_medication_administration_intravenous_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to tolerate intravenous administration."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patients_borrelia_dna_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive test for Borrelia DNA.","when_to_set_to_false":"Set to false if the patient currently does not have a positive test for Borrelia DNA.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive test for Borrelia DNA.","meaning":"Boolean indicating whether the patient currently has a positive test for Borrelia DNA."} ;; "Borrelia DNA"
(declare-const patients_borrelia_dna_is_positive_now@@specimen_is_plasma Bool) ;; {"when_to_set_to_true":"Set to true if the positive Borrelia DNA test was performed on plasma.","when_to_set_to_false":"Set to false if the positive Borrelia DNA test was not performed on plasma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether plasma was the specimen for the Borrelia DNA test.","meaning":"Boolean indicating whether the positive Borrelia DNA test was performed on plasma."} ;; "Borrelia DNA in plasma"
(declare-const patients_borrelia_dna_is_positive_now@@specimen_is_cerebrospinal_fluid Bool) ;; {"when_to_set_to_true":"Set to true if the positive Borrelia DNA test was performed on cerebrospinal fluid.","when_to_set_to_false":"Set to false if the positive Borrelia DNA test was not performed on cerebrospinal fluid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether cerebrospinal fluid was the specimen for the Borrelia DNA test.","meaning":"Boolean indicating whether the positive Borrelia DNA test was performed on cerebrospinal fluid."} ;; "Borrelia DNA in cerebrospinal fluid"
(declare-const patients_borrelia_dna_is_positive_now@@context_is_initial_evaluation_for_study Bool) ;; {"when_to_set_to_true":"Set to true if the positive Borrelia DNA test was performed at the time of initial evaluation for study.","when_to_set_to_false":"Set to false if the positive Borrelia DNA test was not performed at the time of initial evaluation for study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the test was performed at the time of initial evaluation for study.","meaning":"Boolean indicating whether the positive Borrelia DNA test was performed at the time of initial evaluation for study."} ;; "at the time of initial evaluation for study"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patients_borrelia_dna_is_positive_now@@specimen_is_plasma
      patients_borrelia_dna_is_positive_now)
:named REQ9_AUXILIARY0)) ;; "Borrelia DNA in plasma"

(assert
(! (=> patients_borrelia_dna_is_positive_now@@specimen_is_cerebrospinal_fluid
      patients_borrelia_dna_is_positive_now)
:named REQ9_AUXILIARY1)) ;; "Borrelia DNA in cerebrospinal fluid"

(assert
(! (=> patients_borrelia_dna_is_positive_now@@context_is_initial_evaluation_for_study
      patients_borrelia_dna_is_positive_now)
:named REQ9_AUXILIARY2)) ;; "at the time of initial evaluation for study"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient must NOT have tested positive for Borrelia DNA in plasma at the time of initial evaluation for study
(assert
(! (not (and patients_borrelia_dna_is_positive_now@@specimen_is_plasma
             patients_borrelia_dna_is_positive_now@@context_is_initial_evaluation_for_study))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tested positive for Borrelia DNA in plasma at the time of initial evaluation for study."

;; Exclusion: patient must NOT have tested positive for Borrelia DNA in cerebrospinal fluid at the time of initial evaluation for study
(assert
(! (not (and patients_borrelia_dna_is_positive_now@@specimen_is_cerebrospinal_fluid
             patients_borrelia_dna_is_positive_now@@context_is_initial_evaluation_for_study))
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tested positive for Borrelia DNA in cerebrospinal fluid at the time of initial evaluation for study."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_serology_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently seropositive (has a positive serology result).","when_to_set_to_false":"Set to false if the patient is currently not seropositive (does not have a positive serology result).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently seropositive.","meaning":"Boolean indicating whether the patient is currently seropositive."} ;; "seropositive"
(declare-const patient_has_finding_of_serology_positive_now@@determined_by_western_blot_assay Bool) ;; {"when_to_set_to_true":"Set to true if the patient's seropositive status is determined by Western Blot assay.","when_to_set_to_false":"Set to false if the patient's seropositive status is not determined by Western Blot assay.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's seropositive status is determined by Western Blot assay.","meaning":"Boolean indicating whether the patient's seropositive status is determined by Western Blot assay."} ;; "seropositive by Western Blot assay"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_serology_positive_now@@determined_by_western_blot_assay
       patient_has_finding_of_serology_positive_now)
   :named REQ10_AUXILIARY0)) ;; "seropositive by Western Blot assay" implies "seropositive"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_serology_positive_now@@determined_by_western_blot_assay)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tested seropositive by Western Blot assay."
