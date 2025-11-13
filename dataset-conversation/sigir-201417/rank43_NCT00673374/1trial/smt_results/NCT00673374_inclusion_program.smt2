;; ===================== Declarations for the inclusion criteria (REQ 0) =====================
(declare-const patient_is_emergency_department_patient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an emergency department patient.","when_to_set_to_false":"Set to false if the patient is not currently an emergency department patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an emergency department patient.","meaning":"Boolean indicating whether the patient is currently an emergency department patient."}  ;; "To be included, the patient must be an emergency department patient."

(declare-const patient_is_undergoing_ct_of_abdomen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing an abdominal computed tomography (CT) scan.","when_to_set_to_false":"Set to false if the patient is not currently undergoing an abdominal computed tomography (CT) scan.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing an abdominal computed tomography (CT) scan.","meaning":"Boolean indicating whether the patient is currently undergoing an abdominal computed tomography (CT) scan."}  ;; "To be included, the patient must be undergoing abdominal computed tomography for (non-traumatic abdominal pain AND abdominal tenderness)."

(declare-const patient_is_undergoing_ct_of_abdomen_now@@performed_for_non_traumatic_abdominal_pain_and_abdominal_tenderness Bool) ;; {"when_to_set_to_true":"Set to true if the abdominal CT scan is being performed specifically for non-traumatic abdominal pain and abdominal tenderness.","when_to_set_to_false":"Set to false if the abdominal CT scan is not being performed for non-traumatic abdominal pain and abdominal tenderness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abdominal CT scan is being performed for non-traumatic abdominal pain and abdominal tenderness.","meaning":"Boolean indicating whether the abdominal CT scan is being performed for non-traumatic abdominal pain and abdominal tenderness."}  ;; "To be included, the patient must be undergoing abdominal computed tomography for (non-traumatic abdominal pain AND abdominal tenderness)."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for CT scan implies the stem variable (if CT is being performed for the indication, then CT is being performed)
(assert
  (! (=> patient_is_undergoing_ct_of_abdomen_now@@performed_for_non_traumatic_abdominal_pain_and_abdominal_tenderness
         patient_is_undergoing_ct_of_abdomen_now)
     :named REQ0_AUXILIARY0)) ;; "abdominal CT scan for non-traumatic abdominal pain and abdominal tenderness" implies "abdominal CT scan"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must be an emergency department patient
(assert
  (! patient_is_emergency_department_patient_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be an emergency department patient."

;; Component 1: Patient must be undergoing abdominal CT for non-traumatic abdominal pain AND abdominal tenderness
(assert
  (! patient_is_undergoing_ct_of_abdomen_now@@performed_for_non_traumatic_abdominal_pain_and_abdominal_tenderness
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be undergoing abdominal computed tomography for (non-traumatic abdominal pain AND abdominal tenderness)."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_abdominal_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abdominal pain.","when_to_set_to_false":"Set to false if the patient currently does not have abdominal pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abdominal pain.","meaning":"Boolean indicating whether the patient currently has abdominal pain."}  ;; "To be included, the patient must have abdominal pain."
(declare-const patient_has_finding_of_abdominal_tenderness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has abdominal tenderness.","when_to_set_to_false":"Set to false if the patient currently does not have abdominal tenderness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abdominal tenderness.","meaning":"Boolean indicating whether the patient currently has abdominal tenderness."}  ;; "To be included, the patient must have abdominal tenderness."
(declare-const patient_has_finding_of_tenderness_to_direct_palpation_in_region_anterior_to_mid_axillary_line_bilaterally_extending_from_costal_margins_to_inguinal_ligaments_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tenderness to direct palpation in the region anterior to the mid-axillary line bilaterally and extending from the costal margins to the inguinal ligaments.","when_to_set_to_false":"Set to false if the patient currently does not have tenderness to direct palpation in the region anterior to the mid-axillary line bilaterally and extending from the costal margins to the inguinal ligaments.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tenderness to direct palpation in the region anterior to the mid-axillary line bilaterally and extending from the costal margins to the inguinal ligaments.","meaning":"Boolean indicating whether the patient currently has tenderness to direct palpation in the region anterior to the mid-axillary line bilaterally and extending from the costal margins to the inguinal ligaments."}  ;; "abdominal tenderness is defined as (pain AND tenderness to direct palpation in the region anterior to the mid-axillary line bilaterally AND extending from the costal margins to the inguinal ligaments)."

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: abdominal tenderness is defined as (abdominal pain AND tenderness to direct palpation in the region anterior to the mid-axillary line bilaterally and extending from the costal margins to the inguinal ligaments)
(assert
  (! (= patient_has_finding_of_abdominal_tenderness_now
        (and patient_has_finding_of_abdominal_pain_now
             patient_has_finding_of_tenderness_to_direct_palpation_in_region_anterior_to_mid_axillary_line_bilaterally_extending_from_costal_margins_to_inguinal_ligaments_now))
     :named REQ1_AUXILIARY0)) ;; "abdominal tenderness is defined as (pain AND tenderness to direct palpation in the region anterior to the mid-axillary line bilaterally AND extending from the costal margins to the inguinal ligaments)."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have abdominal pain.
(assert
  (! patient_has_finding_of_abdominal_pain_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have abdominal pain."

;; Component 1: To be included, the patient must have abdominal tenderness (as defined above).
(assert
  (! patient_has_finding_of_abdominal_tenderness_now
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have abdominal tenderness, where abdominal tenderness is defined as (pain AND tenderness to direct palpation in the region anterior to the mid-axillary line bilaterally AND extending from the costal margins to the inguinal ligaments)."
