;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chronic_pharyngitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic pharyngitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic pharyngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic pharyngitis.","meaning":"Boolean indicating whether the patient currently has chronic pharyngitis."} ;; "chronic pharyngitis"
(declare-const patient_has_finding_of_chronic_pharyngitis_now@@mild_severity Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic pharyngitis is mild in severity.","when_to_set_to_false":"Set to false if the patient's chronic pharyngitis is not mild in severity (i.e., moderate or severe).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic pharyngitis is mild.","meaning":"Boolean indicating whether the patient's chronic pharyngitis is mild in severity."} ;; "mild chronic pharyngitis"
(declare-const patient_has_primary_pathology_of_upper_aero_digestive_tract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a primary pathology located in the upper aero-digestive tract.","when_to_set_to_false":"Set to false if the patient currently does not have a primary pathology located in the upper aero-digestive tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a primary pathology located in the upper aero-digestive tract.","meaning":"Boolean indicating whether the patient currently has a primary pathology located in the upper aero-digestive tract."} ;; "primary pathology of the upper aero-digestive tract"
(declare-const patient_has_primary_pathology_of_upper_aero_digestive_tract_now@@not_mild_chronic_pharyngitis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's primary pathology located in the upper aero-digestive tract is NOT mild chronic pharyngitis.","when_to_set_to_false":"Set to false if the patient's primary pathology located in the upper aero-digestive tract is mild chronic pharyngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's primary pathology located in the upper aero-digestive tract is NOT mild chronic pharyngitis.","meaning":"Boolean indicating whether the patient's primary pathology located in the upper aero-digestive tract is NOT mild chronic pharyngitis."} ;; "primary pathology is NOT mild chronic pharyngitis"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable for chronic pharyngitis
(assert
(! (=> patient_has_finding_of_chronic_pharyngitis_now@@mild_severity
       patient_has_finding_of_chronic_pharyngitis_now)
   :named REQ0_AUXILIARY0)) ;; "mild chronic pharyngitis"

;; Qualifier variable implies stem variable for upper aero-digestive tract pathology
(assert
(! (=> patient_has_primary_pathology_of_upper_aero_digestive_tract_now@@not_mild_chronic_pharyngitis
       patient_has_primary_pathology_of_upper_aero_digestive_tract_now)
   :named REQ0_AUXILIARY1)) ;; "primary pathology is NOT mild chronic pharyngitis"

;; Definition: The primary pathology of upper aero-digestive tract is NOT mild chronic pharyngitis
(assert
(! (= patient_has_primary_pathology_of_upper_aero_digestive_tract_now@@not_mild_chronic_pharyngitis
      (and patient_has_primary_pathology_of_upper_aero_digestive_tract_now
           (not patient_has_finding_of_chronic_pharyngitis_now@@mild_severity)))
   :named REQ0_AUXILIARY2)) ;; "the primary pathology is NOT mild chronic pharyngitis"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_primary_pathology_of_upper_aero_digestive_tract_now@@not_mild_chronic_pharyngitis)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a primary pathology of the upper aero-digestive tract) AND (the primary pathology is NOT mild chronic pharyngitis)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_vocal_cord_paralysis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis or finding of vocal cord paralysis at any time in their history (i.e., prior to study entry/intervention).","when_to_set_to_false":"Set to false if the patient has never had a diagnosis or finding of vocal cord paralysis in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had vocal cord paralysis.","meaning":"Boolean indicating whether the patient has ever had vocal cord paralysis in their history."} ;; "pre-existing vocal cord paralysis"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_vocal_cord_paralysis_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pre-existing vocal cord paralysis."
