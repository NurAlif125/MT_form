<%-- 
    Document   : validate_rule_mt707
    Created on : Sep 4, 2025, 11:02:27 AM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
    $(document).ready(function () {

        let validator = $("#form_mt707").validate({
            ignore: [],  
            onkeyup: false,
            onfocusout: false,
            rules: {
                _010_mf27_number: {
                    required: true,
                    digits: true,
                    min: 1,
                    max: 8
                },
                _011_mf27_total: {
                    required: true,
                    digits: true,
                    min: 1,
                    max: 8
                },
                _020_mf20_sender_reference: {
                    required: true,
                    maxlength: 16
                },
                _030_mf21_receiver_reference: {
                    required: true,
                    maxlength: 16
                },
                _040_mf23_issuing_bank_reference: {
                    required: true,
                    maxlength: 16
                },
                _070_mf31c_date_of_issue: {
                    required: true,
                    digits: true,
                    minlength: 6,
                    maxlength: 6
                },
                _080_mf26e_number_of_amendment: {
                    required: true,
                    digits: true,
                    maxlength: 3
                },
                _090_mf30_date_of_amendment: {
                    required: true,
                    digits: true,
                    minlength: 6,
                    maxlength: 6
                },
                _100_mf22a_purpose_of_message: {
                    required: true
                },

                _140_of31d_date_of_expiry: {
                    digits: true,
                    minlength: 6,
                    maxlength: 6
                },
                _320_of44c_latest_date_of_shipment: {
                    digits: true,
                    minlength: 6,
                    maxlength: 6
                },

                _170_of32b_currency: {
                    minlength: 3,
                    maxlength: 3
                },
                _171_of32b_amount: {
                },
                _180_of33b_currency: {
                    minlength: 3,
                    maxlength: 3
                },
                _181_of33b_amount: {
                },
                _190_of39a_plus: {
                    digits: true,
                    min: 0,
                    max: 99
                },
                _191_of39a_minus: {
                    digits: true,
                    min: 0,
                    max: 99
                },

                _052_of52a_identifier_code: {
                    minlength: 8,
                    maxlength: 11
                },
                _211_of41a_identifier_code: {
                    minlength: 8,
                    maxlength: 11
                },
                _232_of42a_identifier_code: {
                    minlength: 8,
                    maxlength: 11
                },
                _432_of58a_identifier_code: {
                    minlength: 8,
                    maxlength: 11
                },
                _442_of53a_identifier_code: {
                    minlength: 8,
                    maxlength: 11
                },
                _462_of57a_identifier_code: {
                    minlength: 8,
                    maxlength: 11
                },

                _410_of48_days: {
                    digits: true,
                    maxlength: 3
                }
            },
            messages: {
                _010_mf27_number: {
                    required: "MF27 Number is mandatory",
                    digits: "Must be numeric",
                    min: "Must be between 1-8",
                    max: "Must be between 1-8"
                },
                _011_mf27_total: {
                    required: "MF27 Total is mandatory",
                    digits: "Must be numeric",
                    min: "Must be between 1-8",
                    max: "Must be between 1-8"
                },
                _020_mf20_sender_reference: {
                    required: "MF20 Sender's Reference is mandatory",
                    maxlength: "Maximum 16 characters"
                },
                _030_mf21_receiver_reference: {
                    required: "MF21 Receiver's Reference is mandatory",
                    maxlength: "Maximum 16 characters"
                },
                _040_mf23_issuing_bank_reference: {
                    required: "MF23 Issuing Bank's Reference is mandatory",
                    maxlength: "Maximum 16 characters"
                },
                _070_mf31c_date_of_issue: {
                    required: "MF31C Date of Issue is mandatory",
                    digits: "Must be numeric YYMMDD",
                    minlength: "Must be 6 digits (YYMMDD)",
                    maxlength: "Must be 6 digits (YYMMDD)"
                },
                _080_mf26e_number_of_amendment: {
                    required: "MF26E Number of Amendment is mandatory",
                    digits: "Must be numeric",
                    maxlength: "Maximum 3 digits"
                },
                _090_mf30_date_of_amendment: {
                    required: "MF30 Date of Amendment is mandatory",
                    digits: "Must be numeric YYMMDD",
                    minlength: "Must be 6 digits (YYMMDD)",
                    maxlength: "Must be 6 digits (YYMMDD)"
                },
                _100_mf22a_purpose_of_message: {
                    required: "MF22A Purpose of Message is mandatory"
                },
                _140_of31d_date_of_expiry: {
                    digits: "Must be numeric YYMMDD",
                    minlength: "Must be 6 digits (YYMMDD)",
                    maxlength: "Must be 6 digits (YYMMDD)"
                },
                _320_of44c_latest_date_of_shipment: {
                    digits: "Must be numeric YYMMDD",
                    minlength: "Must be 6 digits (YYMMDD)",
                    maxlength: "Must be 6 digits (YYMMDD)"
                },
                _170_of32b_currency: {
                    minlength: "Must be 3-letter ISO currency code",
                    maxlength: "Must be 3-letter ISO currency code"
                },
                _180_of33b_currency: {
                    minlength: "Must be 3-letter ISO currency code",
                    maxlength: "Must be 3-letter ISO currency code"
                },
                _190_of39a_plus: {
                    digits: "Must be numeric",
                    min: "Must be 0-99",
                    max: "Must be 0-99"
                },
                _191_of39a_minus: {
                    digits: "Must be numeric",
                    min: "Must be 0-99",
                    max: "Must be 0-99"
                },
                _052_of52a_identifier_code: {
                    minlength: "BIC must be 8 or 11 characters",
                    maxlength: "BIC must be 8 or 11 characters"
                },
                _211_of41a_identifier_code: {
                    minlength: "BIC must be 8 or 11 characters",
                    maxlength: "BIC must be 8 or 11 characters"
                },
                _232_of42a_identifier_code: {
                    minlength: "BIC must be 8 or 11 characters",
                    maxlength: "BIC must be 8 or 11 characters"
                },
                _432_of58a_identifier_code: {
                    minlength: "BIC must be 8 or 11 characters",
                    maxlength: "BIC must be 8 or 11 characters"
                },
                _442_of53a_identifier_code: {
                    minlength: "BIC must be 8 or 11 characters",
                    maxlength: "BIC must be 8 or 11 characters"
                },
                _462_of57a_identifier_code: {
                    minlength: "BIC must be 8 or 11 characters",
                    maxlength: "BIC must be 8 or 11 characters"
                },
                _410_of48_days: {
                    digits: "Must be numeric",
                    maxlength: "Maximum 3 digits"
                }
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
                $("#tab-validate").removeAttr("hidden");
            },
            showErrors: function (errorMap, errorList) {
                this.defaultShowErrors();
                
                $("#tab-validate").removeAttr("hidden");
                 
                $("#view1, #view2, #view3, #view4, #view5, #view6, #view7").css("display", "none");
                $("#view8").css("display", "block");
                $('.tabs li').removeClass("selected");
                $('#tab-validate').addClass("selected");

                let errorContainer = document.getElementById("error-container");
                
                if (errorList.length === 0) {
                    errorContainer.innerHTML = ""; 
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
                        let inputId = this.getAttribute("data-input-id");
                        let tabContentGroup = this.getAttribute("content-body");
                        
                        let input = document.getElementById(inputId);
                        if (input) {
                            if(tabContentGroup === "Header") {
                                $("#view2, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                $("#view1").css("display", "block");
                                $('.tabs li').removeClass("selected");
                                $('#tab-view1').addClass("selected");
                            } 
                            else if (tabContentGroup === "Body") {
                                $("#view1, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                $("#view2").css("display", "block");
                                $('.tabs li').removeClass("selected");
                                $('#tab-view2').addClass("selected");
                            }
                            
                            input.focus();
                        }
                    });
                });
            }
        });

        $.validator.addMethod("noSlashStartEnd", function(value, element) {
            if (!value) return true;
            return !value.startsWith('/') && !value.endsWith('/') && value.indexOf('//') === -1;
        }, "Cannot start/end with '/' or contain '//'");

        $.validator.addMethod("validBIC", function(value, element) {
            if (!value) return true;
            return /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/.test(value.toUpperCase());
        }, "Invalid BIC format (Error T27/T28/T29)");

        $.validator.addMethod("validCurrency", function(value, element) {
            if (!value) return true;
            return /^[A-Z]{3}$/.test(value.toUpperCase());
        }, "Invalid currency code (Error T52)");

        $.validator.addMethod("validAmount", function(value, element) {
            if (!value) return true;
            return /^\d+,\d{1,3}$/.test(value);
        }, "Invalid amount format. Use n,dd (example: 123,45)");

        $.validator.addMethod("validYYMMDD", function(value, element) {
            if (!value) return true;
            if (!/^\d{6}$/.test(value)) return false;
            
            const yy = parseInt(value.slice(0, 2), 10);
            const mm = parseInt(value.slice(2, 4), 10);
            const dd = parseInt(value.slice(4, 6), 10);
            
            if (mm < 1 || mm > 12) return false;
            if (dd < 1 || dd > 31) return false;
            
            const dim = [31, (yy % 4 === 0 ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
            return dd <= dim[mm - 1];
        }, "Invalid date (Error T50)");

        $("#_020_mf20_sender_reference").rules("add", { noSlashStartEnd: true });
        $("#_030_mf21_receiver_reference").rules("add", { noSlashStartEnd: true });
        $("#_040_mf23_issuing_bank_reference").rules("add", { noSlashStartEnd: true });

        $("#_070_mf31c_date_of_issue").rules("add", { validYYMMDD: true });
        $("#_090_mf30_date_of_amendment").rules("add", { validYYMMDD: true });
        $("#_140_of31d_date_of_expiry").rules("add", { validYYMMDD: true });
        $("#_320_of44c_latest_date_of_shipment").rules("add", { validYYMMDD: true });

        $("#_170_of32b_currency").rules("add", { validCurrency: true });
        $("#_180_of33b_currency").rules("add", { validCurrency: true });

        $("#_171_of32b_amount").rules("add", { validAmount: true });
        $("#_181_of33b_amount").rules("add", { validAmount: true });

        const bicFields = [
            "_052_of52a_identifier_code",
            "_211_of41a_identifier_code",
            "_232_of42a_identifier_code",
            "_432_of58a_identifier_code",
            "_442_of53a_identifier_code",
            "_462_of57a_identifier_code"
        ];
        bicFields.forEach(id => {
            $("#" + id).rules("add", { validBIC: true });
        });

        $("#btn-validate").click(function () {
            let isValid = $("#form_mt707").valid();
            
            if (isValid) {
                isValid = validateMT707();
            }
            
            if (isValid) {
                alert("All inputs are valid!");
            }
        });

        $("#submit_mt").click(function (e) {
            e.preventDefault();
            
            let isValid = $("#form_mt707").valid();
            
            if (isValid) {
                isValid = validateMT707();
            }
            
            if (isValid) {
                if (confirm('Do you want to save this MT707 data?')) {
                    $("#form_mt707").submit();
                }
            } else {
                alert("There are still errors! Please fix them before saving.");
            }
        });

        function validateRuleC1() {
            const optionalFields = [
                "_110_of23s_cancellation_request",
                "_120_of40a_form_of_documentary_credit",
                "_130_of40e_applicable_rules",
                "_140_of31d_date_of_expiry",
                "_150_of50_changed_applicant_details",
                "_160_of59_account",
                "_170_of32b_currency",
                "_180_of33b_currency",
                "_190_of39a_plus",
                "_200_of39c_additional_amounts_covered",
                "_210_of41a_available_with_by",
                "_220_of42c_drafts_at",
                "_230_of42a_drawee",
                "_240_of42m_mixed_payment_details",
                "_250_of42p_negotiation_deferred_payment_details",
                "_260_of43p_partial_shipments",
                "_270_of43t_transhipment",
                "_280_of44a_place_taking_in_charge_dispatch_from_place_of_receipt",
                "_290_of44e_port_of_loading_airport_of_departure",
                "_300_of44f_port_of_discharge_airport_of_destination",
                "_310_of44b_place_of_final_destination_for_transportation_to_place_of_delivery",
                "_320_of44c_latest_date_of_shipment",
                "_330_of44d_shipment_period",
                "_340_of45b_description_of_goods_and_or_services",
                "_350_of46b_documents_required",
                "_360_of47b_additional_conditions",
                "_370_of49m_special_payment_conditions_for_beneficiary",
                "_380_of49n_special_payment_conditions_for_bank_only",
                "_390_of71d_charges",
                "_400_of71n_charge_code",
                "_410_of48_days",
                "_420_of49_confirmation_instructions",
                "_430_of58a_requested_confirmation_party",
                "_440_of53a_reimbursing_bank",
                "_450_of78_instructions_to_the_paying_accepting_negotiating_bank",
                "_460_of57a_advise_through_bank",
                "_470_of72z_sender_to_receiver_information"
            ];
            
            let hasAtLeastOne = false;
            for (let fieldId of optionalFields) {
                const val = $("#" + fieldId).val();
                if (val && val.trim() !== "") {
                    hasAtLeastOne = true;
                    break;
                }
            }
            
            return hasAtLeastOne;
        }

        function validateRuleC2() {
            const field32B_ccy = $("#_170_of32b_currency").val().trim();
            const field32B_amt = $("#_171_of32b_amount").val().trim();
            const field33B_ccy = $("#_180_of33b_currency").val().trim();
            const field33B_amt = $("#_181_of33b_amount").val().trim();
            
            const has32B = field32B_ccy || field32B_amt;
            const has33B = field33B_ccy || field33B_amt;
            
            return !(has32B && has33B);
        }

        function validateRuleC3() {
            const field50B = $("#_060_of50b_non_bank_issuer").val().trim();
            const field52a = $("#_050_of52a_issuing_bank").val().trim();
            
            if (!field50B && !field52a) return false;
            if (field50B && field52a) return false;
            
            return true;
        }

        function validateRuleC4() {
            const field44C = $("#_320_of44c_latest_date_of_shipment").val().trim();
            const field44D = $("#_330_of44d_shipment_period").val().trim();
            
            return !(field44C && field44D);
        }

        window.originalValidateMT707 = window.validateMT707;
        window.validateMT707 = function() {
            if (!window.originalValidateMT707()) {
                return false;
            }

            if (!validateRuleC1()) {
                alert("Error C30 (Rule C1): At least one field must be present after field 22A (Purpose of Message)");
                return false;
            }

            if (!validateRuleC2()) {
                alert("Error C12 (Rule C2): Either field 32B (Increase) or 33B (Decrease) may be present, but not both");
                $("#_170_of32b_currency").focus();
                return false;
            }

            if (!validateRuleC3()) {
                alert("Error C06 (Rule C3): Either field 50B (Non-Bank Issuer) or field 52a (Issuing Bank) must be present, but not both");
                $("#_050_of52a_issuing_bank").focus();
                return false;
            }

            if (!validateRuleC4()) {
                alert("Error D06 (Rule C4): Either field 44C (Latest Date of Shipment) or 44D (Shipment Period) may be present, but not both");
                $("#_320_of44c_latest_date_of_shipment").focus();
                return false;
            }

            return true;
        };

    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function () {

        if ($("#_052_of52a_identifier_code").val() != "" || $("#_051_of52a_party_identifier").val() != "") {
            $("#_050_of52a_issuing_bank").val("A").attr("selected", true);
            $("#div_050_of52a_A").show();
            $("#div_050_of52a_D").hide();
        } else if ($("#_054_of52a_name_address").val() != "" || $("#_053_of52a_party_identifier").val() != "") {
            $("#_050_of52a_issuing_bank").val("D").attr("selected", true);
            $("#div_050_of52a_A").hide();
            $("#div_050_of52a_D").show();
        } else {
            $("#div_050_of52a_A").hide();
            $("#div_050_of52a_D").hide();
        }

        if ($("#_130_of40e_applicable_rules").val() === "OTHR") {
            $("#div_130_of40e_narrative").show();
        } else {
            $("#div_130_of40e_narrative").hide();
        }

        if ($("#_211_of41a_identifier_code").val() != "") {
            $("#_210_of41a_available_with_by").val("A").attr("selected", true);
            $("#div_210_of41a_A").show();
            $("#div_210_of41a_D").hide();
        } else if ($("#_212_of41a_name_address").val() != "") {
            $("#_210_of41a_available_with_by").val("D").attr("selected", true);
            $("#div_210_of41a_A").hide();
            $("#div_210_of41a_D").show();
        } else {
            $("#div_210_of41a_A").hide();
            $("#div_210_of41a_D").hide();
        }

        if ($("#_232_of42a_identifier_code").val() != "" || $("#_231_of42a_party_identifier").val() != "") {
            $("#_230_of42a_drawee").val("A").attr("selected", true);
            $("#div_230_of42a_A").show();
            $("#div_230_of42a_D").hide();
        } else if ($("#_234_of42a_name_address").val() != "" || $("#_233_of42a_party_identifier").val() != "") {
            $("#_230_of42a_drawee").val("D").attr("selected", true);
            $("#div_230_of42a_A").hide();
            $("#div_230_of42a_D").show();
        } else {
            $("#div_230_of42a_A").hide();
            $("#div_230_of42a_D").hide();
        }

        if ($("#_400_of71n_charge_code").val() === "OTHR") {
            $("#div_400_of71n_narrative").show();
        } else {
            $("#div_400_of71n_narrative").hide();
        }

        if ($("#_432_of58a_identifier_code").val() != "" || $("#_431_of58a_party_identifier").val() != "") {
            $("#_430_of58a_requested_confirmation_party").val("A").attr("selected", true);
            $("#div_430_of58a_A").show();
            $("#div_430_of58a_D").hide();
        } else if ($("#_434_of58a_name_address").val() != "" || $("#_433_of58a_party_identifier").val() != "") {
            $("#_430_of58a_requested_confirmation_party").val("D").attr("selected", true);
            $("#div_430_of58a_A").hide();
            $("#div_430_of58a_D").show();
        } else {
            $("#div_430_of58a_A").hide();
            $("#div_430_of58a_D").hide();
        }

        if ($("#_442_of53a_identifier_code").val() != "" || $("#_441_of53a_party_identifier").val() != "") {
            $("#_440_of53a_reimbursing_bank").val("A").attr("selected", true);
            $("#div_440_of53a_A").show();
            $("#div_440_of53a_D").hide();
        } else if ($("#_444_of53a_name_address").val() != "" || $("#_443_of53a_party_identifier").val() != "") {
            $("#_440_of53a_reimbursing_bank").val("D").attr("selected", true);
            $("#div_440_of53a_A").hide();
            $("#div_440_of53a_D").show();
        } else {
            $("#div_440_of53a_A").hide();
            $("#div_440_of53a_D").hide();
        }

        if ($("#_462_of57a_identifier_code").val() != "" || $("#_461_of57a_party_identifier").val() != "") {
            $("#_460_of57a_advise_through_bank").val("A").attr("selected", true);
            $("#div_460_of57a_A").show();
            $("#div_460_of57a_B").hide();
            $("#div_460_of57a_D").hide();
        } else if ($("#_464_of57a_location").val() != "" || $("#_463_of57a_party_identifier").val() != "") {
            $("#_460_of57a_advise_through_bank").val("B").attr("selected", true);
            $("#div_460_of57a_A").hide();
            $("#div_460_of57a_B").show();
            $("#div_460_of57a_D").hide();
        } else if ($("#_466_of57a_name_address").val() != "" || $("#_465_of57a_party_identifier").val() != "") {
            $("#_460_of57a_advise_through_bank").val("D").attr("selected", true);
            $("#div_460_of57a_A").hide();
            $("#div_460_of57a_B").hide();
            $("#div_460_of57a_D").show();
        } else {
            $("#div_460_of57a_A").hide();
            $("#div_460_of57a_B").hide();
            $("#div_460_of57a_D").hide();
        }

    });
</script>