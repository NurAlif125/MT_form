<%-- 
    Document   : validate_rule_mt742
    Created on : Sep 15, 2025, 11:09:16 AM
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

    $.validator.addMethod("bic", function(value, element) {
        return this.optional(element) || /^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$/.test(value);
    }, "Format BIC tidak valid");

    $.validator.addMethod("currency", function(value, element) {
        return this.optional(element) || /^[A-Z]{3}$/.test(value);
    }, "Mata uang harus 3 huruf ISO");

    $.validator.addMethod("swiftAmount", function(value, element) {
        return this.optional(element) || /^\d+(,\d{2})$/.test(value);
    }, "Format jumlah salah, gunakan n,dd (misal: 1000,00)");

    $.validator.addMethod("dc20", function(value, element) {
        return this.optional(element) || (!/^\/|\/$/.test(value) && !/\/\//.test(value));
    }, "Field tidak boleh diawali/diakhiri '/' atau mengandung '//'");

    $.validator.addMethod("charges71D", function(value, element) {
        if (this.optional(element)) return true;
        // boleh narrative biasa atau /CODE/...
        let lines = value.split(/\r?\n/);
        let valid = true;
        let codeRegex = /^\/(AGENT|COMM|CORCOM|DISC|INSUR|POST|STAMP|TELECHAR|WAREHOUS)\/.*$/;
        for (let line of lines) {
            if (line.startsWith("/")) {
                if (!codeRegex.test(line)) { valid = false; break; }
            }
        }
        return valid;
    }, "71D salah: gunakan /CODE/..., atau narrative teks");

    $.validator.addMethod("info72Z", function(value, element) {
        if (this.optional(element)) return true;
        let lines = value.split(/\r?\n/);
        let valid = true;
        let codeRegex = /^\/REIMBREF\/.*$/;
        for (let line of lines) {
            if (line.startsWith("/")) {
                if (!codeRegex.test(line)) { valid = false; break; }
            }
        }
        return valid;
    }, "72Z salah: hanya boleh narrative atau /REIMBREF/...");

    /* ===================== Validator Setup ===================== */
    let validator = $("#form_mt742").validate({
        ignore: [],
        onkeyup: false,
        onfocusout: false,
        rules: {
            /* Header */
            sender_logical_terminal: "required",
            receiver_institution: "required",
            priority: "required",

            /* Body */
            _010_mf20_claiming_bank_reference: { required:true, dc20:true },
            _020_mf21_documentary_credit_number: { required:true, dc20:true },
            _030_of31c_date_of_issue: { yymmdd:true },

            /* 52a Issuing Bank */
            _040_mf52a_issuing_bank: { required:true },
            _041_mf52a_party_identifier: {},
            _042_mf52a_identifier_code: { bic:true },
            _043_mf52a_name_address: {},

            /* 32B Principal Amount */
            _050_mf32b_currency: { required:true, currency:true },
            _051_mf32b_amount: { required:true, swiftAmount:true },

            /* 33B Additional Amount */
            _060_of33b_currency: { currency:true },
            _061_of33b_amount: { swiftAmount:true },

            /* 71D Charges */
            _070_of71d_charges: { charges71D:true },

            /* 34a Total Amount */
            _080_mf34a_total_amount_claimed: { required:true },
            _081_mf34a_date: { yymmdd:true },
            _082_mf34a_currency: { required:true, currency:true },
            _083_mf34a_amount: { required:true, swiftAmount:true },

            /* 57a Account With Bank */
            _090_of57a_account_with_bank: {},
            _091_of57a_party_identifier: {},
            _092_of57a_identifier_code: { bic:true },
            _093_of57a_name_address: {},

            /* 58a Beneficiary Bank */
            _100_of58a_beneficiary_bank: {},
            _101_of58a_party_identifier: {},
            _102_of58a_identifier_code: { bic:true },
            _103_of58a_name_address: {},

            /* 72Z Information */
            _110_of72z_sender_to_receiver_information: { info72Z:true }
        },
        messages: {
            sender_logical_terminal: { required:"Sender LT harus diisi..!!" },
            receiver_institution: { required:"Receiver Institution harus diisi..!!" },
            priority: { required:"Priority harus diisi..!!" },

            _010_mf20_claiming_bank_reference: { required:"Field 20 wajib diisi", dc20:"Field 20 salah format" },
            _020_mf21_documentary_credit_number: { required:"Field 21 wajib diisi", dc20:"Field 21 salah format" },
            _030_of31c_date_of_issue: { yymmdd:"Tanggal harus YYMMDD" },

            _040_mf52a_issuing_bank: { required:"Field 52a (Issuing Bank) harus dipilih" },
            _042_mf52a_identifier_code: { bic:"BIC Issuing Bank salah" },

            _050_mf32b_currency: { required:"Currency (32B) wajib", currency:"Kode mata uang salah" },
            _051_mf32b_amount: { required:"Amount (32B) wajib", swiftAmount:"Format amount salah, gunakan n,dd" },

            _060_of33b_currency: { currency:"Kode mata uang salah" },
            _061_of33b_amount: { swiftAmount:"Format amount salah, gunakan n,dd" },

            _070_of71d_charges: { charges71D:"Format charges salah, gunakan /CODE/... atau narrative" },

            _080_mf34a_total_amount_claimed: { required:"Option 34a wajib dipilih" },
            _081_mf34a_date: { yymmdd:"Tanggal salah (YYMMDD)" },
            _082_mf34a_currency: { required:"Currency (34a) wajib", currency:"Kode mata uang salah" },
            _083_mf34a_amount: { required:"Amount (34a) wajib", swiftAmount:"Format salah n,dd" },

            _092_of57a_identifier_code: { bic:"BIC 57a salah" },
            _093_of57a_name_address: { required:"Nama/Alamat 57a wajib untuk option D" },

            _102_of58a_identifier_code: { bic:"BIC 58a salah" },
            _103_of58a_name_address: { required:"Nama/Alamat 58a wajib untuk option D" },

            _110_of72z_sender_to_receiver_information: { info72Z:"Format 72Z salah (hanya narrative atau /REIMBREF/...)" }
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

    /* ===================== Toggle Logic ===================== */
    function toggle52aOption(val){
        let opt = $("#_040_mf52a_issuing_bank").val();
        if(opt==="A"){
            $("#wrap_042_mf52a_identifier_code").show().prop("disabled",false);
            $("#wrap_043_mf52a_name_address").hide();
        } else if(opt==="D"){
            $("#wrap_042_mf52a_identifier_code").hide().prop("disabled",true);
            $("#wrap_043_mf52a_name_address").show();
        } else {
            $("#wrap_042_mf52a_identifier_code, #wrap_043_mf52a_name_address").hide();
        }
    }
    function toggle34aOption(val){
        let opt = $("#_080_mf34a_total_amount_claimed").val();
        if(opt==="A"){
            $("#wrap_081_mf34a_date").show();
        } else {
            $("#wrap_081_mf34a_date").hide();
        }
    }
    function toggle57aOption(val){
        let opt = $("#_090_of57a_account_with_bank").val();
        if(opt==="A"){
            $("#wrap_092_of57a_identifier_code").show().prop("disabled",false);
            $("#wrap_093_of57a_name_address").hide();
        } else if(opt==="D"){
            $("#wrap_092_of57a_identifier_code").hide().prop("disabled",true);
            $("#wrap_093_of57a_name_address").show();
        } else {
            $("#wrap_092_of57a_identifier_code, #wrap_093_of57a_name_address").hide();
        }
    }
    function toggle58aOption(val){
        let opt = $("#_100_of58a_beneficiary_bank").val();
        if(opt==="A"){
            $("#wrap_102_of58a_identifier_code").show().prop("disabled",false);
            $("#wrap_103_of58a_name_address").hide();
        } else if(opt==="D"){
            $("#wrap_102_of58a_identifier_code").hide().prop("disabled",true);
            $("#wrap_103_of58a_name_address").show();
        } else {
            $("#wrap_102_of58a_identifier_code, #wrap_103_of58a_name_address").hide();
        }
    }

    $("#_040_mf52a_issuing_bank").change(toggle52aOption);
    $("#_080_mf34a_total_amount_claimed").change(toggle34aOption);
    $("#_090_of57a_account_with_bank").change(toggle57aOption);
    $("#_100_of58a_beneficiary_bank").change(toggle58aOption);

    toggle52aOption(); toggle34aOption(); toggle57aOption(); toggle58aOption();

    /* ===================== Submit Events ===================== */
    $("#btn-validate, #submit_mt").click(function(e) {
        if(e.type==="click") e.preventDefault();
        let v = $("#form_mt742").valid();
        if(v && e.target.id==="submit_mt") $("#form_mt742").submit();
    });
});
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />


