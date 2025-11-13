;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_esophageal_fistula_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of esophageal fistula.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of esophageal fistula.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of esophageal fistula.","meaning":"Boolean indicating whether the patient currently has esophageal fistula."} ;; "esophageal fistula"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_esophageal_fistula_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has esophageal fistula."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_obstruction_of_trachea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of tracheal compression (obstruction of trachea).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of tracheal compression (obstruction of trachea).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tracheal compression (obstruction of trachea).","meaning":"Boolean indicating whether the patient currently has tracheal compression (obstruction of trachea)."} ;; "tracheal compression"
(declare-const patient_has_finding_of_obstruction_of_trachea_now@@with_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tracheal compression (obstruction of trachea) and this finding is accompanied by symptoms.","when_to_set_to_false":"Set to false if the patient currently has tracheal compression (obstruction of trachea) but no symptoms are present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether symptoms are present with tracheal compression (obstruction of trachea).","meaning":"Boolean indicating whether the patient currently has tracheal compression (obstruction of trachea) with symptoms present."} ;; "tracheal compression with symptoms"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_obstruction_of_trachea_now@@with_symptoms
      patient_has_finding_of_obstruction_of_trachea_now)
:named REQ1_AUXILIARY0)) ;; "tracheal compression with symptoms" implies "tracheal compression"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_obstruction_of_trachea_now@@with_symptoms)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tracheal compression with symptoms."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_white_blood_cell_count_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's white blood cell count is recorded now in number per cubic millimeter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current white blood cell count (per cubic millimeter)."} ;; "white blood cell count < 2000 per cubic millimeter"
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's platelet count is recorded now in number per cubic millimeter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current platelet count (per cubic millimeter)."} ;; "platelet count < 50,000 per cubic millimeter"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and
           (< patient_white_blood_cell_count_value_recorded_now_withunit_per_cubic_millimeter 2000) ;; "white blood cell count < 2000 per cubic millimeter"
           (< patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter 50000) ;; "platelet count < 50,000 per cubic millimeter"
        ))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a white blood cell count < 2000 per cubic millimeter) AND (the patient has a platelet count < 50,000 per cubic millimeter)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_undergoing_chemotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing chemotherapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing chemotherapy.","meaning":"Boolean indicating whether the patient is currently undergoing chemotherapy."} ;; "chemotherapy"
(declare-const patient_is_undergoing_chemotherapy_now@@temporalcontext_after_stenting Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing chemotherapy and this occurs after stenting.","when_to_set_to_false":"Set to false if the patient is currently undergoing chemotherapy but not after stenting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy occurs after stenting.","meaning":"Boolean indicating whether the patient is currently undergoing chemotherapy after stenting."} ;; "chemotherapy after stenting"
(declare-const patient_is_undergoing_chemotherapy_now@@concurrent_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing chemotherapy as concurrent therapy after stenting.","when_to_set_to_false":"Set to false if the patient is currently undergoing chemotherapy but not as concurrent therapy after stenting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy is concurrent therapy after stenting.","meaning":"Boolean indicating whether the patient is currently undergoing chemotherapy as concurrent therapy after stenting."} ;; "concurrent chemotherapy after stenting"

(declare-const patient_is_undergoing_radiotherapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing radiotherapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing radiotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing radiotherapy.","meaning":"Boolean indicating whether the patient is currently undergoing radiotherapy."} ;; "radiotherapy"
(declare-const patient_is_undergoing_radiotherapy_now@@temporalcontext_after_stenting Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing radiotherapy and this occurs after stenting.","when_to_set_to_false":"Set to false if the patient is currently undergoing radiotherapy but not after stenting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the radiotherapy occurs after stenting.","meaning":"Boolean indicating whether the patient is currently undergoing radiotherapy after stenting."} ;; "radiotherapy after stenting"
(declare-const patient_is_undergoing_radiotherapy_now@@concurrent_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing radiotherapy as concurrent therapy after stenting.","when_to_set_to_false":"Set to false if the patient is currently undergoing radiotherapy but not as concurrent therapy after stenting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the radiotherapy is concurrent therapy after stenting.","meaning":"Boolean indicating whether the patient is currently undergoing radiotherapy as concurrent therapy after stenting."} ;; "concurrent radiotherapy after stenting"

(declare-const patient_is_undergoing_surgical_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a surgical procedure.","when_to_set_to_false":"Set to false if the patient is not currently undergoing a surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a surgical procedure.","meaning":"Boolean indicating whether the patient is currently undergoing a surgical procedure."} ;; "surgery"
(declare-const patient_is_undergoing_surgical_procedure_now@@temporalcontext_after_stenting Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a surgical procedure and this occurs after stenting.","when_to_set_to_false":"Set to false if the patient is currently undergoing a surgical procedure but not after stenting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure occurs after stenting.","meaning":"Boolean indicating whether the patient is currently undergoing a surgical procedure after stenting."} ;; "surgery after stenting"
(declare-const patient_is_undergoing_surgical_procedure_now@@concurrent_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a surgical procedure as concurrent therapy after stenting.","when_to_set_to_false":"Set to false if the patient is currently undergoing a surgical procedure but not as concurrent therapy after stenting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure is concurrent therapy after stenting.","meaning":"Boolean indicating whether the patient is currently undergoing a surgical procedure as concurrent therapy after stenting."} ;; "concurrent surgery after stenting"

(declare-const patient_is_undergoing_traditional_chinese_medicine_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing traditional Chinese medicine therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing traditional Chinese medicine therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing traditional Chinese medicine therapy.","meaning":"Boolean indicating whether the patient is currently undergoing traditional Chinese medicine therapy."} ;; "traditional Chinese medicine therapy"
(declare-const patient_is_undergoing_traditional_chinese_medicine_therapy_now@@temporalcontext_after_stenting Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing traditional Chinese medicine therapy and this occurs after stenting.","when_to_set_to_false":"Set to false if the patient is currently undergoing traditional Chinese medicine therapy but not after stenting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the traditional Chinese medicine therapy occurs after stenting.","meaning":"Boolean indicating whether the patient is currently undergoing traditional Chinese medicine therapy after stenting."} ;; "traditional Chinese medicine therapy after stenting"
(declare-const patient_is_undergoing_traditional_chinese_medicine_therapy_now@@concurrent_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing traditional Chinese medicine therapy as concurrent therapy after stenting.","when_to_set_to_false":"Set to false if the patient is currently undergoing traditional Chinese medicine therapy but not as concurrent therapy after stenting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the traditional Chinese medicine therapy is concurrent therapy after stenting.","meaning":"Boolean indicating whether the patient is currently undergoing traditional Chinese medicine therapy as concurrent therapy after stenting."} ;; "concurrent traditional Chinese medicine therapy after stenting"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples imply umbrella term: concurrent therapy after stenting
(assert
(! (=> (or patient_is_undergoing_surgical_procedure_now@@concurrent_therapy
          patient_is_undergoing_chemotherapy_now@@concurrent_therapy
          patient_is_undergoing_radiotherapy_now@@concurrent_therapy
          patient_is_undergoing_traditional_chinese_medicine_therapy_now@@concurrent_therapy)
     (or patient_is_undergoing_surgical_procedure_now@@concurrent_therapy
         patient_is_undergoing_chemotherapy_now@@concurrent_therapy
         patient_is_undergoing_radiotherapy_now@@concurrent_therapy
         patient_is_undergoing_traditional_chinese_medicine_therapy_now@@concurrent_therapy))
:named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (surgery, chemotherapy, radiotherapy, traditional Chinese medicine therapy)."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_undergoing_chemotherapy_now@@concurrent_therapy
       patient_is_undergoing_chemotherapy_now)
:named REQ3_AUXILIARY1)) ;; "chemotherapy as concurrent therapy after stenting implies chemotherapy"

(assert
(! (=> patient_is_undergoing_chemotherapy_now@@concurrent_therapy
       patient_is_undergoing_chemotherapy_now@@temporalcontext_after_stenting)
:named REQ3_AUXILIARY2)) ;; "chemotherapy as concurrent therapy after stenting implies chemotherapy after stenting"

(assert
(! (=> patient_is_undergoing_radiotherapy_now@@concurrent_therapy
       patient_is_undergoing_radiotherapy_now)
:named REQ3_AUXILIARY3)) ;; "radiotherapy as concurrent therapy after stenting implies radiotherapy"

(assert
(! (=> patient_is_undergoing_radiotherapy_now@@concurrent_therapy
       patient_is_undergoing_radiotherapy_now@@temporalcontext_after_stenting)
:named REQ3_AUXILIARY4)) ;; "radiotherapy as concurrent therapy after stenting implies radiotherapy after stenting"

(assert
(! (=> patient_is_undergoing_surgical_procedure_now@@concurrent_therapy
       patient_is_undergoing_surgical_procedure_now)
:named REQ3_AUXILIARY5)) ;; "surgery as concurrent therapy after stenting implies surgery"

(assert
(! (=> patient_is_undergoing_surgical_procedure_now@@concurrent_therapy
       patient_is_undergoing_surgical_procedure_now@@temporalcontext_after_stenting)
:named REQ3_AUXILIARY6)) ;; "surgery as concurrent therapy after stenting implies surgery after stenting"

(assert
(! (=> patient_is_undergoing_traditional_chinese_medicine_therapy_now@@concurrent_therapy
       patient_is_undergoing_traditional_chinese_medicine_therapy_now)
:named REQ3_AUXILIARY7)) ;; "traditional Chinese medicine therapy as concurrent therapy after stenting implies traditional Chinese medicine therapy"

(assert
(! (=> patient_is_undergoing_traditional_chinese_medicine_therapy_now@@concurrent_therapy
       patient_is_undergoing_traditional_chinese_medicine_therapy_now@@temporalcontext_after_stenting)
:named REQ3_AUXILIARY8)) ;; "traditional Chinese medicine therapy as concurrent therapy after stenting implies traditional Chinese medicine therapy after stenting"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_is_undergoing_surgical_procedure_now@@concurrent_therapy
            patient_is_undergoing_chemotherapy_now@@concurrent_therapy
            patient_is_undergoing_radiotherapy_now@@concurrent_therapy
            patient_is_undergoing_traditional_chinese_medicine_therapy_now@@concurrent_therapy))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient receives concurrent therapy after stenting with non-exhaustive examples (surgery, chemotherapy, radiotherapy, traditional Chinese medicine therapy)."
