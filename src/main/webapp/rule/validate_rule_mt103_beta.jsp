<%-- 
    Document   : validate_rule_mt103
    Created on : Aug 12, 2012, 2:16:33 PM
    Author     : M Abdul Hadi
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

                //body
                _010_mf20_sender_reference: "required",
                _030_mf23b_bank_code: "required",

                //mf32a
                _060_mf32a_date: "required",
                _061_mf32a_currency: "required",
                _062_mf32a_amount: "required",

                //mf50
                type_mf50_ordering_customer: "required",
                _091_mf50a_identifier_code: "required",
                _093_mf50f_party_identifier: "required",
                _094_mf50f_name_address: "required",
                _106_mf50k_name_address: "required",

                //of52
                _111_of52a_identifier_code: "required",
                _114_of52d_name_address: "required",

                //of53
                _121_of53a_identifier_code: "required",
                _126_of53d_name_address: "required",

                //of54
                _131_of54a_identifier_code: "required",
                _136_of54d_name_address: "required",

                //of55
                _141_of55a_identifier_code: "required",
                _146_of55d_name_address: "required",

                //of56
                _161_of56a_identifier_code: "required",
                _163_of56c_party_identifier: "required",
                _165_of56d_name_address: "required",

                //of57
                _171_of57a_identifier_code: "required",
                _175_of57c_party_identifier: "required",
                _177_of57d_name_address: "required",

                //mf59/59a
                type_of59_59a_: "required",
                _181_mf59_name_address: "required",
                _183_mf59a_identifier_code: "required",
                _186_mf59f_name_address: "required",

                //of71a
                _210_of71a_details_charges: "required"
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_sender_reference: {required: "mf20 harus diisi..!!"},
                _030_mf23b_bank_code: {required: "mf23b_bank_code harus diisi..!!"},
                _060_mf32a_date: {required: "mf32a_date harus diisi..!!"},
                _061_mf32a_currency: {required: "mf32a_currency harus diisi..!!"},
                _062_mf32a_amount: {required: "mf32a_amount harus diisi..!!"},
                type_mf50_ordering_customer: {required: "mf50_ordering_customer harus diisi..!!"},
                _091_mf50a_identifier_code: {required: "mf50a_identifier_code harus diisi..!!"},
                _093_mf50f_party_identifier: {required: "mf50f_party_identifier harus diisi..!!"},
                _094_mf50f_name_address: {required: "mf50f_name_address harus diisi..!!"},
                _106_mf50k_name_address: {required: "mf50k_name_address harus diisi..!!"},
                _111_of52a_identifier_code: {required: "of52a_identifier_code harus diisi..!!"},
                _114_of52d_name_address: {required: "of52d_name_address harus diisi..!!"},
                _121_of53a_identifier_code: {required: "of53a_identifier_code harus diisi..!!"},
                _126_of53d_name_address: {required: "of53d_name_address harus diisi..!!"},
                _131_of54a_identifier_code: {required: "of54a_identifier_code harus diisi..!!"},
                _136_of54d_name_address: {required: "of54d_name_address harus diisi..!!"},
                _141_of55a_identifier_code: {required: "of55a_identifier_code harus diisi..!!"},
                _146_of55d_name_address: {required: "of55d_name_address harus diisi..!!"},
                _161_of56a_identifier_code: {required: "of56a_identifier_code harus diisi..!!"},
                _163_of56c_party_identifier: {required: "of56c_party_identifier harus diisi..!!"},
                _165_of56d_name_address: {required: "of56d_name_address harus diisi..!!"},
                _171_of57a_identifier_code: {required: "of57a_identifier_code harus diisi..!!"},
                _175_of57c_party_identifier: {required: "of57c_party_identifier harus diisi..!!"},
                _177_of57d_name_address: {required: "of57d_name_address harus diisi..!!"},
                type_of59_59a_: {required: "of59_59a harus diisi..!!"},
                _181_mf59_name_address: {required: "mf59_name_address harus diisi..!!"},
                _183_mf59a_identifier_code: {required: "mf59a_identifier_code harus diisi..!!"},
                _186_mf59f_name_address: {required: "mf59_name_address harus diisi..!!"},
                _210_of71a_details_charges: {required: "of71a_details_charges harus diisi..!!"}
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
        //OF71
        $("#_210_of71a_details_charges").change(function () {
            if ($("#_210_of71a_details_charges").val() == "OUR") {
                $("#of71").hide();
                $("#_220_of71f_currency").val('');
                $("#_220_of71f_currency").attr("required", false);
                $("#_221_of71f_amount").val('');
                $("#_221_of71f_amount").attr("required", false);
                $("#_222_of71f_currency").val('');
                $("#_222_of71f_currency").attr("required", false);
                $("#_223_of71f_amount").val('');
                $("#_223_of71f_amount").attr("required", false);
                $("#_224_of71f_currency").val('');
                $("#_224_of71f_currency").attr("required", false);
                $("#_225_of71f_amount").val('');
                $("#_225_of71f_amount").attr("required", false);
                $("#_226_of71f_currency").val('');
                $("#_226_of71f_currency").attr("required", false);
                $("#_227_of71f_amount").val('');
                $("#_227_of71f_amount").attr("required", false);
                $("#_228_of71f_currency").val('');
                $("#_228_of71f_currency").attr("required", false);
                $("#_229_of71f_amount").val('');
                $("#_229_of71f_amount").attr("required", false);
            } else {
                $("#of71").show();
                $("#_220_of71f_currency").attr("disabled", false);
                $("#_221_of71f_amount").attr("disabled", false);
                $("#_222_of71f_currency").attr("disabled", false);
                $("#_223_of71f_amount").attr("disabled", false);
                $("#_224_of71f_currency").attr("disabled", false);
                $("#_225_of71f_amount").attr("disabled", false);
                $("#_226_of71f_currency").attr("disabled", false);
                $("#_227_of71f_amount").attr("disabled", false);
                $("#_228_of71f_currency").attr("disabled", false);
                $("#_229_of71f_amount").attr("disabled", false);
            }
        });

        //of13c
        $("#div_of13c_").hide();
        $("#_022_of13c_code").attr("disabled", true);
        $("#_020_of13c_add").click(function () {
            $("#div_of13c_").show();
            $("#_022_of13c_code").attr("disabled", false);
        });
        $("#_021_of13c_remove").click(function () {
            $("#div_of13c_").hide();
            $("#_022_of13c_code").attr("disabled", true);
        });

        //of23e
        $("#div_of23e_").hide();
        $("#_042_of23e_code").attr("disabled", true);
        $("#_040_of23e_add").click(function () {
            $("#div_of23e_").show();
            $("#_042_of23e_code").attr("disabled", false);
        });
        $("#_041_of23e_remove").click(function () {
            $("#div_of23e_").hide();
            $("#_042_of23e_code").attr("disabled", true);
        });

        //mf50_a_f_k
        $("#div_mf50a_").hide();
        $("#div_mf50f_").hide();
        $("#div_mf50k_").hide();
        $("#_090_mf50a_account").attr("disabled", true);
        $("#_091_mf50a_identifier_code").attr("disabled", true);
        $("#_093_mf50f_party_identifier").attr("disabled", true);
        $("#_094_mf50f_name_address").attr("disabled", true);
        $("#_105_mf50k_account").attr("disabled", true);
        $("#_106_mf50k_name_address").attr("disabled", true);
        $("#type_mf50_ordering_customer").change(function () {
            if ($("#type_mf50_ordering_customer").val() == "a") {
                $("#div_mf50a_").show();
                $("#div_mf50f_").hide();
                $("#div_mf50k_").hide();
                $("#_090_mf50a_account").attr("disabled", false);
                $("#_091_mf50a_identifier_code").attr("disabled", false);
                $("#_093_mf50f_party_identifier").attr("disabled", true);
                $("#_094_mf50f_name_address").attr("disabled", true);
                $("#_105_mf50k_account").attr("disabled", true);
                $("#_106_mf50k_name_address").attr("disabled", true);
            } else if ($("#type_mf50_ordering_customer").val() == "f") {
                $("#div_mf50a_").hide();
                $("#div_mf50f_").show();
                $("#div_mf50k_").hide();
                $("#_090_mf50a_account").attr("disabled", true);
                $("#_091_mf50a_identifier_code").attr("disabled", true);
                $("#_093_mf50f_party_identifier").attr("disabled", false);
                $("#_094_mf50f_name_address").attr("disabled", false);
                $("#_105_mf50k_account").attr("disabled", true);
                $("#_106_mf50k_name_address").attr("disabled", true);
            } else if ($("#type_mf50_ordering_customer").val() == "k") {
                $("#div_mf50a_").hide();
                $("#div_mf50f_").hide();
                $("#div_mf50k_").show();
                $("#_090_mf50a_account").attr("disabled", true);
                $("#_091_mf50a_identifier_code").attr("disabled", true);
                $("#_093_mf50f_party_identifier").attr("disabled", true);
                $("#_094_mf50f_name_address").attr("disabled", true);
                $("#_105_mf50k_account").attr("disabled", false);
                $("#_106_mf50k_name_address").attr("disabled", false);
            } else {
                $("#div_mf50a_").hide();
                $("#div_mf50f_").hide();
                $("#div_mf50k_").hide();
                $("#_090_mf50a_account").attr("disabled", true);
                $("#_091_mf50a_identifier_code").attr("disabled", true);
                $("#_093_mf50f_party_identifier").attr("disabled", true);
                $("#_094_mf50f_name_address").attr("disabled", true);
                $("#_105_mf50k_account").attr("disabled", true);
                $("#_106_mf50k_name_address").attr("disabled", true);
            }
        });

        //of52_a_d
        $("#div_of52a_").hide();
        $("#div_of52d_").hide();
        $("#_110_of52a_party_identifier").attr("disabled", true);
        $("#_111_of52a_identifier_code").attr("disabled", true);
        $("#_113_of52d_party_identifier").attr("disabled", true);
        $("#_114_of52d_name_address").attr("disabled", true);
        $("#type_of52_").change(function () {
            if ($("#type_of52_").val() == "a") {
                $("#div_of52a_").show();
                $("#div_of52d_").hide();
                $("#_110_of52a_party_identifier").attr("disabled", false);
                $("#_111_of52a_identifier_code").attr("disabled", false);
                $("#_113_of52d_party_identifier").attr("disabled", true);
                $("#_114_of52d_name_address").attr("disabled", true);
            } else if ($("#type_of52_").val() == "d") {
                $("#div_of52a_").hide();
                $("#div_of52d_").show();
                $("#_110_of52a_party_identifier").attr("disabled", true);
                $("#_111_of52a_identifier_code").attr("disabled", true);
                $("#_113_of52d_party_identifier").attr("disabled", false);
                $("#_114_of52d_name_address").attr("disabled", false);
            } else {
                $("#div_of52a_").hide();
                $("#div_of52d_").hide();
                $("#_110_of52a_party_identifier").attr("disabled", true);
                $("#_111_of52a_identifier_code").attr("disabled", true);
                $("#_113_of52d_party_identifier").attr("disabled", true);
                $("#_114_of52d_name_address").attr("disabled", true);
            }
        });

        //of53_a_b_d
        $("#div_of53a_").hide();
        $("#div_of53b_").hide();
        $("#div_of53d_").hide();
        $("#_120_of53a_party_identifier").attr("disabled", true);
        $("#_121_of53a_identifier_code").attr("disabled", true);
        $("#_123_of53b_party_identifier").attr("disabled", true);
        $("#_124_of53b_location").attr("disabled", true);
        $("#_125_of53d_party_identifier").attr("disabled", true);
        $("#_126_of53d_name_address").attr("disabled", true);
        $("#type_of53_").change(function () {
            if ($("#type_of53_").val() == "a") {
                $("#div_of53a_").show();
                $("#div_of53b_").hide();
                $("#div_of53d_").hide();
                $("#_120_of53a_party_identifier").attr("disabled", false);
                $("#_121_of53a_identifier_code").attr("disabled", false);
                $("#_123_of53b_party_identifier").attr("disabled", true);
                $("#_124_of53b_location").attr("disabled", true);
                $("#_125_of53d_party_identifier").attr("disabled", true);
                $("#_126_of53d_name_address").attr("disabled", true);
            } else if ($("#type_of53_").val() == "b") {
                $("#div_of53a_").hide();
                $("#div_of53b_").show();
                $("#div_of53d_").hide();
                $("#_120_of53a_party_identifier").attr("disabled", true);
                $("#_121_of53a_identifier_code").attr("disabled", true);
                $("#_123_of53b_party_identifier").attr("disabled", false);
                $("#_124_of53b_location").attr("disabled", false);
                $("#_125_of53d_party_identifier").attr("disabled", true);
                $("#_126_of53d_name_address").attr("disabled", true);
            } else if ($("#type_of53_").val() == "d") {
                $("#div_of53a_").hide();
                $("#div_of53b_").hide();
                $("#div_of53d_").show();
                $("#_120_of53a_party_identifier").attr("disabled", true);
                $("#_121_of53a_identifier_code").attr("disabled", true);
                $("#_123_of53b_party_identifier").attr("disabled", true);
                $("#_124_of53b_location").attr("disabled", true);
                $("#_125_of53d_party_identifier").attr("disabled", false);
                $("#_126_of53d_name_address").attr("disabled", false);
            } else {
                $("#div_of53a_").hide();
                $("#div_of53b_").hide();
                $("#div_of53d_").hide();
                $("#_120_of53a_party_identifier").attr("disabled", true);
                $("#_121_of53a_identifier_code").attr("disabled", true);
                $("#_123_of53b_party_identifier").attr("disabled", true);
                $("#_124_of53b_location").attr("disabled", true);
                $("#_125_of53d_party_identifier").attr("disabled", true);
                $("#_126_of53d_name_address").attr("disabled", true);
            }
        });

        //of54_a_b_d
        $("#div_of54a_").hide();
        $("#div_of54b_").hide();
        $("#div_of54d_").hide();
        $("#_130_of54a_party_identifier").attr("disabled", true);
        $("#_131_of54a_identifier_code").attr("disabled", true);
        $("#_133_of54b_party_identifier").attr("disabled", true);
        $("#_134_of54b_location").attr("disabled", true);
        $("#_135_of54d_party_identifier").attr("disabled", true);
        $("#_136_of54d_name_address").attr("disabled", true);
        $("#type_of54_").change(function () {
            if ($("#type_of54_").val() == "a") {
                $("#div_of54a_").show();
                $("#div_of54b_").hide();
                $("#div_of54d_").hide();
                $("#_130_of54a_party_identifier").attr("disabled", false);
                $("#_131_of54a_identifier_code").attr("disabled", false);
                $("#_133_of54b_party_identifier").attr("disabled", true);
                $("#_134_of54b_location").attr("disabled", true);
                $("#_135_of54d_party_identifier").attr("disabled", true);
                $("#_136_of54d_name_address").attr("disabled", true);
            } else if ($("#type_of54_").val() == "b") {
                $("#div_of54a_").hide();
                $("#div_of54b_").show();
                $("#div_of54d_").hide();
                $("#_130_of54a_party_identifier").attr("disabled", true);
                $("#_131_of54a_identifier_code").attr("disabled", true);
                $("#_133_of54b_party_identifier").attr("disabled", false);
                $("#_134_of54b_location").attr("disabled", false);
                $("#_135_of54d_party_identifier").attr("disabled", true);
                $("#_136_of54d_name_address").attr("disabled", true);
            } else if ($("#type_of54_").val() == "d") {
                $("#div_of54a_").hide();
                $("#div_of54b_").hide();
                $("#div_of54d_").show();
                $("#_130_of54a_party_identifier").attr("disabled", true);
                $("#_131_of54a_identifier_code").attr("disabled", true);
                $("#_133_of54b_party_identifier").attr("disabled", true);
                $("#_134_of54b_location").attr("disabled", true);
                $("#_135_of54d_party_identifier").attr("disabled", false);
                $("#_136_of54d_name_address").attr("disabled", false);
            } else {
                $("#div_of54a_").hide();
                $("#div_of54b_").hide();
                $("#div_of54d_").hide();
                $("#_130_of54a_party_identifier").attr("disabled", true);
                $("#_131_of54a_identifier_code").attr("disabled", true);
                $("#_133_of54b_party_identifier").attr("disabled", true);
                $("#_134_of54b_location").attr("disabled", true);
                $("#_135_of54d_party_identifier").attr("disabled", true);
                $("#_136_of54d_name_address").attr("disabled", true);
            }
        });

        //of55_a_b_d
        $("#div_of55a_").hide();
        $("#div_of55b_").hide();
        $("#div_of55d_").hide();
        $("#_140_of55a_party_identifier").attr("disabled", true);
        $("#_141_of55a_identifier_code").attr("disabled", true);
        $("#_143_of55b_party_identifier").attr("disabled", true);
        $("#_144_of55b_location").attr("disabled", true);
        $("#_145_of55d_party_identifier").attr("disabled", true);
        $("#_146_of55d_name_address").attr("disabled", true);
        $("#type_of55_").change(function () {
            if ($("#type_of55_").val() == "a") {
                $("#div_of55a_").show();
                $("#div_of55b_").hide();
                $("#div_of55d_").hide();
                $("#_140_of55a_party_identifier").attr("disabled", false);
                $("#_141_of55a_identifier_code").attr("disabled", false);
                $("#_143_of55b_party_identifier").attr("disabled", true);
                $("#_144_of55b_location").attr("disabled", true);
                $("#_145_of55d_party_identifier").attr("disabled", true);
                $("#_146_of55d_name_address").attr("disabled", true);
            } else if ($("#type_of55_").val() == "b") {
                $("#div_of55a_").hide();
                $("#div_of55b_").show();
                $("#div_of55d_").hide();
                $("#_140_of55a_party_identifier").attr("disabled", true);
                $("#_141_of55a_identifier_code").attr("disabled", true);
                $("#_143_of55b_party_identifier").attr("disabled", false);
                $("#_144_of55b_location").attr("disabled", false);
                $("#_145_of55d_party_identifier").attr("disabled", true);
                $("#_146_of55d_name_address").attr("disabled", true);
            } else if ($("#type_of55_").val() == "d") {
                $("#div_of55a_").hide();
                $("#div_of55b_").hide();
                $("#div_of55d_").show();
                $("#_140_of55a_party_identifier").attr("disabled", true);
                $("#_141_of55a_identifier_code").attr("disabled", true);
                $("#_143_of55b_party_identifier").attr("disabled", true);
                $("#_144_of55b_location").attr("disabled", true);
                $("#_145_of55d_party_identifier").attr("disabled", false);
                $("#_146_of55d_name_address").attr("disabled", false);
            } else {
                $("#div_of55a_").hide();
                $("#div_of55b_").hide();
                $("#div_of55d_").hide();
                $("#_140_of55a_party_identifier").attr("disabled", true);
                $("#_141_of55a_identifier_code").attr("disabled", true);
                $("#_143_of55b_party_identifier").attr("disabled", true);
                $("#_144_of55b_location").attr("disabled", true);
                $("#_145_of55d_party_identifier").attr("disabled", true);
                $("#_146_of55d_name_address").attr("disabled", true);
            }
        });

        //of56_a_c_d
        $("#div_of56a_").hide();
        $("#div_of56c_").hide();
        $("#div_of56d_").hide();
        $("#_160_of56a_party_identifier").attr("disabled", true);
        $("#_161_of56a_identifier_code").attr("disabled", true);
        $("#_163_of56c_party_identifier").attr("disabled", true);
        $("#_164_of56d_party_identifier").attr("disabled", true);
        $("#_165_of56d_name_address").attr("disabled", true);
        $("#type_of56_").change(function () {
            if ($("#type_of56_").val() == "a") {
                $("#div_of56a_").show();
                $("#div_of56c_").hide();
                $("#div_of56d_").hide();
                $("#_160_of56a_party_identifier").attr("disabled", false);
                $("#_161_of56a_identifier_code").attr("disabled", false);
                $("#_163_of56c_party_identifier").attr("disabled", true);
                $("#_164_of56d_party_identifier").attr("disabled", true);
                $("#_165_of56d_name_address").attr("disabled", true);
            } else if ($("#type_of56_").val() == "c") {
                $("#div_of56a_").hide();
                $("#div_of56c_").show();
                $("#div_of56d_").hide();
                $("#_160_of56a_party_identifier").attr("disabled", true);
                $("#_161_of56a_identifier_code").attr("disabled", true);
                $("#_163_of56c_party_identifier").attr("disabled", false);
                $("#_164_of56d_party_identifier").attr("disabled", true);
                $("#_165_of56d_name_address").attr("disabled", true);
            } else if ($("#type_of56_").val() == "d") {
                $("#div_of56a_").hide();
                $("#div_of56c_").hide();
                $("#div_of56d_").show();
                $("#_160_of56a_party_identifier").attr("disabled", true);
                $("#_161_of56a_identifier_code").attr("disabled", true);
                $("#_163_of56c_party_identifier").attr("disabled", true);
                $("#_164_of56d_party_identifier").attr("disabled", false);
                $("#_165_of56d_name_address").attr("disabled", false);
            } else {
                $("#div_of56a_").hide();
                $("#div_of56c_").hide();
                $("#div_of56d_").hide();
                $("#_160_of56a_party_identifier").attr("disabled", true);
                $("#_161_of56a_identifier_code").attr("disabled", true);
                $("#_163_of56c_party_identifier").attr("disabled", true);
                $("#_164_of56d_party_identifier").attr("disabled", true);
                $("#_165_of56d_name_address").attr("disabled", true);
            }
        });

        //of57_a_b_c_d
        $("#div_of57a_").hide();
        $("#div_of57b_").hide();
        $("#div_of57c_").hide();
        $("#div_of57d_").hide();
        $("#_170_of57a_party_identifier").attr("disabled", true);
        $("#_171_of57a_identifier_code").attr("disabled", true);
        $("#_173_of57b_party_identifier").attr("disabled", true);
        $("#_174_of57b_location").attr("disabled", true);
        $("#_175_of57c_party_identifier").attr("disabled", true);
        $("#_176_of57d_party_identifier").attr("disabled", true);
        $("#_177_of57d_name_address").attr("disabled", true);
        $("#type_of57_").change(function () {
            if ($("#type_of57_").val() == "a") {
                $("#div_of57a_").show();
                $("#div_of57b_").hide();
                $("#div_of57c_").hide();
                $("#div_of57d_").hide();
                $("#_170_of57a_party_identifier").attr("disabled", false);
                $("#_171_of57a_identifier_code").attr("disabled", false);
                $("#_173_of57b_party_identifier").attr("disabled", true);
                $("#_174_of57b_location").attr("disabled", true);
                $("#_175_of57c_party_identifier").attr("disabled", true);
                $("#_176_of57d_party_identifier").attr("disabled", true);
                $("#_177_of57d_name_address").attr("disabled", true);
            } else if ($("#type_of57_").val() == "b") {
                $("#div_of57a_").hide();
                $("#div_of57b_").show();
                $("#div_of57c_").hide();
                $("#div_of57d_").hide();
                $("#_170_of57a_party_identifier").attr("disabled", true);
                $("#_171_of57a_identifier_code").attr("disabled", true);
                $("#_173_of57b_party_identifier").attr("disabled", false);
                $("#_174_of57b_location").attr("disabled", false);
                $("#_175_of57c_party_identifier").attr("disabled", true);
                $("#_176_of57d_party_identifier").attr("disabled", true);
                $("#_177_of57d_name_address").attr("disabled", true);
            } else if ($("#type_of57_").val() == "c") {
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57c_").show();
                $("#div_of57d_").hide();
                $("#_170_of57a_party_identifier").attr("disabled", true);
                $("#_171_of57a_identifier_code").attr("disabled", true);
                $("#_173_of57b_party_identifier").attr("disabled", true);
                $("#_174_of57b_location").attr("disabled", true);
                $("#_175_of57c_party_identifier").attr("disabled", false);
                $("#_176_of57d_party_identifier").attr("disabled", true);
                $("#_177_of57d_name_address").attr("disabled", true);
            } else if ($("#type_of57_").val() == "d") {
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57c_").hide();
                $("#div_of57d_").show();
                $("#_170_of57a_party_identifier").attr("disabled", true);
                $("#_171_of57a_identifier_code").attr("disabled", true);
                $("#_173_of57b_party_identifier").attr("disabled", true);
                $("#_174_of57b_location").attr("disabled", true);
                $("#_175_of57c_party_identifier").attr("disabled", true);
                $("#_176_of57d_party_identifier").attr("disabled", false);
                $("#_177_of57d_name_address").attr("disabled", false);
            } else {
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57c_").hide();
                $("#div_of57d_").hide();
                $("#_170_of57a_party_identifier").attr("disabled", true);
                $("#_171_of57a_identifier_code").attr("disabled", true);
                $("#_173_of57b_party_identifier").attr("disabled", true);
                $("#_174_of57b_location").attr("disabled", true);
                $("#_175_of57c_party_identifier").attr("disabled", true);
                $("#_176_of57d_party_identifier").attr("disabled", true);
                $("#_177_of57d_name_address").attr("disabled", true);
            }
        });

        //mf59_59a
//        $("#div_mf59_").hide();
//        $("#div_mf59a_").hide();
//        $("#div_mf59f_").hide();
//        $("#_180_mf59_account").attr("disabled", true);
//        $("#_181_mf59_name_address").attr("disabled", true);
//        $("#_182_mf59a_account").attr("disabled", true);
//        $("#_183_mf59a_identifier_code").attr("disabled", true);
//        $("#_185_mf59f_account").attr("disabled", true);
//        $("#_186_mf59f_name_address").attr("disabled", true);
//        $("#type_of59_59a_").change(function() {
//            if ( $("#type_of59_59a_").val() == "59"){
//                $("#div_mf59_").show();
//                $("#div_mf59a_").hide();
//                $("#div_mf59f_").hide();
//                $("#_180_mf59_account").attr("disabled", false);
//                $("#_181_mf59_name_address").attr("disabled", false);
//                $("#_182_mf59a_account").attr("disabled", true);
//                $("#_183_mf59a_identifier_code").attr("disabled", true);
//                $("#_185_mf59f_account").attr("disabled", true);
//                $("#_186_mf59f_name_address").attr("disabled", true);
//            } else if ( $("#type_of59_59a_").val() == "59a"){
//                $("#div_mf59_").hide();
//                $("#div_mf59a_").show();
//                $("#div_mf59f_").hide();
//                $("#_180_mf59_account").attr("disabled", true);
//                $("#_181_mf59_name_address").attr("disabled", true);
//                $("#_182_mf59a_account").attr("disabled", false);
//                $("#_183_mf59a_identifier_code").attr("disabled", false);
//                $("#_185_mf59f_account").attr("disabled", true);
//                $("#_186_mf59f_name_address").attr("disabled", true);
//            } else if ( $("#type_of59_59a_").val() == "59f"){
//                $("#div_mf59_").hide();
//                $("#div_mf59a_").hide();
//                $("#div_mf59f_").show();
//                $("#_180_mf59_account").attr("disabled", true);
//                $("#_181_mf59_name_address").attr("disabled", true);
//                $("#_182_mf59a_account").attr("disabled", true);
//                $("#_183_mf59a_identifier_code").attr("disabled", true);
//                $("#_185_mf59f_account").attr("disabled", false);
//                $("#_186_mf59f_name_address").attr("disabled", false);
//            } else{
//                $("#div_mf59_").hide();
//                $("#div_mf59a_").hide();
//                $("#div_mf59f_").hide();
//                $("#_180_mf59_account").attr("disabled", true);
//                $("#_181_mf59_name_address").attr("disabled", true);
//                $("#_182_mf59a_account").attr("disabled", true);
//                $("#_183_mf59a_identifier_code").attr("disabled", true);
//                $("#_185_mf59f_account").attr("disabled", true);
//                $("#_186_mf59f_name_address").attr("disabled", true);
//            }
//        });

        //mf59
        $("#div_mf59_").hide();
        $("#div_mf59a_").hide();
        $("#div_mf59f_").hide();
        $("#div_mf59f_2").hide();
        $("#div_mf59f_3").hide();
        $("#div_mf59f_4").hide();
        $("#_180_mf59_account").attr("disabled", true);
        $("#_181_mf59_name_address").attr("disabled", true);
        $("#_182_mf59a_account").attr("disabled", true);
        $("#_183_mf59a_identifier_code").attr("disabled", true);
        $("#_185_mf59f_account").attr("disabled", true);
        $("#_186_mf59f_number").attr("disabled", true);
        $("#_187_mf59f_details").attr("disabled", true);
        $("#check_mf59f_2").attr("disabled", true);
        $("#check_mf59f_3").attr("disabled", true);
        $("#check_mf59f_4").attr("disabled", true);
        $("#type_of59_59a_").change(function () {
            if ($("#type_of59_59a_").val() == "59") {
                $("#div_mf59_").show();
                $("#div_mf59a_").hide();
                $("#div_mf59f_").hide();
                $("#div_mf59f_2").hide();
                $("#div_mf59f_3").hide();
                $("#div_mf59f_4").hide();
                $("#_180_mf59_account").attr("disabled", false);
                $("#_181_mf59_name_address").attr("disabled", false);
                $("#_182_mf59a_account").attr("disabled", true);
                $("#_183_mf59a_identifier_code").attr("disabled", true);
                $("#_185_mf59f_account").attr("disabled", true);
                $("#_186_mf59f_number").attr("disabled", true);
                $("#_187_mf59f_details").attr("disabled", true);
                $("#check_mf59f_2").attr("disabled", true);
                $("#check_mf59f_3").attr("disabled", true);
                $("#check_mf59f_4").attr("disabled", true);
            } else if ($("#type_of59_59a_").val() == "59a") {
                $("#div_mf59_").hide();
                $("#div_mf59a_").show();
                $("#div_mf59f_").hide();
                $("#div_mf59f_2").hide();
                $("#div_mf59f_3").hide();
                $("#div_mf59f_4").hide();
                $("#_180_mf59_account").attr("disabled", true);
                $("#_181_mf59_name_address").attr("disabled", true);
                $("#_182_mf59a_account").attr("disabled", false);
                $("#_183_mf59a_identifier_code").attr("disabled", false);
                $("#_185_mf59f_account").attr("disabled", true);
                $("#_186_mf59f_number").attr("disabled", true);
                $("#_187_mf59f_details").attr("disabled", true);
                $("#check_mf59f_2").attr("disabled", true);
                $("#check_mf59f_3").attr("disabled", true);
                $("#check_mf59f_4").attr("disabled", true);
            } else if ($("#type_of59_59a_").val() == "59f") {
                $("#div_mf59_").hide();
                $("#div_mf59a_").hide();
                $("#div_mf59f_").show();
                $("#div_mf59f_2").show();
                $("#div_mf59f_3").show();
                $("#div_mf59f_4").show();
                $("#_180_mf59_account").attr("disabled", true);
                $("#_181_mf59_name_address").attr("disabled", true);
                $("#_182_mf59a_account").attr("disabled", true);
                $("#_183_mf59a_identifier_code").attr("disabled", true);
                $("#_185_mf59f_account").attr("disabled", false);
                $("#_186_mf59f_number").attr("disabled", false);
                $("#_187_mf59f_details").attr("disabled", false);
                $("#check_mf59f_2").attr("disabled", false);
                $("#check_mf59f_3").attr("disabled", false);
                $("#check_mf59f_4").attr("disabled", false);
            } else {
                $("#div_mf59_").hide();
                $("#div_mf59a_").hide();
                $("#div_mf59f_").hide();
                $("#div_mf59f_2").hide();
                $("#div_mf59f_3").hide();
                $("#div_mf59f_4").hide();
                $("#_180_mf59_account").attr("disabled", true);
                $("#_181_mf59_name_address").attr("disabled", true);
                $("#_182_mf59a_account").attr("disabled", true);
                $("#_183_mf59a_identifier_code").attr("disabled", true);
                $("#_185_mf59f_account").attr("disabled", true);
                $("#_186_mf59f_number").attr("disabled", true);
                $("#_187_mf59f_details").attr("disabled", true);
                $("#check_mf59f_2").attr("disabled", true);
                $("#check_mf59f_3").attr("disabled", true);
                $("#check_mf59f_4").attr("disabled", true);
            }
        });

        //mf59f_2
        $("#check_mf59f_2").hide();
        $("#_188_mf59f_number").prop("required", false);
        $("#_189_mf59f_details").prop("required", false);
        $("#name_address_checkbox_2").click(function () {
            if ($("#name_address_checkbox_2").is(":checked")) {
                $("#check_mf59f_2").show();
                $("#_188_mf59f_number").prop("required", true);
                $("#_189_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f_2").hide();
                $("#_188_mf59f_number").prop("required", false);
                $("#_189_mf59f_details").prop("required", false);
            }
        });

        //mf59f_3
        $("#check_mf59f_3").hide();
        $("#_190_mf59f_number").prop("required", false);
        $("#_191_mf59f_details").prop("required", false);
        $("#name_address_checkbox_3").click(function () {
            if ($("#name_address_checkbox_3").is(":checked")) {
                $("#check_mf59f_3").show();
                $("#_190_mf59f_number").prop("required", true);
                $("#_191_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f_3").hide();
                $("#_190_mf59f_number").prop("required", false);
                $("#_191_mf59f_details").prop("required", false);
            }
        });

        //mf59f_4
        $("#check_mf59f_4").hide();
        $("#_192_mf59f_number").prop("required", false);
        $("#_193_mf59f_details").prop("required", false);
        $("#name_address_checkbox_4").click(function () {
            if ($("#name_address_checkbox_4").is(":checked")) {
                $("#check_mf59f_4").show();
                $("#_192_mf59f_number").prop("required", true);
                $("#_193_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f_4").hide();
                $("#_192_mf59f_number").prop("required", false);
                $("#_193_mf59f_details").prop("required", false);
            }
        });

//        //of71f
//        $("#div_of71f_sender_charges").hide();
//        $("#_222_of71f_currency").attr("disabled", true);
//        $("#_223_of71f_amount").attr("disabled", true);
//        $("#_210_of71f_sender_charges_add").click(function() {
//            $("#div_of71f_sender_charges").show();
//            $("#_222_of71f_currency").attr("disabled", false);
//            $("#_223_of71f_amount").attr("disabled", false);
//        });
//        $("#_211_of71f_sender_charges_remove").click(function() {
//            $("#div_of71f_sender_charges").hide();
//            $("#_222_of71f_currency").attr("disabled", true);
//            $("#_223_of71f_amount").attr("disabled", true);
//        });

        //of71f_1
        $("#check_of71f_1").hide();
        $("#_220_of71f_currency").prop("required", false);
        $("#_221_of71f_amount").prop("required", false);
        $("#sender_chargers_1_checkbox").click(function () {
            if ($("#sender_chargers_1_checkbox").is(":checked")) {
                $("#check_of71f_1").show();
                $("#_220_of71f_currency").prop("required", true);
                $("#_221_of71f_amount").prop("required", true);
            } else {
                $("#check_of71f_1").hide();
                $("#_220_of71f_currency").prop("required", false);
                $("#_221_of71f_amount").prop("required", false);
            }
        });

        //of71f_2
        $("#check_of71f_2").hide();
        $("#_222_of71f_currency").prop("required", false);
        $("#_223_of71f_amount").prop("required", false);
        $("#sender_chargers_2_checkbox").click(function () {
            if ($("#sender_chargers_2_checkbox").is(":checked")) {
                $("#check_of71f_2").show();
                $("#_222_of71f_currency").prop("required", true);
                $("#_223_of71f_amount").prop("required", true);
            } else {
                $("#check_of71f_2").hide();
                $("#_222_of71f_currency").prop("required", false);
                $("#_223_of71f_amount").prop("required", false);
            }
        });

        //of71f_3
        $("#check_of71f_3").hide();
        $("#_224_of71f_currency").prop("required", false);
        $("#_225_of71f_amount").prop("required", false);
        $("#sender_chargers_3_checkbox").click(function () {
            if ($("#sender_chargers_3_checkbox").is(":checked")) {
                $("#check_of71f_3").show();
                $("#_224_of71f_currency").prop("required", true);
                $("#_225_of71f_amount").prop("required", true);
            } else {
                $("#check_of71f_3").hide();
                $("#_224_of71f_currency").prop("required", false);
                $("#_225_of71f_amount").prop("required", false);
            }
        });

        //of71f_4
        $("#check_of71f_4").hide();
        $("#_226_of71f_currency").prop("required", false);
        $("#_227_of71f_amount").prop("required", false);
        $("#sender_chargers_4_checkbox").click(function () {
            if ($("#sender_chargers_4_checkbox").is(":checked")) {
                $("#check_of71f_4").show();
                $("#_226_of71f_currency").prop("required", true);
                $("#_227_of71f_amount").prop("required", true);
            } else {
                $("#check_of71f_4").hide();
                $("#_226_of71f_currency").prop("required", false);
                $("#_227_of71f_amount").prop("required", false);
            }
        });

        //of71f_5
        $("#check_of71f_5").hide();
        $("#_228_of71f_currency").prop("required", false);
        $("#_229_of71f_amount").prop("required", false);
        $("#sender_chargers_5_checkbox").click(function () {
            if ($("#sender_chargers_5_checkbox").is(":checked")) {
                $("#check_of71f_5").show();
                $("#_228_of71f_currency").prop("required", true);
                $("#_229_of71f_amount").prop("required", true);
            } else {
                $("#check_of71f_5").hide();
                $("#_228_of71f_currency").prop("required", false);
                $("#_229_of71f_amount").prop("required", false);
            }
        });
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function () {
        //OF71
        if ($("#_210_of71a_details_charges").val() == "OUR") {
            $("#of71").hide();
            $("#_220_of71f_currency").attr("disabled", true);
            $("#_221_of71f_amount").attr("disabled", true);
            $("#_222_of71f_currency").attr("disabled", true);
            $("#_223_of71f_amount").attr("disabled", true);
            $("#_224_of71f_currency").attr("disabled", true);
            $("#_225_of71f_amount").attr("disabled", true);
            $("#_226_of71f_currency").attr("disabled", true);
            $("#_227_of71f_amount").attr("disabled", true);
            $("#_228_of71f_currency").attr("disabled", true);
            $("#_229_of71f_amount").attr("disabled", true);
        } else {
            $("#of71").show();
            $("#_220_of71f_currency").attr("disabled", false);
            $("#_221_of71f_amount").attr("disabled", false);
            $("#_222_of71f_currency").attr("disabled", false);
            $("#_223_of71f_amount").attr("disabled", false);
            $("#_224_of71f_currency").attr("disabled", false);
            $("#_225_of71f_amount").attr("disabled", false);
            $("#_226_of71f_currency").attr("disabled", false);
            $("#_227_of71f_amount").attr("disabled", false);
            $("#_228_of71f_currency").attr("disabled", false);
            $("#_229_of71f_amount").attr("disabled", false);
        }

        //of13c
        if ($("#_022_of13c_code").val() != "") {
            $("#div_of13c_").show();
            $("#_022_of13c_code").attr("disabled", false);
        } else {
            $("#div_of13c_").hide();
            $("#_022_of13c_code").attr("disabled", true);
        }

        //of23e
        if ($("#_042_of23e_code").val() != "") {
            $("#div_of23e_").show();
            $("#_042_of23e_code").attr("disabled", false);
        } else {
            $("#div_of23e_").hide();
            $("#_042_of23e_code").attr("disabled", true);
        }

        //mf50_a_f_k
        if ($("#_090_mf50a_account").val() != "" || $("#_091_mf50a_identifier_code").val() != "") {
            $("#type_mf50_ordering_customer").val("a").attr("selected", true);
            $("#div_mf50a_").show();
            $("#div_mf50f_").hide();
            $("#div_mf50k_").hide();
            $("#_090_mf50a_account").attr("disabled", false);
            $("#_091_mf50a_identifier_code").attr("disabled", false);
            $("#_093_mf50f_party_identifier").attr("disabled", true);
            $("#_094_mf50f_name_address").attr("disabled", true);
            $("#_105_mf50k_account").attr("disabled", true);
            $("#_106_mf50k_name_address").attr("disabled", true);
        } else if ($("#_093_mf50f_party_identifier").val() != "" || $("#_094_mf50f_name_address").val() != "") {
            $("#type_mf50_ordering_customer").val("f").attr("selected", true);
            $("#div_mf50a_").hide();
            $("#div_mf50f_").show();
            $("#div_mf50k_").hide();
            $("#_090_mf50a_account").attr("disabled", true);
            $("#_091_mf50a_identifier_code").attr("disabled", true);
            $("#_093_mf50f_party_identifier").attr("disabled", false);
            $("#_094_mf50f_name_address").attr("disabled", false);
            $("#_105_mf50k_account").attr("disabled", true);
            $("#_106_mf50k_name_address").attr("disabled", true);
        } else if ($("#_105_mf50k_account").val() != "" || $("#_106_mf50k_name_address").val() != "") {
            $("#type_mf50_ordering_customer").val("k").attr("selected", true);
            $("#div_mf50a_").hide();
            $("#div_mf50f_").hide();
            $("#div_mf50k_").show();
            $("#_090_mf50a_account").attr("disabled", true);
            $("#_091_mf50a_identifier_code").attr("disabled", true);
            $("#_093_mf50f_party_identifier").attr("disabled", true);
            $("#_094_mf50f_name_address").attr("disabled", true);
            $("#_105_mf50k_account").attr("disabled", false);
            $("#_106_mf50k_name_address").attr("disabled", false);
        } else {
            $("#div_mf50a_").hide();
            $("#div_mf50f_").hide();
            $("#div_mf50k_").hide();
            $("#_090_mf50a_account").attr("disabled", true);
            $("#_091_mf50a_identifier_code").attr("disabled", true);
            $("#_093_mf50f_party_identifier").attr("disabled", true);
            $("#_094_mf50f_name_address").attr("disabled", true);
            $("#_105_mf50k_account").attr("disabled", true);
            $("#_106_mf50k_name_address").attr("disabled", true);
        }

        //of52_a_d
        if ($("#_110_of52a_party_identifier").val() != "" || $("#_111_of52a_identifier_code").val() != "") {
            $("#type_of52_").val("a").attr("selected", true);
            $("#div_of52a_").show();
            $("#div_of52d_").hide();
            $("#_110_of52a_party_identifier").attr("disabled", false);
            $("#_111_of52a_identifier_code").attr("disabled", false);
            $("#_113_of52d_party_identifier").attr("disabled", true);
            $("#_114_of52d_name_address").attr("disabled", true);
        } else if ($("#_113_of52d_party_identifier").val() != "" || $("#_114_of52d_name_address").val() != "") {
            $("#type_of52_").val("d").attr("selected", true);
            $("#div_of52a_").hide();
            $("#div_of52d_").show();
            $("#_110_of52a_party_identifier").attr("disabled", true);
            $("#_111_of52a_identifier_code").attr("disabled", true);
            $("#_113_of52d_party_identifier").attr("disabled", false);
            $("#_114_of52d_name_address").attr("disabled", false);
        } else {
            $("#div_of52a_").hide();
            $("#div_of52d_").hide();
            $("#_110_of52a_party_identifier").attr("disabled", true);
            $("#_111_of52a_identifier_code").attr("disabled", true);
            $("#_113_of52d_party_identifier").attr("disabled", true);
            $("#_114_of52d_name_address").attr("disabled", true);
        }

        //of53_a_b_d
        if ($("#_120_of53a_party_identifier").val() != "" || $("#_121_of53a_identifier_code").val() != "") {
            $("#type_of53_").val("a").attr("selected", true);
            $("#div_of53a_").show();
            $("#div_of53b_").hide();
            $("#div_of53d_").hide();
            $("#_120_of53a_party_identifier").attr("disabled", false);
            $("#_121_of53a_identifier_code").attr("disabled", false);
            $("#_123_of53b_party_identifier").attr("disabled", true);
            $("#_124_of53b_location").attr("disabled", true);
            $("#_125_of53d_party_identifier").attr("disabled", true);
            $("#_126_of53d_name_address").attr("disabled", true);
        } else if ($("#_123_of53b_party_identifier").val() != "" || $("#_121_of53a_identifier_code").val() != "") {
            $("#type_of53_").val("b").attr("selected", true);
            $("#div_of53a_").hide();
            $("#div_of53b_").show();
            $("#div_of53d_").hide();
            $("#_120_of53a_party_identifier").attr("disabled", true);
            $("#_121_of53a_identifier_code").attr("disabled", true);
            $("#_123_of53b_party_identifier").attr("disabled", false);
            $("#_124_of53b_location").attr("disabled", false);
            $("#_125_of53d_party_identifier").attr("disabled", true);
            $("#_126_of53d_name_address").attr("disabled", true);
        } else if ($("#_125_of53d_party_identifier").val() != "" || $("#_126_of53d_name_address").val() != "") {
            $("#type_of53_").val("d").attr("selected", true);
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#div_of53d_").show();
            $("#_120_of53a_party_identifier").attr("disabled", true);
            $("#_121_of53a_identifier_code").attr("disabled", true);
            $("#_123_of53b_party_identifier").attr("disabled", true);
            $("#_124_of53b_location").attr("disabled", true);
            $("#_125_of53d_party_identifier").attr("disabled", false);
            $("#_126_of53d_name_address").attr("disabled", false);
        } else {
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#div_of53d_").hide();
            $("#_120_of53a_party_identifier").attr("disabled", true);
            $("#_121_of53a_identifier_code").attr("disabled", true);
            $("#_123_of53b_party_identifier").attr("disabled", true);
            $("#_124_of53b_location").attr("disabled", true);
            $("#_125_of53d_party_identifier").attr("disabled", true);
            $("#_126_of53d_name_address").attr("disabled", true);
        }

        //of54_a_b_d
        if ($("#_130_of54a_party_identifier").val() != "" || $("#_131_of54a_identifier_code").val() != "") {
            $("#type_of54_").val("a").attr("selected", true);
            $("#div_of54a_").show();
            $("#div_of54b_").hide();
            $("#div_of54d_").hide();
            $("#_130_of54a_party_identifier").attr("disabled", false);
            $("#_131_of54a_identifier_code").attr("disabled", false);
            $("#_133_of54b_party_identifier").attr("disabled", true);
            $("#_134_of54b_location").attr("disabled", true);
            $("#_135_of54d_party_identifier").attr("disabled", true);
            $("#_136_of54d_name_address").attr("disabled", true);
        } else if ($("#_133_of54b_party_identifier").val() != "" || $("#_134_of54b_location").val() != "") {
            $("#type_of54_").val("b").attr("selected", true);
            $("#div_of54a_").hide();
            $("#div_of54b_").show();
            $("#div_of54d_").hide();
            $("#_130_of54a_party_identifier").attr("disabled", true);
            $("#_131_of54a_identifier_code").attr("disabled", true);
            $("#_133_of54b_party_identifier").attr("disabled", false);
            $("#_134_of54b_location").attr("disabled", false);
            $("#_135_of54d_party_identifier").attr("disabled", true);
            $("#_136_of54d_name_address").attr("disabled", true);
        } else if ($("#_135_of54d_party_identifier").val() != "" || $("#_136_of54d_name_address").val() != "") {
            $("#type_of54_").val("d").attr("selected", true);
            $("#div_of54a_").hide();
            $("#div_of54b_").hide();
            $("#div_of54d_").show();
            $("#_130_of54a_party_identifier").attr("disabled", true);
            $("#_131_of54a_identifier_code").attr("disabled", true);
            $("#_133_of54b_party_identifier").attr("disabled", true);
            $("#_134_of54b_location").attr("disabled", true);
            $("#_135_of54d_party_identifier").attr("disabled", false);
            $("#_136_of54d_name_address").attr("disabled", false);
        } else {
            $("#div_of54a_").hide();
            $("#div_of54b_").hide();
            $("#div_of54d_").hide();
            $("#_130_of54a_party_identifier").attr("disabled", true);
            $("#_131_of54a_identifier_code").attr("disabled", true);
            $("#_133_of54b_party_identifier").attr("disabled", true);
            $("#_134_of54b_location").attr("disabled", true);
            $("#_135_of54d_party_identifier").attr("disabled", true);
            $("#_136_of54d_name_address").attr("disabled", true);
        }

        //of55_a_b_d
        if ($("#_140_of55a_party_identifier").val() != "" || $("#_141_of55a_identifier_code").val() != "") {
            $("#type_of55_").val("a").attr("selected", true);
            $("#div_of55a_").show();
            $("#div_of55b_").hide();
            $("#div_of55d_").hide();
            $("#_140_of55a_party_identifier").attr("disabled", false);
            $("#_141_of55a_identifier_code").attr("disabled", false);
            $("#_143_of55b_party_identifier").attr("disabled", true);
            $("#_144_of55b_location").attr("disabled", true);
            $("#_145_of55d_party_identifier").attr("disabled", true);
            $("#_146_of55d_name_address").attr("disabled", true);
        } else if ($("#_143_of55b_party_identifier").val() != "" || $("#_144_of55b_location").val() != "") {
            $("#type_of55_").val("b").attr("selected", true);
            $("#div_of55a_").hide();
            $("#div_of55b_").show();
            $("#div_of55d_").hide();
            $("#_140_of55a_party_identifier").attr("disabled", true);
            $("#_141_of55a_identifier_code").attr("disabled", true);
            $("#_143_of55b_party_identifier").attr("disabled", false);
            $("#_144_of55b_location").attr("disabled", false);
            $("#_145_of55d_party_identifier").attr("disabled", true);
            $("#_146_of55d_name_address").attr("disabled", true);
        } else if ($("#_145_of55d_party_identifier").val() != "" || $("#_146_of55d_name_address").val() != "") {
            $("#type_of55_").val("d").attr("selected", true);
            $("#div_of55a_").hide();
            $("#div_of55b_").hide();
            $("#div_of55d_").show();
            $("#_140_of55a_party_identifier").attr("disabled", true);
            $("#_141_of55a_identifier_code").attr("disabled", true);
            $("#_143_of55b_party_identifier").attr("disabled", true);
            $("#_144_of55b_location").attr("disabled", true);
            $("#_145_of55d_party_identifier").attr("disabled", false);
            $("#_146_of55d_name_address").attr("disabled", false);
        } else {
            $("#div_of55a_").hide();
            $("#div_of55b_").hide();
            $("#div_of55d_").hide();
            $("#_140_of55a_party_identifier").attr("disabled", true);
            $("#_141_of55a_identifier_code").attr("disabled", true);
            $("#_143_of55b_party_identifier").attr("disabled", true);
            $("#_144_of55b_location").attr("disabled", true);
            $("#_145_of55d_party_identifier").attr("disabled", true);
            $("#_146_of55d_name_address").attr("disabled", true);
        }

        //of56_a_c_d
        if ($("#_160_of56a_party_identifier").val() != "" || $("#_161_of56a_identifier_code").val() != "") {
            $("#type_of56_").val("a").attr("selected", true);
            $("#div_of56a_").show();
            $("#div_of56c_").hide();
            $("#div_of56d_").hide();
            $("#_160_of56a_party_identifier").attr("disabled", false);
            $("#_161_of56a_identifier_code").attr("disabled", false);
            $("#_163_of56c_party_identifier").attr("disabled", true);
            $("#_164_of56d_party_identifier").attr("disabled", true);
            $("#_165_of56d_name_address").attr("disabled", true);
        } else if ($("#_163_of56c_party_identifier").val() != "") {
            $("#type_of56_").val("c").attr("selected", true);
            $("#div_of56a_").hide();
            $("#div_of56c_").show();
            $("#div_of56d_").hide();
            $("#_160_of56a_party_identifier").attr("disabled", true);
            $("#_161_of56a_identifier_code").attr("disabled", true);
            $("#_163_of56c_party_identifier").attr("disabled", false);
            $("#_164_of56d_party_identifier").attr("disabled", true);
            $("#_165_of56d_name_address").attr("disabled", true);
        } else if ($("#_164_of56d_party_identifier").val() != "" || $("#_165_of56d_name_address").val() != "") {
            $("#type_of56_").val("d").attr("selected", true);
            $("#div_of56a_").hide();
            $("#div_of56c_").hide();
            $("#div_of56d_").show();
            $("#_160_of56a_party_identifier").attr("disabled", true);
            $("#_161_of56a_identifier_code").attr("disabled", true);
            $("#_163_of56c_party_identifier").attr("disabled", true);
            $("#_164_of56d_party_identifier").attr("disabled", false);
            $("#_165_of56d_name_address").attr("disabled", false);
        } else {
            $("#div_of56a_").hide();
            $("#div_of56c_").hide();
            $("#div_of56d_").hide();
            $("#_160_of56a_party_identifier").attr("disabled", true);
            $("#_161_of56a_identifier_code").attr("disabled", true);
            $("#_163_of56c_party_identifier").attr("disabled", true);
            $("#_164_of56d_party_identifier").attr("disabled", true);
            $("#_165_of56d_name_address").attr("disabled", true);
        }

        //of57_a_b_c_d
        if ($("#_170_of57a_party_identifier").val() != "" || $("#_171_of57a_identifier_code").val() != "") {
            $("#type_of57_").val("a").attr("selected", true);
            $("#div_of57a_").show();
            $("#div_of57b_").hide();
            $("#div_of57c_").hide();
            $("#div_of57d_").hide();
            $("#_170_of57a_party_identifier").attr("disabled", false);
            $("#_171_of57a_identifier_code").attr("disabled", false);
            $("#_173_of57b_party_identifier").attr("disabled", true);
            $("#_174_of57b_location").attr("disabled", true);
            $("#_175_of57c_party_identifier").attr("disabled", true);
            $("#_176_of57d_party_identifier").attr("disabled", true);
            $("#_177_of57d_name_address").attr("disabled", true);
        } else if ($("#_173_of57b_party_identifier").val() != "" || $("#_174_of57b_location").val() != "") {
            $("#type_of57_").val("b").attr("selected", true);
            $("#div_of57a_").hide();
            $("#div_of57b_").show();
            $("#div_of57c_").hide();
            $("#div_of57d_").hide();
            $("#_170_of57a_party_identifier").attr("disabled", true);
            $("#_171_of57a_identifier_code").attr("disabled", true);
            $("#_173_of57b_party_identifier").attr("disabled", false);
            $("#_174_of57b_location").attr("disabled", false);
            $("#_175_of57c_party_identifier").attr("disabled", true);
            $("#_176_of57d_party_identifier").attr("disabled", true);
            $("#_177_of57d_name_address").attr("disabled", true);
        } else if ($("#_175_of57c_party_identifier").val() != "") {
            $("#type_of57_").val("c").attr("selected", true);
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57c_").show();
            $("#div_of57d_").hide();
            $("#_170_of57a_party_identifier").attr("disabled", true);
            $("#_171_of57a_identifier_code").attr("disabled", true);
            $("#_173_of57b_party_identifier").attr("disabled", true);
            $("#_174_of57b_location").attr("disabled", true);
            $("#_175_of57c_party_identifier").attr("disabled", false);
            $("#_176_of57d_party_identifier").attr("disabled", true);
            $("#_177_of57d_name_address").attr("disabled", true);
        } else if ($("#_176_of57d_party_identifier").val() != "" || $("#_177_of57d_name_address").val() != "") {
            $("#type_of57_").val("d").attr("selected", true);
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57c_").hide();
            $("#div_of57d_").show();
            $("#_170_of57a_party_identifier").attr("disabled", true);
            $("#_171_of57a_identifier_code").attr("disabled", true);
            $("#_173_of57b_party_identifier").attr("disabled", true);
            $("#_174_of57b_location").attr("disabled", true);
            $("#_175_of57c_party_identifier").attr("disabled", true);
            $("#_176_of57d_party_identifier").attr("disabled", false);
            $("#_177_of57d_name_address").attr("disabled", false);
        } else {
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57c_").hide();
            $("#div_of57d_").hide();
            $("#_170_of57a_party_identifier").attr("disabled", true);
            $("#_171_of57a_identifier_code").attr("disabled", true);
            $("#_173_of57b_party_identifier").attr("disabled", true);
            $("#_174_of57b_location").attr("disabled", true);
            $("#_175_of57c_party_identifier").attr("disabled", true);
            $("#_176_of57d_party_identifier").attr("disabled", true);
            $("#_177_of57d_name_address").attr("disabled", true);
        }

        //mf59_59a
//        if ($("#_180_mf59_account").val() != "" || $("#_181_mf59_name_address").val() != "") {
//            $("#type_of59_59a_").val("59").attr("selected", true);
//            $("#div_mf59_").show();
//            $("#div_mf59a_").hide();
//            $("#div_mf59f_").hide();
//            $("#_180_mf59_account").attr("disabled", false);
//            $("#_181_mf59_name_address").attr("disabled", false);
//            $("#_182_mf59a_account").attr("disabled", true);
//            $("#_183_mf59a_identifier_code").attr("disabled", true);
//            $("#_185_mf59f_account").attr("disabled", true);
//            $("#_186_mf59f_name_address").attr("disabled", true);
//        } else if ($("#_182_mf59a_account").val() != "" || $("#_183_mf59a_identifier_code").val() != "") {
//            $("#type_of59_59a_").val("59a").attr("selected", true);
//            $("#div_mf59_").hide();
//            $("#div_mf59a_").show();
//            $("#div_mf59f_").hide();
//            $("#_180_mf59_account").attr("disabled", true);
//            $("#_181_mf59_name_address").attr("disabled", true);
//            $("#_182_mf59a_account").attr("disabled", false);
//            $("#_183_mf59a_identifier_code").attr("disabled", false);
//            $("#_185_mf59f_account").attr("disabled", true);
//            $("#_186_mf59f_name_address").attr("disabled", true);
//        } else if ($("#_185_mf59f_account").val() != "" || $("#_186_mf59f_name_address").val() != "") {
//            $("#type_of59_59a_").val("59f").attr("selected", true);
//            $("#div_mf59_").hide();
//            $("#div_mf59a_").hide();
//            $("#div_mf59f_").show();
//            $("#_180_mf59_account").attr("disabled", true);
//            $("#_181_mf59_name_address").attr("disabled", true);
//            $("#_182_mf59a_account").attr("disabled", true);
//            $("#_183_mf59a_identifier_code").attr("disabled", true);
//            $("#_185_mf59f_account").attr("disabled", false);
//            $("#_186_mf59f_name_address").attr("disabled", false);
//        } else {
//            $("#div_mf59_").hide();
//            $("#div_mf59a_").hide();
//            $("#div_mf59f_").hide();
//            $("#_180_mf59_account").attr("disabled", true);
//            $("#_181_mf59_name_address").attr("disabled", true);
//            $("#_182_mf59a_account").attr("disabled", true);
//            $("#_183_mf59a_identifier_code").attr("disabled", true);
//            $("#_185_mf59f_account").attr("disabled", true);
//            $("#_186_mf59f_name_address").attr("disabled", true);
//        }
        //mf59_59a
        if ($("#_180_mf59_account").val() != "" || $("#_181_mf59_name_address").val() != "") {
            $("#type_of59_59a_").val("59").attr("selected", true);
            $("#div_mf59_").show();
            $("#div_mf59a_").hide();
            $("#div_mf59f_").hide();
            $("#div_mf59f_2").hide();
            $("#div_mf59f_3").hide();
            $("#div_mf59f_4").hide();
            $("#_180_mf59_account").attr("disabled", false);
            $("#_181_mf59_name_address").attr("disabled", false);
            $("#_182_mf59a_account").attr("disabled", true);
            $("#_183_mf59a_identifier_code").attr("disabled", true);
            $("#_185_mf59f_account").attr("disabled", true);
            $("#_186_mf59f_number").attr("disabled", true);
            $("#_187_mf59f_details").attr("disabled", true);
            $("#check_mf59f_2").attr("disabled", true);
            $("#check_mf59f_3").attr("disabled", true);
            $("#check_mf59f_4").attr("disabled", true);
        } else if ($("#_182_mf59a_account").val() != "" || $("#_183_mf59a_identifier_code").val() != "") {
            $("#type_of59_59a_").val("59a").attr("selected", true);
            $("#div_mf59_").hide();
            $("#div_mf59a_").show();
            $("#div_mf59f_").hide();
            $("#div_mf59f_2").hide();
            $("#div_mf59f_3").hide();
            $("#div_mf59f_4").hide();
            $("#_180_mf59_account").attr("disabled", true);
            $("#_181_mf59_name_address").attr("disabled", true);
            $("#_182_mf59a_account").attr("disabled", false);
            $("#_183_mf59a_identifier_code").attr("disabled", false);
            $("#_185_mf59f_account").attr("disabled", true);
            $("#_186_mf59f_number").attr("disabled", true);
            $("#_187_mf59f_details").attr("disabled", true);
            $("#check_mf59f_2").attr("disabled", true);
            $("#check_mf59f_3").attr("disabled", true);
            $("#check_mf59f_4").attr("disabled", true);
        } else if ($("#_186_mf59f_number").val() != "" || $("#_187_mf59f_details").val() != "") {
            $("#type_of59_59a_").val("59f").attr("selected", true);
            $("#div_mf59_").hide();
            $("#div_mf59a_").hide();
            $("#div_mf59f_").show();
            $("#div_mf59f_2").show();
            $("#div_mf59f_3").show();
            $("#div_mf59f_4").show();
            $("#_180_mf59_account").attr("disabled", true);
            $("#_181_mf59_name_address").attr("disabled", true);
            $("#_182_mf59a_account").attr("disabled", true);
            $("#_183_mf59a_identifier_code").attr("disabled", true);
            $("#_185_mf59f_account").attr("disabled", false);
            $("#_186_mf59f_number").attr("disabled", false);
            $("#_187_mf59f_details").attr("disabled", false);
            $("#check_mf59f_2").attr("disabled", false);
            $("#check_mf59f_3").attr("disabled", false);
            $("#check_mf59f_4").attr("disabled", false);
        } else {
            $("#div_mf59_").hide();
            $("#div_mf59a_").hide();
            $("#div_mf59f_").hide();
            $("#div_mf59f_2").hide();
            $("#div_mf59f_3").hide();
            $("#div_mf59f_4").hide();
            $("#_180_mf59_account").attr("disabled", true);
            $("#_181_mf59_name_address").attr("disabled", true);
            $("#_182_mf59a_account").attr("disabled", true);
            $("#_183_mf59a_identifier_code").attr("disabled", true);
            $("#_185_mf59f_account").attr("disabled", true);
            $("#_186_mf59f_number").attr("disabled", true);
            $("#_187_mf59f_details").attr("disabled", true);
            $("#check_mf59f_2").attr("disabled", true);
            $("#check_mf59f_3").attr("disabled", true);
            $("#check_mf59f_4").attr("disabled", true);
        }

        //mf59f_2
        if ($("#_188_mf59f_number").val() != "" || $("#_189_mf59f_details").val() != "") {
            $("#name_address_checkbox_2").prop("checked", true);
            $("#check_mf59f_2").show();
            $("#_188_mf59f_number").prop("required", true);
            $("#_189_mf59f_details").prop("required", true);
        } else {
            $("#check_mf59f_2").hide();
            $("#_188_mf59f_number").prop("required", false);
            $("#_189_mf59f_details").prop("required", false);
        }

        //mf59f_3
        if ($("#_190_mf59f_number").val() != "" || $("#_191_mf59f_details").val() != "") {
            $("#name_address_checkbox_3").prop("checked", true);
            $("#check_mf59f_3").show();
            $("#_190_mf59f_number").prop("required", true);
            $("#_191_mf59f_details").prop("required", true);
        } else {
            $("#check_mf59f_3").hide();
            $("#_190_mf59f_number").prop("required", false);
            $("#_191_mf59f_details").prop("required", false);
        }

        //mf59f_4
        if ($("#_192_mf59f_number").val() != "" || $("#_193_mf59f_details").val() != "") {
            $("#name_address_checkbox_4").prop("checked", true);
            $("#check_mf59f_4").show();
            $("#_192_mf59f_number").prop("required", true);
            $("#_193_mf59f_details").prop("required", true);
        } else {
            $("#check_mf59f_4").hide();
            $("#_192_mf59f_number").prop("required", false);
            $("#_193_mf59f_details").prop("required", false);
        }
//        //of71f
//        if ($("#_222_of71f_currency").val() != "" || $("#_223_of71f_amount").val() != ""){
//            $("#div_of71f_sender_charges").show();
//            $("#_222_of71f_currency").attr("disabled", false);
//            $("#_223_of71f_amount").attr("disabled", false);
//        }else{
//            $("#div_of71f_sender_charges").hide();
//            $("#_222_of71f_currency").attr("disabled", true);
//            $("#_223_of71f_amount").attr("disabled", true);
//        }

        //of71f_1
        if ($("#_220_of71f_currency").val() != "" || $("#_221_of71f_amount").val() != "") {
            $("#sender_chargers_1_checkbox").prop("checked", true);
            $("#check_of71f_1").show();
            $("#_220_of71f_currency").prop("required", true);
            $("#_221_of71f_amount").prop("required", true);
        } else {
            $("#check_of71f_1").hide();
            $("#_220_of71f_currency").prop("required", false);
            $("#_221_of71f_amount").prop("required", false);
        }

        //of71f_2
        if ($("#_222_of71f_currency").val() != "" || $("#_223_of71f_amount").val() != "") {
            $("#sender_chargers_2_checkbox").prop("checked", true);
            $("#check_of71f_2").show();
            $("#_222_of71f_currency").prop("required", true);
            $("#_223_of71f_amount").prop("required", true);
        } else {
            $("#check_of71f_2").hide();
            $("#_222_of71f_currency").prop("required", false);
            $("#_223_of71f_amount").prop("required", false);
        }

        //of71f_3
        if ($("#_224_of71f_currency").val() != "" || $("#_225_of71f_amount").val() != "") {
            $("#sender_chargers_3_checkbox").prop("checked", true);
            $("#check_of71f_3").show();
            $("#_224_of71f_currency").prop("required", true);
            $("#_225_of71f_amount").prop("required", true);
        } else {
            $("#check_of71f_3").hide();
            $("#_224_of71f_currency").prop("required", false);
            $("#_225_of71f_amount").prop("required", false);
        }

        //of71f_4
        if ($("#_226_of71f_currency").val() != "" || $("#_227_of71f_amount").val() != "") {
            $("#sender_chargers_4_checkbox").prop("checked", true);
            $("#check_of71f_4").show();
            $("#_226_of71f_currency").prop("required", true);
            $("#_227_of71f_amount").prop("required", true);
        } else {
            $("#check_of71f_4").hide();
            $("#_226_of71f_currency").prop("required", false);
            $("#_227_of71f_amount").prop("required", false);
        }

        //of71f_5
        if ($("#_228_of71f_currency").val() != "" || $("#_229_of71f_amount").val() != "") {
            $("#sender_chargers_5_checkbox").prop("checked", true);
            $("#check_of71f_5").show();
            $("#_228_of71f_currency").prop("required", true);
            $("#_229_of71f_amount").prop("required", true);
        } else {
            $("#check_of71f_5").hide();
            $("#_228_of71f_currency").prop("required", false);
            $("#_229_of71f_amount").prop("required", false);
        }

    });
</script>