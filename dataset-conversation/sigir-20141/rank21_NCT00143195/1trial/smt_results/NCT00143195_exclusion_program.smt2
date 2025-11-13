;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} ;; "congestive heart failure"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_congestive_heart_failure_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congestive heart failure."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the cardiovascular system.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the cardiovascular system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the cardiovascular system.","meaning":"Boolean indicating whether the patient currently has a disorder of the cardiovascular system."} ;; "cardiovascular disease"
(declare-const patient_has_finding_of_disorder_of_cardiovascular_system_now@@clinically_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of the cardiovascular system is clinically significant.","when_to_set_to_false":"Set to false if the patient's current disorder of the cardiovascular system is not clinically significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of the cardiovascular system is clinically significant.","meaning":"Boolean indicating whether the patient's current disorder of the cardiovascular system is clinically significant."} ;; "clinically significant cardiovascular disease"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_cardiovascular_system_now@@clinically_significant
      patient_has_finding_of_disorder_of_cardiovascular_system_now)
:named REQ1_AUXILIARY0)) ;; "clinically significant cardiovascular disease"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_disorder_of_cardiovascular_system_now@@clinically_significant)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinically significant cardiovascular disease."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_standing_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's standing systolic blood pressure is recorded now in millimeters of mercury.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's standing systolic blood pressure measured now, in millimeters of mercury."} ;; "standing systolic blood pressure"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (< patient_standing_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 100))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a standing systolic blood pressure < 100 millimeters of mercury."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_undergoing_antianginal_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving antianginal therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving antianginal therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving antianginal therapy.","meaning":"Boolean indicating whether the patient is currently receiving antianginal therapy."} ;; "anti-anginal therapy"
(declare-const patient_is_undergoing_antianginal_therapy_now@@concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving antianginal therapy and the therapy is concomitant (administered at the same time as another therapy).","when_to_set_to_false":"Set to false if the patient is currently receiving antianginal therapy and the therapy is not concomitant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antianginal therapy is concomitant.","meaning":"Boolean indicating whether the patient is currently receiving antianginal therapy and the therapy is concomitant."} ;; "concomitant anti-anginal therapy"
(declare-const patient_is_undergoing_antianginal_therapy_now@@similar_to_sublingual_nitroglycerin_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving antianginal therapy and the therapy is similar to sublingual nitroglycerin therapy.","when_to_set_to_false":"Set to false if the patient is currently receiving antianginal therapy and the therapy is not similar to sublingual nitroglycerin therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antianginal therapy is similar to sublingual nitroglycerin therapy.","meaning":"Boolean indicating whether the patient is currently receiving antianginal therapy and the therapy is similar to sublingual nitroglycerin therapy."} ;; "anti-anginal therapy similar to sublingual nitroglycerin therapy"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_undergoing_antianginal_therapy_now@@concomitant
      patient_is_undergoing_antianginal_therapy_now)
:named REQ3_AUXILIARY0)) ;; "concomitant anti-anginal therapy"

(assert
(! (=> patient_is_undergoing_antianginal_therapy_now@@similar_to_sublingual_nitroglycerin_therapy
      patient_is_undergoing_antianginal_therapy_now)
:named REQ3_AUXILIARY1)) ;; "anti-anginal therapy similar to sublingual nitroglycerin therapy"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT be receiving concomitant anti-anginal therapy similar to sublingual nitroglycerin therapy
(assert
(! (not (and patient_is_undergoing_antianginal_therapy_now@@concomitant
             patient_is_undergoing_antianginal_therapy_now@@similar_to_sublingual_nitroglycerin_therapy))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving concomitant anti-anginal therapy similar to sublingual nitroglycerin therapy."
