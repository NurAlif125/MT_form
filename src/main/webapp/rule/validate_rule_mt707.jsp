<%-- 
    Document   : mt707
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
                _030_mf21_receivers_reference: "required",

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
                
                //of23s
                _110_of23s_cancellation_request: {
                    required: function(element) {
                      return $("#_110_of23s_cancellation_request").val() == "" 
                              && $("#_120_of40a_form_of_documentary_credit").val() == ""
                              && $("#_130_of40e_applicable_rules").val() == ""
                              && $("#_131_of40e_narrative").val() == ""
                              && $("#_140_of31d_date_of_expiry").val() == ""
                              && $("#_141_of31d_place_of_expiry").val() == ""
                              && $("#_150_of50_name_address_changed_applicant").val() == ""
                              && $("#_160_of59_account_beneficiary").val() == ""
                              && $("#_161_of59_name_address_beneficiary").val() == ""
                              && $("#_170_of32b_currency_increase_of_credit_amount").val() == ""
                              && $("#_171_of32b_amount_increase_of_credit_amount").val() == ""
                              && $("#_180_of33b_currency_decrease_of_credit_amount").val() == ""
                              && $("#_181_of33b_amount_increase_of_credit_amount").val() == ""
                              && $("#_190_of39a_percentage_credit_amount_tolerance1").val() == ""
                              && $("#_191_of39a_percentage_credit_amount_tolerance2").val() == ""
                              && $("#_200_of39c_additional_amount_covered").val() == ""
                              && $("#type_of41_available_with_by").val() == ""
                              && $("#_220_of42c_drafts_at").val() == ""
                              && $("#type_of42_drawee").val() == ""
                              && $("#_240_of42m_mixed_payment_details").val() == ""
                              && $("#_250_of42p_negotiation_payment_details").val() == ""
                              && $("#_260_of43p_partial_shipments_code").val() == ""
                              && $("#_270_of43t_transhipment_code").val() == ""
                              && $("#_280_of44a_place_of_receipt").val() == ""
                              && $("#_290_of44e_port_of_loading").val() == ""
                              && $("#_300_of44f_port_of_discharge").val() == ""
                              && $("#_310_of44b_place_of_delivery").val() == ""
                              && $("#_320_of44c_latest_date_of_shipment").val() == ""
                              && $("#_330_of44d_shipment_period").val() == ""
                              && $("#_340_of45b_code").val() == ""
                              && $("#_341_of45b_description_of_services_narrative").val() == ""
                              && $("#_350_of46b_code").val() == ""
                              && $("#_351_of46b_documents_require_narrative").val() == ""
                              && $("#_360_of47b_code").val() == ""
                              && $("#_361_of47b_additional_conditions").val() == ""
                              && $("#_370_of49m_code").val() == ""
                              && $("#_371_of49m_payment_for_beneficiary").val() == ""
                              && $("#_380_of49n_code").val() == ""
                              && $("#_381_of49n_payment_for_receiving_bank").val() == ""
                              && $("#_390_of71d_charges").val() == ""
                              && $("#_400_of71n_amendment_charge_code").val() == ""
                              && $("#_401_of71n_amendment_charge_narrative").val() == ""
                              && $("#_410_of48_period_for_presentation_in_days").val() == ""
                              && $("#_411_of48_narrative").val() == ""
                              && $("#_420_of49_confirmation_instructions").val() == ""
                              && $("#type_of58_request_confirmation_party").val() == ""
                              && $("#type_of53_reimbursing_bank").val() == ""
                              && $("#_450_of78_instructions_of_paying").val() == ""
                              && $("#type_of57_advise_through_bank").val() == ""
                              && $("#_460_of72z_sender_to_receiver").val() == "";
                    }
                },
                
                //of52
                type_of52_issuing_bank: {
                    required: function(element) {
                      return ($("#_060_of50b_name_address_nonbank_issuer").val() == "" && $("#type_of52_issuing_bank").val() == "")
                             || ($("#_060_of50b_name_address_nonbank_issuer").val() != "" && $("#type_of52_issuing_bank").val() != "");
                    }
                },
                
                //of50b
                _060_of50b_name_address_nonbank_issuer: {
                    required: function(element) {
                      return ($("#type_of52_issuing_bank").val() == "" && $("#_060_of50b_name_address_nonbank_issuer").val() == "")
                             || ($("#_060_of50b_name_address_nonbank_issuer").val() != "" && $("#type_of52_issuing_bank").val() != "");
                    }
                },
                
                //of33b
//                decrease_of_credit_amount_checkbox: {
//                    required: function(element) {
//                      return ($("#_180_of33b_currency_decrease_of_credit_amount").val() == "" && $("#_181_of33b_amount_increase_of_credit_amount").val() == "" && $("#_170_of32b_currency_increase_of_credit_amount").val() == "" && $("#_171_of32b_amount_increase_of_credit_amount").val() == "")
//                             || ($("#_180_of33b_currency_decrease_of_credit_amount").val() != "" && $("#_181_of33b_amount_increase_of_credit_amount").val() != "" && $("#_170_of32b_currency_increase_of_credit_amount").val() != "" && $("#_171_of32b_amount_increase_of_credit_amount").val() != "");
//                    }
//                },
                
                //of32b
//                increase_of_credit_amount_checkbox: {
//                    required: function(element) {
//                      return ($("#_180_of33b_currency_decrease_of_credit_amount").val() == "" && $("#_181_of33b_amount_increase_of_credit_amount").val() == "" && $("#_170_of32b_currency_increase_of_credit_amount").val() == "" && $("#_171_of32b_amount_increase_of_credit_amount").val() == "")
//                             || ($("#_180_of33b_currency_decrease_of_credit_amount").val() != "" && $("#_181_of33b_amount_increase_of_credit_amount").val() != "" && $("#_170_of32b_currency_increase_of_credit_amount").val() != "" && $("#_171_of32b_amount_increase_of_credit_amount").val() != "");
//                    }
//                },
                
                //of44c
//                _320_of44c_latest_date_of_shipment: {
//                    required: function(element) {
//                      return ($("#_330_of44d_shipment_period").val() == "" && $("#_320_of44c_latest_date_of_shipment").val() == "")
//                             || ($("#_330_of44d_shipment_period").val() != "" && $("#_320_of44c_latest_date_of_shipment").val() != "");
//                    }
//                },
                
                //of344d
//                _330_of44d_shipment_period: {
//                    required: function(element) {
//                      return ($("#_330_of44d_shipment_period").val() == "" && $("#_320_of44c_latest_date_of_shipment").val() == "")
//                             || ($("#_330_of44d_shipment_period").val() != "" && $("#_320_of44c_latest_date_of_shipment").val() != "");
//                    }
//                },
                
                //of71n
                _401_of71n_amendment_charge_narrative: {
                    required: function(element) {
                      return $("#_400_of71n_amendment_charge_code").val() == "OTHR" ;
                    }
                },
                
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf27_number: {required: "mf27_number harus diisi..!!"},
                _011_mf27_total: {required: "mf27_total harus diisi..!!"},
                _020_mf20_sender_reference: {required: "mf20_sender_reference harus diisi..!!"},
                _030_mf21_receivers_reference: {required: "mf21_receivers_reference harus diisi..!!"},
                _040_mf23_issuing_bank_reference: {required: "mf23_issuing_bank_reference harus diisi..!!"},
                _070_mf31c_date_of_issue: {required: "mf31c_date_of_issue harus diisi..!!"},
                _080_mf26e_number_of_amendment: {required: "mf26e_number_of_amendment harus diisi..!!"},
                _090_mf30_date_of_amendment: {required: "mf30_date_of_amendment harus diisi..!!"},
                _100_mf22a_purpose_of_message: {required: "mf22a_purpose_of_message harus diisi..!!"},
                type_of52_issuing_bank: {required: "isi salah satu antara of52 atau of50b..!!"},
                _060_of50b_name_address_nonbank_issuer: {required: "isi salah satu antara of52 atau of50b..!!"},
                _110_of23s_cancellation_request: {required: "isi setidaknya satu field setelah mf22a..!!"},
//                decrease_of_credit_amount_checkbox: {required: "isi salah satu antara of33b atau of32b..!!"},
//                increase_of_credit_amount_checkbox: {required: "isi salah satu antara of33b atau of32b..!!"},
//                _320_of44c_latest_date_of_shipment: {required: "isi salah satu antara of44c atau of44d..!!"},
//                _330_of44d_shipment_period: {required: "isi salah satu antara of44c atau of44d..!!"},
                _401_of71n_amendment_charge_narrative: {required: "isi jika code Other Party..!!"},
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
        $("#_170_of32b_currency_increase_of_credit_amount").attr("disabled", true);
        $("#_171_of32b_amount_increase_of_credit_amount").attr("disabled", true);
        $("#increase_of_credit_amount_checkbox").click(function(){
            if ($("#increase_of_credit_amount_checkbox").is(":checked")){
                $("#check_of32b").show();
                $("#_170_of32b_currency_increase_of_credit_amount").attr("disabled", false);
                $("#_171_of32b_amount_increase_of_credit_amount").attr("disabled", false);
            } else {
                $("#check_of32b").hide();
                $("#_170_of32b_currency_increase_of_credit_amount").attr("disabled", true);
                $("#_171_of32b_amount_increase_of_credit_amount").attr("disabled", true);
            }
        });
        
        //OF33B_check
        $("#check_of33b").hide();
        $("#_180_of33b_currency_decrease_of_credit_amount").attr("disabled", true);
        $("#_181_of33b_amount_increase_of_credit_amount").attr("disabled", true);
        $("#decrease_of_credit_amount_checkbox").click(function(){
            if ($("#decrease_of_credit_amount_checkbox").is(":checked")){
                $("#check_of33b").show();
                $("#_180_of33b_currency_decrease_of_credit_amount").attr("disabled", false);
                $("#_181_of33b_amount_increase_of_credit_amount").attr("disabled", false);
            } else {
                $("#check_of33b").hide();
                $("#_180_of33b_currency_decrease_of_credit_amount").attr("disabled", true);
                $("#_181_of33b_amount_increase_of_credit_amount").attr("disabled", true);
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

        //OF52_a_d
        $("#div_of52a_").hide();
        $("#div_of52d_").hide();
        $("#_050_of52a_party_identifier").attr("disabled", true);
        $("#_051_of52a_identifier_code").attr("disabled", true);
        $("#_052_of52d_party_identifier").attr("disabled", true);
        $("#_053_of52d_name_address").attr("disabled", true);
        $("#type_of52_issuing_bank").change(function() {
            if ( $("#type_of52_issuing_bank").val() == "a"){
                $("#div_of52a_").show();
                $("#div_of52d_").hide();
                $("#_050_of52a_party_identifier").attr("disabled", false);
                $("#_051_of52a_identifier_code").attr("disabled", false);
                $("#_052_of52d_party_identifier").attr("disabled", true);
                $("#_053_of52d_name_address").attr("disabled", true);
            } else if ( $("#type_of52_issuing_bank").val() == "d"){
                $("#div_of52a_").hide();
                $("#div_of52d_").show();
                $("#_050_of52a_party_identifier").attr("disabled", true);
                $("#_051_of52a_identifier_code").attr("disabled", true);
                $("#_052_of52d_party_identifier").attr("disabled", false);
                $("#_053_of52d_name_address").attr("disabled", false);
            } else{
                $("#div_of52a_").hide();
                $("#div_of52d_").hide();
                $("#_050_of52a_party_identifier").attr("disabled", true);
                $("#_051_of52a_identifier_code").attr("disabled", true);
                $("#_052_of52d_party_identifier").attr("disabled", true);
                $("#_053_of52d_name_address").attr("disabled", true);
            }
        });

        //OF41_a_d
        $("#div_of41a_").hide();
        $("#div_of41d_").hide();
        $("#_210_of41a_identifier_code").attr("disabled", true);
        $("#_211_of41a_code").attr("disabled", true);
        $("#_212_of41d_name_address").attr("disabled", true);
        $("#_213_of41d_code").attr("disabled", true);
        $("#type_of41_available_with_by").change(function() {
            if ( $("#type_of41_available_with_by").val() == "a"){
                $("#div_of41a_").show();
                $("#div_of41d_").hide();
                $("#_210_of41a_identifier_code").attr("disabled", false);
                $("#_211_of41a_code").attr("disabled", false);
                $("#_212_of41d_name_address").attr("disabled", true);
                $("#_213_of41d_code").attr("disabled", true);
            } else if ( $("#type_of41_available_with_by").val() == "d"){
                $("#div_of41a_").hide();
                $("#div_of41d_").show();
                $("#_210_of41a_identifier_code").attr("disabled", true);
                $("#_211_of41a_code").attr("disabled", true);
                $("#_212_of41d_name_address").attr("disabled", false);
                $("#_213_of41d_code").attr("disabled", false);
            } else{
                $("#div_of41a_").hide();
                $("#div_of41d_").hide();
                $("#_210_of41a_identifier_code").attr("disabled", true);
                $("#_211_of41a_code").attr("disabled", true);
                $("#_212_of41d_name_address").attr("disabled", true);
                $("#_213_of41d_code").attr("disabled", true);
            }
        });

        //OF42_a_d
        $("#div_of42a_").hide();
        $("#div_of42d_").hide();
        $("#_230_of42a_party_identifier").attr("disabled", true);
        $("#_231_of42a_identifier_code").attr("disabled", true);
        $("#_232_of42d_party_identifier").attr("disabled", true);
        $("#_233_of42d_name_address").attr("disabled", true);
        $("#type_of42_drawee").change(function() {
            if ( $("#type_of42_drawee").val() == "a"){
                $("#div_of42a_").show();
                $("#div_of42d_").hide();
                $("#_230_of42a_party_identifier").attr("disabled", false);
                $("#_231_of42a_identifier_code").attr("disabled", false);
                $("#_232_of42d_party_identifier").attr("disabled", true);
                $("#_233_of42d_name_address").attr("disabled", true);
            } else if ( $("#type_of42_drawee").val() == "d"){
                $("#div_of42a_").hide();
                $("#div_of42d_").show();
                $("#_230_of42a_party_identifier").attr("disabled", true);
                $("#_231_of42a_identifier_code").attr("disabled", true);
                $("#_232_of42d_party_identifier").attr("disabled", false);
                $("#_233_of42d_name_address").attr("disabled", false);
            } else{
                $("#div_of42a_").hide();
                $("#div_of42d_").hide();
                $("#_230_of42a_party_identifier").attr("disabled", true);
                $("#_231_of42a_identifier_code").attr("disabled", true);
                $("#_232_of42d_party_identifier").attr("disabled", true);
                $("#_233_of42d_name_address").attr("disabled", true);
            }
        });

        //OF58_a_d
        $("#div_of58a_").hide();
        $("#div_of58d_").hide();
        $("#_430_of58a_party_identifier").attr("disabled", true);
        $("#_431_of58a_identifier_code").attr("disabled", true);
        $("#_432_of58d_party_identifier").attr("disabled", true);
        $("#_433_of58d_name_address").attr("disabled", true);
        $("#type_of58_request_confirmation_party").change(function() {
            if ( $("#type_of58_request_confirmation_party").val() == "a"){
                $("#div_of58a_").show();
                $("#div_of58d_").hide();
                $("#_430_of58a_party_identifier").attr("disabled", false);
                $("#_431_of58a_identifier_code").attr("disabled", false);
                $("#_432_of58d_party_identifier").attr("disabled", true);
                $("#_433_of58d_name_address").attr("disabled", true);
            } else if ( $("#type_of58_request_confirmation_party").val() == "d"){
                $("#div_of58a_").hide();
                $("#div_of58d_").show();
                $("#_430_of58a_party_identifier").attr("disabled", true);
                $("#_431_of58a_identifier_code").attr("disabled", true);
                $("#_432_of58d_party_identifier").attr("disabled", false);
                $("#_433_of58d_name_address").attr("disabled", false);
            } else{
                $("#div_of58a_").hide();
                $("#div_of58d_").hide();
                $("#_430_of58a_party_identifier").attr("disabled", true);
                $("#_431_of58a_identifier_code").attr("disabled", true);
                $("#_432_of58d_party_identifier").attr("disabled", true);
                $("#_433_of58d_name_address").attr("disabled", true);
            }
        });
        
        //OF53_a_d
        $("#div_of53a_").hide();
        $("#div_of53d_").hide();
        $("#_440_of53a_party_identifier").attr("disabled", true);
        $("#_441_of53a_identifier_code").attr("disabled", true);
        $("#_442_of53d_party_identifier").attr("disabled", true);
        $("#_443_of53d_name_address").attr("disabled", true);
        $("#type_of53_reimbursing_bank").change(function() {
            if ( $("#type_of53_reimbursing_bank").val() == "a"){
                $("#div_of53a_").show();
                $("#div_of53d_").hide();
                $("#_440_of53a_party_identifier").attr("disabled", false);
                $("#_441_of53a_identifier_code").attr("disabled", false);
                $("#_442_of53d_party_identifier").attr("disabled", true);
                $("#_443_of53d_name_address").attr("disabled", true);
            } else if ( $("#type_of53_reimbursing_bank").val() == "d"){
                $("#div_of53a_").hide();
                $("#div_of53d_").show();
                $("#_440_of53a_party_identifier").attr("disabled", true);
                $("#_441_of53a_identifier_code").attr("disabled", true);
                $("#_442_of53d_party_identifier").attr("disabled", false);
                $("#_443_of53d_name_address").attr("disabled", false);
            } else{
                $("#div_of53a_").hide();
                $("#div_of53d_").hide();
                $("#_440_of53a_party_identifier").attr("disabled", true);
                $("#_441_of53a_identifier_code").attr("disabled", true);
                $("#_442_of53d_party_identifier").attr("disabled", true);
                $("#_443_of53d_name_address").attr("disabled", true);
            }
        });
        
        //OF57_a_b_d
        $("#div_of57a_").hide();
        $("#div_of57b_").hide();
        $("#div_of57d_").hide();
        $("#_460_of57a_party_identifier").attr("disabled", true);
        $("#_461_of57a_identifier_code").attr("disabled", true);
        $("#_462_of57b_party_identifier").attr("disabled", true);
        $("#_463_of57b_location").attr("disabled", true);
        $("#_464_of57d_party_identifier").attr("disabled", true);
        $("#_465_of57d_name_address").attr("disabled", true);
        $("#type_of57_advise_through_bank").change(function() {
            if ( $("#type_of57_advise_through_bank").val() == "a"){
                $("#div_of57a_").show();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_460_of57a_party_identifier").attr("disabled", false);
                $("#_461_of57a_identifier_code").attr("disabled", false);
                $("#_462_of57b_party_identifier").attr("disabled", true);
                $("#_463_of57b_location").attr("disabled", true);
                $("#_464_of57d_party_identifier").attr("disabled", true);
                $("#_465_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_advise_through_bank").val() == "b"){
                $("#div_of57a_").hide();
                $("#div_of57b_").show();
                $("#div_of57d_").hide();
                $("#_460_of57a_party_identifier").attr("disabled", true);
                $("#_461_of57a_identifier_code").attr("disabled", true);
                $("#_462_of57b_party_identifier").attr("disabled", false);
                $("#_463_of57b_location").attr("disabled", false);
                $("#_464_of57d_party_identifier").attr("disabled", true);
                $("#_465_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_advise_through_bank").val() == "d"){
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").show();
                $("#_460_of57a_party_identifier").attr("disabled", true);
                $("#_461_of57a_identifier_code").attr("disabled", true);
                $("#_462_of57b_party_identifier").attr("disabled", true);
                $("#_463_of57b_location").attr("disabled", true);
                $("#_464_of57d_party_identifier").attr("disabled", false);
                $("#_465_of57d_name_address").attr("disabled", false);
            } else{
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_460_of57a_party_identifier").attr("disabled", true);
                $("#_461_of57a_identifier_code").attr("disabled", true);
                $("#_462_of57b_party_identifier").attr("disabled", true);
                $("#_463_of57b_location").attr("disabled", true);
                $("#_464_of57d_party_identifier").attr("disabled", true);
                $("#_465_of57d_name_address").attr("disabled", true);
            }
        });

    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF32B_check
        if ($("#_170_of32b_currency_increase_of_credit_amount").val() != "" || $("#_171_of32b_amount_increase_of_credit_amount").val() != ""){
            $("#increase_of_credit_amount_checkbox").attr("checked", true);
            $("#check_of32b").show();
            $("#_170_of32b_currency_increase_of_credit_amount").attr("disabled", false);
            $("#_171_of32b_amount_increase_of_credit_amount").attr("disabled", false);
        } else {
            $("#check_of32b").hide();
            $("#_170_of32b_currency_increase_of_credit_amount").attr("disabled", true);
            $("#_171_of32b_amount_increase_of_credit_amount").attr("disabled", true);
        }
        
        //OF33B_check
        if ($("#_180_of33b_currency_decrease_of_credit_amount").val() != "" || $("#_181_of33b_amount_increase_of_credit_amount").val() != ""){
            $("#decrease_of_credit_amount_checkbox").attr("checked", true);
            $("#check_of33b").show();
            $("#_180_of33b_currency_decrease_of_credit_amount").attr("disabled", false);
            $("#_181_of33b_amount_increase_of_credit_amount").attr("disabled", false);
        } else {
            $("#check_of33b").hide();
            $("#_180_of33b_currency_decrease_of_credit_amount").attr("disabled", true);
            $("#_181_of33b_amount_increase_of_credit_amount").attr("disabled", true);
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
        
        //OF52_a_d
        if ($("#_050_of52a_party_identifier").val() != "" || $("#_051_of52a_identifier_code").val() != ""){
            $("#type_of52_issuing_bank").val("a").attr("selected",true);
            $("#div_of52a_").show();
            $("#div_of52d_").hide();
            $("#_050_of52a_party_identifier").attr("disabled", false);
            $("#_051_of52a_identifier_code").attr("disabled", false);
            $("#_052_of52d_party_identifier").attr("disabled", true);
            $("#_053_of52d_name_address").attr("disabled", true);
        } else if ($("#_052_of52d_party_identifier").val() != "" || $("#_053_of52d_name_address").val() != ""){
            $("#type_of52_issuing_bank").val("d").attr("selected",true);
            $("#div_of52a_").hide();
            $("#div_of52d_").show();
            $("#_050_of52a_party_identifier").attr("disabled", true);
            $("#_051_of52a_identifier_code").attr("disabled", true);
            $("#_052_of52d_party_identifier").attr("disabled", false);
            $("#_053_of52d_name_address").attr("disabled", false);
        } else{
            $("#div_of52a_").hide();
            $("#div_of52d_").hide();
            $("#_050_of52a_party_identifier").attr("disabled", true);
            $("#_051_of52a_identifier_code").attr("disabled", true);
            $("#_052_of52d_party_identifier").attr("disabled", true);
            $("#_053_of52d_name_address").attr("disabled", true);
        }

        //OF41_a_d
        if ($("#_210_of41a_identifier_code").val() != "" || $("#_211_of41a_code").val() != ""){
            $("#type_of41_available_with_by").val("a").attr("selected",true);
            $("#div_of41a_").show();
            $("#div_of41d_").hide();
            $("#_210_of41a_identifier_code").attr("disabled", false);
            $("#_211_of41a_code").attr("disabled", false);
            $("#_212_of41d_name_address").attr("disabled", true);
            $("#_213_of41d_code").attr("disabled", true);
        } else if ($("#_212_of41d_name_address").val() != "" || $("#_213_of41d_code").val() != ""){
            $("#type_of41_available_with_by").val("d").attr("selected",true);
            $("#div_of41a_").hide();
            $("#div_of41d_").show();
            $("#_210_of41a_identifier_code").attr("disabled", true);
            $("#_211_of41a_code").attr("disabled", true);
            $("#_212_of41d_name_address").attr("disabled", false);
            $("#_213_of41d_code").attr("disabled", false);
        } else{
            $("#div_of41a_").hide();
            $("#div_of41d_").hide();
            $("#_210_of41a_identifier_code").attr("disabled", true);
            $("#_211_of41a_code").attr("disabled", true);
            $("#_212_of41d_name_address").attr("disabled", true);
            $("#_213_of41d_code").attr("disabled", true);
        }
        
        //OF42_a_d
        if ($("#_230_of42a_party_identifier").val() != "" || $("#_231_of42a_identifier_code").val() != ""){
            $("#type_of42_drawee").val("a").attr("selected",true);
            $("#div_of42a_").show();
            $("#div_of42d_").hide();
            $("#_230_of42a_party_identifier").attr("disabled", false);
            $("#_231_of42a_identifier_code").attr("disabled", false);
            $("#_232_of42d_party_identifier").attr("disabled", true);
            $("#_233_of42d_name_address").attr("disabled", true);
        } else if ($("#_232_of42d_party_identifier").val() != "" || $("#_233_of42d_name_address").val() != ""){
            $("#type_of42_drawee").val("d").attr("selected",true);
            $("#div_of42a_").hide();
            $("#div_of42d_").show();
            $("#_230_of42a_party_identifier").attr("disabled", true);
            $("#_231_of42a_identifier_code").attr("disabled", true);
            $("#_232_of42d_party_identifier").attr("disabled", false);
            $("#_233_of42d_name_address").attr("disabled", false);
        } else{
            $("#div_of42a_").hide();
            $("#div_of42d_").hide();
            $("#_230_of42a_party_identifier").attr("disabled", true);
            $("#_231_of42a_identifier_code").attr("disabled", true);
            $("#_232_of42d_party_identifier").attr("disabled", true);
            $("#_233_of42d_name_address").attr("disabled", true);
        }
        
        //OF58_a_d
        if ($("#_430_of58a_party_identifier").val() != "" || $("#_431_of58a_identifier_code").val() != ""){
            $("#type_of58_request_confirmation_party").val("a").attr("selected",true);
            $("#div_of58a_").show();
            $("#div_of58d_").hide();
            $("#_430_of58a_party_identifier").attr("disabled", false);
            $("#_431_of58a_identifier_code").attr("disabled", false);
            $("#_432_of58d_party_identifier").attr("disabled", true);
            $("#_433_of58d_name_address").attr("disabled", true);
        } else if ($("#_432_of58d_party_identifier").val() != "" || $("#_433_of58d_name_address").val() != ""){
            $("#type_of58_request_confirmation_party").val("d").attr("selected",true);
            $("#div_of58a_").hide();
            $("#div_of58d_").show();
            $("#_430_of58a_party_identifier").attr("disabled", true);
            $("#_431_of58a_identifier_code").attr("disabled", true);
            $("#_432_of58d_party_identifier").attr("disabled", false);
            $("#_433_of58d_name_address").attr("disabled", false);
        } else{
            $("#div_of58a_").hide();
            $("#div_of58d_").hide();
            $("#_430_of58a_party_identifier").attr("disabled", true);
            $("#_431_of58a_identifier_code").attr("disabled", true);
            $("#_432_of58d_party_identifier").attr("disabled", true);
            $("#_433_of58d_name_address").attr("disabled", true);
        }
        
        //OF53_a_d
        if ($("#_440_of53a_party_identifier").val() != "" || $("#_441_of53a_identifier_code").val() != ""){
            $("#type_of53_reimbursing_bank").val("a").attr("selected",true);
            $("#div_of53a_").show();
            $("#div_of53d_").hide();
            $("#_440_of53a_party_identifier").attr("disabled", false);
            $("#_441_of53a_identifier_code").attr("disabled", false);
            $("#_442_of53d_party_identifier").attr("disabled", true);
            $("#_443_of53d_name_address").attr("disabled", true);
        } else if ($("#_442_of53d_party_identifier").val() != "" || $("#_443_of53d_name_address").val() != ""){
            $("#type_of53_reimbursing_bank").val("d").attr("selected",true);
            $("#div_of53a_").hide();
            $("#div_of53d_").show();
            $("#_440_of53a_party_identifier").attr("disabled", true);
            $("#_441_of53a_identifier_code").attr("disabled", true);
            $("#_442_of53d_party_identifier").attr("disabled", false);
            $("#_443_of53d_name_address").attr("disabled", false);
        } else{
            $("#div_of53a_").hide();
            $("#div_of53d_").hide();
            $("#_440_of53a_party_identifier").attr("disabled", true);
            $("#_441_of53a_identifier_code").attr("disabled", true);
            $("#_442_of53d_party_identifier").attr("disabled", true);
            $("#_443_of53d_name_address").attr("disabled", true);
        }
        
        //OF57_a_b_d
        if ($("#_460_of57a_party_identifier").val() != "" || $("#_461_of57a_identifier_code").val() != ""){
            $("#type_of57_advise_through_bank").val("a").attr("selected",true);
            $("#div_of57a_").show();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_460_of57a_party_identifier").attr("disabled", false);
            $("#_461_of57a_identifier_code").attr("disabled", false);
            $("#_462_of57b_party_identifier").attr("disabled", true);
            $("#_463_of57b_location").attr("disabled", true);
            $("#_464_of57d_party_identifier").attr("disabled", true);
            $("#_465_of57d_name_address").attr("disabled", true);
        } else if ($("#_462_of57b_party_identifier").val() != "" || $("#_463_of57b_location").val() != ""){
            $("#type_of57_advise_through_bank").val("b").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").show();
            $("#div_of57d_").hide();
            $("#_460_of57a_party_identifier").attr("disabled", true);
            $("#_461_of57a_identifier_code").attr("disabled", true);
            $("#_462_of57b_party_identifier").attr("disabled", false);
            $("#_463_of57b_location").attr("disabled", false);
            $("#_464_of57d_party_identifier").attr("disabled", true);
            $("#_465_of57d_name_address").attr("disabled", true);
        } else if ($("#_464_of57d_party_identifier").val() != "" || $("#_465_of57d_name_address").val() != ""){
            $("#type_of57_advise_through_bank").val("d").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").show();
            $("#_460_of57a_party_identifier").attr("disabled", true);
            $("#_461_of57a_identifier_code").attr("disabled", true);
            $("#_462_of57b_party_identifier").attr("disabled", true);
            $("#_463_of57b_location").attr("disabled", true);
            $("#_464_of57d_party_identifier").attr("disabled", false);
            $("#_465_of57d_name_address").attr("disabled", false);
        } else{
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_460_of57a_party_identifier").attr("disabled", true);
            $("#_461_of57a_identifier_code").attr("disabled", true);
            $("#_462_of57b_party_identifier").attr("disabled", true);
            $("#_463_of57b_location").attr("disabled", true);
            $("#_464_of57d_party_identifier").attr("disabled", true);
            $("#_465_of57d_name_address").attr("disabled", true);
        }


    });
</script>