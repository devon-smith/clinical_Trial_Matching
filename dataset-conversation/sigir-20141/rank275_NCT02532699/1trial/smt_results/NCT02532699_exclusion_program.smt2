;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a disorder of the cardiovascular system at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a disorder of the cardiovascular system at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a disorder of the cardiovascular system.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of a disorder of the cardiovascular system in their history."} ;; "history of major cardiovascular disease"
(declare-const patient_has_diagnosis_of_decreased_liver_function_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with decreased liver function at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with decreased liver function at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with decreased liver function.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of decreased liver function in their history."} ;; "history of severe liver dysfunction"
(declare-const patient_has_diagnosis_of_type_1_diabetes_mellitus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with type 1 diabetes mellitus at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with type 1 diabetes mellitus at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with type 1 diabetes mellitus.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of type 1 diabetes mellitus in their history."} ;; "history of insulin-dependent diabetes mellitus"
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cerebrovascular accident at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cerebrovascular accident at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cerebrovascular accident.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of cerebrovascular accident in their history."} ;; "history of stroke"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_cardiovascular_system_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of major cardiovascular disease."

(assert
(! (not patient_has_diagnosis_of_decreased_liver_function_inthehistory)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of severe liver dysfunction."

(assert
(! (not patient_has_diagnosis_of_type_1_diabetes_mellitus_inthehistory)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of insulin-dependent diabetes mellitus."

(assert
(! (not patient_has_diagnosis_of_cerebrovascular_accident_inthehistory)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of stroke."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_routinely_consumes_alcohol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently routinely consumes alcohol.","when_to_set_to_false":"Set to false if the patient currently does not routinely consume alcohol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently routinely consumes alcohol.","meaning":"Boolean indicating whether the patient currently routinely consumes alcohol."} ;; "the patient routinely consumes alcohol"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_unable_to_comprehend_study_instructions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to comprehend study instructions.","when_to_set_to_false":"Set to false if the patient is currently able to comprehend study instructions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to comprehend study instructions.","meaning":"Boolean indicating whether the patient is currently unable to comprehend study instructions."} ;; "the patient is unable to comprehend study instructions"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT satisfy any of the exclusion criteria (routinely consumes alcohol, is pregnant, or unable to comprehend study instructions)
(assert
(! (not (or patient_routinely_consumes_alcohol_now
            patient_is_pregnant_now
            patient_is_unable_to_comprehend_study_instructions_now))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient routinely consumes alcohol) OR (the patient is pregnant) OR (the patient is unable to comprehend study instructions)."
