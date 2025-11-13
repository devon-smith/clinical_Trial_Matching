;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_laryngitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of laryngitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of laryngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has laryngitis.","meaning":"Boolean indicating whether the patient currently has laryngitis."} ;; "laryngitis"
(declare-const patient_has_finding_of_coryza_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of coryza.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of coryza.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has coryza.","meaning":"Boolean indicating whether the patient currently has coryza."} ;; "coryza"
(declare-const patient_has_finding_of_conjunctivitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of conjunctivitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of conjunctivitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has conjunctivitis.","meaning":"Boolean indicating whether the patient currently has conjunctivitis."} ;; "conjunctivitis"
(declare-const patient_has_finding_of_diarrhea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of diarrhea.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of diarrhea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diarrhea.","meaning":"Boolean indicating whether the patient currently has diarrhea."} ;; "diarrhea"
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cough.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."} ;; "cough"
(declare-const patient_has_finding_of_tonsillitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of tonsillitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of tonsillitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tonsillitis.","meaning":"Boolean indicating whether the patient currently has tonsillitis."} ;; "tonsillitis"
(declare-const patient_has_finding_of_tonsillitis_now@@nonstreptococcal Bool) ;; {"when_to_set_to_true":"Set to true if the patient's tonsillitis is nonstreptococcal.","when_to_set_to_false":"Set to false if the patient's tonsillitis is streptococcal or the etiology is known to be streptococcal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tonsillitis is nonstreptococcal.","meaning":"Boolean indicating whether the patient's tonsillitis is nonstreptococcal."} ;; "nonstreptococcal tonsillitis"
(declare-const patient_has_finding_of_pharyngitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pharyngitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pharyngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pharyngitis.","meaning":"Boolean indicating whether the patient currently has pharyngitis."} ;; "pharyngitis"
(declare-const patient_has_finding_of_pharyngitis_now@@nonstreptococcal Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pharyngitis is nonstreptococcal.","when_to_set_to_false":"Set to false if the patient's pharyngitis is streptococcal or the etiology is known to be streptococcal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pharyngitis is nonstreptococcal.","meaning":"Boolean indicating whether the patient's pharyngitis is nonstreptococcal."} ;; "nonstreptococcal pharyngitis"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term (tonsillitis)
(assert
(! (=> (or patient_has_finding_of_laryngitis_now
           patient_has_finding_of_coryza_now
           patient_has_finding_of_conjunctivitis_now
           patient_has_finding_of_diarrhea_now
           patient_has_finding_of_cough_now)
    patient_has_finding_of_tonsillitis_now@@nonstreptococcal)
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples (laryngitis OR coryza OR conjunctivitis OR diarrhea OR cough)" for tonsillitis

;; Qualifier variable implies corresponding stem variable (tonsillitis)
(assert
(! (=> patient_has_finding_of_tonsillitis_now@@nonstreptococcal
    patient_has_finding_of_tonsillitis_now)
:named REQ0_AUXILIARY1)) ;; "nonstreptococcal tonsillitis" implies "tonsillitis"

;; Non-exhaustive examples imply umbrella term (pharyngitis)
(assert
(! (=> (or patient_has_finding_of_laryngitis_now
           patient_has_finding_of_coryza_now
           patient_has_finding_of_conjunctivitis_now
           patient_has_finding_of_diarrhea_now
           patient_has_finding_of_cough_now)
    patient_has_finding_of_pharyngitis_now@@nonstreptococcal)
:named REQ0_AUXILIARY2)) ;; "with non-exhaustive examples (laryngitis OR coryza OR conjunctivitis OR diarrhea OR cough)" for pharyngitis

;; Qualifier variable implies corresponding stem variable (pharyngitis)
(assert
(! (=> patient_has_finding_of_pharyngitis_now@@nonstreptococcal
    patient_has_finding_of_pharyngitis_now)
:named REQ0_AUXILIARY3)) ;; "nonstreptococcal pharyngitis" implies "pharyngitis"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have symptoms that collectively suggest nonstreptococcal tonsillitis
(assert
(! (not patient_has_finding_of_tonsillitis_now@@nonstreptococcal)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptoms that collectively suggest nonstreptococcal tonsillitis..."

;; Exclusion: patient must NOT have symptoms that collectively suggest nonstreptococcal pharyngitis
(assert
(! (not patient_has_finding_of_pharyngitis_now@@nonstreptococcal)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptoms that collectively suggest nonstreptococcal pharyngitis..."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_throat_culture_inthehistory_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a throat culture performed in the past and the result was positive.","when_to_set_to_false":"Set to false if the patient has had a throat culture performed in the past and the result was not positive, or if all past throat cultures were negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a positive throat culture.","meaning":"Boolean indicating whether the patient has ever had a positive throat culture in their history."} ;; "history of positive throat culture"
(declare-const patient_has_undergone_throat_culture_inthehistory_outcome_is_positive@@for_streptococcus_pyogenes Bool) ;; {"when_to_set_to_true":"Set to true if the positive throat culture in the patient's history was specifically for Streptococcus pyogenes.","when_to_set_to_false":"Set to false if the positive throat culture in the patient's history was not for Streptococcus pyogenes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the positive throat culture was for Streptococcus pyogenes.","meaning":"Boolean indicating whether the positive throat culture in the patient's history was for Streptococcus pyogenes."} ;; "history of positive throat culture for Streptococcus pyogenes"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_throat_culture_inthehistory_outcome_is_positive@@for_streptococcus_pyogenes
      patient_has_undergone_throat_culture_inthehistory_outcome_is_positive)
:named REQ1_AUXILIARY0)) ;; "positive throat culture for Streptococcus pyogenes implies positive throat culture"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: history of positive throat culture for Streptococcus pyogenes AND absence of clinical signs and symptoms of tonsillitis AND absence of clinical signs and symptoms of pharyngitis
(assert
(! (not (and patient_has_undergone_throat_culture_inthehistory_outcome_is_positive@@for_streptococcus_pyogenes
             (not patient_has_finding_of_tonsillitis_now)
             (not patient_has_finding_of_pharyngitis_now)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of positive throat culture for Streptococcus pyogenes) AND (the patient does NOT have clinical signs and symptoms of tonsillitis) AND (the patient does NOT have clinical signs and symptoms of pharyngitis)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_infection_of_deep_tissues_of_upper_respiratory_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an infection of the deep tissues of the upper respiratory tract.","when_to_set_to_false":"Set to false if the patient currently does not have an infection of the deep tissues of the upper respiratory tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an infection of the deep tissues of the upper respiratory tract.","meaning":"Boolean indicating whether the patient currently has infection of the deep tissues of the upper respiratory tract."} ;; "infection of the deep tissues of the upper respiratory tract"

(declare-const patient_has_finding_of_infection_of_suprapharyngeal_respiratory_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an infection of the suprapharyngeal respiratory tract and the connecting structures of the suprapharyngeal respiratory tract.","when_to_set_to_false":"Set to false if the patient currently does not have an infection of the suprapharyngeal respiratory tract and the connecting structures of the suprapharyngeal respiratory tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an infection of the suprapharyngeal respiratory tract and the connecting structures of the suprapharyngeal respiratory tract.","meaning":"Boolean indicating whether the patient currently has infection of the suprapharyngeal respiratory tract and the connecting structures of the suprapharyngeal respiratory tract."} ;; "infection of the suprapharyngeal respiratory tract and the connecting structures of the suprapharyngeal respiratory tract"

(declare-const patient_has_finding_of_epiglottitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of epiglottitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of epiglottitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has epiglottitis.","meaning":"Boolean indicating whether the patient currently has epiglottitis."} ;; "epiglottitis"

(declare-const patient_has_finding_of_cellulitis_of_retropharyngeal_space_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cellulitis of the retropharyngeal space.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cellulitis of the retropharyngeal space.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cellulitis of the retropharyngeal space.","meaning":"Boolean indicating whether the patient currently has cellulitis of the retropharyngeal space."} ;; "retropharyngeal cellulitis"

(declare-const patient_has_finding_of_cellulitis_of_buccal_space_of_mouth_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cellulitis of the buccal space of the mouth.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cellulitis of the buccal space of the mouth.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cellulitis of the buccal space of the mouth.","meaning":"Boolean indicating whether the patient currently has cellulitis of the buccal space of the mouth."} ;; "buccal cellulitis"

(declare-const patient_has_finding_of_retropharyngeal_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of retropharyngeal abscess.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of retropharyngeal abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has retropharyngeal abscess.","meaning":"Boolean indicating whether the patient currently has retropharyngeal abscess."} ;; "abscess of the retropharynx"

(declare-const patient_has_finding_of_abscess_of_tonsil_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of abscess of the tonsil.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of abscess of the tonsil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abscess of the tonsil.","meaning":"Boolean indicating whether the patient currently has abscess of the tonsil."} ;; "abscess of the tonsil"

(declare-const patient_has_finding_of_peritonsillar_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of peritonsillar abscess.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of peritonsillar abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peritonsillar abscess.","meaning":"Boolean indicating whether the patient currently has peritonsillar abscess."} ;; "abscess of the peritonsillar area"

(declare-const patient_has_finding_of_sinusitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of sinusitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of sinusitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sinusitis.","meaning":"Boolean indicating whether the patient currently has sinusitis."} ;; "sinusitis"

(declare-const patient_has_finding_of_otitis_media_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of otitis media.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of otitis media.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has otitis media.","meaning":"Boolean indicating whether the patient currently has otitis media."} ;; "otitis media"

(declare-const patient_has_finding_of_orbital_cellulitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of orbital cellulitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of orbital cellulitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has orbital cellulitis.","meaning":"Boolean indicating whether the patient currently has orbital cellulitis."} ;; "orbital cellulitis"

(declare-const patient_has_finding_of_cellulitis_of_periorbital_area_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cellulitis of the periorbital area.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cellulitis of the periorbital area.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cellulitis of the periorbital area.","meaning":"Boolean indicating whether the patient currently has cellulitis of the periorbital area."} ;; "periorbital cellulitis"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term for deep tissues infection
(assert
(! (=> (or patient_has_finding_of_epiglottitis_now
          patient_has_finding_of_cellulitis_of_retropharyngeal_space_now
          patient_has_finding_of_cellulitis_of_buccal_space_of_mouth_now
          patient_has_finding_of_retropharyngeal_abscess_now
          patient_has_finding_of_abscess_of_tonsil_now
          patient_has_finding_of_peritonsillar_abscess_now)
    patient_has_finding_of_infection_of_deep_tissues_of_upper_respiratory_tract_now)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (epiglottitis OR retropharyngeal cellulitis OR buccal cellulitis OR abscess of the retropharynx OR abscess of the tonsil OR abscess of the peritonsillar area)"

;; Non-exhaustive examples imply umbrella term for suprapharyngeal infection
(assert
(! (=> (or patient_has_finding_of_sinusitis_now
          patient_has_finding_of_otitis_media_now
          patient_has_finding_of_orbital_cellulitis_now
          patient_has_finding_of_cellulitis_of_periorbital_area_now)
    patient_has_finding_of_infection_of_suprapharyngeal_respiratory_tract_now)
:named REQ2_AUXILIARY1)) ;; "with non-exhaustive examples (sinusitis OR otitis media OR orbital cellulitis OR periorbital cellulitis)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have infection of deep tissues of upper respiratory tract
(assert
(! (not patient_has_finding_of_infection_of_deep_tissues_of_upper_respiratory_tract_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has infection of the deep tissues of the upper respiratory tract..."

;; Exclusion: patient must NOT have infection of suprapharyngeal respiratory tract and connecting structures
(assert
(! (not patient_has_finding_of_infection_of_suprapharyngeal_respiratory_tract_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has infection of the suprapharyngeal respiratory tract and the connecting structures of the suprapharyngeal respiratory tract..."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_rheumatic_heart_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of rheumatic heart disease at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of rheumatic heart disease at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of rheumatic heart disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of rheumatic heart disease in their medical history."} ;; "history of rheumatic heart disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_rheumatic_heart_disease_inthehistory)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of rheumatic heart disease."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential, such as having reached menarche and not being postmenopausal or infertile.","when_to_set_to_false":"Set to false if the patient does not currently have childbearing potential, such as not having reached menarche, being postmenopausal, or otherwise infertile.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "the patient has reached menarche"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's current sex is female."} ;; "the patient is female"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_sex_is_female_now patient_has_childbearing_potential_now))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is female of childbearing potential (the patient has reached menarche))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_congenital_long_qt_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congenital long QT syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of congenital long QT syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of congenital long QT syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of congenital long QT syndrome."} ;; "congenital prolonged QT syndrome"
(declare-const patient_has_diagnosis_of_congenital_long_qt_syndrome_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of congenital long QT syndrome is known (documented or established).","when_to_set_to_false":"Set to false if the patient's diagnosis of congenital long QT syndrome is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diagnosis of congenital long QT syndrome is known.","meaning":"Boolean indicating whether the patient's diagnosis of congenital long QT syndrome is known (documented or established)."} ;; "known congenital prolonged QT syndrome"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_congenital_long_qt_syndrome_now@@known
       patient_has_diagnosis_of_congenital_long_qt_syndrome_now)
   :named REQ5_AUXILIARY0)) ;; "known congenital prolonged QT syndrome"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_congenital_long_qt_syndrome_now@@known)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known congenital prolonged QT syndrome."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_hypokalemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypokalemia.","when_to_set_to_false":"Set to false if the patient currently does not have hypokalemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypokalemia.","meaning":"Boolean indicating whether the patient currently has hypokalemia."} ;; "hypokalemia"
(declare-const patient_has_finding_of_hypokalemia_now@@known_or_suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypokalemia is known or suspected.","when_to_set_to_false":"Set to false if the patient's hypokalemia is neither known nor suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypokalemia is known or suspected.","meaning":"Boolean indicating whether the patient's hypokalemia is known or suspected."} ;; "known or suspected hypokalemia"
(declare-const patient_has_finding_of_hypokalemia_now@@uncorrected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypokalemia is uncorrected.","when_to_set_to_false":"Set to false if the patient's hypokalemia is corrected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypokalemia is uncorrected.","meaning":"Boolean indicating whether the patient's hypokalemia is uncorrected."} ;; "uncorrected hypokalemia"
(declare-const patient_serum_potassium_measurement_value_recorded_now_withunit_mmol_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's serum potassium concentration in mmol/L is available now.","when_to_set_to_null":"Set to null if no such measurement is available now or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum potassium concentration in mmol/L."} ;; "serum potassium concentration ≤ 3 mmol/L"
(declare-const patient_has_finding_of_hypomagnesemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypomagnesemia.","when_to_set_to_false":"Set to false if the patient currently does not have hypomagnesemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypomagnesemia.","meaning":"Boolean indicating whether the patient currently has hypomagnesemia."} ;; "hypomagnesemia"
(declare-const patient_has_finding_of_hypomagnesemia_now@@known_or_suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypomagnesemia is known or suspected.","when_to_set_to_false":"Set to false if the patient's hypomagnesemia is neither known nor suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypomagnesemia is known or suspected.","meaning":"Boolean indicating whether the patient's hypomagnesemia is known or suspected."} ;; "known or suspected hypomagnesemia"
(declare-const patient_has_finding_of_hypomagnesemia_now@@uncorrected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypomagnesemia is uncorrected.","when_to_set_to_false":"Set to false if the patient's hypomagnesemia is corrected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypomagnesemia is uncorrected.","meaning":"Boolean indicating whether the patient's hypomagnesemia is uncorrected."} ;; "uncorrected hypomagnesemia"
(declare-const patient_has_finding_of_bradycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bradycardia.","when_to_set_to_false":"Set to false if the patient currently does not have bradycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bradycardia.","meaning":"Boolean indicating whether the patient currently has bradycardia."} ;; "bradycardia"
(declare-const patient_has_finding_of_bradycardia_now@@known_or_suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bradycardia is known or suspected.","when_to_set_to_false":"Set to false if the patient's bradycardia is neither known nor suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bradycardia is known or suspected.","meaning":"Boolean indicating whether the patient's bradycardia is known or suspected."} ;; "known or suspected bradycardia"
(declare-const patient_has_finding_of_bradycardia_now@@uncorrected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bradycardia is uncorrected.","when_to_set_to_false":"Set to false if the patient's bradycardia is corrected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bradycardia is uncorrected.","meaning":"Boolean indicating whether the patient's bradycardia is uncorrected."} ;; "uncorrected bradycardia"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_hypokalemia_now@@known_or_suspected
      patient_has_finding_of_hypokalemia_now)
    :named REQ6_AUXILIARY0)) ;; "known or suspected hypokalemia"

(assert
(! (=> patient_has_finding_of_hypokalemia_now@@uncorrected
      patient_has_finding_of_hypokalemia_now)
    :named REQ6_AUXILIARY1)) ;; "uncorrected hypokalemia"

(assert
(! (=> patient_has_finding_of_hypomagnesemia_now@@known_or_suspected
      patient_has_finding_of_hypomagnesemia_now)
    :named REQ6_AUXILIARY2)) ;; "known or suspected hypomagnesemia"

(assert
(! (=> patient_has_finding_of_hypomagnesemia_now@@uncorrected
      patient_has_finding_of_hypomagnesemia_now)
    :named REQ6_AUXILIARY3)) ;; "uncorrected hypomagnesemia"

(assert
(! (=> patient_has_finding_of_bradycardia_now@@known_or_suspected
      patient_has_finding_of_bradycardia_now)
    :named REQ6_AUXILIARY4)) ;; "known or suspected bradycardia"

(assert
(! (=> patient_has_finding_of_bradycardia_now@@uncorrected
      patient_has_finding_of_bradycardia_now)
    :named REQ6_AUXILIARY5)) ;; "uncorrected bradycardia"

;; ===================== Constraint Assertions (REQ 6) =====================
;; 1. The patient is excluded if the patient has known or suspected uncorrected hypokalemia (serum potassium concentration ≤ 3 mmol/L).
(assert
(! (not (and patient_has_finding_of_hypokalemia_now@@known_or_suspected
             patient_has_finding_of_hypokalemia_now@@uncorrected
             (<= patient_serum_potassium_measurement_value_recorded_now_withunit_mmol_per_l 3)))
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known or suspected uncorrected hypokalemia (serum potassium concentration ≤ 3 mmol/L)."

;; 2. The patient is excluded if the patient has known or suspected uncorrected hypomagnesemia.
(assert
(! (not (and patient_has_finding_of_hypomagnesemia_now@@known_or_suspected
             patient_has_finding_of_hypomagnesemia_now@@uncorrected))
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known or suspected uncorrected hypomagnesemia."

;; 3. The patient is excluded if the patient has known or suspected uncorrected bradycardia (heart rate < 50 beats per minute).
;; Note: No heart rate variable provided in <new_variable_declarations>, so only use the available qualifiers.
(assert
(! (not (and patient_has_finding_of_bradycardia_now@@known_or_suspected
             patient_has_finding_of_bradycardia_now@@uncorrected))
    :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known or suspected uncorrected bradycardia (heart rate < 50 beats per minute)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_myasthenia_gravis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of myasthenia gravis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of myasthenia gravis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of myasthenia gravis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of myasthenia gravis."} ;; "myasthenia gravis"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_has_diagnosis_of_myasthenia_gravis_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has myasthenia gravis."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of creatinine clearance in milliliters per minute recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine clearance in milliliters per minute."} ;; "creatinine clearance ≤ 25 milliliters per minute"
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has impaired renal function.","when_to_set_to_false":"Set to false if the patient currently does not have impaired renal function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired renal function.","meaning":"Boolean indicating whether the patient currently has impaired renal function."} ;; "impaired renal function"
(declare-const patient_has_finding_of_renal_impairment_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impaired renal function is known/documented.","when_to_set_to_false":"Set to false if the patient's impaired renal function is not known/documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the impaired renal function is known.","meaning":"Boolean indicating whether the patient's impaired renal function is known/documented."} ;; "known impaired renal function"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_renal_impairment_now@@known
      patient_has_finding_of_renal_impairment_now)
:named REQ8_AUXILIARY0)) ;; "known impaired renal function"

;; Definition: known impaired renal function is present if creatinine clearance ≤ 25 mL/min
(assert
(! (= patient_has_finding_of_renal_impairment_now@@known
      (<= patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute 25))
:named REQ8_AUXILIARY1)) ;; "creatinine clearance ≤ 25 milliliters per minute"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_renal_impairment_now@@known)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known impaired renal function (creatinine clearance ≤ 25 milliliters per minute)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_exposed_to_cisapride_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to cisapride (e.g., taking or receiving cisapride as a treatment).","when_to_set_to_false":"Set to false if the patient is not currently being exposed to cisapride.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to cisapride.","meaning":"Boolean indicating whether the patient is currently being exposed to cisapride."} ;; "cisapride"
(declare-const patient_is_exposed_to_pimozide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to pimozide (e.g., taking or receiving pimozide as a treatment).","when_to_set_to_false":"Set to false if the patient is not currently being exposed to pimozide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to pimozide.","meaning":"Boolean indicating whether the patient is currently being exposed to pimozide."} ;; "pimozide"
(declare-const patient_is_exposed_to_astemizole_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to astemizole (e.g., taking or receiving astemizole as a treatment).","when_to_set_to_false":"Set to false if the patient is not currently being exposed to astemizole.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to astemizole.","meaning":"Boolean indicating whether the patient is currently being exposed to astemizole."} ;; "astemizole"
(declare-const patient_is_exposed_to_terfenadine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to terfenadine (e.g., taking or receiving terfenadine as a treatment).","when_to_set_to_false":"Set to false if the patient is not currently being exposed to terfenadine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to terfenadine.","meaning":"Boolean indicating whether the patient is currently being exposed to terfenadine."} ;; "terfenadine"
(declare-const patient_is_exposed_to_ergotamine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to ergotamine (e.g., taking or receiving ergotamine as a treatment).","when_to_set_to_false":"Set to false if the patient is not currently being exposed to ergotamine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to ergotamine.","meaning":"Boolean indicating whether the patient is currently being exposed to ergotamine."} ;; "ergotamine"
(declare-const patient_is_exposed_to_dihydroergotamine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to dihydroergotamine (e.g., taking or receiving dihydroergotamine as a treatment).","when_to_set_to_false":"Set to false if the patient is not currently being exposed to dihydroergotamine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to dihydroergotamine.","meaning":"Boolean indicating whether the patient is currently being exposed to dihydroergotamine."} ;; "dihydroergotamine"
(declare-const patient_is_exposed_to_class_ia_antiarrhythmic_agents_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to any Class IA antiarrhythmic agent (e.g., taking or receiving as a treatment).","when_to_set_to_false":"Set to false if the patient is not currently being exposed to any Class IA antiarrhythmic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to any Class IA antiarrhythmic agent.","meaning":"Boolean indicating whether the patient is currently being exposed to any Class IA antiarrhythmic agent."} ;; "Class IA antiarrhythmic agents"
(declare-const patient_is_exposed_to_quinidine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to quinidine (e.g., taking or receiving quinidine as a treatment).","when_to_set_to_false":"Set to false if the patient is not currently being exposed to quinidine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to quinidine.","meaning":"Boolean indicating whether the patient is currently being exposed to quinidine."} ;; "quinidine"
(declare-const patient_is_exposed_to_procainamide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to procainamide (e.g., taking or receiving procainamide as a treatment).","when_to_set_to_false":"Set to false if the patient is not currently being exposed to procainamide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to procainamide.","meaning":"Boolean indicating whether the patient is currently being exposed to procainamide."} ;; "procainamide"
(declare-const patient_is_exposed_to_class_iii_antiarrhythmic_agents_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to any Class III antiarrhythmic agent (e.g., taking or receiving as a treatment).","when_to_set_to_false":"Set to false if the patient is not currently being exposed to any Class III antiarrhythmic agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to any Class III antiarrhythmic agent.","meaning":"Boolean indicating whether the patient is currently being exposed to any Class III antiarrhythmic agent."} ;; "Class III antiarrhythmic agents"
(declare-const patient_is_exposed_to_dofetilide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to dofetilide (e.g., taking or receiving dofetilide as a treatment).","when_to_set_to_false":"Set to false if the patient is not currently being exposed to dofetilide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to dofetilide.","meaning":"Boolean indicating whether the patient is currently being exposed to dofetilide."} ;; "dofetilide"
(declare-const patient_is_exposed_to_simvastatin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to simvastatin (e.g., taking or receiving simvastatin as a treatment).","when_to_set_to_false":"Set to false if the patient is not currently being exposed to simvastatin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to simvastatin.","meaning":"Boolean indicating whether the patient is currently being exposed to simvastatin."} ;; "simvastatin"
(declare-const patient_is_exposed_to_lovastatin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to lovastatin (e.g., taking or receiving lovastatin as a treatment).","when_to_set_to_false":"Set to false if the patient is not currently being exposed to lovastatin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to lovastatin.","meaning":"Boolean indicating whether the patient is currently being exposed to lovastatin."} ;; "lovastatin"
(declare-const patient_is_exposed_to_atorvastatin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being exposed to atorvastatin (e.g., taking or receiving atorvastatin as a treatment).","when_to_set_to_false":"Set to false if the patient is not currently being exposed to atorvastatin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being exposed to atorvastatin.","meaning":"Boolean indicating whether the patient is currently being exposed to atorvastatin."} ;; "atorvastatin"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Non-exhaustive examples imply Class IA antiarrhythmic agent exposure
(assert
(! (=> (or patient_is_exposed_to_quinidine_now
           patient_is_exposed_to_procainamide_now)
       patient_is_exposed_to_class_ia_antiarrhythmic_agents_now)
    :named REQ9_AUXILIARY0)) ;; "Class IA antiarrhythmic agents with non-exhaustive examples (quinidine OR procainamide)"

;; Non-exhaustive examples imply Class III antiarrhythmic agent exposure
(assert
(! (=> patient_is_exposed_to_dofetilide_now
       patient_is_exposed_to_class_iii_antiarrhythmic_agents_now)
    :named REQ9_AUXILIARY1)) ;; "Class III antiarrhythmic agents with non-exhaustive examples (dofetilide)"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exhaustive subcategories define the umbrella: being treated with drugs not permitted by the study protocol
(assert
(! (not (or patient_is_exposed_to_cisapride_now
            patient_is_exposed_to_pimozide_now
            patient_is_exposed_to_astemizole_now
            patient_is_exposed_to_terfenadine_now
            patient_is_exposed_to_ergotamine_now
            patient_is_exposed_to_dihydroergotamine_now
            patient_is_exposed_to_class_ia_antiarrhythmic_agents_now
            patient_is_exposed_to_class_iii_antiarrhythmic_agents_now
            patient_is_exposed_to_simvastatin_now
            patient_is_exposed_to_lovastatin_now
            patient_is_exposed_to_atorvastatin_now))
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is being treated with drugs not permitted by the study protocol with exhaustive subcategories (cisapride OR pimozide OR astemizole OR terfenadine OR ergotamine OR dihydroergotamine OR Class IA antiarrhythmic agents with non-exhaustive examples (quinidine OR procainamide) OR Class III antiarrhythmic agents with non-exhaustive examples (dofetilide) OR simvastatin OR lovastatin OR atorvastatin)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_exposed_to_antibacterial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with antibacterials.","when_to_set_to_false":"Set to false if the patient is currently not being treated with antibacterials.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with antibacterials.","meaning":"Boolean indicating whether the patient is currently exposed to antibacterials."} ;; "the patient is currently being treated with systemic antibacterials"
(declare-const patient_is_exposed_to_antibacterial_now@@systemic Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to systemic antibacterials.","when_to_set_to_false":"Set to false if the patient is currently exposed to antibacterials but they are not systemic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibacterials are systemic.","meaning":"Boolean indicating whether the antibacterials the patient is currently exposed to are systemic."} ;; "systemic antibacterials"
(declare-const patient_is_exposed_to_antibacterial_inthepast14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to antibacterials within the past fourteen days prior to enrollment.","when_to_set_to_false":"Set to false if the patient was not exposed to antibacterials within the past fourteen days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to antibacterials within the past fourteen days prior to enrollment.","meaning":"Boolean indicating whether the patient was exposed to antibacterials within the past fourteen days."} ;; "the patient has been treated with systemic antibacterials within fourteen days prior to enrollment"
(declare-const patient_is_exposed_to_antibacterial_inthepast14days@@systemic Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to systemic antibacterials within the past fourteen days prior to enrollment.","when_to_set_to_false":"Set to false if the patient was exposed to antibacterials within the past fourteen days but they are not systemic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibacterials are systemic.","meaning":"Boolean indicating whether the antibacterials the patient was exposed to within the past fourteen days are systemic."} ;; "systemic antibacterials within fourteen days prior to enrollment"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable (current exposure)
(assert
(! (=> patient_is_exposed_to_antibacterial_now@@systemic
       patient_is_exposed_to_antibacterial_now)
   :named REQ10_AUXILIARY0)) ;; "systemic antibacterials" implies "antibacterials"

;; Qualifier variable implies corresponding stem variable (past 14 days exposure)
(assert
(! (=> patient_is_exposed_to_antibacterial_inthepast14days@@systemic
       patient_is_exposed_to_antibacterial_inthepast14days)
   :named REQ10_AUXILIARY1)) ;; "systemic antibacterials within fourteen days" implies "antibacterials within fourteen days"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient must NOT be currently treated with systemic antibacterials
(assert
(! (not patient_is_exposed_to_antibacterial_now@@systemic)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient is currently being treated with systemic antibacterials"

;; Exclusion: patient must NOT have been treated with systemic antibacterials within fourteen days prior to enrollment
(assert
(! (not patient_is_exposed_to_antibacterial_inthepast14days@@systemic)
   :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has been treated with systemic antibacterials within fourteen days prior to enrollment"

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past thirty days prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past thirty days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past thirty days prior to enrollment.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past thirty days prior to enrollment."} ;; "has been treated with any investigational medication within thirty days prior to enrollment"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient was exposed within the past thirty days prior to enrollment is investigational.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient was exposed within the past thirty days prior to enrollment is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament to which the patient was exposed within the past thirty days prior to enrollment is investigational.","meaning":"Boolean indicating whether the drug or medicament to which the patient was exposed within the past thirty days prior to enrollment is investigational."} ;; "investigational medication within thirty days prior to enrollment"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational
      patient_is_exposed_to_drug_or_medicament_inthepast30days)
:named REQ11_AUXILIARY0)) ;; "investigational medication within thirty days prior to enrollment"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been treated with any investigational medication within thirty days prior to enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_taken_rifampicin_containing_product_inthepast14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any rifampicin-containing product within the past fourteen days prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not taken any rifampicin-containing product within the past fourteen days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any rifampicin-containing product within the past fourteen days prior to enrollment.","meaning":"Boolean indicating whether the patient has taken any rifampicin-containing product within the past fourteen days prior to enrollment."} ;; "the patient has been treated with rifampicin within fourteen days prior to enrollment"
(declare-const patient_has_taken_phenytoin_containing_product_inthepast14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any phenytoin-containing product within the past fourteen days prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not taken any phenytoin-containing product within the past fourteen days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any phenytoin-containing product within the past fourteen days prior to enrollment.","meaning":"Boolean indicating whether the patient has taken any phenytoin-containing product within the past fourteen days prior to enrollment."} ;; "the patient has been treated with phenytoin within fourteen days prior to enrollment"
(declare-const patient_has_taken_carbamazepine_containing_product_inthepast14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any carbamazepine-containing product within the past fourteen days prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not taken any carbamazepine-containing product within the past fourteen days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any carbamazepine-containing product within the past fourteen days prior to enrollment.","meaning":"Boolean indicating whether the patient has taken any carbamazepine-containing product within the past fourteen days prior to enrollment."} ;; "the patient has been treated with carbamazepine within fourteen days prior to enrollment"
(declare-const patient_is_exposed_to_hypericum_perforatum_extract_inthepast14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to hypericum perforatum extract (St. John's wort) within the past fourteen days prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not been exposed to hypericum perforatum extract (St. John's wort) within the past fourteen days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to hypericum perforatum extract (St. John's wort) within the past fourteen days prior to enrollment.","meaning":"Boolean indicating whether the patient has been exposed to hypericum perforatum extract (St. John's wort) within the past fourteen days prior to enrollment."} ;; "the patient has been treated with St. John's wort within fourteen days prior to enrollment"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_taken_rifampicin_containing_product_inthepast14days)
:named REQ12_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has been treated with rifampicin within fourteen days prior to enrollment"
(assert
(! (not patient_has_taken_phenytoin_containing_product_inthepast14days)
:named REQ12_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has been treated with phenytoin within fourteen days prior to enrollment"
(assert
(! (not patient_has_taken_carbamazepine_containing_product_inthepast14days)
:named REQ12_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has been treated with carbamazepine within fourteen days prior to enrollment"
(assert
(! (not patient_is_exposed_to_hypericum_perforatum_extract_inthepast14days)
:named REQ12_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has been treated with St. John's wort within fourteen days prior to enrollment"

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_history_of_hypersensitivity_to_macrolides Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to macrolide antibiotics.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity to macrolide antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to macrolide antibiotics.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to macrolide antibiotics."} ;; "the patient has a history of hypersensitivity to macrolides"
(declare-const patient_has_history_of_intolerance_to_macrolides Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of intolerance to macrolide antibiotics.","when_to_set_to_false":"Set to false if the patient does not have a documented history of intolerance to macrolide antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of intolerance to macrolide antibiotics.","meaning":"Boolean indicating whether the patient has a history of intolerance to macrolide antibiotics."} ;; "the patient has a history of intolerance to macrolides"
(declare-const patient_has_history_of_hypersensitivity_to_penicillins Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to penicillin antibiotics.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity to penicillin antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to penicillin antibiotics.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to penicillin antibiotics."} ;; "the patient has a history of hypersensitivity to penicillins"
(declare-const patient_has_history_of_intolerance_to_penicillins Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of intolerance to penicillin antibiotics.","when_to_set_to_false":"Set to false if the patient does not have a documented history of intolerance to penicillin antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of intolerance to penicillin antibiotics.","meaning":"Boolean indicating whether the patient has a history of intolerance to penicillin antibiotics."} ;; "the patient has a history of intolerance to penicillins"
(declare-const patient_has_history_of_hypersensitivity_to_cephalosporins Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to cephalosporin antibiotics.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity to cephalosporin antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to cephalosporin antibiotics.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to cephalosporin antibiotics."} ;; "the patient has a history of hypersensitivity to cephalosporins"
(declare-const patient_has_history_of_intolerance_to_cephalosporins Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of intolerance to cephalosporin antibiotics.","when_to_set_to_false":"Set to false if the patient does not have a documented history of intolerance to cephalosporin antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of intolerance to cephalosporin antibiotics.","meaning":"Boolean indicating whether the patient has a history of intolerance to cephalosporin antibiotics."} ;; "the patient has a history of intolerance to cephalosporins"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_history_of_hypersensitivity_to_macrolides)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to macrolides."

(assert
(! (not patient_has_history_of_intolerance_to_macrolides)
:named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of intolerance to macrolides."

(assert
(! (not patient_has_history_of_hypersensitivity_to_penicillins)
:named REQ13_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to penicillins."

(assert
(! (not patient_has_history_of_intolerance_to_penicillins)
:named REQ13_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of intolerance to penicillins."

(assert
(! (not patient_has_history_of_hypersensitivity_to_cephalosporins)
:named REQ13_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to cephalosporins."

(assert
(! (not patient_has_history_of_intolerance_to_cephalosporins)
:named REQ13_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of intolerance to cephalosporins."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_previous_enrollment_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously enrolled in this study at any time prior to the current enrollment.","when_to_set_to_false":"Set to false if it is known that the patient has never previously enrolled in this study prior to the current enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously enrolled in this study.","meaning":"Boolean indicating whether the patient has previously enrolled in this study at any time prior to the current enrollment."} ;; "the patient has previous enrollment in this study"
(declare-const patient_has_previous_enrollment_in_this_study@@prior_to_current_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's previous enrollment in this study occurred prior to the current enrollment.","when_to_set_to_false":"Set to false if the patient's previous enrollment in this study did not occur prior to the current enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's previous enrollment in this study occurred prior to the current enrollment.","meaning":"Boolean indicating whether the patient's previous enrollment in this study occurred prior to the current enrollment."} ;; "previous enrollment in this study occurred prior to the current enrollment"
(declare-const patient_is_exposed_to_telithromycin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to telithromycin at any time in the past, including any previous treatment or administration.","when_to_set_to_false":"Set to false if it is known that the patient has never been exposed to telithromycin at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to telithromycin.","meaning":"Boolean indicating whether the patient has ever been exposed to telithromycin at any time in the past."} ;; "previous treatment with telithromycin"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_previous_enrollment_in_this_study@@prior_to_current_enrollment
      patient_has_previous_enrollment_in_this_study)
   :named REQ14_AUXILIARY0)) ;; "previous enrollment in this study occurred prior to the current enrollment"

;; ===================== Constraint Assertions (REQ 14) =====================
;; Exclusion: patient must NOT have previous enrollment in this study OR previous treatment with telithromycin
(assert
(! (not (or patient_has_previous_enrollment_in_this_study
            patient_is_exposed_to_telithromycin_inthehistory))
   :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has previous enrollment in this study) OR (the patient has previous treatment with telithromycin)."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "child"
(declare-const patient_is_child_of_protocol_staff_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a child of any protocol staff member, including the investigator, subinvestigator, research assistant, pharmacist, study coordinator, other staff, or anyone directly involved in the conduct of the protocol.","when_to_set_to_false":"Set to false if the patient is currently not a child of any protocol staff member as defined.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a child of any protocol staff member as defined.","meaning":"Boolean indicating whether the patient is currently a child of any protocol staff member as defined."} ;; "child of (the investigator OR the subinvestigator OR the research assistant OR the pharmacist OR the study coordinator OR other staff OR anyone directly involved in the conduct of the protocol)"
(declare-const patient_is_relative_of_protocol_staff_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a relative (other than child) of any protocol staff member, including the investigator, subinvestigator, research assistant, pharmacist, study coordinator, other staff, or anyone directly involved in the conduct of the protocol.","when_to_set_to_false":"Set to false if the patient is currently not a relative (other than child) of any protocol staff member as defined.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a relative (other than child) of any protocol staff member as defined.","meaning":"Boolean indicating whether the patient is currently a relative (other than child) of any protocol staff member as defined."} ;; "relative of (the investigator OR the subinvestigator OR the research assistant OR the pharmacist OR the study coordinator OR other staff OR anyone directly involved in the conduct of the protocol)"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not (or patient_is_child_of_protocol_staff_now
            patient_is_relative_of_protocol_staff_now))
    :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a child or relative of (the investigator OR the subinvestigator OR the research assistant OR the pharmacist OR the study coordinator OR other staff OR anyone directly involved in the conduct of the protocol)."
