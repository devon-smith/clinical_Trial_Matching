;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_tonsillitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of tonsillitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of tonsillitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tonsillitis.","meaning":"Boolean indicating whether the patient currently has tonsillitis."} ;; "tonsillitis"
(declare-const patient_has_finding_of_tonsillitis_now@@nonstreptococcal Bool) ;; {"when_to_set_to_true":"Set to true if the patient's tonsillitis is nonstreptococcal.","when_to_set_to_false":"Set to false if the patient's tonsillitis is streptococcal or of unknown etiology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tonsillitis is nonstreptococcal.","meaning":"Boolean indicating whether the patient's tonsillitis is nonstreptococcal."} ;; "nonstreptococcal tonsillitis"
(declare-const patient_has_finding_of_pharyngitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pharyngitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pharyngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pharyngitis.","meaning":"Boolean indicating whether the patient currently has pharyngitis."} ;; "pharyngitis"
(declare-const patient_has_finding_of_pharyngitis_now@@nonstreptococcal Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pharyngitis is nonstreptococcal.","when_to_set_to_false":"Set to false if the patient's pharyngitis is streptococcal or of unknown etiology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pharyngitis is nonstreptococcal.","meaning":"Boolean indicating whether the patient's pharyngitis is nonstreptococcal."} ;; "nonstreptococcal pharyngitis"
(declare-const patient_has_finding_of_laryngitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of laryngitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of laryngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has laryngitis.","meaning":"Boolean indicating whether the patient currently has laryngitis."} ;; "laryngitis"
(declare-const patient_has_finding_of_coryza_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of coryza.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of coryza.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has coryza.","meaning":"Boolean indicating whether the patient currently has coryza."} ;; "coryza"
(declare-const patient_has_finding_of_conjunctivitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of conjunctivitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of conjunctivitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has conjunctivitis.","meaning":"Boolean indicating whether the patient currently has conjunctivitis."} ;; "conjunctivitis"
(declare-const patient_has_finding_of_diarrhea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of diarrhea.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of diarrhea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diarrhea.","meaning":"Boolean indicating whether the patient currently has diarrhea."} ;; "diarrhea"
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cough.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."} ;; "cough"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term (tonsillitis)
(assert
(! (=> (or patient_has_finding_of_laryngitis_now
           patient_has_finding_of_coryza_now
           patient_has_finding_of_conjunctivitis_now
           patient_has_finding_of_diarrhea_now
           patient_has_finding_of_cough_now)
    patient_has_finding_of_tonsillitis_now@@nonstreptococcal)
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples (laryngitis, coryza, conjunctivitis, diarrhea, cough)" for nonstreptococcal tonsillitis

;; Non-exhaustive examples imply umbrella term (pharyngitis)
(assert
(! (=> (or patient_has_finding_of_laryngitis_now
           patient_has_finding_of_coryza_now
           patient_has_finding_of_conjunctivitis_now
           patient_has_finding_of_diarrhea_now
           patient_has_finding_of_cough_now)
    patient_has_finding_of_pharyngitis_now@@nonstreptococcal)
:named REQ0_AUXILIARY1)) ;; "with non-exhaustive examples (laryngitis, coryza, conjunctivitis, diarrhea, cough)" for nonstreptococcal pharyngitis

;; Qualifier variables imply corresponding stem variables (tonsillitis)
(assert
(! (=> patient_has_finding_of_tonsillitis_now@@nonstreptococcal
       patient_has_finding_of_tonsillitis_now)
:named REQ0_AUXILIARY2)) ;; "nonstreptococcal tonsillitis" implies "tonsillitis"

;; Qualifier variables imply corresponding stem variables (pharyngitis)
(assert
(! (=> patient_has_finding_of_pharyngitis_now@@nonstreptococcal
       patient_has_finding_of_pharyngitis_now)
:named REQ0_AUXILIARY3)) ;; "nonstreptococcal pharyngitis" implies "pharyngitis"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_tonsillitis_now@@nonstreptococcal)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptoms that collectively suggest nonstreptococcal tonsillitis with non-exhaustive examples (laryngitis, coryza, conjunctivitis, diarrhea, cough)."

(assert
(! (not patient_has_finding_of_pharyngitis_now@@nonstreptococcal)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptoms that collectively suggest nonstreptococcal pharyngitis with non-exhaustive examples (laryngitis, coryza, conjunctivitis, diarrhea, cough)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_throat_culture_inthehistory_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a throat culture in their history with a positive result.","when_to_set_to_false":"Set to false if the patient has never had a throat culture in their history with a positive result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a throat culture in their history with a positive result.","meaning":"Boolean indicating whether the patient has ever had a positive throat culture in their history."} ;; "history of positive throat culture"
(declare-const patient_has_undergone_throat_culture_inthehistory_outcome_is_positive@@for_streptococcus_pyogenes Bool) ;; {"when_to_set_to_true":"Set to true if the positive throat culture in the patient's history was specifically for Streptococcus pyogenes.","when_to_set_to_false":"Set to false if the positive throat culture in the patient's history was not for Streptococcus pyogenes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the positive throat culture in the patient's history was for Streptococcus pyogenes.","meaning":"Boolean indicating whether the positive throat culture in history was for Streptococcus pyogenes."} ;; "for Streptococcus pyogenes"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_throat_culture_inthehistory_outcome_is_positive@@for_streptococcus_pyogenes
      patient_has_undergone_throat_culture_inthehistory_outcome_is_positive)
:named REQ1_AUXILIARY0)) ;; "throat culture for Streptococcus pyogenes"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: history of positive throat culture for Streptococcus pyogenes AND NO clinical signs/symptoms of tonsillitis AND NO clinical signs/symptoms of pharyngitis
(assert
(! (not (and patient_has_undergone_throat_culture_inthehistory_outcome_is_positive@@for_streptococcus_pyogenes
             (not patient_has_finding_of_tonsillitis_now)
             (not patient_has_finding_of_pharyngitis_now)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of positive throat culture for Streptococcus pyogenes) AND (the patient does NOT have clinical signs and symptoms of tonsillitis) AND (the patient does NOT have clinical signs and symptoms of pharyngitis)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_infection_of_deep_tissues_of_upper_respiratory_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has infection of the deep tissues of the upper respiratory tract.","when_to_set_to_false":"Set to false if the patient currently does not have infection of the deep tissues of the upper respiratory tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has infection of the deep tissues of the upper respiratory tract.","meaning":"Boolean indicating whether the patient currently has infection of the deep tissues of the upper respiratory tract."} ;; "infection of the deep tissues of the upper respiratory tract"
(declare-const patient_has_finding_of_epiglottitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has epiglottitis.","when_to_set_to_false":"Set to false if the patient currently does not have epiglottitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has epiglottitis.","meaning":"Boolean indicating whether the patient currently has epiglottitis."} ;; "epiglottitis"
(declare-const patient_has_finding_of_retropharyngeal_cellulitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has retropharyngeal cellulitis.","when_to_set_to_false":"Set to false if the patient currently does not have retropharyngeal cellulitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has retropharyngeal cellulitis.","meaning":"Boolean indicating whether the patient currently has retropharyngeal cellulitis."} ;; "retropharyngeal cellulitis"
(declare-const patient_has_finding_of_cellulitis_of_buccal_space_of_mouth_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cellulitis of the buccal space of the mouth.","when_to_set_to_false":"Set to false if the patient currently does not have cellulitis of the buccal space of the mouth.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cellulitis of the buccal space of the mouth.","meaning":"Boolean indicating whether the patient currently has cellulitis of the buccal space of the mouth."} ;; "buccal cellulitis"
(declare-const patient_has_finding_of_retropharyngeal_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a retropharyngeal abscess.","when_to_set_to_false":"Set to false if the patient currently does not have a retropharyngeal abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a retropharyngeal abscess.","meaning":"Boolean indicating whether the patient currently has a retropharyngeal abscess."} ;; "abscess of the retropharynx"
(declare-const patient_has_finding_of_abscess_of_tonsil_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abscess of the tonsil.","when_to_set_to_false":"Set to false if the patient currently does not have an abscess of the tonsil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abscess of the tonsil.","meaning":"Boolean indicating whether the patient currently has an abscess of the tonsil."} ;; "abscess of the tonsil"
(declare-const patient_has_finding_of_peritonsillar_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a peritonsillar abscess.","when_to_set_to_false":"Set to false if the patient currently does not have a peritonsillar abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a peritonsillar abscess.","meaning":"Boolean indicating whether the patient currently has a peritonsillar abscess."} ;; "abscess of the peritonsillar area"
(declare-const patient_has_finding_of_infection_of_suprapharyngeal_respiratory_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has infection of the suprapharyngeal respiratory tract.","when_to_set_to_false":"Set to false if the patient currently does not have infection of the suprapharyngeal respiratory tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has infection of the suprapharyngeal respiratory tract.","meaning":"Boolean indicating whether the patient currently has infection of the suprapharyngeal respiratory tract."} ;; "infection of the suprapharyngeal respiratory tract"
(declare-const patient_has_finding_of_infection_of_connecting_structures_of_suprapharyngeal_respiratory_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has infection of the connecting structures of the suprapharyngeal respiratory tract.","when_to_set_to_false":"Set to false if the patient currently does not have infection of the connecting structures of the suprapharyngeal respiratory tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has infection of the connecting structures of the suprapharyngeal respiratory tract.","meaning":"Boolean indicating whether the patient currently has infection of the connecting structures of the suprapharyngeal respiratory tract."} ;; "infection of the connecting structures of the suprapharyngeal respiratory tract"
(declare-const patient_has_finding_of_sinusitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sinusitis.","when_to_set_to_false":"Set to false if the patient currently does not have sinusitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sinusitis.","meaning":"Boolean indicating whether the patient currently has sinusitis."} ;; "sinusitis"
(declare-const patient_has_finding_of_otitis_media_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has otitis media.","when_to_set_to_false":"Set to false if the patient currently does not have otitis media.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has otitis media.","meaning":"Boolean indicating whether the patient currently has otitis media."} ;; "otitis media"
(declare-const patient_has_finding_of_orbital_cellulitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has orbital cellulitis.","when_to_set_to_false":"Set to false if the patient currently does not have orbital cellulitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has orbital cellulitis.","meaning":"Boolean indicating whether the patient currently has orbital cellulitis."} ;; "orbital cellulitis"
(declare-const patient_has_finding_of_periorbital_cellulitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has periorbital cellulitis.","when_to_set_to_false":"Set to false if the patient currently does not have periorbital cellulitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has periorbital cellulitis.","meaning":"Boolean indicating whether the patient currently has periorbital cellulitis."} ;; "periorbital cellulitis"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term for deep tissues of upper respiratory tract
(assert
(! (=> (or patient_has_finding_of_epiglottitis_now
          patient_has_finding_of_retropharyngeal_cellulitis_now
          patient_has_finding_of_cellulitis_of_buccal_space_of_mouth_now
          patient_has_finding_of_retropharyngeal_abscess_now
          patient_has_finding_of_abscess_of_tonsil_now
          patient_has_finding_of_peritonsillar_abscess_now)
        patient_has_finding_of_infection_of_deep_tissues_of_upper_respiratory_tract_now)
    :named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (epiglottitis, retropharyngeal cellulitis, buccal cellulitis, abscess of the retropharynx, abscess of the tonsil, abscess of the peritonsillar area)"

;; Non-exhaustive examples imply umbrella term for connecting structures of suprapharyngeal respiratory tract
(assert
(! (=> (or patient_has_finding_of_sinusitis_now
          patient_has_finding_of_otitis_media_now
          patient_has_finding_of_orbital_cellulitis_now
          patient_has_finding_of_periorbital_cellulitis_now)
        patient_has_finding_of_infection_of_connecting_structures_of_suprapharyngeal_respiratory_tract_now)
    :named REQ2_AUXILIARY1)) ;; "with non-exhaustive examples (sinusitis, otitis media, orbital cellulitis, periorbital cellulitis)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have any of the three infection types
(assert
(! (not patient_has_finding_of_infection_of_deep_tissues_of_upper_respiratory_tract_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has infection of the deep tissues of the upper respiratory tract with non-exhaustive examples..."

(assert
(! (not patient_has_finding_of_infection_of_suprapharyngeal_respiratory_tract_now)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has infection of the suprapharyngeal respiratory tract."

(assert
(! (not patient_has_finding_of_infection_of_connecting_structures_of_suprapharyngeal_respiratory_tract_now)
    :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has infection of the connecting structures of the suprapharyngeal respiratory tract with non-exhaustive examples..."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_rheumatic_heart_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with rheumatic heart disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with rheumatic heart disease at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with rheumatic heart disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of rheumatic heart disease in their history."} ;; "rheumatic heart disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_rheumatic_heart_disease_inthehistory)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of rheumatic heart disease."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_congenital_long_qt_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congenital long QT syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of congenital long QT syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of congenital long QT syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of congenital long QT syndrome."} ;; "congenital prolonged QT syndrome"
(declare-const patient_has_diagnosis_of_congenital_long_qt_syndrome_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congenital long QT syndrome and this diagnosis is known (documented or recognized).","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of congenital long QT syndrome but it is not known (not documented or not recognized).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of congenital long QT syndrome is known.","meaning":"Boolean indicating whether the diagnosis of congenital long QT syndrome is known to the patient or provider."} ;; "known congenital prolonged QT syndrome"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_congenital_long_qt_syndrome_now@@known
      patient_has_diagnosis_of_congenital_long_qt_syndrome_now)
   :named REQ4_AUXILIARY0)) ;; "known congenital prolonged QT syndrome"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_congenital_long_qt_syndrome_now@@known)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known congenital prolonged QT syndrome."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_hypokalemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypokalemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypokalemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypokalemia.","meaning":"Boolean indicating whether the patient currently has hypokalemia."} ;; "hypokalemia"
(declare-const patient_has_finding_of_hypokalemia_now@@known_or_suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypokalemia is known or suspected.","when_to_set_to_false":"Set to false if the patient's current hypokalemia is neither known nor suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hypokalemia is known or suspected.","meaning":"Boolean indicating whether the patient's current hypokalemia is known or suspected."} ;; "known or suspected hypokalemia"
(declare-const patient_has_finding_of_hypokalemia_now@@uncorrected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypokalemia is uncorrected.","when_to_set_to_false":"Set to false if the patient's current hypokalemia is corrected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hypokalemia is uncorrected.","meaning":"Boolean indicating whether the patient's current hypokalemia is uncorrected."} ;; "uncorrected hypokalemia"
(declare-const patient_serum_potassium_measurement_value_recorded_now_withunit_mmol_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if a current serum potassium concentration in mmol/L is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current serum potassium concentration in mmol/L."} ;; "serum potassium concentration ≤ 3 mmol/L"
(declare-const patient_has_finding_of_hypomagnesemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypomagnesemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypomagnesemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypomagnesemia.","meaning":"Boolean indicating whether the patient currently has hypomagnesemia."} ;; "hypomagnesemia"
(declare-const patient_has_finding_of_hypomagnesemia_now@@known_or_suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypomagnesemia is known or suspected.","when_to_set_to_false":"Set to false if the patient's current hypomagnesemia is neither known nor suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hypomagnesemia is known or suspected.","meaning":"Boolean indicating whether the patient's current hypomagnesemia is known or suspected."} ;; "known or suspected hypomagnesemia"
(declare-const patient_has_finding_of_hypomagnesemia_now@@uncorrected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypomagnesemia is uncorrected.","when_to_set_to_false":"Set to false if the patient's current hypomagnesemia is corrected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hypomagnesemia is uncorrected.","meaning":"Boolean indicating whether the patient's current hypomagnesemia is uncorrected."} ;; "uncorrected hypomagnesemia"
(declare-const patient_has_finding_of_bradycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bradycardia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bradycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bradycardia.","meaning":"Boolean indicating whether the patient currently has bradycardia."} ;; "bradycardia"
(declare-const patient_has_finding_of_bradycardia_now@@known_or_suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bradycardia is known or suspected.","when_to_set_to_false":"Set to false if the patient's current bradycardia is neither known nor suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bradycardia is known or suspected.","meaning":"Boolean indicating whether the patient's current bradycardia is known or suspected."} ;; "known or suspected bradycardia"
(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if a current heart rate in beats per minute is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current heart rate in beats per minute."} ;; "heart rate < 50 beats per minute"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_hypokalemia_now@@known_or_suspected
       patient_has_finding_of_hypokalemia_now)
   :named REQ5_AUXILIARY0)) ;; "known or suspected hypokalemia"

(assert
(! (=> patient_has_finding_of_hypokalemia_now@@uncorrected
       patient_has_finding_of_hypokalemia_now)
   :named REQ5_AUXILIARY1)) ;; "uncorrected hypokalemia"

(assert
(! (=> patient_has_finding_of_hypomagnesemia_now@@known_or_suspected
       patient_has_finding_of_hypomagnesemia_now)
   :named REQ5_AUXILIARY2)) ;; "known or suspected hypomagnesemia"

(assert
(! (=> patient_has_finding_of_hypomagnesemia_now@@uncorrected
       patient_has_finding_of_hypomagnesemia_now)
   :named REQ5_AUXILIARY3)) ;; "uncorrected hypomagnesemia"

(assert
(! (=> patient_has_finding_of_bradycardia_now@@known_or_suspected
       patient_has_finding_of_bradycardia_now)
   :named REQ5_AUXILIARY4)) ;; "known or suspected bradycardia"

;; Numeric definition for bradycardia
(assert
(! (=> (< patient_heart_rate_value_recorded_now_withunit_beats_per_minute 50)
       patient_has_finding_of_bradycardia_now)
   :named REQ5_AUXILIARY5)) ;; "heart rate < 50 beats per minute"

;; Numeric definition for hypokalemia (serum potassium ≤ 3 mmol/L)
(assert
(! (=> (<= patient_serum_potassium_measurement_value_recorded_now_withunit_mmol_per_l 3)
       patient_has_finding_of_hypokalemia_now)
   :named REQ5_AUXILIARY6)) ;; "serum potassium concentration ≤ 3 mmol/L"

;; ===================== Constraint Assertions (REQ 5) =====================
;; 1. Exclusion for known or suspected uncorrected hypokalemia (serum potassium ≤ 3 mmol/L)
(assert
(! (not (and patient_has_finding_of_hypokalemia_now@@known_or_suspected
             patient_has_finding_of_hypokalemia_now@@uncorrected
             (<= patient_serum_potassium_measurement_value_recorded_now_withunit_mmol_per_l 3)))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known or suspected uncorrected hypokalemia (serum potassium concentration ≤ 3 mmol/L)."

;; 2. Exclusion for known or suspected uncorrected hypomagnesemia
(assert
(! (not (and patient_has_finding_of_hypomagnesemia_now@@known_or_suspected
             patient_has_finding_of_hypomagnesemia_now@@uncorrected))
   :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known or suspected uncorrected hypomagnesemia."

;; 3. Exclusion for known or suspected bradycardia (heart rate < 50 beats per minute)
(assert
(! (not (and patient_has_finding_of_bradycardia_now@@known_or_suspected
             (< patient_heart_rate_value_recorded_now_withunit_beats_per_minute 50)))
   :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known or suspected bradycardia (heart rate < 50 beats per minute)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const creatinine_clearance_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's creatinine clearance measured now, in milliliters per minute.","when_to_set_to_null":"Set to null if the patient's creatinine clearance value measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's creatinine clearance measured now, in milliliters per minute."} ;; "creatinine clearance ≤ 25 milliliters per minute"

(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of impaired renal function.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of impaired renal function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired renal function.","meaning":"Boolean indicating whether the patient currently has impaired renal function."} ;; "impaired renal function"

(declare-const patient_has_finding_of_renal_impairment_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impaired renal function is known (documented or established in the medical record).","when_to_set_to_false":"Set to false if the patient's impaired renal function is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the impaired renal function is known.","meaning":"Boolean indicating whether the patient's impaired renal function is known (documented or established)."} ;; "known impaired renal function"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_renal_impairment_now@@known
      patient_has_finding_of_renal_impairment_now)
:named REQ6_AUXILIARY0)) ;; "known impaired renal function"

;; Definition: known impaired renal function is present if creatinine clearance ≤ 25 mL/min
(assert
(! (= patient_has_finding_of_renal_impairment_now@@known
      (<= creatinine_clearance_value_recorded_now_withunit_milliliters_per_minute 25))
:named REQ6_AUXILIARY1)) ;; "as shown by creatinine clearance ≤25 mL/min"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_renal_impairment_now@@known)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known impaired renal function (creatinine clearance ≤ 25 milliliters per minute)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_myasthenia_gravis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of myasthenia gravis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of myasthenia gravis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of myasthenia gravis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of myasthenia gravis."} ;; "myasthenia gravis"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_diagnosis_of_myasthenia_gravis_now)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has myasthenia gravis."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_history_of_hypersensitivity_to_macrolides Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to macrolides.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity to macrolides.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to macrolides.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to macrolides."} ;; "history of hypersensitivity to macrolides"
(declare-const patient_has_history_of_hypersensitivity_to_penicillins Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to penicillins.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity to penicillins.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to penicillins.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to penicillins."} ;; "history of hypersensitivity to penicillins"
(declare-const patient_has_history_of_hypersensitivity_to_cephalosporins Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity to cephalosporins.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity to cephalosporins.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity to cephalosporins.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity to cephalosporins."} ;; "history of hypersensitivity to cephalosporins"
(declare-const patient_has_history_of_intolerance_to_macrolides Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of intolerance to macrolides.","when_to_set_to_false":"Set to false if the patient does not have a documented history of intolerance to macrolides.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of intolerance to macrolides.","meaning":"Boolean indicating whether the patient has a history of intolerance to macrolides."} ;; "history of intolerance to macrolides"
(declare-const patient_has_history_of_intolerance_to_penicillins Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of intolerance to penicillins.","when_to_set_to_false":"Set to false if the patient does not have a documented history of intolerance to penicillins.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of intolerance to penicillins.","meaning":"Boolean indicating whether the patient has a history of intolerance to penicillins."} ;; "history of intolerance to penicillins"
(declare-const patient_has_history_of_intolerance_to_cephalosporins Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of intolerance to cephalosporins.","when_to_set_to_false":"Set to false if the patient does not have a documented history of intolerance to cephalosporins.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of intolerance to cephalosporins.","meaning":"Boolean indicating whether the patient has a history of intolerance to cephalosporins."} ;; "history of intolerance to cephalosporins"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_history_of_hypersensitivity_to_macrolides)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to macrolides."

(assert
(! (not patient_has_history_of_hypersensitivity_to_penicillins)
    :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to penicillins."

(assert
(! (not patient_has_history_of_hypersensitivity_to_cephalosporins)
    :named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity to cephalosporins."

(assert
(! (not patient_has_history_of_intolerance_to_macrolides)
    :named REQ8_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of intolerance to macrolides."

(assert
(! (not patient_has_history_of_intolerance_to_penicillins)
    :named REQ8_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of intolerance to penicillins."

(assert
(! (not patient_has_history_of_intolerance_to_cephalosporins)
    :named REQ8_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of intolerance to cephalosporins."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_previous_enrollment_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously been enrolled in this study.","when_to_set_to_false":"Set to false if the patient has not previously been enrolled in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously been enrolled in this study.","meaning":"Boolean indicating whether the patient has previously been enrolled in this study."} ;; "the patient has previous enrollment in this study"
(declare-const patient_has_previous_treatment_with_telithromycin Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously received treatment with telithromycin.","when_to_set_to_false":"Set to false if the patient has not previously received treatment with telithromycin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously received treatment with telithromycin.","meaning":"Boolean indicating whether the patient has previously received treatment with telithromycin."} ;; "the patient has previous treatment with telithromycin"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not patient_has_previous_enrollment_in_this_study)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous enrollment in this study."

(assert
  (! (not patient_has_previous_treatment_with_telithromycin)
     :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous treatment with telithromycin."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_is_child_of_investigator_or_subinvestigator_or_research_assistant_or_pharmacist_or_study_coordinator_or_staff_directly_involved_in_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a child of the investigator, subinvestigator, research assistant, pharmacist, study coordinator, or any other staff directly involved in the conduct of the protocol.","when_to_set_to_false":"Set to false if the patient is not a child of any of the above staff.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a child of any of the above staff.","meaning":"Boolean indicating whether the patient is a child of the investigator, subinvestigator, research assistant, pharmacist, study coordinator, or any other staff directly involved in the conduct of the protocol."} ;; "child of the investigator, subinvestigator, research assistant, pharmacist, study coordinator, or any other staff directly involved in the conduct of the protocol"

(declare-const patient_is_child_of_relative_of_investigator_or_subinvestigator_or_research_assistant_or_pharmacist_or_study_coordinator_or_staff_directly_involved_in_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a child of a relative of the investigator, subinvestigator, research assistant, pharmacist, study coordinator, or any other staff directly involved in the conduct of the protocol.","when_to_set_to_false":"Set to false if the patient is not a child of a relative of any of the above staff.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a child of a relative of any of the above staff.","meaning":"Boolean indicating whether the patient is a child of a relative of the investigator, subinvestigator, research assistant, pharmacist, study coordinator, or any other staff directly involved in the conduct of the protocol."} ;; "child of a relative of the investigator, subinvestigator, research assistant, pharmacist, study coordinator, or any other staff directly involved in the conduct of the protocol"

(declare-const patient_is_relative_of_investigator_or_subinvestigator_or_research_assistant_or_pharmacist_or_study_coordinator_or_staff_directly_involved_in_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a relative of the investigator, subinvestigator, research assistant, pharmacist, study coordinator, or any other staff directly involved in the conduct of the protocol.","when_to_set_to_false":"Set to false if the patient is not a relative of any of the above staff.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a relative of any of the above staff.","meaning":"Boolean indicating whether the patient is a relative of the investigator, subinvestigator, research assistant, pharmacist, study coordinator, or any other staff directly involved in the conduct of the protocol."} ;; "relative of the investigator, subinvestigator, research assistant, pharmacist, study coordinator, or any other staff directly involved in the conduct of the protocol"

(declare-const patient_is_relative_of_relative_of_investigator_or_subinvestigator_or_research_assistant_or_pharmacist_or_study_coordinator_or_staff_directly_involved_in_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a relative of a relative of the investigator, subinvestigator, research assistant, pharmacist, study coordinator, or any other staff directly involved in the conduct of the protocol.","when_to_set_to_false":"Set to false if the patient is not a relative of a relative of any of the above staff.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a relative of a relative of any of the above staff.","meaning":"Boolean indicating whether the patient is a relative of a relative of the investigator, subinvestigator, research assistant, pharmacist, study coordinator, or any other staff directly involved in the conduct of the protocol."} ;; "relative of a relative of the investigator, subinvestigator, research assistant, pharmacist, study coordinator, or any other staff directly involved in the conduct of the protocol"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (or patient_is_child_of_investigator_or_subinvestigator_or_research_assistant_or_pharmacist_or_study_coordinator_or_staff_directly_involved_in_protocol
            patient_is_child_of_relative_of_investigator_or_subinvestigator_or_research_assistant_or_pharmacist_or_study_coordinator_or_staff_directly_involved_in_protocol
            patient_is_relative_of_investigator_or_subinvestigator_or_research_assistant_or_pharmacist_or_study_coordinator_or_staff_directly_involved_in_protocol
            patient_is_relative_of_relative_of_investigator_or_subinvestigator_or_research_assistant_or_pharmacist_or_study_coordinator_or_staff_directly_involved_in_protocol))
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a child or relative of the investigator, subinvestigator, research assistant, pharmacist, study coordinator, or any other staff directly involved in the conduct of the protocol, or is a child or relative of a relative of any such staff directly involved in the conduct of the protocol."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_exposed_to_antibacterial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with systemic antibacterial medication.","when_to_set_to_false":"Set to false if the patient is currently not being treated with systemic antibacterial medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with systemic antibacterial medication.","meaning":"Boolean indicating whether the patient is currently exposed to antibacterial agents."} ;; "the patient is currently being treated with systemic antibacterial medication"

(declare-const patient_is_exposed_to_antibacterial_now@@administered_systemically_as_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to antibacterial agents is via systemic administration as medication.","when_to_set_to_false":"Set to false if the patient's current exposure to antibacterial agents is not via systemic administration as medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is via systemic administration as medication.","meaning":"Boolean indicating whether the patient's current exposure to antibacterial agents is via systemic administration as medication."} ;; "systemic antibacterial medication (current)"

(declare-const patient_is_exposed_to_antibacterial_inthepast14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been treated with systemic antibacterial medication within the fourteen days prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not been treated with systemic antibacterial medication within the fourteen days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been treated with systemic antibacterial medication within the fourteen days prior to enrollment.","meaning":"Boolean indicating whether the patient was exposed to antibacterial agents within the past 14 days."} ;; "the patient has been treated with systemic antibacterial medication within fourteen days prior to enrollment"

(declare-const patient_is_exposed_to_antibacterial_inthepast14days@@administered_systemically_as_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to antibacterial agents within the past 14 days was via systemic administration as medication.","when_to_set_to_false":"Set to false if the patient's exposure to antibacterial agents within the past 14 days was not via systemic administration as medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure within the past 14 days was via systemic administration as medication.","meaning":"Boolean indicating whether the patient's exposure to antibacterial agents within the past 14 days was via systemic administration as medication."} ;; "systemic antibacterial medication (within 14 days prior to enrollment)"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variables imply corresponding stem variables (current)
(assert
(! (=> patient_is_exposed_to_antibacterial_now@@administered_systemically_as_medication
      patient_is_exposed_to_antibacterial_now)
:named REQ11_AUXILIARY0)) ;; "systemic antibacterial medication (current)"

;; Qualifier variables imply corresponding stem variables (past 14 days)
(assert
(! (=> patient_is_exposed_to_antibacterial_inthepast14days@@administered_systemically_as_medication
      patient_is_exposed_to_antibacterial_inthepast14days)
:named REQ11_AUXILIARY1)) ;; "systemic antibacterial medication (within 14 days prior to enrollment)"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion: patient must NOT be currently treated with systemic antibacterial medication
(assert
(! (not patient_is_exposed_to_antibacterial_now@@administered_systemically_as_medication)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient is currently being treated with systemic antibacterial medication"

;; Exclusion: patient must NOT have been treated with systemic antibacterial medication within 14 days prior to enrollment
(assert
(! (not patient_is_exposed_to_antibacterial_inthepast14days@@administered_systemically_as_medication)
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has been treated with systemic antibacterial medication within fourteen days prior to enrollment"

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament within the past thirty days.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament within the past thirty days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament within the past thirty days.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament within the past thirty days."} ;; "medication"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient was exposed within the past thirty days is investigational.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient was exposed within the past thirty days is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament to which the patient was exposed within the past thirty days is investigational.","meaning":"Boolean indicating whether the drug or medicament to which the patient was exposed within the past thirty days is investigational."} ;; "investigational medication within the last thirty days"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@investigational
      patient_is_exposed_to_drug_or_medicament_inthepast30days)
:named REQ12_AUXILIARY0)) ;; "investigational medication within the last thirty days"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_inthepast30days@@investigational)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been treated with any investigational medication within the last thirty days."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_taken_rifampin_containing_product_inthepast14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a rifampin-containing product within the past 14 days.","when_to_set_to_false":"Set to false if the patient has not taken a rifampin-containing product within the past 14 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a rifampin-containing product within the past 14 days.","meaning":"Boolean indicating whether the patient has taken a rifampin-containing product within the past 14 days."} ;; "the patient has been treated with rifampicin within the last fourteen days"
(declare-const patient_has_taken_phenytoin_containing_product_inthepast14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a phenytoin-containing product within the past 14 days.","when_to_set_to_false":"Set to false if the patient has not taken a phenytoin-containing product within the past 14 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a phenytoin-containing product within the past 14 days.","meaning":"Boolean indicating whether the patient has taken a phenytoin-containing product within the past 14 days."} ;; "the patient has been treated with phenytoin within the last fourteen days"
(declare-const patient_has_taken_carbamazepine_containing_product_inthepast14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a carbamazepine-containing product within the past 14 days.","when_to_set_to_false":"Set to false if the patient has not taken a carbamazepine-containing product within the past 14 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a carbamazepine-containing product within the past 14 days.","meaning":"Boolean indicating whether the patient has taken a carbamazepine-containing product within the past 14 days."} ;; "the patient has been treated with carbamazepine within the last fourteen days"
(declare-const patient_is_exposed_to_hypericum_perforatum_extract_inthepast14days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to Hypericum perforatum extract (St. John's wort) within the past 14 days.","when_to_set_to_false":"Set to false if the patient has not been exposed to Hypericum perforatum extract (St. John's wort) within the past 14 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to Hypericum perforatum extract (St. John's wort) within the past 14 days.","meaning":"Boolean indicating whether the patient has been exposed to Hypericum perforatum extract (St. John's wort) within the past 14 days."} ;; "the patient has been treated with St. John's wort within the last fourteen days"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_taken_rifampin_containing_product_inthepast14days)
:named REQ13_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has been treated with rifampicin within the last fourteen days."

(assert
(! (not patient_has_taken_phenytoin_containing_product_inthepast14days)
:named REQ13_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has been treated with phenytoin within the last fourteen days."

(assert
(! (not patient_has_taken_carbamazepine_containing_product_inthepast14days)
:named REQ13_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has been treated with carbamazepine within the last fourteen days."

(assert
(! (not patient_is_exposed_to_hypericum_perforatum_extract_inthepast14days)
:named REQ13_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has been treated with St. John's wort within the last fourteen days."
