;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_atrial_fibrillation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with atrial fibrillation at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with atrial fibrillation at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with atrial fibrillation.","meaning":"Boolean indicating whether the patient has ever been diagnosed with atrial fibrillation in their medical history."} ;; "the patient has a history of atrial fibrillation"

(declare-const patient_has_diagnosis_of_atrial_flutter_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with atrial flutter at any point in their medical history, regardless of the type of atrial flutter.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with atrial flutter at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with atrial flutter.","meaning":"Boolean indicating whether the patient has ever been diagnosed with atrial flutter in their medical history."} ;; "the patient has a history of atrial flutter irrespective of type"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (or patient_has_diagnosis_of_atrial_fibrillation_inthehistory
              patient_has_diagnosis_of_atrial_flutter_inthehistory))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of atrial fibrillation) OR (the patient has a history of atrial flutter irrespective of type)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_cardiac_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cardiac pacemaker implanted.","when_to_set_to_false":"Set to false if the patient currently does not have a cardiac pacemaker implanted.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cardiac pacemaker implanted.","meaning":"Boolean indicating whether the patient currently has a cardiac pacemaker implanted."} ;; "the patient has a cardiac pacemaker"
(declare-const patient_has_cardiac_defibrillator_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cardiac defibrillator implanted.","when_to_set_to_false":"Set to false if the patient currently does not have a cardiac defibrillator implanted.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cardiac defibrillator implanted.","meaning":"Boolean indicating whether the patient currently has a cardiac defibrillator implanted."} ;; "the patient has a cardiac defibrillator"
(declare-const patient_has_cardiac_resynchronization_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cardiac re-synchronization therapy (CRT) in place.","when_to_set_to_false":"Set to false if the patient currently does not have cardiac re-synchronization therapy (CRT) in place.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cardiac re-synchronization therapy (CRT) in place.","meaning":"Boolean indicating whether the patient currently has cardiac re-synchronization therapy (CRT) in place."} ;; "with or without cardiac re-synchronization therapy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_cardiac_pacemaker_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a cardiac pacemaker."

(assert
(! (not patient_has_cardiac_defibrillator_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a cardiac defibrillator."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_contraindication_to_oral_anticoagulation_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to oral anticoagulation therapy.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to oral anticoagulation therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to oral anticoagulation therapy.","meaning":"Boolean indicating whether the patient currently has a contraindication to oral anticoagulation therapy."} ;; "the patient has a contraindication to oral anticoagulation therapy"

(declare-const patient_has_undergone_anticoagulant_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone anticoagulant therapy at any time in their history, regardless of route.","when_to_set_to_false":"Set to false if the patient has never undergone anticoagulant therapy at any time in their history, regardless of route.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone anticoagulant therapy in their history.","meaning":"Boolean indicating whether the patient has ever undergone anticoagulant therapy at any time in their history, regardless of route."} ;; "anticoagulation therapy"

(declare-const patient_has_undergone_anticoagulant_therapy_inthehistory@@route_is_oral Bool) ;; {"when_to_set_to_true":"Set to true if the anticoagulant therapy undergone by the patient was administered via the oral route.","when_to_set_to_false":"Set to false if the anticoagulant therapy undergone by the patient was not administered via the oral route.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the anticoagulant therapy was administered orally.","meaning":"Boolean indicating whether the anticoagulant therapy undergone by the patient was administered via the oral route."} ;; "anticoagulation therapy" with qualifier "route is oral"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_contraindication_to_oral_anticoagulation_therapy_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to oral anticoagulation therapy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_undergoing_anticoagulant_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving any anticoagulant therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving any anticoagulant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving anticoagulant therapy.","meaning":"Boolean indicating whether the patient is currently undergoing anticoagulant therapy."} ;; "the patient is receiving anticoagulation therapy"
(declare-const patient_is_undergoing_anticoagulant_therapy_now@@with_vitamin_k_antagonist Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving anticoagulant therapy and the agent is a vitamin K antagonist.","when_to_set_to_false":"Set to false if the patient is currently receiving anticoagulant therapy but the agent is not a vitamin K antagonist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the agent is a vitamin K antagonist.","meaning":"Boolean indicating whether the patient's current anticoagulant therapy is with vitamin K antagonists."} ;; "the patient is receiving anticoagulation therapy with vitamin K antagonists"
(declare-const patient_is_undergoing_anticoagulant_therapy_now@@with_direct_oral_anticoagulant Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving anticoagulant therapy and the agent is a direct oral anticoagulant.","when_to_set_to_false":"Set to false if the patient is currently receiving anticoagulant therapy but the agent is not a direct oral anticoagulant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the agent is a direct oral anticoagulant.","meaning":"Boolean indicating whether the patient's current anticoagulant therapy is with direct oral anticoagulants."} ;; "the patient is receiving anticoagulation therapy with direct oral anticoagulants"
(declare-const patient_is_exposed_to_direct_acting_anticoagulant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to direct acting anticoagulants.","when_to_set_to_false":"Set to false if the patient is currently not exposed to direct acting anticoagulants.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to direct acting anticoagulants.","meaning":"Boolean indicating whether the patient is currently exposed to direct acting anticoagulants."} ;; "direct oral anticoagulants"
(declare-const patient_is_undergoing_low_molecular_weight_heparin_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving low molecular weight heparin therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving low molecular weight heparin therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving low molecular weight heparin therapy.","meaning":"Boolean indicating whether the patient is currently undergoing low molecular weight heparin therapy."} ;; "the patient is receiving anticoagulation therapy with low-molecular-weight heparins"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable for vitamin K antagonists
(assert
(! (=> patient_is_undergoing_anticoagulant_therapy_now@@with_vitamin_k_antagonist
     patient_is_undergoing_anticoagulant_therapy_now)
   :named REQ3_AUXILIARY0)) ;; "the patient is receiving anticoagulation therapy with vitamin K antagonists"

;; Qualifier variables imply corresponding stem variable for direct oral anticoagulants
(assert
(! (=> patient_is_undergoing_anticoagulant_therapy_now@@with_direct_oral_anticoagulant
     patient_is_undergoing_anticoagulant_therapy_now)
   :named REQ3_AUXILIARY1)) ;; "the patient is receiving anticoagulation therapy with direct oral anticoagulants"

;; Direct oral anticoagulant exposure implies qualifier variable
(assert
(! (=> patient_is_exposed_to_direct_acting_anticoagulant_now
     patient_is_undergoing_anticoagulant_therapy_now@@with_direct_oral_anticoagulant)
   :named REQ3_AUXILIARY2)) ;; "direct oral anticoagulants"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT be receiving anticoagulation therapy with vitamin K antagonists
(assert
(! (not patient_is_undergoing_anticoagulant_therapy_now@@with_vitamin_k_antagonist)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient is receiving anticoagulation therapy with vitamin K antagonists"

;; Exclusion: patient must NOT be receiving anticoagulation therapy with direct oral anticoagulants
(assert
(! (not patient_is_undergoing_anticoagulant_therapy_now@@with_direct_oral_anticoagulant)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is receiving anticoagulation therapy with direct oral anticoagulants"

;; Exclusion: patient must NOT be receiving anticoagulation therapy with low-molecular-weight heparins
(assert
(! (not patient_is_undergoing_low_molecular_weight_heparin_therapy_now)
   :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient is receiving anticoagulation therapy with low-molecular-weight heparins"

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of renal failure syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of renal failure syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of renal failure syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of renal failure syndrome."} ;; "renal failure"
(declare-const patient_has_diagnosis_of_renal_failure_syndrome_now@@treated_with_permanent_dialysis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's renal failure syndrome is treated with permanent dialysis.","when_to_set_to_false":"Set to false if the patient's renal failure syndrome is not treated with permanent dialysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's renal failure syndrome is treated with permanent dialysis.","meaning":"Boolean indicating whether the patient's renal failure syndrome is treated with permanent dialysis."} ;; "renal failure treated with permanent dialysis"
(declare-const patient_is_undergoing_dialysis_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing dialysis procedure.","when_to_set_to_false":"Set to false if the patient is currently not undergoing dialysis procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing dialysis procedure.","meaning":"Boolean indicating whether the patient is currently undergoing dialysis procedure."} ;; "dialysis"
(declare-const patient_is_undergoing_dialysis_procedure_now@@permanent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dialysis procedure is permanent.","when_to_set_to_false":"Set to false if the patient's dialysis procedure is not permanent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dialysis procedure is permanent.","meaning":"Boolean indicating whether the patient's dialysis procedure is permanent."} ;; "permanent dialysis"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_renal_failure_syndrome_now@@treated_with_permanent_dialysis
      patient_has_diagnosis_of_renal_failure_syndrome_now)
:named REQ4_AUXILIARY0)) ;; "renal failure treated with permanent dialysis" implies "renal failure"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_dialysis_procedure_now@@permanent
      patient_is_undergoing_dialysis_procedure_now)
:named REQ4_AUXILIARY1)) ;; "permanent dialysis" implies "dialysis"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_renal_failure_syndrome_now@@treated_with_permanent_dialysis)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal failure treated with permanent dialysis."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_congenital_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congenital heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have congenital heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congenital heart disease.","meaning":"Boolean indicating whether the patient currently has congenital heart disease."} ;; "the patient has uncorrected congenital heart disease"
(declare-const patient_has_finding_of_congenital_heart_disease_now@@uncorrected Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congenital heart disease and the condition is uncorrected.","when_to_set_to_false":"Set to false if the patient currently has congenital heart disease and the condition is corrected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's congenital heart disease is uncorrected.","meaning":"Boolean indicating whether the patient's congenital heart disease is uncorrected."} ;; "the patient has uncorrected congenital heart disease"
(declare-const patient_has_finding_of_severe_valvular_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe valvular stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have severe valvular stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe valvular stenosis.","meaning":"Boolean indicating whether the patient currently has severe valvular stenosis."} ;; "the patient has severe valvular stenosis"
(declare-const patient_has_finding_of_hypertrophic_obstructive_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypertrophic obstructive cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have hypertrophic obstructive cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypertrophic obstructive cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has hypertrophic obstructive cardiomyopathy."} ;; "the patient has obstructive cardiomyopathy"
(declare-const patient_has_finding_of_myocarditis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has myocarditis.","when_to_set_to_false":"Set to false if the patient currently does not have myocarditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has myocarditis.","meaning":"Boolean indicating whether the patient currently has myocarditis."} ;; "the patient has active myocarditis"
(declare-const patient_has_finding_of_myocarditis_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has myocarditis and the condition is active.","when_to_set_to_false":"Set to false if the patient currently has myocarditis and the condition is inactive or resolved.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's myocarditis is active.","meaning":"Boolean indicating whether the patient's myocarditis is active."} ;; "the patient has active myocarditis"
(declare-const patient_has_finding_of_constrictive_pericarditis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has constrictive pericarditis.","when_to_set_to_false":"Set to false if the patient currently does not have constrictive pericarditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has constrictive pericarditis.","meaning":"Boolean indicating whether the patient currently has constrictive pericarditis."} ;; "the patient has constrictive pericarditis"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies stem variable for congenital heart disease
(assert
(! (=> patient_has_finding_of_congenital_heart_disease_now@@uncorrected
      patient_has_finding_of_congenital_heart_disease_now)
    :named REQ5_AUXILIARY0)) ;; "the patient has uncorrected congenital heart disease"

;; Qualifier variable implies stem variable for myocarditis
(assert
(! (=> patient_has_finding_of_myocarditis_now@@active
      patient_has_finding_of_myocarditis_now)
    :named REQ5_AUXILIARY1)) ;; "the patient has active myocarditis"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have uncorrected congenital heart disease
(assert
(! (not patient_has_finding_of_congenital_heart_disease_now@@uncorrected)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has uncorrected congenital heart disease"

;; Exclusion: patient must NOT have severe valvular stenosis
(assert
(! (not patient_has_finding_of_severe_valvular_stenosis_now)
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has severe valvular stenosis"

;; Exclusion: patient must NOT have obstructive cardiomyopathy
(assert
(! (not patient_has_finding_of_hypertrophic_obstructive_cardiomyopathy_now)
    :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has obstructive cardiomyopathy"

;; Exclusion: patient must NOT have active myocarditis
(assert
(! (not patient_has_finding_of_myocarditis_now@@active)
    :named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient has active myocarditis"

;; Exclusion: patient must NOT have constrictive pericarditis
(assert
(! (not patient_has_finding_of_constrictive_pericarditis_now)
    :named REQ5_COMPONENT4_OTHER_REQUIREMENTS)) ;; "the patient has constrictive pericarditis"

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_undergoing_surgical_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a surgical procedure.","when_to_set_to_false":"Set to false if the patient is not currently undergoing a surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a surgical procedure.","meaning":"Boolean indicating whether the patient is currently undergoing a surgical procedure."} ;; "surgery"
(declare-const patient_is_undergoing_surgical_procedure_now@@on_waiting_list Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently on a waiting list for a surgical procedure.","when_to_set_to_false":"Set to false if the patient is not currently on a waiting list for a surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is on a waiting list for a surgical procedure.","meaning":"Boolean indicating whether the patient is currently on a waiting list for a surgical procedure."} ;; "on a waiting list for major surgery"
(declare-const patient_is_undergoing_surgical_procedure_now@@major Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure for which the patient is on a waiting list is classified as major.","when_to_set_to_false":"Set to false if the surgical procedure for which the patient is on a waiting list is not classified as major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure is classified as major.","meaning":"Boolean indicating whether the surgical procedure for which the patient is on a waiting list is classified as major."} ;; "major surgery"
(declare-const patient_is_undergoing_operation_on_heart_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a cardiac surgical procedure.","when_to_set_to_false":"Set to false if the patient is not currently undergoing a cardiac surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a cardiac surgical procedure.","meaning":"Boolean indicating whether the patient is currently undergoing a cardiac surgical procedure."} ;; "cardiac surgery"
(declare-const patient_is_undergoing_operation_on_heart_now@@on_waiting_list Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently on a waiting list for a cardiac surgical procedure.","when_to_set_to_false":"Set to false if the patient is not currently on a waiting list for a cardiac surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is on a waiting list for a cardiac surgical procedure.","meaning":"Boolean indicating whether the patient is currently on a waiting list for a cardiac surgical procedure."} ;; "on a waiting list for cardiac surgery"
(declare-const patient_is_undergoing_surgical_procedure_on_thorax_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a thoracic surgical procedure.","when_to_set_to_false":"Set to false if the patient is not currently undergoing a thoracic surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a thoracic surgical procedure.","meaning":"Boolean indicating whether the patient is currently undergoing a thoracic surgical procedure."} ;; "thoracic surgery"
(declare-const patient_is_undergoing_surgical_procedure_on_thorax_now@@on_waiting_list Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently on a waiting list for a thoracic surgical procedure.","when_to_set_to_false":"Set to false if the patient is not currently on a waiting list for a thoracic surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is on a waiting list for a thoracic surgical procedure.","meaning":"Boolean indicating whether the patient is currently on a waiting list for a thoracic surgical procedure."} ;; "on a waiting list for thoracic surgery"
(declare-const patient_is_undergoing_operation_on_abdominal_region_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing an abdominal surgical procedure.","when_to_set_to_false":"Set to false if the patient is not currently undergoing an abdominal surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing an abdominal surgical procedure.","meaning":"Boolean indicating whether the patient is currently undergoing an abdominal surgical procedure."} ;; "abdominal surgery"
(declare-const patient_is_undergoing_operation_on_abdominal_region_now@@on_waiting_list Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently on a waiting list for an abdominal surgical procedure.","when_to_set_to_false":"Set to false if the patient is not currently on a waiting list for an abdominal surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is on a waiting list for an abdominal surgical procedure.","meaning":"Boolean indicating whether the patient is currently on a waiting list for an abdominal surgical procedure."} ;; "on a waiting list for abdominal surgery"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Exhaustive subcategories: being on a waiting list for major surgery ≡ (waiting list for cardiac OR thoracic OR abdominal surgery)
(assert
(! (= (and patient_is_undergoing_surgical_procedure_now@@on_waiting_list
           patient_is_undergoing_surgical_procedure_now@@major)
      (or patient_is_undergoing_operation_on_heart_now@@on_waiting_list
          patient_is_undergoing_surgical_procedure_on_thorax_now@@on_waiting_list
          patient_is_undergoing_operation_on_abdominal_region_now@@on_waiting_list))
:named REQ6_AUXILIARY0)) ;; "on a waiting list for major surgery with exhaustive subcategories (cardiac surgery, thoracic surgery, abdominal surgery)."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_undergoing_operation_on_heart_now@@on_waiting_list
       patient_is_undergoing_operation_on_heart_now)
:named REQ6_AUXILIARY1)) ;; "on a waiting list for cardiac surgery"

(assert
(! (=> patient_is_undergoing_surgical_procedure_on_thorax_now@@on_waiting_list
       patient_is_undergoing_surgical_procedure_on_thorax_now)
:named REQ6_AUXILIARY2)) ;; "on a waiting list for thoracic surgery"

(assert
(! (=> patient_is_undergoing_operation_on_abdominal_region_now@@on_waiting_list
       patient_is_undergoing_operation_on_abdominal_region_now)
:named REQ6_AUXILIARY3)) ;; "on a waiting list for abdominal surgery"

;; Qualifier variables for major surgery imply stem variable
(assert
(! (=> (and patient_is_undergoing_surgical_procedure_now@@on_waiting_list
            patient_is_undergoing_surgical_procedure_now@@major)
       patient_is_undergoing_surgical_procedure_now)
:named REQ6_AUXILIARY4)) ;; "on a waiting list for major surgery"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (and patient_is_undergoing_surgical_procedure_now@@on_waiting_list
             patient_is_undergoing_surgical_procedure_now@@major))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on a waiting list for major surgery with exhaustive subcategories (cardiac surgery, thoracic surgery, abdominal surgery)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_undergone_operation_on_heart_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a cardiac surgery procedure within the past three months from inclusion.","when_to_set_to_false":"Set to false if the patient has not undergone a cardiac surgery procedure within the past three months from inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a cardiac surgery procedure within the past three months from inclusion.","meaning":"Boolean indicating whether the patient has undergone a cardiac surgery procedure within the past three months."} ;; "cardiac surgery performed within three months from inclusion"
(declare-const patient_has_undergone_surgical_procedure_on_thorax_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a thoracic surgery procedure within the past three months from inclusion.","when_to_set_to_false":"Set to false if the patient has not undergone a thoracic surgery procedure within the past three months from inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a thoracic surgery procedure within the past three months from inclusion.","meaning":"Boolean indicating whether the patient has undergone a thoracic surgery procedure within the past three months."} ;; "thoracic surgery performed within three months from inclusion"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_undergone_operation_on_heart_inthepast3months)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had cardiac surgery performed within three months from inclusion."

(assert
(! (not patient_has_undergone_surgical_procedure_on_thorax_inthepast3months)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had thoracic surgery performed within three months from inclusion."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_transplant_of_kidney_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a kidney transplantation procedure at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a kidney transplantation procedure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a kidney transplantation procedure.","meaning":"Boolean indicating whether the patient has ever undergone a kidney transplantation procedure at any time in their history."} ;; "kidney transplant"
(declare-const patient_has_undergone_transplant_of_lung_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a lung transplantation procedure at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a lung transplantation procedure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a lung transplantation procedure.","meaning":"Boolean indicating whether the patient has ever undergone a lung transplantation procedure at any time in their history."} ;; "lung transplant"
(declare-const patient_has_undergone_transplantation_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone any transplantation procedure at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone any transplantation procedure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone any transplantation procedure.","meaning":"Boolean indicating whether the patient has ever undergone any transplantation procedure at any time in their history."} ;; "transplant"
(declare-const patient_has_undergone_transplantation_of_heart_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a heart transplantation procedure at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a heart transplantation procedure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a heart transplantation procedure.","meaning":"Boolean indicating whether the patient has ever undergone a heart transplantation procedure at any time in their history."} ;; "heart transplant"
(declare-const patient_has_undergone_transplantation_of_liver_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a liver transplantation procedure at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a liver transplantation procedure at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a liver transplantation procedure.","meaning":"Boolean indicating whether the patient has ever undergone a liver transplantation procedure at any time in their history."} ;; "liver transplant"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Exhaustive subcategories define the umbrella exactly:
(assert
(! (= patient_has_undergone_transplantation_inthehistory
     (or patient_has_undergone_transplant_of_lung_inthehistory
         patient_has_undergone_transplantation_of_liver_inthehistory
         patient_has_undergone_transplantation_of_heart_inthehistory
         patient_has_undergone_transplant_of_kidney_inthehistory))
   :named REQ8_AUXILIARY0)) ;; "with exhaustive subcategories (lung transplant, liver transplant, heart transplant, kidney transplant)."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_undergone_transplantation_inthehistory)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had any major organ transplant with exhaustive subcategories (lung transplant, liver transplant, heart transplant, kidney transplant)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_undergone_administration_of_antineoplastic_agent_inthepast6months@@is_cytotoxic Bool) ;; {"when_to_set_to_true":"Set to true if the antineoplastic agent administered within the past 6 months is cytotoxic.","when_to_set_to_false":"Set to false if the antineoplastic agent administered within the past 6 months is not cytotoxic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antineoplastic agent administered within the past 6 months is cytotoxic.","meaning":"Boolean indicating whether the antineoplastic agent administered within the past 6 months is cytotoxic."} ;; "the patient has received cytotoxic chemotherapy for treatment of a malignancy within six months before randomization"

(declare-const patient_has_undergone_administration_of_antineoplastic_agent_inthepast6months@@is_cytostatic Bool) ;; {"when_to_set_to_true":"Set to true if the antineoplastic agent administered within the past 6 months is cytostatic.","when_to_set_to_false":"Set to false if the antineoplastic agent administered within the past 6 months is not cytostatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antineoplastic agent administered within the past 6 months is cytostatic.","meaning":"Boolean indicating whether the antineoplastic agent administered within the past 6 months is cytostatic."} ;; "the patient has received cytostatic chemotherapy for treatment of a malignancy within six months before randomization"

(declare-const patient_has_undergone_administration_of_antineoplastic_agent_inthepast6months@@for_treatment_of_malignancy Bool) ;; {"when_to_set_to_true":"Set to true if the antineoplastic agent administered within the past 6 months was for treatment of a malignancy.","when_to_set_to_false":"Set to false if the antineoplastic agent administered within the past 6 months was not for treatment of a malignancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antineoplastic agent administered within the past 6 months was for treatment of a malignancy.","meaning":"Boolean indicating whether the antineoplastic agent administered within the past 6 months was for treatment of a malignancy."} ;; "for treatment of a malignancy"

(declare-const patient_has_undergone_radiation_therapy_inthepast6months@@for_treatment_of_malignancy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone radiation therapy within the past 6 months for treatment of a malignancy.","when_to_set_to_false":"Set to false if the patient has not undergone radiation therapy within the past 6 months for treatment of a malignancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone radiation therapy within the past 6 months for treatment of a malignancy.","meaning":"Boolean indicating whether the patient has undergone radiation therapy within the past 6 months for treatment of a malignancy."} ;; "the patient has received radiation therapy for treatment of a malignancy within six months before randomization"

(declare-const patient_has_clinical_evidence_of_current_malignancy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical evidence of malignancy.","when_to_set_to_false":"Set to false if the patient does not currently have clinical evidence of malignancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical evidence of malignancy.","meaning":"Boolean indicating whether the patient currently has clinical evidence of malignancy."} ;; "the patient has clinical evidence of current malignancy"

(declare-const patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of basal cell carcinoma of the skin at any time in the history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of basal cell carcinoma of the skin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of basal cell carcinoma of the skin.","meaning":"Boolean indicating whether the patient has a diagnosis of basal cell carcinoma of the skin at any time in the history."} ;; "basal cell carcinoma of the skin"

(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of squamous cell carcinoma of the skin at any time in the history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of squamous cell carcinoma of the skin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of squamous cell carcinoma of the skin.","meaning":"Boolean indicating whether the patient has a diagnosis of squamous cell carcinoma of the skin at any time in the history."} ;; "squamous cell carcinoma of the skin"

(declare-const patient_has_diagnosis_of_cervical_intraepithelial_neoplasia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of cervical intraepithelial neoplasia at any time in the history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of cervical intraepithelial neoplasia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of cervical intraepithelial neoplasia.","meaning":"Boolean indicating whether the patient has a diagnosis of cervical intraepithelial neoplasia at any time in the history."} ;; "cervical intraepithelial neoplasia"

(declare-const patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a diagnosis of carcinoma of prostate (prostate cancer) at any time in the history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of carcinoma of prostate (prostate cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of carcinoma of prostate (prostate cancer).","meaning":"Boolean indicating whether the patient has a diagnosis of carcinoma of prostate (prostate cancer) at any time in the history."} ;; "prostate cancer"

(declare-const patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory@@is_localized Bool) ;; {"when_to_set_to_true":"Set to true if the carcinoma of prostate is localized.","when_to_set_to_false":"Set to false if the carcinoma of prostate is not localized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carcinoma of prostate is localized.","meaning":"Boolean indicating whether the carcinoma of prostate is localized."} ;; "localized prostate cancer"

(declare-const patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory@@is_stable Bool) ;; {"when_to_set_to_true":"Set to true if the carcinoma of prostate is stable.","when_to_set_to_false":"Set to false if the carcinoma of prostate is not stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carcinoma of prostate is stable.","meaning":"Boolean indicating whether the carcinoma of prostate is stable."} ;; "stable prostate cancer"

(declare-const patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory@@life_expectancy_greater_than_2_5_years_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a life expectancy of greater than two and a half years in the opinion of the investigator.","when_to_set_to_false":"Set to false if the patient does not have a life expectancy of greater than two and a half years in the opinion of the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a life expectancy of greater than two and a half years in the opinion of the investigator.","meaning":"Boolean indicating whether the patient has a life expectancy of greater than two and a half years in the opinion of the investigator."} ;; "life expectancy of greater than two and a half years in the opinion of the investigator"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Definition of stable, localized prostate cancer with life expectancy > 2.5 years in investigator's opinion
(assert
(! (= patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory@@is_stable
(and patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory
     patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory@@is_localized))
:named REQ9_AUXILIARY0)) ;; "stable, localized prostate cancer"

(assert
(! (= patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory@@life_expectancy_greater_than_2_5_years_investigator_opinion
(and patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory
     patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory@@is_stable
     patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory@@is_localized
     patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory@@life_expectancy_greater_than_2_5_years_investigator_opinion))
:named REQ9_AUXILIARY1)) ;; "stable, localized prostate cancer with a life expectancy of greater than two and a half years in the opinion of the investigator"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient must NOT satisfy any exclusion condition UNLESS the malignancy is one of the exceptions
(assert
(! (not
     (and
       (or
         (and patient_has_undergone_administration_of_antineoplastic_agent_inthepast6months@@is_cytotoxic
              patient_has_undergone_administration_of_antineoplastic_agent_inthepast6months@@for_treatment_of_malignancy)
         (and patient_has_undergone_administration_of_antineoplastic_agent_inthepast6months@@is_cytostatic
              patient_has_undergone_administration_of_antineoplastic_agent_inthepast6months@@for_treatment_of_malignancy)
         patient_has_undergone_radiation_therapy_inthepast6months@@for_treatment_of_malignancy
         patient_has_clinical_evidence_of_current_malignancy_now)
       (not
         (or
           patient_has_diagnosis_of_basal_cell_carcinoma_of_skin_inthehistory
           patient_has_diagnosis_of_squamous_cell_carcinoma_of_skin_inthehistory
           patient_has_diagnosis_of_cervical_intraepithelial_neoplasia_inthehistory
           (and patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory@@is_stable
                patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory@@is_localized
                patient_has_diagnosis_of_carcinoma_of_prostate_inthehistory@@life_expectancy_greater_than_2_5_years_investigator_opinion)
         )
       )
     )
   )
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has received cytotoxic chemotherapy for treatment of a malignancy within six months before randomization) OR (the patient has received cytostatic chemotherapy for treatment of a malignancy within six months before randomization) OR (the patient has received radiation therapy for treatment of a malignancy within six months before randomization) OR (the patient has clinical evidence of current malignancy)) EXCEPT if the malignancy is basal cell carcinoma of the skin, squamous cell carcinoma of the skin, cervical intraepithelial neoplasia, or stable, localized prostate cancer with a life expectancy of greater than two and a half years in the opinion of the investigator."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} ;; "life expectancy < 6 months"
(declare-const patient_longevity_value_recorded_now_withunit_months Real) ;; {"when_to_set_to_value":"Set to the estimated number of months if the patient's current life expectancy is documented or can be determined.","when_to_set_to_null":"Set to null if the patient's current life expectancy in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current life expectancy in months."} ;; "life expectancy < 6 months"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (< patient_longevity_value_recorded_now_withunit_months 6))
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has life expectancy < 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently known to be positive for human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient is currently known not to have human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection."} ;; "the patient is known to be human immunodeficiency virus infection positive"
(declare-const patient_expected_survival_value_recorded_now_due_to_human_immunodeficiency_virus_infection_withunit_years Real) ;; {"when_to_set_to_value":"Set to the number of years if the patient's expected survival due to human immunodeficiency virus infection is documented or can be determined now.","when_to_set_to_null":"Set to null if the patient's expected survival due to human immunodeficiency virus infection is unknown, not documented, or cannot be determined now.","meaning":"Numeric value representing the patient's expected survival in years due to human immunodeficiency virus infection, recorded now."} ;; "expected survival < 5 years due to human immunodeficiency virus infection"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
  (! (not (and patient_has_finding_of_human_immunodeficiency_virus_infection_now
               (< patient_expected_survival_value_recorded_now_due_to_human_immunodeficiency_virus_infection_withunit_years 5)))
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is known to be human immunodeficiency virus infection positive) AND (the patient has expected survival < 5 years due to human immunodeficiency virus infection)."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_alcohol_abuse_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of alcohol abuse within the past 3 months.","when_to_set_to_false":"Set to false if the patient does not have a history of alcohol abuse within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alcohol abuse within the past 3 months.","meaning":"Boolean indicating whether the patient has a history of alcohol abuse within the past 3 months."} ;; "history of alcohol abuse within 3 months"
(declare-const patient_has_finding_of_alcohol_abuse_inthepast3months@@based_on_self_reporting Bool) ;; {"when_to_set_to_true":"Set to true if the finding of alcohol abuse within the past 3 months is based on self-reporting.","when_to_set_to_false":"Set to false if the finding of alcohol abuse within the past 3 months is not based on self-reporting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is based on self-reporting.","meaning":"Boolean indicating whether the finding of alcohol abuse within the past 3 months is based on self-reporting."} ;; "history of alcohol abuse within 3 months based on self-reporting"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of drug abuse within the past 3 months.","when_to_set_to_false":"Set to false if the patient does not have a history of drug abuse within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of drug abuse within the past 3 months.","meaning":"Boolean indicating whether the patient has a history of drug abuse within the past 3 months."} ;; "history of drug abuse within 3 months"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast3months@@based_on_self_reporting Bool) ;; {"when_to_set_to_true":"Set to true if the finding of drug abuse within the past 3 months is based on self-reporting.","when_to_set_to_false":"Set to false if the finding of drug abuse within the past 3 months is not based on self-reporting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding is based on self-reporting.","meaning":"Boolean indicating whether the finding of drug abuse within the past 3 months is based on self-reporting."} ;; "history of drug abuse within 3 months based on self-reporting"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable for alcohol abuse
(assert
(! (=> patient_has_finding_of_alcohol_abuse_inthepast3months@@based_on_self_reporting
       patient_has_finding_of_alcohol_abuse_inthepast3months)
   :named REQ12_AUXILIARY0)) ;; "history of alcohol abuse within 3 months based on self-reporting"

;; Qualifier variable implies corresponding stem variable for drug abuse
(assert
(! (=> patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast3months@@based_on_self_reporting
       patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast3months)
   :named REQ12_AUXILIARY1)) ;; "history of drug abuse within 3 months based on self-reporting"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_alcohol_abuse_inthepast3months@@based_on_self_reporting)
   :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has history of alcohol abuse within 3 months based on self-reporting."

(assert
(! (not patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthepast3months@@based_on_self_reporting)
   :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has history of drug abuse within 3 months based on self-reporting."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any condition (other than dementia or psychiatric illness).","when_to_set_to_false":"Set to false if the patient currently does not have any condition (other than dementia or psychiatric illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any condition (other than dementia or psychiatric illness).","meaning":"Boolean indicating whether the patient currently has any condition (other than dementia or psychiatric illness)."} ;; "any condition"

(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia."} ;; "dementia"

(declare-const patient_has_diagnosis_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any mental disorder (psychiatric illness).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any mental disorder (psychiatric illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any mental disorder (psychiatric illness).","meaning":"Boolean indicating whether the patient currently has a diagnosis of any mental disorder (psychiatric illness)."} ;; "psychiatric illness"

(declare-const patient_has_situation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in any situation.","when_to_set_to_false":"Set to false if the patient is currently not in any situation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in any situation.","meaning":"Boolean indicating whether the patient is currently in any situation."} ;; "any situation"

(declare-const patient_has_situation_now@@in_investigator_opinion_could_put_patient_at_significant_risk_or_confound_study_results_or_interfere_with_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in any situation and, in the investigator's opinion, the situation could put the patient at significant risk, confound the study results, or interfere significantly with the patient's participation in the study.","when_to_set_to_false":"Set to false if the patient is currently in any situation and, in the investigator's opinion, the situation could not put the patient at significant risk, confound the study results, or interfere significantly with the patient's participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the investigator's opinion, the situation could put the patient at significant risk, confound the study results, or interfere significantly with the patient's participation in the study.","meaning":"Boolean indicating whether the patient is currently in any situation, and in the investigator's opinion, the situation could put the patient at significant risk, confound the study results, or interfere significantly with the patient's participation in the study."} ;; "any situation that, in the investigator's opinion, could (put the patient at significant risk OR confound the study results OR interfere significantly with the patient's participation in the study)"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Non-exhaustive examples: psychiatric illness, dementia are examples of "any condition"
(assert
(! (=> (or patient_has_diagnosis_of_mental_disorder_now
          patient_has_diagnosis_of_dementia_now)
    patient_has_condition_now)
:named REQ13_AUXILIARY0)) ;; "with non-exhaustive examples (psychiatric illness, dementia)"

;; Qualifier variable implies corresponding stem variable for situation
(assert
(! (=> patient_has_situation_now@@in_investigator_opinion_could_put_patient_at_significant_risk_or_confound_study_results_or_interfere_with_participation
    patient_has_situation_now)
:named REQ13_AUXILIARY1)) ;; "any situation that, in the investigator's opinion, could (put the patient at significant risk OR confound the study results OR interfere significantly with the patient's participation in the study)"

;; ===================== Constraint Assertions (REQ 13) =====================
;; Exclusion: patient must NOT have any condition (including psychiatric illness, dementia) OR any situation that, in investigator's opinion, could put at risk/confound/interfere
(assert
(! (not (or patient_has_condition_now
            patient_has_situation_now@@in_investigator_opinion_could_put_patient_at_significant_risk_or_confound_study_results_or_interfere_with_participation))
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition with non-exhaustive examples (psychiatric illness, dementia) OR any situation that, in the investigator's opinion, could (put the patient at significant risk OR confound the study results OR interfere significantly with the patient's participation in the study)."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_is_unwilling_to_participate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to participate in the study.","when_to_set_to_false":"Set to false if the patient is currently willing to participate in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unwilling to participate in the study.","meaning":"Boolean indicating whether the patient is currently unwilling to participate in the study."} ;; "the patient is unwilling to participate"
(declare-const patient_does_not_understand_danish_language_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently does not understand the Danish language.","when_to_set_to_false":"Set to false if the patient currently understands the Danish language.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently understands the Danish language.","meaning":"Boolean indicating whether the patient currently does not understand the Danish language."} ;; "the patient does not understand Danish language"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_is_unwilling_to_participate_now)
:named REQ14_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is unwilling to participate"

(assert
(! (not patient_does_not_understand_danish_language_now)
:named REQ14_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient does not understand Danish language"
