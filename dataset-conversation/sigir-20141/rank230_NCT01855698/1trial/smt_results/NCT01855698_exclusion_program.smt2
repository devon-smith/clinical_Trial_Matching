;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_transient_cerebral_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of transient cerebral ischemia (transient ischemic attack).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of transient cerebral ischemia (transient ischemic attack).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has transient cerebral ischemia (transient ischemic attack).","meaning":"Boolean indicating whether the patient currently has transient cerebral ischemia (transient ischemic attack)."} ;; "transient ischemic attack"

(declare-const patient_has_finding_of_transient_cerebral_ischemia_now@@without_computed_tomography_scan_signs Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has transient cerebral ischemia (transient ischemic attack) and there are no computed tomography scan signs present.","when_to_set_to_false":"Set to false if the patient currently has transient cerebral ischemia (transient ischemic attack) and there are computed tomography scan signs present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether computed tomography scan signs are present in the context of transient cerebral ischemia (transient ischemic attack).","meaning":"Boolean indicating whether the patient currently has transient cerebral ischemia (transient ischemic attack) without computed tomography scan signs."} ;; "transient ischemic attack without computed tomography scan signs"

(declare-const patient_has_finding_of_transient_cerebral_ischemia_now@@without_nuclear_magnetic_resonance_scan_signs Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has transient cerebral ischemia (transient ischemic attack) and there are no nuclear magnetic resonance scan signs present.","when_to_set_to_false":"Set to false if the patient currently has transient cerebral ischemia (transient ischemic attack) and there are nuclear magnetic resonance scan signs present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether nuclear magnetic resonance scan signs are present in the context of transient cerebral ischemia (transient ischemic attack).","meaning":"Boolean indicating whether the patient currently has transient cerebral ischemia (transient ischemic attack) without nuclear magnetic resonance scan signs."} ;; "transient ischemic attack without nuclear magnetic resonance scan signs"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_transient_cerebral_ischemia_now@@without_computed_tomography_scan_signs
      patient_has_finding_of_transient_cerebral_ischemia_now)
   :named REQ0_AUXILIARY0)) ;; "transient ischemic attack without computed tomography scan signs"

(assert
(! (=> patient_has_finding_of_transient_cerebral_ischemia_now@@without_nuclear_magnetic_resonance_scan_signs
      patient_has_finding_of_transient_cerebral_ischemia_now)
   :named REQ0_AUXILIARY1)) ;; "transient ischemic attack without nuclear magnetic resonance scan signs"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_transient_cerebral_ischemia_now@@without_computed_tomography_scan_signs)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has transient ischemic attack without computed tomography scan signs."

(assert
(! (not patient_has_finding_of_transient_cerebral_ischemia_now@@without_nuclear_magnetic_resonance_scan_signs)
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has transient ischemic attack without nuclear magnetic resonance scan signs."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_superficial_vein_thrombosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of superficial vein thrombosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of superficial vein thrombosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has superficial vein thrombosis.","meaning":"Boolean indicating whether the patient currently has superficial vein thrombosis."} ;; "superficial vein thrombosis"
(declare-const patient_has_finding_of_thrombosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of thrombosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of thrombosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has thrombosis.","meaning":"Boolean indicating whether the patient currently has thrombosis."} ;; "thrombosis"
(declare-const patient_has_finding_of_thrombosis_now@@evidenced_by_doppler_ultrasound_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has thrombosis and this finding is evidenced by Doppler ultrasound examination.","when_to_set_to_false":"Set to false if the patient currently has thrombosis but it is not evidenced by Doppler ultrasound examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether Doppler ultrasound examination evidences the patient's thrombosis.","meaning":"Boolean indicating whether the patient's current thrombosis is evidenced by Doppler ultrasound examination."} ;; "Doppler ultrasound examination showing evidence of thrombosis"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_thrombosis_now@@evidenced_by_doppler_ultrasound_examination
      patient_has_finding_of_thrombosis_now)
:named REQ1_AUXILIARY0)) ;; "Doppler ultrasound examination showing evidence of thrombosis""

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have (superficial vein thrombosis AND NOT Doppler ultrasound evidence of thrombosis)
(assert
(! (not (and patient_has_finding_of_superficial_vein_thrombosis_now
             (not patient_has_finding_of_thrombosis_now@@evidenced_by_doppler_ultrasound_examination)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has superficial vein thrombosis) AND (the patient does NOT have Doppler ultrasound examination showing evidence of thrombosis)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_receiving_antithrombotic_prophylaxis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving antithrombotic prophylaxis.","when_to_set_to_false":"Set to false if the patient is currently not receiving antithrombotic prophylaxis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving antithrombotic prophylaxis.","meaning":"Boolean indicating whether the patient is currently receiving antithrombotic prophylaxis."} ;; "receives antithrombotic prophylaxis"

(declare-const patient_is_receiving_antithrombotic_prophylaxis_now@@administered_only_locally_for_central_venous_line Bool) ;; {"when_to_set_to_true":"Set to true if the antithrombotic prophylaxis is administered only locally for central venous line (e.g., central venous catheter flushing with heparin).","when_to_set_to_false":"Set to false if the antithrombotic prophylaxis is not administered only locally for central venous line (e.g., is systemic or both).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antithrombotic prophylaxis is administered only locally for central venous line.","meaning":"Boolean indicating whether the antithrombotic prophylaxis is administered only locally for central venous line."} ;; "antithrombotic prophylaxis only locally for central venous line (central venous catheter flushing with heparin)"

(declare-const patient_is_undergoing_irrigation_of_vascular_catheter_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing irrigation (flushing) of a vascular catheter.","when_to_set_to_false":"Set to false if the patient is currently not undergoing irrigation (flushing) of a vascular catheter.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing irrigation (flushing) of a vascular catheter.","meaning":"Boolean indicating whether the patient is currently undergoing irrigation (flushing) of a vascular catheter."} ;; "catheter flushing"

(declare-const patient_is_undergoing_irrigation_of_vascular_catheter_now@@performed_only_locally Bool) ;; {"when_to_set_to_true":"Set to true if the irrigation (flushing) of a vascular catheter is performed only locally (e.g., not systemically).","when_to_set_to_false":"Set to false if the irrigation is not performed only locally (e.g., is systemic or both).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the irrigation is performed only locally.","meaning":"Boolean indicating whether the irrigation of a vascular catheter is performed only locally."} ;; "performed only locally"

(declare-const patient_is_undergoing_irrigation_of_vascular_catheter_now@@for_central_venous_line Bool) ;; {"when_to_set_to_true":"Set to true if the irrigation (flushing) of a vascular catheter is performed specifically for a central venous line.","when_to_set_to_false":"Set to false if the irrigation is not performed for a central venous line.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the irrigation is performed for a central venous line.","meaning":"Boolean indicating whether the irrigation of a vascular catheter is performed for a central venous line."} ;; "for central venous line"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_receiving_antithrombotic_prophylaxis_now@@administered_only_locally_for_central_venous_line
      patient_is_receiving_antithrombotic_prophylaxis_now)
:named REQ2_AUXILIARY0)) ;; "antithrombotic prophylaxis only locally for central venous line (central venous catheter flushing with heparin)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_irrigation_of_vascular_catheter_now@@performed_only_locally
      patient_is_undergoing_irrigation_of_vascular_catheter_now)
:named REQ2_AUXILIARY1)) ;; "catheter flushing performed only locally"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_irrigation_of_vascular_catheter_now@@for_central_venous_line
      patient_is_undergoing_irrigation_of_vascular_catheter_now)
:named REQ2_AUXILIARY2)) ;; "catheter flushing for central venous line"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_receiving_antithrombotic_prophylaxis_now@@administered_only_locally_for_central_venous_line)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient receives antithrombotic prophylaxis only locally for central venous line (central venous catheter flushing with heparin)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_blocked_central_line_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has occlusion (blockage) of the central venous catheter.","when_to_set_to_false":"Set to false if the patient currently does not have occlusion (blockage) of the central venous catheter.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has occlusion of the central venous catheter.","meaning":"Boolean indicating whether the patient currently has occlusion (blockage) of the central venous catheter."} ;; "occlusion of the central venous catheter"
(declare-const patient_has_finding_of_venous_thrombosis_due_to_central_venous_access_device_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has deep vein thrombosis that is related to the central venous catheter (i.e., occurs in the deep veins where the catheter is placed).","when_to_set_to_false":"Set to false if the patient currently does not have deep vein thrombosis related to the central venous catheter.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has deep vein thrombosis related to the central venous catheter.","meaning":"Boolean indicating whether the patient currently has deep vein thrombosis related to the central venous catheter."} ;; "central venous catheter-related deep vein thrombosis"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient is excluded if they have occlusion of the central venous catheter UNLESS they have central venous catheter-related deep vein thrombosis
(assert
(! (not (and patient_has_finding_of_blocked_central_line_now
             (not patient_has_finding_of_venous_thrombosis_due_to_central_venous_access_device_now)))
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has occlusion of the central venous catheter UNLESS the patient has central venous catheter-related deep vein thrombosis (thrombosis of the deep veins where the central venous catheter is placed)."
