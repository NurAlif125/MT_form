<%-- 
    Document   : validate_rule_mt210
    Created on : Oct 3, 2025, 9:35:40 AM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/validate.css" />
<script type="text/javascript">
$(document).ready(function () {

    /* ========================= CONSTANTS ========================= */
    const ISO4217_CURRENCIES = [
        "AED","AFN","ALL","AMD","ANG","AOA","ARS","AUD","AWG","AZN","BAM","BBD","BDT","BGN","BHD",
        "BIF","BMD","BND","BOB","BRL","BSD","BTN","BWP","BYN","BZD","CAD","CDF","CHF","CLP","CNY",
        "COP","CRC","CUP","CVE","CZK","DJF","DKK","DOP","DZD","EGP","ERN","ETB","EUR","FJD","FKP",
        "GBP","GEL","GGP","GHS","GIP","GMD","GNF","GTQ","GYD","HKD","HNL","HRK","HTG","HUF","IDR",
        "ILS","IMP","INR","IQD","IRR","ISK","JEP","JMD","JOD","JPY","KES","KGS","KHR","KMF","KPW",
        "KRW","KWD","KYD","KZT","LAK","LBP","LKR","LRD","LSL","LYD","MAD","MDL","MGA","MKD","MMK",
        "MNT","MOP","MRU","MUR","MVR","MWK","MXN","MYR","MZN","NAD","NGN","NIO","NOK","NPR","NZD",
        "OMR","PAB","PEN","PGK","PHP","PKR","PLN","PYG","QAR","RON","RSD","RUB","RWF","SAR","SBD",
        "SCR","SDG","SEK","SGD","SHP","SLE","SLL","SOS","SPL","SRD","STN","SYP","SZL","THB","TJS",
        "TMT","TND","TOP","TRY","TTD","TVD","TWD","TZS","UAH","UGX","USD","UYU","UZS","VES","VND",
        "VUV","WST","XAF","XCD","XDR","XOF","XPF","YER","ZAR","ZMW","ZWD"
    ];
    const FORBIDDEN_CURRENCIES = ["XAU","XAG","XPD","XPT"];
    const VALID_50F_CODES = ["ARNU","CCPT","CUST","DRLC","EMPL","NIDN","SOSE","TXID"];
    const BIC_REGEX = /^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$/;

    /* ========================= REGEX METHOD ========================= */
    $.validator.addMethod("regex", function(value, element, param) {
        return this.optional(element) || param.test(value);
    }, "Format tidak valid");

    /* ========================= DYNAMIC VALIDATION FOR MULTIPLE SETS ========================= */
    $.validator.addMethod("validateAllSets", function(value, element) {
        let valid = true;
        const setCount = parseInt($("#setCount").val() || "1");
        
        for (let i = 0; i < setCount; i++) {
            const set = $("#set_" + i);
            if (!set.length) continue;
            
            // Validate Field 21 - Related Reference (MANDATORY in each set)
            const ref21 = set.find('input[name*="_040_mf21_related_references"]');
            if (ref21.length) {
                const val = ref21.val().trim();
                if (!val) {
                    ref21.addClass("error");
                    valid = false;
                } else if (val.startsWith("/") || val.endsWith("/") || val.includes("//")) {
                    ref21.addClass("error");
                    valid = false;
                } else {
                    ref21.removeClass("error");
                }
            }
            
            // Validate Currency (MANDATORY in each set)
            const cur = set.find('input[name*="_050_mf32b_currency"]');
            if (cur.length) {
                const val = cur.val().trim();
                if (!val || val.length !== 3 || !/^[A-Z]{3}$/.test(val)) {
                    cur.addClass("error");
                    valid = false;
                } else {
                    cur.removeClass("error");
                }
            }
            
            // Validate Amount (MANDATORY in each set)
            const amt = set.find('input[name*="_051_mf32b_amount"]');
            if (amt.length) {
                const val = amt.val().trim();
                if (!val || !/^[0-9]{1,12},[0-9]{1,2}$/.test(val)) {
                    amt.addClass("error");
                    valid = false;
                } else {
                    amt.removeClass("error");
                }
            }
            
            // Validate Rule C2: Either 50a OR 52a must be present (not both)
            const sel50a = set.find('select[name*="_060_of50a_ordering_customer"]');
            const sel52a = set.find('select[name*="_070_of52A_ordering_institution"]');
            
            const has50a = sel50a.length && sel50a.val() !== "";
            const has52a = sel52a.length && sel52a.val() !== "";
            
            if ((has50a && has52a) || (!has50a && !has52a)) {
                if (sel50a.length) sel50a.addClass("error");
                if (sel52a.length) sel52a.addClass("error");
                valid = false;
            } else {
                if (sel50a.length) sel50a.removeClass("error");
                if (sel52a.length) sel52a.removeClass("error");
            }
        }
        
        return valid;
    }, "Validation failed for one or more sets");

    /* ========================= MAIN VALIDATION ========================= */
    let validator = $("#form_mt210").validate({
        ignore: [],
        onkeyup: false,
        onfocusout: false,
        rules: {
            // Header fields (if they exist)
            sender_logical_terminal: "required",
            receiver_institution: "required",
            priority: "required",

            // Non-repetitive fields
            _010_mf20_transactions_reference_number: {
                required: true,
                maxlength: 16,
                regex: /^(?!\/)(?!.*\/\/)(?!.*\/$)[A-Za-z0-9\/]+$/
            },
            _020_of25_account_identification: { 
                maxlength: 35 
            },
            _030_mf30_value_date: {
                required: true,
                digits: true,
                minlength: 6,
                maxlength: 6
            },
            
            // Repetitive fields - Set 0 (first set)
            _040_mf21_related_references: {
                required: true,
                maxlength: 16,
                regex: /^(?!\/)(?!.*\/\/)(?!.*\/$)[A-Za-z0-9\/]+$/
            },
            _050_mf32b_currency: {
                required: true,
                minlength: 3,
                maxlength: 3,
                regex: /^[A-Z]{3}$/
            },
            _051_mf32b_amount: {
                required: true,
                regex: /^[0-9]{1,12},[0-9]{1,2}$/
            },
            
            // Field 50a options
            _061_of50a_name_address: { maxlength: 140 },
            _062_of50c_identifier_code: { maxlength: 11, regex: BIC_REGEX },
            _063_of50f_party_identifier: { maxlength: 35 },
            _064_of50f_number: { 
                regex: /^(ARNU|CCPT|CUST|DRLC|EMPL|NIDN|SOSE|TXID)?$/ 
            },
            _065_of50f_details: { maxlength: 33 },
            
            // Field 52a options
            _071_of52a_party_identifier: { maxlength: 37 },
            _072_of52a_identifier_code: { maxlength: 11, regex: BIC_REGEX },
            _073_of52d_party_identifier: { maxlength: 35 },
            _074_of52d_name_address: { maxlength: 140 },
            
            // Field 56a options
            _081_of56a_party_identifier: { maxlength: 37 },
            _082_of56a_identifier_code: { maxlength: 11, regex: BIC_REGEX },
            _083_of56d_party_identifier: { maxlength: 37 },
            _084_of56d_name_address: { maxlength: 140 }
        },
        messages: {
            sender_logical_terminal: { required: "Sender Logical Terminal wajib diisi!" },
            receiver_institution: { required: "Receiver Institution wajib diisi!" },
            priority: { required: "Priority wajib diisi!" },
            
            _010_mf20_transactions_reference_number: {
                required: "Field 20 (Transaction Reference) wajib diisi!",
                maxlength: "Maksimal 16 karakter",
                regex: "Tidak boleh diawali/diakhiri '/' atau mengandung '//'"
            },
            _030_mf30_value_date: {
                required: "Field 30 (Value Date) wajib diisi!",
                digits: "Harus angka (YYMMDD)",
                minlength: "Harus 6 digit (YYMMDD)",
                maxlength: "Harus 6 digit (YYMMDD)"
            },
            _040_mf21_related_references: {
                required: "Field 21 (Related Reference) wajib diisi!",
                maxlength: "Maksimal 16 karakter",
                regex: "Tidak boleh diawali/diakhiri '/' atau mengandung '//'"
            },
            _050_mf32b_currency: {
                required: "Field 32B Currency wajib diisi",
                regex: "Currency harus 3 huruf kapital (ISO 4217)"
            },
            _051_mf32b_amount: {
                required: "Field 32B Amount wajib diisi",
                regex: "Format: 1234,00 (gunakan koma sebagai desimal)"
            },
            _062_of50c_identifier_code: { regex: "Format BIC tidak valid (8 atau 11 karakter)" },
            _064_of50f_number: { regex: "Code tidak valid. Gunakan: ARNU, CCPT, CUST, DRLC, EMPL, NIDN, SOSE, atau TXID" },
            _072_of52a_identifier_code: { regex: "Format BIC tidak valid (8 atau 11 karakter)" },
            _082_of56a_identifier_code: { regex: "Format BIC tidak valid (8 atau 11 karakter)" }
        },
        errorPlacement: function(error, element) {
            error.insertAfter(element);
            $("#tab-validate").removeAttr("hidden");
        },
        showErrors: function(map, list) {
            this.defaultShowErrors();
            
            if (list.length > 0) {
                $("#tab-validate").removeAttr("hidden");
                $("#view1,#view2,#view3,#view4,#view5,#view6,#view7").hide();
                $("#view8").show();
                $('.tabs li').removeClass("selected");
                $('#tab-validate').addClass("selected");

                let html = `<table style="width:100%;font-size:8pt;border-collapse:collapse;border:1px solid #999;">
                          <tr style="background:#d6d6d6;">
                          <th>Type</th><th>Location</th><th>Field</th><th>Message</th></tr>`;
                
                list.forEach(e => {
                    let id = e.element.id || "";
                    let loc = e.element.getAttribute("location") || "Body";
                    let typ = e.element.getAttribute("input_type") || e.element.name || "";
                    html += `<tr class="error__row" data-id="${id}" data-loc="${loc}" style="cursor:pointer;">
                            <td>Error</td><td>${loc}</td><td>${typ}</td><td>${e.message}</td></tr>`;
                });
                
                html += "</table>";
                $("#error-container").html(html);

                $(".error__row").on("click", function() {
                    const id = $(this).data("id");
                    const loc = $(this).data("loc");
                    const input = $("#" + id);
                    
                    if (loc === "Header") { 
                        $("#view1").show().siblings(".tabcontent").hide(); 
                        $('#tab-view1').addClass("selected"); 
                    } else { 
                        $("#view2").show().siblings(".tabcontent").hide(); 
                        $('#tab-view2').addClass("selected"); 
                    }
                    
                    input.focus();
                });
            }
        }
    });

    /* ========================= SUBMIT VALIDATION (SWIFT RULES) ========================= */
    $("#form_mt210").submit(function(e) {
        const setCount = parseInt($("#setCount").val() || "1");
        
        // ===== RULE C1: Maximum 10 sets =====
        if (setCount > 10) {
            alert("Rule C1 Error: Maximum 10 repetitive sequences allowed");
            return false;
        }
        
        // ===== VALIDATE ALL SETS (Field 21, 32B, C2) =====
        let setErrors = [];
        
        for (let i = 0; i < setCount; i++) {
            const set = $("#set_" + i);
            if (!set.length) continue;
            
            // Validate Field 21
            const ref21 = set.find('input[name*="_040_mf21_related_references"]');
            if (ref21.length) {
                const val = ref21.val().trim();
                if (!val) {
                    setErrors.push("Set #" + (i + 1) + " - Field 21 (Related Reference) is mandatory");
                } else if (val.startsWith("/") || val.endsWith("/") || val.includes("//")) {
                    setErrors.push("Set #" + (i + 1) + " - Field 21: Must not start/end with '/' or contain '//'");
                }
            }
            
            // Validate Rule C2: Either 50a OR 52a
            const sel50a = set.find('select[name*="_060_of50a_ordering_customer"]');
            const sel52a = set.find('select[name*="_070_of52A_ordering_institution"]');
            
            const has50a = sel50a.length && sel50a.val() !== "";
            const has52a = sel52a.length && sel52a.val() !== "";
            
            if (has50a && has52a) {
                setErrors.push("Set #" + (i + 1) + " - Rule C2 Error: Both Field 50a and 52a cannot be present");
            }
            if (!has50a && !has52a) {
                setErrors.push("Set #" + (i + 1) + " - Rule C2 Error: Either Field 50a or 52a must be present");
            }
        }
        
        if (setErrors.length > 0) {
            alert("Validation Errors:\n\n" + setErrors.join("\n"));
            return false;
        }
        
        // ===== RULE C3: Currency Consistency =====
        let currList = $("input[name*='_050_mf32b_currency']")
            .map(function() { return $(this).val().trim().toUpperCase(); })
            .get()
            .filter(Boolean);
        
        if (currList.length > 1 && !currList.every(c => c === currList[0])) {
            alert("Rule C3 Error: All Currency Codes (Field 32B) must be the same\nFound: " + currList.join(", "));
            return false;
        }

        // ===== RULE T52: ISO 4217 Validation =====
        let curr = currList[0] || "";
        if (curr && !ISO4217_CURRENCIES.includes(curr)) {
            alert("Rule T52 Error: '" + curr + "' is not a valid ISO 4217 currency code");
            return false;
        }
        
        // ===== RULE C08: Forbidden Commodities =====
        if (curr && FORBIDDEN_CURRENCIES.includes(curr)) {
            alert("Rule C08 Error: Currency '" + curr + "' is not allowed\nUse category 6 messages for commodities (XAU, XAG, XPD, XPT)");
            return false;
        }

        // ===== RULE T50: Date Validation (YYMMDD) =====
        let dateVal = $("#_030_mf30_value_date").val().trim();
        if (dateVal.length === 6) {
            let yy = parseInt(dateVal.substr(0, 2));
            let mm = parseInt(dateVal.substr(2, 2));
            let dd = parseInt(dateVal.substr(4, 2));
            let year = (yy < 50 ? 2000 : 1900) + yy;
            let dt = new Date(year, mm - 1, dd);
            
            if (mm < 1 || mm > 12 || 
                dt.getFullYear() !== year || 
                dt.getMonth() + 1 !== mm || 
                dt.getDate() !== dd) {
                alert("Rule T50 Error: Invalid date '" + dateVal + "' (must be valid YYMMDD)");
                return false;
            }
        }

        // ===== RULE T40 & T43: Amount Validation =====
        for (let i = 0; i < setCount; i++) {
            const set = $("#set_" + i);
            if (!set.length) continue;
            
            const amtInput = set.find('input[name*="_051_mf32b_amount"]');
            const curInput = set.find('input[name*="_050_mf32b_currency"]');
            
            if (amtInput.length && curInput.length) {
                let amt = amtInput.val().trim();
                let currency = curInput.val().trim().toUpperCase();
                
                if (amt) {
                    // T40: Amount must be > 0
                    let val = parseFloat(amt.replace(",", ".")); 
                    if (isNaN(val) || val <= 0) {
                        alert("Set #" + (i + 1) + " - Rule T40 Error: Amount must be greater than 0");
                        return false;
                    }
                    
                    // T43: Decimal precision check
                    if (currency) {
                        let decimalPart = (amt.split(",")[1] || "");
                        let maxDecimals = (currency === "JPY" ? 0 : 2);
                        
                        if (decimalPart.length > maxDecimals) {
                            alert("Set #" + (i + 1) + " - Rule T43 Error: Decimal places exceed maximum (" + maxDecimals + ") for " + currency);
                            return false;
                        }
                    }
                }
            }
        }

        // ===== RULE T55/T56: Field 50F Validation =====
        for (let i = 0; i < setCount; i++) {
            const set = $("#set_" + i);
            if (!set.length) continue;
            
            const sel50a = set.find('select[name*="_060_of50a_ordering_customer"]');
            if (sel50a.length && sel50a.val() === "f") {
                const codeField = set.find('select[name*="_064_of50f_number"]');
                const detailsField = set.find('input[name*="_065_of50f_details"]');
                
                if (codeField.length && detailsField.length) {
                    let code = codeField.val().trim().toUpperCase();
                    let details = detailsField.val().trim();
                    
                    // T55: Code must be valid
                    if (code && !VALID_50F_CODES.includes(code)) {
                        alert("Set #" + (i + 1) + " - Rule T55 Error: Invalid 50F code '" + code + "'\nValid codes: " + VALID_50F_CODES.join(", "));
                        return false;
                    }
                    
                    // T56: If code is selected, details must be provided
                    if (code && !details) {
                        alert("Set #" + (i + 1) + " - Rule T56 Error: Field 50F Details must be provided when Number is selected");
                        return false;
                    }
                }
            }
        }

        // ===== RULE T27/T28: BIC Validation =====
        const bicFields = [
            { selector: 'input[name*="_062_of50c_identifier_code"]', name: "Field 50C" },
            { selector: 'input[name*="_072_of52a_identifier_code"]', name: "Field 52A" },
            { selector: 'input[name*="_082_of56a_identifier_code"]', name: "Field 56A" }
        ];
        
        for (let i = 0; i < setCount; i++) {
            const set = $("#set_" + i);
            if (!set.length) continue;
            
            for (const field of bicFields) {
                const bicInput = set.find(field.selector);
                if (bicInput.length) {
                    const bicValue = bicInput.val().trim();
                    if (bicValue && !BIC_REGEX.test(bicValue)) {
                        alert("Set #" + (i + 1) + " - Rule T27/T28 Error: Invalid BIC format in " + field.name + "\nBIC must be 8 or 11 characters");
                        return false;
                    }
                }
            }
        }
        
        return true;
    });

});
</script>

<!-- ========================= TOGGLE LOGIC (SYNCHRONIZED WITH mt210.js) ========================= -->
<script type="text/javascript">
$(document).ready(function() {
    
    /* ========================= TOGGLE FUNCTION FOR DYNAMIC SETS ========================= */
    function toggleForSet(setIdx, group, sel) {
        const set = $("#set_" + setIdx);
        if (!set.length) return;
        
        // Hide all options first
        set.find('[id^="div_' + group + '_"]').hide();
        
        // Show selected option
        if (sel === "a") {
            set.find('[id^="div_' + group + '_"][id*="ordering_customer"]:not([id*="50c"]):not([id*="50f"])').show();
            set.find('[id^="div_' + group + 'a_"]').show();
        } else if (sel === "c") {
            set.find('[id^="div_' + group + 'c_"]').show();
        } else if (sel === "f") {
            set.find('[id^="div_' + group + 'f_"]').show();
        } else if (sel === "d") {
            set.find('[id^="div_' + group + 'd_"]').show();
        }
    }
    
    /* ========================= INITIALIZE DROPDOWNS FOR ALL SETS ========================= */
    function initializeAllSets() {
        const setCount = parseInt($("#setCount").val() || "1");
        
        for (let i = 0; i < setCount; i++) {
            const set = $("#set_" + i);
            if (!set.length) continue;
            
            // Field 50a
            const sel50a = set.find('select[name*="_060_of50a_ordering_customer"]');
            if (sel50a.length) {
                sel50a.off("change").on("change", function() {
                    toggleForSet(i, "of50", $(this).val());
                });
                
                // Initialize based on existing data
                const nameAddr = set.find('textarea[name*="_061_of50a_name_address"]');
                const identCode = set.find('input[name*="_062_of50c_identifier_code"]');
                const partyId = set.find('input[name*="_063_of50f_party_identifier"]');
                const details = set.find('input[name*="_065_of50f_details"]');
                
                if (nameAddr.length && nameAddr.val().trim()) {
                    sel50a.val("a").trigger("change");
                } else if (identCode.length && identCode.val().trim()) {
                    sel50a.val("c").trigger("change");
                } else if ((partyId.length && partyId.val().trim()) || (details.length && details.val().trim())) {
                    sel50a.val("f").trigger("change");
                }
            }
            
            // Field 52a
            const sel52a = set.find('select[name*="_070_of52A_ordering_institution"]');
            if (sel52a.length) {
                sel52a.off("change").on("change", function() {
                    toggleForSet(i, "of52", $(this).val());
                });
                
                // Initialize based on existing data
                const party52a = set.find('input[name*="_071_of52a_party_identifier"]');
                const ident52a = set.find('input[name*="_072_of52a_identifier_code"]');
                const party52d = set.find('input[name*="_073_of52d_party_identifier"]');
                const name52d = set.find('textarea[name*="_074_of52d_name_address"]');
                
                if ((party52a.length && party52a.val().trim()) || (ident52a.length && ident52a.val().trim())) {
                    sel52a.val("a").trigger("change");
                } else if ((party52d.length && party52d.val().trim()) || (name52d.length && name52d.val().trim())) {
                    sel52a.val("d").trigger("change");
                }
            }
            
            // Field 56a
            const sel56a = set.find('select[name*="_080_of56a_intermediary"]');
            if (sel56a.length) {
                sel56a.off("change").on("change", function() {
                    toggleForSet(i, "of56", $(this).val());
                });
                
                // Initialize based on existing data
                const party56a = set.find('input[name*="_081_of56a_party_identifier"]');
                const ident56a = set.find('input[name*="_082_of56a_identifier_code"]');
                const party56d = set.find('input[name*="_083_of56d_party_identifier"]');
                const name56d = set.find('textarea[name*="_084_of56d_name_address"]');
                
                if ((party56a.length && party56a.val().trim()) || (ident56a.length && ident56a.val().trim())) {
                    sel56a.val("a").trigger("change");
                } else if ((party56d.length && party56d.val().trim()) || (name56d.length && name56d.val().trim())) {
                    sel56a.val("d").trigger("change");
                }
            }
        }
    }
    
    // Initialize on page load
    initializeAllSets();
    
    // Re-initialize when new sets are added (using MutationObserver)
    const observer = new MutationObserver(function(mutations) {
        mutations.forEach(function(mutation) {
            if (mutation.addedNodes.length) {
                initializeAllSets();
            }
        });
    });
    
    const container = document.getElementById("setsContainer");
    if (container) {
        observer.observe(container, { childList: true, subtree: false });
    }
});
</script>