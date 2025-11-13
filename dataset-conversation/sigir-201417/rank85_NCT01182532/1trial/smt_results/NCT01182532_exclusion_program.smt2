;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease.","when_to_set_to_false":"Set to false if the patient currently does not have any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease.","meaning":"Boolean indicating whether the patient currently has any disease."} ;; "other serious primary diseases in organs"
(declare-const patient_has_finding_of_disease_now@@is_serious Bool) ;; {"when_to_set_to_true":"Set to true if the disease present is serious.","when_to_set_to_false":"Set to false if the disease present is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease present is serious.","meaning":"Boolean indicating whether the disease present is serious."} ;; "serious"
(declare-const patient_has_finding_of_disease_now@@is_primary Bool) ;; {"when_to_set_to_true":"Set to true if the disease present is primary.","when_to_set_to_false":"Set to false if the disease present is not primary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease present is primary.","meaning":"Boolean indicating whether the disease present is primary."} ;; "primary"
(declare-const patient_has_finding_of_disease_now@@located_in_organs Bool) ;; {"when_to_set_to_true":"Set to true if the disease present is located in organs.","when_to_set_to_false":"Set to false if the disease present is not located in organs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease present is located in organs.","meaning":"Boolean indicating whether the disease present is located in organs."} ;; "in organs"
(declare-const patient_has_finding_of_congenital_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congenital heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have congenital heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congenital heart disease.","meaning":"Boolean indicating whether the patient currently has congenital heart disease."} ;; "congenital heart disease"
(declare-const patient_has_finding_of_chronic_hepatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic hepatitis.","when_to_set_to_false":"Set to false if the patient currently does not have chronic hepatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic hepatitis.","meaning":"Boolean indicating whether the patient currently has chronic hepatitis."} ;; "chronic hepatitis"
(declare-const patient_has_finding_of_nephritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has nephritis.","when_to_set_to_false":"Set to false if the patient currently does not have nephritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has nephritis.","meaning":"Boolean indicating whether the patient currently has nephritis."} ;; "chronic nephritis"
(declare-const patient_has_finding_of_nephritis_now@@is_chronic Bool) ;; {"when_to_set_to_true":"Set to true if the nephritis present is chronic.","when_to_set_to_false":"Set to false if the nephritis present is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the nephritis present is chronic.","meaning":"Boolean indicating whether the nephritis present is chronic."} ;; "chronic nephritis"
(declare-const patient_has_finding_of_blood_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood disease.","when_to_set_to_false":"Set to false if the patient currently does not have a blood disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a blood disease.","meaning":"Boolean indicating whether the patient currently has a blood disease."} ;; "blood diseases"
(declare-const patient_has_finding_of_blood_disease_now@@is_primary Bool) ;; {"when_to_set_to_true":"Set to true if the blood disease present is primary.","when_to_set_to_false":"Set to false if the blood disease present is not primary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the blood disease present is primary.","meaning":"Boolean indicating whether the blood disease present is primary."} ;; "primary blood disease"
(declare-const patient_has_finding_of_blood_disease_now@@is_serious Bool) ;; {"when_to_set_to_true":"Set to true if the blood disease present is serious.","when_to_set_to_false":"Set to false if the blood disease present is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the blood disease present is serious.","meaning":"Boolean indicating whether the blood disease present is serious."} ;; "serious blood disease"
(declare-const patient_has_finding_of_blood_disease_now@@located_in_organs Bool) ;; {"when_to_set_to_true":"Set to true if the blood disease present is located in organs.","when_to_set_to_false":"Set to false if the blood disease present is not located in organs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the blood disease present is located in organs.","meaning":"Boolean indicating whether the blood disease present is located in organs."} ;; "blood disease in organs"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_congenital_heart_disease_now
           patient_has_finding_of_chronic_hepatitis_now
           (and patient_has_finding_of_nephritis_now patient_has_finding_of_nephritis_now@@is_chronic)
           patient_has_finding_of_blood_disease_now)
     (and patient_has_finding_of_disease_now@@is_serious
          patient_has_finding_of_disease_now@@is_primary
          patient_has_finding_of_disease_now@@located_in_organs))
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples ((congenital heart disease) OR (chronic hepatitis) OR (chronic nephritis) OR (blood diseases))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disease_now@@is_serious
       patient_has_finding_of_disease_now)
:named REQ0_AUXILIARY1)) ;; "serious"

(assert
(! (=> patient_has_finding_of_disease_now@@is_primary
       patient_has_finding_of_disease_now)
:named REQ0_AUXILIARY2)) ;; "primary"

(assert
(! (=> patient_has_finding_of_disease_now@@located_in_organs
       patient_has_finding_of_disease_now)
:named REQ0_AUXILIARY3)) ;; "in organs"

(assert
(! (=> patient_has_finding_of_blood_disease_now@@is_primary
       patient_has_finding_of_blood_disease_now)
:named REQ0_AUXILIARY4)) ;; "primary blood disease"

(assert
(! (=> patient_has_finding_of_blood_disease_now@@is_serious
       patient_has_finding_of_blood_disease_now)
:named REQ0_AUXILIARY5)) ;; "serious blood disease"

(assert
(! (=> patient_has_finding_of_blood_disease_now@@located_in_organs
       patient_has_finding_of_blood_disease_now)
:named REQ0_AUXILIARY6)) ;; "blood disease in organs"

(assert
(! (=> patient_has_finding_of_nephritis_now@@is_chronic
       patient_has_finding_of_nephritis_now)
:named REQ0_AUXILIARY7)) ;; "chronic nephritis"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_has_finding_of_disease_now@@is_serious
             patient_has_finding_of_disease_now@@is_primary
             patient_has_finding_of_disease_now@@located_in_organs))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is complicated with other serious primary diseases in organs with non-exhaustive examples ((congenital heart disease) OR (chronic hepatitis) OR (chronic nephritis) OR (blood diseases))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_history_of_allergy_to_traditional_chinese_medicine Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of allergy to traditional Chinese medicine.","when_to_set_to_false":"Set to false if the patient does not have a documented history of allergy to traditional Chinese medicine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergy to traditional Chinese medicine.","meaning":"Boolean indicating whether the patient has a history of allergy to traditional Chinese medicine."} ;; "has a history of allergies to traditional Chinese medicine"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_history_of_allergy_to_traditional_chinese_medicine)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergies to traditional Chinese medicine."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suffering from a mental disorder.","when_to_set_to_false":"Set to false if the patient is currently not suffering from a mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently suffering from a mental disorder.","meaning":"Boolean indicating whether the patient is currently suffering from a mental disorder."} ;; "the patient is suffering from psychiatric diseases"
(declare-const guardian_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's guardian is currently suffering from a mental disorder.","when_to_set_to_false":"Set to false if the patient's guardian is currently not suffering from a mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's guardian is currently suffering from a mental disorder.","meaning":"Boolean indicating whether the patient's guardian is currently suffering from a mental disorder."} ;; "the patient's guardian is suffering from psychiatric diseases"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_finding_of_mental_disorder_now
            guardian_has_finding_of_mental_disorder_now))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is suffering from psychiatric diseases) OR (the patient's guardian is suffering from psychiatric diseases)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_enteroviral_vesicular_stomatitis_with_exanthem_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with hand, foot, and mouth disease (enteroviral vesicular stomatitis with exanthem) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with hand, foot, and mouth disease (enteroviral vesicular stomatitis with exanthem) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with hand, foot, and mouth disease (enteroviral vesicular stomatitis with exanthem).","meaning":"Boolean indicating whether the patient has ever been diagnosed with hand, foot, and mouth disease (enteroviral vesicular stomatitis with exanthem) at any time in the past."} ;; "hand, foot, and mouth disease after being diagnosed"

(declare-const patient_is_attending_clinical_study_on_enteroviral_vesicular_stomatitis_with_exanthem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently attending a clinical study on hand, foot, and mouth disease (enteroviral vesicular stomatitis with exanthem).","when_to_set_to_false":"Set to false if the patient is currently not attending a clinical study on hand, foot, and mouth disease (enteroviral vesicular stomatitis with exanthem).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently attending a clinical study on hand, foot, and mouth disease (enteroviral vesicular stomatitis with exanthem).","meaning":"Boolean indicating whether the patient is currently attending a clinical study on hand, foot, and mouth disease (enteroviral vesicular stomatitis with exanthem)."} ;; "attending other clinical studies on hand, foot, and mouth disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (and patient_has_diagnosis_of_enteroviral_vesicular_stomatitis_with_exanthem_inthehistory
             patient_is_attending_clinical_study_on_enteroviral_vesicular_stomatitis_with_exanthem_now))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is attending other clinical studies on hand, foot, and mouth disease after being diagnosed with hand, foot, and mouth disease."
