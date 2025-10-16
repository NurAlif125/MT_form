/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

function q(id) { 
    return document.getElementById(id); 
}

function show(id, visible = true) { 
    const el = q(id); 
    if (el) el.style.display = visible ? "block" : "none"; 
}

function val(id) { 
    const el = q(id); 
    return el ? (el.value || "").trim() : ""; 
}

function isEmpty(v) { 
    return !v || v.trim() === ""; 
}

function clearFieldValues(fieldIds) {
    fieldIds.forEach(id => {
        const field = q(id);
        if (field) field.value = "";
    });
}

function numbersonly(e) {
    const charCode = (e.which) ? e.which : e.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

function numbersonlyWithComma(e) {
    const charCode = (e.which) ? e.which : e.keyCode;
    if ([8, 9, 27, 13, 44].indexOf(charCode) !== -1 ||
        (charCode === 65 && e.ctrlKey === true) ||
        (charCode === 67 && e.ctrlKey === true) ||
        (charCode === 86 && e.ctrlKey === true) ||
        (charCode === 88 && e.ctrlKey === true)) {
        return true;
    }
    if (charCode < 48 || charCode > 57) {
        return false;
    }
    return true;
}

function textonly(e) {
    let code = e.keyCode || e.which;
    let character = String.fromCharCode(code);
    let allowRegex = /^[a-zA-Z\s-]$/;
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

function formatAmountInput(el) {
    el.value = el.value.replace(/[^0-9,]/g, '');
}

function formatAmountBlur(el) {
    let v = el.value.trim();
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

function cek_slash(obj) {
    if (obj.value && obj.value.length > 0 && !obj.value.startsWith("/")) {
        obj.value = "/" + obj.value;
    }
}

function isYYMMDD(d) {
    if (!/^\d{6}$/.test(d)) return false;
    
    const yy = parseInt(d.slice(0, 2), 10);
    const mm = parseInt(d.slice(2, 4), 10);
    const dd = parseInt(d.slice(4, 6), 10);
    
    if (mm < 1 || mm > 12) return false;
    if (dd < 1 || dd > 31) return false;
    
    const dim = [31, (yy % 4 === 0 ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return dd <= dim[mm - 1];
}

function yymmdd(id) {
    const el = q(id);
    if (!el || typeof jQuery === "undefined" || !jQuery.fn.datepicker) return;

    jQuery(function($) {
        $("#" + id).datepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: "-100:+10",
            showAnim: "fadeIn",
            dateFormat: "yymmdd",
            onSelect: function() {
                const d = $(this).datepicker('getDate');
                if (d) {
                    const yy = String(d.getFullYear()).slice(-2);
                    const mm = String(d.getMonth() + 1).padStart(2, '0');
                    const dd = String(d.getDate()).padStart(2, '0');
                    this.value = yy + mm + dd;
                }
            }
        });

        const cur = el.value && el.value.trim();
        if (cur && /^\d{6}$/.test(cur)) {
            const yy = parseInt(cur.slice(0, 2), 10);
            const mm = parseInt(cur.slice(2, 4), 10);
            const dd = parseInt(cur.slice(4, 6), 10);
            const thisYear = new Date().getFullYear();
            const thisCentury = Math.floor(thisYear / 100) * 100;
            let fullYear = thisCentury + yy;
            if (fullYear - thisYear > 10) fullYear -= 100;
            try {
                $(el).datepicker('setDate', new Date(fullYear, mm - 1, dd));
            } catch (e) {
                console.warn('Invalid date for datepicker:', cur);
            }
        }
    });
}

function toggle32aOption(opt) {
    show("div_030_mf32a_A", opt === "A");
    show("div_030_mf32a_B", opt === "B");
    
    // Clear fields when switching options
    if (opt !== "A") {
        clearFieldValues(["_031_mf32a_date", "_032_mf32a_currency", "_033_mf32a_amount"]);
    }
    if (opt !== "B") {
        clearFieldValues(["_034_mf32a_currency", "_035_mf32a_amount"]);
    }
}

function toggle34aOption(opt) {
    show("div_070_of34a_A", opt === "A");
    show("div_070_of34a_B", opt === "B");
    
    // Clear fields when switching options
    if (opt !== "A") {
        clearFieldValues(["_071_of34a_date", "_072_of34a_currency", "_073_of34a_amount"]);
    }
    if (opt !== "B") {
        clearFieldValues(["_074_of34a_currency", "_075_of34a_amount"]);
    }
}

function toggle53aOption(opt) {
    show("div_080_of53a_A", opt === "A");
    show("div_080_of53a_B", opt === "B");
    show("div_080_of53a_D", opt === "D");
    
    if (opt !== "A") {
        clearFieldValues(["_081_of53a_party_identifier", "_082_of53a_identifier_code"]);
    }
    if (opt !== "B") {
        clearFieldValues(["_083_of53a_party_identifier", "_084_of53a_location"]);
    }
    if (opt !== "D") {
        clearFieldValues(["_085_of53a_party_identifier", "_086_of53a_name_address"]);
    }
}

function toggle57aOption(opt) {
    show("div_090_of57a_A", opt === "A");
    show("div_090_of57a_B", opt === "B");
    show("div_090_of57a_D", opt === "D");
    
    if (opt !== "A") {
        clearFieldValues(["_091_of57a_party_identifier", "_092_of57a_identifier_code"]);
    }
    if (opt !== "B") {
        clearFieldValues(["_093_of57a_party_identifier", "_094_of57a_location"]);
    }
    if (opt !== "D") {
        clearFieldValues(["_095_of57a_party_identifier", "_096_of57a_name_address"]);
    }
}

function toggle58aOption(opt) {
    show("div_100_of58a_A", opt === "A");
    show("div_100_of58a_D", opt === "D");
    
    if (opt !== "A") {
        clearFieldValues(["_101_of58a_party_identifier", "_102_of58a_identifier_code"]);
    }
    if (opt !== "D") {
        clearFieldValues(["_103_of58a_party_identifier", "_104_of58a_name_address"]);
    }
}

const ISO4217 = [
    "AED", "AFN", "ALL", "AMD", "ANG", "AOA", "ARS", "AUD", "AWG", "AZN",
    "BAM", "BBD", "BDT", "BGN", "BHD", "BIF", "BMD", "BND", "BOB", "BRL",
    "BSD", "BTN", "BWP", "BYN", "BZD", "CAD", "CDF", "CHF", "CLP", "CNY",
    "COP", "CRC", "CUP", "CVE", "CZK", "DJF", "DKK", "DOP", "DZD", "EGP",
    "ERN", "ETB", "EUR", "FJD", "FKP", "GBP", "GEL", "GHS", "GIP", "GMD",
    "GNF", "GTQ", "GYD", "HKD", "HNL", "HRK", "HTG", "HUF", "IDR", "ILS",
    "INR", "IQD", "IRR", "ISK", "JMD", "JOD", "JPY", "KES", "KGS", "KHR",
    "KMF", "KPW", "KRW", "KWD", "KYD", "KZT", "LAK", "LBP", "LKR", "LRD",
    "LSL", "LYD", "MAD", "MDL", "MGA", "MKD", "MMK", "MNT", "MOP", "MRU",
    "MUR", "MVR", "MWK", "MXN", "MYR", "MZN", "NAD", "NGN", "NIO", "NOK",
    "NPR", "NZD", "OMR", "PAB", "PEN", "PGK", "PHP", "PKR", "PLN", "PYG",
    "QAR", "RON", "RSD", "RUB", "RWF", "SAR", "SBD", "SCR", "SDG", "SEK",
    "SGD", "SHP", "SLL", "SOS", "SPL", "SRD", "STN", "SVC", "SYP", "SZL",
    "THB", "TJS", "TMT", "TND", "TOP", "TRY", "TTD", "TVD", "TWD", "TZS",
    "UAH", "UGX", "USD", "UYU", "UZS", "VEF", "VND", "VUV", "WST", "XAF",
    "XCD", "XOF", "XPF", "YER", "ZAR", "ZMW", "ZWD"
];

const DEC0 = new Set([
    'BIF', 'CLP', 'DJF', 'GNF', 'ISK', 'JPY', 'KMF', 'KRW', 'PYG', 
    'RWF', 'UGX', 'VND', 'VUV', 'XAF', 'XOF', 'XPF'
]);

const DEC3 = new Set(['BHD', 'IQD', 'JOD', 'KWD', 'LYD', 'OMR', 'TND']);

function isValidCurrency(code) {
    return ISO4217.includes(code.toUpperCase());
}

function validateAmountByCurrency(ccy, amt) {
    if (!ccy || !amt) return { valid: true, error: null };
    
    ccy = ccy.toUpperCase();
    
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
    
    if (allowedDecimals === 0 && decimalPart.length > 0) {
        return { valid: false, error: `Currency ${ccy} must not have decimals (Error T43)` };
    }
    
    if (decimalPart.length > allowedDecimals) {
        return { valid: false, error: `Max ${allowedDecimals} decimal places for ${ccy} (Error T43)` };
    }
    
    return { valid: true, error: null };
}

function isValidBIC(bic) {
    if (!bic) return false;
    const bicTrimmed = bic.trim().toUpperCase();
    
    if (bicTrimmed.length !== 8 && bicTrimmed.length !== 11) {
        return false;
    }
    
    // Format: AAAA BB CC DDD
    // AAAA = Institution Code (4 letters)
    // BB = Country Code (2 letters)
    // CC = Location Code (2 alphanumeric)
    // DDD = Branch Code (3 alphanumeric, optional)
    const bicPattern = /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
    
    if (!bicPattern.test(bicTrimmed)) {
        return false;
    }
    
    const locationCode = bicTrimmed.substring(6, 8);
    if (locationCode === '00' || locationCode === '01') {
        return false;
    }
    
    return true;
}


function isValidPartyIdentifier(partyId) {
    if (!partyId) return true; 
    
    const trimmed = partyId.trim();
    if (trimmed.length === 0) return true;
    
    if (!trimmed.startsWith('/')) {
        return false;
    }
    
    if (trimmed.startsWith('//')) {
        return false;
    }
    
    if (trimmed.length < 2) {
        return false;
    }
    
    return true;
}

function showFieldError(field, message) {
    if (!field) return;
    
    field.classList.add('error-border');
    field.classList.remove('valid-border');
    
    const existingError = field.parentElement.querySelector('.inline-error');
    if (existingError) {
        existingError.remove();
    }
    
    const errorSpan = document.createElement('span');
    errorSpan.className = 'inline-error';
    errorSpan.style.color = 'red';
    errorSpan.style.fontSize = '9pt';
    errorSpan.style.marginLeft = '10px';
    errorSpan.textContent = message;
    field.parentElement.appendChild(errorSpan);
}

function clearFieldError(field) {
    if (!field) return;
    
    field.classList.remove('error-border');
    
    const existingError = field.parentElement.querySelector('.inline-error');
    if (existingError) {
        existingError.remove();
    }
}

function validateReferenceField(field) {
    if (!field) return true;
    
    const value = field.value.trim();
    if (!value) return true;
    
    clearFieldError(field);
    let isValid = true;
    
    if (value.startsWith('/')) {
        showFieldError(field, 'Cannot start with "/" (Error T26)');
        isValid = false;
    }
    
    if (value.endsWith('/')) {
        showFieldError(field, 'Cannot end with "/" (Error T26)');
        isValid = false;
    }
    
    if (value.indexOf('//') !== -1) {
        showFieldError(field, 'Cannot contain "//" (Error T26)');
        isValid = false;
    }
    
    if (isValid) {
        field.classList.add('valid-border');
    }
    
    return isValid;
}

function validateDateFormat(field, allowEmpty = false) {
    if (!field) return true;
    
    const value = field.value.trim();
    
    if (allowEmpty && !value) {
        clearFieldError(field);
        return true;
    }
    
    if (!value) return true;
    
    clearFieldError(field);
    
    if (!/^\d{6}$/.test(value)) {
        showFieldError(field, 'Date must be YYMMDD format (Error T50)');
        return false;
    }
    
    if (!isYYMMDD(value)) {
        showFieldError(field, 'Invalid date (Error T50)');
        return false;
    }
    
    field.classList.add('valid-border');
    return true;
}


function validateMT754() {
    console.log('Starting MT754 validation...');
    
    // 1. MANDATORY FIELDS
    if (isEmpty(val("_010_mf20_sender_reference"))) {
        alert("Field 20 (Sender's Reference) is mandatory.");
        q("_010_mf20_sender_reference").focus();
        return false;
    }
    
    if (isEmpty(val("_020_mf21_related_reference"))) {
        alert("Field 21 (Related Reference) is mandatory.");
        q("_020_mf21_related_reference").focus();
        return false;
    }
    
    // 2. VALIDATE FIELD 20 & 21 (T26)
    const field20 = q("_010_mf20_sender_reference");
    if (field20 && !validateReferenceField(field20)) {
        alert("Invalid Sender's Reference (Error T26)");
        field20.focus();
        return false;
    }
    
    const field21 = q("_020_mf21_related_reference");
    if (field21 && !validateReferenceField(field21)) {
        alert("Invalid Related Reference (Error T26)");
        field21.focus();
        return false;
    }
    
    // 3. VALIDATE FIELD 32a - Principal Amount (MANDATORY)
    const opt32a = val("_030_mf32a_principal_amount_paid_accepted_negotiated");
    if (!opt32a) {
        alert("Field 32a (Principal Amount Paid/Accepted/Negotiated) must be selected.");
        q("_030_mf32a_principal_amount_paid_accepted_negotiated").focus();
        return false;
    }
    
    if (opt32a === "A") {
        // Option A: Date + Currency + Amount
        const date32a = val("_031_mf32a_date");
        const currency32a = val("_032_mf32a_currency");
        const amount32a = val("_033_mf32a_amount");
        
        if (isEmpty(date32a)) {
            alert("Field 32a Date is required for Option A");
            q("_031_mf32a_date").focus();
            return false;
        }
        
        if (date32a.length !== 6 || !isYYMMDD(date32a)) {
            alert("Field 32a Date must be valid YYMMDD format (Error T50)");
            q("_031_mf32a_date").focus();
            return false;
        }
        
        if (isEmpty(currency32a)) {
            alert("Field 32a Currency is required");
            q("_032_mf32a_currency").focus();
            return false;
        }
        
        if (!isValidCurrency(currency32a)) {
            alert("Field 32a Currency is invalid (Error T52)");
            q("_032_mf32a_currency").focus();
            return false;
        }
        
        if (isEmpty(amount32a)) {
            alert("Field 32a Amount is required");
            q("_033_mf32a_amount").focus();
            return false;
        }
        
        const amtValidation = validateAmountByCurrency(currency32a, amount32a);
        if (!amtValidation.valid) {
            alert("Field 32a Amount: " + amtValidation.error);
            q("_033_mf32a_amount").focus();
            return false;
        }
    }
    
    if (opt32a === "B") {
        // Option B: Currency + Amount (NO DATE)
        const currency32a = val("_034_mf32a_currency");
        const amount32a = val("_035_mf32a_amount");
        
        if (isEmpty(currency32a)) {
            alert("Field 32a Currency is required");
            q("_034_mf32a_currency").focus();
            return false;
        }
        
        if (!isValidCurrency(currency32a)) {
            alert("Field 32a Currency is invalid (Error T52)");
            q("_034_mf32a_currency").focus();
            return false;
        }
        
        if (isEmpty(amount32a)) {
            alert("Field 32a Amount is required");
            q("_035_mf32a_amount").focus();
            return false;
        }
        
        const amtValidation = validateAmountByCurrency(currency32a, amount32a);
        if (!amtValidation.valid) {
            alert("Field 32a Amount: " + amtValidation.error);
            q("_035_mf32a_amount").focus();
            return false;
        }
    }
    
    // 4. VALIDATE FIELD 33B - Additional Amount (if filled)
    const currency33b = val("_040_of33b_currency");
    const amount33b = val("_041_of33b_amount");
    
    if (currency33b || amount33b) {
        if (isEmpty(currency33b)) {
            alert("Field 33B Currency is required when Amount is filled");
            q("_040_of33b_currency").focus();
            return false;
        }
        
        if (!isValidCurrency(currency33b)) {
            alert("Field 33B Currency is invalid (Error T52)");
            q("_040_of33b_currency").focus();
            return false;
        }
        
        if (isEmpty(amount33b)) {
            alert("Field 33B Amount is required when Currency is filled");
            q("_041_of33b_amount").focus();
            return false;
        }
        
        const amtValidation = validateAmountByCurrency(currency33b, amount33b);
        if (!amtValidation.valid) {
            alert("Field 33B Amount: " + amtValidation.error);
            q("_041_of33b_amount").focus();
            return false;
        }
        
        // Usage Rule: If 33B currency differs from 32a, explanation required in 72Z or 77
        let currency32a = "";
        if (opt32a === "A") {
            currency32a = val("_032_mf32a_currency");
        } else if (opt32a === "B") {
            currency32a = val("_034_mf32a_currency");
        }
        
        if (currency33b !== currency32a) {
            const field72z = val("_110_of72z_sender_to_receiver_information");
            const field77 = val("_120_of77_narrative");
            
            if (isEmpty(field72z) && isEmpty(field77)) {
                alert("Usage Rule: If field 33B currency differs from 32a, explanation must be provided in field 72Z or 77.");
                q("_040_of33b_currency").focus();
                return false;
            }
        }
    }
    
    // 5. VALIDATE FIELD 34a - Total Amount Claimed (if filled)
    const opt34a = val("_070_of34a_total_amount_claimed");
    
    if (opt34a === "A") {
        const date34a = val("_071_of34a_date");
        const currency34a = val("_072_of34a_currency");
        const amount34a = val("_073_of34a_amount");
        
        // Date is OPTIONAL for field 34a Option A
        if (date34a && (date34a.length !== 6 || !isYYMMDD(date34a))) {
            alert("Field 34a Date must be valid YYMMDD format (Error T50)");
            q("_071_of34a_date").focus();
            return false;
        }
        
        if (isEmpty(currency34a)) {
            alert("Field 34a Currency is required");
            q("_072_of34a_currency").focus();
            return false;
        }
        
        if (!isValidCurrency(currency34a)) {
            alert("Field 34a Currency is invalid (Error T52)");
            q("_072_of34a_currency").focus();
            return false;
        }
        
        if (isEmpty(amount34a)) {
            alert("Field 34a Amount is required");
            q("_073_of34a_amount").focus();
            return false;
        }
        
        const amtValidation = validateAmountByCurrency(currency34a, amount34a);
        if (!amtValidation.valid) {
            alert("Field 34a Amount: " + amtValidation.error);
            q("_073_of34a_amount").focus();
            return false;
        }
    }
    
    if (opt34a === "B") {
        const currency34a = val("_074_of34a_currency");
        const amount34a = val("_075_of34a_amount");
        
        if (isEmpty(currency34a)) {
            alert("Field 34a Currency is required");
            q("_074_of34a_currency").focus();
            return false;
        }
        
        if (!isValidCurrency(currency34a)) {
            alert("Field 34a Currency is invalid (Error T52)");
            q("_074_of34a_currency").focus();
            return false;
        }
        
        if (isEmpty(amount34a)) {
            alert("Field 34a Amount is required");
            q("_075_of34a_amount").focus();
            return false;
        }
        
        const amtValidation = validateAmountByCurrency(currency34a, amount34a);
        if (!amtValidation.valid) {
            alert("Field 34a Amount: " + amtValidation.error);
            q("_075_of34a_amount").focus();
            return false;
        }
    }
    
    // 6. RULE C1: Either field 72Z or 77 may be present, but not both
    const field72z = val("_110_of72z_sender_to_receiver_information");
    const field77 = val("_120_of77_narrative");
    
    if (!isEmpty(field72z) && !isEmpty(field77)) {
        alert("Error C19 (Rule C1): Either field 72Z or 77 may be present, but not both.");
        q("_110_of72z_sender_to_receiver_information").focus();
        return false;
    }
    
    // 7. RULE C2: Either field 53a or 57a may be present, but not both
    const field53a = val("_080_of53a_reimbursing_bank");
    const field57a = val("_090_of57a_account_with_bank");
    
    if (field53a && field57a) {
        alert("Error C14 (Rule C2): Either field 53a (Reimbursing Bank) or 57a (Account With Bank) may be present, but not both.");
        q("_080_of53a_reimbursing_bank").focus();
        return false;
    }
    
    // 8. RULE C3: Currency code in 32a and 34a must be the same
    if (opt34a) {
        // Get currency based on selected option for field 32a
        let currency32a = "";
        if (opt32a === "A") {
            currency32a = val("_032_mf32a_currency");
        } else if (opt32a === "B") {
            currency32a = val("_034_mf32a_currency");
        }
        
        // Get currency based on selected option for field 34a
        let currency34a = "";
        if (opt34a === "A") {
            currency34a = val("_072_of34a_currency");
        } else if (opt34a === "B") {
            currency34a = val("_074_of34a_currency");
        }
        
        if (currency32a && currency34a && currency32a !== currency34a) {
            alert("Error C02 (Rule C3): Currency code in field 32a and 34a must be the same.");
            // Focus on appropriate field based on option
            if (opt34a === "A") {
                q("_072_of34a_currency").focus();
            } else {
                q("_074_of34a_currency").focus();
            }
            return false;
        }
    }
    
    // 9. VALIDATE BIC FIELDS (T27, T28, T29, C05)
    const bicFields = [
        { id: "_082_of53a_identifier_code", name: "Reimbursing Bank BIC (Field 53a)" },
        { id: "_092_of57a_identifier_code", name: "Account With Bank BIC (Field 57a)" },
        { id: "_102_of58a_identifier_code", name: "Beneficiary Bank BIC (Field 58a)" }
    ];
    
    for (let config of bicFields) {
        const bic = val(config.id);
        if (bic && !isValidBIC(bic)) {
            alert(`Invalid ${config.name}. Must be 8 or 11 characters (Error T27/T28/T29)`);
            q(config.id).focus();
            return false;
        }
    }
    
    // 10. VALIDATE PARTY IDENTIFIER FIELDS
    const partyIdFields = [
        { id: "_081_of53a_party_identifier", name: "Reimbursing Bank Party Identifier" },
        { id: "_083_of53a_party_identifier", name: "Reimbursing Bank Party Identifier" },
        { id: "_085_of53a_party_identifier", name: "Reimbursing Bank Party Identifier" },
        { id: "_091_of57a_party_identifier", name: "Account With Bank Party Identifier" },
        { id: "_093_of57a_party_identifier", name: "Account With Bank Party Identifier" },
        { id: "_095_of57a_party_identifier", name: "Account With Bank Party Identifier" },
        { id: "_101_of58a_party_identifier", name: "Beneficiary Bank Party Identifier" },
        { id: "_103_of58a_party_identifier", name: "Beneficiary Bank Party Identifier" }
    ];
    
    for (let config of partyIdFields) {
        const partyId = val(config.id);
        if (partyId && !isValidPartyIdentifier(partyId)) {
            alert(`Invalid ${config.name}. Must start with single slash "/"`);
            q(config.id).focus();
            return false;
        }
    }
    
    console.log('MT754 validation completed successfully');
    return true;
}


function setupRealtimeValidations() {
    const field20 = q("_010_mf20_sender_reference");
    if (field20) {
        field20.addEventListener('blur', function() {
            validateReferenceField(this);
        });
        field20.addEventListener('keypress', avoidSplChars);
    }

    const field21 = q("_020_mf21_related_reference");
    if (field21) {
        field21.addEventListener('blur', function() {
            validateReferenceField(this);
        });
        field21.addEventListener('keypress', avoidSplChars);
    }
    
    const currencyFields = [
        "_032_mf32a_currency", "_034_mf32a_currency",  // Field 32a Option A & B
        "_040_of33b_currency",                          // Field 33B
        "_072_of34a_currency", "_074_of34a_currency"   // Field 34a Option A & B
    ];
    currencyFields.forEach(id => {
        const el = q(id);
        if (el) {
            el.addEventListener("input", function() {
                this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '');
            });
        }
    });
    
    const amountFields = [
        "_033_mf32a_amount", "_035_mf32a_amount",      // Field 32a Option A & B
        "_041_of33b_amount",                            // Field 33B
        "_073_of34a_amount", "_075_of34a_amount"       // Field 34a Option A & B
    ];
    amountFields.forEach(id => {
        const el = q(id);
        if (el) {
            el.addEventListener("input", function() { formatAmountInput(this); });
            el.addEventListener("blur", function() { formatAmountBlur(this); });
            el.addEventListener("keypress", numbersonlyWithComma);
        }
    });
    
    const dateFields = ["_031_mf32a_date", "_071_of34a_date"];
    dateFields.forEach(id => {
        const el = q(id);
        if (el) {
            el.addEventListener("input", function() {
                this.value = this.value.replace(/[^\d]/g, "").slice(0, 6);
            });
            el.addEventListener("blur", function() { 
                const isOptional = (id === "_071_of34a_date");
                validateDateFormat(this, isOptional); 
            });
            el.addEventListener("keypress", numbersonly);
        }
    });
    
    const bicFields = ["_082_of53a_identifier_code", "_092_of57a_identifier_code", "_102_of58a_identifier_code"];
    bicFields.forEach(id => {
        const el = q(id);
        if (el) {
            el.addEventListener("input", function() {
                this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '').slice(0, 11);
            });
        }
    });
    
    const partyIdFields = [
        "_081_of53a_party_identifier", "_083_of53a_party_identifier", "_085_of53a_party_identifier",
        "_091_of57a_party_identifier", "_093_of57a_party_identifier", "_095_of57a_party_identifier",
        "_101_of58a_party_identifier", "_103_of58a_party_identifier"
    ];
    partyIdFields.forEach(id => {
        const el = q(id);
        if (el) {
            el.addEventListener("blur", function() { cek_slash(this); });
        }
    });
}


function initMt754Form() {
    console.log('Initializing MT754 form...');
    
    toggle32aOption(val("_030_mf32a_principal_amount_paid_accepted_negotiated"));
    toggle34aOption(val("_070_of34a_total_amount_claimed"));
    toggle53aOption(val("_080_of53a_reimbursing_bank"));
    toggle57aOption(val("_090_of57a_account_with_bank"));
    toggle58aOption(val("_100_of58a_beneficiary_bank"));
    
    const sel32a = q("_030_mf32a_principal_amount_paid_accepted_negotiated");
    if (sel32a) {
        sel32a.addEventListener("change", function() {
            toggle32aOption(this.value);
        });
    }
    
    const sel34a = q("_070_of34a_total_amount_claimed");
    if (sel34a) {
        sel34a.addEventListener("change", function() {
            toggle34aOption(this.value);
        });
    }
    
    const sel53a = q("_080_of53a_reimbursing_bank");
    if (sel53a) {
        sel53a.addEventListener("change", function() {
            toggle53aOption(this.value);
        });
    }
    
    const sel57a = q("_090_of57a_account_with_bank");
    if (sel57a) {
        sel57a.addEventListener("change", function() {
            toggle57aOption(this.value);
        });
    }
    
    const sel58a = q("_100_of58a_beneficiary_bank");
    if (sel58a) {
        sel58a.addEventListener("change", function() {
            toggle58aOption(this.value);
        });
    }
    
    setupRealtimeValidations();
    
    yymmdd("_031_mf32a_date");
    yymmdd("_071_of34a_date");
    
    setupTabNavigation();
    
    console.log('MT754 form initialized successfully');
}


function setupTabNavigation() {
    const tabs = document.querySelectorAll('.tabs li a');
    const tabContents = document.querySelectorAll('.tabcontent');

    if (tabs.length === 0) return; 

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


window.addEventListener("DOMContentLoaded", initMt754Form);
window.validateMT754 = validateMT754;
window.toggle32aOption = toggle32aOption;
window.toggle34aOption = toggle34aOption;
window.toggle53aOption = toggle53aOption;
window.toggle57aOption = toggle57aOption;
window.toggle58aOption = toggle58aOption;
window.avoidSplChars = avoidSplChars;
window.numbersonly = numbersonly;
window.numbersonlyWithComma = numbersonlyWithComma;
window.textonly = textonly;
window.cek_slash = cek_slash;
window.formatAmountInput = formatAmountInput;
window.formatAmountBlur = formatAmountBlur;
window.yymmdd = yymmdd;
window.isValidCurrency = isValidCurrency;
window.isValidBIC = isValidBIC;
window.isValidPartyIdentifier = isValidPartyIdentifier;
window.validateAmountByCurrency = validateAmountByCurrency;
window.validateReferenceField = validateReferenceField;
window.validateDateFormat = validateDateFormat;
window.isYYMMDD = isYYMMDD;