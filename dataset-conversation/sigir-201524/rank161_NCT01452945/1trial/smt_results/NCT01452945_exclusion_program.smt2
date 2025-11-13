;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_undergoing_home_oxygen_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving home oxygen therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving home oxygen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving home oxygen therapy.","meaning":"Boolean indicating whether the patient is currently receiving home oxygen therapy."} ;; "home oxygen therapy"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_undergoing_home_oxygen_therapy_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving home oxygen therapy at baseline."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_cyanotic_congenital_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cyanotic congenital heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have cyanotic congenital heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cyanotic congenital heart disease.","meaning":"Boolean indicating whether the patient currently has cyanotic congenital heart disease."} ;; "cyanotic congenital cardiac disease"
(declare-const patient_has_finding_of_tetralogy_of_fallot_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tetralogy of Fallot.","when_to_set_to_false":"Set to false if the patient currently does not have tetralogy of Fallot.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tetralogy of Fallot.","meaning":"Boolean indicating whether the patient currently has tetralogy of Fallot."} ;; "tetralogy of Fallot"
(declare-const patient_has_finding_of_total_anomalous_pulmonary_venous_return_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has total anomalous pulmonary venous return.","when_to_set_to_false":"Set to false if the patient currently does not have total anomalous pulmonary venous return.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has total anomalous pulmonary venous return.","meaning":"Boolean indicating whether the patient currently has total anomalous pulmonary venous return."} ;; "total anomalous pulmonary venous return"
(declare-const patient_has_finding_of_hypoplastic_left_heart_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypoplastic left heart syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have hypoplastic left heart syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypoplastic left heart syndrome.","meaning":"Boolean indicating whether the patient currently has hypoplastic left heart syndrome."} ;; "hypoplastic left heart syndrome"
(declare-const patient_has_finding_of_complete_transposition_of_great_vessels_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has complete transposition of the great vessels.","when_to_set_to_false":"Set to false if the patient currently does not have complete transposition of the great vessels.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has complete transposition of the great vessels.","meaning":"Boolean indicating whether the patient currently has complete transposition of the great vessels."} ;; "dextro-transposition of the great arteries"
(declare-const patient_has_finding_of_congenital_atresia_of_tricuspid_valve_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congenital atresia of tricuspid valve.","when_to_set_to_false":"Set to false if the patient currently does not have congenital atresia of tricuspid valve.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congenital atresia of tricuspid valve.","meaning":"Boolean indicating whether the patient currently has congenital atresia of tricuspid valve."} ;; "tricuspid atresia"
(declare-const patient_has_finding_of_congenital_atresia_of_pulmonary_artery_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congenital atresia of pulmonary artery.","when_to_set_to_false":"Set to false if the patient currently does not have congenital atresia of pulmonary artery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congenital atresia of pulmonary artery.","meaning":"Boolean indicating whether the patient currently has congenital atresia of pulmonary artery."} ;; "pulmonary atresia"
(declare-const patient_has_finding_of_pulmonic_valve_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonic valve stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have pulmonic valve stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonic valve stenosis.","meaning":"Boolean indicating whether the patient currently has pulmonic valve stenosis."} ;; "pulmonary stenosis"
(declare-const patient_has_finding_of_pulmonic_valve_stenosis_now@@critical Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pulmonic valve stenosis and the stenosis is critical.","when_to_set_to_false":"Set to false if the patient currently has pulmonic valve stenosis but it is not critical.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pulmonic valve stenosis is critical.","meaning":"Boolean indicating whether the patient currently has critical pulmonic valve stenosis."} ;; "critical pulmonary stenosis"
(declare-const patient_has_finding_of_ventricular_septal_defect_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ventricular septal defect.","when_to_set_to_false":"Set to false if the patient currently does not have ventricular septal defect.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ventricular septal defect.","meaning":"Boolean indicating whether the patient currently has ventricular septal defect."} ;; "ventricular septal defect"
(declare-const patient_has_finding_of_atrial_septal_defect_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has atrial septal defect.","when_to_set_to_false":"Set to false if the patient currently does not have atrial septal defect.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atrial septal defect.","meaning":"Boolean indicating whether the patient currently has atrial septal defect."} ;; "atrial septal defect"
(declare-const patient_has_finding_of_coarctation_of_aorta_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has coarctation of the aorta.","when_to_set_to_false":"Set to false if the patient currently does not have coarctation of the aorta.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has coarctation of the aorta.","meaning":"Boolean indicating whether the patient currently has coarctation of the aorta."} ;; "coarctation of the aorta"
(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart disease.","meaning":"Boolean indicating whether the patient currently has heart disease."} ;; "cardiac disease"
(declare-const patient_has_finding_of_heart_disease_now@@only_cardiac_disease_present Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart disease and it is the only cardiac disease present.","when_to_set_to_false":"Set to false if the patient currently has heart disease but other cardiac diseases are also present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether heart disease is the only cardiac disease present.","meaning":"Boolean indicating whether the patient currently has heart disease and it is the only cardiac disease present."} ;; "only cardiac disease is ..."

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples: listed diseases are examples of cyanotic congenital cardiac disease
(assert
(! (=> (or patient_has_finding_of_tetralogy_of_fallot_now
          patient_has_finding_of_total_anomalous_pulmonary_venous_return_now
          patient_has_finding_of_hypoplastic_left_heart_syndrome_now
          patient_has_finding_of_complete_transposition_of_great_vessels_now
          patient_has_finding_of_congenital_atresia_of_tricuspid_valve_now
          patient_has_finding_of_congenital_atresia_of_pulmonary_artery_now
          patient_has_finding_of_pulmonic_valve_stenosis_now@@critical)
    patient_has_finding_of_cyanotic_congenital_heart_disease_now)
:named REQ1_AUXILIARY0)) ;; "including: tetralogy of Fallot OR total anomalous pulmonary venous return OR hypoplastic left heart syndrome OR dextro-transposition of the great arteries OR tricuspid atresia OR pulmonary atresia OR critical pulmonary stenosis"

;; Qualifier variable for critical pulmonic valve stenosis implies stem variable
(assert
(! (=> patient_has_finding_of_pulmonic_valve_stenosis_now@@critical
       patient_has_finding_of_pulmonic_valve_stenosis_now)
:named REQ1_AUXILIARY1)) ;; "critical pulmonary stenosis"

;; Qualifier variable for only cardiac disease present implies stem variable
(assert
(! (=> patient_has_finding_of_heart_disease_now@@only_cardiac_disease_present
       patient_has_finding_of_heart_disease_now)
:named REQ1_AUXILIARY2)) ;; "only cardiac disease is ..."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have cyanotic congenital cardiac disease, UNLESS the ONLY cardiac disease is VSD or ASD or coarctation of the aorta
(assert
(! (not
      (and patient_has_finding_of_cyanotic_congenital_heart_disease_now
           (not (and patient_has_finding_of_heart_disease_now@@only_cardiac_disease_present
                     (or patient_has_finding_of_ventricular_septal_defect_now
                         patient_has_finding_of_atrial_septal_defect_now
                         patient_has_finding_of_coarctation_of_aorta_now)))))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cyanotic congenital cardiac disease (including: ...), but NOT if the only cardiac disease is ventricular septal defect OR atrial septal defect OR coarctation of the aorta."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_endotracheal_tube_in_place_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an endotracheal tube in place.","when_to_set_to_false":"Set to false if the patient does not currently have an endotracheal tube in place.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an endotracheal tube in place.","meaning":"Boolean indicating whether the patient currently has an endotracheal tube in place."} ;; "the patient has an endotracheal tube in place"
(declare-const patient_is_undergoing_incision_of_trachea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a tracheostomy (incision of trachea) in place.","when_to_set_to_false":"Set to false if the patient does not currently have a tracheostomy (incision of trachea) in place.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a tracheostomy (incision of trachea) in place.","meaning":"Boolean indicating whether the patient currently has a tracheostomy (incision of trachea) in place."} ;; "the patient has a tracheostomy in place"
(declare-const patient_is_undergoing_artificial_respiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving mechanical ventilation (artificial respiration).","when_to_set_to_false":"Set to false if the patient is not currently receiving mechanical ventilation (artificial respiration).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving mechanical ventilation (artificial respiration).","meaning":"Boolean indicating whether the patient is currently receiving mechanical ventilation (artificial respiration)."} ;; "the patient is receiving mechanical ventilation"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_endotracheal_tube_in_place_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an endotracheal tube in place."

(assert
  (! (not patient_is_undergoing_incision_of_trachea_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a tracheostomy in place."

(assert
  (! (not patient_is_undergoing_artificial_respiration_now)
     :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving mechanical ventilation."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_been_transferred_from_outside_hospital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient was transferred from an outside hospital for the current admission.","when_to_set_to_false":"Set to false if the patient was not transferred from an outside hospital for the current admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was transferred from an outside hospital for the current admission.","meaning":"Boolean indicating whether the patient was transferred from an outside hospital for the current admission."} ;; "The patient is excluded if the patient was transferred from an outside hospital."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_has_been_transferred_from_outside_hospital_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient was transferred from an outside hospital."
