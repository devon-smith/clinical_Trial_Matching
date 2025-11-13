;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "teenager aged ≥ 12 years AND ≤ 17 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must be a teenager aged ≥ 12 years.
(assert
  (! (>= patient_age_value_recorded_now_in_years 12)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a teenager aged ≥ 12 years."

;; To be included, the patient must be a teenager aged ≤ 17 years.
(assert
  (! (<= patient_age_value_recorded_now_in_years 17)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a teenager aged ≤ 17 years."

;; ===================== Declarations for the inclusion criteria (REQ 1) =====================
(declare-const patient_has_received_consecutive_courses_of_chemotherapy_value_recorded_now_withunit_count Int) ;; {"when_to_set_to_value":"Set to the number of consecutive courses of chemotherapy the patient has received, recorded now, with unit 'count'.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many consecutive courses of chemotherapy the patient has received.","meaning":"Numeric value representing the number of consecutive courses of chemotherapy the patient has received, recorded now, with unit 'count'."} ;; "four consecutive courses of chemotherapy OR five consecutive courses of chemotherapy"
(declare-const patient_has_received_consecutive_courses_of_chemotherapy_value_recorded_now_withunit_count@@administered_at_involved_child_cancer_units Bool) ;; {"when_to_set_to_true":"Set to true if the consecutive courses of chemotherapy were administered at the involved child cancer units.","when_to_set_to_false":"Set to false if the consecutive courses of chemotherapy were not administered at the involved child cancer units.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the consecutive courses of chemotherapy were administered at the involved child cancer units.","meaning":"Boolean indicating whether the consecutive courses of chemotherapy were administered at the involved child cancer units."} ;; "administered at the involved child cancer units"
(declare-const patient_has_received_chemotherapy_courses_over_period_value_recorded_now_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours over which the patient received the chemotherapy courses, recorded now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined over how many hours the patient received the chemotherapy courses.","meaning":"Numeric value representing the period in hours over which the patient received the chemotherapy courses, recorded now."} ;; "over a period of ≥ 24 hours including hydration"
(declare-const patient_has_received_chemotherapy_courses_over_period_value_recorded_now_withunit_hours@@including_hydration Bool) ;; {"when_to_set_to_true":"Set to true if the period over which the patient received the chemotherapy courses includes hydration.","when_to_set_to_false":"Set to false if the period over which the patient received the chemotherapy courses does not include hydration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the period includes hydration.","meaning":"Boolean indicating whether the period over which the patient received the chemotherapy courses includes hydration."} ;; "including hydration"
(declare-const patient_has_finding_of_moderate_nausea_and_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of moderate nausea and vomiting.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of moderate nausea and vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of moderate nausea and vomiting.","meaning":"Boolean indicating whether the patient currently has a finding of moderate nausea and vomiting."} ;; "moderate nausea and vomiting"
(declare-const patient_has_finding_of_severe_nausea_and_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of severe nausea and vomiting.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of severe nausea and vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of severe nausea and vomiting.","meaning":"Boolean indicating whether the patient currently has a finding of severe nausea and vomiting."} ;; "severe nausea and vomiting"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: patient must receive (four consecutive courses of chemotherapy OR five consecutive courses of chemotherapy) administered at the involved child cancer units
(assert
  (! (and (or (= patient_has_received_consecutive_courses_of_chemotherapy_value_recorded_now_withunit_count 4)
              (= patient_has_received_consecutive_courses_of_chemotherapy_value_recorded_now_withunit_count 5))
          patient_has_received_consecutive_courses_of_chemotherapy_value_recorded_now_withunit_count@@administered_at_involved_child_cancer_units)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "receive (four consecutive courses of chemotherapy OR five consecutive courses of chemotherapy) administered at the involved child cancer units"

;; Component 1: patient must receive these courses over a period of ≥ 24 hours including hydration
(assert
  (! (and (>= patient_has_received_chemotherapy_courses_over_period_value_recorded_now_withunit_hours 24.0)
          patient_has_received_chemotherapy_courses_over_period_value_recorded_now_withunit_hours@@including_hydration)
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "receive these courses over a period of ≥ 24 hours including hydration"

;; Component 2: patient must have assumed (moderate nausea and vomiting OR severe nausea and vomiting)
(assert
  (! (or patient_has_finding_of_moderate_nausea_and_vomiting_now
         patient_has_finding_of_severe_nausea_and_vomiting_now)
     :named REQ1_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have assumed (moderate nausea and vomiting OR severe nausea and vomiting)"

;; ===================== Declarations for the criterion (REQ 2) =====================
;; Already declared:
;; (declare-const patient_has_received_consecutive_courses_of_chemotherapy_value_recorded_now_withunit_count Int) ;; {"when_to_set_to_value":"Set to the number of consecutive courses of chemotherapy the patient has received, recorded now, with unit 'count'.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many consecutive courses of chemotherapy the patient has received.","meaning":"Numeric value representing the number of consecutive courses of chemotherapy the patient has received, recorded now, with unit 'count'."} ;; "four consecutive courses of chemotherapy OR five consecutive courses of chemotherapy"

(declare-const patient_has_received_moderate_emetogenic_chemotherapy_in_consecutive_courses_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received at least one moderate emetogenic type of chemotherapy in four or five consecutive courses of chemotherapy.","when_to_set_to_false":"Set to false if the patient has not received any moderate emetogenic type of chemotherapy in four or five consecutive courses of chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received moderate emetogenic type of chemotherapy in four or five consecutive courses.","meaning":"Boolean indicating whether the patient has received at least one moderate emetogenic type of chemotherapy in four or five consecutive courses of chemotherapy."} ;; "at least one of the following moderate emetogenic type of chemotherapy"

(declare-const patient_has_received_highly_emetogenic_chemotherapy_in_consecutive_courses_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received at least one highly emetogenic type of chemotherapy in four or five consecutive courses of chemotherapy.","when_to_set_to_false":"Set to false if the patient has not received any highly emetogenic type of chemotherapy in four or five consecutive courses of chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received highly emetogenic type of chemotherapy in four or five consecutive courses.","meaning":"Boolean indicating whether the patient has received at least one highly emetogenic type of chemotherapy in four or five consecutive courses of chemotherapy."} ;; "at least one of the following highly emetogenic type of chemotherapy"

(declare-const patient_has_received_carboplatin_in_consecutive_courses_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received carboplatin as part of highly emetogenic chemotherapy in four or five consecutive courses.","when_to_set_to_false":"Set to false if the patient has not received carboplatin as part of highly emetogenic chemotherapy in four or five consecutive courses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received carboplatin in four or five consecutive courses.","meaning":"Boolean indicating whether the patient has received carboplatin as part of highly emetogenic chemotherapy in four or five consecutive courses."} ;; "Carboplatin"

(declare-const patient_has_received_cyclophosphamide_in_consecutive_courses_now_with_dose_value_recorded_now_withunit_mg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the value of cyclophosphamide dose (mg/m^2) received by the patient in four or five consecutive courses of chemotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the dose of cyclophosphamide received by the patient in four or five consecutive courses of chemotherapy, measured in mg/m^2."} ;; "Cyclophosphamide with dose < 1500 mg/m^2" and "Cyclophosphamide with dose > 1500 mg/m^2"

(declare-const patient_has_received_cytarabine_in_consecutive_courses_now_with_dose_value_recorded_now_withunit_g_per_m2 Real) ;; {"when_to_set_to_value":"Set to the value of cytarabine dose (g/m^2) received by the patient in four or five consecutive courses of chemotherapy.","when_to_set_to_null":"Set to null if the dose is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the dose of cytarabine received by the patient in four or five consecutive courses of chemotherapy, measured in g/m^2."} ;; "Cytarabine with dose > 1 g/m^2"

(declare-const patient_has_received_daunorubicin_in_consecutive_courses_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received daunorubicin as part of highly emetogenic chemotherapy in four or five consecutive courses.","when_to_set_to_false":"Set to false if the patient has not received daunorubicin as part of highly emetogenic chemotherapy in four or five consecutive courses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received daunorubicin in four or five consecutive courses.","meaning":"Boolean indicating whether the patient has received daunorubicin as part of highly emetogenic chemotherapy in four or five consecutive courses."} ;; "Daunorubicin"

(declare-const patient_has_received_doxorubicin_in_consecutive_courses_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received doxorubicin as part of highly emetogenic chemotherapy in four or five consecutive courses.","when_to_set_to_false":"Set to false if the patient has not received doxorubicin as part of highly emetogenic chemotherapy in four or five consecutive courses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received doxorubicin in four or five consecutive courses.","meaning":"Boolean indicating whether the patient has received doxorubicin as part of highly emetogenic chemotherapy in four or five consecutive courses."} ;; "Doxorubicin"

(declare-const patient_has_received_epirubicin_in_consecutive_courses_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received epirubicin as part of highly emetogenic chemotherapy in four or five consecutive courses.","when_to_set_to_false":"Set to false if the patient has not received epirubicin as part of highly emetogenic chemotherapy in four or five consecutive courses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received epirubicin in four or five consecutive courses.","meaning":"Boolean indicating whether the patient has received epirubicin as part of highly emetogenic chemotherapy in four or five consecutive courses."} ;; "Epirubicin"

(declare-const patient_has_received_idarubicin_in_consecutive_courses_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received idarubicin as part of highly emetogenic chemotherapy in four or five consecutive courses.","when_to_set_to_false":"Set to false if the patient has not received idarubicin as part of highly emetogenic chemotherapy in four or five consecutive courses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received idarubicin in four or five consecutive courses.","meaning":"Boolean indicating whether the patient has received idarubicin as part of highly emetogenic chemotherapy in four or five consecutive courses."} ;; "Idarubicin"

(declare-const patient_has_received_ifosfamide_in_consecutive_courses_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received ifosfamide as part of highly emetogenic chemotherapy in four or five consecutive courses.","when_to_set_to_false":"Set to false if the patient has not received ifosfamide as part of highly emetogenic chemotherapy in four or five consecutive courses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received ifosfamide in four or five consecutive courses.","meaning":"Boolean indicating whether the patient has received ifosfamide as part of highly emetogenic chemotherapy in four or five consecutive courses."} ;; "Ifosfamide"

(declare-const patient_has_received_mitoxantrone_in_consecutive_courses_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received mitoxantrone as part of highly emetogenic chemotherapy in four or five consecutive courses.","when_to_set_to_false":"Set to false if the patient has not received mitoxantrone as part of highly emetogenic chemotherapy in four or five consecutive courses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received mitoxantrone in four or five consecutive courses.","meaning":"Boolean indicating whether the patient has received mitoxantrone as part of highly emetogenic chemotherapy in four or five consecutive courses."} ;; "Mitoxantrone"

(declare-const patient_has_received_methotrexate_in_consecutive_courses_now_with_dose_value_recorded_now_withunit_mg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the value of methotrexate dose (mg/m^2) received by the patient in four or five consecutive courses of chemotherapy.","when_to_set_to_null":"Set to null if the dose is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the dose of methotrexate received by the patient in four or five consecutive courses of chemotherapy, measured in mg/m^2."} ;; "Methotrexate with dose > 1000 mg/m^2"

(declare-const patient_has_received_cisplatin_in_consecutive_courses_now_with_dose_value_recorded_now_withunit_mg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the value of cisplatin dose (mg/m^2) received by the patient in four or five consecutive courses of chemotherapy.","when_to_set_to_null":"Set to null if the dose is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the dose of cisplatin received by the patient in four or five consecutive courses of chemotherapy, measured in mg/m^2."} ;; "Cisplatin with dose > 25 mg/m^2"

(declare-const patient_has_received_dacarbazine_in_consecutive_courses_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received dacarbazine as part of highly emetogenic chemotherapy in four or five consecutive courses.","when_to_set_to_false":"Set to false if the patient has not received dacarbazine as part of highly emetogenic chemotherapy in four or five consecutive courses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received dacarbazine in four or five consecutive courses.","meaning":"Boolean indicating whether the patient has received dacarbazine as part of highly emetogenic chemotherapy in four or five consecutive courses."} ;; "Dacarbazine"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition of highly emetogenic chemotherapy in consecutive courses (exhaustive subcategories)
(assert
  (! (= patient_has_received_highly_emetogenic_chemotherapy_in_consecutive_courses_now
        (or
          patient_has_received_carboplatin_in_consecutive_courses_now
          (< patient_has_received_cyclophosphamide_in_consecutive_courses_now_with_dose_value_recorded_now_withunit_mg_per_m2 1500.0)
          (> patient_has_received_cytarabine_in_consecutive_courses_now_with_dose_value_recorded_now_withunit_g_per_m2 1.0)
          patient_has_received_daunorubicin_in_consecutive_courses_now
          patient_has_received_doxorubicin_in_consecutive_courses_now
          patient_has_received_epirubicin_in_consecutive_courses_now
          patient_has_received_idarubicin_in_consecutive_courses_now
          patient_has_received_ifosfamide_in_consecutive_courses_now
          patient_has_received_mitoxantrone_in_consecutive_courses_now
          (> patient_has_received_methotrexate_in_consecutive_courses_now_with_dose_value_recorded_now_withunit_mg_per_m2 1000.0)
          (> patient_has_received_cisplatin_in_consecutive_courses_now_with_dose_value_recorded_now_withunit_mg_per_m2 25.0)
          (> patient_has_received_cyclophosphamide_in_consecutive_courses_now_with_dose_value_recorded_now_withunit_mg_per_m2 1500.0)
          patient_has_received_dacarbazine_in_consecutive_courses_now
        ))
     :named REQ2_AUXILIARY0)) ;; "highly emetogenic type of chemotherapy with exhaustive subcategories (Carboplatin, Cyclophosphamide with dose < 1500 mg/m^2, Cytarabine with dose > 1 g/m^2, Daunorubicin, Doxorubicin, Epirubicin, Idarubicin, Ifosfamide, Mitoxantrone, Methotrexate with dose > 1000 mg/m^2, Cisplatin with dose > 25 mg/m^2, Cyclophosphamide with dose > 1500 mg/m^2, Dacarbazine)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Must have received chemotherapy in four or five consecutive courses
(assert
  (! (or (= patient_has_received_consecutive_courses_of_chemotherapy_value_recorded_now_withunit_count 4)
         (= patient_has_received_consecutive_courses_of_chemotherapy_value_recorded_now_withunit_count 5))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "four consecutive courses OR five consecutive courses"

;; Component 1: Must have received chemotherapy that includes at least one moderate emetogenic type OR highly emetogenic type (as defined above)
(assert
  (! (or patient_has_received_moderate_emetogenic_chemotherapy_in_consecutive_courses_now
         patient_has_received_highly_emetogenic_chemotherapy_in_consecutive_courses_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "includes at least one of the following moderate emetogenic type of chemotherapy OR highly emetogenic type of chemotherapy (exhaustive list above)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_understands_norwegian Bool) ;; {"when_to_set_to_true":"Set to true if the patient understands Norwegian.","when_to_set_to_false":"Set to false if the patient does not understand Norwegian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient understands Norwegian.","meaning":"Boolean indicating whether the patient understands Norwegian."} ;; "the patient must understand Norwegian"
(declare-const patient_understands_danish Bool) ;; {"when_to_set_to_true":"Set to true if the patient understands Danish.","when_to_set_to_false":"Set to false if the patient does not understand Danish.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient understands Danish.","meaning":"Boolean indicating whether the patient understands Danish."} ;; "the patient must understand Danish"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (or patient_understands_norwegian
         patient_understands_danish)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must (understand Norwegian OR understand Danish)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_able_to_read_norwegian_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to read Norwegian.","when_to_set_to_false":"Set to false if the patient is currently not able to read Norwegian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to read Norwegian.","meaning":"Boolean indicating whether the patient is currently able to read Norwegian."} ;; "be able to read Norwegian"
(declare-const patient_is_able_to_read_danish_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to read Danish.","when_to_set_to_false":"Set to false if the patient is currently not able to read Danish.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to read Danish.","meaning":"Boolean indicating whether the patient is currently able to read Danish."} ;; "be able to read Danish"
(declare-const parent_is_able_to_read_norwegian_now Bool) ;; {"when_to_set_to_true":"Set to true if at least one parent of the patient is currently able to read Norwegian.","when_to_set_to_false":"Set to false if neither parent of the patient is currently able to read Norwegian.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any parent of the patient is currently able to read Norwegian.","meaning":"Boolean indicating whether at least one parent of the patient is currently able to read Norwegian."} ;; "the parents of the patient must be able to read Norwegian"
(declare-const parent_is_able_to_read_danish_now Bool) ;; {"when_to_set_to_true":"Set to true if at least one parent of the patient is currently able to read Danish.","when_to_set_to_false":"Set to false if neither parent of the patient is currently able to read Danish.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any parent of the patient is currently able to read Danish.","meaning":"Boolean indicating whether at least one parent of the patient is currently able to read Danish."} ;; "the parents of the patient must be able to read Danish"

;; ===================== Constraint Assertions (REQ 4) =====================
;; To be included, the patient must ((be able to read Norwegian OR be able to read Danish) OR (the parents of the patient must be able to read Norwegian OR be able to read Danish)).
(assert
  (! (or (or patient_is_able_to_read_norwegian_now
             patient_is_able_to_read_danish_now)
         (or parent_is_able_to_read_norwegian_now
             parent_is_able_to_read_danish_now))
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((be able to read Norwegian OR be able to read Danish) OR (the parents of the patient must be able to read Norwegian OR be able to read Danish))."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_hearing_loss_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hearing loss.","when_to_set_to_false":"Set to false if the patient currently does not have hearing loss.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hearing loss.","meaning":"Boolean indicating whether the patient currently has hearing loss."} ;; "hearing impairment"
(declare-const patient_has_finding_of_hearing_loss_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hearing loss is significant.","when_to_set_to_false":"Set to false if the patient's current hearing loss is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hearing loss is significant.","meaning":"Boolean indicating whether the patient's current hearing loss is significant."} ;; "significant hearing impairment"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_hearing_loss_now@@significant
         patient_has_finding_of_hearing_loss_now)
     :named REQ5_AUXILIARY0)) ;; "significant hearing impairment" implies "hearing impairment"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: To be included, the patient must NOT have significant hearing impairment.
(assert
  (! (not patient_has_finding_of_hearing_loss_now@@significant)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have significant hearing impairment."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const parents_of_patient_have_provided_informed_written_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the parents of the patient have provided informed written consent at the current time.","when_to_set_to_false":"Set to false if the parents of the patient have not provided informed written consent at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the parents of the patient have provided informed written consent at the current time.","meaning":"Boolean indicating whether the parents of the patient have provided informed written consent at the current time."} ;; "the parents of the patient must provide informed written consent"
(declare-const patient_has_provided_informed_written_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed written consent at the current time.","when_to_set_to_false":"Set to false if the patient has not provided informed written consent at the current time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed written consent at the current time.","meaning":"Boolean indicating whether the patient has provided informed written consent at the current time."} ;; "if aged ≥ 16 years, provide informed written consent"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Component 0: If patient is aged ≥ 16 years, the patient must provide informed written consent
(assert
  (! (or (< patient_age_value_recorded_now_in_years 16)
         patient_has_provided_informed_written_consent_now)
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if aged ≥ 16 years, provide informed written consent"

;; Component 1: The parents of the patient must provide informed written consent
(assert
  (! parents_of_patient_have_provided_informed_written_consent_now
     :named REQ6_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the parents of the patient must provide informed written consent"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_provided_verbal_confirmation_of_written_informed_consent_prior_to_enrolment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided subsequent verbal confirmation of written informed consent prior to enrolment in the study.","when_to_set_to_false":"Set to false if the patient has not provided subsequent verbal confirmation of written informed consent prior to enrolment in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided subsequent verbal confirmation of written informed consent prior to enrolment in the study.","meaning":"Boolean indicating whether the patient has provided subsequent verbal confirmation of written informed consent prior to enrolment in the study."} ;; "subsequent verbal confirmation of written informed consent before enrolment in the study"
(declare-const patient_has_provided_written_informed_consent_prior_to_enrolment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent prior to enrolment in the study.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent prior to enrolment in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent prior to enrolment in the study.","meaning":"Boolean indicating whether the patient has provided written informed consent prior to enrolment in the study."} ;; "written informed consent before enrolment in the study"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (and patient_has_provided_verbal_confirmation_of_written_informed_consent_prior_to_enrolment
          patient_has_provided_written_informed_consent_prior_to_enrolment)
     :named REQ7_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must provide subsequent verbal confirmation of written informed consent before enrolment in the study"
