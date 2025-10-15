<%-- 
    Document   : validate_rule_mt756
    Created on : Sep 24, 2025, 10:44:56 AM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
    $(document).ready(function () {

        let validator = $("#form_mt756").validate({
            ignore: [],
            onkeyup: false,
            onfocusout: false,
            rules: {
                // --- Header ---
                sender_logical_terminal: "required",
                receiver_institution: "required",
                priority: "required",

                // --- Mandatory Body Fields ---
                _010_mf20_sender_reference: {
                    required: true,
                    regex: /^(?!\/)(?!.*\/\/)(?!.*\/$).{1,16}$/
                },
                _020_mf21_presenting_banks_reference: {
                    required: true,
                    regex: /^(?!\/)(?!.*\/\/)(?!.*\/$).{1,16}$/
                },

                // --- MF32B Total Amount Claimed ---
                _030_mf32b_currency: {
                    required: true,
                    regex: /^[A-Z]{3}$/
                },
                _031_mf32b_amount: {
                    required: true
                    // REMOVED: regex validation - handled by currency-specific validation in extraChecks()
                },

                // --- MF33A Amount Reimbursed or Paid ---
                _040_mf33a_date: {
                    required: true,
                    regex: /^\d{6}$/
                },
                _041_mf33a_currency: {
                    required: true,
                    regex: /^[A-Z]{3}$/
                },
                _042_mf33a_amount: {
                    required: true
                    // REMOVED: regex validation - handled by currency-specific validation in extraChecks()
                },

                // --- OF53a Sender's Correspondent (optional) ---
                _050_of53a_senders_correspondent: {
                    regex: /^[ABD]?$/
                },
                _052_of53a_identifier_code: {
                    regex: /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/
                },
                _054_of53a_location: {
                    maxlength: 35
                }
                // REMOVED: _056_of53a_name_address maxlength - handled by per-line validation in extraChecks()

                // --- OF54a Receiver's Correspondent (optional) ---
                _060_of54a_receivers_correspondent: {
                    regex: /^[ABD]?$/
                },
                _062_of54a_identifier_code: {
                    regex: /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/
                },
                _064_of54a_location: {
                    maxlength: 35
                }
                // REMOVED: _066_of54a_name_address maxlength - handled by per-line validation in extraChecks()

                // --- OF72Z / OF79Z ---
                // REMOVED: maxlength for these fields - handled by per-line validation in extraChecks()
                // Field 72Z: 6 lines × 35 chars
                // Field 79Z: 35 lines × 50 chars
            },
            messages: {
                // Header
                sender_logical_terminal: {
                    required: "Sender Logical Terminal must be filled"
                },
                receiver_institution: {
                    required: "Receiver Institution must be filled"
                },
                priority: {
                    required: "Priority must be filled"
                },

                // Mandatory Body
                _010_mf20_sender_reference: {
                    required: "Field 20 (Sender's Reference) is mandatory",
                    regex: "Field 20: Invalid format (Error T26). Cannot start/end with '/' or contain '//'"
                },
                _020_mf21_presenting_banks_reference: {
                    required: "Field 21 (Presenting Bank's Reference) is mandatory",
                    regex: "Field 21: Invalid format (Error T26). Cannot start/end with '/' or contain '//'"
                },

                // MF32B
                _030_mf32b_currency: {
                    required: "Field 32B Currency is mandatory",
                    regex: "Field 32B Currency must be 3 letters (Error T52)"
                },
                _031_mf32b_amount: {
                    required: "Field 32B Amount is mandatory"
                },

                // MF33A
                _040_mf33a_date: {
                    required: "Field 33A Date is mandatory",
                    regex: "Field 33A Date must be YYMMDD format (Error T50)"
                },
                _041_mf33a_currency: {
                    required: "Field 33A Currency is mandatory",
                    regex: "Field 33A Currency must be 3 letters (Error T52)"
                },
                _042_mf33a_amount: {
                    required: "Field 33A Amount is mandatory"
                },

                // OF53a
                _052_of53a_identifier_code: {
                    regex: "Field 53a BIC invalid (Error T27/T28/T29/C05)"
                },

                // OF54a
                _062_of54a_identifier_code: {
                    regex: "Field 54a BIC invalid (Error T27/T28/T29/C05)"
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
                }

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

                    tableHTML += '<tr class="error__row" data-input-id="' + inputID + '" content-body="' + locationTab + '" onmouseover="this.style.background=\'#f6f6f6\'" onmouseout="this.style.backgroundColor=\'transparent\'" style="cursor:pointer;">';
                    tableHTML += '<td style="padding: 5px;">Error</td>';
                    tableHTML += '<td style="padding: 5px;">' + locationTab + '</td>';
                    tableHTML += '<td style="padding: 5px;">' + inputType + '</td>';
                    tableHTML += '<td style="padding: 5px;">' + errors.message + '</td></tr>';
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
                                if (tabContentGroup == "Header") {
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
                        }
                    });
                });
            }
        });

        // --- Button Validate ---
        $("#btn-validate").click(function () {
            let isValid = $("#form_mt756").valid();
            if (isValid && extraChecks()) {
                alert("All inputs are valid!");
            }
        });

        // --- Button Submit ---
        $("#submit_mt").click(function (e) {
            e.preventDefault();
            let isValid = $("#form_mt756").valid();
            if (isValid && extraChecks()) {
                $("#form_mt756").submit();
            } else {
                alert("There are still errors! Please fix them before saving.");
            }
        });

        // --- Custom Regex Validator ---
        $.validator.addMethod("regex", function (value, element, param) {
            return this.optional(element) || param.test(value);
        }, "Invalid format");

        // --- Extra Validation Checks (SWIFT MT756 Rules) ---
        function extraChecks() {
            // ===== CURRENCY-SPECIFIC DECIMAL VALIDATION =====
            // Currencies with 0 decimals
            const DEC0 = new Set(['JPY', 'KRW', 'VND', 'HUF', 'XOF', 'XAF', 'XPF', 'CLP', 'ISK', 'PYG', 'UGX', 'VUV']);
            // Currencies with 3 decimals
            const DEC3 = new Set(['BHD', 'JOD', 'KWD', 'OMR', 'TND', 'LYD', 'IQD']);
            
            // Validate Amount format with currency-specific decimals
            function validateAmount(ccy, amt, fieldName) {
                if (!amt) return true;
                
                // Must contain comma (Error T40)
                if (!amt.includes(',')) {
                    alert(`${fieldName}: Amount must contain comma (Error T40)`);
                    return false;
                }
                
                const parts = amt.split(',');
                if (parts.length !== 2) {
                    alert(`${fieldName}: Invalid amount format (Error T43)`);
                    return false;
                }
                
                // Integer part must have at least 1 digit (Error C03)
                if (!/^\d+$/.test(parts[0]) || parts[0].length === 0) {
                    alert(`${fieldName}: Invalid integer part (Error C03)`);
                    return false;
                }
                
                const decimalPart = parts[1];
                let allowedDecimals = 2; // Default
                
                if (DEC0.has(ccy)) allowedDecimals = 0;
                if (DEC3.has(ccy)) allowedDecimals = 3;
                
                // Check decimal places (Error T43)
                if (decimalPart.length > allowedDecimals) {
                    alert(`${fieldName}: Maximum ${allowedDecimals} decimal places for ${ccy} (Error T43)`);
                    return false;
                }
                
                if (allowedDecimals === 0 && decimalPart.length !== 0) {
                    alert(`${fieldName}: Currency ${ccy} must not have decimals (Error T43)`);
                    return false;
                }
                
                return true;
            }
            
            // ===== VALIDATE AMOUNTS =====
            let ccy32B = $("#_030_mf32b_currency").val().toUpperCase().trim();
            let amt32B = $("#_031_mf32b_amount").val().trim();
            
            if (ccy32B && amt32B) {
                if (!validateAmount(ccy32B, amt32B, "Field 32B Amount")) {
                    $("#_031_mf32b_amount").focus();
                    return false;
                }
            }
            
            let ccy33A = $("#_041_mf33a_currency").val().toUpperCase().trim();
            let amt33A = $("#_042_mf33a_amount").val().trim();
            
            if (ccy33A && amt33A) {
                if (!validateAmount(ccy33A, amt33A, "Field 33A Amount")) {
                    $("#_042_mf33a_amount").focus();
                    return false;
                }
            }

            // ===== Rule C1 (Error C02): Currency 32B and 33A must be the same =====
            if (ccy32B && ccy33A && ccy32B !== ccy33A) {
                alert("Error C02 (Rule C1): Currency code in fields 32B and 33A must be the same");
                $("#_030_mf32b_currency").focus();
                return false;
            }

            // ===== Rule T50: Date must be valid YYMMDD =====
            let date33A = $("#_040_mf33a_date").val().trim();
            if (date33A && !/^\d{6}$/.test(date33A)) {
                alert("Field 33A Date must be YYMMDD format (Error T50)");
                $("#_040_mf33a_date").focus();
                return false;
            }

            // Validate date is valid (not 990231, etc.)
            if (date33A && date33A.length === 6) {
                let yy = parseInt(date33A.slice(0, 2), 10);
                let mm = parseInt(date33A.slice(2, 4), 10);
                let dd = parseInt(date33A.slice(4, 6), 10);

                if (mm < 1 || mm > 12) {
                    alert("Field 33A Date: Invalid month (Error T50)");
                    $("#_040_mf33a_date").focus();
                    return false;
                }

                if (dd < 1 || dd > 31) {
                    alert("Field 33A Date: Invalid day (Error T50)");
                    $("#_040_mf33a_date").focus();
                    return false;
                }

                // Days in month validation
                const dim = [31, (yy % 4 === 0 ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
                if (dd > dim[mm - 1]) {
                    alert("Field 33A Date: Invalid date for the month (Error T50)");
                    $("#_040_mf33a_date").focus();
                    return false;
                }
            }

            // ===== NEW: Validate Party Identifier format [/1!a][/34x] =====
            function validatePartyIdentifier(fieldId, fieldName) {
                let value = $(fieldId).val().trim();
                if (!value) return true;
                
                // Must start with /
                if (!value.startsWith('/')) {
                    alert(`${fieldName}: Must start with '/' (Error T26)`);
                    $(fieldId).focus();
                    return false;
                }
                
                // Format: /X/xxxxx where X is single letter, xxxxx max 34 chars
                const regex = /^\/[A-Z]\/[^\s\/]{1,34}$/;
                if (!regex.test(value)) {
                    alert(`${fieldName}: Invalid format. Expected: /A/ACCOUNTNUMBER (Error T26)`);
                    $(fieldId).focus();
                    return false;
                }
                
                return true;
            }
            
            // Validate Party Identifiers for 53a
            let opt53 = $("#_050_of53a_senders_correspondent").val();
            if (opt53 === "A") {
                if (!validatePartyIdentifier("#_051_of53a_party_identifier", "Field 53a Party Identifier")) return false;
            } else if (opt53 === "B") {
                if (!validatePartyIdentifier("#_053_of53a_party_identifier", "Field 53a Party Identifier")) return false;
            } else if (opt53 === "D") {
                if (!validatePartyIdentifier("#_055_of53a_party_identifier", "Field 53a Party Identifier")) return false;
            }
            
            // Validate Party Identifiers for 54a
            let opt54 = $("#_060_of54a_receivers_correspondent").val();
            if (opt54 === "A") {
                if (!validatePartyIdentifier("#_061_of54a_party_identifier", "Field 54a Party Identifier")) return false;
            } else if (opt54 === "B") {
                if (!validatePartyIdentifier("#_063_of54a_party_identifier", "Field 54a Party Identifier")) return false;
            } else if (opt54 === "D") {
                if (!validatePartyIdentifier("#_065_of54a_party_identifier", "Field 54a Party Identifier")) return false;
            }

            // ===== NEW: Validate Name & Address (4*35x) =====
            function validateNameAddress(fieldId, fieldName) {
                let value = $(fieldId).val().trim();
                if (!value) return true;
                
                const lines = value.split('\n');
                
                // Max 4 lines
                if (lines.length > 4) {
                    alert(`${fieldName}: Maximum 4 lines allowed (Error T13)`);
                    $(fieldId).focus();
                    return false;
                }
                
                // Each line max 35 characters
                for (let i = 0; i < lines.length; i++) {
                    if (lines[i].length > 35) {
                        alert(`${fieldName}: Line ${i + 1} exceeds 35 characters (Error T13)`);
                        $(fieldId).focus();
                        return false;
                    }
                }
                
                return true;
            }
            
            // Validate Name & Address for 53a Option D
            if (opt53 === "D") {
                if (!validateNameAddress("#_056_of53a_name_address", "Field 53a Name & Address")) return false;
            }
            
            // Validate Name & Address for 54a Option D
            if (opt54 === "D") {
                if (!validateNameAddress("#_066_of54a_name_address", "Field 54a Name & Address")) return false;
            }

            // ===== MT 756 Usage Rule: RCB code may only be used if both 53a and 54a are present =====
            let field72Z = $("#_070_of72z_sender_to_receiver_information").val().trim().toUpperCase();
            if (field72Z.includes("/RCB/") || field72Z.includes("RCB/")) {
                let field53a = $("#_050_of53a_senders_correspondent").val().trim();
                let field54a = $("#_060_of54a_receivers_correspondent").val().trim();

                if (!field53a || !field54a) {
                    alert("MT 756 Usage Rule: The code RCB may only be used in field 72Z if both fields 53a and 54a are present in the message");
                    $("#_070_of72z_sender_to_receiver_information").focus();
                    return false;
                }
            }

            // ===== Validate Field 72Z: Max 6 lines, 35 chars per line =====
            if (field72Z) {
                const lines72Z = field72Z.split('\n');
                if (lines72Z.length > 6) {
                    alert("Field 72Z: Maximum 6 lines allowed (Error T13)");
                    $("#_070_of72z_sender_to_receiver_information").focus();
                    return false;
                }
                for (let i = 0; i < lines72Z.length; i++) {
                    if (lines72Z[i].length > 35) {
                        alert(`Field 72Z: Line ${i + 1} exceeds 35 characters (Error T13)`);
                        $("#_070_of72z_sender_to_receiver_information").focus();
                        return false;
                    }
                }
            }

            // ===== Validate Field 79Z: Max 35 lines, 50 chars per line =====
            let field79Z = $("#_080_of79z_narrative").val().trim();
            if (field79Z) {
                const lines79Z = field79Z.split('\n');
                if (lines79Z.length > 35) {
                    alert("Field 79Z: Maximum 35 lines allowed (Error T13)");
                    $("#_080_of79z_narrative").focus();
                    return false;
                }
                for (let i = 0; i < lines79Z.length; i++) {
                    if (lines79Z[i].length > 50) {
                        alert(`Field 79Z: Line ${i + 1} exceeds 50 characters (Error T13)`);
                        $("#_080_of79z_narrative").focus();
                        return false;
                    }
                }
            }

            // ===== Validate Option A requires BIC =====
            let option53a = $("#_050_of53a_senders_correspondent").val();
            if (option53a === "A") {
                let bic53a = $("#_052_of53a_identifier_code").val().trim();
                if (!bic53a) {
                    alert("Field 53a Option A requires Identifier Code (BIC)");
                    $("#_052_of53a_identifier_code").focus();
                    return false;
                }
            }

            let option54a = $("#_060_of54a_receivers_correspondent").val();
            if (option54a === "A") {
                let bic54a = $("#_062_of54a_identifier_code").val().trim();
                if (!bic54a) {
                    alert("Field 54a Option A requires Identifier Code (BIC)");
                    $("#_062_of54a_identifier_code").focus();
                    return false;
                }
            }

            // ===== Validate Option B requires Location =====
            if (option53a === "B") {
                let loc53a = $("#_054_of53a_location").val().trim();
                if (!loc53a) {
                    alert("Field 53a Option B requires Location");
                    $("#_054_of53a_location").focus();
                    return false;
                }
            }

            if (option54a === "B") {
                let loc54a = $("#_064_of54a_location").val().trim();
                if (!loc54a) {
                    alert("Field 54a Option B requires Location");
                    $("#_064_of54a_location").focus();
                    return false;
                }
            }

            // ===== Validate Option D requires Name & Address =====
            if (option53a === "D") {
                let nameAddr53a = $("#_056_of53a_name_address").val().trim();
                if (!nameAddr53a) {
                    alert("Field 53a Option D requires Name & Address");
                    $("#_056_of53a_name_address").focus();
                    return false;
                }
            }

            if (option54a === "D") {
                let nameAddr54a = $("#_066_of54a_name_address").val().trim();
                if (!nameAddr54a) {
                    alert("Field 54a Option D requires Name & Address");
                    $("#_066_of54a_name_address").focus();
                    return false;
                }
            }

            return true;
        }

        // --- Toggle Groups for Option Fields ---
        // FIXED: Make function accessible in global scope
        window.toggleGroups = function() {
            // OF53a Sender's Correspondent
            let opt53 = $("#_050_of53a_senders_correspondent").val();
            $("#div_050_of53a_A, #div_050_of53a_B, #div_050_of53a_D").hide();
            
            if (opt53 == "A") {
                $("#div_050_of53a_A").show();
            } else if (opt53 == "B") {
                $("#div_050_of53a_B").show();
            } else if (opt53 == "D") {
                $("#div_050_of53a_D").show();
            }

            // OF54a Receiver's Correspondent
            let opt54 = $("#_060_of54a_receivers_correspondent").val();
            $("#div_060_of54a_A, #div_060_of54a_B, #div_060_of54a_D").hide();
            
            if (opt54 == "A") {
                $("#div_060_of54a_A").show();
            } else if (opt54 == "B") {
                $("#div_060_of54a_B").show();
            } else if (opt54 == "D") {
                $("#div_060_of54a_D").show();
            }
        };

        // Bind change events
        $("#_050_of53a_senders_correspondent, #_060_of54a_receivers_correspondent").change(window.toggleGroups);

        // Initial call to set correct state on page load
        window.toggleGroups();

    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<!-- Rule View: Initialize form state based on existing values -->
<script language="javascript">
    $(document).ready(function () {

        // Initialize OF53a based on existing values
        if ($("#_052_of53a_identifier_code").val() != "") {
            $("#_050_of53a_senders_correspondent").val("A");
        } else if ($("#_054_of53a_location").val() != "") {
            $("#_050_of53a_senders_correspondent").val("B");
        } else if ($("#_056_of53a_name_address").val() != "") {
            $("#_050_of53a_senders_correspondent").val("D");
        }

        // Initialize OF54a based on existing values
        if ($("#_062_of54a_identifier_code").val() != "") {
            $("#_060_of54a_receivers_correspondent").val("A");
        } else if ($("#_064_of54a_location").val() != "") {
            $("#_060_of54a_receivers_correspondent").val("B");
        } else if ($("#_066_of54a_name_address").val() != "") {
            $("#_060_of54a_receivers_correspondent").val("D");
        }

        // Trigger toggleGroups after initialization
        if (typeof window.toggleGroups === 'function') {
            setTimeout(function() {
                window.toggleGroups();
            }, 100);
        }

    });
</script>
