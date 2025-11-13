;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_positron_emission_tomography_with_computed_tomography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone positron emission tomography with computed tomography (PET-CT) at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone positron emission tomography with computed tomography (PET-CT) at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone positron emission tomography with computed tomography (PET-CT).","meaning":"Boolean indicating whether the patient has ever undergone positron emission tomography with computed tomography (PET-CT) in their history."} ;; "positron emission tomography-computed tomography"
(declare-const patient_has_undergone_positron_emission_tomography_with_computed_tomography_inthehistory@@temporalcontext_at_least_three_weeks_off_therapy_before_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient had been off therapy for at least three weeks before undergoing positron emission tomography with computed tomography (PET-CT).","when_to_set_to_false":"Set to false if the patient had not been off therapy for at least three weeks before undergoing positron emission tomography with computed tomography (PET-CT).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had been off therapy for at least three weeks before undergoing positron emission tomography with computed tomography (PET-CT).","meaning":"Boolean indicating whether the patient had been off therapy for at least three weeks before undergoing positron emission tomography with computed tomography (PET-CT)."} ;; "at least three weeks off therapy before procedure"
(declare-const therapy_off_duration_before_positron_emission_tomography_with_computed_tomography_in_weeks Real) ;; {"when_to_set_to_value":"Set to the number of weeks the patient has been off therapy before undergoing PET-CT.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many weeks the patient has been off therapy before undergoing PET-CT.","meaning":"Numeric value representing the number of weeks the patient has been off therapy before PET-CT."} ;; "number of weeks off therapy before PET-CT"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definitional link: patient_has_undergone_positron_emission_tomography_with_computed_tomography_inthehistory@@temporalcontext_at_least_three_weeks_off_therapy_before_procedure is true iff patient_has_undergone_positron_emission_tomography_with_computed_tomography_inthehistory is true AND therapy_off_duration_before_positron_emission_tomography_with_computed_tomography_in_weeks >= 3
(assert
(! (= patient_has_undergone_positron_emission_tomography_with_computed_tomography_inthehistory@@temporalcontext_at_least_three_weeks_off_therapy_before_procedure
     (and patient_has_undergone_positron_emission_tomography_with_computed_tomography_inthehistory
          (>= therapy_off_duration_before_positron_emission_tomography_with_computed_tomography_in_weeks 3)))
:named REQ0_AUXILIARY0)) ;; "off therapy for at least three weeks before undergoing positron emission tomography-computed tomography"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_undergone_positron_emission_tomography_with_computed_tomography_inthehistory@@temporalcontext_at_least_three_weeks_off_therapy_before_procedure
     patient_has_undergone_positron_emission_tomography_with_computed_tomography_inthehistory)
:named REQ0_AUXILIARY1)) ;; "qualifier variable implies stem variable"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have undergone PET-CT without being off therapy for at least three weeks before the procedure
(assert
(! (not patient_has_undergone_positron_emission_tomography_with_computed_tomography_inthehistory@@temporalcontext_at_least_three_weeks_off_therapy_before_procedure)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has NOT been off therapy for at least three weeks before undergoing positron emission tomography-computed tomography."
