<%-- 
    Document   : validate_rule_mt320
    Created on : Jun 11, 2019, 2:20:10 PM
    Author     : AplDev2
--%>

<script type="text/javascript">
    $(document).ready(function () {
        $("#form1").validate({
            rules: {
//              header
//              unit: "required",
                sender_logical_terminal: "required",
                //sender_type: "required",
                //sender_type_institution: "required",

                //receiver_type: "required",
                receiver_institution: "required",

                priority: "required",
                //monitoring: "required",

                //Mandatory Sequence A General Information

                //body
                //MF20
                _010_mf20_sender_reference: "required",

                //MF22A
                _030_mf22a_type_of_operation: "required",

                //MF22B
                _050_mf22b_type_of_event: "required",

                //MF22C
                _060_mf22c_common_reference: "required",

                //MF82
                type_mf82_: "required",
                _071_mf82a_identifier_code: "required",
                _074_mf82d_name_address: "required",
                _075_mf82j_party_identification: "required",

                //MF87
                type_mf87_: "required",
                _081_mf87a_identifier_code: "required",
                _084_mf87d_name_address: "required",
                _085_mf87j_party_identification: "required",

                //OF83
                _091_of83a_identifier_code: "required",
                _094_of83d_name_address: "required",
                _095_of83j_party_identification: "required",

                //Mandatory Sequence B Transaction Details

                //MF17R
                _110_mf17r_party_as_role: "required",

                //MF30T
                _120_mf30t_trade_date: "required",

                //MF30V
                _130_mf30v_value_date: "required",

                //MF30P
                _140_mf30p_maturity_date: "required",

                //MF32B
                _150_mf32b_currency_code: "required",
                _151_mf32b_amount: "required",

                //MF34E
//                _180_mf34e_sign: "required",
                _181_mf34e_currency: "required",
                _182_mf34e_amount: "required",

                //MF37G
//                _190_mf37g_sign: "required",
                _191_mf37g_rate: "required",

                //MF14D
                _200_mf14d_day_count_fraction: "required",

                //Mandatory Sequence C

                //OF53
                _241_of53a_identifier_code: "required",
                _244_of53d_name_address: "required",
                _245_of53j_party_identification: "required",

                //OF86
                _251_of86a_identifier_code: "required",
                _254_of86d_name_address: "required",
                _255_of86j_party_identification: "required",

                //OF56
                _261_of56a_identifier_code: "required",
                _264_of56d_name_address: "required",
                _265_of56j_party_identification: "required",

                //MF57
                type_mf57_: "required",
                _271_mf57a_identifier_code: "required",
                _274_mf57d_name_address: "required",
                _275_mf57j_party_identification: "required",

                //OF58
                _281_of58a_identifier_code: "required",
                _284_of58d_name_address: "required",
                _285_of58j_party_identification: "required",

                //Mandatory Sequence D

                //OF53
                _291_of53a_identifier_code: "required",
                _294_of53d_name_address: "required",
                _295_of53j_party_identification: "required",

                //OF86
                _301_of86a_identifier_code: "required",
                _304_of86d_name_address: "required",
                _305_of86j_party_identification: "required",

                //OF56
                _311_of56a_identifier_code: "required",
                _314_of56d_name_address: "required",
                _315_of56j_party_identification: "required",

                //MF57
                type_mf57_d: "required",
                _321_mf57a_identifier_code: "required",
                _324_mf57d_name_address: "required",
                _325_mf57j_party_identification: "required",

                //OF58
                _331_of58a_identifier_code: "required",
                _334_of58d_name_address: "required",
                _335_of58j_party_identification: "required",
                
                //template
                template_name: "required"
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_sender_reference: {required: "mf20_sender_reference harus diisi..!!"},
                _030_mf22a_type_of_operation: {required: "mf22a_type_of_operation harus diisi..!!"},
                _050_mf22b_type_of_event: {required: "mf22b_type_of_event harus diisi..!!"},
                _060_mf22c_common_reference: {required: "mf22c_common_reference harus diisi..!!"},
                _071_mf82a_identifier_code: {required: "mf82a_identifier_code harus diisi..!!"},
                _074_mf82d_name_address: {required: "mf82d_name_address harus diisi..!!"},
                _075_mf82j_party_identification: {required: "mf82j_party_identification harus diisi..!!"},
                _081_mf87a_identifier_code: {required: "mf87a_identifier_code harus diisi..!!"},
                _084_mf87d_name_address: {required: "mf87d_name_address harus diisi..!!"},
                _085_mf87j_party_identification: {required: "mf87j_party_identification harus diisi..!!"},
                _091_of83a_identifier_code: {required: "of83a_identifier_code harus diisi..!!"},
                _094_of83d_name_address: {required: "of83d_name_address harus diisi..!!"},
                _095_of83j_party_identification: {required: "of83j_party_identification harus diisi..!!"},
                _110_mf17r_party_as_role: {required: "mf17r_party_as_role harus diisi..!!"},
                _120_mf30t_trade_date: {required: "mf30t_trade_date harus diisi..!!"},
                _130_mf30v_value_date: {required: "mf30v_value_date harus diisi..!!"},
                _140_mf30p_maturity_date: {required: "mf30p_maturity_date harus diisi..!!"},
                _150_mf32b_currency_code: {required: "mf32b_currency_code harus diisi..!!"},
                _151_mf32b_amount: {required: "mf32b_amount harus diisi..!!"},
                _180_mf34e_sign: {required: "mf34e_sign harus diisi..!!"},
                _181_mf34e_currency: {required: "mf34e_currency harus diisi..!!"},
                _182_mf34e_amount: {required: "mf34e_amount harus diisi..!!"},
                _190_mf37g_sign: {required: "mf37g_sign harus diisi..!!"},
                _191_mf37g_rate: {required: "mf37g_rate harus diisi..!!"},
                _200_mf14d_day_count_fraction: {required: "mf14d_day_count_fraction harus diisi..!!"},
                _241_of53a_identifier_code: {required: "of53a_identifier_code harus diisi..!!"},
                _244_of53d_name_address: {required: "of53d_name_address harus diisi..!!"},
                _245_of53j_party_identification: {required: "of53j_party_identification harus diisi..!!"},
                _251_of86a_identifier_code: {required: "of86a_identifier_code harus diisi..!!"},
                _254_of86d_name_address: {required: "of86d_name_address harus diisi..!!"},
                _255_of86j_party_identification: {required: "of86j_party_identification harus diisi..!!"},
                _261_of56a_identifier_code: {required: "of56a_identifier_code harus diisi..!!"},
                _264_of56d_name_address: {required: "of56d_name_address harus diisi..!!"},
                _265_of56j_party_identification: {required: "of56j_party_identification harus diisi..!!"},
                _271_mf57a_identifier_code: {required: "mf57a_identifier_code harus diisi..!!"},
                _274_mf57d_name_address: {required: "mf57d_name_address harus diisi..!!"},
                _275_mf57j_party_identification: {required: "mf57j_party_identification harus diisi..!!"},
                _281_of58a_identifier_code: {required: "of58a_identifier_code harus diisi..!!"},
                _284_of58d_name_address: {required: "of58d_name_address harus diisi..!!"},
                _285_of58j_party_identification: {required: "of58j_party_identification harus diisi..!!"},
                _291_of53a_identifier_code: {required: "of53a_identifier_code harus diisi..!!"},
                _294_of53d_name_address: {required: "of53d_name_address harus diisi..!!"},
                _295_of53j_party_identification: {required: "of53j_party_identification harus diisi..!!"},
                _301_of86a_identifier_code: {required: "of86a_identifier_code harus diisi..!!"},
                _304_of86d_name_address: {required: "of86d_name_address harus diisi..!!"},
                _305_of86j_party_identification: {required: "of86j_party_identification harus diisi..!!"},
                _311_of56a_identifier_code: {required: "of56a_identifier_code harus diisi..!!"},
                _314_of56d_name_address: {required: "of56d_name_address: harus diisi..!!"},
                _315_of56j_party_identification: {required: "of56j_party_identification harus diisi..!!"},
                _321_mf57a_identifier_code: {required: "mf57a_identifier_code harus diisi..!!"},
                _324_mf57d_name_address: {required: "mf57d_name_address harus diisi..!!"},
                _325_mf57j_party_identification: {required: "mf57j_party_identification harus diisi..!!"},
                _331_of58a_identifier_code: {required: "of58a_identifier_code harus diisi..!!"},
                _334_of58d_name_address: {required: "of58d_name_address harus diisi..!!"},
                _335_of58j_party_identification: {required: "of58j_party_identification harus diisi..!!"},
                template_name: {required: "Template Name harus diisi..!!"}
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
                alert(error.html());
            },
            showErrors: function (errorMap, errorList) {
                this.defaultShowErrors();
            }
        });
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function () {
        
        //template
        $("#check_template").hide();
        $("#template_name").attr("disabled", true);
        $("#flag_template_checkbox").click(function () {
            if ($("#flag_template_checkbox").is(":checked")) {
                $("#check_template").show();
                $("#template_name").attr("disabled", false);
            } else {
                $("#check_template").hide();
                $("#template_name").attr("disabled", true);
            }
        });


        //OF94A_check
//        $("#check_of94a").hide();
//        $("_040_of94a_scope_of_operation").attr("disabled", true);
//        $("#scope_of_operation_checkbox").click(function () {
//            if ($("#scope_of_operation_checkbox").is(":checked")) {
//                $("#check_of94a").show();
//                $("#_040_of94a_scope_of_operation").attr("disabled", false);
//            } else {
//                $("#check_of94a").hide();
//                $("#_040_of94a_scope_of_operation").attr("disabled", true);
//            }
//        });

        //check_of38j
        $("#check_of38j").hide();
        $("#_220_of38j_number_of_days").attr("disabled", true);
        $("#_221_of38j_number").attr("disabled", true);
        $("#number_of_days_checkbox").click(function () {
            if ($("#number_of_days_checkbox").is(":checked")) {
                $("#check_of38j").show();
                $("#_220_of38j_number_of_days").attr("disabled", false);
                $("#_221_of38j_number").attr("disabled", false);
            } else {
                $("#check_of38j").hide();
                $("#_220_of38j_number_of_days").attr("disabled", true);
                $("#_221_of38j_number").attr("disabled", true);
            }
        });

        //OF32H_check
        $("#check_of32h").hide();
        $("#_160_of32h_sign").attr("disabled", true);
        $("#_161_of32h_currency").attr("disabled", true);
        $("#_162_of32h_amount").attr("disabled", true);
        $("#amount_to_be_settled_checkbox").click(function () {
            if ($("#amount_to_be_settled_checkbox").is(":checked")) {
                $("#check_of32h").show();
                $("#_160_of32h_sign").attr("disabled", false);
                $("#_161_of32h_currency").attr("disabled", false);
                $("#_162_of32h_amount").attr("disabled", false);
            } else {
                $("#check_of32h").hide();
                $("#_160_of32h_sign").attr("disabled", true);
                $("#_161_of32h_currency").attr("disabled", true);
                $("#_162_of32h_amount").attr("disabled", true);
            }
        });


        //MF82_a_d_j
        $("#div_mf82a_").hide();
        $("#div_mf82d_").hide();
        $("#div_mf82j_").hide();
        $("#_070_mf82a_party_identifier").attr("disabled", true);
        $("#_071_mf82a_identifier_code").attr("disabled", true);
        $("#_073_mf82d_party_identifier").attr("disabled", true);
        $("#_074_mf82d_name_address").attr("disabled", true);
        $("#_075_mf82j_party_identification").attr("disabled", true);
        $("#type_mf82_").change(function () {
            if ($("#type_mf82_").val() == "a") {
                $("#div_mf82a_").show();
                $("#div_mf82d_").hide();
                $("#div_mf82j_").hide();
                $("#_070_mf82a_party_identifier").attr("disabled", false);
                $("#_071_mf82a_identifier_code").attr("disabled", false);
                $("#_073_mf82d_party_identifier").attr("disabled", true);
                $("#_074_mf82d_name_address").attr("disabled", true);
                $("#_075_mf82j_party_identification").attr("disabled", true);
            } else if ($("#type_mf82_").val() == "d") {
                $("#div_mf82a_").hide();
                $("#div_mf82d_").show();
                $("#div_mf82j_").hide();
                $("#_070_mf82a_party_identifier").attr("disabled", true);
                $("#_071_mf82a_identifier_code").attr("disabled", true);
                $("#_073_mf82d_party_identifier").attr("disabled", false);
                $("#_074_mf82d_name_address").attr("disabled", false);
                $("#_075_mf82j_party_identification").attr("disabled", true);
            } else if ($("#type_mf82_").val() == "j") {
                $("#div_mf82a_").hide();
                $("#div_mf82d_").hide();
                $("#div_mf82j_").show();
                $("#_070_mf82a_party_identifier").attr("disabled", true);
                $("#_071_mf82a_identifier_code").attr("disabled", true);
                $("#_073_mf82d_party_identifier").attr("disabled", true);
                $("#_074_mf82d_name_address").attr("disabled", true);
                $("#_075_mf82j_party_identification").attr("disabled", false);
            } else {
                $("#div_mf82a_").hide();
                $("#div_mf82d_").hide();
                $("#div_mf82j_").hide();
                $("#_070_mf82a_party_identifier").attr("disabled", true);
                $("#_071_mf82a_identifier_code").attr("disabled", true);
                $("#_073_mf82d_party_identifier").attr("disabled", true);
                $("#_074_mf82d_name_address").attr("disabled", true);
                $("#_075_mf82j_party_identification").attr("disabled", true);
            }
        });
        //end of the line
        //MF87_a_d_j
        $("#div_mf87a_").hide();
        $("#div_mf87d_").hide();
        $("#div_mf87j_").hide();
        $("#_080_mf87a_party_identifier").attr("disabled", true);
        $("#_081_mf87a_identifier_code").attr("disabled", true);
        $("#_083_mf87d_party_identifier").attr("disabled", true);
        $("#_084_mf87d_name_address").attr("disabled", true);
        $("#_085_mf87j_party_identification").attr("disabled", true);
        $("#type_mf87_").change(function () {
            if ($("#type_mf87_").val() == "a") {
                $("#div_mf87a_").show();
                $("#div_mf87d_").hide();
                $("#div_mf87j_").hide();
                $("#_080_mf87a_party_identifier").attr("disabled", false);
                $("#_081_mf87a_identifier_code").attr("disabled", false);
                $("#_083_mf87d_party_identifier").attr("disabled", true);
                $("#_084_mf87d_name_address").attr("disabled", true);
                $("#_085_mf87j_party_identification").attr("disabled", true);
            } else if ($("#type_mf87_").val() == "d") {
                $("#div_mf87a_").hide();
                $("#div_mf87d_").show();
                $("#div_mf87j_").hide();
                $("#_080_mf87a_party_identifier").attr("disabled", true);
                $("#_081_mf87a_identifier_code").attr("disabled", true);
                $("#_083_mf87d_party_identifier").attr("disabled", false);
                $("#_084_mf87d_name_address").attr("disabled", false);
                $("#_085_mf87j_party_identification").attr("disabled", true);
            } else if ($("#type_mf87_").val() == "j") {
                $("#div_mf87a_").hide();
                $("#div_mf87d_").hide();
                $("#div_mf87j_").show();
                $("#_080_mf87a_party_identifier").attr("disabled", true);
                $("#_081_mf87a_identifier_code").attr("disabled", true);
                $("#_083_mf87d_party_identifier").attr("disabled", true);
                $("#_084_mf87d_name_address").attr("disabled", true);
                $("#_085_mf87j_party_identification").attr("disabled", false);
            } else {
                $("#div_mf87a_").hide();
                $("#div_mf87d_").hide();
                $("#div_mf87j_").hide();
                $("#_080_mf87a_party_identifier").attr("disabled", true);
                $("#_081_mf87a_identifier_code").attr("disabled", true);
                $("#_083_mf87d_party_identifier").attr("disabled", true);
                $("#_084_mf87d_name_address").attr("disabled", true);
                $("#_085_mf87j_party_identification").attr("disabled", true);
            }
        });
        //end of the line
        //OF83_a_d_j
        $("#div_of83a_").hide();
        $("#div_of83d_").hide();
        $("#div_of83j_").hide();
        $("#_090_of83a_party_identifier").attr("disabled", true);
        $("#_091_of83a_identifier_code").attr("disabled", true);
        $("#_093_of83d_party_identifier").attr("disabled", true);
        $("#_094_of83d_name_address").attr("disabled", true);
        $("#_095_of83j_party_identification").attr("disabled", true);
        $("#type_of83_").change(function () {
            if ($("#type_of83_").val() == "a") {
                $("#div_of83a_").show();
                $("#div_of83d_").hide();
                $("#div_of83j_").hide();
                $("#_090_of83a_party_identifier").attr("disabled", false);
                $("#_091_of83a_identifier_code").attr("disabled", false);
                $("#_093_of83d_party_identifier").attr("disabled", true);
                $("#_094_of83d_name_address").attr("disabled", true);
                $("#_095_of83j_party_identification").attr("disabled", true);
            } else if ($("#type_of83_").val() == "d") {
                $("#div_of83a_").hide();
                $("#div_of83d_").show();
                $("#div_of83j_").hide();
                $("#_090_of83a_party_identifier").attr("disabled", true);
                $("#_091_of83a_identifier_code").attr("disabled", true);
                $("#_093_of83d_party_identifier").attr("disabled", false);
                $("#_094_of83d_name_address").attr("disabled", false);
                $("#_095_of83j_party_identification").attr("disabled", true);
            } else if ($("#type_of83_").val() == "j") {
                $("#div_of83a_").hide();
                $("#div_of83d_").hide();
                $("#div_of83j_").show();
                $("#_090_of83a_party_identifier").attr("disabled", true);
                $("#_091_of83a_identifier_code").attr("disabled", true);
                $("#_093_of83d_party_identifier").attr("disabled", true);
                $("#_094_of83d_name_address").attr("disabled", true);
                $("#_095_of83j_party_identification").attr("disabled", false);
            } else {
                $("#div_of83a_").hide();
                $("#div_of83d_").hide();
                $("#div_of83j_").hide();
                $("#_090_of83a_party_identifier").attr("disabled", true);
                $("#_091_of83a_identifier_code").attr("disabled", true);
                $("#_093_of83d_party_identifier").attr("disabled", true);
                $("#_094_of83d_name_address").attr("disabled", true);
                $("#_095_of83j_party_identification").attr("disabled", true);
            }
        });
        //end of the line
        //OF53_a_d_j
        $("#div_of53a_").hide();
        $("#div_of53d_").hide();
        $("#div_of53j_").hide();
        $("#_240_of53a_party_identifier").attr("disabled", true);
        $("#_241_of53a_identifier_code").attr("disabled", true);
        $("#_243_of53d_party_identifier").attr("disabled", true);
        $("#_244_of53d_name_address").attr("disabled", true);
        $("#_245_of53j_party_identification").attr("disabled", true);
        $("#type_of53_").change(function () {
            if ($("#type_of53_").val() == "a") {
                $("#div_of53a_").show();
                $("#div_of53d_").hide();
                $("#div_of53j_").hide();
                $("#_240_of53a_party_identifier").attr("disabled", false);
                $("#_241_of53a_identifier_code").attr("disabled", false);
                $("#_243_of53d_party_identifier").attr("disabled", true);
                $("#_244_of53d_name_address").attr("disabled", true);
                $("#_245_of53j_party_identification").attr("disabled", true);
            } else if ($("#type_of53_").val() == "d") {
                $("#div_of53a_").hide();
                $("#div_of53d_").show();
                $("#div_of53j_").hide();
                $("#_240_of53a_party_identifier").attr("disabled", true);
                $("#_241_of53a_identifier_code").attr("disabled", true);
                $("#_243_of53d_party_identifier").attr("disabled", false);
                $("#_244_of53d_name_address").attr("disabled", false);
                $("#_245_of53j_party_identification").attr("disabled", true);
            } else if ($("#type_of53_").val() == "j") {
                $("#div_of53a_").hide();
                $("#div_of53d_").hide();
                $("#div_of53j_").show();
                $("#_240_of53a_party_identifier").attr("disabled", true);
                $("#_241_of53a_identifier_code").attr("disabled", true);
                $("#_243_of53d_party_identifier").attr("disabled", true);
                $("#_244_of53d_name_address").attr("disabled", true);
                $("#_245_of53j_party_identification").attr("disabled", false);
            } else {
                $("#div_of53a_").hide();
                $("#div_of53d_").hide();
                $("#div_of53j_").hide();
                $("#_240_of53a_party_identifier").attr("disabled", true);
                $("#_241_of53a_identifier_code").attr("disabled", true);
                $("#_243_of53d_party_identifier").attr("disabled", true);
                $("#_244_of53d_name_address").attr("disabled", true);
                $("#_245_of53j_party_identification").attr("disabled", true);
            }
        });
        //end of the line
        //OF86_a_d_j
        $("#div_of86a_").hide();
        $("#div_of86d_").hide();
        $("#div_of86j_").hide();
        $("#_250_of86a_party_identifier").attr("disabled", true);
        $("#_251_of86a_identifier_code").attr("disabled", true);
        $("#_253_of86d_party_identifier").attr("disabled", true);
        $("#_254_of86d_name_address").attr("disabled", true);
        $("#_255_of86j_party_identification").attr("disabled", true);
        $("#type_of86_").change(function () {
            if ($("#type_of86_").val() == "a") {
                $("#div_of86a_").show();
                $("#div_of86d_").hide();
                $("#div_of86j_").hide();
                $("#_250_of86a_party_identifier").attr("disabled", false);
                $("#_251_of86a_identifier_code").attr("disabled", false);
                $("#_253_of86d_party_identifier").attr("disabled", true);
                $("#_254_of86d_name_address").attr("disabled", true);
                $("#_255_of86j_party_identification").attr("disabled", true);
            } else if ($("#type_of86_").val() == "d") {
                $("#div_of86a_").hide();
                $("#div_of86d_").show();
                $("#div_of86j_").hide();
                $("#_250_of86a_party_identifier").attr("disabled", true);
                $("#_251_of86a_identifier_code").attr("disabled", true);
                $("#_253_of86d_party_identifier").attr("disabled", false);
                $("#_254_of86d_name_address").attr("disabled", false);
                $("#_255_of86j_party_identification").attr("disabled", true);
            } else if ($("#type_of86_").val() == "j") {
                $("#div_of86a_").hide();
                $("#div_of86d_").hide();
                $("#div_of86j_").show();
                $("#_250_of86a_party_identifier").attr("disabled", true);
                $("#_251_of86a_identifier_code").attr("disabled", true);
                $("#_253_of86d_party_identifier").attr("disabled", true);
                $("#_254_of86d_name_address").attr("disabled", true);
                $("#_255_of86j_party_identification").attr("disabled", false);
            } else {
                $("#div_of86a_").hide();
                $("#div_of86d_").hide();
                $("#div_of86j_").hide();
                $("#_250_of86a_party_identifier").attr("disabled", true);
                $("#_251_of86a_identifier_code").attr("disabled", true);
                $("#_253_of86d_party_identifier").attr("disabled", true);
                $("#_254_of86d_name_address").attr("disabled", true);
                $("#_255_of86j_party_identification").attr("disabled", true);
            }
        });
        //end of the line
        //OF56_a_d_j
        $("#div_of56a_").hide();
        $("#div_of56d_").hide();
        $("#div_of56j_").hide();
        $("#_260_of56a_party_identifier").attr("disabled", true);
        $("#_261_of56a_identifier_code").attr("disabled", true);
        $("#_263_of56d_party_identifier").attr("disabled", true);
        $("#_264_of56d_name_address").attr("disabled", true);
        $("#_265_of56j_party_identification").attr("disabled", true);
        $("#type_of56_").change(function () {
            if ($("#type_of56_").val() == "a") {
                $("#div_of56a_").show();
                $("#div_of56d_").hide();
                $("#div_of56j_").hide();
                $("#_260_of56a_party_identifier").attr("disabled", false);
                $("#_261_of56a_identifier_code").attr("disabled", false);
                $("#_263_of56d_party_identifier").attr("disabled", true);
                $("#_264_of56d_name_address").attr("disabled", true);
                $("#_265_of56j_party_identification").attr("disabled", true);
            } else if ($("#type_of56_").val() == "d") {
                $("#div_of56a_").hide();
                $("#div_of56d_").show();
                $("#div_of56j_").hide();
                $("#_260_of56a_party_identifier").attr("disabled", true);
                $("#_261_of56a_identifier_code").attr("disabled", true);
                $("#_263_of56d_party_identifier").attr("disabled", false);
                $("#_264_of56d_name_address").attr("disabled", false);
                $("#_265_of56j_party_identification").attr("disabled", true);
            } else if ($("#type_of56_").val() == "j") {
                $("#div_of56a_").hide();
                $("#div_of56d_").hide();
                $("#div_of56j_").show();
                $("#_260_of56a_party_identifier").attr("disabled", true);
                $("#_261_of56a_identifier_code").attr("disabled", true);
                $("#_263_of56d_party_identifier").attr("disabled", true);
                $("#_264_of56d_name_address").attr("disabled", true);
                $("#_265_of56j_party_identification").attr("disabled", false);
            } else {
                $("#div_of56a_").hide();
                $("#div_of56d_").hide();
                $("#div_of56j_").hide();
                $("#_260_of56a_party_identifier").attr("disabled", true);
                $("#_261_of56a_identifier_code").attr("disabled", true);
                $("#_263_of56d_party_identifier").attr("disabled", true);
                $("#_264_of56d_name_address").attr("disabled", true);
                $("#_265_of56j_party_identification").attr("disabled", true);
            }
        });
        //end of the line
        //MF57_a_d_j
        $("#div_mf57a_").hide();
        $("#div_mf57d_").hide();
        $("#div_mf57j_").hide();
        $("#_270_mf57a_party_identifier").attr("disabled", true);
        $("#_271_mf57a_identifier_code").attr("disabled", true);
        $("#_273_mf57d_party_identifier").attr("disabled", true);
        $("#_274_mf57d_name_address").attr("disabled", true);
        $("#_275_mf57j_party_identification").attr("disabled", true);
        $("#type_mf57_").change(function () {
            if ($("#type_mf57_").val() == "a") {
                $("#div_mf57a_").show();
                $("#div_mf57d_").hide();
                $("#div_mf57j_").hide();
                $("#_270_mf57a_party_identifier").attr("disabled", false);
                $("#_271_mf57a_identifier_code").attr("disabled", false);
                $("#_273_mf57d_party_identifier").attr("disabled", true);
                $("#_274_mf57d_name_address").attr("disabled", true);
                $("#_275_mf57j_party_identification").attr("disabled", true);
            } else if ($("#type_mf57_").val() == "d") {
                $("#div_mf57a_").hide();
                $("#div_mf57d_").show();
                $("#div_mf57j_").hide();
                $("#_270_mf57a_party_identifier").attr("disabled", true);
                $("#_271_mf57a_identifier_code").attr("disabled", true);
                $("#_273_mf57d_party_identifier").attr("disabled", false);
                $("#_274_mf57d_name_address").attr("disabled", false);
                $("#_275_mf57j_party_identification").attr("disabled", true);
            } else if ($("#type_mf57_").val() == "j") {
                $("#div_mf57a_").hide();
                $("#div_mf57d_").hide();
                $("#div_mf57j_").show();
                $("#_270_mf57a_party_identifier").attr("disabled", true);
                $("#_271_mf57a_identifier_code").attr("disabled", true);
                $("#_273_mf57d_party_identifier").attr("disabled", true);
                $("#_274_mf57d_name_address").attr("disabled", true);
                $("#_275_mf57j_party_identification").attr("disabled", false);
            } else {
                $("#div_mf57a_").hide();
                $("#div_mf57d_").hide();
                $("#div_mf57j_").hide();
                $("#_270_mf57a_party_identifier").attr("disabled", true);
                $("#_271_mf57a_identifier_code").attr("disabled", true);
                $("#_273_mf57d_party_identifier").attr("disabled", true);
                $("#_274_mf57d_name_address").attr("disabled", true);
                $("#_275_mf57j_party_identification").attr("disabled", true);
            }
        });
        //end of the line
        //OF58_a_d_j
        $("#div_of58a_").hide();
        $("#div_of58d_").hide();
        $("#div_of58j_").hide();
        $("#_280_of58a_party_identifier").attr("disabled", true);
        $("#_281_of58a_identifier_code").attr("disabled", true);
        $("#_283_of58d_party_identifier").attr("disabled", true);
        $("#_284_of58d_name_address").attr("disabled", true);
        $("#_285_of58j_party_identification").attr("disabled", true);
        $("#type_of58_").change(function () {
            if ($("#type_of58_").val() == "a") {
                $("#div_of58a_").show();
                $("#div_of58d_").hide();
                $("#div_of58j_").hide();
                $("#_280_of58a_party_identifier").attr("disabled", false);
                $("#_281_of58a_identifier_code").attr("disabled", false);
                $("#_283_of58d_party_identifier").attr("disabled", true);
                $("#_284_of58d_name_address").attr("disabled", true);
                $("#_285_of58j_party_identification").attr("disabled", true);
            } else if ($("#type_of58_").val() == "d") {
                $("#div_of58a_").hide();
                $("#div_of58d_").show();
                $("#div_of58j_").hide();
                $("#_280_of58a_party_identifier").attr("disabled", true);
                $("#_281_of58a_identifier_code").attr("disabled", true);
                $("#_283_of58d_party_identifier").attr("disabled", false);
                $("#_284_of58d_name_address").attr("disabled", false);
                $("#_285_of58j_party_identification").attr("disabled", true);
            } else if ($("#type_of58_").val() == "j") {
                $("#div_of58a_").hide();
                $("#div_of58d_").hide();
                $("#div_of58j_").show();
                $("#_280_of58a_party_identifier").attr("disabled", true);
                $("#_281_of58a_identifier_code").attr("disabled", true);
                $("#_283_of58d_party_identifier").attr("disabled", true);
                $("#_284_of58d_name_address").attr("disabled", true);
                $("#_285_of58j_party_identification").attr("disabled", false);
            } else {
                $("#div_of58a_").hide();
                $("#div_of58d_").hide();
                $("#div_of58j_").hide();
                $("#_280_of58a_party_identifier").attr("disabled", true);
                $("#_281_of58a_identifier_code").attr("disabled", true);
                $("#_283_of58d_party_identifier").attr("disabled", true);
                $("#_284_of58d_name_address").attr("disabled", true);
                $("#_285_of58j_party_identification").attr("disabled", true);
            }
        });
        //end of the line
        //Mandatory Sequence D
        //OF53_a_d_j
        $("#div_of53a_d").hide();
        $("#div_of53d_d").hide();
        $("#div_of53j_d").hide();
        $("#_290_of53a_party_identifier").attr("disabled", true);
        $("#_291_of53a_identifier_code").attr("disabled", true);
        $("#_293_of53d_party_identifier").attr("disabled", true);
        $("#_294_of53d_name_address").attr("disabled", true);
        $("#_295_of53j_party_identification").attr("disabled", true);
        $("#type_of53_d").change(function () {
            if ($("#type_of53_d").val() == "a") {
                $("#div_of53a_d").show();
                $("#div_of53d_d").hide();
                $("#div_of53j_d").hide();
                $("#_290_of53a_party_identifier").attr("disabled", false);
                $("#_291_of53a_identifier_code").attr("disabled", false);
                $("#_293_of53d_party_identifier").attr("disabled", true);
                $("#_294_of53d_name_address").attr("disabled", true);
                $("#_295_of53j_party_identification").attr("disabled", true);
            } else if ($("#type_of53_d").val() == "d") {
                $("#div_of53a_d").hide();
                $("#div_of53d_d").show();
                $("#div_of53j_d").hide();
                $("#_290_of53a_party_identifier").attr("disabled", true);
                $("#_291_of53a_identifier_code").attr("disabled", true);
                $("#_293_of53d_party_identifier").attr("disabled", false);
                $("#_294_of53d_name_address").attr("disabled", false);
                $("#_295_of53j_party_identification").attr("disabled", true);
            } else if ($("#type_of53_d").val() == "j") {
                $("#div_of53a_d").hide();
                $("#div_of53d_d").hide();
                $("#div_of53j_d").show();
                $("#_290_of53a_party_identifier").attr("disabled", true);
                $("#_291_of53a_identifier_code").attr("disabled", true);
                $("#_293_of53d_party_identifier").attr("disabled", true);
                $("#_294_of53d_name_address").attr("disabled", true);
                $("#_295_of53j_party_identification").attr("disabled", false);
            } else {
                $("#div_of53a_d").hide();
                $("#div_of53d_d").hide();
                $("#div_of53j_d").hide();
                $("#_290_of53a_party_identifier").attr("disabled", true);
                $("#_291_of53a_identifier_code").attr("disabled", true);
                $("#_293_of53d_party_identifier").attr("disabled", true);
                $("#_294_of53d_name_address").attr("disabled", true);
                $("#_295_of53j_party_identification").attr("disabled", true);
            }
        });
        //end of the line
        //OF86_a_d_j
        $("#div_of86a_d").hide();
        $("#div_of86d_d").hide();
        $("#div_of86j_d").hide();
        $("#_300_of86a_party_identifier").attr("disabled", true);
        $("#_301_of86a_identifier_code").attr("disabled", true);
        $("#_303_of86d_party_identifier").attr("disabled", true);
        $("#_304_of86d_name_address").attr("disabled", true);
        $("#_305_of86j_party_identification").attr("disabled", true);
        $("#type_of86_d").change(function () {
            if ($("#type_of86_d").val() == "a") {
                $("#div_of86a_d").show();
                $("#div_of86d_d").hide();
                $("#div_of86j_d").hide();
                $("#_300_of86a_party_identifier").attr("disabled", false);
                $("#_301_of86a_identifier_code").attr("disabled", false);
                $("#_303_of86d_party_identifier").attr("disabled", true);
                $("#_304_of86d_name_address").attr("disabled", true);
                $("#_305_of86j_party_identification").attr("disabled", true);
            } else if ($("#type_of86_d").val() == "d") {
                $("#div_of86a_d").hide();
                $("#div_of86d_d").show();
                $("#div_of86j_d").hide();
                $("#_300_of86a_party_identifier").attr("disabled", true);
                $("#_301_of86a_identifier_code").attr("disabled", true);
                $("#_303_of86d_party_identifier").attr("disabled", false);
                $("#_304_of86d_name_address").attr("disabled", false);
                $("#_305_of86j_party_identification").attr("disabled", true);
            } else if ($("#type_of86_d").val() == "j") {
                $("#div_of86a_d").hide();
                $("#div_of86d_d").hide();
                $("#div_of86j_d").show();
                $("#_300_of86a_party_identifier").attr("disabled", true);
                $("#_301_of86a_identifier_code").attr("disabled", true);
                $("#_303_of86d_party_identifier").attr("disabled", true);
                $("#_304_of86d_name_address").attr("disabled", true);
                $("#_305_of86j_party_identification").attr("disabled", false);
            } else {
                $("#div_of86a_d").hide();
                $("#div_of86d_d").hide();
                $("#div_of86j_d").hide();
                $("#_300_of86a_party_identifier").attr("disabled", true);
                $("#_301_of86a_identifier_code").attr("disabled", true);
                $("#_303_of86d_party_identifier").attr("disabled", true);
                $("#_304_of86d_name_address").attr("disabled", true);
                $("#_305_of86j_party_identification").attr("disabled", true);
            }
        });
        //end of the line
        //OF56_a_d_j
        $("#div_of56a_d").hide();
        $("#div_of56d_d").hide();
        $("#div_of56j_d").hide();
        $("#_310_of56a_party_identifier").attr("disabled", true);
        $("#_311_of56a_identifier_code").attr("disabled", true);
        $("#_313_of56d_party_identifier").attr("disabled", true);
        $("#_314_of56d_name_address").attr("disabled", true);
        $("#_315_of56j_party_identification").attr("disabled", true);
        $("#type_of56_d").change(function () {
            if ($("#type_of56_d").val() == "a") {
                $("#div_of56a_d").show();
                $("#div_of56d_d").hide();
                $("#div_of56j_d").hide();
                $("#_310_of56a_party_identifier").attr("disabled", false);
                $("#_311_of56a_identifier_code").attr("disabled", false);
                $("#_313_of56d_party_identifier").attr("disabled", true);
                $("#_314_of56d_name_address").attr("disabled", true);
                $("#_315_of56j_party_identification").attr("disabled", true);
            } else if ($("#type_of56_d").val() == "d") {
                $("#div_of56a_d").hide();
                $("#div_of56d_d").show();
                $("#div_of56j_d").hide();
                $("#_310_of56a_party_identifier").attr("disabled", true);
                $("#_311_of56a_identifier_code").attr("disabled", true);
                $("#_313_of56d_party_identifier").attr("disabled", false);
                $("#_314_of56d_name_address").attr("disabled", false);
                $("#_315_of56j_party_identification").attr("disabled", true);
            } else if ($("#type_of56_d").val() == "j") {
                $("#div_of56a_d").hide();
                $("#div_of56d_d").hide();
                $("#div_of56j_d").show();
                $("#_310_of56a_party_identifier").attr("disabled", true);
                $("#_311_of56a_identifier_code").attr("disabled", true);
                $("#_313_of56d_party_identifier").attr("disabled", true);
                $("#_314_of56d_name_address").attr("disabled", true);
                $("#_315_of56j_party_identification").attr("disabled", false);
            } else {
                $("#div_of56a_d").hide();
                $("#div_of56d_d").hide();
                $("#div_of56j_d").hide();
                $("#_310_of56a_party_identifier").attr("disabled", true);
                $("#_311_of56a_identifier_code").attr("disabled", true);
                $("#_313_of56d_party_identifier").attr("disabled", true);
                $("#_314_of56d_name_address").attr("disabled", true);
                $("#_315_of56j_party_identification").attr("disabled", true);
            }
        });
        //end of the line
        //MF57_A_D_J
        $("#div_mf57a_d").hide();
        $("#div_mf57d_d").hide();
        $("#div_mf57j_d").hide();
        $("#_320_mf57a_party_identifier").attr("disabled", true);
        $("#_321_mf57a_identifier_code").attr("disabled", true);
        $("#_323_mf57d_party_identifier").attr("disabled", true);
        $("#_324_mf57d_name_address").attr("disabled", true);
        $("#_325_mf57j_party_identification").attr("disabled", true);
        $("#type_mf57_d").change(function () {
            if ($("#type_mf57_d").val() == "a") {
                $("#div_mf57a_d").show();
                $("#div_mf57d_d").hide();
                $("#div_mf57j_d").hide();
                $("#_320_mf57a_party_identifier").attr("disabled", false);
                $("#_321_mf57a_identifier_code").attr("disabled", false);
                $("#_323_mf57d_party_identifier").attr("disabled", true);
                $("#_324_mf57d_name_address").attr("disabled", true);
                $("#_325_mf57j_party_identification").attr("disabled", true);
            } else if ($("#type_mf57_d").val() == "d") {
                $("#div_mf57a_d").hide();
                $("#div_mf57d_d").show();
                $("#div_mf57j_d").hide();
                $("#_320_mf57a_party_identifier").attr("disabled", true);
                $("#_321_mf57a_identifier_code").attr("disabled", true);
                $("#_323_mf57d_party_identifier").attr("disabled", false);
                $("#_324_mf57d_name_address").attr("disabled", false);
                $("#_325_mf57j_party_identification").attr("disabled", true);
            } else if ($("#type_mf57_d").val() == "j") {
                $("#div_mf57a_d").hide();
                $("#div_mf57d_d").hide();
                $("#div_mf57j_d").show();
                $("#_320_mf57a_party_identifier").attr("disabled", true);
                $("#_321_mf57a_identifier_code").attr("disabled", true);
                $("#_323_mf57d_party_identifier").attr("disabled", true);
                $("#_324_mf57d_name_address").attr("disabled", true);
                $("#_325_mf57j_party_identification").attr("disabled", false);
            } else {
                $("#div_mf57a_d").hide();
                $("#div_mf57d_d").hide();
                $("#div_mf57j_d").hide();
                $("#_320_mf57a_party_identifier").attr("disabled", true);
                $("#_321_mf57a_identifier_code").attr("disabled", true);
                $("#_323_mf57d_party_identifier").attr("disabled", true);
                $("#_324_mf57d_name_address").attr("disabled", true);
                $("#_325_mf57j_party_identification").attr("disabled", true);
            }
        });
        //end of the line
        //OF58_a_d_j
        $("#div_of58a_d").hide();
        $("#div_of58d_d").hide();
        $("#div_of58j_d").hide();
        $("#_330_of58a_party_identifier").attr("disabled", true);
        $("#_331_of58a_identifier_code").attr("disabled", true);
        $("#_333_of58d_party_identifier").attr("disabled", true);
        $("#_334_of58d_name_address").attr("disabled", true);
        $("#_335_of58j_party_identification").attr("disabled", true);
        $("#type_of58_d").change(function () {
            if ($("#type_of58_d").val() == "a") {
                $("#div_of58a_d").show();
                $("#div_of58d_d").hide();
                $("#div_of58j_d").hide();
                $("#_330_of58a_party_identifier").attr("disabled", false);
                $("#_331_of58a_identifier_code").attr("disabled", false);
                $("#_333_of58d_party_identifier").attr("disabled", true);
                $("#_334_of58d_name_address").attr("disabled", true);
                $("#_335_of58j_party_identification").attr("disabled", true);
            } else if ($("#type_of58_d").val() == "d") {
                $("#div_of58a_d").hide();
                $("#div_of58d_d").show();
                $("#div_of58j_d").hide();
                $("#_330_of58a_party_identifier").attr("disabled", true);
                $("#_331_of58a_identifier_code").attr("disabled", true);
                $("#_333_of58d_party_identifier").attr("disabled", false);
                $("#_334_of58d_name_address").attr("disabled", false);
                $("#_335_of58j_party_identification").attr("disabled", true);
            } else if ($("#type_of58_d").val() == "j") {
                $("#div_of58a_d").hide();
                $("#div_of58d_d").hide();
                $("#div_of58j_d").show();
                $("#_330_of58a_party_identifier").attr("disabled", true);
                $("#_331_of58a_identifier_code").attr("disabled", true);
                $("#_333_of58d_party_identifier").attr("disabled", true);
                $("#_334_of58d_name_address").attr("disabled", true);
                $("#_335_of58j_party_identification").attr("disabled", false);
            } else {
                $("#div_of58a_d").hide();
                $("#div_of58d_d").hide();
                $("#div_of58j_d").hide();
                $("#_330_of58a_party_identifier").attr("disabled", true);
                $("#_331_of58a_identifier_code").attr("disabled", true);
                $("#_333_of58d_party_identifier").attr("disabled", true);
                $("#_334_of58d_name_address").attr("disabled", true);
                $("#_335_of58j_party_identification").attr("disabled", true);
            }
        });
        //end of the line
        //15F
        //MF57_A_D_J
        $("#div_mf57a_f").hide();
        $("#div_mf57d_f").hide();
        $("#div_mf57j_f").hide();
        $("#_370_mf57a_party_identifier").attr("disabled", true);
        $("#_371_mf57a_identifier_code").attr("disabled", true);
        $("#_373_mf57d_party_identifier").attr("disabled", true);
        $("#_374_mf57d_name_address").attr("disabled", true);
        $("#_375_mf57j_party_identification").attr("disabled", true);
        $("#type_mf57_f").change(function () {
            if ($("#type_mf57_f").val() == "a") {
                $("#div_mf57a_f").show();
                $("#div_mf57d_f").hide();
                $("#div_mf57j_f").hide();
                $("#_370_mf57a_party_identifier").attr("disabled", false);
                $("#_371_mf57a_identifier_code").attr("disabled", false);
                $("#_373_mf57d_party_identifier").attr("disabled", true);
                $("#_374_mf57d_name_address").attr("disabled", true);
                $("#_375_mf57j_party_identification").attr("disabled", true);
            } else if ($("#type_mf57_f").val() == "d") {
                $("#div_mf57a_f").hide();
                $("#div_mf57d_f").show();
                $("#div_mf57j_f").hide();
                $("#_370_mf57a_party_identifier").attr("disabled", true);
                $("#_371_mf57a_identifier_code").attr("disabled", true);
                $("#_373_mf57d_party_identifier").attr("disabled", false);
                $("#_374_mf57d_name_address").attr("disabled", false);
                $("#_375_mf57j_party_identification").attr("disabled", true);
            } else if ($("#type_mf57_f").val() == "j") {
                $("#div_mf57a_f").hide();
                $("#div_mf57d_f").hide();
                $("#div_mf57j_f").show();
                $("#_370_mf57a_party_identifier").attr("disabled", true);
                $("#_371_mf57a_identifier_code").attr("disabled", true);
                $("#_373_mf57d_party_identifier").attr("disabled", true);
                $("#_374_mf57d_name_address").attr("disabled", true);
                $("#_375_mf57j_party_identification").attr("disabled", false);
            } else {
                $("#div_mf57a_f").hide();
                $("#div_mf57d_f").hide();
                $("#div_mf57j_f").hide();
                $("#_370_mf57a_party_identifier").attr("disabled", true);
                $("#_371_mf57a_identifier_code").attr("disabled", true);
                $("#_373_mf57d_party_identifier").attr("disabled", true);
                $("#_374_mf57d_name_address").attr("disabled", true);
                $("#_375_mf57j_party_identification").attr("disabled", true);
            }
        });
        //end of the line
        //15H
        //of88_a_d_j
        $("#div_of88_a").hide();
        $("#div_of88_d").hide();
        $("#div_of88_j").hide();
        $("#_390_of88a_party_identifier").attr("disabled", true);
        $("#_391_of88a_identifier_code").attr("disabled", true);
        $("#_393_of88d_party_identifier").attr("disabled", true);
        $("#_394_of88d_name_and_address").attr("disabled", true);
        $("#_395_of88j_party_identification").attr("disabled", true);
        $("#type_of88_").change(function () {
            if ($("#type_of88_").val() == "a") {
                $("#div_of88_a").show();
                $("#div_of88_d").hide();
                $("#div_of88_j").hide();
                $("#_390_of88a_party_identifier").attr("disabled", false);
                $("#_391_of88a_identifier_code").attr("disabled", false);
                $("#_393_of88d_party_identifier").attr("disabled", true);
                $("#_394_of88d_name_and_address").attr("disabled", true);
                $("#_395_of88j_party_identification").attr("disabled", true);
            } else if ($("#type_of88_").val() == "d") {
                $("#div_of88_a").hide();
                $("#div_of88_d").show();
                $("#div_of88_j").hide();
                $("#_390_of88a_party_identifier").attr("disabled", true);
                $("#_391_of88a_identifier_code").attr("disabled", true);
                $("#_393_of88d_party_identifier").attr("disabled", false);
                $("#_394_of88d_name_and_address").attr("disabled", false);
                $("#_395_of88j_party_identification").attr("disabled", true);
            } else if ($("#type_of88_").val() == "j") {
                $("#div_of88_a").hide();
                $("#div_of88_d").hide();
                $("#div_of88_j").show();
                $("#_390_of88a_party_identifier").attr("disabled", true);
                $("#_391_of88a_identifier_code").attr("disabled", true);
                $("#_393_of88d_party_identifier").attr("disabled", true);
                $("#_394_of88d_name_and_address").attr("disabled", true);
                $("#_395_of88j_party_identification").attr("disabled", false);
            } else {
                $("#div_of88_a").hide();
                $("#div_of88_d").hide();
                $("#div_of88_j").hide();
                $("#_390_of88a_party_identifier").attr("disabled", true);
                $("#_391_of88a_identifier_code").attr("disabled", true);
                $("#_393_of88d_party_identifier").attr("disabled", true);
                $("#_394_of88d_name_and_address").attr("disabled", true);
                $("#_395_of88j_party_identification").attr("disabled", true);
            }
        });
        //Seq F checkbox
        $("#check_seq_f").hide();
//        $("#_371_mf57a_identifier_code").attr("disabled", true);
        $("#seq_F_checkbox").click(function () {
            if ($("#seq_F_checkbox").is(":checked")) {
                $("#check_seq_f").show();
//                $("#_371_mf57a_identifier_code").attr("disabled", false);
            } else {
                $("#check_seq_f").hide();
//                $("#_371_mf57a_identifier_code").attr("disabled", true);
            }
        });
        //end of the line
        //Seq H checkbox
        $("#check_seq_h").hide();
//        $("#_341_of88a_identifier_code").attr("disabled", true);
//        $("#").attr("disabled", true);
//        $("#").attr("disabled", true);
        $("#seq_H_checkbox").click(function () {
            if ($("#seq_H_checkbox").is(":checked")) {
                $("#check_seq_h").show();
//                $("#_341_of88a_identifier_code").attr("disabled", false);
//                $("#").attr("disabled", false);
//                $("#").attr("disabled", false);
            } else {
                $("#check_seq_h").hide();
//                $("#_341_of88a_identifier_code").attr("disabled", true);
//                $("#").attr("disabled", true);
//                $("#").attr("disabled", true);
            }
        });
    });
</script>

<!--rule view-->
<script language="javascript">
    $(document).ready(function () {
//             //OF94A_check
//        if(){
//            
//        }


        //OF32H_check
        if ($("#_160_of32h_sign").val() != "" || $("#_161_of32h_currency").val() != "" || $("#_162_of32h_amount").val() != "") {
            $("#amount_to_be_settled_checkbox").attr("checked", true);
            $("#check_of32h").show();
            $("#_160_of32h_sign").attr("disabled", false);
            $("#_161_of32h_currency").attr("disabled", false);
            $("#_162_of32h_amount").attr("disabled", false);
        } else {
            $("#check_of32h").hide();
            $("#_160_of32h_sign").attr("disabled", true);
            $("#_161_of32h_currency").attr("disabled", true);
            $("#_162_of32h_amount").attr("disabled", true);
        }
        
        //OF38J_check
        if ($("#_220_of38j_number_of_days").val() != "" || $("#_221_of38j_number").val() != "") {
            $("#number_of_days_checkbox").attr("checked", true);
            $("#check_of38j").show();
            $("#_220_of38j_number_of_days").attr("disabled", false);
            $("#_221_of38j_number").attr("disabled", false);
        } else {
            $("#check_of38j").hide();
            $("#_220_of38j_number_of_days").attr("disabled", true);
            $("#_221_of38j_number").attr("disabled", true);
        }
        
        
        
        


        //MF82_a_d_j
        if ($("#_070_mf82a_party_identifier").val() != "" || $("#_071_mf82a_identifier_code").val() != "") {
            $("#type_mf82_").val("a").attr("selected", true);
            $("#div_mf82a_").show();
            $("#div_mf82d_").hide();
            $("#div_mf82j_").hide();
            $("#_070_mf82a_party_identifier").attr("disabled", false);
            $("#_071_mf82a_identifier_code").attr("disabled", false);
            $("#_073_mf82d_party_identifier").attr("disabled", true);
            $("#_074_mf82d_name_address").attr("disabled", true);
            $("#_075_mf82j_party_identification").attr("disabled", true);
        } else if ($("#_073_mf82d_party_identifier").val() != "" || $("#_074_mf82d_name_address").val() != "") {
            $("#type_mf82_").val("d").attr("selected", true);
            $("#div_mf82a_").hide();
            $("#div_mf82d_").show();
            $("#div_mf82j_").hide();
            $("#_070_mf82a_party_identifier").attr("disabled", true);
            $("#_071_mf82a_identifier_code").attr("disabled", true);
            $("#_073_mf82d_party_identifier").attr("disabled", false);
            $("#_074_mf82d_name_address").attr("disabled", false);
            $("#_075_mf82j_party_identification").attr("disabled", true);
        } else if ($("#_075_mf82j_party_identification").val() != "") {
            $("#type_mf82_").val("j").attr("selected", true);
            $("#div_mf82a_").hide();
            $("#div_mf82d_").hide();
            $("#div_mf82j_").show();
            $("#_070_mf82a_party_identifier").attr("disabled", true);
            $("#_071_mf82a_identifier_code").attr("disabled", true);
            $("#_073_mf82d_party_identifier").attr("disabled", true);
            $("#_074_mf82d_name_address").attr("disabled", true);
            $("#_075_mf82j_party_identification").attr("disabled", false);
        } else {
            $("#div_mf82a_").hide();
            $("#div_mf82d_").hide();
            $("#div_mf82j_").hide();
            $("#_070_mf82a_party_identifier").attr("disabled", true);
            $("#_071_mf82a_identifier_code").attr("disabled", true);
            $("#_073_mf82d_party_identifier").attr("disabled", true);
            $("#_074_mf82d_name_address").attr("disabled", true);
            $("#_075_mf82j_party_identification").attr("disabled", true);
        }
        //end of the line
        //MF87_a_d_j
        if ($("#_080_mf87a_party_identifier").val() != "" || $("#_081_mf87a_identifier_code").val() != "") {
            $("#type_mf87_").val("a").attr("selected", true);
            $("#div_mf87a_").show();
            $("#div_mf87d_").hide();
            $("#div_mf87j_").hide();
            $("#_080_mf87a_party_identifier").attr("disabled", false);
            $("#_081_mf87a_identifier_code").attr("disabled", false);
            $("#_083_mf87d_party_identifier").attr("disabled", true);
            $("#_084_mf87d_name_address").attr("disabled", true);
            $("#_085_mf87j_party_identification").attr("disabled", true);
        } else if ($("#_083_mf87d_party_identifier").val() != "" || $("#_084_mf87d_name_address").val() != "") {
            $("#type_mf87_").val("d").attr("selected", true);
            $("#div_mf87a_").hide();
            $("#div_mf87d_").show();
            $("#div_mf87j_").hide();
            $("#_080_mf87a_party_identifier").attr("disabled", true);
            $("#_081_mf87a_identifier_code").attr("disabled", true);
            $("#_083_mf87d_party_identifier").attr("disabled", false);
            $("#_084_mf87d_name_address").attr("disabled", false);
            $("#_085_mf87j_party_identification").attr("disabled", true);
        } else if ($("#_085_mf87j_party_identification").val() != "") {
            $("#type_mf87_").val("j").attr("selected", true);
            $("#div_mf87a_").hide();
            $("#div_mf87d_").hide();
            $("#div_mf87j_").show();
            $("#_080_mf87a_party_identifier").attr("disabled", true);
            $("#_081_mf87a_identifier_code").attr("disabled", true);
            $("#_083_mf87d_party_identifier").attr("disabled", true);
            $("#_084_mf87d_name_address").attr("disabled", true);
            $("#_085_mf87j_party_identification").attr("disabled", false);
        } else {
            $("#div_mf87a_").hide();
            $("#div_mf87d_").hide();
            $("#div_mf87j_").hide();
            $("#_080_mf87a_party_identifier").attr("disabled", true);
            $("#_081_mf87a_identifier_code").attr("disabled", true);
            $("#_083_mf87d_party_identifier").attr("disabled", true);
            $("#_084_mf87d_name_address").attr("disabled", true);
            $("#_085_mf87j_party_identification").attr("disabled", true);
        }
        //end of the line
        //OF83_a_d_j
        if ($("#_090_of83a_party_identifier").val() != "" || $("#_091_of83a_identifier_code").val() != "") {
            $("#type_of83_").val("a").attr("selected", true);
            $("#div_of83a_").show();
            $("#div_of83d_").hide();
            $("#div_of83j_").hide();
            $("#_090_of83a_party_identifier").attr("disabled", false);
            $("#_091_of83a_identifier_code").attr("disabled", false);
            $("#_093_of83d_party_identifier").attr("disabled", true);
            $("#_094_of83d_name_address").attr("disabled", true);
            $("#_095_of83j_party_identification").attr("disabled", true);
        } else if ($("#_093_of83d_party_identifier").val() != "" || $("#_094_of83d_name_address").val() != "") {
            $("#type_of83_").val("d").attr("selected", true);
            $("#div_of83a_").hide();
            $("#div_of83d_").show();
            $("#div_of83j_").hide();
            $("#_090_of83a_party_identifier").attr("disabled", true);
            $("#_091_of83a_identifier_code").attr("disabled", true);
            $("#_093_of83d_party_identifier").attr("disabled", false);
            $("#_094_of83d_name_address").attr("disabled", false);
            $("#_095_of83j_party_identification").attr("disabled", true);
        } else if ($("#_095_of83j_party_identification").val() != "") {
            $("#type_of83_").val("j").attr("selected", true);
            $("#div_of83a_").hide();
            $("#div_of83d_").hide();
            $("#div_of83j_").show();
            $("#_090_of83a_party_identifier").attr("disabled", true);
            $("#_091_of83a_identifier_code").attr("disabled", true);
            $("#_093_of83d_party_identifier").attr("disabled", true);
            $("#_094_of83d_name_address").attr("disabled", true);
            $("#_095_of83j_party_identification").attr("disabled", false);
        } else {
            $("#div_of83a_").hide();
            $("#div_of83d_").hide();
            $("#div_of83j_").hide();
            $("#_090_of83a_party_identifier").attr("disabled", true);
            $("#_091_of83a_identifier_code").attr("disabled", true);
            $("#_093_of83d_party_identifier").attr("disabled", true);
            $("#_094_of83d_name_address").attr("disabled", true);
            $("#_095_of83j_party_identification").attr("disabled", true);
        }
        //end of the line
        //OF53_a_d_j
        if ($("#_240_of53a_party_identifier").val() != "" || $("#_241_of53a_identifier_code").val() != "") {
            $("#type_of53_").val("a").attr("selected", true);
            $("#div_of53a_").show();
            $("#div_of53d_").hide();
            $("#div_of53j_").hide();
            $("#_240_of53a_party_identifier").attr("disabled", false);
            $("#_241_of53a_identifier_code").attr("disabled", false);
            $("#_243_of53d_party_identifier").attr("disabled", true);
            $("#_244_of53d_name_address").attr("disabled", true);
            $("#_245_of53j_party_identification").attr("disabled", true);
        } else if ($("#_243_of53d_party_identifier").val() != "" || $("#_244_of53d_name_address").val() != "") {
            $("#type_of53_").val("d").attr("selected", true);
            $("#div_of53a_").hide();
            $("#div_of53d_").show();
            $("#div_of53j_").hide();
            $("#_240_of53a_party_identifier").attr("disabled", true);
            $("#_241_of53a_identifier_code").attr("disabled", true);
            $("#_243_of53d_party_identifier").attr("disabled", false);
            $("#_244_of53d_name_address").attr("disabled", false);
            $("#_245_of53j_party_identification").attr("disabled", true);
        } else if ($("#_245_of53j_party_identification").val() != "") {
            $("#type_of53_").val("j").attr("selected", true);
            $("#div_of53a_").hide();
            $("#div_of53d_").hide();
            $("#div_of53j_").show();
            $("#_240_of53a_party_identifier").attr("disabled", true);
            $("#_241_of53a_identifier_code").attr("disabled", true);
            $("#_243_of53d_party_identifier").attr("disabled", true);
            $("#_244_of53d_name_address").attr("disabled", true);
            $("#_245_of53j_party_identification").attr("disabled", false);
        } else {
            $("#div_of53a_").hide();
            $("#div_of53d_").hide();
            $("#div_of53j_").hide();
            $("#_240_of53a_party_identifier").attr("disabled", true);
            $("#_241_of53a_identifier_code").attr("disabled", true);
            $("#_243_of53d_party_identifier").attr("disabled", true);
            $("#_244_of53d_name_address").attr("disabled", true);
            $("#_245_of53j_party_identification").attr("disabled", true);
        }
        //end of the line
        //OF86_a_d_j
        if ($("#_250_of86a_party_identifier").val() != "" || $("#_251_of86a_identifier_code").val() != "") {
            $("#type_of86_").val("a").attr("selected", true);
            $("#div_of86a_").show();
            $("#div_of86d_").hide();
            $("#div_of86j_").hide();
            $("#_250_of86a_party_identifier").attr("disabled", false);
            $("#_251_of86a_identifier_code").attr("disabled", false);
            $("#_253_of86d_party_identifier").attr("disabled", true);
            $("#_254_of86d_name_address").attr("disabled", true);
            $("#_255_of86j_party_identification").attr("disabled", true);
        } else if ($("#_253_of86d_party_identifier").val() != "" || $("#_254_of86d_name_address").val() != "") {
            $("#type_of86_").val("d").attr("selected", true);
            $("#div_of86a_").hide();
            $("#div_of86d_").show();
            $("#div_of86j_").hide();
            $("#_250_of86a_party_identifier").attr("disabled", true);
            $("#_251_of86a_identifier_code").attr("disabled", true);
            $("#_253_of86d_party_identifier").attr("disabled", false);
            $("#_254_of86d_name_address").attr("disabled", false);
            $("#_255_of86j_party_identification").attr("disabled", true);
        } else if ($("#_255_of86j_party_identification").val() != "") {
            $("#type_of86_").val("j").attr("selected", true);
            $("#div_of86a_").hide();
            $("#div_of86d_").hide();
            $("#div_of86j_").show();
            $("#_250_of86a_party_identifier").attr("disabled", true);
            $("#_251_of86a_identifier_code").attr("disabled", true);
            $("#_253_of86d_party_identifier").attr("disabled", true);
            $("#_254_of86d_name_address").attr("disabled", true);
            $("#_255_of86j_party_identification").attr("disabled", false);
        } else {
            $("#div_of86a_").hide();
            $("#div_of86d_").hide();
            $("#div_of86j_").hide();
            $("#_250_of86a_party_identifier").attr("disabled", true);
            $("#_251_of86a_identifier_code").attr("disabled", true);
            $("#_253_of86d_party_identifier").attr("disabled", true);
            $("#_254_of86d_name_address").attr("disabled", true);
            $("#_255_of86j_party_identification").attr("disabled", true);
        }
        //end of the line
        //OF56_a_d_j
        if ($("#_260_of56a_party_identifier").val() != "" || $("#_261_of56a_identifier_code").val() != "") {
            $("#type_of56_").val("a").attr("selected", true);
            $("#div_of56a_").show();
            $("#div_of56d_").hide();
            $("#div_of56j_").hide();
            $("#_260_of56a_party_identifier").attr("disabled", false);
            $("#_261_of56a_identifier_code").attr("disabled", false);
            $("#_263_of56d_party_identifier").attr("disabled", true);
            $("#_264_of56d_name_address").attr("disabled", true);
            $("#_265_of56j_party_identification").attr("disabled", true);
        } else if ($("#_263_of56d_party_identifier").val() != "" || $("#_264_of56d_name_address").val() != "") {
            $("#type_of56_").val("d").attr("selected", true);
            $("#div_of56a_").hide();
            $("#div_of56d_").show();
            $("#div_of56j_").hide();
            $("#_260_of56a_party_identifier").attr("disabled", true);
            $("#_261_of56a_identifier_code").attr("disabled", true);
            $("#_263_of56d_party_identifier").attr("disabled", false);
            $("#_264_of56d_name_address").attr("disabled", false);
            $("#_265_of56j_party_identification").attr("disabled", true);
        } else if ($("#_265_of56j_party_identification").val() != "") {
            $("#type_of56_").val("j").attr("selected", true);
            $("#div_of56a_").hide();
            $("#div_of56d_").hide();
            $("#div_of56j_").show();
            $("#_260_of56a_party_identifier").attr("disabled", true);
            $("#_261_of56a_identifier_code").attr("disabled", true);
            $("#_263_of56d_party_identifier").attr("disabled", true);
            $("#_264_of56d_name_address").attr("disabled", true);
            $("#_265_of56j_party_identification").attr("disabled", false);
        } else {
            $("#div_of56a_").hide();
            $("#div_of56d_").hide();
            $("#div_of56j_").hide();
            $("#_260_of56a_party_identifier").attr("disabled", true);
            $("#_261_of56a_identifier_code").attr("disabled", true);
            $("#_263_of56d_party_identifier").attr("disabled", true);
            $("#_264_of56d_name_address").attr("disabled", true);
            $("#_265_of56j_party_identification").attr("disabled", true);
        }
        //end of the line
        //MF57_a_d_j
        if ($("#_270_mf57a_party_identifier").val() != "" || $("#_271_mf57a_identifier_code").val() != "") {
            $("#type_mf57_").val("a").attr("selected", true);
            $("#div_mf57a_").show();
            $("#div_mf57d_").hide();
            $("#div_mf57j_").hide();
            $("#_270_mf57a_party_identifier").attr("disabled", false);
            $("#_271_mf57a_identifier_code").attr("disabled", false);
            $("#_273_mf57d_party_identifier").attr("disabled", true);
            $("#_274_mf57d_name_address").attr("disabled", true);
            $("#_275_mf57j_party_identification").attr("disabled", true);
        } else if ($("#_273_mf57d_party_identifier").val() != "" || $("#_274_mf57d_name_address").val() != "") {
            $("#type_mf57_").val("d").attr("selected", true);
            $("#div_mf57a_").hide();
            $("#div_mf57d_").show();
            $("#div_mf57j_").hide();
            $("#_270_mf57a_party_identifier").attr("disabled", true);
            $("#_271_mf57a_identifier_code").attr("disabled", true);
            $("#_273_mf57d_party_identifier").attr("disabled", false);
            $("#_274_mf57d_name_address").attr("disabled", false);
            $("#_275_mf57j_party_identification").attr("disabled", true);
        } else if ($("#_275_mf57j_party_identification").val() != "") {
            $("#type_mf57_").val("j").attr("selected", true);
            $("#div_mf57a_").hide();
            $("#div_mf57d_").hide();
            $("#div_mf57j_").show();
            $("#_270_mf57a_party_identifier").attr("disabled", true);
            $("#_271_mf57a_identifier_code").attr("disabled", true);
            $("#_273_mf57d_party_identifier").attr("disabled", true);
            $("#_274_mf57d_name_address").attr("disabled", true);
            $("#_275_mf57j_party_identification").attr("disabled", false);
        } else {
            $("#div_mf57a_").hide();
            $("#div_mf57d_").hide();
            $("#div_mf57j_").hide();
            $("#_270_mf57a_party_identifier").attr("disabled", true);
            $("#_271_mf57a_identifier_code").attr("disabled", true);
            $("#_273_mf57d_party_identifier").attr("disabled", true);
            $("#_274_mf57d_name_address").attr("disabled", true);
            $("#_275_mf57j_party_identification").attr("disabled", true);
        }
        //end of the line
        //OF58_a_d_j
        if ($("#_280_of58a_party_identifier").val() != "" || $("#_281_of58a_identifier_code").val() != "") {
            $("#type_of58_").val("a").attr("selected", true);
            $("#div_of58a_").show();
            $("#div_of58d_").hide();
            $("#div_of58j_").hide();
            $("#_280_of58a_party_identifier").attr("disabled", false);
            $("#_281_of58a_identifier_code").attr("disabled", false);
            $("#_283_of58d_party_identifier").attr("disabled", true);
            $("#_284_of58d_name_address").attr("disabled", true);
            $("#_285_of58j_party_identification").attr("disabled", true);
        } else if ($("#_283_of58d_party_identifier").val() != "" || $("#_284_of58d_name_address").val() != "") {
            $("#type_of58_").val("d").attr("selected", true);
            $("#div_of58a_").hide();
            $("#div_of58d_").show();
            $("#div_of58j_").hide();
            $("#_280_of58a_party_identifier").attr("disabled", true);
            $("#_281_of58a_identifier_code").attr("disabled", true);
            $("#_283_of58d_party_identifier").attr("disabled", false);
            $("#_284_of58d_name_address").attr("disabled", false);
            $("#_285_of58j_party_identification").attr("disabled", true);
        } else if ($("#_285_of58j_party_identification").val() != "") {
            $("#type_of58_").val("j").attr("selected", true);
            $("#div_of58a_").hide();
            $("#div_of58d_").hide();
            $("#div_of58j_").show();
            $("#_280_of58a_party_identifier").attr("disabled", true);
            $("#_281_of58a_identifier_code").attr("disabled", true);
            $("#_283_of58d_party_identifier").attr("disabled", true);
            $("#_284_of58d_name_address").attr("disabled", true);
            $("#_285_of58j_party_identification").attr("disabled", false);
        } else {
            $("#div_of58a_").hide();
            $("#div_of58d_").hide();
            $("#div_of58j_").hide();
            $("#_280_of58a_party_identifier").attr("disabled", true);
            $("#_281_of58a_identifier_code").attr("disabled", true);
            $("#_283_of58d_party_identifier").attr("disabled", true);
            $("#_284_of58d_name_address").attr("disabled", true);
            $("#_285_of58j_party_identification").attr("disabled", true);
        }
        //end of the line
        //Mandatory Sequence D
        //OF53_a_d_j
        if ($("#_290_of53a_party_identifier").val() != "" || $("#_291_of53a_identifier_code").val() != "") {
            $("#type_of53_d").val("a").attr("selected", true);
            $("#div_of53a_d").show();
            $("#div_of53d_d").hide();
            $("#div_of53j_d").hide();
            $("#_290_of53a_party_identifier").attr("disabled", false);
            $("#_291_of53a_identifier_code").attr("disabled", false);
            $("#_293_of53d_party_identifier").attr("disabled", true);
            $("#_294_of53d_name_address").attr("disabled", true);
            $("#_245_of53j_party_identification").attr("disabled", true);
        } else if ($("#_293_of53d_party_identifier").val() != "" || $("#_294_of53d_name_address").val() != "") {
            $("#type_of53_d").val("d").attr("selected", true);
            $("#div_of53a_d").hide();
            $("#div_of53d_d").show();
            $("#div_of53j_d").hide();
            $("#_290_of53a_party_identifier").attr("disabled", true);
            $("#_291_of53a_identifier_code").attr("disabled", true);
            $("#_293_of53d_party_identifier").attr("disabled", false);
            $("#_294_of53d_name_address").attr("disabled", false);
            $("#_295_of53j_party_identification").attr("disabled", true);
        } else if ($("#_295_of53j_party_identification").val() != "") {
            $("#type_of53_d").val("j").attr("selected", true);
            $("#div_of53a_d").hide();
            $("#div_of53d_d").hide();
            $("#div_of53j_d").show();
            $("#_290_of53a_party_identifier").attr("disabled", true);
            $("#_291_of53a_identifier_code").attr("disabled", true);
            $("#_293_of53d_party_identifier").attr("disabled", true);
            $("#_294_of53d_name_address").attr("disabled", true);
            $("#_295_of53j_party_identification").attr("disabled", false);
        } else {
            $("#div_of53a_d").hide();
            $("#div_of53d_d").hide();
            $("#div_of53j_d").hide();
            $("#_290_of53a_party_identifier").attr("disabled", true);
            $("#_291_of53a_identifier_code").attr("disabled", true);
            $("#_293_of53d_party_identifier").attr("disabled", true);
            $("#_294_of53d_name_address").attr("disabled", true);
            $("#_295_of53j_party_identification").attr("disabled", true);
        }
        //end of the line
        //OF86_a_d_j
        if ($("#_300_of86a_party_identifier").val() != "" || $("#_301_of86a_identifier_code").val() != "") {
            $("#type_of86_d").val("a").attr("selected", true);
            $("#div_of86a_d").show();
            $("#div_of86d_d").hide();
            $("#div_of86j_d").hide();
            $("#_300_of86a_party_identifier").attr("disabled", false);
            $("#_301_of86a_identifier_code").attr("disabled", false);
            $("#_303_of86d_party_identifier").attr("disabled", true);
            $("#_304_of86d_name_address").attr("disabled", true);
            $("#_305_of86j_party_identification").attr("disabled", true);
        } else if ($("#_303_of86d_party_identifier").val() != "" || $("#_304_of86d_name_address").val() != "") {
            $("#type_of86_d").val("d").attr("selected", true);
            $("#div_of86a_d").hide();
            $("#div_of86d_d").show();
            $("#div_of86j_d").hide();
            $("#_300_of86a_party_identifier").attr("disabled", true);
            $("#_301_of86a_identifier_code").attr("disabled", true);
            $("#_303_of86d_party_identifier").attr("disabled", false);
            $("#_304_of86d_name_address").attr("disabled", false);
            $("#_305_of86j_party_identification").attr("disabled", true);
        } else if ($("#_305_of86j_party_identification").val() != "") {
            $("#type_of86_d").val("j").attr("selected", true);
            $("#div_of86a_d").hide();
            $("#div_of86d_d").hide();
            $("#div_of86j_d").show();
            $("#_300_of86a_party_identifier").attr("disabled", true);
            $("#_301_of86a_identifier_code").attr("disabled", true);
            $("#_303_of86d_party_identifier").attr("disabled", true);
            $("#_304_of86d_name_address").attr("disabled", true);
            $("#_305_of86j_party_identification").attr("disabled", false);
        } else {
            $("#div_of86a_d").hide();
            $("#div_of86d_d").hide();
            $("#div_of86j_d").hide();
            $("#_300_of86a_party_identifier").attr("disabled", true);
            $("#_301_of86a_identifier_code").attr("disabled", true);
            $("#_303_of86d_party_identifier").attr("disabled", true);
            $("#_304_of86d_name_address").attr("disabled", true);
            $("#_305_of86j_party_identification").attr("disabled", true);
        }
        //end of the line
        //OF56_a_d_j
        if ($("#_310_of56a_party_identifier").val() != "" || $("#_311_of56a_identifier_code").val() != "") {
            $("#type_of56_d").val("a").attr("selected", true);
            $("#div_of56a_d").show();
            $("#div_of56d_d").hide();
            $("#div_of56j_d").hide();
            $("#_310_of56a_party_identifier").attr("disabled", false);
            $("#_311_of56a_identifier_code").attr("disabled", false);
            $("#_313_of56d_party_identifier").attr("disabled", true);
            $("#_314_of56d_name_address").attr("disabled", true);
            $("#_315_of56j_party_identification").attr("disabled", true);
        } else if ($("#_313_of56d_party_identifier").val() != "" || $("#_314_of56d_name_address").val() != "") {
            $("#type_of56_d").val("d").attr("selected", true);
            $("#div_of56a_d").hide();
            $("#div_of56d_d").show();
            $("#div_of56j_d").hide();
            $("#_310_of56a_party_identifier").attr("disabled", true);
            $("#_311_of56a_identifier_code").attr("disabled", true);
            $("#_313_of56d_party_identifier").attr("disabled", false);
            $("#_314_of56d_name_address").attr("disabled", false);
            $("#_315_of56j_party_identification").attr("disabled", true);
        } else if ($("#_315_of56j_party_identification").val() != "") {
            $("#type_of56_d").val("j").attr("selected", true);
            $("#div_of56a_d").hide();
            $("#div_of56d_d").hide();
            $("#div_of56j_d").show();
            $("#_310_of56a_party_identifier").attr("disabled", true);
            $("#_311_of56a_identifier_code").attr("disabled", true);
            $("#_313_of56d_party_identifier").attr("disabled", true);
            $("#_314_of56d_name_address").attr("disabled", true);
            $("#_315_of56j_party_identification").attr("disabled", false);
        } else {
            $("#div_of56a_d").hide();
            $("#div_of56d_d").hide();
            $("#div_of56j_d").hide();
            $("#_310_of56a_party_identifier").attr("disabled", true);
            $("#_311_of56a_identifier_code").attr("disabled", true);
            $("#_313_of56d_party_identifier").attr("disabled", true);
            $("#_314_of56d_name_address").attr("disabled", true);
            $("#_315_of56j_party_identification").attr("disabled", true);
        }
        //end of the line
        //MF57_a_d_j
        if ($("#_320_mf57a_party_identifier").val() != "" || $("#_321_mf57a_identifier_code").val() != "") {
            $("#type_mf57_d").val("a").attr("selected", true);
            $("#div_mf57a_d").show();
            $("#div_mf57d_d").hide();
            $("#div_mf57j_d").hide();
            $("#_320_mf57a_party_identifier").attr("disabled", false);
            $("#_321_mf57a_identifier_code").attr("disabled", false);
            $("#_323_mf57d_party_identifier").attr("disabled", true);
            $("#_324_mf57d_name_address").attr("disabled", true);
            $("#_325_mf57j_party_identification").attr("disabled", true);
        } else if ($("#_323_mf57d_party_identifier").val() != "" || $("#_324_mf57d_name_address").val() != "") {
            $("#type_mf57_d").val("d").attr("selected", true);
            $("#div_mf57a_d").hide();
            $("#div_mf57d_d").show();
            $("#div_mf57j_d").hide();
            $("#_320_mf57a_party_identifier").attr("disabled", true);
            $("#_321_mf57a_identifier_code").attr("disabled", true);
            $("#_323_mf57d_party_identifier").attr("disabled", false);
            $("#_324_mf57d_name_address").attr("disabled", false);
            $("#_325_mf57j_party_identification").attr("disabled", true);
        } else if ($("#_325_mf57j_party_identification").val() != "") {
            $("#type_mf57_d").val("j").attr("selected", true);
            $("#div_mf57a_d").hide();
            $("#div_mf57d_d").hide();
            $("#div_mf57j_d").show();
            $("#_320_mf57a_party_identifier").attr("disabled", true);
            $("#_321_mf57a_identifier_code").attr("disabled", true);
            $("#_323_mf57d_party_identifier").attr("disabled", true);
            $("#_324_mf57d_name_address").attr("disabled", true);
            $("#_325_mf57j_party_identification").attr("disabled", false);
        } else {
            $("#div_mf57a_d").hide();
            $("#div_mf57d_d").hide();
            $("#div_mf57j_d").hide();
            $("#_320_mf57a_party_identifier").attr("disabled", true);
            $("#_321_mf57a_identifier_code").attr("disabled", true);
            $("#_323_mf57d_party_identifier").attr("disabled", true);
            $("#_324_mf57d_name_address").attr("disabled", true);
            $("#_325_mf57j_party_identification").attr("disabled", true);
        }
        //end of the line
        //OF58_a_d_j
        if ($("#_330_of58a_party_identifier").val() != "" || $("#_331_of58a_identifier_code").val() != "") {
            $("#type_of58_d").val("a").attr("selected", true);
            $("#div_of58a_d").show();
            $("#div_of58d_d").hide();
            $("#div_of58j_d").hide();
            $("#_330_of58a_party_identifier").attr("disabled", false);
            $("#_331_of58a_identifier_code").attr("disabled", false);
            $("#_333_of58d_party_identifier").attr("disabled", true);
            $("#_334_of58d_name_address").attr("disabled", true);
            $("#_335_of58j_party_identification").attr("disabled", true);
        } else if ($("#_333_of58d_party_identifier").val() != "" || $("#_334_of58d_name_address").val() != "") {
            $("#type_of58_d").val("d").attr("selected", true);
            $("#div_of58a_d").hide();
            $("#div_of58d_d").show();
            $("#div_of58j_d").hide();
            $("#_330_of58a_party_identifier").attr("disabled", true);
            $("#_331_of58a_identifier_code").attr("disabled", true);
            $("#_333_of58d_party_identifier").attr("disabled", false);
            $("#_334_of58d_name_address").attr("disabled", false);
            $("#_335_of58j_party_identification").attr("disabled", true);
        } else if ($("#_335_of58j_party_identification").val() != "") {
            $("#type_of58_d").val("j").attr("selected", true);
            $("#div_of58a_d").hide();
            $("#div_of58d_d").hide();
            $("#div_of58j_d").show();
            $("#_330_of58a_party_identifier").attr("disabled", true);
            $("#_331_of58a_identifier_code").attr("disabled", true);
            $("#_333_of58d_party_identifier").attr("disabled", true);
            $("#_334_of58d_name_address").attr("disabled", true);
            $("#_335_of58j_party_identification").attr("disabled", false);
        } else {
            $("#div_of58a_d").hide();
            $("#div_of58d_d").hide();
            $("#div_of58j_d").hide();
            $("#_330_of58a_party_identifier").attr("disabled", true);
            $("#_331_of58a_identifier_code").attr("disabled", true);
            $("#_333_of58d_party_identifier").attr("disabled", true);
            $("#_334_of58d_name_address").attr("disabled", true);
            $("#_335_of58j_party_identification").attr("disabled", true);
        }
        //end of the line
        //15F
        //MF57_a_d_j
        if ($("#_370_mf57a_party_identifier").val() != "" || $("#_371_mf57a_identifier_code").val() != "") {
            $("#type_mf57_f").val("a").attr("selected", true);
            $("#div_mf57a_f").show();
            $("#div_mf57d_f").hide();
            $("#div_mf57j_f").hide();
            $("#_370_mf57a_party_identifier").attr("disabled", false);
            $("#_371_mf57a_identifier_code").attr("disabled", false);
            $("#_373_mf57d_party_identifier").attr("disabled", true);
            $("#_374_mf57d_name_address").attr("disabled", true);
            $("#_375_mf57j_party_identification").attr("disabled", true);
        } else if ($("#_373_mf57d_party_identifier").val() != "" || $("#_374_mf57d_name_address").val() != "") {
            $("#type_mf57_f").val("d").attr("selected", true);
            $("#div_mf57a_f").hide();
            $("#div_mf57d_f").show();
            $("#div_mf57j_f").hide();
            $("#_370_mf57a_party_identifier").attr("disabled", true);
            $("#_371_mf57a_identifier_code").attr("disabled", true);
            $("#_373_mf57d_party_identifier").attr("disabled", false);
            $("#_374_mf57d_name_address").attr("disabled", false);
            $("#_375_mf57j_party_identification").attr("disabled", true);
        } else if ($("#_375_mf57j_party_identification").val() != "") {
            $("#type_mf57_f").val("j").attr("selected", true);
            $("#div_mf57a_f").hide();
            $("#div_mf57d_f").hide();
            $("#div_mf57j_f").show();
            $("#_370_mf57a_party_identifier").attr("disabled", true);
            $("#_371_mf57a_identifier_code").attr("disabled", true);
            $("#_373_mf57d_party_identifier").attr("disabled", true);
            $("#_374_mf57d_name_address").attr("disabled", true);
            $("#_375_mf57j_party_identification").attr("disabled", false);
        } else {
            $("#div_mf57a_f").hide();
            $("#div_mf57d_f").hide();
            $("#div_mf57j_f").hide();
            $("#_370_mf57a_party_identifier").attr("disabled", true);
            $("#_371_mf57a_identifier_code").attr("disabled", true);
            $("#_373_mf57d_party_identifier").attr("disabled", true);
            $("#_374_mf57d_name_address").attr("disabled", true);
            $("#_375_mf57j_party_identification").attr("disabled", true);
        }
        //end of the line
        //15H
        //of88_a_d_j
        if ($("#_390_of88a_party_identifier").val() != "" || $("#_391_of88a_identifier_code").val() != "") {
            $("#type_of88_").val("a").attr("selected", true);
            $("#div_of88_a").show();
            $("#div_of88_d").hide();
            $("#div_of88_j").hide();
            $("#_390_of88a_party_identifier").attr("disabled", false);
            $("#_391_of88a_identifier_code").attr("disabled", false);
            $("#_393_of88d_party_identifier").attr("disabled", true);
            $("#_394_of88d_name_and_address").attr("disabled", true);
            $("#_395_of88j_party_identification").attr("disabled", true);
        } else if ($("#_393_of88d_party_identifier").val() != "" || $("#_394_of88d_name_and_address").val() != "") {
            $("#type_of88_").val("d").attr("selected", true);
            $("#div_of88_a").hide();
            $("#div_of88_d").show();
            $("#div_of88_j").hide();
            $("#_390_of88a_party_identifier").attr("disabled", true);
            $("#_391_of88a_identifier_code").attr("disabled", true);
            $("#_393_of88d_party_identifier").attr("disabled", false);
            $("#_394_of88d_name_and_address").attr("disabled", false);
            $("#_395_of88j_party_identification").attr("disabled", true);
        } else if ($("#_395_of88j_party_identification").val() != "") {
            $("#type_of88_").val("j").attr("selected", true);
            $("#div_of88_a").hide();
            $("#div_of88_d").hide();
            $("#div_of88_j").show();
            $("#_390_of88a_party_identifier").attr("disabled", true);
            $("#_391_of88a_identifier_code").attr("disabled", true);
            $("#_393_of88d_party_identifier").attr("disabled", true);
            $("#_394_of88d_name_and_address").attr("disabled", true);
            $("#_395_of88j_party_identification").attr("disabled", false);
        } else {
            $("#div_of88_a").hide();
            $("#div_of88_d").hide();
            $("#div_of88_j").hide();
            $("#_390_of88a_party_identifier").attr("disabled", true);
            $("#_391_of88a_identifier_code").attr("disabled", true);
            $("#_393_of88d_party_identifier").attr("disabled", true);
            $("#_394_of88d_name_and_address").attr("disabled", true);
            $("#_395_of88j_party_identification").attr("disabled", true);
        }
        //end of the line
        //Seq F checkbox
        if ($("#_371_mf57a_identifier_code").val() != "" || $("#_374_mf57d_name_address").val() != "" || $("#_375_mf57j_party_identification").val() != "") {
            $("#seq_F_checkbox").attr("checked", true);
            $("#check_seq_f").show();
            $("#_371_mf57a_identifier_code").attr("disabled", false);
            $("#_374_mf57d_name_address").attr("disabled", false);
            $("#_375_mf57j_party_identification").attr("disabled", false);
        } else {
            $("#check_seq_f").hide();
            $("#_371_mf57a_identifier_code").attr("disabled", true);
            $("#_374_mf57d_name_address").attr("disabled", true);
            $("#_375_mf57j_party_identification").attr("disabled", true);
        }
        //end of the line
//        Seq H checkbox
        if ($("#_391_of88a_identifier_code").val() != "" || $("#_394_of88d_name_and_address").val() != "" || $("#_395_of88j_party_identification").val() != ""){
            $("#seq_H_checkbox").attr("checked", true);
            $("#check_seq_h").show();
            $("#_391_of88a_identifier_code").attr("disabled", false);
            $("#_394_of88d_name_and_address").attr("disabled", false);
            $("#_395_of88j_party_identification").attr("disabled", false);
        } else {
            $("#check_seq_h").hide();
            $("#_391_of88a_identifier_code").attr("disabled", true);
            $("#_394_of88d_name_and_address").attr("disabled", true);
            $("#_395_of88j_party_identification").attr("disabled", true);
        }
        //end of the line
    });
</script>