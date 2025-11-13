;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_patient_unsuitable_for_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently deemed unsuitable for a surgical procedure.","when_to_set_to_false":"Set to false if the patient is currently deemed suitable for a surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently deemed unsuitable for a surgical procedure.","meaning":"Boolean indicating whether the patient is currently deemed unsuitable for a surgical procedure."} ;; "unfit for surgery"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_patient_unsuitable_for_procedure_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is deemed unfit for surgery."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_attempting_conception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently attempting conception as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not attempting conception as documented or reported.","when_to_set_to_null":"Set to null if the patient's current attempt to conceive is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently attempting conception."} ;; "the patient is attempting conception"
(declare-const patient_is_able_to_be_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to become pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not able to become pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current ability to become pregnant is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently able to become pregnant."} ;; "the patient is attempting conception" (for context of ability to conceive)

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_is_pregnant_now
            patient_is_attempting_conception_now))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is pregnant) OR (the patient is attempting conception)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of myocardial infarction at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of myocardial infarction at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a myocardial infarction."} ;; "the patient has any history of myocardial infarction"

(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of undergoing coronary artery bypass graft surgery at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of undergoing coronary artery bypass graft surgery at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass graft surgery.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass graft surgery."} ;; "the patient has any history of coronary artery bypass grafting surgery"

(declare-const patient_has_undergone_coronary_angiography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of undergoing coronary angiography at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of undergoing coronary angiography at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary angiography.","meaning":"Boolean indicating whether the patient has ever undergone coronary angiography."} ;; "the patient has any history of coronary angiography"

(declare-const patient_has_undergone_angioplasty_of_blood_vessel_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of undergoing angioplasty of a blood vessel at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of undergoing angioplasty of a blood vessel at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone angioplasty of a blood vessel.","meaning":"Boolean indicating whether the patient has ever undergone angioplasty of a blood vessel."} ;; "the patient has any history of coronary angioplasty with angioplasty"

(declare-const patient_has_undergone_fluoroscopic_angiography_of_coronary_artery_and_insertion_of_stent_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of undergoing fluoroscopic angiography of the coronary artery with insertion of a stent at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of undergoing fluoroscopic angiography of the coronary artery with insertion of a stent at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone fluoroscopic angiography of the coronary artery with insertion of a stent.","meaning":"Boolean indicating whether the patient has ever undergone fluoroscopic angiography of the coronary artery with insertion of a stent."} ;; "the patient has any history of coronary angiography with stenting"

(declare-const lesion_luminal_diameter_reduction_value_recorded_inthehistory_in_percent_in_coronary_artery Real) ;; {"when_to_set_to_value":"Set to the maximum percentage value of luminal diameter reduction for any lesion in the coronary artery documented in the patient's history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any lesion in the coronary artery has a recorded luminal diameter reduction percentage in the patient's history.","meaning":"Numeric value representing the maximum luminal diameter reduction percentage for any lesion in the coronary artery in the patient's history."} ;; "the patient has any history of any lesion with luminal diameter reduction > 50 % in the coronary artery"

(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of cerebrovascular accident at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of cerebrovascular accident at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a cerebrovascular accident.","meaning":"Boolean indicating whether the patient has ever had a cerebrovascular accident."} ;; "the patient has any history of cerebrovascular accident"

(declare-const patient_has_finding_of_peripheral_vascular_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of peripheral vascular disease at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of peripheral vascular disease at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had peripheral vascular disease.","meaning":"Boolean indicating whether the patient has ever had peripheral vascular disease."} ;; "the patient has any history of peripheral vascular disease"

(declare-const patient_has_finding_of_electrocardiogram_abnormal_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of abnormal electrocardiograms at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of abnormal electrocardiograms at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had abnormal electrocardiograms.","meaning":"Boolean indicating whether the patient has ever had abnormal electrocardiograms."} ;; "the patient has any history of peripheral vascular disease with abnormal electrocardiograms"

(declare-const patient_has_finding_of_echocardiogram_abnormal_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of abnormal echocardiography at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of abnormal echocardiography at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had abnormal echocardiography.","meaning":"Boolean indicating whether the patient has ever had abnormal echocardiography."} ;; "the patient has any history of peripheral vascular disease with abnormal echocardiography"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not
     (or
       patient_has_finding_of_myocardial_infarction_inthehistory
       patient_has_undergone_coronary_artery_bypass_graft_inthehistory
       (and patient_has_undergone_coronary_angiography_inthehistory
            patient_has_undergone_angioplasty_of_blood_vessel_inthehistory)
       patient_has_undergone_fluoroscopic_angiography_of_coronary_artery_and_insertion_of_stent_inthehistory
       (> lesion_luminal_diameter_reduction_value_recorded_inthehistory_in_percent_in_coronary_artery 50)
       patient_has_finding_of_cerebrovascular_accident_inthehistory
       (and patient_has_finding_of_peripheral_vascular_disease_inthehistory
            patient_has_finding_of_electrocardiogram_abnormal_inthehistory)
       (and patient_has_finding_of_peripheral_vascular_disease_inthehistory
            patient_has_finding_of_echocardiogram_abnormal_inthehistory)
     )
   )
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has any history of myocardial infarction) OR (the patient has any history of coronary artery bypass grafting surgery) OR (the patient has any history of coronary angiography with angioplasty) OR (the patient has any history of coronary angiography with stenting) OR (the patient has any history of any lesion with luminal diameter reduction > 50 % in the coronary artery) OR (the patient has any history of cerebrovascular accident) OR (the patient has any history of peripheral vascular disease with abnormal electrocardiograms) OR (the patient has any history of peripheral vascular disease with abnormal echocardiography)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_drug_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any documented history of drug abuse at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of drug abuse at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of drug abuse.","meaning":"Boolean indicating whether the patient has a history of drug abuse."} ;; "the patient has a history of drug abuse"
(declare-const patient_has_finding_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has any documented history of alcohol abuse at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of alcohol abuse at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol abuse.","meaning":"Boolean indicating whether the patient has a history of alcohol abuse."} ;; "the patient has a history of alcohol abuse"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (or patient_has_finding_of_drug_abuse_inthehistory
              patient_has_finding_of_alcohol_abuse_inthehistory))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of drug abuse) OR (the patient has a history of alcohol abuse)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_chronic_liver_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic liver disease.","meaning":"Boolean indicating whether the patient currently has chronic liver disease."} ;; "chronic liver disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_chronic_liver_disease_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic liver disease."
