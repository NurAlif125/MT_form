<%-- 
    Document   : mt767
    Created on : Jun 14, 2021, 2:03:09 PM
    Author     : Ovasae
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
                //15A New Sequence
                //body
                //MF27 Sequence of Total
                _010_mf27_number: "required",
                _011_mf27_total: "required",
                

                //MF21 Related Reference
                _020_mf21_related_reference: "required",
                
                //MF22A Purpose of Message
                _030_mf22a_purpose_of_message: "required",
                
//                15B New Sequence
                //MF20 Undertaking Number
                _070_mf20_undertaking_number: "required",
                
                //MF26E Number of Amendment
                _080_mf26e_number_of_amendment: "required",
                
                //MF30 Date of Amendment
//                value_date: "required",
                _090_mf30_date_of_amendment: "required",
//                
////                MF52a Issuer
                type_mf52a_issuer: "required",
                _141_mf52a_identifier_code: "required",
                _144_mf52d_name_address: "required",
//                
////                MF59a Beneficiary
//                type_of59_59a_seq_b: "required",
//                _151_mf59_name_address: "required",
//                _153_mf59a_identifier_code: "required",
//                
////                32B Undertaking Amount
//                _190_mf32b_currency: "required",
//                _191_mf32b_amount: "required",
//                
////                77U Undertaking Terms and Conditions
//                _240_of77u_undertaking_terms_and_conditions: "required",
                
                
                
                //template
                template_name: "required"
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf27_number: {required: "mf27_number harus diisi..!!"},
                _011_mf27_total: {required: "mf27_total harus diisi..!!"},
                _020_mf21_related_reference: {required: "mf21_related_reference harus diisi..!!"},
                _030_mf22a_purpose_of_message: {required: "mf22a_purpose_of_message harus diisi..!!"},
                _070_mf20_undertaking_number: {required: "mf20_undertaking_number diisi..!!"},
                _080_mf26e_number_of_amendment: {required: "mf26e_number_of_amendment harus diisi..!!"},
//                value_date: {required: "value_date: harus diisi..!!"},
                _090_mf30_date_of_amendment: {required: "mf30_date_of_amendment harus diisi..!!"},
                _141_mf52a_identifier_code: {required: "mf52a_identifier_code harus diisi..!!"},
                _144_mf52d_name_address: {required: "mf52d_name_address harus diisi..!!"},
//                _151_mf59_name_address: {required: "mf59_name_address harus diisi..!!"},
//                _153_mf59a_identifier_code: {required: "mf59a_identifier_code harus diisi..!!"},
//                _190_mf32b_currency: {required: "mf32b_currency harus diisi..!!"},
//                _191_mf32b_amount: {required: "mf32b_amount harus diisi..!!"},
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


<!--Script untuk menampilkan-->
<script type="text/javascript">
    $(document).ready(function () {
      //MF52a Issuer
        $("#div_mf52a_issuer").hide();
        $("#div_mf52d_issuer").hide();
        $("#_140_mf52a_party_identifier").attr("disabled", true);
        $("#_141_mf52a_identifier_code").attr("disabled", true);
        $("#_143_mf52d_party_identifier").attr("disabled", true);
        $("#_144_mf52d_name_address").attr("disabled", true);
        $("#type_mf52a_issuer").change(function () {
            if ($("#type_mf52a_issuer").val() == "a") {
                $("#div_mf52a_issuer").show();
                $("#div_mf52d_issuer").hide();
                $("#_140_mf52a_party_identifier").attr("disabled", false);
                $("#_141_mf52a_identifier_code").attr("disabled", false);
                $("#_143_mf52d_party_identifier").attr("disabled", true);
                $("#_144_mf52d_name_address").attr("disabled", true);
            } else if ($("#type_mf52a_issuer").val() == "d") {
                $("#div_mf52a_issuer").hide();
                $("#div_mf52d_issuer").show();
                $("#_140_mf52a_party_identifier").attr("disabled", true);
                $("#_141_mf52a_identifier_code").attr("disabled", true);
                $("#_143_mf52d_party_identifier").attr("disabled", false);
                $("#_144_mf52d_name_address").attr("disabled", false);
            } else {
                $("#div_mf52a_issuer").hide();
                $("#div_mf52d_issuer").hide();
                $("#_140_mf52a_party_identifier").attr("disabled", true);
                $("#_141_mf52a_identifier_code").attr("disabled", true);
                $("#_143_mf52d_party_identifier").attr("disabled", true);
                $("#_144_mf52d_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
        //MF59a Beneficiary
        $("#div_mf59no_beneficiary").hide();
        $("#div_mf59a_beneficiary").hide();
        $("#_200_of59_beneficiary").attr("disabled", true);
        $("#_201_of59_name_address").attr("disabled", true);
        $("#_202_of59a_party_identifier").attr("disabled", true);
        $("#_203_of59a_identifier_code").attr("disabled", true);
        $("#type_of59_59a_seq_b").change(function () {
            if ($("#type_of59_59a_seq_b").val() == "no") {
                $("#div_mf59no_beneficiary").show();
                $("#div_mf59a_beneficiary").hide();
                $("#_200_of59_beneficiary").attr("disabled", false);
                $("#_201_of59_name_address").attr("disabled", false);
                $("#_202_of59a_party_identifier").attr("disabled", true);
                $("#_203_of59a_identifier_code").attr("disabled", true);
            } else if ($("#type_of59_59a_seq_b").val() == "a") {
                $("#div_mf59no_beneficiary").hide();
                $("#div_mf59a_beneficiary").show();
                $("#_200_of59_beneficiary").attr("disabled", true);
                $("#_201_of59_name_address").attr("disabled", true);
                $("#_202_of59a_party_identifier").attr("disabled", false);
                $("#_203_of59a_identifier_code").attr("disabled", false);
            } else {
                $("#div_mf59no_beneficiary").hide();
                $("#div_mf59a_beneficiary").hide();
                $("#_200_of59_beneficiary").attr("disabled", true);
                $("#_201_of59_name_address").attr("disabled", true);
                $("#_202_of59a_party_identifier").attr("disabled", true);
                $("#_203_of59a_identifier_code").attr("disabled", true);
            }
        });
        //end of the line
        
        //Seq C checkbox
        $("#check_seq_c").hide();
        $("#_300_of77l_other_amandments_to_local_undertaking").attr("disabled", true);
        $("#seq_C_checkbox").click(function () {
            if ($("#seq_C_checkbox").is(":checked")) {
                $("#check_seq_c").show();
                $("#_300_of77l_other_amandments_to_local_undertaking").attr("disabled", false);
            } else {
                $("#check_seq_c").hide();
                $("#_300_of77l_other_amandments_to_local_undertaking").attr("disabled", true);
            }
        });
        //end of the line
        
        
    });
</script>


<!--Script untuk mengedit-->
<!--rule view-->
<script language="javascript">
    $(document).ready(function () {
        //MF52a Issuer
        if ($("#_140_mf52a_party_identifier").val() != "" || $("#_141_mf52a_identifier_code").val() != "") {
            $("#type_mf52a_issuer").val("a").attr("selected", true);
            $("#div_mf52a_issuer").show();
            $("#div_mf52d_issuer").hide();
            $("#_140_mf52a_party_identifier").attr("disabled", false);
            $("#_141_mf52a_identifier_code").attr("disabled", false);
            $("#_143_mf52d_party_identifier").attr("disabled", true);
            $("#_144_mf52d_name_address").attr("disabled", true);
        } else if ($("#_143_mf52d_party_identifier").val() != "" || $("#_144_mf52d_name_address").val() != "") {
            $("#type_mf52a_issuer").val("d").attr("selected", true);
            $("#div_mf52a_issuer").hide();
            $("#div_mf52d_issuer").show();
            $("#_140_mf52a_party_identifier").attr("disabled", true);
            $("#_141_mf52a_identifier_code").attr("disabled", true);
            $("#_143_mf52d_party_identifier").attr("disabled", false);
            $("#_144_mf52d_name_address").attr("disabled", false);
        } else {
            $("#div_mf52a_issuer").hide();
            $("#div_mf52d_issuer").hide();
            $("#_140_mf52a_party_identifier").attr("disabled", true);
            $("#_141_mf52a_identifier_code").attr("disabled", true);
            $("#_143_mf52d_party_identifier").attr("disabled", true);
            $("#_144_mf52d_name_address").attr("disabled", true);
        }
        //end of the line
        
        //MF59a Beneficiary
        if ($("#_200_of59_beneficiary").val() != "" || $("#_201_of59_name_address").val() != "") {
            $("#type_of59_59a_seq_b").val("no").attr("selected", true);
            $("#div_mf59no_beneficiary").show();
            $("#div_mf59a_beneficiary").hide();
            $("#_200_of59_beneficiary").attr("disabled", false);
            $("#_201_of59_name_address").attr("disabled", false);
            $("#_202_of59a_party_identifier").attr("disabled", true);
            $("#_203_of59a_identifier_code").attr("disabled", true);
        } else if ($("#_202_of59a_party_identifier").val() != "" || $("#_203_of59a_identifier_code").val() != "") {
            $("#type_of59_59a_seq_b").val("a").attr("selected", true);
            $("#div_mf59no_beneficiary").hide();
            $("#div_mf59a_beneficiary").show();
            $("#_200_of59_beneficiary").attr("disabled", true);
            $("#_201_of59_name_address").attr("disabled", true);
            $("#_202_of59a_party_identifier").attr("disabled", false);
            $("#_203_of59a_identifier_code").attr("disabled", false);
        } else {
            $("#div_mf59no_beneficiary").hide();
            $("#div_mf59a_beneficiary").hide();
            $("#_200_of59_beneficiary").attr("disabled", true);
            $("#_201_of59_name_address").attr("disabled", true);
            $("#_202_of59a_party_identifier").attr("disabled", true);
            $("#_203_of59a_identifier_code").attr("disabled", true);
        }
        //end of the line
        
        //Seq C checkbox
//        if ($("#_260_of23b_expiry_type").val() != "" || $("#_270_of31e_date_of_expiry").val() != "" || $("#_280_of35g_expiry_conditions_event").val() != "" || $("#_300_of77l_other_amandments_to_local_undertaking").val() != ""){
//            $("#seq_C_checkbox").attr("checked", true);
//            $("#check_seq_c").show();
//            $("#_260_of23b_expiry_type").attr("disabled", false);
//            $("#_270_of31e_date_of_expiry").attr("disabled", false);
//            $("#_280_of35g_expiry_conditions_event").attr("disabled", false);
//            $("#_300_of77l_other_amandments_to_local_undertaking").attr("disabled", false);
//        } else {
//            $("#check_seq_c").hide();
//            $("#_260_of23b_expiry_type").attr("disabled", true);
//            $("#_270_of31e_date_of_expiry").attr("disabled", true);
//            $("#_280_of35g_expiry_conditions_event").attr("disabled", true);
//            $("#_300_of77l_other_amandments_to_local_undertaking").attr("disabled", true);
//        }
        //end of the line
        
        //Seq C checkbox
        if ($("#_300_of77l_other_amandments_to_local_undertaking").val() != ""){
            $("#seq_C_checkbox").attr("checked", true);
            $("#check_seq_c").show();
//            $("#_260_of23b_expiry_type").attr("disabled", false);
//            $("#_270_of31e_date_of_expiry").attr("disabled", false);
//            $("#_280_of35g_expiry_conditions_event").attr("disabled", false);
            $("#_300_of77l_other_amandments_to_local_undertaking").attr("disabled", false);
        } else {
            $("#check_seq_c").hide();
//            $("#_260_of23b_expiry_type").attr("disabled", true);
//            $("#_270_of31e_date_of_expiry").attr("disabled", true);
//            $("#_280_of35g_expiry_conditions_event").attr("disabled", true);
            $("#_300_of77l_other_amandments_to_local_undertaking").attr("disabled", true);
        }
        //end of the line
        
        
       
        
        
    });
</script>

