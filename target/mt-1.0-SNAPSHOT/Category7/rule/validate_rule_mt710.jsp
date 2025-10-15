<%-- 
    Document   : validate_rule_mt710
    Created on : Sep 10, 2025, 10:14:59 AM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/validate.css" />
<script type="text/javascript">
    $(document).ready(function () {

        // ================= Custom Regex Validators =================
        $.validator.addMethod("isDateYYMMDD", function (value, element) {
            if (this.optional(element)) return true;
            if (!/^\d{6}$/.test(value)) return false;
            
            const yy = parseInt(value.slice(0, 2), 10);
            const mm = parseInt(value.slice(2, 4), 10);
            const dd = parseInt(value.slice(4, 6), 10);
            
            if (mm < 1 || mm > 12) return false;
            if (dd < 1 || dd > 31) return false;
            
            const dim = [31, (yy % 4 === 0 ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
            return dd <= dim[mm - 1];
        }, "Error T50: Invalid date format (expected YYMMDD)");

        $.validator.addMethod("isCurrency", function (value, element) {
            return this.optional(element) || /^[A-Z]{3}$/.test(value);
        }, "Error T52: Invalid currency code (expected 3 uppercase letters)");

        $.validator.addMethod("isAmount", function (value, element) {
            if (this.optional(element)) return true;
            
            // Must contain comma
            if (!value.includes(',')) return false;
            
            // Format validation
            if (!/^\d{1,12}(,\d{0,3})?$/.test(value)) return false;
            
            // Cannot be zero
            const amountValue = parseFloat(value.replace(',', '.'));
            if (amountValue === 0) return false;
            
            return true;
        }, "Error T40/T43/C03: Invalid amount format or amount is zero");

        $.validator.addMethod("isBIC", function (value, element) {
            if (this.optional(element)) return true;
            if (value.length !== 8 && value.length !== 11) return false;
            return /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/.test(value);
        }, "Error T27/T28/T29: Invalid BIC format (8 or 11 characters)");

        $.validator.addMethod("isPercent", function (value, element) {
            return this.optional(element) || /^([0-9]|[1-9][0-9])$/.test(value);
        }, "Invalid percentage (0-99)");

        $.validator.addMethod("noSlashStartEnd", function (value, element) {
            if (this.optional(element)) return true;
            return !value.startsWith('/') && !value.endsWith('/') && !value.includes('//');
        }, "Error T26: Cannot start/end with '/' or contain '//'");

        $.validator.addMethod("maxLines", function (value, element, param) {
            if (this.optional(element)) return true;
            const lines = value.split('\n');
            return lines.length <= param;
        }, "Error C03: Too many lines");

        $.validator.addMethod("maxCharsPerLine", function (value, element, param) {
            if (this.optional(element)) return true;
            const lines = value.split('\n');
            for (let line of lines) {
                if (line.length > param) return false;
            }
            return true;
        }, "Error C03: Line exceeds maximum characters");

        // ================= Main Form Validator =================
        let validator = $("#form_mt710").validate({
            ignore: [],
            onkeyup: false,
            onfocusout: false,
            rules: {
                // ========== HEADER ==========
                sender_logical_terminal: {
                    required: true,
                    input_type: "Sender Logical Terminal",
                    location: "Header"
                },
                receiver_institution: {
                    required: true,
                    input_type: "Receiver Institution",
                    location: "Header"
                },
                priority: {
                    required: true,
                    input_type: "Priority",
                    location: "Header"
                },

                // ========== BODY - MANDATORY FIELDS ==========
                
                // Field 27: Sequence of Total
                _010_mf27_number: {
                    required: true,
                    min: 1,
                    max: 8,
                    input_type: "MF27 Sequence of Total",
                    location: "Body"
                },
                _011_mf27_total: {
                    required: true,
                    min: 1,
                    max: 8,
                    input_type: "MF27 Sequence of Total",
                    location: "Body"
                },

                // Field 40B: Form of Documentary Credit
                _020_mf40b_form_of_documentary_credit_type: {
                    required: true,
                    input_type: "MF40B Form of Documentary Credit",
                    location: "Body"
                },
                _021_mf40b_code: {
                    required: true,
                    input_type: "MF40B Form of Documentary Credit",
                    location: "Body"
                },

                // Field 20: Sender's Reference
                _030_mf20_sender_reference: {
                    required: true,
                    maxlength: 16,
                    noSlashStartEnd: true,
                    input_type: "MF20 Sender's Reference",
                    location: "Body"
                },

                // Field 21: Documentary Credit Number
                _040_mf21_documentary_credit_number: {
                    required: true,
                    maxlength: 16,
                    noSlashStartEnd: true,
                    input_type: "MF21 Documentary Credit Number",
                    location: "Body"
                },

                // Field 23: Reference to Pre-Advice (Optional)
                _050_of23_reference_to_preadvice: {
                    maxlength: 16,
                    input_type: "OF23 Reference to Pre-Advice",
                    location: "Body"
                },

                // Field 31C: Date of Issue
                _060_mf31c_date_of_issue: {
                    required: true,
                    isDateYYMMDD: true,
                    input_type: "MF31C Date of Issue",
                    location: "Body"
                },

                // Field 40E: Applicable Rules
                _070_mf40e_applicable_rules: {
                    required: true,
                    input_type: "MF40E Applicable Rules",
                    location: "Body"
                },
                _071_mf40e_narrative: {
                    maxlength: 35,
                    input_type: "MF40E Applicable Rules",
                    location: "Body"
                },

                // Field 31D: Date and Place of Expiry
                _080_mf31d_date_of_expiry: {
                    required: true,
                    isDateYYMMDD: true,
                    input_type: "MF31D Date and Place of Expiry",
                    location: "Body"
                },
                _081_mf31d_place_of_expiry: {
                    required: true,
                    maxlength: 29,
                    input_type: "MF31D Date and Place of Expiry",
                    location: "Body"
                },

                // Field 52a: Issuing Bank (Option A)
                _091_of52a_party_identifier: {
                    maxlength: 35,
                    input_type: "OF52a Issuing Bank",
                    location: "Body"
                },
                _092_of52a_identifier_code: {
                    isBIC: true,
                    input_type: "OF52a Issuing Bank",
                    location: "Body"
                },

                // Field 52a: Issuing Bank (Option D)
                _093_of52a_party_identifier: {
                    maxlength: 35,
                    input_type: "OF52a Issuing Bank",
                    location: "Body"
                },
                _094_of52a_name_address: {
                    maxlength: 140,
                    maxLines: 4,
                    maxCharsPerLine: 35,
                    input_type: "OF52a Issuing Bank",
                    location: "Body"
                },

                // Field 50B: Non-Bank Issuer
                _100_of50b_non_bank_issuer: {
                    maxlength: 140,
                    maxLines: 4,
                    maxCharsPerLine: 35,
                    input_type: "OF50B Non-Bank Issuer",
                    location: "Body"
                },

                // Field 51a: Applicant Bank (Option A)
                _111_of51a_party_identifier: {
                    maxlength: 35,
                    input_type: "OF51a Applicant Bank",
                    location: "Body"
                },
                _112_of51a_bic: {
                    isBIC: true,
                    input_type: "OF51a Applicant Bank",
                    location: "Body"
                },

                // Field 51a: Applicant Bank (Option D)
                _113_of51a_party_identifier: {
                    maxlength: 35,
                    input_type: "OF51a Applicant Bank",
                    location: "Body"
                },
                _114_of51a_name_address: {
                    maxlength: 140,
                    maxLines: 4,
                    maxCharsPerLine: 35,
                    input_type: "OF51a Applicant Bank",
                    location: "Body"
                },

                // Field 50: Applicant
                _120_mf50_applicant: {
                    required: true,
                    maxlength: 140,
                    maxLines: 4,
                    maxCharsPerLine: 35,
                    input_type: "MF50 Applicant",
                    location: "Body"
                },

                // Field 59: Beneficiary
                _130_mf59_account: {
                    maxlength: 35,
                    input_type: "MF59 Beneficiary",
                    location: "Body"
                },
                _131_mf59_name_address: {
                    required: true,
                    maxlength: 140,
                    maxLines: 4,
                    maxCharsPerLine: 35,
                    input_type: "MF59 Beneficiary",
                    location: "Body"
                },

                // Field 32B: Currency Code, Amount
                _140_mf32b_currency: {
                    required: true,
                    isCurrency: true,
                    input_type: "MF32B Currency Code, Amount",
                    location: "Body"
                },
                _141_mf32b_amount: {
                    required: true,
                    isAmount: true,
                    input_type: "MF32B Currency Code, Amount",
                    location: "Body"
                },

                // Field 39A: Percentage Credit Amount Tolerance
                _150_of39a_tolerance_plus: {
                    isPercent: true,
                    input_type: "OF39A Percentage Credit Amount Tolerance",
                    location: "Body"
                },
                _151_of39a_tolerance_minus: {
                    isPercent: true,
                    input_type: "OF39A Percentage Credit Amount Tolerance",
                    location: "Body"
                },

                // Field 39C: Additional Amounts Covered
                _160_of39c_additional_amounts_covered: {
                    maxlength: 140,
                    maxLines: 4,
                    maxCharsPerLine: 35,
                    input_type: "OF39C Additional Amounts Covered",
                    location: "Body"
                },

                // Field 41a: Available With ... By ... (Option A)
                _170_mf41a_available_with_by: {
                    required: true,
                    input_type: "MF41A Available With ... By ...",
                    location: "Body"
                },
                _171_mf41a_identifier_code: {
                    isBIC: true,
                    input_type: "MF41A Available With ... By ...",
                    location: "Body"
                },

                // Field 41a: Available With ... By ... (Option D)
                _172_mf41d_name_and_address: {
                    maxlength: 140,
                    maxLines: 4,
                    maxCharsPerLine: 35,
                    input_type: "MF41A Available With ... By ...",
                    location: "Body"
                },

                // Field 41a: By (Mandatory)
                _173_mf41a_by: {
                    required: true,
                    input_type: "MF41A Available With ... By ...",
                    location: "Body"
                },

                // Field 42C: Drafts at ...
                _180_of42c_drafts_at: {
                    maxlength: 105,
                    maxLines: 3,
                    maxCharsPerLine: 35,
                    input_type: "OF42C Drafts at ...",
                    location: "Body"
                },

                // Field 42a: Drawee (Option A)
                _191_of42a_party_identifier: {
                    maxlength: 35,
                    input_type: "OF42A Drawee",
                    location: "Body"
                },
                _192_of42a_identifier_code: {
                    isBIC: true,
                    input_type: "OF42A Drawee",
                    location: "Body"
                },

                // Field 42a: Drawee (Option D)
                _193_of42a_party_identifier: {
                    maxlength: 35,
                    input_type: "OF42A Drawee",
                    location: "Body"
                },
                _194_of42d_name_and_address: {
                    maxlength: 140,
                    maxLines: 4,
                    maxCharsPerLine: 35,
                    input_type: "OF42A Drawee",
                    location: "Body"
                },

                // Field 42M: Mixed Payment Details
                _200_of42m_mixed_payment_details: {
                    maxlength: 140,
                    maxLines: 4,
                    maxCharsPerLine: 35,
                    input_type: "OF42M Mixed Payment Details",
                    location: "Body"
                },

                // Field 42P: Negotiation/Deferred Payment Details
                _210_of42p_negotiation: {
                    maxlength: 140,
                    maxLines: 4,
                    maxCharsPerLine: 35,
                    input_type: "OF42P Negotiation/Deferred Payment Details",
                    location: "Body"
                },

                // Field 43P: Partial Shipments
                _220_of43p_partial_shipments: {
                    input_type: "OF43P Partial Shipments",
                    location: "Body"
                },

                // Field 43T: Transhipment
                _230_of43t_transhipment: {
                    input_type: "OF43T Transhipment",
                    location: "Body"
                },

                // Field 44A: Place of Taking in Charge
                _240_of44a_place_taking_in_charge_dispatch_from_place_of_receipt: {
                    maxlength: 140,
                    input_type: "OF44A Place of Taking in Charge",
                    location: "Body"
                },

                // Field 44E: Port of Loading
                _250_of44e_port_of_loading_airport_of_departure: {
                    maxlength: 140,
                    input_type: "OF44E Port of Loading",
                    location: "Body"
                },

                // Field 44F: Port of Discharge
                _260_of44f_port_of_discharge_airport_of_destination: {
                    maxlength: 140,
                    input_type: "OF44F Port of Discharge",
                    location: "Body"
                },

                // Field 44B: Place of Final Destination
                _270_of44b_place_of_final_destination_for_transportation_to_place_of_delivery: {
                    maxlength: 140,
                    input_type: "OF44B Place of Final Destination",
                    location: "Body"
                },

                // Field 44C: Latest Date of Shipment
                _280_of44c_latest_date_of_shipment: {
                    isDateYYMMDD: true,
                    input_type: "OF44C Latest Date of Shipment",
                    location: "Body"
                },

                // Field 44D: Shipment Period
                _290_of44d_shipment_period: {
                    maxlength: 390,
                    maxLines: 6,
                    maxCharsPerLine: 65,
                    input_type: "OF44D Shipment Period",
                    location: "Body"
                },

                // Field 45A: Description of Goods
                _300_of45a_description_of_goods_and_or_services: {
                    maxlength: 6500,
                    maxLines: 100,
                    maxCharsPerLine: 65,
                    input_type: "OF45A Description of Goods",
                    location: "Body"
                },

                // Field 46A: Documents Required
                _310_of46a_documents_required: {
                    maxlength: 6500,
                    maxLines: 100,
                    maxCharsPerLine: 65,
                    input_type: "OF46A Documents Required",
                    location: "Body"
                },

                // Field 47A: Additional Conditions
                _320_of47a_additional_conditions: {
                    maxlength: 6500,
                    maxLines: 100,
                    maxCharsPerLine: 65,
                    input_type: "OF47A Additional Conditions",
                    location: "Body"
                },

                // Field 49G: Special Payment Conditions for Beneficiary
                _330_of49g_special_payment_conditions_for_beneficiary: {
                    maxlength: 6500,
                    maxLines: 100,
                    maxCharsPerLine: 65,
                    input_type: "OF49G Special Payment Conditions for Beneficiary",
                    location: "Body"
                },

                // Field 49H: Special Payment Conditions for Bank Only
                _340_of49h_special_payment_conditions_for_bank_only: {
                    maxlength: 6500,
                    maxLines: 100,
                    maxCharsPerLine: 65,
                    input_type: "OF49H Special Payment Conditions for Bank Only",
                    location: "Body"
                },

                // Field 71D: Charges
                _350_of71d_charges: {
                    maxlength: 210,
                    maxLines: 6,
                    maxCharsPerLine: 35,
                    input_type: "OF71D Charges",
                    location: "Body"
                },

                // Field 48: Period for Presentation
                _360_of48_days: {
                    maxlength: 3,
                    input_type: "OF48 Period for Presentation",
                    location: "Body"
                },
                _361_of48_narrative: {
                    maxlength: 35,
                    input_type: "OF48 Period for Presentation",
                    location: "Body"
                },

                // Field 49: Confirmation Instructions
                _370_mf49_confirmation_instructions: {
                    required: true,
                    input_type: "MF49 Confirmation Instructions",
                    location: "Body"
                },

                // Field 58a: Requested Confirmation Party (Option A)
                _381_of58a_party_identifier: {
                    maxlength: 35,
                    input_type: "OF58a Requested Confirmation Party",
                    location: "Body"
                },
                _382_of58a_bic: {
                    isBIC: true,
                    input_type: "OF58a Requested Confirmation Party",
                    location: "Body"
                },

                // Field 58a: Requested Confirmation Party (Option D)
                _383_of58a_party_identifier: {
                    maxlength: 35,
                    input_type: "OF58a Requested Confirmation Party",
                    location: "Body"
                },
                _384_of58a_name_address: {
                    maxlength: 140,
                    maxLines: 4,
                    maxCharsPerLine: 35,
                    input_type: "OF58a Requested Confirmation Party",
                    location: "Body"
                },

                // Field 53a: Reimbursing Bank (Option A)
                _391_of53a_party_identifier: {
                    maxlength: 35,
                    input_type: "OF53a Reimbursing Bank",
                    location: "Body"
                },
                _392_of53a_bic: {
                    isBIC: true,
                    input_type: "OF53a Reimbursing Bank",
                    location: "Body"
                },

                // Field 53a: Reimbursing Bank (Option D)
                _393_of53a_party_identifier: {
                    maxlength: 35,
                    input_type: "OF53a Reimbursing Bank",
                    location: "Body"
                },
                _394_of53a_name_address: {
                    maxlength: 140,
                    maxLines: 4,
                    maxCharsPerLine: 35,
                    input_type: "OF53a Reimbursing Bank",
                    location: "Body"
                },

                // Field 78: Instructions to Paying Bank
                _400_of78_instructions_to_the_paying_accepting_negotiating_bank: {
                    maxlength: 780,
                    maxLines: 12,
                    maxCharsPerLine: 65,
                    input_type: "OF78 Instructions to Paying Bank",
                    location: "Body"
                },

                // Field 78D: Instructions from Intermediary Bank
                _410_of78d_instructions_from_intermediary_bank: {
                    maxlength: 780,
                    maxLines: 12,
                    maxCharsPerLine: 65,
                    input_type: "OF78D Instructions from Intermediary Bank",
                    location: "Body"
                },

                // Field 57a: Advise Through Bank (Option A)
                _421_of57a_party_identifier: {
                    maxlength: 35,
                    input_type: "OF57a Advise Through Bank",
                    location: "Body"
                },
                _422_of57a_bic: {
                    isBIC: true,
                    input_type: "OF57a Advise Through Bank",
                    location: "Body"
                },

                // Field 57a: Advise Through Bank (Option B)
                _423_of57a_party_identifier: {
                    maxlength: 35,
                    input_type: "OF57a Advise Through Bank",
                    location: "Body"
                },
                _424_of57a_location: {
                    maxlength: 35,
                    input_type: "OF57a Advise Through Bank",
                    location: "Body"
                },

                // Field 57a: Advise Through Bank (Option D)
                _425_of57a_party_identifier: {
                    maxlength: 35,
                    input_type: "OF57a Advise Through Bank",
                    location: "Body"
                },
                _426_of57a_name_address: {
                    maxlength: 140,
                    maxLines: 4,
                    maxCharsPerLine: 35,
                    input_type: "OF57a Advise Through Bank",
                    location: "Body"
                },

                // Field 72Z: Sender to Receiver Information
                _430_of72z_information: {
                    maxlength: 210,
                    maxLines: 6,
                    maxCharsPerLine: 35,
                    input_type: "OF72Z Sender to Receiver Information",
                    location: "Body"
                }
            },
            messages: {
                // Header
                sender_logical_terminal: {
                    required: "Sender Logical Terminal must be filled..!!"
                },
                receiver_institution: {
                    required: "Receiver Institution must be filled..!!"
                },
                priority: {
                    required: "Priority must be filled..!!"
                },

                // Body - Mandatory
                _010_mf27_number: {
                    required: "Error T75: MF27 Number must be filled..!!",
                    min: "Error T75: MF27 Number must be between 1-8",
                    max: "Error T75: MF27 Number must be between 1-8"
                },
                _011_mf27_total: {
                    required: "Error T75: MF27 Total must be filled..!!",
                    min: "Error T75: MF27 Total must be between 1-8",
                    max: "Error T75: MF27 Total must be between 1-8"
                },
                _020_mf40b_form_of_documentary_credit_type: {
                    required: "Error T60: MF40B Form of Documentary Credit Type must be filled..!!"
                },
                _021_mf40b_code: {
                    required: "Error T66: MF40B Code must be filled..!!"
                },
                _030_mf20_sender_reference: {
                    required: "MF20 Sender's Reference must be filled..!!"
                },
                _040_mf21_documentary_credit_number: {
                    required: "MF21 Documentary Credit Number must be filled..!!"
                },
                _060_mf31c_date_of_issue: {
                    required: "MF31C Date of Issue must be filled..!!"
                },
                _070_mf40e_applicable_rules: {
                    required: "Error T59: MF40E Applicable Rules must be filled..!!"
                },
                _080_mf31d_date_of_expiry: {
                    required: "MF31D Date of Expiry must be filled..!!"
                },
                _081_mf31d_place_of_expiry: {
                    required: "MF31D Place of Expiry must be filled..!!"
                },
                _120_mf50_applicant: {
                    required: "MF50 Applicant must be filled..!!"
                },
                _131_mf59_name_address: {
                    required: "MF59 Beneficiary Name & Address must be filled..!!"
                },
                _140_mf32b_currency: {
                    required: "MF32B Currency must be filled..!!"
                },
                _141_mf32b_amount: {
                    required: "MF32B Amount must be filled..!!"
                },
                _170_mf41a_available_with_by: {
                    required: "MF41A Available With must be selected..!!"
                },
                _173_mf41a_by: {
                    required: "Error T68: MF41A By must be filled..!!"
                },
                _370_mf49_confirmation_instructions: {
                    required: "Error T67: MF49 Confirmation Instructions must be filled..!!"
                }
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
            },
            showErrors: function (errorMap, errorList) {
                this.defaultShowErrors();

                if (errorList.length === 0) {
                    return;
                }

                // Build error table
                let errorContainer = document.getElementById("error-container");
                if (!errorContainer) return;

                let tableHTML = `<table border="0" style="width:100%; font-size:8pt; border-collapse: collapse; border:1px gray solid;">
                                    <thead>
                                    <tr style="background:#d6d6d6;">
                                    <th style="padding:5px;">Type</th>
                                    <th style="padding:5px;">Location</th>
                                    <th style="padding:5px;">Field</th>
                                    <th style="padding:5px;">Message</th>
                                    </tr>
                                    </thead>
                                    <tbody>`;

                errorList.forEach(errors => {
                    let inputID = errors.element.id || "";
                    let locationTab = errors.element.getAttribute("location") || "";
                    let inputType = errors.element.getAttribute("input_type") || "";
                    let tabName = locationTab === "Header" ? "Tab 1: Header" : "Tab 2: Body";

                    tableHTML += `<tr class="error__row" data-input-id="${inputID}" data-tab="${locationTab}" 
                                    style="cursor:pointer; border-bottom:1px solid #ccc;">
                                    <td style="padding:5px;">Error</td>
                                    <td style="padding:5px;">${tabName}</td>
                                    <td style="padding:5px;">${inputType}</td>
                                    <td style="padding:5px;">${errors.message}</td>
                                  </tr>`;
                });

                tableHTML += `</tbody></table>`;
                errorContainer.innerHTML = tableHTML;

                // Add click handlers to error rows
                document.querySelectorAll(".error__row").forEach(row => {
                    row.addEventListener("click", function () {
                        let inputId = this.getAttribute("data-input-id");
                        let tabLocation = this.getAttribute("data-tab");
                        let input = document.getElementById(inputId);
                        
                        if (input) {
                            $(".tabcontent").hide();
                            $('.tabs li').removeClass("selected");
                            
                            if (tabLocation === "Header") {
                                $("#view1").show();
                                $('.tabs li a[rel="view1"]').parent().addClass("selected");
                            } else if (tabLocation === "Body") {
                                $("#view2").show();
                                $('.tabs li a[rel="view2"]').parent().addClass("selected");
                            }
                            
                            input.focus();
                            input.scrollIntoView({ behavior: 'smooth', block: 'center' });
                        }
                    });
                });
            }
        });

        // ================= Cross-field & Network Validated Rules =================
        
        $("#form_mt710").submit(function (e) {
            
            // Rule C4: Either field 52a or field 50B, but not both, must be present
            const field52aOption = $("#_090_of52a_issuing_bank").val();
            const field50B = $("#_100_of50b_non_bank_issuer").val().trim();
            
            // Check if 52a has actual data
            let has52aData = false;
            if (field52aOption === "A") {
                const bic = $("#_092_of52a_identifier_code").val().trim();
                has52aData = bic !== "";
            } else if (field52aOption === "D") {
                const name = $("#_094_of52a_name_address").val().trim();
                has52aData = name !== "";
            }
            
            const has50B = field50B !== "";
            
            if (!has52aData && !has50B) {
                alert("Error C06 (Rule C4): Either field 52a (Issuing Bank) or field 50B (Non-Bank Issuer) must be present with data.");
                $("#_090_of52a_issuing_bank").focus();
                e.preventDefault();
                return false;
            }
            
            if (has52aData && has50B) {
                alert("Error C06 (Rule C4): Only one of field 52a (Issuing Bank) or field 50B (Non-Bank Issuer) can be present, not both.");
                $("#_090_of52a_issuing_bank").focus();
                e.preventDefault();
                return false;
            }

            // Rule C1: When used, fields 42C and 42a must both be present
            const field42C = $("#_180_of42c_drafts_at").val().trim();
            const field42aOption = $("#_190_of42a_drawee").val();
            
            if (field42C && !field42aOption) {
                alert("Error C90 (Rule C1): When field 42C (Drafts at) is filled, field 42A (Drawee) must also be present.");
                $("#_190_of42a_drawee").focus();
                e.preventDefault();
                return false;
            }
            
            if (field42aOption && !field42C) {
                alert("Error C90 (Rule C1): When field 42A (Drawee) is selected, field 42C (Drafts at) must also be filled.");
                $("#_180_of42c_drafts_at").focus();
                e.preventDefault();
                return false;
            }

            // Rule C2: Either fields 42C and 42a together, or field 42M alone, or field 42P alone
            const field42M = $("#_200_of42m_mixed_payment_details").val().trim();
            const field42P = $("#_210_of42p_negotiation").val().trim();
            
            const has42C_42a = (field42C || field42aOption);
            const has42M = field42M !== "";
            const has42P = field42P !== "";
            
            const count = [has42C_42a, has42M, has42P].filter(Boolean).length;
            
            if (count > 1) {
                alert("Error C90 (Rule C2): Only one of the following combinations is allowed:\n" +
                      "- Fields 42C and 42A together\n" +
                      "- Field 42M alone\n" +
                      "- Field 42P alone");
                e.preventDefault();
                return false;
            }

            // Rule C3: Either field 44C or 44D, but not both
            const field44C = $("#_280_of44c_latest_date_of_shipment").val().trim();
            const field44D = $("#_290_of44d_shipment_period").val().trim();
            
            if (field44C && field44D) {
                alert("Error D06 (Rule C3): Either field 44C (Latest Date of Shipment) or field 44D (Shipment Period) may be present, but not both.");
                $("#_280_of44c_latest_date_of_shipment").focus();
                e.preventDefault();
                return false;
            }

            // Field 40E: Applicable Rules - OTHR requires narrative
            const field40E = $("#_070_mf40e_applicable_rules").val();
            const field40ENarrative = $("#_071_mf40e_narrative").val().trim();
            
            if (field40E === "OTHR" && !field40ENarrative) {
                alert("Error D81: Field 40E Narrative is required when Applicable Rules is OTHR.");
                $("#_071_mf40e_narrative").focus();
                e.preventDefault();
                return false;
            }
            
            if (field40E !== "OTHR" && field40ENarrative) {
                alert("Error D81: Field 40E Narrative is only allowed when Applicable Rules is OTHR.");
                $("#_071_mf40e_narrative").focus();
                e.preventDefault();
                return false;
            }

            // Field 49 & 58a: Confirmation Instructions relationship - ENHANCED
            const field49 = $("#_370_mf49_confirmation_instructions").val();
            const field58aOption = $("#_380_of58a_requested_confirmation_party").val();
            
            let has58aData = false;
            if (field58aOption === "A") {
                const bic = $("#_382_of58a_bic").val().trim();
                has58aData = bic !== "";
            } else if (field58aOption === "D") {
                const name = $("#_384_of58a_name_address").val().trim();
                has58aData = name !== "";
            }
            
            if ((field49 === "CONFIRM" || field49 === "MAY ADD") && !has58aData) {
                alert("Error D67: Field 58a (Requested Confirmation Party) must be present with complete data when Confirmation Instructions is CONFIRM or MAY ADD.");
                $("#_380_of58a_requested_confirmation_party").focus();
                e.preventDefault();
                return false;
            }
            
            if (field49 === "WITHOUT" && has58aData) {
                alert("Error D67: Field 58a (Requested Confirmation Party) should not be present when Confirmation Instructions is WITHOUT.");
                $("#_380_of58a_requested_confirmation_party").focus();
                e.preventDefault();
                return false;
            }

            // Field 27: Number cannot exceed Total
            const number = parseInt($("#_010_mf27_number").val());
            const total = parseInt($("#_011_mf27_total").val());
            
            if (!isNaN(number) && !isNaN(total) && number > total) {
                alert("Error T75: Field 27 Number cannot exceed Total.");
                $("#_010_mf27_number").focus();
                e.preventDefault();
                return false;
            }

            // Validate Amount format based on Currency
            const currency = $("#_140_mf32b_currency").val().trim();
            const amount = $("#_141_mf32b_amount").val().trim();
            
            if (currency && amount) {
                if (!amount.includes(',')) {
                    alert("Error T40: Amount must contain comma (,).");
                    $("#_141_mf32b_amount").focus();
                    e.preventDefault();
                    return false;
                }
                
                const parts = amount.split(',');
                if (parts.length !== 2) {
                    alert("Error T43: Invalid amount format.");
                    $("#_141_mf32b_amount").focus();
                    e.preventDefault();
                    return false;
                }
                
                // Check decimal places based on currency
                const DEC0 = ['JPY', 'KRW', 'VND', 'HUF', 'XOF', 'XAF', 'XPF', 'CLP', 'ISK', 'PYG', 'UGX', 'VUV'];
                const DEC3 = ['BHD', 'JOD', 'KWD', 'OMR', 'TND', 'LYD', 'IQD'];
                
                const decimalPart = parts[1];
                let allowedDecimals = 2;
                
                if (DEC0.includes(currency)) allowedDecimals = 0;
                if (DEC3.includes(currency)) allowedDecimals = 3;
                
                if (decimalPart.length > allowedDecimals) {
                    alert(`Error T43: Maximum ${allowedDecimals} decimal places allowed for ${currency}.`);
                    $("#_141_mf32b_amount").focus();
                    e.preventDefault();
                    return false;
                }
                
                if (allowedDecimals === 0 && decimalPart.length !== 0) {
                    alert(`Error T43: Currency ${currency} must not have decimal places.`);
                    $("#_141_mf32b_amount").focus();
                    e.preventDefault();
                    return false;
                }
                
                // Check if amount is zero
                const amountValue = parseFloat(amount.replace(',', '.'));
                if (amountValue === 0) {
                    alert("Error C03: Amount must not be 0 (zero).");
                    $("#_141_mf32b_amount").focus();
                    e.preventDefault();
                    return false;
                }
            }

            return true;
        });

        // ================= Manual Validate Button =================
        $("#btn-validate").click(function () {
            if ($("#form_mt710").valid()) {
                // Trigger the submit validation rules
                if ($("#form_mt710").triggerHandler("submit") !== false) {
                    alert("All inputs are valid!");
                }
            }
        });

        // ================= Save Button Handler =================
        $("#submit_mt").click(function (e) {
            e.preventDefault();
            if ($("#form_mt710").valid()) {
                // Trigger the submit validation rules
                if ($("#form_mt710").triggerHandler("submit") !== false) {
                    $("#form_mt710").submit();
                }
            } else {
                alert("There are still errors! Please fix them before saving.");
            }
        });

        // ================= Dynamic Field Visibility Rules =================

        // Field 40E: Show/hide narrative based on OTHR selection
        $("#_070_mf40e_applicable_rules").change(function () {
            if ($(this).val() === "OTHR") {
                $("#div_070_mf40e_narrative").show();
                $("#_071_mf40e_narrative").prop("disabled", false);
            } else {
                $("#div_070_mf40e_narrative").hide();
                $("#_071_mf40e_narrative").val("").prop("disabled", true);
            }
        });

        // Field 52a: Issuing Bank option toggle
        $("#_090_of52a_issuing_bank").change(function () {
            const option = $(this).val();
            
            $("#div_090_of52a_A, #div_090_of52a_D").hide();
            $("#_091_of52a_party_identifier, #_092_of52a_identifier_code").prop("disabled", true).val("");
            $("#_093_of52a_party_identifier, #_094_of52a_name_address").prop("disabled", true).val("");
            
            if (option === "A") {
                $("#div_090_of52a_A").show();
                $("#_091_of52a_party_identifier, #_092_of52a_identifier_code").prop("disabled", false);
            } else if (option === "D") {
                $("#div_090_of52a_D").show();
                $("#_093_of52a_party_identifier, #_094_of52a_name_address").prop("disabled", false);
            }
        });

        // Field 51a: Applicant Bank option toggle
        $("#_110_of51a_applicant_bank").change(function () {
            const option = $(this).val();
            
            $("#div_110_of51a_A, #div_110_of51a_D").hide();
            $("#_111_of51a_party_identifier, #_112_of51a_bic").prop("disabled", true).val("");
            $("#_113_of51a_party_identifier, #_114_of51a_name_address").prop("disabled", true).val("");
            
            if (option === "A") {
                $("#div_110_of51a_A").show();
                $("#_111_of51a_party_identifier, #_112_of51a_bic").prop("disabled", false);
            } else if (option === "D") {
                $("#div_110_of51a_D").show();
                $("#_113_of51a_party_identifier, #_114_of51a_name_address").prop("disabled", false);
            }
        });

        // Field 41a: Available With option toggle
        $("#_170_mf41a_available_with_by").change(function () {
            const option = $(this).val();
            
            $("#div_170_mf41a_A, #div_170_mf41a_D").hide();
            $("#_171_mf41a_identifier_code").prop("disabled", true).val("");
            $("#_172_mf41d_name_and_address").prop("disabled", true).val("");
            
            if (option === "A") {
                $("#div_170_mf41a_A").show();
                $("#_171_mf41a_identifier_code").prop("disabled", false);
            } else if (option === "D") {
                $("#div_170_mf41a_D").show();
                $("#_172_mf41d_name_and_address").prop("disabled", false);
            }
        });

        // Field 42a: Drawee option toggle
        $("#_190_of42a_drawee").change(function () {
            const option = $(this).val();
            
            $("#div_190_of42a_A, #div_190_of42a_D").hide();
            $("#_191_of42a_party_identifier, #_192_of42a_identifier_code").prop("disabled", true).val("");
            $("#_193_of42a_party_identifier, #_194_of42d_name_and_address").prop("disabled", true).val("");
            
            if (option === "A") {
                $("#div_190_of42a_A").show();
                $("#_191_of42a_party_identifier, #_192_of42a_identifier_code").prop("disabled", false);
            } else if (option === "D") {
                $("#div_190_of42a_D").show();
                $("#_193_of42a_party_identifier, #_194_of42d_name_and_address").prop("disabled", false);
            }
        });

        // Field 58a: Requested Confirmation Party option toggle
        $("#_380_of58a_requested_confirmation_party").change(function () {
            const option = $(this).val();
            
            $("#div_380_of58a_A, #div_380_of58a_D").hide();
            $("#_381_of58a_party_identifier, #_382_of58a_bic").prop("disabled", true).val("");
            $("#_383_of58a_party_identifier, #_384_of58a_name_address").prop("disabled", true).val("");
            
            if (option === "A") {
                $("#div_380_of58a_A").show();
                $("#_381_of58a_party_identifier, #_382_of58a_bic").prop("disabled", false);
            } else if (option === "D") {
                $("#div_380_of58a_D").show();
                $("#_383_of58a_party_identifier, #_384_of58a_name_address").prop("disabled", false);
            }
        });

        // Field 53a: Reimbursing Bank option toggle
        $("#_390_of53a_reimbursing_bank").change(function () {
            const option = $(this).val();
            
            $("#div_390_of53a_A, #div_390_of53a_D").hide();
            $("#_391_of53a_party_identifier, #_392_of53a_bic").prop("disabled", true).val("");
            $("#_393_of53a_party_identifier, #_394_of53a_name_address").prop("disabled", true).val("");
            
            if (option === "A") {
                $("#div_390_of53a_A").show();
                $("#_391_of53a_party_identifier, #_392_of53a_bic").prop("disabled", false);
            } else if (option === "D") {
                $("#div_390_of53a_D").show();
                $("#_393_of53a_party_identifier, #_394_of53a_name_address").prop("disabled", false);
            }
        });

        // Field 57a: Advise Through Bank option toggle
        $("#_420_of57a_advise_through_bank").change(function () {
            const option = $(this).val();
            
            $("#div_420_of57a_A, #div_420_of57a_B, #div_420_of57a_D").hide();
            $("#_421_of57a_party_identifier, #_422_of57a_bic").prop("disabled", true).val("");
            $("#_423_of57a_party_identifier, #_424_of57a_location").prop("disabled", true).val("");
            $("#_425_of57a_party_identifier, #_426_of57a_name_address").prop("disabled", true).val("");
            
            if (option === "A") {
                $("#div_420_of57a_A").show();
                $("#_421_of57a_party_identifier, #_422_of57a_bic").prop("disabled", false);
            } else if (option === "B") {
                $("#div_420_of57a_B").show();
                $("#_423_of57a_party_identifier, #_424_of57a_location").prop("disabled", false);
            } else if (option === "D") {
                $("#div_420_of57a_D").show();
                $("#_425_of57a_party_identifier, #_426_of57a_name_address").prop("disabled", false);
            }
        });

        // ================= Initialize Field States on Page Load =================

        // Initialize Field 40E
        if ($("#_070_mf40e_applicable_rules").val() === "OTHR") {
            $("#div_070_mf40e_narrative").show();
            $("#_071_mf40e_narrative").prop("disabled", false);
        } else {
            $("#div_070_mf40e_narrative").hide();
            $("#_071_mf40e_narrative").prop("disabled", true);
        }

        // Initialize Field 52a
        const field52aOption = $("#_090_of52a_issuing_bank").val();
        if (field52aOption === "A") {
            $("#div_090_of52a_A").show();
            $("#_091_of52a_party_identifier, #_092_of52a_identifier_code").prop("disabled", false);
        } else if (field52aOption === "D") {
            $("#div_090_of52a_D").show();
            $("#_093_of52a_party_identifier, #_094_of52a_name_address").prop("disabled", false);
        } else {
            $("#div_090_of52a_A, #div_090_of52a_D").hide();
            $("#_091_of52a_party_identifier, #_092_of52a_identifier_code").prop("disabled", true);
            $("#_093_of52a_party_identifier, #_094_of52a_name_address").prop("disabled", true);
        }

        // Initialize Field 51a
        const field51aOption = $("#_110_of51a_applicant_bank").val();
        if (field51aOption === "A") {
            $("#div_110_of51a_A").show();
            $("#_111_of51a_party_identifier, #_112_of51a_bic").prop("disabled", false);
        } else if (field51aOption === "D") {
            $("#div_110_of51a_D").show();
            $("#_113_of51a_party_identifier, #_114_of51a_name_address").prop("disabled", false);
        } else {
            $("#div_110_of51a_A, #div_110_of51a_D").hide();
            $("#_111_of51a_party_identifier, #_112_of51a_bic").prop("disabled", true);
            $("#_113_of51a_party_identifier, #_114_of51a_name_address").prop("disabled", true);
        }

        // Initialize Field 41a
        const field41aOption = $("#_170_mf41a_available_with_by").val();
        if (field41aOption === "A") {
            $("#div_170_mf41a_A").show();
            $("#_171_mf41a_identifier_code").prop("disabled", false);
        } else if (field41aOption === "D") {
            $("#div_170_mf41a_D").show();
            $("#_172_mf41d_name_and_address").prop("disabled", false);
        } else {
            $("#div_170_mf41a_A, #div_170_mf41a_D").hide();
            $("#_171_mf41a_identifier_code").prop("disabled", true);
            $("#_172_mf41d_name_and_address").prop("disabled", true);
        }

        // Initialize Field 42a
        const field42aOption = $("#_190_of42a_drawee").val();
        if (field42aOption === "A") {
            $("#div_190_of42a_A").show();
            $("#_191_of42a_party_identifier, #_192_of42a_identifier_code").prop("disabled", false);
        } else if (field42aOption === "D") {
            $("#div_190_of42a_D").show();
            $("#_193_of42a_party_identifier, #_194_of42d_name_and_address").prop("disabled", false);
        } else {
            $("#div_190_of42a_A, #div_190_of42a_D").hide();
            $("#_191_of42a_party_identifier, #_192_of42a_identifier_code").prop("disabled", true);
            $("#_193_of42a_party_identifier, #_194_of42d_name_and_address").prop("disabled", true);
        }

        // Initialize Field 58a
        const field58aOption = $("#_380_of58a_requested_confirmation_party").val();
        if (field58aOption === "A") {
            $("#div_380_of58a_A").show();
            $("#_381_of58a_party_identifier, #_382_of58a_bic").prop("disabled", false);
        } else if (field58aOption === "D") {
            $("#div_380_of58a_D").show();
            $("#_383_of58a_party_identifier, #_384_of58a_name_address").prop("disabled", false);
        } else {
            $("#div_380_of58a_A, #div_380_of58a_D").hide();
            $("#_381_of58a_party_identifier, #_382_of58a_bic").prop("disabled", true);
            $("#_383_of58a_party_identifier, #_384_of58a_name_address").prop("disabled", true);
        }

        // Initialize Field 53a
        const field53aOption = $("#_390_of53a_reimbursing_bank").val();
        if (field53aOption === "A") {
            $("#div_390_of53a_A").show();
            $("#_391_of53a_party_identifier, #_392_of53a_bic").prop("disabled", false);
        } else if (field53aOption === "D") {
            $("#div_390_of53a_D").show();
            $("#_393_of53a_party_identifier, #_394_of53a_name_address").prop("disabled", false);
        } else {
            $("#div_390_of53a_A, #div_390_of53a_D").hide();
            $("#_391_of53a_party_identifier, #_392_of53a_bic").prop("disabled", true);
            $("#_393_of53a_party_identifier, #_394_of53a_name_address").prop("disabled", true);
        }

        // Initialize Field 57a
        const field57aOption = $("#_420_of57a_advise_through_bank").val();
        if (field57aOption === "A") {
            $("#div_420_of57a_A").show();
            $("#_421_of57a_party_identifier, #_422_of57a_bic").prop("disabled", false);
        } else if (field57aOption === "B") {
            $("#div_420_of57a_B").show();
            $("#_423_of57a_party_identifier, #_424_of57a_location").prop("disabled", false);
        } else if (field57aOption === "D") {
            $("#div_420_of57a_D").show();
            $("#_425_of57a_party_identifier, #_426_of57a_name_address").prop("disabled", false);
        } else {
            $("#div_420_of57a_A, #div_420_of57a_B, #div_420_of57a_D").hide();
            $("#_421_of57a_party_identifier, #_422_of57a_bic").prop("disabled", true);
            $("#_423_of57a_party_identifier, #_424_of57a_location").prop("disabled", true);
            $("#_425_of57a_party_identifier, #_426_of57a_name_address").prop("disabled", true);
        }

    });
</script>