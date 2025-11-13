;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_non_idiopathic_parkinson_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of non-idiopathic Parkinson's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of non-idiopathic Parkinson's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of non-idiopathic Parkinson's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of non-idiopathic Parkinson's disease."} ;; "the patient has non-idiopathic Parkinson's disease"
(declare-const patient_has_diagnosis_of_non_idiopathic_parkinsonism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of non-idiopathic parkinsonism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of non-idiopathic parkinsonism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of non-idiopathic parkinsonism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of non-idiopathic parkinsonism."} ;; "the patient has non-idiopathic parkinsonism"
(declare-const patient_has_diagnosis_of_atypical_parkinsonism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of atypical parkinsonism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of atypical parkinsonism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of atypical parkinsonism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of atypical parkinsonism."} ;; "non-idiopathic parkinsonism"
(declare-const patient_has_diagnosis_of_parkinson_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Parkinson's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Parkinson's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Parkinson's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Parkinson's disease."} ;; "Parkinson's disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_non_idiopathic_parkinson_s_disease_now)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has non-idiopathic Parkinson's disease."

(assert
(! (not patient_has_diagnosis_of_non_idiopathic_parkinsonism_now)
    :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has non-idiopathic parkinsonism."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_exposed_to_clostridium_botulinum_toxin_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to any clostridium botulinum toxin containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to any clostridium botulinum toxin containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to any clostridium botulinum toxin containing product.","meaning":"Boolean indicating whether the patient has ever been exposed to any clostridium botulinum toxin containing product at any time in the past."} ;; "the patient has previously been exposed to botulinum toxin" OR "the patient has previously been exposed to botulinum toxins"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_exposed_to_clostridium_botulinum_toxin_containing_product_inthehistory)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously been exposed to botulinum toxin."

(assert
(! (not patient_is_exposed_to_clostridium_botulinum_toxin_containing_product_inthehistory)
    :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously been exposed to botulinum toxins."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_aspiration_pneumonia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of aspiration pneumonia.","when_to_set_to_false":"Set to false if the patient does not have a documented history of aspiration pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of aspiration pneumonia.","meaning":"Boolean indicating whether the patient has a history of aspiration pneumonia."} ;; "the patient has a history of aspiration pneumonia"

(declare-const patient_has_finding_of_choking_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of choking.","when_to_set_to_false":"Set to false if the patient does not have a documented history of choking.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of choking.","meaning":"Boolean indicating whether the patient has a history of choking."} ;; "the patient has a history of choking"

(declare-const patient_has_finding_of_choking_inthehistory@@severity_moderate Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of choking is of moderate severity.","when_to_set_to_false":"Set to false if the patient's history of choking is not of moderate severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of choking is moderate.","meaning":"Boolean indicating whether the patient's history of choking is moderate in severity."} ;; "the patient has a history of moderate choking"

(declare-const patient_has_finding_of_choking_inthehistory@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of choking is of severe severity.","when_to_set_to_false":"Set to false if the patient's history of choking is not of severe severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of choking is severe.","meaning":"Boolean indicating whether the patient's history of choking is severe in severity."} ;; "the patient has a history of severe choking"

(declare-const patient_has_finding_of_dysphagia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of dysphagia.","when_to_set_to_false":"Set to false if the patient does not have a documented history of dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of dysphagia.","meaning":"Boolean indicating whether the patient has a history of dysphagia."} ;; "the patient has a history of dysphagia"

(declare-const patient_has_finding_of_dysphagia_inthehistory@@severity_moderate Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of dysphagia is of moderate severity.","when_to_set_to_false":"Set to false if the patient's history of dysphagia is not of moderate severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of dysphagia is moderate.","meaning":"Boolean indicating whether the patient's history of dysphagia is moderate in severity."} ;; "the patient has a history of moderate dysphagia"

(declare-const patient_has_finding_of_dysphagia_inthehistory@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of dysphagia is of severe severity.","when_to_set_to_false":"Set to false if the patient's history of dysphagia is not of severe severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the severity of dysphagia is severe.","meaning":"Boolean indicating whether the patient's history of dysphagia is severe in severity."} ;; "the patient has a history of severe dysphagia"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_choking_inthehistory@@severity_moderate
      patient_has_finding_of_choking_inthehistory)
   :named REQ2_AUXILIARY0)) ;; "the patient has a history of moderate choking"

(assert
(! (=> patient_has_finding_of_choking_inthehistory@@severity_severe
      patient_has_finding_of_choking_inthehistory)
   :named REQ2_AUXILIARY1)) ;; "the patient has a history of severe choking"

(assert
(! (=> patient_has_finding_of_dysphagia_inthehistory@@severity_moderate
      patient_has_finding_of_dysphagia_inthehistory)
   :named REQ2_AUXILIARY2)) ;; "the patient has a history of moderate dysphagia"

(assert
(! (=> patient_has_finding_of_dysphagia_inthehistory@@severity_severe
      patient_has_finding_of_dysphagia_inthehistory)
   :named REQ2_AUXILIARY3)) ;; "the patient has a history of severe dysphagia"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_aspiration_pneumonia_inthehistory)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a history of aspiration pneumonia"

(assert
(! (not patient_has_finding_of_choking_inthehistory@@severity_moderate)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a history of moderate choking"

(assert
(! (not patient_has_finding_of_choking_inthehistory@@severity_severe)
   :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has a history of severe choking"

(assert
(! (not patient_has_finding_of_dysphagia_inthehistory@@severity_moderate)
   :named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient has a history of moderate dysphagia"

(assert
(! (not patient_has_finding_of_dysphagia_inthehistory@@severity_severe)
   :named REQ2_COMPONENT4_OTHER_REQUIREMENTS)) ;; "the patient has a history of severe dysphagia"

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_operation_on_salivary_gland_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a salivary gland surgery at any time in the past (prior to the present).","when_to_set_to_false":"Set to false if the patient has never undergone a salivary gland surgery at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a salivary gland surgery.","meaning":"Boolean indicating whether the patient has ever undergone a salivary gland surgery at any time in the past."} ;; "The patient is excluded if the patient has had prior salivary gland surgery."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_operation_on_salivary_gland_inthehistory)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had prior salivary gland surgery."
