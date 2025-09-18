<%-- 
    Document   : validate_rule_mt734
    Created on : Sep 12, 2025, 2:25:20 PM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function () {

    // ================= Regex Validator =================
    $.validator.addMethod("isRef", function (value, element) {
        return this.optional(element) || 
               (/^[^\/](.*[^\/])?$/.test(value) && !/\/\//.test(value));
    }, "Invalid reference format (no leading/trailing '/', no '//')");

    $.validator.addMethod("isDateYYMMDD", function (value, element) {
        return this.optional(element) || /^\d{6}$/.test(value);
    }, "Invalid date format (expected YYMMDD)");

    $.validator.addMethod("isCurrency", function (value, element) {
        return this.optional(element) || /^[A-Z]{3}$/.test(value);
    }, "Invalid currency code (expected 3 letters)");

    $.validator.addMethod("isAmount", function (value, element) {
        return this.optional(element) || /^\d+,\d{2}$/.test(value);
    }, "Invalid amount format (expected n,dd)");

    $.validator.addMethod("isBIC", function (value, element) {
        return this.optional(element) || /^[A-Z0-9]{8}([A-Z0-9]{3})?$/.test(value);
    }, "Invalid BIC format");

    $.validator.addMethod("is72zFormat", function (value, element) {
        if (!value) return true; // optional
        const lines = value.split(/\r?\n/);
        for (let i=0; i<lines.length; i++) {
            const line = lines[i].trim();
            if (line.startsWith("/")) {
                // /CODE/ narrative
                const match = line.match(/^\/([A-Z0-9]{2,8})\/(.*)$/);
                if (!match) return false;
            } else if (line.startsWith("//")) {
                continue; // continuation OK
            }
        }
        return true;
    }, "Invalid format in field 72Z");

    $.validator.addMethod("is77bFormat", function (value, element) {
        if (!value) return false; // mandatory
        const lines = value.split(/\r?\n/);
        const validCodes = ["HOLD","NOTIFY","PREVINST","RETURN"];
        const firstLine = lines[0].trim();
        if (!firstLine.startsWith("/")) return false;
        const match = firstLine.match(/^\/([A-Z]{3,8})\/(.*)$/);
        if (!match) return false;
        if (!validCodes.includes(match[1])) return false;
        return true;
    }, "Invalid format in field 77B: must start with /HOLD/, /NOTIFY/, /PREVINST/ or /RETURN/");

    // ================= Main Validator =================
    let validator = $("#form_mt734").validate({
        ignore: [],
        onkeyup: false,
        onfocusout: false,
        rules: {
            // ===== Header =====
            sender_logical_terminal: "required",
            receiver_institution: "required",
            priority: "required",

            // ===== Body =====
            _010_mf20_sender_trn: { required: true, isRef: true, maxlength: 16 },
            _020_mf21_presenting_bank_reference: { required: true, isRef: true, maxlength: 16 },

            _030_mf32a_date: { required: true, isDateYYMMDD: true },
            _031_mf32a_currency: { required: true, isCurrency: true },
            _032_mf32a_amount: { required: true, isAmount: true },

            _040_of73A_charges_claimed: { maxlength: 210 },

            // 33a
            _051_of33a_date: { isDateYYMMDD: true },
            _052_of33a_currency: { isCurrency: true },
            _053_of33a_amount: { isAmount: true },

            // 57a
            _061_of57a_party_identifier: { maxlength: 35 },
            _062_of57a_identifier_code: { isBIC: true },
            _063_of57a_location: { maxlength: 35 },
            _064_of57a_name_address: { maxlength: 140 },

            // 72Z
            _070_of72z_sender_to_receiver_information: { maxlength: 210, is72zFormat: true },

            // 77J & 77B mandatory
            _080_mf77j_discrepancies: { required: true, maxlength: 3500 },
            _090_mf77b_disposal_of_documents: { required: true, maxlength: 105, is77bFormat: true }
        },
        messages: {
            sender_logical_terminal: { required: "Sender Logical Terminal wajib diisi..!!" },
            receiver_institution: { required: "Receiver Institution wajib diisi..!!" },
            priority: { required: "Priority wajib diisi..!!" },

            _010_mf20_sender_trn: { required: "Field 20: Sender's TRN wajib diisi..!!" },
            _020_mf21_presenting_bank_reference: { required: "Field 21: Presenting Bank's Reference wajib diisi..!!" },
            _030_mf32a_date: { required: "Field 32A Date wajib diisi..!!" },
            _031_mf32a_currency: { required: "Field 32A Currency wajib diisi..!!" },
            _032_mf32a_amount: { required: "Field 32A Amount wajib diisi..!!" },
            _080_mf77j_discrepancies: { required: "Field 77J Discrepancies wajib diisi..!!" },
            _090_mf77b_disposal_of_documents: { required: "Field 77B Disposal of Documents wajib diisi..!!" }
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
                let locationTab = errors.element.getAttribute("location") || "Body";
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
                row.addEventListener("click", function () {
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
    $("#form_mt734").submit(function (e) {
        // C1: If 73A is present, 33a must also be present
        if ($("#_040_of73A_charges_claimed").val().trim() !== "" && !$("#_050_of33a_total_amount_claimed").val()) {
            alert("Rule C1: If field 73A is present, field 33a must also be present.");
            e.preventDefault(); return false;
        }

        // C2: Currency in 32A and 33a must match
        if ($("#_050_of33a_total_amount_claimed").val() !== "") {
            let c32 = $("#_031_mf32a_currency").val().trim();
            let c33 = $("#_052_of33a_currency").val().trim();
            if (c32 && c33 && c32 !== c33) {
                alert("Rule C2: Currency code in 32A and 33a must be the same.");
                e.preventDefault(); return false;
            }
        }

        // 33a Option A requires Date+Currency+Amount
        if ($("#_050_of33a_total_amount_claimed").val() === "A") {
            if (!$("#_051_of33a_date").val() || !$("#_052_of33a_currency").val() || !$("#_053_of33a_amount").val()) {
                alert("33a Option A requires Date, Currency and Amount.");
                e.preventDefault(); return false;
            }
        }

        // 33a Option B requires Currency+Amount
        if ($("#_050_of33a_total_amount_claimed").val() === "B") {
            if (!$("#_052_of33a_currency").val() || !$("#_053_of33a_amount").val()) {
                alert("33a Option B requires Currency and Amount.");
                e.preventDefault(); return false;
            }
        }

        // 57a Option A requires valid BIC
        if ($("#_060_of57a_account_with_bank").val() === "A") {
            if (!$("#_062_of57a_identifier_code").val()) {
                alert("57a Option A requires Identifier Code (BIC).");
                e.preventDefault(); return false;
            }
        }
        // 57a Option B requires Location
        if ($("#_060_of57a_account_with_bank").val() === "B") {
            if (!$("#_063_of57a_location").val()) {
                alert("57a Option B requires Location.");
                e.preventDefault(); return false;
            }
        }
        // 57a Option D requires Name & Address
        if ($("#_060_of57a_account_with_bank").val() === "D") {
            if (!$("#_064_of57a_name_address").val()) {
                alert("57a Option D requires Name & Address.");
                e.preventDefault(); return false;
            }
        }
    });

    // Manual validate button
    $("#btn-validate").click(function () {
        if ($("#form_mt734").valid()) {
            alert("All inputs are valid!");
        }
    });

    // Save submit intercept
    $("#submit_mt").click(function (e) {
        e.preventDefault();
        if ($("#form_mt734").valid()) {
            $("#form_mt734").submit();
        } else {
            alert("There are still errors! Please fix them before saving.");
        }
    });
});
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

