<%-- 
    Document   : mt754
    Created on : Aug 8, 2018
    Author     : Andhita Deara
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
                //mf20
                _010_mf20_sender_reference: "required",

                //mf21
                _020_mf21_related_reference: "required",

                //mf32a
                type_mf32_principal_amount_paid: "required",
                _030_mf32a_date: "required",
                _031_mf32a_currency: "required",
                _032_mf32a_amount: "required",
                _033_mf32b_currency: "required",
                _034_mf32b_amount: "required",
                
                //of72z
//                _110_of72z_narrative_sender_to_receiver: {
//                    required: function(element) {
//                      return ($("#_110_of72z_narrative_sender_to_receiver").val() == "" && $("#_120_of77_narrative").val() == "")
//                             || ($("#_110_of72z_narrative_sender_to_receiver").val() != "" && $("#_120_of77_narrative").val() != "");
//                    }
//                },
                
                //of77
//                _120_of77_narrative: {
//                    required: function(element) {
//                      return ($("#_120_of77_narrative").val() == "" && $("#_110_of72z_narrative_sender_to_receiver").val() == "")
//                             || ($("#_120_of77_narrative").val() != "" && $("#_110_of72z_narrative_sender_to_receiver").val() != "");
//                    }
//                },
                
                //of53a
//                type_of53_reimbursing_bank: {
//                    required: function(element) {
//                      return ($("#type_of57_account_with_bank").val() == "" && $("#type_of53_reimbursing_bank").val() == "")
//                             || ($("#type_of57_account_with_bank").val() != "" && $("#type_of53_reimbursing_bank").val() != "");
//                    }
//                },
                
                //of57a
//                type_of57_account_with_bank: {
//                    required: function(element) {
//                      return ($("#type_of53_reimbursing_bank").val() == "" && $("#type_of57_account_with_bank").val() == "")
//                             || ($("#type_of57_account_with_bank").val() != "" && $("#type_of53_reimbursing_bank").val() != "");
//                    }
//                },
                

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_sender_reference: {required: "mf20_sender_reference harus diisi..!!"},
                _020_mf21_related_reference: {required: "mf21_related_reference harus diisi..!!"},
                type_mf32_principal_amount_paid: {required: "mf32_principal_amount_paid harus diisi..!!"},
                _030_mf32a_date: {required: "mf32a_date harus diisi..!!"},
                _032_mf32a_amount: {required: "mf32a_amount harus diisi..!!"},
                _033_mf32b_currency: {required: "mf32b_currency harus diisi..!!"},
                _034_mf32b_amount: {required: "mf32b_amount harus diisi..!!"},
//                _110_of72z_narrative_sender_to_receiver: {required: "isi salah satu antara of72z atau of77..!!"},
//                _120_of77_narrative: {required: "isi salah satu antara of72z atau of77..!!"},
//                type_of53_reimbursing_bank: {required: "isi salah satu antara of53 atau of57..!!"},
//                type_of57_account_with_bank: {required: "isi salah satu antara of53 atau of57..!!"},
                
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
        
        //OF33B_check
        $("#check_of33b").hide();
        $("#_040_of33b_currency_additional_amount").attr("disabled", true);
        $("#_041_of33b_amount").attr("disabled", true);
        $("#additional_amount_checkbox").click(function(){
            if ($("#additional_amount_checkbox").is(":checked")){
                $("#check_of33b").show();
                $("#_040_of33b_currency_additional_amount").attr("disabled", false);
                $("#_041_of33b_amount").attr("disabled", false);
            } else {
                $("#check_of33b").hide();
                $("#_040_of33b_currency_additional_amount").attr("disabled", true);
                $("#_041_of33b_amount").attr("disabled", true);
            }
        });

        //MF32_a_b
        $("#div_mf32a_").hide();
        $("#div_mf32b_").hide();
        $("#_030_mf32a_date").attr("disabled", true);
        $("#_031_mf32a_currency").attr("disabled", true);
        $("#_032_mf32a_amount").attr("disabled", true);
        $("#_033_mf32b_currency").attr("disabled", true);
        $("#_034_mf32b_amount").attr("disabled", true);
        $("#type_mf32_principal_amount_paid").change(function() {
            if ( $("#type_mf32_principal_amount_paid").val() == "a"){
                $("#div_mf32a_").show();
                $("#div_mf32b_").hide();
                $("#_030_mf32a_date").attr("disabled", false);
                $("#_031_mf32a_currency").attr("disabled", false);
                $("#_032_mf32a_amount").attr("disabled", false);
                $("#_033_mf32b_currency").attr("disabled", true);
                $("#_034_mf32b_amount").attr("disabled", true);
            } else if ( $("#type_mf32_principal_amount_paid").val() == "b"){
                $("#div_mf32a_").hide();
                $("#div_mf32b_").show();
                $("#_030_mf32a_date").attr("disabled", true);
                $("#_031_mf32a_currency").attr("disabled", true);
                $("#_032_mf32a_amount").attr("disabled", true);
                $("#_033_mf32b_currency").attr("disabled", false);
                $("#_034_mf32b_amount").attr("disabled", false);
            } else{
                $("#div_mf32a_").hide();
                $("#div_mf32b_").hide();
                $("#_030_mf32a_date").attr("disabled", true);
                $("#_031_mf32a_currency").attr("disabled", true);
                $("#_032_mf32a_amount").attr("disabled", true);
                $("#_033_mf32b_currency").attr("disabled", true);
                $("#_034_mf32b_amount").attr("disabled", true);
            }
        });
        
        //OF34_a_b
        $("#div_of34a_").hide();
        $("#div_of34b_").hide();
        $("#_070_of34a_date").attr("disabled", true);
        $("#_071_of34a_currency").attr("disabled", true);
        $("#_072_of34a_amount").attr("disabled", true);
        $("#_073_of34b_currency").attr("disabled", true);
        $("#_074_of34b_amount").attr("disabled", true);
        $("#type_of34_total_amount_claimed").change(function() {
            if ( $("#type_of34_total_amount_claimed").val() == "a"){
                $("#div_of34a_").show();
                $("#div_of34b_").hide();
                $("#_070_of34a_date").attr("disabled", false);
                $("#_071_of34a_currency").attr("disabled", false);
                $("#_072_of34a_amount").attr("disabled", false);
                $("#_073_of34b_currency").attr("disabled", true);
                $("#_074_of34b_amount").attr("disabled", true);
            } else if ( $("#type_of34_total_amount_claimed").val() == "b"){
                $("#div_of34a_").hide();
                $("#div_of34b_").show();
                $("#_070_of34a_date").attr("disabled", true);
                $("#_071_of34a_currency").attr("disabled", true);
                $("#_072_of34a_amount").attr("disabled", true);
                $("#_073_of34b_currency").attr("disabled", false);
                $("#_074_of34b_amount").attr("disabled", false);
            } else{
                $("#div_of34a_").hide();
                $("#div_of34b_").hide();
                $("#_070_of34a_date").attr("disabled", true);
                $("#_071_of34a_currency").attr("disabled", true);
                $("#_072_of34a_amount").attr("disabled", true);
                $("#_073_of34b_currency").attr("disabled", true);
                $("#_074_of34b_amount").attr("disabled", true);
            }
        });
        
        //OF53_a_b_d
        $("#div_of53a_").hide();
        $("#div_of53b_").hide();
        $("#div_of53d_").hide();
        $("#_080_of53a_party_identifier").attr("disabled", true);
        $("#_081_of53a_identifier_code").attr("disabled", true);
        $("#_082_of53b_party_identifier").attr("disabled", true);
        $("#_083_of53b_location").attr("disabled", true);
        $("#_084_of53d_party_identifier").attr("disabled", true);
        $("#_085_of53d_name_address").attr("disabled", true);
        $("#type_of53_reimbursing_bank").change(function() {
            if ( $("#type_of53_reimbursing_bank").val() == "a"){
                $("#div_of53a_").show();
                $("#div_of53b_").hide();
                $("#div_of53d_").hide();
                $("#_080_of53a_party_identifier").attr("disabled", false);
                $("#_081_of53a_identifier_code").attr("disabled", false);
                $("#_082_of53b_party_identifier").attr("disabled", true);
                $("#_083_of53b_location").attr("disabled", true);
                $("#_084_of53d_party_identifier").attr("disabled", true);
                $("#_085_of53d_name_address").attr("disabled", true);
            } else if ( $("#type_of53_reimbursing_bank").val() == "b"){
                $("#div_of53a_").hide();
                $("#div_of53b_").show();
                $("#div_of53d_").hide();
                $("#_080_of53a_party_identifier").attr("disabled", true);
                $("#_081_of53a_identifier_code").attr("disabled", true);
                $("#_082_of53b_party_identifier").attr("disabled", false);
                $("#_083_of53b_location").attr("disabled", false);
                $("#_084_of53d_party_identifier").attr("disabled", true);
                $("#_085_of53d_name_address").attr("disabled", true);
            } else if ( $("#type_of53_reimbursing_bank").val() == "d"){
                $("#div_of53a_").hide();
                $("#div_of53b_").hide();
                $("#div_of53d_").show();
                $("#_080_of53a_party_identifier").attr("disabled", true);
                $("#_081_of53a_identifier_code").attr("disabled", true);
                $("#_082_of53b_party_identifier").attr("disabled", true);
                $("#_083_of53b_location").attr("disabled", true);
                $("#_084_of53d_party_identifier").attr("disabled", false);
                $("#_085_of53d_name_address").attr("disabled", false);
            } else{
                $("#div_of53a_").hide();
                $("#div_of53b_").hide();
                $("#div_of53d_").hide();
                $("#_080_of53a_party_identifier").attr("disabled", true);
                $("#_081_of53a_identifier_code").attr("disabled", true);
                $("#_082_of53b_party_identifier").attr("disabled", true);
                $("#_083_of53b_location").attr("disabled", true);
                $("#_084_of53d_party_identifier").attr("disabled", true);
                $("#_085_of53d_name_address").attr("disabled", true);
            }
        });
        
        //OF57_a_b_d
        $("#div_of57a_").hide();
        $("#div_of57b_").hide();
        $("#div_of57d_").hide();
        $("#_090_of57a_party_identifier").attr("disabled", true);
        $("#_091_of57a_identifier_code").attr("disabled", true);
        $("#_092_of57b_party_identifier").attr("disabled", true);
        $("#_093_of57b_location").attr("disabled", true);
        $("#_094_of57d_party_identifier").attr("disabled", true);
        $("#_095_of57d_name_address").attr("disabled", true);
        $("#type_of57_account_with_bank").change(function() {
            if ( $("#type_of57_account_with_bank").val() == "a"){
                $("#div_of57a_").show();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_090_of57a_party_identifier").attr("disabled", false);
                $("#_091_of57a_identifier_code").attr("disabled", false);
                $("#_092_of57b_party_identifier").attr("disabled", true);
                $("#_093_of57b_location").attr("disabled", true);
                $("#_094_of57d_party_identifier").attr("disabled", true);
                $("#_095_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_account_with_bank").val() == "b"){
                $("#div_of57a_").hide();
                $("#div_of57b_").show();
                $("#div_of57d_").hide();
                $("#_090_of57a_party_identifier").attr("disabled", true);
                $("#_091_of57a_identifier_code").attr("disabled", true);
                $("#_092_of57b_party_identifier").attr("disabled", false);
                $("#_093_of57b_location").attr("disabled", false);
                $("#_094_of57d_party_identifier").attr("disabled", true);
                $("#_095_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_account_with_bank").val() == "d"){
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").show();
                $("#_090_of57a_party_identifier").attr("disabled", true);
                $("#_091_of57a_identifier_code").attr("disabled", true);
                $("#_092_of57b_party_identifier").attr("disabled", true);
                $("#_093_of57b_location").attr("disabled", true);
                $("#_094_of57d_party_identifier").attr("disabled", false);
                $("#_095_of57d_name_address").attr("disabled", false);
            } else{
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_090_of57a_party_identifier").attr("disabled", true);
                $("#_091_of57a_identifier_code").attr("disabled", true);
                $("#_092_of57b_party_identifier").attr("disabled", true);
                $("#_093_of57b_location").attr("disabled", true);
                $("#_094_of57d_party_identifier").attr("disabled", true);
                $("#_095_of57d_name_address").attr("disabled", true);
            }
        });
        
        //OF58_a_d
        $("#div_of58a_").hide();
        $("#div_of58d_").hide();
        $("#_100_of58a_party_identifier").attr("disabled", true);
        $("#_101_of58a_identifier_code").attr("disabled", true);
        $("#_102_of58d_party_identifier").attr("disabled", true);
        $("#_103_of58d_name_address").attr("disabled", true);
        $("#type_of58_beneficiary_bank").change(function() {
            if ( $("#type_of58_beneficiary_bank").val() == "a"){
                $("#div_of58a_").show();
                $("#div_of58d_").hide();
                $("#_100_of58a_party_identifier").attr("disabled", false);
                $("#_101_of58a_identifier_code").attr("disabled", false);
                $("#_102_of58d_party_identifier").attr("disabled", true);
                $("#_103_of58d_name_address").attr("disabled", true);
            } else if ( $("#type_of58_beneficiary_bank").val() == "d"){
                $("#div_of58a_").hide();
                $("#div_of58d_").show();
                $("#_100_of58a_party_identifier").attr("disabled", true);
                $("#_101_of58a_identifier_code").attr("disabled", true);
                $("#_102_of58d_party_identifier").attr("disabled", false);
                $("#_103_of58d_name_address").attr("disabled", false);
            } else{
                $("#div_of58a_").hide();
                $("#div_of58d_").hide();
                $("#_100_of58a_party_identifier").attr("disabled", true);
                $("#_101_of58a_identifier_code").attr("disabled", true);
                $("#_102_of58d_party_identifier").attr("disabled", true);
                $("#_103_of58d_name_address").attr("disabled", true);
            }
        });

    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF33B_check
        if ($("#_040_of33b_currency_additional_amount").val() != "" || $("#_041_of33b_amount").val() != ""){
            $("#additional_amount_checkbox").attr("checked", true);
            $("#check_of33b").show();
            $("#_040_of33b_currency_additional_amount").attr("disabled", false);
            $("#_041_of33b_amount").attr("disabled", false);
        } else {
            $("#check_of33b").hide();
            $("#_040_of33b_currency_additional_amount").attr("disabled", true);
            $("#_041_of33b_amount").attr("disabled", true);
        }
        
        //MF32_a_b
        if ($("#_030_mf32a_date").val() != "" || $("#_031_mf32a_currency").val() != "" || $("#_032_mf32a_amount").val() != ""){
            $("#type_mf32_principal_amount_paid").val("a").attr("selected",true);
            $("#div_mf32a_").show();
            $("#div_mf32b_").hide();
            $("#_030_mf32a_date").attr("disabled", false);
            $("#_031_mf32a_currency").attr("disabled", false);
            $("#_032_mf32a_amount").attr("disabled", false);
            $("#_033_mf32b_currency").attr("disabled", true);
            $("#_034_mf32b_amount").attr("disabled", true);
        } else if ($("#_033_mf32b_currency").val() != "" || $("#_034_mf32b_amount").val() != ""){
            $("#type_mf32_principal_amount_paid").val("b").attr("selected",true);
            $("#div_mf32a_").hide();
            $("#div_mf32b_").show();
            $("#_030_mf32a_date").attr("disabled", true);
            $("#_031_mf32a_currency").attr("disabled", true);
            $("#_032_mf32a_amount").attr("disabled", true);
            $("#_033_mf32b_currency").attr("disabled", false);
            $("#_034_mf32b_amount").attr("disabled", false);
        } else{
            $("#div_mf32a_").hide();
            $("#div_mf32b_").hide();
            $("#_030_mf32a_date").attr("disabled", true);
            $("#_031_mf32a_currency").attr("disabled", true);
            $("#_032_mf32a_amount").attr("disabled", true);
            $("#_033_mf32b_currency").attr("disabled", true);
            $("#_034_mf32b_amount").attr("disabled", true);
        }
        
        //OF34_a_b
        if ($("#_070_of34a_date").val() != "" || $("#_071_of34a_currency").val() != "" || $("#_072_of34a_amount").val() != ""){
            $("#type_of34_total_amount_claimed").val("a").attr("selected",true);
            $("#div_of34a_").show();
            $("#div_of34b_").hide();
            $("#_070_of34a_date").attr("disabled", false);
            $("#_071_of34a_currency").attr("disabled", false);
            $("#_072_of34a_amount").attr("disabled", false);
            $("#_073_of34b_currency").attr("disabled", true);
            $("#_074_of34b_amount").attr("disabled", true);
        } else if ($("#_073_of34b_currency").val() != "" || $("#_074_of34b_amount").val() != ""){
            $("#type_of34_total_amount_claimed").val("b").attr("selected",true);
            $("#div_of34a_").hide();
            $("#div_of34b_").show();
            $("#_070_of34a_date").attr("disabled", true);
            $("#_071_of34a_currency").attr("disabled", true);
            $("#_072_of34a_amount").attr("disabled", true);
            $("#_073_of34b_currency").attr("disabled", false);
            $("#_074_of34b_amount").attr("disabled", false);
        } else{
            $("#div_of34a_").hide();
            $("#div_of34b_").hide();
            $("#_070_of34a_date").attr("disabled", true);
            $("#_071_of34a_currency").attr("disabled", true);
            $("#_072_of34a_amount").attr("disabled", true);
            $("#_073_of34b_currency").attr("disabled", true);
            $("#_074_of34b_amount").attr("disabled", true);
        }
        
        //OF53_a_b_d
        if ($("#_080_of53a_party_identifier").val() != "" || $("#_081_of53a_identifier_code").val() != ""){
            $("#type_of53_reimbursing_bank").val("a").attr("selected",true);
            $("#div_of53a_").show();
            $("#div_of53b_").hide();
            $("#div_of53d_").hide();
            $("#_080_of53a_party_identifier").attr("disabled", false);
            $("#_081_of53a_identifier_code").attr("disabled", false);
            $("#_082_of53b_party_identifier").attr("disabled", true);
            $("#_083_of53b_location").attr("disabled", true);
            $("#_084_of53d_party_identifier").attr("disabled", true);
            $("#_085_of53d_name_address").attr("disabled", true);
        } else if ($("#_082_of53b_party_identifier").val() != "" || $("#_083_of53b_location").val() != ""){
            $("#type_of53_reimbursing_bank").val("b").attr("selected",true);
            $("#div_of53a_").hide();
            $("#div_of53b_").show();
            $("#div_of53d_").hide();
            $("#_080_of53a_party_identifier").attr("disabled", true);
            $("#_081_of53a_identifier_code").attr("disabled", true);
            $("#_082_of53b_party_identifier").attr("disabled", false);
            $("#_083_of53b_location").attr("disabled", false);
            $("#_084_of53d_party_identifier").attr("disabled", true);
            $("#_085_of53d_name_address").attr("disabled", true);
        } else if ($("#_084_of53d_party_identifier").val() != "" || $("#_085_of53d_name_address").val() != ""){
            $("#type_of53_reimbursing_bank").val("d").attr("selected",true);
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#div_of53d_").show();
            $("#_080_of53a_party_identifier").attr("disabled", true);
            $("#_081_of53a_identifier_code").attr("disabled", true);
            $("#_082_of53b_party_identifier").attr("disabled", true);
            $("#_083_of53b_location").attr("disabled", true);
            $("#_084_of53d_party_identifier").attr("disabled", false);
            $("#_085_of53d_name_address").attr("disabled", false);
        } else{
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#div_of53d_").hide();
            $("#_080_of53a_party_identifier").attr("disabled", true);
            $("#_081_of53a_identifier_code").attr("disabled", true);
            $("#_082_of53b_party_identifier").attr("disabled", true);
            $("#_083_of53b_location").attr("disabled", true);
            $("#_084_of53d_party_identifier").attr("disabled", true);
            $("#_085_of53d_name_address").attr("disabled", true);
        }
        
        //OF57_a_b_d
        if ($("#_090_of57a_party_identifier").val() != "" || $("#_091_of57a_identifier_code").val() != ""){
            $("#type_of57_account_with_bank").val("a").attr("selected",true);
            $("#div_of57a_").show();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_090_of57a_party_identifier").attr("disabled", false);
            $("#_091_of57a_identifier_code").attr("disabled", false);
            $("#_092_of57b_party_identifier").attr("disabled", true);
            $("#_093_of57b_location").attr("disabled", true);
            $("#_094_of57d_party_identifier").attr("disabled", true);
            $("#_095_of57d_name_address").attr("disabled", true);
        } else if ($("#_092_of57b_party_identifier").val() != "" || $("#_093_of57b_location").val() != ""){
            $("#type_of57_account_with_bank").val("b").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").show();
            $("#div_of57d_").hide();
            $("#_090_of57a_party_identifier").attr("disabled", true);
            $("#_091_of57a_identifier_code").attr("disabled", true);
            $("#_092_of57b_party_identifier").attr("disabled", false);
            $("#_093_of57b_location").attr("disabled", false);
            $("#_094_of57d_party_identifier").attr("disabled", true);
            $("#_095_of57d_name_address").attr("disabled", true);
        } else if ($("#_094_of57d_party_identifier").val() != "" || $("#_095_of57d_name_address").val() != ""){
            $("#type_of57_account_with_bank").val("d").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").show();
            $("#_090_of57a_party_identifier").attr("disabled", true);
            $("#_091_of57a_identifier_code").attr("disabled", true);
            $("#_092_of57b_party_identifier").attr("disabled", true);
            $("#_093_of57b_location").attr("disabled", true);
            $("#_094_of57d_party_identifier").attr("disabled", false);
            $("#_095_of57d_name_address").attr("disabled", false);
        } else{
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_090_of57a_party_identifier").attr("disabled", true);
            $("#_091_of57a_identifier_code").attr("disabled", true);
            $("#_092_of57b_party_identifier").attr("disabled", true);
            $("#_093_of57b_location").attr("disabled", true);
            $("#_094_of57d_party_identifier").attr("disabled", true);
            $("#_095_of57d_name_address").attr("disabled", true);
        }
        
        //OF58_a_d
        if ($("#_100_of58a_party_identifier").val() != "" || $("#_101_of58a_identifier_code").val() != ""){
            $("#type_of58_beneficiary_bank").val("a").attr("selected",true);
            $("#div_of58a_").show();
            $("#div_of58d_").hide();
            $("#_100_of58a_party_identifier").attr("disabled", false);
            $("#_101_of58a_identifier_code").attr("disabled", false);
            $("#_102_of58d_party_identifier").attr("disabled", true);
            $("#_103_of58d_name_address").attr("disabled", true);
        } else if ($("#_102_of58d_party_identifier").val() != "" || $("#_103_of58d_name_address").val() != ""){
            $("#type_of58_beneficiary_bank").val("d").attr("selected",true);
            $("#div_of58a_").hide();
            $("#div_of58d_").show();
            $("#_100_of58a_party_identifier").attr("disabled", true);
            $("#_101_of58a_identifier_code").attr("disabled", true);
            $("#_102_of58d_party_identifier").attr("disabled", false);
            $("#_103_of58d_name_address").attr("disabled", false);
        } else{
            $("#div_of58a_").hide();
            $("#div_of58d_").hide();
            $("#_100_of58a_party_identifier").attr("disabled", true);
            $("#_101_of58a_identifier_code").attr("disabled", true);
            $("#_102_of58d_party_identifier").attr("disabled", true);
            $("#_103_of58d_name_address").attr("disabled", true);
        }
        
    });
</script>