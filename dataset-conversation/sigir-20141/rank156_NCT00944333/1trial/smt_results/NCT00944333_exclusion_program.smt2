;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_taken_drug_eluting_stent_inthepast24hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a drug-eluting stent implanted within the past 24 hours.","when_to_set_to_false":"Set to false if the patient has not had a drug-eluting stent implanted within the past 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a drug-eluting stent implanted within the past 24 hours.","meaning":"Boolean indicating whether the patient has had a drug-eluting stent implanted within the past 24 hours."} ;; "drug-eluting stent"
(declare-const patient_has_taken_drug_eluting_stent_inthepast24hours@@is_second_generation Bool) ;; {"when_to_set_to_true":"Set to true if the drug-eluting stent implanted within the past 24 hours is a second generation stent.","when_to_set_to_false":"Set to false if the drug-eluting stent implanted within the past 24 hours is not a second generation stent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug-eluting stent implanted within the past 24 hours is a second generation stent.","meaning":"Boolean indicating whether the drug-eluting stent implanted within the past 24 hours is a second generation stent."} ;; "second generation drug-eluting stent"
(declare-const patient_has_taken_drug_eluting_stent_inthepast24hours@@implanted_in_target_lesion Bool) ;; {"when_to_set_to_true":"Set to true if the drug-eluting stent implanted within the past 24 hours was implanted in the target lesion.","when_to_set_to_false":"Set to false if the drug-eluting stent implanted within the past 24 hours was not implanted in the target lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug-eluting stent implanted within the past 24 hours was implanted in the target lesion.","meaning":"Boolean indicating whether the drug-eluting stent implanted within the past 24 hours was implanted in the target lesion."} ;; "implanted in the target lesion"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_taken_drug_eluting_stent_inthepast24hours@@is_second_generation
      patient_has_taken_drug_eluting_stent_inthepast24hours)
    :named REQ0_AUXILIARY0)) ;; "second generation drug-eluting stent"

(assert
(! (=> patient_has_taken_drug_eluting_stent_inthepast24hours@@implanted_in_target_lesion
      patient_has_taken_drug_eluting_stent_inthepast24hours)
    :named REQ0_AUXILIARY1)) ;; "implanted in the target lesion"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must have at least one second generation drug-eluting stent implanted in the target lesion within the last 24 hours
(assert
(! (not (and patient_has_taken_drug_eluting_stent_inthepast24hours@@is_second_generation
             patient_has_taken_drug_eluting_stent_inthepast24hours@@implanted_in_target_lesion))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT have at least one second generation drug-eluting stent implanted in the target lesion within the last twenty-four hours."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_taken_drug_eluting_stent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a drug-eluting stent implanted at any time in the past, regardless of when.","when_to_set_to_false":"Set to false if the patient has never had a drug-eluting stent implanted at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a drug-eluting stent implanted.","meaning":"Boolean indicating whether the patient has ever had a drug-eluting stent implanted at any time in the past."} ;; "drug-eluting stent"

(declare-const patient_has_taken_drug_eluting_stent_inthehistory@@temporalcontext_before_target_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the drug-eluting stent implantation occurred before the target procedure.","when_to_set_to_false":"Set to false if the drug-eluting stent implantation did not occur before the target procedure (i.e., occurred at or after the target procedure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug-eluting stent implantation occurred before the target procedure.","meaning":"Boolean indicating whether the drug-eluting stent implantation occurred before the target procedure."} ;; "before the target procedure"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_taken_drug_eluting_stent_inthehistory@@temporalcontext_before_target_procedure
     patient_has_taken_drug_eluting_stent_inthehistory)
:named REQ1_AUXILIARY0)) ;; "drug-eluting stent implanted before the target procedure"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_taken_drug_eluting_stent_inthehistory@@temporalcontext_before_target_procedure)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had any drug-eluting stent implanted before the target procedure."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_endovascular_insertion_of_bare_metal_stent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone endovascular insertion of a bare metal stent at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone endovascular insertion of a bare metal stent at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone endovascular insertion of a bare metal stent.","meaning":"Boolean indicating whether the patient has ever undergone endovascular insertion of a bare metal stent at any time in the past."} ;; "bare metal stent implanted"
(declare-const patient_has_undergone_endovascular_insertion_of_bare_metal_stent_inthehistory@@temporalcontext_within12months_before_target_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient's endovascular insertion of bare metal stent occurred within the twelve months before the target procedure.","when_to_set_to_false":"Set to false if the patient's endovascular insertion of bare metal stent did not occur within the twelve months before the target procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's endovascular insertion of bare metal stent occurred within the twelve months before the target procedure.","meaning":"Boolean indicating whether the patient's endovascular insertion of bare metal stent occurred within the twelve months before the target procedure."} ;; "bare metal stent implanted within the twelve months before the target procedure"

(declare-const patient_has_undergone_endovascular_insertion_of_stent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone endovascular insertion of a stent at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone endovascular insertion of a stent at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone endovascular insertion of a stent.","meaning":"Boolean indicating whether the patient has ever undergone endovascular insertion of a stent at any time in the past."} ;; "stent implanted"
(declare-const patient_has_undergone_endovascular_insertion_of_stent_inthehistory@@temporalcontext_within12months_before_target_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient's endovascular insertion of stent occurred within the twelve months before the target procedure.","when_to_set_to_false":"Set to false if the patient's endovascular insertion of stent did not occur within the twelve months before the target procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's endovascular insertion of stent occurred within the twelve months before the target procedure.","meaning":"Boolean indicating whether the patient's endovascular insertion of stent occurred within the twelve months before the target procedure."} ;; "stent implanted within the twelve months before the target procedure"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable for bare metal stent
(assert
(! (=> patient_has_undergone_endovascular_insertion_of_bare_metal_stent_inthehistory@@temporalcontext_within12months_before_target_procedure
      patient_has_undergone_endovascular_insertion_of_bare_metal_stent_inthehistory)
:named REQ2_AUXILIARY0)) ;; "bare metal stent implanted within the twelve months before the target procedure" implies "bare metal stent implanted"

;; Qualifier variable implies corresponding stem variable for any stent
(assert
(! (=> patient_has_undergone_endovascular_insertion_of_stent_inthehistory@@temporalcontext_within12months_before_target_procedure
      patient_has_undergone_endovascular_insertion_of_stent_inthehistory)
:named REQ2_AUXILIARY1)) ;; "stent implanted within the twelve months before the target procedure" implies "stent implanted"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_endovascular_insertion_of_bare_metal_stent_inthehistory@@temporalcontext_within12months_before_target_procedure)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had any bare metal stent implanted within the twelve months before the target procedure."
