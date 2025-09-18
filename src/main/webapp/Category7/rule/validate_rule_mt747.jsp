<%-- 
    Document   : validate_rule_mt747
    Created on : Sep 15, 2025, 11:09:32 AM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function () {
    /* ===================== Custom Validator Methods ===================== */
    $.validator.addMethod("regex", function(value, element, param) {
        return this.optional(element) || param.test(value);
    }, "Format tidak valid");

    $.validator.addMethod("yymmdd", function(value, element) {
        if (this.optional(element)) return true;
        if (!/^\d{6}$/.test(value)) return false;
        let yy = parseInt(value.substr(0,2),10);
        let mm = parseInt(value.substr(2,2),10);
        let dd = parseInt(value.substr(4,2),10);
        if (mm < 1 || mm > 12) return false;
        let dim = [31,(yy % 4 === 0 ? 29 : 28),31,30,31,30,31,31,30,31,30,31];
        return dd <= dim[mm-1];
    }, "Format tanggal harus YYMMDD");

    $.validator.addMethod("currency", function(value, element) {
        return this.optional(element) || /^[A-Z]{3}$/.test(value);
    }, "Mata uang harus 3 huruf ISO");

    $.validator.addMethod("swiftAmount", function(value, element) {
        return this.optional(element) || /^\d+(,\d{2})$/.test(value);
    }, "Format jumlah salah, gunakan n,dd (misal: 1000,00)");

    $.validator.addMethod("dc20", function(value, element) {
        return this.optional(element) || (!/^\/|\/$/.test(value) && !/\/\//.test(value));
    }, "Field tidak boleh diawali/diakhiri '/' atau mengandung '//'");

    // 72Z: Narrative bebas atau /CANC/... sesuai pedoman
    $.validator.addMethod("info72Z", function(value, element) {
        if (this.optional(element)) return true;
        let lines = value.split(/\r?\n/);
        for (let line of lines) {
            if (line.startsWith("/")) {
                if (!/^\/CANC\/.*$/.test(line)) return false;
            }
        }
        return true;
    }, "72Z salah: hanya narrative atau /CANC/...");

    // 77: Narrative bebas atau /8a/... structured line
    $.validator.addMethod("info77", function(value, element) {
        if (this.optional(element)) return true;
        let lines = value.split(/\r?\n/);
        if (lines.length === 0) return true;
        let first = lines[0];
        if (first.startsWith("/")) {
            // harus /8a/... misal /ABCD/
            if (!/^\/[A-Z0-9]{2,8}\/.*$/.test(first)) return false;
        }
        // baris berikut boleh narrative, //... continuation, atau /8a/... lagi
        for (let i=1;i<lines.length;i++){
            let ln = lines[i];
            if (ln.startsWith("/")) {
                if (!/^\/[A-Z0-9]{2,8}\/.*$/.test(ln) && !/^\/\//.test(ln)) return false;
            }
        }
        return true;
    }, "77 salah: gunakan narrative atau structured /CODE/...");

    /* ===================== Validator Setup ===================== */
    let validator = $("#form_mt747").validate({
        ignore: [],
        onkeyup: false,
        onfocusout: false,
        rules: {
            /* Header */
            sender_logical_terminal: "required",
            receiver_institution: "required",
            priority: "required",

            /* Body */
            _010_mf20_documentary_credit_number: { required:true, dc20:true },
            _020_of21_reimbursing_bank_reference: { dc20:true },
            _030_mf30_date_of_the_original_authorisation_to_reimburse: { required:true, yymmdd:true },
            _040_of31e_new_date_of_expiry: { yymmdd:true },

            /* 32B Increase */
            _050_of32b_currency: { currency:true },
            _051_of32b_amount: { swiftAmount:true },

            /* 33B Decrease */
            _060_of33b_currency: { currency:true },
            _061_of33b_amount: { swiftAmount:true },

            /* 34B New DC amount */
            _070_of34b_currency: { currency:true },
            _071_of34b_amount: { swiftAmount:true },

            /* 39A Tolerance */
            _080_of39a_plus: { digits:true, range:[0,99] },
            _081_of39a_minus: { digits:true, range:[0,99] },

            /* 39C Additional amounts */
            _090_of39c_additional_amounts_covered: {},

            /* 72Z Sender to receiver */
            _100_of72z_sender_to_receiver_information: { info72Z:true },

            /* 77 Narrative */
            _110_of77_narrative: { info77:true }
        },
        messages: {
            sender_logical_terminal: { required:"Sender LT harus diisi..!!" },
            receiver_institution: { required:"Receiver Institution harus diisi..!!" },
            priority: { required:"Priority harus diisi..!!" },

            _010_mf20_documentary_credit_number: { required:"Field 20 wajib diisi", dc20:"Format salah (tidak boleh diawali/diakhiri '/' atau '//')" },
            _020_of21_reimbursing_bank_reference: { dc20:"Format salah (tidak boleh diawali/diakhiri '/' atau '//')" },
            _030_mf30_date_of_the_original_authorisation_to_reimburse: { required:"Field 30 wajib diisi", yymmdd:"Tanggal salah (YYMMDD)" },
            _040_of31e_new_date_of_expiry: { yymmdd:"Tanggal salah (YYMMDD)" },

            _050_of32b_currency: { currency:"Kode mata uang salah" },
            _051_of32b_amount: { swiftAmount:"Format amount salah (n,dd)" },

            _060_of33b_currency: { currency:"Kode mata uang salah" },
            _061_of33b_amount: { swiftAmount:"Format amount salah (n,dd)" },

            _070_of34b_currency: { currency:"Kode mata uang salah" },
            _071_of34b_amount: { swiftAmount:"Format amount salah (n,dd)" },

            _080_of39a_plus: { range:"Nilai harus 0-99" },
            _081_of39a_minus: { range:"Nilai harus 0-99" },

            _100_of72z_sender_to_receiver_information: { info72Z:"72Z salah: hanya narrative atau /CANC/..." },
            _110_of77_narrative: { info77:"77 salah: gunakan narrative atau structured /CODE/..." }
        },
        errorPlacement: function (error, element) {
            error.insertAfter(element);
            $("#tab-validate").removeAttr("hidden");
        },
        showErrors: function (errorMap, errorList) {
            this.defaultShowErrors();
            $("#tab-validate").removeAttr("hidden");
            $("#view1, #view2, #view3, #view4, #view5").hide();
            $("#view6").show();

            $('#tab-view1, #tab-view2, #tab-view3, #tab-view4, #tab-view5').removeClass("selected");
            $('#tab-validate').addClass("selected");

            let errorContainer = document.getElementById("error-container");
            if (errorList.length === 0) {
                errorContainer.innerHTML = "";
                return;
            }
            let tableHTML = `<table border="0" style="width:100%; font-size:8pt;border-collapse: collapse; border:1px gray solid;">
                                <tr style="background:#d6d6d6;">
                                <th>Type</th><th>Location</th><th>Node</th><th>Message</th></tr>`;
            errorList.forEach(errors => {
                let inputID = errors.element.id || "";
                let locationTab = errors.element.getAttribute("location") || "Body";
                let inputType = errors.element.getAttribute("input_type") || "";
                tableHTML += '<tr class="error__row" data-input-id="'+inputID+'" content-body="'+locationTab+'" style="cursor:pointer;">';
                tableHTML += '<td>Error</td>';
                tableHTML += '<td>'+locationTab+'</td>';
                tableHTML += '<td>'+inputType+'</td>';
                tableHTML += '<td>'+errors.message+'</td></tr>';
            });
            tableHTML += `</table>`;
            errorContainer.innerHTML = tableHTML;

            document.querySelectorAll(".error__row").forEach(row => {
                row.addEventListener("click", function () {
                    let inputId = this.getAttribute("data-input-id");
                    let input = document.getElementById(inputId);
                    if (input) input.focus();
                });
            });
        }
    });

    /* ===================== Network Validation Rules C1–C4 ===================== */
    function checkNetworkRules() {
        let v31E = $("#_040_of31e_new_date_of_expiry").val();
        let v32B = $("#_050_of32b_currency").val() || $("#_051_of32b_amount").val();
        let v33B = $("#_060_of33b_currency").val() || $("#_061_of33b_amount").val();
        let v34B = $("#_070_of34b_currency").val() || $("#_071_of34b_amount").val();
        let v39A = $("#_080_of39a_plus").val() || $("#_081_of39a_minus").val();
        let v39C = $("#_090_of39c_additional_amounts_covered").val();
        let v72Z = $("#_100_of72z_sender_to_receiver_information").val();
        let v77  = $("#_110_of77_narrative").val();

        // C1
        if (!v31E && !v32B && !v33B && !v34B && !v39A && !v39C && !v72Z && !v77) {
            alert("Error C1: Minimal satu dari 31E, 32B, 33B, 34B, 39A, 39C, 72Z, 77 harus ada.");
            return false;
        }
        // C2
        if ((v32B || v33B) && !v34B) {
            alert("Error C2: Jika 32B atau 33B ada, maka 34B wajib ada.");
            return false;
        }
        // C3
        if (v34B && !(v32B || v33B)) {
            alert("Error C3: Jika 34B ada, maka 32B atau 33B wajib ada.");
            return false;
        }
        // C4
        let c32 = $("#_050_of32b_currency").val();
        let c33 = $("#_060_of33b_currency").val();
        let c34 = $("#_070_of34b_currency").val();
        if (c32 && c33 && c34 && (c32!==c33 || c32!==c34)) {
            alert("Error C4: Mata uang di 32B, 33B, 34B harus sama.");
            return false;
        }
        return true;
    }

    /* ===================== Submit Events ===================== */
    $("#btn-validate, #submit_mt").click(function(e) {
        if(e.type==="click") e.preventDefault();
        let v = $("#form_mt747").valid();
        if(v){
            if(!checkNetworkRules()) return false;
            if (e.target.id==="submit_mt") $("#form_mt747").submit();
        }
    });
});
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />
