<%-- 
    Document   : validate_rule_mt754
    Created on : Sep 24, 2025, 10:44:41 AM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
$(document).ready(function () {

    /* ===================== CUSTOM VALIDATORS ===================== */
    
    // Custom validator: Regex pattern matching
    $.validator.addMethod("regex", function(value, element, param) {
        return this.optional(element) || param.test(value);
    }, "Invalid format");
    
    // Custom validator: Currency code validation (T52)
    $.validator.addMethod("validCurrency", function(value, element) {
        if (!value || value.trim() === "") return true; // Optional
        return window.isValidCurrency ? window.isValidCurrency(value) : true;
    }, "Invalid ISO 4217 currency code (Error T52)");
    
    // Custom validator: BIC validation (T27, T28, T29, C05)
    $.validator.addMethod("validBIC", function(value, element) {
        if (!value || value.trim() === "") return true; // Optional
        return window.isValidBIC ? window.isValidBIC(value) : true;
    }, "Invalid BIC format - must be 8 or 11 characters (Error T27/T28/T29)");
    
    // Custom validator: Amount validation by currency (T40, T43, C03)
    $.validator.addMethod("validAmount", function(value, element, params) {
        if (!value || value.trim() === "") return true; // Optional
        
        // Get currency from specified field
        const currencyField = $(params.currencyField);
        const currency = currencyField.val();
        
        if (!currency) return true; // If no currency yet, skip amount validation
        
        if (window.validateAmountByCurrency) {
            const result = window.validateAmountByCurrency(currency, value);
            return result.valid;
        }
        
        return true;
    }, "Invalid amount format (Error T40/T43/C03)");
    
    // Custom validator: Date validation (T50)
    $.validator.addMethod("validDate", function(value, element, allowEmpty) {
        if (allowEmpty && (!value || value.trim() === "")) return true;
        if (!value || value.trim() === "") return false;
        
        if (!/^\d{6}$/.test(value)) return false;
        
        return window.isYYMMDD ? window.isYYMMDD(value) : true;
    }, "Invalid date - must be YYMMDD format (Error T50)");
    
    // Custom validator: Party identifier format
    $.validator.addMethod("validPartyId", function(value, element) {
        if (!value || value.trim() === "") return true; // Optional
        return window.isValidPartyIdentifier ? window.isValidPartyIdentifier(value) : true;
    }, "Party identifier must start with single slash '/'");

    /* ===================== FORM VALIDATION RULES ===================== */

    let validator = $("#form_mt754").validate({
        ignore: [],
        onkeyup: false,
        onfocusout: false,
        rules: {
            /* ========== MANDATORY BODY FIELDS ========== */
            
            // Field 20: Sender's Reference (T26)
            _010_mf20_sender_reference: {
                required: true,
                maxlength: 16,
                regex: /^(?!\/)(?!.*\/\/)(?!.*\/$).+$/
            },
            
            // Field 21: Related Reference (T26)
            _020_mf21_related_reference: {
                required: true,
                maxlength: 16,
                regex: /^(?!\/)(?!.*\/\/)(?!.*\/$).+$/
            },

            /* ========== FIELD 32a - Principal Amount (MANDATORY) ========== */
            
            _030_mf32a_principal_amount_paid_accepted_negotiated: {
                required: true
            },
            
            // Option A: Date (T50)
            _031_mf32a_date: {
                required: function() {
                    return $("#_030_mf32a_principal_amount_paid_accepted_negotiated").val() === "A";
                },
                validDate: false // false = not allow empty
            },
            
            // Option A: Currency (T52)
            _032_mf32a_currency: {
                required: function() {
                    return $("#_030_mf32a_principal_amount_paid_accepted_negotiated").val() === "A";
                },
                validCurrency: true,
                regex: /^[A-Z]{3}$/
            },
            
            // Option A: Amount (T40, T43, C03)
            _033_mf32a_amount: {
                required: function() {
                    return $("#_030_mf32a_principal_amount_paid_accepted_negotiated").val() === "A";
                },
                validAmount: {
                    currencyField: "#_032_mf32a_currency"
                }
            },
            
            // Option B: Currency (T52)
            _034_mf32a_currency: {
                required: function() {
                    return $("#_030_mf32a_principal_amount_paid_accepted_negotiated").val() === "B";
                },
                validCurrency: true,
                regex: /^[A-Z]{3}$/
            },
            
            // Option B: Amount (T40, T43, C03)
            _035_mf32a_amount: {
                required: function() {
                    return $("#_030_mf32a_principal_amount_paid_accepted_negotiated").val() === "B";
                },
                validAmount: {
                    currencyField: "#_034_mf32a_currency"
                }
            },

            /* ========== FIELD 33B - Additional Amount (OPTIONAL) ========== */
            
            _040_of33b_currency: {
                validCurrency: true,
                regex: /^[A-Z]{3}$/
            },
            
            _041_of33b_amount: {
                validAmount: {
                    currencyField: "#_040_of33b_currency"
                }
            },

            /* ========== FIELD 71D - Charges Deducted (OPTIONAL) ========== */
            
            _050_of71d_charges_deducted: {
                maxlength: 210
            },

            /* ========== FIELD 73A - Charges Added (OPTIONAL) ========== */
            
            _060_of73a_charges_added: {
                maxlength: 210
            },

            /* ========== FIELD 34a - Total Amount Claimed (OPTIONAL) ========== */
            
            // Option A: Date (T50) - OPTIONAL
            _071_of34a_date: {
                validDate: true // true = allow empty
            },
            
            // Option A: Currency (T52)
            _072_of34a_currency: {
                required: function() {
                    return $("#_070_of34a_total_amount_claimed").val() === "A";
                },
                validCurrency: true,
                regex: /^[A-Z]{3}$/
            },
            
            // Option A: Amount (T40, T43, C03)
            _073_of34a_amount: {
                required: function() {
                    return $("#_070_of34a_total_amount_claimed").val() === "A";
                },
                validAmount: {
                    currencyField: "#_072_of34a_currency"
                }
            },
            
            // Option B: Currency (T52)
            _074_of34a_currency: {
                required: function() {
                    return $("#_070_of34a_total_amount_claimed").val() === "B";
                },
                validCurrency: true,
                regex: /^[A-Z]{3}$/
            },
            
            // Option B: Amount (T40, T43, C03)
            _075_of34a_amount: {
                required: function() {
                    return $("#_070_of34a_total_amount_claimed").val() === "B";
                },
                validAmount: {
                    currencyField: "#_074_of34a_currency"
                }
            },

            /* ========== FIELD 53a - Reimbursing Bank (OPTIONAL) ========== */
            
            // Option A
            _081_of53a_party_identifier: {
                maxlength: 35,
                validPartyId: true
            },
            _082_of53a_identifier_code: {
                maxlength: 11,
                validBIC: true
            },
            
            // Option B
            _083_of53a_party_identifier: {
                maxlength: 35,
                validPartyId: true
            },
            _084_of53a_location: {
                maxlength: 35
            },
            
            // Option D
            _085_of53a_party_identifier: {
                maxlength: 35,
                validPartyId: true
            },
            _086_of53a_name_address: {
                maxlength: 140
            },

            /* ========== FIELD 57a - Account With Bank (OPTIONAL) ========== */
            
            // Option A
            _091_of57a_party_identifier: {
                maxlength: 35,
                validPartyId: true
            },
            _092_of57a_identifier_code: {
                maxlength: 11,
                validBIC: true
            },
            
            // Option B
            _093_of57a_party_identifier: {
                maxlength: 35,
                validPartyId: true
            },
            _094_of57a_location: {
                maxlength: 35
            },
            
            // Option D
            _095_of57a_party_identifier: {
                maxlength: 35,
                validPartyId: true
            },
            _096_of57a_name_address: {
                maxlength: 140
            },

            /* ========== FIELD 58a - Beneficiary Bank (OPTIONAL) ========== */
            
            // Option A
            _101_of58a_party_identifier: {
                maxlength: 35,
                validPartyId: true
            },
            _102_of58a_identifier_code: {
                maxlength: 11,
                validBIC: true
            },
            
            // Option D
            _103_of58a_party_identifier: {
                maxlength: 35,
                validPartyId: true
            },
            _104_of58a_name_address: {
                maxlength: 140
            },

            /* ========== FIELD 72Z / 77 - Narrative (OPTIONAL) ========== */
            
            _110_of72z_sender_to_receiver_information: {
                maxlength: 210
            },
            
            _120_of77_narrative: {
                maxlength: 1750
            }
        },

        messages: {
            // Field 20
            _010_mf20_sender_reference: {
                required: "Field 20 (Sender's Reference) is mandatory",
                maxlength: "Maximum 16 characters",
                regex: "Cannot start/end with '/' or contain '//' (Error T26)"
            },

            // Field 21
            _020_mf21_related_reference: {
                required: "Field 21 (Related Reference) is mandatory",
                maxlength: "Maximum 16 characters",
                regex: "Cannot start/end with '/' or contain '//' (Error T26)"
            },

            // Field 32a
            _030_mf32a_principal_amount_paid_accepted_negotiated: {
                required: "Field 32a option must be selected"
            },
            _031_mf32a_date: {
                required: "Date is required for Option A"
            },
            _032_mf32a_currency: {
                required: "Currency is required for Option A",
                regex: "Must be 3-letter code"
            },
            _033_mf32a_amount: {
                required: "Amount is required for Option A"
            },
            _034_mf32a_currency: {
                required: "Currency is required for Option B",
                regex: "Must be 3-letter code"
            },
            _035_mf32a_amount: {
                required: "Amount is required for Option B"
            },

            // Field 34a
            _072_of34a_currency: {
                required: "Currency is required for Option A",
                regex: "Must be 3-letter code"
            },
            _073_of34a_amount: {
                required: "Amount is required for Option A"
            },
            _074_of34a_currency: {
                required: "Currency is required for Option B",
                regex: "Must be 3-letter code"
            },
            _075_of34a_amount: {
                required: "Amount is required for Option B"
            }
        },

        errorPlacement: function (error, element) {
            error.insertAfter(element);
            $("#tab-validate").removeAttr("hidden");
        },

        showErrors: function (errorMap, errorList) {
            this.defaultShowErrors();
            $("#tab-validate").removeAttr("hidden");

            // Switch to validation tab if exists
            if ($("#view8").length > 0) {
                $("#view1, #view2, #view3, #view4, #view5, #view6, #view7").css("display", "none");
                $("#view8").css("display", "block");
                $('#tab-view1, #tab-view2, #tab-view3, #tab-view4, #tab-view5, #tab-view6, #tab-view7').removeClass("selected");
                $('#tab-validate').addClass("selected");
            }

            let errorContainer = document.getElementById("error-container");

            if (errorList.length === 0) {
                if (errorContainer) errorContainer.innerHTML = "";
                return;
            }

            if (!errorContainer) return;

            let tableHTML = `<table border="0" style="width:100% !important; caption-side: bottom; font-size:8pt !important; border-collapse: collapse; border:1px gray solid;">
                                <tr style="background:#d6d6d6;">
                                <th style="padding:5px;">Type</th>
                                <th style="padding:5px;">Location</th>
                                <th style="padding:5px;">Field</th>
                                <th style="padding:5px;">Message</th></tr>`;

            errorList.forEach(errors => {
                let inputID = errors.element.id || "";
                let locationTab = errors.element.getAttribute("location") || "Body";
                let inputType = errors.element.getAttribute("input_type") || inputID;

                tableHTML += '<tr class="error__row" data-input-id="' + inputID + '" content-body="' + locationTab + '" onmouseover="this.style.background=\'#f6f6f6\'" onmouseout="this.style.backgroundColor=\'transparent\'" style="cursor:pointer;">';
                tableHTML += '<td style="padding: 5px;">Error</td>';
                tableHTML += '<td style="padding: 5px;">' + locationTab + '</td>';
                tableHTML += '<td style="padding: 5px;">' + inputType + '</td>';
                tableHTML += '<td style="padding: 5px;">' + errors.message + '</td></tr>';
            });

            tableHTML += `</table>`;
            errorContainer.innerHTML = tableHTML;

            // Click handler for error rows
            document.querySelectorAll(".error__row").forEach(row => {
                row.addEventListener("click", function () {
                    let targetRow = this;
                    let inputId = this.getAttribute("data-input-id");
                    let tabContentGroup = this.getAttribute("content-body");

                    if (targetRow) {
                        let input = document.getElementById(inputId);
                        if (input) {
                            if (tabContentGroup == "Header") {
                                $("#view2, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                $("#view1").css("display", "block");
                                $('#tab-view1').addClass("selected");
                                $('#tab-view2, #tab-view3, #tab-view4, #tab-view5, #tab-view6, #tab-view7, #tab-validate').removeClass("selected");
                            } else if (tabContentGroup == "Body") {
                                $("#view1, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                $("#view2").css("display", "block");
                                $('#tab-view2').addClass("selected");
                                $('#tab-view1, #tab-view3, #tab-view4, #tab-view5, #tab-view6, #tab-view7, #tab-validate').removeClass("selected");
                            }
                            input.focus();
                        }
                    }
                });
            });
        }
    });

    /* ===================== EXTRA MT754 BUSINESS RULES ===================== */
    
    function extraMT754Checks() {
        console.log('Performing extra MT754 business rule checks...');
        
        // RULE C1: Either field 72Z or 77 may be present, but not both (Error C19)
        let f72z = $("#_110_of72z_sender_to_receiver_information").val().trim();
        let f77 = $("#_120_of77_narrative").val().trim();
        
        if (f72z !== "" && f77 !== "") {
            alert("Error C19 (Rule C1): Either field 72Z or 77 may be present, but not both.");
            $("#_110_of72z_sender_to_receiver_information").focus();
            return false;
        }

        // RULE C2: Either field 53a or 57a may be present, but not both (Error C14)
        let f53a = $("#_080_of53a_reimbursing_bank").val();
        let f57a = $("#_090_of57a_account_with_bank").val();
        
        if (f53a && f57a) {
            alert("Error C14 (Rule C2): Either field 53a (Reimbursing Bank) or 57a (Account With Bank) may be present, but not both.");
            $("#_080_of53a_reimbursing_bank").focus();
            return false;
        }

        // RULE C3: Currency code in 32a and 34a must be the same (Error C02)
        let opt32a = $("#_030_mf32a_principal_amount_paid_accepted_negotiated").val();
        let opt34a = $("#_070_of34a_total_amount_claimed").val();
        
        if (opt34a) {
            let currency32a = "";
            if (opt32a === "A") {
                currency32a = $("#_032_mf32a_currency").val().trim();
            } else if (opt32a === "B") {
                currency32a = $("#_034_mf32a_currency").val().trim();
            }

            let currency34a = "";
            if (opt34a === "A") {
                currency34a = $("#_072_of34a_currency").val().trim();
            } else if (opt34a === "B") {
                currency34a = $("#_074_of34a_currency").val().trim();
            }

            if (currency32a && currency34a && currency32a !== currency34a) {
                alert("Error C02 (Rule C3): Currency code in field 32a and 34a must be the same.");
                if (opt34a === "A") {
                    $("#_072_of34a_currency").focus();
                } else {
                    $("#_074_of34a_currency").focus();
                }
                return false;
            }
        }

        // USAGE RULE: If 33B currency differs from 32a, explanation required in 72Z or 77
        let currency33b = $("#_040_of33b_currency").val().trim();
        let amount33b = $("#_041_of33b_amount").val().trim();
        
        if (currency33b && amount33b) {
            let currency32a = "";
            if (opt32a === "A") {
                currency32a = $("#_032_mf32a_currency").val().trim();
            } else if (opt32a === "B") {
                currency32a = $("#_034_mf32a_currency").val().trim();
            }

            if (currency33b !== currency32a) {
                if (f72z === "" && f77 === "") {
                    alert("Usage Rule: If field 33B currency differs from 32a, explanation must be provided in field 72Z or 77.");
                    $("#_040_of33b_currency").focus();
                    return false;
                }
            }
        }

        console.log('Extra business rule checks passed');
        return true;
    }

    /* ===================== VALIDATE BUTTON (if exists) ===================== */
    
    $("#btn-validate").click(function () {
        console.log('Validate button clicked');
        
        let isJQueryValid = $("#form_mt754").valid();
        console.log('jQuery validation result:', isJQueryValid);
        
        if (isJQueryValid) {
            let isExtraValid = extraMT754Checks();
            console.log('Extra checks result:', isExtraValid);
            
            if (isExtraValid) {
                alert("All inputs are valid!");
            }
        } else {
            alert("There are validation errors. Please check the form.");
        }
    });

    /* ===================== FORM SUBMIT HANDLER ===================== */
    
    $("#form_mt754").submit(function (e) {
        console.log('Form submit triggered');
        
        // Prevent default submission
        e.preventDefault();
        
        // Step 1: jQuery validation
        let isJQueryValid = $("#form_mt754").valid();
        console.log('jQuery validation result:', isJQueryValid);
        
        if (!isJQueryValid) {
            alert("There are validation errors. Please fix them before saving.");
            return false;
        }
        
        // Step 2: Extra MT754 business rules
        let isExtraValid = extraMT754Checks();
        console.log('Extra checks result:', isExtraValid);
        
        if (!isExtraValid) {
            return false;
        }
        
        // Step 3: Final comprehensive validation using validateMT754()
        if (window.validateMT754) {
            let isFinalValid = window.validateMT754();
            console.log('Final validation result:', isFinalValid);
            
            if (!isFinalValid) {
                return false;
            }
        }
        
        // Step 4: Confirm before submission
        let confirmed = confirm('Do you want to save this MT754 data?');
        
        if (confirmed) {
            console.log('Validation passed - submitting form');
            // Remove submit handler and submit
            $(this).off('submit');
            this.submit();
        } else {
            console.log('User cancelled submission');
            return false;
        }
    });

    /* ===================== BUTTON HANDLERS ===================== */
    
    // Save button handler
    $("button[type='submit']").click(function(e) {
        console.log('Save button clicked');
        // Let the form submit handler take care of validation
    });

    // Back button - no validation needed
    $("button[type='button']").click(function() {
        console.log('Back button clicked');
        // Navigation handled by onclick in JSP
    });

    console.log('MT754 validation rules initialized successfully');
});
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />