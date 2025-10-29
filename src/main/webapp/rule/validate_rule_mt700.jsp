<%-- 
    Document   : mt700
    Created on : Jul 17, 2018
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

                //mf40a
                _020_mf40a_form_of_documentary_credit: "required",
                
                //mf20
                _030_mf20_documentary_credit_number: "required",

                //mf31c
                _050_mf31c_date_of_issue: "required",

                //mf40e
                _060_mf40e_applicable_rules: "required",
                _061_mf40e_narrative: {
                    required: function(element) {
                      return $("#_060_mf40e_applicable_rules").val() == "OTHR";
                    }
                },

                //mf31d
                _070_mf31d_date_of_expiry: "required",
                _071_mf31d_place_of_expiry: "required",

                //mf50
                _090_mf50_name_address_applicant: "required",

                //mf59
                _101_mf59_name_address_beneficiary: "required",

                //mf32b
                _110_mf32b_currency_code: "required",
                _111_mf32b_amount: "required",

                //mf41
                type_mf41_available_with_by: "required",
                _140_mf41a_identifier_code: "required",
                _141_mf41a_code: "required",
                _142_mf41d_name_address: "required",
                _143_mf41d_code: "required",

                //mf49
                _340_mf49_confirmation_instructions: "required",
                
                //of42C
                _150_of42c_drafts_at: {
                    required: function(element) {
                      return ($("#type_of42_drawee").val() != "")
//                              || ($("#type_of42_drawee").val() == "" && $("#_180_of42p_negotiation_payment_details").val() == "" && $("#_170_of42m_mixed_payment_details").val() == "")
                              || ($("#type_of42_drawee").val() != "" && $("#_180_of42p_negotiation_payment_details").val() != "")
                              || ($("#type_of42_drawee").val() != "" && $("#_170_of42m_mixed_payment_details").val() != "")
                              || ($("#_180_of42p_negotiation_payment_details").val() != "" && $("#_170_of42m_mixed_payment_details").val() != "");
                    }
                },
                
                //of42
                type_of42_drawee: {
                    required: function(element) {
                      return ($("#_150_of42c_drafts_at").val() != "")
//                              || ($("#_150_of42c_drafts_at").val() == "" && $("#_180_of42p_negotiation_payment_details").val() == "" && $("#_170_of42m_mixed_payment_details").val() == "") 
                              || ($("#_150_of42c_drafts_at").val() != "" && $("#_180_of42p_negotiation_payment_details").val() != "")
                              || ($("#_150_of42c_drafts_at").val() != "" && $("#_170_of42m_mixed_payment_details").val() != "")
                              || ($("#_180_of42p_negotiation_payment_details").val() != "" && $("#_170_of42m_mixed_payment_details").val() != "");
                    }
                },
                
                //of42m
                _170_of42m_mixed_payment_details: {
                    required: function(element) {
                      return ($("#_150_of42c_drafts_at").val() != "" && $("#_180_of42p_negotiation_payment_details").val() != "");
                    }
                },
                
                //of42p
                _180_of42p_negotiation_payment_details: {
                    required: function(element) {
                      return ($("#_150_of42c_drafts_at").val() != "" && $("#_170_of42m_mixed_payment_details").val() != "");
                    }
                },
                
                //of44c
                //_250_of44c_latest_date_of_shipment: {
//                    required: function(element) {
//                      return ($("#_250_of44c_latest_date_of_shipment").val() != "" && $("#_260_of44d_shipment_period").val() != "");
//                    }
//                },
                
                //of44d
//                _260_of44d_shipment_period: {
//                    required: function(element) {
//                      return ($("#_250_of44c_latest_date_of_shipment").val() != "" && $("#_260_of44d_shipment_period").val() != "");
//                    }
//                },
                
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf27_number: {required: "mf27_number harus diisi..!!"},
                _011_mf27_total: {required: "mf27_total harus diisi..!!"},
                _020_mf40a_form_of_documentary_credit: {required: "mf40a_form_of_documentary_credit harus diisi..!!"},
                _030_mf20_documentary_credit_number: {required: "mf20_documentary_credit_number harus diisi..!!"},
                _050_mf31c_date_of_issue: {required: "mf31c_date_of_issue harus diisi..!!"},
                _060_mf40e_applicable_rules: {required: "mf40e_applicable_rules harus diisi..!!"},
                _061_mf40e_narrative: {required: "mf40e_narrative harus diisi..!!"},
                _070_mf31d_date_of_expiry: {required: "mf31d_date_of_expiry harus diisi..!!"},
                _071_mf31d_place_of_expiry: {required: "mf31d_place_of_expiry harus diisi..!!"},
                _090_mf50_name_address_applicant: {required: "mf50_name_address_applicant harus diisi..!!"},
                _101_mf59_name_address_beneficiary: {required: "mf59_name_address_beneficiary harus diisi..!!"},
                _110_mf32b_currency_code: {required: "mf32b_currency_code harus diisi..!!"},
                _111_mf32b_amount: {required: "mf32b_amount harus diisi..!!"},
                type_mf41_available_with_by: {required: "mf41 harus diisi..!!"},
                _140_mf41a_identifier_code: {required: "mf41a_identifier_code harus diisi..!!"},
                _141_mf41a_code: {required: "mf41a_code harus diisi..!!"},
                _142_mf41d_name_address: {required: "mf41d_name_address harus diisi..!!"},
                _143_mf41d_code: {required: "mf41d_code harus diisi..!!"},
                _340_mf49_confirmation_instructions: {required: "mf49_confirmation_instruction harus diisi..!!"},
                _150_of42c_drafts_at: {required: "isi kedua field of42c dan of42 atau isi field of42m saja atau of42p saja..!!"},
                type_of42_drawee: {required: "isi kedua field of42c dan of42 atau isi field of42m saja atau of42p saja..!!"},
                _170_of42m_mixed_payment_details: {required: "isi kedua field of42c dan of42 atau isi field of42m saja atau of42p saja..!!"},
                _180_of42p_negotiation_payment_details: {required: "isi kedua field of42c dan of42 atau isi field of42m saja atau of42p saja..!!"},
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
        
        //OF39A_check
        $("#check_of39a").hide();
        $("#_120_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
        $("#_121_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
        $("#percentage_credit_amount_checkbox").click(function(){
            if ($("#percentage_credit_amount_checkbox").is(":checked")){
                $("#check_of39a").show();
                $("#_120_of39a_percentage_credit_amount_tolerance1").attr("disabled", false);
                $("#_121_of39a_percentage_credit_amount_tolerance2").attr("disabled", false);
            } else {
                $("#check_of39a").hide();
                $("#_120_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
                $("#_121_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
            }
        });
        
        //OF51_a_d
        $("#div_of51a_").hide();
        $("#div_of51d_").hide();
        $("#_080_of51a_party_identifier").attr("disabled", true);
        $("#_081_of51a_identifier_code").attr("disabled", true);
        $("#_082_of51d_party_identifier").attr("disabled", true);
        $("#_083_of51d_name_address").attr("disabled", true);
        $("#type_of51_applicant_bank").change(function() {
            if ( $("#type_of51_applicant_bank").val() == "a"){
                $("#div_of51a_").show();
                $("#div_of51d_").hide();
                $("#_080_of51a_party_identifier").attr("disabled", false);
                $("#_081_of51a_identifier_code").attr("disabled", false);
                $("#_082_of51d_party_identifier").attr("disabled", true);
                $("#_083_of51d_name_address").attr("disabled", true);
            } else if ( $("#type_of51_applicant_bank").val() == "d"){
                $("#div_of51a_").hide();
                $("#div_of51d_").show();
                $("#_080_of51a_party_identifier").attr("disabled", true);
                $("#_081_of51a_identifier_code").attr("disabled", true);
                $("#_082_of51d_party_identifier").attr("disabled", false);
                $("#_083_of51d_name_address").attr("disabled", false);
            } else{
                $("#div_of51a_").hide();
                $("#div_of51d_").hide();
                $("#_080_of51a_party_identifier").attr("disabled", true);
                $("#_081_of51a_identifier_code").attr("disabled", true);
                $("#_082_of51d_party_identifier").attr("disabled", true);
                $("#_083_of51d_name_address").attr("disabled", true);
            }
        });

        //MF41_a_d
        $("#div_mf41a_").hide();
        $("#div_mf41d_").hide();
        $("#_140_mf41a_identifier_code").attr("disabled", true);
        $("#_141_mf41a_code").attr("disabled", true);
        $("#_142_mf41d_name_address").attr("disabled", true);
        $("#_143_mf41d_code").attr("disabled", true);
        $("#type_mf41_available_with_by").change(function() {
            if ( $("#type_mf41_available_with_by").val() == "a"){
                $("#div_mf41a_").show();
                $("#div_mf41d_").hide();
                $("#_140_mf41a_identifier_code").attr("disabled", false);
                $("#_141_mf41a_code").attr("disabled", false);
                $("#_142_mf41d_name_address").attr("disabled", true);
                $("#_143_mf41d_code").attr("disabled", true);
            } else if ( $("#type_mf41_available_with_by").val() == "d"){
                $("#div_mf41a_").hide();
                $("#div_mf41d_").show();
                $("#_140_mf41a_identifier_code").attr("disabled", true);
                $("#_141_mf41a_code").attr("disabled", true);
                $("#_142_mf41d_name_address").attr("disabled", false);
                $("#_143_mf41d_code").attr("disabled", false);
            } else{
                $("#div_mf41a_").hide();
                $("#div_mf41d_").hide();
                $("#_140_mf41a_identifier_code").attr("disabled", true);
                $("#_141_mf41a_code").attr("disabled", true);
                $("#_142_mf41d_name_address").attr("disabled", true);
                $("#_143_mf41d_code").attr("disabled", true);
            }
        });

        //OF42_a_d
        $("#div_of42a_").hide();
        $("#div_of42d_").hide();
        $("#_160_of42a_party_identifier").attr("disabled", true);
        $("#_161_of42a_identifier_code").attr("disabled", true);
        $("#_162_of42d_party_identifier").attr("disabled", true);
        $("#_163_of42d_name_address").attr("disabled", true);
        $("#type_of42_drawee").change(function() {
            if ( $("#type_of42_drawee").val() == "a"){
                $("#div_of42a_").show();
                $("#div_of42d_").hide();
                $("#_160_of42a_party_identifier").attr("disabled", false);
                $("#_161_of42a_identifier_code").attr("disabled", false);
                $("#_162_of42d_party_identifier").attr("disabled", true);
                $("#_163_of42d_name_address").attr("disabled", true);
            } else if ( $("#type_of42_drawee").val() == "d"){
                $("#div_of42a_").hide();
                $("#div_of42d_").show();
                $("#_160_of42a_party_identifier").attr("disabled", true);
                $("#_161_of42a_identifier_code").attr("disabled", true);
                $("#_162_of42d_party_identifier").attr("disabled", false);
                $("#_163_of42d_name_address").attr("disabled", false);
            } else{
                $("#div_of42a_").hide();
                $("#div_of42d_").hide();
                $("#_160_of42a_party_identifier").attr("disabled", true);
                $("#_161_of42a_identifier_code").attr("disabled", true);
                $("#_162_of42d_party_identifier").attr("disabled", true);
                $("#_163_of42d_name_address").attr("disabled", true);
            }
        });

        //OF58_a_d
        $("#div_of58a_").hide();
        $("#div_of58d_").hide();
        $("#_350_of58a_party_identifier").attr("disabled", true);
        $("#_351_of58a_identifier_code").attr("disabled", true);
        $("#_352_of58d_party_identifier").attr("disabled", true);
        $("#_353_of58d_name_address").attr("disabled", true);
        $("#type_of58_request_confirmation_party").change(function() {
            if ( $("#type_of58_request_confirmation_party").val() == "a"){
                $("#div_of58a_").show();
                $("#div_of58d_").hide();
                $("#_350_of58a_party_identifier").attr("disabled", false);
                $("#_351_of58a_identifier_code").attr("disabled", false);
                $("#_352_of58d_party_identifier").attr("disabled", true);
                $("#_353_of58d_name_address").attr("disabled", true);
            } else if ( $("#type_of58_request_confirmation_party").val() == "d"){
                $("#div_of58a_").hide();
                $("#div_of58d_").show();
                $("#_350_of58a_party_identifier").attr("disabled", true);
                $("#_351_of58a_identifier_code").attr("disabled", true);
                $("#_352_of58d_party_identifier").attr("disabled", false);
                $("#_353_of58d_name_address").attr("disabled", false);
            } else{
                $("#div_of58a_").hide();
                $("#div_of58d_").hide();
                $("#_350_of58a_party_identifier").attr("disabled", true);
                $("#_351_of58a_identifier_code").attr("disabled", true);
                $("#_352_of58d_party_identifier").attr("disabled", true);
                $("#_353_of58d_name_address").attr("disabled", true);
            }
        });
        
        //OF53_a_d
        $("#div_of53a_").hide();
        $("#div_of53d_").hide();
        $("#_360_of53a_party_identifier").attr("disabled", true);
        $("#_361_of53a_identifier_code").attr("disabled", true);
        $("#_362_of53d_party_identifier").attr("disabled", true);
        $("#_363_of53d_name_address").attr("disabled", true);
        $("#type_of53_reimbursing_bank").change(function() {
            if ( $("#type_of53_reimbursing_bank").val() == "a"){
                $("#div_of53a_").show();
                $("#div_of53d_").hide();
                $("#_360_of53a_party_identifier").attr("disabled", false);
                $("#_361_of53a_identifier_code").attr("disabled", false);
                $("#_362_of53d_party_identifier").attr("disabled", true);
                $("#_363_of53d_name_address").attr("disabled", true);
            } else if ( $("#type_of53_reimbursing_bank").val() == "d"){
                $("#div_of53a_").hide();
                $("#div_of53d_").show();
                $("#_360_of53a_party_identifier").attr("disabled", true);
                $("#_361_of53a_identifier_code").attr("disabled", true);
                $("#_362_of53d_party_identifier").attr("disabled", false);
                $("#_363_of53d_name_address").attr("disabled", false);
            } else{
                $("#div_of53a_").hide();
                $("#div_of53d_").hide();
                $("#_360_of53a_party_identifier").attr("disabled", true);
                $("#_361_of53a_identifier_code").attr("disabled", true);
                $("#_362_of53d_party_identifier").attr("disabled", true);
                $("#_363_of53d_name_address").attr("disabled", true);
            }
        });
        
        //OF57_a_b_d
        $("#div_of57a_").hide();
        $("#div_of57b_").hide();
        $("#div_of57d_").hide();
        $("#_380_of57a_party_identifier").attr("disabled", true);
        $("#_381_of57a_identifier_code").attr("disabled", true);
        $("#_382_of57b_party_identifier").attr("disabled", true);
        $("#_383_of57b_location").attr("disabled", true);
        $("#_384_of57d_party_identifier").attr("disabled", true);
        $("#_385_of57d_name_address").attr("disabled", true);
        $("#type_of57_advise_through_bank").change(function() {
            if ( $("#type_of57_advise_through_bank").val() == "a"){
                $("#div_of57a_").show();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_380_of57a_party_identifier").attr("disabled", false);
                $("#_381_of57a_identifier_code").attr("disabled", false);
                $("#_382_of57b_party_identifier").attr("disabled", true);
                $("#_383_of57b_location").attr("disabled", true);
                $("#_384_of57d_party_identifier").attr("disabled", true);
                $("#_385_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_advise_through_bank").val() == "b"){
                $("#div_of57a_").hide();
                $("#div_of57b_").show();
                $("#div_of57d_").hide();
                $("#_380_of57a_party_identifier").attr("disabled", true);
                $("#_381_of57a_identifier_code").attr("disabled", true);
                $("#_382_of57b_party_identifier").attr("disabled", false);
                $("#_383_of57b_location").attr("disabled", false);
                $("#_384_of57d_party_identifier").attr("disabled", true);
                $("#_385_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_advise_through_bank").val() == "d"){
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").show();
                $("#_380_of57a_party_identifier").attr("disabled", true);
                $("#_381_of57a_identifier_code").attr("disabled", true);
                $("#_382_of57b_party_identifier").attr("disabled", true);
                $("#_383_of57b_location").attr("disabled", true);
                $("#_384_of57d_party_identifier").attr("disabled", false);
                $("#_385_of57d_name_address").attr("disabled", false);
            } else{
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_380_of57a_party_identifier").attr("disabled", true);
                $("#_381_of57a_identifier_code").attr("disabled", true);
                $("#_382_of57b_party_identifier").attr("disabled", true);
                $("#_383_of57b_location").attr("disabled", true);
                $("#_384_of57d_party_identifier").attr("disabled", true);
                $("#_385_of57d_name_address").attr("disabled", true);
            }
        });

    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF39A_check
        if ($("#_120_of39a_percentage_credit_amount_tolerance1").val() != "" || $("#_121_of39a_percentage_credit_amount_tolerance2").val() != ""){
            $("#percentage_credit_amount_checkbox").attr("checked", true);
            $("#check_of39a").show();
            $("#_120_of39a_percentage_credit_amount_tolerance1").attr("disabled", false);
            $("#_121_of39a_percentage_credit_amount_tolerance2").attr("disabled", false);
        } else {
            $("#check_of39a").hide();
            $("#_120_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
            $("#_121_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
        }
        
        //OF51_a_d
        if ($("#_080_of51a_party_identifier").val() != "" || $("#_081_of51a_identifier_code").val() != ""){
            $("#type_of51_applicant_bank").val("a").attr("selected",true);
            $("#div_of51a_").show();
            $("#div_of51d_").hide();
            $("#_080_of51a_party_identifier").attr("disabled", false);
            $("#_081_of51a_identifier_code").attr("disabled", false);
            $("#_082_of51d_party_identifier").attr("disabled", true);
            $("#_083_of51d_name_address").attr("disabled", true);
        } else if ($("#_082_of51d_party_identifier").val() != "" || $("#_083_of51d_name_address").val() != ""){
            $("#type_of51_applicant_bank").val("d").attr("selected",true);
            $("#div_of51a_").hide();
            $("#div_of51d_").show();
            $("#_080_of51a_party_identifier").attr("disabled", true);
            $("#_081_of51a_identifier_code").attr("disabled", true);
            $("#_082_of51d_party_identifier").attr("disabled", false);
            $("#_083_of51d_name_address").attr("disabled", false);
        } else{
            $("#div_of51a_").hide();
            $("#div_of51d_").hide();
            $("#_080_of51a_party_identifier").attr("disabled", true);
            $("#_081_of51a_identifier_code").attr("disabled", true);
            $("#_082_of51d_party_identifier").attr("disabled", true);
            $("#_083_of51d_name_address").attr("disabled", true);
        }

        //MF41_a_d
        if ($("#_140_mf41a_identifier_code").val() != "" || $("#_141_mf41a_code").val() != ""){
            $("#type_mf41_available_with_by").val("a").attr("selected",true);
            $("#div_mf41a_").show();
            $("#div_mf41d_").hide();
            $("#_140_mf41a_identifier_code").attr("disabled", false);
            $("#_141_mf41a_code").attr("disabled", false);
            $("#_142_mf41d_name_address").attr("disabled", true);
            $("#_143_mf41d_code").attr("disabled", true);
        } else if ($("#_142_mf41d_name_address").val() != "" || $("#_143_mf41d_code").val() != ""){
            $("#type_mf41_available_with_by").val("d").attr("selected",true);
            $("#div_mf41a_").hide();
            $("#div_mf41d_").show();
            $("#_140_mf41a_identifier_code").attr("disabled", true);
            $("#_141_mf41a_code").attr("disabled", true);
            $("#_142_mf41d_name_address").attr("disabled", false);
            $("#_143_mf41d_code").attr("disabled", false);
        } else{
            $("#div_mf41a_").hide();
            $("#div_mf41d_").hide();
            $("#_140_mf41a_identifier_code").attr("disabled", true);
            $("#_141_mf41a_code").attr("disabled", true);
            $("#_142_mf41d_name_address").attr("disabled", true);
            $("#_143_mf41d_code").attr("disabled", true);
        }
        
        //OF42_a_d
        if ($("#_160_of42a_party_identifier").val() != "" || $("#_161_of42a_identifier_code").val() != ""){
            $("#type_of42_drawee").val("a").attr("selected",true);
            $("#div_of42a_").show();
            $("#div_of42d_").hide();
            $("#_160_of42a_party_identifier").attr("disabled", false);
            $("#_161_of42a_identifier_code").attr("disabled", false);
            $("#_162_of42d_party_identifier").attr("disabled", true);
            $("#_163_of42d_name_address").attr("disabled", true);
        } else if ($("#_162_of42d_party_identifier").val() != "" || $("#_163_of42d_name_address").val() != ""){
            $("#type_of42_drawee").val("d").attr("selected",true);
            $("#div_of42a_").hide();
            $("#div_of42d_").show();
            $("#_160_of42a_party_identifier").attr("disabled", true);
            $("#_161_of42a_identifier_code").attr("disabled", true);
            $("#_162_of42d_party_identifier").attr("disabled", false);
            $("#_163_of42d_name_address").attr("disabled", false);
        } else{
            $("#div_of42a_").hide();
            $("#div_of42d_").hide();
            $("#_160_of42a_party_identifier").attr("disabled", true);
            $("#_161_of42a_identifier_code").attr("disabled", true);
            $("#_162_of42d_party_identifier").attr("disabled", true);
            $("#_163_of42d_name_address").attr("disabled", true);
        }
        
        //OF58_a_d
        if ($("#_350_of58a_party_identifier").val() != "" || $("#_351_of58a_identifier_code").val() != ""){
            $("#type_of58_request_confirmation_party").val("a").attr("selected",true);
            $("#div_of58a_").show();
            $("#div_of58d_").hide();
            $("#_350_of58a_party_identifier").attr("disabled", false);
            $("#_351_of58a_identifier_code").attr("disabled", false);
            $("#_352_of58d_party_identifier").attr("disabled", true);
            $("#_353_of58d_name_address").attr("disabled", true);
        } else if ($("#_352_of58d_party_identifier").val() != "" || $("#_353_of58d_name_address").val() != ""){
            $("#type_of58_request_confirmation_party").val("d").attr("selected",true);
            $("#div_of58a_").hide();
            $("#div_of58d_").show();
            $("#_350_of58a_party_identifier").attr("disabled", true);
            $("#_351_of58a_identifier_code").attr("disabled", true);
            $("#_352_of58d_party_identifier").attr("disabled", false);
            $("#_353_of58d_name_address").attr("disabled", false);
        } else{
            $("#div_of58a_").hide();
            $("#div_of58d_").hide();
            $("#_350_of58a_party_identifier").attr("disabled", true);
            $("#_351_of58a_identifier_code").attr("disabled", true);
            $("#_352_of58d_party_identifier").attr("disabled", true);
            $("#_353_of58d_name_address").attr("disabled", true);
        }
        
        //OF53_a_d
        if ($("#_360_of53a_party_identifier").val() != "" || $("#_361_of53a_identifier_code").val() != ""){
            $("#type_of53_reimbursing_bank").val("a").attr("selected",true);
            $("#div_of53a_").show();
            $("#div_of53d_").hide();
            $("#_360_of53a_party_identifier").attr("disabled", false);
            $("#_361_of53a_identifier_code").attr("disabled", false);
            $("#_362_of53d_party_identifier").attr("disabled", true);
            $("#_363_of53d_name_address").attr("disabled", true);
        } else if ($("#_362_of53d_party_identifier").val() != "" || $("#_363_of53d_name_address").val() != ""){
            $("#type_of53_reimbursing_bank").val("d").attr("selected",true);
            $("#div_of53a_").hide();
            $("#div_of53d_").show();
            $("#_360_of53a_party_identifier").attr("disabled", true);
            $("#_361_of53a_identifier_code").attr("disabled", true);
            $("#_362_of53d_party_identifier").attr("disabled", false);
            $("#_363_of53d_name_address").attr("disabled", false);
        } else{
            $("#div_of53a_").hide();
            $("#div_of53d_").hide();
            $("#_360_of53a_party_identifier").attr("disabled", true);
            $("#_361_of53a_identifier_code").attr("disabled", true);
            $("#_362_of53d_party_identifier").attr("disabled", true);
            $("#_363_of53d_name_address").attr("disabled", true);
        }
        
        //OF57_a_b_d
        if ($("#_380_of57a_party_identifier").val() != "" || $("#_381_of57a_identifier_code").val() != ""){
            $("#type_of57_advise_through_bank").val("a").attr("selected",true);
            $("#div_of57a_").show();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_380_of57a_party_identifier").attr("disabled", false);
            $("#_381_of57a_identifier_code").attr("disabled", false);
            $("#_382_of57b_party_identifier").attr("disabled", true);
            $("#_383_of57b_location").attr("disabled", true);
            $("#_384_of57d_party_identifier").attr("disabled", true);
            $("#_385_of57d_name_address").attr("disabled", true);
        } else if ($("#_382_of57b_party_identifier").val() != "" || $("#_383_of57b_location").val() != ""){
            $("#type_of57_advise_through_bank").val("b").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").show();
            $("#div_of57d_").hide();
            $("#_380_of57a_party_identifier").attr("disabled", true);
            $("#_381_of57a_identifier_code").attr("disabled", true);
            $("#_382_of57b_party_identifier").attr("disabled", false);
            $("#_383_of57b_location").attr("disabled", false);
            $("#_384_of57d_party_identifier").attr("disabled", true);
            $("#_385_of57d_name_address").attr("disabled", true);
        } else if ($("#_384_of57d_party_identifier").val() != "" || $("#_385_of57d_name_address").val() != ""){
            $("#type_of57_advise_through_bank").val("d").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").show();
            $("#_380_of57a_party_identifier").attr("disabled", true);
            $("#_381_of57a_identifier_code").attr("disabled", true);
            $("#_382_of57b_party_identifier").attr("disabled", true);
            $("#_383_of57b_location").attr("disabled", true);
            $("#_384_of57d_party_identifier").attr("disabled", false);
            $("#_385_of57d_name_address").attr("disabled", false);
        } else{
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_380_of57a_party_identifier").attr("disabled", true);
            $("#_381_of57a_identifier_code").attr("disabled", true);
            $("#_382_of57b_party_identifier").attr("disabled", true);
            $("#_383_of57b_location").attr("disabled", true);
            $("#_384_of57d_party_identifier").attr("disabled", true);
            $("#_385_of57d_name_address").attr("disabled", true);
        }


    });
</script>