<%-- 
    Document   : validate_rule_mt700
    Created on : Aug 26, 2025, 1:14:59?PM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
    (function (global) {
        // ===== CHARSETS & REGEX =====
        const X_RE = /^[A-Z0-9 \/\-\?:\(\)\.,'\+]*$/;
        const Z_RE = /^[A-Z0-9 \/\-\?:\(\)\.,'\+\r\n]*$/;
        const A3_RE = /^[A-Z]{3}$/;
        const BIC_RE = /^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
        const DEC_RE = /^\d{1,12}(,\d{0,10})?$/;

        // ===== HELPERS =====
        const t = v => (v || "").trim();
        const up = v => t(v).toUpperCase();
        const h = v => t(v).length > 0;

        function isYYMMDD(v) {
            if (!/^\d{6}$/.test(v))
                return false;
            let yy = +v.substr(0, 2), mm = +v.substr(2, 2), dd = +v.substr(4, 2);
            let y4 = 2000 + yy;
            let d = new Date(y4, mm - 1, dd);
            return d.getFullYear() === y4 && d.getMonth() === mm - 1 && d.getDate() === dd;
        }
        function checkLines(val, maxLines, maxLen, re) {
            let lines = up(val).split(/\r?\n/);
            if (lines.length > maxLines)
                return `Maksimal ${maxLines} baris`;
            for (let i = 0; i < lines.length; i++) {
                if (lines[i].length > maxLen)
                    return `Baris ${i+1} melebihi ${maxLen} karakter`;
                if (re && !re.test(lines[i]))
                    return `Karakter tidak valid pada baris ${i+1}`;
            }
            return null;
        }
        function check140z(txt) {
            const s = up(txt);
            if (s.length > 140)
                return 'maks 140 char';
            if (!Z_RE.test(s))
                return 'karakter harus z';
            return null;
        }
        const DEC0 = new Set(['JPY', 'KRW', 'VND', 'HUF', 'XOF', 'XAF', 'XPF']);
        const DEC3 = new Set(['BHD', 'JOD', 'KWD', 'OMR', 'TND', 'LYD', 'IQD']);
        function checkAmountByCcy(ccy, amt) {
            if (!h(ccy) || !h(amt))
                return null;
            if (!DEC_RE.test(amt))
                return "Format amount salah";
            let dp = (amt.split(',')[1] || '').length;
            let allowed = 2;
            if (DEC0.has(ccy))
                allowed = 0;
            if (DEC3.has(ccy))
                allowed = 3;
            if (dp > allowed)
                return `Desimal untuk ${ccy} maksimal ${allowed}`;
            if (allowed === 0 && dp !== 0)
                return `Mata uang ${ccy} tidak boleh ada desimal`;
            return null;
        }
        function checkT26(s) {
            if (s.startsWith('/') || s.endsWith('/'))
                return 'tidak boleh diawali/diakhiri "/"';
            if (s.includes('//'))
                return 'tidak boleh mengandung "//"';
            return null;
        }

        // ===== VALIDATOR =====
        global.validateMT700 = function () {
            const E = [];

            // === Mandatory fields check ===
            const fieldNames = {
                "#_010_mf27_sequence_of_total": "27 Sequence of Total",
                "#_020_mf40a_form_of_credit": "40A Form of Documentary Credit",
                "#_030_mf20_documentary_credit_number": "20 Documentary Credit Number",
                "#_050_mf31c_date_of_issue": "31C Date of Issue",
                "#_060_mf40e_applicable_rules": "40E Applicable Rules",
                "#_070_mf31d_date_of_expiry": "31D Date of Expiry",
                "#_090_mf50_applicant": "50 Applicant",
                "#_100_mf59_account": "59 Beneficiary Account",
                "#_110_mf32b_currency": "32B Currency",
                "#_111_mf32b_amount": "32B Amount",
                "#_140_mf41a_option": "41A Available With",
                "#_143_mf41a_by": "41A By"
                "#_340_mf49_confirmation": "49 Confirmation Instructions"
            };
            Object.keys(fieldNames).forEach(id => {
                if (!t($(id).val()))
                    E.push(`${fieldNames[id]} wajib diisi`);
            });

            // FIELD 27 : Sequence of Total
            $("#_010_mf27_sequence_of_total").on("blur", function () {
                var val = $(this).val().trim();
                var regex = /^[0-9]{1,3}\/[0-9]{1,3}$/;
                if (val !== "" && !regex.test(val)) {
                    alert("Field 27 harus format n/nn (contoh: 1/1 atau 2/10).");
                    $(this).focus();
                }
            });

            // FIELD 40A : Form of Documentary Credit
            $("#_020_mf40a_form_of_credit").on("change", function () {
                var val = $(this).val().trim().toUpperCase();
                var allowed = ["IRREVOCABLE", "IRREVOCABLE TRANSFERABLE"];
                if (val !== "" && allowed.indexOf(val) === -1) {
                    alert("Field 40A hanya boleh 'IRREVOCABLE' atau 'IRREVOCABLE TRANSFERABLE'.");
                    $(this).val("");
                    $(this).focus();
                }
            });

            // FIELD 20 : Documentary Credit Number
            $("#_030_mf20_documentary_credit_number").on("input", function () {
                var val = $(this).val().toUpperCase();
                val = val.replace(/[^A-Z0-9\/]/g, "").substring(0, 16);
                $(this).val(val);
                if (val.startsWith("/") || val.endsWith("/") || val.includes("//")) {
                    alert("Field 20 tidak boleh diawali/diakhiri '/' atau berisi '//'.");
                    $(this).val(val.replace(/\//g, ""));
                }
            });

            // FIELD 23 : Reference to Pre-Advice
            $("#_040_of23_reference_to_preadvice").on("input", function () {
                var val = $(this).val().toUpperCase();
                if (val.length > 16) {
                    alert("Field 23 maksimal 16 karakter.");
                    $(this).val(val.substring(0, 16));
                }
            });

            // FIELD 31C : Date of Issue
            $("#_050_mf31c_date_of_issue").on("blur", function () {
                var val = $(this).val().trim();
                if (val !== "" && !isYYMMDD(val)) {
                    alert("Field 31C harus format tanggal YYMMDD yang valid.");
                    $(this).focus();
                }
            });

            // FIELD 40E : Applicable Rules
            $("#_060_mf40e_applicable_rules").on("change", function () {
                var val = $(this).val().trim().toUpperCase();
                var allowed = [
                    "EUCP LATEST VERSION",
                    "EUCPURR LATEST VERSION",
                    "OTHR",
                    "UCP LATEST VERSION",
                    "UCPURR LATEST VERSION"
                ];
                if (allowed.indexOf(val) === -1) {
                    alert("Field 40E Code harus salah satu dari: " + allowed.join(", "));
                    $(this).val("");
                    $(this).focus();
                }
                if (val !== "OTHR") {
                    $("#_061_mf40e_narrative").val("");
                }
            });

            $("#_061_mf40e_narrative").on("input", function () {
                var code = $("#_060_mf40e_applicable_rules").val().trim().toUpperCase();
                var val = $(this).val();
                if (code !== "OTHR" && val.length > 0) {
                    alert("Narrative hanya boleh diisi jika Code = OTHR.");
                    $(this).val("");
                }
                if (val.length > 35) {
                    alert("Narrative maksimal 35 karakter.");
                    $(this).val(val.substring(0, 35));
                }
            });

            // FIELD 31D : Date and Place of Expiry
            $("#_070_mf31d_date_of_expiry").on("blur", function () {
                var val = $(this).val().trim();
                var regex = /^[0-9]{6}$/;
                if (val !== "" && !isYYMMDD(val)) {
                    alert("Field 31D harus format tanggal YYMMDD yang valid.");
                    $(this).focus();
                }
            });

            $("#_071_mf31d_place_of_expiry").on("input", function () {
                var val = $(this).val().toUpperCase();
                if (val.length > 29) {
                    alert("Field 31D Place maksimal 29 karakter.");
                    $(this).val(val.substring(0, 29));
                }
            });


            // FIELD 51a : Applicant Bank
            $("#_080_of51a_option").on("change", function () {
                var opt = $(this).val();
                if (opt === "A") {
                    $("#_081_of51a_bic").show();
                    $("#_082_of51a_name_address").hide().val("");
                } else if (opt === "D") {
                    $("#_082_of51a_name_address").show();
                    $("#_081_of51a_bic").hide().val("");
                } else {
                    $("#_081_of51a_bic").hide().val("");
                    $("#_082_of51a_name_address").hide().val("");
                }
            });

            $("#_081_of51a_bic").on("blur", function () {
                var val = $(this).val().trim();
                var regex = /^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
                if (val !== "" && !regex.test(val)) {
                    alert("Field 51a Option A harus berformat BIC yang valid.");
                    $(this).focus();
                }
            });

            $("#_082_of51a_name_address").on("input", function () {
                var val = $(this).val();
                if (val.length > 140) { // 4*35x
                    alert("Field 51a Option D maksimal 140 karakter.");
                    $(this).val(val.substring(0, 140));
                }
            });

            // FIELD 50 : Applicant
            $("#_090_mf50_applicant").on("input", function () {
                var val = $(this).val();
                if (val.length > 140) {
                    alert("Field 50 maksimal 140 karakter.");
                    $(this).val(val.substring(0, 140));
                }
            });

            // FIELD 59 : Beneficiary
            $("#_100_mf59_account").on("input", function () {
                var val = $(this).val();
                if (val.length > 34) {
                    alert("Field 59 Account maksimal 34 karakter.");
                    $(this).val(val.substring(0, 34));
                }
            });

            $("#_101_mf59_name_address").on("input", function () {
                var val = $(this).val();
                if (val.length > 140) {
                    alert("Field 59 Name & Address maksimal 140 karakter.");
                    $(this).val(val.substring(0, 140));
                }
            });

            // FIELD 32B : Currency Code & amount
            $("#_110_mf32b_currency").on("blur", function () {
                var val = $(this).val().trim().toUpperCase();
                if (val !== "" && !/^[A-Z]{3}$/.test(val)) {
                    alert("Field 32B Currency harus 3 huruf (kode mata uang, misalnya USD).");
                    $(this).focus();
                }
            });

            $("#_111_mf32b_amount").on("blur", function () {
                var amt = $(this).val().trim();
                var ccy = $("#_110_mf32b_currency").val().trim().toUpperCase();

                if (amt !== "") {
                    // cek format dasar angka
                    if (!/^[0-9]{1,12}(,[0-9]{1,3})?$/.test(amt)) {
                        alert("Field 32B Amount harus angka maksimal 12 digit, boleh ada koma (contoh: 12345,67).");
                        $(this).focus();
                        return;
                    }

                    // cek aturan desimal berdasarkan currency
                    var err = checkAmountByCcy(ccy, amt);
                    if (err) {
                        alert("Field 32B Amount: " + err);
                        $(this).focus();
                    }
                }
            });

            // FIELD 39A : Percentage Credit Amount Tolerance
            $("#_120_of39a_plus").on("input", function () {
                var val = $(this).val();
                if (val !== "" && !/^[0-9]{1,2}$/.test(val)) {
                    alert("Field 39A Plus hanya boleh angka 0-99.");
                    $(this).val(val.replace(/[^0-9]/g, "").substring(0, 2));
                }
            });
            $("#_121_of39a_minus").on("input", function () {
                var val = $(this).val();
                if (val !== "" && !/^[0-9]{1,2}$/.test(val)) {
                    alert("Field 39A Minus hanya boleh angka 0-99.");
                    $(this).val(val.replace(/[^0-9]/g, "").substring(0, 2));
                }
            });

            // FIELD 39C : Additional Amounts Covered
            $("#_130_of39c_additional_amounts").on("input", function () {
                var val = $(this).val();
                if (val.length > 140) {
                    alert("Field 39C maksimal 140 karakter.");
                    $(this).val(val.substring(0, 140));
                }
            });

            // FIELD 41a : Available With... By...
            $("#_140_mf41a_option").on("change", function () {
                var opt = $(this).val();
                if (opt === "A") {
                    $("#wrap_141_mf41a_identifier_code").show();
                    $("#_141_mf41a_identifier_code").val("");
                    $("#wrap_142_mf41d_name_and_address").hide();
                    $("#_142_mf41d_name_and_address").val("");
                } else if (opt === "D") {
                    $("#wrap_142_mf41d_name_and_address").show();
                    $("#_142_mf41d_name_and_address").val("");
                    $("#wrap_141_mf41a_identifier_code").hide();
                    $("#_141_mf41a_identifier_code").val("");
                } else {
                    $("#wrap_141_mf41a_identifier_code").hide();
                    $("#_141_mf41a_identifier_code").val("");
                    $("#wrap_142_mf41d_name_and_address").hide();
                    $("#_142_mf41d_name_and_address").val("");
                }
            });
            $("#_141_mf41a_identifier_code").on("blur", function () {
                var val = $(this).val().trim();
                var regex = /^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
                if (val !== "" && !regex.test(val)) {
                    alert("Field 41A Option A harus berupa BIC valid.");
                    $(this).focus();
                }
            });
            $("#_142_mf41d_name_and_address").on("input", function () {
                var val = $(this).val();
                if (val.length > 140) {
                    alert("Field 41A Option D maksimal 140 karakter (4 baris x 35).");
                    $(this).val(val.substring(0, 140));
                }
            });
            $("#_143_mf41a_by").on("change", function () {
                var code = $(this).val();
                var allowed = ["BY ACCEPTANCE", "BY DEF PAYMENT", "BY MIXED PYMT", "BY NEGOTIATION", "BY PAYMENT"];
                if (code && !allowed.includes(code)) {
                    alert("Field 41A By harus salah satu dari: " + allowed.join(", "));
                    $(this).val("");
                }
            });


            // FIELD 42C : Drafts at...
            $("#_150_of42c_drafts").on("input", function () {
                var val = $(this).val();
                if (val.length > 105) {
                    alert("Field 42C maksimal 105 karakter.");
                    $(this).val(val.substring(0, 105));
                }
            });

            // FIELD 42a : Drawee
            $("#_160_of42a_option").on("change", function () {
                var opt = $(this).val();
                if (opt === "A") {
                    $("#_161_of42a_bic").show();
                    $("#_162_of42a_name_address").hide().val("");
                } else if (opt === "D") {
                    $("#_162_of42a_name_address").show();
                    $("#_161_of42a_bic").hide().val("");
                } else {
                    $("#_161_of42a_bic").hide().val("");
                    $("#_162_of42a_name_address").hide().val("");
                }
            });

            $("#_161_of42a_bic").on("blur", function () {
                var val = $(this).val();
                var regex = /^[A-Z]{8,11}$/;
                if (val !== "" && !regex.test(val)) {
                    alert("Field 42a Option A harus BIC 8 atau 11 karakter.");
                    $(this).focus();
                }
            });

            $("#_162_of42a_name_address").on("input", function () {
                var val = $(this).val();
                if (val.length > 140) {
                    alert("Field 42a Option D maksimal 140 karakter.");
                    $(this).val(val.substring(0, 140));
                }
            });

            // FIELD 42M : Mixed Payment Details
            $("#_170_of42m_mixed_payment").on("input", function () {
                var val = $(this).val();
                if (val.length > 140) {
                    alert("Field 42M maksimal 140 karakter.");
                    $(this).val(val.substring(0, 140));
                }
            });

            // FIELD 42P : Negotiation/Deferred Payment Details
            $("#_180_of42p_deferred_payment").on("input", function () {
                var val = $(this).val();
                if (val.length > 140) {
                    alert("Field 42P maksimal 140 karakter.");
                    $(this).val(val.substring(0, 140));
                }
            });

            // FIELD 43P : Partial Shipments
            $("#_190_of43p_partial_shipments").on("change", function () {
                var val = $(this).val().toUpperCase();
                var allowed = ["ALLOWED", "CONDITIONAL", "NOT ALLOWED"];
                if (val && !allowed.includes(val)) {
                    alert("Field 43P harus salah satu dari: " + allowed.join(", "));
                    $(this).val("");
                }
            });

            // FIELD 43T : Transhipment
            $("#_200_of43t_transhipment").on("change", function () {
                var val = $(this).val().toUpperCase();
                var allowed = ["ALLOWED", "CONDITIONAL", "NOT ALLOWED"];
                if (val && !allowed.includes(val)) {
                    alert("Field 43T harus salah satu dari: " + allowed.join(", "));
                    $(this).val("");
                }
            });

            // FIELD 44A : Place of Taking in Charge / Dispatch from / Place of Receipt
            $("#_210_of44a_place_of_receipt").on("input", function () {
                var val = $(this).val();
                if (val.length > 140) {
                    alert("Field 44A maksimal 140 karakter.");
                    $(this).val(val.substring(0, 140));
                }
            });

            // FIELD 44E : Port of Loading / Airport of Departure
            $("#_220_of44e_port_of_loading").on("input", function () {
                var val = $(this).val();
                if (val.length > 140) {
                    alert("Field 44E maksimal 140 karakter.");
                    $(this).val(val.substring(0, 140));
                }
            });

            // FIELD 44F : Port of Discharge / Airport of Destination
            $("#_230_of44f_port_of_discharge").on("input", function () {
                var val = $(this).val();
                if (val.length > 140) {
                    alert("Field 44F maksimal 140 karakter.");
                    $(this).val(val.substring(0, 140));
                }
            });

            // FIELD 44B : Place of Final Destination / Place of Delivery
            $("#_240_of44b_place_of_delivery").on("input", function () {
                var val = $(this).val();
                if (val.length > 140) {
                    alert("Field 44B maksimal 140 karakter.");
                    $(this).val(val.substring(0, 140));
                }
            });

            // FIELD 44C : Latest Date of Shipment
            $("#_250_of44c_latest_shipment").on("blur", function () {
                var val = $(this).val();
                if (val !== "" && !isYYMMDD(val)) {
                    alert("Field 44C harus format tanggal YYMMDD yang valid.");
                    $(this).focus();
                }
            });

            // FIELD 44D : Shipment Period
            $("#_260_of44d_shipment_period").on("input", function () {
                var val = $(this).val();
                if (val.length > 390) {
                    alert("Field 44D maksimal 390 karakter.");
                    $(this).val(val.substring(0, 390));
                }
            });

            // FIELD 45A : Description of Goods and/or Services
            $("#_270_of45a_description_goods").on("input", function () {
                var val = $(this).val();
                if (val.length > 6500) {
                    alert("Field 45A maksimal 6500 karakter.");
                    $(this).val(val.substring(0, 6500));
                }
            });

            // FIELD 46A : Documents Required
            $("#_280_of46a_documents_required").on("input", function () {
                var val = $(this).val();
                if (val.length > 6500) {
                    alert("Field 46A maksimal 6500 karakter.");
                    $(this).val(val.substring(0, 6500));
                }
            });

            // FIELD 47A : Additional Conditions
            $("#_290_of47a_additional_conditions").on("input", function () {
                var val = $(this).val();
                if (val.length > 6500) {
                    alert("Field 47A maksimal 6500 karakter.");
                    $(this).val(val.substring(0, 6500));
                }
            });

            // FIELD 49G : Special Payment Conditions for Beneficiary
            $("#_300_of49g_special_payment_beneficiary").on("input", function () {
                var val = $(this).val();
                if (val.length > 6500) {
                    alert("Field 49G maksimal 6500 karakter.");
                    $(this).val(val.substring(0, 6500));
                }
            });

            // FIELD 49H : Special Payment Conditions for Bank Only
            $("#_310_of49h_special_payment_bank").on("input", function () {
                var val = $(this).val();
                if (val.length > 6500) {
                    alert("Field 49H maksimal 6500 karakter.");
                    $(this).val(val.substring(0, 6500));
                }
            });

            // FIELD 71D : Charges
            $("#_320_of71d_charges").on("blur", function () {
                var val = $(this).val();
                var lines = val.split("\n");
                if (lines.length > 3) {
                    alert("Field 71D maksimal 3 baris.");
                    $(this).focus();
                }
                for (var i = 0; i < lines.length; i++) {
                    if (lines[i].length > 35) {
                        alert("Field 71D: setiap baris maksimal 35 karakter.");
                        $(this).focus();
                        break;
                    }
                }
            });

            // FIELD 48 : Period for Presentation
            $("#_330_of48_period_for_presentation").on("blur", function () {
                var val = $(this).val().trim();
                if (val !== "" && !/^[0-9]{1,3}$/.test(val)) {
                    alert("Field 48 harus angka maksimal 3 digit (hari).");
                    $(this).focus();
                }
            });

            // FIELD 49 : Confirmation Instructions
            $("#_340_mf49_confirmation").on("blur", function () {
                var val = $(this).val().trim().toUpperCase();
                var allowed = ["CONFIRM", "MAY ADD", "WITHOUT"];
                if (val !== "" && allowed.indexOf(val) === -1) {
                    alert("Field 49 hanya boleh CONFIRM / MAY ADD / WITHOUT.");
                    $(this).focus();
                }
            });

            // FIELD 58a : Requested Confirmation Party
            $("#_350_of58a_option").on("change", function () {
                var opt = $(this).val();
                if (opt === "A") {
                    $("#_350_of58a_identifier_code").show();
                    $("#_351_of58d_name_address").hide().val("");
                } else if (opt === "D") {
                    $("#_351_of58d_name_address").show();
                    $("#_350_of58a_identifier_code").hide().val("");
                } else {
                    $("#_350_of58a_identifier_code").hide().val("");
                    $("#_351_of58d_name_address").hide().val("");
                }
            });
            $("#_350_of58a_identifier_code").on("blur", function () {
                var val = $(this).val();
                var regex = /^[A-Z0-9]{8,11}$/; // BIC
                if (val !== "" && !regex.test(val)) {
                    alert("Field 58a Option A harus berupa BIC 8 atau 11 karakter.");
                    $(this).focus();
                }
            });
            $("#_351_of58d_name_address").on("blur", function () {
                var val = $(this).val();
                if (val.length > 140) {
                    alert("Field 58a Option D maksimal 140 karakter (4 baris x 35).");
                    $(this).focus();
                }
            });

            // FIELD 53a : Reimbursing Bank
            $("#_360_of53a_option").on("change", function () {
                var opt = $(this).val();
                if (opt === "A") {
                    $("#_360_of53a_identifier_code").show();
                    $("#_361_of53b_location, #_362_of53d_name_address").hide().val("");
                } else if (opt === "B") {
                    $("#_361_of53b_location").show();
                    $("#_360_of53a_identifier_code, #_362_of53d_name_address").hide().val("");
                } else if (opt === "D") {
                    $("#_362_of53d_name_address").show();
                    $("#_360_of53a_identifier_code, #_361_of53b_location").hide().val("");
                } else {
                    $("#_360_of53a_identifier_code, #_361_of53b_location, #_362_of53d_name_address").hide().val("");
                }
            });
            $("#_360_of53a_identifier_code").on("blur", function () {
                var val = $(this).val();
                var regex = /^[A-Z0-9]{8,11}$/; // BIC
                if (val !== "" && !regex.test(val)) {
                    alert("Field 53a Option A harus berupa BIC 8 atau 11 karakter.");
                    $(this).focus();
                }
            });
            $("#_361_of53b_location").on("blur", function () {
                var val = $(this).val();
                if (val.length > 35) {
                    alert("Field 53a Option B maksimal 35 karakter.");
                    $(this).focus();
                }
            });
            $("#_362_of53d_name_address").on("blur", function () {
                var val = $(this).val();
                if (val.length > 140) {
                    alert("Field 53a Option D maksimal 140 karakter (4 baris x 35).");
                    $(this).focus();
                }
            });

            // FIELD 78 : Instructions to the Paying/Accepting/Negotiating Bank
            $("#_370_of78_instructions_to_bank").on("blur", function () {
                var val = $(this).val();
                var lines = val.split("\n");
                if (lines.length > 12) {
                    alert("Field 78 maksimal 12 baris.");
                    $(this).focus();
                }
                for (var i = 0; i < lines.length; i++) {
                    if (lines[i].length > 65) {
                        alert("Field 78: tiap baris maksimal 65 karakter.");
                        $(this).focus();
                        break;
                    }
                }
            });

            // FIELD 57a : 'Advise Through' Bank
            $("#_380_of57a_option").on("change", function () {
                var opt = $(this).val();
                if (opt === "A") {
                    $("#_380_of57a_identifier_code").show();
                    $("#_381_of57b_location, #_382_of57d_name_address").hide().val("");
                } else if (opt === "B") {
                    $("#_381_of57b_location").show();
                    $("#_380_of57a_identifier_code, #_382_of57d_name_address").hide().val("");
                } else if (opt === "D") {
                    $("#_382_of57d_name_address").show();
                    $("#_380_of57a_identifier_code, #_381_of57b_location").hide().val("");
                } else {
                    $("#_380_of57a_identifier_code, #_381_of57b_location, #_382_of57d_name_address").hide().val("");
                }
            });
            $("#_380_of57a_identifier_code").on("blur", function () {
                var val = $(this).val().trim();
                var regex = /^[A-Z0-9]{8,11}$/; // BIC
                if (val !== "" && !regex.test(val)) {
                    alert("Field 57a Option A harus berupa BIC 8 atau 11 karakter.");
                    $(this).focus();
                }
            });
            $("#_381_of57b_location").on("blur", function () {
                var val = $(this).val();
                if (val.length > 35) {
                    alert("Field 57a Option B maksimal 35 karakter.");
                    $(this).focus();
                }
            });
            $("#_382_of57d_name_address").on("blur", function () {
                var val = $(this).val();
                if (val.length > 140) { // 4*35x
                    alert("Field 57a Option D maksimal 140 karakter (4 baris x 35).");
                    $(this).focus();
                }
            });

            // FIELD 72Z : Sender to Receiver Information
            $("#_390_of72z_sender_to_receiver_information").on("blur", function () {
                var val = $(this).val();
                var lines = val.split("\n");
                if (lines.length > 6) {
                    alert("Field 72Z maksimal 6 baris.");
                    $(this).focus();
                }
                for (var i = 0; i < lines.length; i++) {
                    if (lines[i].length > 35) {
                        alert("Field 72Z: tiap baris maksimal 35 karakter.");
                        $(this).focus();
                        break;
                    }
                }
            });

            // Output
            if (E.length) {
                alert('Mohon perbaiki isian MT700 berikut:\n\n- ' + E.join('\n- '));
                return false;
            }
            return true;
        };
    })(window);
</script>

