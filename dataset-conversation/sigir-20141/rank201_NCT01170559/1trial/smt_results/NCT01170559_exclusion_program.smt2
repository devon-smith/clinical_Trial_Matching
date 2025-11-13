;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_can_undergo_implantation_of_insertable_loop_recorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo implantation of an insertable loop recorder (i.e., no contraindication present).","when_to_set_to_false":"Set to false if the patient is currently unable to undergo implantation of an insertable loop recorder due to any contraindication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can currently undergo implantation of an insertable loop recorder.","meaning":"Boolean indicating whether the patient is currently able to undergo implantation of an insertable loop recorder."} ;; "implantable loop recorder implantation"

(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} ;; "fever"

(declare-const patient_has_finding_of_persistent_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a persistent infection.","when_to_set_to_false":"Set to false if the patient currently does not have a persistent infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a persistent infection.","meaning":"Boolean indicating whether the patient currently has a persistent infection."} ;; "ongoing infection"

(declare-const patient_has_finding_of_sepsis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has sepsis.","when_to_set_to_false":"Set to false if the patient currently does not have sepsis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has sepsis.","meaning":"Boolean indicating whether the patient currently has sepsis."} ;; "sepsis"

(declare-const patient_international_normalized_ratio_value_recorded_now_withunit_unitless Real) ;; {"when_to_set_to_value":"Set to the most recently recorded value of the patient's international normalized ratio (INR) at the current time.","when_to_set_to_null":"Set to null if the INR value is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value indicating the patient's most recently recorded international normalized ratio (INR) at the current time, unitless."} ;; "international normalized ratio > 1.6"

(declare-const patient_is_receiving_oral_anticoagulation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving oral anticoagulation therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving oral anticoagulation therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving oral anticoagulation therapy.","meaning":"Boolean indicating whether the patient is currently receiving oral anticoagulation therapy."} ;; "ongoing oral anticoagulation"

(declare-const patient_is_receiving_oral_anticoagulation_now@@ongoing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's oral anticoagulation therapy is ongoing.","when_to_set_to_false":"Set to false if the patient's oral anticoagulation therapy is not ongoing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's oral anticoagulation therapy is ongoing.","meaning":"Boolean indicating whether the patient's oral anticoagulation therapy is ongoing."} ;; "ongoing oral anticoagulation"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or (and patient_is_receiving_oral_anticoagulation_now@@ongoing
                (> patient_international_normalized_ratio_value_recorded_now_withunit_unitless 1.6))
           patient_has_finding_of_persistent_infection_now
           patient_has_finding_of_sepsis_now
           patient_has_finding_of_fever_now)
    (not patient_can_undergo_implantation_of_insertable_loop_recorder_now))
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples ((ongoing oral anticoagulation with international normalized ratio > 1.6) OR (ongoing infection) OR (sepsis) OR (fever))."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_receiving_oral_anticoagulation_now@@ongoing
      patient_is_receiving_oral_anticoagulation_now)
:named REQ0_AUXILIARY1)) ;; "ongoing oral anticoagulation"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! patient_can_undergo_implantation_of_insertable_loop_recorder_now
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to implantable loop recorder implantation with non-exhaustive examples ((ongoing oral anticoagulation with international normalized ratio > 1.6) OR (ongoing infection) OR (sepsis) OR (fever))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_palpitations_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has palpitations.","when_to_set_to_false":"Set to false if the patient currently does not have palpitations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has palpitations.","meaning":"Boolean indicating whether the patient currently has palpitations."} ;; "palpitations"
(declare-const patient_has_finding_of_palpitations_now@@suggestive_of_extrasystoles Bool) ;; {"when_to_set_to_true":"Set to true if the patient's palpitations are suggestive of extrasystoles.","when_to_set_to_false":"Set to false if the patient's palpitations are not suggestive of extrasystoles.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's palpitations are suggestive of extrasystoles.","meaning":"Boolean indicating whether the patient's palpitations are suggestive of extrasystoles."} ;; "palpitations suggestive of extrasystoles"
(declare-const patient_has_finding_of_pulse_missed_beats_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulse missed beats (e.g., a single missed beat).","when_to_set_to_false":"Set to false if the patient currently does not have pulse missed beats.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulse missed beats.","meaning":"Boolean indicating whether the patient currently has pulse missed beats."} ;; "single missed beat"
(declare-const patient_has_finding_of_pulse_dropped_beats_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulse dropped beats (e.g., a single dropped beat).","when_to_set_to_false":"Set to false if the patient currently does not have pulse dropped beats.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulse dropped beats.","meaning":"Boolean indicating whether the patient currently has pulse dropped beats."} ;; "single dropped beat"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_pulse_missed_beats_now
          patient_has_finding_of_pulse_dropped_beats_now)
    patient_has_finding_of_palpitations_now@@suggestive_of_extrasystoles)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples ((single missed beat) OR (single dropped beat))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_palpitations_now@@suggestive_of_extrasystoles
    patient_has_finding_of_palpitations_now)
:named REQ1_AUXILIARY1)) ;; "palpitations suggestive of extrasystoles""

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_palpitations_now@@suggestive_of_extrasystoles)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has palpitations suggestive of extrasystoles with non-exhaustive examples ((single missed beat) OR (single dropped beat)))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a valvular heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have a valvular heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a valvular heart disease.","meaning":"Boolean indicating whether the patient currently has a valvular heart disease."} ;; "valvular heart disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of valvular heart disease is known (confirmed).","when_to_set_to_false":"Set to false if the diagnosis is not known (e.g., only suspected or ruled out).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diagnosis is known.","meaning":"Boolean indicating whether the diagnosis of valvular heart disease is known (confirmed)."} ;; "known valvular heart disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the valvular heart disease is severe.","when_to_set_to_false":"Set to false if the valvular heart disease is not severe (i.e., mild or moderate).","when_to_set_to_null":"Set to null if severity is unknown or cannot be determined.","meaning":"Boolean indicating whether the valvular heart disease is severe."} ;; "severe valvular heart disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of valvular heart disease is suspected (not confirmed).","when_to_set_to_false":"Set to false if the diagnosis is not suspected (e.g., known/confirmed or ruled out).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diagnosis is suspected.","meaning":"Boolean indicating whether the diagnosis of valvular heart disease is suspected (not confirmed)."} ;; "suspected valvular heart disease"

(declare-const patient_has_finding_of_myocardial_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a myocardial heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have a myocardial heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a myocardial heart disease.","meaning":"Boolean indicating whether the patient currently has a myocardial heart disease."} ;; "myocardial heart disease"
(declare-const patient_has_finding_of_myocardial_disease_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of myocardial heart disease is known (confirmed).","when_to_set_to_false":"Set to false if the diagnosis is not known (e.g., only suspected or ruled out).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diagnosis is known.","meaning":"Boolean indicating whether the diagnosis of myocardial heart disease is known (confirmed)."} ;; "known myocardial heart disease"
(declare-const patient_has_finding_of_myocardial_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the myocardial heart disease is severe.","when_to_set_to_false":"Set to false if the myocardial heart disease is not severe (i.e., mild or moderate).","when_to_set_to_null":"Set to null if severity is unknown or cannot be determined.","meaning":"Boolean indicating whether the myocardial heart disease is severe."} ;; "severe myocardial heart disease"
(declare-const patient_has_finding_of_myocardial_disease_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of myocardial heart disease is suspected (not confirmed).","when_to_set_to_false":"Set to false if the diagnosis is not suspected (e.g., known/confirmed or ruled out).","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the diagnosis is suspected.","meaning":"Boolean indicating whether the diagnosis of myocardial heart disease is suspected (not confirmed)."} ;; "suspected myocardial heart disease"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@known
      patient_has_finding_of_heart_valve_disorder_now)
:named REQ2_AUXILIARY0)) ;; "known valvular heart disease"

(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@suspected
      patient_has_finding_of_heart_valve_disorder_now)
:named REQ2_AUXILIARY1)) ;; "suspected valvular heart disease"

(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@severe
      patient_has_finding_of_heart_valve_disorder_now)
:named REQ2_AUXILIARY2)) ;; "severe valvular heart disease"

(assert
(! (=> patient_has_finding_of_myocardial_disease_now@@known
      patient_has_finding_of_myocardial_disease_now)
:named REQ2_AUXILIARY3)) ;; "known myocardial heart disease"

(assert
(! (=> patient_has_finding_of_myocardial_disease_now@@suspected
      patient_has_finding_of_myocardial_disease_now)
:named REQ2_AUXILIARY4)) ;; "suspected myocardial heart disease"

(assert
(! (=> patient_has_finding_of_myocardial_disease_now@@severe
      patient_has_finding_of_myocardial_disease_now)
:named REQ2_AUXILIARY5)) ;; "severe myocardial heart disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and patient_has_finding_of_heart_valve_disorder_now@@known
             patient_has_finding_of_heart_valve_disorder_now@@severe))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known severe valvular heart disease."

(assert
(! (not (and patient_has_finding_of_heart_valve_disorder_now@@suspected
             patient_has_finding_of_heart_valve_disorder_now@@severe))
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected severe valvular heart disease."

(assert
(! (not (and patient_has_finding_of_myocardial_disease_now@@known
             patient_has_finding_of_myocardial_disease_now@@severe))
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known severe myocardial heart disease."

(assert
(! (not (and patient_has_finding_of_myocardial_disease_now@@suspected
             patient_has_finding_of_myocardial_disease_now@@severe))
:named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected severe myocardial heart disease."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_heart_murmur_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a heart murmur.","when_to_set_to_false":"Set to false if the patient currently does not have a heart murmur.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a heart murmur.","meaning":"Boolean indicating whether the patient currently has a heart murmur."} ;; "heart murmur"
(declare-const patient_has_finding_of_heart_murmur_now@@audible Bool) ;; {"when_to_set_to_true":"Set to true if the patient's heart murmur is audible.","when_to_set_to_false":"Set to false if the patient's heart murmur is not audible.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's heart murmur is audible.","meaning":"Boolean indicating whether the patient's heart murmur is audible."} ;; "audible heart murmur"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_murmur_now@@audible
      patient_has_finding_of_heart_murmur_now)
   :named REQ3_AUXILIARY0)) ;; "audible heart murmur" implies "heart murmur"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_heart_murmur_now@@audible)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an audible heart murmur."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_electrocardiogram_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any abnormality detected on a surface electrocardiogram.","when_to_set_to_false":"Set to false if the patient currently does not have any abnormality detected on a surface electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any abnormality detected on a surface electrocardiogram.","meaning":"Boolean indicating whether the patient currently has any abnormality detected on a surface electrocardiogram."} ;; "abnormality on the surface electrocardiogram"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_finding_of_electrocardiogram_abnormal_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any abnormality on the surface electrocardiogram."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_thyrotoxicosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of thyrotoxicosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of thyrotoxicosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of thyrotoxicosis.","meaning":"Boolean indicating whether the patient currently has thyrotoxicosis."} ;; "thyrotoxicosis"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_thyrotoxicosis_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has thyrotoxicosis."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_refuses_implantable_loop_recorder_when_offered Bool) ;; {"when_to_set_to_true":"Set to true if the patient refuses an implantable loop recorder when it is offered.","when_to_set_to_false":"Set to false if the patient does not refuse an implantable loop recorder when it is offered (i.e., accepts or is undecided).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient refuses an implantable loop recorder when it is offered.","meaning":"Boolean indicating whether the patient refuses an implantable loop recorder when it is offered."} ;; "the patient refuses an implantable loop recorder when offered"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_refuses_implantable_loop_recorder_when_offered)
:named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient refuses an implantable loop recorder when offered."
