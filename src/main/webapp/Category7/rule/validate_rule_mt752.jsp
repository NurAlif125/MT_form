<%-- 
    Document   : validate_rule_mt752
    Created on : Sep 23, 2025, 3:51:31 PM
    Author     : mslam
--%>


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function () {

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
        if (this.optional(element)) return true;
        if (!/^\d{6}$/.test(value)) return false;
        
        const yy = parseInt(value.substr(0, 2), 10);
        const mm = parseInt(value.substr(2, 2), 10);
        const dd = parseInt(value.substr(4, 2), 10);
        
        if (mm < 1 || mm > 12) return false;
        if (dd < 1 || dd > 31) return false;
        
        const dim = [31, (yy % 4 === 0 ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        return dd <= dim[mm - 1];
    }, "Format tanggal harus YYMMDD dan valid..!!");

    $.validator.addMethod("isBIC", function(value, element) {
        return this.optional(element) || /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/.test(value);
    }, "BIC tidak valid (8 atau 11 karakter)..!!");

    $.validator.addMethod("noSlashStartEnd", function(value, element) {
        if (this.optional(element)) return true;
        return !value.startsWith('/') && !value.endsWith('/') && !value.includes('//');
    }, "Tidak boleh diawali/diakhiri '/' atau berisi '//'..!!");

    let validator = $("#form_mt752").validate({
        ignore: [],
        onkeyup: false,
        onfocusout: false,
        rules: {
            sender_logical_terminal: "required",
            receiver_institution: "required",
            priority: "required",

            _010_mf20_documentary_credit_number: {
                required: true,
                maxlength: 16,
                noSlashStartEnd: true
            },
            _020_mf21_presenting_banks_reference: {
                required: true,
                maxlength: 16,
                noSlashStartEnd: true
            },
            _030_mf23_further_identification: {
                required: true
            },
            _040_mf30_date_of_advice_of_discrepancy_or_mailing: {
                required: true,
                isDateYYMMDD: true
            },

            _050_of32b_currency: {
                isCurrency: true
            },
            _051_of32b_amount: {
                isSwiftAmount: true
            },

            _060_of71d_charges_deducted: {
                maxlength: 210
            },

            _071_of33a_date: {
                isDateYYMMDD: true
            },
            _072_of33a_currency: {
                isCurrency: true
            },
            _073_of33a_amount: {
                isSwiftAmount: true
            },

            _074_of33a_currency: {
                isCurrency: true
            },
            _075_of33a_amount: {
                isSwiftAmount: true
            },

            _081_of53a_party_identifier: { maxlength: 35 },
            _082_of53a_identifier_code: { isBIC: true },
            _083_of53a_party_identifier: { maxlength: 35 },
            _084_of53a_location: { maxlength: 35 },
            _085_of53a_party_identifier: { maxlength: 35 },
            _086_of53a_name_address: { maxlength: 140 },
            _091_of54a_party_identifier: { maxlength: 35 },
            _092_of54a_identifier_code: { isBIC: true },
            _093_of54a_party_identifier: { maxlength: 35 },
            _094_of54a_location: { maxlength: 35 },
            _095_of54a_party_identifier: { maxlength: 35 },
            _096_of54a_name_address: { maxlength: 140 },

            _100_of72z_sender_to_receiver_information: {
                maxlength: 210
            },

            _110_of79z_narrative: {
                maxlength: 1750
            }
        },
        messages: {
            sender_logical_terminal: {
                required: "Sender Logical Terminal wajib diisi..!!"
            },
            receiver_institution: {
                required: "Receiver Institution wajib diisi..!!"
            },
            priority: {
                required: "Priority wajib diisi..!!"
            },

            _010_mf20_documentary_credit_number: {
                required: "Field 20 (Documentary Credit Number) wajib diisi..!!",
                maxlength: "Field 20 maksimal 16 karakter..!!",
                noSlashStartEnd: "Field 20 tidak boleh diawali/diakhiri '/' atau berisi '//' (Error T26)..!!"
            },
            _020_mf21_presenting_banks_reference: {
                required: "Field 21 (Presenting Bank's Reference) wajib diisi..!!",
                maxlength: "Field 21 maksimal 16 karakter..!!",
                noSlashStartEnd: "Field 21 tidak boleh diawali/diakhiri '/' atau berisi '//' (Error T26)..!!"
            },
            _030_mf23_further_identification: {
                required: "Field 23 (Further Identification) wajib dipilih..!!"
            },
            _040_mf30_date_of_advice_of_discrepancy_or_mailing: {
                required: "Field 30 (Date of Advice) wajib diisi..!!",
                isDateYYMMDD: "Field 30 harus format YYMMDD yang valid (Error T50)..!!"
            },

            _050_of32b_currency: {
                isCurrency: "Field 32B Currency harus 3 huruf (ISO 4217) (Error T52)..!!"
            },
            _051_of32b_amount: {
                isSwiftAmount: "Field 32B Amount format salah (Error T40/T43)..!!"
            },
            _060_of71d_charges_deducted: {
                maxlength: "Field 71D maksimal 210 karakter..!!"
            },
            _071_of33a_date: {
                isDateYYMMDD: "Field 33a Date harus format YYMMDD (Error T50)..!!"
            },
            _072_of33a_currency: {
                isCurrency: "Field 33a Currency harus 3 huruf (Error T52)..!!"
            },
            _073_of33a_amount: {
                isSwiftAmount: "Field 33a Amount format salah (Error T40/T43)..!!"
            },
            _074_of33a_currency: {
                isCurrency: "Field 33a Currency harus 3 huruf (Error T52)..!!"
            },
            _075_of33a_amount: {
                isSwiftAmount: "Field 33a Amount format salah (Error T40/T43)..!!"
            },
            _082_of53a_identifier_code: {
                isBIC: "Field 53a BIC tidak valid (Error T27/T28/T29)..!!"
            },
            _092_of54a_identifier_code: {
                isBIC: "Field 54a BIC tidak valid (Error T27/T28/T29)..!!"
            },
            _100_of72z_sender_to_receiver_information: {
                maxlength: "Field 72Z maksimal 210 karakter..!!"
            },
            _110_of79z_narrative: {
                maxlength: "Field 79Z maksimal 1750 karakter..!!"
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
                tableHTML += `<tr class="error__row" data-input-id="${inputID}" content-body="${locationTab}" style="cursor:pointer;" onmouseover="this.style.background='#f6f6f6'" onmouseout="this.style.backgroundColor='transparent'">
                                <td style="padding: 5px;">Error</td>
                                <td style="padding: 5px;">${locationTab}</td>
                                <td style="padding: 5px;">${inputType}</td>
                                <td style="padding: 5px;">${errors.message}</td>
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
                        if (tabContentGroup === "Header") {
                            $("#view2, #view3, #view4, #view5, #view6, #view7, #view8").hide();
                            $("#view1").show();
                            $('#tab-view1').addClass("selected");
                            $('#tab-view2, #tab-view3, #tab-view4, #tab-view5, #tab-view6, #tab-view7, #tab-validate').removeClass("selected");
                        } else if (tabContentGroup === "Body") {
                            $("#view1, #view3, #view4, #view5, #view6, #view7, #view8").hide();
                            $("#view2").show();
                            $('#tab-view2').addClass("selected");
                            $('#tab-view1, #tab-view3, #tab-view4, #tab-view5, #tab-view6, #tab-view7, #tab-validate').removeClass("selected");
                        }
                        input.focus();
                    }
                });
            });
        }
    });

    $("#btn-validate").click(function () {
        let isValid = $("#form_mt752").valid();
        if (!isValid) {
            return false;
        }

        let errMsgs = [];

        let f23 = $("#_030_mf23_further_identification").val();
        let f32bCur = $("#_050_of32b_currency").val().trim();
        let f32bAmt = $("#_051_of32b_amount").val().trim();
        let f71d = $("#_060_of71d_charges_deducted").val().trim();
        let f33aOpt = $("#_070_of33a_net_amount").val();
        let f33aDateA = $("#_071_of33a_date").val().trim();
        let f33aCurA = $("#_072_of33a_currency").val().trim();
        let f33aAmtA = $("#_073_of33a_amount").val().trim();
        let f33aCurB = $("#_074_of33a_currency").val().trim();
        let f33aAmtB = $("#_075_of33a_amount").val().trim();
        let f53a = $("#_080_of53a_senders_correspondent").val();
        let f54a = $("#_090_of54a_receivers_correspondent").val();
        let f72z = $("#_100_of72z_sender_to_receiver_information").val().trim();

        if (f32bCur && f32bAmt && f71d && !f33aOpt) {
            errMsgs.push("Rule C1 (Error C18): Jika Field 32B dan 71D ada, maka Field 33a wajib diisi.");
        }

        if (f32bCur && f33aOpt) {
            let f33aCur = (f33aOpt === "A") ? f33aCurA : f33aCurB;
            if (f33aCur && f32bCur !== f33aCur) {
                errMsgs.push("Rule C2 (Error C02): Currency pada Field 32B dan 33a harus sama.");
            }
        }

        if ((f23 === "REMITTED" || f23 === "DEBIT") && f33aOpt !== "A") {
            errMsgs.push("Usage Rule: Jika Field 23 = REMITTED/DEBIT, maka Field 33a Option A (dengan Date) wajib diisi.");
        }

        if (f33aOpt === "A" && (!f33aDateA || !f33aCurA || !f33aAmtA)) {
            errMsgs.push("Field 33a Option A: Date, Currency, dan Amount wajib diisi semua.");
        }

        if (f33aOpt === "B" && (!f33aCurB || !f33aAmtB)) {
            errMsgs.push("Field 33a Option B: Currency dan Amount wajib diisi.");
        }

        if (f72z && f72z.includes("RCB") && (!f53a || !f54a)) {
            errMsgs.push("Usage Rule: Jika Field 72Z berisi kode RCB, maka Field 53a dan 54a wajib diisi.");
        }

        if (errMsgs.length > 0) {
            alert("Validasi gagal:\n\n- " + errMsgs.join("\n- "));
            return false;
        }

        alert("Semua validasi berhasil!");
    });

    $("#submit_mt").click(function (e) {
        e.preventDefault();
        
        let isValid = $("#form_mt752").valid();
        if (!isValid) {
            alert("Masih ada error! Perbaiki dulu sebelum submit.");
            return false;
        }

        let errMsgs = [];

        let f23 = $("#_030_mf23_further_identification").val();
        let f32bCur = $("#_050_of32b_currency").val().trim();
        let f32bAmt = $("#_051_of32b_amount").val().trim();
        let f71d = $("#_060_of71d_charges_deducted").val().trim();
        let f33aOpt = $("#_070_of33a_net_amount").val();
        let f33aDateA = $("#_071_of33a_date").val().trim();
        let f33aCurA = $("#_072_of33a_currency").val().trim();
        let f33aAmtA = $("#_073_of33a_amount").val().trim();
        let f33aCurB = $("#_074_of33a_currency").val().trim();
        let f33aAmtB = $("#_075_of33a_amount").val().trim();
        let f53a = $("#_080_of53a_senders_correspondent").val();
        let f54a = $("#_090_of54a_receivers_correspondent").val();
        let f72z = $("#_100_of72z_sender_to_receiver_information").val().trim();

        if (f32bCur && f32bAmt && f71d && !f33aOpt) {
            errMsgs.push("Rule C1 (Error C18): Jika Field 32B dan 71D ada, maka Field 33a wajib diisi.");
        }

        if (f32bCur && f33aOpt) {
            let f33aCur = (f33aOpt === "A") ? f33aCurA : f33aCurB;
            if (f33aCur && f32bCur !== f33aCur) {
                errMsgs.push("Rule C2 (Error C02): Currency pada Field 32B dan 33a harus sama.");
            }
        }

        if ((f23 === "REMITTED" || f23 === "DEBIT") && f33aOpt !== "A") {
            errMsgs.push("Usage Rule: Jika Field 23 = REMITTED/DEBIT, maka Field 33a Option A (dengan Date) wajib diisi.");
        }

        if (f33aOpt === "A" && (!f33aDateA || !f33aCurA || !f33aAmtA)) {
            errMsgs.push("Field 33a Option A: Date, Currency, dan Amount wajib diisi semua.");
        }

        if (f33aOpt === "B" && (!f33aCurB || !f33aAmtB)) {
            errMsgs.push("Field 33a Option B: Currency dan Amount wajib diisi.");
        }

        if (f72z && f72z.includes("RCB") && (!f53a || !f54a)) {
            errMsgs.push("Usage Rule: Jika Field 72Z berisi kode RCB, maka Field 53a dan 54a wajib diisi.");
        }

        if ((f32bCur && !f32bAmt) || (!f32bCur && f32bAmt)) {
            errMsgs.push("Field 32B: Currency dan Amount harus diisi bersamaan.");
        }

        if (errMsgs.length > 0) {
            alert("Validasi gagal:\n\n- " + errMsgs.join("\n- "));
            return false;
        }

        $("#form_mt752").submit();
    });

    if ($("#_070_of33a_net_amount").val() !== "") {
        let opt = $("#_070_of33a_net_amount").val();
        if (opt === "A") {
            $("#div_070_of33a_A").show();
            $("#div_070_of33a_B").hide();
        } else if (opt === "B") {
            $("#div_070_of33a_A").hide();
            $("#div_070_of33a_B").show();
        }
    } else {
        $("#div_070_of33a_A").hide();
        $("#div_070_of33a_B").hide();
    }

    if ($("#_080_of53a_senders_correspondent").val() !== "") {
        let opt = $("#_080_of53a_senders_correspondent").val();
        $("#div_080_of53a_A").toggle(opt === "A");
        $("#div_080_of53a_B").toggle(opt === "B");
        $("#div_080_of53a_D").toggle(opt === "D");
    } else {
        $("#div_080_of53a_A, #div_080_of53a_B, #div_080_of53a_D").hide();
    }

    if ($("#_090_of54a_receivers_correspondent").val() !== "") {
        let opt = $("#_090_of54a_receivers_correspondent").val();
        $("#div_090_of54a_A").toggle(opt === "A");
        $("#div_090_of54a_B").toggle(opt === "B");
        $("#div_090_of54a_D").toggle(opt === "D");
    } else {
        $("#div_090_of54a_A, #div_090_of54a_B, #div_090_of54a_D").hide();
    }
});
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />