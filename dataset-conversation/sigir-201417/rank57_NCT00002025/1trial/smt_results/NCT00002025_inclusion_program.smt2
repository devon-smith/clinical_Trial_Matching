;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_previously_enrolled_in_compassionate_use_study_icm_1257_or_1257a Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously enrolled in a compassionate use study (ICM 1257 or ICM 1257A).","when_to_set_to_false":"Set to false if the patient has not previously enrolled in a compassionate use study (ICM 1257 or ICM 1257A).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously enrolled in a compassionate use study (ICM 1257 or ICM 1257A).","meaning":"Boolean indicating whether the patient has previously enrolled in a compassionate use study (ICM 1257 or ICM 1257A)." } ;; "have previously enrolled in a compassionate use study (ICM 1257/1257A)"
(declare-const patient_is_exposed_to_ganciclovir_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to ganciclovir at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to ganciclovir at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to ganciclovir.","meaning":"Boolean indicating whether the patient has ever been exposed to ganciclovir at any time in the past."} ;; "ganciclovir"
(declare-const patient_is_exposed_to_ganciclovir_inthehistory@@as_study_drug_in_syntex_study_terminated_by_patient Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to ganciclovir in the past was specifically as the study drug in a Syntex study from which the patient has terminated.","when_to_set_to_false":"Set to false if the patient's exposure to ganciclovir in the past was not as the study drug in a Syntex study from which the patient has terminated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to ganciclovir was as the study drug in a Syntex study from which the patient has terminated.","meaning":"Boolean indicating whether the patient's exposure to ganciclovir in the past was as the study drug in a Syntex study from which the patient has terminated."} ;; "have terminated from another Syntex ganciclovir study"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_exposed_to_ganciclovir_inthehistory@@as_study_drug_in_syntex_study_terminated_by_patient
         patient_is_exposed_to_ganciclovir_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "patient_is_exposed_to_ganciclovir_inthehistory@@as_study_drug_in_syntex_study_terminated_by_patient" implies "patient_is_exposed_to_ganciclovir_inthehistory"

;; ===================== Constraint Assertions (REQ 0) =====================
;; The patient must (have previously enrolled in a compassionate use study (ICM 1257/1257A)) OR (have terminated from another Syntex ganciclovir study)
(assert
  (! (or patient_has_previously_enrolled_in_compassionate_use_study_icm_1257_or_1257a
         patient_is_exposed_to_ganciclovir_inthehistory@@as_study_drug_in_syntex_study_terminated_by_patient)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (have previously enrolled in a compassionate use study (ICM 1257/1257A)) OR (have terminated from another Syntex ganciclovir study)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_aids_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acquired immunodeficiency syndrome (AIDS).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acquired immunodeficiency syndrome (AIDS).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acquired immunodeficiency syndrome (AIDS).","meaning":"Boolean indicating whether the patient currently has a diagnosis of acquired immunodeficiency syndrome (AIDS)."} ;; "have a diagnosis of acquired immunodeficiency syndrome"
(declare-const patient_has_diagnosis_of_cytomegalovirus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cytomegalovirus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cytomegalovirus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cytomegalovirus infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cytomegalovirus infection."} ;; "have a diagnosis of cytomegalovirus infection"
(declare-const patient_has_diagnosis_of_cytomegalovirus_infection_now@@life_threatening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of cytomegalovirus infection is life-threatening.","when_to_set_to_false":"Set to false if the patient's current diagnosis of cytomegalovirus infection is not life-threatening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of cytomegalovirus infection is life-threatening.","meaning":"Boolean indicating whether the patient's current diagnosis of cytomegalovirus infection is life-threatening."} ;; "life-threatening cytomegalovirus infection"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_cytomegalovirus_infection_now@@life_threatening
         patient_has_diagnosis_of_cytomegalovirus_infection_now)
     :named REQ1_AUXILIARY0)) ;; "life-threatening cytomegalovirus infection" implies "cytomegalovirus infection"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: patient must have a diagnosis of acquired immunodeficiency syndrome
(assert
  (! patient_has_diagnosis_of_aids_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have a diagnosis of acquired immunodeficiency syndrome"

;; Component 1: patient must have a diagnosis of life-threatening cytomegalovirus infection
(assert
  (! patient_has_diagnosis_of_cytomegalovirus_infection_now@@life_threatening
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have a diagnosis of life-threatening cytomegalovirus infection"

;; ===================== Declarations for the inclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_immunodeficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of immunodeficiency.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of immunodeficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of immunodeficiency.","meaning":"Boolean indicating whether the patient currently has a diagnosis of immunodeficiency."} ;; "have a diagnosis of immunodeficiency"
(declare-const patient_has_diagnosis_of_immunodeficiency_now@@other_than_acquired_immunodeficiency_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of immunodeficiency and the immunodeficiency is other than acquired immunodeficiency syndrome.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of immunodeficiency and the immunodeficiency is acquired immunodeficiency syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immunodeficiency is other than acquired immunodeficiency syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of immunodeficiency and the immunodeficiency is other than acquired immunodeficiency syndrome."} ;; "immunodeficiency other than acquired immunodeficiency syndrome"
(declare-const patient_has_diagnosis_of_cytomegalovirus_infection_now@@sight_threatening Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cytomegalovirus infection and the infection is sight-threatening.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of cytomegalovirus infection but the infection is not sight-threatening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cytomegalovirus infection is sight-threatening.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cytomegalovirus infection and the infection is sight-threatening."} ;; "sight-threatening cytomegalovirus disease"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable for immunodeficiency implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_immunodeficiency_now@@other_than_acquired_immunodeficiency_syndrome
         patient_has_diagnosis_of_immunodeficiency_now)
     :named REQ2_AUXILIARY0)) ;; "immunodeficiency other than acquired immunodeficiency syndrome" implies "immunodeficiency"

;; Qualifier variable for sight-threatening CMV implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_cytomegalovirus_infection_now@@sight_threatening
         patient_has_diagnosis_of_cytomegalovirus_infection_now)
     :named REQ2_AUXILIARY1)) ;; "sight-threatening cytomegalovirus disease" implies "cytomegalovirus infection"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Must have immunodeficiency other than AIDS
(assert
  (! patient_has_diagnosis_of_immunodeficiency_now@@other_than_acquired_immunodeficiency_syndrome
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have a diagnosis of immunodeficiency other than acquired immunodeficiency syndrome"

;; Component 1: Must have (life-threatening OR sight-threatening cytomegalovirus disease)
(assert
  (! (or patient_has_diagnosis_of_cytomegalovirus_infection_now@@life_threatening
         patient_has_diagnosis_of_cytomegalovirus_infection_now@@sight_threatening)
     :named REQ2_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have a diagnosis of life-threatening cytomegalovirus disease OR sight-threatening cytomegalovirus disease"
