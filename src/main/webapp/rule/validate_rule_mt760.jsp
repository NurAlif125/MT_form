<%-- 
    Document   : validate_rule_mt760
    Created on : Jun 14, 2021, 2:02:40 PM
    Author     : Ovasae
--%>

<script type="text/javascript">
    $(document).ready(function() {
        let validator = $("#form1").validate({
            ignore: [],  
            onkeyup: false,          // Nonaktifkan validasi saat mengetik
            onfocusout: false,       // Nonaktifkan validasi saat pindah input
//            onclick: false,          // Nonaktifkan validasi saat klik
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
                _020_mf27_number: "required",
                _021_mf27_total: "required",
                

                //MF22A Purpose of Message 
                _030_mf22a_purpose_of_message: "required",
                
//                15B New Sequence
                //MF20
                _070_mf20_undertaking_number: "required",
                
                //MF30
                _080_mf30_date_of_issue: "required",
                
                //22D Form of undertaking
                _090_mf22d_form_of_undertaking: "required",
                
//                MF40C Applicable Rules
                _100_mf40c_applicable_rules: "required",
                
//                MF23B Expiry Type
                _110_mf23b_expiry_type: "required",
                
//                MF52a Issuer
                _160_mf52a_issuer: "required",
                _162_mf52a_identifier_code: {
                    required: function(element) {
                        return $("#_160_mf52a_issuer").val() == "a";
                    }
                },
                _164_mf52d_name_address: {
                    required: function(element) {
                        return $("#_160_mf52a_issuer").val() == "d";
                    }
                },
                
//                MF59a Beneficiary
                _170_mf59a_beneficiary: "required",
                _172_mf59a_name_address: {
                    required: function(element) {
                        return $("#_170_mf59a_beneficiary").val() == "no";
                    }
                },
                _174_mf59a_identifier_code: {
                    required: function(element) {
                        return $("#_170_mf59a_beneficiary").val() == "a";
                    }
                },
                
//                32B Undertaking Amount
                _210_mf32b_currency: "required",
                _211_mf32b_amount: "required",
                
//                77U Undertaking Terms and Conditions
                _260_mf77u_undertaking_terms_and_conditions: "required",
                
                
                
                //template
                template_name: "required"
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
                receiver_institution: {required: "receiver_institution must be filled..!!"},
                priority: {required: "priority must be filled..!!"},
                _020_mf27_number: {required: "mf27_number must be filled..!!"},
                _021_mf27_total: {required: "mf27_total must be filled..!!"},
                _030_mf22a_purpose_of_message: {required: "mf22a_purpose_of_message must be filled..!!"},
                _070_mf20_undertaking_number: {required: "mf20_undertaking_number must be filled..!!"},
                _080_mf30_date_of_issue: {required: "mf30_date_of_issue must be filled..!!"},
                _090_mf22d_form_of_undertaking: {required: "mf22d_form_of_undertaking must be filled..!!"},
                _100_mf40c_applicable_rules: {required: "mf40c_applicable_rules must be filled..!!"},
                _110_mf23b_expiry_type: {required: "mf23b_expiry_type must be filled..!!"},
                _160_mf52a_issuer: {required: "mf52a_issuer must be filled..!!"},
                _162_mf52a_identifier_code: {required: "mf52a_identifier_code must be filled..!!"},
                _164_mf52d_name_address: {required: "mf52d_name_address must be filled..!!"},
                _170_mf59a_beneficiary: {required: "mf59a_beneficiary must be filled..!!"},
                _172_mf59a_name_address: {required: "mf59a_name_address must be filled..!!"},
                _174_mf59a_identifier_code: {required: "mf59a_identifier_code must be filled..!!"},
                _210_mf32b_currency: {required: "mf32b_currency must be filled..!!"},
                _211_mf32b_amount: {required: "mf32b_amount must be filled..!!"},
                _260_mf77u_undertaking_terms_and_conditions: {required: "mf77u_undertaking_terms_and_conditions must be filled..!!"},
                template_name: {required: "Template Name must be filled..!!"}
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
                //alert(error.html());
                $("#tab-validate").removeAttr("hidden");
            },
            showErrors: function (errorMap, errorList) {
                this.defaultShowErrors();
                $("#tab-validate").removeAttr("hidden");
                 
                $("#view1, #view2, #view3, #view4, #view5, #view6, #view7").css("display", "none");
                $("#view8").css("display", "block");
                $('#tab-view1').removeClass("selected").removeAttr('class');
                $('#tab-view2').removeClass("selected").removeAttr('class');
                $('#tab-view3').removeClass("selected").removeAttr('class');
                $('#tab-view4').removeClass("selected").removeAttr('class');
                $('#tab-view5').removeClass("selected").removeAttr('class');
                $('#tab-view6').removeClass("selected").removeAttr('class');
                $('#tab-view7').removeClass("selected").removeAttr('class');
                $('#tab-validate').addClass("selected");

                let errorContainer = document.getElementById("error-container");
                
                if (errorList.length === 0) {
                    errorContainer.innerHTML = ""; 
//                    return;
                } 
                
                let tableHTML = `<table border="0" style="width:100% !important; caption-side: bottom; font-size:8pt !important;border-collapse: collapse; border:1px gray solid;">
                                    <tr style="background:#d6d6d6;">
                                    <th>Type</th>
                                    <th>Location</th>
                                    <th>Node</th>
                                    <th>Message</th></tr>`;

                    
                errorList.forEach(errors => {
                    let inputID = errors.element.id || "";
                    let locationTab = errors.element.getAttribute("location") || "";
                    let inputType = errors.element.getAttribute("input_type") || "";

                    tableHTML += '<tr class="error__row" data-input-id="'+inputID+'" content-body="'+locationTab+'" onmouseover="this.style.background=\'#f6f6f6\'" onmouseout="this.style.backgroundColor=\'transparent\'" style="cursor:pointer;">';
                    tableHTML += '<td style="padding: 5px;">Error</td>';
                    tableHTML += '<td style="padding: 5px;">'+locationTab+'</td>';
                    tableHTML += '<td style="padding: 5px;">'+inputType+'</td>';
                    tableHTML += '<td style="padding: 5px;">'+errors.message+'</td></tr>';
                });

                tableHTML += `</table>`;
                errorContainer.innerHTML = tableHTML; 
                
                document.querySelectorAll(".error__row").forEach(row => {
                    row.addEventListener("click", function () {
                        let targetRow = event.target.closest(".error__row"); 
                        let inputId = this.getAttribute("data-input-id");
                        let tabContentGroup = this.getAttribute("content-body");
                        
                    if (targetRow) {
                        let input = document.getElementById(inputId);
                        if (input) {
                            if(tabContentGroup == "Header") {
                                $("#view2, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                $("#view1").css("display", "block");
                                $('#tab-view1').addClass("selected");
                                $('#tab-view2').removeClass("selected").removeAttr('class');
                                $('#tab-view3').removeClass("selected").removeAttr('class');
                                $('#tab-view4').removeClass("selected").removeAttr('class');
                                $('#tab-view5').removeClass("selected").removeAttr('class');
                                $('#tab-view6').removeClass("selected").removeAttr('class');
                                $('#tab-view7').removeClass("selected").removeAttr('class');
                                $('#tab-validate').removeClass("selected").removeAttr('class');
                            } 
                            else if (tabContentGroup == "Body") {
                                 $("#view1, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                $('#tab-view1').removeClass("selected").removeAttr('class');
                                $('#tab-view2').addClass("selected");
                                $('#tab-view3').removeClass("selected").removeAttr('class');
                                $('#tab-view4').removeClass("selected").removeAttr('class');
                                $('#tab-view5').removeClass("selected").removeAttr('class');
                                $('#tab-view6').removeClass("selected").removeAttr('class');
                                $('#tab-view7').removeClass("selected").removeAttr('class');
                                $('#tab-validate').removeClass("selected").removeAttr('class');
                                $("#view2").css("display", "block");
                                
                            }
                            
                            input.focus();
                        } else {
                            console.log("nothing input element")
                        }
                    }
                    });
                });
            }
        });
        
        $("#btn-validate").click(function () {
            let isValid = $("#form1").valid(); 
            if (isValid) {
                alert("All inputs are valid!");
            } 
        });

        $("#submit_mt").click(function (e) {
            e.preventDefault();
            let isValid = $("#form1").valid(); 
            if (isValid) {  
                if (confirm("Do you want to save the message?")) {
                    $("#form1").submit(); 
                }
            } else {
                alert("There are still errors! Please fix them before saving.");
            }
        });
        
        $.validator.addMethod("regex", function(value, element, param) {
            //this.optional(element) lewati validasi jika kosong dan param.test(value) check regex
            return this.optional(element) || param.test(value); 
//            Jika tidak ada pesan khusus dalam messages tampilkan "Format tidak valid"
        }, "Invalid format");
    
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<!--Script untuk menampilkan-->
<script type="text/javascript">
    $(document).ready(function () {
      //MF52a Issuer
        $("#div_mf52a_issuer").hide();
        $("#div_mf52d_issuer").hide();
        $("#_161_mf52a_party_identifier").attr("disabled", true);
        $("#_162_mf52a_identifier_code").attr("disabled", true);
        $("#_163_mf52d_party_identifier").attr("disabled", true);
        $("#_164_mf52d_name_address").attr("disabled", true);
        $("#_160_mf52a_issuer").change(function () {
            if ($("#_160_mf52a_issuer").val() == "a") {
                $("#div_mf52a_issuer").show();
                $("#div_mf52d_issuer").hide();
                $("#_161_mf52a_party_identifier").attr("disabled", false);
                $("#_162_mf52a_identifier_code").attr("disabled", false);
                $("#_163_mf52d_party_identifier").attr("disabled", true);
                $("#_164_mf52d_name_address").attr("disabled", true);
            } else if ($("#_160_mf52a_issuer").val() == "d") {
                $("#div_mf52a_issuer").hide();
                $("#div_mf52d_issuer").show();
                $("#_161_mf52a_party_identifier").attr("disabled", true);
                $("#_162_mf52a_identifier_code").attr("disabled", true);
                $("#_163_mf52d_party_identifier").attr("disabled", false);
                $("#_164_mf52d_name_address").attr("disabled", false);
            } else {
                $("#div_mf52a_issuer").hide();
                $("#div_mf52d_issuer").hide();
                $("#_161_mf52a_party_identifier").attr("disabled", true);
                $("#_162_mf52a_identifier_code").attr("disabled", true);
                $("#_163_mf52d_party_identifier").attr("disabled", true);
                $("#_164_mf52d_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
        //MF59a Beneficiary
        $("#div_mf59no_beneficiary").hide();
        $("#div_mf59a_beneficiary").hide();
        $("#_171_mf59a_account").attr("disabled", true);
        $("#_172_mf59a_name_address").attr("disabled", true);
        $("#_173_mf59a_account").attr("disabled", true);
        $("#_174_mf59a_identifier_code").attr("disabled", true);
        $("#_170_mf59a_beneficiary").change(function () {
            if ($("#_170_mf59a_beneficiary").val() == "no") {
                $("#div_mf59no_beneficiary").show();
                $("#div_mf59a_beneficiary").hide();
                $("#_171_mf59a_account").attr("disabled", false);
                $("#_172_mf59a_name_address").attr("disabled", false);
                $("#_173_mf59a_account").attr("disabled", true);
                $("#_174_mf59a_identifier_code").attr("disabled", true);
            } else if ($("#_170_mf59a_beneficiary").val() == "a") {
                $("#div_mf59no_beneficiary").hide();
                $("#div_mf59a_beneficiary").show();
                $("#_171_mf59a_account").attr("disabled", true);
                $("#_172_mf59a_name_address").attr("disabled", true);
                $("#_173_mf59a_account").attr("disabled", false);
                $("#_174_mf59a_identifier_code").attr("disabled", false);
            } else {
                $("#div_mf59no_beneficiary").hide();
                $("#div_mf59a_beneficiary").hide();
                $("#_171_mf59a_account").attr("disabled", true);
                $("#_172_mf59a_name_address").attr("disabled", true);
                $("#_173_mf59a_account").attr("disabled", true);
                $("#_174_mf59a_identifier_code").attr("disabled", true);
            }
        });
        //end of the line
        
        //56a Advising Bank
        $("#div_of56a_advising_bank").hide();
        $("#div_of56d_advising_bank").hide();
        $("#_181_of56a_party_identifier").attr("disabled", true);
        $("#_182_of56a_identifier_code").attr("disabled", true);
        $("#_183_of56d_party_identifier").attr("disabled", true);
        $("#_184_of56d_name_address").attr("disabled", true);
        $("#_180_of56a_advising_bank").change(function () {
            if ($("#_180_of56a_advising_bank").val() == "a") {
                $("#div_of56a_advising_bank").show();
                $("#div_of56d_advising_bank").hide();
                $("#_181_of56a_party_identifier").attr("disabled", false);
                $("#_182_of56a_identifier_code").attr("disabled", false);
                $("#_183_of56d_party_identifier").attr("disabled", true);
                $("#_184_of56d_name_address").attr("disabled", true);
            } else if ($("#_180_of56a_advising_bank").val() == "d") {
                $("#div_of56a_advising_bank").hide();
                $("#div_of56d_advising_bank").show();
                $("#_181_of56a_party_identifier").attr("disabled", true);
                $("#_182_of56a_identifier_code").attr("disabled", true);
                $("#_183_of56d_party_identifier").attr("disabled", false);
                $("#_184_of56d_name_address").attr("disabled", false);
            } else {
                $("#div_of56a_advising_bank").hide();
                $("#div_of56d_advising_bank").hide();
                $("#_181_of56a_party_identifier").attr("disabled", true);
                $("#_182_of56a_identifier_code").attr("disabled", true);
                $("#_183_of56d_party_identifier").attr("disabled", true);
                $("#_184_of56d_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
//        OF57a 'Advise Through' Bank
        $("#div_of57a_advise_through_bank").hide();
        $("#div_of57d_advise_through_bank").hide();
        $("#_201_of57a_party_identifier").attr("disabled", true);
        $("#_202_of57a_identifier_code").attr("disabled", true);
        $("#_203_of57d_party_identifier").attr("disabled", true);
        $("#_204_of57d_name_address").attr("disabled", true);
        $("#_200_of57a_advise_through_bank").change(function () {
            if ($("#_200_of57a_advise_through_bank").val() == "a") {
                $("#div_of57a_advise_through_bank").show();
                $("#div_of57d_advise_through_bank").hide();
                $("#_201_of57a_party_identifier").attr("disabled", false);
                $("#_202_of57a_identifier_code").attr("disabled", false);
                $("#_203_of57d_party_identifier").attr("disabled", true);
                $("#_204_of57d_name_address").attr("disabled", true);
            } else if ($("#_200_of57a_advise_through_bank").val() == "d") {
                $("#div_of57a_advise_through_bank").hide();
                $("#div_of57d_advise_through_bank").show();
                $("#_201_of57a_party_identifier").attr("disabled", true);
                $("#_202_of57a_identifier_code").attr("disabled", true);
                $("#_203_of57d_party_identifier").attr("disabled", false);
                $("#_204_of57d_name_address").attr("disabled", false);
            } else {
                $("#div_of57a_advise_through_bank").hide();
                $("#div_of57d_advise_through_bank").hide();
                $("#_201_of57a_party_identifier").attr("disabled", true);
                $("#_202_of57a_identifier_code").attr("disabled", true);
                $("#_203_of57d_party_identifier").attr("disabled", true);
                $("#_204_of57d_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
        //OF41a Avaliable With...
        $("#div_of41f_avaliable_with").hide();
        $("#div_of41g_avaliable_with").hide();
        $("#_231_of41f_identifier_code").attr("disabled", true);
        $("#_232_of41g_name_address").attr("disabled", true);
        $("#_230_of41a_available_with").change(function () {
            if ($("#_230_of41a_available_with").val() == "f") {
                $("#div_of41f_avaliable_with").show();
                $("#div_of41g_avaliable_with").hide();
                $("#_231_of41f_identifier_code").attr("disabled", false);
                $("#_232_of41g_name_address").attr("disabled", true);
            } else if ($("#_230_of41a_available_with").val() == "g") {
                $("#div_of41f_avaliable_with").hide();
                $("#div_of41g_avaliable_with").show();
                $("#_231_of41f_identifier_code").attr("disabled", true);
                $("#_232_of41g_name_address").attr("disabled", false);
            } else {
                $("#div_of41f_avaliable_with").hide();
                $("#div_of41g_avaliable_with").hide();
                $("#_231_of41f_identifier_code").attr("disabled", true);
                $("#_232_of41g_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
//        OF58a Requested Confirmation Party
        $("#div_of58a_requested_confirmation_party").hide();
        $("#div_of58d_requested_confirmation_party").hide();
        $("#_281_of58a_party_identifier").attr("disabled", true);
        $("#_282_of58a_identifier_code").attr("disabled", true);
        $("#_283_of58d_party_identifier").attr("disabled", true);
        $("#_284_of58d_name_address").attr("disabled", true);
        $("#_280_of58a_requested_confirmation_party").change(function () {
            if ($("#_280_of58a_requested_confirmation_party").val() == "a") {
                $("#div_of58a_requested_confirmation_party").show();
                $("#div_of58d_requested_confirmation_party").hide();
                $("#_281_of58a_party_identifier").attr("disabled", false);
                $("#_282_of58a_identifier_code").attr("disabled", false);
                $("#_283_of58d_party_identifier").attr("disabled", true);
                $("#_284_of58d_name_address").attr("disabled", true);
            } else if ($("#_280_of58a_requested_confirmation_party").val() == "d") {
                $("#div_of58a_requested_confirmation_party").hide();
                $("#div_of58d_requested_confirmation_party").show();
                $("#_281_of58a_party_identifier").attr("disabled", true);
                $("#_282_of58a_identifier_code").attr("disabled", true);
                $("#_283_of58d_party_identifier").attr("disabled", false);
                $("#_284_of58d_name_address").attr("disabled", false);
            } else {
                $("#div_of58a_requested_confirmation_party").hide();
                $("#div_of58d_requested_confirmation_party").hide();
                $("#_281_of58a_party_identifier").attr("disabled", true);
                $("#_282_of58a_identifier_code").attr("disabled", true);
                $("#_283_of58d_party_identifier").attr("disabled", true);
                $("#_284_of58d_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
        //OF52a Issuer
        $("#div_of52a_issuer_2").hide();
        $("#div_of52d_issuer_2").hide();
        $("#_501_of52a_party_identifier").attr("disabled", true);
        $("#_502_of52a_identifier_code").attr("disabled", true);
        $("#_503_of52d_party_identifier").attr("disabled", true);
        $("#_504_of52d_name_address").attr("disabled", true);
        $("#_500_of52a_issuer").change(function () {
            if ($("#_500_of52a_issuer").val() == "a") {
                $("#div_of52a_issuer_2").show();
                $("#div_of52d_issuer_2").hide();
                $("#_501_of52a_party_identifier").attr("disabled", false);
                $("#_502_of52a_identifier_code").attr("disabled", false);
                $("#_503_of52d_party_identifier").attr("disabled", true);
                $("#_504_of52d_name_address").attr("disabled", true);
            } else if ($("#_500_of52a_issuer").val() == "d") {
                $("#div_of52a_issuer_2").hide();
                $("#div_of52d_issuer_2").show();
                $("#_501_of52a_party_identifier").attr("disabled", true);
                $("#_502_of52a_identifier_code").attr("disabled", true);
                $("#_503_of52d_party_identifier").attr("disabled", false);
                $("#_504_of52d_name_address").attr("disabled", false);
            } else {
                $("#div_of52a_issuer_2").hide();
                $("#div_of52d_issuer_2").hide();
                $("#_501_of52a_party_identifier").attr("disabled", true);
                $("#_502_of52a_identifier_code").attr("disabled", true);
                $("#_503_of52d_party_identifier").attr("disabled", true);
                $("#_504_of52d_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
        
        //OF41a Avaliable With...2
        $("#div_of41f_avaliable_with_2").hide();
        $("#div_of41g_avaliable_with_2").hide();
        $("#_551_of41f_identifier_code").attr("disabled", true);
        $("#_552_of41g_name_address").attr("disabled", true);
        $("#_550_of41a_available_with").change(function () {
            if ($("#_550_of41a_available_with").val() == "f") {
                $("#div_of41f_avaliable_with_2").show();
                $("#div_of41g_avaliable_with_2").hide();
                $("#_551_of41f_identifier_code").attr("disabled", false);
                $("#_552_of41g_name_address").attr("disabled", true);
            } else if ($("#_550_of41a_available_with").val() == "g") {
                $("#div_of41f_avaliable_with_2").hide();
                $("#div_of41g_avaliable_with_2").show();
                $("#_551_of41f_identifier_code").attr("disabled", true);
                $("#_552_of41g_name_address").attr("disabled", false);
            } else {
                $("#div_of41f_avaliable_with_2").hide();
                $("#div_of41g_avaliable_with_2").hide();
                $("#_551_of41f_identifier_code").attr("disabled", true);
                $("#_552_of41g_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
        //Seq C checkbox
        $("#check_seq_c").hide();
        $("#_420_mf22d_form_of_undertaking").attr("disabled", true);
        $("#_430_mf40c_applicable_rules").attr("disabled", true);
        $("#_431_mf40c_narrative").attr("disabled", true);
        $("#_450_mf23b_expiry_type").attr("disabled", true);
        $("#seq_C_checkbox").click(function () {
            if ($("#seq_C_checkbox").is(":checked")) {
                $("#check_seq_c").show();
                $("#_420_mf22d_form_of_undertaking").attr("disabled", false);
                $("#_430_mf40c_applicable_rules").attr("disabled", false);
                $("#_431_mf40c_narrative").attr("disabled", false);
                $("#_450_mf23b_expiry_type").attr("disabled", false);
            } else {
                $("#check_seq_c").hide();
                $("#_420_mf22d_form_of_undertaking").attr("disabled", true);
                $("#_430_mf40c_applicable_rules").attr("disabled", true);
                $("#_431_mf40c_narrative").attr("disabled", true);
                $("#_450_mf23b_expiry_type").attr("disabled", true);
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
        console.log("kadieuu 365 " + $("#_163_mf52d_party_identifier").val());
        if ($("#_161_mf52a_party_identifier").val() != "" || $("#_162_mf52a_identifier_code").val() != "") {
            $("#_160_mf52a_issuer").val("a").attr("selected", true);
            $("#div_mf52a_issuer").show();
            $("#div_mf52d_issuer").hide();
            $("#_161_mf52a_party_identifier").attr("disabled", false);
            $("#_162_mf52a_identifier_code").attr("disabled", false);
            $("#_163_mf52d_party_identifier").attr("disabled", true);
            $("#_164_mf52d_name_address").attr("disabled", true);
        } else if ($("#_163_mf52d_party_identifier").val() != "" || $("#_164_mf52d_name_address").val() != "") {
            console.log("kadieuu" + $("#_163_mf52d_party_identifier").val());
            $("#_160_mf52a_issuer").val("d").attr("selected", true);
            $("#div_mf52a_issuer").hide();
            $("#div_mf52d_issuer").show();
            $("#_161_mf52a_party_identifier").attr("disabled", true);
            $("#_162_mf52a_identifier_code").attr("disabled", true);
            $("#_163_mf52d_party_identifier").attr("disabled", false);
            $("#_164_mf52d_name_address").attr("disabled", false);
        } else {
            $("#div_mf52a_issuer").hide();
            $("#div_mf52d_issuer").hide();
            $("#_161_mf52a_party_identifier").attr("disabled", true);
            $("#_162_mf52a_identifier_code").attr("disabled", true);
            $("#_163_mf52d_party_identifier").attr("disabled", true);
            $("#_164_mf52d_name_address").attr("disabled", true);
        }
        //end of the line
        
        //MF59a Beneficiary
        if ($("#_171_mf59a_account").val() != "" || $("#_172_mf59a_name_address").val() != "") {
            $("#_170_mf59a_beneficiary").val("no").attr("selected", true);
            $("#div_mf59no_beneficiary").show();
            $("#div_mf59a_beneficiary").hide();
            $("#_171_mf59a_account").attr("disabled", false);
            $("#_172_mf59a_name_address").attr("disabled", false);
            $("#_173_mf59a_account").attr("disabled", true);
            $("#_174_mf59a_identifier_code").attr("disabled", true);
        } else if ($("#_173_mf59a_account").val() != "" || $("#_174_mf59a_identifier_code").val() != "") {
            $("#_170_mf59a_beneficiary").val("a").attr("selected", true);
            $("#div_mf59no_beneficiary").hide();
            $("#div_mf59a_beneficiary").show();
            $("#_171_mf59a_account").attr("disabled", true);
            $("#_172_mf59a_name_address").attr("disabled", true);
            $("#_173_mf59a_account").attr("disabled", false);
            $("#_174_mf59a_identifier_code").attr("disabled", false);
        } else {
            $("#div_mf59no_beneficiary").hide();
            $("#div_mf59a_beneficiary").hide();
            $("#_171_mf59a_account").attr("disabled", true);
            $("#_172_mf59a_name_address").attr("disabled", true);
            $("#_173_mf59a_account").attr("disabled", true);
            $("#_174_mf59a_identifier_code").attr("disabled", true);
        }
        //end of the line
        
        //56a Advising Bank
        if ($("#_181_of56a_party_identifier").val() != "" || $("#_182_of56a_identifier_code").val() != "") {
            $("#_180_of56a_advising_bank").val("a").attr("selected", true);
            $("#div_of56a_advising_bank").show();
            $("#div_of56d_advising_bank").hide();
            $("#_181_of56a_party_identifier").attr("disabled", false);
            $("#_182_of56a_identifier_code").attr("disabled", false);
            $("#_183_of56d_party_identifier").attr("disabled", true);
            $("#_184_of56d_name_address").attr("disabled", true);
        } else if ($("#_183_of56d_party_identifier").val() != "" || $("#_184_of56d_name_address").val() != "") {
            $("#_180_of56a_advising_bank").val("d").attr("selected", true);
            $("#div_of56a_advising_bank").hide();
            $("#div_of56d_advising_bank").show();
            $("#_181_of56a_party_identifier").attr("disabled", true);
            $("#_182_of56a_identifier_code").attr("disabled", true);
            $("#_183_of56d_party_identifier").attr("disabled", false);
            $("#_184_of56d_name_address").attr("disabled", false);
        } else {
            $("#div_of56a_advising_bank").hide();
            $("#div_of56d_advising_bank").hide();
            $("#_181_of56a_party_identifier").attr("disabled", true);
            $("#_182_of56a_identifier_code").attr("disabled", true);
            $("#_183_of56d_party_identifier").attr("disabled", true);
            $("#_184_of56d_name_address").attr("disabled", true);
        }
        //end of the line
        
//         OF57a 'Advise Through' Bank
        if ($("#_201_of57a_party_identifier").val() != "" || $("#_202_of57a_identifier_code").val() != "") {
            $("#_200_of57a_advise_through_bank").val("a").attr("selected", true);
            $("#div_of57a_advise_through_bank").show();
            $("#div_of57d_advise_through_bank").hide();
            $("#_201_of57a_party_identifier").attr("disabled", false);
            $("#_202_of57a_identifier_code").attr("disabled", false);
            $("#_203_of57d_party_identifier").attr("disabled", true);
            $("#_204_of57d_name_address").attr("disabled", true);
        } else if ($("#_203_of57d_party_identifier").val() != "" || $("#_204_of57d_name_address").val() != "") {
            $("#_200_of57a_advise_through_bank").val("d").attr("selected", true);
            $("#div_of57a_advise_through_bank").hide();
            $("#div_of57d_advise_through_bank").show();
            $("#_201_of57a_party_identifier").attr("disabled", true);
            $("#_202_of57a_identifier_code").attr("disabled", true);
            $("#_203_of57d_party_identifier").attr("disabled", false);
            $("#_204_of57d_name_address").attr("disabled", false);
        } else {
            $("#div_of57a_advise_through_bank").hide();
            $("#div_of57d_advise_through_bank").hide();
            $("#_201_of57a_party_identifier").attr("disabled", true);
            $("#_202_of57a_identifier_code").attr("disabled", true);
            $("#_203_of57d_party_identifier").attr("disabled", true);
            $("#_204_of57d_name_address").attr("disabled", true);
        }
        //end of the line
        
        //OF41a Avaliable With...
        if ($("#_231_of41f_identifier_code").val() != "") {
            $("#_230_of41a_available_with").val("f").attr("selected", true);
            $("#div_of41f_avaliable_with").show();
            $("#div_of41g_avaliable_with").hide();
            $("#_231_of41f_identifier_code").attr("disabled", false);
            $("#_232_of41g_name_address").attr("disabled", true);
        } else if ($("#_232_of41g_name_address").val() != "" ) {
            $("#_230_of41a_available_with").val("g").attr("selected", true);
            $("#div_of41f_avaliable_with").hide();
            $("#div_of41g_avaliable_with").show();
            $("#_231_of41f_identifier_code").attr("disabled", true);
            $("#_232_of41g_name_address").attr("disabled", false);
        } else {
            $("#div_of41f_avaliable_with").hide();
            $("#div_of41g_avaliable_with").hide();
            $("#_231_of41f_identifier_code").attr("disabled", true);
            $("#_232_of41g_name_address").attr("disabled", true);
        }
        //end of the line
        
//        OF58a Requested Confirmation Party
        if ($("#_281_of58a_party_identifier").val() != "" || $("#_282_of58a_identifier_code").val() != "") {
            $("#_280_of58a_requested_confirmation_party").val("a").attr("selected", true);
            $("#div_of58a_requested_confirmation_party").show();
            $("#div_of58d_requested_confirmation_party").hide();
            $("#_281_of58a_party_identifier").attr("disabled", false);
            $("#_282_of58a_identifier_code").attr("disabled", false);
            $("#_283_of58d_party_identifier").attr("disabled", true);
            $("#_284_of58d_name_address").attr("disabled", true);
        } else if ($("#_283_of58d_party_identifier").val() != "" || $("#_284_of58d_name_address").val() != "") {
            $("#_280_of58a_requested_confirmation_party").val("d").attr("selected", true);
            $("#div_of58a_requested_confirmation_party").hide();
            $("#div_of58d_requested_confirmation_party").show();
            $("#_281_of58a_party_identifier").attr("disabled", true);
            $("#_282_of58a_identifier_code").attr("disabled", true);
            $("#_283_of58d_party_identifier").attr("disabled", false);
            $("#_284_of58d_name_address").attr("disabled", false);
        } else {
            $("#div_of58a_requested_confirmation_party").hide();
            $("#div_of58d_requested_confirmation_party").hide();
            $("#_281_of58a_party_identifier").attr("disabled", true);
            $("#_282_of58a_identifier_code").attr("disabled", true);
            $("#_283_of58d_party_identifier").attr("disabled", true);
            $("#_284_of58d_name_address").attr("disabled", true);
        }
        //end of the line
        
        //OF52a Issuer
        if ($("#_501_of52a_party_identifier").val() != "" || $("#_502_of52a_identifier_code").val() != "") {
            $("#_500_of52a_issuer").val("a").attr("selected", true);
            $("#div_of52a_issuer_2").show();
            $("#div_of52d_issuer_2").hide();
            $("#_501_of52a_party_identifier").attr("disabled", false);
            $("#_502_of52a_identifier_code").attr("disabled", false);
            $("#_503_of52d_party_identifier").attr("disabled", true);
            $("#_504_of52d_name_address").attr("disabled", true);
        } else if ($("#_503_of52d_party_identifier").val() != "" || $("#_504_of52d_name_address").val() != "") {
            $("#_500_of52a_issuer").val("d").attr("selected", true);
            $("#div_of52a_issuer_2").hide();
            $("#div_of52d_issuer_2").show();
            $("#_501_of52a_party_identifier").attr("disabled", true);
            $("#_502_of52a_identifier_code").attr("disabled", true);
            $("#_503_of52d_party_identifier").attr("disabled", false);
            $("#_504_of52d_name_address").attr("disabled", false);
        } else {
            $("#div_of52a_issuer_2").hide();
            $("#div_of52d_issuer_2").hide();
            $("#_501_of52a_party_identifier").attr("disabled", true);
            $("#_502_of52a_identifier_code").attr("disabled", true);
            $("#_503_of52d_party_identifier").attr("disabled", true);
            $("#_504_of52d_name_address").attr("disabled", true);
        }
        //end of the line
        
        
        //OF41a Avaliable With...2
        if ($("#_551_of41f_identifier_code").val() != "") {
            $("#_550_of41a_available_with").val("f").attr("selected", true);
            $("#div_of41f_avaliable_with_2").show();
            $("#div_of41g_avaliable_with_2").hide();
            $("#_551_of41f_identifier_code").attr("disabled", false);
            $("#_552_of41g_name_address").attr("disabled", true);
        } else if ($("#_552_of41g_name_address").val() != "" ) {
            $("#_550_of41a_available_with").val("g").attr("selected", true);
            $("#div_of41f_avaliable_with_2").hide();
            $("#div_of41g_avaliable_with_2").show();
            $("#_551_of41f_identifier_code").attr("disabled", true);
            $("#_552_of41g_name_address").attr("disabled", false);
        } else {
            $("#div_of41f_avaliable_with_2").hide();
            $("#div_of41g_avaliable_with_2").hide();
            $("#_551_of41f_identifier_code").attr("disabled", true);
            $("#_552_of41g_name_address").attr("disabled", true);
        }
        //end of the line
        
        //Seq C checkbox
        if ($("#_420_mf22d_form_of_undertaking").val() != "" || $("#_430_mf40c_applicable_rules").val() != "" || $("#_431_mf40c_narrative").val() != "" || $("#_450_mf23b_expiry_type").val() != ""){
            $("#seq_C_checkbox").attr("checked", true);
            $("#check_seq_c").show();
            $("#_420_mf22d_form_of_undertaking").attr("disabled", false);
            $("#_430_mf40c_applicable_rules").attr("disabled", false);
            $("#_431_mf40c_narrative").attr("disabled", false);
            $("#_450_mf23b_expiry_type").attr("disabled", false);
        } else {
            $("#check_seq_c").hide();
            $("#_420_mf22d_form_of_undertaking").attr("disabled", true);
            $("#_430_mf40c_applicable_rules").attr("disabled", true);
            $("#_431_mf40c_narrative").attr("disabled", true);
            $("#_450_mf23b_expiry_type").attr("disabled", true);
        }
        //end of the line
       
        
        
    });
    
</script>