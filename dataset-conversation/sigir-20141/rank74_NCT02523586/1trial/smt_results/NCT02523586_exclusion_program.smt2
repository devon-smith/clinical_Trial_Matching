;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_blood_pressure_value_recorded_now_withunit_mmhg Real) ;; {"when_to_set_to_value":"Set to the measured blood pressure value (systolic/diastolic in mmHg) if a measurement is recorded now.","when_to_set_to_null":"Set to null if no blood pressure measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current blood pressure (systolic/diastolic) in mmHg, recorded now."} ;; "blood pressure"
(declare-const patient_has_finding_of_acute_cardiopulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute cardiopulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have acute cardiopulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute cardiopulmonary disease.","meaning":"Boolean indicating whether the patient currently has acute cardiopulmonary disease."} ;; "acute cardiopulmonary disease"
(declare-const patient_heart_rate_value_recorded_now_withunit_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured heart rate value (beats per minute) if a measurement is recorded now.","when_to_set_to_null":"Set to null if no heart rate measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current heart rate in beats per minute, recorded now."} ;; "heart rate"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured hemoglobin oxygen saturation value (percent) if a measurement is recorded now.","when_to_set_to_null":"Set to null if no hemoglobin oxygen saturation measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current hemoglobin oxygen saturation in percent, recorded now."} ;; "oxygen saturation"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_on_room_air Bool) ;; {"when_to_set_to_true":"Set to true if the hemoglobin oxygen saturation measurement was performed while the patient was breathing room air.","when_to_set_to_false":"Set to false if the measurement was performed under supplemental oxygen or other conditions.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was performed on room air.","meaning":"Boolean indicating whether the hemoglobin oxygen saturation measurement was performed while the patient was breathing room air."} ;; "oxygen saturation on room air"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: acute cardiopulmonary disease is defined by (blood pressure > 150/90 AND heart rate > 120 AND oxygen saturation on room air < 92)
(assert
(! (= patient_has_finding_of_acute_cardiopulmonary_disease_now
     (and
       (> patient_blood_pressure_value_recorded_now_withunit_mmhg 150) ;; "blood pressure greater than 150/90"
       (> patient_heart_rate_value_recorded_now_withunit_beats_per_minute 120) ;; "heart rate greater than 120"
       (and
         (< patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent 92) ;; "oxygen saturation ... less than 92"
         patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent@@measured_on_room_air ;; "on room air"
       )
     ))
:named REQ0_AUXILIARY0)) ;; "as defined by (blood pressure greater than 150/90 AND heart rate greater than 120 AND oxygen saturation on room air less than 92)."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_acute_cardiopulmonary_disease_now)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute cardiopulmonary disease, as defined by (blood pressure greater than 150/90 AND heart rate greater than 120 AND oxygen saturation on room air less than 92)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_allergy_to_lidocaine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to lidocaine.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to lidocaine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to lidocaine.","meaning":"Boolean indicating whether the patient currently has an allergy to lidocaine."} ;; "allergy to lidocaine"
(declare-const patient_has_finding_of_allergy_to_adhesive_tape_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to adhesive tape.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to adhesive tape.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to adhesive tape.","meaning":"Boolean indicating whether the patient currently has an allergy to adhesive tape."} ;; "allergy to adhesive tape"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_allergy_to_lidocaine_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to lidocaine."

(assert
(! (not patient_has_finding_of_allergy_to_adhesive_tape_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to adhesive tape."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_polyp_of_nasal_sinus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with polyp of nasal sinus (nasal polyps) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with polyp of nasal sinus (nasal polyps) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of polyp of nasal sinus (nasal polyps).","meaning":"Boolean indicating whether the patient has ever had a diagnosis or history of polyp of nasal sinus (nasal polyps)."} ;; "the patient has a history of nasal polyps"
(declare-const patient_has_finding_of_polyp_of_nasal_sinus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of polyp of nasal sinus (nasal polyps).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of polyp of nasal sinus (nasal polyps).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of polyp of nasal sinus (nasal polyps).","meaning":"Boolean indicating whether the patient currently has a clinical finding of polyp of nasal sinus (nasal polyps)."} ;; "the patient has a physical examination finding of nasal polyps"
(declare-const patient_has_finding_of_polyp_of_nasal_sinus_now@@physical_examination_finding Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current clinical finding of polyp of nasal sinus (nasal polyps) is established by physical examination.","when_to_set_to_false":"Set to false if the patient's current clinical finding of polyp of nasal sinus (nasal polyps) is not established by physical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is established by physical examination.","meaning":"Boolean indicating whether the patient's current clinical finding of polyp of nasal sinus (nasal polyps) is established by physical examination."} ;; "the patient has a physical examination finding of nasal polyps"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the corresponding stem variable
(assert
(! (=> patient_has_finding_of_polyp_of_nasal_sinus_now@@physical_examination_finding
      patient_has_finding_of_polyp_of_nasal_sinus_now)
:named REQ2_AUXILIARY0)) ;; "the patient has a physical examination finding of nasal polyps" implies "the patient currently has a clinical finding of polyp of nasal sinus (nasal polyps)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_polyp_of_nasal_sinus_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of nasal polyps."

(assert
(! (not patient_has_finding_of_polyp_of_nasal_sinus_now@@physical_examination_finding)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a physical examination finding of nasal polyps."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_currently_taking_oral_anticoagulant_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any oral anticoagulant medication.","when_to_set_to_false":"Set to false if the patient is currently not taking any oral anticoagulant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any oral anticoagulant medication.","meaning":"Boolean indicating whether the patient is currently taking any oral anticoagulant medication."} ;; "the patient is currently taking oral anticoagulant medication"
(declare-const patient_is_currently_taking_parenteral_anticoagulant_medication_excluding_aspirin Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any parenteral anticoagulant medication, excluding aspirin.","when_to_set_to_false":"Set to false if the patient is currently not taking any parenteral anticoagulant medication, or only taking aspirin as a parenteral anticoagulant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any parenteral anticoagulant medication, excluding aspirin.","meaning":"Boolean indicating whether the patient is currently taking any parenteral anticoagulant medication, excluding aspirin."} ;; "the patient is currently taking parenteral anticoagulant medication (other than aspirin)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_is_currently_taking_oral_anticoagulant_medication
            patient_is_currently_taking_parenteral_anticoagulant_medication_excluding_aspirin))
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient is currently taking oral anticoagulant medication or is currently taking parenteral anticoagulant medication (other than aspirin)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_bleeding_from_nose_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had nose bleeds (epistaxis) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had nose bleeds (epistaxis) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had nose bleeds (epistaxis) in the past.","meaning":"Boolean indicating whether the patient has ever had nose bleeds (epistaxis) in the past."} ;; "nose bleeds"
(declare-const patient_has_finding_of_bleeding_from_nose_inthehistory@@frequent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had frequent nose bleeds (epistaxis) in the past.","when_to_set_to_false":"Set to false if the patient has ever had nose bleeds (epistaxis) in the past, but they were not frequent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the nose bleeds in the past were frequent.","meaning":"Boolean indicating whether the patient's history of nose bleeds (epistaxis) is qualified as frequent."} ;; "frequent nose bleeds"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_bleeding_from_nose_inthehistory@@frequent
      patient_has_finding_of_bleeding_from_nose_inthehistory)
:named REQ4_AUXILIARY0)) ;; "frequent nose bleeds" implies "nose bleeds"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_bleeding_from_nose_inthehistory@@frequent)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of frequent nose bleeds."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_symptoms_of_nasal_congestion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of nasal congestion.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of nasal congestion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of nasal congestion.","meaning":"Boolean indicating whether the patient currently has symptoms of nasal congestion."} ;; "nasal congestion"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_symptoms_of_nasal_congestion_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current symptoms of nasal congestion."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_respiratory_crackles_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of respiratory crackles (rales).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of respiratory crackles (rales).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of respiratory crackles (rales).","meaning":"Boolean indicating whether the patient currently has respiratory crackles (rales)."} ;; "rales"
(declare-const patient_has_finding_of_wheezing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of wheezing.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of wheezing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of wheezing.","meaning":"Boolean indicating whether the patient currently has wheezing."} ;; "wheezing"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_finding_of_respiratory_crackles_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has physical examination findings of rales."

(assert
  (! (not patient_has_finding_of_wheezing_now)
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has physical examination findings of wheezing."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_facial_hair_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has facial hair.","when_to_set_to_false":"Set to false if the patient currently does not have facial hair.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has facial hair.","meaning":"Boolean indicating whether the patient currently has facial hair."} ;; "the patient has facial hair"
(declare-const patient_has_facial_hair_now@@prevents_forming_seal_with_anesthesia_mask Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current facial hair prevents forming a seal with an anesthesia mask.","when_to_set_to_false":"Set to false if the patient's current facial hair does not prevent forming a seal with an anesthesia mask.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current facial hair prevents forming a seal with an anesthesia mask.","meaning":"Boolean indicating whether the patient's current facial hair prevents forming a seal with an anesthesia mask."} ;; "facial hair that prevents forming a seal with an anesthesia mask"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_facial_hair_now@@prevents_forming_seal_with_anesthesia_mask
      patient_has_facial_hair_now)
:named REQ7_AUXILIARY0)) ;; "facial hair that prevents forming a seal with an anesthesia mask""

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_facial_hair_now@@prevents_forming_seal_with_anesthesia_mask)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has facial hair that prevents forming a seal with an anesthesia mask."
