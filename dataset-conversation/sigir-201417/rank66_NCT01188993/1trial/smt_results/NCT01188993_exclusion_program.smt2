;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "younger than eighteen years old"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 18))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than eighteen years old."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_contraindication_for_transesophageal_echocardiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication for transesophageal echocardiography.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication for transesophageal echocardiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication for transesophageal echocardiography.","meaning":"Boolean indicating whether the patient currently has a contraindication for transesophageal echocardiography."} ;; "The patient is excluded if the patient has a contraindication for transesophageal echocardiography."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_contraindication_for_transesophageal_echocardiography_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication for transesophageal echocardiography."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_sinus_rhythm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sinus rhythm.","when_to_set_to_false":"Set to false if the patient currently does not have sinus rhythm (i.e., has a non-sinus cardiac rhythm).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sinus rhythm.","meaning":"Boolean indicating whether the patient currently has sinus rhythm."} ;; "sinus cardiac rhythm"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_sinus_rhythm_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a non-sinus cardiac rhythm."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_aplasia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has aplasia.","when_to_set_to_false":"Set to false if the patient currently does not have aplasia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has aplasia.","meaning":"Boolean indicating whether the patient currently has aplasia."} ;; "The patient is excluded if the patient has aplasia."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_aplasia_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has aplasia."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_prior_participation_in_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously participated in the study.","when_to_set_to_false":"Set to false if the patient has not previously participated in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously participated in the study.","meaning":"Boolean indicating whether the patient has previously participated in the study."} ;; "The patient is excluded if the patient has prior participation in the study."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_prior_participation_in_study)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has prior participation in the study."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_undergone_hemodynamic_assessment_by_any_technique_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone hemodynamic assessment using any technique at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone hemodynamic assessment using any technique at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone hemodynamic assessment using any technique in their history.","meaning":"Boolean indicating whether the patient has ever undergone hemodynamic assessment using any technique in their history."} ;; "has had hemodynamic assessment using any technique"
(declare-const patient_has_undergone_hemodynamic_assessment_by_any_technique_in_the_history@@excluding_transpulmonary_thermodilution_technique_and_transesophageal_echocardiography Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hemodynamic assessment in their history was performed using a technique other than transpulmonary thermodilution technique and other than transesophageal echocardiography.","when_to_set_to_false":"Set to false if the patient's hemodynamic assessment in their history was performed only using transpulmonary thermodilution technique or transesophageal echocardiography, or if no hemodynamic assessment was performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hemodynamic assessment in their history was performed using a technique other than transpulmonary thermodilution technique or transesophageal echocardiography.","meaning":"Boolean indicating whether the patient's hemodynamic assessment in their history was performed using a technique other than transpulmonary thermodilution technique or transesophageal echocardiography."} ;; "using any technique other than (transpulmonary thermodilution technique OR transesophageal echocardiography)"
(declare-const patient_has_undergone_transesophageal_echocardiography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone transesophageal echocardiography at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone transesophageal echocardiography at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone transesophageal echocardiography.","meaning":"Boolean indicating whether the patient has ever undergone transesophageal echocardiography in their history."} ;; "transesophageal echocardiography"
(declare-const patient_has_undergone_transpulmonary_thermodilution_technique_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone transpulmonary thermodilution technique at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone transpulmonary thermodilution technique at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone transpulmonary thermodilution technique in their history.","meaning":"Boolean indicating whether the patient has ever undergone transpulmonary thermodilution technique in their history."} ;; "transpulmonary thermodilution technique"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_hemodynamic_assessment_by_any_technique_in_the_history@@excluding_transpulmonary_thermodilution_technique_and_transesophageal_echocardiography
      patient_has_undergone_hemodynamic_assessment_by_any_technique_in_the_history)
:named REQ6_AUXILIARY0)) ;; "using any technique other than (transpulmonary thermodilution technique OR transesophageal echocardiography)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_undergone_hemodynamic_assessment_by_any_technique_in_the_history@@excluding_transpulmonary_thermodilution_technique_and_transesophageal_echocardiography)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had hemodynamic assessment using any technique other than (transpulmonary thermodilution technique OR transesophageal echocardiography)."
