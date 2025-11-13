;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_dysphagia_now Bool) ;; "dysphagia" {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dysphagia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dysphagia.","meaning":"Boolean indicating whether the patient currently has dysphagia."}
(declare-const patient_has_finding_of_dysphagia_now@@known Bool) ;; "dysphagia" (known) {"when_to_set_to_true":"Set to true if the patient's dysphagia is known (confirmed, not suspected).","when_to_set_to_false":"Set to false if the patient's dysphagia is not known (i.e., suspected or unknown).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dysphagia is known.","meaning":"Boolean indicating whether the patient's dysphagia is known (confirmed)."}
(declare-const patient_has_finding_of_dysphagia_now@@suspected Bool) ;; "dysphagia" (suspected) {"when_to_set_to_true":"Set to true if the patient's dysphagia is suspected (not confirmed/known).","when_to_set_to_false":"Set to false if the patient's dysphagia is not suspected (i.e., known or unknown).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dysphagia is suspected.","meaning":"Boolean indicating whether the patient's dysphagia is suspected (not confirmed/known)."}
(declare-const patient_is_admitted_specifically_for_this_protocol_now Bool) ;; "admitted specifically for this protocol" {"when_to_set_to_true":"Set to true if the patient is currently admitted specifically for this protocol.","when_to_set_to_false":"Set to false if the patient is not currently admitted specifically for this protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted specifically for this protocol.","meaning":"Boolean indicating whether the patient is currently admitted specifically for this protocol."}
(declare-const patient_is_inpatient_at_stroke_center_now Bool) ;; "inpatient at the Stroke Center" {"when_to_set_to_true":"Set to true if the patient is currently admitted as an inpatient at the Stroke Center.","when_to_set_to_false":"Set to false if the patient is not currently admitted as an inpatient at the Stroke Center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an inpatient at the Stroke Center.","meaning":"Boolean indicating whether the patient is currently an inpatient at the Stroke Center."}
(declare-const patient_is_outpatient_at_stroke_center_now Bool) ;; "outpatient at the Stroke Center" {"when_to_set_to_true":"Set to true if the patient is currently registered as an outpatient at the Stroke Center.","when_to_set_to_false":"Set to false if the patient is not currently registered as an outpatient at the Stroke Center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an outpatient at the Stroke Center.","meaning":"Boolean indicating whether the patient is currently an outpatient at the Stroke Center."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the stem variable (dysphagia)
(assert
  (! (=> patient_has_finding_of_dysphagia_now@@known
         patient_has_finding_of_dysphagia_now)
     :named REQ0_AUXILIARY0)) ;; "have known dysphagia"

(assert
  (! (=> patient_has_finding_of_dysphagia_now@@suspected
         patient_has_finding_of_dysphagia_now)
     :named REQ0_AUXILIARY1)) ;; "have suspected dysphagia"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must ((be an inpatient at the Stroke Center AND have known dysphagia) OR (be an inpatient at the Stroke Center AND have suspected dysphagia) OR (be an outpatient at the Stroke Center AND have known dysphagia) OR (be an outpatient at the Stroke Center AND have suspected dysphagia) OR (be admitted specifically for this protocol)).
(assert
  (! (or (and patient_is_inpatient_at_stroke_center_now patient_has_finding_of_dysphagia_now@@known)
         (and patient_is_inpatient_at_stroke_center_now patient_has_finding_of_dysphagia_now@@suspected)
         (and patient_is_outpatient_at_stroke_center_now patient_has_finding_of_dysphagia_now@@known)
         (and patient_is_outpatient_at_stroke_center_now patient_has_finding_of_dysphagia_now@@suspected)
         patient_is_admitted_specifically_for_this_protocol_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((be an inpatient at the Stroke Center AND have known dysphagia) OR (be an inpatient at the Stroke Center AND have suspected dysphagia) OR (be an outpatient at the Stroke Center AND have known dysphagia) OR (be an outpatient at the Stroke Center AND have suspected dysphagia) OR (be admitted specifically for this protocol))."
