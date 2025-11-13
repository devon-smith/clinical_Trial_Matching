;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_left_handed_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently left handed.","when_to_set_to_false":"Set to false if the patient is currently not left handed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently left handed.","meaning":"Boolean indicating whether the patient is currently left handed."} ;; "left handed"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_left_handed_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is left handed."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of dementia.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of dementia."} ;; "dementia based on the clinical diagnosis of dementia"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_dementia_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has dementia based on the clinical diagnosis of dementia."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with cerebrovascular accident (stroke) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with cerebrovascular accident (stroke) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever been diagnosed with cerebrovascular accident (stroke) in their medical history."} ;; "stroke"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_cerebrovascular_accident_inthehistory)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a stroke."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_parkinson_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Parkinson's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Parkinson's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Parkinson's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Parkinson's disease."} ;; "Parkinson's disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_parkinson_s_disease_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Parkinson's disease."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_contraindication_to_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of contraindication to magnetic resonance imaging (MRI).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of contraindication to magnetic resonance imaging (MRI).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to magnetic resonance imaging (MRI).","meaning":"Boolean indicating whether the patient currently has a contraindication to magnetic resonance imaging (MRI)."} ;; "contraindication for magnetic resonance imaging"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_finding_of_contraindication_to_magnetic_resonance_imaging_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication for magnetic resonance imaging."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_contraindication_for_positron_emission_tomography_scan_with_18f_flutemetamol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication for positron emission tomography (PET) scan with [18F]-Flutemetamol.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication for positron emission tomography (PET) scan with [18F]-Flutemetamol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication for positron emission tomography (PET) scan with [18F]-Flutemetamol.","meaning":"Boolean indicating whether the patient currently has a contraindication for positron emission tomography (PET) scan with [18F]-Flutemetamol."} ;; "contraindication for positron emission tomography scan with [18F]-Flutemetamol"

(declare-const patient_has_undergone_positron_emission_tomography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a positron emission tomography (PET) scan at any point in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a positron emission tomography (PET) scan at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a positron emission tomography (PET) scan at any point in their history.","meaning":"Boolean indicating whether the patient has ever undergone a positron emission tomography (PET) scan in their history."} ;; "positron emission tomography scan"

(declare-const patient_has_undergone_positron_emission_tomography_inthehistory@@performed_with_18f_flutemetamol Bool) ;; {"when_to_set_to_true":"Set to true if the positron emission tomography scan was performed with [18F]-Flutemetamol.","when_to_set_to_false":"Set to false if the positron emission tomography scan was not performed with [18F]-Flutemetamol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the positron emission tomography scan was performed with [18F]-Flutemetamol.","meaning":"Boolean indicating whether the PET scan was performed with [18F]-Flutemetamol."} ;; "positron emission tomography scan with [18F]-Flutemetamol"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_positron_emission_tomography_inthehistory@@performed_with_18f_flutemetamol
       patient_has_undergone_positron_emission_tomography_inthehistory)
   :named REQ5_AUXILIARY0)) ;; "positron emission tomography scan with [18F]-Flutemetamol" implies "positron emission tomography scan"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_contraindication_for_positron_emission_tomography_scan_with_18f_flutemetamol_now)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication for positron emission tomography scan with [18F]-Flutemetamol."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_health_problem_that_prevents_travel_to_imaging_service_of_university_hospital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any health problem that prevents travel to the imaging service of the University Hospital.","when_to_set_to_false":"Set to false if the patient currently does not have any health problem that prevents travel to the imaging service of the University Hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any health problem that prevents travel to the imaging service of the University Hospital.","meaning":"Boolean indicating whether the patient currently has any health problem that prevents travel to the imaging service of the University Hospital."} ;; "any health problem that prevents travel to the imaging service of the University Hospital"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_health_problem_that_prevents_travel_to_imaging_service_of_university_hospital_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any health problem that prevents travel to the imaging service of the University Hospital."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_under_legal_guardianship_of_another_person_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently under the legal guardianship of another person.","when_to_set_to_false":"Set to false if the patient is currently not under the legal guardianship of another person.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently under the legal guardianship of another person.","meaning":"Boolean indicating whether the patient is currently under the legal guardianship of another person."} ;; "the patient is under the legal guardianship of another person"
(declare-const patient_is_unable_to_provide_consent_to_participate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to provide consent to participate.","when_to_set_to_false":"Set to false if the patient is currently able to provide consent to participate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to provide consent to participate.","meaning":"Boolean indicating whether the patient is currently unable to provide consent to participate."} ;; "the patient is unable to provide consent to participate"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_is_under_legal_guardianship_of_another_person_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is under the legal guardianship of another person."

(assert
  (! (not patient_is_unable_to_provide_consent_to_participate_now)
     :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to provide consent to participate."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding as documented or reported.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breastfeeding.","meaning":"Boolean indicating whether the patient is currently breastfeeding."} ;; "breastfeeding"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Equate alternate breastfeeding variable names for clarity
(assert
(! (= patient_is_breastfeeding_now patients_breastfeeding_is_positive_now)
:named REQ8_AUXILIARY0)) ;; "the patient is breastfeeding" ≡ "breastfeeding"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_breastfeeding_now)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breastfeeding."
