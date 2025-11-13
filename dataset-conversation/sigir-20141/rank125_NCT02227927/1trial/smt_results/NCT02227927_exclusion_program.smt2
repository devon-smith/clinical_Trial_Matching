;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_cardiac_arrhythmia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient does not have a documented history of cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of cardiac arrhythmia.","meaning":"Boolean indicating whether the patient has a history of cardiac arrhythmia."} ;; "has a history of arrhythmia"
(declare-const patient_has_finding_of_cardiac_arrhythmia_inthehistory@@excludes_only_minor_forms_of_ectopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of cardiac arrhythmia excludes only minor forms of ectopy (e.g., premature atrial contractions).","when_to_set_to_false":"Set to false if the patient's history of cardiac arrhythmia does not exclude only minor forms of ectopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether only minor forms of ectopy are excluded from the arrhythmia definition.","meaning":"Boolean indicating whether the arrhythmia definition excludes only minor forms of ectopy (e.g., premature atrial contractions)."} ;; "arrhythmia other than only minor forms of ectopy (e.g., premature atrial contractions)" in history

(declare-const patient_has_finding_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has cardiac arrhythmia."} ;; "currently has arrhythmia"
(declare-const patient_has_finding_of_cardiac_arrhythmia_now@@excludes_only_minor_forms_of_ectopy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cardiac arrhythmia excludes only minor forms of ectopy (e.g., premature atrial contractions).","when_to_set_to_false":"Set to false if the patient's current cardiac arrhythmia does not exclude only minor forms of ectopy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether only minor forms of ectopy are excluded from the arrhythmia definition.","meaning":"Boolean indicating whether the arrhythmia definition excludes only minor forms of ectopy (e.g., premature atrial contractions)."} ;; "arrhythmia other than only minor forms of ectopy (e.g., premature atrial contractions)" currently

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable for history
(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_inthehistory@@excludes_only_minor_forms_of_ectopy
      patient_has_finding_of_cardiac_arrhythmia_inthehistory)
:named REQ0_AUXILIARY0)) ;; "arrhythmia other than only minor forms of ectopy (e.g., premature atrial contractions)" in history

;; Qualifier variable implies corresponding stem variable for current
(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_now@@excludes_only_minor_forms_of_ectopy
      patient_has_finding_of_cardiac_arrhythmia_now)
:named REQ0_AUXILIARY1)) ;; "arrhythmia other than only minor forms of ectopy (e.g., premature atrial contractions)" currently

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have a history of arrhythmia other than only minor forms of ectopy
(assert
(! (not patient_has_finding_of_cardiac_arrhythmia_inthehistory@@excludes_only_minor_forms_of_ectopy)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of arrhythmia other than only minor forms of ectopy (e.g., premature atrial contractions)."

;; Exclusion: patient must NOT currently have arrhythmia other than only minor forms of ectopy
(assert
(! (not patient_has_finding_of_cardiac_arrhythmia_now@@excludes_only_minor_forms_of_ectopy)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently has arrhythmia other than only minor forms of ectopy (e.g., premature atrial contractions)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_bradycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bradycardia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bradycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bradycardia.","meaning":"Boolean indicating whether the patient currently has bradycardia."} ;; "bradycardia"
(declare-const patient_has_finding_of_bradycardia_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bradycardia is clinically significant.","when_to_set_to_false":"Set to false if the patient's bradycardia is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bradycardia is clinically significant.","meaning":"Boolean indicating whether the patient's bradycardia is clinically significant."} ;; "clinically significant bradycardia"
(declare-const patient_has_finding_of_sinus_node_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of sinus node dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of sinus node dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sinus node dysfunction.","meaning":"Boolean indicating whether the patient currently has sinus node dysfunction."} ;; "sinus node dysfunction"
(declare-const patient_has_finding_of_sinus_node_dysfunction_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sinus node dysfunction is clinically significant.","when_to_set_to_false":"Set to false if the patient's sinus node dysfunction is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's sinus node dysfunction is clinically significant.","meaning":"Boolean indicating whether the patient's sinus node dysfunction is clinically significant."} ;; "clinically significant sinus node dysfunction"
(declare-const patient_has_finding_of_heart_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of heart block.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of heart block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart block.","meaning":"Boolean indicating whether the patient currently has heart block."} ;; "heart block"
(declare-const patient_has_finding_of_heart_block_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's heart block is clinically significant.","when_to_set_to_false":"Set to false if the patient's heart block is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart block is clinically significant.","meaning":"Boolean indicating whether the patient's heart block is clinically significant."} ;; "clinically significant heart block"
(declare-const patient_has_finding_of_prolonged_qt_interval_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of prolonged QTc interval.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of prolonged QTc interval.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has prolonged QTc interval.","meaning":"Boolean indicating whether the patient currently has prolonged QTc interval."} ;; "prolonged QTc interval"
(declare-const patient_has_finding_of_prolonged_qt_interval_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prolonged QTc interval is clinically significant.","when_to_set_to_false":"Set to false if the patient's prolonged QTc interval is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's prolonged QTc interval is clinically significant.","meaning":"Boolean indicating whether the patient's prolonged QTc interval is clinically significant."} ;; "clinically significant prolonged QTc interval"
(declare-const patient_qt_interval_feature_value_recorded_now_withunit_milliseconds Real) ;; {"when_to_set_to_value":"Set to the measured QTc interval value in milliseconds if recorded now.","when_to_set_to_null":"Set to null if no QTc interval measurement in milliseconds is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's QTc interval in milliseconds recorded now."} ;; "QTc interval"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male, other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} ;; "the patient is female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female, other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} ;; "the patient is male"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_bradycardia_now@@clinically_significant
       patient_has_finding_of_bradycardia_now)
   :named REQ1_AUXILIARY0)) ;; "clinically significant bradycardia"

(assert
(! (=> patient_has_finding_of_sinus_node_dysfunction_now@@clinically_significant
       patient_has_finding_of_sinus_node_dysfunction_now)
   :named REQ1_AUXILIARY1)) ;; "clinically significant sinus node dysfunction"

(assert
(! (=> patient_has_finding_of_heart_block_now@@clinically_significant
       patient_has_finding_of_heart_block_now)
   :named REQ1_AUXILIARY2)) ;; "clinically significant heart block"

(assert
(! (=> patient_has_finding_of_prolonged_qt_interval_now@@clinically_significant
       patient_has_finding_of_prolonged_qt_interval_now)
   :named REQ1_AUXILIARY3)) ;; "clinically significant prolonged QTc interval"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have clinically significant bradycardia
(assert
(! (not patient_has_finding_of_bradycardia_now@@clinically_significant)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant bradycardia."

;; Exclusion: patient must NOT have clinically significant sinus node dysfunction
(assert
(! (not patient_has_finding_of_sinus_node_dysfunction_now@@clinically_significant)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant sinus node dysfunction."

;; Exclusion: patient must NOT have clinically significant heart block
(assert
(! (not patient_has_finding_of_heart_block_now@@clinically_significant)
   :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant heart block."

;; Exclusion: patient must NOT have clinically significant prolonged QTc interval AND ((male AND QTc > 450 ms) OR (female AND QTc > 470 ms))
(assert
(! (not (and patient_has_finding_of_prolonged_qt_interval_now@@clinically_significant
             (or (and patient_sex_is_male_now
                      (> patient_qt_interval_feature_value_recorded_now_withunit_milliseconds 450))
                 (and patient_sex_is_female_now
                      (> patient_qt_interval_feature_value_recorded_now_withunit_milliseconds 470)))))
   :named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant prolonged QTc interval AND ((the patient is male AND QTc interval > 450 milliseconds) OR (the patient is female AND QTc interval > 470 milliseconds))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disorder_of_electrolytes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of electrolytes.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of electrolytes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of electrolytes.","meaning":"Boolean indicating whether the patient currently has a disorder of electrolytes."} ;; "electrolyte disorder"
(declare-const patient_has_finding_of_disorder_of_electrolytes_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of electrolytes is clinically significant.","when_to_set_to_false":"Set to false if the patient's current disorder of electrolytes is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of electrolytes is clinically significant.","meaning":"Boolean indicating whether the patient's current disorder of electrolytes is clinically significant."} ;; "clinically significant electrolyte disorder"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_electrolytes_now@@clinically_significant
       patient_has_finding_of_disorder_of_electrolytes_now)
   :named REQ2_AUXILIARY0)) ;; "clinically significant electrolyte disorder" implies "electrolyte disorder"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_disorder_of_electrolytes_now@@clinically_significant)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant electrolyte disorder."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_gastrointestinal_hemorrhage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of gastrointestinal hemorrhage.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of gastrointestinal hemorrhage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has gastrointestinal hemorrhage.","meaning":"Boolean indicating whether the patient currently has gastrointestinal hemorrhage."} ;; "gastrointestinal hemorrhage"
(declare-const patient_has_finding_of_gastrointestinal_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of gastrointestinal obstruction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of gastrointestinal obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has gastrointestinal obstruction.","meaning":"Boolean indicating whether the patient currently has gastrointestinal obstruction."} ;; "gastrointestinal obstruction"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_finding_of_gastrointestinal_hemorrhage_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has gastrointestinal hemorrhage."

(assert
  (! (not patient_has_finding_of_gastrointestinal_obstruction_now)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has gastrointestinal obstruction."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_prolactinoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of prolactinoma (prolactin-releasing pituitary tumor).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of prolactinoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has prolactinoma.","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of prolactinoma."} ;; "prolactinoma (prolactin-releasing pituitary tumor)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_finding_of_prolactinoma_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has prolactinoma (prolactin-releasing pituitary tumor)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently pregnant.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "pregnant female"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breastfeeding.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "breastfeeding female"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a pregnant female."

(assert
(! (not patient_is_breastfeeding_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a breastfeeding female."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_allergy_to_domperidone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy to domperidone.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy to domperidone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to domperidone.","meaning":"Boolean indicating whether the patient currently has an allergy to domperidone."} ;; "allergy to domperidone"
(declare-const patient_has_finding_of_allergy_to_domperidone_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to domperidone is known (documented or established).","when_to_set_to_false":"Set to false if the patient's allergy to domperidone is not known (not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to domperidone is known.","meaning":"Boolean indicating whether the patient's allergy to domperidone is known."} ;; "known allergy to domperidone"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_allergy_to_domperidone_now@@known
      patient_has_finding_of_allergy_to_domperidone_now)
:named REQ6_AUXILIARY0)) ;; "known allergy to domperidone" implies "allergy to domperidone"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_allergy_to_domperidone_now@@known)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known allergy to domperidone."
