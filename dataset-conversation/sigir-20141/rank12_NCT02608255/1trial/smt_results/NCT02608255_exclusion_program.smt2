;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_under_major_patient_trust_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently under major patient trust.","when_to_set_to_false":"Set to false if the patient is currently not under major patient trust.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently under major patient trust.","meaning":"Boolean indicating whether the patient is currently under major patient trust."} ;; "the patient is under major patient trust"
(declare-const patient_is_under_minor_patient_trust_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently under minor patient trust.","when_to_set_to_false":"Set to false if the patient is currently not under minor patient trust.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently under minor patient trust.","meaning":"Boolean indicating whether the patient is currently under minor patient trust."} ;; "the patient is under minor patient trust"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_under_minor_patient_trust_now)
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is under minor patient trust."

(assert
(! (not patient_is_under_major_patient_trust_now)
:named REQ0_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is under major patient trust."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_signed_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed informed consent at the current time.","when_to_set_to_false":"Set to false if the patient has not signed informed consent at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed informed consent at the current time.","meaning":"Boolean indicating whether the patient has signed informed consent at the current time."} ;; "the patient has NOT signed informed consent"
(declare-const patient_has_signed_informed_consent_now@@refused_to_sign Bool) ;; {"when_to_set_to_true":"Set to true if the patient refused to sign informed consent at the current time.","when_to_set_to_false":"Set to false if the patient did not refuse to sign informed consent at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient refused to sign informed consent at the current time.","meaning":"Boolean indicating whether the patient refused to sign informed consent at the current time."} ;; "the patient refuses to sign informed consent"
(declare-const patient_has_finding_of_physical_handicap_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a physical handicap.","when_to_set_to_false":"Set to false if the patient currently does not have a physical handicap.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a physical handicap.","meaning":"Boolean indicating whether the patient currently has a physical handicap."} ;; "the patient has physical disability"
(declare-const patient_has_finding_of_physical_handicap_now@@prevents_signing_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current physical handicap prevents them from signing informed consent.","when_to_set_to_false":"Set to false if the patient's current physical handicap does not prevent them from signing informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's physical handicap prevents signing informed consent.","meaning":"Boolean indicating whether the patient's physical handicap prevents signing informed consent."} ;; "physical disability that prevents signing informed consent"
(declare-const patient_has_finding_of_mental_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disability.","when_to_set_to_false":"Set to false if the patient currently does not have a mental disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental disability.","meaning":"Boolean indicating whether the patient currently has a mental disability."} ;; "the patient has mental disability"
(declare-const patient_has_finding_of_mental_disability_now@@prevents_signing_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current mental disability prevents them from signing informed consent.","when_to_set_to_false":"Set to false if the patient's current mental disability does not prevent them from signing informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's mental disability prevents signing informed consent.","meaning":"Boolean indicating whether the patient's mental disability prevents signing informed consent."} ;; "mental disability that prevents signing informed consent"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_physical_handicap_now@@prevents_signing_informed_consent
       patient_has_finding_of_physical_handicap_now)
   :named REQ1_AUXILIARY0)) ;; "physical disability that prevents signing informed consent"

(assert
(! (=> patient_has_finding_of_mental_disability_now@@prevents_signing_informed_consent
       patient_has_finding_of_mental_disability_now)
   :named REQ1_AUXILIARY1)) ;; "mental disability that prevents signing informed consent"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: NOT signed informed consent, refusal, physical or mental disability preventing signing
(assert
(! (not (or (not patient_has_signed_informed_consent_now)
            patient_has_signed_informed_consent_now@@refused_to_sign
            patient_has_finding_of_physical_handicap_now@@prevents_signing_informed_consent
            patient_has_finding_of_mental_disability_now@@prevents_signing_informed_consent))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has NOT signed informed consent) OR (the patient refuses to sign informed consent) OR (the patient has physical disability that prevents signing informed consent) OR (the patient has mental disability that prevents signing informed consent)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_anticoagulant_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone anticoagulant therapy at any time in the past, regardless of relation to other procedures.","when_to_set_to_false":"Set to false if the patient has never undergone anticoagulant therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone anticoagulant therapy in the past.","meaning":"Boolean indicating whether the patient has ever undergone anticoagulant therapy at any time in the past."} ;; "anticoagulation"
(declare-const patient_has_undergone_anticoagulant_therapy_inthehistory@@temporalcontext_before_collection_of_blood_specimen_for_laboratory Bool) ;; {"when_to_set_to_true":"Set to true if the patient's anticoagulant therapy occurred before the collection of a blood specimen for laboratory.","when_to_set_to_false":"Set to false if the patient's anticoagulant therapy did not occur before the collection of a blood specimen for laboratory.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's anticoagulant therapy occurred before the collection of a blood specimen for laboratory.","meaning":"Boolean indicating whether the patient's anticoagulant therapy occurred before the collection of a blood specimen for laboratory."} ;; "received anticoagulation before carrying blood sample"
(declare-const patient_has_undergone_collection_of_blood_specimen_for_laboratory_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone collection of a blood specimen for laboratory at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone collection of a blood specimen for laboratory at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone collection of a blood specimen for laboratory in the past.","meaning":"Boolean indicating whether the patient has ever undergone collection of a blood specimen for laboratory at any time in the past."} ;; "blood sample"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_anticoagulant_therapy_inthehistory@@temporalcontext_before_collection_of_blood_specimen_for_laboratory
      patient_has_undergone_anticoagulant_therapy_inthehistory)
:named REQ2_AUXILIARY0)) ;; "received anticoagulation before carrying blood sample"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_anticoagulant_therapy_inthehistory@@temporalcontext_before_collection_of_blood_specimen_for_laboratory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient received anticoagulation before carrying blood sample."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_progressive_septic_process_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a progressive septic process.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of a progressive septic process.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of a progressive septic process.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a progressive septic process."} ;; "the patient has a progressive septic process"

(declare-const patient_has_diagnosis_of_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of neoplastic disease (neoplasia).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of neoplastic disease (neoplasia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of neoplastic disease (neoplasia).","meaning":"Boolean indicating whether the patient currently has a diagnosis of neoplastic disease (neoplasia)."} ;; "neoplasia"

(declare-const patient_has_diagnosis_of_neoplastic_disease_now@@undergoing_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's neoplastic disease is currently undergoing treatment.","when_to_set_to_false":"Set to false if the patient's neoplastic disease is not currently undergoing treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's neoplastic disease is undergoing treatment.","meaning":"Boolean indicating whether the patient's neoplastic disease is undergoing treatment."} ;; "neoplasia undergoing treatment"

(declare-const patient_has_diagnosis_of_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of renal failure syndrome (kidney failure).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of renal failure syndrome (kidney failure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of renal failure syndrome (kidney failure).","meaning":"Boolean indicating whether the patient currently has a diagnosis of renal failure syndrome (kidney failure)."} ;; "kidney failure"

(declare-const patient_has_diagnosis_of_renal_failure_syndrome_now@@dialyzed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal failure syndrome is currently being treated with dialysis.","when_to_set_to_false":"Set to false if the patient's renal failure syndrome is not currently being treated with dialysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's renal failure syndrome is being treated with dialysis.","meaning":"Boolean indicating whether the patient's renal failure syndrome is being treated with dialysis."} ;; "dialyzed kidney failure"

(declare-const patient_has_undergone_surgical_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a surgical procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a surgical procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a surgical procedure at any time in the past.","meaning":"Boolean indicating whether the patient has ever undergone a surgical procedure at any time in the past."} ;; "history of surgery"

(declare-const patient_has_undergone_coronary_angioplasty_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone coronary angioplasty at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone coronary angioplasty at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary angioplasty at any time in the past.","meaning":"Boolean indicating whether the patient has ever undergone coronary angioplasty at any time in the past."} ;; "coronary angioplasty"

(declare-const patient_has_undergone_coronary_angioplasty_inthehistory@@temporalcontext_within6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary angioplasty occurred within the last six months.","when_to_set_to_false":"Set to false if the patient's coronary angioplasty did not occur within the last six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coronary angioplasty occurred within the last six months.","meaning":"Boolean indicating whether the patient's coronary angioplasty occurred within the last six months."} ;; "history of coronary angioplasty less than six months ago"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable for neoplasia implies stem variable
(assert
(! (=> patient_has_diagnosis_of_neoplastic_disease_now@@undergoing_treatment
       patient_has_diagnosis_of_neoplastic_disease_now)
:named REQ3_AUXILIARY0)) ;; "neoplasia undergoing treatment"

;; Qualifier variable for dialyzed kidney failure implies stem variable
(assert
(! (=> patient_has_diagnosis_of_renal_failure_syndrome_now@@dialyzed
       patient_has_diagnosis_of_renal_failure_syndrome_now)
:named REQ3_AUXILIARY1)) ;; "dialyzed kidney failure"

;; Qualifier variable for coronary angioplasty within 6 months implies stem variable
(assert
(! (=> patient_has_undergone_coronary_angioplasty_inthehistory@@temporalcontext_within6months
       patient_has_undergone_coronary_angioplasty_inthehistory)
:named REQ3_AUXILIARY2)) ;; "history of coronary angioplasty less than six months ago"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_progressive_septic_process_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has a progressive septic process"

(assert
(! (not patient_has_diagnosis_of_neoplastic_disease_now@@undergoing_treatment)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has neoplasia undergoing treatment"

(assert
(! (not patient_has_diagnosis_of_renal_failure_syndrome_now@@dialyzed)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has dialyzed kidney failure"

(assert
(! (not patient_has_undergone_surgical_procedure_inthehistory)
:named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient has a history of surgery"

(assert
(! (not patient_has_undergone_coronary_angioplasty_inthehistory@@temporalcontext_within6months)
:named REQ3_COMPONENT4_OTHER_REQUIREMENTS)) ;; "the patient has a history of coronary angioplasty less than six months ago"

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_undergone_transplantation_of_heart_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a heart transplantation procedure at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone a heart transplantation procedure at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a heart transplantation procedure.","meaning":"Boolean indicating whether the patient has ever undergone a heart transplantation procedure at any time in their medical history."} ;; "the patient has a transplanted heart"
(declare-const patient_has_undergone_transplant_of_kidney_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a kidney transplantation procedure at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone a kidney transplantation procedure at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a kidney transplantation procedure.","meaning":"Boolean indicating whether the patient has ever undergone a kidney transplantation procedure at any time in their medical history."} ;; "the patient has a transplanted kidney"
(declare-const patient_has_undergone_transplantation_of_liver_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a liver transplantation procedure at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone a liver transplantation procedure at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a liver transplantation procedure.","meaning":"Boolean indicating whether the patient has ever undergone a liver transplantation procedure at any time in their medical history."} ;; "the patient has a transplanted liver"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_undergone_transplantation_of_heart_inthehistory)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a transplanted heart."

(assert
  (! (not patient_has_undergone_transplant_of_kidney_inthehistory)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a transplanted kidney."

(assert
  (! (not patient_has_undergone_transplantation_of_liver_inthehistory)
     :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a transplanted liver."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a myocardial infarction (heart attack) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a myocardial infarction (heart attack) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a myocardial infarction (heart attack).","meaning":"Boolean indicating whether the patient has ever had a myocardial infarction (heart attack) at any time in the past."} ;; "heart attack"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_myocardial_infarction_inthehistory)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a heart attack."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has acute coronary syndrome."} ;; "acute coronary syndrome"
(declare-const patient_has_finding_of_crushing_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of a crushing injury.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of a crushing injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a crushing injury.","meaning":"Boolean indicating whether the patient currently has a crushing injury."} ;; "traumatic injury by crushing"
(declare-const patient_has_finding_of_penetrating_wound_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of a penetrating wound.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of a penetrating wound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a penetrating wound.","meaning":"Boolean indicating whether the patient currently has a penetrating wound."} ;; "penetrating trauma"
(declare-const patient_symptoms_clearly_eliminate_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current symptoms clearly eliminate the possibility of acute coronary syndrome (e.g., symptoms are explained by penetrating trauma or traumatic injury by crushing, or other findings that make acute coronary syndrome impossible).","when_to_set_to_false":"Set to false if the patient's current symptoms do not clearly eliminate the possibility of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current symptoms clearly eliminate acute coronary syndrome.","meaning":"Boolean indicating whether the patient's current symptoms clearly eliminate the possibility of acute coronary syndrome."} ;; "the patient's symptoms clearly eliminate acute coronary syndrome"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_penetrating_wound_now
          patient_has_finding_of_crushing_injury_now)
    patient_symptoms_clearly_eliminate_acute_coronary_syndrome_now)
:named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (penetrating trauma, traumatic injury by crushing)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_symptoms_clearly_eliminate_acute_coronary_syndrome_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient's symptoms clearly eliminate acute coronary syndrome with non-exhaustive examples (penetrating trauma, traumatic injury by crushing)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_dead_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has died at any time in the history.","when_to_set_to_false":"Set to false if the patient has not died at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has died at any time in the history.","meaning":"Boolean indicating whether the patient has died at any time in the history."} ;; "died"
(declare-const patient_has_finding_of_dead_inthehistory@@temporalcontext_between_inclusion_and_arrival_in_cardiology_intensive_care_unit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's death occurred specifically between the time of inclusion and arrival in the cardiology intensive care unit.","when_to_set_to_false":"Set to false if the patient's death did not occur in that interval.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's death occurred in that interval.","meaning":"Boolean indicating whether the patient's death occurred between inclusion and arrival in the cardiology intensive care unit."} ;; "died between the time of inclusion and arrival in the cardiology intensive care unit"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_dead_inthehistory@@temporalcontext_between_inclusion_and_arrival_in_cardiology_intensive_care_unit
      patient_has_finding_of_dead_inthehistory)
   :named REQ7_AUXILIARY0)) ;; "died between the time of inclusion and arrival in the cardiology intensive care unit" implies "died"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_dead_inthehistory@@temporalcontext_between_inclusion_and_arrival_in_cardiology_intensive_care_unit)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient died between the time of inclusion and arrival in the cardiology intensive care unit."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_withdrew_consent_under_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient withdrew consent for participation in the study.","when_to_set_to_false":"Set to false if the patient did not withdraw consent for participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient withdrew consent for participation in the study.","meaning":"Boolean indicating whether the patient withdrew consent specifically for participation in the study."} ;; "the patient withdraws consent under study"
(declare-const patient_withdrew_consent_under_study@@under_study Bool) ;; {"when_to_set_to_true":"Set to true if the consent is specifically for participation in the study.","when_to_set_to_false":"Set to false if the consent is not specifically for participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the consent is specifically for participation in the study.","meaning":"Boolean indicating whether the consent in question is specifically for participation in the study."} ;; "consent under study"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_withdrew_consent_under_study@@under_study
      patient_withdrew_consent_under_study)
:named REQ8_AUXILIARY0)) ;; "consent in question is specifically for participation in the study"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_withdrew_consent_under_study)
:named REQ8_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient withdraws consent under study."
