<%-- 
    Document   : mt760
    Created on : Jun 14, 2021, 2:02:40 PM
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
                

                //MF22A Purpose of Message 
                _020_mf22a_purpose_of_message: "required",
                
//                15B New Sequence
                //MF20
                _050_mf20_undertaking_number: "required",
                
                //MF30
                _060_mf30_date_of_issue: "required",
                
                //22D Form of undertaking
                _070_mf22d_form_of_undertaking: "required",
                
//                MF40C Applicable Rules
                _080_mf40c_type: "required",
                
//                MF23B Expiry Type
                _090_mf23b_type: "required",
                
//                MF52a Issuer
                type_mf52a_issuer: "required",
                _141_mf52a_identifier_code: "required",
                _144_mf52d_name_address: "required",
                
//                MF59a Beneficiary
                type_of59a_beneficiary: "required",
                _151_mf59_name_address: "required",
                _153_mf59a_identifier_code: "required",
                
//                32B Undertaking Amount
                _190_mf32b_currency: "required",
                _191_mf32b_amount: "required",
                
//                77U Undertaking Terms and Conditions
                _240_of77u_undertaking_terms_and_conditions: "required",
                
                
                
                //template
                template_name: "required"
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf27_number: {required: "mf27_number harus diisi..!!"},
                _011_mf27_total: {required: "mf27_total harus diisi..!!"},
                _020_mf22a_purpose_of_message: {required: "mf22a_purpose_of_message harus diisi..!!"},
                _050_mf20_undertaking_number: {required: "mf20_undertaking_number harus diisi..!!"},
                _060_mf30_date_of_issue: {required: "mf30_date_of_issue diisi..!!"},
                _070_mf22d_form_of_undertaking: {required: "mf22d_form_of_undertaking harus diisi..!!"},
                _080_mf40c_type: {required: "mf40c_type harus diisi..!!"},
                _090_mf23b_type: {required: "mf23b_type harus diisi..!!"},
                _141_mf52a_identifier_code: {required: "mf52a_identifier_code harus diisi..!!"},
                _144_mf52d_name_address: {required: "mf52d_name_address harus diisi..!!"},
                _151_mf59_name_address: {required: "mf59_name_address harus diisi..!!"},
                _153_mf59a_identifier_code: {required: "mf59a_identifier_code harus diisi..!!"},
                _190_mf32b_currency: {required: "mf32b_currency harus diisi..!!"},
                _191_mf32b_amount: {required: "mf32b_amount harus diisi..!!"},
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
        $("#_150_mf59_beneficiary").attr("disabled", true);
        $("#_151_mf59_name_address").attr("disabled", true);
        $("#_152_mf59a_party_identifier").attr("disabled", true);
        $("#_153_mf59a_identifier_code").attr("disabled", true);
        $("#type_of59a_beneficiary").change(function () {
            if ($("#type_of59a_beneficiary").val() == "no") {
                $("#div_mf59no_beneficiary").show();
                $("#div_mf59a_beneficiary").hide();
                $("#_150_mf59_beneficiary").attr("disabled", false);
                $("#_151_mf59_name_address").attr("disabled", false);
                $("#_152_mf59a_party_identifier").attr("disabled", true);
                $("#_153_mf59a_identifier_code").attr("disabled", true);
            } else if ($("#type_of59a_beneficiary").val() == "a") {
                $("#div_mf59no_beneficiary").hide();
                $("#div_mf59a_beneficiary").show();
                $("#_150_mf59_beneficiary").attr("disabled", true);
                $("#_151_mf59_name_address").attr("disabled", true);
                $("#_152_mf59a_party_identifier").attr("disabled", false);
                $("#_153_mf59a_identifier_code").attr("disabled", false);
            } else {
                $("#div_mf59no_beneficiary").hide();
                $("#div_mf59a_beneficiary").hide();
                $("#_150_mf59_beneficiary").attr("disabled", true);
                $("#_151_mf59_name_address").attr("disabled", true);
                $("#_152_mf59a_party_identifier").attr("disabled", true);
                $("#_153_mf59a_identifier_code").attr("disabled", true);
            }
        });
        //end of the line
        
        //56a Advising Bank
        $("#div_of56a_advising_bank").hide();
        $("#div_of56d_advising_bank").hide();
        $("#_160_of56a_party_identifier").attr("disabled", true);
        $("#_161_of56a_identifier_code").attr("disabled", true);
        $("#_163_of56d_party_identifier").attr("disabled", true);
        $("#_164_of56d_name_address").attr("disabled", true);
        $("#type_of56a_advising_bank").change(function () {
            if ($("#type_of56a_advising_bank").val() == "a") {
                $("#div_of56a_advising_bank").show();
                $("#div_of56d_advising_bank").hide();
                $("#_160_of56a_party_identifier").attr("disabled", false);
                $("#_161_of56a_identifier_code").attr("disabled", false);
                $("#_163_of56d_party_identifier").attr("disabled", true);
                $("#_164_of56d_name_address").attr("disabled", true);
            } else if ($("#type_of56a_advising_bank").val() == "d") {
                $("#div_of56a_advising_bank").hide();
                $("#div_of56d_advising_bank").show();
                $("#_160_of56a_party_identifier").attr("disabled", true);
                $("#_161_of56a_identifier_code").attr("disabled", true);
                $("#_163_of56d_party_identifier").attr("disabled", false);
                $("#_164_of56d_name_address").attr("disabled", false);
            } else {
                $("#div_of56a_advising_bank").hide();
                $("#div_of56d_advising_bank").hide();
                $("#_160_of56a_party_identifier").attr("disabled", true);
                $("#_161_of56a_identifier_code").attr("disabled", true);
                $("#_163_of56d_party_identifier").attr("disabled", true);
                $("#_164_of56d_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
//        OF57a 'Advise Through' Bank
        $("#div_of57a_advise_through_bank").hide();
        $("#div_of57d_advise_through_bank").hide();
        $("#_180_of57a_party_identifier").attr("disabled", true);
        $("#_181_of57a_identifier_code").attr("disabled", true);
        $("#_183_of57d_party_identifier").attr("disabled", true);
        $("#_184_of57d_name_address").attr("disabled", true);
        $("#type_of57a_advise_through_bank").change(function () {
            if ($("#type_of57a_advise_through_bank").val() == "a") {
                $("#div_of57a_advise_through_bank").show();
                $("#div_of57d_advise_through_bank").hide();
                $("#_180_of57a_party_identifier").attr("disabled", false);
                $("#_181_of57a_identifier_code").attr("disabled", false);
                $("#_183_of57d_party_identifier").attr("disabled", true);
                $("#_184_of57d_name_address").attr("disabled", true);
            } else if ($("#type_of57a_advise_through_bank").val() == "d") {
                $("#div_of57a_advise_through_bank").hide();
                $("#div_of57d_advise_through_bank").show();
                $("#_180_of57a_party_identifier").attr("disabled", true);
                $("#_181_of57a_identifier_code").attr("disabled", true);
                $("#_183_of57d_party_identifier").attr("disabled", false);
                $("#_184_of57d_name_address").attr("disabled", false);
            } else {
                $("#div_of57a_advise_through_bank").hide();
                $("#div_of57d_advise_through_bank").hide();
                $("#_180_of57a_party_identifier").attr("disabled", true);
                $("#_181_of57a_identifier_code").attr("disabled", true);
                $("#_183_of57d_party_identifier").attr("disabled", true);
                $("#_184_of57d_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
        //OF41a Avaliable With...
        $("#div_of41f_avaliable_with").hide();
        $("#div_of41g_avaliable_with").hide();
        $("#_210_of41f_identifier_code").attr("disabled", true);
        $("#_212_of41g_name_address").attr("disabled", true);
        $("#type_of41a_available_with").change(function () {
            if ($("#type_of41a_available_with").val() == "f") {
                $("#div_of41f_avaliable_with").show();
                $("#div_of41g_avaliable_with").hide();
                $("#_210_of41f_identifier_code").attr("disabled", false);
                $("#_212_of41g_name_address").attr("disabled", true);
            } else if ($("#type_of41a_available_with").val() == "g") {
                $("#div_of41f_avaliable_with").hide();
                $("#div_of41g_avaliable_with").show();
                $("#_210_of41f_identifier_code").attr("disabled", true);
                $("#_212_of41g_name_address").attr("disabled", false);
            } else {
                $("#div_of41f_avaliable_with").hide();
                $("#div_of41g_avaliable_with").hide();
                $("#_210_of41f_identifier_code").attr("disabled", true);
                $("#_212_of41g_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
//        OF58a Requested Confirmation Party
        $("#div_of58a_requested_confirmation_party").hide();
        $("#div_of58d_requested_confirmation_party").hide();
        $("#_260_of58a_party_identifier").attr("disabled", true);
        $("#_261_of58a_identifier_code").attr("disabled", true);
        $("#_263_of58d_party_identifier").attr("disabled", true);
        $("#_264_of58d_name_address").attr("disabled", true);
        $("#type_of58a_requested_confirmation_party").change(function () {
            if ($("#type_of58a_requested_confirmation_party").val() == "a") {
                $("#div_of58a_requested_confirmation_party").show();
                $("#div_of58d_requested_confirmation_party").hide();
                $("#_260_of58a_party_identifier").attr("disabled", false);
                $("#_261_of58a_identifier_code").attr("disabled", false);
                $("#_263_of58d_party_identifier").attr("disabled", true);
                $("#_264_of58d_name_address").attr("disabled", true);
            } else if ($("#type_of58a_requested_confirmation_party").val() == "d") {
                $("#div_of58a_requested_confirmation_party").hide();
                $("#div_of58d_requested_confirmation_party").show();
                $("#_260_of58a_party_identifier").attr("disabled", true);
                $("#_261_of58a_identifier_code").attr("disabled", true);
                $("#_263_of58d_party_identifier").attr("disabled", false);
                $("#_264_of58d_name_address").attr("disabled", false);
            } else {
                $("#div_of58a_requested_confirmation_party").hide();
                $("#div_of58d_requested_confirmation_party").hide();
                $("#_260_of58a_party_identifier").attr("disabled", true);
                $("#_261_of58a_identifier_code").attr("disabled", true);
                $("#_263_of58d_party_identifier").attr("disabled", true);
                $("#_264_of58d_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
        //OF52a Issuer
        $("#div_of52a_issuer").hide();
        $("#div_of52d_issuer").hide();
        $("#_460_of52a_party_identifier").attr("disabled", true);
        $("#_461_of52a_identifier_code").attr("disabled", true);
        $("#_463_of52d_party_identifier").attr("disabled", true);
        $("#_464_of52d_name_address").attr("disabled", true);
        $("#type_of52a_issuer").change(function () {
            if ($("#type_of52a_issuer").val() == "a") {
                $("#div_of52a_issuer").show();
                $("#div_of52d_issuer").hide();
                $("#_460_of52a_party_identifier").attr("disabled", false);
                $("#_461_of52a_identifier_code").attr("disabled", false);
                $("#_463_of52d_party_identifier").attr("disabled", true);
                $("#_464_of52d_name_address").attr("disabled", true);
            } else if ($("#type_of52a_issuer").val() == "d") {
                $("#div_of52a_issuer").hide();
                $("#div_of52d_issuer").show();
                $("#_460_of52a_party_identifier").attr("disabled", true);
                $("#_461_of52a_identifier_code").attr("disabled", true);
                $("#_463_of52d_party_identifier").attr("disabled", false);
                $("#_464_of52d_name_address").attr("disabled", false);
            } else {
                $("#div_of52a_issuer").hide();
                $("#div_of52d_issuer").hide();
                $("#_460_of52a_party_identifier").attr("disabled", true);
                $("#_461_of52a_identifier_code").attr("disabled", true);
                $("#_463_of52d_party_identifier").attr("disabled", true);
                $("#_464_of52d_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
        
        //OF41a Avaliable With...2
        $("#div_of41f_avaliable_with_2").hide();
        $("#div_of41g_avaliable_with_2").hide();
        $("#_500_of41f_identifier_code").attr("disabled", true);
        $("#_502_of41g_name_address").attr("disabled", true);
        $("#type_of41a_available_with_2").change(function () {
            if ($("#type_of41a_available_with_2").val() == "f") {
                $("#div_of41f_avaliable_with_2").show();
                $("#div_of41g_avaliable_with_2").hide();
                $("#_500_of41f_identifier_code").attr("disabled", false);
                $("#_502_of41g_name_address").attr("disabled", true);
            } else if ($("#type_of41a_available_with_2").val() == "g") {
                $("#div_of41f_avaliable_with_2").hide();
                $("#div_of41g_avaliable_with_2").show();
                $("#_500_of41f_identifier_code").attr("disabled", true);
                $("#_502_of41g_name_address").attr("disabled", false);
            } else {
                $("#div_of41f_avaliable_with_2").hide();
                $("#div_of41g_avaliable_with_2").hide();
                $("#_500_of41f_identifier_code").attr("disabled", true);
                $("#_502_of41g_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
        //Seq C checkbox
        $("#check_seq_c").hide();
        $("#_390_mf22d_form_of_undertaking").attr("disabled", true);
        $("#_400_mf40c_type").attr("disabled", true);
        $("#_401_mf40c_narrative").attr("disabled", true);
        $("#_420_mf23b_type").attr("disabled", true);
        $("#seq_C_checkbox").click(function () {
            if ($("#seq_C_checkbox").is(":checked")) {
                $("#check_seq_c").show();
                $("#_390_mf22d_form_of_undertaking").attr("disabled", false);
                $("#_400_mf40c_type").attr("disabled", false);
                $("#_401_mf40c_narrative").attr("disabled", false);
                $("#_420_mf23b_type").attr("disabled", false);
            } else {
                $("#check_seq_c").hide();
                $("#_390_mf22d_form_of_undertaking").attr("disabled", true);
                $("#_400_mf40c_type").attr("disabled", true);
                $("#_401_mf40c_narrative").attr("disabled", true);
                $("#_420_mf23b_type").attr("disabled", true);
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
        console.log("kadieuu 365 " + $("#_143_mf52d_party_identifier").val());
        if ($("#_140_mf52a_party_identifier").val() != "" || $("#_141_mf52a_identifier_code").val() != "") {
            $("#type_mf52a_issuer").val("a").attr("selected", true);
            $("#div_mf52a_issuer").show();
            $("#div_mf52d_issuer").hide();
            $("#_140_mf52a_party_identifier").attr("disabled", false);
            $("#_141_mf52a_identifier_code").attr("disabled", false);
            $("#_143_mf52d_party_identifier").attr("disabled", true);
            $("#_144_mf52d_name_address").attr("disabled", true);
        } else if ($("#_143_mf52d_party_identifier").val() != "" || $("#_144_mf52d_name_address").val() != "") {
            console.log("kadieuu" + $("#_143_mf52d_party_identifier").val());
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
        if ($("#_150_mf59_beneficiary").val() != "" || $("#_151_mf59_name_address").val() != "") {
            $("#type_of59a_beneficiary").val("no").attr("selected", true);
            $("#div_mf59no_beneficiary").show();
            $("#div_mf59a_beneficiary").hide();
            $("#_150_mf59_beneficiary").attr("disabled", false);
            $("#_151_mf59_name_address").attr("disabled", false);
            $("#_152_mf59a_party_identifier").attr("disabled", true);
            $("#_153_mf59a_identifier_code").attr("disabled", true);
        } else if ($("#_152_mf59a_party_identifier").val() != "" || $("#_153_mf59a_identifier_code").val() != "") {
            $("#type_of59a_beneficiary").val("a").attr("selected", true);
            $("#div_mf59no_beneficiary").hide();
            $("#div_mf59a_beneficiary").show();
            $("#_150_mf59_beneficiary").attr("disabled", true);
            $("#_151_mf59_name_address").attr("disabled", true);
            $("#_152_mf59a_party_identifier").attr("disabled", false);
            $("#_153_mf59a_identifier_code").attr("disabled", false);
        } else {
            $("#div_mf59no_beneficiary").hide();
            $("#div_mf59a_beneficiary").hide();
            $("#_150_mf59_beneficiary").attr("disabled", true);
            $("#_151_mf59_name_address").attr("disabled", true);
            $("#_152_mf59a_party_identifier").attr("disabled", true);
            $("#_153_mf59a_identifier_code").attr("disabled", true);
        }
        //end of the line
        
        //56a Advising Bank
        if ($("#_160_of56a_party_identifier").val() != "" || $("#_161_of56a_identifier_code").val() != "") {
            $("#type_of56a_advising_bank").val("a").attr("selected", true);
            $("#div_of56a_advising_bank").show();
            $("#div_of56d_advising_bank").hide();
            $("#_160_of56a_party_identifier").attr("disabled", false);
            $("#_161_of56a_identifier_code").attr("disabled", false);
            $("#_163_of56d_party_identifier").attr("disabled", true);
            $("#_164_of56d_name_address").attr("disabled", true);
        } else if ($("#_163_of56d_party_identifier").val() != "" || $("#_164_of56d_name_address").val() != "") {
            $("#type_of56a_advising_bank").val("d").attr("selected", true);
            $("#div_of56a_advising_bank").hide();
            $("#div_of56d_advising_bank").show();
            $("#_160_of56a_party_identifier").attr("disabled", true);
            $("#_161_of56a_identifier_code").attr("disabled", true);
            $("#_163_of56d_party_identifier").attr("disabled", false);
            $("#_164_of56d_name_address").attr("disabled", false);
        } else {
            $("#div_of56a_advising_bank").hide();
            $("#div_of56d_advising_bank").hide();
            $("#_160_of56a_party_identifier").attr("disabled", true);
            $("#_161_of56a_identifier_code").attr("disabled", true);
            $("#_163_of56d_party_identifier").attr("disabled", true);
            $("#_164_of56d_name_address").attr("disabled", true);
        }
        //end of the line
        
//         OF57a 'Advise Through' Bank
        if ($("#_180_of57a_party_identifier").val() != "" || $("#_181_of57a_identifier_code").val() != "") {
            $("#type_of57a_advise_through_bank").val("a").attr("selected", true);
            $("#div_of57a_advise_through_bank").show();
            $("#div_of57d_advise_through_bank").hide();
            $("#_180_of57a_party_identifier").attr("disabled", false);
            $("#_181_of57a_identifier_code").attr("disabled", false);
            $("#_183_of57d_party_identifier").attr("disabled", true);
            $("#_184_of57d_name_address").attr("disabled", true);
        } else if ($("#_183_of57d_party_identifier").val() != "" || $("#_184_of57d_name_address").val() != "") {
            $("#type_of57a_advise_through_bank").val("d").attr("selected", true);
            $("#div_of57a_advise_through_bank").hide();
            $("#div_of57d_advise_through_bank").show();
            $("#_180_of57a_party_identifier").attr("disabled", true);
            $("#_181_of57a_identifier_code").attr("disabled", true);
            $("#_183_of57d_party_identifier").attr("disabled", false);
            $("#_184_of57d_name_address").attr("disabled", false);
        } else {
            $("#div_of57a_advise_through_bank").hide();
            $("#div_of57d_advise_through_bank").hide();
            $("#_180_of57a_party_identifier").attr("disabled", true);
            $("#_181_of57a_identifier_code").attr("disabled", true);
            $("#_183_of57d_party_identifier").attr("disabled", true);
            $("#_184_of57d_name_address").attr("disabled", true);
        }
        //end of the line
        
        //OF41a Avaliable With...
        if ($("#_210_of41f_identifier_code").val() != "") {
            $("#type_of41a_available_with").val("f").attr("selected", true);
            $("#div_of41f_avaliable_with").show();
            $("#div_of41g_avaliable_with").hide();
            $("#_210_of41f_identifier_code").attr("disabled", false);
            $("#_212_of41g_name_address").attr("disabled", true);
        } else if ($("#_212_of41g_name_address").val() != "" ) {
            $("#type_of41a_available_with").val("g").attr("selected", true);
            $("#div_of41f_avaliable_with").hide();
            $("#div_of41g_avaliable_with").show();
            $("#_210_of41f_identifier_code").attr("disabled", true);
            $("#_212_of41g_name_address").attr("disabled", false);
        } else {
            $("#div_of41f_avaliable_with").hide();
            $("#div_of41g_avaliable_with").hide();
            $("#_210_of41f_identifier_code").attr("disabled", true);
            $("#_212_of41g_name_address").attr("disabled", true);
        }
        //end of the line
        
//        OF58a Requested Confirmation Party
        if ($("#_260_of58a_party_identifier").val() != "" || $("#_261_of58a_identifier_code").val() != "") {
            $("#type_of58a_requested_confirmation_party").val("a").attr("selected", true);
            $("#div_of58a_requested_confirmation_party").show();
            $("#div_of58d_requested_confirmation_party").hide();
            $("#_260_of58a_party_identifier").attr("disabled", false);
            $("#_261_of58a_identifier_code").attr("disabled", false);
            $("#_263_of58d_party_identifier").attr("disabled", true);
            $("#_264_of58d_name_address").attr("disabled", true);
        } else if ($("#_263_of58d_party_identifier").val() != "" || $("#_264_of58d_name_address").val() != "") {
            $("#type_of58a_requested_confirmation_party").val("d").attr("selected", true);
            $("#div_of58a_requested_confirmation_party").hide();
            $("#div_of58d_requested_confirmation_party").show();
            $("#_260_of58a_party_identifier").attr("disabled", true);
            $("#_261_of58a_identifier_code").attr("disabled", true);
            $("#_263_of58d_party_identifier").attr("disabled", false);
            $("#_264_of58d_name_address").attr("disabled", false);
        } else {
            $("#div_of58a_requested_confirmation_party").hide();
            $("#div_of58d_requested_confirmation_party").hide();
            $("#_260_of58a_party_identifier").attr("disabled", true);
            $("#_261_of58a_identifier_code").attr("disabled", true);
            $("#_263_of58d_party_identifier").attr("disabled", true);
            $("#_264_of58d_name_address").attr("disabled", true);
        }
        //end of the line
        
        //OF52a Issuer
        if ($("#_460_of52a_party_identifier").val() != "" || $("#_461_of52a_identifier_code").val() != "") {
            $("#type_of52a_issuer").val("a").attr("selected", true);
            $("#div_of52a_issuer").show();
            $("#div_of52d_issuer").hide();
            $("#_460_of52a_party_identifier").attr("disabled", false);
            $("#_461_of52a_identifier_code").attr("disabled", false);
            $("#_463_of52d_party_identifier").attr("disabled", true);
            $("#_464_of52d_name_address").attr("disabled", true);
        } else if ($("#_463_of52d_party_identifier").val() != "" || $("#_464_of52d_name_address").val() != "") {
            $("#type_of52a_issuer").val("d").attr("selected", true);
            $("#div_of52a_issuer").hide();
            $("#div_of52d_issuer").show();
            $("#_460_of52a_party_identifier").attr("disabled", true);
            $("#_461_of52a_identifier_code").attr("disabled", true);
            $("#_463_of52d_party_identifier").attr("disabled", false);
            $("#_464_of52d_name_address").attr("disabled", false);
        } else {
            $("#div_of52a_issuer").hide();
            $("#div_of52d_issuer").hide();
            $("#_460_of52a_party_identifier").attr("disabled", true);
            $("#_461_of52a_identifier_code").attr("disabled", true);
            $("#_463_of52d_party_identifier").attr("disabled", true);
            $("#_464_of52d_name_address").attr("disabled", true);
        }
        //end of the line
        
        
        //OF41a Avaliable With...2
        if ($("#_500_of41f_identifier_code").val() != "") {
            $("#type_of41a_available_with_2").val("f").attr("selected", true);
            $("#div_of41f_avaliable_with_2").show();
            $("#div_of41g_avaliable_with_2").hide();
            $("#_500_of41f_identifier_code").attr("disabled", false);
            $("#_502_of41g_name_address").attr("disabled", true);
        } else if ($("#_502_of41g_name_address").val() != "" ) {
            $("#type_of41a_available_with_2").val("g").attr("selected", true);
            $("#div_of41f_avaliable_with_2").hide();
            $("#div_of41g_avaliable_with_2").show();
            $("#_500_of41f_identifier_code").attr("disabled", true);
            $("#_502_of41g_name_address").attr("disabled", false);
        } else {
            $("#div_of41f_avaliable_with_2").hide();
            $("#div_of41g_avaliable_with_2").hide();
            $("#_500_of41f_identifier_code").attr("disabled", true);
            $("#_502_of41g_name_address").attr("disabled", true);
        }
        //end of the line
        
        //Seq C checkbox
        if ($("#_390_mf22d_form_of_undertaking").val() != "" || $("#_400_mf40c_type").val() != "" || $("#_401_mf40c_narrative").val() != "" || $("#_420_mf23b_type").val() != ""){
            $("#seq_C_checkbox").attr("checked", true);
            $("#check_seq_c").show();
            $("#_390_mf22d_form_of_undertaking").attr("disabled", false);
            $("#_400_mf40c_type").attr("disabled", false);
            $("#_401_mf40c_narrative").attr("disabled", false);
            $("#_420_mf23b_type").attr("disabled", false);
        } else {
            $("#check_seq_c").hide();
            $("#_390_mf22d_form_of_undertaking").attr("disabled", true);
            $("#_400_mf40c_type").attr("disabled", true);
            $("#_401_mf40c_narrative").attr("disabled", true);
            $("#_420_mf23b_type").attr("disabled", true);
        }
        //end of the line
       
        
        
    });
    
</script>
