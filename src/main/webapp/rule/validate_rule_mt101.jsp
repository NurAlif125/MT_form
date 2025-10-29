<%-- 
    Document   : validate_rule_mt950
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

                //Sender's Reference
                _010_mf20_senders_reference: "required",
                
                //Message Index/Total
                _030_mf28d_message_index: "required",
                _031_mf28d_total: "required",

                //Requested Execution Date
                _080_mf30_requested_execution_date: "required",
                
                //Transaction Reference
                _102_mf21_transaction_reference: "required",
                
                //Currency/Transaction Amount
                _130_mf32b_currency: "required",
                _131_mf32b_amount: "required",
                
                //Beneficiary
                type_of59_59a_: "required",
                _191_mf59_name_address: "required",
                _193_mf59a_identifier_code: "required",
                
                //Details of Charges
                _240_mf71a_details_charges: "required"
                
                
                
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_senders_reference: {required: "mf20_sender_reference harus diisi..!!"},
                _030_mf28d_message_index: {required: "mf28d_message_index harus diisi..!!"},
                _031_mf28d_total: {required: "mf28d_total harus diisi..!!"},
                _080_mf30_requested_execution_date: {required: "mf30_requested_execution_date harus diisi..!!"},
                _102_mf21_transaction_reference: {required: "mf21_transaction_reference harus diisi..!!"},
                _130_mf32b_currency: {required: "mf32b_currency harus diisi..!!"},
                _131_mf32b_amount: {required: "mf32b_amount harus diisi..!!"},
                type_of59_59a_: {required: "mf59 harus diisi..!!"},
                _191_mf59_name_address: {required: "mf59_name_address harus diisi..!!"},
                _193_mf59a_identifier_code: {required: "mf59a_identifier_code harus diisi..!!"},
                _240_mf71a_details_charges: {required: "mf71a_details_charges"}
                
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
        
        
        //Field OF50a: Instructing Party
        $("#div_of50c_identifier_code").hide();
        $("#div_of50l_party_identifier").hide();
        $("#_041_of50c_identifier_code").attr("disabled", true);
        $("#_042_mf50l_party_identifier").attr("disabled", true);
        $("#type_of50a_instructing_party").change(function () {
            if ($("#type_of50a_instructing_party").val() == "c") {
                $("#div_of50c_identifier_code").show();
                $("#div_of50l_party_identifier").hide();
                $("#_041_of50c_identifier_code").attr("disabled", false);
                $("#_042_mf50l_party_identifier").attr("disabled", true);
            } else if ($("#type_of50a_instructing_party").val() == "l") {
                $("#div_of50c_identifier_code").hide();
                $("#div_of50l_party_identifier").show();
                $("#_041_of50c_identifier_code").attr("disabled", true);
                $("#_042_mf50l_party_identifier").attr("disabled", false);
            } else {
                $("#div_of50c_identifier_code").hide();
                $("#div_of50l_party_identifier").hide();
                $("#_041_of50c_identifier_code").attr("disabled", true);
                $("#_042_mf50l_party_identifier").attr("disabled", true);
            }
        });
        //end of the line
        
        //Field OF50a: Ordering Customer
        $("#div_of50f_ordering_customer").hide();
        $("#div_of50g_ordering_customer").hide();
        $("#div_of50h_ordering_customer").hide();
        $("#_050_of50f_party_identifier").attr("disabled", true);
        $("#_051_of50f_name_address").attr("disabled", true);
        $("#_052_of50g_beneficiary").attr("disabled", true);
        $("#_053_of50g_identifier_code").attr("disabled", true);
        $("#_054_of50h_beneficiary").attr("disabled", true);
        $("#_055_of50h_name_address").attr("disabled", true);
        $("#type_of50a_ordering_customer").change(function () {
            if ($("#type_of50a_ordering_customer").val() == "f") {
                $("#div_of50f_ordering_customer").show();
                $("#div_of50g_ordering_customer").hide();
                $("#div_of50h_ordering_customer").hide();
                $("#_050_of50f_party_identifier").attr("disabled", false);
                $("#_051_of50f_name_address").attr("disabled", false);
                $("#_052_of50g_beneficiary").attr("disabled", true);
                $("#_053_of50g_identifier_code").attr("disabled", true);
                $("#_054_of50h_beneficiary").attr("disabled", true);
                $("#_055_of50h_name_address").attr("disabled", true);
            } else if ($("#type_of50a_ordering_customer").val() == "g") {
                $("#div_of50f_ordering_customer").hide();
                $("#div_of50g_ordering_customer").show();
                $("#div_of50h_ordering_customer").hide();
                $("#_050_of50f_party_identifier").attr("disabled", true);
                $("#_051_of50f_name_address").attr("disabled", true);
                $("#_052_of50g_beneficiary").attr("disabled", false);
                $("#_053_of50g_identifier_code").attr("disabled", false);
                $("#_054_of50h_beneficiary").attr("disabled", true);
                $("#_055_of50h_name_address").attr("disabled", true);
            } else if ($("#type_of50a_ordering_customer").val() == "h") {
                $("#div_of50f_ordering_customer").hide();
                $("#div_of50g_ordering_customer").hide();
                $("#div_of50h_ordering_customer").show();
                $("#_050_of50f_party_identifier").attr("disabled", true);
                $("#_051_of50f_name_address").attr("disabled", true);
                $("#_052_of50g_beneficiary").attr("disabled", true);
                $("#_053_of50g_identifier_code").attr("disabled", true);
                $("#_054_of50h_beneficiary").attr("disabled", false);
                $("#_055_of50h_name_address").attr("disabled", false);
            } else {
                $("#div_of50f_ordering_customer").hide();
                $("#div_of50g_ordering_customer").hide();
                $("#div_of50h_ordering_customer").hide();
                $("#_050_of50f_party_identifier").attr("disabled", true);
                $("#_051_of50f_name_address").attr("disabled", true);
                $("#_052_of50g_beneficiary").attr("disabled", true);
                $("#_053_of50g_identifier_code").attr("disabled", true);
                $("#_054_of50h_beneficiary").attr("disabled", true);
                $("#_055_of50h_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
        //OF52A  Account Servicing Institution
        $("#div_of52a_account_servicing_institution").hide();
        $("#div_of52c_account_servicing_institution").hide();
        $("#_060_of52a_party_identifier").attr("disabled", true);
        $("#_061_of52a_identifier_code").attr("disabled", true);
        $("#_063_of52c_party_identifier").attr("disabled", true);
        $("#type_of52a_account_servicing_institution").change(function () {
            if ($("#type_of52a_account_servicing_institution").val() == "a") {
                $("#div_of52a_account_servicing_institution").show();
                $("#div_of52c_account_servicing_institution").hide();
                $("#_060_of52a_party_identifier").attr("disabled", false);
                $("#_061_of52a_identifier_code").attr("disabled", false);
                $("#_063_of52c_party_identifier").attr("disabled", true);
            } else if ($("#type_of52a_account_servicing_institution").val() == "c") {
                $("#div_of52a_account_servicing_institution").hide();
                $("#div_of52c_account_servicing_institution").show();
                $("#_060_of52a_party_identifier").attr("disabled", true);
                $("#_061_of52a_identifier_code").attr("disabled", true);
                $("#_063_of52c_party_identifier").attr("disabled", false);
            } else {
                $("#div_of52a_account_servicing_institution").hide();
                $("#div_of52c_account_servicing_institution").hide();
                $("#_060_of52a_party_identifier").attr("disabled", true);
                $("#_061_of52a_identifier_code").attr("disabled", true);
                $("#_063_of52c_party_identifier").attr("disabled", true);
            }
        });
        //end of the line
        
//        MF21 Transaction Reference
        $("#div_mf21_transaction_reference").hide();
        $("#_102_mf21_transaction_reference").attr("disabled", true);
        $("#_100_mf21_add").click(function() {
            $("#div_mf21_transaction_reference").show();
            $("#_102_mf21_transaction_reference").attr("disabled", false);
        });
        $("#_100_mf21_remove").click(function() {
            $("#div_mf21_transaction_reference").hide();
            $("#_102_mf21_transaction_reference").attr("disabled", true);
        });
        //end of the line
        
        //Field OF50a 2nd: Instructing Party
        $("#div_of50c_identifier_code_2").hide();
        $("#div_of50l_party_identifier_2").hide();
        $("#_141_of50c_identifier_code").attr("disabled", true);
        $("#_142_mf50l_party_identifier").attr("disabled", true);
        $("#type_of50a_instructing_party_2").change(function () {
            if ($("#type_of50a_instructing_party_2").val() == "c") {
                $("#div_of50c_identifier_code_2").show();
                $("#div_of50l_party_identifier_2").hide();
                $("#_141_of50c_identifier_code").attr("disabled", false);
                $("#_142_mf50l_party_identifier").attr("disabled", true);
            } else if ($("#type_of50a_instructing_party_2").val() == "l") {
                $("#div_of50c_identifier_code_2").hide();
                $("#div_of50l_party_identifier_2").show();
                $("#_141_of50c_identifier_code").attr("disabled", true);
                $("#_142_mf50l_party_identifier").attr("disabled", false);
            } else {
                $("#div_of50c_identifier_code_2").hide();
                $("#div_of50l_party_identifier_2").hide();
                $("#_141_of50c_identifier_code").attr("disabled", true);
                $("#_142_mf50l_party_identifier").attr("disabled", true);
            }
        });
        //end of the line
        
        //Field OF50a 2nd: Ordering Customer
        $("#div_of50f_ordering_customer_2").hide();
        $("#div_of50g_ordering_customer_2").hide();
        $("#div_of50h_ordering_customer_2").hide();
        $("#_150_of50f_party_identifier").attr("disabled", true);
        $("#_151_of50f_name_address").attr("disabled", true);
        $("#_152_of50g_beneficiary").attr("disabled", true);
        $("#_153_of50g_identifier_code").attr("disabled", true);
        $("#_154_of50h_beneficiary").attr("disabled", true);
        $("#_155_of50h_name_address").attr("disabled", true);
        $("#type_of50a_ordering_customer_2").change(function () {
            if ($("#type_of50a_ordering_customer_2").val() == "f") {
                $("#div_of50f_ordering_customer_2").show();
                $("#div_of50g_ordering_customer_2").hide();
                $("#div_of50h_ordering_customer_2").hide();
                $("#_150_of50f_party_identifier").attr("disabled", false);
                $("#_151_of50f_name_address").attr("disabled", false);
                $("#_152_of50g_beneficiary").attr("disabled", true);
                $("#_153_of50g_identifier_code").attr("disabled", true);
                $("#_154_of50h_beneficiary").attr("disabled", true);
                $("#_155_of50h_name_address").attr("disabled", true);
            } else if ($("#type_of50a_ordering_customer_2").val() == "g") {
                $("#div_of50f_ordering_customer_2").hide();
                $("#div_of50g_ordering_customer_2").show();
                $("#div_of50h_ordering_customer_2").hide();
                $("#_150_of50f_party_identifier").attr("disabled", true);
                $("#_151_of50f_name_address").attr("disabled", true);
                $("#_152_of50g_beneficiary").attr("disabled", false);
                $("#_153_of50g_identifier_code").attr("disabled", false);
                $("#_154_of50h_beneficiary").attr("disabled", true);
                $("#_155_of50h_name_address").attr("disabled", true);
            } else if ($("#type_of50a_ordering_customer_2").val() == "h") {
                $("#div_of50f_ordering_customer_2").hide();
                $("#div_of50g_ordering_customer_2").hide();
                $("#div_of50h_ordering_customer_2").show();
                $("#_150_of50f_party_identifier").attr("disabled", true);
                $("#_151_of50f_name_address").attr("disabled", true);
                $("#_152_of50g_beneficiary").attr("disabled", true);
                $("#_153_of50g_identifier_code").attr("disabled", true);
                $("#_154_of50h_beneficiary").attr("disabled", false);
                $("#_155_of50h_name_address").attr("disabled", false);
            } else {
                $("#div_of50f_ordering_customer_2").hide();
                $("#div_of50g_ordering_customer_2").hide();
                $("#div_of50h_ordering_customer_2").hide();
                $("#_150_of50f_party_identifier").attr("disabled", true);
                $("#_151_of50f_name_address").attr("disabled", true);
                $("#_152_of50g_beneficiary").attr("disabled", true);
                $("#_153_of50g_identifier_code").attr("disabled", true);
                $("#_154_of50h_beneficiary").attr("disabled", true);
                $("#_155_of50h_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
        //OF52A  Account Servicing Institution 2nd
        $("#div_of52a_account_servicing_institution_2").hide();
        $("#div_of52c_account_servicing_institution_2").hide();
        $("#_160_of52a_party_identifier").attr("disabled", true);
        $("#_161_of52a_identifier_code").attr("disabled", true);
        $("#_163_of52c_party_identifier").attr("disabled", true);
        $("#type_of52a_account_servicing_institution_2").change(function () {
            if ($("#type_of52a_account_servicing_institution_2").val() == "a") {
                $("#div_of52a_account_servicing_institution_2").show();
                $("#div_of52c_account_servicing_institution_2").hide();
                $("#_160_of52a_party_identifier").attr("disabled", false);
                $("#_161_of52a_identifier_code").attr("disabled", false);
                $("#_163_of52c_party_identifier").attr("disabled", true);
            } else if ($("#type_of52a_account_servicing_institution_2").val() == "c") {
                $("#div_of52a_account_servicing_institution_2").hide();
                $("#div_of52c_account_servicing_institution_2").show();
                $("#_160_of52a_party_identifier").attr("disabled", true);
                $("#_161_of52a_identifier_code").attr("disabled", true);
                $("#_163_of52c_party_identifier").attr("disabled", false);
            } else {
                $("#div_of52a_account_servicing_institution_2").hide();
                $("#div_of52c_account_servicing_institution_2").hide();
                $("#_160_of52a_party_identifier").attr("disabled", true);
                $("#_161_of52a_identifier_code").attr("disabled", true);
                $("#_163_of52c_party_identifier").attr("disabled", true);
            }
        });
        //end of the line
        
        //Field OF56a Intermediary
        $("#div_of56a_intermediary").hide();
        $("#div_of56c_intermediary").hide();
        $("#div_of56d_intermediary").hide();
        $("#_170_of56a_party_identifier").attr("disabled", true);
        $("#_171_of56a_identifier_code").attr("disabled", true);
        $("#_173_of56c_party_identifier").attr("disabled", true);
        $("#_174_of56d_party_identifier").attr("disabled", true);
        $("#_175_of56d_name_address").attr("disabled", true);
        $("#type_of56a_intermediary").change(function () {
            if ($("#type_of56a_intermediary").val() == "a") {
                $("#div_of56a_intermediary").show();
                $("#div_of56c_intermediary").hide();
                $("#div_of56d_intermediary").hide();
                $("#_170_of56a_party_identifier").attr("disabled", false);
                $("#_171_of56a_identifier_code").attr("disabled", false);
                $("#_173_of56c_party_identifier").attr("disabled", true);
                $("#_174_of56d_party_identifier").attr("disabled", true);
                $("#_175_of56d_name_address").attr("disabled", true);
            } else if ($("#type_of56a_intermediary").val() == "c") {
                $("#div_of56a_intermediary").hide();
                $("#div_of56c_intermediary").show();
                $("#div_of56d_intermediary").hide();
                $("#_170_of56a_party_identifier").attr("disabled", true);
                $("#_171_of56a_identifier_code").attr("disabled", true);
                $("#_173_of56c_party_identifier").attr("disabled", false);
                $("#_174_of56d_party_identifier").attr("disabled", true);
                $("#_175_of56d_name_address").attr("disabled", true);
            } else if ($("#type_of56a_intermediary").val() == "d") {
                $("#div_of56a_intermediary").hide();
                $("#div_of56c_intermediary").hide();
                $("#div_of56d_intermediary").show();
                $("#_170_of56a_party_identifier").attr("disabled", true);
                $("#_171_of56a_identifier_code").attr("disabled", true);
                $("#_173_of56c_party_identifier").attr("disabled", true);
                $("#_174_of56d_party_identifier").attr("disabled", false);
                $("#_175_of56d_name_address").attr("disabled", false);
            } else {
                $("#div_of56a_intermediary").hide();
                $("#div_of56c_intermediary").hide();
                $("#div_of56d_intermediary").hide();
                $("#_170_of56a_party_identifier").attr("disabled", true);
                $("#_171_of56a_identifier_code").attr("disabled", true);
                $("#_173_of56c_party_identifier").attr("disabled", true);
                $("#_174_of56d_party_identifier").attr("disabled", true);
                $("#_175_of56d_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
        //Field OF57A Account With Institution
        $("#div_of57a_account_with_institution").hide();
        $("#div_of57c_account_with_institution").hide();
        $("#div_of57d_account_with_institution").hide();
        $("#_180_of57a_party_identifier").attr("disabled", true);
        $("#_181_of57a_identifier_code").attr("disabled", true);
        $("#_183_of57c_party_identifier").attr("disabled", true);
        $("#_184_of57d_party_identifier").attr("disabled", true);
        $("#_185_of57d_name_address").attr("disabled", true);
        $("#type_of57a_account_with_institution").change(function () {
            if ($("#type_of57a_account_with_institution").val() == "a") {
                $("#div_of57a_account_with_institution").show();
                $("#div_of57c_account_with_institution").hide();
                $("#div_of57d_account_with_institution").hide();
                $("#_180_of57a_party_identifier").attr("disabled", false);
                $("#_181_of57a_identifier_code").attr("disabled", false);
                $("#_183_of57c_party_identifier").attr("disabled", true);
                $("#_184_of57d_party_identifier").attr("disabled", true);
                $("#_185_of57d_name_address").attr("disabled", true);
            } else if ($("#type_of57a_account_with_institution").val() == "c") {
                $("#div_of57a_account_with_institution").hide();
                $("#div_of57c_account_with_institution").show();
                $("#div_of57d_account_with_institution").hide();
                $("#_180_of57a_party_identifier").attr("disabled", true);
                $("#_181_of57a_identifier_code").attr("disabled", true);
                $("#_183_of57c_party_identifier").attr("disabled", false);
                $("#_184_of57d_party_identifier").attr("disabled", true);
                $("#_185_of57d_name_address").attr("disabled", true);
            } else if ($("#type_of57a_account_with_institution").val() == "d") {
                $("#div_of57a_account_with_institution").hide();
                $("#div_of57c_account_with_institution").hide();
                $("#div_of57d_account_with_institution").show();
                $("#_180_of57a_party_identifier").attr("disabled", true);
                $("#_181_of57a_identifier_code").attr("disabled", true);
                $("#_183_of57c_party_identifier").attr("disabled", true);
                $("#_184_of57d_party_identifier").attr("disabled", false);
                $("#_185_of57d_name_address").attr("disabled", false);
            } else {
                $("#div_of57a_account_with_institution").hide();
                $("#div_of57c_account_with_institution").hide();
                $("#div_of57d_account_with_institution").hide();
                $("#_180_of57a_party_identifier").attr("disabled", true);
                $("#_181_of57a_identifier_code").attr("disabled", true);
                $("#_183_of57c_party_identifier").attr("disabled", true);
                $("#_184_of57d_party_identifier").attr("disabled", true);
                $("#_185_of57d_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
        //mf59
        $("#div_mf59_").hide();
        $("#div_mf59a_").hide();
        $("#div_mf59f_").hide();
        $("#div_mf59f_2").hide();
        $("#div_mf59f_3").hide();
        $("#div_mf59f_4").hide();
        $("#_190_mf59_account").attr("disabled", true);
        $("#_191_mf59_name_address").attr("disabled", true);
        $("#_192_mf59a_account").attr("disabled", true);
        $("#_193_mf59a_identifier_code").attr("disabled", true);
        $("#_195_mf59f_account").attr("disabled", true);
        $("#_196_mf59f_number").attr("disabled", true);
        $("#_197_mf59f_details").attr("disabled", true);
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
                $("#_190_mf59_account").attr("disabled", false);
                $("#_191_mf59_name_address").attr("disabled", false);
                $("#_192_mf59a_account").attr("disabled", true);
                $("#_193_mf59a_identifier_code").attr("disabled", true);
                $("#_195_mf59f_account").attr("disabled", true);
                $("#_196_mf59f_number").attr("disabled", true);
                $("#_197_mf59f_details").attr("disabled", true);
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
                $("#_190_mf59_account").attr("disabled", true);
                $("#_191_mf59_name_address").attr("disabled", true);
                $("#_192_mf59a_account").attr("disabled", false);
                $("#_193_mf59a_identifier_code").attr("disabled", false);
                $("#_195_mf59f_account").attr("disabled", true);
                $("#_196_mf59f_number").attr("disabled", true);
                $("#_197_mf59f_details").attr("disabled", true);
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
                $("#_190_mf59_account").attr("disabled", true);
                $("#_191_mf59_name_address").attr("disabled", true);
                $("#_192_mf59a_account").attr("disabled", true);
                $("#_193_mf59a_identifier_code").attr("disabled", true);
                $("#_195_mf59f_account").attr("disabled", false);
                $("#_196_mf59f_number").attr("disabled", false);
                $("#_197_mf59f_details").attr("disabled", false);
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
                $("#_190_mf59_account").attr("disabled", true);
                $("#_191_mf59_name_address").attr("disabled", true);
                $("#_192_mf59a_account").attr("disabled", true);
                $("#_193_mf59a_identifier_code").attr("disabled", true);
                $("#_195_mf59f_account").attr("disabled", true);
                $("#_196_mf59f_number").attr("disabled", true);
                $("#_197_mf59f_details").attr("disabled", true);
                $("#check_mf59f_2").attr("disabled", true);
                $("#check_mf59f_3").attr("disabled", true);
                $("#check_mf59f_4").attr("disabled", true);
            }
        });

        //mf59f_2
        $("#check_mf59f_2").hide();
        $("#_198_mf59f_number").prop("required", false);
        $("#_199_mf59f_details").prop("required", false);
        $("#name_address_checkbox_2").click(function () {
            if ($("#name_address_checkbox_2").is(":checked")) {
                $("#check_mf59f_2").show();
                $("#_198_mf59f_number").prop("required", true);
                $("#_199_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f_2").hide();
                $("#_198_mf59f_number").prop("required", false);
                $("#_199_mf59f_details").prop("required", false);
            }
        });

        //mf59f_3
        $("#check_mf59f_3").hide();
        $("#_200_mf59f_number").prop("required", false);
        $("#_201_mf59f_details").prop("required", false);
        $("#name_address_checkbox_3").click(function () {
            if ($("#name_address_checkbox_3").is(":checked")) {
                $("#check_mf59f_3").show();
                $("#_200_mf59f_number").prop("required", true);
                $("#_201_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f_3").hide();
                $("#_200_mf59f_number").prop("required", false);
                $("#_201_mf59f_details").prop("required", false);
            }
        });

        //mf59f_4
        $("#check_mf59f_4").hide();
        $("#_202_mf59f_number").prop("required", false);
        $("#_203_mf59f_details").prop("required", false);
        $("#name_address_checkbox_4").click(function () {
            if ($("#name_address_checkbox_4").is(":checked")) {
                $("#check_mf59f_4").show();
                $("#_202_mf59f_number").prop("required", true);
                $("#_203_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f_4").hide();
                $("#_202_mf59f_number").prop("required", false);
                $("#_203_mf59f_details").prop("required", false);
            }
        });
        //end of the line
        
        
    });
</script>

<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        //Field OF50a: Instructing Party
        if ($("#_041_of50c_identifier_code").val() != "") {
            $("#type_of50a_instructing_party").val("c").attr("selected", true);
            $("#div_of50c_identifier_code").show();
            $("#div_of50l_party_identifier").hide();
            $("#_041_of50c_identifier_code").attr("disabled", false);
            $("#_042_mf50l_party_identifier").attr("disabled", true);
        } else if ($("#_042_mf50l_party_identifier").val() != "" ) {
            $("#type_of50a_instructing_party").val("l").attr("selected", true);
            $("#div_of50c_identifier_code").hide();
            $("#div_of50l_party_identifier").show();
            $("#_041_of50c_identifier_code").attr("disabled", true);
            $("#_042_mf50l_party_identifier").attr("disabled", false);
        } else {
            $("#div_of50c_identifier_code").hide();
            $("#div_of50l_party_identifier").hide();
            $("#_041_of50c_identifier_code").attr("disabled", true);
            $("#_042_mf50l_party_identifier").attr("disabled", true);
        }
        //end of the line
        
        
        //Field OF50a: Ordering Customer
        if ($("#_050_of50f_party_identifier").val() != "" || $("#_051_of50f_name_address").val() != "") {
            $("#type_of50a_ordering_customer").val("f").attr("selected", true);
            $("#div_of50f_ordering_customer").show();
            $("#div_of50g_ordering_customer").hide();
            $("#div_of50h_ordering_customer").hide();
            $("#_050_of50f_party_identifier").attr("disabled", false);
            $("#_051_of50f_name_address").attr("disabled", false);
            $("#_052_of50g_beneficiary").attr("disabled", true);
            $("#_053_of50g_identifier_code").attr("disabled", true);
            $("#_054_of50h_beneficiary").attr("disabled", true);
            $("#_055_of50h_name_address").attr("disabled", true);
        } else if ($("#_052_of50g_beneficiary").val() != "" || $("#_053_of50g_identifier_code").val() != "") {
            $("#type_of50a_ordering_customer").val("g").attr("selected", true);
            $("#div_of50f_ordering_customer").hide();
            $("#div_of50g_ordering_customer").show();
            $("#div_of50h_ordering_customer").hide();
            $("#_050_of50f_party_identifier").attr("disabled", true);
            $("#_051_of50f_name_address").attr("disabled", true);
            $("#_052_of50g_beneficiary").attr("disabled", false);
            $("#_053_of50g_identifier_code").attr("disabled", false);
            $("#_054_of50h_beneficiary").attr("disabled", true);
            $("#_055_of50h_name_address").attr("disabled", true);
        } else if ($("#_054_of50h_beneficiary").val() != "" || $("#_055_of50h_name_address").val() != "") {
            $("#type_of50a_ordering_customer").val("h").attr("selected", true);
            $("#div_of50f_ordering_customer").hide();
            $("#div_of50g_ordering_customer").hide();
            $("#div_of50h_ordering_customer").show();
            $("#_050_of50f_party_identifier").attr("disabled", true);
            $("#_051_of50f_name_address").attr("disabled", true);
            $("#_052_of50g_beneficiary").attr("disabled", true);
            $("#_053_of50g_identifier_code").attr("disabled", true);
            $("#_054_of50h_beneficiary").attr("disabled", false);
            $("#_055_of50h_name_address").attr("disabled", false);
        } else {
            $("#div_of50f_ordering_customer").hide();
            $("#div_of50g_ordering_customer").hide();
            $("#div_of50h_ordering_customer").hide();
            $("#_050_of50f_party_identifier").attr("disabled", true);
            $("#_051_of50f_name_address").attr("disabled", true);
            $("#_052_of50g_beneficiary").attr("disabled", true);
            $("#_053_of50g_identifier_code").attr("disabled", true);
            $("#_054_of50h_beneficiary").attr("disabled", true);
            $("#_055_of50h_name_address").attr("disabled", true);
        }
        //end of the line
        
        //OF52A  Account Servicing Institution
        if ($("#_060_of52a_party_identifier").val() != "" || $("#_061_of52a_identifier_code").val() != "") {
            $("#type_of52a_account_servicing_institution").val("a").attr("selected", true);
            $("#div_of52a_account_servicing_institution").show();
            $("#div_of52c_account_servicing_institution").hide();
            $("#_060_of52a_party_identifier").attr("disabled", false);
            $("#_061_of52a_identifier_code").attr("disabled", false);
            $("#_063_of52c_party_identifier").attr("disabled", true);
        } else if ($("#_063_of52c_party_identifier").val() != "" ) {
            $("#type_of52a_account_servicing_institution").val("c").attr("selected", true);
            $("#div_of52a_account_servicing_institution").hide();
            $("#div_of52c_account_servicing_institution").show();
            $("#_060_of52a_party_identifier").attr("disabled", true);
            $("#_061_of52a_identifier_code").attr("disabled", true);
            $("#_063_of52c_party_identifier").attr("disabled", false);
        } else {
            $("#div_of52a_account_servicing_institution").hide();
            $("#div_of52c_account_servicing_institution").hide();
            $("#_060_of52a_party_identifier").attr("disabled", true);
            $("#_061_of52a_identifier_code").attr("disabled", true);
            $("#_063_of52c_party_identifier").attr("disabled", true);
        }
        //end of the line
        
        
        //Field OF50a 2nd: Instructing Party
        if ($("#_141_of50c_identifier_code").val() != "") {
            $("#type_of50a_instructing_party_2").val("c").attr("selected", true);
            $("#div_of50c_identifier_code_2").show();
            $("#div_of50l_party_identifier_2").hide();
            $("#_141_of50c_identifier_code").attr("disabled", false);
            $("#_142_mf50l_party_identifier").attr("disabled", true);
        } else if ($("#_142_mf50l_party_identifier").val() != "" ) {
            $("#type_of50a_instructing_party_2").val("l").attr("selected", true);
            $("#div_of50c_identifier_code_2").hide();
            $("#div_of50l_party_identifier_2").show();
            $("#_141_of50c_identifier_code").attr("disabled", true);
            $("#_142_mf50l_party_identifier").attr("disabled", false);
        } else {
            $("#div_of50c_identifier_code_2").hide();
            $("#div_of50l_party_identifier_2").hide();
            $("#_141_of50c_identifier_code").attr("disabled", true);
            $("#_142_mf50l_party_identifier").attr("disabled", true);
        }
        //end of the line
        
        //Field OF50a Ordering Customer 2nd
        if ($("#_150_of50f_party_identifier").val() != "" || $("#_151_of50f_name_address").val() != "") {
            $("#type_of50a_ordering_customer_2").val("f").attr("selected", true);
            $("#div_of50f_ordering_customer_2").show();
            $("#div_of50g_ordering_customer_2").hide();
            $("#div_of50h_ordering_customer_2").hide();
            $("#_150_of50f_party_identifier").attr("disabled", false);
            $("#_151_of50f_name_address").attr("disabled", false);
            $("#_152_of50g_beneficiary").attr("disabled", true);
            $("#_153_of50g_identifier_code").attr("disabled", true);
            $("#_154_of50h_beneficiary").attr("disabled", true);
            $("#_155_of50h_name_address").attr("disabled", true);
        } else if ($("#_152_of50g_beneficiary").val() != "" || $("#_153_of50g_identifier_code").val() != "") {
            $("#type_of50a_ordering_customer_2").val("g").attr("selected", true);
            $("#div_of50f_ordering_customer_2").hide();
            $("#div_of50g_ordering_customer_2").show();
            $("#div_of50h_ordering_customer_2").hide();
            $("#_150_of50f_party_identifier").attr("disabled", true);
            $("#_151_of50f_name_address").attr("disabled", true);
            $("#_152_of50g_beneficiary").attr("disabled", false);
            $("#_153_of50g_identifier_code").attr("disabled", false);
            $("#_154_of50h_beneficiary").attr("disabled", true);
            $("#_155_of50h_name_address").attr("disabled", true);
        } else if ($("#_154_of50h_beneficiary").val() != "" || $("#_155_of50h_name_address").val() != "") {
            $("#type_of50a_ordering_customer_2").val("h").attr("selected", true);
            $("#div_of50f_ordering_customer_2").hide();
            $("#div_of50g_ordering_customer_2").hide();
            $("#div_of50h_ordering_customer_2").show();
            $("#_150_of50f_party_identifier").attr("disabled", true);
            $("#_151_of50f_name_address").attr("disabled", true);
            $("#_152_of50g_beneficiary").attr("disabled", true);
            $("#_153_of50g_identifier_code").attr("disabled", true);
            $("#_154_of50h_beneficiary").attr("disabled", false);
            $("#_155_of50h_name_address").attr("disabled", false);
        } else {
            $("#div_of50f_ordering_customer_2").hide();
            $("#div_of50g_ordering_customer_2").hide();
            $("#div_of50h_ordering_customer_2").hide();
            $("#_150_of50f_party_identifier").attr("disabled", true);
            $("#_151_of50f_name_address").attr("disabled", true);
            $("#_152_of50g_beneficiary").attr("disabled", true);
            $("#_153_of50g_identifier_code").attr("disabled", true);
            $("#_154_of50h_beneficiary").attr("disabled", true);
            $("#_155_of50h_name_address").attr("disabled", true);
        }
        //end of the line
        
        //OF52A  Account Servicing Institution
        if ($("#_160_of52a_party_identifier").val() != "" || $("#_161_of52a_identifier_code").val() != "") {
            $("#type_of52a_account_servicing_institution_2").val("a").attr("selected", true);
            $("#div_of52a_account_servicing_institution_2").show();
            $("#div_of52c_account_servicing_institution_2").hide();
            $("#_160_of52a_party_identifier").attr("disabled", false);
            $("#_161_of52a_identifier_code").attr("disabled", false);
            $("#_163_of52c_party_identifier").attr("disabled", true);
        } else if ($("#_163_of52c_party_identifier").val() != "" ) {
            $("#type_of52a_account_servicing_institution_2").val("c").attr("selected", true);
            $("#div_of52a_account_servicing_institution_2").hide();
            $("#div_of52c_account_servicing_institution_2").show();
            $("#_160_of52a_party_identifier").attr("disabled", true);
            $("#_161_of52a_identifier_code").attr("disabled", true);
            $("#_163_of52c_party_identifier").attr("disabled", false);
        } else {
            $("#div_of52a_account_servicing_institution_2").hide();
            $("#div_of52c_account_servicing_institution_2").hide();
            $("#_160_of52a_party_identifier").attr("disabled", true);
            $("#_161_of52a_identifier_code").attr("disabled", true);
            $("#_163_of52c_party_identifier").attr("disabled", true);
        }
        //end of the line
        
        //Field OF56a Intermediary
        if ($("#_170_of56a_party_identifier").val() != "" || $("#_171_of56a_identifier_code").val() != "") {
            $("#type_of56a_intermediary").val("a").attr("selected", true);
            $("#div_of56a_intermediary").show();
            $("#div_of56c_intermediary").hide();
            $("#div_of56d_intermediary").hide();
            $("#_170_of56a_party_identifier").attr("disabled", false);
            $("#_171_of56a_identifier_code").attr("disabled", false);
            $("#_173_of56c_party_identifier").attr("disabled", true);
            $("#_174_of56d_party_identifier").attr("disabled", true);
            $("#_175_of56d_name_address").attr("disabled", true);
        } else if ($("#_173_of56c_party_identifier").val() != "" ) {
            $("#type_of56a_intermediary").val("c").attr("selected", true);
            $("#div_of56a_intermediary").hide();
            $("#div_of56c_intermediary").show();
            $("#div_of56d_intermediary").hide();
            $("#_170_of56a_party_identifier").attr("disabled", true);
            $("#_171_of56a_identifier_code").attr("disabled", true);
            $("#_173_of56c_party_identifier").attr("disabled", false);
            $("#_174_of56d_party_identifier").attr("disabled", true);
            $("#_175_of56d_name_address").attr("disabled", true);
        } else if ($("#_174_of56d_party_identifier").val() != "" || $("#_175_of56d_name_address").val() != "") {
            $("#type_of56a_intermediary").val("d").attr("selected", true);
            $("#div_of56a_intermediary").hide();
            $("#div_of56c_intermediary").hide();
            $("#div_of56d_intermediary").show();
            $("#_170_of56a_party_identifier").attr("disabled", true);
            $("#_171_of56a_identifier_code").attr("disabled", true);
            $("#_173_of56c_party_identifier").attr("disabled", true);
            $("#_174_of56d_party_identifier").attr("disabled", false);
            $("#_175_of56d_name_address").attr("disabled", false);
        } else {
            $("#div_of56a_intermediary").hide();
            $("#div_of56c_intermediary").hide();
            $("#div_of56d_intermediary").hide();
            $("#_170_of56a_party_identifier").attr("disabled", true);
            $("#_171_of56a_identifier_code").attr("disabled", true);
            $("#_173_of56c_party_identifier").attr("disabled", true);
            $("#_174_of56d_party_identifier").attr("disabled", true);
            $("#_175_of56d_name_address").attr("disabled", true);
        }
        //end of the line
        
       //Field OF57A Account With Institution
        if ($("#_180_of57a_party_identifier").val() != "" || $("#_181_of57a_identifier_code").val() != "") {
            $("#type_of57a_account_with_institution").val("a").attr("selected", true);
            $("#div_of57a_account_with_institution").show();
            $("#div_of57c_account_with_institution").hide();
            $("#div_of57d_account_with_institution").hide();
            $("#_180_of57a_party_identifier").attr("disabled", false);
            $("#_181_of57a_identifier_code").attr("disabled", false);
            $("#_183_of57c_party_identifier").attr("disabled", true);
            $("#_184_of57d_party_identifier").attr("disabled", true);
            $("#_185_of57d_name_address").attr("disabled", true);
        } else if ($("#_183_of57c_party_identifier").val() != "" ) {
            $("#type_of57a_account_with_institution").val("c").attr("selected", true);
            $("#div_of57a_account_with_institution").hide();
            $("#div_of57c_account_with_institution").show();
            $("#div_of57d_account_with_institution").hide();
            $("#_180_of57a_party_identifier").attr("disabled", true);
            $("#_181_of57a_identifier_code").attr("disabled", true);
            $("#_183_of57c_party_identifier").attr("disabled", false);
            $("#_184_of57d_party_identifier").attr("disabled", true);
            $("#_185_of57d_name_address").attr("disabled", true);
        } else if ($("#_184_of57d_party_identifier").val() != "" || $("#_185_of57d_name_address").val() != "") {
            $("#type_of57a_account_with_institution").val("d").attr("selected", true);
            $("#div_of57a_account_with_institution").hide();
            $("#div_of57c_account_with_institution").hide();
            $("#div_of57d_account_with_institution").show();
            $("#_180_of57a_party_identifier").attr("disabled", true);
            $("#_181_of57a_identifier_code").attr("disabled", true);
            $("#_183_of57c_party_identifier").attr("disabled", true);
            $("#_184_of57d_party_identifier").attr("disabled", false);
            $("#_185_of57d_name_address").attr("disabled", false);
        } else {
            $("#div_of57a_account_with_institution").hide();
            $("#div_of57c_account_with_institution").hide();
            $("#div_of57d_account_with_institution").hide();
            $("#_180_of57a_party_identifier").attr("disabled", true);
            $("#_181_of57a_identifier_code").attr("disabled", true);
            $("#_183_of57c_party_identifier").attr("disabled", true);
            $("#_184_of57d_party_identifier").attr("disabled", true);
            $("#_185_of57d_name_address").attr("disabled", true);
        }
        //end of the line
        
        //mf59_59a
        if ($("#_190_mf59_account").val() != "" || $("#_191_mf59_name_address").val() != "") {
            $("#type_of59_59a_").val("59").attr("selected", true);
            $("#div_mf59_").show();
            $("#div_mf59a_").hide();
            $("#div_mf59f_").hide();
            $("#div_mf59f_2").hide();
            $("#div_mf59f_3").hide();
            $("#div_mf59f_4").hide();
            $("#_190_mf59_account").attr("disabled", false);
            $("#_191_mf59_name_address").attr("disabled", false);
            $("#_192_mf59a_account").attr("disabled", true);
            $("#_193_mf59a_identifier_code").attr("disabled", true);
            $("#_195_mf59f_account").attr("disabled", true);
            $("#_196_mf59f_number").attr("disabled", true);
            $("#_197_mf59f_details").attr("disabled", true);
            $("#check_mf59f_2").attr("disabled", true);
            $("#check_mf59f_3").attr("disabled", true);
            $("#check_mf59f_4").attr("disabled", true);
        } else if ($("#_192_mf59a_account").val() != "" || $("#_193_mf59a_identifier_code").val() != "") {
            $("#type_of59_59a_").val("59a").attr("selected", true);
            $("#div_mf59_").hide();
            $("#div_mf59a_").show();
            $("#div_mf59f_").hide();
            $("#div_mf59f_2").hide();
            $("#div_mf59f_3").hide();
            $("#div_mf59f_4").hide();
            $("#_190_mf59_account").attr("disabled", true);
            $("#_191_mf59_name_address").attr("disabled", true);
            $("#_192_mf59a_account").attr("disabled", false);
            $("#_193_mf59a_identifier_code").attr("disabled", false);
            $("#_195_mf59f_account").attr("disabled", true);
            $("#_196_mf59f_number").attr("disabled", true);
            $("#_197_mf59f_details").attr("disabled", true);
            $("#check_mf59f_2").attr("disabled", true);
            $("#check_mf59f_3").attr("disabled", true);
            $("#check_mf59f_4").attr("disabled", true);
        } else if ($("#_196_mf59f_number").val() != "" || $("#_197_mf59f_details").val() != "") {
            $("#type_of59_59a_").val("59f").attr("selected", true);
            $("#div_mf59_").hide();
            $("#div_mf59a_").hide();
            $("#div_mf59f_").show();
            $("#div_mf59f_2").show();
            $("#div_mf59f_3").show();
            $("#div_mf59f_4").show();
            $("#_190_mf59_account").attr("disabled", true);
            $("#_191_mf59_name_address").attr("disabled", true);
            $("#_192_mf59a_account").attr("disabled", true);
            $("#_193_mf59a_identifier_code").attr("disabled", true);
            $("#_195_mf59f_account").attr("disabled", false);
            $("#_196_mf59f_number").attr("disabled", false);
            $("#_197_mf59f_details").attr("disabled", false);
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
            $("#_190_mf59_account").attr("disabled", true);
            $("#_191_mf59_name_address").attr("disabled", true);
            $("#_192_mf59a_account").attr("disabled", true);
            $("#_193_mf59a_identifier_code").attr("disabled", true);
            $("#_195_mf59f_account").attr("disabled", true);
            $("#_196_mf59f_number").attr("disabled", true);
            $("#_197_mf59f_details").attr("disabled", true);
            $("#check_mf59f_2").attr("disabled", true);
            $("#check_mf59f_3").attr("disabled", true);
            $("#check_mf59f_4").attr("disabled", true);
        }

        //mf59f_2
        if ($("#_198_mf59f_number").val() != "" || $("#_199_mf59f_details").val() != "") {
            $("#name_address_checkbox_2").prop("checked", true);
            $("#check_mf59f_2").show();
            $("#_198_mf59f_number").prop("required", true);
            $("#_199_mf59f_details").prop("required", true);
        } else {
            $("#check_mf59f_2").hide();
            $("#_198_mf59f_number").prop("required", false);
            $("#_199_mf59f_details").prop("required", false);
        }

        //mf59f_3
        if ($("#_200_mf59f_number").val() != "" || $("#_201_mf59f_details").val() != "") {
            $("#name_address_checkbox_3").prop("checked", true);
            $("#check_mf59f_3").show();
            $("#_200_mf59f_number").prop("required", true);
            $("#_201_mf59f_details").prop("required", true);
        } else {
            $("#check_mf59f_3").hide();
            $("#_200_mf59f_number").prop("required", false);
            $("#_201_mf59f_details").prop("required", false);
        }

        //mf59f_4
        if ($("#_202_mf59f_number").val() != "" || $("#_203_mf59f_details").val() != "") {
            $("#name_address_checkbox_4").prop("checked", true);
            $("#check_mf59f_4").show();
            $("#_202_mf59f_number").prop("required", true);
            $("#_203_mf59f_details").prop("required", true);
        } else {
            $("#check_mf59f_4").hide();
            $("#_202_mf59f_number").prop("required", false);
            $("#_203_mf59f_details").prop("required", false);
        }
        
        
        
        
        
    });
</script>