;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_undergone_laparoscopic_nissen_fundoplication_using_abdominal_approach_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a laparoscopic Nissen fundoplication using abdominal approach at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a laparoscopic Nissen fundoplication using abdominal approach at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a laparoscopic Nissen fundoplication using abdominal approach.","meaning":"Boolean indicating whether the patient has ever undergone a laparoscopic Nissen fundoplication using abdominal approach at any time in the past."} ;; "laparoscopic primary Nissen fundoplication"
(declare-const patient_has_undergone_open_nissen_fundoplication_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an open primary Nissen fundoplication at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone an open primary Nissen fundoplication at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an open primary Nissen fundoplication.","meaning":"Boolean indicating whether the patient has ever undergone an open primary Nissen fundoplication at any time in the past."} ;; "open primary Nissen fundoplication"
(declare-const patient_has_undergone_open_nissen_fundoplication_in_the_history@@status_post Bool) ;; {"when_to_set_to_true":"Set to true if the patient is status post open primary Nissen fundoplication.","when_to_set_to_false":"Set to false if the patient is not status post open primary Nissen fundoplication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is status post open primary Nissen fundoplication.","meaning":"Boolean indicating whether the patient is status post open primary Nissen fundoplication."} ;; "status post open primary Nissen fundoplication"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_open_nissen_fundoplication_in_the_history@@status_post
         patient_has_undergone_open_nissen_fundoplication_in_the_history)
     :named REQ0_AUXILIARY0)) ;; "status post open primary Nissen fundoplication"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must ((be status post open primary Nissen fundoplication) OR (be status post laparoscopic primary Nissen fundoplication)).
(assert
  (! (or patient_has_undergone_open_nissen_fundoplication_in_the_history@@status_post
         patient_has_undergone_laparoscopic_nissen_fundoplication_using_abdominal_approach_inthehistory)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be status post open primary Nissen fundoplication) OR (be status post laparoscopic primary Nissen fundoplication))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_undergone_bariatric_operative_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a bariatric operative procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a bariatric operative procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a bariatric operative procedure.","meaning":"Boolean indicating whether the patient has ever undergone a bariatric operative procedure in their history."} ;; "bariatric surgery"
(declare-const patient_has_undergone_bariatric_operative_procedure_inthehistory@@met_national_institutes_of_health_criteria_for_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a bariatric operative procedure and met National Institutes of Health criteria for the procedure at the time it was performed.","when_to_set_to_false":"Set to false if the patient has ever undergone a bariatric operative procedure but did not meet National Institutes of Health criteria for the procedure at the time it was performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient met National Institutes of Health criteria for the procedure at the time it was performed.","meaning":"Boolean indicating whether the patient met National Institutes of Health criteria for bariatric surgery at the time of the procedure."} ;; "met National Institutes of Health criteria for bariatric surgery"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_bariatric_operative_procedure_inthehistory@@met_national_institutes_of_health_criteria_for_procedure
        patient_has_undergone_bariatric_operative_procedure_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "met National Institutes of Health criteria for bariatric surgery" implies "bariatric surgery"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have met National Institutes of Health criteria for bariatric surgery.
(assert
  (! patient_has_undergone_bariatric_operative_procedure_inthehistory@@met_national_institutes_of_health_criteria_for_procedure
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have met National Institutes of Health criteria for bariatric surgery."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_undergone_total_fundoplication_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a Nissen fundoplication at any time in their history.","when_to_set_to_false":"Set to false if the patient has not undergone a Nissen fundoplication at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a Nissen fundoplication in their history.","meaning":"Boolean indicating whether the patient has undergone a Nissen fundoplication in their history."} ;; "Nissen fundoplication"
(declare-const patient_has_undergone_total_fundoplication_inthehistory@@functional_antireflux_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the Nissen fundoplication was performed as a functional antireflux surgery.","when_to_set_to_false":"Set to false if the Nissen fundoplication was not performed as a functional antireflux surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Nissen fundoplication was performed as a functional antireflux surgery.","meaning":"Boolean indicating whether the Nissen fundoplication was performed as a functional antireflux surgery."} ;; "functional antireflux surgery (Nissen fundoplication)"
(declare-const patient_has_undergone_total_fundoplication_inthehistory@@failed_antireflux_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the Nissen fundoplication was performed as a failed antireflux surgery.","when_to_set_to_false":"Set to false if the Nissen fundoplication was not performed as a failed antireflux surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Nissen fundoplication was performed as a failed antireflux surgery.","meaning":"Boolean indicating whether the Nissen fundoplication was performed as a failed antireflux surgery."} ;; "failed antireflux surgery (Nissen fundoplication)"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_undergone_total_fundoplication_inthehistory@@functional_antireflux_surgery
         patient_has_undergone_total_fundoplication_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "functional antireflux surgery (Nissen fundoplication)" implies Nissen fundoplication

(assert
  (! (=> patient_has_undergone_total_fundoplication_inthehistory@@failed_antireflux_surgery
         patient_has_undergone_total_fundoplication_inthehistory)
     :named REQ2_AUXILIARY1)) ;; "failed antireflux surgery (Nissen fundoplication)" implies Nissen fundoplication

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must ((have had functional antireflux surgery (Nissen fundoplication)) OR (have had failed antireflux surgery (Nissen fundoplication))).
(assert
  (! (or patient_has_undergone_total_fundoplication_inthehistory@@functional_antireflux_surgery
         patient_has_undergone_total_fundoplication_inthehistory@@failed_antireflux_surgery)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have had functional antireflux surgery (Nissen fundoplication)) OR (have had failed antireflux surgery (Nissen fundoplication)))."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_undergone_laparoscopy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone laparoscopy at the current time (now), regardless of surgical context.","when_to_set_to_false":"Set to false if the patient has not undergone laparoscopy at the current time (now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone laparoscopy at the current time (now).","meaning":"Boolean indicating whether the patient has undergone laparoscopy now."} ;; "laparoscopic approach"
(declare-const patient_has_undergone_laparoscopy_now@@for_revisional_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient's laparoscopic procedure at the current time (now) was performed specifically for revisional surgery.","when_to_set_to_false":"Set to false if the patient's laparoscopic procedure at the current time (now) was not performed for revisional surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the laparoscopic procedure was performed for revisional surgery.","meaning":"Boolean indicating whether the patient's laparoscopy now was performed for revisional surgery."} ;; "laparoscopic approach for revisional surgery"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_undergone_laparoscopy_now@@for_revisional_surgery
         patient_has_undergone_laparoscopy_now)
     :named REQ3_AUXILIARY0)) ;; "laparoscopic approach for revisional surgery" implies "laparoscopic approach"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_undergone_laparoscopy_now@@for_revisional_surgery
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a laparoscopic approach for revisional surgery."
