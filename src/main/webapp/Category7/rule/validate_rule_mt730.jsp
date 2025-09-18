<%-- 
    Document   : validate_rule_mt730
    Created on : Sep 12, 2025, 2:25:00 PM
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
    const validCodes = ["BENACC","BENREJ"];
    for (let i=0; i<lines.length; i++) {
        const line = lines[i].trim();
        if (line.startsWith("/")) {
            // contoh: /BENACC/ narrative...
            const match = line.match(/^\/([A-Z0-9]{3,8})\/(.*)$/);
            if (!match) return false;
            if (!validCodes.includes(match[1])) return false;
        }
    }
    return true;
    }, "Invalid format in field 72Z: must use /BENACC/ or /BENREJ/ at line start if using code.");
    
    $.validator.addMethod("is71dFormat", function (value, element) {
    if (!value) return true; // optional
    const lines = value.split(/\r?\n/);
    const validCodes = ["AGENT","COMM","CORCOM","DISC","INSUR","POST","STAMP","TELECHAR","WAREHOUS"];
    for (let i=0; i<lines.length; i++) {
        const line = lines[i].trim();
        if (line.startsWith("/")) {
            // /CODE/[CurrencyAmount] Narrative
            const match = line.match(/^\/([A-Z]{3,8})\/(.*)$/);
            if (!match) return false;
            if (!validCodes.includes(match[1])) return false;
        } else if (line.startsWith("//")) {
            continue; // continuation OK
        } else if (line.startsWith("/")) {
            return false; // invalid code
        }
    }
    return true;
    }, "Invalid format in field 71D: must use valid structured code or narrative.");


    // ================= Main Validator =================
    let validator = $("#form_mt730").validate({
        ignore: [],
        onkeyup: false,
        onfocusout: false,
        rules: {
            // ===== Header =====
            sender_logical_terminal: "required",
            receiver_institution: "required",
            priority: "required",

            // ===== Body =====
            _010_mf20_sender_reference: { required: true, isRef: true },
            _020_mf21_receiver_reference: { required: true, isRef: true },
            _030_of25_account_identification: { maxlength: 35 },

            _040_mf30_date_of_message_being_acknowledged: { required: true, isDateYYMMDD: true },

            // 32a Option B/D
            _051_of32a_date: { isDateYYMMDD: true },
            _052_of32a_currency: { isCurrency: true },
            _053_of32a_amount: { isAmount: true },

            // 57a
            _061_of57a_party_identifier: { maxlength: 35 },
            _062_of57a_identifier_code: { isBIC: true },
            _063_of57a_name_address: { maxlength: 140 },

            // Text fields max length
            _070_of71d_charges: { maxlength: 210, is71dFormat: true },
            _080_of72z_sender_to_receiver_information: { maxlength: 210, is72zFormat: true },
            _090_of79z_narrative: { maxlength: 1750 }
        },
        messages: {
            sender_logical_terminal: { required: "Sender Logical Terminal wajib diisi..!!" },
            receiver_institution: { required: "Receiver Institution wajib diisi..!!" },
            priority: { required: "Priority wajib diisi..!!" },

            _010_mf20_sender_reference: { required: "Field 20: Sender's Reference wajib diisi..!!" },
            _020_mf21_receiver_reference: { required: "Field 21: Receiver's Reference wajib diisi..!!" },
            _040_mf30_date_of_message_being_acknowledged: { required: "Field 30: Date of Message Being Acknowledged wajib diisi..!!" }
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
    $("#form_mt730").submit(function (e) {

        // C1: Either 25 or 57a, but not both
        if ($("#_030_of25_account_identification").val() && $("#_060_of57a_account_with_bank").val()) {
            alert("Rule C1: Either field 25 or 57a may be present, not both.");
            e.preventDefault(); return false;
        }

        // C2: If 32a is present, 57a must not be present
        if ($("#_050_of32a_amount_of_charges").val() && $("#_060_of57a_account_with_bank").val()) {
            alert("Rule C2: If 32a is present, 57a must not be present.");
            e.preventDefault(); return false;
        }

        // 32a Option B
        if ($("#_050_of32a_amount_of_charges").val() === "B") {
            if (!$("#_052_of32a_currency").val() || !$("#_053_of32a_amount").val()) {
                alert("32a Option B requires Currency and Amount.");
                e.preventDefault(); return false;
            }
        }

        // 32a Option D
        if ($("#_050_of32a_amount_of_charges").val() === "D") {
            if (!$("#_051_of32a_date").val() || !$("#_052_of32a_currency").val() || !$("#_053_of32a_amount").val()) {
                alert("32a Option D requires Date, Currency and Amount.");
                e.preventDefault(); return false;
            }
        }

        // 57a Option A
        if ($("#_060_of57a_account_with_bank").val() === "A") {
            if (!$("#_062_of57a_identifier_code").val()) {
                alert("57a Option A requires valid Identifier Code (BIC).");
                e.preventDefault(); return false;
            }
        }

        // 57a Option D
        if ($("#_060_of57a_account_with_bank").val() === "D") {
            if (!$("#_063_of57a_name_address").val()) {
                alert("57a Option D requires Name & Address.");
                e.preventDefault(); return false;
            }
        }
    });

    // Manual validate button
    $("#btn-validate").click(function () {
        if ($("#form_mt730").valid()) {
            alert("All inputs are valid!");
        }
    });

    // Save submit intercept
    $("#submit_mt").click(function (e) {
        e.preventDefault();
        if ($("#form_mt730").valid()) {
            $("#form_mt730").submit();
        } else {
            alert("There are still errors! Please fix them before saving.");
        }
    });
});
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

