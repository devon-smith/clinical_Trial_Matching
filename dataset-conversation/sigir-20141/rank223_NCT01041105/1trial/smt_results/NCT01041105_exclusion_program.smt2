;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_bariatric_operative_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a bariatric operative procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a bariatric operative procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a bariatric operative procedure.","meaning":"Boolean indicating whether the patient has ever undergone a bariatric operative procedure at any time in the past."} ;; "bariatric surgical procedure"
(declare-const patient_has_undergone_bariatric_operative_procedure_inthehistory@@is_revisional Bool) ;; {"when_to_set_to_true":"Set to true if the bariatric operative procedure undergone by the patient is revisional.","when_to_set_to_false":"Set to false if the bariatric operative procedure undergone by the patient is not revisional.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bariatric operative procedure is revisional.","meaning":"Boolean indicating whether the bariatric operative procedure is revisional."} ;; "revisional bariatric surgical procedure"
(declare-const patient_has_undergone_bariatric_operative_procedure_inthehistory@@is_other_type_than_index_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the bariatric operative procedure undergone by the patient is of a type other than the index procedure.","when_to_set_to_false":"Set to false if the bariatric operative procedure undergone by the patient is of the same type as the index procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bariatric operative procedure is of a type other than the index procedure.","meaning":"Boolean indicating whether the bariatric operative procedure is of a type other than the index procedure."} ;; "other type than index procedure"
(declare-const patient_has_undergone_revisional_bariatric_surgical_procedure_other_than_index_type_count_inthehistory Real) ;; {"when_to_set_to_value":"Set to the number of revisional bariatric surgical procedures of a type other than the index procedure that the patient has undergone at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many revisional bariatric surgical procedures of a type other than the index procedure the patient has undergone in the past.","meaning":"Numeric variable indicating the number of revisional bariatric surgical procedures of a type other than the index procedure that the patient has undergone at any time in the past."} ;; "at least one other type of revisional bariatric surgical procedure"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; The count variable is true iff both revisional and other type than index procedure
(assert
(! (= (ite (and patient_has_undergone_bariatric_operative_procedure_inthehistory@@is_revisional
                patient_has_undergone_bariatric_operative_procedure_inthehistory@@is_other_type_than_index_procedure)
           1
           0)
     patient_has_undergone_revisional_bariatric_surgical_procedure_other_than_index_type_count_inthehistory)
:named REQ0_AUXILIARY0)) ;; "has undergone at least one other type of revisional bariatric surgical procedure."

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_undergone_bariatric_operative_procedure_inthehistory@@is_revisional
       patient_has_undergone_bariatric_operative_procedure_inthehistory)
:named REQ0_AUXILIARY1)) ;; "revisional bariatric surgical procedure"

(assert
(! (=> patient_has_undergone_bariatric_operative_procedure_inthehistory@@is_other_type_than_index_procedure
       patient_has_undergone_bariatric_operative_procedure_inthehistory)
:named REQ0_AUXILIARY2)) ;; "other type than index procedure"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (>= patient_has_undergone_revisional_bariatric_surgical_procedure_other_than_index_type_count_inthehistory 1))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has undergone at least one other type of revisional bariatric surgical procedure."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_surgical_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone any surgical procedure at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone any surgical procedure at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone any surgical procedure in their history.","meaning":"Boolean indicating whether the patient has ever undergone any surgical procedure in their history."} ;; "surgical procedure"
(declare-const patient_has_undergone_surgical_procedure_inthehistory@@roux_en_y_gastric_bypass Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure undergone by the patient is a Roux-en-Y gastric bypass.","when_to_set_to_false":"Set to false if the surgical procedure undergone by the patient is not a Roux-en-Y gastric bypass.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure is a Roux-en-Y gastric bypass.","meaning":"Boolean indicating whether the surgical procedure is a Roux-en-Y gastric bypass."} ;; "Roux-en-Y gastric bypass"
(declare-const patient_has_undergone_surgical_procedure_inthehistory@@revisional Bool) ;; {"when_to_set_to_true":"Set to true if the Roux-en-Y gastric bypass surgical procedure undergone by the patient is revisional.","when_to_set_to_false":"Set to false if the Roux-en-Y gastric bypass surgical procedure undergone by the patient is not revisional.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Roux-en-Y gastric bypass surgical procedure is revisional.","meaning":"Boolean indicating whether the Roux-en-Y gastric bypass surgical procedure is revisional."} ;; "revisional Roux-en-Y gastric bypass"
(declare-const patient_has_undergone_surgical_procedure_inthehistory@@nonstandard Bool) ;; {"when_to_set_to_true":"Set to true if the revisional Roux-en-Y gastric bypass surgical procedure undergone by the patient is nonstandard.","when_to_set_to_false":"Set to false if the revisional Roux-en-Y gastric bypass surgical procedure undergone by the patient is standard.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the revisional Roux-en-Y gastric bypass surgical procedure is nonstandard.","meaning":"Boolean indicating whether the revisional Roux-en-Y gastric bypass surgical procedure is nonstandard."} ;; "nonstandard revisional Roux-en-Y gastric bypass"
(declare-const patient_has_undergone_surgical_procedure_inthehistory@@revisional@@roux_en_y_gastric_bypass@@nonstandard Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone at least one nonstandard revisional Roux-en-Y gastric bypass surgical procedure at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone any nonstandard revisional Roux-en-Y gastric bypass surgical procedure at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a nonstandard revisional Roux-en-Y gastric bypass surgical procedure in their history.","meaning":"Boolean indicating whether the patient has ever undergone at least one nonstandard revisional Roux-en-Y gastric bypass surgical procedure in their history."} ;; "at least one nonstandard revisional Roux-en-Y gastric bypass surgical procedure"
(declare-const patient_number_of_nonstandard_revisional_roux_en_y_gastric_bypass_surgical_procedures_ever Real) ;; {"when_to_set_to_value":"Set to the total number of nonstandard revisional Roux-en-Y gastric bypass surgical procedures the patient has ever undergone in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many nonstandard revisional Roux-en-Y gastric bypass surgical procedures the patient has ever undergone in their history.","meaning":"Numeric value indicating the total number of nonstandard revisional Roux-en-Y gastric bypass surgical procedures the patient has ever undergone in their history."} ;; "number of nonstandard revisional Roux-en-Y gastric bypass surgical procedures ever"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definitional: The patient has undergone at least one nonstandard revisional Roux-en-Y gastric bypass surgical procedure iff the count is >= 1
(assert
(! (= patient_has_undergone_surgical_procedure_inthehistory@@revisional@@roux_en_y_gastric_bypass@@nonstandard
     (>= patient_number_of_nonstandard_revisional_roux_en_y_gastric_bypass_surgical_procedures_ever 1))
:named REQ1_AUXILIARY0)) ;; "has undergone at least one nonstandard revisional Roux-en-Y gastric bypass surgical procedure."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_surgical_procedure_inthehistory@@roux_en_y_gastric_bypass
       patient_has_undergone_surgical_procedure_inthehistory)
:named REQ1_AUXILIARY1)) ;; "roux-en-y gastric bypass is a surgical procedure"

(assert
(! (=> patient_has_undergone_surgical_procedure_inthehistory@@revisional
       patient_has_undergone_surgical_procedure_inthehistory@@roux_en_y_gastric_bypass)
:named REQ1_AUXILIARY2)) ;; "revisional is a type of roux-en-y gastric bypass"

(assert
(! (=> patient_has_undergone_surgical_procedure_inthehistory@@nonstandard
       patient_has_undergone_surgical_procedure_inthehistory@@revisional)
:named REQ1_AUXILIARY3)) ;; "nonstandard is a type of revisional roux-en-y gastric bypass"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_undergone_surgical_procedure_inthehistory@@revisional@@roux_en_y_gastric_bypass@@nonstandard)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has undergone at least one nonstandard revisional Roux-en-Y gastric bypass surgical procedure."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_revision_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a revision surgical procedure at any time in their history, regardless of approach.","when_to_set_to_false":"Set to false if the patient has never undergone a revision surgical procedure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a revision surgical procedure at any time in their history.","meaning":"Boolean indicating whether the patient has ever undergone a revision surgical procedure at any time in their history."} ;; "revision surgical procedure"
(declare-const patient_has_undergone_revision_inthehistory@@performed_using_open_surgical_approach Bool) ;; {"when_to_set_to_true":"Set to true if the revision surgical procedure was performed using an open surgical approach.","when_to_set_to_false":"Set to false if the revision surgical procedure was not performed using an open surgical approach.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the revision surgical procedure was performed using an open surgical approach.","meaning":"Boolean indicating whether the revision surgical procedure was performed using an open surgical approach."} ;; "open surgical approach for revision surgical procedure"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_revision_inthehistory@@performed_using_open_surgical_approach
      patient_has_undergone_revision_inthehistory)
:named REQ2_AUXILIARY0)) ;; "revision surgical procedure performed using open surgical approach" implies "revision surgical procedure"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_revision_inthehistory@@performed_using_open_surgical_approach)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has undergone at least one open surgical approach for revision surgical procedure."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_patient_medical_record_not_available_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has missing or unavailable medical records.","when_to_set_to_false":"Set to false if the patient currently does not have missing or unavailable medical records.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has missing or unavailable medical records.","meaning":"Boolean indicating whether the patient currently has missing or unavailable medical records."} ;; "missing medical records"

(declare-const patient_has_finding_of_insufficient_clinical_detail_given_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has insufficient clinical detail (scant medical information) available.","when_to_set_to_false":"Set to false if the patient currently does not have insufficient clinical detail (scant medical information) available.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has insufficient clinical detail (scant medical information) available.","meaning":"Boolean indicating whether the patient currently has insufficient clinical detail (scant medical information) available."} ;; "scant medical information"

(declare-const patient_is_unreachable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unreachable for contact or follow-up.","when_to_set_to_false":"Set to false if the patient is currently reachable for contact or follow-up.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unreachable for contact or follow-up.","meaning":"Boolean indicating whether the patient is currently unreachable for contact or follow-up."} ;; "unreachable"

(declare-const patient_is_unreachable_now@@with_scant_medical_information_for_analysis Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unreachable and the available medical information is scant for analysis.","when_to_set_to_false":"Set to false if the patient is currently unreachable but the available medical information is not scant for analysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unreachable with scant medical information for analysis.","meaning":"Boolean indicating whether the patient is currently unreachable with scant medical information for analysis."} ;; "unreachable with scant medical information for analysis"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_is_unreachable_now@@with_scant_medical_information_for_analysis
     patient_is_unreachable_now)
:named REQ3_AUXILIARY0)) ;; "unreachable with scant medical information for analysis" implies "unreachable"

;; Qualifier variable implies insufficient clinical detail
(assert
(! (=> patient_is_unreachable_now@@with_scant_medical_information_for_analysis
     patient_has_finding_of_insufficient_clinical_detail_given_now)
:named REQ3_AUXILIARY1)) ;; "unreachable with scant medical information for analysis" implies "scant medical information"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_patient_medical_record_not_available_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has missing medical records."

(assert
(! (not patient_is_unreachable_now@@with_scant_medical_information_for_analysis)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unreachable with scant medical information for analysis."
