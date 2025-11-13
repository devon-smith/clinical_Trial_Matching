;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_pneumonia_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of pneumonia at any time within the previous six months.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of pneumonia within the previous six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of pneumonia within the previous six months.","meaning":"Boolean indicating whether the patient has had a diagnosis of pneumonia within the previous six months."} ;; "has had a diagnosis of pneumonia within the previous six months."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_diagnosis_of_pneumonia_inthepast6months)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a diagnosis of pneumonia within the previous six months."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const antimicrobial_treatment_duration_before_hospitalization_in_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours the patient received antimicrobial treatment before hospitalization.","when_to_set_to_null":"Set to null if the duration of antimicrobial treatment before hospitalization is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the total hours of antimicrobial treatment received before hospitalization."} ;; "has received greater than forty-eight hours of antimicrobial treatment before hospitalization."
(declare-const antimicrobial_treatment_duration_before_hospitalization_in_hours@@received_before_hospitalization Bool) ;; {"when_to_set_to_true":"Set to true if the antimicrobial treatment was received before hospitalization.","when_to_set_to_false":"Set to false if the antimicrobial treatment was not received before hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antimicrobial treatment was received before hospitalization.","meaning":"Boolean indicating whether the antimicrobial treatment was received before hospitalization."} ;; "antimicrobial treatment received before hospitalization"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and
           antimicrobial_treatment_duration_before_hospitalization_in_hours@@received_before_hospitalization
           (> antimicrobial_treatment_duration_before_hospitalization_in_hours 48)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received greater than forty-eight hours of antimicrobial treatment before hospitalization."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_ct_of_chest_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a thoracic computed tomography (CT) scan at any time prior to the present.","when_to_set_to_false":"Set to false if the patient has never undergone a thoracic computed tomography (CT) scan prior to the present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a thoracic computed tomography (CT) scan prior to the present.","meaning":"Boolean indicating whether the patient has ever undergone a thoracic computed tomography (CT) scan at any time in the past."} ;; "thoracic computed tomography scan"
(declare-const patient_has_undergone_ct_of_chest_inthehistory@@temporalcontext_before_hospitalization Bool) ;; {"when_to_set_to_true":"Set to true if the thoracic CT scan was performed before hospitalization.","when_to_set_to_false":"Set to false if the thoracic CT scan was not performed before hospitalization (i.e., performed during or after hospitalization).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the thoracic CT scan was performed before hospitalization.","meaning":"Boolean indicating whether the thoracic CT scan was performed before hospitalization."} ;; "the patient has had a thoracic computed tomography scan performed before hospitalization"
(declare-const patient_has_undergone_ct_of_chest_inthehistory@@temporalcontext_before_inclusion_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the thoracic CT scan was performed before inclusion in the study.","when_to_set_to_false":"Set to false if the thoracic CT scan was not performed before inclusion in the study (i.e., performed during or after inclusion).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the thoracic CT scan was performed before inclusion in the study.","meaning":"Boolean indicating whether the thoracic CT scan was performed before inclusion in the study."} ;; "the patient has had a thoracic computed tomography scan performed before inclusion in the study"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply the patient has ever had a thoracic CT scan
(assert
(! (=> patient_has_undergone_ct_of_chest_inthehistory@@temporalcontext_before_hospitalization
      patient_has_undergone_ct_of_chest_inthehistory)
   :named REQ2_AUXILIARY0)) ;; "thoracic CT scan performed before hospitalization" implies "ever had thoracic CT scan"

(assert
(! (=> patient_has_undergone_ct_of_chest_inthehistory@@temporalcontext_before_inclusion_in_study
      patient_has_undergone_ct_of_chest_inthehistory)
   :named REQ2_AUXILIARY1)) ;; "thoracic CT scan performed before inclusion in study" implies "ever had thoracic CT scan"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_undergone_ct_of_chest_inthehistory@@temporalcontext_before_hospitalization
            patient_has_undergone_ct_of_chest_inthehistory@@temporalcontext_before_inclusion_in_study))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had a thoracic computed tomography scan performed before hospitalization) OR (the patient has had a thoracic computed tomography scan performed before inclusion in the study)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_been_included_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has already been included in the study.","when_to_set_to_false":"Set to false if the patient has not been included in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has already been included in the study.","meaning":"Boolean indicating whether the patient has already been included in the study."} ;; "The patient is excluded if the patient has already been included in the study."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_been_included_in_study)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has already been included in the study."
