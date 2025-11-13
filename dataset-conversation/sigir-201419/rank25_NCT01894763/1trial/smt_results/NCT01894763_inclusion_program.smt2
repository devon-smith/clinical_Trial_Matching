;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged greater than or equal to 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged greater than or equal to 18 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_dysphagia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dysphagia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dysphagia.","meaning":"Boolean indicating whether the patient currently has dysphagia."} // "the patient must have dysphagia"
(declare-const patient_has_finding_of_dysphagia_now@@caused_by_unresectable_esophageal_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dysphagia is caused by unresectable esophageal cancer.","when_to_set_to_false":"Set to false if the patient's dysphagia is not caused by unresectable esophageal cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dysphagia is caused by unresectable esophageal cancer.","meaning":"Boolean indicating whether the patient's dysphagia is caused by unresectable esophageal cancer."} // "dysphagia due to unresectable esophageal cancer"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable (if dysphagia is caused by unresectable esophageal cancer, then patient has dysphagia)
(assert
  (! (=> patient_has_finding_of_dysphagia_now@@caused_by_unresectable_esophageal_cancer
         patient_has_finding_of_dysphagia_now)
     :named REQ1_AUXILIARY0)) ;; "dysphagia due to unresectable esophageal cancer" implies "dysphagia"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must have dysphagia due to unresectable esophageal cancer
(assert
  (! patient_has_finding_of_dysphagia_now@@caused_by_unresectable_esophageal_cancer
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must have dysphagia due to unresectable esophageal cancer"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_distance_from_tenwek_hospital_in_kilometers Real) ;; {"when_to_set_to_value":"Set to the numeric value of the distance in kilometers from the patient's residence to Tenwek Hospital.","when_to_set_to_null":"Set to null if the distance from the patient's residence to Tenwek Hospital is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the distance in kilometers between the patient's residence and Tenwek Hospital."} // "the patient must reside within 50 kilometers of Tenwek Hospital"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (<= patient_distance_from_tenwek_hospital_in_kilometers 50.0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must reside within 50 kilometers of Tenwek Hospital"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_tumor_finding_value_recorded_now_withunit_centimeter Real) ;; {"when_to_set_to_value":"Set to the measured length in centimeters if a numeric measurement of the patient's tumor length is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the length of the patient's tumor in centimeters, measured now."} // "a tumor with length less than or equal to 9 centimeters"
(declare-const patient_tumor_finding_distance_from_upper_esophageal_sphincter_now_withunit_centimeter Real) ;; {"when_to_set_to_value":"Set to the measured distance in centimeters from the distal edge of the patient's tumor to the upper esophageal sphincter if available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the distance in centimeters from the distal edge of the patient's tumor to the upper esophageal sphincter, measured now."} // "a tumor located more than 2 centimeters distal to the upper esophageal sphincter"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Tumor length must be less than or equal to 9 centimeters
(assert
  (! (<= patient_tumor_finding_value_recorded_now_withunit_centimeter 9.0)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "a tumor with length less than or equal to 9 centimeters"

;; Component 1: Tumor must be located more than 2 centimeters distal to the upper esophageal sphincter
(assert
  (! (> patient_tumor_finding_distance_from_upper_esophageal_sphincter_now_withunit_centimeter 2.0)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "a tumor located more than 2 centimeters distal to the upper esophageal sphincter"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_esophago_respiratory_fistula_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an esophago-respiratory fistula.","when_to_set_to_false":"Set to false if the patient currently does not have an esophago-respiratory fistula.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an esophago-respiratory fistula.","meaning":"Boolean indicating whether the patient currently has an esophago-respiratory fistula."} // "the patient must NOT have an esophago-respiratory fistula"
(declare-const patient_has_finding_of_suspected_perforation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a suspected perforation.","when_to_set_to_false":"Set to false if the patient currently does not have a suspected perforation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a suspected perforation.","meaning":"Boolean indicating whether the patient currently has a suspected perforation."} // "the patient must NOT have a suspected perforation"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: The patient must NOT have an esophago-respiratory fistula.
(assert
  (! (not patient_has_finding_of_esophago_respiratory_fistula_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must NOT have an esophago-respiratory fistula"

;; Component 1: The patient must NOT have a suspected perforation.
(assert
  (! (not patient_has_finding_of_suspected_perforation_now)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient must NOT have a suspected perforation"
