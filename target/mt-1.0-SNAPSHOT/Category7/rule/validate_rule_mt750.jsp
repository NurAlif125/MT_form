<%-- 
    Document   : validate_rule_mt750
    Created on : Sep 23, 2025, 11:10:25 AM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function () {

    // ---------- custom validator methods ----------
    // regex reuse
    $.validator.addMethod("regex", function(value, element, pattern) {
        return this.optional(element) || pattern.test(value);
    }, "Format tidak valid");

    // T26: must not start or end with '/' and must not contain two consecutive slashes '//'
    $.validator.addMethod("noSlashEdges", function(value, element) {
        if (this.optional(element)) return true;
        if (value.length === 0) return true;
        if (/^\/|\/$/.test(value)) return false;
        if (/\/\//.test(value)) return false;
        return true;
    }, "Tidak boleh diawali/diakhiri '/', atau mengandung '//'");

    // ISO currency 3 letters
    $.validator.addMethod("isCurrency", function(value, element) {
        return this.optional(element) || /^[A-Z]{3}$/.test(value);
    }, "Format mata uang harus 3 huruf (ISO 4217)");

    // swift amount format: digits, optional thousands allowed removed by UI, enforce n,dd (comma decimal mandatory or allow whole with comma added by JS)
    $.validator.addMethod("isSwiftAmount", function(value, element) {
        if (this.optional(element)) return true;
        // Accept "123,45" or "0,00" or "123" (but UI will format to n,dd on blur)
        // We'll enforce at least integer digits and optional comma+1-3 decimals (most currencies 2 max)
        return /^[0-9]+(,[0-9]{1,3})?$/.test(value);
    }, "Format amount harus n,dd (gunakan koma sebagai desimal)");

    // BIC validation (basic)
    $.validator.addMethod("isBIC", function(value, element) {
        if (this.optional(element)) return true;
        return /^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$/.test(value);
    }, "Format BIC tidak valid");

    // validate narrative structured field like 71D/73A line rules (approximate)
    // Rules taken from pedoman:
    // - Option to have structured first line starting with /8a/ followed by optionally 3!a13d (we'll allow codes like /COMM/ /AGENT/ etc)
    // - Lines 2-6 may be /8a/... or // continuation or narrative lines
    // We'll implement: length <= 210 chars total, each line <= 35 chars, and if first char is '/', it must follow pattern /^\/[A-Z0-9]{1,8}\/.*$/ or /^\/8a\/.*$/
    $.validator.addMethod("isChargesField", function(value, element) {
        if (this.optional(element)) return true;
        if (value.length > 210) return false;
        // split lines by \n
        let lines = value.split(/\r?\n/);
        if (lines.length > 6) return false; // max 6 lines
        for (let i=0;i<lines.length;i++) {
            let ln = lines[i];
            if (ln.length > 35) return false;
            if (ln.length === 0) continue;
            // if line begins with '/', allow either /8a/... or /CODE/
            if (/^\//.test(ln)) {
                // allowed patterns: /8a/ or /CODE/ or /8a/ plus currency/amount segments
                // accept if starts with /8a/ or /[A-Z]{2,8}/
                if (!(/^\/8a\//.test(ln) || /^\/[A-Z0-9]{2,8}\//.test(ln))) {
                    // allow also continuation lines starting with '//' for subsequent lines
                    if (!/^\/\//.test(ln)) return false;
                }
            } else {
                // narrative lines must not start with slash - that's ok
            }
        }
        return true;
    }, "Format charges tidak valid (maks 6 baris, tiap baris <=35 karakter; jika menggunakan kode harus diawali dengan '/' )");

    // validate 72Z: similar pattern to charges but max 6 lines * 35 = 210
    $.validator.addMethod("is72ZField", function(value, element) {
        if (this.optional(element)) return true;
        if (value.length > 210) return false;
        let lines = value.split(/\r?\n/);
        if (lines.length > 6) return false;
        // allow structured /8c/ or narrative. If starting slash, must be /8c/ or /CODE/
        for (let ln of lines) {
            if (ln.length > 35) return false;
            if (/^\//.test(ln) && !(/^\/8c\//.test(ln) || /^\/[A-Z0-9]{2,12}\//.test(ln) || /^\/\//.test(ln))) {
                return false;
            }
        }
        return true;
    }, "Format 72Z tidak valid");

    // validate 77J discrepancies: up to 70 lines (each <=50 chars) however in form we use maxlength 3500; we'll validate basic rules:
    $.validator.addMethod("is77JField", function(value, element) {
        if (this.optional(element)) return true;
        if (value.length > 3500) return false;
        let lines = value.split(/\r?\n/);
        if (lines.length > 70) return false;
        for (let ln of lines) {
            if (ln.length > 50) return false;
            if (/^\//.test(ln) && !(/^\/8a\//.test(ln) || /^\/[A-Z0-9]{2,12}\//.test(ln) || /^\/\//.test(ln))) {
                return false;
            }
        }
        return true;
    }, "Format 77J tidak valid (maks 70 baris, tiap baris <=50 karakter)");

    // ---------- main validate setup ----------
    let validator = $("#form_mt750").validate({
        ignore: [],               // don't ignore hidden fields (we need to validate disabled ones via conditions)
        onkeyup: false,
        onfocusout: false,
        // core rules
        rules: {
            // Header-ish (if present in your form; keep as optional if not used)
            sender_logical_terminal: { required: false },
            receiver_institution: { required: false },
            priority: { required: false },

            // Mandatory MT750 fields
            _010_mf20_sender_reference: { required: true, maxlength: 16, noSlashEdges: true },
            _020_mf21_related_reference: { required: true, maxlength: 16, noSlashEdges: true },

            _030_mf32b_currency: { required: true, isCurrency: true },
            _031_mf32b_amount: { required: true, isSwiftAmount: true, maxlength: 15 },

            _100_mf77j_discrepancies: { required: true, is77JField: true },

            // Optional but validated when present
            _040_of33b_currency: { isCurrency: true },
            _041_of33b_amount: { isSwiftAmount: true, maxlength: 15 },

            _050_of71d_charges_to_be_deducted: { isChargesField: true },
            _060_of73a_charges_to_be_added: { isChargesField: true },

            _070_of34b_currency: { isCurrency: true },
            _071_of34b_amount: { isSwiftAmount: true, maxlength: 15 },

            // 57a subfields - will be conditionally required below in submit handler
            _081_of57a_party_identifier: { maxlength: 35 },
            _082_of57a_identifier_code: { maxlength: 11, isBIC: true },
            _083_of57a_location: { maxlength: 35 },
            _084_of57a_name_address: { maxlength: 140 },

            // 72Z
            _090_of72z_sender_to_receiver_information: { is72ZField: true }
        },
        messages: {
            _010_mf20_sender_reference: { required: "Field 20 (Sender's Reference) wajib diisi", maxlength: "Maks 16 karakter", noSlashEdges: "Tidak boleh diawali/diakhiri '/', atau mengandung '//'" },
            _020_mf21_related_reference: { required: "Field 21 (Related Reference) wajib diisi", maxlength: "Maks 16 karakter", noSlashEdges: "Tidak boleh diawali/diakhiri '/', atau mengandung '//'" },

            _030_mf32b_currency: { required: "Field 32B Currency wajib diisi", isCurrency: "Format mata uang 3 huruf (ISO 4217)" },
            _031_mf32b_amount: { required: "Field 32B Amount wajib diisi", isSwiftAmount: "Format amount harus n,dd (contoh 123,45)" },

            _100_mf77j_discrepancies: { required: "Field 77J (Discrepancies) wajib diisi", is77JField: "Format 77J tidak valid" },

            _040_of33b_currency: { isCurrency: "Format mata uang 3 huruf (ISO 4217)" },
            _041_of33b_amount: { isSwiftAmount: "Format amount harus n,dd (contoh 123,45)" },

            _050_of71d_charges_to_be_deducted: { isChargesField: "Format 71D tidak valid (maks 6 baris, tiap baris <=35 karakter)" },
            _060_of73a_charges_to_be_added: { isChargesField: "Format 73A tidak valid (maks 6 baris, tiap baris <=35 karakter)" },

            _070_of34b_currency: { isCurrency: "Format mata uang 3 huruf (ISO 4217)" },
            _071_of34b_amount: { isSwiftAmount: "Format amount harus n,dd (contoh 123,45)" },

            _082_of57a_identifier_code: { isBIC: "Format BIC tidak valid (4!a2!a2!c[3!c])" },
            _090_of72z_sender_to_receiver_information: { is72ZField: "Format 72Z tidak valid (maks 6 baris, tiap baris <=35 karakter)" }
        },
        errorPlacement: function (error, element) {
            error.insertAfter(element);
            $("#tab-validate").removeAttr("hidden");
        },
        showErrors: function (errorMap, errorList) {
            this.defaultShowErrors();
            $("#tab-validate").removeAttr("hidden");

            // hide all main content tabs and show validate tab - follow your project's tab IDs
            $("#view1,#view2,#view3,#view4,#view5,#view6,#view7").css("display","none");
            $("#view8").css("display","block");

            // build error table
            let errorContainer = document.getElementById("error-container");
            let tableHTML = `<table border="0" style="width:100% !important; caption-side: bottom; font-size:8pt !important;border-collapse: collapse; border:1px gray solid;">
                                <tr style="background:#d6d6d6;">
                                <th>Type</th>
                                <th>Location</th>
                                <th>Node</th>
                                <th>Message</th></tr>`;

            errorList.forEach(errors => {
                let inputID = errors.element.id || "";
                let locationTab = errors.element.getAttribute("location") || "";
                let inputType = errors.element.getAttribute("input_type") || "";
                tableHTML += '<tr class="error__row" data-input-id="'+inputID+'" content-body="'+locationTab+'" style="cursor:pointer;">';
                tableHTML += '<td style="padding: 5px;">Error</td>';
                tableHTML += '<td style="padding: 5px;">'+locationTab+'</td>';
                tableHTML += '<td style="padding: 5px;">'+inputType+'</td>';
                tableHTML += '<td style="padding: 5px;">'+errors.message+'</td></tr>';
            });

            tableHTML += `</table>`;
            errorContainer.innerHTML = tableHTML;

            // click-to-focus behavior
            document.querySelectorAll(".error__row").forEach(row => {
                row.addEventListener("click", function (ev) {
                    let inputId = this.getAttribute("data-input-id");
                    let tabContentGroup = this.getAttribute("content-body");
                    if (inputId) {
                        let input = document.getElementById(inputId);
                        if (input) {
                            // switch tabs roughly as in your template
                            if (tabContentGroup === "Header") {
                                $("#view2,#view3,#view4,#view5,#view6,#view7,#view8").css("display","none");
                                $("#view1").css("display","block");
                                // tab class handling omitted for brevity
                            } else if (tabContentGroup === "Body") {
                                $("#view1,#view3,#view4,#view5,#view6,#view7,#view8").css("display","none");
                                $("#view2").css("display","block");
                            }
                            input.focus();
                        }
                    }
                });
            });
        }
    });

    // ---------- helper functions ----------
    function isEmptyVal(selector) {
        let el = $(selector);
        if (el.length === 0) return true;
        return $.trim(el.val() || "") === "";
    }

    // ---------- conditional rules & C1/C2 enforcement on submit/validate ----------
    $("#btn-validate, #submit_mt").on("click", function (e) {
        let isSubmit = $(this).attr("id") === "submit_mt";

        if (isSubmit) e.preventDefault();

        // trigger normal validation
        let ok = $("#form_mt750").valid();
        if (!ok) {
            alert("There are still errors! Please fix them before saving.");
            return false;
        }

        // Conditional 57a requirements (Option A/B/D)
        let opt57 = $.trim($("#_080_of57a_account_with_bank").val() || "");
        if (opt57 === "A") {
            if (isEmptyVal("#_082_of57a_identifier_code")) {
                alert("57a Option A requires Identifier Code (BIC).");
                $("#_082_of57a_identifier_code").focus();
                return false;
            }
            // validate BIC format
            if (!/^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$/.test($.trim($("#_082_of57a_identifier_code").val()))) {
                alert("57a Identifier Code harus BIC yang valid.");
                $("#_082_of57a_identifier_code").focus();
                return false;
            }
        } else if (opt57 === "B") {
            if (isEmptyVal("#_083_of57a_location")) {
                alert("57a Option B requires Location.");
                $("#_083_of57a_location").focus();
                return false;
            }
        } else if (opt57 === "D") {
            if (isEmptyVal("#_084_of57a_name_address")) {
                alert("57a Option D requires Name & Address.");
                $("#_084_of57a_name_address").focus();
                return false;
            }
        }

        // ---------- Network rules ----------
        // C1: If any of 33B/71D/73A present, then 34B must also be present (both currency & amount)
        let present33B = !isEmptyVal("#_041_of33b_amount") || !isEmptyVal("#_040_of33b_currency");
        let present71D = !isEmptyVal("#_050_of71d_charges_to_be_deducted");
        let present73A = !isEmptyVal("#_060_of73a_charges_to_be_added");

        if ((present33B || present71D || present73A)) {
            if (isEmptyVal("#_070_of34b_currency") || isEmptyVal("#_071_of34b_amount")) {
                alert("C1 Error (C13): Jika field 33B, 71D atau 73A ada, maka field 34B (Total Amount to be Paid) harus diisi (currency & amount).");
                // focus 34B currency
                $("#_070_of34b_currency").focus();
                return false;
            }
        }

        // C2: Currency code in 32B and 34B must be the same
        if (!isEmptyVal("#_070_of34b_currency")) {
            let c32 = $.trim($("#_030_mf32b_currency").val() || "");
            let c34 = $.trim($("#_070_of34b_currency").val() || "");
            if (c32 !== "" && c34 !== "" && c32 !== c34) {
                alert("C2 Error (C02): Currency pada 32B dan 34B harus sama.");
                $("#_070_of34b_currency").focus();
                return false;
            }
        }

        // If we reached here, validation passed
        if ($(this).attr("id") === "btn-validate") {
            alert("All inputs are valid!");
            return true;
        } else {
            // actual submit
            $("#form_mt750").off('submit'); // prevent recursion in case onsubmit handler exists
            $("#form_mt750").submit();
            return true;
        }
    });

    // ---------- initial enable/disable of 57a subfields (so they won't be validated wrongly) ----------
    function toggle57aForValidation() {
        let opt = $.trim($("#_080_of57a_account_with_bank").val() || "");
        if (opt === "A") {
            $("#_081_of57a_party_identifier").prop("disabled", false);
            $("#_082_of57a_identifier_code").prop("disabled", false);
            $("#_083_of57a_location").prop("disabled", true);
            $("#_084_of57a_name_address").prop("disabled", true);
        } else if (opt === "B") {
            $("#_081_of57a_party_identifier").prop("disabled", false);
            $("#_082_of57a_identifier_code").prop("disabled", true);
            $("#_083_of57a_location").prop("disabled", false);
            $("#_084_of57a_name_address").prop("disabled", true);
        } else if (opt === "D") {
            $("#_081_of57a_party_identifier").prop("disabled", false);
            $("#_082_of57a_identifier_code").prop("disabled", true);
            $("#_083_of57a_location").prop("disabled", true);
            $("#_084_of57a_name_address").prop("disabled", false);
        } else {
            $("#_081_of57a_party_identifier").prop("disabled", true);
            $("#_082_of57a_identifier_code").prop("disabled", true);
            $("#_083_of57a_location").prop("disabled", true);
            $("#_084_of57a_name_address").prop("disabled", true);
        }
    }

    $("#_080_of57a_account_with_bank").on("change", function () {
        toggle57aForValidation();
    });
    // run once on load
    toggle57aForValidation();

    // ----------------- small UX trims -----------------
    // trim narrative fields on blur (72Z, 71D, 73A, 77J)
    ["#_050_of71d_charges_to_be_deducted","#_060_of73a_charges_to_be_added","#_090_of72z_sender_to_receiver_information","#_100_mf77j_discrepancies"].forEach(function(sel) {
        $(sel).on("blur", function () {
            $(this).val($.trim($(this).val() || ""));
        });
    });

});
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />
