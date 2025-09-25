<%-- 
    Document   : validate_rule_mt752
    Created on : Sep 23, 2025, 3:51:31 PM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function () {

    /* ===================== Custom Validators ===================== */
    $.validator.addMethod("regex", function(value, element, param) {
        return this.optional(element) || param.test(value);
    }, "Format tidak valid");

    $.validator.addMethod("isCurrency", function(value, element) {
        return this.optional(element) || /^[A-Z]{3}$/.test(value);
    }, "Kode mata uang harus 3 huruf ISO 4217..!!");

    $.validator.addMethod("isSwiftAmount", function(value, element) {
        return this.optional(element) || /^\d+(,\d{1,2})?$/.test(value);
    }, "Format jumlah salah (gunakan koma untuk desimal)..!!");

    $.validator.addMethod("isDateYYMMDD", function(value, element) {
        return this.optional(element) || /^\d{6}$/.test(value);
    }, "Format tanggal harus YYMMDD..!!");

    $.validator.addMethod("isBIC", function(value, element) {
        return this.optional(element) || /^[A-Z0-9]{8}([A-Z0-9]{3})?$/.test(value);
    }, "BIC tidak valid (8 atau 11 karakter)..!!");

    /* ===================== Validator Init ===================== */
    let validator = $("#form_mt752").validate({
        ignore: [],
        onkeyup: false,
        onfocusout: false,
        rules: {
            /* ===== Header ===== */
            sender_logical_terminal: "required",
            receiver_institution: "required",
            priority: "required",

            /* ===== Body Mandatory ===== */
            _010_mf20_documentary_credit_number: {
                required: true,
                regex: /^(?!\/)(?!.*\/\/)(.{1,16})(?<!\/)$/   // 16x tanpa '/' awal/akhir, tanpa '//'
            },
            _020_mf21_presenting_banks_reference: {
                required: true,
                regex: /^(?!\/)(?!.*\/\/)(.{1,16})(?<!\/)$/   // sama seperti field 20
            },
            _030_mf23_further_identification: { required: true },
            _040_mf30_date_of_advice_of_discrepancy_or_mailing: {
                required: true,
                isDateYYMMDD: true
            },

            /* ===== Optional ===== */
            _050_of32b_currency: { isCurrency: true },
            _051_of32b_amount: { isSwiftAmount: true },

            _060_of71d_charges_deducted: { maxlength: 210 },

            _070_of33a_date: { isDateYYMMDD: true },
            _071_of33a_currency: { isCurrency: true },
            _072_of33a_amount: { isSwiftAmount: true },

            _081_of53a_party_identifier: { maxlength: 35 },
            _082_of53a_identifier_code: { isBIC: true },
            _083_of53a_location: { maxlength: 35 },
            _084_of53a_name_address: { maxlength: 140 },

            _091_of54a_party_identifier: { maxlength: 35 },
            _092_of54a_identifier_code: { isBIC: true },
            _093_of54a_location: { maxlength: 35 },
            _094_of54a_name_address: { maxlength: 140 },

            _100_of72z_sender_to_receiver_information: { maxlength: 210 },
            _110_of79z_narrative: { maxlength: 3500 }   // sesuai SWIFT: 70x50 = 3500
        },
        messages: {
            sender_logical_terminal: { required: "Sender LT wajib diisi..!!" },
            receiver_institution: { required: "Receiver Institution wajib diisi..!!" },
            priority: { required: "Priority wajib diisi..!!" },

            _010_mf20_documentary_credit_number: {
                required: "Field 20 wajib diisi..!!",
                regex: "Field 20 tidak boleh diawali/diakhiri '/', dan tidak boleh ada '//'."
            },
            _020_mf21_presenting_banks_reference: {
                required: "Field 21 wajib diisi..!!",
                regex: "Field 21 tidak boleh diawali/diakhiri '/', dan tidak boleh ada '//'."
            },
            _030_mf23_further_identification: { required: "Field 23 wajib dipilih..!!" },
            _040_mf30_date_of_advice_of_discrepancy_or_mailing: {
                required: "Field 30 wajib diisi..!!",
                isDateYYMMDD: "Format tanggal harus YYMMDD..!!"
            }
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

            $('#tab-view1, #tab-view2, #tab-view3, #tab-view4, #tab-view5, #tab-view6, #tab-view7').removeClass("selected");
            $('#tab-validate').addClass("selected");

            let errorContainer = document.getElementById("error-container");
            if (errorList.length === 0) {
                errorContainer.innerHTML = "";
                return;
            }

            let tableHTML = `<table border="0" style="width:100%; font-size:8pt; border-collapse:collapse; border:1px gray solid;">
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
        }
    });

    /* ===================== Button Validate ===================== */
    $("#btn-validate").click(function () {
        let isValid = $("#form_mt752").valid();
        if (isValid) {
            alert("Semua input valid!");
        }
    });

    /* ===================== Cross-Field & Usage Rules ===================== */
    $("#submit_mt").click(function (e) {
        e.preventDefault();
        let isValid = $("#form_mt752").valid();
        if (!isValid) {
            alert("Masih ada error! Perbaiki dulu sebelum submit.");
            return false;
        }

        let errMsgs = [];
        let f23 = $("#_030_mf23_further_identification").val();
        let f33aDate = $("#_070_of33a_date").val();
        let f33aCur = $("#_071_of33a_currency").val();
        let f33aAmt = $("#_072_of33a_amount").val();
        let f32bCur = $("#_050_of32b_currency").val();
        let f32bAmt = $("#_051_of32b_amount").val();
        let f71d = $("#_060_of71d_charges_deducted").val();
        let f72z = $("#_100_of72z_sender_to_receiver_information").val();
        let f53a = $("#_080_of53a_senders_correspondent").val();
        let f54a = $("#_090_of54a_receivers_correspondent").val();

        // C1: If 32B + 71D → 33a required
        if (f32bCur && f32bAmt && f71d && (!f33aCur || !f33aAmt)) {
            errMsgs.push("Jika 32B dan 71D ada, maka 33a wajib diisi. [C1]");
        }

        // C2: 32B & 33a currency must match
        if (f32bCur && f33aCur && f32bCur !== f33aCur) {
            errMsgs.push("Currency 32B dan 33a harus sama. [C2]");
        }

        // Usage: If 23 = REMITTED or DEBIT → 33a Option A (date required)
        if ((f23 === "REMITTED" || f23 === "DEBIT") && !f33aDate) {
            errMsgs.push("Jika Field 23 = REMITTED/DEBIT, maka 33a (dengan tanggal) wajib diisi.");
        }

        // Usage: If 72Z contains RCB → 53a & 54a must be present
        if (f72z && f72z.includes("RCB") && (!f53a || !f54a)) {
            errMsgs.push("Jika Field 72Z berisi RCB, maka 53a dan 54a wajib diisi.");
        }

        if (errMsgs.length > 0) {
            alert("Validasi gagal:\n- " + errMsgs.join("\n- "));
            return false;
        }

        $("#form_mt752").submit();
    });
});
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />



