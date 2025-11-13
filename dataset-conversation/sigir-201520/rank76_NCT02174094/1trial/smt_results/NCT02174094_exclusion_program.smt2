;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_taking_stiripentol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking stiripentol.","when_to_set_to_false":"Set to false if the patient is currently not taking stiripentol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking stiripentol.","meaning":"Boolean indicating whether the patient is currently taking stiripentol."} ;; "the patient is taking stiripentol"
(declare-const patient_is_taking_verapamil_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking verapamil.","when_to_set_to_false":"Set to false if the patient is currently not taking verapamil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking verapamil.","meaning":"Boolean indicating whether the patient is currently taking verapamil."} ;; "the patient is taking verapamil"
(declare-const patient_is_taking_felbamate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking felbamate.","when_to_set_to_false":"Set to false if the patient is currently not taking felbamate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking felbamate.","meaning":"Boolean indicating whether the patient is currently taking felbamate."} ;; "the patient is taking felbatol"
(declare-const patient_has_taken_stiripentol_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken stiripentol at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken stiripentol in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken stiripentol in the past.","meaning":"Boolean indicating whether the patient has taken stiripentol in the past."} ;; "the patient has taken stiripentol in the past"
(declare-const patient_has_taken_verapamil_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken verapamil at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken verapamil in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken verapamil in the past.","meaning":"Boolean indicating whether the patient has taken verapamil in the past."} ;; "the patient has taken verapamil in the past"
(declare-const patient_has_taken_felbamate_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken felbamate at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken felbamate in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken felbamate in the past.","meaning":"Boolean indicating whether the patient has taken felbamate in the past."} ;; "the patient has taken felbatol in the past"
(declare-const patient_has_been_off_stiripentol_for_at_least_five_half_lives Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been off stiripentol for at least five half-lives.","when_to_set_to_false":"Set to false if the patient has not been off stiripentol for at least five half-lives.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been off stiripentol for at least five half-lives.","meaning":"Boolean indicating whether the patient has been off stiripentol for at least five half-lives."} ;; "the patient has NOT been off stiripentol for at least five half-lives"
(declare-const patient_has_been_off_verapamil_for_at_least_five_half_lives Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been off verapamil for at least five half-lives.","when_to_set_to_false":"Set to false if the patient has not been off verapamil for at least five half-lives.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been off verapamil for at least five half-lives.","meaning":"Boolean indicating whether the patient has been off verapamil for at least five half-lives."} ;; "the patient has NOT been off verapamil for at least five half-lives"
(declare-const patient_has_been_off_felbamate_for_at_least_five_half_lives Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been off felbamate for at least five half-lives.","when_to_set_to_false":"Set to false if the patient has not been off felbamate for at least five half-lives.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been off felbamate for at least five half-lives.","meaning":"Boolean indicating whether the patient has been off felbamate for at least five half-lives."} ;; "the patient has NOT been off felbatol for at least five half-lives"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or patient_is_taking_stiripentol_now
            patient_is_taking_verapamil_now
            patient_is_taking_felbamate_now
            (and patient_has_taken_stiripentol_inthehistory (not patient_has_been_off_stiripentol_for_at_least_five_half_lives))
            (and patient_has_taken_verapamil_inthehistory (not patient_has_been_off_verapamil_for_at_least_five_half_lives))
            (and patient_has_taken_felbamate_inthehistory (not patient_has_been_off_felbamate_for_at_least_five_half_lives))
         ))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is taking stiripentol) OR (the patient is taking verapamil) OR (the patient is taking felbatol) OR ((the patient has taken stiripentol in the past) AND (the patient has NOT been off stiripentol for at least five half-lives)) OR ((the patient has taken verapamil in the past) AND (the patient has NOT been off verapamil for at least five half-lives)) OR ((the patient has taken felbatol in the past) AND (the patient has NOT been off felbatol for at least five half-lives)))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_taking_sodium_channel_blocker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a sodium channel blocker.","when_to_set_to_false":"Set to false if the patient is currently not taking a sodium channel blocker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a sodium channel blocker.","meaning":"Boolean indicating whether the patient is currently taking a sodium channel blocker."} ;; "the patient is taking a sodium channel blocker"
(declare-const patient_is_taking_phenytoin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking phenytoin.","when_to_set_to_false":"Set to false if the patient is currently not taking phenytoin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking phenytoin.","meaning":"Boolean indicating whether the patient is currently taking phenytoin."} ;; "the patient is taking phenytoin"
(declare-const patient_is_taking_fosphenytoin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking fosphenytoin.","when_to_set_to_false":"Set to false if the patient is currently not taking fosphenytoin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking fosphenytoin.","meaning":"Boolean indicating whether the patient is currently taking fosphenytoin."} ;; "the patient is taking fosphenytoin"
(declare-const patient_is_taking_carbamazepine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking carbamazepine.","when_to_set_to_false":"Set to false if the patient is currently not taking carbamazepine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking carbamazepine.","meaning":"Boolean indicating whether the patient is currently taking carbamazepine."} ;; "the patient is taking carbamazepine"
(declare-const patient_is_taking_oxcarbazepine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking oxcarbazepine.","when_to_set_to_false":"Set to false if the patient is currently not taking oxcarbazepine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking oxcarbazepine.","meaning":"Boolean indicating whether the patient is currently taking oxcarbazepine."} ;; "the patient is taking oxcarbazepine"
(declare-const patient_is_taking_lamotrigine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a lamotrigine-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a lamotrigine-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a lamotrigine-containing product.","meaning":"Boolean indicating whether the patient is currently taking a lamotrigine-containing product."} ;; "the patient is taking lamotrigine"
(declare-const patient_is_taking_lacosamide_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a lacosamide-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a lacosamide-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a lacosamide-containing product.","meaning":"Boolean indicating whether the patient is currently taking a lacosamide-containing product."} ;; "the patient is taking lacosamide"
(declare-const patient_is_taking_rufinamide_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a rufinamide-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a rufinamide-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a rufinamide-containing product.","meaning":"Boolean indicating whether the patient is currently taking a rufinamide-containing product."} ;; "the patient is taking rufinamide"
(declare-const patient_has_taken_phenytoin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken phenytoin at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken phenytoin in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken phenytoin in the past.","meaning":"Boolean indicating whether the patient has taken phenytoin at any time in the past."} ;; "the patient has taken phenytoin in the past"
(declare-const patient_has_taken_phenytoin_inthehistory@@not_off_for_at_least_five_half_lives Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken phenytoin in the past and has NOT been off phenytoin for at least five half-lives.","when_to_set_to_false":"Set to false if the patient has taken phenytoin in the past and HAS been off phenytoin for at least five half-lives.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been off phenytoin for at least five half-lives after prior use.","meaning":"Boolean indicating whether the patient has NOT been off phenytoin for at least five half-lives after prior use."} ;; "the patient has NOT been off phenytoin for at least five half-lives"
(declare-const patient_has_taken_fosphenytoin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken fosphenytoin at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken fosphenytoin in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken fosphenytoin in the past.","meaning":"Boolean indicating whether the patient has taken fosphenytoin at any time in the past."} ;; "the patient has taken fosphenytoin in the past"
(declare-const patient_has_taken_fosphenytoin_inthehistory@@not_off_for_at_least_five_half_lives Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken fosphenytoin in the past and has NOT been off fosphenytoin for at least five half-lives.","when_to_set_to_false":"Set to false if the patient has taken fosphenytoin in the past and HAS been off fosphenytoin for at least five half-lives.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been off fosphenytoin for at least five half-lives after prior use.","meaning":"Boolean indicating whether the patient has NOT been off fosphenytoin for at least five half-lives after prior use."} ;; "the patient has NOT been off fosphenytoin for at least five half-lives"
(declare-const patient_has_taken_carbamazepine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken carbamazepine at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken carbamazepine in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken carbamazepine in the past.","meaning":"Boolean indicating whether the patient has taken carbamazepine at any time in the past."} ;; "the patient has taken carbamazepine in the past"
(declare-const patient_has_taken_carbamazepine_inthehistory@@not_off_for_at_least_five_half_lives Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken carbamazepine in the past and has NOT been off carbamazepine for at least five half-lives.","when_to_set_to_false":"Set to false if the patient has taken carbamazepine in the past and HAS been off carbamazepine for at least five half-lives.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been off carbamazepine for at least five half-lives after prior use.","meaning":"Boolean indicating whether the patient has NOT been off carbamazepine for at least five half-lives after prior use."} ;; "the patient has NOT been off carbamazepine for at least five half-lives"
(declare-const patient_has_taken_oxcarbazepine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken oxcarbazepine at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken oxcarbazepine in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken oxcarbazepine in the past.","meaning":"Boolean indicating whether the patient has taken oxcarbazepine at any time in the past."} ;; "the patient has taken oxcarbazepine in the past"
(declare-const patient_has_taken_oxcarbazepine_inthehistory@@not_off_for_at_least_five_half_lives Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken oxcarbazepine in the past and has NOT been off oxcarbazepine for at least five half-lives.","when_to_set_to_false":"Set to false if the patient has taken oxcarbazepine in the past and HAS been off oxcarbazepine for at least five half-lives.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been off oxcarbazepine for at least five half-lives after prior use.","meaning":"Boolean indicating whether the patient has NOT been off oxcarbazepine for at least five half-lives after prior use."} ;; "the patient has NOT been off oxcarbazepine for at least five half-lives"
(declare-const patient_has_taken_lamotrigine_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a lamotrigine-containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken a lamotrigine-containing product in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a lamotrigine-containing product in the past.","meaning":"Boolean indicating whether the patient has taken a lamotrigine-containing product at any time in the past."} ;; "the patient has taken lamotrigine in the past"
(declare-const patient_has_taken_lamotrigine_containing_product_inthehistory@@not_off_for_at_least_five_half_lives Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a lamotrigine-containing product in the past and has NOT been off lamotrigine for at least five half-lives.","when_to_set_to_false":"Set to false if the patient has taken a lamotrigine-containing product in the past and HAS been off lamotrigine for at least five half-lives.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been off lamotrigine for at least five half-lives after prior use.","meaning":"Boolean indicating whether the patient has NOT been off lamotrigine for at least five half-lives after prior use."} ;; "the patient has NOT been off lamotrigine for at least five half-lives"
(declare-const patient_has_taken_lacosamide_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a lacosamide-containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken a lacosamide-containing product in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a lacosamide-containing product in the past.","meaning":"Boolean indicating whether the patient has taken a lacosamide-containing product at any time in the past."} ;; "the patient has taken lacosamide in the past"
(declare-const patient_has_taken_lacosamide_containing_product_inthehistory@@not_off_for_at_least_five_half_lives Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a lacosamide-containing product in the past and has NOT been off lacosamide for at least five half-lives.","when_to_set_to_false":"Set to false if the patient has taken a lacosamide-containing product in the past and HAS been off lacosamide for at least five half-lives.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been off lacosamide for at least five half-lives after prior use.","meaning":"Boolean indicating whether the patient has NOT been off lacosamide for at least five half-lives after prior use."} ;; "the patient has NOT been off lacosamide for at least five half-lives"
(declare-const patient_has_taken_rufinamide_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a rufinamide-containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken a rufinamide-containing product in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a rufinamide-containing product in the past.","meaning":"Boolean indicating whether the patient has taken a rufinamide-containing product at any time in the past."} ;; "the patient has taken rufinamide in the past"
(declare-const patient_has_taken_rufinamide_containing_product_inthehistory@@not_off_for_at_least_five_half_lives Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a rufinamide-containing product in the past and has NOT been off rufinamide for at least five half-lives.","when_to_set_to_false":"Set to false if the patient has taken a rufinamide-containing product in the past and HAS been off rufinamide for at least five half-lives.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been off rufinamide for at least five half-lives after prior use.","meaning":"Boolean indicating whether the patient has NOT been off rufinamide for at least five half-lives after prior use."} ;; "the patient has NOT been off rufinamide for at least five half-lives"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_is_taking_phenytoin_now
          patient_is_taking_fosphenytoin_now
          patient_is_taking_carbamazepine_now
          patient_is_taking_oxcarbazepine_now
          patient_is_taking_lamotrigine_containing_product_now
          patient_is_taking_lacosamide_containing_product_now
          patient_is_taking_rufinamide_containing_product_now)
    patient_is_taking_sodium_channel_blocker_now)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (phenytoin, fosphenytoin, carbamazepine, oxcarbamazepine, lamotrigine, lacosamide, rufinamide)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_taken_phenytoin_inthehistory@@not_off_for_at_least_five_half_lives
       patient_has_taken_phenytoin_inthehistory)
:named REQ1_AUXILIARY1)) ;; "the patient has taken phenytoin in the past and has NOT been off phenytoin for at least five half-lives"

(assert
(! (=> patient_has_taken_fosphenytoin_inthehistory@@not_off_for_at_least_five_half_lives
       patient_has_taken_fosphenytoin_inthehistory)
:named REQ1_AUXILIARY2)) ;; "the patient has taken fosphenytoin in the past and has NOT been off fosphenytoin for at least five half-lives"

(assert
(! (=> patient_has_taken_carbamazepine_inthehistory@@not_off_for_at_least_five_half_lives
       patient_has_taken_carbamazepine_inthehistory)
:named REQ1_AUXILIARY3)) ;; "the patient has taken carbamazepine in the past and has NOT been off carbamazepine for at least five half-lives"

(assert
(! (=> patient_has_taken_oxcarbazepine_inthehistory@@not_off_for_at_least_five_half_lives
       patient_has_taken_oxcarbazepine_inthehistory)
:named REQ1_AUXILIARY4)) ;; "the patient has taken oxcarbazepine in the past and has NOT been off oxcarbazepine for at least five half-lives"

(assert
(! (=> patient_has_taken_lamotrigine_containing_product_inthehistory@@not_off_for_at_least_five_half_lives
       patient_has_taken_lamotrigine_containing_product_inthehistory)
:named REQ1_AUXILIARY5)) ;; "the patient has taken lamotrigine in the past and has NOT been off lamotrigine for at least five half-lives"

(assert
(! (=> patient_has_taken_lacosamide_containing_product_inthehistory@@not_off_for_at_least_five_half_lives
       patient_has_taken_lacosamide_containing_product_inthehistory)
:named REQ1_AUXILIARY6)) ;; "the patient has taken lacosamide in the past and has NOT been off lacosamide for at least five half-lives"

(assert
(! (=> patient_has_taken_rufinamide_containing_product_inthehistory@@not_off_for_at_least_five_half_lives
       patient_has_taken_rufinamide_containing_product_inthehistory)
:named REQ1_AUXILIARY7)) ;; "the patient has taken rufinamide in the past and has NOT been off rufinamide for at least five half-lives"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_taking_sodium_channel_blocker_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking a sodium channel blocker with non-exhaustive examples (phenytoin, fosphenytoin, carbamazepine, oxcarbamazepine, lamotrigine, lacosamide, rufinamide)."

(assert
(! (not patient_is_taking_phenytoin_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking phenytoin."

(assert
(! (not patient_is_taking_fosphenytoin_now)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking fosphenytoin."

(assert
(! (not patient_is_taking_carbamazepine_now)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking carbamazepine."

(assert
(! (not patient_is_taking_oxcarbazepine_now)
:named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking oxcarbazepine."

(assert
(! (not patient_is_taking_lamotrigine_containing_product_now)
:named REQ1_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking lamotrigine."

(assert
(! (not patient_is_taking_lacosamide_containing_product_now)
:named REQ1_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking lacosamide."

(assert
(! (not patient_is_taking_rufinamide_containing_product_now)
:named REQ1_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is taking rufinamide."

(assert
(! (not patient_has_taken_phenytoin_inthehistory@@not_off_for_at_least_five_half_lives)
:named REQ1_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has taken phenytoin in the past) AND (the patient has NOT been off phenytoin for at least five half-lives)."

(assert
(! (not patient_has_taken_fosphenytoin_inthehistory@@not_off_for_at_least_five_half_lives)
:named REQ1_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has taken fosphenytoin in the past) AND (the patient has NOT been off fosphenytoin for at least five half-lives)."

(assert
(! (not patient_has_taken_carbamazepine_inthehistory@@not_off_for_at_least_five_half_lives)
:named REQ1_COMPONENT10_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has taken carbamazepine in the past) AND (the patient has NOT been off carbamazepine for at least five half-lives)."

(assert
(! (not patient_has_taken_oxcarbazepine_inthehistory@@not_off_for_at_least_five_half_lives)
:named REQ1_COMPONENT11_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has taken oxcarbazepine in the past) AND (the patient has NOT been off oxcarbazepine for at least five half-lives)."

(assert
(! (not patient_has_taken_lamotrigine_containing_product_inthehistory@@not_off_for_at_least_five_half_lives)
:named REQ1_COMPONENT12_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has taken lamotrigine in the past) AND (the patient has NOT been off lamotrigine for at least five half-lives)."

(assert
(! (not patient_has_taken_lacosamide_containing_product_inthehistory@@not_off_for_at_least_five_half_lives)
:named REQ1_COMPONENT13_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has taken lacosamide in the past) AND (the patient has NOT been off lacosamide for at least five half-lives)."

(assert
(! (not patient_has_taken_rufinamide_containing_product_inthehistory@@not_off_for_at_least_five_half_lives)
:named REQ1_COMPONENT14_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has taken rufinamide in the past) AND (the patient has NOT been off rufinamide for at least five half-lives)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_taking_cannabidiol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking cannabidiol.","when_to_set_to_false":"Set to false if the patient is currently not taking cannabidiol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking cannabidiol.","meaning":"Boolean indicating whether the patient is currently taking cannabidiol."} ;; "the patient is taking cannabidiol"
(declare-const patient_is_taking_medical_marijuana_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking medical marijuana.","when_to_set_to_false":"Set to false if the patient is currently not taking medical marijuana.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking medical marijuana.","meaning":"Boolean indicating whether the patient is currently taking medical marijuana."} ;; "the patient is taking medical marijuana"
(declare-const patient_is_taking_any_drug_that_contains_cannabinoids_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any drug that contains cannabinoids.","when_to_set_to_false":"Set to false if the patient is currently not taking any drug that contains cannabinoids.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any drug that contains cannabinoids.","meaning":"Boolean indicating whether the patient is currently taking any drug that contains cannabinoids."} ;; "the patient is taking any drug that contains cannabinoids"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_taking_cannabidiol_now)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is taking cannabidiol."

(assert
(! (not patient_is_taking_medical_marijuana_now)
:named REQ2_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is taking medical marijuana."

(assert
(! (not patient_is_taking_any_drug_that_contains_cannabinoids_now)
:named REQ2_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is taking any drug that contains cannabinoids."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_long_term_drug_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone long-term drug therapy (chronic treatment) at any time in the history.","when_to_set_to_false":"Set to false if the patient has not undergone long-term drug therapy (chronic treatment) at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone long-term drug therapy (chronic treatment) at any time in the history.","meaning":"Boolean indicating whether the patient has undergone long-term drug therapy (chronic treatment) at any time in the history."} ;; "chronic treatment"
(declare-const patient_has_undergone_long_term_drug_therapy_inthehistory@@duration_greater_than_or_equal_to_two_weeks_for_any_indication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's long-term drug therapy (chronic treatment) lasted greater than or equal to two weeks for any indication.","when_to_set_to_false":"Set to false if the patient's long-term drug therapy (chronic treatment) did not last greater than or equal to two weeks for any indication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the duration of long-term drug therapy (chronic treatment) was greater than or equal to two weeks for any indication.","meaning":"Boolean indicating whether the patient's long-term drug therapy (chronic treatment) lasted greater than or equal to two weeks for any indication."} ;; "duration greater than or equal to two weeks for any indication"
(declare-const patient_has_undergone_long_term_drug_therapy_inthehistory@@occurred_within_at_least_five_half_lives_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's long-term drug therapy (chronic treatment) occurred within at least five half-lives prior to screening.","when_to_set_to_false":"Set to false if the patient's long-term drug therapy (chronic treatment) did not occur within at least five half-lives prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapy occurred within at least five half-lives prior to screening.","meaning":"Boolean indicating whether the patient's long-term drug therapy (chronic treatment) occurred within at least five half-lives prior to screening."} ;; "within at least five half-lives prior to screening"
(declare-const patient_is_exposed_to_benzodiazepine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to benzodiazepine at any time in the history.","when_to_set_to_false":"Set to false if the patient has not been exposed to benzodiazepine at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to benzodiazepine at any time in the history.","meaning":"Boolean indicating whether the patient has been exposed to benzodiazepine at any time in the history."} ;; "benzodiazepine"
(declare-const patient_is_exposed_to_benzodiazepine_inthehistory@@occurred_within_at_least_five_half_lives_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's benzodiazepine exposure occurred within at least five half-lives prior to screening.","when_to_set_to_false":"Set to false if the patient's benzodiazepine exposure did not occur within at least five half-lives prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within at least five half-lives prior to screening.","meaning":"Boolean indicating whether the patient's benzodiazepine exposure occurred within at least five half-lives prior to screening."} ;; "benzodiazepine within at least five half-lives prior to screening"
(declare-const patient_is_exposed_to_benzodiazepine_inthehistory@@not_used_as_rescue_therapy_for_prolonged_seizures Bool) ;; {"when_to_set_to_true":"Set to true if the patient's benzodiazepine exposure was NOT used as rescue therapy for prolonged seizures.","when_to_set_to_false":"Set to false if the patient's benzodiazepine exposure was used as rescue therapy for prolonged seizures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the benzodiazepine was used as rescue therapy for prolonged seizures.","meaning":"Boolean indicating whether the patient's benzodiazepine exposure was NOT used as rescue therapy for prolonged seizures."} ;; "the benzodiazepine was NOT used as rescue therapy for prolonged seizures"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_long_term_drug_therapy_inthehistory@@duration_greater_than_or_equal_to_two_weeks_for_any_indication
      patient_has_undergone_long_term_drug_therapy_inthehistory)
:named REQ3_AUXILIARY0)) ;; "duration greater than or equal to two weeks for any indication"

(assert
(! (=> patient_has_undergone_long_term_drug_therapy_inthehistory@@occurred_within_at_least_five_half_lives_prior_to_screening
      patient_has_undergone_long_term_drug_therapy_inthehistory)
:named REQ3_AUXILIARY1)) ;; "occurred within at least five half-lives prior to screening"

(assert
(! (=> patient_is_exposed_to_benzodiazepine_inthehistory@@occurred_within_at_least_five_half_lives_prior_to_screening
      patient_is_exposed_to_benzodiazepine_inthehistory)
:named REQ3_AUXILIARY2)) ;; "benzodiazepine within at least five half-lives prior to screening"

(assert
(! (=> patient_is_exposed_to_benzodiazepine_inthehistory@@not_used_as_rescue_therapy_for_prolonged_seizures
      patient_is_exposed_to_benzodiazepine_inthehistory)
:named REQ3_AUXILIARY3)) ;; "the benzodiazepine was NOT used as rescue therapy for prolonged seizures"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (and
         patient_has_undergone_long_term_drug_therapy_inthehistory@@duration_greater_than_or_equal_to_two_weeks_for_any_indication
         patient_has_undergone_long_term_drug_therapy_inthehistory@@occurred_within_at_least_five_half_lives_prior_to_screening
         patient_is_exposed_to_benzodiazepine_inthehistory@@occurred_within_at_least_five_half_lives_prior_to_screening
         patient_is_exposed_to_benzodiazepine_inthehistory@@not_used_as_rescue_therapy_for_prolonged_seizures))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has received chronic treatment (duration greater than or equal to two weeks for any indication) with a benzodiazepine within at least five half-lives prior to screening AND the benzodiazepine was NOT used as rescue therapy for prolonged seizures"

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_taken_clobazam_containing_product_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any clobazam-containing product within the past 3 months.","when_to_set_to_false":"Set to false if the patient has not taken any clobazam-containing product within the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any clobazam-containing product within the past 3 months.","meaning":"Boolean indicating whether the patient has taken any clobazam-containing product within the past 3 months."} ;; "the patient has received clobazam within three months prior to the Screening Visit"

(declare-const patient_has_taken_clobazam_containing_product_inthepast3months@@temporalcontext_within3months_prior_to_screening_visit Bool) ;; {"when_to_set_to_true":"Set to true if the 3-month window is anchored prior to the Screening Visit.","when_to_set_to_false":"Set to false if the 3-month window is not anchored prior to the Screening Visit.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the 3-month window is anchored prior to the Screening Visit.","meaning":"Boolean indicating that the 3-month window is specifically prior to the Screening Visit."} ;; "within three months prior to the Screening Visit"

(declare-const patient_has_taken_clobazam_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken any clobazam-containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken any clobazam-containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken any clobazam-containing product in the past.","meaning":"Boolean indicating whether the patient has ever taken any clobazam-containing product at any time in the past."} ;; "the patient has received clobazam in the past"

(declare-const patient_has_taken_clobazam_containing_product_inthehistory@@discontinuation_due_to_adverse_events_or_lack_of_efficacy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's discontinuation of clobazam was due to adverse events or lack of efficacy.","when_to_set_to_false":"Set to false if the patient's discontinuation of clobazam was not due to adverse events or lack of efficacy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether discontinuation was due to adverse events or lack of efficacy.","meaning":"Boolean indicating that discontinuation of clobazam was due to adverse events or lack of efficacy."} ;; "discontinuation of clobazam was due to adverse events OR lack of efficacy"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable for temporal context implies corresponding stem variable
(assert
(! (=> patient_has_taken_clobazam_containing_product_inthepast3months@@temporalcontext_within3months_prior_to_screening_visit
      patient_has_taken_clobazam_containing_product_inthepast3months)
:named REQ4_AUXILIARY0)) ;; "within three months prior to the Screening Visit"

;; Qualifier variable for discontinuation reason implies corresponding stem variable
(assert
(! (=> patient_has_taken_clobazam_containing_product_inthehistory@@discontinuation_due_to_adverse_events_or_lack_of_efficacy
      patient_has_taken_clobazam_containing_product_inthehistory)
:named REQ4_AUXILIARY1)) ;; "discontinuation of clobazam was due to adverse events OR lack of efficacy"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have received clobazam within three months prior to the Screening Visit
(assert
(! (not patient_has_taken_clobazam_containing_product_inthepast3months@@temporalcontext_within3months_prior_to_screening_visit)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has received clobazam within three months prior to the Screening Visit"

;; Exclusion: patient must NOT have received clobazam in the past AND discontinued due to adverse events or lack of efficacy
(assert
(! (not (and patient_has_taken_clobazam_containing_product_inthehistory
             patient_has_taken_clobazam_containing_product_inthehistory@@discontinuation_due_to_adverse_events_or_lack_of_efficacy))
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has received clobazam in the past AND discontinuation of clobazam was due to adverse events OR lack of efficacy"

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_meets_other_protocol_defined_exclusion_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient meets any other protocol-defined exclusion criteria not already explicitly captured by other variables.","when_to_set_to_false":"Set to false if the patient does not meet any other protocol-defined exclusion criteria not already explicitly captured by other variables.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient meets any other protocol-defined exclusion criteria not already explicitly captured by other variables.","meaning":"Boolean indicating whether the patient meets any other protocol-defined exclusion criteria not otherwise specified in the current set of eligibility requirements."} ;; "The patient is excluded if the patient meets other protocol-defined exclusion criteria."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_meets_other_protocol_defined_exclusion_criteria)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient meets other protocol-defined exclusion criteria."
