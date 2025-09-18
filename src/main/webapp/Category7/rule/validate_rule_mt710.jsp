<%-- 
    Document   : validate_rule_mt710
    Created on : Sep 10, 2025, 10:14:59 AM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function () {

    // ================= Regex Validator =================
    $.validator.addMethod("isDateYYMMDD", function (value, element) {
        return this.optional(element) || /^\d{6}$/.test(value);
    }, "Invalid date format (expected YYMMDD)");

    $.validator.addMethod("isCurrency", function (value, element) {
        return this.optional(element) || /^[A-Z]{3}$/.test(value);
    }, "Invalid currency code (expected 3 letters)");

    $.validator.addMethod("isAmount", function (value, element) {
        return this.optional(element) || /^\d{1,12}([,\.]\d{1,2})?$/.test(value);
    }, "Invalid amount format");

    $.validator.addMethod("isBIC", function (value, element) {
        return this.optional(element) || /^[A-Z0-9]{8}([A-Z0-9]{3})?$/.test(value);
    }, "Invalid BIC format");

    $.validator.addMethod("isPercent", function (value, element) {
        return this.optional(element) || /^([0-9]|[1-9][0-9])$/.test(value);
    }, "Invalid percent (0–99)");

    // ================= Main Validator =================
    let validator = $("#form_mt710").validate({
        ignore: [],
        onkeyup: false,
        onfocusout: false,
        rules: {
            // ===== Header =====
            sender_logical_terminal: "required",
            receiver_institution: "required",
            priority: "required",

            // ===== Body Mandatory =====
            _010_mf27_sequence_of_total: "required",
            _020_mf40b_form_of_documentary_credit: "required",
            _030_mf20_sender_reference: "required",
            _040_mf21_documentary_credit_number: "required",

            _060_mf31c_date_of_issue: { required: true, isDateYYMMDD: true },
            _070_mf40e_applicable_rules: "required",
            _080_mf31d_date_of_expiry: { required: true, isDateYYMMDD: true },
            _081_mf31d_place_of_expiry: "required",

            // Applicant (M)
            _120_mf50_applicant: "required",

            // Beneficiary (M)
            _131_mf59_name_address: "required",

            // 32B Currency/Amount (M)
            _140_mf32b_currency: { required: true, isCurrency: true },
            _141_mf32b_amount: { required: true, isAmount: true },

            // 39A Percent tolerance
            _150_of39a_plus: { isPercent: true },
            _151_of39a_minus: { isPercent: true },

            // 41a Available With...By... (M)
            _170_mf41a_available_with_by: "required",
            _173_mf41a_by: "required",

            // 49 Confirmation Instructions (M)
            _370_mf49_confirmation_instructions: "required",

            // BIC Checks for Option A fields
            _091_of52a_bic: { isBIC: true },
            _112_of51a_bic: { isBIC: true },
            _172_mf41a_bic: { isBIC: true },
            _192_of42a_bic: { isBIC: true },
            _382_of58a_bic: { isBIC: true },
            _392_of53a_bic: { isBIC: true },
            _422_of57a_bic: { isBIC: true },

            // Structured narrative fields
            _300_of45a_description_of_goods_and_or_services: { maxlength: 6500 },
            _310_of46a_documents_required: { maxlength: 6500 },
            _320_of47a_conditions: { maxlength: 6500 },
            _350_of71d_charges: {
                regex: /^((\/[A-Z]+)([A-Z]{3}\d+)?(.*)?|.*)?$/
            },
            _430_of72z_information: {
                regex: /^((\/(PHONBEN|TELEBEN)\/.*)|([^\/].*))?$/
            }
        },
        messages: {
            sender_logical_terminal: { required: "Sender Logical Terminal wajib diisi..!!" },
            receiver_institution: { required: "Receiver Institution wajib diisi..!!" },
            priority: { required: "Priority wajib diisi..!!" },
            _010_mf27_sequence_of_total: { required: "Sequence of Total (27) wajib diisi..!!" },
            _020_mf40b_form_of_documentary_credit: { required: "Form of Credit (40B) wajib diisi..!!" },
            _030_mf20_sender_reference: { required: "Sender Reference (20) wajib diisi..!!" },
            _040_mf21_documentary_credit_number: { required: "Credit Number (21) wajib diisi..!!" },
            _060_mf31c_date_of_issue: { required: "Date of Issue (31C) wajib diisi..!!" },
            _070_mf40e_applicable_rules: { required: "Applicable Rules (40E) wajib diisi..!!" },
            _080_mf31d_date_of_expiry: { required: "Date of Expiry (31D) wajib diisi..!!" },
            _081_mf31d_place_of_expiry: { required: "Place of Expiry (31D) wajib diisi..!!" },
            _120_mf50_applicant: { required: "Applicant (50) wajib diisi..!!" },
            _131_mf59_name_address: { required: "Beneficiary (59) wajib diisi..!!" },
            _140_mf32b_currency: { required: "Currency (32B) wajib diisi..!!" },
            _141_mf32b_amount: { required: "Amount (32B) wajib diisi..!!" },
            _170_mf41a_available_with_by: { required: "Available With... (41a) wajib dipilih..!!" },
            _173_mf41a_by: { required: "By... (41a) wajib diisi..!!" },
            _370_mf49_confirmation_instructions: { required: "Confirmation (49) wajib diisi..!!" }
        },
        errorPlacement: function (error, element) {
            error.insertAfter(element);
            $("#tab-validate").removeAttr("hidden");
        },
        showErrors: function (errorMap, errorList) {
            this.defaultShowErrors();
            $("#tab-validate").removeAttr("hidden");

            $("#view1, #view2, #view3, #view4, #view5, #view6, #view7").hide();
            $("#view8").show();
            $('.tabs li').removeClass("selected");
            $('#tab-validate').addClass("selected");

            let errorContainer = document.getElementById("error-container");
            if (errorList.length === 0) {
                errorContainer.innerHTML = "";
                return;
            }

            let tableHTML = `<table border="0" style="width:100%; font-size:8pt; border-collapse: collapse; border:1px gray solid;">
                                <tr style="background:#d6d6d6;">
                                <th>Type</th>
                                <th>Location</th>
                                <th>Node</th>
                                <th>Message</th></tr>`;
            errorList.forEach(errors => {
                let inputID = errors.element.id || "";
                let locationTab = errors.element.getAttribute("location") || "";
                let inputType = errors.element.getAttribute("input_type") || "";
                tableHTML += `<tr class="error__row" data-input-id="${inputID}" content-body="${locationTab}" style="cursor:pointer;">
                                <td>Error</td>
                                <td>${locationTab}</td>
                                <td>${inputType}</td>
                                <td>${errors.message}</td>
                              </tr>`;
            });
            tableHTML += `</table>`;
            errorContainer.innerHTML = tableHTML;

            document.querySelectorAll(".error__row").forEach(row => {
                row.addEventListener("click", function (event) {
                    let inputId = this.getAttribute("data-input-id");
                    let tabContentGroup = this.getAttribute("content-body");
                    let input = document.getElementById(inputId);
                    if (input) {
                        $(".tabcontent").hide();
                        if (tabContentGroup == "Header") {
                            $("#view1").show(); $('#tab-view1').addClass("selected");
                        } else if (tabContentGroup == "Body") {
                            $("#view2").show(); $('#tab-view2').addClass("selected");
                        }
                        input.focus();
                    }
                });
            });
        }
    });

    // ========== Cross-field & Dependency Checks ==========
    $("#form_mt710").submit(function (e) {

        // Rule C4: Either 52a or 50B, but not both
        if ($("#_090_of52a_issuing_bank").val() && $("#_100_of50b_non_bank_issuer").val()) {
            alert("C4: Either 52a or 50B must be present, but not both.");
            e.preventDefault(); return false;
        }

        // Rule C1: If 42C used, 42a must also be present
        if ($("#_180_of42c_drafts_at").val() && !$("#_190_of42a_drawee").val()) {
            alert("C1: When 42C is used, 42a must also be present.");
            e.preventDefault(); return false;
        }

        // Rule C2: Only one of (42C+42a), 42M, or 42P allowed
        let has42C42a = ($("#_180_of42c_drafts_at").val() && $("#_190_of42a_drawee").val());
        let has42M = $("#_200_of42m_mixed_payment_details").val();
        let has42P = $("#_210_of42p_negotiation_deferred_payment_details").val();
        let count = (has42C42a ? 1 : 0) + (has42M ? 1 : 0) + (has42P ? 1 : 0);
        if (count > 1) {
            alert("C2: Only one of (42C+42a), 42M, or 42P may be present.");
            e.preventDefault(); return false;
        }

        // Rule C3: Either 44C or 44D, but not both
        if ($("#_280_of44c_latest_date").val() && $("#_290_of44d_shipment_period").val()) {
            alert("C3: Either 44C or 44D may be present, not both.");
            e.preventDefault(); return false;
        }

        // Applicable Rules OTHR → narrative required
        if ($("#_070_mf40e_applicable_rules").val() === "OTHR" && !$("#_071_mf40e_narrative").val()) {
            alert("40E: Narrative required when Applicable Rules is OTHR.");
            e.preventDefault(); return false;
        }

        // Confirmation (49) = CONFIRM/MAY ADD → 58a required
        let conf = $("#_370_mf49_confirmation_instructions").val();
        if ((conf === "CONFIRM" || conf === "MAY ADD") &&
            !$("#_380_of58a_requested_confirmation_party").val() && !$("#_381_of58a_name_address").val()) {
            alert("Rule: Field 58a must be present when 49 = CONFIRM or MAY ADD.");
            e.preventDefault(); return false;
        }
    });

    // Manual validate button
    $("#btn-validate").click(function () {
        if ($("#form_mt710").valid()) {
            alert("All inputs are valid!");
        }
    });

    // Save submit intercept
    $("#submit_mt").click(function (e) {
        e.preventDefault();
        if ($("#form_mt710").valid()) {
            $("#form_mt710").submit();
        } else {
            alert("There are still errors! Please fix them before saving.");
        }
    });
});
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />
