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

// Set value to uppercase
function setUpper(id) {
    const el = q(id);
    if (el) el.value = el.value.toUpperCase();
}

// Show/hide element
function show(id, display = true) {
    const el = q(id);
    if (el) el.style.display = display ? "block" : "none";
}

/* ========== Input Validation Functions ========== */

// Only numbers (0-9)
function numbersonly(e) {
    const charCode = (e.which) ? e.which : e.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

// Only letters and spaces
function textonly(e) {
    let code = e.keyCode || e.which;
    let character = String.fromCharCode(code);
    let allowRegex = /^[a-zA-Z\s-]$/;
    return allowRegex.test(character);
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

// Auto-add slash for account/party identifier fields
function cek_slash(obj) {
    if (obj.value && obj.value.length > 0 && !obj.value.startsWith("/")) {
        obj.value = "/" + obj.value;
    }
}

/* ========== Amount Formatting Functions ========== */

// Format amount during input (allow only digits and comma)
function formatAmountInput(el) {
    el.value = el.value.replace(/[^0-9,]/g, '');
}

// Format amount on blur (add ,00 if no decimal)
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

// Handle Field 33a Net Amount Option (A or B)
function handle33aOption() {
    const select = q("_070_of33a_net_amount");
    const divA = q("div_070_of33a_A");
    const divB = q("div_070_of33a_B");
    
    if (!select || !divA || !divB) return;
    
    const value = select.value;
    
    show("div_070_of33a_A", value === "A");
    show("div_070_of33a_B", value === "B");
    
    // Clear fields when switching options
    if (value !== "A") {
        clearFieldValues(["_071_of33a_date", "_072_of33a_currency", "_073_of33a_amount"]);
    }
    if (value !== "B") {
        clearFieldValues(["_074_of33a_currency", "_075_of33a_amount"]);
    }
}

// Handle Field 53a Sender's Correspondent Option (A, B, or D)
function handle53aOption() {
    const select = q("_080_of53a_senders_correspondent");
    const divA = q("div_080_of53a_A");
    const divB = q("div_080_of53a_B");
    const divD = q("div_080_of53a_D");
    
    if (!select || !divA || !divB || !divD) return;
    
    const value = select.value;
    
    show("div_080_of53a_A", value === "A");
    show("div_080_of53a_B", value === "B");
    show("div_080_of53a_D", value === "D");
    
    // Clear fields when switching options
    if (value !== "A") {
        clearFieldValues(["_081_of53a_party_identifier", "_082_of53a_identifier_code"]);
    }
    if (value !== "B") {
        clearFieldValues(["_083_of53a_party_identifier", "_084_of53a_location"]);
    }
    if (value !== "D") {
        clearFieldValues(["_085_of53a_party_identifier", "_086_of53a_name_address"]);
    }
}

// Handle Field 54a Receiver's Correspondent Option (A, B, or D)
function handle54aOption() {
    const select = q("_090_of54a_receivers_correspondent");
    const divA = q("div_090_of54a_A");
    const divB = q("div_090_of54a_B");
    const divD = q("div_090_of54a_D");
    
    if (!select || !divA || !divB || !divD) return;
    
    const value = select.value;
    
    show("div_090_of54a_A", value === "A");
    show("div_090_of54a_B", value === "B");
    show("div_090_of54a_D", value === "D");
    
    // Clear fields when switching options
    if (value !== "A") {
        clearFieldValues(["_091_of54a_party_identifier", "_092_of54a_identifier_code"]);
    }
    if (value !== "B") {
        clearFieldValues(["_093_of54a_party_identifier", "_094_of54a_location"]);
    }
    if (value !== "D") {
        clearFieldValues(["_095_of54a_party_identifier", "_096_of54a_name_address"]);
    }
}

// Clear field values helper
function clearFieldValues(fieldIds) {
    fieldIds.forEach(id => {
        const field = q(id);
        if (field) {
            field.value = "";
        }
    });
}

/* ========== Error Display Functions ========== */

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

/* ========== Validation Helper Functions ========== */

// Get field value
function getFieldValue(id) {
    return val(id);
}

// Check if field is empty
function isFieldEmpty(id) {
    return isEmpty(getFieldValue(id));
}

// Validate BIC format
function isValidBIC(bic) {
    if (!bic) return false;
    if (bic.length !== 8 && bic.length !== 11) return false;
    const bicPattern = /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
    return bicPattern.test(bic);
}

// Validate Currency Code (ISO 4217)
function isValidCurrency(ccy) {
    if (!ccy) return false;
    return /^[A-Z]{3}$/.test(ccy);
}

/* ========== Currency-Specific Decimal Validation ========== */
const DEC0 = new Set(['JPY', 'KRW', 'VND', 'HUF', 'XOF', 'XAF', 'XPF', 'CLP', 'ISK', 'PYG', 'UGX', 'VUV']);
const DEC3 = new Set(['BHD', 'JOD', 'KWD', 'OMR', 'TND', 'LYD', 'IQD']);

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

/* ========== Field-Specific Validations ========== */

// Field 20: Documentary Credit Number (T26)
function validateField20() {
    const field = q("_010_mf20_documentary_credit_number");
    const value = getFieldValue("_010_mf20_documentary_credit_number");
    
    if (!value) return false;
    
    clearFieldError(field);
    
    if (value.startsWith('/') || value.endsWith('/')) {
        showFieldError(field, 'Cannot start or end with "/" (Error T26)');
        return false;
    }
    
    if (value.includes('//')) {
        showFieldError(field, 'Cannot contain "//" (Error T26)');
        return false;
    }
    
    field.classList.add('valid-border');
    return true;
}

// Field 21: Presenting Bank's Reference (T26)
function validateField21() {
    const field = q("_020_mf21_presenting_banks_reference");
    const value = getFieldValue("_020_mf21_presenting_banks_reference");
    
    if (!value) return false;
    
    clearFieldError(field);
    
    if (value.startsWith('/') || value.endsWith('/')) {
        showFieldError(field, 'Cannot start or end with "/" (Error T26)');
        return false;
    }
    
    if (value.includes('//')) {
        showFieldError(field, 'Cannot contain "//" (Error T26)');
        return false;
    }
    
    field.classList.add('valid-border');
    return true;
}

// Field 23: Further Identification
function validateField23() {
    const value = getFieldValue("_030_mf23_further_identification");
    const allowed = ["ACCEPT", "DEBIT", "NEGOTIATE", "REIMBURSE", "REMITTED", "SEE79Z"];
    
    if (!value) return false;
    
    if (!allowed.includes(value)) {
        alert("Field 23 must be one of: " + allowed.join(", "));
        q("_030_mf23_further_identification").focus();
        return false;
    }
    
    return true;
}

// Field 30: Date of Advice of Discrepancy or Mailing (T50)
function validateField30() {
    const field = q("_040_mf30_date_of_advice_of_discrepancy_or_mailing");
    const value = getFieldValue("_040_mf30_date_of_advice_of_discrepancy_or_mailing");
    
    if (!value) return false;
    
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

// Field 32B: Total Amount Advised (T52, T40, T43, C03)
function validateField32B() {
    const ccy = getFieldValue("_050_of32b_currency");
    const amt = getFieldValue("_051_of32b_amount");
    
    // Optional field - skip if empty
    if (!ccy && !amt) return true;
    
    // If one is filled, both must be filled
    if ((ccy && !amt) || (!ccy && amt)) {
        alert("Field 32B: Both Currency and Amount must be filled together");
        return false;
    }
    
    if (!isValidCurrency(ccy)) {
        alert("Field 32B: Invalid Currency Code. Must be 3 letters (ISO 4217) (Error T52)");
        q("_050_of32b_currency").focus();
        return false;
    }
    
    const result = validateAmountByCurrency(ccy, amt);
    if (!result.valid) {
        alert("Field 32B Amount: " + result.error);
        q("_051_of32b_amount").focus();
        return false;
    }
    
    return true;
}

// Field 71D: Charges Deducted (structured format validation)
function validateField71D() {
    const value = getFieldValue("_060_of71d_charges_deducted");
    
    // Optional field
    if (!value) return true;
    
    const lines = value.split('\n');
    const allowedCodes = ['AGENT', 'COMM', 'CORCOM', 'DISC', 'INSUR', 'POST', 'STAMP', 'TELECHAR', 'WAREHOUS'];
    
    for (let i = 0; i < lines.length; i++) {
        const line = lines[i].trim();
        if (!line) continue;
        
        // Check if line starts with /CODE/
        const codeMatch = line.match(/^\/([A-Z]+)\//);
        if (codeMatch) {
            const code = codeMatch[1];
            if (!allowedCodes.includes(code)) {
                alert(`Field 71D: Invalid code '${code}' at line ${i + 1}. Allowed codes: ${allowedCodes.join(', ')}`);
                q("_060_of71d_charges_deducted").focus();
                return false;
            }
        } else if (line.startsWith('/')) {
            alert(`Field 71D: Invalid format at line ${i + 1}. Code must be between slashes.`);
            q("_060_of71d_charges_deducted").focus();
            return false;
        }
    }
    
    return true;
}

// Field 33a: Net Amount (conditional - see Rule C1)
function validateField33a() {
    const option = getFieldValue("_070_of33a_net_amount");
    
    // Optional field
    if (!option) return true;
    
    if (option === "A") {
        const date = getFieldValue("_071_of33a_date");
        const ccy = getFieldValue("_072_of33a_currency");
        const amt = getFieldValue("_073_of33a_amount");
        
        if (!date || !ccy || !amt) {
            alert("Field 33a Option A: Date, Currency, and Amount are all required");
            return false;
        }
        
        // Validate date
        if (!isYYMMDD(date)) {
            alert("Field 33a: Invalid date format (Error T50)");
            q("_071_of33a_date").focus();
            return false;
        }
        
        // Validate currency
        if (!isValidCurrency(ccy)) {
            alert("Field 33a: Invalid Currency Code (Error T52)");
            q("_072_of33a_currency").focus();
            return false;
        }
        
        // Validate amount
        const result = validateAmountByCurrency(ccy, amt);
        if (!result.valid) {
            alert("Field 33a Amount: " + result.error);
            q("_073_of33a_amount").focus();
            return false;
        }
        
    } else if (option === "B") {
        const ccy = getFieldValue("_074_of33a_currency");
        const amt = getFieldValue("_075_of33a_amount");
        
        if (!ccy || !amt) {
            alert("Field 33a Option B: Currency and Amount are required");
            return false;
        }
        
        // Validate currency
        if (!isValidCurrency(ccy)) {
            alert("Field 33a: Invalid Currency Code (Error T52)");
            q("_074_of33a_currency").focus();
            return false;
        }
        
        // Validate amount
        const result = validateAmountByCurrency(ccy, amt);
        if (!result.valid) {
            alert("Field 33a Amount: " + result.error);
            q("_075_of33a_amount").focus();
            return false;
        }
    }
    
    return true;
}

// Validate BIC for 53a and 54a
function validateBICFields() {
    // Field 53a - Sender's Correspondent
    const opt53a = getFieldValue("_080_of53a_senders_correspondent");
    if (opt53a === "A") {
        const bic = getFieldValue("_082_of53a_identifier_code");
        if (bic && !isValidBIC(bic)) {
            alert("Field 53a: Invalid BIC format (Error T27/T28/T29)");
            q("_082_of53a_identifier_code").focus();
            return false;
        }
    }
    
    // Field 54a - Receiver's Correspondent
    const opt54a = getFieldValue("_090_of54a_receivers_correspondent");
    if (opt54a === "A") {
        const bic = getFieldValue("_092_of54a_identifier_code");
        if (bic && !isValidBIC(bic)) {
            alert("Field 54a: Invalid BIC format (Error T27/T28/T29)");
            q("_092_of54a_identifier_code").focus();
            return false;
        }
    }
    
    return true;
}

// Field 72Z: Sender to Receiver Information (RCB code validation)
function validateField72Z() {
    const value = getFieldValue("_100_of72z_sender_to_receiver_information");
    
    if (!value) return true;
    
    // Check if RCB code is used
    if (value.includes('/RCB/')) {
        const has53a = getFieldValue("_080_of53a_senders_correspondent");
        const has54a = getFieldValue("_090_of54a_receivers_correspondent");
        
        if (!has53a || !has54a) {
            alert("Field 72Z: Code RCB can only be used if both fields 53a and 54a are present");
            q("_100_of72z_sender_to_receiver_information").focus();
            return false;
        }
    }
    
    return true;
}

/* ========== Network Validated Rules ========== */

// Rule C1: If fields 32B and 71D are both present, then field 33a must also be present (Error C18)
function validateRuleC1() {
    const has32B = getFieldValue("_050_of32b_currency") && getFieldValue("_051_of32b_amount");
    const has71D = getFieldValue("_060_of71d_charges_deducted");
    const has33a = getFieldValue("_070_of33a_net_amount");
    
    if (has32B && has71D && !has33a) {
        alert("Error C18 (Rule C1): If fields 32B and 71D are both present, then field 33a must also be present");
        q("_070_of33a_net_amount").focus();
        return false;
    }
    
    return true;
}

// Rule C2: The currency code in the amount fields 32B and 33a must be the same (Error C02)
function validateRuleC2() {
    const ccy32B = getFieldValue("_050_of32b_currency");
    const option33a = getFieldValue("_070_of33a_net_amount");
    
    if (!ccy32B || !option33a) return true;
    
    let ccy33a = "";
    if (option33a === "A") {
        ccy33a = getFieldValue("_072_of33a_currency");
    } else if (option33a === "B") {
        ccy33a = getFieldValue("_074_of33a_currency");
    }
    
    if (ccy33a && ccy32B !== ccy33a) {
        alert("Error C02 (Rule C2): The currency code in fields 32B and 33a must be the same");
        return false;
    }
    
    return true;
}

// Usage Rule: When REMITTED is specified in field 23, field 33a option A must be used
function validateUsageRuleRemitted() {
    const field23 = getFieldValue("_030_mf23_further_identification");
    const option33a = getFieldValue("_070_of33a_net_amount");
    
    if (field23 === "REMITTED" && option33a !== "A") {
        alert("Usage Rule: When field 23 is REMITTED, field 33a must be present with Option A (Date, Currency, Amount)");
        q("_070_of33a_net_amount").focus();
        return false;
    }
    
    return true;
}

// Usage Rule: When DEBIT is specified in field 23, field 33a option A must be used
function validateUsageRuleDebit() {
    const field23 = getFieldValue("_030_mf23_further_identification");
    const option33a = getFieldValue("_070_of33a_net_amount");
    
    if (field23 === "DEBIT" && option33a !== "A") {
        alert("Usage Rule: When field 23 is DEBIT, field 33a must be present with Option A (Date, Currency, Amount)");
        q("_070_of33a_net_amount").focus();
        return false;
    }
    
    return true;
}

/* ========== Main Validation Function ========== */
function validateMT752() {
    console.log('Starting MT752 validation...');
    
    // 1. Validate mandatory fields
    if (isFieldEmpty("_010_mf20_documentary_credit_number")) {
        alert("Field 20 (Documentary Credit Number) is required");
        q("_010_mf20_documentary_credit_number").focus();
        return false;
    }
    
    if (isFieldEmpty("_020_mf21_presenting_banks_reference")) {
        alert("Field 21 (Presenting Bank's Reference) is required");
        q("_020_mf21_presenting_banks_reference").focus();
        return false;
    }
    
    if (isFieldEmpty("_030_mf23_further_identification")) {
        alert("Field 23 (Further Identification) is required");
        q("_030_mf23_further_identification").focus();
        return false;
    }
    
    if (isFieldEmpty("_040_mf30_date_of_advice_of_discrepancy_or_mailing")) {
        alert("Field 30 (Date of Advice of Discrepancy or Mailing) is required");
        q("_040_mf30_date_of_advice_of_discrepancy_or_mailing").focus();
        return false;
    }
    
    // 2. Field 20: Documentary Credit Number (T26)
    if (!validateField20()) {
        alert("Field 20: Invalid Documentary Credit Number (Error T26)");
        q("_010_mf20_documentary_credit_number").focus();
        return false;
    }
    
    // 3. Field 21: Presenting Bank's Reference (T26)
    if (!validateField21()) {
        alert("Field 21: Invalid Presenting Bank's Reference (Error T26)");
        q("_020_mf21_presenting_banks_reference").focus();
        return false;
    }
    
    // 4. Field 23: Further Identification
    if (!validateField23()) {
        return false;
    }
    
    // 5. Field 30: Date of Advice of Discrepancy or Mailing (T50)
    if (!validateField30()) {
        alert("Field 30: Invalid date format. Must be YYMMDD (Error T50)");
        q("_040_mf30_date_of_advice_of_discrepancy_or_mailing").focus();
        return false;
    }
    
    // 6. Field 32B: Total Amount Advised (optional)
    if (!validateField32B()) {
        return false;
    }
    
    // 7. Field 71D: Charges Deducted (optional)
    if (!validateField71D()) {
        return false;
    }
    
    // 8. Field 33a: Net Amount (conditional)
    if (!validateField33a()) {
        return false;
    }
    
    // 9. Validate BIC Fields (T27, T28, T29)
    if (!validateBICFields()) {
        return false;
    }
    
    // 10. Field 72Z: Sender to Receiver Information
    if (!validateField72Z()) {
        return false;
    }
    
    // 11. Network Validated Rules
    
    // Rule C1: If fields 32B and 71D are both present, then field 33a must also be present
    if (!validateRuleC1()) {
        return false;
    }
    
    // Rule C2: Currency code in fields 32B and 33a must be the same
    if (!validateRuleC2()) {
        return false;
    }
    
    // 12. Usage Rules
    
    // When REMITTED is specified in field 23, field 33a option A must be used
    if (!validateUsageRuleRemitted()) {
        return false;
    }
    
    // When DEBIT is specified in field 23, field 33a option A must be used
    if (!validateUsageRuleDebit()) {
        return false;
    }
    
    console.log('MT752 validation completed successfully');
    return true;
}

/* ========== Setup Real-time Validations ========== */
function setupRealtimeValidations() {
    // Field 20 - Documentary Credit Number
    const field20 = q("_010_mf20_documentary_credit_number");
    if (field20) {
        field20.addEventListener('blur', function() {
            validateField20();
        });
        field20.addEventListener('keypress', avoidSplChars);
    }
    
    // Field 21 - Presenting Bank's Reference
    const field21 = q("_020_mf21_presenting_banks_reference");
    if (field21) {
        field21.addEventListener('blur', function() {
            validateField21();
        });
        field21.addEventListener('keypress', avoidSplChars);
    }
    
    // Field 30 - Date of Advice of Discrepancy or Mailing
    const field30 = q("_040_mf30_date_of_advice_of_discrepancy_or_mailing");
    if (field30) {
        field30.addEventListener('blur', function() {
            validateField30();
        });
        field30.addEventListener('keypress', numbersonly);
        field30.addEventListener('input', function() {
            this.value = this.value.replace(/[^\d]/g, '').slice(0, 6);
        });
    }
    
    // Currency Fields - Force uppercase and 3 letters only
    const currencyFields = [
        "_050_of32b_currency",
        "_072_of33a_currency",
        "_074_of33a_currency"
    ];
    
    currencyFields.forEach(id => {
        const field = q(id);
        if (field) {
            field.addEventListener('input', function() {
                this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '').slice(0, 3);
            });
        }
    });
    
    // Amount Fields - Format on input and blur
    const amountFields = [
        "_051_of32b_amount",
        "_073_of33a_amount",
        "_075_of33a_amount"
    ];
    
    amountFields.forEach(id => {
        const field = q(id);
        if (field) {
            field.addEventListener('input', function() {
                formatAmountInput(this);
            });
            field.addEventListener('blur', function() {
                formatAmountBlur(this);
            });
        }
    });
    
    // Date Field for 33a Option A
    const field33aDate = q("_071_of33a_date");
    if (field33aDate) {
        field33aDate.addEventListener('keypress', numbersonly);
        field33aDate.addEventListener('input', function() {
            this.value = this.value.replace(/[^\d]/g, '').slice(0, 6);
        });
    }
    
    // BIC Fields - Uppercase alphanumeric only
    const bicFields = [
        "_082_of53a_identifier_code",
        "_092_of54a_identifier_code"
    ];
    
    bicFields.forEach(id => {
        const field = q(id);
        if (field) {
            field.addEventListener('input', function() {
                this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '').slice(0, 11);
            });
        }
    });
    
    // Party Identifier Fields - Auto add slash
    const partyIdFields = [
        "_081_of53a_party_identifier",
        "_083_of53a_party_identifier",
        "_085_of53a_party_identifier",
        "_091_of54a_party_identifier",
        "_093_of54a_party_identifier",
        "_095_of54a_party_identifier"
    ];
    
    partyIdFields.forEach(id => {
        const field = q(id);
        if (field) {
            field.addEventListener('blur', function() {
                cek_slash(this);
            });
        }
    });
}

/* ========== Initialize on Page Load ========== */
document.addEventListener("DOMContentLoaded", function() {
    console.log('Initializing MT752 form...');
    
    // Setup tab navigation
    setupTabNavigation();
    
    // Attach jQuery datepicker to date fields
    yymmdd("_040_mf30_date_of_advice_of_discrepancy_or_mailing");
    yymmdd("_071_of33a_date");
    
    // Setup Option Field Handlers
    const optionHandlers = [
        { id: "_070_of33a_net_amount", handler: handle33aOption },
        { id: "_080_of53a_senders_correspondent", handler: handle53aOption },
        { id: "_090_of54a_receivers_correspondent", handler: handle54aOption }
    ];
    
    optionHandlers.forEach(config => {
        const element = q(config.id);
        if (element) {
            element.addEventListener("change", config.handler);
            config.handler(); // Initialize on load
        }
    });
    
    // Setup Real-time Validations
    setupRealtimeValidations();
    
    console.log('MT752 form initialized successfully');
});

/* ========== Export functions for external use ========== */
window.validateMT752 = validateMT752;
window.validateRuleC1 = validateRuleC1;
window.validateRuleC2 = validateRuleC2;
window.validateUsageRuleRemitted = validateUsageRuleRemitted;
window.validateUsageRuleDebit = validateUsageRuleDebit;
window.numbersonly = numbersonly;
window.textonly = textonly;
window.avoidSplChars = avoidSplChars;
window.cek_slash = cek_slash;
window.formatAmountInput = formatAmountInput;
window.formatAmountBlur = formatAmountBlur;
window.getFieldValue = getFieldValue;
window.isFieldEmpty = isFieldEmpty;