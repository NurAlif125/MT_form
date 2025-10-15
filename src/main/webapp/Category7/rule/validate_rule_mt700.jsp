<%-- 
    Document   : validate_rule_mt700
    Created on : Aug 26, 2025, 1:14:59?PM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/validate.css" />
<script type="text/javascript">
    $(document).ready(function () {
        
        function isYYMMDD(v) {
            if (!/^\d{6}$/.test(v)) return false;
            let yy = +v.substr(0, 2), mm = +v.substr(2, 2), dd = +v.substr(4, 2);
            let y4 = 2000 + yy;
            let d = new Date(y4, mm - 1, dd);
            return d.getFullYear() === y4 && d.getMonth() === mm - 1 && d.getDate() === dd;
        }

        const DEC0 = new Set(['JPY', 'KRW', 'VND', 'HUF', 'XOF', 'XAF', 'XPF', 'CLP', 'ISK', 'PYG', 'UGX', 'VUV']);
        const DEC3 = new Set(['BHD', 'JOD', 'KWD', 'OMR', 'TND', 'LYD', 'IQD']);
        
        function checkAmountByCcy(ccy, amt) {
            if (!ccy || !amt) return null;
            if (!/^\d{1,12}(,\d{0,10})?$/.test(amt)) return "Format amount salah";
            
            let dp = (amt.split(',')[1] || '').length;
            let allowed = 2;
            if (DEC0.has(ccy)) allowed = 0;
            if (DEC3.has(ccy)) allowed = 3;
            
            if (dp > allowed) return `Desimal untuk ${ccy} maksimal ${allowed}`;
            if (allowed === 0 && dp !== 0) return `Mata uang ${ccy} tidak boleh ada desimal`;
            return null;
        }

      
        let validator = $("#form_mt700").validate({
            ignore: [],
            onkeyup: false,
            onfocusout: false,
            rules: {
                // === MANDATORY FIELDS ===
                _010_mf27_number: "required",
                _011_mf27_total: "required",
                _020_mf40a_form_of_credit: "required",
                _030_mf20_documentary_credit_number: "required",
                _050_mf31c_date_of_issue: "required",
                _060_mf40e_applicable_rules: "required",
                _070_mf31d_date_of_expiry: "required",
                _071_mf31d_place_of_expiry: "required",
                _090_mf50_applicant: "required",
                _101_mf59_name_address: "required",
                _110_mf32b_currency: "required",
                _111_mf32b_amount: "required",
                _140_mf41a_available_with_by: "required",
                _143_mf41a_by: "required",
                _340_mf49_confirmation_instructions: "required"
            },
            messages: {
                _010_mf27_number: {required: "MF27 Number must be filled"},
                _011_mf27_total: {required: "MF27 Total must be filled"},
                _020_mf40a_form_of_credit: {required: "MF40A Form of Credit must be filled"},
                _030_mf20_documentary_credit_number: {required: "MF20 Documentary Credit Number must be filled"},
                _050_mf31c_date_of_issue: {required: "MF31C Date of Issue must be filled"},
                _060_mf40e_applicable_rules: {required: "MF40E Applicable Rules must be filled"},
                _070_mf31d_date_of_expiry: {required: "MF31D Date of Expiry must be filled"},
                _071_mf31d_place_of_expiry: {required: "MF31D Place of Expiry must be filled"},
                _090_mf50_applicant: {required: "MF50 Applicant must be filled"},
                _101_mf59_name_address: {required: "MF59 Beneficiary Name & Address must be filled"},
                _110_mf32b_currency: {required: "MF32B Currency must be filled"},
                _111_mf32b_amount: {required: "MF32B Amount must be filled"},
                _140_mf41a_available_with_by: {required: "MF41A Available With must be filled"},
                _143_mf41a_by: {required: "MF41A By must be filled"},
                _340_mf49_confirmation_instructions: {required: "MF49 Confirmation Instructions must be filled"}
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
                $("#tab-validate").removeAttr("hidden");
            },
            showErrors: function (errorMap, errorList) {
                this.defaultShowErrors();
                
                if (errorList.length > 0) {
                    $("#tab-validate").removeAttr("hidden");
                    $("#view1, #view2, #view3, #view4, #view5, #view6, #view7").css("display", "none");
                    $("#view8").css("display", "block");
                    $('#tab-view1, #tab-view2, #tab-view3, #tab-view4, #tab-view5, #tab-view6, #tab-view7').removeClass("selected").removeAttr('class');
                    $('#tab-validate').addClass("selected");

                    let errorContainer = document.getElementById("error-container");
                    let tableHTML = `<table border="0" style="width:100% !important; caption-side: bottom; font-size:8pt !important;border-collapse: collapse; border:1px gray solid;">
                                        <tr style="background:#d6d6d6;">
                                        <th>Type</th>
                                        <th>Location</th>
                                        <th>Node</th>
                                        <th>Message</th></tr>`;

                    errorList.forEach(errors => {
                        let inputID = errors.element.id || "";
                        let locationTab = errors.element.getAttribute("location") || "Body";
                        let inputType = errors.element.getAttribute("input_type") || inputID;

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
                                if(tabContentGroup == "Header") {
                                    $("#view2, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                    $("#view1").css("display", "block");
                                    $('#tab-view1').addClass("selected");
                                    $('#tab-view2, #tab-view3, #tab-view4, #tab-view5, #tab-view6, #tab-view7, #tab-validate').removeClass("selected").removeAttr('class');
                                } else if (tabContentGroup == "Body") {
                                    $("#view1, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                    $("#view2").css("display", "block");
                                    $('#tab-view2').addClass("selected");
                                    $('#tab-view1, #tab-view3, #tab-view4, #tab-view5, #tab-view6, #tab-view7, #tab-validate').removeClass("selected").removeAttr('class');
                                }
                                input.focus();
                            }
                        });
                    });
                }
            }
        });

        /* ========== REAL-TIME FIELD VALIDATIONS ========== */

        // FIELD 27 : Sequence of Total (T75)
        $("#_010_mf27_number, #_011_mf27_total").on("blur", function () {
            var number = parseInt($("#_010_mf27_number").val() || 0);
            var total = parseInt($("#_011_mf27_total").val() || 0);
            
            if (number < 1 || number > 8) {
                alert("Field 27 Number must be between 1-8 (Error T75)");
                $("#_010_mf27_number").focus();
                return false;
            }
            if (total < 1 || total > 8) {
                alert("Field 27 Total must be between 1-8 (Error T75)");
                $("#_011_mf27_total").focus();
                return false;
            }
            if (number > total) {
                alert("Field 27 Number cannot exceed Total");
                $("#_010_mf27_number").focus();
                return false;
            }
        });

        // FIELD 40A : Form of Documentary Credit (T60)
        $("#_020_mf40a_form_of_credit").on("change", function () {
            var val = $(this).val().trim().toUpperCase();
            var allowed = ["IRREVOCABLE", "IRREVOCABLE TRANSFERABLE"];
            if (val !== "" && !allowed.includes(val)) {
                alert("Field 40A must be 'IRREVOCABLE' or 'IRREVOCABLE TRANSFERABLE' (Error T60)");
                $(this).val("");
                $(this).focus();
            }
        });

        // FIELD 20 : Documentary Credit Number (T26)
        $("#_030_mf20_documentary_credit_number").on("input", function () {
            var val = $(this).val().toUpperCase();
            val = val.replace(/[^A-Z0-9\/]/g, "").substring(0, 16);
            $(this).val(val);
        });

        $("#_030_mf20_documentary_credit_number").on("blur", function () {
            var val = $(this).val().trim();
            if (val !== "") {
                if (val.startsWith("/") || val.endsWith("/")) {
                    alert('Field 20 cannot start or end with "/" (Error T26)');
                    $(this).focus();
                    return false;
                }
                if (val.includes("//")) {
                    alert('Field 20 cannot contain "//" (Error T26)');
                    $(this).focus();
                    return false;
                }
            }
        });

        // FIELD 23 : Reference to Pre-Advice
        $("#_040_of23_reference_to_preadvice").on("input", function () {
            var val = $(this).val().toUpperCase().substring(0, 16);
            $(this).val(val);
        });

        // FIELD 31C : Date of Issue (T50)
        $("#_050_mf31c_date_of_issue").on("blur", function () {
            var val = $(this).val().trim();
            if (val !== "" && !isYYMMDD(val)) {
                alert("Field 31C must be valid date in YYMMDD format (Error T50)");
                $(this).focus();
            }
        });

        // FIELD 40E : Applicable Rules (T59, D81)
        $("#_060_mf40e_applicable_rules").on("change", function () {
            var val = $(this).val().trim().toUpperCase();
            var allowed = ["EUCP LATEST VERSION", "EUCPURR LATEST VERSION", "OTHR", "UCP LATEST VERSION", "UCPURR LATEST VERSION"];
            
            if (val !== "" && !allowed.includes(val)) {
                alert("Field 40E must be one of: " + allowed.join(", ") + " (Error T59)");
                $(this).val("");
                $(this).focus();
            }
        });

        $("#_061_mf40e_narrative").on("input", function () {
            var code = $("#_060_mf40e_applicable_rules").val().trim().toUpperCase();
            var val = $(this).val();
            
            if (code !== "OTHR" && val.length > 0) {
                alert("Narrative only allowed when Applicable Rules is OTHR (Error D81)");
                $(this).val("");
            }
            if (val.length > 35) {
                $(this).val(val.substring(0, 35));
            }
        });

        // FIELD 31D : Date and Place of Expiry (T50)
        $("#_070_mf31d_date_of_expiry").on("blur", function () {
            var val = $(this).val().trim();
            if (val !== "" && !isYYMMDD(val)) {
                alert("Field 31D Date must be valid date in YYMMDD format (Error T50)");
                $(this).focus();
            }
        });

        $("#_071_mf31d_place_of_expiry").on("input", function () {
            var val = $(this).val().substring(0, 29);
            $(this).val(val);
        });

        // FIELD 50 : Applicant
        $("#_090_mf50_applicant").on("input", function () {
            if ($(this).val().length > 140) {
                $(this).val($(this).val().substring(0, 140));
            }
        });

        // FIELD 59 : Beneficiary
        $("#_100_mf59_account").on("input", function () {
            if ($(this).val().length > 34) {
                $(this).val($(this).val().substring(0, 34));
            }
        });

        $("#_101_mf59_name_address").on("input", function () {
            if ($(this).val().length > 140) {
                $(this).val($(this).val().substring(0, 140));
            }
        });

        // FIELD 32B : Currency Code & Amount (T52, T40, T43, C03)
        $("#_110_mf32b_currency").on("input", function () {
            var val = $(this).val().toUpperCase().replace(/[^A-Z]/g, "").substring(0, 3);
            $(this).val(val);
        });

        $("#_110_mf32b_currency").on("blur", function () {
            var val = $(this).val().trim().toUpperCase();
            if (val !== "" && !/^[A-Z]{3}$/.test(val)) {
                alert("Field 32B Currency must be 3 letters (ISO 4217) (Error T52)");
                $(this).focus();
            }
        });

        $("#_111_mf32b_amount").on("blur", function () {
            var amt = $(this).val().trim();
            var ccy = $("#_110_mf32b_currency").val().trim().toUpperCase();

            if (amt !== "") {
                // Check basic format
                if (!/^\d{1,12}(,\d{0,10})?$/.test(amt)) {
                    alert("Field 32B Amount must be numeric with comma for decimals (Error T40/T43)");
                    $(this).focus();
                    return;
                }

                // Check currency-specific decimal rules
                var err = checkAmountByCcy(ccy, amt);
                if (err) {
                    alert("Field 32B Amount: " + err);
                    $(this).focus();
                    return;
                }
                
                // Check zero amount
                var amtValue = parseFloat(amt.replace(',', '.'));
                if (amtValue === 0) {
                    alert("Amount must not be 0 (zero)");
                    $(this).focus();
                }
            }
        });

        // FIELD 39A : Tolerance
        $("#_120_of39a_tolerance_plus, #_121_of39a_tolerance_minus").on("input", function () {
            var val = $(this).val().replace(/[^0-9]/g, "").substring(0, 2);
            $(this).val(val);
        });

        // FIELD 39C : Additional Amounts Covered
        $("#_130_of39c_additional_amounts_covered").on("input", function () {
            if ($(this).val().length > 140) {
                $(this).val($(this).val().substring(0, 140));
            }
        });

        // FIELD 41A : By (T68)
        $("#_143_mf41a_by").on("change", function () {
            var code = $(this).val();
            var allowed = ["BY ACCEPTANCE", "BY DEF PAYMENT", "BY MIXED PYMT", "BY NEGOTIATION", "BY PAYMENT"];
            if (code && !allowed.includes(code)) {
                alert("Field 41A By must be one of: " + allowed.join(", ") + " (Error T68)");
                $(this).val("");
            }
        });

        // FIELD 42C : Drafts at
        $("#_150_of42c_drafts_at").on("input", function () {
            if ($(this).val().length > 105) {
                $(this).val($(this).val().substring(0, 105));
            }
        });

        // FIELD 42M/42P : Payment Details
        $("#_170_of42m_mixed_payment_details, #_180_of42p_negotiation_deferred_payment_details").on("input", function () {
            if ($(this).val().length > 140) {
                $(this).val($(this).val().substring(0, 140));
            }
        });

        // FIELD 43P/43T : Partial Shipments / Transhipment (T64, T65)
        $("#_190_of43p_partial_shipments, #_200_of43t_transhipment").on("change", function () {
            var val = $(this).val().toUpperCase();
            var allowed = ["ALLOWED", "CONDITIONAL", "NOT ALLOWED"];
            if (val && !allowed.includes(val)) {
                alert("Value must be ALLOWED, CONDITIONAL, or NOT ALLOWED");
                $(this).val("");
            }
        });

        // FIELD 44A/44E/44F/44B : Place/Port fields (140z)
        $("#_210_of44a_place_taking_in_charge_dispatch_from_place_of_receipt, #_220_of44e_port_of_loading_airport_of_departure, #_230_of44f_port_of_discharge_airport_of_destination, #_240_of44b_place_of_final_destination_for_transportation_to_place_of_delivery").on("input", function () {
            if ($(this).val().length > 140) {
                $(this).val($(this).val().substring(0, 140));
            }
        });

        // FIELD 44C : Latest Date of Shipment (T50)
        $("#_250_of44c_latest_date_of_shipment").on("blur", function () {
            var val = $(this).val().trim();
            if (val !== "" && !isYYMMDD(val)) {
                alert("Field 44C must be valid date in YYMMDD format (Error T50)");
                $(this).focus();
            }
        });

        // FIELD 44D : Shipment Period
        $("#_260_of44d_shipment_period").on("input", function () {
            if ($(this).val().length > 390) {
                $(this).val($(this).val().substring(0, 390));
            }
        });

        // FIELD 45A/46A/47A/49G/49H : Large text fields (6500 chars, 100 lines)
        $("#_270_of45a_description_of_goods_and_or_services, #_280_of46a_documents_required, #_290_of47a_additional_conditions, #_300_of49g_special_payment_conditions_for_beneficiary, #_310_of49h_special_payment_conditions_for_bank_only").on("input", function () {
            if ($(this).val().length > 6500) {
                $(this).val($(this).val().substring(0, 6500));
            }
        });

        // FIELD 71D : Charges (6*35z)
        $("#_320_of71d_charges").on("blur", function () {
            var lines = $(this).val().split("\n");
            if (lines.length > 6) {
                alert("Field 71D maximum 6 lines");
                $(this).focus();
                return;
            }
            for (var i = 0; i < lines.length; i++) {
                if (lines[i].length > 35) {
                    alert("Field 71D: each line maximum 35 characters");
                    $(this).focus();
                    break;
                }
            }
        });

        // FIELD 48 : Period for Presentation
        $("#_330_of48_days").on("input", function () {
            var val = $(this).val().replace(/[^0-9]/g, "").substring(0, 3);
            $(this).val(val);
        });

        $("#_331_of48_narrative").on("input", function () {
            if ($(this).val().length > 35) {
                $(this).val($(this).val().substring(0, 35));
            }
        });

        // FIELD 49 : Confirmation Instructions (T67)
        $("#_340_mf49_confirmation_instructions").on("change", function () {
            var val = $(this).val().trim().toUpperCase();
            var allowed = ["CONFIRM", "MAY ADD", "WITHOUT"];
            if (val !== "" && !allowed.includes(val)) {
                alert("Field 49 must be CONFIRM, MAY ADD, or WITHOUT (Error T67)");
                $(this).val("");
                $(this).focus();
            }
        });

        // FIELD 78 : Instructions (12*65x)
        $("#_370_of78_instructions_to_the_paying_accepting_negotiating_bank").on("blur", function () {
            var lines = $(this).val().split("\n");
            if (lines.length > 12) {
                alert("Field 78 maximum 12 lines");
                $(this).focus();
                return;
            }
            for (var i = 0; i < lines.length; i++) {
                if (lines[i].length > 65) {
                    alert("Field 78: each line maximum 65 characters");
                    $(this).focus();
                    break;
                }
            }
        });

        // FIELD 72Z : Sender to Receiver Information (6*35z)
        $("#_390_of72z_sender_to_receiver_information").on("blur", function () {
            var lines = $(this).val().split("\n");
            if (lines.length > 6) {
                alert("Field 72Z maximum 6 lines");
                $(this).focus();
                return;
            }
            for (var i = 0; i < lines.length; i++) {
                if (lines[i].length > 35) {
                    alert("Field 72Z: each line maximum 35 characters");
                    $(this).focus();
                    break;
                }
            }
        });

        // BIC Fields Auto-uppercase and Validation (T27, T28, T29)
        $("#_082_of51a_identifier_code, #_141_mf41a_identifier_code, #_162_of42a_identifier_code, #_352_of58a_identifier_code, #_362_of53a_identifier_code, #_382_of57a_identifier_code").on("input", function () {
            $(this).val($(this).val().toUpperCase());
        });

        $("#_082_of51a_identifier_code, #_141_mf41a_identifier_code, #_162_of42a_identifier_code, #_352_of58a_identifier_code, #_362_of53a_identifier_code, #_382_of57a_identifier_code").on("blur", function () {
            var val = $(this).val().trim();
            if (val !== "") {
                if (val.length !== 8 && val.length !== 11) {
                    alert("BIC must be 8 or 11 characters (Error T27/T28)");
                    $(this).focus();
                    return;
                }
                var bicPattern = /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
                if (!bicPattern.test(val)) {
                    alert("Invalid BIC format: 6 letters + 2 alphanumeric + optional 3 alphanumeric (Error T29)");
                    $(this).focus();
                }
            }
        });

        /* ========== FIELD VISIBILITY TOGGLES ========== */
        
        // OF51a - Applicant Bank
        $("#_080_of51a_applicant_bank").change(function () {
            const opt = $(this).val();
            if (opt === "A") {
                $("#div_080_of51a_A").show();
                $("#div_080_of51a_D").hide();
                $("#_081_of51a_party_identifier, #_082_of51a_identifier_code").attr("disabled", false);
                $("#_083_of51a_party_identifier, #_084_of51a_name_address").attr("disabled", true).val("");
            } else if (opt === "D") {
                $("#div_080_of51a_D").show();
                $("#div_080_of51a_A").hide();
                $("#_083_of51a_party_identifier, #_084_of51a_name_address").attr("disabled", false);
                $("#_081_of51a_party_identifier, #_082_of51a_identifier_code").attr("disabled", true).val("");
            } else {
                $("#div_080_of51a_A, #div_080_of51a_D").hide();
                $("#_081_of51a_party_identifier, #_082_of51a_identifier_code, #_083_of51a_party_identifier, #_084_of51a_name_address").attr("disabled", true).val("");
            }
        });

        // MF41A - Available With
        $("#_140_mf41a_available_with_by").change(function () {
            const opt = $(this).val();
            if (opt === "A") {
                $("#div_140_mf41a_A").show();
                $("#div_140_mf41a_D").hide();
                $("#_141_mf41a_identifier_code").attr("disabled", false);
                $("#_142_mf41d_name_and_address").attr("disabled", true).val("");
            } else if (opt === "D") {
                $("#div_140_mf41a_D").show();
                $("#div_140_mf41a_A").hide();
                $("#_142_mf41d_name_and_address").attr("disabled", false);
                $("#_141_mf41a_identifier_code").attr("disabled", true).val("");
            } else {
                $("#div_140_mf41a_A, #div_140_mf41a_D").hide();
                $("#_141_mf41a_identifier_code, #_142_mf41d_name_and_address").attr("disabled", true).val("");
            }
        });

        // OF42A - Drawee
        $("#_160_of42a_drawee").change(function () {
            const opt = $(this).val();
            if (opt === "A") {
                $("#div_160_of42a_A").show();
                $("#div_160_of42a_D").hide();
                $("#_161_of42a_party_identifier, #_162_of42a_identifier_code").attr("disabled", false);
                $("#_163_of42a_party_identifier, #_164_of42a_name_and_address").attr("disabled", true).val("");
            } else if (opt === "D") {
                $("#div_160_of42a_D").show();
                $("#div_160_of42a_A").hide();
                $("#_163_of42a_party_identifier, #_164_of42a_name_and_address").attr("disabled", false);
                $("#_161_of42a_party_identifier, #_162_of42a_identifier_code").attr("disabled", true).val("");
            } else {
                $("#div_160_of42a_A, #div_160_of42a_D").hide();
                $("#_161_of42a_party_identifier, #_162_of42a_identifier_code, #_163_of42a_party_identifier, #_164_of42a_name_and_address").attr("disabled", true).val("");
            }
        });

        // OF58a - Requested Confirmation Party
        $("#_350_of58a_requested_confirmation_party").change(function () {
            const opt = $(this).val();
            if (opt === "A") {
                $("#div_350_of58a_A").show();
                $("#div_350_of58a_D").hide();
                $("#_351_of58a_party_identifier, #_352_of58a_identifier_code").attr("disabled", false);
                $("#_353_of58a_party_identifier, #_354_of58a_name_address").attr("disabled", true).val("");
            } else if (opt === "D") {
                $("#div_350_of58a_D").show();
                $("#div_350_of58a_A").hide();
                $("#_353_of58a_party_identifier, #_354_of58a_name_address").attr("disabled", false);
                $("#_351_of58a_party_identifier, #_352_of58a_identifier_code").attr("disabled", true).val("");
            } else {
                $("#div_350_of58a_A, #div_350_of58a_D").hide();
                $("#_351_of58a_party_identifier, #_352_of58a_identifier_code, #_353_of58a_party_identifier, #_354_of58a_name_address").attr("disabled", true).val("");
            }
        });

        // OF53a - Reimbursing Bank
        $("#_360_of53a_reimbursing_bank").change(function () {
            const opt = $(this).val();
            if (opt === "A") {
                $("#div_360_of53a_A").show();
                $("#div_360_of53a_D").hide();
                $("#_361_of53a_party_identifier, #_362_of53a_identifier_code").attr("disabled", false);
                $("#_363_of53a_party_identifier, #_364_of53a_name_address").attr("disabled", true).val("");
            } else if (opt === "D") {
                $("#div_360_of53a_D").show();
                $("#div_360_of53a_A").hide();
                $("#_363_of53a_party_identifier, #_364_of53a_name_address").attr("disabled", false);
                $("#_361_of53a_party_identifier, #_362_of53a_identifier_code").attr("disabled", true).val("");
            } else {
                $("#div_360_of53a_A, #div_360_of53a_D").hide();
                $("#_361_of53a_party_identifier, #_362_of53a_identifier_code, #_363_of53a_party_identifier, #_364_of53a_name_address").attr("disabled", true).val("");
            }
        });

        // OF57a - Advise Through Bank
        $("#_380_of57a_advise_through_bank").change(function () {
            const opt = $(this).val();
            if (opt === "A") {
                $("#div_380_of57a_A").show();
                $("#div_380_of57a_B, #div_380_of57a_D").hide();
                $("#_381_of57a_party_identifier, #_382_of57a_identifier_code").attr("disabled", false);
                $("#_383_of57a_party_identifier, #_384_of57a_location, #_385_of57a_party_identifier, #_386_of57a_name_address").attr("disabled", true).val("");
            } else if (opt === "B") {
                $("#div_380_of57a_B").show();
                $("#div_380_of57a_A, #div_380_of57a_D").hide();
                $("#_383_of57a_party_identifier, #_384_of57a_location").attr("disabled", false);
                $("#_381_of57a_party_identifier, #_382_of57a_identifier_code, #_385_of57a_party_identifier, #_386_of57a_name_address").attr("disabled", true).val("");
            } else if (opt === "D") {
                $("#div_380_of57a_D").show();
                $("#div_380_of57a_A, #div_380_of57a_B").hide();
                $("#_385_of57a_party_identifier, #_386_of57a_name_address").attr("disabled", false);
                $("#_381_of57a_party_identifier, #_382_of57a_identifier_code, #_383_of57a_party_identifier, #_384_of57a_location").attr("disabled", true).val("");
            } else {
                $("#div_380_of57a_A, #div_380_of57a_B, #div_380_of57a_D").hide();
                $("#_381_of57a_party_identifier, #_382_of57a_identifier_code, #_383_of57a_party_identifier, #_384_of57a_location, #_385_of57a_party_identifier, #_386_of57a_name_address").attr("disabled", true).val("");
            }
        });

        /* ========== INITIALIZE FIELD VISIBILITY ON PAGE LOAD ========== */
        
        // OF51a - Applicant Bank
        if ($("#_081_of51a_party_identifier").val() != "" || $("#_082_of51a_identifier_code").val() != "") {
            $("#_080_of51a_applicant_bank").val("A").attr("selected", true);
            $("#div_080_of51a_A").show();
            $("#div_080_of51a_D").hide();
            $("#_081_of51a_party_identifier, #_082_of51a_identifier_code").attr("disabled", false);
            $("#_083_of51a_party_identifier, #_084_of51a_name_address").attr("disabled", true);
        } else if ($("#_083_of51a_party_identifier").val() != "" || $("#_084_of51a_name_address").val() != "") {
            $("#_080_of51a_applicant_bank").val("D").attr("selected", true);
            $("#div_080_of51a_D").show();
            $("#div_080_of51a_A").hide();
            $("#_083_of51a_party_identifier, #_084_of51a_name_address").attr("disabled", false);
            $("#_081_of51a_party_identifier, #_082_of51a_identifier_code").attr("disabled", true);
        } else {
            $("#div_080_of51a_A, #div_080_of51a_D").hide();
            $("#_081_of51a_party_identifier, #_082_of51a_identifier_code, #_083_of51a_party_identifier, #_084_of51a_name_address").attr("disabled", true);
        }

        // MF41A - Available With
        if ($("#_141_mf41a_identifier_code").val() != "") {
            $("#_140_mf41a_available_with_by").val("A").attr("selected", true);
            $("#div_140_mf41a_A").show();
            $("#div_140_mf41a_D").hide();
            $("#_141_mf41a_identifier_code").attr("disabled", false);
            $("#_142_mf41d_name_and_address").attr("disabled", true);
        } else if ($("#_142_mf41d_name_and_address").val() != "") {
            $("#_140_mf41a_available_with_by").val("D").attr("selected", true);
            $("#div_140_mf41a_D").show();
            $("#div_140_mf41a_A").hide();
            $("#_142_mf41d_name_and_address").attr("disabled", false);
            $("#_141_mf41a_identifier_code").attr("disabled", true);
        } else {
            $("#div_140_mf41a_A, #div_140_mf41a_D").hide();
            $("#_141_mf41a_identifier_code, #_142_mf41d_name_and_address").attr("disabled", true);
        }

        // OF42A - Drawee
        if ($("#_161_of42a_party_identifier").val() != "" || $("#_162_of42a_identifier_code").val() != "") {
            $("#_160_of42a_drawee").val("A").attr("selected", true);
            $("#div_160_of42a_A").show();
            $("#div_160_of42a_D").hide();
            $("#_161_of42a_party_identifier, #_162_of42a_identifier_code").attr("disabled", false);
            $("#_163_of42a_party_identifier, #_164_of42a_name_and_address").attr("disabled", true);
        } else if ($("#_163_of42a_party_identifier").val() != "" || $("#_164_of42a_name_and_address").val() != "") {
            $("#_160_of42a_drawee").val("D").attr("selected", true);
            $("#div_160_of42a_D").show();
            $("#div_160_of42a_A").hide();
            $("#_163_of42a_party_identifier, #_164_of42a_name_and_address").attr("disabled", false);
            $("#_161_of42a_party_identifier, #_162_of42a_identifier_code").attr("disabled", true);
        } else {
            $("#div_160_of42a_A, #div_160_of42a_D").hide();
            $("#_161_of42a_party_identifier, #_162_of42a_identifier_code, #_163_of42a_party_identifier, #_164_of42a_name_and_address").attr("disabled", true);
        }

        // OF58a - Requested Confirmation Party
        if ($("#_351_of58a_party_identifier").val() != "" || $("#_352_of58a_identifier_code").val() != "") {
            $("#_350_of58a_requested_confirmation_party").val("A").attr("selected", true);
            $("#div_350_of58a_A").show();
            $("#div_350_of58a_D").hide();
            $("#_351_of58a_party_identifier, #_352_of58a_identifier_code").attr("disabled", false);
            $("#_353_of58a_party_identifier, #_354_of58a_name_address").attr("disabled", true);
        } else if ($("#_353_of58a_party_identifier").val() != "" || $("#_354_of58a_name_address").val() != "") {
            $("#_350_of58a_requested_confirmation_party").val("D").attr("selected", true);
            $("#div_350_of58a_D").show();
            $("#div_350_of58a_A").hide();
            $("#_353_of58a_party_identifier, #_354_of58a_name_address").attr("disabled", false);
            $("#_351_of58a_party_identifier, #_352_of58a_identifier_code").attr("disabled", true);
        } else {
            $("#div_350_of58a_A, #div_350_of58a_D").hide();
            $("#_351_of58a_party_identifier, #_352_of58a_identifier_code, #_353_of58a_party_identifier, #_354_of58a_name_address").attr("disabled", true);
        }

        // OF53a - Reimbursing Bank
        if ($("#_361_of53a_party_identifier").val() != "" || $("#_362_of53a_identifier_code").val() != "") {
            $("#_360_of53a_reimbursing_bank").val("A").attr("selected", true);
            $("#div_360_of53a_A").show();
            $("#div_360_of53a_D").hide();
            $("#_361_of53a_party_identifier, #_362_of53a_identifier_code").attr("disabled", false);
            $("#_363_of53a_party_identifier, #_364_of53a_name_address").attr("disabled", true);
        } else if ($("#_363_of53a_party_identifier").val() != "" || $("#_364_of53a_name_address").val() != "") {
            $("#_360_of53a_reimbursing_bank").val("D").attr("selected", true);
            $("#div_360_of53a_D").show();
            $("#div_360_of53a_A").hide();
            $("#_363_of53a_party_identifier, #_364_of53a_name_address").attr("disabled", false);
            $("#_361_of53a_party_identifier, #_362_of53a_identifier_code").attr("disabled", true);
        } else {
            $("#div_360_of53a_A, #div_360_of53a_D").hide();
            $("#_361_of53a_party_identifier, #_362_of53a_identifier_code, #_363_of53a_party_identifier, #_364_of53a_name_address").attr("disabled", true);
        }

        // OF57a - Advise Through Bank
        if ($("#_381_of57a_party_identifier").val() != "" || $("#_382_of57a_identifier_code").val() != "") {
            $("#_380_of57a_advise_through_bank").val("A").attr("selected", true);
            $("#div_380_of57a_A").show();
            $("#div_380_of57a_B, #div_380_of57a_D").hide();
            $("#_381_of57a_party_identifier, #_382_of57a_identifier_code").attr("disabled", false);
            $("#_383_of57a_party_identifier, #_384_of57a_location, #_385_of57a_party_identifier, #_386_of57a_name_address").attr("disabled", true);
        } else if ($("#_383_of57a_party_identifier").val() != "" || $("#_384_of57a_location").val() != "") {
            $("#_380_of57a_advise_through_bank").val("B").attr("selected", true);
            $("#div_380_of57a_B").show();
            $("#div_380_of57a_A, #div_380_of57a_D").hide();
            $("#_383_of57a_party_identifier, #_384_of57a_location").attr("disabled", false);
            $("#_381_of57a_party_identifier, #_382_of57a_identifier_code, #_385_of57a_party_identifier, #_386_of57a_name_address").attr("disabled", true);
        } else if ($("#_385_of57a_party_identifier").val() != "" || $("#_386_of57a_name_address").val() != "") {
            $("#_380_of57a_advise_through_bank").val("D").attr("selected", true);
            $("#div_380_of57a_D").show();
            $("#div_380_of57a_A, #div_380_of57a_B").hide();
            $("#_385_of57a_party_identifier, #_386_of57a_name_address").attr("disabled", false);
            $("#_381_of57a_party_identifier, #_382_of57a_identifier_code, #_383_of57a_party_identifier, #_384_of57a_location").attr("disabled", true);
        } else {
            $("#div_380_of57a_A, #div_380_of57a_B, #div_380_of57a_D").hide();
            $("#_381_of57a_party_identifier, #_382_of57a_identifier_code, #_383_of57a_party_identifier, #_384_of57a_location, #_385_of57a_party_identifier, #_386_of57a_name_address").attr("disabled", true);
        }

        /* ========== VALIDATE BUTTON ========== */
        $("#btn-validate").click(function () {
            let isValid = $("#form_mt700").valid();
            if (isValid) {
                alert("All mandatory fields are valid! Click Save to proceed.");
            }
        });

        /* ========== SUBMIT HANDLER (REMOVED - Handled by form onsubmit) ========== */
        // Note: Submit validation is now handled by the form's onsubmit attribute in mt700.jsp
        // which calls validateMT700() from mt700.js
        
    });
</script>