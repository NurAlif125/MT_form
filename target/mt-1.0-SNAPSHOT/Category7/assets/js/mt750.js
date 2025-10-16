    /* 
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
     */

    function q(id) {
        return document.getElementById(id);
    }

    function val(id) {
        const el = q(id);
        return el ? (el.value || "").trim() : "";
    }

    function isEmpty(v) {
        return !v || v.trim() === "";
    }

    function show(id, on = true) {
        const el = q(id);
        if (el) el.style.display = on ? "block" : "none";
    }

    function numbersonly(e, currencyId) {
        const charCode = (e.which) ? e.which : e.keyCode;
        const currencyField = document.getElementById(currencyId);

        if (currencyField && currencyField.value.toUpperCase() === "JPY") {
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
        } else {
            if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode !== 44) {
                return false;
            }
        }
        return true;
    }

    function textonly(e) {
        const code = e.keyCode || e.which;
        const character = String.fromCharCode(code);
        const allowRegex = /^[a-zA-Z]$/;
        return allowRegex.test(character);
    }

    function avoidSplChars(e) {
        e = e || window.event;
        let bad = /[^\sa-zA-Z0-9\.\,\'\(\)\-\/\:]/i;
        let key = String.fromCharCode(e.keyCode || e.which);
        if (e.which !== 0 && e.charCode !== 0 && bad.test(key)) {
            e.returnValue = false;
            if (e.preventDefault) e.preventDefault();
        }
    }

    function cek_koma(obj) {
        if (obj.value && !obj.value.includes(",")) {
            obj.value = obj.value + ",00";
        } else if (obj.value && obj.value.indexOf(",") !== -1) {
            let parts = obj.value.split(",");
            let intPart = String(parseInt(parts[0] || "0", 10));
            let decPart = (parts[1] || "").padEnd(2, "0").substring(0, 2);
            obj.value = intPart + "," + decPart;
        }
    }

    function cek_slash(obj) {
        if (obj.value && obj.value.length > 0 && !obj.value.startsWith("/")) {
            obj.value = "/" + obj.value;
        }
    }

    function formatAmountInput(el) {
        el.value = el.value.replace(/[^0-9,]/g, '');
    }

    function formatAmountBlur(el) {
        let v = el.value;
        if (!v) return;
        if (v.indexOf(",") === -1) {
            v = v + ",00";
        } else {
            let parts = v.split(",");
            let intPart = String(parseInt(parts[0] || "0", 10));
            let decPart = (parts[1] || "").padEnd(2, "0").substring(0, 2);
            v = intPart + "," + decPart;
        }
        el.value = v;
    }


    const ISO4217 = [
        "USD", "EUR", "JPY", "GBP", "AUD", "CAD", "CHF", "CNY", "SEK", "NZD", 
        "IDR", "SGD", "HKD", "KRW", "NOK", "MXN", "INR", "RUB", "ZAR", "TRY", 
        "BRL", "PLN", "DKK", "MYR", "PHP", "THB", "TWD", "AED", "SAR", "ILS", 
        "CZK", "HUF", "CLP", "PKR", "BDT", "NGN", "VND", "BHD", "JOD", "KWD", 
        "OMR", "TND", "LYD", "IQD"
    ];

    const DEC0 = new Set(['JPY', 'KRW', 'VND', 'HUF', 'XOF', 'XAF', 'XPF', 'CLP', 'ISK', 'PYG', 'UGX', 'VUV']);
    const DEC3 = new Set(['BHD', 'JOD', 'KWD', 'OMR', 'TND', 'LYD', 'IQD']);

    function isValidCurrency(code) {
        if (!code) return false;
        return ISO4217.includes(code.toUpperCase());
    }

    function validateAmountByCurrency(ccy, amt) {
        if (!ccy || !amt) return { valid: true, error: null };

        if (!amt.includes(',')) {
            return { valid: false, error: "Amount must contain comma (Error T40)" };
        }

        const parts = amt.split(',');
        if (parts.length !== 2) {
            return { valid: false, error: "Invalid amount format (Error T43)" };
        }

        if (!/^\d+$/.test(parts[0]) || parts[0].length === 0) {
            return { valid: false, error: "Invalid integer part (Error C03)" };
        }

        const decimalPart = parts[1];
        let allowedDecimals = 2;

        if (DEC0.has(ccy)) allowedDecimals = 0;
        if (DEC3.has(ccy)) allowedDecimals = 3;

        if (decimalPart.length > allowedDecimals) {
            return { valid: false, error: `Max ${allowedDecimals} decimal places for ${ccy} (Error T43)` };
        }

        if (allowedDecimals === 0 && decimalPart.length !== 0) {
            return { valid: false, error: `Currency ${ccy} must not have decimals (Error T43)` };
        }

        return { valid: true, error: null };
    }

    function isValidBIC(code) {
        if (!code) return false;
        const bic = code.trim().toUpperCase();
        // BIC: 6 letters + 2 alphanumeric + optional 3 alphanumeric
        const regex = /^[A-Z0-9]{8}([A-Z0-9]{3})?$/;
        return regex.test(bic);
    }


    function validateReferenceField(field) {
        if (!field) return true;

        const value = field.value.trim();
        if (!value) return true;

        if (value.startsWith('/')) {
            return false;
        }

        if (value.endsWith('/')) {
            return false;
        }

        if (value.indexOf('//') !== -1) {
            return false;
        }

        return true;
    }


    function toggle57aOption(opt) {
        show("div_080_of57a_A", false);
        show("div_080_of57a_B", false);
        show("div_080_of57a_D", false);

        if (opt === "A") {
            show("div_080_of57a_A", true);
        } else if (opt === "B") {
            show("div_080_of57a_B", true);
        } else if (opt === "D") {
            show("div_080_of57a_D", true);
        }

        q("_081_of57a_party_identifier").value = "";
        q("_082_of57a_identifier_code").value = "";
        q("_083_of57a_party_identifier").value = "";
        q("_084_of57a_location").value = "";
        q("_085_of57a_party_identifier").value = "";
        q("_086_of57a_name_address").value = "";
    }

    function validateCurrencyC2() {
        const currency32b = val("_030_mf32b_currency").trim();
        const currency34b = val("_070_of34b_currency").trim();

        if (currency34b && currency32b && currency32b !== currency34b) {
            alert("Rule C2: Currency in field 34B must be the same as field 32B");
            return false;
        }

        return true;
    }

    function validateRuleC1() {
        const has33B = !isEmpty(val("_040_of33b_currency")) || !isEmpty(val("_041_of33b_amount"));
        const has71D = !isEmpty(val("_050_of71d_charges_to_be_deducted"));
        const has73A = !isEmpty(val("_060_of73a_charges_to_be_added"));
        const has34B = !isEmpty(val("_070_of34b_currency")) || !isEmpty(val("_071_of34b_amount"));

        if ((has33B || has71D || has73A) && !has34B) {
            alert("Rule C1 (Error C13): If fields 33B, 71D, or 73A are present, field 34B must also be present");
            return false;
        }

        return true;
    }

    function validateBIC57a() {
        const option = val("_080_of57a_account_with_bank");

        if (option === "A") {
            const bic = val("_082_of57a_identifier_code");
            if (bic && !isValidBIC(bic)) {
                alert("Invalid BIC in field 57a Option A (Rules C05, T27, T28, T29, T45)");
                q("_082_of57a_identifier_code").focus();
                return false;
            }
        }

        return true;
    }

    function setupTabNavigation() {
        const tabs = document.querySelectorAll('.tabs li a');
        const tabContents = document.querySelectorAll('.tabcontent');

        tabs.forEach(tab => {
            tab.addEventListener('click', function(e) {
                e.preventDefault();
                const targetId = this.getAttribute('rel');

                tabContents.forEach(content => {
                    content.style.display = 'none';
                    content.classList.remove('active');
                });

                tabs.forEach(t => t.parentElement.classList.remove('selected'));

                const targetContent = document.getElementById(targetId);
                if (targetContent) {
                    targetContent.style.display = 'block';
                    targetContent.classList.add('active');
                }

                this.parentElement.classList.add('selected');
            });
        });

        const bodyTab = document.getElementById('view2');
        if (bodyTab) {
            bodyTab.style.display = 'block';
            bodyTab.classList.add('active');
        }
        const bodyTabLink = document.querySelector('.tabs li a[rel="view2"]');
        if (bodyTabLink) {
            bodyTabLink.parentElement.classList.add('selected');
        }
    }


    function validateMT750() {
        console.log('Starting MT750 validation...');

        // 1. Mandatory field: MF20 Sender's Reference
        if (isEmpty(val("_010_mf20_sender_reference"))) {
            alert("Field 20 (Sender's Reference) is mandatory.");
            q("_010_mf20_sender_reference").focus();
            return false;
        }

        // Validate T26 for Field 20
        const field20 = q("_010_mf20_sender_reference");
        if (!validateReferenceField(field20)) {
            alert("Field 20 (Sender's Reference): Cannot start/end with '/' or contain '//' (Error T26)");
            field20.focus();
            return false;
        }

        // 2. Mandatory field: MF21 Related Reference
        if (isEmpty(val("_020_mf21_related_reference"))) {
            alert("Field 21 (Related Reference) is mandatory.");
            q("_020_mf21_related_reference").focus();
            return false;
        }

        // Validate T26 for Field 21
        const field21 = q("_020_mf21_related_reference");
        if (!validateReferenceField(field21)) {
            alert("Field 21 (Related Reference): Cannot start/end with '/' or contain '//' (Error T26)");
            field21.focus();
            return false;
        }

        // 3. Mandatory field: MF32B Currency
        const currency32b = val("_030_mf32b_currency");
        if (isEmpty(currency32b)) {
            alert("Field 32B Currency is mandatory.");
            q("_030_mf32b_currency").focus();
            return false;
        }

        // Validate T52: ISO 4217
        if (!isValidCurrency(currency32b)) {
            alert("Field 32B Currency: Invalid ISO 4217 currency code (Error T52)");
            q("_030_mf32b_currency").focus();
            return false;
        }

        // 4. Mandatory field: MF32B Amount
        const amount32b = val("_031_mf32b_amount");
        if (isEmpty(amount32b)) {
            alert("Field 32B Amount is mandatory.");
            q("_031_mf32b_amount").focus();
            return false;
        }

        // Validate amount format for field 32B (C03, T40, T43)
        const result32b = validateAmountByCurrency(currency32b, amount32b);
        if (!result32b.valid) {
            alert("Field 32B Amount: " + result32b.error);
            q("_031_mf32b_amount").focus();
            return false;
        }

        // 5. Optional field: OF33B Amount (if present, currency must be ISO 4217)
        const currency33b = val("_040_of33b_currency");
        const amount33b = val("_041_of33b_amount");

        if (!isEmpty(currency33b) || !isEmpty(amount33b)) {
            if (currency33b && !isValidCurrency(currency33b)) {
                alert("Field 33B Currency: Invalid ISO 4217 currency code (Error T52)");
                q("_040_of33b_currency").focus();
                return false;
            }

            if (amount33b) {
                const result33b = validateAmountByCurrency(currency33b || currency32b, amount33b);
                if (!result33b.valid) {
                    alert("Field 33B Amount: " + result33b.error);
                    q("_041_of33b_amount").focus();
                    return false;
                }
            }
        }

        // 6. Validate Rule C1 (if 33B, 71D, or 73A present, then 34B must be present)
        if (!validateRuleC1()) {
            return false;
        }

        // 7. Optional field: OF34B (if present, must have valid currency and amount)
        const currency34b = val("_070_of34b_currency");
        const amount34b = val("_071_of34b_amount");

        if (!isEmpty(currency34b) || !isEmpty(amount34b)) {
            if (currency34b && !isValidCurrency(currency34b)) {
                alert("Field 34B Currency: Invalid ISO 4217 currency code (Error T52)");
                q("_070_of34b_currency").focus();
                return false;
            }

            if (amount34b) {
                const result34b = validateAmountByCurrency(currency34b || currency32b, amount34b);
                if (!result34b.valid) {
                    alert("Field 34B Amount: " + result34b.error);
                    q("_071_of34b_amount").focus();
                    return false;
                }
            }
        }

        // 8. Validate Rule C2 (Currency 32B must equal Currency 34B if both present)
        if (!validateCurrencyC2()) {
            return false;
        }

        // 9. Optional field: OF57a (Conditional validation)
        const option57a = val("_080_of57a_account_with_bank");

        if (option57a === "A") {
            const bicCode = val("_082_of57a_identifier_code");

            if (isEmpty(bicCode)) {
                alert("Field 57a Option A requires Identifier Code (BIC).");
                q("_082_of57a_identifier_code").focus();
                return false;
            }

            if (!validateBIC57a()) {
                return false;
            }
        } else if (option57a === "B") {
            const location = val("_084_of57a_location");
            if (isEmpty(location)) {
                alert("Field 57a Option B requires Location.");
                q("_084_of57a_location").focus();
                return false;
            }
        } else if (option57a === "D") {
            const nameAddr = val("_086_of57a_name_address");
            if (isEmpty(nameAddr)) {
                alert("Field 57a Option D requires Name & Address.");
                q("_086_of57a_name_address").focus();
                return false;
            }
        }

        // 10. Mandatory field: MF77J Discrepancies
        if (isEmpty(val("_100_mf77j_discrepancies"))) {
            alert("Field 77J (Discrepancies) is mandatory.");
            q("_100_mf77j_discrepancies").focus();
            return false;
        }

        console.log('MT750 validation completed successfully');
        return true;
    }


    function setupRealtimeValidations() {
        // Field 20 - Sender's Reference (T26)
        const field20 = q("_010_mf20_sender_reference");
        if (field20) {
            field20.addEventListener('blur', function() {
                validateReferenceField(this);
            });
        }

        // Field 21 - Related Reference (T26)
        const field21 = q("_020_mf21_related_reference");
        if (field21) {
            field21.addEventListener('blur', function() {
                validateReferenceField(this);
            });
        }

        // Field 32B Currency - ISO 4217 validation
        const currency32b = q("_030_mf32b_currency");
        if (currency32b) {
            currency32b.addEventListener('blur', function() {
                if (this.value && !isValidCurrency(this.value)) {
                    alert("Invalid ISO 4217 currency code: " + this.value + " (Error T52)");
                    this.focus();
                }
            });
            currency32b.addEventListener('input', function() {
                this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '').slice(0, 3);
            });
        }

        // Field 32B Amount - Format and validate
        const amount32b = q("_031_mf32b_amount");
        if (amount32b) {
            amount32b.addEventListener('blur', function() {
                formatAmountBlur(this);
            });
            amount32b.addEventListener('input', function() {
                formatAmountInput(this);
            });
        }

        // Field 33B Currency - ISO 4217 validation
        const currency33b = q("_040_of33b_currency");
        if (currency33b) {
            currency33b.addEventListener('blur', function() {
                if (this.value && !isValidCurrency(this.value)) {
                    alert("Invalid ISO 4217 currency code: " + this.value + " (Error T52)");
                    this.focus();
                }
            });
            currency33b.addEventListener('input', function() {
                this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '').slice(0, 3);
            });
        }

        // Field 33B Amount - Format
        const amount33b = q("_041_of33b_amount");
        if (amount33b) {
            amount33b.addEventListener('blur', function() {
                formatAmountBlur(this);
            });
            amount33b.addEventListener('input', function() {
                formatAmountInput(this);
            });
        }

        // Field 34B Currency - ISO 4217 validation
        const currency34b = q("_070_of34b_currency");
        if (currency34b) {
            currency34b.addEventListener('blur', function() {
                if (this.value && !isValidCurrency(this.value)) {
                    alert("Invalid ISO 4217 currency code: " + this.value + " (Error T52)");
                    this.focus();
                }
                validateCurrencyC2();
            });
            currency34b.addEventListener('input', function() {
                this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '').slice(0, 3);
            });
        }

        // Field 34B Amount - Format and validate C2
        const amount34b = q("_071_of34b_amount");
        if (amount34b) {
            amount34b.addEventListener('blur', function() {
                formatAmountBlur(this);
                validateCurrencyC2();
            });
            amount34b.addEventListener('input', function() {
                formatAmountInput(this);
            });
        }

        // Field 57a - BIC validation
        const bic57a = q("_082_of57a_identifier_code");
        if (bic57a) {
            bic57a.addEventListener('blur', function() {
                if (this.value && !isValidBIC(this.value)) {
                    alert("Invalid BIC format (Error C05, T27, T28, T29, T45)");
                    this.focus();
                }
            });
            bic57a.addEventListener('input', function() {
                this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '').slice(0, 11);
            });
        }
    }


    document.addEventListener("DOMContentLoaded", function() {
        console.log('Initializing MT750 form...');

        setupTabNavigation();

        setupRealtimeValidations();

        const select57a = document.getElementById("_080_of57a_account_with_bank");
        if (select57a) {
            console.log('Found field 57a select element');

            select57a.addEventListener("change", function(e) {
                console.log('Field 57a changed to:', this.value);
                toggle57aOption(this.value);
            });

            const initialValue = select57a.value;
            console.log('Initial field 57a value:', initialValue);
            if (initialValue) {
                toggle57aOption(initialValue);
            }
        } else {
            console.warn('Field 57a select element not found!');
        }

        console.log('MT750 form initialized successfully');
    });


    window.validateMT750 = validateMT750;
    window.toggle57aOption = toggle57aOption;
    window.cek_koma = cek_koma;
    window.cek_slash = cek_slash;
    window.numbersonly = numbersonly;
    window.textonly = textonly;
    window.avoidSplChars = avoidSplChars;
    window.validateReferenceField = validateReferenceField;
    window.isValidCurrency = isValidCurrency;
    window.isValidBIC = isValidBIC;
    
    