;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_patient_immunocompromised_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently immune compromised.","when_to_set_to_false":"Set to false if the patient is currently not immune compromised.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently immune compromised.","meaning":"Boolean indicating whether the patient is currently immune compromised."} ;; "immune compromised"
(declare-const patient_has_undergone_solid_organ_transplant_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone solid organ transplant at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone solid organ transplant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone solid organ transplant.","meaning":"Boolean indicating whether the patient has undergone solid organ transplant at any time in the past."} ;; "solid organ transplant"
(declare-const patient_has_undergone_transplantation_of_bone_marrow_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone bone marrow transplantation at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone bone marrow transplantation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone bone marrow transplantation.","meaning":"Boolean indicating whether the patient has undergone bone marrow transplantation at any time in the past."} ;; "bone marrow transplantation"
(declare-const patient_has_finding_of_hereditary_disorder_of_immune_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hereditary disorder of the immune system.","when_to_set_to_false":"Set to false if the patient currently does not have a hereditary disorder of the immune system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hereditary disorder of the immune system.","meaning":"Boolean indicating whether the patient currently has a hereditary disorder of the immune system."} ;; "inherited immune deficiency"
(declare-const patient_has_finding_of_immunodeficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an immunodeficiency disorder.","when_to_set_to_false":"Set to false if the patient currently does not have an immunodeficiency disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an immunodeficiency disorder.","meaning":"Boolean indicating whether the patient currently has an immunodeficiency disorder."} ;; "immune deficiency"
(declare-const patient_has_finding_of_immunodeficiency_disorder_now@@acquired Bool) ;; {"when_to_set_to_true":"Set to true if the patient's immunodeficiency disorder is acquired.","when_to_set_to_false":"Set to false if the patient's immunodeficiency disorder is not acquired (i.e., inherited or congenital).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunodeficiency disorder is acquired.","meaning":"Boolean indicating whether the patient's immunodeficiency disorder is acquired."} ;; "acquired immune deficiency"
(declare-const patient_is_undergoing_immunosuppressive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing immunosuppressive therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing immunosuppressive therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing immunosuppressive therapy.","meaning":"Boolean indicating whether the patient is currently undergoing immunosuppressive therapy."} ;; "immunosuppressive drug treatment"
(declare-const patient_is_undergoing_immunosuppressive_therapy_now@@chronically Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing immunosuppressive therapy and the treatment is chronic.","when_to_set_to_false":"Set to false if the patient is currently undergoing immunosuppressive therapy but the treatment is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunosuppressive therapy is chronic.","meaning":"Boolean indicating whether the patient is currently undergoing immunosuppressive therapy and the treatment is chronic."} ;; "chronically with immunosuppressive drug treatment"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: immune compromised = (after solid organ transplant) OR (after bone marrow transplantation) OR (inherited immune deficiency) OR (acquired immune deficiency) OR (chronically treated with immunosuppressive drug treatment)
(assert
(! (= patient_has_finding_of_patient_immunocompromised_now
(or patient_has_undergone_solid_organ_transplant_inthehistory
    patient_has_undergone_transplantation_of_bone_marrow_inthehistory
    patient_has_finding_of_hereditary_disorder_of_immune_system_now
    patient_has_finding_of_immunodeficiency_disorder_now@@acquired
    patient_is_undergoing_immunosuppressive_therapy_now@@chronically))
:named REQ0_AUXILIARY0)) ;; "immune compromised, defined as (the patient is after solid organ transplant) OR (the patient is after bone marrow transplantation) OR (the patient has inherited immune deficiency) OR (the patient has acquired immune deficiency) OR (the patient is being treated chronically with immunosuppressive drug treatment)"

;; Qualifier variable implies stem variable: acquired immune deficiency implies immune deficiency
(assert
(! (=> patient_has_finding_of_immunodeficiency_disorder_now@@acquired
       patient_has_finding_of_immunodeficiency_disorder_now)
:named REQ0_AUXILIARY1)) ;; "acquired immune deficiency"

;; Qualifier variable implies stem variable: chronically treated implies currently treated
(assert
(! (=> patient_is_undergoing_immunosuppressive_therapy_now@@chronically
       patient_is_undergoing_immunosuppressive_therapy_now)
:named REQ0_AUXILIARY2)) ;; "chronically with immunosuppressive drug treatment"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_patient_immunocompromised_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is immune compromised, defined as ...)"
(assert
(! (not patient_has_undergone_solid_organ_transplant_inthehistory)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is after solid organ transplant."
(assert
(! (not patient_has_undergone_transplantation_of_bone_marrow_inthehistory)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is after bone marrow transplantation."
(assert
(! (not patient_has_finding_of_hereditary_disorder_of_immune_system_now)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has inherited immune deficiency."
(assert
(! (not patient_has_finding_of_immunodeficiency_disorder_now@@acquired)
:named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acquired immune deficiency."
(assert
(! (not patient_is_undergoing_immunosuppressive_therapy_now@@chronically)
:named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is being treated chronically with immunosuppressive drug treatment."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_received_oseltamivir_treatment_in_previous_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received oseltamivir treatment at any time in the previous six months.","when_to_set_to_false":"Set to false if the patient has not received oseltamivir treatment at any time in the previous six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received oseltamivir treatment in the previous six months.","meaning":"Boolean indicating whether the patient has received oseltamivir treatment in the previous six months."} ;; "The patient is excluded if the patient was treated with oseltamivir treatment in the previous six months."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_received_oseltamivir_treatment_in_previous_6_months)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was treated with oseltamivir treatment in the previous six months."
