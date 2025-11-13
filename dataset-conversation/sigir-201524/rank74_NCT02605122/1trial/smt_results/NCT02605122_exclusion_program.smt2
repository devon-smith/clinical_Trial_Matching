;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_ventilator_associated_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ventilator-associated pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ventilator-associated pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ventilator-associated pneumonia.","meaning":"Boolean indicating whether the patient currently has ventilator-associated pneumonia."} ;; "ventilator-associated pneumonia"
(declare-const patient_has_finding_of_hospital_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hospital-acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hospital-acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hospital-acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has hospital-acquired pneumonia."} ;; "hospital-acquired pneumonia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_ventilator_associated_pneumonia_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ventilator-associated pneumonia."

(assert
  (! (not patient_has_finding_of_hospital_acquired_pneumonia_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hospital-acquired pneumonia."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_antibiotic_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone systemic antibacterial therapy at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone systemic antibacterial therapy at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone systemic antibacterial therapy.","meaning":"Boolean indicating whether the patient has ever undergone systemic antibacterial therapy at any time in their history."} ;; "antibacterial therapy"
(declare-const systemic_antibacterial_therapy_duration_value_recorded_in_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours the patient has received systemic antibacterial therapy.","when_to_set_to_null":"Set to null if the duration is unknown, not documented, or cannot be determined.","meaning":"Numeric variable indicating the total duration, in hours, that the patient has received systemic antibacterial therapy."} ;; "for greater than forty-eight hours"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (and patient_has_undergone_antibiotic_therapy_inthehistory
               (> systemic_antibacterial_therapy_duration_value_recorded_in_hours 48)))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received systemic antibacterial therapy for greater than forty-eight hours."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_bacterial_meningitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bacterial meningitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bacterial meningitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bacterial meningitis.","meaning":"Boolean indicating whether the patient currently has bacterial meningitis."} ;; "bacterial meningitis"
(declare-const patient_has_finding_of_bacterial_meningitis_now@@confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of bacterial meningitis is confirmed.","when_to_set_to_false":"Set to false if the patient's current diagnosis of bacterial meningitis is not confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of bacterial meningitis is confirmed.","meaning":"Boolean indicating whether the patient's current diagnosis of bacterial meningitis is confirmed."} ;; "confirmed bacterial meningitis"
(declare-const patient_has_finding_of_bacterial_meningitis_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of bacterial meningitis is suspected.","when_to_set_to_false":"Set to false if the patient's current diagnosis of bacterial meningitis is not suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of bacterial meningitis is suspected.","meaning":"Boolean indicating whether the patient's current diagnosis of bacterial meningitis is suspected."} ;; "suspected bacterial meningitis"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_bacterial_meningitis_now@@confirmed
      patient_has_finding_of_bacterial_meningitis_now)
:named REQ2_AUXILIARY0)) ;; "confirmed bacterial meningitis"

(assert
(! (=> patient_has_finding_of_bacterial_meningitis_now@@suspected
      patient_has_finding_of_bacterial_meningitis_now)
:named REQ2_AUXILIARY1)) ;; "suspected bacterial meningitis"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or patient_has_finding_of_bacterial_meningitis_now@@confirmed
            patient_has_finding_of_bacterial_meningitis_now@@suspected))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has confirmed bacterial meningitis) OR (the patient has suspected bacterial meningitis)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "breast-feeding"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current recorded sex is female.","when_to_set_to_false":"Set to false if the patient's current recorded sex is not female.","when_to_set_to_null":"Set to null if the patient's current recorded sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current recorded sex is female."} ;; "breast-feeding female"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (and patient_is_breastfeeding_now patient_sex_is_female_now))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a breast-feeding female."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant, as determined by a positive pregnancy test result.","when_to_set_to_false":"Set to false if the patient is currently not pregnant, as determined by a negative pregnancy test result.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient has a positive pregnancy test"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a positive pregnancy test."
