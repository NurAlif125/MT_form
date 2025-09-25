<%-- 
    Document   : validate_rule_mt759
    Created on : Sep 24, 2025, 4:30:59 PM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function () {
    let validator = $("#form_mt759").validate({
        ignore: [],
        onkeyup: false,
        onfocusout: false,

        rules: {
            // === Header (common) ===
            sender_logical_terminal: "required",
            receiver_institution: "required",
            priority: "required",

            // === Body MT759 ===
            _010_mf27_sequence_of_total: { required: true, regex: /^\d(\/\d)?$/ },
            _020_mf20_transaction_reference_number: { required: true, regex: /^(?!\/)(?!.*\/\/)(?!.*\/$).{1,16}$/ },
            _030_of21_related_reference_number: { regex: /^(?!\/)(?!.*\/\/)(?!.*\/$).{0,16}$/ },
            _040_mf22d_form_of_undertaking: "required",
            _050_of23_undertaking_number: { maxlength: 16 },
            _061_of52a_party_identifier: { maxlength: 35 },
            _062_of52a_identifier_code: { regex: /^[A-Z0-9]{8}([A-Z0-9]{3})?$/ }, // BIC check
            _063_of52a_name_address: { maxlength: 140 },
            _070_mf23h_function_of_message: "required",
            _080_mf45d_narrative: "required",
            _090_of23x_file_identification: { regex: /^(COUR|EMAL|FACT|FAXT|HOST|MAIL|OTHR)?$/ },
            _091_of23x_file_name: { maxlength: 65 }
        },

        messages: {
            sender_logical_terminal: { required: "Sender LT wajib diisi." },
            receiver_institution: { required: "Receiver institution wajib diisi." },
            priority: { required: "Priority wajib diisi." },

            _010_mf27_sequence_of_total: {
                required: "Field 27 (Sequence of Total) wajib diisi.",
                regex: "Format harus n atau n/n (contoh: 1/1)."
            },
            _020_mf20_transaction_reference_number: {
                required: "Field 20 wajib diisi.",
                regex: "Field 20 tidak boleh diawali/diakhiri '/', atau mengandung '//'."
            },
            _030_of21_related_reference_number: {
                regex: "Field 21 tidak boleh diawali/diakhiri '/', atau mengandung '//'."
            },
            _040_mf22d_form_of_undertaking: { required: "Field 22D wajib dipilih." },
            _050_of23_undertaking_number: { maxlength: "Maksimal 16 karakter." },
            _061_of52a_party_identifier: { maxlength: "Maksimal 35 karakter." },
            _062_of52a_identifier_code: { regex: "Identifier Code harus BIC valid (8 atau 11 alfanumerik)." },
            _063_of52a_name_address: { maxlength: "Maksimal 140 karakter." },
            _070_mf23h_function_of_message: { required: "Field 23H wajib dipilih." },
            _080_mf45d_narrative: { required: "Field 45D wajib diisi." },
            _090_of23x_file_identification: { regex: "Code harus salah satu: COUR, EMAL, FACT, FAXT, HOST, MAIL, OTHR." },
            _091_of23x_file_name: { maxlength: "Maksimal 65 karakter." }
        },

        errorPlacement: function (error, element) {
            error.insertAfter(element);
            $("#tab-validate").removeAttr("hidden");
        },

        showErrors: function (errorMap, errorList) {
            this.defaultShowErrors();
            $("#tab-validate").removeAttr("hidden");
            $("#view1,#view2,#view3,#view4,#view5,#view6,#view7").hide();
            $("#view8").show();
            $('#tab-validate').addClass("selected");

            let errorContainer = document.getElementById("error-container");
            if (errorList.length === 0) { errorContainer.innerHTML = ""; return; }

            let tableHTML = `<table border="0" style="width:100%;font-size:8pt;border-collapse:collapse;border:1px solid gray;">
                                <tr style="background:#d6d6d6;">
                                    <th>Type</th><th>Location</th><th>Field</th><th>Message</th>
                                </tr>`;
            errorList.forEach(errors => {
                let inputID = errors.element.id || "";
                let locationTab = errors.element.getAttribute("location") || "";
                let inputType = errors.element.getAttribute("input_type") || "";
                tableHTML += `<tr class="error__row" data-input-id="${inputID}" content-body="${locationTab}">
                                <td>Error</td>
                                <td>${locationTab}</td>
                                <td>${inputType}</td>
                                <td>${errors.message}</td>
                              </tr>`;
            });
            tableHTML += `</table>`;
            errorContainer.innerHTML = tableHTML;
        }
    });

    // === Custom regex method ===
    $.validator.addMethod("regex", function(value, element, param) {
        return this.optional(element) || param.test(value);
    }, "Format tidak valid");

    // === Cross-field & Business Rules ===
    $("#form_mt759").on("submit", function (e) {
        // Field 27 logic: Number/Total range check
        let seq = $("#_010_mf27_sequence_of_total").val();
        if(seq){
            let parts = seq.split("/");
            let num = parseInt(parts[0],10);
            let tot = parts[1] ? parseInt(parts[1],10) : num;
            if(isNaN(num)||isNaN(tot)||num<1||num>8||tot<1||tot>8||num>tot){
                alert("Field 27: Number dan Total harus antara 1–8, dengan Number ≤ Total.");
                e.preventDefault(); return false;
            }
        }

        // Rule C1
        const f22d = $("#_040_mf22d_form_of_undertaking").val();
        const f23h = $("#_070_mf23h_function_of_message").val();
        if (["ISSUANCE","REQISSUE","REQAMEND","ISSAMEND"].includes(f23h) && f22d !== "UNDK") {
            alert("Rule C1: Jika 23H = ISSUANCE/REQISSUE/REQAMEND/ISSAMEND, maka 22D harus UNDK.");
            e.preventDefault(); return false;
        }
        if (f23h === "TRANSFER" && !["DGAR","STBY","UNDK"].includes(f22d)) {
            alert("Rule C1: Jika 23H = TRANSFER, maka 22D harus DGAR, STBY, atau UNDK.");
            e.preventDefault(); return false;
        }
        if (["CLSVOPEN","CLSVCLOS","FRAUDMSG","GENINFAD","OTHERFNC","REIMBURS","REQFINAN"].includes(f23h) &&
            !["DGAR","DOCR","STBY","UNDK"].includes(f22d)) {
            alert("Rule C1: Untuk 23H ini, 22D harus DGAR, DOCR, STBY, atau UNDK.");
            e.preventDefault(); return false;
        }

        // Rule 23X consistency
        let f23xCode = $("#_090_of23x_file_identification").val();
        let f23xName = $("#_091_of23x_file_name").val();
        if (f23xCode && !f23xName) {
            alert("Rule: Jika 23X code diisi, maka file name/reference juga wajib diisi.");
            e.preventDefault(); return false;
        }
        if (f23xName && /[\/\\]/.test(f23xName)) {
            alert("Rule: File name/reference 23X tidak boleh mengandung path (‘/’ atau ‘\\’).");
            e.preventDefault(); return false;
        }
    });
});
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />
