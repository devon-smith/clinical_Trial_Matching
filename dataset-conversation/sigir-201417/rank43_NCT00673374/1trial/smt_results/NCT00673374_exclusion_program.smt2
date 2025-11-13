;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_undergoing_computerized_axial_tomography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a computed tomography (CT) procedure.","when_to_set_to_false":"Set to false if the patient is currently not undergoing a computed tomography (CT) procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a computed tomography (CT) procedure.","meaning":"Boolean indicating whether the patient is currently undergoing computed tomography (CT)."} ;; "computed tomography"
(declare-const patient_is_undergoing_computerized_axial_tomography_now@@indication_is_non_exhaustive_examples_or_not_meeting_main_definition Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing computed tomography (CT) and the indication is one of the non-exhaustive examples (isolated vomiting, fever without source, staging of malignancies, isolated flank pain, suspected renal colic) or other indications not meeting the main definition.","when_to_set_to_false":"Set to false if the patient is currently undergoing CT but the indication does not match any of the specified examples or is not excluded by the main definition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the indication for CT matches the specified examples or exclusion criteria.","meaning":"Boolean indicating whether the patient is currently undergoing CT for an excluded indication as defined by the requirement."} ;; "indication for CT is one of the non-exhaustive examples (isolated vomiting, fever without source, staging of malignancies, isolated flank pain, suspected renal colic) or other indications that do not meet the main definition"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_computerized_axial_tomography_now@@indication_is_non_exhaustive_examples_or_not_meeting_main_definition
      patient_is_undergoing_computerized_axial_tomography_now)
:named REQ0_AUXILIARY0)) ;; "indication for CT is one of the non-exhaustive examples ... or other indications that do not meet the above definition"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_undergoing_computerized_axial_tomography_now@@indication_is_non_exhaustive_examples_or_not_meeting_main_definition)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is undergoing computed tomography for indications with non-exhaustive examples ((isolated vomiting) OR (fever without source) OR (staging of malignancies) OR (isolated flank pain) OR (suspected renal colic) OR (other indications that do NOT meet the above definition))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_altered_mental_status_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of altered mental status.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of altered mental status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has altered mental status.","meaning":"Boolean indicating whether the patient currently has altered mental status."} ;; "altered mental status"
(declare-const patient_has_finding_of_altered_abdominal_sensation_due_to_neurological_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has altered abdominal sensation that is due to neurological conditions.","when_to_set_to_false":"Set to false if the patient currently does not have altered abdominal sensation due to neurological conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has altered abdominal sensation due to neurological conditions.","meaning":"Boolean indicating whether the patient currently has altered abdominal sensation due to neurological conditions."} ;; "altered abdominal sensation due to neurological conditions"
(declare-const patient_has_finding_of_paraplegia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of paraplegia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of paraplegia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has paraplegia.","meaning":"Boolean indicating whether the patient currently has paraplegia."} ;; "paraplegia"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive example: paraplegia is one example of neurological conditions causing altered abdominal sensation
(assert
(! (=> patient_has_finding_of_paraplegia_now
      patient_has_finding_of_altered_abdominal_sensation_due_to_neurological_conditions_now)
    :named REQ2_AUXILIARY0)) ;; "due to neurological conditions with non-exhaustive examples (paraplegia)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have altered mental status
(assert
(! (not patient_has_finding_of_altered_mental_status_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has altered mental status."

;; Exclusion: patient must NOT have altered abdominal sensation due to neurological conditions that may prevent assessment of the location of abdominal tenderness
(assert
(! (not patient_has_finding_of_altered_abdominal_sensation_due_to_neurological_conditions_now)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has altered abdominal sensation due to neurological conditions with non-exhaustive examples (paraplegia) that may prevent assessment of the location of abdominal tenderness."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "preverbal child"
(declare-const patient_is_preverbal_child_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a preverbal child.","when_to_set_to_false":"Set to false if the patient is currently not a preverbal child.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a preverbal child.","meaning":"Boolean indicating whether the patient is currently a preverbal child."} ;; "preverbal child"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_preverbal_child_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a preverbal child."
