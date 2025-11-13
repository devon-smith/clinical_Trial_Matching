;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_hypersensitivity_to_heparin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity or contraindication to heparin at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of hypersensitivity or contraindication to heparin.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has a history of hypersensitivity or contraindication to heparin.","meaning":"Boolean indicating whether the patient has ever had a hypersensitivity or contraindication to heparin."} ;; "known hypersensitivity OR contraindication to heparin"

(declare-const patient_has_hypersensitivity_to_aspirin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity or contraindication to aspirin at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of hypersensitivity or contraindication to aspirin.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has a history of hypersensitivity or contraindication to aspirin.","meaning":"Boolean indicating whether the patient has ever had a hypersensitivity or contraindication to aspirin."} ;; "known hypersensitivity OR contraindication to aspirin"

(declare-const patient_has_hypersensitivity_to_clopidogrel_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity or contraindication to clopidogrel at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of hypersensitivity or contraindication to clopidogrel.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has a history of hypersensitivity or contraindication to clopidogrel.","meaning":"Boolean indicating whether the patient has ever had a hypersensitivity or contraindication to clopidogrel."} ;; "known hypersensitivity OR contraindication to clopidogrel"

(declare-const patient_has_hypersensitivity_to_biolimus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity or contraindication to biolimus at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of hypersensitivity or contraindication to biolimus.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has a history of hypersensitivity or contraindication to biolimus.","meaning":"Boolean indicating whether the patient has ever had a hypersensitivity or contraindication to biolimus."} ;; "known hypersensitivity OR contraindication to biolimus"

(declare-const patient_has_hypersensitivity_to_everolimus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity or contraindication to everolimus at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of hypersensitivity or contraindication to everolimus.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has a history of hypersensitivity or contraindication to everolimus.","meaning":"Boolean indicating whether the patient has ever had a hypersensitivity or contraindication to everolimus."} ;; "known hypersensitivity OR contraindication to everolimus"

(declare-const patient_has_hypersensitivity_to_zotarolimus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity or contraindication to zotarolimus at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of hypersensitivity or contraindication to zotarolimus.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has a history of hypersensitivity or contraindication to zotarolimus.","meaning":"Boolean indicating whether the patient has ever had a hypersensitivity or contraindication to zotarolimus."} ;; "known hypersensitivity OR contraindication to zotarolimus"

(declare-const patient_has_hypersensitivity_to_contrast_media_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity or contraindication to contrast media at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of hypersensitivity or contraindication to contrast media.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has a history of hypersensitivity or contraindication to contrast media.","meaning":"Boolean indicating whether the patient has ever had a hypersensitivity or contraindication to contrast media."} ;; "known hypersensitivity OR contraindication to contrast media"

(declare-const patient_has_finding_of_anaphylaxis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of anaphylaxis at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of anaphylaxis.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has a history of anaphylaxis.","meaning":"Boolean indicating whether the patient has ever had anaphylaxis."} ;; "anaphylaxis"

(declare-const patient_has_finding_of_anaphylaxis_inthehistory@@true_anaphylaxis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's anaphylaxis event was true anaphylaxis (not a milder reaction).","when_to_set_to_false":"Set to false if the patient's anaphylaxis event was not true anaphylaxis.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the anaphylaxis event was true anaphylaxis.","meaning":"Boolean indicating whether the patient's anaphylaxis event was true anaphylaxis."} ;; "true anaphylaxis"

(declare-const patient_has_finding_of_anaphylaxis_inthehistory@@to_prior_contrast_media Bool) ;; {"when_to_set_to_true":"Set to true if the patient's anaphylaxis event was in response to prior contrast media.","when_to_set_to_false":"Set to false if the patient's anaphylaxis event was not in response to prior contrast media.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the anaphylaxis event was in response to prior contrast media.","meaning":"Boolean indicating whether the patient's anaphylaxis event was in response to prior contrast media."} ;; "anaphylaxis to prior contrast media"

;; Additional variable for documented sensitivity to contrast media which can be effectively premedicated with steroids AND diphenhydramine (e.g., rash)
(declare-const patient_has_documented_sensitivity_to_contrast_media_premedicated_with_steroids_and_diphenhydramine Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented sensitivity to contrast media which can be effectively premedicated with steroids and diphenhydramine (e.g., rash).","when_to_set_to_false":"Set to false if the patient does not have such a documented sensitivity, or if premedication is not effective.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has such a sensitivity or if premedication is effective.","meaning":"Boolean indicating whether the patient has a documented sensitivity to contrast media which can be effectively premedicated with steroids and diphenhydramine (e.g., rash)."} ;; "documented sensitivity to contrast media which can be effectively premedicated with steroids AND diphenhydramine (e.g., rash)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; "true anaphylaxis to prior contrast media" definition
(assert
(! (= patient_has_finding_of_anaphylaxis_inthehistory@@true_anaphylaxis
(and patient_has_finding_of_anaphylaxis_inthehistory
     ;; true anaphylaxis event
     ))
:named REQ0_AUXILIARY0)) ;; "true anaphylaxis = anaphylaxis event is true anaphylaxis"

(assert
(! (= patient_has_finding_of_anaphylaxis_inthehistory@@to_prior_contrast_media
(and patient_has_finding_of_anaphylaxis_inthehistory
     ;; event was in response to prior contrast media
     ))
:named REQ0_AUXILIARY1)) ;; "anaphylaxis to prior contrast media = anaphylaxis event was in response to prior contrast media"

;; "true anaphylaxis to prior contrast media" is both qualifiers
(declare-const patient_has_true_anaphylaxis_to_prior_contrast_media_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of true anaphylaxis in response to prior contrast media.","when_to_set_to_false":"Set to false if the patient does not have such a history.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has such a history.","meaning":"Boolean indicating whether the patient has a documented history of true anaphylaxis in response to prior contrast media."} ;; "true anaphylaxis to prior contrast media"

(assert
(! (= patient_has_true_anaphylaxis_to_prior_contrast_media_inthehistory
(and patient_has_finding_of_anaphylaxis_inthehistory@@true_anaphylaxis
     patient_has_finding_of_anaphylaxis_inthehistory@@to_prior_contrast_media))
:named REQ0_AUXILIARY2)) ;; "true anaphylaxis to prior contrast media = true anaphylaxis AND to prior contrast media"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have any of the following:
;; (1) known hypersensitivity OR contraindication to heparin
(assert
(! (not patient_has_hypersensitivity_to_heparin_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "known hypersensitivity OR contraindication to heparin"

;; (2) known hypersensitivity OR contraindication to aspirin
(assert
(! (not patient_has_hypersensitivity_to_aspirin_inthehistory)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "known hypersensitivity OR contraindication to aspirin"

;; (3) known hypersensitivity OR contraindication to clopidogrel
(assert
(! (not patient_has_hypersensitivity_to_clopidogrel_inthehistory)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "known hypersensitivity OR contraindication to clopidogrel"

;; (4) known hypersensitivity OR contraindication to biolimus
(assert
(! (not patient_has_hypersensitivity_to_biolimus_inthehistory)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "known hypersensitivity OR contraindication to biolimus"

;; (5) known hypersensitivity OR contraindication to everolimus
(assert
(! (not patient_has_hypersensitivity_to_everolimus_inthehistory)
:named REQ0_COMPONENT4_OTHER_REQUIREMENTS)) ;; "known hypersensitivity OR contraindication to everolimus"

;; (6) known hypersensitivity OR contraindication to zotarolimus
(assert
(! (not patient_has_hypersensitivity_to_zotarolimus_inthehistory)
:named REQ0_COMPONENT5_OTHER_REQUIREMENTS)) ;; "known hypersensitivity OR contraindication to zotarolimus"

;; (7) known hypersensitivity OR contraindication to contrast media, except if documented sensitivity can be effectively premedicated, but true anaphylaxis to prior contrast media is always excluded
(assert
(! (not (or
  ;; (a) known hypersensitivity OR contraindication to contrast media AND NOT (documented sensitivity can be effectively premedicated)
  (and patient_has_hypersensitivity_to_contrast_media_inthehistory
       (not patient_has_documented_sensitivity_to_contrast_media_premedicated_with_steroids_and_diphenhydramine))
  ;; (b) true anaphylaxis to prior contrast media
  patient_has_true_anaphylaxis_to_prior_contrast_media_inthehistory
))
:named REQ0_COMPONENT6_OTHER_REQUIREMENTS)) ;; "known hypersensitivity OR contraindication to contrast media, except if documented sensitivity can be effectively premedicated, but true anaphylaxis to prior contrast media is always excluded"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bleeding.","meaning":"Boolean indicating whether the patient currently has bleeding."} ;; "bleeding"
(declare-const patient_has_finding_of_bleeding_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bleeding is active.","when_to_set_to_false":"Set to false if the patient's current bleeding is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bleeding is active.","meaning":"Boolean indicating whether the patient's current bleeding is active."} ;; "active"
(declare-const patient_has_finding_of_bleeding_now@@pathologic Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bleeding is pathologic.","when_to_set_to_false":"Set to false if the patient's current bleeding is not pathologic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bleeding is pathologic.","meaning":"Boolean indicating whether the patient's current bleeding is pathologic."} ;; "pathologic"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_bleeding_now@@active
      patient_has_finding_of_bleeding_now)
:named REQ1_AUXILIARY0)) ;; "active"

(assert
(! (=> patient_has_finding_of_bleeding_now@@pathologic
      patient_has_finding_of_bleeding_now)
:named REQ1_AUXILIARY1)) ;; "pathologic"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have active pathologic bleeding
(assert
(! (not (and patient_has_finding_of_bleeding_now@@active
             patient_has_finding_of_bleeding_now@@pathologic))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active pathologic bleeding."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_gastrointestinal_hemorrhage_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a gastrointestinal hemorrhage at any time within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had a gastrointestinal hemorrhage at any time within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a gastrointestinal hemorrhage within the past 3 months.","meaning":"Boolean indicating whether the patient has had a gastrointestinal hemorrhage within the past 3 months."} ;; "gastrointestinal bleeding within the prior 3 months"
(declare-const patient_has_finding_of_genitourinary_tract_hemorrhage_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a genitourinary tract hemorrhage at any time within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not had a genitourinary tract hemorrhage at any time within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a genitourinary tract hemorrhage within the past 3 months.","meaning":"Boolean indicating whether the patient has had a genitourinary tract hemorrhage within the past 3 months."} ;; "genitourinary bleeding within the prior 3 months"
(declare-const patient_has_undergone_surgical_procedure_inthepast2months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure at any time within the past 2 months.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure at any time within the past 2 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure within the past 2 months.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure within the past 2 months."} ;; "major surgery within the prior 2 months"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_gastrointestinal_hemorrhage_inthepast3months)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had gastrointestinal bleeding within the prior 3 months."

(assert
(! (not patient_has_finding_of_genitourinary_tract_hemorrhage_inthepast3months)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had genitourinary bleeding within the prior 3 months."

(assert
(! (not patient_has_undergone_surgical_procedure_inthepast2months)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had major surgery within the prior 2 months."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_medication_administration_intravenous_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone systemic intravenous administration of a medication within the past 12 months.","when_to_set_to_false":"Set to false if the patient has not undergone systemic intravenous administration of a medication within the past 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone systemic intravenous administration of a medication within the past 12 months.","meaning":"Boolean indicating whether the patient has undergone systemic intravenous administration of a medication within the past 12 months."} ;; "systemic intravenous ... within the prior 12 months"

(declare-const patient_has_undergone_medication_administration_intravenous_inthepast12months@@medication_is_biolimus Bool) ;; {"when_to_set_to_true":"Set to true if the medication administered intravenously was biolimus.","when_to_set_to_false":"Set to false if the medication administered intravenously was not biolimus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medication administered intravenously was biolimus.","meaning":"Boolean indicating whether the medication administered intravenously was biolimus."} ;; "systemic intravenous biolimus within the prior 12 months"

(declare-const patient_has_undergone_medication_administration_intravenous_inthepast12months@@medication_is_everolimus Bool) ;; {"when_to_set_to_true":"Set to true if the medication administered intravenously was everolimus.","when_to_set_to_false":"Set to false if the medication administered intravenously was not everolimus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medication administered intravenously was everolimus.","meaning":"Boolean indicating whether the medication administered intravenously was everolimus."} ;; "systemic intravenous everolimus within the prior 12 months"

(declare-const patient_has_undergone_medication_administration_intravenous_inthepast12months@@medication_is_zotarolimus Bool) ;; {"when_to_set_to_true":"Set to true if the medication administered intravenously was zotarolimus.","when_to_set_to_false":"Set to false if the medication administered intravenously was not zotarolimus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the medication administered intravenously was zotarolimus.","meaning":"Boolean indicating whether the medication administered intravenously was zotarolimus."} ;; "systemic intravenous zotarolimus within the prior 12 months"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_undergone_medication_administration_intravenous_inthepast12months@@medication_is_biolimus
      patient_has_undergone_medication_administration_intravenous_inthepast12months)
:named REQ3_AUXILIARY0)) ;; "systemic intravenous biolimus within the prior 12 months"

(assert
(! (=> patient_has_undergone_medication_administration_intravenous_inthepast12months@@medication_is_everolimus
      patient_has_undergone_medication_administration_intravenous_inthepast12months)
:named REQ3_AUXILIARY1)) ;; "systemic intravenous everolimus within the prior 12 months"

(assert
(! (=> patient_has_undergone_medication_administration_intravenous_inthepast12months@@medication_is_zotarolimus
      patient_has_undergone_medication_administration_intravenous_inthepast12months)
:named REQ3_AUXILIARY2)) ;; "systemic intravenous zotarolimus within the prior 12 months"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_medication_administration_intravenous_inthepast12months@@medication_is_biolimus)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used systemic intravenous biolimus within the prior 12 months."

(assert
(! (not patient_has_undergone_medication_administration_intravenous_inthepast12months@@medication_is_everolimus)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used systemic intravenous everolimus within the prior 12 months."

(assert
(! (not patient_has_undergone_medication_administration_intravenous_inthepast12months@@medication_is_zotarolimus)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used systemic intravenous zotarolimus within the prior 12 months."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently identified as female.","when_to_set_to_false":"Set to false if the patient is currently identified as male or other.","when_to_set_to_null":"Set to null if the patient's current sex is unknown or not documented.","meaning":"Indicates whether the patient is currently female."} ;; "female of childbearing potential"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the biological potential to bear children.","when_to_set_to_false":"Set to false if the patient does not currently have childbearing potential (e.g., postmenopausal, surgically sterile).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown or not documented.","meaning":"Indicates whether the patient currently has childbearing potential."} ;; "childbearing potential"
(declare-const patient_possibly_plans_to_become_pregnant_after_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient possibly plans to become pregnant at any time after enrollment into this study.","when_to_set_to_false":"Set to false if the patient does not possibly plan to become pregnant at any time after enrollment into this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient possibly plans to become pregnant at any time after enrollment into this study.","meaning":"Boolean indicating whether the patient possibly plans to become pregnant at any time after enrollment into this study."} ;; "plans to become pregnant any time after enrollment"
(declare-const patient_has_undergone_pregnancy_detection_examination_inthepast1months_outcome_is_negative Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a pregnancy detection examination (pregnancy test) in the past 1 month and the result was negative.","when_to_set_to_false":"Set to false if the patient has undergone a pregnancy detection examination (pregnancy test) in the past 1 month and the result was not negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a pregnancy detection examination (pregnancy test) in the past 1 month with a negative result.","meaning":"Boolean indicating whether the patient has undergone a pregnancy detection examination (pregnancy test) in the past 1 month and the outcome was negative."} ;; "recent pregnancy test is negative"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: female of childbearing potential who possibly plans to become pregnant after enrollment, unless a recent pregnancy test is negative
(assert
(! (not (and patient_sex_is_female_now
             patient_has_childbearing_potential_now
             patient_possibly_plans_to_become_pregnant_after_enrollment
             (not patient_has_undergone_pregnancy_detection_examination_inthepast1months_outcome_is_negative)))
   :named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "A patient is excluded if the patient is a female of childbearing potential who possibly plans to become pregnant any time after enrollment into this study, unless a recent pregnancy test is negative."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_blood_coagulation_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a blood coagulation disorder (bleeding diathesis) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a blood coagulation disorder (bleeding diathesis) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a blood coagulation disorder (bleeding diathesis).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of blood coagulation disorder (bleeding diathesis) in their history."} ;; "the patient has a history of bleeding diathesis"

(declare-const patient_has_diagnosis_of_coagulopathy_known_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with a coagulopathy that is known at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with a coagulopathy that is known at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with a coagulopathy that is known in their history.","meaning":"Boolean indicating whether the patient has ever had a known diagnosis of coagulopathy in their history."} ;; "the patient has a known coagulopathy"

(declare-const patient_has_diagnosis_of_heparin_induced_thrombocytopenia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with heparin-induced thrombocytopenia at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with heparin-induced thrombocytopenia at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with heparin-induced thrombocytopenia.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of heparin-induced thrombocytopenia in their history."} ;; "heparin-induced thrombocytopenia (non-exhaustive example of coagulopathy)"

(declare-const patient_can_undergo_transfusion_of_blood_product_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able and willing to undergo transfusion of blood products in the future.","when_to_set_to_false":"Set to false if the patient will refuse or is unable to undergo transfusion of blood products in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will be able and willing to undergo transfusion of blood products in the future.","meaning":"Boolean indicating whether the patient can and will undergo transfusion of blood products in the future."} ;; "the patient will refuse blood transfusions"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive example: heparin-induced thrombocytopenia implies coagulopathy
(assert
(! (=> patient_has_diagnosis_of_heparin_induced_thrombocytopenia_inthehistory
      patient_has_diagnosis_of_coagulopathy_known_inthehistory)
    :named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (heparin-induced thrombocytopenia)"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: history of bleeding diathesis
(assert
(! (not patient_has_diagnosis_of_blood_coagulation_disorder_inthehistory)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a history of bleeding diathesis"

;; Exclusion: known coagulopathy (including heparin-induced thrombocytopenia)
(assert
(! (not patient_has_diagnosis_of_coagulopathy_known_inthehistory)
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has a known coagulopathy with non-exhaustive examples (heparin-induced thrombocytopenia)"

;; Exclusion: patient will refuse blood transfusions
(assert
(! (not patient_can_undergo_transfusion_of_blood_product_inthefuture)
    :named REQ5_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient will refuse blood transfusions"

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has comorbid conditions.","when_to_set_to_false":"Set to false if the patient currently does not have comorbid conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has comorbid conditions.","meaning":"Boolean indicating whether the patient currently has comorbid conditions."} ;; "comorbid conditions"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@noncardiac Bool) ;; {"when_to_set_to_true":"Set to true if the patient's comorbid conditions are noncardiac.","when_to_set_to_false":"Set to false if the patient's comorbid conditions are cardiac or not noncardiac.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's comorbid conditions are noncardiac.","meaning":"Boolean indicating whether the patient's comorbid conditions are noncardiac."} ;; "noncardiac comorbid conditions"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@associated_with_life_expectancy_less_than_1_year Bool) ;; {"when_to_set_to_true":"Set to true if the patient's comorbid conditions are associated with life expectancy less than 1 year.","when_to_set_to_false":"Set to false if the patient's comorbid conditions are not associated with life expectancy less than 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's comorbid conditions are associated with life expectancy less than 1 year.","meaning":"Boolean indicating whether the patient's comorbid conditions are associated with life expectancy less than 1 year."} ;; "life expectancy less than 1 year"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@may_result_in_protocol_noncompliance_per_site_investigator_medical_judgment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's comorbid conditions may result in protocol noncompliance per site investigator's medical judgment.","when_to_set_to_false":"Set to false if the patient's comorbid conditions are not expected to result in protocol noncompliance per site investigator's medical judgment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's comorbid conditions may result in protocol noncompliance per site investigator's medical judgment.","meaning":"Boolean indicating whether the patient's comorbid conditions may result in protocol noncompliance per site investigator's medical judgment."} ;; "may result in protocol noncompliance (per site investigator's medical judgment)"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@noncardiac@@associated_with_life_expectancy_less_than_1_year Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has noncardiac comorbid conditions and those conditions are associated with life expectancy less than 1 year.","when_to_set_to_false":"Set to false if the patient currently has noncardiac comorbid conditions and those conditions are not associated with life expectancy less than 1 year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has noncardiac comorbid conditions associated with life expectancy less than 1 year.","meaning":"Boolean indicating whether the patient currently has noncardiac comorbid conditions associated with life expectancy less than 1 year."} ;; "noncardiac comorbid conditions with life expectancy less than 1 year"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@noncardiac@@may_result_in_protocol_noncompliance_per_site_investigator_medical_judgment Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has noncardiac comorbid conditions and those conditions may result in protocol noncompliance per site investigator's medical judgment.","when_to_set_to_false":"Set to false if the patient currently has noncardiac comorbid conditions and those conditions are not expected to result in protocol noncompliance per site investigator's medical judgment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has noncardiac comorbid conditions that may result in protocol noncompliance per site investigator's medical judgment.","meaning":"Boolean indicating whether the patient currently has noncardiac comorbid conditions that may result in protocol noncompliance per site investigator's medical judgment."} ;; "noncardiac comorbid conditions that may result in protocol noncompliance (per site investigator's medical judgment)"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@noncardiac
      patient_has_finding_of_co_morbid_conditions_now)
:named REQ6_AUXILIARY0)) ;; "noncardiac comorbid conditions"

(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@associated_with_life_expectancy_less_than_1_year
      patient_has_finding_of_co_morbid_conditions_now)
:named REQ6_AUXILIARY1)) ;; "comorbid conditions with life expectancy less than 1 year"

(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@may_result_in_protocol_noncompliance_per_site_investigator_medical_judgment
      patient_has_finding_of_co_morbid_conditions_now)
:named REQ6_AUXILIARY2)) ;; "comorbid conditions that may result in protocol noncompliance (per site investigator's medical judgment)"

(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@noncardiac@@associated_with_life_expectancy_less_than_1_year
      (and patient_has_finding_of_co_morbid_conditions_now@@noncardiac
           patient_has_finding_of_co_morbid_conditions_now@@associated_with_life_expectancy_less_than_1_year))
:named REQ6_AUXILIARY3)) ;; "noncardiac comorbid conditions with life expectancy less than 1 year"

(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@noncardiac@@may_result_in_protocol_noncompliance_per_site_investigator_medical_judgment
      (and patient_has_finding_of_co_morbid_conditions_now@@noncardiac
           patient_has_finding_of_co_morbid_conditions_now@@may_result_in_protocol_noncompliance_per_site_investigator_medical_judgment))
:named REQ6_AUXILIARY4)) ;; "noncardiac comorbid conditions that may result in protocol noncompliance (per site investigator's medical judgment)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_co_morbid_conditions_now@@noncardiac@@associated_with_life_expectancy_less_than_1_year)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has noncardiac comorbid conditions with life expectancy less than 1 year."

(assert
(! (not patient_has_finding_of_co_morbid_conditions_now@@noncardiac@@may_result_in_protocol_noncompliance_per_site_investigator_medical_judgment)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has noncardiac comorbid conditions that may result in protocol noncompliance (per site investigator's medical judgment)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_clopidogrel_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to clopidogrel.","when_to_set_to_false":"Set to false if the patient is currently not exposed to clopidogrel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to clopidogrel.","meaning":"Boolean indicating whether the patient is currently exposed to clopidogrel."} ;; "clopidogrel"
(declare-const patient_will_undergo_optional_surgery_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a planned elective surgical procedure scheduled to occur in the future.","when_to_set_to_false":"Set to false if the patient does not have any planned elective surgical procedure scheduled to occur in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a planned elective surgical procedure in the future.","meaning":"Boolean indicating whether the patient has a planned elective surgical procedure in the future."} ;; "elective surgical procedure"
(declare-const patient_will_undergo_optional_surgery_inthefuture@@necessitates_interruption_of_clopidogrel_within_first_12_months_post_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the planned elective surgical procedure in the future would require interruption of clopidogrel during the first 12 months post enrollment.","when_to_set_to_false":"Set to false if the planned elective surgical procedure in the future would not require interruption of clopidogrel during the first 12 months post enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the planned elective surgical procedure in the future would require interruption of clopidogrel during the first 12 months post enrollment.","meaning":"Boolean indicating whether the planned elective surgical procedure in the future would necessitate interruption of clopidogrel during the first 12 months post enrollment."} ;; "that would necessitate interruption of clopidogrel during the first 12 months post enrollment"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_will_undergo_optional_surgery_inthefuture@@necessitates_interruption_of_clopidogrel_within_first_12_months_post_enrollment
      patient_will_undergo_optional_surgery_inthefuture)
:named REQ7_AUXILIARY0)) ;; "elective surgical procedure planned that would necessitate interruption of clopidogrel during the first 12 months post enrollment"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_will_undergo_optional_surgery_inthefuture@@necessitates_interruption_of_clopidogrel_within_first_12_months_post_enrollment)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an elective surgical procedure planned that would necessitate interruption of clopidogrel during the first 12 months post enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_undergoing_clinical_drug_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently actively participating in a clinical drug trial (drug investigational study).","when_to_set_to_false":"Set to false if the patient is not currently actively participating in a clinical drug trial (drug investigational study).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently actively participating in a clinical drug trial (drug investigational study).","meaning":"Boolean indicating whether the patient is currently actively participating in a clinical drug trial (drug investigational study)."} ;; "actively participating in another drug investigational study"
(declare-const patient_is_undergoing_clinical_drug_trial_now@@study_has_not_completed_primary_endpoint_followup_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently actively participating in a clinical drug trial and that trial has NOT completed the primary endpoint follow-up period.","when_to_set_to_false":"Set to false if the patient is currently actively participating in a clinical drug trial and that trial HAS completed the primary endpoint follow-up period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical drug trial has completed the primary endpoint follow-up period.","meaning":"Boolean indicating whether the clinical drug trial in which the patient is currently participating has NOT completed the primary endpoint follow-up period."} ;; "which has NOT completed the primary endpoint follow-up period"
(declare-const patient_is_undergoing_clinical_device_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently actively participating in a clinical device trial (device investigational study).","when_to_set_to_false":"Set to false if the patient is not currently actively participating in a clinical device trial (device investigational study).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently actively participating in a clinical device trial (device investigational study).","meaning":"Boolean indicating whether the patient is currently actively participating in a clinical device trial (device investigational study)."} ;; "actively participating in another device investigational study"
(declare-const patient_is_undergoing_clinical_device_trial_now@@study_has_not_completed_primary_endpoint_followup_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently actively participating in a clinical device trial and that trial has NOT completed the primary endpoint follow-up period.","when_to_set_to_false":"Set to false if the patient is currently actively participating in a clinical device trial and that trial HAS completed the primary endpoint follow-up period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the clinical device trial has completed the primary endpoint follow-up period.","meaning":"Boolean indicating whether the clinical device trial in which the patient is currently participating has NOT completed the primary endpoint follow-up period."} ;; "which has NOT completed the primary endpoint follow-up period"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_undergoing_clinical_drug_trial_now@@study_has_not_completed_primary_endpoint_followup_period
      patient_is_undergoing_clinical_drug_trial_now)
:named REQ8_AUXILIARY0)) ;; "patient is actively participating in another drug investigational study which has NOT completed the primary endpoint follow-up period"

(assert
(! (=> patient_is_undergoing_clinical_device_trial_now@@study_has_not_completed_primary_endpoint_followup_period
      patient_is_undergoing_clinical_device_trial_now)
:named REQ8_AUXILIARY1)) ;; "patient is actively participating in another device investigational study which has NOT completed the primary endpoint follow-up period"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (or patient_is_undergoing_clinical_drug_trial_now@@study_has_not_completed_primary_endpoint_followup_period
            patient_is_undergoing_clinical_device_trial_now@@study_has_not_completed_primary_endpoint_followup_period))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is actively participating in another drug investigational study which has NOT completed the primary endpoint follow-up period) OR (the patient is actively participating in another device investigational study which has NOT completed the primary endpoint follow-up period))."
