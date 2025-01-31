<%-- 
    Document   : validate_rule_mt710
    Created on : Aug 2018, 
    Author     : Sri Puji 
--%>

<script type="text/javascript">
    $(document).ready(function() {
        $("#form1").validate({
            rules: {
                //header
                //unit: "required",
                sender_logical_terminal: "required",
                //sender_type: "required",
                //sender_type_institution: "required",

                //receiver_type: "required",
                receiver_institution: "required",

                priority: "required",
                //monitoring: "required",

                //body
                _010_mf27_number: "required",
                _011_mf27_total: "required",
                _020_mf40b_type: "required",
                _021_mf40b_code: "required",
//               
                _030_mf20_senders_Reference: "required",
                _040_mf21_Documentary_Credit_Number: "required",
                _060_mf31c_date_of_issue: "required",
              
                
                _070_mf40e_applicable_rules: "required",
                _080_mf31d_date: "required",
                _081_mf31d_place:"required",
                _120_mf50_applicant:"required",
                _140_mf59_name_address:"required",
                _150_mf32b_currency_code:"required",
                _151_mf32b_amount:"required",
                _380_mf49_confirmation_instruction:"required",
                
                //mf41//
                type_mf41_Available: "required",
                _181_mf41a_party_identifier: "required",
                _182_mf41a_code: "required",
                _183_mf41d_Name_and_address: "required",
                _184_mf41d_code: "required",

                //of42A//
                _202_of42a_identifier_code: "required",
                _204_of42b_name_address: "required",
              
                //of42C
                _190_of42c_drafts_at: {
                    required: function(element) {
                    return ($("#type_of42_drawee").val() != "")
//                          || ($("#type_of42_drawee").val() == "" && $("#_210_of42m_Mixed_Payment_Details").val() == "" && $("#_220_of42p_Negotiation_Deferred_Payment_Details").val() == "")
                          || ($("#type_of42_drawee").val() != "" && $("#_210_of42m_Mixed_Payment_Details").val() != "")
                          || ($("#type_of42_drawee").val() != "" && $("#_220_of42p_Negotiation_Deferred_Payment_Details").val() != "")
                          || ($("#_210_of42m_Mixed_Payment_Details").val() != "" && $("#_220_of42p_Negotiation_Deferred_Payment_Details").val() != "");
                    }
                },
                
                //of42
                type_of42_drawee: {
                    required: function(element) {
                    return ($("#_190_of42c_drafts_at").val() != "")
//                           || ($("#_190_of42c_drafts_at").val() == "" && $("#_210_of42m_Mixed_Payment_Details").val() == "" && $("#_220_of42p_Negotiation_Deferred_Payment_Details").val() == "")
                           || ($("#_190_of42c_drafts_at").val() != "" && $("#_210_of42m_Mixed_Payment_Details").val() != "")
                           || ($("#_190_of42c_drafts_at").val() != "" && $("#_220_of42p_Negotiation_Deferred_Payment_Details").val() != "")
                           || ($("#_210_of42m_Mixed_Payment_Details").val() != "" && $("#_220_of42p_Negotiation_Deferred_Payment_Details").val() != "");
                    }
                },
                
                //of42m
                _210_of42m_Mixed_Payment_Details: {
                    required: function(element) {
                     return ($("#_190_of42c_drafts_at").val() != "" && $("#_220_of42p_Negotiation_Deferred_Payment_Details").val() != "");
                    }
                },
                
                //of42p
                _220_of42p_Negotiation_Deferred_Payment_Details: {
                    required: function(element) {
                    return ($("#_190_of42c_drafts_at").val() != "" && $("#_210_of42m_Mixed_Payment_Details").val() != "");
                    }
                },
                
                //of44c
//                _290_of44c_Latest_Date_of_Shipment: {
//                    required: function(element) {
//                      return ($("#_300_of44d_Shipment_Period").val() == "" && $("#_290_of44c_Latest_Date_of_Shipment").val() == "") 
//                              || ($("#_300_of44d_Shipment_Period").val() != "" && $("#_290_of44c_Latest_Date_of_Shipment").val() != "");
//                    }
//                },
                
                //of44d
//                _300_of44d_Shipment_Period: {
//                    required: function(element) {
//                      return ($("#_290_of44c_Latest_Date_of_Shipment").val() == "" && $("#_300_of44d_Shipment_Period").val() == "") 
//                              || ($("#_290_of44c_Latest_Date_of_Shipment").val() != "" && $("#_300_of44d_Shipment_Period").val() != "");
//                    }
//                },
                
                //of52
                type_of52_issuing_bank: {
                    required: function(element) {
                      return ($("#_100_of50b_non_bank").val() == "" && $("#type_of52_issuing_bank").val() == "")
                             || ($("#_100_of50b_non_bank").val() != "" && $("#type_of52_issuing_bank").val() != "");
                    }
                },
                
                //of50b
                _100_of50b_non_bank: {
                    required: function(element) {
                      return ($("#type_of52_issuing_bank").val() == "" && $("#_100_of50b_non_bank").val() == "")
                             || ($("#type_of52_issuing_bank").val() != "" && $("#_100_of50b_non_bank").val() != "");
                    }
                },
              
       
               
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf27_number:{required: "mf27 number harus diisi..!!"},
                _011_mf27_total: {required: "mf27 total harus diisi..!!"},
                _020_mf40b_type:{required:"mf40b type harus diisi..!"},
                _021_mf40b_code:{required:"mf40b code harus diisi..! "},
                _030_mf20_senders_Reference:{required:"mf20 trnasfering bank references harus diisi..!"},
                _040_mf21_Documentary_Credit_Number:{required: "mf21 documentary credit number harus diisi...!"},
                _060_mf31c_date_of_issue:{required: "mf31c date and issue harus diisi..!!"},
                _070_mf40e_applicable_rules:{required:"mf40e applicable rules harus diisi..!"},
                _080_mf31d_date: {required:"mf31d date harus diisi..!"},
                _081_mf31d_place: {required:"mf31d place harus diisi..!"},
                _120_mf50_applicant:{required:"mf50 applicant harus diisi...!"},
                _140_mf59_name_address:{required:"mf59 name address harus diisi..!"},
                _150_mf32b_currency_code:{required:"mf32b currency code harus diisi..!"},
                _151_mf32b_amount:{required:"mf32b amount harus diisi..!"},
                _380_mf49_confirmation_instruction:{required:"mf49 confirmation instruction harus diisi..!!"},
                type_mf41_Available: {required: "mf41a availabe harus diisi..!!"},
                _181_mf41a_party_identifier: {required: "mf41a party identifire harus diisi..!!"},
                _182_mf41a_code: {required: "mf41a code harus identifire..!!"},
                _183_mf41d_Name_and_address: {required: "mf41a name and address harus diisi..!!"},
                _184_mf41d_code: {required: "mf41a code harus diisi..!!"},
                _202_of42a_identifier_code: {required:"of42a identifire code harus diisi..!!"},
                _204_of42b_name_address: {required:"of42b name address harus diisi..!!"},
                _190_of42c_drafts_at: {required: "isi kedua field of42c dan of42 atau isi field of42m saja atau of42p saja..!!"},
                type_of42_drawee: {required: "isi kedua field of42c dan of42 atau isi field of42m saja atau of42p saja..!!"},
                _210_of42m_Mixed_Payment_Details: {required: "isi kedua field of42c dan of42 atau isi field of42m saja atau of42p saja..!!"},
                _220_of42p_Negotiation_Deferred_Payment_Details: {required: "isi kedua field of42c dan of42 atau isi field of42m saja atau of42p saja..!!"},
//                _290_of44c_Latest_Date_of_Shipment: {required: "isi antara field of44c atau of44d..!!"},
//                _300_of44d_Shipment_Period: {required: "isi antara field of44c atau of44d..!!"},
                type_of52_issuing_bank: {required: "isi salah satu antara of52 atau of50b..!!"},
                _100_of50b_non_bank: {required: "isi salah satu antara of52 atau of50b..!!"},
              
                
            },
            errorPlacement: function(error,element){
                error.insertAfter(element);
                alert(error.html());
            },
            showErrors: function(errorMap, errorList){
                this.defaultShowErrors();
            }
        });
    });
</script>
<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function(){
       
                $("#check_of39a").hide();
                $("#_160_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
                $("#_161_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
                $("#percentage_credit_amount_checkbox").click(function(){
                            if ($("#percentage_credit_amount_checkbox").is(":checked")) {
                                $("#check_of39a").show();
                                $("#_160_of39a_percentage_credit_amount_tolerance1").attr("disabled", false);
                                $("#_161_of39a_percentage_credit_amount_tolerance2").attr("disabled", false);
                            } else {
                                $("#check_of39a").hide();
                                $("#_160_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
                                $("#_161_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
                            }
                        });
                        
                        
                     //of48//   
                $("#check_of48").hide();
                $("#_370_of48_Period_for_Presentation_in_Days").attr("disabled", true);
                $("#_371_of48_Narrative").attr("disabled", true);
                $("#period_for_presentation_in_days_checkbox").click(function(){
                            if ($("#period_for_presentation_in_days_checkbox").is(":checked")) {
                                $("#check_of48").show();
                                $("#_370_of48_Period_for_Presentation_in_Days").attr("disabled", false);
                                $("#_371_of48_Narrative").attr("disabled", false);
                            } else {
                                $("#check_of48").hide();
                                $("#_370_of48_Period_for_Presentation_in_Days").attr("disabled", true);
                                $("#_371_of48_Narrative").attr("disabled", true);
                            }
                        });
        //of52a//
        $("#div_of52a").hide();
        $("#div_of52d").hide();
        $("#_091_of52a_party_identifier").attr("disabled", true);
        $("#_092_of52a_identifier_code").attr("disabled", true);
        $("#_093_of52d_party_identifier").attr("disabled", true);
        $("#_094_of52d_name_address").attr("disabled", true);
        $("#type_of52_issuing_bank").change(function() {
            if ( $("#type_of52_issuing_bank").val() == "a"){
                $("#div_of52a").show();
                $("#div_of52d").hide();
                $("#_091_of52a_party_identifier").attr("disabled", false);
                $("#_092_of52a_identifier_code").attr("disabled", false);
                $("#_093_of52d_party_identifier").attr("disabled", true);
                 $("#_094_of52d_name_address").attr("disabled", true);
            } else if ( $("#type_of52_issuing_bank").val() == "d"){
                $("#div_of52a").hide();
                $("#div_of52d").show();
                $("#_091_of52a_party_identifier").attr("disabled", true);
                $("#_092_of52a_identifier_code").attr("disabled", true);
                $("#_093_of52d_party_identifier").attr("disabled", false);
                $("#_094_of52d_name_address").attr("disabled", false);
            } else{
                $("#div_of52a").hide();
                $("#div_of52d").hide();
                $("#_091_of52a_party_identifier").attr("disabled", true);
                $("#_092_of52a_identifier_code").attr("disabled", true);
                $("#_093_of52d_party_identifier").attr("disabled", true);
                $("#_094_of52d_name_address").attr("disabled", true);
            }
        });
        
        //of51a//
        $("#div_of51a").hide();
        $("#div_of51d").hide();
        $("#_111_of51a_party_identifier").attr("disabled", true);
        $("#_112_of51a_identifier_code").attr("disabled", true);
        $("#_113_of51d_party_identifier").attr("disabled", true);
        $("#_114_of51d_name_address").attr("disabled", true);
        $("#type_of51_applicant_bank").change(function() {
            if ( $("#type_of51_applicant_bank").val() == "a"){
                $("#div_of51a").show();
                $("#div_of51d").hide();
                $("#_111_of51a_party_identifier").attr("disabled", false);
                $("#_112_of51a_identifier_code").attr("disabled", false);
                $("#_113_of51d_party_identifier").attr("disabled", true);
                $("#_114_of51d_name_address").attr("disabled", true);
            } else if ( $("#type_of51_applicant_bank").val() == "d"){
                $("#div_of51a").hide();
                $("#div_of51d").show();
                $("#_111_of51a_party_identifier").attr("disabled", true);
                $("#_112_of51a_identifier_code").attr("disabled", true);
                $("#_113_of51d_party_identifier").attr("disabled", false);
                $("#_114_of51d_name_address").attr("disabled", false);
            } else{
                $("#div_of51a").hide();
                $("#div_of51d").hide();
                $("#_111_of51a_party_identifier").attr("disabled", true);
                $("#_112_of51a_identifier_code").attr("disabled", true);
                $("#_113_of51d_party_identifier").attr("disabled", true);
                $("#_114_of51d_name_address").attr("disabled", true);
            }
        });


        //mf42a
         $("#div_of42a").hide();
        $("#div_of42d").hide();
        $("#_201_of42a_party_identifier").attr("disabled", true);
        $("#_202_of42a_identifier_code").attr("disabled", true);
        $("#_203_of42d_party_identifier").attr("disabled", true);
        $("#_204_of42d_name_address").attr("disabled", true);
        $("#type_of42_drawee").change(function() {
            if ( $("#type_of42_drawee").val() == "a"){
                $("#div_of42a").show();
                $("#div_of42d").hide();
                 $("#_201_of42a_party_identifier").attr("disabled", false);
                $("#_202_of42a_identifier_code").attr("disabled", false);
                $("#_203_of42d_party_identifier").attr("disabled", true);
                $("#_204_of42d_name_address").attr("disabled", true);
            } else if ( $("#type_of42_drawee").val() == "d"){
                $("#div_of42a").hide();
                $("#div_of42d").show();
                $("#_201_of42a_party_identifier").attr("disabled", true);
                $("#_202_of42a_identifier_code").attr("disabled", true);
                $("#_203_of42d_party_identifier").attr("disabled", false);
                $("#_204_of42d_name_address").attr("disabled", false);
            } else{
                $("#div_of42a").hide();
                $("#div_of42d").hide();
                $("#_201_of42a_party_identifier").attr("disabled", true);
                $("#_202_of42a_identifier_code").attr("disabled", true);
                $("#_203_of42d_party_identifier").attr("disabled", true);
                $("#_204_of42d_name_address").attr("disabled", true);
            }
        });

        //mf41a
       $("#div_mf41a").hide();
        $("#div_mf41d").hide();
        $("#_181_mf41a_party_identifier").attr("disabled", true);
        $("#_182_mf41a_code").attr("disabled", true);
        $("#_183_mf41d_Name_and_address").attr("disabled", true);
        $("#_184_mf41d_code").attr("disabled", true);
        $("#type_mf41_Available").change(function() {
            if ( $("#type_mf41_Available").val() == "a"){
                $("#div_mf41a").show();
                $("#div_mf41d").hide();
               $("#_181_mf41a_party_identifier").attr("disabled", false);
                $("#_182_mf41a_code").attr("disabled", false);
                $("#_183_mf41d_Name_and_address").attr("disabled", true);
                $("#_184_mf41d_code").attr("disabled", true);
            } else if ( $("#type_mf41_Available").val() == "d"){
                $("#div_mf41a").hide();
                $("#div_mf41d").show();
                $("#_181_mf41a_party_identifier").attr("disabled", true);
                $("#_182_mf41a_code").attr("disabled", true);
                $("#_183_mf41d_Name_and_address").attr("disabled", false);
                $("#_184_mf41d_code").attr("disabled", false);
            } else{
                $("#div_mf41a").hide();
                $("#div_mf41d").hide();
                $("#_181_mf41a_party_identifier").attr("disabled", true);
                $("#_182_mf41a_code").attr("disabled", true);
                $("#_183_mf41d_Name_and_address").attr("disabled", true);
                $("#_184_mf41d_code").attr("disabled", true);
            }
        });

        $("#div_of58a").hide();
        $("#div_of58d").hide();
        $("#_391_of58a_party_identifire").attr("disabled", true);
        $("#_392_of58a_identifier_code").attr("disabled", true);
        $("#_393_of58d_party_identifire").attr("disabled", true);
        $("#_394_of58d_name_address").attr("disabled", true);
        $("#type_of58_Requested_Confirmation_Party").change(function() {
            if ( $("#type_of58_Requested_Confirmation_Party").val() == "a"){
                $("#div_of58a").show();
                $("#div_of58d").hide();
                $("#_391_of58a_party_identifire").attr("disabled", false);
                $("#_392_of58a_identifier_code").attr("disabled", false);
                $("#_393_of58d_party_identifire").attr("disabled", true);
                $("#_394_of58d_name_address").attr("disabled", true);
            } else if ( $("#type_of58_Requested_Confirmation_Party").val() == "d"){
                $("#div_of58a").hide();
                $("#div_of58d").show();
                $("#_391_of58a_party_identifire").attr("disabled", true);
                $("#_392_of58a_identifier_code").attr("disabled", true);
                $("#_393_of58d_party_identifire").attr("disabled", false);
                $("#_394_of58d_name_address").attr("disabled", false);
            } else{
                $("#div_of58a").hide();
                $("#div_of58d").hide();
                $("#_391_of58a_party_identifire").attr("disabled", true);
                $("#_392_of58a_identifier_code").attr("disabled", true);
                $("#_393_of58d_party_identifire").attr("disabled", true);
                $("#_394_of58d_name_address").attr("disabled", true);
            }
        });
        
        
        //of53a//
        $("#div_of53a").hide();
        $("#div_of53d").hide();
        $("#_401_of53a_party_identifire").attr("disabled", true);
        $("#_402_of53a_identifier_code").attr("disabled", true);
        $("#_403_of53d_party_identifire").attr("disabled", true);
        $("#_404_of53d_name_address").attr("disabled", true);
        $("#type_of53_reimbursing_bank").change(function() {
            if ( $("#type_of53_reimbursing_bank").val() == "a"){
                $("#div_of53a").show();
                $("#div_of53d").hide();
               $("#_401_of53a_party_identifire").attr("disabled", false);
                $("#_402_of53a_identifier_code").attr("disabled", false);
                $("#_403_of53d_party_identifire").attr("disabled", true);
                $("#_404_of53d_name_address").attr("disabled", true);
            } else if ( $("#type_of53_reimbursing_bank").val() == "d"){
                $("#div_of53a").hide();
                $("#div_of53d").show();
                $("#_401_of53a_party_identifire").attr("disabled", true);
                $("#_402_of53a_identifier_code").attr("disabled", true);
                $("#_403_of53d_party_identifire").attr("disabled", false);
                $("#_404_of53d_name_address").attr("disabled", false);
            } else{
               $("#div_of53a").hide();
                $("#div_of53d").hide();
                $("#_401_of53a_party_identifire").attr("disabled", true);
                $("#_402_of53a_name_address").attr("disabled", true);
                $("#_403_of53d_party_identifire").attr("disabled", true);
                $("#_404_of53d_name_address").attr("disabled", true);
            }
        });
        
        //OF57A//
        $("#div_of57a").hide();
        $("#div_of57b").hide();
        $("#div_of57d").hide();
        $("#_421_of57a_party_identifire").attr("disabled", true);
        $("#_422_of57a_identifier_code").attr("disabled", true);
        $("#_423_of57b_party_identifire").attr("disabled", true);
        $("#_424_of57b_location").attr("disabled", true);
        $("#_425_of57d_party_identifire").attr("disabled", true);
        $("#_426_of57d_name_address").attr("disabled", true);
        $("#type_of57_advise_through_bank").change(function() {
            if ( $("#type_of57_advise_through_bank").val() == "A"){
                $("#div_of57a").show();
                $("#div_of57b").hide();
                $("#div_of57d").hide();
                $("#_421_of57a_party_identifire").attr("disabled", false);
                $("#_422_of57a_identifier_code").attr("disabled", false);
                $("#_423_of57b_party_identifire").attr("disabled", true);
                $("#_424_of57b_location").attr("disabled", true);
                $("#_425_of57d_party_identifire").attr("disabled", true);
                $("#_426_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_advise_through_bank").val() == "B"){
                $("#div_of57a").hide();
                $("#div_of57b").show();
                $("#div_of57d").hide();
                $("#_421_of57a_party_identifire").attr("disabled", true);
                $("#_422_of57a_identifier_code").attr("disabled", true);
                $("#_423_of57b_party_identifire").attr("disabled", false);
                $("#_424_of57b_location").attr("disabled", false);
                $("#_425_of57d_party_identifire").attr("disabled", true);
                $("#_426_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_advise_through_bank").val() == "D"){
                $("#div_of57a").hide();
                $("#div_of57b").hide();
                $("#div_of57d").show();
                $("#_421_of57a_party_identifire").attr("disabled", true);
                $("#_422_of57a_identifier_code").attr("disabled", true);
                $("#_423_of57b_party_identifire").attr("disabled", true);
                $("#_424_of57b_location").attr("disabled", true);
                $("#_425_of57d_party_identifire").attr("disabled", false);
                $("#_426_of57d_name_address").attr("disabled", false);
            } else{
                $("#div_of57a").hide();
                $("#div_of57b").hide();
                $("#div_of57d").hide();
                $("#_421_of57a_party_identifire").attr("disabled", true);
                $("#_422_of57a_identifier_code").attr("disabled", true);
                $("#_423_of57b_party_identifire").attr("disabled", true);
                $("#_424_of57b_location").attr("disabled", true);
                $("#_425_of57d_party_identifire").attr("disabled", true);
                $("#_426_of57d_name_address").attr("disabled", true);
            }
        });

      
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        if ($("#_160_of39a_percentage_credit_amount_tolerance1").val() != "" || $("#_161_of39a_percentage_credit_amount_tolerance2").val() != ""){
            $("#percentage_credit_amount_checkbox").attr("checked", true);
            $("#check_of39a").show();
            $("#_160_of39a_percentage_credit_amount_tolerance1").attr("disabled", false);
            $("#_161_of39a_percentage_credit_amount_tolerance2").attr("disabled", false);
        } else {
            $("#check_of39a").hide();
            $("#_160_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
            $("#_161_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
        }
        
        
        if ($("#_370_of48_Period_for_Presentation_in_Days").val() != "" || $("#_371_of48_Narrative").val() != ""){
            $("#period_for_presentation_in_days_checkbox").attr("checked", true);
            $("#check_of48").show();
            $("#_370_of48_Period_for_Presentation_in_Days").attr("disabled", false);
            $("#_371_of48_Narrative").attr("disabled", false);
        } else {
            $("#check_of48").hide();
            $("#_370_of48_Period_for_Presentation_in_Days").attr("disabled", true);
            $("#_371_of48_Narrative").attr("disabled", true);
        }

        //mf52a a_b
           if ($("#_091_of52a_party_identifier").val() != "" || $("#_092_of52a_identifier_code").val() != ""){
              $("#type_of52_issuing_bank").val("a").attr("selected",true);
                $("#div_of52a").show();
                $("#div_of52d").hide();
                $("#_091_of52a_party_identifier").attr("disabled", false);
                $("#_092_of52a_identifier_code").attr("disabled", false);
                $("#_093_of52d_party_identifier").attr("disabled", true);
                $("#_094_of52d_name_address").attr("disabled", true);
          } else if ($("#_093_of52d_party_identifier").val() != "" || $("#_094_of52d_name_address").val() != ""){
                $("#type_of52_issuing_bank").val("d").attr("selected",true);
                $("#div_of52a").hide();
                $("#div_of52d").show();
                $("#_091_of52a_party_identifier").attr("disabled", true);
                $("#_092_of52a_identifier_code").attr("disabled", true);
                $("#_093_of52d_party_identifier").attr("disabled", false);
                $("#_094_of52d_name_address").attr("disabled", false);
            } else{
                $("#div_of52a").hide();
                $("#div_of52d").hide();
                $("#_091_of52a_party_identifier").attr("disabled", true);
                $("#_092_of52a_identifier_code").attr("disabled", true);
                $("#_093_of52d_party_identifier").attr("disabled", true);
                $("#_094_of52d_name_address").attr("disabled", true);
            }
            
            
        if ($("#_111_of51a_party_identifier").val() != "" || $("#_112_of51a_identifier_code").val() != ""){
              $("#type_of51_applicant_bank").val("a").attr("selected",true);
                $("#div_of51a").show();
                $("#div_of51d").hide();
                $("#_111_of51a_party_identifier").attr("disabled", false);
                $("#_112_of51a_identifier_code").attr("disabled", false);
                $("#_113_of51d_party_identifier").attr("disabled", true);
                $("#_114_of51d_name_address").attr("disabled", true);
          } else if ($("#_113_of51d_party_identifier").val() != "" || $("#_114_of51d_name_address").val() != ""){
                $("#type_of51_applicant_bank").val("d").attr("selected",true);
                $("#div_of51a").hide();
                $("#div_of51d").show();
                $("#_111_of51a_party_identifier").attr("disabled", true);
                $("#_112_of51a_identifier_code").attr("disabled", true);
                $("#_113_of51d_party_identifier").attr("disabled", false);
                $("#_114_of51d_name_address").attr("disabled", false);
            } else{
                $("#div_of51a").hide();
                $("#div_of51d").hide();
                $("#_111_of51a_party_identifier").attr("disabled", true);
                $("#_112_of51a_identifier_code").attr("disabled", true);
                $("#_113_of51d_party_identifier").attr("disabled", true);
                $("#_114_of51d_name_address").attr("disabled", true);
            }
            
            
            
            if ($("#_201_of42a_party_identifier").val() != "" || $("#_202_of42a_identifier_code").val() != ""){
                $("#type_of42_drawee").val("a").attr("selected",true);
                $("#div_of42a").show();
                $("#div_of42d").hide();
                 $("#_201_of42a_party_identifier").attr("disabled", false);
                $("#_202_of42a_identifier_code").attr("disabled", false);
                $("#_203_of42d_party_identifier").attr("disabled", true);
                $("#_204_of42d_name_address").attr("disabled", true);
           } else if ($("#_203_of42d_party_identifier").val() != "" || $("#_204_of42d_name_address").val() != ""){
                $("#type_of42_drawee").val("d").attr("selected",true);
                $("#div_of42a").hide();
                $("#div_of42d").show();
                $("#_201_of42a_party_identifier").attr("disabled", true);
                $("#_202_of42a_identifier_code").attr("disabled", true);
                $("#_203_of42d_party_identifier").attr("disabled", false);
                $("#_204_of42d_name_address").attr("disabled", false);
            } else{
                $("#div_of42a").hide();
                $("#div_of42d").hide();
                $("#_201_of42a_party_identifier").attr("disabled", true);
                $("#_202_of42a_identifier_code").attr("disabled", true);
                $("#_203_of42d_party_identifier").attr("disabled", true);
                $("#_204_of42d_name_address").attr("disabled", true);
            }
            
            //OF58//
           if ($("#_391_of58a_party_identifire").val() != "" || $("#_392_of58a_identifier_code").val() != ""){
                $("#type_of58_Requested_Confirmation_Party").val("a").attr("selected",true);
                $("#div_of58a").show();
                $("#div_of58d").hide();
                $("#_391_of58a_party_identifire").attr("disabled", false);
                $("#_392_of58a_identifier_code").attr("disabled", false);
                $("#_393_of58d_party_identifire").attr("disabled", true);
                $("#_394_of58d_name_address").attr("disabled", true);
             } else if ($("#_393_of58d_party_identifire").val() != "" || $("#_394_of58d_name_address").val() != ""){
                $("#type_of58_Requested_Confirmation_Party").val("d").attr("selected",true);
                $("#div_of58a").hide();
                $("#div_of58d").show();
                $("#_391_of58a_party_identifire").attr("disabled", true);
                $("#_392_of58a_identifier_code").attr("disabled", true);
                $("#_393_of58d_party_identifire").attr("disabled", false);
                $("#_394_of58d_name_address").attr("disabled", false);
            } else{
                $("#div_of58a").hide();
                $("#div_of58d").hide();
                $("#_391_of58a_party_identifire").attr("disabled", true);
                $("#_392_of58a_identifier_code").attr("disabled", true);
                $("#_393_of58d_party_identifire").attr("disabled", true);
                $("#_394_of58d_name_address").attr("disabled", true);
            }
            
             if ($("#_401_of53a_party_identifire").val() != "" || $("#_402_of53a_identifier_code").val() != ""){
                $("#type_of53_reimbursing_bank").val("a").attr("selected",true);
                $("#div_of53a").show();
                $("#div_of53d").hide();
                $("#_401_of53a_party_identifire").attr("disabled", false);
                $("#_402_of53a_identifier_code").attr("disabled", false);
                $("#_403_of53d_party_identifire").attr("disabled", true);
                $("#_404_of53d_name_address").attr("disabled", true);
              } else if ($("#_403_of53d_party_identifire").val() != "" || $("#_404_of53d_name_address").val() != ""){
                $("#type_of53_reimbursing_bank").val("d").attr("selected",true);
                $("#div_of53a").hide();
                $("#div_of53d").show();
                $("#_401_of53a_party_identifire").attr("disabled", true);
                $("#_402_of53a_identifier_code").attr("disabled", true);
                $("#_403_of53d_party_identifire").attr("disabled", false);
                $("#_404_of53d_name_address").attr("disabled", false);
            } else{
               $("#div_of53a").hide();
                $("#div_of53d").hide();
                $("#_401_of53a_party_identifire").attr("disabled", true);
                $("#_402_of53a_identifier_code").attr("disabled", true);
                $("#_403_of53d_party_identifire").attr("disabled", true);
                $("#_404_of53d_name_address").attr("disabled", true);
            }
            
            //of57 a_b_d
            if ($("#_421_of57a_party_identifire").val() != "" || $("#_422_of57a_identifier_code").val() != ""){
                $("#type_of57_advise_through_bank").val("A").attr("selected",true);
                $("#div_of57a").show();
                $("#div_of57b").hide();
                $("#div_of57d").hide();
                $("#_421_of57a_party_identifire").attr("disabled", false);
                $("#_422_of57a_identifier_code").attr("disabled", false);
                $("#_423_of57b_party_identifire").attr("disabled", true);
                $("#_424_of57b_location").attr("disabled", true);
                $("#_425_of57d_party_identifire").attr("disabled", true);
                $("#_426_of57d_name_address").attr("disabled", true);
           } else if ($("#_423_of57b_party_identifire").val() != "" || $("#_424_of57b_location").val() != ""){
                $("#type_of57_advise_through_bank").val("B").attr("selected",true);
                $("#div_of57a").hide();
                $("#div_of57b").show();
                $("#div_of57d").hide();
                $("#_421_of57a_party_identifire").attr("disabled", true);
                $("#_422_of57a_identifier_code").attr("disabled", true);
                $("#_423_of57b_party_identifire").attr("disabled", false);
                $("#_424_of57b_location").attr("disabled", false);
                $("#_425_of57d_party_identifire").attr("disabled", true);
                $("#_426_of57d_name_address").attr("disabled", true);
           } else if ($("#_425_of57d_party_identifire").val() != "" || $("#_426_of57d_name_address").val() != ""){
                $("#type_of57_advise_through_bank").val("D").attr("selected",true);
                $("#div_of57a").hide();
                $("#div_of57b").hide();
                $("#div_of57d").show();
                $("#_421_of57a_party_identifire").attr("disabled", true);
                $("#_422_of57a_identifier_code").attr("disabled", true);
                $("#_423_of57b_party_identifire").attr("disabled", true);
                $("#_424_of57b_location").attr("disabled", true);
                $("#_425_of57d_party_identifire").attr("disabled", false);
                $("#_426_of57d_name_address").attr("disabled", false);
            } else{
                $("#div_of57a").hide();
                $("#div_of57b").hide();
                $("#div_of57d").hide();
                $("#_421_of57a_party_identifire").attr("disabled", true);
                $("#_422_of57a_identifier_code").attr("disabled", true);
                $("#_423_of57b_party_identifire").attr("disabled", true);
                $("#_424_of57b_location").attr("disabled", true);
                $("#_425_of57d_party_identifire").attr("disabled", true);
                $("#_426_of57d_name_address").attr("disabled", true);
            }
            
            if ($("#_181_mf41a_party_identifier").val() != "" || $("#_182_mf41a_code").val() != ""){
                $("#type_mf41_Available").val("a").attr("selected",true);
                $("#div_mf41a").show();
                $("#div_mf41d").hide();
                $("#_181_mf41a_party_identifier").attr("disabled", false);
                $("#_182_mf41a_code").attr("disabled", false);
                $("#_183_mf41d_Name_and_address").attr("disabled", true);
                $("#_184_mf41d_code").attr("disabled", true);
              } else if ($("#_183_mf41d_Name_and_address").val() != "" || $("#_184_mf41d_code").val() != ""){
                 $("#type_mf41_Available").val("d").attr("selected",true);  
                 $("#div_mf41a").hide();
                 $("#div_mf41d").show();
                 $("#_181_mf41a_party_identifier").attr("disabled", true);
                 $("#_182_mf41a_code").attr("disabled", true);
                 $("#_183_mf41d_Name_and_address").attr("disabled", false);
                 $("#_184_mf41d_code").attr("disabled", false);
            } else{
                $("#div_mf41a").hide();
                $("#div_mf41d").hide();
                $("#_181_mf41a_party_identifier").attr("disabled", true);
                $("#_182_mf41a_code").attr("disabled", true);
                $("#_183_mf41d_Name_and_address").attr("disabled", true);
                $("#_184_mf41d_code").attr("disabled", true);
            }


       

        //of71f
        if ($("#_212_of71f_currency").val() != "" || $("#_213_of71f_amount").val() != ""){
            $("#div_of71f_sender_charges").show();
            $("#_212_of71f_currency").attr("disabled", false);
            $("#_213_of71f_amount").attr("disabled", false);
        }else{
            $("#div_of71f_sender_charges").hide();
            $("#_212_of71f_currency").attr("disabled", true);
            $("#_213_of71f_amount").attr("disabled", true);
        }

    });
</script>