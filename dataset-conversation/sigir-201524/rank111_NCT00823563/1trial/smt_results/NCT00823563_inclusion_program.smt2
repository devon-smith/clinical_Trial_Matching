;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_coronary_angiography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary angiography at any time in their history.","when_to_set_to_false":"Set to false if the patient has not undergone coronary angiography at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone coronary angiography at any time in their history.","meaning":"Boolean indicating whether the patient has undergone coronary angiography at any time in their history."} ;; "To be included, the patient must have been referred for elective coronary angiography."
(declare-const patient_has_undergone_coronary_angiography_inthehistory@@is_elective Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary angiography was elective (not emergent or urgent).","when_to_set_to_false":"Set to false if the patient's coronary angiography was not elective (i.e., emergent or urgent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coronary angiography was elective.","meaning":"Boolean indicating whether the patient's coronary angiography was elective."} ;; "To be included, the patient must have been referred for elective coronary angiography."
(declare-const patient_has_suspicion_of_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has suspicion of ischemia.","when_to_set_to_false":"Set to false if the patient currently does not have suspicion of ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has suspicion of ischemia.","meaning":"Boolean indicating whether the patient currently has suspicion of ischemia."} ;; "To be included, the patient must have a reasonable clinical suspicion of coronary ischemia."
(declare-const patient_has_suspicion_of_ischemia_now@@is_reasonable_clinical_suspicion Bool) ;; {"when_to_set_to_true":"Set to true if the patient's suspicion of ischemia is reasonable and based on clinical judgment.","when_to_set_to_false":"Set to false if the patient's suspicion of ischemia is not reasonable or not based on clinical judgment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the suspicion of ischemia is reasonable and clinical.","meaning":"Boolean indicating whether the patient's suspicion of ischemia is reasonable and clinical."} ;; "To be included, the patient must have a reasonable clinical suspicion of coronary ischemia."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for elective coronary angiography implies the patient has undergone coronary angiography
(assert
  (! (=> patient_has_undergone_coronary_angiography_inthehistory@@is_elective
         patient_has_undergone_coronary_angiography_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "To be included, the patient must have been referred for elective coronary angiography."

;; Qualifier variable for reasonable clinical suspicion of ischemia implies suspicion of ischemia
(assert
  (! (=> patient_has_suspicion_of_ischemia_now@@is_reasonable_clinical_suspicion
         patient_has_suspicion_of_ischemia_now)
     :named REQ0_AUXILIARY1)) ;; "To be included, the patient must have a reasonable clinical suspicion of coronary ischemia."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Patient must have been referred for elective coronary angiography
(assert
  (! patient_has_undergone_coronary_angiography_inthehistory@@is_elective
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have been referred for elective coronary angiography."

;; Component 1: Patient must have a reasonable clinical suspicion of coronary ischemia
(assert
  (! patient_has_suspicion_of_ischemia_now@@is_reasonable_clinical_suspicion
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a reasonable clinical suspicion of coronary ischemia."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_angina_pectoris_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has angina pectoris.","when_to_set_to_false":"Set to false if the patient currently does not have angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has angina pectoris.","meaning":"Boolean indicating whether the patient currently has angina pectoris."} ;; "To be included, the patient must have angina..."
(declare-const patient_has_finding_of_angina_pectoris_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient's angina pectoris is brought on by physical exertion, emotional stress, certain times of day, or certain times of month.","when_to_set_to_false":"Set to false if the patient's angina pectoris is not brought on by any of these conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's angina pectoris is brought on by these conditions.","meaning":"Boolean indicating whether the patient's angina pectoris is brought on by physical exertion, emotional stress, certain times of day, or certain times of month."} ;; "To be included, the patient must have angina ... brought on by (physical exertion OR emotional stress OR certain times of day OR certain times of month)."

(declare-const patient_has_finding_of_chest_discomfort_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest discomfort.","when_to_set_to_false":"Set to false if the patient currently does not have chest discomfort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest discomfort.","meaning":"Boolean indicating whether the patient currently has chest discomfort."} ;; "chest discomfort"
(declare-const patient_has_finding_of_chest_discomfort_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chest discomfort is brought on by physical exertion, emotional stress, certain times of day, or certain times of month.","when_to_set_to_false":"Set to false if the patient's chest discomfort is not brought on by any of these conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chest discomfort is brought on by these conditions.","meaning":"Boolean indicating whether the patient's chest discomfort is brought on by physical exertion, emotional stress, certain times of day, or certain times of month."} ;; "chest discomfort ... brought on by (physical exertion OR emotional stress OR certain times of day OR certain times of month)"

(declare-const patient_has_finding_of_back_discomfort_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has back discomfort.","when_to_set_to_false":"Set to false if the patient currently does not have back discomfort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has back discomfort.","meaning":"Boolean indicating whether the patient currently has back discomfort."} ;; "back discomfort"
(declare-const patient_has_finding_of_back_discomfort_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient's back discomfort is brought on by physical exertion, emotional stress, certain times of day, or certain times of month.","when_to_set_to_false":"Set to false if the patient's back discomfort is not brought on by any of these conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's back discomfort is brought on by these conditions.","meaning":"Boolean indicating whether the patient's back discomfort is brought on by physical exertion, emotional stress, certain times of day, or certain times of month."} ;; "back discomfort ... brought on by (physical exertion OR emotional stress OR certain times of day OR certain times of month)"

(declare-const patient_has_finding_of_shoulder_discomfort_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has shoulder discomfort.","when_to_set_to_false":"Set to false if the patient currently does not have shoulder discomfort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has shoulder discomfort.","meaning":"Boolean indicating whether the patient currently has shoulder discomfort."} ;; "shoulder discomfort"
(declare-const patient_has_finding_of_shoulder_discomfort_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient's shoulder discomfort is brought on by physical exertion, emotional stress, certain times of day, or certain times of month.","when_to_set_to_false":"Set to false if the patient's shoulder discomfort is not brought on by any of these conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's shoulder discomfort is brought on by these conditions.","meaning":"Boolean indicating whether the patient's shoulder discomfort is brought on by physical exertion, emotional stress, certain times of day, or certain times of month."} ;; "shoulder discomfort ... brought on by (physical exertion OR emotional stress OR certain times of day OR certain times of month)"

(declare-const patient_has_finding_of_arm_discomfort_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has arm discomfort.","when_to_set_to_false":"Set to false if the patient currently does not have arm discomfort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has arm discomfort.","meaning":"Boolean indicating whether the patient currently has arm discomfort."} ;; "arm discomfort"
(declare-const patient_has_finding_of_arm_discomfort_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient's arm discomfort is brought on by physical exertion, emotional stress, certain times of day, or certain times of month.","when_to_set_to_false":"Set to false if the patient's arm discomfort is not brought on by any of these conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's arm discomfort is brought on by these conditions.","meaning":"Boolean indicating whether the patient's arm discomfort is brought on by physical exertion, emotional stress, certain times of day, or certain times of month."} ;; "arm discomfort ... brought on by (physical exertion OR emotional stress OR certain times of day OR certain times of month)"

(declare-const patient_has_finding_of_neck_discomfort_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has neck discomfort.","when_to_set_to_false":"Set to false if the patient currently does not have neck discomfort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has neck discomfort.","meaning":"Boolean indicating whether the patient currently has neck discomfort."} ;; "neck discomfort"
(declare-const patient_has_finding_of_neck_discomfort_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient's neck discomfort is brought on by physical exertion, emotional stress, certain times of day, or certain times of month.","when_to_set_to_false":"Set to false if the patient's neck discomfort is not brought on by any of these conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's neck discomfort is brought on by these conditions.","meaning":"Boolean indicating whether the patient's neck discomfort is brought on by physical exertion, emotional stress, certain times of day, or certain times of month."} ;; "neck discomfort ... brought on by (physical exertion OR emotional stress OR certain times of day OR certain times of month)"

(declare-const patient_has_finding_of_jaw_discomfort_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has jaw discomfort.","when_to_set_to_false":"Set to false if the patient currently does not have jaw discomfort.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has jaw discomfort.","meaning":"Boolean indicating whether the patient currently has jaw discomfort."} ;; "jaw discomfort"
(declare-const patient_has_finding_of_jaw_discomfort_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient's jaw discomfort is brought on by physical exertion, emotional stress, certain times of day, or certain times of month.","when_to_set_to_false":"Set to false if the patient's jaw discomfort is not brought on by any of these conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's jaw discomfort is brought on by these conditions.","meaning":"Boolean indicating whether the patient's jaw discomfort is brought on by physical exertion, emotional stress, certain times of day, or certain times of month."} ;; "jaw discomfort ... brought on by (physical exertion OR emotional stress OR certain times of day OR certain times of month)"

(declare-const patient_has_finding_of_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dyspnea (shortness of breath).","when_to_set_to_false":"Set to false if the patient currently does not have dyspnea (shortness of breath).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dyspnea (shortness of breath).","meaning":"Boolean indicating whether the patient currently has dyspnea (shortness of breath)."} ;; "shortness of breath"
(declare-const patient_has_finding_of_dyspnea_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dyspnea (shortness of breath) is brought on by physical exertion, emotional stress, certain times of day, or certain times of month.","when_to_set_to_false":"Set to false if the patient's dyspnea (shortness of breath) is not brought on by any of these conditions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dyspnea (shortness of breath) is brought on by these conditions.","meaning":"Boolean indicating whether the patient's dyspnea (shortness of breath) is brought on by physical exertion, emotional stress, certain times of day, or certain times of month."} ;; "shortness of breath ... brought on by (physical exertion OR emotional stress OR certain times of day OR certain times of month)"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_angina_pectoris_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month
         patient_has_finding_of_angina_pectoris_now)
     :named REQ1_AUXILIARY0)) ;; "angina ... brought on by ..."

(assert
  (! (=> patient_has_finding_of_chest_discomfort_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month
         patient_has_finding_of_chest_discomfort_now)
     :named REQ1_AUXILIARY1)) ;; "chest discomfort ... brought on by ..."

(assert
  (! (=> patient_has_finding_of_back_discomfort_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month
         patient_has_finding_of_back_discomfort_now)
     :named REQ1_AUXILIARY2)) ;; "back discomfort ... brought on by ..."

(assert
  (! (=> patient_has_finding_of_shoulder_discomfort_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month
         patient_has_finding_of_shoulder_discomfort_now)
     :named REQ1_AUXILIARY3)) ;; "shoulder discomfort ... brought on by ..."

(assert
  (! (=> patient_has_finding_of_arm_discomfort_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month
         patient_has_finding_of_arm_discomfort_now)
     :named REQ1_AUXILIARY4)) ;; "arm discomfort ... brought on by ..."

(assert
  (! (=> patient_has_finding_of_neck_discomfort_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month
         patient_has_finding_of_neck_discomfort_now)
     :named REQ1_AUXILIARY5)) ;; "neck discomfort ... brought on by ..."

(assert
  (! (=> patient_has_finding_of_jaw_discomfort_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month
         patient_has_finding_of_jaw_discomfort_now)
     :named REQ1_AUXILIARY6)) ;; "jaw discomfort ... brought on by ..."

(assert
  (! (=> patient_has_finding_of_dyspnea_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month
         patient_has_finding_of_dyspnea_now)
     :named REQ1_AUXILIARY7)) ;; "shortness of breath ... brought on by ..."

;; Non-exhaustive examples: each example implies anginal equivalent
(declare-const patient_has_finding_of_anginal_equivalent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an anginal equivalent (any symptom or sign considered equivalent to angina).","when_to_set_to_false":"Set to false if the patient currently does not have an anginal equivalent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an anginal equivalent.","meaning":"Boolean indicating whether the patient currently has an anginal equivalent."} ;; "an anginal equivalent (with non-exhaustive examples ...)"

(assert
  (! (=> (or patient_has_finding_of_chest_discomfort_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month
            patient_has_finding_of_back_discomfort_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month
            patient_has_finding_of_shoulder_discomfort_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month
            patient_has_finding_of_arm_discomfort_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month
            patient_has_finding_of_neck_discomfort_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month
            patient_has_finding_of_jaw_discomfort_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month
            patient_has_finding_of_dyspnea_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month)
         patient_has_finding_of_anginal_equivalent_now)
     :named REQ1_AUXILIARY8)) ;; "Non-exhaustive examples imply anginal equivalent"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Inclusion: patient must have (angina brought on by ... OR anginal equivalent brought on by ...)
(assert
  (! (or patient_has_finding_of_angina_pectoris_now@@brought_on_by_physical_exertion_or_emotional_stress_or_certain_times_of_day_or_certain_times_of_month
         patient_has_finding_of_anginal_equivalent_now)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (angina OR an anginal equivalent ... brought on by ...)"
