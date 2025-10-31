<%-- 
    Document   : mt767
    Created on : Jun 14, 2021, 2:03:09 PM
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
                
                //MF21 Related Reference
                _030_mf21_related_reference: "required",
                
                //MF22A Purpose of Message
                _040_mf22a_purpose_of_message: "required",
                
//                15B New Sequence
                //MF20 Undertaking Number
                _090_mf20_undertaking_number: "required",
                
                //MF26E Number of Amendment
                _100_mf26e_number_of_amendment: "required",
                
                //MF30 Date of Amendment
                _110_mf30_date_of_amendment: "required",
                
                //MF52a Issuer
                _120_mf52a_issuer: "required",
                _122_mf52a_identifier_code: {
                    required: {
                        depends: function(element) {
                            return $("#_120_mf52a_issuer").val() === "a";
                        }
                    }
                },
                _124_mf52d_name_address: {
                    required: {
                        depends: function(element) {
                            return $("#_120_mf52a_issuer").val() === "d";
                        }
                    }
                },
                
                //C1: In sequence B, either field 32B or field 33B, but not both, may be present
                _140_of32b_currency: {
                    required: function(element) {
                        return $("#_150_of33b_currency").val() === "" && $("#_141_of32b_amount").val() === "";
                    }
                },
                _141_of32b_amount: {
                    required: function(element) {
                        return $("#_151_of33b_amount").val() === "" && $("#_140_of32b_currency").val() === "";
                    }
                },
                _150_of33b_currency: {
                    required: function(element) {
                        return $("#_140_of32b_currency").val() === "" && $("#_151_of33b_amount").val() === "";
                    }
                },
                _151_of33b_amount: {
                    required: function(element) {
                        return $("#_141_of32b_amount").val() === "" && $("#_150_of33b_currency").val() === "";
                    }
                },
                
                //C2: In sequence B, if field 23B is COND, then field 35G must be present
                _180_of35g_expiry_conditions_event: {
                    required: {
                        depends: function(element) {
                            return $("#_160_of23b_expiry_type").val() === "COND";
                        }
                    }
                },
                
                //C5: In sequence A, if field 22A is ACNA or ADVA, then field 23 may be present
                _130_of23_advising_bank_reference: {
                    required: function(element) {
                        var purposeMsg = $("#_040_mf22a_purpose_of_message").val();
                        return purposeMsg === "ACNA" || purposeMsg === "ADVA";
                    }
                },
                
                //C6: In sequence A, if field 22A is ISCA or ICCA, then in sequence B, fields 24E and 24G are not allowed
                _210_of24e_delivery_of_amendment_to_undertaking: {
                    required: function(element) {
                        var purposeMsg = $("#_040_mf22a_purpose_of_message").val();
                        return purposeMsg !== "ISCA" && purposeMsg !== "ICCA";
                    }
                },
                _220_of24g_delivery_to_collection_by: {
                    required: function(element) {
                        var purposeMsg = $("#_040_mf22a_purpose_of_message").val();
                        return purposeMsg !== "ISCA" && purposeMsg !== "ICCA";
                    }
                },
                
                //C1: In sequence C, either field 32B or field 33B, but not both, may be present
                _240_of32b_currency: {
                    required: function(element) {
                        return $("#_250_of33b_currency").val() === "" && $("#_241_of32b_amount").val() === "";
                    }
                },
                _241_of32b_amount: {
                    required: function(element) {
                        return $("#_251_of33b_amount").val() === "" && $("#_240_of32b_currency").val() === "";
                    }
                },
                _250_of33b_currency: {
                    required: function(element) {
                        return $("#_240_of32b_currency").val() === "" && $("#_251_of33b_amount").val() === "";
                    }
                },
                _251_of33b_amount: {
                    required: function(element) {
                        return $("#_241_of32b_amount").val() === "" && $("#_250_of33b_currency").val() === "";
                    }
                },
                
                //C2: In sequence C, if field 23B is COND, then field 35G must be present
                _280_of35g_expiry_conditions_event: {
                    required: {
                        depends: function(element) {
                            return $("#_260_of23b_expiry_type").val() === "COND";
                        }
                    }
                },
                
                //template
                template_name: "required"
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
                receiver_institution: {required: "receiver_institution must be filled..!!"},
                priority: {required: "priority must be filled..!!"},
                _020_mf27_number: {required: "mf27_number must be filled..!!"},
                _021_mf27_total: {required: "mf27_total must be filled..!!"},
                _030_mf21_related_reference: {required: "mf21_related_reference must be filled..!!"},
                _040_mf22a_purpose_of_message: {required: "mf22a_purpose_of_message must be filled..!!"},
                _090_mf20_undertaking_number: {required: "mf20_undertaking_number must be filled..!!"},
                _100_mf26e_number_of_amendment: {required: "mf26e_number_of_amendment must be filled..!!"},
                _110_mf30_date_of_amendment: {required: "mf30_date_of_amendment must be filled..!!"},
                _120_mf52a_issuer: {required: "mf52a_issuer must be filled..!!"},
                _122_mf52a_identifier_code: {required: "mf52a_identifier_code must be filled..!!"},
                _124_mf52d_name_address: {required: "mf52d_name_address must be filled..!!"},
                
                //C1: Sequence B - Either field 32B or 33B
                _140_of32b_currency: {required: "Either field 32B (Increase) or 33B (Decrease), but not both, must be present in Sequence B..!!"},
                _141_of32b_amount: {required: "Either field 32B (Increase) or 33B (Decrease), but not both, must be present in Sequence B..!!"},
                _150_of33b_currency: {required: "Either field 32B (Increase) or 33B (Decrease), but not both, must be present in Sequence B..!!"},
                _151_of33b_amount: {required: "Either field 32B (Increase) or 33B (Decrease), but not both, must be present in Sequence B..!!"},
                
                //C2: Sequence B - Field 35G required if 23B is COND
                _180_of35g_expiry_conditions_event: {required: "Field 35G must be present when field 23B is COND..!!"},
                
                //C5: Field 23 may be present if 22A is ACNA or ADVA
                _130_of23_advising_bank_reference: {required: "Field 23 may be present when field 22A is ACNA or ADVA..!!"},
                
                //C6: Fields 24E and 24G not allowed if 22A is ISCA or ICCA
                _210_of24e_delivery_of_amendment_to_undertaking: {required: "Fields 24E and 24G are not allowed when field 22A is ISCA or ICCA..!!"},
                _220_of24g_delivery_to_collection_by: {required: "Fields 24E and 24G are not allowed when field 22A is ISCA or ICCA..!!"},
                
                //C1: Sequence C - Either field 32B or 33B
                _240_of32b_currency: {required: "Either field 32B (Increase) or 33B (Decrease), but not both, must be present in Sequence C..!!"},
                _241_of32b_amount: {required: "Either field 32B (Increase) or 33B (Decrease), but not both, must be present in Sequence C..!!"},
                _250_of33b_currency: {required: "Either field 32B (Increase) or 33B (Decrease), but not both, must be present in Sequence C..!!"},
                _251_of33b_amount: {required: "Either field 32B (Increase) or 33B (Decrease), but not both, must be present in Sequence C..!!"},
                
                //C2: Sequence C - Field 35G required if 23B is COND
                _280_of35g_expiry_conditions_event: {required: "Field 35G must be present when field 23B is COND in Sequence C..!!"},
                
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
        $("#_121_mf52a_party_identifier").attr("disabled", true);
        $("#_122_mf52a_identifier_code").attr("disabled", true);
        $("#_123_mf52d_party_identifier").attr("disabled", true);
        $("#_124_mf52d_name_address").attr("disabled", true);
        $("#_120_mf52a_issuer").change(function () {
            if ($("#_120_mf52a_issuer").val() == "a") {
                $("#div_mf52a_issuer").show();
                $("#div_mf52d_issuer").hide();
                $("#_121_mf52a_party_identifier").attr("disabled", false);
                $("#_122_mf52a_identifier_code").attr("disabled", false);
                $("#_123_mf52d_party_identifier").attr("disabled", true);
                $("#_124_mf52d_name_address").attr("disabled", true);
            } else if ($("#_120_mf52a_issuer").val() == "d") {
                $("#div_mf52a_issuer").hide();
                $("#div_mf52d_issuer").show();
                $("#_121_mf52a_party_identifier").attr("disabled", true);
                $("#_122_mf52a_identifier_code").attr("disabled", true);
                $("#_123_mf52d_party_identifier").attr("disabled", false);
                $("#_124_mf52d_name_address").attr("disabled", false);
            } else {
                $("#div_mf52a_issuer").hide();
                $("#div_mf52d_issuer").hide();
                $("#_121_mf52a_party_identifier").attr("disabled", true);
                $("#_122_mf52a_identifier_code").attr("disabled", true);
                $("#_123_mf52d_party_identifier").attr("disabled", true);
                $("#_124_mf52d_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
        //OF59a Beneficiary
        $("#div_of59no_beneficiary").hide();
        $("#div_of59a_beneficiary").hide();
        $("#_191_of59a_account").attr("disabled", true);
        $("#_192_of59a_name_address").attr("disabled", true);
        $("#_193_of59a_account").attr("disabled", true);
        $("#_194_of59a_identifier_code").attr("disabled", true);
        $("#_190_of59a_beneficiary").change(function () {
            if ($("#_190_of59a_beneficiary").val() == "no") {
                $("#div_of59no_beneficiary").show();
                $("#div_of59a_beneficiary").hide();
                $("#_191_of59a_account").attr("disabled", false);
                $("#_192_of59a_name_address").attr("disabled", false);
                $("#_193_of59a_account").attr("disabled", true);
                $("#_194_of59a_identifier_code").attr("disabled", true);
            } else if ($("#_190_of59a_beneficiary").val() == "a") {
                $("#div_of59no_beneficiary").hide();
                $("#div_of59a_beneficiary").show();
                $("#_191_of59a_account").attr("disabled", true);
                $("#_192_of59a_name_address").attr("disabled", true);
                $("#_193_of59a_account").attr("disabled", false);
                $("#_194_of59a_identifier_code").attr("disabled", false);
            } else {
                $("#div_of59no_beneficiary").hide();
                $("#div_of59a_beneficiary").hide();
                $("#_191_of59a_account").attr("disabled", true);
                $("#_192_of59a_name_address").attr("disabled", true);
                $("#_193_of59a_account").attr("disabled", true);
                $("#_194_of59a_identifier_code").attr("disabled", true);
            }
        });
        //end of the line
        
        //Seq C checkbox
        $("#check_seq_c").hide();
        $("#_240_of32b_currency").attr("disabled", true);
        $("#_241_of32b_amount").attr("disabled", true);
        $("#_250_of33b_currency").attr("disabled", true);
        $("#_251_of33b_amount").attr("disabled", true);
        $("#_260_of23b_expiry_type").attr("disabled", true);
        $("#_270_of31e_date_of_expiry").attr("disabled", true);
        $("#_280_of35g_expiry_conditions_event").attr("disabled", true);
        $("#_290_of59_beneficiary").attr("disabled", true);
        $("#_291_of59_name_address").attr("disabled", true);
        $("#_300_of77l_other_amandments_to_local_undertaking").attr("disabled", true);
        $("#_310_of24e_delivery_of_amendment_to_local_undertaking").attr("disabled", true);
        $("#_311_of24e_narrative").attr("disabled", true);
        $("#_320_of24g_delivery_to_collection_by").attr("disabled", true);
        $("#_321_of24g_narrative").attr("disabled", true);
        $("#check_seq_C").click(function () {
            if ($("#check_seq_C").is(":checked")) {
                $("#check_seq_c").show();
                $("#_240_of32b_currency").attr("disabled", false);
                $("#_241_of32b_amount").attr("disabled", false);
                $("#_250_of33b_currency").attr("disabled", false);
                $("#_251_of33b_amount").attr("disabled", false);
                $("#_260_of23b_expiry_type").attr("disabled", false);
                $("#_270_of31e_date_of_expiry").attr("disabled", false);
                $("#_280_of35g_expiry_conditions_event").attr("disabled", false);
                $("#_290_of59_beneficiary").attr("disabled", false);
                $("#_291_of59_name_address").attr("disabled", false);
                $("#_300_of77l_other_amandments_to_local_undertaking").attr("disabled", false);
                $("#_310_of24e_delivery_of_amendment_to_local_undertaking").attr("disabled", false);
                $("#_311_of24e_narrative").attr("disabled", false);
                $("#_320_of24g_delivery_to_collection_by").attr("disabled", false);
                $("#_321_of24g_narrative").attr("disabled", false);
            } else {
                $("#check_seq_c").hide();
                $("#_240_of32b_currency").attr("disabled", true);
                $("#_241_of32b_amount").attr("disabled", true);
                $("#_250_of33b_currency").attr("disabled", true);
                $("#_251_of33b_amount").attr("disabled", true);
                $("#_260_of23b_expiry_type").attr("disabled", true);
                $("#_270_of31e_date_of_expiry").attr("disabled", true);
                $("#_280_of35g_expiry_conditions_event").attr("disabled", true);
                $("#_290_of59_beneficiary").attr("disabled", true);
                $("#_291_of59_name_address").attr("disabled", true);
                $("#_300_of77l_other_amandments_to_local_undertaking").attr("disabled", true);
                $("#_310_of24e_delivery_of_amendment_to_local_undertaking").attr("disabled", true);
                $("#_311_of24e_narrative").attr("disabled", true);
                $("#_320_of24g_delivery_to_collection_by").attr("disabled", true);
                $("#_321_of24g_narrative").attr("disabled", true);
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
        if ($("#_121_mf52a_party_identifier").val() != "" || $("#_122_mf52a_identifier_code").val() != "") {
            $("#_120_mf52a_issuer").val("a").attr("selected", true);
            $("#div_mf52a_issuer").show();
            $("#div_mf52d_issuer").hide();
            $("#_121_mf52a_party_identifier").attr("disabled", false);
            $("#_122_mf52a_identifier_code").attr("disabled", false);
            $("#_123_mf52d_party_identifier").attr("disabled", true);
            $("#_124_mf52d_name_address").attr("disabled", true);
        } else if ($("#_123_mf52d_party_identifier").val() != "" || $("#_124_mf52d_name_address").val() != "") {
            $("#_120_mf52a_issuer").val("d").attr("selected", true);
            $("#div_mf52a_issuer").hide();
            $("#div_mf52d_issuer").show();
            $("#_121_mf52a_party_identifier").attr("disabled", true);
            $("#_122_mf52a_identifier_code").attr("disabled", true);
            $("#_123_mf52d_party_identifier").attr("disabled", false);
            $("#_124_mf52d_name_address").attr("disabled", false);
        } else {
            $("#div_mf52a_issuer").hide();
            $("#div_mf52d_issuer").hide();
            $("#_121_mf52a_party_identifier").attr("disabled", true);
            $("#_122_mf52a_identifier_code").attr("disabled", true);
            $("#_123_mf52d_party_identifier").attr("disabled", true);
            $("#_124_mf52d_name_address").attr("disabled", true);
        }
        //end of the line
        
        //OF59a Beneficiary
        if ($("#_191_of59a_account").val() != "" || $("#_192_of59a_name_address").val() != "") {
            $("#_190_of59a_beneficiary").val("no").attr("selected", true);
            $("#div_of59no_beneficiary").show();
            $("#div_of59a_beneficiary").hide();
            $("#_191_of59a_account").attr("disabled", false);
            $("#_192_of59a_name_address").attr("disabled", false);
            $("#_193_of59a_account").attr("disabled", true);
            $("#_194_of59a_identifier_code").attr("disabled", true);
        } else if ($("#_193_of59a_account").val() != "" || $("#_194_of59a_identifier_code").val() != "") {
            $("#_190_of59a_beneficiary").val("a").attr("selected", true);
            $("#div_of59no_beneficiary").hide();
            $("#div_of59a_beneficiary").show();
            $("#_191_of59a_account").attr("disabled", true);
            $("#_192_of59a_name_address").attr("disabled", true);
            $("#_193_of59a_account").attr("disabled", false);
            $("#_194_of59a_identifier_code").attr("disabled", false);
        } else {
            $("#div_of59no_beneficiary").hide();
            $("#div_of59a_beneficiary").hide();
            $("#_191_of59a_account").attr("disabled", true);
            $("#_192_of59a_name_address").attr("disabled", true);
            $("#_193_of59a_account").attr("disabled", true);
            $("#_194_of59a_identifier_code").attr("disabled", true);
        }
        //end of the line
        
        //Seq C checkbox
//        if ($("#_260_of23b_expiry_type").val() != "" || $("#_270_of31e_date_of_expiry").val() != "" || $("#_280_of35g_expiry_conditions_event").val() != "" || $("#_300_of77l_other_amandments_to_local_undertaking").val() != ""){
//            $("#check_seq_C").attr("checked", true);
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
        if ($("#_240_of32b_currency").val() != "" || $("#_241_of32b_amount").val() != "" || 
            $("#_250_of33b_currency").val() != "" || $("#_251_of33b_amount").val() != "" ||
            $("#_260_of23b_expiry_type").val() != "" || $("#_270_of31e_date_of_expiry").val() != "" || 
            $("#_280_of35g_expiry_conditions_event").val() != "" || $("#_290_of59_beneficiary").val() != "" || 
            $("#_291_of59_name_address").val() != "" || $("#_300_of77l_other_amandments_to_local_undertaking").val() != "" ||
            $("#_310_of24e_delivery_of_amendment_to_local_undertaking").val() != "" || $("#_311_of24e_narrative").val() != "" ||
            $("#_320_of24g_delivery_to_collection_by").val() != "" || $("#_321_of24g_narrative").val() != ""){
            $("#check_seq_C").attr("checked", true);
            $("#check_seq_c").show();
            $("#_240_of32b_currency").attr("disabled", false);
            $("#_241_of32b_amount").attr("disabled", false);
            $("#_250_of33b_currency").attr("disabled", false);
            $("#_251_of33b_amount").attr("disabled", false);
            $("#_260_of23b_expiry_type").attr("disabled", false);
            $("#_270_of31e_date_of_expiry").attr("disabled", false);
            $("#_280_of35g_expiry_conditions_event").attr("disabled", false);
            $("#_290_of59_beneficiary").attr("disabled", false);
            $("#_291_of59_name_address").attr("disabled", false);
            $("#_300_of77l_other_amandments_to_local_undertaking").attr("disabled", false);
            $("#_310_of24e_delivery_of_amendment_to_local_undertaking").attr("disabled", false);
            $("#_311_of24e_narrative").attr("disabled", false);
            $("#_320_of24g_delivery_to_collection_by").attr("disabled", false);
            $("#_321_of24g_narrative").attr("disabled", false);
        } else {
            $("#check_seq_c").hide();
            $("#_240_of32b_currency").attr("disabled", true);
            $("#_241_of32b_amount").attr("disabled", true);
            $("#_250_of33b_currency").attr("disabled", true);
            $("#_251_of33b_amount").attr("disabled", true);
            $("#_260_of23b_expiry_type").attr("disabled", true);
            $("#_270_of31e_date_of_expiry").attr("disabled", true);
            $("#_280_of35g_expiry_conditions_event").attr("disabled", true);
            $("#_290_of59_beneficiary").attr("disabled", true);
            $("#_291_of59_name_address").attr("disabled", true);
            $("#_300_of77l_other_amandments_to_local_undertaking").attr("disabled", true);
            $("#_310_of24e_delivery_of_amendment_to_local_undertaking").attr("disabled", true);
            $("#_311_of24e_narrative").attr("disabled", true);
            $("#_320_of24g_delivery_to_collection_by").attr("disabled", true);
            $("#_321_of24g_narrative").attr("disabled", true);
        }
        //end of the line

    });
</script>