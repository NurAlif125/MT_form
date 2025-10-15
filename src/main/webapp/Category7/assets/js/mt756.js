/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


/* ========== Utility Functions ========== */

// Get element by ID
function q(id) {
    return document.getElementById(id);
}

// Get field value
function val(id) {
    const el = q(id);
    return el ? (el.value || "").trim() : "";
}

// Check if field is empty
function isEmpty(v) {
    return !v || v.trim() === "";
}

// Show/hide element
function show(id, display = true) {
    const el = q(id);
    if (el) el.style.display = display ? "block" : "none";
}

// Set value to uppercase
function setUpper(id) {
    const el = q(id);
    if (el) el.value = el.value.toUpperCase();
}

// Only numbers (0-9)
function onlyNumber(e) {
    const charCode = (e.which) ? e.which : e.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

// Only letters (A-Z, a-z)
function onlyAlpha(e) {
    const charCode = (e.which) ? e.which : e.keyCode;
    if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122)) {
        return true;
    }
    return false;
}

// Avoid special characters (allow: letters, numbers, space, .,'-/:())
function avoidSplChars(e) {
    e = e || window.event;
    let bad = /[^\sa-zA-Z0-9\.\,\'\(\)\-\/\:]/i;
    let key = String.fromCharCode(e.keyCode || e.which);
    if (e.which !== 0 && e.charCode !== 0 && bad.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) e.preventDefault();
    }
}

// REVISED: Auto-add slash and validate Party Identifier format
// Format: [/1!a][/34x] = /A/ACCOUNTNUMBER (slash + 1 letter + slash + max 34 chars)
function cek_slash(obj) {
    if (!obj || !obj.value) return;
    
    let v = obj.value.trim();
    if (!v) return;
    
    // If doesn't start with /, add it
    if (!v.startsWith("/")) {
        v = "/" + v;
    }
    
    // Validate format: /X/xxxxx where X is single letter
    // Pattern: starts with /, followed by 1 letter, followed by /, followed by up to 34 chars
    const parts = v.split('/');
    
    // Should have at least 3 parts: ['', 'A', 'account...']
    if (parts.length >= 3) {
        // Second part should be single letter
        if (parts[1].length > 1) {
            // Take only first character
            parts[1] = parts[1].charAt(0).toUpperCase();
        } else if (parts[1].length === 1) {
            parts[1] = parts[1].toUpperCase();
        }
        
        // Reconstruct
        v = '/' + parts[1] + '/' + parts.slice(2).join('/');
        
        // Limit third part to 34 chars
        const thirdPart = parts.slice(2).join('/');
        if (thirdPart.length > 34) {
            v = '/' + parts[1] + '/' + thirdPart.substring(0, 34);
        }
    } else if (parts.length === 2 && parts[0] === '' && parts[1].length > 0) {
        // Only has /X format, add second slash
        const letter = parts[1].charAt(0).toUpperCase();
        const rest = parts[1].substring(1);
        v = '/' + letter + '/' + rest;
    }
    
    obj.value = v;
}

// Format amount on input (remove non-numeric except comma)
function formatAmountInput(el) {
    if (!el) return;
    el.value = el.value.replace(/[^0-9,]/g, '');
}

// Format amount on blur (ensure decimal format)
function formatAmountBlur(el) {
    if (!el) return;
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

/* ========== Date Helper Functions ========== */

// Validate YYMMDD format
function isYYMMDD(d) {
    if (!/^\d{6}$/.test(d)) return false;
    
    const yy = parseInt(d.slice(0, 2), 10);
    const mm = parseInt(d.slice(2, 4), 10);
    const dd = parseInt(d.slice(4, 6), 10);
    
    if (mm < 1 || mm > 12) return false;
    if (dd < 1 || dd > 31) return false;
    
    // Days in month validation (considering leap year)
    const dim = [31, (yy % 4 === 0 ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return dd <= dim[mm - 1];
}

// Attach jQuery datepicker with YYMMDD format
function attachDatePicker(id) {
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

        // Set initial date if value exists
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

/* ========== Tab Navigation ========== */
function setupTabNavigation() {
    const tabs = document.querySelectorAll('.tabs li a');
    const tabContents = document.querySelectorAll('.tabcontent');

    tabs.forEach(tab => {
        tab.addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('rel');

            // Hide all tab contents
            tabContents.forEach(content => {
                content.style.display = 'none';
                content.classList.remove('active');
            });

            // Remove active class from all tabs
            tabs.forEach(t => t.parentElement.classList.remove('selected'));

            // Show target tab content
            const targetContent = document.getElementById(targetId);
            if (targetContent) {
                targetContent.style.display = 'block';
                targetContent.classList.add('active');
            }

            // Add active class to clicked tab
            this.parentElement.classList.add('selected');
        });
    });

    // Show Body tab by default
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

/* ========== Option Field Handlers ========== */

// Handle 53a - Sender's Correspondent
function handle53aOption() {
    const select = q("_050_of53a_senders_correspondent");
    if (!select) return;
    
    const divA = q("div_050_of53a_A");
    const divB = q("div_050_of53a_B");
    const divD = q("div_050_of53a_D");
    
    if (divA) divA.style.display = (select.value === "A") ? "block" : "none";
    if (divB) divB.style.display = (select.value === "B") ? "block" : "none";
    if (divD) divD.style.display = (select.value === "D") ? "block" : "none";
    
    // Clear fields that are not selected
    if (select.value !== "A") {
        clearFieldValues(["_051_of53a_party_identifier", "_052_of53a_identifier_code"]);
    }
    if (select.value !== "B") {
        clearFieldValues(["_053_of53a_party_identifier", "_054_of53a_location"]);
    }
    if (select.value !== "D") {
        clearFieldValues(["_055_of53a_party_identifier", "_056_of53a_name_address"]);
    }
}

// Handle 54a - Receiver's Correspondent
function handle54aOption() {
    const select = q("_060_of54a_receivers_correspondent");
    if (!select) return;
    
    const divA = q("div_060_of54a_A");
    const divB = q("div_060_of54a_B");
    const divD = q("div_060_of54a_D");
    
    if (divA) divA.style.display = (select.value === "A") ? "block" : "none";
    if (divB) divB.style.display = (select.value === "B") ? "block" : "none";
    if (divD) divD.style.display = (select.value === "D") ? "block" : "none";
    
    // Clear fields that are not selected
    if (select.value !== "A") {
        clearFieldValues(["_061_of54a_party_identifier", "_062_of54a_identifier_code"]);
    }
    if (select.value !== "B") {
        clearFieldValues(["_063_of54a_party_identifier", "_064_of54a_location"]);
    }
    if (select.value !== "D") {
        clearFieldValues(["_065_of54a_party_identifier", "_066_of54a_name_address"]);
    }
}

// Clear field values
function clearFieldValues(fieldIds) {
    fieldIds.forEach(id => {
        const field = q(id);
        if (field) {
            field.value = "";
        }
    });
}

/* ========== Validation Helper Functions ========== */

// Show field error
function showFieldError(field, message) {
    if (!field) return;
    field.classList.add('error-border');
    field.classList.remove('valid-border');
    
    // Remove existing error message
    const existingError = field.parentElement.querySelector('.inline-error');
    if (existingError) {
        existingError.remove();
    }
    
    // Add new error message
    const errorSpan = document.createElement('span');
    errorSpan.className = 'inline-error';
    errorSpan.style.color = 'red';
    errorSpan.style.fontSize = '9pt';
    errorSpan.style.marginLeft = '10px';
    errorSpan.textContent = message;
    field.parentElement.appendChild(errorSpan);
}

// Clear field error
function clearFieldError(field) {
    if (!field) return;
    field.classList.remove('error-border');
    
    const existingError = field.parentElement.querySelector('.inline-error');
    if (existingError) {
        existingError.remove();
    }
}

/* ========== ISO 4217 Currency Validator ========== */
const ISO4217 = [
    "AED", "AFN", "ALL", "AMD", "ANG", "AOA", "ARS", "AUD", "AWG", "AZN",
    "BAM", "BBD", "BDT", "BGN", "BHD", "BIF", "BMD", "BND", "BOB", "BRL",
    "BSD", "BTN", "BWP", "BYN", "BZD", "CAD", "CDF", "CHF", "CLP", "CNY",
    "COP", "CRC", "CUC", "CUP", "CVE", "CZK", "DJF", "DKK", "DOP", "DZD",
    "EGP", "ERN", "ETB", "EUR", "FJD", "FKP", "GBP", "GEL", "GGP", "GHS",
    "GIP", "GMD", "GNF", "GTQ", "GYD", "HKD", "HNL", "HRK", "HTG", "HUF",
    "IDR", "ILS", "IMP", "INR", "IQD", "IRR", "ISK", "JEP", "JMD", "JOD",
    "JPY", "KES", "KGS", "KHR", "KMF", "KPW", "KRW", "KWD", "KYD", "KZT",
    "LAK", "LBP", "LKR", "LRD", "LSL", "LYD", "MAD", "MDL", "MGA", "MKD",
    "MMK", "MNT", "MOP", "MRU", "MUR", "MVR", "MWK", "MXN", "MYR", "MZN",
    "NAD", "NGN", "NIO", "NOK", "NPR", "NZD", "OMR", "PAB", "PEN", "PGK",
    "PHP", "PKR", "PLN", "PYG", "QAR", "RON", "RSD", "RUB", "RWF", "SAR",
    "SBD", "SCR", "SDG", "SEK", "SGD", "SHP", "SLL", "SOS", "SPL", "SRD",
    "STN", "SVC", "SYP", "SZL", "THB", "TJS", "TMT", "TND", "TOP", "TRY",
    "TTD", "TVD", "TWD", "TZS", "UAH", "UGX", "USD", "UYU", "UZS", "VEF",
    "VND", "VUV", "WST", "XAF", "XCD", "XDR", "XOF", "XPF", "YER", "ZAR",
    "ZMW", "ZWD"
];

function isValidCurrency(code) {
    return ISO4217.includes(code.toUpperCase());
}

/* ========== BIC Validator ========== */
function isValidBIC(code) {
    if (!code) return false;
    const bic = code.trim().toUpperCase();
    // BIC: 4!a2!a2!c[3!c] = AAAABBCCXXX (8 or 11 chars)
    const regex = /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
    return regex.test(bic);
}

/* ========== Currency-Specific Decimal Validation ========== */
const DEC0 = new Set(['JPY', 'KRW', 'VND', 'HUF', 'XOF', 'XAF', 'XPF', 'CLP', 'ISK', 'PYG', 'UGX', 'VUV']);
const DEC3 = new Set(['BHD', 'JOD', 'KWD', 'OMR', 'TND', 'LYD', 'IQD']);

function validateAmountByCurrency(ccy, amt) {
    if (!ccy || !amt) return { valid: true, error: null };
    
    // Amount must contain comma (Error T40)
    if (!amt.includes(',')) {
        return { valid: false, error: "Amount must contain comma (Error T40)" };
    }
    
    const parts = amt.split(',');
    if (parts.length !== 2) {
        return { valid: false, error: "Invalid amount format (Error T43)" };
    }
    
    // Integer part validation: must have at least 1 digit (Error C03)
    if (!/^\d+$/.test(parts[0]) || parts[0].length === 0) {
        return { valid: false, error: "Invalid integer part (Error C03)" };
    }
    
    const decimalPart = parts[1];
    let allowedDecimals = 2; // Default for most currencies
    
    if (DEC0.has(ccy)) allowedDecimals = 0;
    if (DEC3.has(ccy)) allowedDecimals = 3;
    
    // Check decimal places (Error T43)
    if (decimalPart.length > allowedDecimals) {
        return { valid: false, error: `Max ${allowedDecimals} decimal places for ${ccy} (Error T43)` };
    }
    
    if (allowedDecimals === 0 && decimalPart.length !== 0) {
        return { valid: false, error: `Currency ${ccy} must not have decimals (Error T43)` };
    }
    
    return { valid: true, error: null };
}

/* ========== Party Identifier Validator ========== */
// Format: [/1!a][/34x] = /A/ACCOUNTNUMBER
function isValidPartyIdentifier(value) {
    if (!value) return true; // Optional field
    
    const v = value.trim();
    if (!v) return true;
    
    // Must start with /
    if (!v.startsWith('/')) {
        return { valid: false, error: "Must start with '/' (Error T26)" };
    }
    
    // Format: /X/xxxxx where X is single uppercase letter
    const regex = /^\/[A-Z]\/[^\s\/]{1,34}$/;
    if (!regex.test(v)) {
        return { valid: false, error: "Invalid format. Expected: /A/ACCOUNTNUMBER (Error T26)" };
    }
    
    return { valid: true, error: null };
}

/* ========== NEW: Name & Address Validator (4*35x) ========== */
function validateNameAddress(fieldId, fieldName) {
    const value = val(fieldId);
    if (!value) return { valid: true, error: null };
    
    const lines = value.split('\n');
    
    // Max 4 lines
    if (lines.length > 4) {
        return { 
            valid: false, 
            error: `${fieldName}: Maximum 4 lines allowed (Error T13)` 
        };
    }
    
    // Each line max 35 characters
    for (let i = 0; i < lines.length; i++) {
        if (lines[i].length > 35) {
            return { 
                valid: false, 
                error: `${fieldName}: Line ${i + 1} exceeds 35 characters (Error T13)` 
            };
        }
    }
    
    return { valid: true, error: null };
}

/* ========== Validation Functions ========== */

function getFieldValue(id) {
    return val(id);
}

function isFieldEmpty(id) {
    return isEmpty(getFieldValue(id));
}

// Validate Reference Fields (T26)
function validateReferenceField(field) {
    if (!field) return true;
    
    const value = field.value.trim();
    if (!value) return true;
    
    clearFieldError(field);
    let isValid = true;
    
    // T26: Cannot start with /
    if (value.startsWith('/')) {
        showFieldError(field, 'Cannot start with "/" (Error T26)');
        isValid = false;
    }
    
    // T26: Cannot end with /
    if (value.endsWith('/')) {
        showFieldError(field, 'Cannot end with "/" (Error T26)');
        isValid = false;
    }
    
    // T26: Cannot contain //
    if (value.indexOf('//') !== -1) {
        showFieldError(field, 'Cannot contain "//" (Error T26)');
        isValid = false;
    }
    
    if (isValid) {
        field.classList.add('valid-border');
    }
    
    return isValid;
}

// Validate Date Format (T50 - YYMMDD)
function validateDateFormat(field) {
    if (!field) return true;
    
    const value = field.value.trim();
    if (!value) return true;
    
    clearFieldError(field);
    
    // Must be exactly 6 digits
    if (!/^\d{6}$/.test(value)) {
        showFieldError(field, 'Date must be YYMMDD format (Error T50)');
        return false;
    }
    
    // Validate using isYYMMDD function
    if (!isYYMMDD(value)) {
        showFieldError(field, 'Invalid date (Error T50)');
        return false;
    }
    
    field.classList.add('valid-border');
    return true;
}

/* ========== Real-time Validation Setup ========== */
function setupRealtimeValidations() {
    // Field 20 - Sender's Reference
    const field20 = q("_010_mf20_sender_reference");
    if (field20) {
        field20.addEventListener('blur', function() { 
            validateReferenceField(this);
        });
        field20.addEventListener('keypress', avoidSplChars);
    }
    
    // Field 21 - Presenting Bank's Reference
    const field21 = q("_020_mf21_presenting_banks_reference");
    if (field21) {
        field21.addEventListener('blur', function() { 
            validateReferenceField(this);
        });
        field21.addEventListener('keypress', avoidSplChars);
    }
    
    // Field 32B - Currency (auto-uppercase, 3 letters only)
    const field32BCcy = q("_030_mf32b_currency");
    if (field32BCcy) {
        field32BCcy.addEventListener('input', function() {
            this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '').slice(0, 3);
        });
        field32BCcy.addEventListener('blur', function() {
            if (this.value && !isValidCurrency(this.value)) {
                showFieldError(this, 'Invalid currency code (Error T52)');
            } else {
                clearFieldError(this);
                if (this.value) this.classList.add('valid-border');
            }
        });
    }
    
    // Field 32B - Amount (format with comma)
    const field32BAmt = q("_031_mf32b_amount");
    if (field32BAmt) {
        field32BAmt.addEventListener('input', function() { formatAmountInput(this); });
        field32BAmt.addEventListener('blur', function() { 
            formatAmountBlur(this);
            const ccy = val("_030_mf32b_currency");
            const amt = this.value;
            if (ccy && amt) {
                const result = validateAmountByCurrency(ccy, amt);
                if (!result.valid) {
                    showFieldError(this, result.error);
                } else {
                    clearFieldError(this);
                    this.classList.add('valid-border');
                }
            }
        });
    }
    
    // Field 33A - Date (YYMMDD)
    const field33ADate = q("_040_mf33a_date");
    if (field33ADate) {
        field33ADate.addEventListener('keypress', onlyNumber);
        field33ADate.addEventListener('input', function() {
            this.value = this.value.replace(/[^\d]/g, '').slice(0, 6);
        });
        field33ADate.addEventListener('blur', function() { 
            validateDateFormat(this);
        });
        attachDatePicker("_040_mf33a_date");
    }
    
    // Field 33A - Currency (auto-uppercase, 3 letters only)
    const field33ACcy = q("_041_mf33a_currency");
    if (field33ACcy) {
        field33ACcy.addEventListener('input', function() {
            this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '').slice(0, 3);
        });
        field33ACcy.addEventListener('blur', function() {
            if (this.value && !isValidCurrency(this.value)) {
                showFieldError(this, 'Invalid currency code (Error T52)');
            } else {
                clearFieldError(this);
                if (this.value) this.classList.add('valid-border');
            }
        });
    }
    
    // Field 33A - Amount (format with comma)
    const field33AAmt = q("_042_mf33a_amount");
    if (field33AAmt) {
        field33AAmt.addEventListener('input', function() { formatAmountInput(this); });
        field33AAmt.addEventListener('blur', function() { 
            formatAmountBlur(this);
            const ccy = val("_041_mf33a_currency");
            const amt = this.value;
            if (ccy && amt) {
                const result = validateAmountByCurrency(ccy, amt);
                if (!result.valid) {
                    showFieldError(this, result.error);
                } else {
                    clearFieldError(this);
                    this.classList.add('valid-border');
                }
            }
        });
    }
    
    // BIC Fields - auto uppercase and alphanumeric only
    const bicFields = [
        "_052_of53a_identifier_code",
        "_062_of54a_identifier_code"
    ];
    bicFields.forEach(id => {
        const el = q(id);
        if (el) {
            el.addEventListener('input', function() {
                this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '');
            });
            el.addEventListener('blur', function() {
                if (this.value && !isValidBIC(this.value)) {
                    showFieldError(this, 'Invalid BIC format (Error T27/T28/T29)');
                } else {
                    clearFieldError(this);
                    if (this.value) this.classList.add('valid-border');
                }
            });
        }
    });
    
    // Party Identifier fields - auto add slash and validate on blur
    const partyIdFields = [
        "_051_of53a_party_identifier",
        "_053_of53a_party_identifier",
        "_055_of53a_party_identifier",
        "_061_of54a_party_identifier",
        "_063_of54a_party_identifier",
        "_065_of54a_party_identifier"
    ];
    partyIdFields.forEach(id => {
        const el = q(id);
        if (el) {
            el.addEventListener('blur', function() { 
                cek_slash(this);
                const result = isValidPartyIdentifier(this.value);
                if (!result.valid) {
                    showFieldError(this, result.error);
                } else {
                    clearFieldError(this);
                    if (this.value) this.classList.add('valid-border');
                }
            });
        }
    });
    
    // NEW: Name & Address fields - validate on blur
    const nameAddrFields = [
        { id: "_056_of53a_name_address", name: "Field 53a Name & Address" },
        { id: "_066_of54a_name_address", name: "Field 54a Name & Address" }
    ];
    nameAddrFields.forEach(config => {
        const el = q(config.id);
        if (el) {
            el.addEventListener('blur', function() {
                const result = validateNameAddress(config.id, config.name);
                if (!result.valid) {
                    showFieldError(this, result.error);
                } else {
                    clearFieldError(this);
                    if (this.value) this.classList.add('valid-border');
                }
            });
        }
    });
}

/* ========== Main Validation Function (called from form onsubmit) ========== */
function validateMT756() {
    console.log('Starting MT756 validation...');
    
    // 1. Validate Mandatory Fields
    const mandatoryFields = [
        { id: "_010_mf20_sender_reference", name: "MF20 Sender's Reference" },
        { id: "_020_mf21_presenting_banks_reference", name: "MF21 Presenting Bank's Reference" },
        { id: "_030_mf32b_currency", name: "MF32B Currency" },
        { id: "_031_mf32b_amount", name: "MF32B Amount" },
        { id: "_040_mf33a_date", name: "MF33A Date" },
        { id: "_041_mf33a_currency", name: "MF33A Currency" },
        { id: "_042_mf33a_amount", name: "MF33A Amount" }
    ];
    
    let errors = [];
    mandatoryFields.forEach(field => {
        if (isFieldEmpty(field.id)) {
            errors.push(field.name);
            const element = q(field.id);
            if (element) {
                showFieldError(element, "This field is required");
            }
        }
    });
    
    if (errors.length > 0) {
        alert("Please fill all mandatory fields:\n\n" + errors.join("\n"));
        q(mandatoryFields[0].id).focus();
        return false;
    }
    
    // 2. Validate Reference Fields (T26)
    const refFields = [
        { id: "_010_mf20_sender_reference", name: "Sender's Reference" },
        { id: "_020_mf21_presenting_banks_reference", name: "Presenting Bank's Reference" }
    ];
    
    for (let config of refFields) {
        const field = q(config.id);
        if (field && field.value.trim() !== "") {
            if (!validateReferenceField(field)) {
                alert(`Invalid ${config.name} (Error T26)`);
                field.focus();
                return false;
            }
        }
    }
    
    // 3. Validate Date Format (T50)
    const dateField = q("_040_mf33a_date");
    if (dateField && dateField.value.trim() !== "") {
        if (!validateDateFormat(dateField)) {
            alert("Invalid Date in Field 33A. Must be YYMMDD format (Error T50)");
            dateField.focus();
            return false;
        }
    }
    
    // 4. Validate Currency Codes (T52)
    const ccy32B = val("_030_mf32b_currency").toUpperCase();
    const ccy33A = val("_041_mf33a_currency").toUpperCase();
    
    if (ccy32B && !isValidCurrency(ccy32B)) {
        alert("Field 32B: Invalid Currency Code. Must be valid ISO 4217 code (Error T52)");
        q("_030_mf32b_currency").focus();
        return false;
    }
    
    if (ccy33A && !isValidCurrency(ccy33A)) {
        alert("Field 33A: Invalid Currency Code. Must be valid ISO 4217 code (Error T52)");
        q("_041_mf33a_currency").focus();
        return false;
    }
    
    // 5. Network Validated Rule C1: Currency codes must match (Error C02)
    if (ccy32B !== ccy33A) {
        alert("Error C02: Currency code in fields 32B and 33A must be the same");
        q("_030_mf32b_currency").focus();
        return false;
    }
    
    // 6. Validate Amount Formats (T40, T43, C03)
    const amt32B = val("_031_mf32b_amount");
    const amt33A = val("_042_mf33a_amount");
    
    if (amt32B) {
        const result = validateAmountByCurrency(ccy32B, amt32B);
        if (!result.valid) {
            alert("Field 32B Amount: " + result.error);
            q("_031_mf32b_amount").focus();
            return false;
        }
    }
    
    if (amt33A) {
        const result = validateAmountByCurrency(ccy33A, amt33A);
        if (!result.valid) {
            alert("Field 33A Amount: " + result.error);
            q("_042_mf33a_amount").focus();
            return false;
        }
    }
    
    // 7. Validate BIC Fields (T27, T28, T29, T45, C05)
    const bicConfigs = [
        { optionField: "_050_of53a_senders_correspondent", bicField: "_052_of53a_identifier_code", name: "Sender's Correspondent" },
        { optionField: "_060_of54a_receivers_correspondent", bicField: "_062_of54a_identifier_code", name: "Receiver's Correspondent" }
    ];
    
    for (let config of bicConfigs) {
        const option = val(config.optionField);
        if (option === "A") {
            const bic = val(config.bicField).toUpperCase();
            if (bic && !isValidBIC(bic)) {
                alert(`Invalid ${config.name} BIC. Must be 8 or 11 characters (Error T27/T28/T29)`);
                q(config.bicField).focus();
                return false;
            }
        }
    }
    
    // 8. NEW: Validate Party Identifier format for all options
    const partyIdConfigs = [
        { optionField: "_050_of53a_senders_correspondent", fields: [
            { opt: "A", id: "_051_of53a_party_identifier" },
            { opt: "B", id: "_053_of53a_party_identifier" },
            { opt: "D", id: "_055_of53a_party_identifier" }
        ], name: "Field 53a" },
        { optionField: "_060_of54a_receivers_correspondent", fields: [
            { opt: "A", id: "_061_of54a_party_identifier" },
            { opt: "B", id: "_063_of54a_party_identifier" },
            { opt: "D", id: "_065_of54a_party_identifier" }
        ], name: "Field 54a" }
    ];
    
    for (let config of partyIdConfigs) {
        const option = val(config.optionField);
        for (let field of config.fields) {
            if (option === field.opt) {
                const partyId = val(field.id);
                if (partyId) {
                    const result = isValidPartyIdentifier(partyId);
                    if (!result.valid) {
                        alert(`${config.name} Party Identifier: ${result.error}`);
                        q(field.id).focus();
                        return false;
                    }
                }
            }
        }
    }
    
    // 9. NEW: Validate Name & Address (4*35x)
    const nameAddrConfigs = [
        { optionField: "_050_of53a_senders_correspondent", fieldId: "_056_of53a_name_address", name: "Field 53a Name & Address" },
        { optionField: "_060_of54a_receivers_correspondent", fieldId: "_066_of54a_name_address", name: "Field 54a Name & Address" }
    ];
    
    for (let config of nameAddrConfigs) {
        const option = val(config.optionField);
        if (option === "D") {
            const result = validateNameAddress(config.fieldId, config.name);
            if (!result.valid) {
                alert(result.error);
                q(config.fieldId).focus();
                return false;
            }
        }
    }
    
    // 10. MT 756 Usage Rule: RCB code validation
    const field72Z = val("_070_of72z_sender_to_receiver_information").toUpperCase();
    if (field72Z.includes("/RCB/") || field72Z.includes("RCB/")) {
        const field53a = val("_050_of53a_senders_correspondent");
        const field54a = val("_060_of54a_receivers_correspondent");
        
        if (!field53a || !field54a) {
            alert("Usage Rule: The code RCB may only be used in field 72Z if both fields 53a and 54a are present in the message");
            q("_070_of72z_sender_to_receiver_information").focus();
            return false;
        }
    }
    
    // 11. Validate Field 72Z - Sender to Receiver Information (6*35z)
    const field72ZRaw = val("_070_of72z_sender_to_receiver_information");
    if (field72ZRaw) {
        const lines = field72ZRaw.split('\n');
        if (lines.length > 6) {
            alert("Field 72Z: Maximum 6 lines allowed (Error T13)");
            q("_070_of72z_sender_to_receiver_information").focus();
            return false;
        }
        for (let i = 0; i < lines.length; i++) {
            if (lines[i].length > 35) {
                alert(`Field 72Z: Line ${i + 1} exceeds 35 characters (Error T13)`);
                q("_070_of72z_sender_to_receiver_information").focus();
                return false;
            }
        }
    }
    
    // 12. Validate Field 79Z - Narrative (35*50z)
    const field79Z = val("_080_of79z_narrative");
    if (field79Z) {
        const lines = field79Z.split('\n');
        if (lines.length > 35) {
            alert("Field 79Z: Maximum 35 lines allowed (Error T13)");
            q("_080_of79z_narrative").focus();
            return false;
        }
        for (let i = 0; i < lines.length; i++) {
            if (lines[i].length > 50) {
                alert(`Field 79Z: Line ${i + 1} exceeds 50 characters (Error T13)`);
                q("_080_of79z_narrative").focus();
                return false;
            }
        }
    }
    
    // 13. Validate Option A requires BIC
    const option53a = val("_050_of53a_senders_correspondent");
    if (option53a === "A") {
        const bic53a = val("_052_of53a_identifier_code");
        if (!bic53a) {
            alert("Field 53a Option A requires Identifier Code (BIC)");
            q("_052_of53a_identifier_code").focus();
            return false;
        }
    }
    
    const option54a = val("_060_of54a_receivers_correspondent");
    if (option54a === "A") {
        const bic54a = val("_062_of54a_identifier_code");
        if (!bic54a) {
            alert("Field 54a Option A requires Identifier Code (BIC)");
            q("_062_of54a_identifier_code").focus();
            return false;
        }
    }
    
    // 14. Validate Option B requires Location
    if (option53a === "B") {
        const loc53a = val("_054_of53a_location");
        if (!loc53a) {
            alert("Field 53a Option B requires Location");
            q("_054_of53a_location").focus();
            return false;
        }
    }
    
    if (option54a === "B") {
        const loc54a = val("_064_of54a_location");
        if (!loc54a) {
            alert("Field 54a Option B requires Location");
            q("_064_of54a_location").focus();
            return false;
        }
    }
    
    // 15. Validate Option D requires Name & Address
    if (option53a === "D") {
        const nameAddr53a = val("_056_of53a_name_address");
        if (!nameAddr53a) {
            alert("Field 53a Option D requires Name & Address");
            q("_056_of53a_name_address").focus();
            return false;
        }
    }
    
    if (option54a === "D") {
        const nameAddr54a = val("_066_of54a_name_address");
        if (!nameAddr54a) {
            alert("Field 54a Option D requires Name & Address");
            q("_066_of54a_name_address").focus();
            return false;
        }
    }
    
    console.log('MT756 validation completed successfully');
    return true;
}

/* ========== Character Counter for Text Areas ========== */
function setupCharacterCounters() {
    const textAreas = [
        { id: '_070_of72z_sender_to_receiver_information', maxChars: 210, maxLines: 6, charsPerLine: 35 },
        { id: '_080_of79z_narrative', maxChars: 1750, maxLines: 35, charsPerLine: 50 }
    ];
    
    textAreas.forEach(config => {
        const textarea = q(config.id);
        if (textarea) {
            // Create counter element
            const counter = document.createElement('div');
            counter.id = 'counter_' + config.id;
            counter.style.fontSize = '10pt';
            counter.style.marginTop = '5px';
            counter.style.color = 'green';
            textarea.parentElement.appendChild(counter);
            
            // Update counter on input
            textarea.addEventListener('input', function() {
                updateCharCounter(this, counter, config.maxChars, config.maxLines, config.charsPerLine);
            });
            
            // Initialize counter
            updateCharCounter(textarea, counter, config.maxChars, config.maxLines, config.charsPerLine);
        }
    });
}

function updateCharCounter(textarea, counterElement, maxChars, maxLines, charsPerLine) {
    const content = textarea.value;
    const lines = content.split('\n');
    const lineCount = lines.length;
    const charCount = content.length;
    
    // Check if any line exceeds max chars per line
    let longestLine = 0;
    lines.forEach(line => {
        if (line.length > longestLine) longestLine = line.length;
    });
    
    const counterText = `${charCount} / ${maxChars.toLocaleString()} chars | ${lineCount} / ${maxLines} lines | Longest line: ${longestLine} / ${charsPerLine}`;
    counterElement.textContent = counterText;
    
    // Color coding
    if (lineCount > maxLines || charCount > maxChars || longestLine > charsPerLine) {
        counterElement.style.color = 'red';
        counterElement.style.fontWeight = 'bold';
    } else if (lineCount > (maxLines * 0.8) || charCount > (maxChars * 0.8) || longestLine > (charsPerLine * 0.9)) {
        counterElement.style.color = 'orange';
        counterElement.style.fontWeight = 'normal';
    } else {
        counterElement.style.color = 'green';
        counterElement.style.fontWeight = 'normal';
    }
}

/* ========== Auto-uppercase for narrative fields ========== */
function convertToUppercase(field) {
    if (field) {
        field.addEventListener('input', function() {
            const start = this.selectionStart;
            const end = this.selectionEnd;
            this.value = this.value.toUpperCase();
            this.setSelectionRange(start, end);
        });
    }
}

/* ========== Setup Narrative Fields ========== */
function setupNarrativeFields() {
    // Field 72Z and 79Z should be uppercase
    const narrativeFields = [
        '_070_of72z_sender_to_receiver_information',
        '_080_of79z_narrative'
    ];
    
    narrativeFields.forEach(id => {
        const field = q(id);
        if (field) {
            convertToUppercase(field);
        }
    });
}

/* ========== Tooltip Helper for Complex Fields ========== */
function setupTooltips() {
    // Add tooltip for RCB code in field 72Z
    const field72Z = q("_070_of72z_sender_to_receiver_information");
    if (field72Z) {
        const tooltip = document.createElement('div');
        tooltip.style.fontSize = '9pt';
        tooltip.style.color = '#666';
        tooltip.style.marginTop = '3px';
        field72Z.parentElement.appendChild(tooltip);
    }
    
    // Add tooltip for field 79Z
    const field79Z = q("_080_of79z_narrative");
    if (field79Z) {
        const tooltip = document.createElement('div');
        tooltip.style.fontSize = '9pt';
        tooltip.style.color = '#666';
        tooltip.style.marginTop = '3px';
        field79Z.parentElement.appendChild(tooltip);
    }
    
    // Add tooltip for Party Identifier fields
    const partyIdTooltipText = '<strong>Format:</strong> /X/ACCOUNTNUMBER (e.g., /A/123456789)<br>' +
                               'X = Single letter, followed by slash, then account details (max 34 chars)';
    
    const partyIdFields = [
        "_051_of53a_party_identifier",
        "_053_of53a_party_identifier",
        "_055_of53a_party_identifier",
        "_061_of54a_party_identifier",
        "_063_of54a_party_identifier",
        "_065_of54a_party_identifier"
    ];
    
    partyIdFields.forEach(id => {
        const field = q(id);
        if (field && field.parentElement) {
            const tooltip = document.createElement('div');
            tooltip.style.fontSize = '8pt';
            tooltip.style.color = '#999';
            tooltip.style.marginTop = '2px';
            tooltip.innerHTML = partyIdTooltipText;
            field.parentElement.appendChild(tooltip);
        }
    });
}

/* ========== Initialize on Page Load ========== */
document.addEventListener("DOMContentLoaded", function() {
    console.log('Initializing MT756 form...');
    
    // Setup tab navigation
    setupTabNavigation();
    
    // Setup option field handlers
    const optionHandlers = [
        { id: "_050_of53a_senders_correspondent", handler: handle53aOption },
        { id: "_060_of54a_receivers_correspondent", handler: handle54aOption }
    ];
    
    optionHandlers.forEach(config => {
        const element = q(config.id);
        if (element) {
            element.addEventListener("change", config.handler);
            config.handler(); // Initialize on load
        }
    });
    
    // Setup real-time validations
    setupRealtimeValidations();
    
    // Setup character counters
    setupCharacterCounters();
    
    // Setup narrative fields
    setupNarrativeFields();
    
    // Setup tooltips
    setupTooltips();
    
    console.log('MT756 form initialized successfully');
});

/* ========== Export functions for external use ========== */
window.validateMT756 = validateMT756;
window.getFieldValue = getFieldValue;
window.isFieldEmpty = isFieldEmpty;
window.onlyNumber = onlyNumber;
window.onlyAlpha = onlyAlpha;
window.avoidSplChars = avoidSplChars;
window.cek_slash = cek_slash;
window.handle53aOption = handle53aOption;
window.handle54aOption = handle54aOption;