;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_atherosclerosis_of_artery_of_lower_limb_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has atherosclerosis of the arteries of the lower limb.","when_to_set_to_false":"Set to false if the patient currently does not have atherosclerosis of the arteries of the lower limb.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atherosclerosis of the arteries of the lower limb.","meaning":"Boolean indicating whether the patient currently has atherosclerosis of the arteries of the lower limb."}  ;; "obliterating lower extremity atherosclerosis"
(declare-const patient_has_finding_of_atherosclerosis_of_artery_of_lower_limb_now@@classified_by_fontaine_classification Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lower limb atherosclerosis is classified according to the Fontaine classification.","when_to_set_to_false":"Set to false if the patient's lower limb atherosclerosis is not classified according to the Fontaine classification.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's lower limb atherosclerosis is classified by the Fontaine system.","meaning":"Boolean indicating whether the patient's lower limb atherosclerosis is classified according to the Fontaine classification."}  ;; "on Fontaine classification"
(declare-const patient_has_finding_of_atherosclerosis_of_artery_of_lower_limb_now@@stage_iib Bool) ;; {"when_to_set_to_true":"Set to true if the patient's lower limb atherosclerosis is at stage IIB according to the Fontaine classification.","when_to_set_to_false":"Set to false if the patient's lower limb atherosclerosis is not at stage IIB according to the Fontaine classification.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's lower limb atherosclerosis is at stage IIB.","meaning":"Boolean indicating whether the patient's lower limb atherosclerosis is at stage IIB (Fontaine classification)."}  ;; "stage IIB (on Fontaine classification)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable: classified_by_fontaine_classification
(assert
  (! (=> patient_has_finding_of_atherosclerosis_of_artery_of_lower_limb_now@@classified_by_fontaine_classification
         patient_has_finding_of_atherosclerosis_of_artery_of_lower_limb_now)
     :named REQ0_AUXILIARY0)) ;; "on Fontaine classification"

;; Qualifier variable implies stem variable: stage_iib
(assert
  (! (=> patient_has_finding_of_atherosclerosis_of_artery_of_lower_limb_now@@stage_iib
         patient_has_finding_of_atherosclerosis_of_artery_of_lower_limb_now)
     :named REQ0_AUXILIARY1)) ;; "stage IIB (on Fontaine classification)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (and patient_has_finding_of_atherosclerosis_of_artery_of_lower_limb_now@@classified_by_fontaine_classification
          patient_has_finding_of_atherosclerosis_of_artery_of_lower_limb_now@@stage_iib)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "obliterating lower extremity atherosclerosis stage IIB (on Fontaine classification)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const painless_walking_distance_value_recorded_now_in_meters Real) ;; {"when_to_set_to_value":"Set to the numeric value (in meters) of the patient's painless walking distance as measured or reported at the current time.","when_to_set_to_null":"Set to null if the patient's painless walking distance is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the patient's painless walking distance in meters, recorded at the current time."}  ;; "painless walking distance ≥ 10 meters AND ≤ 50 meters"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: painless walking distance ≥ 10 meters
(assert
  (! (>= painless_walking_distance_value_recorded_now_in_meters 10.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "painless walking distance ≥ 10 meters"

;; Component 1: painless walking distance ≤ 50 meters
(assert
  (! (<= painless_walking_distance_value_recorded_now_in_meters 50.0)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "painless walking distance ≤ 50 meters"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_dorsalis_pulse_absent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has absence of pulse on the dorsalis pedis artery.","when_to_set_to_false":"Set to false if the patient currently does not have absence of pulse on the dorsalis pedis artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has absence of pulse on the dorsalis pedis artery.","meaning":"Boolean indicating whether the patient currently has absence of pulse on the dorsalis pedis artery."} ;; "absence of pulse on dorsalis pedis artery"
(declare-const patient_has_finding_of_posterior_tibial_pulse_absent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has absence of pulse on the tibialis posterior artery.","when_to_set_to_false":"Set to false if the patient currently does not have absence of pulse on the tibialis posterior artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has absence of pulse on the tibialis posterior artery.","meaning":"Boolean indicating whether the patient currently has absence of pulse on the tibialis posterior artery."} ;; "absence of pulse on tibialis posterior artery"
(declare-const patient_has_finding_of_popliteal_pulse_absent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has absence of pulse on the popliteal artery.","when_to_set_to_false":"Set to false if the patient currently does not have absence of pulse on the popliteal artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has absence of pulse on the popliteal artery.","meaning":"Boolean indicating whether the patient currently has absence of pulse on the popliteal artery."} ;; "absence of pulse on popliteal artery"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_finding_of_dorsalis_pulse_absent_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "absence of pulse on dorsalis pedis artery"
(assert
  (! patient_has_finding_of_posterior_tibial_pulse_absent_now
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "absence of pulse on tibialis posterior artery"
(assert
  (! patient_has_finding_of_popliteal_pulse_absent_now
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "absence of pulse on popliteal artery"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_resting_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ischemia at rest (resting ischemia).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ischemia at rest (resting ischemia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ischemia at rest (resting ischemia).","meaning":"Boolean indicating whether the patient currently has ischemia at rest (resting ischemia) now."} ;; "absence of ischemia at rest"
(declare-const patient_has_finding_of_necrotic_changes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has necrotic changes.","when_to_set_to_false":"Set to false if the patient currently does not have necrotic changes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has necrotic changes.","meaning":"Boolean indicating whether the patient currently has necrotic changes now."} ;; "absence of necrotic changes"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: To be included, the patient must have absence of ischemia at rest.
(assert
  (! (not patient_has_finding_of_resting_ischemia_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "absence of ischemia at rest"

;; Component 1: To be included, the patient must have absence of necrotic changes.
(assert
  (! (not patient_has_finding_of_necrotic_changes_now)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "absence of necrotic changes"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_distal_form_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mainly distal form of disease, defined as lesion of superficial femoral artery OR lesion of popliteal artery OR lesion of anticnemion arteries.","when_to_set_to_false":"Set to false if the patient currently does not have a mainly distal form of disease as defined above.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mainly distal form of disease as defined above.","meaning":"Boolean indicating whether the patient currently has a mainly distal form of disease, as defined by lesion of superficial femoral artery OR lesion of popliteal artery OR lesion of anticnemion arteries."} ;; "mainly distal form of disease (lesion of superficial femoral artery OR lesion of popliteal artery OR lesion of anticnemion arteries)"
(declare-const patient_has_distal_form_of_disease_now@@confirmed_according_to_angiography Bool) ;; {"when_to_set_to_true":"Set to true if the patient's mainly distal form of disease is confirmed according to angiography.","when_to_set_to_false":"Set to false if the patient's mainly distal form of disease is not confirmed according to angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's mainly distal form of disease is confirmed according to angiography.","meaning":"Boolean indicating whether the patient's mainly distal form of disease is confirmed according to angiography."} ;; "mainly distal form of disease confirmed according to angiography"
(declare-const patient_can_undergo_reconstruction_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient can undergo a reconstructive operation now.","when_to_set_to_false":"Set to false if the patient cannot undergo a reconstructive operation now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient can undergo a reconstructive operation now.","meaning":"Boolean indicating whether the patient can undergo a reconstructive operation now."} ;; "can undergo reconstructive operation now"
(declare-const patient_can_undergo_reconstruction_procedure_now@@impossibility_according_to_angiography Bool) ;; {"when_to_set_to_true":"Set to true if the impossibility of reconstructive operation performance now is determined according to angiography.","when_to_set_to_false":"Set to false if the impossibility of reconstructive operation performance now is not determined according to angiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the impossibility of reconstructive operation performance now is determined according to angiography.","meaning":"Boolean indicating whether the impossibility of reconstructive operation performance now is determined according to angiography."} ;; "impossibility of reconstructive operation performance according to angiography"
(declare-const patient_has_undergone_angiography_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone angiography now.","when_to_set_to_false":"Set to false if the patient has not undergone angiography now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone angiography now.","meaning":"Boolean indicating whether the patient has undergone angiography now."} ;; "has undergone angiography now"
(declare-const patient_has_undergone_angiography_now@@testifies_to_impossibility_of_reconstruction_procedure_performance Bool) ;; {"when_to_set_to_true":"Set to true if the angiography performed now testifies to the impossibility of reconstructive operation performance.","when_to_set_to_false":"Set to false if the angiography performed now does not testify to the impossibility of reconstructive operation performance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angiography performed now testifies to the impossibility of reconstructive operation performance.","meaning":"Boolean indicating whether the angiography performed now testifies to the impossibility of reconstructive operation performance."} ;; "angiography testifies to impossibility of reconstructive operation performance"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable (distal form of disease confirmed according to angiography)
(assert
  (! (=> patient_has_distal_form_of_disease_now@@confirmed_according_to_angiography
         patient_has_distal_form_of_disease_now)
     :named REQ4_AUXILIARY0)) ;; "mainly distal form of disease confirmed according to angiography implies mainly distal form of disease"

;; Qualifier variable implies corresponding stem variable (impossibility of reconstructive operation according to angiography)
(assert
  (! (=> patient_can_undergo_reconstruction_procedure_now@@impossibility_according_to_angiography
         (not patient_can_undergo_reconstruction_procedure_now))
     :named REQ4_AUXILIARY1)) ;; "impossibility of reconstructive operation according to angiography implies cannot undergo reconstructive operation now"

;; Qualifier variable implies corresponding stem variable (angiography testifies to impossibility)
(assert
  (! (=> patient_has_undergone_angiography_now@@testifies_to_impossibility_of_reconstruction_procedure_performance
         patient_has_undergone_angiography_now)
     :named REQ4_AUXILIARY2)) ;; "angiography testifies to impossibility implies angiography performed now"

;; Impossibility of reconstructive operation according to angiography is equivalent to angiography testifying to impossibility
(assert
  (! (= patient_can_undergo_reconstruction_procedure_now@@impossibility_according_to_angiography
        patient_has_undergone_angiography_now@@testifies_to_impossibility_of_reconstruction_procedure_performance)
     :named REQ4_AUXILIARY3)) ;; "impossibility of reconstructive operation according to angiography ≡ angiography testifies to impossibility"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Inclusion: patient must have mainly distal form of disease confirmed by angiography AND impossibility of reconstructive operation performance according to angiography
(assert
  (! (and patient_has_distal_form_of_disease_now@@confirmed_according_to_angiography
          patient_can_undergo_reconstruction_procedure_now@@impossibility_according_to_angiography)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "mainly distal form of disease confirmed by angiography AND impossibility of reconstructive operation performance according to angiography"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_undergone_lumbar_sympathectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone lumbar sympathectomy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone lumbar sympathectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone lumbar sympathectomy in the past.","meaning":"Boolean indicating whether the patient has undergone lumbar sympathectomy at any time in the past."} ;; "lumbar sympathectomy executed previously"
(declare-const patient_has_undergone_tibial_bone_osteoperforations_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone tibial bone osteoperforations at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone tibial bone osteoperforations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone tibial bone osteoperforations in the past.","meaning":"Boolean indicating whether the patient has undergone tibial bone osteoperforations at any time in the past."} ;; "tibial bone osteoperforations executed previously"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_undergone_lumbar_sympathectomy_inthehistory
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have had lumbar sympathectomy executed previously."

(assert
  (! patient_has_undergone_tibial_bone_osteoperforations_inthehistory
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have had tibial bone osteoperforations executed previously."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_heavy_cigarette_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a heavy cigarette smoker.","when_to_set_to_false":"Set to false if the patient is currently not a heavy cigarette smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a heavy cigarette smoker.","meaning":"Boolean indicating whether the patient is currently a heavy cigarette smoker."} ;; "heavy smoker"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_has_finding_of_heavy_cigarette_smoker_now
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a heavy smoker."
