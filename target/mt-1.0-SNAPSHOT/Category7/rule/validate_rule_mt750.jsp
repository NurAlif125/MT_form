<%-- 
    Document   : validate_rule_mt750
    Created on : Sep 23, 2025, 11:10:25 AM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function () {

    // ========== Custom Validator Methods ==========
    
    // Regex validator (reusable)
    $.validator.addMethod("regex", function(value, element, pattern) {
        return this.optional(element) || pattern.test(value);
    }, "Format tidak valid");

    // T26: Must not start or end with '/' and must not contain two consecutive slashes '//'
    $.validator.addMethod("noSlashEdges", function(value, element) {
        if (this.optional(element)) return true;
        if (value.length === 0) return true;
        if (/^\/|\/$/.test(value)) return false;
        if (/\/\//.test(value)) return false;
        return true;
    }, "Tidak boleh diawali/diakhiri '/', atau mengandung '//' (Error T26)");

    // T52: ISO 4217 Currency Code (3 uppercase letters)
    $.validator.addMethod("isCurrency", function(value, element) {
        if (this.optional(element)) return true;
        const ISO4217 = [
            "USD", "EUR", "JPY", "GBP", "AUD", "CAD", "CHF", "CNY", "SEK", "NZD", 
            "IDR", "SGD", "HKD", "KRW", "NOK", "MXN", "INR", "RUB", "ZAR", "TRY", 
            "BRL", "PLN", "DKK", "MYR", "PHP", "THB", "TWD", "AED", "SAR", "ILS", 
            "CZK", "HUF", "CLP", "PKR", "BDT", "NGN", "VND", "BHD", "JOD", "KWD", 
            "OMR", "TND", "LYD", "IQD"
        ];
        return /^[A-Z]{3}$/.test(value) && ISO4217.includes(value.toUpperCase());
    }, "Format mata uang harus 3 huruf ISO 4217 yang valid (Error T52)");

    // SWIFT Amount Format: n,dd (comma as decimal separator)
    // T40: Comma is mandatory
    // C03: Integer part must have at least one digit
    // T43: Decimal digits must not exceed allowed decimals for currency
    $.validator.addMethod("isSwiftAmount", function(value, element) {
        if (this.optional(element)) return true;
        // Must contain comma
        if (!/,/.test(value)) return false;
        // Pattern: digits, comma, 1-3 decimal digits
        if (!/^[0-9]+,[0-9]{1,3}$/.test(value)) return false;
        // Integer part must be at least 1 digit
        const parts = value.split(',');
        if (parts[0].length === 0) return false;
        return true;
    }, "Format amount harus n,dd (gunakan koma sebagai desimal, Error T40/C03/T43)");

    // C05, T27, T28, T29, T45: BIC validation (basic format check)
    $.validator.addMethod("isBIC", function(value, element) {
        if (this.optional(element)) return true;
        // BIC format: 4 letters + 2 letters + 2 alphanumeric + optional 3 alphanumeric
        return /^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$/.test(value.toUpperCase());
    }, "Format BIC tidak valid (Error C05, T27, T28, T29, T45)");

    // Validate structured narrative fields (71D, 73A)
    // Max 6 lines, each line max 35 characters
    // If line starts with '/', must follow pattern /CODE/ or //
    $.validator.addMethod("isChargesField", function(value, element) {
        if (this.optional(element)) return true;
        if (value.length > 210) return false; // 6 lines * 35 chars
        
        const lines = value.split(/\r?\n/);
        if (lines.length > 6) return false;
        
        for (let i = 0; i < lines.length; i++) {
            const ln = lines[i];
            if (ln.length > 35) return false;
            if (ln.length === 0) continue;
            
            // If line starts with '/', validate structure
            if (/^\//.test(ln)) {
                // Allow /CODE/, /8a/, or // continuation
                if (!(/^\/[A-Z0-9]{1,8}\//.test(ln) || /^\/\//.test(ln))) {
                    return false;
                }
            }
        }
        return true;
    }, "Format charges tidak valid (maks 6 baris, tiap baris ≤35 karakter)");

    // Validate 72Z field (Sender to Receiver Information)
    // Similar to charges field but with /8c/ code pattern
    $.validator.addMethod("is72ZField", function(value, element) {
        if (this.optional(element)) return true;
        if (value.length > 210) return false;
        
        const lines = value.split(/\r?\n/);
        if (lines.length > 6) return false;
        
        for (let ln of lines) {
            if (ln.length > 35) return false;
            if (/^\//.test(ln) && !(/^\/8c\//.test(ln) || /^\/[A-Z0-9]{2,12}\//.test(ln) || /^\/\//.test(ln))) {
                return false;
            }
        }
        return true;
    }, "Format 72Z tidak valid (maks 6 baris, tiap baris ≤35 karakter)");

    // Validate 77J field (Discrepancies)
    // Max 70 lines, each line max 50 characters
    $.validator.addMethod("is77JField", function(value, element) {
        if (this.optional(element)) return true;
        if (value.length > 3500) return false; // 70 lines * 50 chars
        
        const lines = value.split(/\r?\n/);
        if (lines.length > 70) return false;
        
        for (let ln of lines) {
            if (ln.length > 50) return false;
            if (/^\//.test(ln) && !(/^\/8a\//.test(ln) || /^\/[A-Z0-9]{2,12}\//.test(ln) || /^\/\//.test(ln))) {
                return false;
            }
        }
        return true;
    }, "Format 77J tidak valid (maks 70 baris, tiap baris ≤50 karakter)");

    // ========== Main Validator Setup ==========
    
    let validator = $("#form_mt750").validate({
        ignore: [],               // Don't ignore hidden fields
        onkeyup: false,          // Disable validation on keyup
        onfocusout: false,       // Disable validation on focus out
        
        rules: {
            // Header fields (if present in your form)
            sender_logical_terminal: { required: false },
            receiver_institution: { required: false },
            priority: { required: false },

            // ===== MANDATORY FIELDS =====
            
            // Field 20: Sender's Reference (M)
            _010_mf20_sender_reference: { 
                required: true, 
                maxlength: 16, 
                noSlashEdges: true 
            },
            
            // Field 21: Related Reference (M)
            _020_mf21_related_reference: { 
                required: true, 
                maxlength: 16, 
                noSlashEdges: true 
            },
            
            // Field 32B: Principal Amount - Currency (M)
            _030_mf32b_currency: { 
                required: true, 
                isCurrency: true 
            },
            
            // Field 32B: Principal Amount - Amount (M)
            _031_mf32b_amount: { 
                required: true, 
                isSwiftAmount: true, 
                maxlength: 15 
            },
            
            // Field 77J: Discrepancies (M)
            _100_mf77j_discrepancies: { 
                required: true, 
                is77JField: true 
            },

            // ===== OPTIONAL FIELDS =====
            
            // Field 33B: Additional Amount
            _040_of33b_currency: { isCurrency: true },
            _041_of33b_amount: { isSwiftAmount: true, maxlength: 15 },
            
            // Field 71D: Charges to be Deducted
            _050_of71d_charges_to_be_deducted: { isChargesField: true },
            
            // Field 73A: Charges to be Added
            _060_of73a_charges_to_be_added: { isChargesField: true },
            
            // Field 34B: Total Amount to be Paid
            _070_of34b_currency: { isCurrency: true },
            _071_of34b_amount: { isSwiftAmount: true, maxlength: 15 },
            
            // Field 57a: Account With Bank (subfields)
            _081_of57a_party_identifier: { maxlength: 35 },
            _082_of57a_identifier_code: { maxlength: 11, isBIC: true },
            _083_of57a_party_identifier: { maxlength: 35 },
            _084_of57a_location: { maxlength: 35 },
            _085_of57a_party_identifier: { maxlength: 35 },
            _086_of57a_name_address: { maxlength: 140 },
            
            // Field 72Z: Sender to Receiver Information
            _090_of72z_sender_to_receiver_information: { is72ZField: true }
        },
        
        messages: {
            // Mandatory fields
            _010_mf20_sender_reference: { 
                required: "Field 20 (Sender's Reference) wajib diisi", 
                maxlength: "Maksimal 16 karakter", 
                noSlashEdges: "Tidak boleh diawali/diakhiri '/', atau mengandung '//' (Error T26)" 
            },
            _020_mf21_related_reference: { 
                required: "Field 21 (Related Reference) wajib diisi", 
                maxlength: "Maksimal 16 karakter", 
                noSlashEdges: "Tidak boleh diawali/diakhiri '/', atau mengandung '//' (Error T26)" 
            },
            _030_mf32b_currency: { 
                required: "Field 32B Currency wajib diisi", 
                isCurrency: "Format mata uang 3 huruf ISO 4217 yang valid (Error T52)" 
            },
            _031_mf32b_amount: { 
                required: "Field 32B Amount wajib diisi", 
                isSwiftAmount: "Format amount harus n,dd (contoh: 123,45, Error T40/C03/T43)" 
            },
            _100_mf77j_discrepancies: { 
                required: "Field 77J (Discrepancies) wajib diisi", 
                is77JField: "Format 77J tidak valid (maks 70 baris, tiap baris ≤50 karakter)" 
            },
            
            // Optional fields
            _040_of33b_currency: { 
                isCurrency: "Format mata uang 3 huruf ISO 4217 yang valid (Error T52)" 
            },
            _041_of33b_amount: { 
                isSwiftAmount: "Format amount harus n,dd (contoh: 123,45, Error T40/C03/T43)" 
            },
            _050_of71d_charges_to_be_deducted: { 
                isChargesField: "Format 71D tidak valid (maks 6 baris, tiap baris ≤35 karakter)" 
            },
            _060_of73a_charges_to_be_added: { 
                isChargesField: "Format 73A tidak valid (maks 6 baris, tiap baris ≤35 karakter)" 
            },
            _070_of34b_currency: { 
                isCurrency: "Format mata uang 3 huruf ISO 4217 yang valid (Error T52)" 
            },
            _071_of34b_amount: { 
                isSwiftAmount: "Format amount harus n,dd (contoh: 123,45, Error T40/C03/T43)" 
            },
            _082_of57a_identifier_code: { 
                isBIC: "Format BIC tidak valid (Error C05, T27, T28, T29, T45)" 
            },
            _090_of72z_sender_to_receiver_information: { 
                is72ZField: "Format 72Z tidak valid (maks 6 baris, tiap baris ≤35 karakter)" 
            }
        },
        
        errorPlacement: function (error, element) {
            error.insertAfter(element);
            $("#tab-validate").removeAttr("hidden");
        },
        
        showErrors: function (errorMap, errorList) {
            this.defaultShowErrors();
            $("#tab-validate").removeAttr("hidden");

            // Hide all content tabs and show validate tab
            $("#view1, #view2, #view3, #view4, #view5, #view6, #view7").css("display", "none");
            $("#view8").css("display", "block");
            
            // Update tab selection
            $('.tabs li').removeClass("selected").removeAttr('class');
            $('#tab-validate').addClass("selected");

            // Build error table
            let errorContainer = document.getElementById("error-container");
            let tableHTML = `<table border="0" style="width:100% !important; caption-side: bottom; font-size:8pt !important; border-collapse: collapse; border:1px gray solid;">
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

            // Click-to-focus behavior
            document.querySelectorAll(".error__row").forEach(row => {
                row.addEventListener("click", function () {
                    let inputId = this.getAttribute("data-input-id");
                    let tabContentGroup = this.getAttribute("content-body");
                    
                    let input = document.getElementById(inputId);
                    if (input) {
                        // Switch to appropriate tab
                        if (tabContentGroup === "Header") {
                            $("#view2, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                            $("#view1").css("display", "block");
                            $('.tabs li').removeClass("selected").removeAttr('class');
                            $('#tab-view1').addClass("selected");
                        } else if (tabContentGroup === "Body") {
                            $("#view1, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                            $("#view2").css("display", "block");
                            $('.tabs li').removeClass("selected").removeAttr('class');
                            $('#tab-view2').addClass("selected");
                        }
                        
                        input.focus();
                    }
                });
            });
        }
    });

    // ========== Helper Functions ==========
    
    function isEmptyVal(selector) {
        let el = $(selector);
        if (el.length === 0) return true;
        return $.trim(el.val() || "") === "";
    }

    // ========== Validate Button Handler (Optional - for manual validation) ==========
    
    // Note: Main validation is handled by mt750.js via form onsubmit event
    // This button handler is optional for manual validation without submit
    $("#btn-validate").click(function () {
        let isValid = $("#form_mt750").valid();
        
        if (!isValid) {
            return false;
        }
        
        // Additional validations (already handled by mt750.js but included here for completeness)
        if (!validateConditional57a()) return false;
        if (!validateRuleC1()) return false;
        if (!validateRuleC2()) return false;
        
        alert("All inputs are valid!");
        return true;
    });

    // ===== Conditional Validation: Field 57a =====
    function validateConditional57a() {
        let opt57 = $.trim($("#_080_of57a_account_with_bank").val() || "");
        
        if (opt57 === "A") {
            if (isEmptyVal("#_082_of57a_identifier_code")) {
                alert("Field 57a Option A: Identifier Code (BIC) wajib diisi");
                $("#_082_of57a_identifier_code").focus();
                return false;
            }
            
            let bic = $.trim($("#_082_of57a_identifier_code").val());
            if (!/^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$/.test(bic.toUpperCase())) {
                alert("Field 57a: Identifier Code harus BIC yang valid (Error C05, T27, T28, T29, T45)");
                $("#_082_of57a_identifier_code").focus();
                return false;
            }
        } else if (opt57 === "B") {
            if (isEmptyVal("#_084_of57a_location")) {
                alert("Field 57a Option B: Location wajib diisi");
                $("#_084_of57a_location").focus();
                return false;
            }
        } else if (opt57 === "D") {
            if (isEmptyVal("#_086_of57a_name_address")) {
                alert("Field 57a Option D: Name & Address wajib diisi");
                $("#_086_of57a_name_address").focus();
                return false;
            }
        }
        
        return true;
    }

    // ===== Network Rule C1 =====
    function validateRuleC1() {
        let present33B = !isEmptyVal("#_040_of33b_currency") || !isEmptyVal("#_041_of33b_amount");
        let present71D = !isEmptyVal("#_050_of71d_charges_to_be_deducted");
        let present73A = !isEmptyVal("#_060_of73a_charges_to_be_added");
        
        if (present33B || present71D || present73A) {
            if (isEmptyVal("#_070_of34b_currency") || isEmptyVal("#_071_of34b_amount")) {
                alert("Rule C1 (Error C13): Jika field 33B, 71D, atau 73A ada, maka field 34B (Total Amount to be Paid) harus diisi dengan Currency dan Amount");
                $("#_070_of34b_currency").focus();
                return false;
            }
        }
        
        return true;
    }

    // ===== Network Rule C2 =====
    function validateRuleC2() {
        if (!isEmptyVal("#_070_of34b_currency")) {
            let c32 = $.trim($("#_030_mf32b_currency").val() || "").toUpperCase();
            let c34 = $.trim($("#_070_of34b_currency").val() || "").toUpperCase();
            
            if (c32 !== "" && c34 !== "" && c32 !== c34) {
                alert("Rule C2 (Error C02): Currency pada field 32B dan 34B harus sama");
                $("#_070_of34b_currency").focus();
                return false;
            }
        }
        
        return true;
    }

    // ========== Toggle 57a Option Handling ==========
    
    function toggle57aForValidation() {
        let opt = $.trim($("#_080_of57a_account_with_bank").val() || "");
        
        if (opt === "A") {
            $("#_081_of57a_party_identifier").prop("disabled", false);
            $("#_082_of57a_identifier_code").prop("disabled", false);
            $("#_083_of57a_party_identifier").prop("disabled", true);
            $("#_084_of57a_location").prop("disabled", true);
            $("#_085_of57a_party_identifier").prop("disabled", true);
            $("#_086_of57a_name_address").prop("disabled", true);
        } else if (opt === "B") {
            $("#_083_of57a_party_identifier").prop("disabled", false);
            $("#_084_of57a_location").prop("disabled", false);
            $("#_081_of57a_party_identifier").prop("disabled", true);
            $("#_082_of57a_identifier_code").prop("disabled", true);
            $("#_085_of57a_party_identifier").prop("disabled", true);
            $("#_086_of57a_name_address").prop("disabled", true);
        } else if (opt === "D") {
            $("#_085_of57a_party_identifier").prop("disabled", false);
            $("#_086_of57a_name_address").prop("disabled", false);
            $("#_081_of57a_party_identifier").prop("disabled", true);
            $("#_082_of57a_identifier_code").prop("disabled", true);
            $("#_083_of57a_party_identifier").prop("disabled", true);
            $("#_084_of57a_location").prop("disabled", true);
        } else {
            $("#_081_of57a_party_identifier").prop("disabled", true);
            $("#_082_of57a_identifier_code").prop("disabled", true);
            $("#_083_of57a_party_identifier").prop("disabled", true);
            $("#_084_of57a_location").prop("disabled", true);
            $("#_085_of57a_party_identifier").prop("disabled", true);
            $("#_086_of57a_name_address").prop("disabled", true);
        }
    }

    // Attach change handler to 57a select
    $("#_080_of57a_account_with_bank").on("change", function () {
        toggle57aForValidation();
    });
    
    // Run once on page load
    toggle57aForValidation();

    // ========== UX Enhancements ==========
    
    // Trim narrative fields on blur
    ["#_050_of71d_charges_to_be_deducted", 
     "#_060_of73a_charges_to_be_added", 
     "#_090_of72z_sender_to_receiver_information", 
     "#_100_mf77j_discrepancies"].forEach(function(sel) {
        $(sel).on("blur", function () {
            $(this).val($.trim($(this).val() || ""));
        });
    });

});
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<!-- ========== Rule View: Initialize Field States on Page Load ========== -->
<script language="javascript">
$(document).ready(function () {
    
    // ===== Initialize Field 57a based on existing values =====
    if ($("#_081_of57a_party_identifier").val() != "" || $("#_082_of57a_identifier_code").val() != "") {
        $("#_080_of57a_account_with_bank").val("A").attr("selected", true);
        $("#div_080_of57a_A").show();
        $("#div_080_of57a_B").hide();
        $("#div_080_of57a_D").hide();
        $("#_081_of57a_party_identifier").attr("disabled", false);
        $("#_082_of57a_identifier_code").attr("disabled", false);
        $("#_083_of57a_party_identifier").attr("disabled", true);
        $("#_084_of57a_location").attr("disabled", true);
        $("#_085_of57a_party_identifier").attr("disabled", true);
        $("#_086_of57a_name_address").attr("disabled", true);
    } else if ($("#_083_of57a_party_identifier").val() != "" || $("#_084_of57a_location").val() != "") {
        $("#_080_of57a_account_with_bank").val("B").attr("selected", true);
        $("#div_080_of57a_A").hide();
        $("#div_080_of57a_B").show();
        $("#div_080_of57a_D").hide();
        $("#_081_of57a_party_identifier").attr("disabled", true);
        $("#_082_of57a_identifier_code").attr("disabled", true);
        $("#_083_of57a_party_identifier").attr("disabled", false);
        $("#_084_of57a_location").attr("disabled", false);
        $("#_085_of57a_party_identifier").attr("disabled", true);
        $("#_086_of57a_name_address").attr("disabled", true);
    } else if ($("#_085_of57a_party_identifier").val() != "" || $("#_086_of57a_name_address").val() != "") {
        $("#_080_of57a_account_with_bank").val("D").attr("selected", true);
        $("#div_080_of57a_A").hide();
        $("#div_080_of57a_B").hide();
        $("#div_080_of57a_D").show();
        $("#_081_of57a_party_identifier").attr("disabled", true);
        $("#_082_of57a_identifier_code").attr("disabled", true);
        $("#_083_of57a_party_identifier").attr("disabled", true);
        $("#_084_of57a_location").attr("disabled", true);
        $("#_085_of57a_party_identifier").attr("disabled", false);
        $("#_086_of57a_name_address").attr("disabled", false);
    } else {
        $("#div_080_of57a_A").hide();
        $("#div_080_of57a_B").hide();
        $("#div_080_of57a_D").hide();
        $("#_081_of57a_party_identifier").attr("disabled", true);
        $("#_082_of57a_identifier_code").attr("disabled", true);
        $("#_083_of57a_party_identifier").attr("disabled", true);
        $("#_084_of57a_location").attr("disabled", true);
        $("#_085_of57a_party_identifier").attr("disabled", true);
        $("#_086_of57a_name_address").attr("disabled", true);
    }
    
});
</script>
