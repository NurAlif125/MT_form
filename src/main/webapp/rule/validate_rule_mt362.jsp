<%-- 
    Document   : validate_rule_mt362
    Created on : Nov 21, 2023, 3:52:53 PM
    Author     : Baim
--%>



<script type="text/javascript">
    $(document).ready(function () {
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

//                body
//               Mandatory
//                 Seq A
//mf20
                _020_mf20_sender_reference: "required",
//mf22a
                _040_mf22a_type_of_operation: "required",
//mf22c
                _060_mf22c_common_reference: "required",
//mf23a
                _070_mf23a_type_of_swap: "required",
                _071_mf23a_settlement_method: "required",
//mf21nA
                _080_mf21n_contract_number_party_a: "required",
//mf21nb

//mf30v
                _100_mf30v_effective_date: "required",
//mf30p
                _110_mf30p_termination_date: "required",
//mf82a
                _120_mf82a_party_identifier: "required",
                _123_mf82a_party_identifier_address: "required",
                _124_mf82j_party_identifier: "required",
                _122_mf82d_party_identifier: "required",
                _123_mf82d_name_and_address: "required",
//mf87a
                _130_mf87a_party_identifier: "required",
                _131_mf87a_party_identifier_code: "required",
                _132_mf87a_party_identifier_address: "required",
                _132_mf87d_party_identifier: "required",
                _133_mf87d_name_and_address: "reuired",
                _133_mf87j_party_identifier: "required",
//End of seq A

//Seq B
//mf33fcurrency
                _180_mf33f_currency: "required",
//mf33famount
                _181_mf33f_amount: "required",
//mf30x
                _190_mf30x_period_start_date: "required",
//mf37gSign
                _210_mf37g_sign: "required",
//mf37gRate
                _211_mf37g_rate: "required",
//mf37rSign
                _240_mf37r_sign: "required",
//mf37rRate
                _241_mf37r_rate: "required",
//mf37mSign
                _250_mf37m_sign: "required",
//mf37mRate
                _251_mf37m_rate: "required",
//mf30f
                _260_mf30f_payment_date: "required",
//End Of Seq B

//Seq C
//mf18a
                _310_mf18a_: "required",
                _310_mf18a_number_of_repetitions: "required",
//mf30f
                _320_mf30f_payment_date: "required",
//mf32mcurrency
                _330_mf32m_currency: "required",
//mf32mamount
                _331_mf32m_amount: "required",
//mf57a
                div_370_mf57a_
                        _370_mf57a_: "required",
                _370_mf57a_party_identifier: "required",
                _371_mf57a_identifier_code: "required",
                _372_mf57a_party_identifier_address: "required",
                _372_mf57d_party_identifier: "required",
                _373_mf57d_name_and_address: "required",
//End of Seq C
//
//Seq D
//mf33fcurrency
                _390_mf33f_currency: "required",
//mf33famount
                _391_mf33f_amount: "required",
//mf30x
                _400_mf30x_period_start_date: "required",
//mf37gSign
                _420_mf37g_sign: "required",
//mf37gRate
////mf37rSign
                _440_of37r_sign: "required",
//mf37rRate
                _441_of37r_rate: "required",
//mf37msign
                _520_mf37m_sign: "required",
//mf37mrate
                _521_mf37m_rate: "required",
//mf30f
                _540_mf30f_payment_date: "required",
//End of Seq D
//
//Seq E
//mf18a
                _560_mf18a: "required",
                _561_mf18a_number_of_repetitions: "required",
//mf30f
                _530_mf30f_payment_date: "required",
//mf32mcurrency
                _540_mf32m_currency: "required",
//mf32amount
                _541_mf32m_amount: "required",
//mf57a
                type_600_mf57a_: "required",
                _620_of57a_party_identifier: "required",
                _621_of57a_identifier_code: "required",
                _622_of57a_identifier_address: "required",
//mf57a
//End of Seq E


                //template
                template_name: "required"

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _020_mf20_sender_reference: {required: "mf20_sender_reference harus diisi..!!"},
//MF22a
                _040_mf22a_type_of_operation: {required: "mf22a_type_of_operation harus diisi..!!"},
//mf22c
                _060_mf22c_common_reference: {required: "060_mf22c_common_reference harus diisi..!!"},
//mf23a
                _070_mf23a_type_of_swap: {required: "070_mf23a_type_of_swap: {required harus diisi..!!"},
                _071_mf23a_settlement_method: {required: "071_mf23a_settlement_method: harus diisi..!!"},
//mf21nA
                _080_mf21n_contract_number_party_a: {required: "080_mf21n_contract_number_party_a harus diisi..!!"},
//mf30v
                _100_mf30v_effective_date: {required: "100_mf30v_effective_date harus diisi..!!"},
//mf30p
                _110_mf30p_termination_date: {required: "110_mf30p_termination_date harus diisi..!!"},
//mf82a
                _120_mf82a_party_identifier: {required: "120_mf82a_party_identifier harus diisi..!!"},
                _122_mf82d_party_identifier: {required: "_122_mf82d_party_identifier harus diisi..!!"},
                _123_mf82d_name_and_address: {required: "_123_mf82d_name_and_address harus diisi..!!"},
                _123_mf82a_party_identifier_address: {required: "_123_mf82a_party_identifier_address harus diisi..!!"},
                _123_mf82a_party_identifier_address: {required: "123_mf82a_party_identifier_address harus diisi..!!"},
                _124_mf82j_party_identifier: {required: "124_mf82j_party_identifier harus diisi..!!"},
//mf87a
                _130_mf87a_party_identifier: {required: "130_mf87a_party_identifier harus diisi..!!"},
                _131_mf87a_party_identifier_code: {required: "131_mf87a_party_identifier_code harus diisi..!!"},
                _132_mf87a_party_identifier_address: {required: "132_mf87a_party_identifier_address harus diisi..!!"},
                _133_mf87j_party_identifier: {required: "133_mf87j_party_identifier harus diisi..!!"},
//End of seq A
//Seq B
//mf33fcurrency
                _180_mf33f_currency: {required: "sender_logical_terminal harus diisi..!!"},
//mf33famount
                _181_mf33f_amount: {required: "sender_logical_terminal harus diisi..!!"},
//mf30x
                _190_mf30x_period_start_date: {required: "sender_logical_terminal harus diisi..!!"},
//mf37gSign
                _210_mf37g_sign: {required: "sender_logical_terminal harus diisi..!!"},
//mf37gRate
                _211_mf37g_rate: {required: "sender_logical_terminal harus diisi..!!"},
//mf37rSign
                _240_mf37r_sign: {required: "sender_logical_terminal harus diisi..!!"},
//mf37rRate
                _241_mf37r_rate: {required: "receiver_institution harus diisi..!!"},
//mf37mSign
                _250_mf37m_sign: {required: "receiver_institution harus diisi..!!"},
//mf37mRate
                _251_mf37m_rate: {required: "receiver_institution harus diisi..!!"},
//mf30f
                _260_mf30f_payment_date: {required: "receiver_institution harus diisi..!!"},
//End Of Seq B

//Seq C
//mf18a
                _310_mf18a_: {required: "receiver_institution harus diisi..!!"},
                _310_mf18a_number_of_repetitions: {required: "receiver_institution harus diisi..!!"},
//mf30f
                _320_mf30f_payment_date: {required: "receiver_institution harus diisi..!!"},
//mf32mcurrency
                _330_mf32m_currency: {required: "receiver_institution harus diisi..!!"},
//mf32mamount
                _331_mf32m_amount: {required: "receiver_institution harus diisi..!!"},
//mf57a
                div_370_mf57a_: {required: "receiver_institution harus diisi..!!"},
                _370_mf57a_: {required: "receiver_institution harus diisi..!!"},
                _370_mf57a_party_identifier: {required: "receiver_institution harus diisi..!!"},
                _371_mf57a_identifier_code: {required: "receiver_institution harus diisi..!!"},
                _372_mf57a_party_identifier_address: {required: "receiver_institution harus diisi..!!"},
                _372_mf57d_party_identifier: {required: "receiver_institution harus diisi..!!"},
                _373_mf57d_name_and_address: {required: "receiver_institution harus diisi..!!"},
//End of Seq C
//Seq D
//mf33fcurrency
                _390_mf33f_currency: {required: "receiver_institution harus diisi..!!"},
//mf33famount
                _391_mf33f_amount: {required: "receiver_institution harus diisi..!!"},
//mf30x
                _400_mf30x_period_start_date: {required: "receiver_institution harus diisi..!!"},
//mf37gSign
                _420_mf37g_sign: {required: "receiver_institution harus diisi..!!"},
//mf37gRate
////mf37rSign
                _440_of37r_sign: {required: "receiver_institution harus diisi..!!"},
//mf37rRate
                _441_of37r_rate: {required: "receiver_institution harus diisi..!!"},
//mf37msign
                _520_mf37m_sign: {required: "receiver_institution harus diisi..!!"},
//mf37mrate
                _521_mf37m_rate: {required: "receiver_institution harus diisi..!!"},
//mf30f
                _540_mf30f_payment_date: {required: "receiver_institution harus diisi..!!"},
//End of Seq D
//Seq E
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
                alert(error.html());
            },
            showErrors: function (errorMap, errorList) {
                this.defaultShowErrors();
            }
        });
    });</script>

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
        $("#check_seq_b").hide();
        $("#_096_of83j_party_identification").attr("disabled", true);
        $("#seq_B_checkbox").click(function () {
            if ($("#seq_B_checkbox").is(":checked")) {
                $("#check_seq_b").show();
                $("#_096_of83j_party_identification").attr("disabled", false);
            } else {
                $("#check_seq_b").hide();
                $("#_144_of83j_party_identification").attr("disabled", false);
            }

        });
//Chek of23A
        $("#check_of23A").hide();
        $("#_071_mf23a_type_of_settlement_method").attr("disabled", true);
        $("#_mf23A_Identification_of_the_Swap").click(function () {
            if ($("#_mf23A_Identification_of_the_Swap").is(":checked")) {
                $("#check_of23A").show();
                $("#_071_mf23a_type_of_settlement_method").attr("disabled", false);
            } else {
                $("#check_of23A").hide();
                $("#_071_mf23a_type_of_settlement_method").attr("disabled", true);
            }
        });
//        End of chek 23A

        //MF82a     

        $("#div_mf82_a").hide();
        $("#div_mf82_d").hide();
        $("#div_mf82_j").hide();
        $("#_120_mf82a_party_identifier").attr("disabled", true);
        $("#_121_mf82a_party_identifier_code").attr("disabled", true);
        $("#_122_mf82d_party_identifier").attr("disabled", true);
        $("#_123_mf82d_name_and_address").attr("disabled", true);
        $("#_124_mf82j_party_identifier").attr("disabled", true);
        $("#type_mf82A_").change(function () {
            if ($("#type_mf82A_").val() == "a") {
                $("#div_mf82_a").show();
                $("#div_mf82_d").hide();
                $("#div_mf82_j").hide();
                $("#_120_mf82a_party_identifier").attr("disabled", false);
                $("#_121_mf82a_party_identifier_code").attr("disabled", false);
                $("#_122_mf82d_party_identifier").attr("disabled", true);
                $("#_123_mf82d_name_and_address").attr("disabled", true);
                $("#_124_mf82j_party_identifier").attr("disabled", true);
            } else if ($("#type_mf82A_").val() == "d") {
                $("#div_mf82_a").hide();
                $("#div_mf82_d").show();
                $("#div_mf82_j").hide();
                $("#_120_mf82a_party_identifier").attr("disabled", true);
                $("#_121_mf82a_party_identifier_code").attr("disabled", true);
                $("#_122_mf82d_party_identifier").attr("disabled", false);
                $("#_123_mf82d_name_and_address").attr("disabled", false);
                $("#_124_mf82j_party_identifier").attr("disabled", true);
            } else {
                $("#div_mf82_a").hide();
                $("#div_mf82_d").hide();
                $("#div_mf82_j").hide();
                $("#_120_mf82a_party_identifier").attr("disabled", true);
                $("#_121_mf82a_party_identifier_code").attr("disabled", true);
                $("#_074_mf82d_party_identifier").attr("disabled", true);
                $("#_075_mf82d_name_address").attr("disabled", true);
                $("#_124_mf82j_party_identifier").attr("disabled", true);
            }
        });
//        end of 82a

//MF87A_a_d_j

        $("#div_mf87_a").hide();
        $("#div_mf87_d").hide();
        $("#div_mf87_j").hide();
        $("#_130_mf87a_party_identifier").attr("disabled", true);
        $("#_131_mf87a_party_identifier_code").attr("disabled", true);
        $("#_132_mf87d_party_identifier").attr("disabled", true);
        $("#_133_mf87d_name_and_address").attr("disabled", true);
        $("#_133_mf87j_party_identifier").attr("disabled", true);
        $("#type_mf87A_").change(function () {
            if ($("#type_mf87A_").val() == "a") {
                $("#div_mf87_a").show();
                $("#div_mf87_d").hide();
                $("#div_mf87_j").hide();
                $("#_130_mf87a_party_identifier").attr("disabled", false);
                $("#_131_mf87a_party_identifier_code").attr("disabled", false);
                $("#_132_mf87d_party_identifier").attr("disabled", true);
                $("#_133_mf87d_name_and_address").attr("disabled", true);
                $("#_133_mf87j_party_identifier").attr("disabled", true);
            } else if ($("#type_mf87A_").val() == "d") {
                $("#div_mf87_a").hide();
                $("#div_mf87_d").show();
                $("#div_mf87_j").hide();
                $("#_130_mf87a_party_identifier").attr("disabled", true);
                $("#_131_mf87a_party_identifier_code").attr("disabled", true);
                $("#_132_mf87d_party_identifier").attr("disabled", false);
                $("#_133_mf87d_name_and_address").attr("disabled", false);
                $("#_133_mf87j_party_identifier").attr("disabled", true);
            } else if ($("#type_mf87A_").val() == "j") {
                $("#div_mf87_a").hide();
                $("#div_mf87_d").hide();
                $("#div_mf87_j").show();
                $("#_130_mf87a_party_identifier").attr("disabled", true);
                $("#_131_mf87a_party_identifier_code").attr("disabled", true);
                $("#_132_mf87d_party_identifier").attr("disabled", true);
                $("#_133_mf87d_name_and_address").attr("disabled", true);
                $("#_133_mf87j_party_identifier").attr("disabled", false);
            } else {
                $("#div_mf87_a").hide();
                $("#div_mf87_d").hide();
                $("#div_mf87_j").hide();
                $("#_130_mf87a_party_identifier").attr("disabled", true);
                $("#_132_mf87d_party_identifier").attr("disabled", true);
                $("#_132_mf87d_party_identifier").attr("disabled", true);
                $("#_133_mf87d_name_and_address").attr("disabled", true);
                $("#_133_mf87j_party_identifier").attr("disabled", true);
            }
        }); //end of 87A
//of 83A_a_d_j


        $("#div_of83_a").hide();
        $("#div_of83_d").hide();
        $("#div_of83_j").hide();
        $("#_140_of83a_party_identifier").attr("disabled", true);
        $("#_141_of83a_identifier_code").attr("disabled", true);
        $("#_142_of83d_party_identifier").attr("disabled", true);
        $("#_143_of83d_name_and_address").attr("disabled", true);
        $("#_144_of83j_party_identification").attr("disabled", true);
        $("#type_of83A_").change(function () {
            if ($("#type_of83A_").val() == "a") {
                $("#div_of83_a").show();
                $("#div_of83_d").hide();
                $("#div_of83_j").hide();
                $("#_140_of83a_party_identifier").attr("disabled", false);
                $("#_141_of83a_identifier_code").attr("disabled", false);
                $("#_142_of83d_party_identifier").attr("disabled", true);
                $("#_143_of83d_name_and_address").attr("disabled", true);
                $("#_144_of83j_party_identification").attr("disabled", true);
            } else if ($("#type_of83A_").val() == "d") {
                $("#div_of83_a").hide();
                $("#div_of83_d").show();
                $("#div_of83_j").hide();
                $("#_140_of83a_party_identifier").attr("disabled", true);
                $("#_141_of83a_identifier_code").attr("disabled", true);
                $("#_142_of83d_party_identifier").attr("disabled", false);
                $("#_143_of83d_name_and_address").attr("disabled", false);
                $("#_144_of83j_party_identification").attr("disabled", true);
            } else if ($("#type_of83A_").val() == "j") {
                $("#div_of83_a").hide();
                $("#div_of83_d").hide();
                $("#div_of83_j").show();
                $("#_140_of83a_party_identifier").attr("disabled", true);
                $("#_141_of83a_identifier_code").attr("disabled", true);
                $("#_142_of83d_party_identifier").attr("disabled", true);
                $("#_143_of83d_name_and_address").attr("disabled", true);
                $("#_144_of83j_party_identification").attr("disabled", false);
            } else {
                $("#div_of83_a").hide();
                $("#div_of83_d").hide();
                $("#div_of83_j").hide();
                $("#_140_of83a_party_identifier").attr("disabled", true);
                $("#_141_of83a_identifier_code").attr("disabled", true);
                $("#_142_of83d_party_identifier").attr("disabled", true);
                $("#_143_of83d_name_and_address").attr("disabled", true);
                $("#_144_of83j_party_identification").attr("disabled", true);
            }
        });
//Chek of83A
        $("#check_of83A").hide();
        $("#check_of83A").attr("disabled", true);
        $("#fund_or_instructing_party_checkbox").click(function () {
            if ($("#fund_or_instructing_party_checkbox").is(":checked")) {
                $("#check_of83A").show();
                $("#type_of83A_").attr("disabled", false);
            } else {
                $("#check_of83A").hide();
                $("#type_of83A_").attr("disabled", true);
            }
        });
//        end of 83A

//0f29A
        $("#check_of29a").hide();
        $("#_150_of29a_contact_information").attr("disabled", true);
        $("#contact_information_checkbox").click(function () {
            if ($("#contact_information_checkbox").is(":checked")) {
                $("#check_of29a").show();
                $("#_150_of29a_contact_information").attr("disabled", false);
            } else {
                $("#check_of29a").hide();
                $("#_150_of29a_contact_information").attr("disabled", true);
            }

//        end of 29A
        });
//        end of Seq A

//Seq B
//Chekbox seq B
        $("#check_seq_b").hide();
        $("#_096_of83j_party_identification").attr("disabled", true);
        $("#seq_B_checkbox").click(function () {
            if ($("#seq_B_checkbox").is(":checked")) {
                $("#check_seq_b").show();
                $("#_096_of83j_party_identification").attr("disabled", false);
            } else {
                $("#check_seq_b").hide();
                $("#_096_of83j_party_identification").attr("disabled", true);
            }

        });
//end of Chekbox seq B
//Chekbox 32h
        $("#check_of32h_SB").hide();
        $("#_162_of32h_amount").attr("disabled", true);
        $("#OF32H_SB_amount_to_be_settled_checkbox").click(function () {
            if ($("#OF32H_SB_amount_to_be_settled_checkbox").is(":checked")) {
                $("#check_of32h_SB").show();
                $("#_162_of32h_amount").attr("disabled", false);
            } else {
                $("#check_of32h_SB").hide();
                $("#_162_of32h_amount").attr("disabled", true);
            }

        });
//        end of chek 32H

//chek33E
        $("#check_of33e_s-b").hide();
        $("#_551_of33e_amount").attr("disabled", true);
        $("#of33E_SB_Currency_Principal_Exchange_Amount").click(function () {
            if ($("#of33E_SB_Currency_Principal_Exchange_Amount").is(":checked")) {
                $("#check_of33e_s-b").show();
                $("#_551_of33e_amount").attr("disabled", false);
            } else {
                $("#check_of33e_s-b").hide();
                $("#_551_of33e_amount").attr("disabled", true);
            }

        });
//end of chek 33E
//End Of Seq B

//SEQ C
//Chekbox seq C
        $("#check_seq_C").hide();
        $("#_373_mf57d_name_and_address").attr("disabled", true);
        $("#seq_C_checkbox").click(function () {
            if ($("#seq_C_checkbox").is(":checked")) {
                $("#check_seq_C").show();
                $("#_373_mf57d_name_and_address").attr("disabled", false);
            } else {
                $("#check_seq_C").hide();
                $("#_373_mf57d_name_and_address").attr("disabled", true);
            }

        });
//end of Chekbox seq C

//OF53A_a_b_d

        $("#div_of53a_").hide();
        $("#div_of53d_").hide();
        $("#_340_of53a_party_identifier").attr("disabled", true);
        $("#_341_of53a_identifier_code").attr("disabled", true);
        $("#_342_of53d_party_identifier").attr("disabled", true);
        $("#_343_of53d_name_and_address").attr("disabled", true);
        $("#type_of53_SC").change(function () {
            if ($("#type_of53_SC").val() == "a") {
                $("#div_of53a_").show();
                $("#div_of53d_").hide();
                $("#_340_of53a_party_identifier").attr("disabled", false);
                $("#_341_of53a_identifier_code").attr("disabled", false);
                $("#_342_of53d_party_identifier").attr("disabled", true);
                $("#_343_of53d_name_and_address").attr("disabled", true);
            } else if ($("#type_of53_SC").val() == "d") {
                $("#div_of53a_").hide();
                $("#div_of53d_").show();
                $("#_340_of53a_party_identifier").attr("disabled", true);
                $("#_341_of53a_identifier_code").attr("disabled", true);
                $("#_342_of53d_party_identifier").attr("disabled", false);
                $("#_343_of53d_name_and_address").attr("disabled", false);
            } else {
                $("#div_of53a_").hide();
                $("#div_of53d_").hide();
                $("#_340_of53a_party_identifier").attr("disabled", true);
                $("#_341_of53a_identifier_code").attr("disabled", true);
                $("#_342_of53d_party_identifier").attr("disabled", true);
                $("#_343_of53d_name_and_address").attr("disabled", true);
            }
        });
//        end of of53_a_b_d

//OF56A_a_b_d


        $("#div_of56a_").hide();
        $("#div_of56d_").hide();
        $("#_350_of56a_party_identifier").attr("disabled", true);
        $("#_351_of56a_identifier_code").attr("disabled", true);
        $("#_352_of56d_party_identifier").attr("disabled", true);
        $("#_353_of56d_name_and_address").attr("disabled", true);
        $("#type_of56_SC").change(function () {
            if ($("#type_of56_SC").val() == "a") {
                $("#div_of56a_").show();
                $("#div_of56d_").hide();
                $("#_350_of56a_party_identifier").attr("disabled", false);
                $("#_351_of56a_identifier_code").attr("disabled", false);
                $("#_352_of56d_party_identifier").attr("disabled", true);
                $("#_353_of56d_name_and_address").attr("disabled", true);
            } else if ($("#type_of56_SC").val() == "d") {
                $("#div_of56a_").hide();
                $("#div_of56d_").show();
                $("#_350_of56a_party_identifier").attr("disabled", true);
                $("#_351_of56a_identifier_code").attr("disabled", true);
                $("#_352_of56d_party_identifier").attr("disabled", false);
                $("#_353_of56d_name_and_address").attr("disabled", false);
            } else {
                $("#div_of56a_").hide();
                $("#div_of56d_").hide();
                $("#_350_of56a_party_identifier").attr("disabled", true);
                $("#_351_of56a_identifier_code").attr("disabled", true);
                $("#_352_of56d_party_identifier").attr("disabled", true);
                $("#_353_of56d_name_and_address").attr("disabled", true);
            }
        });
//end of OF56A_a_b_d

//OF86a_a_b_d
        $("#div_of86a_SC").hide();
        $("#div_of86d_SC").hide();
        $("#_360_of86a_party_identifier").attr("disabled", true);
        $("#_361_of86a_identifier_code").attr("disabled", true);
        $("#_362_of86d_party_identifier").attr("disabled", true);
        $("#_363_of86d_name_and_address").attr("disabled", true);
        $("#OF86a_SC").change(function () {
            if ($("#OF86a_SC").val() == "a") {
                $("#div_of86a_SC").show();
                $("#div_of86d_SC").hide();
                $("#_360_of86a_party_identifier").attr("disabled", false);
                $("#_361_of86a_identifier_code").attr("disabled", false);
                $("#_362_of86d_party_identifier").attr("disabled", true);
                $("#_363_of86d_name_and_address").attr("disabled", true);
            } else if ($("#OF86a_SC").val() == "d") {
                $("#div_of86a_SC").hide();
                $("#div_of86d_SC").show();
                $("#_360_of86a_party_identifier").attr("disabled", true);
                $("#_361_of86a_identifier_code").attr("disabled", true);
                $("#_362_of86d_party_identifier").attr("disabled", false);
                $("#_363_of86d_name_and_address").attr("disabled", false);
            } else {
                $("#div_of86a_SC").hide();
                $("#div_of86d_SC").hide();
                $("#_360_of86a_party_identifier").attr("disabled", true);
                $("#_361_of86a_identifier_code").attr("disabled", true);
                $("#_362_of86d_party_identifier").attr("disabled", true);
                $("#_363_of86d_name_and_address").attr("disabled", true);
            }
        });
//        end of OF86a_a_b_d

//OF57A_a_b_d


        $("#div_mf57a_").hide();
        $("#div_mf57d_").hide();
        $("#_370_mf57a_party_identifier").attr("disabled", true);
        $("#_371_mf57a_identifier_code").attr("disabled", true);
        $("#_372_mf57d_party_identifier").attr("disabled", true);
        $("#_373_mf57d_name_and_address").attr("disabled", true);
        $("#_370_mf57A").change(function () {
            if ($("#_370_mf57A").val() == "a") {
                $("#div_mf57a_").show();
                $("#div_mf57d_").hide();
                $("#_370_mf57a_party_identifier").attr("disabled", false);
                $("#_371_mf57a_identifier_code").attr("disabled", false);
                $("#_372_mf57d_party_identifier").attr("disabled", true);
                $("#_373_mf57d_name_and_address").attr("disabled", true);
            } else if ($("#_370_mf57A").val() == "d") {
                $("#div_mf57a_").hide();
                $("#div_mf57d_").show();
                $("#_370_mf57a_party_identifier").attr("disabled", true);
                $("#_371_mf57a_identifier_code").attr("disabled", true);
                $("#_372_mf57d_party_identifier").attr("disabled", false);
                $("#_373_mf57d_name_and_address").attr("disabled", false);
            } else {
                $("#div_mf57a_").hide();
                $("#div_mf57d_").hide();
                $("#_370_mf57a_party_identifier").attr("disabled", true);
                $("#_371_mf57a_identifier_code").attr("disabled", true);
                $("#_372_mf57d_party_identifier").attr("disabled", true);
                $("#_373_mf57d_name_and_address").attr("disabled", true);
            }
        });
//        end of OF57A_a_b_d
//End Of Seq C

//SEQ D
//Chekbox seq D
        $("#check_seq_D").hide();
        $("#_555_of37n_details_of_interest_rate").attr("disabled", true);
        $("#seq_D_checkbox").click(function () {
            if ($("#seq_D_checkbox").is(":checked")) {
                $("#check_seq_D").show();
                $("#_555_of37n_details_of_interest_rate").attr("disabled", false);
            } else {
                $("#check_seq_D").hide();
                $("#_555_of37n_details_of_interest_rate").attr("disabled", true);
            }

        });
//end of Chekbox seq D

//of32HDcheckBox
        $("#check_of32h_SD").hide();
        $("#_547_of32h_amount").attr("disabled", true);
        $("#of32H_amount_to_be_settled_checkbox").click(function () {
            if ($("#of32H_amount_to_be_settled_checkbox").is(":checked")) {
                $("#check_of32h_SD").show();
                $("#_547_of32h_amount").attr("disabled", false);
            } else {
                $("#check_of32h_SD").hide();
                $("#_547_of32h_amount").attr("disabled", true);
            }

        });
//        end of of32HDcheckBox
//        
//        chek of33E
//        
        $("#check_of33e_SD").hide();
        $("#_551_of33e_amount").attr("disabled", true);
        $("#of33e_SD_Currency_Principal_Exchange_Amount").click(function () {
            if ($("#of33e_SD_Currency_Principal_Exchange_Amount").is(":checked")) {
                $("#check_of33e_SD").show();
                $("#_551_of33e_amount").attr("disabled", false);
            } else {
                $("#check_of33e_SD").hide();
                $("#_551_of33e_amount").attr("disabled", true);
            }

        });
//        
//        endchek  of33e
//        
//        end od seq D
//SEQ E
//Chekbox seq E
        $("#check_seq_E").hide();
        $("#_126_of53d_name_address").attr("disabled", true);
        $("#seq_E_checkbox").click(function () {
            if ($("#seq_E_checkbox").is(":checked")) {
                $("#check_seq_E").show();
                $("#_126_of53d_name_address").attr("disabled", false);
            } else {
                $("#check_seq_E").hide();
                $("#_126_of53d_name_address").attr("disabled", true);
            }

        }); //end of Chekbox seq E


//OF53A_a_d_b

        $("#div_of53a_SE").hide();
        $("#div_of53d_SE").hide();
        $("#_590_of53a_party_identifier").attr("disabled", true);
        $("#_591_of53a_identifier_code").attr("disabled", true);
        $("#_595_of53d_party_identifier").attr("disabled", true);
        $("#_596_of53d_name_address").attr("disabled", true);
        $("#type_of53a_SE").change(function () {
            if ($("#type_of53a_SE").val() == "a") {
                $("#div_of53a_SE").show();
                $("#div_of53d_SE").hide();
                $("#_590_of53a_party_identifier").attr("disabled", false);
                $("#_591_of53a_identifier_code").attr("disabled", false);
                $("#_595_of53d_party_identifier").attr("disabled", true);
                $("#_596_of53d_name_address").attr("disabled", true);
                $("#_373_mf57d_name_and_address").attr("disabled", true);
            } else if ($("#type_of53a_SE").val() == "d") {
                $("#div_of53a_SE").hide();
                $("#div_of53d_SE").show();
                $("#_590_of53a_party_identifier").attr("disabled", true);
                $("#_591_of53a_identifier_code").attr("disabled", true);
                $("#_595_of53d_party_identifier").attr("disabled", false);
                $("#_596_of53d_name_address").attr("disabled", false);
            } else {
                $("#div_of53a_SE").hide();
                $("#div_of53d_SE").hide();
                $("#_590_of53a_party_identifier").attr("disabled", true);
                $("#_591_of53a_identifier_code").attr("disabled", true);
                $("#_595_of53d_party_identifier").attr("disabled", true);
                $("#_596_of53d_name_address").attr("disabled", true);
            }
        });
//        end of OF53A_a_d_b

//of56a_a_d_b

        $("#div_of56a_SE").hide();
        $("#div_of56d_SE").hide();
        $("#_560_of56a_party_identifier").attr("disabled", true);
        $("#_561_of56a_identifier_code").attr("disabled", true);
        $("#_562_of56d_party_identifier").attr("disabled", true);
        $("#_563_of56d_name_and_address").attr("disabled", true);
        $("#type_of56a_SE").change(function () {
            if ($("#type_of56a_SE").val() == "a") {
                $("#div_of56a_SE").show();
                $("#div_of56d_SE").hide();
                $("#_560_of56a_party_identifier").attr("disabled", false);
                $("#_561_of56a_identifier_code").attr("disabled", false);
                $("#_562_of56d_party_identifier").attr("disabled", true);
                $("#_563_of56d_name_and_address").attr("disabled", true);
            } else if ($("#type_of56a_SE").val() == "d") {
                $("#div_of56a_SE").hide();
                $("#div_of56d_SE").show();
                $("#_560_of56a_party_identifier").attr("disabled", true);
                $("#_561_of56a_identifier_code").attr("disabled", true);
                $("#_562_of56d_party_identifier").attr("disabled", false);
                $("#_563_of56d_name_and_address").attr("disabled", false);
            } else {
                $("#div_of56a_SE").hide();
                $("#div_of56d_SE").hide();
                $("#_560_of56a_party_identifier").attr("disabled", true);
                $("#_561_of56a_identifier_code").attr("disabled", true);
                $("#_562_of56d_party_identifier").attr("disabled", true);
                $("#_563_of56d_name_and_address").attr("disabled", true);
            }
        });
//end of of56a_a_d_b

//of86a_a_b_d

        $("#div_of86a_SE").hide();
        $("#div_of86b_SE").hide();
        $("#div_of86d_SE").hide();
        $("#_570_of86a_party_identifier").attr("disabled", true);
        $("#_571_of86a_identifier_code").attr("disabled", true);
        $("#_572_of86d_party_identifier").attr("disabled", true);
        $("#_573_of86d_name_and_address").attr("disabled", true);
        $("#type_of86a_SE").change(function () {
            if ($("#type_of86a_SE").val() == "a") {
                $("#div_of86a_SE").show();
                $("#div_of86b_SE").hide();
                $("#div_of86d_SE").hide();
                $("#_570_of86a_party_identifier").attr("disabled", false);
                $("#_571_of86a_identifier_code").attr("disabled", false);
                $("#_572_of86d_party_identifier").attr("disabled", true);
                $("#_573_of86d_name_and_address").attr("disabled", true);
            } else if ($("#type_of86a_SE").val() == "d") {
                $("#div_of86a_SE").hide();
                $("#div_of86b_SE").hide();
                $("#div_of86d_SE").show();
                $("#_570_of86a_party_identifier").attr("disabled", true);
                $("#_571_of86a_identifier_code").attr("disabled", true);
                $("#_572_of86d_party_identifier").attr("disabled", false);
                $("#_573_of86d_name_and_address").attr("disabled", false);
            } else {
                $("#div_of86a_SE").hide();
                $("#div_of86b_SE").hide();
                $("#div_of86d_SE").hide();
                $("#_570_of86a_party_identifier").attr("disabled", true);
                $("#_571_of86a_identifier_code").attr("disabled", true);
                $("#_572_of86d_party_identifier").attr("disabled", true);
                $("#_573_of86d_name_and_address").attr("disabled", true);
            }
        });
//end of of86a_a_b_d

// MF57A_a_b_d
        $("#div_of57a_SE").hide();
        $("#div_of57b_SE").hide();
        $("#div_of57d_SE").hide();
        $("#_580_mf57a_party_identifier").attr("disabled", true);
        $("#_581_mf57a_identifier_code").attr("disabled", true);
        $("#_582_mf57d_party_identifier").attr("disabled", true);
        $("#_583_mf57d_name_and_address").attr("disabled", true);
        $("#type_600_mf57a_SE").change(function () {
            if ($("#type_600_mf57a_SE").val() == "a") {
                $("#div_of57a_SE").show();
                $("#div_of57b_SE").hide();
                $("#div_of57d_SE").hide();
                $("#_580_mf57a_party_identifier").attr("disabled", false);
                $("#_581_mf57a_identifier_code").attr("disabled", false);
                $("#_582_mf57d_party_identifier").attr("disabled", true);
                $("#_583_mf57d_name_and_address").attr("disabled", true)
            } else if ($("#type_600_mf57a_SE").val() == "d") {
                $("#div_of57a_SE").hide();
                $("#div_of57b_SE").hide();
                $("#div_of57d_SE").show();
                $("#_580_mf57a_party_identifier").attr("disabled", true);
                $("#_581_mf57a_identifier_code").attr("disabled", true);
                $("#_582_mf57d_party_identifier").attr("disabled", false);
                $("#_583_mf57d_name_and_address").attr("disabled", false)
            } else {
                $("#div_of57a_SE").hide();
                $("#div_of57b_SE").hide();
                $("#div_of57d_SE").hide();
                $("#_580_mf57a_party_identifier").attr("disabled", true);
                $("#_581_mf57a_identifier_code").attr("disabled", true);
                $("#_582_mf57d_party_identifier").attr("disabled", true);
                $("#_583_mf57d_name_and_address").attr("disabled", true)
            }
        });

//end of MF57A_a_b_d

    });
</script>
