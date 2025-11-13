;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const mini_mental_state_examination_score_value_recorded_now_withunit_points_out_of_30 Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's Mini-Mental State Examination score recorded now, in points out of 30.","when_to_set_to_null":"Set to null if the Mini-Mental State Examination score is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's Mini-Mental State Examination score recorded now, in points out of 30."} ;; "Mini-Mental State Examination score < 10 out of 30"
(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "dementia"
(declare-const patient_has_finding_of_dementia_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dementia and the dementia is severe.","when_to_set_to_false":"Set to false if the patient currently has dementia but the dementia is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dementia is severe.","meaning":"Boolean indicating whether the patient's current dementia is severe."} ;; "severe dementia"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: severe dementia is present if patient has dementia now AND Mini-Mental State Examination score < 10 out of 30
(assert
(! (= patient_has_finding_of_dementia_now@@severity_severe
(and patient_has_finding_of_dementia_now
(< mini_mental_state_examination_score_value_recorded_now_withunit_points_out_of_30 10)))
:named REQ0_AUXILIARY0)) ;; "severe dementia (Mini-Mental State Examination score < 10 out of 30)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_dementia_now@@severity_severe
patient_has_finding_of_dementia_now)
:named REQ0_AUXILIARY1)) ;; "severe dementia" implies "dementia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_dementia_now@@severity_severe)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe dementia (Mini-Mental State Examination score < 10 out of 30)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_receiving_enteral_nutrition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving enteral nutrition.","when_to_set_to_false":"Set to false if the patient is currently not receiving enteral nutrition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving enteral nutrition.","meaning":"Boolean indicating whether the patient is currently receiving enteral nutrition."} ;; "The patient is excluded if the patient is receiving enteral nutrition."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_receiving_enteral_nutrition_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving enteral nutrition."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal impairment.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of renal impairment.","meaning":"Boolean indicating whether the patient currently has renal impairment."} ;; "renal impairment"
(declare-const patient_has_finding_of_renal_impairment_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current renal impairment is severe.","when_to_set_to_false":"Set to false if the patient's current renal impairment is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current renal impairment is severe.","meaning":"Boolean indicating whether the patient's current renal impairment is severe."} ;; "severe renal impairment"
(declare-const patient_has_finding_of_hepatic_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic impairment.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic impairment.","meaning":"Boolean indicating whether the patient currently has hepatic impairment."} ;; "hepatic impairment"
(declare-const patient_has_finding_of_hepatic_impairment_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hepatic impairment is severe.","when_to_set_to_false":"Set to false if the patient's current hepatic impairment is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hepatic impairment is severe.","meaning":"Boolean indicating whether the patient's current hepatic impairment is severe."} ;; "severe hepatic impairment"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_renal_impairment_now@@severe
       patient_has_finding_of_renal_impairment_now)
   :named REQ2_AUXILIARY0)) ;; "severe renal impairment" implies "renal impairment"

(assert
(! (=> patient_has_finding_of_hepatic_impairment_now@@severe
       patient_has_finding_of_hepatic_impairment_now)
   :named REQ2_AUXILIARY1)) ;; "severe hepatic impairment" implies "hepatic impairment"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_finding_of_renal_impairment_now@@severe
            patient_has_finding_of_hepatic_impairment_now@@severe))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has severe renal impairment) OR (the patient has severe hepatic impairment)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease (cancer)."} ;; "cancer"

(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now@@accompanied_by_chemotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of malignant neoplastic disease (cancer) is accompanied by chemotherapy.","when_to_set_to_false":"Set to false if the patient's current diagnosis of malignant neoplastic disease (cancer) is not accompanied by chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of malignant neoplastic disease (cancer) is accompanied by chemotherapy.","meaning":"Boolean indicating whether the patient's current diagnosis of malignant neoplastic disease (cancer) is accompanied by chemotherapy."} ;; "cancer with chemotherapy"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_malignant_neoplastic_disease_now@@accompanied_by_chemotherapy
      patient_has_diagnosis_of_malignant_neoplastic_disease_now)
:named REQ3_AUXILIARY0)) ;; "cancer with chemotherapy" implies "cancer"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_now@@accompanied_by_chemotherapy)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cancer with chemotherapy."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_diabetic_poor_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of uncontrolled diabetes mellitus (poorly controlled diabetes).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of uncontrolled diabetes mellitus (poorly controlled diabetes).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled diabetes mellitus (poorly controlled diabetes).","meaning":"Boolean indicating whether the patient currently has uncontrolled diabetes mellitus (poorly controlled diabetes)."} ;; "uncontrolled diabetes mellitus"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_diabetic_poor_control_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled diabetes mellitus."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_intolerance_to_lactose_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of lactose intolerance.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of lactose intolerance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of lactose intolerance.","meaning":"Boolean indicating whether the patient currently has lactose intolerance as a clinical finding or diagnosis."} ;; "lactose intolerance"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_intolerance_to_lactose_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has lactose intolerance."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_allergy_to_cow_s_milk_protein_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of allergy to cow's milk protein.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of allergy to cow's milk protein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of allergy to cow's milk protein.","meaning":"Boolean indicating whether the patient currently has an allergy to cow's milk protein."} ;; "cow's milk protein allergy"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_allergy_to_cow_s_milk_protein_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cow's milk protein allergy."
