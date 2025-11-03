<%-- 
    Document   : validate_rule_mt710
    Created on : Aug 2018, 
    Author     : Sri Puji 
--%>

<script type="text/javascript">
    $(document).ready(function() {
        let validator = $("#form1").validate({
            ignore: [],  
            onkeyup: false,          // Nonaktifkan validasi saat mengetik
            onfocusout: false,       // Nonaktifkan validasi saat pindah input
//            onclick: false,          // Nonaktifkan validasi saat klik
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
                _010_mf27_number: "required",
                _011_mf27_total: "required",
                _020_mf40b_form_of_documentary_credit_type: "required",
                _021_mf40b_code: "required",
               
                _030_mf20_sender_reference: "required",
                _040_mf21_documentary_credit_number: "required",
                _060_mf31c_date_of_issue: "required",
              
                
                _070_mf40e_applicable_rules: "required",
                _080_mf31d_date_of_expiry: "required",
                _081_mf31d_place_of_expiry:"required",
                _120_mf50_applicant:"required",
                _130_mf59_account:"required",
                _131_mf59_name_address:"required",
                _140_mf32b_currency:"required",
                _141_mf32b_amount:"required",
                _370_mf49_confirmation_instructions:"required",
                
                //mf41a//
                _170_mf41a_available_with_by: "required",
                _171_mf41a_identifier_code: {
                    required: function(element) {
                        return $("#_170_mf41a_available_with_by").val() == "a";
                    }
                },
                _172_mf41a_code: {
                    required: function(element) {
                        return $("#_170_mf41a_available_with_by").val() == "a";
                    }
                },
                _173_mf41d_name_and_address: {
                    required: function(element) {
                        return $("#_170_mf41a_available_with_by").val() == "d";
                    }
                },
                _174_mf41d_code: {
                    required: function(element) {
                        return $("#_170_mf41a_available_with_by").val() == "d";
                    }
                },

                //of42a//
                _192_of42a_identifier_code: {
                    required: function(element) {
                        return $("#_190_of42a_drawee").val() == "a";
                    }
                },
                _194_of42d_name_and_address: {
                    required: function(element) {
                        return $("#_190_of42a_drawee").val() == "d";
                    }
                },
              
                //of42c
                _180_of42c_drafts_at: {
                    required: function(element) {
                    return ($("#_190_of42a_drawee").val() != "")
//                          || ($("#_190_of42a_drawee").val() == "" && $("#_200_of42m_mixed_payment_details").val() == "" && $("#_210_of42p_negotiation").val() == "")
                          || ($("#_190_of42a_drawee").val() != "" && $("#_200_of42m_mixed_payment_details").val() != "")
                          || ($("#_190_of42a_drawee").val() != "" && $("#_210_of42p_negotiation").val() != "")
                          || ($("#_200_of42m_mixed_payment_details").val() != "" && $("#_210_of42p_negotiation").val() != "");
                    }
                },
                
                //of42
                _190_of42a_drawee: {
                    required: function(element) {
                    return ($("#_180_of42c_drafts_at").val() != "")
//                           || ($("#_180_of42c_drafts_at").val() == "" && $("#_200_of42m_mixed_payment_details").val() == "" && $("#_210_of42p_negotiation").val() == "")
                           || ($("#_180_of42c_drafts_at").val() != "" && $("#_200_of42m_mixed_payment_details").val() != "")
                           || ($("#_180_of42c_drafts_at").val() != "" && $("#_210_of42p_negotiation").val() != "")
                           || ($("#_200_of42m_mixed_payment_details").val() != "" && $("#_210_of42p_negotiation").val() != "");
                    }
                },
                
                //of42m
                _200_of42m_mixed_payment_details: {
                    required: function(element) {
                     return ($("#_180_of42c_drafts_at").val() != "" && $("#_210_of42p_negotiation").val() != "");
                    }
                },
                
                //of42p
                _210_of42p_negotiation: {
                    required: function(element) {
                    return ($("#_180_of42c_drafts_at").val() != "" && $("#_200_of42m_mixed_payment_details").val() != "");
                    }
                },
                
                //of44c
//                _280_of44c_latest_date_of_shipment: {
//                    required: function(element) {
//                      return ($("#_290_of44d_shipment_period").val() == "" && $("#_280_of44c_latest_date_of_shipment").val() == "") 
//                              || ($("#_290_of44d_shipment_period").val() != "" && $("#_280_of44c_latest_date_of_shipment").val() != "");
//                    }
//                },
                
                //of44d
//                _290_of44d_shipment_period: {
//                    required: function(element) {
//                      return ($("#_280_of44c_latest_date_of_shipment").val() == "" && $("#_290_of44d_shipment_period").val() == "") 
//                              || ($("#_280_of44c_latest_date_of_shipment").val() != "" && $("#_290_of44d_shipment_period").val() != "");
//                    }
//                },
                
                //of52
                _090_of52a_issuing_bank: {
                    required: function(element) {
                      return ($("#_100_of50b_non_bank_issuer").val() == "" && $("#_090_of52a_issuing_bank").val() == "")
                             || ($("#_100_of50b_non_bank_issuer").val() != "" && $("#_090_of52a_issuing_bank").val() != "");
                    }
                },
                
                //of50b
                _100_of50b_non_bank_issuer: {
                    required: function(element) {
                      return ($("#_090_of52a_issuing_bank").val() == "" && $("#_100_of50b_non_bank_issuer").val() == "")
                             || ($("#_090_of52a_issuing_bank").val() != "" && $("#_100_of50b_non_bank_issuer").val() != "");
                    }
                },
              
       
               
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
                receiver_institution: {required: "receiver_institution must be filled..!!"},
                priority: {required: "priority must be filled..!!"},
                _010_mf27_number:{required: "mf27 number must be filled..!!"},
                _011_mf27_total: {required: "mf27 total must be filled..!!"},
                _020_mf40b_form_of_documentary_credit_type:{required:"mf40b type must be filled..!!"},
                _021_mf40b_code:{required:"mf40b code must be filled..!!"},
                _030_mf20_sender_reference:{required:"mf20 sender reference must be filled..!!"},
                _040_mf21_documentary_credit_number:{required: "mf21 documentary credit number must be filled..!!"},
                _060_mf31c_date_of_issue:{required: "mf31c date of issue must be filled..!!"},
                _070_mf40e_applicable_rules:{required:"mf40e applicable rules must be filled..!!"},
                _080_mf31d_date_of_expiry: {required:"mf31d date of expiry must be filled..!!"},
                _081_mf31d_place_of_expiry: {required:"mf31d place of expiry must be filled..!!"},
                _120_mf50_applicant:{required:"mf50 applicant must be filled..!!"},
                _130_mf59_account:{required:"mf59 account must be filled..!!"},
                _131_mf59_name_address:{required:"mf59 name address must be filled..!!"},
                _140_mf32b_currency:{required:"mf32b currency must be filled..!!"},
                _141_mf32b_amount:{required:"mf32b amount must be filled..!!"},
                _370_mf49_confirmation_instructions:{required:"mf49 confirmation instructions must be filled..!!"},
                _170_mf41a_available_with_by: {required: "mf41a available with by must be filled..!!"},
                _171_mf41a_identifier_code: {required: "mf41a identifier code must be filled..!!"},
                _172_mf41a_code: {required: "mf41a code must be filled..!!"},
                _173_mf41d_name_and_address: {required: "mf41d name and address must be filled..!!"},
                _174_mf41d_code: {required: "mf41d code must be filled..!!"},
                _192_of42a_identifier_code: {required:"of42a identifier code must be filled..!!"},
                _194_of42d_name_and_address: {required:"of42d name and address must be filled..!!"},
                _180_of42c_drafts_at: {required: "fill in both fields of42c and of42 or fill in the of42m field only or of42p only..!!"},
                _190_of42a_drawee: {required: "fill in both fields of42c and of42 or fill in the of42m field only or of42p only..!!"},
                _200_of42m_mixed_payment_details: {required: "fill in both fields of42c and of42 or fill in the of42m field only or of42p only..!!"},
                _210_of42p_negotiation: {required: "fill in both fields of42c and of42 or fill in the of42m field only or of42p only..!!"},
//                _280_of44c_latest_date_of_shipment: {required: "isi antara field of44c atau of44d..!!"},
//                _290_of44d_shipment_period: {required: "isi antara field of44c atau of44d..!!"},
                _090_of52a_issuing_bank: {required: "fill in either of52 or of50b..!!"},
                _100_of50b_non_bank_issuer: {required: "fill in either of52 or of50b..!!"},
              
                
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
                $("#form1").submit(); 
            } else {
                alert("There are still errors! Please fix them before saving.");
            }
        });
        
        $.validator.addMethod("regex", function(value, element, param) {
            //this.optional(element) lewati validasi jika kosong dan param.test(value) check regex
            return this.optional(element) || param.test(value); 
//            Jika tidak ada pesan khusus dalam messages tampilkan "Format tidak valid"
        }, "Format tidak valid");
   
    
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function(){
       
                $("#check_of39a").hide();
                $("#_150_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
                $("#_151_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
                $("#percentage_credit_amount_checkbox").click(function(){
                            if ($("#percentage_credit_amount_checkbox").is(":checked")) {
                                $("#check_of39a").show();
                                $("#_150_of39a_percentage_credit_amount_tolerance1").attr("disabled", false);
                                $("#_151_of39a_percentage_credit_amount_tolerance2").attr("disabled", false);
                            } else {
                                $("#check_of39a").hide();
                                $("#_150_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
                                $("#_151_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
                            }
                        });
                        
                        
                     //of48//   
                $("#check_of48").hide();
                $("#_360_of48_days").attr("disabled", true);
                $("#_361_of48_narrative").attr("disabled", true);
                $("#period_for_presentation_in_days_checkbox").click(function(){
                            if ($("#period_for_presentation_in_days_checkbox").is(":checked")) {
                                $("#check_of48").show();
                                $("#_360_of48_days").attr("disabled", false);
                                $("#_361_of48_narrative").attr("disabled", false);
                            } else {
                                $("#check_of48").hide();
                                $("#_360_of48_days").attr("disabled", true);
                                $("#_361_of48_narrative").attr("disabled", true);
                            }
                        });
        //of52a//
        $("#div_090_of52a_A").hide();
        $("#div_090_of52a_D").hide();
        $("#_091_of52a_party_identifier").attr("disabled", true);
        $("#_092_of52a_identifier_code").attr("disabled", true);
        $("#_093_of52a_party_identifier").attr("disabled", true);
        $("#_094_of52a_name_address").attr("disabled", true);
        $("#_090_of52a_issuing_bank").change(function() {
            if ( $("#_090_of52a_issuing_bank").val() == "a"){
                $("#div_090_of52a_A").show();
                $("#div_090_of52a_D").hide();
                $("#_091_of52a_party_identifier").attr("disabled", false);
                $("#_092_of52a_identifier_code").attr("disabled", false);
                $("#_093_of52a_party_identifier").attr("disabled", true);
                 $("#_094_of52a_name_address").attr("disabled", true);
            } else if ( $("#_090_of52a_issuing_bank").val() == "d"){
                $("#div_090_of52a_A").hide();
                $("#div_090_of52a_D").show();
                $("#_091_of52a_party_identifier").attr("disabled", true);
                $("#_092_of52a_identifier_code").attr("disabled", true);
                $("#_093_of52a_party_identifier").attr("disabled", false);
                $("#_094_of52a_name_address").attr("disabled", false);
            } else{
                $("#div_090_of52a_A").hide();
                $("#div_090_of52a_D").hide();
                $("#_091_of52a_party_identifier").attr("disabled", true);
                $("#_092_of52a_identifier_code").attr("disabled", true);
                $("#_093_of52a_party_identifier").attr("disabled", true);
                $("#_094_of52a_name_address").attr("disabled", true);
            }
        });
        
        //mf40e narrative//
        $("#div_070_mf40e_narrative").hide();
        $("#_071_mf40e_narrative").attr("disabled", true);
        $("#_070_mf40e_applicable_rules").change(function() {
            if ( $("#_070_mf40e_applicable_rules").val() == "OTHR"){
                $("#div_070_mf40e_narrative").show();
                $("#_071_mf40e_narrative").attr("disabled", false);
            } else{
                $("#div_070_mf40e_narrative").hide();
                $("#_071_mf40e_narrative").attr("disabled", true);
            }
        });
        
        //of51a//
        $("#div_110_of51a_A").hide();
        $("#div_110_of51a_D").hide();
        $("#_111_of51a_party_identifier").attr("disabled", true);
        $("#_112_of51a_bic").attr("disabled", true);
        $("#_113_of51a_party_identifier").attr("disabled", true);
        $("#_114_of51a_name_address").attr("disabled", true);
        $("#_110_of51a_applicant_bank").change(function() {
            if ( $("#_110_of51a_applicant_bank").val() == "a"){
                $("#div_110_of51a_A").show();
                $("#div_110_of51a_D").hide();
                $("#_111_of51a_party_identifier").attr("disabled", false);
                $("#_112_of51a_bic").attr("disabled", false);
                $("#_113_of51a_party_identifier").attr("disabled", true);
                $("#_114_of51a_name_address").attr("disabled", true);
            } else if ( $("#_110_of51a_applicant_bank").val() == "d"){
                $("#div_110_of51a_A").hide();
                $("#div_110_of51a_D").show();
                $("#_111_of51a_party_identifier").attr("disabled", true);
                $("#_112_of51a_bic").attr("disabled", true);
                $("#_113_of51a_party_identifier").attr("disabled", false);
                $("#_114_of51a_name_address").attr("disabled", false);
            } else{
                $("#div_110_of51a_A").hide();
                $("#div_110_of51a_D").hide();
                $("#_111_of51a_party_identifier").attr("disabled", true);
                $("#_112_of51a_bic").attr("disabled", true);
                $("#_113_of51a_party_identifier").attr("disabled", true);
                $("#_114_of51a_name_address").attr("disabled", true);
            }
        });


        //of42a
         $("#div_190_of42a_A").hide();
        $("#div_190_of42a_D").hide();
        $("#_191_of42a_party_identifier").attr("disabled", true);
        $("#_192_of42a_identifier_code").attr("disabled", true);
        $("#_193_of42a_party_identifier").attr("disabled", true);
        $("#_194_of42d_name_and_address").attr("disabled", true);
        $("#_190_of42a_drawee").change(function() {
            if ( $("#_190_of42a_drawee").val() == "a"){
                $("#div_190_of42a_A").show();
                $("#div_190_of42a_D").hide();
                 $("#_191_of42a_party_identifier").attr("disabled", false);
                $("#_192_of42a_identifier_code").attr("disabled", false);
                $("#_193_of42a_party_identifier").attr("disabled", true);
                $("#_194_of42d_name_and_address").attr("disabled", true);
            } else if ( $("#_190_of42a_drawee").val() == "d"){
                $("#div_190_of42a_A").hide();
                $("#div_190_of42a_D").show();
                $("#_191_of42a_party_identifier").attr("disabled", true);
                $("#_192_of42a_identifier_code").attr("disabled", true);
                $("#_193_of42a_party_identifier").attr("disabled", false);
                $("#_194_of42d_name_and_address").attr("disabled", false);
            } else{
                $("#div_190_of42a_A").hide();
                $("#div_190_of42a_D").hide();
                $("#_191_of42a_party_identifier").attr("disabled", true);
                $("#_192_of42a_identifier_code").attr("disabled", true);
                $("#_193_of42a_party_identifier").attr("disabled", true);
                $("#_194_of42d_name_and_address").attr("disabled", true);
            }
        });

        //mf41a
       $("#div_170_mf41a_A").hide();
        $("#div_170_mf41a_D").hide();
        $("#_171_mf41a_identifier_code").attr("disabled", true);
        $("#_172_mf41a_code").attr("disabled", true);
        $("#_173_mf41d_name_and_address").attr("disabled", true);
        $("#_174_mf41d_code").attr("disabled", true);
        $("#_170_mf41a_available_with_by").change(function() {
            if ( $("#_170_mf41a_available_with_by").val() == "a"){
                $("#div_170_mf41a_A").show();
                $("#div_170_mf41a_D").hide();
               $("#_171_mf41a_identifier_code").attr("disabled", false);
                $("#_172_mf41a_code").attr("disabled", false);
                $("#_173_mf41d_name_and_address").attr("disabled", true);
                $("#_174_mf41d_code").attr("disabled", true);
            } else if ( $("#_170_mf41a_available_with_by").val() == "d"){
                $("#div_170_mf41a_A").hide();
                $("#div_170_mf41a_D").show();
                $("#_171_mf41a_identifier_code").attr("disabled", true);
                $("#_172_mf41a_code").attr("disabled", true);
                $("#_173_mf41d_name_and_address").attr("disabled", false);
                $("#_174_mf41d_code").attr("disabled", false);
            } else{
                $("#div_170_mf41a_A").hide();
                $("#div_170_mf41a_D").hide();
                $("#_171_mf41a_identifier_code").attr("disabled", true);
                $("#_172_mf41a_code").attr("disabled", true);
                $("#_173_mf41d_name_and_address").attr("disabled", true);
                $("#_174_mf41d_code").attr("disabled", true);
            }
        });

        $("#div_380_of58a_A").hide();
        $("#div_380_of58a_D").hide();
        $("#_381_of58a_party_identifier").attr("disabled", true);
        $("#_382_of58a_bic").attr("disabled", true);
        $("#_383_of58a_party_identifier").attr("disabled", true);
        $("#_384_of58a_name_address").attr("disabled", true);
        $("#_380_of58a_requested_confirmation_party").change(function() {
            if ( $("#_380_of58a_requested_confirmation_party").val() == "a"){
                $("#div_380_of58a_A").show();
                $("#div_380_of58a_D").hide();
                $("#_381_of58a_party_identifier").attr("disabled", false);
                $("#_382_of58a_bic").attr("disabled", false);
                $("#_383_of58a_party_identifier").attr("disabled", true);
                $("#_384_of58a_name_address").attr("disabled", true);
            } else if ( $("#_380_of58a_requested_confirmation_party").val() == "d"){
                $("#div_380_of58a_A").hide();
                $("#div_380_of58a_D").show();
                $("#_381_of58a_party_identifier").attr("disabled", true);
                $("#_382_of58a_bic").attr("disabled", true);
                $("#_383_of58a_party_identifier").attr("disabled", false);
                $("#_384_of58a_name_address").attr("disabled", false);
            } else{
                $("#div_380_of58a_A").hide();
                $("#div_380_of58a_D").hide();
                $("#_381_of58a_party_identifier").attr("disabled", true);
                $("#_382_of58a_bic").attr("disabled", true);
                $("#_383_of58a_party_identifier").attr("disabled", true);
                $("#_384_of58a_name_address").attr("disabled", true);
            }
        });
        
        
        //of53a//
        $("#div_390_of53a_A").hide();
        $("#div_390_of53a_D").hide();
        $("#_391_of53a_party_identifier").attr("disabled", true);
        $("#_392_of53a_bic").attr("disabled", true);
        $("#_393_of53a_party_identifier").attr("disabled", true);
        $("#_394_of53a_name_address").attr("disabled", true);
        $("#_390_of53a_reimbursing_bank").change(function() {
            if ( $("#_390_of53a_reimbursing_bank").val() == "a"){
                $("#div_390_of53a_A").show();
                $("#div_390_of53a_D").hide();
               $("#_391_of53a_party_identifier").attr("disabled", false);
                $("#_392_of53a_bic").attr("disabled", false);
                $("#_393_of53a_party_identifier").attr("disabled", true);
                $("#_394_of53a_name_address").attr("disabled", true);
            } else if ( $("#_390_of53a_reimbursing_bank").val() == "d"){
                $("#div_390_of53a_A").hide();
                $("#div_390_of53a_D").show();
                $("#_391_of53a_party_identifier").attr("disabled", true);
                $("#_392_of53a_bic").attr("disabled", true);
                $("#_393_of53a_party_identifier").attr("disabled", false);
                $("#_394_of53a_name_address").attr("disabled", false);
            } else{
               $("#div_390_of53a_A").hide();
                $("#div_390_of53a_D").hide();
                $("#_391_of53a_party_identifier").attr("disabled", true);
                $("#_392_of53a_bic").attr("disabled", true);
                $("#_393_of53a_party_identifier").attr("disabled", true);
                $("#_394_of53a_name_address").attr("disabled", true);
            }
        });
        
        //OF57A//
        $("#div_420_of57a_A").hide();
        $("#div_420_of57a_B").hide();
        $("#div_420_of57a_D").hide();
        $("#_421_of57a_party_identifier").attr("disabled", true);
        $("#_422_of57a_bic").attr("disabled", true);
        $("#_423_of57a_party_identifier").attr("disabled", true);
        $("#_424_of57a_location").attr("disabled", true);
        $("#_425_of57a_party_identifier").attr("disabled", true);
        $("#_426_of57a_name_address").attr("disabled", true);
        $("#_420_of57a_advise_through_bank").change(function() {
            if ( $("#_420_of57a_advise_through_bank").val() == "a"){
                $("#div_420_of57a_A").show();
                $("#div_420_of57a_B").hide();
                $("#div_420_of57a_D").hide();
                $("#_421_of57a_party_identifier").attr("disabled", false);
                $("#_422_of57a_bic").attr("disabled", false);
                $("#_423_of57a_party_identifier").attr("disabled", true);
                $("#_424_of57a_location").attr("disabled", true);
                $("#_425_of57a_party_identifier").attr("disabled", true);
                $("#_426_of57a_name_address").attr("disabled", true);
            } else if ( $("#_420_of57a_advise_through_bank").val() == "b"){
                $("#div_420_of57a_A").hide();
                $("#div_420_of57a_B").show();
                $("#div_420_of57a_D").hide();
                $("#_421_of57a_party_identifier").attr("disabled", true);
                $("#_422_of57a_bic").attr("disabled", true);
                $("#_423_of57a_party_identifier").attr("disabled", false);
                $("#_424_of57a_location").attr("disabled", false);
                $("#_425_of57a_party_identifier").attr("disabled", true);
                $("#_426_of57a_name_address").attr("disabled", true);
            } else if ( $("#_420_of57a_advise_through_bank").val() == "d"){
                $("#div_420_of57a_A").hide();
                $("#div_420_of57a_B").hide();
                $("#div_420_of57a_D").show();
                $("#_421_of57a_party_identifier").attr("disabled", true);
                $("#_422_of57a_bic").attr("disabled", true);
                $("#_423_of57a_party_identifier").attr("disabled", true);
                $("#_424_of57a_location").attr("disabled", true);
                $("#_425_of57a_party_identifier").attr("disabled", false);
                $("#_426_of57a_name_address").attr("disabled", false);
            } else{
                $("#div_420_of57a_A").hide();
                $("#div_420_of57a_B").hide();
                $("#div_420_of57a_D").hide();
                $("#_421_of57a_party_identifier").attr("disabled", true);
                $("#_422_of57a_bic").attr("disabled", true);
                $("#_423_of57a_party_identifier").attr("disabled", true);
                $("#_424_of57a_location").attr("disabled", true);
                $("#_425_of57a_party_identifier").attr("disabled", true);
                $("#_426_of57a_name_address").attr("disabled", true);
            }
        });

      
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        if ($("#_150_of39a_percentage_credit_amount_tolerance1").val() != "" || $("#_151_of39a_percentage_credit_amount_tolerance2").val() != ""){
            $("#percentage_credit_amount_checkbox").attr("checked", true);
            $("#check_of39a").show();
            $("#_150_of39a_percentage_credit_amount_tolerance1").attr("disabled", false);
            $("#_151_of39a_percentage_credit_amount_tolerance2").attr("disabled", false);
        } else {
            $("#check_of39a").hide();
            $("#_150_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
            $("#_151_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
        }
        
        
        if ($("#_360_of48_days").val() != "" || $("#_361_of48_narrative").val() != ""){
            $("#period_for_presentation_in_days_checkbox").attr("checked", true);
            $("#check_of48").show();
            $("#_360_of48_days").attr("disabled", false);
            $("#_361_of48_narrative").attr("disabled", false);
        } else {
            $("#check_of48").hide();
            $("#_360_of48_days").attr("disabled", true);
            $("#_361_of48_narrative").attr("disabled", true);
        }
        
        //mf40e view rule//
        if ($("#_071_mf40e_narrative").val() != ""){
            $("#_070_mf40e_applicable_rules").val("OTHR").attr("selected",true);
            $("#div_070_mf40e_narrative").show();
            $("#_071_mf40e_narrative").attr("disabled", false);
        } else {
            $("#div_070_mf40e_narrative").hide();
            $("#_071_mf40e_narrative").attr("disabled", true);
        }

        //of52a a_d
           if ($("#_091_of52a_party_identifier").val() != "" || $("#_092_of52a_identifier_code").val() != ""){
              $("#_090_of52a_issuing_bank").val("a").attr("selected",true);
                $("#div_090_of52a_A").show();
                $("#div_090_of52a_D").hide();
                $("#_091_of52a_party_identifier").attr("disabled", false);
                $("#_092_of52a_identifier_code").attr("disabled", false);
                $("#_093_of52a_party_identifier").attr("disabled", true);
                $("#_094_of52a_name_address").attr("disabled", true);
          } else if ($("#_093_of52a_party_identifier").val() != "" || $("#_094_of52a_name_address").val() != ""){
                $("#_090_of52a_issuing_bank").val("d").attr("selected",true);
                $("#div_090_of52a_A").hide();
                $("#div_090_of52a_D").show();
                $("#_091_of52a_party_identifier").attr("disabled", true);
                $("#_092_of52a_identifier_code").attr("disabled", true);
                $("#_093_of52a_party_identifier").attr("disabled", false);
                $("#_094_of52a_name_address").attr("disabled", false);
            } else{
                $("#div_090_of52a_A").hide();
                $("#div_090_of52a_D").hide();
                $("#_091_of52a_party_identifier").attr("disabled", true);
                $("#_092_of52a_identifier_code").attr("disabled", true);
                $("#_093_of52a_party_identifier").attr("disabled", true);
                $("#_094_of52a_name_address").attr("disabled", true);
            }
            
            
        if ($("#_111_of51a_party_identifier").val() != "" || $("#_112_of51a_bic").val() != ""){
              $("#_110_of51a_applicant_bank").val("a").attr("selected",true);
                $("#div_110_of51a_A").show();
                $("#div_110_of51a_D").hide();
                $("#_111_of51a_party_identifier").attr("disabled", false);
                $("#_112_of51a_bic").attr("disabled", false);
                $("#_113_of51a_party_identifier").attr("disabled", true);
                $("#_114_of51a_name_address").attr("disabled", true);
          } else if ($("#_113_of51a_party_identifier").val() != "" || $("#_114_of51a_name_address").val() != ""){
                $("#_110_of51a_applicant_bank").val("d").attr("selected",true);
                $("#div_110_of51a_A").hide();
                $("#div_110_of51a_D").show();
                $("#_111_of51a_party_identifier").attr("disabled", true);
                $("#_112_of51a_bic").attr("disabled", true);
                $("#_113_of51a_party_identifier").attr("disabled", false);
                $("#_114_of51a_name_address").attr("disabled", false);
            } else{
                $("#div_110_of51a_A").hide();
                $("#div_110_of51a_D").hide();
                $("#_111_of51a_party_identifier").attr("disabled", true);
                $("#_112_of51a_bic").attr("disabled", true);
                $("#_113_of51a_party_identifier").attr("disabled", true);
                $("#_114_of51a_name_address").attr("disabled", true);
            }
            
            
            
            if ($("#_191_of42a_party_identifier").val() != "" || $("#_192_of42a_identifier_code").val() != ""){
                $("#_190_of42a_drawee").val("a").attr("selected",true);
                $("#div_190_of42a_A").show();
                $("#div_190_of42a_D").hide();
                 $("#_191_of42a_party_identifier").attr("disabled", false);
                $("#_192_of42a_identifier_code").attr("disabled", false);
                $("#_193_of42a_party_identifier").attr("disabled", true);
                $("#_194_of42d_name_and_address").attr("disabled", true);
           } else if ($("#_193_of42a_party_identifier").val() != "" || $("#_194_of42d_name_and_address").val() != ""){
                $("#_190_of42a_drawee").val("d").attr("selected",true);
                $("#div_190_of42a_A").hide();
                $("#div_190_of42a_D").show();
                $("#_191_of42a_party_identifier").attr("disabled", true);
                $("#_192_of42a_identifier_code").attr("disabled", true);
                $("#_193_of42a_party_identifier").attr("disabled", false);
                $("#_194_of42d_name_and_address").attr("disabled", false);
            } else{
                $("#div_190_of42a_A").hide();
                $("#div_190_of42a_D").hide();
                $("#_191_of42a_party_identifier").attr("disabled", true);
                $("#_192_of42a_identifier_code").attr("disabled", true);
                $("#_193_of42a_party_identifier").attr("disabled", true);
                $("#_194_of42d_name_and_address").attr("disabled", true);
            }
            
            //OF58//
           if ($("#_381_of58a_party_identifier").val() != "" || $("#_382_of58a_bic").val() != ""){
                $("#_380_of58a_requested_confirmation_party").val("a").attr("selected",true);
                $("#div_380_of58a_A").show();
                $("#div_380_of58a_D").hide();
                $("#_381_of58a_party_identifier").attr("disabled", false);
                $("#_382_of58a_bic").attr("disabled", false);
                $("#_383_of58a_party_identifier").attr("disabled", true);
                $("#_384_of58a_name_address").attr("disabled", true);
             } else if ($("#_383_of58a_party_identifier").val() != "" || $("#_384_of58a_name_address").val() != ""){
                $("#_380_of58a_requested_confirmation_party").val("d").attr("selected",true);
                $("#div_380_of58a_A").hide();
                $("#div_380_of58a_D").show();
                $("#_381_of58a_party_identifier").attr("disabled", true);
                $("#_382_of58a_bic").attr("disabled", true);
                $("#_383_of58a_party_identifier").attr("disabled", false);
                $("#_384_of58a_name_address").attr("disabled", false);
            } else{
                $("#div_380_of58a_A").hide();
                $("#div_380_of58a_D").hide();
                $("#_381_of58a_party_identifier").attr("disabled", true);
                $("#_382_of58a_bic").attr("disabled", true);
                $("#_383_of58a_party_identifier").attr("disabled", true);
                $("#_384_of58a_name_address").attr("disabled", true);
            }
            
             if ($("#_391_of53a_party_identifier").val() != "" || $("#_392_of53a_bic").val() != ""){
                $("#_390_of53a_reimbursing_bank").val("a").attr("selected",true);
                $("#div_390_of53a_A").show();
                $("#div_390_of53a_D").hide();
                $("#_391_of53a_party_identifier").attr("disabled", false);
                $("#_392_of53a_bic").attr("disabled", false);
                $("#_393_of53a_party_identifier").attr("disabled", true);
                $("#_394_of53a_name_address").attr("disabled", true);
              } else if ($("#_393_of53a_party_identifier").val() != "" || $("#_394_of53a_name_address").val() != ""){
                $("#_390_of53a_reimbursing_bank").val("d").attr("selected",true);
                $("#div_390_of53a_A").hide();
                $("#div_390_of53a_D").show();
                $("#_391_of53a_party_identifier").attr("disabled", true);
                $("#_392_of53a_bic").attr("disabled", true);
                $("#_393_of53a_party_identifier").attr("disabled", false);
                $("#_394_of53a_name_address").attr("disabled", false);
            } else{
               $("#div_390_of53a_A").hide();
                $("#div_390_of53a_D").hide();
                $("#_391_of53a_party_identifier").attr("disabled", true);
                $("#_392_of53a_bic").attr("disabled", true);
                $("#_393_of53a_party_identifier").attr("disabled", true);
                $("#_394_of53a_name_address").attr("disabled", true);
            }
            
            //of57 a_b_d
            if ($("#_421_of57a_party_identifier").val() != "" || $("#_422_of57a_bic").val() != ""){
                $("#_420_of57a_advise_through_bank").val("a").attr("selected",true);
                $("#div_420_of57a_A").show();
                $("#div_420_of57a_B").hide();
                $("#div_420_of57a_D").hide();
                $("#_421_of57a_party_identifier").attr("disabled", false);
                $("#_422_of57a_bic").attr("disabled", false);
                $("#_423_of57a_party_identifier").attr("disabled", true);
                $("#_424_of57a_location").attr("disabled", true);
                $("#_425_of57a_party_identifier").attr("disabled", true);
                $("#_426_of57a_name_address").attr("disabled", true);
           } else if ($("#_423_of57a_party_identifier").val() != "" || $("#_424_of57a_location").val() != ""){
                $("#_420_of57a_advise_through_bank").val("b").attr("selected",true);
                $("#div_420_of57a_A").hide();
                $("#div_420_of57a_B").show();
                $("#div_420_of57a_D").hide();
                $("#_421_of57a_party_identifier").attr("disabled", true);
                $("#_422_of57a_bic").attr("disabled", true);
                $("#_423_of57a_party_identifier").attr("disabled", false);
                $("#_424_of57a_location").attr("disabled", false);
                $("#_425_of57a_party_identifier").attr("disabled", true);
                $("#_426_of57a_name_address").attr("disabled", true);
           } else if ($("#_425_of57a_party_identifier").val() != "" || $("#_426_of57a_name_address").val() != ""){
                $("#_420_of57a_advise_through_bank").val("d").attr("selected",true);
                $("#div_420_of57a_A").hide();
                $("#div_420_of57a_B").hide();
                $("#div_420_of57a_D").show();
                $("#_421_of57a_party_identifier").attr("disabled", true);
                $("#_422_of57a_bic").attr("disabled", true);
                $("#_423_of57a_party_identifier").attr("disabled", true);
                $("#_424_of57a_location").attr("disabled", true);
                $("#_425_of57a_party_identifier").attr("disabled", false);
                $("#_426_of57a_name_address").attr("disabled", false);
            } else{
                $("#div_420_of57a_A").hide();
                $("#div_420_of57a_B").hide();
                $("#div_420_of57a_D").hide();
                $("#_421_of57a_party_identifier").attr("disabled", true);
                $("#_422_of57a_bic").attr("disabled", true);
                $("#_423_of57a_party_identifier").attr("disabled", true);
                $("#_424_of57a_location").attr("disabled", true);
                $("#_425_of57a_party_identifier").attr("disabled", true);
                $("#_426_of57a_name_address").attr("disabled", true);
            }
            
            if ($("#_171_mf41a_identifier_code").val() != "" || $("#_172_mf41a_code").val() != ""){
                $("#_170_mf41a_available_with_by").val("a").attr("selected",true);
                $("#div_170_mf41a_A").show();
                $("#div_170_mf41a_D").hide();
                $("#_171_mf41a_identifier_code").attr("disabled", false);
                $("#_172_mf41a_code").attr("disabled", false);
                $("#_173_mf41d_name_and_address").attr("disabled", true);
                $("#_174_mf41d_code").attr("disabled", true);
              } else if ($("#_173_mf41d_name_and_address").val() != "" || $("#_174_mf41d_code").val() != ""){
                 $("#_170_mf41a_available_with_by").val("d").attr("selected",true);  
                 $("#div_170_mf41a_A").hide();
                 $("#div_170_mf41a_D").show();
                 $("#_171_mf41a_identifier_code").attr("disabled", true);
                 $("#_172_mf41a_code").attr("disabled", true);
                 $("#_173_mf41d_name_and_address").attr("disabled", false);
                 $("#_174_mf41d_code").attr("disabled", false);
            } else{
                $("#div_170_mf41a_A").hide();
                $("#div_170_mf41a_D").hide();
                $("#_171_mf41a_identifier_code").attr("disabled", true);
                $("#_172_mf41a_code").attr("disabled", true);
                $("#_173_mf41d_name_and_address").attr("disabled", true);
                $("#_174_mf41d_code").attr("disabled", true);
            }


       

    });
</script>