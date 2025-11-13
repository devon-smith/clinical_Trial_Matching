;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} ;; "infection"

(declare-const patient_has_finding_of_disorder_due_to_infection_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection and the infection is active.","when_to_set_to_false":"Set to false if the patient currently has a disorder due to infection but the infection is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is active.","meaning":"Boolean indicating whether the patient's current infection is active."} ;; "active infection"

(declare-const patient_has_finding_of_disorder_due_to_infection_now@@systemic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection and the infection is systemic.","when_to_set_to_false":"Set to false if the patient currently has a disorder due to infection but the infection is not systemic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is systemic.","meaning":"Boolean indicating whether the patient's current infection is systemic."} ;; "systemic infection"

(declare-const patient_has_finding_of_disorder_due_to_infection_now@@pulmonary Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection and the infection is pulmonary.","when_to_set_to_false":"Set to false if the patient currently has a disorder due to infection but the infection is not pulmonary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is pulmonary.","meaning":"Boolean indicating whether the patient's current infection is pulmonary."} ;; "pulmonary infection"

(declare-const patient_has_finding_of_disorder_due_to_infection_now@@pericardial Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection and the infection is pericardial.","when_to_set_to_false":"Set to false if the patient currently has a disorder due to infection but the infection is not pericardial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is pericardial.","meaning":"Boolean indicating whether the patient's current infection is pericardial."} ;; "pericardial infection"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@active
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ0_AUXILIARY0)) ;; "active infection"

(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@systemic
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ0_AUXILIARY1)) ;; "systemic infection"

(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@pulmonary
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ0_AUXILIARY2)) ;; "pulmonary infection"

(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@pericardial
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ0_AUXILIARY3)) ;; "pericardial infection"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_disorder_due_to_infection_now@@active)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an active systemic infection."

(assert
(! (not patient_has_finding_of_disorder_due_to_infection_now@@pulmonary)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an active pulmonary infection."

(assert
(! (not patient_has_finding_of_disorder_due_to_infection_now@@pericardial)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an active pericardial infection."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_receiving_systemic_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving systemic therapy, which includes chemotherapy or immunotherapy or biological therapy, but excludes hormone therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving systemic therapy, or is only receiving hormone therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving systemic therapy.","meaning":"Boolean indicating whether the patient is currently receiving systemic therapy (chemotherapy or immunotherapy or biological therapy, but not hormone therapy)."} ;; "receiving concurrent systemic therapy (receiving chemotherapy or receiving immunotherapy or receiving biological therapy), apart from receiving hormone therapy."
(declare-const patient_is_receiving_systemic_therapy_now@@concurrent Bool) ;; {"when_to_set_to_true":"Set to true if the systemic therapy is concurrent with other therapies.","when_to_set_to_false":"Set to false if the systemic therapy is not concurrent with other therapies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the systemic therapy is concurrent.","meaning":"Boolean indicating whether the systemic therapy is concurrent with other therapies."} ;; "concurrent systemic therapy"
(declare-const patient_is_undergoing_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving chemotherapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving chemotherapy.","meaning":"Boolean indicating whether the patient is currently undergoing chemotherapy."} ;; "receiving chemotherapy"
(declare-const patient_is_undergoing_immunological_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving immunological therapy (immunotherapy).","when_to_set_to_false":"Set to false if the patient is currently not receiving immunological therapy (immunotherapy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving immunological therapy (immunotherapy).","meaning":"Boolean indicating whether the patient is currently undergoing immunological therapy."} ;; "receiving immunotherapy"
(declare-const patient_is_undergoing_biological_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving biological therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving biological therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving biological therapy.","meaning":"Boolean indicating whether the patient is currently undergoing biological treatment."} ;; "receiving biological therapy"
(declare-const patient_is_undergoing_biological_treatment_now@@concurrent Bool) ;; {"when_to_set_to_true":"Set to true if the biological therapy is concurrent with other therapies.","when_to_set_to_false":"Set to false if the biological therapy is not concurrent with other therapies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biological therapy is concurrent.","meaning":"Boolean indicating whether the biological therapy is concurrent with other therapies."} ;; "biological therapy is concurrent"
(declare-const patient_is_undergoing_biological_treatment_now@@systemic Bool) ;; {"when_to_set_to_true":"Set to true if the biological therapy is systemic.","when_to_set_to_false":"Set to false if the biological therapy is not systemic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biological therapy is systemic.","meaning":"Boolean indicating whether the biological therapy is systemic."} ;; "biological therapy is systemic"
(declare-const patient_is_undergoing_hormone_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving hormone therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving hormone therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving hormone therapy.","meaning":"Boolean indicating whether the patient is currently undergoing hormone therapy."} ;; "receiving hormone therapy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: systemic therapy = chemotherapy OR immunotherapy OR biological therapy, but NOT hormone therapy
(assert
(! (= patient_is_receiving_systemic_therapy_now
(and (or patient_is_undergoing_chemotherapy_now
         patient_is_undergoing_immunological_therapy_now
         patient_is_undergoing_biological_treatment_now)
     (not patient_is_undergoing_hormone_therapy_now)))
:named REQ1_AUXILIARY0)) ;; "receiving concurrent systemic therapy (receiving chemotherapy or receiving immunotherapy or receiving biological therapy), apart from receiving hormone therapy."

;; Qualifier variable: concurrent systemic therapy implies systemic therapy
(assert
(! (=> patient_is_receiving_systemic_therapy_now@@concurrent
       patient_is_receiving_systemic_therapy_now)
:named REQ1_AUXILIARY1)) ;; "concurrent systemic therapy"

;; Qualifier variable: concurrent biological therapy implies biological therapy
(assert
(! (=> patient_is_undergoing_biological_treatment_now@@concurrent
       patient_is_undergoing_biological_treatment_now)
:named REQ1_AUXILIARY2)) ;; "biological therapy is concurrent"

;; Qualifier variable: systemic biological therapy implies biological therapy
(assert
(! (=> patient_is_undergoing_biological_treatment_now@@systemic
       patient_is_undergoing_biological_treatment_now)
:named REQ1_AUXILIARY3)) ;; "biological therapy is systemic"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT be receiving concurrent systemic therapy
(assert
(! (not patient_is_receiving_systemic_therapy_now@@concurrent)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient is receiving concurrent systemic therapy (receiving chemotherapy or receiving immunotherapy or receiving biological therapy), apart from receiving hormone therapy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_autoimmune_disease_inthehistory@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with an autoimmune disease that was active at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with an autoimmune disease that was active at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with an active autoimmune disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of autoimmune disease that was active at any time in the past."} ;; "history of active autoimmune disease"

(declare-const patient_has_diagnosis_of_lupus_erythematosus_inthehistory@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lupus erythematosus diagnosis was active at any time.","when_to_set_to_false":"Set to false if the patient's lupus erythematosus diagnosis was never active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lupus erythematosus was active.","meaning":"Boolean indicating whether the patient's lupus erythematosus diagnosis was active."} ;; "history of active systemic lupus erythematosus"

(declare-const patient_has_diagnosis_of_lupus_erythematosus_inthehistory@@systemic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lupus erythematosus diagnosis was systemic.","when_to_set_to_false":"Set to false if the patient's lupus erythematosus diagnosis was not systemic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lupus erythematosus was systemic.","meaning":"Boolean indicating whether the patient's lupus erythematosus diagnosis was systemic."} ;; "systemic lupus erythematosus"

(declare-const patient_has_diagnosis_of_arthritis_inthehistory@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's arthritis diagnosis was active at any time.","when_to_set_to_false":"Set to false if the patient's arthritis diagnosis was never active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the arthritis was active.","meaning":"Boolean indicating whether the patient's arthritis diagnosis was active."} ;; "history of active rheumatoid arthritis"

(declare-const patient_has_diagnosis_of_calcinosis_inthehistory@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's calcinosis diagnosis was active at any time.","when_to_set_to_false":"Set to false if the patient's calcinosis diagnosis was never active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the calcinosis was active.","meaning":"Boolean indicating whether the patient's calcinosis diagnosis was active."} ;; "history of active calcinosis"

(declare-const patient_has_diagnosis_of_raynaud_s_phenomenon_inthehistory@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's Raynaud's phenomenon diagnosis was active at any time.","when_to_set_to_false":"Set to false if the patient's Raynaud's phenomenon diagnosis was never active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Raynaud's phenomenon was active.","meaning":"Boolean indicating whether the patient's Raynaud's phenomenon diagnosis was active."} ;; "history of active Raynaud's phenomenon"

(declare-const patient_has_diagnosis_of_esophageal_dysmotility_inthehistory@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's esophageal dysmotility diagnosis was active at any time.","when_to_set_to_false":"Set to false if the patient's esophageal dysmotility diagnosis was never active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the esophageal dysmotility was active.","meaning":"Boolean indicating whether the patient's esophageal dysmotility diagnosis was active."} ;; "history of active esophageal dysmotility"

(declare-const patient_has_diagnosis_of_sclerodactyly_inthehistory@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sclerodactyly diagnosis was active at any time.","when_to_set_to_false":"Set to false if the patient's sclerodactyly diagnosis was never active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sclerodactyly was active.","meaning":"Boolean indicating whether the patient's sclerodactyly diagnosis was active."} ;; "history of active sclerodactyly"

(declare-const patient_has_diagnosis_of_telangiectasia_disorder_inthehistory@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's telangiectasia disorder diagnosis was active at any time.","when_to_set_to_false":"Set to false if the patient's telangiectasia disorder diagnosis was never active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the telangiectasia disorder was active.","meaning":"Boolean indicating whether the patient's telangiectasia disorder diagnosis was active."} ;; "history of active telangiectasia syndrome"

(declare-const patient_has_diagnosis_of_systemic_sclerosis_inthehistory@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with systemic sclerosis that was active at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with systemic sclerosis that was active at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with active systemic sclerosis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of systemic sclerosis that was active at any time in the past."} ;; "history of active systemic sclerosis"

(declare-const patient_has_diagnosis_of_scleroderma_inthehistory@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with scleroderma that was active at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with scleroderma that was active at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with active scleroderma.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of scleroderma that was active at any time in the past."} ;; "history of active scleroderma"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or
        patient_has_diagnosis_of_lupus_erythematosus_inthehistory@@active
        patient_has_diagnosis_of_arthritis_inthehistory@@active
        (and patient_has_diagnosis_of_calcinosis_inthehistory@@active
             patient_has_diagnosis_of_raynaud_s_phenomenon_inthehistory@@active
             patient_has_diagnosis_of_esophageal_dysmotility_inthehistory@@active
             patient_has_diagnosis_of_sclerodactyly_inthehistory@@active
             patient_has_diagnosis_of_telangiectasia_disorder_inthehistory@@active)
        patient_has_diagnosis_of_systemic_sclerosis_inthehistory@@active
        patient_has_diagnosis_of_scleroderma_inthehistory@@active)
    patient_has_diagnosis_of_autoimmune_disease_inthehistory@@active)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples ((a history of active systemic lupus erythematosus) OR (a history of active rheumatoid arthritis) OR (a history of active calcinosis, Raynaud's phenomenon, esophageal dysmotility, sclerodactyly, and telangiectasia syndrome) OR (a history of active systemic sclerosis) OR (a history of active scleroderma))"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_autoimmune_disease_inthehistory@@active)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of active autoimmune disease with non-exhaustive examples..."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_can_undergo_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a potential candidate to undergo chemotherapy.","when_to_set_to_false":"Set to false if the patient is currently not a potential candidate to undergo chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a potential candidate to undergo chemotherapy.","meaning":"Boolean indicating whether the patient is currently a potential candidate to undergo chemotherapy."} ;; "chemotherapy"
(declare-const patient_can_undergo_concurrent_chemotherapy_and_radiation_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a potential candidate to undergo concurrent chemotherapy and radiation therapy (both therapies given together).","when_to_set_to_false":"Set to false if the patient is currently not a potential candidate to undergo concurrent chemotherapy and radiation therapy (both therapies given together).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a potential candidate to undergo concurrent chemotherapy and radiation therapy (both therapies given together).","meaning":"Boolean indicating whether the patient is currently a potential candidate to undergo concurrent chemotherapy and radiation therapy (both therapies given together)."} ;; "potential candidate for concurrent chemotherapy and radiation therapy (i.e., both therapies given together)"
(declare-const patient_can_undergo_radiation_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a potential candidate to undergo radiation therapy.","when_to_set_to_false":"Set to false if the patient is currently not a potential candidate to undergo radiation therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a potential candidate to undergo radiation therapy.","meaning":"Boolean indicating whether the patient is currently a potential candidate to undergo radiation therapy."} ;; "radiation therapy"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_can_undergo_concurrent_chemotherapy_and_radiation_therapy_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a potential candidate for concurrent chemotherapy and radiation therapy (i.e., both therapies given together)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_enrolled_on_other_studies_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled on any other studies.","when_to_set_to_false":"Set to false if the patient is not currently enrolled on any other studies.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled on other studies.","meaning":"Boolean indicating whether the patient is currently enrolled on other studies."} ;; "the patient is enrolled on other studies"
(declare-const patient_is_enrolled_on_other_studies_now@@depending_on_patient_characteristics_and_study_characteristics Bool) ;; {"when_to_set_to_true":"Set to true if the relevance of the patient's enrollment on other studies for exclusion depends on both patient characteristics and study characteristics.","when_to_set_to_false":"Set to false if the relevance does not depend on both patient characteristics and study characteristics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the relevance depends on both patient characteristics and study characteristics.","meaning":"Boolean indicating whether the exclusion based on enrollment on other studies depends on both patient characteristics and study characteristics."} ;; "depending on patient characteristics AND study characteristics"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_enrolled_on_other_studies_now@@depending_on_patient_characteristics_and_study_characteristics
      patient_is_enrolled_on_other_studies_now)
:named REQ4_AUXILIARY0)) ;; "depending on patient characteristics AND study characteristics"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT be enrolled on other studies, when exclusion depends on patient characteristics AND study characteristics
(assert
(! (not patient_is_enrolled_on_other_studies_now@@depending_on_patient_characteristics_and_study_characteristics)
:named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient may be excluded if the patient is enrolled on other studies, depending on patient characteristics AND study characteristics."
