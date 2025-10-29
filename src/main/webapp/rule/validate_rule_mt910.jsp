<%-- 
    Document   : validate_rule_mt910
    Created on : Mei 22, 2019
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
                _010_mf20_transaction_reference_number: "required",
                _020_mf21_related_reference: "required",
                _030_mf25_account_identification: "required",

                //mf32a
                _050_mf32a_value_date: "required",
                _051_mf32a_currency_code: "required",
                _052_mf32a_amount: "required",

                //of50
                _061_of50a_identifier_code: "required",
                _063_of50f_party_identifier: "required",
                _064_of50f_name_address: "required",
                _066_of50k_name_address: "required",
                type_of50_ordering_customer: {
                    required: function(element) {
                      return ($("#type_of52_ordering_institution").val() == "");
                    }
                },

                //of52a_d
                _071_of52a_identifier_code: "required",
                _074_of52d_name_address: "required",

                //of56a_d
                _081_of56a_identifier_code: "required",
                _084_of56d_name_address: "required",
                
                
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_transaction_reference_number: {required: "mf20_transaction_reference_number harus diisi..!!"},
                _020_mf21_related_reference: {required: "mf21_related_reference harus diisi..!!"},
                _030_mf25_account_identification: {required: "mf25_account_identification harus diisi..!!"},
                _050_mf32a_value_date: {required: "mf32a_value_date harus diisi..!!"},
                _051_mf32a_currency_code: {required: "mf32a_currency_code harus diisi..!!"},
                _052_mf32a_amount: {required: "mf32a_amount harus diisi..!!"},
                _061_of50a_identifier_code: {required: "of50a_identifier_code harus diisi..!!"},
                _063_of50f_party_identifier: {required: "of50f_party_identifier harus diisi..!!"},
                _064_of50f_name_address: {required: "of50f_name_address harus diisi..!!"},
                _066_of50k_name_address: {required: "of50k_name_address harus diisi..!!"},
                _071_of52a_identifier_code: {required: "of52a_identifier_code harus diisi..!!"},
                _074_of52d_name_address: {required: "of52d_name_address harus diisi..!!"},
                _081_of56a_identifier_code: {required: "of56a_identifier_code harus diisi..!!"},
                _084_of56d_name_address: {required: "of56d_name_address harus diisi..!!"},
                
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
        //of50_a_f_k
        $("#div_of50a_ordering_costumer").hide();
        $("#div_of50f_ordering_costumer").hide();
        $("#div_of50k_ordering_costumer").hide();
        $("#_060_of50a_account").attr("disabled", true);
        $("#_061_of50a_identifier_code").attr("disabled", true);
//        $("#_062_of50a_address").attr("disabled", true);
        $("#_063_of50f_party_identifier").attr("disabled", true);
        $("#_064_of50f_name_address").attr("disabled", true);
        $("#_065_of50k_account").attr("disabled", true);
        $("#_066_of50k_name_address").attr("disabled", true);
        $("#type_of50_ordering_customer").change(function() {
            if ( $("#type_of50_ordering_customer").val() == "a"){
                $("#div_of50a_ordering_costumer").show();
                $("#_060_of50a_account").attr("disabled", false);
                $("#_061_of50a_identifier_code").attr("disabled", false);
//                $("#_062_of50a_address").attr("disabled", false);
                $("#div_of50f_ordering_costumer").hide();
                $("#_063_of50f_party_identifier").attr("disabled", true);
                $("#_064_of50f_name_address").attr("disabled", true);
                $("#div_of50k_ordering_costumer").hide();
                $("#_065_of50k_account").attr("disabled", true);
                $("#_066_of50k_name_address").attr("disabled", true);
            } else if ( $("#type_of50_ordering_customer").val() == "f"){
                $("#div_of50a_ordering_costumer").hide();
                $("#_060_of50a_account").attr("disabled", true);
                $("#_061_of50a_identifier_code").attr("disabled", true);
//                $("#_062_of50a_address").attr("disabled", true);
                $("#div_of50f_ordering_costumer").show();
                $("#_063_of50f_party_identifier").attr("disabled", false);
                $("#_064_of50f_name_address").attr("disabled", false);
                $("#div_of50k_ordering_costumer").hide();
                $("#_065_of50k_account").attr("disabled", true);
                $("#_066_of50k_name_address").attr("disabled", true);
            } else if ( $("#type_of50_ordering_customer").val() == "k"){
                $("#div_of50a_ordering_costumer").hide();
                $("#_060_of50a_account").attr("disabled", true);
                $("#_061_of50a_identifier_code").attr("disabled", true);
//                $("#_062_of50a_address").attr("disabled", true);
                $("#div_of50f_ordering_costumer").hide();
                $("#_063_of50f_party_identifier").attr("disabled", true);
                $("#_064_of50f_name_address").attr("disabled", true);
                $("#div_of50k_ordering_costumer").show();
                $("#_065_of50k_account").attr("disabled", false);
                $("#_066_of50k_name_address").attr("disabled", false);
            } else{
                $("#div_of50a_ordering_costumer").hide();
                $("#_060_of50a_account").attr("disabled", true);
                $("#_061_of50a_identifier_code").attr("disabled", true);
//                $("#_062_of50a_address").attr("disabled", true);
                $("#div_of50f_ordering_costumer").hide();
                $("#_063_of50f_party_identifier").attr("disabled", true);
                $("#_064_of50f_name_address").attr("disabled", true);
                $("#div_of50k_ordering_costumer").hide();
                $("#_065_of50k_account").attr("disabled", true);
                $("#_066_of50k_name_address").attr("disabled", true);
            }
        });

        //of52a_d
        $("#div_of52a_ordering_institution").hide();
        $("#div_of52d_ordering_institution").hide();
        $("#_070_of52a_party_identifier").attr("disabled", true);
        $("#_071_of52a_identifier_code").attr("disabled", true);
//        $("#_072_of52a_address").attr("disabled", true);
        $("#_073_of52d_party_identifier").attr("disabled", true);
        $("#_074_of52d_name_address").attr("disabled", true);
        $("#type_of52_ordering_institution").change(function() {
            if ( $("#type_of52_ordering_institution").val() == "a"){
                $("#div_of52a_ordering_institution").show();
                $("#_070_of52a_party_identifier").attr("disabled", false);
                $("#_071_of52a_identifier_code").attr("disabled", false);
//                $("#_072_of52a_address").attr("disabled", false);
                $("#div_of52d_ordering_institution").hide();
                $("#_073_of52d_party_identifier").attr("disabled", true);
                $("#_074_of52d_name_address").attr("disabled", true);
            } else if ( $("#type_of52_ordering_institution").val() == "d"){
                $("#div_of52a_ordering_institution").hide();
                $("#_070_of52a_party_identifier").attr("disabled", true);
                $("#_071_of52a_identifier_code").attr("disabled", true);
//                $("#_072_of52a_address").attr("disabled", true);
                $("#div_of52d_ordering_institution").show();
                $("#_073_of52d_party_identifier").attr("disabled", false);
                $("#_074_of52d_name_address").attr("disabled", false);
            } else{
                $("#div_of52a_ordering_institution").hide();
                $("#_070_of52a_party_identifier").attr("disabled", true);
                $("#_071_of52a_identifier_code").attr("disabled", true);
//                $("#_072_of52a_address").attr("disabled", true);
                $("#div_of52d_ordering_institution").hide();
                $("#_073_of52d_party_identifier").attr("disabled", true);
                $("#_074_of52d_name_address").attr("disabled", true);
            }
        });

        //of56a_d
        $("#div_of56a_intermediary").hide();
        $("#div_of56d_intermediary").hide();
        $("#_080_of56a_party_identifier").attr("disabled", true);
        $("#_081_of56a_identifier_code").attr("disabled", true);
//        $("#_082_of56a_address").attr("disabled", true);
        $("#_083_of56d_party_identifier").attr("disabled", true);
        $("#_084_of56d_name_address").attr("disabled", true);
        $("#type_of56_intermediary").change(function() {
            if ( $("#type_of56_intermediary").val() == "a"){
                $("#div_of56a_intermediary").show();
                $("#_080_of56a_party_identifier").attr("disabled", false);
                $("#_081_of56a_identifier_code").attr("disabled", false);
//                $("#_082_of56a_address").attr("disabled", false);
                $("#div_of56d_intermediary").hide();
                $("#_083_of56d_party_identifier").attr("disabled", true);
                $("#_084_of56d_name_address").attr("disabled", true);
            } else if ( $("#type_of56_intermediary").val() == "d"){
                $("#div_of56a_intermediary").hide();
                $("#_080_of56a_party_identifier").attr("disabled", true);
                $("#_081_of56a_identifier_code").attr("disabled", true);
//                $("#_082_of56a_address").attr("disabled", true);
                $("#div_of56d_intermediary").show();
                $("#_083_of56d_party_identifier").attr("disabled", false);
                $("#_084_of56d_name_address").attr("disabled", false);
            } else{
                $("#div_of56a_intermediary").hide();
                $("#_080_of56a_party_identifier").attr("disabled", true);
                $("#_081_of56a_identifier_code").attr("disabled", true);
//                $("#_082_of56a_address").attr("disabled", true);
                $("#div_of56d_intermediary").hide();
                $("#_083_of56d_party_identifier").attr("disabled", true);
                $("#_084_of56d_name_address").attr("disabled", true);
            }
        });
    });
</script>

<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        //of50_a_f_k
        if ($("#_060_of50a_account").val() != "" || $("#_061_of50a_identifier_code").val() != "" || $("#_062_of50a_address").val() != ""){
            $("#type_of50_ordering_customer").val("a").attr("selected",true);
            $("#div_of50a_ordering_costumer").show();
            $("#div_of50f_ordering_costumer").hide();
            $("#div_of50k_ordering_costumer").hide();
            $("#_060_of50a_account").attr("disabled", false);
            $("#_061_of50a_identifier_code").attr("disabled", false);
//            $("#_062_of50a_address").attr("disabled", false);
            $("#_063_of50f_party_identifier").attr("disabled", true);
            $("#_064_of50f_name_address").attr("disabled", true);
            $("#_065_of50k_account").attr("disabled", true);
            $("#_066_of50k_name_address").attr("disabled", true);
        } else if ($("#_063_of50f_party_identifier").val() != "" || $("#_064_of50f_name_address").val() != ""){
            $("#type_of50_ordering_customer").val("f").attr("selected",true);
            $("#div_of50a_ordering_costumer").hide();
            $("#div_of50f_ordering_costumer").show();
            $("#div_of50k_ordering_costumer").hide();
            $("#_060_of50a_account").attr("disabled", true);
            $("#_061_of50a_identifier_code").attr("disabled", true);
//            $("#_062_of50a_address").attr("disabled", true);
            $("#_063_of50f_party_identifier").attr("disabled", false);
            $("#_064_of50f_name_address").attr("disabled", false);
            $("#_065_of50k_account").attr("disabled", true);
            $("#_066_of50k_name_address").attr("disabled", true);
        } else if ($("#_065_of50k_account").val() != "" || $("#_066_of50k_name_address").val() != ""){
            $("#type_of50_ordering_customer").val("k").attr("selected",true);
            $("#div_of50a_ordering_costumer").hide();
            $("#div_of50f_ordering_costumer").hide();
            $("#div_of50k_ordering_costumer").show();
            $("#_060_of50a_account").attr("disabled", true);
            $("#_061_of50a_identifier_code").attr("disabled", true);
//            $("#_062_of50a_address").attr("disabled", true);
            $("#_063_of50f_party_identifier").attr("disabled", true);
            $("#_064_of50f_name_address").attr("disabled", true);
            $("#_065_of50k_account").attr("disabled", false);
            $("#_066_of50k_name_address").attr("disabled", false);
        } else{
            $("#div_of50a_ordering_costumer").hide();
            $("#div_of50f_ordering_costumer").hide();
            $("#div_of50k_ordering_costumer").hide();
            $("#_060_of50a_account").attr("disabled", true);
            $("#_061_of50a_identifier_code").attr("disabled", true);
//            $("#_062_of50a_address").attr("disabled", true);
            $("#_063_of50f_party_identifier").attr("disabled", true);
            $("#_064_of50f_name_address").attr("disabled", true);
            $("#_065_of50k_account").attr("disabled", true);
            $("#_066_of50k_name_address").attr("disabled", true);
        }

        //of52_a_d
        if ($("#_070_of52a_party_identifier").val() != "" || $("#_071_of52a_identifier_code").val() != "" || $("#_072_of52a_address").val() != ""){
            $("#type_of52_ordering_institution").val("a").attr("selected",true);
            $("#div_of52a_ordering_institution").show();
            $("#div_of52d_ordering_institution").hide();
            $("#_070_of52a_party_identifier").attr("disabled", false);
            $("#_071_of52a_identifier_code").attr("disabled", false);
//            $("#_072_of52a_address").attr("disabled", false);
            $("#_073_of52d_party_identifier").attr("disabled", true);
            $("#_074_of52d_name_address").attr("disabled", true);
        } else if ($("#_073_of52d_party_identifier").val() != "" || $("#_074_of52d_name_address").val() != ""){
            $("#type_of52_ordering_institution").val("d").attr("selected",true);
            $("#div_of52a_ordering_institution").hide();
            $("#div_of52d_ordering_institution").show();
            $("#_070_of52a_party_identifier").attr("disabled", true);
            $("#_071_of52a_identifier_code").attr("disabled", true);
//            $("#_072_of52a_address").attr("disabled", true);
            $("#_073_of52d_party_identifier").attr("disabled", false);
            $("#_074_of52d_name_address").attr("disabled", false);
        } else{
            $("#div_of52a_ordering_institution").hide();
            $("#div_of52d_ordering_institution").hide();
            $("#_070_of52a_party_identifier").attr("disabled", true);
            $("#_071_of52a_identifier_code").attr("disabled", true);
//            $("#_072_of52a_address").attr("disabled", true);
            $("#_073_of52d_party_identifier").attr("disabled", true);
            $("#_074_of52d_name_address").attr("disabled", true);
        }
        
        //of56_a_d
        if ($("#_080_of56a_party_identifier").val() != "" || $("#_081_of56a_identifier_code").val() != "" || $("#_082_of56a_address").val() != ""){
            $("#type_of56_intermediary").val("a").attr("selected",true);
            $("#div_of56a_intermediary").show();
            $("#div_of56d_intermediary").hide();
            $("#_080_of56a_party_identifier").attr("disabled", false);
            $("#_081_of56a_identifier_code").attr("disabled", false);
//            $("#_082_of56a_address").attr("disabled", false);
            $("#_083_of56d_party_identifier").attr("disabled", true);
            $("#_084_of56d_name_address").attr("disabled", true);
        } else if ($("#_083_of56d_party_identifier").val() != "" || $("#_084_of56d_name_address").val() != ""){
            $("#type_of56_intermediary").val("d").attr("selected",true);
            $("#div_of56a_intermediary").hide();
            $("#div_of56d_intermediary").show();
            $("#_080_of56a_party_identifier").attr("disabled", true);
            $("#_081_of56a_identifier_code").attr("disabled", true);
//            $("#_082_of56a_address").attr("disabled", true);
            $("#_083_of56d_party_identifier").attr("disabled", false);
            $("#_084_of56d_name_address").attr("disabled", false);
        } else{
            $("#div_of56a_intermediary").hide();
            $("#div_of56d_intermediary").hide();
            $("#_080_of56a_party_identifier").attr("disabled", true);
            $("#_081_of56a_identifier_code").attr("disabled", true);
//            $("#_082_of56a_address").attr("disabled", true);
            $("#_083_of56d_party_identifier").attr("disabled", true);
            $("#_084_of56d_name_address").attr("disabled", true);
        }
        
    });
</script>