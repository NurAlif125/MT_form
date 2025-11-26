<%-- 
    Document   : validate_rule_mt707
    Created on : Jul 23, 2018
    Author     : Andhita Deara
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
                //mf27
                _010_mf27_number: "required",
                _011_mf27_total: "required",

                //mf20
                _020_mf20_sender_reference: "required",

                //mf21
                _030_mf21_receiver_reference: "required",

                //mf23
                _040_mf23_issuing_bank_reference: "required",

                //mf31c
                _070_mf31c_date_of_issue: "required",

                //mf26e
                _080_mf26e_number_of_amendment: "required",

                //mf30
                _090_mf30_date_of_amendment: "required",

                //mf22a
                _100_mf22a_purpose_of_message: "required",
                
                //of23s - C1: At least one field must be present after field 22A
                _110_of23s_cancellation_request: {
                    required: function(element) {
                      return $("#_110_of23s_cancellation_request").val() == "" 
                              && $("#_120_of40a_form_of_documentary_credit").val() == ""
                              && $("#_130_of40e_applicable_rules").val() == ""
                              && $("#_131_of40e_narrative").val() == ""
                              && $("#_140_of31d_date_of_expiry").val() == ""
                              && $("#_141_of31d_place_of_expiry").val() == ""
                              && $("#_150_of50_changed_applicant_details").val() == ""
                              && $("#_160_of59_account").val() == ""
                              && $("#_161_of59_name_address").val() == ""
                              && $("#_170_of32b_currency").val() == ""
                              && $("#_171_of32b_amount").val() == ""
                              && $("#_180_of33b_currency").val() == ""
                              && $("#_181_of33b_amount").val() == ""
                              && $("#_190_of39a_percentage_credit_amount_tolerance1").val() == ""
                              && $("#_191_of39a_percentage_credit_amount_tolerance2").val() == ""
                              && $("#_200_of39c_additional_amounts_covered").val() == ""
                              && $("#type_of41_available_with_by").val() == ""
                              && $("#_220_of42c_drafts_at").val() == ""
                              && $("#_230_of42a_drawee").val() == ""
                              && $("#_240_of42m_mixed_payment_details").val() == ""
                              && $("#_250_of42p_negotiation_deferred_payment_details").val() == ""
                              && $("#_260_of43p_partial_shipments").val() == ""
                              && $("#_270_of43t_transhipment").val() == ""
                              && $("#_280_of44a_place_taking_in_charge_dispatch_from_place_of_receipt").val() == ""
                              && $("#_290_of44e_port_of_loading_airport_of_departure").val() == ""
                              && $("#_300_of44f_port_of_discharge_airport_of_destination").val() == ""
                              && $("#_310_of44b_place_of_final_destination_for_transportation_to_place_of_delivery").val() == ""
                              && $("#_320_of44c_latest_date_of_shipment").val() == ""
                              && $("#_330_of44d_shipment_period").val() == ""
                              && $("#_340_of45b_description_of_goods_and_or_services").val() == ""
                              && $("#_350_of46b_documents_required").val() == ""
                              && $("#_360_of47b_additional_conditions").val() == ""
                              && $("#_370_of49m_special_payment_conditions_for_beneficiary").val() == ""
                              && $("#_380_of49n_special_payment_conditions_for_bank_only").val() == ""
                              && $("#_390_of71d_charges").val() == ""
                              && $("#_400_of71n_charge_code").val() == ""
                              && $("#_401_of71n_narrative").val() == ""
                              && $("#_410_of48_days").val() == ""
                              && $("#_411_of48_narrative").val() == ""
                              && $("#_420_of49_confirmation_instructions").val() == ""
                              && $("#_430_of58a_requested_confirmation_party").val() == ""
                              && $("#_440_of53a_reimbursing_bank").val() == ""
                              && $("#_450_of78_instructions_to_the_paying_accepting_negotiating_bank").val() == ""
                              && $("#type_of57a_issuing_bank").val() == ""
                              && $("#_470_of72z_sender_to_receiver_information").val() == "";
                    }
                },
                
                //of52a - C3: Either field 50B or field 52a, but not both, must be present
                type_of52_issuing_bank: {
                    required: function(element) {
                      return ($("#_060_of50b_non_bank_issuer").val() == "" && $("#type_of52_issuing_bank").val() == "")
                             || ($("#_060_of50b_non_bank_issuer").val() != "" && $("#type_of52_issuing_bank").val() != "");
                    }
                },
                
                //of50b - C3: Either field 50B or field 52a, but not both, must be present
                _060_of50b_non_bank_issuer: {
                    required: function(element) {
                      return ($("#type_of52_issuing_bank").val() == "" && $("#_060_of50b_non_bank_issuer").val() == "")
                             || ($("#_060_of50b_non_bank_issuer").val() != "" && $("#type_of52_issuing_bank").val() != "");
                    }
                },
                
                //of32b - C2: Either field 32B or field 33B may be present, but not both
//                _170_of32b_currency: {
//                    required: function(element) {
//                      return ($("#_180_of33b_currency").val() == "" && $("#_181_of33b_amount").val() == "" && $("#_170_of32b_currency").val() == "" && $("#_171_of32b_amount").val() == "")
//                             || ($("#_180_of33b_currency").val() != "" && $("#_181_of33b_amount").val() != "" && $("#_170_of32b_currency").val() != "" && $("#_171_of32b_amount").val() != "");
//                    }
//                },
                
                //of33b - C2: Either field 32B or field 33B may be present, but not both
//                _180_of33b_currency: {
//                    required: function(element) {
//                      return ($("#_180_of33b_currency").val() == "" && $("#_181_of33b_amount").val() == "" && $("#_170_of32b_currency").val() == "" && $("#_171_of32b_amount").val() == "")
//                             || ($("#_180_of33b_currency").val() != "" && $("#_181_of33b_amount").val() != "" && $("#_170_of32b_currency").val() != "" && $("#_171_of32b_amount").val() != "");
//                    }
//                },
                
                //of44c - C4: Either field 44C or 44D, but not both, may be present
//                _320_of44c_latest_date_of_shipment: {
//                    required: function(element) {
//                      return ($("#_330_of44d_shipment_period").val() == "" && $("#_320_of44c_latest_date_of_shipment").val() == "")
//                             || ($("#_330_of44d_shipment_period").val() != "" && $("#_320_of44c_latest_date_of_shipment").val() != "");
//                    }
//                },
                
                //of44d - C4: Either field 44C or 44D, but not both, may be present
//                _330_of44d_shipment_period: {
//                    required: function(element) {
//                      return ($("#_330_of44d_shipment_period").val() == "" && $("#_320_of44c_latest_date_of_shipment").val() == "")
//                             || ($("#_330_of44d_shipment_period").val() != "" && $("#_320_of44c_latest_date_of_shipment").val() != "");
//                    }
//                },
                
                //of71n - Narrative is only required if code is OTHR
                _401_of71n_narrative: {
                    required: function(element) {
                      return $("#_400_of71n_charge_code").val() == "OTHR" ;
                    }
                },
                
                //of58a - Field must be present if confirmation instructions is MAY ADD or CONFIRM
                _430_of58a_requested_confirmation_party: {
                    required: function(element) {
                      return $("#_420_of49_confirmation_instructions").val() == "MAY ADD" 
                             || $("#_420_of49_confirmation_instructions").val() == "CONFIRM";
                    }
                },
                
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
                receiver_institution: {required: "receiver_institution must be filled..!!"},
                priority: {required: "priority must be filled..!!"},
                _010_mf27_number: {required: "mf27_number must be filled..!!"},
                _011_mf27_total: {required: "mf27_total must be filled..!!"},
                _020_mf20_sender_reference: {required: "mf20_sender_reference must be filled..!!"},
                _030_mf21_receiver_reference: {required: "mf21_receiver_reference must be filled..!!"},
                _040_mf23_issuing_bank_reference: {required: "mf23_issuing_bank_reference must be filled..!!"},
                _070_mf31c_date_of_issue: {required: "mf31c_date_of_issue must be filled..!!"},
                _080_mf26e_number_of_amendment: {required: "mf26e_number_of_amendment must be filled..!!"},
                _090_mf30_date_of_amendment: {required: "mf30_date_of_amendment must be filled..!!"},
                _100_mf22a_purpose_of_message: {required: "mf22a_purpose_of_message must be filled..!!"},
                type_of52_issuing_bank: {required: "fill in either of52a or of50b, but not both..!!"},
                _060_of50b_non_bank_issuer: {required: "fill in either of52a or of50b, but not both..!!"},
                _110_of23s_cancellation_request: {required: "fill in at least one field after mf22a..!!"},
//                _170_of32b_currency: {required: "fill in either of32b or of33b, but not both..!!"},
//                _180_of33b_currency: {required: "fill in either of32b or of33b, but not both..!!"},
//                _320_of44c_latest_date_of_shipment: {required: "fill in either of44c or of44d, but not both..!!"},
//                _330_of44d_shipment_period: {required: "fill in either of44c or of44d, but not both..!!"},
                _401_of71n_narrative: {required: "fill in narrative if code is OTHR..!!"},
                _430_of58a_requested_confirmation_party: {required: "field must be present if confirmation instructions is MAY ADD or CONFIRM..!!"},
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
        
        //OF32B_check
        $("#check_of32b").hide();
        $("#_170_of32b_currency").attr("disabled", true);
        $("#_171_of32b_amount").attr("disabled", true);
        $("#increase_of_credit_amount_checkbox").click(function(){
            if ($("#increase_of_credit_amount_checkbox").is(":checked")){
                $("#check_of32b").show();
                $("#_170_of32b_currency").attr("disabled", false);
                $("#_171_of32b_amount").attr("disabled", false);
            } else {
                $("#check_of32b").hide();
                $("#_170_of32b_currency").attr("disabled", true);
                $("#_171_of32b_amount").attr("disabled", true);
            }
        });
        
        //OF33B_check
        $("#check_of33b").hide();
        $("#_180_of33b_currency").attr("disabled", true);
        $("#_181_of33b_amount").attr("disabled", true);
        $("#decrease_of_credit_amount_checkbox").click(function(){
            if ($("#decrease_of_credit_amount_checkbox").is(":checked")){
                $("#check_of33b").show();
                $("#_180_of33b_currency").attr("disabled", false);
                $("#_181_of33b_amount").attr("disabled", false);
            } else {
                $("#check_of33b").hide();
                $("#_180_of33b_currency").attr("disabled", true);
                $("#_181_of33b_amount").attr("disabled", true);
            }
        });
        
        //OF39A_check
        $("#check_of39a").hide();
        $("#_190_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
        $("#_191_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
        $("#percentage_credit_amount_checkbox").click(function(){
            if ($("#percentage_credit_amount_checkbox").is(":checked")){
                $("#check_of39a").show();
                $("#_190_of39a_percentage_credit_amount_tolerance1").attr("disabled", false);
                $("#_191_of39a_percentage_credit_amount_tolerance2").attr("disabled", false);
            } else {
                $("#check_of39a").hide();
                $("#_190_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
                $("#_191_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
            }
        });

        //OF52a_A_D
        $("#div_050_of52a_A").hide();
        $("#div_050_of52a_D").hide();
        $("#_051_of52a_party_identifier").attr("disabled", true);
        $("#_052_of52a_identifier_code").attr("disabled", true);
        $("#_053_of52a_party_identifier").attr("disabled", true);
        $("#_054_of52a_name_address").attr("disabled", true);
        $("#type_of52_issuing_bank").change(function() {
            if ( $("#type_of52_issuing_bank").val() == "A"){
                $("#div_050_of52a_A").show();
                $("#div_050_of52a_D").hide();
                $("#_051_of52a_party_identifier").attr("disabled", false);
                $("#_052_of52a_identifier_code").attr("disabled", false);
                $("#_053_of52a_party_identifier").attr("disabled", true);
                $("#_054_of52a_name_address").attr("disabled", true);
            } else if ( $("#type_of52_issuing_bank").val() == "D"){
                $("#div_050_of52a_A").hide();
                $("#div_050_of52a_D").show();
                $("#_051_of52a_party_identifier").attr("disabled", true);
                $("#_052_of52a_identifier_code").attr("disabled", true);
                $("#_053_of52a_party_identifier").attr("disabled", false);
                $("#_054_of52a_name_address").attr("disabled", false);
            } else{
                $("#div_050_of52a_A").hide();
                $("#div_050_of52a_D").hide();
                $("#_051_of52a_party_identifier").attr("disabled", true);
                $("#_052_of52a_identifier_code").attr("disabled", true);
                $("#_053_of52a_party_identifier").attr("disabled", true);
                $("#_054_of52a_name_address").attr("disabled", true);
            }
        });

        //OF40E_narrative (only if OTHR)
        $("#div_130_of40e_narrative").hide();
        $("#_131_of40e_narrative").attr("disabled", true);
        $("#_130_of40e_applicable_rules").change(function() {
            if ( $("#_130_of40e_applicable_rules").val() == "OTHR"){
                $("#div_130_of40e_narrative").show();
                $("#_131_of40e_narrative").attr("disabled", false);
            } else{
                $("#div_130_of40e_narrative").hide();
                $("#_131_of40e_narrative").attr("disabled", true);
            }
        });

        //OF41a_a_d
        $("#div_of41a_").hide();
        $("#div_of41d_").hide();
        $("#_211_of41a_party_identifier").attr("disabled", true);
        $("#_212_of41a_code").attr("disabled", true);
        $("#_213_of41d_name_and_address").attr("disabled", true);
        $("#_214_of41d_code").attr("disabled", true);
        $("#type_of41_available_with_by").change(function() {
            if ( $("#type_of41_available_with_by").val() == "a"){
                $("#div_of41a_").show();
                $("#div_of41d_").hide();
                $("#_211_of41a_party_identifier").attr("disabled", false);
                $("#_212_of41a_code").attr("disabled", false);
                $("#_213_of41d_name_and_address").attr("disabled", true);
                $("#_214_of41d_code").attr("disabled", true);
            } else if ( $("#type_of41_available_with_by").val() == "d"){
                $("#div_of41a_").hide();
                $("#div_of41d_").show();
                $("#_211_of41a_party_identifier").attr("disabled", true);
                $("#_212_of41a_code").attr("disabled", true);
                $("#_213_of41d_name_and_address").attr("disabled", false);
                $("#_214_of41d_code").attr("disabled", false);
            } else{
                $("#div_of41a_").hide();
                $("#div_of41d_").hide();
                $("#_211_of41a_party_identifier").attr("disabled", true);
                $("#_212_of41a_code").attr("disabled", true);
                $("#_213_of41d_name_and_address").attr("disabled", true);
                $("#_214_of41d_code").attr("disabled", true);
            }
        });

        //OF42a_A_D
        $("#div_230_of42a_A").hide();
        $("#div_230_of42a_D").hide();
        $("#_231_of42a_party_identifier").attr("disabled", true);
        $("#_232_of42a_identifier_code").attr("disabled", true);
        $("#_233_of42a_party_identifier").attr("disabled", true);
        $("#_234_of42a_name_address").attr("disabled", true);
        $("#_230_of42a_drawee").change(function() {
            if ( $("#_230_of42a_drawee").val() == "A"){
                $("#div_230_of42a_A").show();
                $("#div_230_of42a_D").hide();
                $("#_231_of42a_party_identifier").attr("disabled", false);
                $("#_232_of42a_identifier_code").attr("disabled", false);
                $("#_233_of42a_party_identifier").attr("disabled", true);
                $("#_234_of42a_name_address").attr("disabled", true);
            } else if ( $("#_230_of42a_drawee").val() == "D"){
                $("#div_230_of42a_A").hide();
                $("#div_230_of42a_D").show();
                $("#_231_of42a_party_identifier").attr("disabled", true);
                $("#_232_of42a_identifier_code").attr("disabled", true);
                $("#_233_of42a_party_identifier").attr("disabled", false);
                $("#_234_of42a_name_address").attr("disabled", false);
            } else{
                $("#div_230_of42a_A").hide();
                $("#div_230_of42a_D").hide();
                $("#_231_of42a_party_identifier").attr("disabled", true);
                $("#_232_of42a_identifier_code").attr("disabled", true);
                $("#_233_of42a_party_identifier").attr("disabled", true);
                $("#_234_of42a_name_address").attr("disabled", true);
            }
        });

        //OF58a_A_D
        $("#div_430_of58a_A").hide();
        $("#div_430_of58a_D").hide();
        $("#_431_of58a_party_identifier").attr("disabled", true);
        $("#_432_of58a_identifier_code").attr("disabled", true);
        $("#_433_of58a_party_identifier").attr("disabled", true);
        $("#_434_of58a_name_address").attr("disabled", true);
        $("#_430_of58a_requested_confirmation_party").change(function() {
            if ( $("#_430_of58a_requested_confirmation_party").val() == "A"){
                $("#div_430_of58a_A").show();
                $("#div_430_of58a_D").hide();
                $("#_431_of58a_party_identifier").attr("disabled", false);
                $("#_432_of58a_identifier_code").attr("disabled", false);
                $("#_433_of58a_party_identifier").attr("disabled", true);
                $("#_434_of58a_name_address").attr("disabled", true);
            } else if ( $("#_430_of58a_requested_confirmation_party").val() == "D"){
                $("#div_430_of58a_A").hide();
                $("#div_430_of58a_D").show();
                $("#_431_of58a_party_identifier").attr("disabled", true);
                $("#_432_of58a_identifier_code").attr("disabled", true);
                $("#_433_of58a_party_identifier").attr("disabled", false);
                $("#_434_of58a_name_address").attr("disabled", false);
            } else{
                $("#div_430_of58a_A").hide();
                $("#div_430_of58a_D").hide();
                $("#_431_of58a_party_identifier").attr("disabled", true);
                $("#_432_of58a_identifier_code").attr("disabled", true);
                $("#_433_of58a_party_identifier").attr("disabled", true);
                $("#_434_of58a_name_address").attr("disabled", true);
            }
        });
        
        //OF53a_A_D
        $("#div_440_of53a_A").hide();
        $("#div_440_of53a_D").hide();
        $("#_441_of53a_party_identifier").attr("disabled", true);
        $("#_442_of53a_identifier_code").attr("disabled", true);
        $("#_443_of53a_party_identifier").attr("disabled", true);
        $("#_444_of53a_name_address").attr("disabled", true);
        $("#_440_of53a_reimbursing_bank").change(function() {
            if ( $("#_440_of53a_reimbursing_bank").val() == "A"){
                $("#div_440_of53a_A").show();
                $("#div_440_of53a_D").hide();
                $("#_441_of53a_party_identifier").attr("disabled", false);
                $("#_442_of53a_identifier_code").attr("disabled", false);
                $("#_443_of53a_party_identifier").attr("disabled", true);
                $("#_444_of53a_name_address").attr("disabled", true);
            } else if ( $("#_440_of53a_reimbursing_bank").val() == "D"){
                $("#div_440_of53a_A").hide();
                $("#div_440_of53a_D").show();
                $("#_441_of53a_party_identifier").attr("disabled", true);
                $("#_442_of53a_identifier_code").attr("disabled", true);
                $("#_443_of53a_party_identifier").attr("disabled", false);
                $("#_444_of53a_name_address").attr("disabled", false);
            } else{
                $("#div_440_of53a_A").hide();
                $("#div_440_of53a_D").hide();
                $("#_441_of53a_party_identifier").attr("disabled", true);
                $("#_442_of53a_identifier_code").attr("disabled", true);
                $("#_443_of53a_party_identifier").attr("disabled", true);
                $("#_444_of53a_name_address").attr("disabled", true);
            }
        });
        
        //OF57a_A_B_D
        $("#div_460_of57a_A").hide();
        $("#div_460_of57a_B").hide();
        $("#div_460_of57a_D").hide();
        $("#_461_of57a_party_identifier").attr("disabled", true);
        $("#_462_of57a_identifier_code").attr("disabled", true);
        $("#_463_of57a_party_identifier").attr("disabled", true);
        $("#_464_of57a_location").attr("disabled", true);
        $("#_465_of57a_party_identifier").attr("disabled", true);
        $("#_466_of57a_name_address").attr("disabled", true);
        $("#type_of57a_issuing_bank").change(function() {
            if ( $("#type_of57a_issuing_bank").val() == "A"){
                $("#div_460_of57a_A").show();
                $("#div_460_of57a_B").hide();
                $("#div_460_of57a_D").hide();
                $("#_461_of57a_party_identifier").attr("disabled", false);
                $("#_462_of57a_identifier_code").attr("disabled", false);
                $("#_463_of57a_party_identifier").attr("disabled", true);
                $("#_464_of57a_location").attr("disabled", true);
                $("#_465_of57a_party_identifier").attr("disabled", true);
                $("#_466_of57a_name_address").attr("disabled", true);
            } else if ( $("#type_of57a_issuing_bank").val() == "B"){
                $("#div_460_of57a_A").hide();
                $("#div_460_of57a_B").show();
                $("#div_460_of57a_D").hide();
                $("#_461_of57a_party_identifier").attr("disabled", true);
                $("#_462_of57a_identifier_code").attr("disabled", true);
                $("#_463_of57a_party_identifier").attr("disabled", false);
                $("#_464_of57a_location").attr("disabled", false);
                $("#_465_of57a_party_identifier").attr("disabled", true);
                $("#_466_of57a_name_address").attr("disabled", true);
            } else if ( $("#type_of57a_issuing_bank").val() == "D"){
                $("#div_460_of57a_A").hide();
                $("#div_460_of57a_B").hide();
                $("#div_460_of57a_D").show();
                $("#_461_of57a_party_identifier").attr("disabled", true);
                $("#_462_of57a_identifier_code").attr("disabled", true);
                $("#_463_of57a_party_identifier").attr("disabled", true);
                $("#_464_of57a_location").attr("disabled", true);
                $("#_465_of57a_party_identifier").attr("disabled", false);
                $("#_466_of57a_name_address").attr("disabled", false);
            } else{
                $("#div_460_of57a_A").hide();
                $("#div_460_of57a_B").hide();
                $("#div_460_of57a_D").hide();
                $("#_461_of57a_party_identifier").attr("disabled", true);
                $("#_462_of57a_identifier_code").attr("disabled", true);
                $("#_463_of57a_party_identifier").attr("disabled", true);
                $("#_464_of57a_location").attr("disabled", true);
                $("#_465_of57a_party_identifier").attr("disabled", true);
                $("#_466_of57a_name_address").attr("disabled", true);
            }
        });

        //OF71N_narrative (only if OTHR)
        $("#div_400_of71n_narrative").hide();
        $("#_401_of71n_narrative").attr("disabled", true);
        $("#_400_of71n_charge_code").change(function() {
            if ( $("#_400_of71n_charge_code").val() == "OTHR"){
                $("#div_400_of71n_narrative").show();
                $("#_401_of71n_narrative").attr("disabled", false);
            } else{
                $("#div_400_of71n_narrative").hide();
                $("#_401_of71n_narrative").attr("disabled", true);
            }
        });

    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF32B_check
        if ($("#_170_of32b_currency").val() != "" || $("#_171_of32b_amount").val() != ""){
            $("#increase_of_credit_amount_checkbox").attr("checked", true);
            $("#check_of32b").show();
            $("#_170_of32b_currency").attr("disabled", false);
            $("#_171_of32b_amount").attr("disabled", false);
        } else {
            $("#check_of32b").hide();
            $("#_170_of32b_currency").attr("disabled", true);
            $("#_171_of32b_amount").attr("disabled", true);
        }
        
        //OF33B_check
        if ($("#_180_of33b_currency").val() != "" || $("#_181_of33b_amount").val() != ""){
            $("#decrease_of_credit_amount_checkbox").attr("checked", true);
            $("#check_of33b").show();
            $("#_180_of33b_currency").attr("disabled", false);
            $("#_181_of33b_amount").attr("disabled", false);
        } else {
            $("#check_of33b").hide();
            $("#_180_of33b_currency").attr("disabled", true);
            $("#_181_of33b_amount").attr("disabled", true);
        }
        
        //OF39A_check
        if ($("#_190_of39a_percentage_credit_amount_tolerance1").val() != "" || $("#_191_of39a_percentage_credit_amount_tolerance2").val() != ""){
            $("#percentage_credit_amount_checkbox").attr("checked", true);
            $("#check_of39a").show();
            $("#_190_of39a_percentage_credit_amount_tolerance1").attr("disabled", false);
            $("#_191_of39a_percentage_credit_amount_tolerance2").attr("disabled", false);
        } else {
            $("#check_of39a").hide();
            $("#_190_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
            $("#_191_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
        }
        
        //OF52a_A_D
        if ($("#_051_of52a_party_identifier").val() != "" || $("#_052_of52a_identifier_code").val() != ""){
            $("#type_of52_issuing_bank").val("A").attr("selected",true);
            $("#div_050_of52a_A").show();
            $("#div_050_of52a_D").hide();
            $("#_051_of52a_party_identifier").attr("disabled", false);
            $("#_052_of52a_identifier_code").attr("disabled", false);
            $("#_053_of52a_party_identifier").attr("disabled", true);
            $("#_054_of52a_name_address").attr("disabled", true);
        } else if ($("#_053_of52a_party_identifier").val() != "" || $("#_054_of52a_name_address").val() != ""){
            $("#type_of52_issuing_bank").val("D").attr("selected",true);
            $("#div_050_of52a_A").hide();
            $("#div_050_of52a_D").show();
            $("#_051_of52a_party_identifier").attr("disabled", true);
            $("#_052_of52a_identifier_code").attr("disabled", true);
            $("#_053_of52a_party_identifier").attr("disabled", false);
            $("#_054_of52a_name_address").attr("disabled", false);
        } else{
            $("#div_050_of52a_A").hide();
            $("#div_050_of52a_D").hide();
            $("#_051_of52a_party_identifier").attr("disabled", true);
            $("#_052_of52a_identifier_code").attr("disabled", true);
            $("#_053_of52a_party_identifier").attr("disabled", true);
            $("#_054_of52a_name_address").attr("disabled", true);
        }

        //OF40E_narrative
        if ($("#_131_of40e_narrative").val() != ""){
            $("#_130_of40e_applicable_rules").val("OTHR").attr("selected",true);
            $("#div_130_of40e_narrative").show();
            $("#_131_of40e_narrative").attr("disabled", false);
        } else{
            $("#div_130_of40e_narrative").hide();
            $("#_131_of40e_narrative").attr("disabled", true);
        }

        //OF41a_a_d
        if ($("#_211_of41a_party_identifier").val() != "" || $("#_212_of41a_code").val() != ""){
            $("#type_of41_available_with_by").val("a").attr("selected",true);
            $("#div_of41a_").show();
            $("#div_of41d_").hide();
            $("#_211_of41a_party_identifier").attr("disabled", false);
            $("#_212_of41a_code").attr("disabled", false);
            $("#_213_of41d_name_and_address").attr("disabled", true);
            $("#_214_of41d_code").attr("disabled", true);
        } else if ($("#_213_of41d_name_and_address").val() != "" || $("#_214_of41d_code").val() != ""){
            $("#type_of41_available_with_by").val("d").attr("selected",true);
            $("#div_of41a_").hide();
            $("#div_of41d_").show();
            $("#_211_of41a_party_identifier").attr("disabled", true);
            $("#_212_of41a_code").attr("disabled", true);
            $("#_213_of41d_name_and_address").attr("disabled", false);
            $("#_214_of41d_code").attr("disabled", false);
        } else{
            $("#div_of41a_").hide();
            $("#div_of41d_").hide();
            $("#_211_of41a_party_identifier").attr("disabled", true);
            $("#_212_of41a_code").attr("disabled", true);
            $("#_213_of41d_name_and_address").attr("disabled", true);
            $("#_214_of41d_code").attr("disabled", true);
        }
        
        //OF42a_A_D
        if ($("#_231_of42a_party_identifier").val() != "" || $("#_232_of42a_identifier_code").val() != ""){
            $("#_230_of42a_drawee").val("A").attr("selected",true);
            $("#div_230_of42a_A").show();
            $("#div_230_of42a_D").hide();
            $("#_231_of42a_party_identifier").attr("disabled", false);
            $("#_232_of42a_identifier_code").attr("disabled", false);
            $("#_233_of42a_party_identifier").attr("disabled", true);
            $("#_234_of42a_name_address").attr("disabled", true);
        } else if ($("#_233_of42a_party_identifier").val() != "" || $("#_234_of42a_name_address").val() != ""){
            $("#_230_of42a_drawee").val("D").attr("selected",true);
            $("#div_230_of42a_A").hide();
            $("#div_230_of42a_D").show();
            $("#_231_of42a_party_identifier").attr("disabled", true);
            $("#_232_of42a_identifier_code").attr("disabled", true);
            $("#_233_of42a_party_identifier").attr("disabled", false);
            $("#_234_of42a_name_address").attr("disabled", false);
        } else{
            $("#div_230_of42a_A").hide();
            $("#div_230_of42a_D").hide();
            $("#_231_of42a_party_identifier").attr("disabled", true);
            $("#_232_of42a_identifier_code").attr("disabled", true);
            $("#_233_of42a_party_identifier").attr("disabled", true);
            $("#_234_of42a_name_address").attr("disabled", true);
        }
        
        //OF58a_A_D
        if ($("#_431_of58a_party_identifier").val() != "" || $("#_432_of58a_identifier_code").val() != ""){
            $("#_430_of58a_requested_confirmation_party").val("A").attr("selected",true);
            $("#div_430_of58a_A").show();
            $("#div_430_of58a_D").hide();
            $("#_431_of58a_party_identifier").attr("disabled", false);
            $("#_432_of58a_identifier_code").attr("disabled", false);
            $("#_433_of58a_party_identifier").attr("disabled", true);
            $("#_434_of58a_name_address").attr("disabled", true);
        } else if ($("#_433_of58a_party_identifier").val() != "" || $("#_434_of58a_name_address").val() != ""){
            $("#_430_of58a_requested_confirmation_party").val("D").attr("selected",true);
            $("#div_430_of58a_A").hide();
            $("#div_430_of58a_D").show();
            $("#_431_of58a_party_identifier").attr("disabled", true);
            $("#_432_of58a_identifier_code").attr("disabled", true);
            $("#_433_of58a_party_identifier").attr("disabled", false);
            $("#_434_of58a_name_address").attr("disabled", false);
        } else{
            $("#div_430_of58a_A").hide();
            $("#div_430_of58a_D").hide();
            $("#_431_of58a_party_identifier").attr("disabled", true);
            $("#_432_of58a_identifier_code").attr("disabled", true);
            $("#_433_of58a_party_identifier").attr("disabled", true);
            $("#_434_of58a_name_address").attr("disabled", true);
        }
        
        //OF53a_A_D
        if ($("#_441_of53a_party_identifier").val() != "" || $("#_442_of53a_identifier_code").val() != ""){
            $("#_440_of53a_reimbursing_bank").val("A").attr("selected",true);
            $("#div_440_of53a_A").show();
            $("#div_440_of53a_D").hide();
            $("#_441_of53a_party_identifier").attr("disabled", false);
            $("#_442_of53a_identifier_code").attr("disabled", false);
            $("#_443_of53a_party_identifier").attr("disabled", true);
            $("#_444_of53a_name_address").attr("disabled", true);
        } else if ($("#_443_of53a_party_identifier").val() != "" || $("#_444_of53a_name_address").val() != ""){
            $("#_440_of53a_reimbursing_bank").val("D").attr("selected",true);
            $("#div_440_of53a_A").hide();
            $("#div_440_of53a_D").show();
            $("#_441_of53a_party_identifier").attr("disabled", true);
            $("#_442_of53a_identifier_code").attr("disabled", true);
            $("#_443_of53a_party_identifier").attr("disabled", false);
            $("#_444_of53a_name_address").attr("disabled", false);
        } else{
            $("#div_440_of53a_A").hide();
            $("#div_440_of53a_D").hide();
            $("#_441_of53a_party_identifier").attr("disabled", true);
            $("#_442_of53a_identifier_code").attr("disabled", true);
            $("#_443_of53a_party_identifier").attr("disabled", true);
            $("#_444_of53a_name_address").attr("disabled", true);
        }
        
        //OF57a_A_B_D
        if ($("#_461_of57a_party_identifier").val() != "" || $("#_462_of57a_identifier_code").val() != ""){
            $("#type_of57a_issuing_bank").val("A").attr("selected",true);
            $("#div_460_of57a_A").show();
            $("#div_460_of57a_B").hide();
            $("#div_460_of57a_D").hide();
            $("#_461_of57a_party_identifier").attr("disabled", false);
            $("#_462_of57a_identifier_code").attr("disabled", false);
            $("#_463_of57a_party_identifier").attr("disabled", true);
            $("#_464_of57a_location").attr("disabled", true);
            $("#_465_of57a_party_identifier").attr("disabled", true);
            $("#_466_of57a_name_address").attr("disabled", true);
        } else if ($("#_463_of57a_party_identifier").val() != "" || $("#_464_of57a_location").val() != ""){
            $("#type_of57a_issuing_bank").val("B").attr("selected",true);
            $("#div_460_of57a_A").hide();
            $("#div_460_of57a_B").show();
            $("#div_460_of57a_D").hide();
            $("#_461_of57a_party_identifier").attr("disabled", true);
            $("#_462_of57a_identifier_code").attr("disabled", true);
            $("#_463_of57a_party_identifier").attr("disabled", false);
            $("#_464_of57a_location").attr("disabled", false);
            $("#_465_of57a_party_identifier").attr("disabled", true);
            $("#_466_of57a_name_address").attr("disabled", true);
        } else if ($("#_465_of57a_party_identifier").val() != "" || $("#_466_of57a_name_address").val() != ""){
            $("#type_of57a_issuing_bank").val("D").attr("selected",true);
            $("#div_460_of57a_A").hide();
            $("#div_460_of57a_B").hide();
            $("#div_460_of57a_D").show();
            $("#_461_of57a_party_identifier").attr("disabled", true);
            $("#_462_of57a_identifier_code").attr("disabled", true);
            $("#_463_of57a_party_identifier").attr("disabled", true);
            $("#_464_of57a_location").attr("disabled", true);
            $("#_465_of57a_party_identifier").attr("disabled", false);
            $("#_466_of57a_name_address").attr("disabled", false);
        } else{
            $("#div_460_of57a_A").hide();
            $("#div_460_of57a_B").hide();
            $("#div_460_of57a_D").hide();
            $("#_461_of57a_party_identifier").attr("disabled", true);
            $("#_462_of57a_identifier_code").attr("disabled", true);
            $("#_463_of57a_party_identifier").attr("disabled", true);
            $("#_464_of57a_location").attr("disabled", true);
            $("#_465_of57a_party_identifier").attr("disabled", true);
            $("#_466_of57a_name_address").attr("disabled", true);
        }

        //OF71N_narrative
        if ($("#_401_of71n_narrative").val() != ""){
            $("#_400_of71n_charge_code").val("OTHR").attr("selected",true);
            $("#div_400_of71n_narrative").show();
            $("#_401_of71n_narrative").attr("disabled", false);
        } else{
            $("#div_400_of71n_narrative").hide();
            $("#_401_of71n_narrative").attr("disabled", true);
        }

    });
</script>