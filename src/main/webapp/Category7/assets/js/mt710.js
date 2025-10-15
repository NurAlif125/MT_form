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

// Show/Hide element
function show(id, visible = true) {
    const el = q(id);
    if (el) el.style.display = visible ? "block" : "none";
}

// Only numbers (0-9) with currency exception
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

// Only numbers (strict - no comma)
function numbersonly2(e) {
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

// Avoid special characters
function avoidSplChars(e) {
    e = e || window.event;
    let bad = /[^\sa-zA-Z0-9\.\,\'\(\)\-\/\:]/i;
    let key = String.fromCharCode(e.keyCode || e.which);
    if (e.which !== 0 && e.charCode !== 0 && bad.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) e.preventDefault();
    }
}

// Auto-add comma for amount fields
function cek_koma(obj) {
    if (obj.value && !obj.value.includes(",")) {
        obj.value = obj.value + ",";
    }
}

// Validate and format Party Identifier (for fields 52a, 51a, 42a, 58a, 53a, 57a)
// Format: [/A][/account] or just account
function cek_slash(obj) {
    const val = obj.value.trim();
    if (!val) return;
    
    // Party Identifier format: [/1!a][/34x]
    // Examples: /D/123456, /123456, or 123456
    
    if (val.includes('/')) {
        const parts = val.split('/');
        
        // Format: /A/account (3 parts with empty first)
        if (parts.length === 3 && parts[0] === '') {
            if (parts[1].length !== 1 || !/^[A-Z]$/.test(parts[1])) {
                alert("Error T12: Invalid Party Identifier format. First qualifier must be single letter (A-Z).\nFormat: /A/account");
                obj.value = "";
                obj.focus();
                return;
            }
            if (parts[2].length === 0 || parts[2].length > 34) {
                alert("Error T13: Account number must be 1-34 characters.\nFormat: /A/account");
                obj.value = "";
                obj.focus();
                return;
            }
            // Valid format /A/account
            return;
        }
        
        // Format: /account (2 parts with empty first)
        if (parts.length === 2 && parts[0] === '') {
            if (parts[1].length === 0 || parts[1].length > 34) {
                alert("Error T13: Account number must be 1-34 characters.\nFormat: /account");
                obj.value = "";
                obj.focus();
                return;
            }
            // Valid format /account
            return;
        }
        
        // Invalid format
        alert("Error T12: Invalid Party Identifier format.\nValid formats:\n- /A/account (A = single letter)\n- /account\n- account (no slash)");
        obj.value = "";
        obj.focus();
        return;
    }
    
    // No slash - just account number (max 34 chars)
    if (val.length > 34) {
        alert("Error T13: Account number maximum 34 characters");
        obj.value = val.substring(0, 34);
        obj.focus();
    }
}

// Validate Field 59 Account (simpler - just /account format)
function cek_slash_account(obj) {
    const val = obj.value.trim();
    if (!val) return; // Account is optional in field 59
    
    // Format: [/34x] - if present, must start with /
    if (val.length > 0 && !val.startsWith("/")) {
        obj.value = "/" + val;
    }
    
    // Validate max 35 chars (including /)
    if (obj.value.length > 35) {
        alert("Error C03: Account field maximum 35 characters (including /)");
        obj.value = obj.value.substring(0, 35);
        obj.focus();
    }
}

/* ========== Amount Formatting Functions ========== */

// Currency sets for decimal validation
const DEC0 = new Set(['JPY', 'KRW', 'VND', 'HUF', 'XOF', 'XAF', 'XPF', 'CLP', 'ISK', 'PYG', 'UGX', 'VUV']);
const DEC3 = new Set(['BHD', 'JOD', 'KWD', 'OMR', 'TND', 'LYD', 'IQD']);

// Format amount on blur - enhanced version
function formatAmountBlur(el) {
    let v = el.value.trim();
    if (!v) return;
    
    // Remove all non-digit and non-comma characters
    v = v.replace(/[^0-9,]/g, '');
    
    // Handle multiple commas - keep only first
    const parts = v.split(',');
    if (parts.length > 2) {
        v = parts[0] + ',' + parts.slice(1).join('');
    }
    
    if (v.indexOf(",") === -1) {
        // No comma - add decimal based on currency
        const ccy = $("#_140_mf32b_currency").val().trim();
        let maxDec = 2;
        if (DEC0.has(ccy)) maxDec = 0;
        if (DEC3.has(ccy)) maxDec = 3;
        
        if (maxDec === 0) {
            v = v + ",";
        } else {
            v = v + "," + "0".repeat(maxDec);
        }
    } else {
        let [intPart, decPart] = v.split(",");
        
        // Remove leading zeros but keep if value is 0
        intPart = intPart.replace(/^0+/, '') || '0';
        
        // Get currency to determine decimal places
        const ccy = $("#_140_mf32b_currency").val().trim();
        let maxDec = 2;
        if (DEC0.has(ccy)) maxDec = 0;
        if (DEC3.has(ccy)) maxDec = 3;
        
        // Truncate or pad decimal part
        if (maxDec === 0) {
            decPart = "";
        } else {
            decPart = (decPart || "").substring(0, maxDec).padEnd(maxDec, "0");
        }
        
        v = intPart + "," + decPart;
    }
    
    el.value = v;
}

// Format amount during input - enhanced version
function formatAmountInput(el) {
    // Allow only digits and single comma
    let v = el.value.replace(/[^0-9,]/g, '');
    
    // Ensure only one comma
    const commaCount = (v.match(/,/g) || []).length;
    if (commaCount > 1) {
        const parts = v.split(',');
        v = parts[0] + ',' + parts.slice(1).join('');
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

// Attach jQuery datepicker with YYMMDD format - enhanced version
function yymmdd(id) {
    const input = document.getElementById(id);
    if (!input) return;

    if (typeof jQuery !== "undefined" && jQuery.fn && jQuery.fn.datepicker) {
        jQuery(function($) {
            $("#" + id).datepicker({
                changeMonth: true,
                changeYear: true,
                yearRange: "-50:+50",
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

            // Initialize with existing value if valid
            const cur = input.value && input.value.trim();
            if (cur && /^\d{6}$/.test(cur)) {
                const yy = parseInt(cur.slice(0, 2), 10);
                const mm = parseInt(cur.slice(2, 4), 10);
                const dd = parseInt(cur.slice(4, 6), 10);
                
                // Smart century calculation
                const thisYear = new Date().getFullYear();
                const thisCentury = Math.floor(thisYear / 100) * 100;
                const thisTwoDigit = thisYear % 100;
                
                let fullYear = thisCentury + yy;
                
                // If parsed year is more than 50 years ahead, assume previous century
                // If parsed year is more than 50 years behind, assume next century
                if (yy > thisTwoDigit + 50) {
                    fullYear -= 100;
                } else if (yy < thisTwoDigit - 50) {
                    fullYear += 100;
                }
                
                try {
                    $(input).datepicker('setDate', new Date(fullYear, mm - 1, dd));
                } catch (e) {
                    console.warn('Invalid date for datepicker:', cur);
                }
            }
        });
    }
}

/* ========== Tab Navigation ========== */
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

// Handle MF40E Applicable Rules
function handle40eOption() {
    const select = document.getElementById("_070_mf40e_applicable_rules");
    const narrativeDiv = document.getElementById("div_070_mf40e_narrative");
    const narrativeField = document.getElementById("_071_mf40e_narrative");
    
    if (!select || !narrativeDiv) return;
    
    if (select.value === "OTHR") {
        narrativeDiv.style.display = "block";
        if (narrativeField) narrativeField.disabled = false;
    } else {
        narrativeDiv.style.display = "none";
        if (narrativeField) {
            narrativeField.value = "";
            narrativeField.disabled = true;
        }
    }
}

// Handle OF52a Issuing Bank
function handle52aOption() {
    const select = document.getElementById("_090_of52a_issuing_bank");
    const divA = document.getElementById("div_090_of52a_A");
    const divD = document.getElementById("div_090_of52a_D");
    
    if (!select || !divA || !divD) return;
    
    divA.style.display = (select.value === "A") ? "block" : "none";
    divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_091_of52a_party_identifier", "_092_of52a_identifier_code"]);
        disableFields(["_091_of52a_party_identifier", "_092_of52a_identifier_code"], true);
    } else {
        disableFields(["_091_of52a_party_identifier", "_092_of52a_identifier_code"], false);
    }
    
    if (select.value !== "D") {
        clearFieldValues(["_093_of52a_party_identifier", "_094_of52a_name_address"]);
        disableFields(["_093_of52a_party_identifier", "_094_of52a_name_address"], true);
    } else {
        disableFields(["_093_of52a_party_identifier", "_094_of52a_name_address"], false);
    }
}

// Handle OF51a Applicant Bank
function handle51aOption() {
    const select = document.getElementById("_110_of51a_applicant_bank");
    const divA = document.getElementById("div_110_of51a_A");
    const divD = document.getElementById("div_110_of51a_D");
    
    if (!select || !divA || !divD) return;
    
    divA.style.display = (select.value === "A") ? "block" : "none";
    divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_111_of51a_party_identifier", "_112_of51a_bic"]);
        disableFields(["_111_of51a_party_identifier", "_112_of51a_bic"], true);
    } else {
        disableFields(["_111_of51a_party_identifier", "_112_of51a_bic"], false);
    }
    
    if (select.value !== "D") {
        clearFieldValues(["_113_of51a_party_identifier", "_114_of51a_name_address"]);
        disableFields(["_113_of51a_party_identifier", "_114_of51a_name_address"], true);
    } else {
        disableFields(["_113_of51a_party_identifier", "_114_of51a_name_address"], false);
    }
}

// Handle MF41A Available With ... By ...
function handle41aOption() {
    const select = document.getElementById("_170_mf41a_available_with_by");
    const divA = document.getElementById("div_170_mf41a_A");
    const divD = document.getElementById("div_170_mf41a_D");
    
    if (!select || !divA || !divD) return;
    
    divA.style.display = (select.value === "A") ? "block" : "none";
    divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_171_mf41a_identifier_code"]);
        disableFields(["_171_mf41a_identifier_code"], true);
    } else {
        disableFields(["_171_mf41a_identifier_code"], false);
    }
    
    if (select.value !== "D") {
        clearFieldValues(["_172_mf41d_name_and_address"]);
        disableFields(["_172_mf41d_name_and_address"], true);
    } else {
        disableFields(["_172_mf41d_name_and_address"], false);
    }
}

// Handle OF42a Drawee
function handle42aOption() {
    const select = document.getElementById("_190_of42a_drawee");
    const divA = document.getElementById("div_190_of42a_A");
    const divD = document.getElementById("div_190_of42a_D");
    
    if (!select || !divA || !divD) return;
    
    divA.style.display = (select.value === "A") ? "block" : "none";
    divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_191_of42a_party_identifier", "_192_of42a_identifier_code"]);
        disableFields(["_191_of42a_party_identifier", "_192_of42a_identifier_code"], true);
    } else {
        disableFields(["_191_of42a_party_identifier", "_192_of42a_identifier_code"], false);
    }
    
    if (select.value !== "D") {
        clearFieldValues(["_193_of42a_party_identifier", "_194_of42d_name_and_address"]);
        disableFields(["_193_of42a_party_identifier", "_194_of42d_name_and_address"], true);
    } else {
        disableFields(["_193_of42a_party_identifier", "_194_of42d_name_and_address"], false);
    }
}

// Handle OF58a Requested Confirmation Party
function handle58aOption() {
    const select = document.getElementById("_380_of58a_requested_confirmation_party");
    const divA = document.getElementById("div_380_of58a_A");
    const divD = document.getElementById("div_380_of58a_D");
    
    if (!select || !divA || !divD) return;
    
    divA.style.display = (select.value === "A") ? "block" : "none";
    divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_381_of58a_party_identifier", "_382_of58a_bic"]);
        disableFields(["_381_of58a_party_identifier", "_382_of58a_bic"], true);
    } else {
        disableFields(["_381_of58a_party_identifier", "_382_of58a_bic"], false);
    }
    
    if (select.value !== "D") {
        clearFieldValues(["_383_of58a_party_identifier", "_384_of58a_name_address"]);
        disableFields(["_383_of58a_party_identifier", "_384_of58a_name_address"], true);
    } else {
        disableFields(["_383_of58a_party_identifier", "_384_of58a_name_address"], false);
    }
}

// Handle OF53a Reimbursing Bank
function handle53aOption() {
    const select = document.getElementById("_390_of53a_reimbursing_bank");
    const divA = document.getElementById("div_390_of53a_A");
    const divD = document.getElementById("div_390_of53a_D");
    
    if (!select || !divA || !divD) return;
    
    divA.style.display = (select.value === "A") ? "block" : "none";
    divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_391_of53a_party_identifier", "_392_of53a_bic"]);
        disableFields(["_391_of53a_party_identifier", "_392_of53a_bic"], true);
    } else {
        disableFields(["_391_of53a_party_identifier", "_392_of53a_bic"], false);
    }
    
    if (select.value !== "D") {
        clearFieldValues(["_393_of53a_party_identifier", "_394_of53a_name_address"]);
        disableFields(["_393_of53a_party_identifier", "_394_of53a_name_address"], true);
    } else {
        disableFields(["_393_of53a_party_identifier", "_394_of53a_name_address"], false);
    }
}

// Handle OF57a Advise Through Bank
function handle57aOption() {
    const select = document.getElementById("_420_of57a_advise_through_bank");
    const divA = document.getElementById("div_420_of57a_A");
    const divB = document.getElementById("div_420_of57a_B");
    const divD = document.getElementById("div_420_of57a_D");
    
    if (!select || !divA || !divB || !divD) return;
    
    divA.style.display = (select.value === "A") ? "block" : "none";
    divB.style.display = (select.value === "B") ? "block" : "none";
    divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_421_of57a_party_identifier", "_422_of57a_bic"]);
        disableFields(["_421_of57a_party_identifier", "_422_of57a_bic"], true);
    } else {
        disableFields(["_421_of57a_party_identifier", "_422_of57a_bic"], false);
    }
    
    if (select.value !== "B") {
        clearFieldValues(["_423_of57a_party_identifier", "_424_of57a_location"]);
        disableFields(["_423_of57a_party_identifier", "_424_of57a_location"], true);
    } else {
        disableFields(["_423_of57a_party_identifier", "_424_of57a_location"], false);
    }
    
    if (select.value !== "D") {
        clearFieldValues(["_425_of57a_party_identifier", "_426_of57a_name_address"]);
        disableFields(["_425_of57a_party_identifier", "_426_of57a_name_address"], true);
    } else {
        disableFields(["_425_of57a_party_identifier", "_426_of57a_name_address"], false);
    }
}

// Helper functions for option handlers
function clearFieldValues(fieldIds) {
    fieldIds.forEach(id => {
        const field = document.getElementById(id);
        if (field) {
            field.value = "";
        }
    });
}

function disableFields(fieldIds, disabled) {
    fieldIds.forEach(id => {
        const field = document.getElementById(id);
        if (field) {
            field.disabled = disabled;
        }
    });
}

/* ========== Character Counter for Large Text Areas ========== */
function setupCharacterCounters() {
    const largeTextAreas = [
        { id: '_300_of45a_description_of_goods_and_or_services', max: 6500, lines: 100 },
        { id: '_310_of46a_documents_required', max: 6500, lines: 100 },
        { id: '_320_of47a_additional_conditions', max: 6500, lines: 100 },
        { id: '_330_of49g_special_payment_conditions_for_beneficiary', max: 6500, lines: 100 },
        { id: '_340_of49h_special_payment_conditions_for_bank_only', max: 6500, lines: 100 }
    ];
    
    largeTextAreas.forEach(config => {
        const textarea = document.getElementById(config.id);
        if (textarea) {
            const counter = document.createElement('div');
            counter.id = 'counter_' + config.id;
            counter.style.fontSize = '10pt';
            counter.style.marginTop = '5px';
            counter.style.color = 'green';
            textarea.parentElement.appendChild(counter);
            
            textarea.addEventListener('input', function() {
                updateCharCounter(this, counter, config.max, config.lines);
            });
            
            updateCharCounter(textarea, counter, config.max, config.lines);
        }
    });
}

function updateCharCounter(textarea, counterElement, maxChars, maxLines) {
    const content = textarea.value;
    const lines = content.split('\n');
    const lineCount = lines.length;
    const charCount = content.length;
    
    const counterText = `${charCount} / ${maxChars.toLocaleString()} characters | ${lineCount} / ${maxLines} lines`;
    counterElement.textContent = counterText;
    
    if (lineCount > maxLines || charCount > maxChars) {
        counterElement.style.color = 'red';
    } else if (lineCount > (maxLines * 0.8) || charCount > (maxChars * 0.8)) {
        counterElement.style.color = 'orange';
    } else {
        counterElement.style.color = 'green';
    }
}

/* ========== Validation Helper Functions ========== */

function getFieldValue(id) {
    return val(id);
}

function isFieldEmpty(id) {
    return isEmpty(getFieldValue(id));
}

function isValidDate(dateStr) {
    return isYYMMDD(dateStr);
}

function isValidBIC(bic) {
    if (!bic) return false;
    if (bic.length !== 8 && bic.length !== 11) return false;
    const bicPattern = /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
    return bicPattern.test(bic);
}

function isValidCurrency(ccy) {
    if (!ccy) return false;
    return /^[A-Z]{3}$/.test(ccy);
}

/* ========== Currency-Specific Decimal Validation ========== */

function validateAmountByCurrency(ccy, amt) {
    if (!ccy || !amt) return { valid: true, error: null };
    
    if (!amt.includes(',')) {
        return { valid: false, error: "Error T40: Amount must contain comma" };
    }
    
    const parts = amt.split(',');
    if (parts.length !== 2) {
        return { valid: false, error: "Error T43: Invalid amount format" };
    }
    
    if (!/^\d+$/.test(parts[0]) || parts[0].length === 0) {
        return { valid: false, error: "Error C03: Invalid integer part" };
    }
    
    const decimalPart = parts[1];
    let allowedDecimals = 2;
    
    if (DEC0.has(ccy)) allowedDecimals = 0;
    if (DEC3.has(ccy)) allowedDecimals = 3;
    
    if (decimalPart.length > allowedDecimals) {
        return { valid: false, error: `Error T43: Maximum ${allowedDecimals} decimal places allowed for ${ccy}` };
    }
    
    if (allowedDecimals === 0 && decimalPart.length !== 0) {
        return { valid: false, error: `Error T43: Currency ${ccy} must not have decimal places` };
    }
    
    const amountValue = parseFloat(amt.replace(',', '.'));
    if (amountValue === 0) {
        return { valid: false, error: "Error C03: Amount must not be 0 (zero)" };
    }
    
    return { valid: true, error: null };
}

/* ========== Network Validated Rules ========== */

// C1: When used, fields 42C and 42a must both be present
function validateRuleC1() {
    const field42C = getFieldValue("_180_of42c_drafts_at");
    const field42aOption = getFieldValue("_190_of42a_drawee");
    
    if (field42C && !field42aOption) {
        alert("Error C90 (Rule C1): When field 42C (Drafts at) is filled, field 42A (Drawee) must also be present.");
        document.getElementById("_190_of42a_drawee").focus();
        return false;
    }
    
    if (field42aOption && !field42C) {
        alert("Error C90 (Rule C1): When field 42A (Drawee) is selected, field 42C (Drafts at) must also be filled.");
        document.getElementById("_180_of42c_drafts_at").focus();
        return false;
    }
    
    return true;
}

// C2: Either fields 42C and 42a together, or field 42M alone, or field 42P alone
function validateRuleC2() {
    const field42C = getFieldValue("_180_of42c_drafts_at");
    const field42aOption = getFieldValue("_190_of42a_drawee");
    const field42M = getFieldValue("_200_of42m_mixed_payment_details");
    const field42P = getFieldValue("_210_of42p_negotiation");
    
    const has42C_42a = (field42C || field42aOption);
    const has42M = field42M !== "";
    const has42P = field42P !== "";
    
    const count = [has42C_42a, has42M, has42P].filter(Boolean).length;
    
    if (count > 1) {
        alert("Error C90 (Rule C2): Only one of the following combinations is allowed:\n" +
              "- Fields 42C and 42A together\n" +
              "- Field 42M alone\n" +
              "- Field 42P alone");
        return false;
    }
    
    return true;
}

// C3: Either field 44C or 44D, but not both
function validateRuleC3() {
    const field44C = getFieldValue("_280_of44c_latest_date_of_shipment");
    const field44D = getFieldValue("_290_of44d_shipment_period");
    
    if (field44C && field44D) {
        alert("Error D06 (Rule C3): Either field 44C (Latest Date of Shipment) or field 44D (Shipment Period) may be present, but not both.");
        document.getElementById("_280_of44c_latest_date_of_shipment").focus();
        return false;
    }
    
    return true;
}

// C4: Either field 52a or field 50B, but not both, must be present
function validateRuleC4() {
    const field52aOption = getFieldValue("_090_of52a_issuing_bank");
    const field50B = getFieldValue("_100_of50b_non_bank_issuer");
    
    const has52a = field52aOption !== "";
    const has50B = field50B !== "";
    
    if (!has52a && !has50B) {
        alert("Error C06 (Rule C4): Either field 52a (Issuing Bank) or field 50B (Non-Bank Issuer) must be present.");
        document.getElementById("_090_of52a_issuing_bank").focus();
        return false;
    }
    
    if (has52a && has50B) {
        alert("Error C06 (Rule C4): Only one of field 52a (Issuing Bank) or field 50B (Non-Bank Issuer) can be present, not both.");
        document.getElementById("_090_of52a_issuing_bank").focus();
        return false;
    }
    
    return true;
}

/* ========== Field-Specific Validations ========== */

// Field 27: Sequence of Total (T75)
function validateField27() {
    const number = parseInt(getFieldValue("_010_mf27_number"));
    const total = parseInt(getFieldValue("_011_mf27_total"));
    
    if (isNaN(number) || number < 1 || number > 8) {
        alert("Error T75: Field 27 Number must be between 1-8");
        document.getElementById("_010_mf27_number").focus();
        return false;
    }
    
    if (isNaN(total) || total < 1 || total > 8) {
        alert("Error T75: Field 27 Total must be between 1-8");
        document.getElementById("_011_mf27_total").focus();
        return false;
    }
    
    if (number > total) {
        alert("Error T75: Field 27 Number cannot exceed Total");
        document.getElementById("_010_mf27_number").focus();
        return false;
    }
    
    return true;
}

// Field 40B: Form of Documentary Credit
function validateField40B() {
    const typeValue = getFieldValue("_020_mf40b_form_of_documentary_credit_type");
    const codeValue = getFieldValue("_021_mf40b_code");
    
    const allowedTypes = ["IRREVOCABLE", "IRREVOCABLE TRANSFERABLE"];
    const allowedCodes = ["ADDING OUR CONFIRMATION", "WITHOUT OUR CONFIRMATION"];
    
    if (!allowedTypes.includes(typeValue)) {
        alert("Error T60: Field 40B Type must be 'IRREVOCABLE' or 'IRREVOCABLE TRANSFERABLE'");
        document.getElementById("_020_mf40b_form_of_documentary_credit_type").focus();
        return false;
    }
    
    if (!allowedCodes.includes(codeValue)) {
        alert("Error T66: Field 40B Code must be 'ADDING OUR CONFIRMATION' or 'WITHOUT OUR CONFIRMATION'");
        document.getElementById("_021_mf40b_code").focus();
        return false;
    }
    
    return true;
}

// Field 20/21: Reference fields (T26)
function validateReferenceFields() {
    const referenceFields = [
        { id: "_030_mf20_sender_reference", name: "Sender's Reference (Field 20)" },
        { id: "_040_mf21_documentary_credit_number", name: "Documentary Credit Number (Field 21)" }
    ];
    
    for (let config of referenceFields) {
        const value = getFieldValue(config.id);
        
        if (value.startsWith('/') || value.endsWith('/')) {
            alert(`Error T26: ${config.name} cannot start or end with "/"`);
            document.getElementById(config.id).focus();
            return false;
        }
        
        if (value.includes('//')) {
            alert(`Error T26: ${config.name} cannot contain "//"`);
            document.getElementById(config.id).focus();
            return false;
        }
    }
    
    return true;
}

// Field 40E: Applicable Rules (D81)
function validateField40E() {
    const code = getFieldValue("_070_mf40e_applicable_rules");
    const narrative = getFieldValue("_071_mf40e_narrative");
    
    const allowedCodes = ["UCP LATEST VERSION", "UCPURR LATEST VERSION", "EUCP LATEST VERSION", "EUCPURR LATEST VERSION", "OTHR"];
    
    if (!allowedCodes.includes(code)) {
        alert("Error T59: Field 40E must be one of: " + allowedCodes.join(", "));
        document.getElementById("_070_mf40e_applicable_rules").focus();
        return false;
    }
    
    if (code === "OTHR" && narrative === "") {
        alert("Error D81: Field 40E Narrative is required when Applicable Rules is OTHR");
        document.getElementById("_071_mf40e_narrative").focus();
        return false;
    }
    
    if (code !== "OTHR" && narrative !== "") {
        alert("Error D81: Field 40E Narrative is only allowed when Applicable Rules is OTHR");
        document.getElementById("_071_mf40e_narrative").focus();
        return false;
    }
    
    return true;
}

// Field 41A: Available With ... By ... (T68)
function validateField41A() {
    const byCode = getFieldValue("_173_mf41a_by");
    const allowed = ["BY ACCEPTANCE", "BY DEF PAYMENT", "BY MIXED PYMT", "BY NEGOTIATION", "BY PAYMENT"];
    
    if (byCode === "") {
        alert("Error T68: Field 41A 'By' is mandatory");
        document.getElementById("_173_mf41a_by").focus();
        return false;
    }
    
    if (!allowed.includes(byCode)) {
        alert("Error T68: Field 41A 'By' must be one of: " + allowed.join(", "));
        document.getElementById("_173_mf41a_by").focus();
        return false;
    }
    
    return true;
}

// Field 43P/43T: Partial Shipments / Transhipment (T64, T65)
function validateField43() {
    const field43P = getFieldValue("_220_of43p_partial_shipments");
    const field43T = getFieldValue("_230_of43t_transhipment");
    const allowed = ["ALLOWED", "CONDITIONAL", "NOT ALLOWED"];
    
    if (field43P !== "" && !allowed.includes(field43P)) {
        alert("Error T64: Field 43P must be ALLOWED, CONDITIONAL, or NOT ALLOWED");
        document.getElementById("_220_of43p_partial_shipments").focus();
        return false;
    }
    
    if (field43T !== "" && !allowed.includes(field43T)) {
        alert("Error T65: Field 43T must be ALLOWED, CONDITIONAL, or NOT ALLOWED");
        document.getElementById("_230_of43t_transhipment").focus();
        return false;
    }
    
    return true;
}

// Field 49: Confirmation Instructions (T67)
function validateField49() {
    const value = getFieldValue("_370_mf49_confirmation_instructions");
    const allowed = ["CONFIRM", "MAY ADD", "WITHOUT"];
    
    if (!allowed.includes(value)) {
        alert("Error T67: Field 49 must be CONFIRM, MAY ADD, or WITHOUT");
        document.getElementById("_370_mf49_confirmation_instructions").focus();
        return false;
    }
    
    return true;
}

// Field 58a: Requested Confirmation Party (conditional) - ENHANCED
function validateField58a() {
    const field49 = getFieldValue("_370_mf49_confirmation_instructions");
    const field58aOption = getFieldValue("_380_of58a_requested_confirmation_party");
    
    let has58aData = false;
    
    if (field58aOption === "A") {
        const bic = getFieldValue("_382_of58a_bic");
        has58aData = bic !== "";
    } else if (field58aOption === "D") {
        const name = getFieldValue("_384_of58a_name_address");
        has58aData = name !== "";
    }
    
    // Rule: Field 58a must be present with data when field 49 is CONFIRM or MAY ADD
    if ((field49 === "CONFIRM" || field49 === "MAY ADD") && !has58aData) {
        alert("Error D67: Field 58a (Requested Confirmation Party) must be present with complete data when Confirmation Instructions is CONFIRM or MAY ADD");
        document.getElementById("_380_of58a_requested_confirmation_party").focus();
        return false;
    }
    
    // Rule: Field 58a should not be present when field 49 is WITHOUT
    if (field49 === "WITHOUT" && has58aData) {
        alert("Error D67: Field 58a (Requested Confirmation Party) should not be present when Confirmation Instructions is WITHOUT");
        document.getElementById("_380_of58a_requested_confirmation_party").focus();
        return false;
    }
    
    return true;
}

// Validate Date Fields
function validateDateFields() {
    const dateFields = [
        { id: "_060_mf31c_date_of_issue", name: "Date of Issue (Field 31C)" },
        { id: "_080_mf31d_date_of_expiry", name: "Date of Expiry (Field 31D)" },
        { id: "_280_of44c_latest_date_of_shipment", name: "Latest Date of Shipment (Field 44C)" }
    ];
    
    for (let config of dateFields) {
        const value = getFieldValue(config.id);
        if (value !== "" && !isValidDate(value)) {
            alert(`Error T50: Invalid ${config.name}. Must be valid date in YYMMDD format`);
            document.getElementById(config.id).focus();
            return false;
        }
    }
    
    return true;
}

// Validate BIC Fields
function validateBICFields() {
    const bicFields = [
        { id: "_092_of52a_identifier_code", name: "Issuing Bank BIC (Field 52a)" },
        { id: "_112_of51a_bic", name: "Applicant Bank BIC (Field 51a)" },
        { id: "_171_mf41a_identifier_code", name: "Available With BIC (Field 41a)" },
        { id: "_192_of42a_identifier_code", name: "Drawee BIC (Field 42a)" },
        { id: "_382_of58a_bic", name: "Requested Confirmation Party BIC (Field 58a)" },
        { id: "_392_of53a_bic", name: "Reimbursing Bank BIC (Field 53a)" },
        { id: "_422_of57a_bic", name: "Advise Through Bank BIC (Field 57a)" }
    ];
    
    for (let config of bicFields) {
        const value = getFieldValue(config.id);
        if (value !== "" && !isValidBIC(value)) {
            alert(`Error T27/T28/T29: Invalid ${config.name}. Must be 8 or 11 characters in valid BIC format`);
            document.getElementById(config.id).focus();
            return false;
        }
    }
    
    return true;
}

// Validate Currency and Amount
function validateCurrencyAmount() {
    const ccy = getFieldValue("_140_mf32b_currency");
    const amt = getFieldValue("_141_mf32b_amount");
    
    if (!isValidCurrency(ccy)) {
        alert("Error T52: Invalid Currency Code. Must be 3 uppercase letters (ISO 4217)");
        document.getElementById("_140_mf32b_currency").focus();
        return false;
    }
    
    const result = validateAmountByCurrency(ccy, amt);
    if (!result.valid) {
        alert("Field 32B Amount: " + result.error);
        document.getElementById("_141_mf32b_amount").focus();
        return false;
    }
    
    return true;
}

// Validate Line Count for Multi-line Fields
function validateLineCount() {
    const lineFields = [
        { id: "_350_of71d_charges", maxLines: 6, maxChars: 35, name: "Field 71D (Charges)" },
        { id: "_400_of78_instructions_to_the_paying_accepting_negotiating_bank", maxLines: 12, maxChars: 65, name: "Field 78 (Instructions)" },
        { id: "_410_of78d_instructions_from_intermediary_bank", maxLines: 12, maxChars: 65, name: "Field 78D (Instructions from Intermediary Bank)" },
        { id: "_430_of72z_information", maxLines: 6, maxChars: 35, name: "Field 72Z (Sender to Receiver Information)" },
        { id: "_290_of44d_shipment_period", maxLines: 6, maxChars: 65, name: "Field 44D (Shipment Period)" }
    ];
    
    for (let config of lineFields) {
        const value = getFieldValue(config.id);
        if (value !== "") {
            const lines = value.split('\n');
            
            if (lines.length > config.maxLines) {
                alert(`Error C03: ${config.name}: Maximum ${config.maxLines} lines allowed`);
                document.getElementById(config.id).focus();
                return false;
            }
            
            for (let i = 0; i < lines.length; i++) {
                if (lines[i].length > config.maxChars) {
                    alert(`Error C03: ${config.name}: Line ${i + 1} exceeds ${config.maxChars} characters`);
                    document.getElementById(config.id).focus();
                    return false;
                }
            }
        }
    }
    
    return true;
}

/* ========== Main Validation Function ========== */
function validateMT710() {
    console.log('Starting MT710 validation...');
    
    // 1. Field 27: Sequence of Total (T75)
    if (!validateField27()) {
        return false;
    }
    
    // 2. Field 40B: Form of Documentary Credit (T60, T66)
    if (!validateField40B()) {
        return false;
    }
    
    // 3. Field 20/21: Reference Fields (T26)
    if (!validateReferenceFields()) {
        return false;
    }
    
    // 4. Field 40E: Applicable Rules (D81)
    if (!validateField40E()) {
        return false;
    }
    
    // 5. Field 41A: Available With ... By ... (T68)
    if (!validateField41A()) {
        return false;
    }
    
    // 6. Field 43P/43T: Partial Shipments / Transhipment (T64, T65)
    if (!validateField43()) {
        return false;
    }
    
    // 7. Field 49: Confirmation Instructions (T67)
    if (!validateField49()) {
        return false;
    }
    
    // 8. Field 58a: Requested Confirmation Party (conditional) - ENHANCED
    if (!validateField58a()) {
        return false;
    }
    
    // 9. Validate Date Fields (T50)
    if (!validateDateFields()) {
        return false;
    }
    
    // 10. Validate BIC Fields (T27, T28, T29)
    if (!validateBICFields()) {
        return false;
    }
    
    // 11. Validate Currency and Amount (T52, T40, T43, C03)
    if (!validateCurrencyAmount()) {
        return false;
    }
    
    // 12. Validate Line Count
    if (!validateLineCount()) {
        return false;
    }
    
    // 13. Network Validated Rules
    if (!validateRuleC1()) {
        return false;
    }
    
    if (!validateRuleC2()) {
        return false;
    }
    
    if (!validateRuleC3()) {
        return false;
    }
    
    if (!validateRuleC4()) {
        return false;
    }
    
    console.log('MT710 validation completed successfully');
    return true;
}

/* ========== Initialize on Page Load ========== */
document.addEventListener("DOMContentLoaded", function() {
    console.log('Initializing MT710 form...');
    
    // Setup tab navigation
    setupTabNavigation();
    
    // Bind date fields with jQuery datepicker
    yymmdd("_060_mf31c_date_of_issue");
    yymmdd("_080_mf31d_date_of_expiry");
    yymmdd("_280_of44c_latest_date_of_shipment");
    
    // Setup Option Field Handlers
    const optionHandlers = [
        { id: "_070_mf40e_applicable_rules", handler: handle40eOption },
        { id: "_090_of52a_issuing_bank", handler: handle52aOption },
        { id: "_110_of51a_applicant_bank", handler: handle51aOption },
        { id: "_170_mf41a_available_with_by", handler: handle41aOption },
        { id: "_190_of42a_drawee", handler: handle42aOption },
        { id: "_380_of58a_requested_confirmation_party", handler: handle58aOption },
        { id: "_390_of53a_reimbursing_bank", handler: handle53aOption },
        { id: "_420_of57a_advise_through_bank", handler: handle57aOption }
    ];
    
    optionHandlers.forEach(config => {
        const element = document.getElementById(config.id);
        if (element) {
            element.addEventListener("change", config.handler);
            config.handler(); // Initialize on load
        }
    });
    
    // Setup Character Counters
    setupCharacterCounters();
    
    // Auto-uppercase for currency fields
    const currencyField = document.getElementById("_140_mf32b_currency");
    if (currencyField) {
        currencyField.addEventListener("input", function() {
            this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '');
        });
    }
    
    // Auto-uppercase and format for BIC fields
    const bicFields = [
        "_092_of52a_identifier_code",
        "_112_of51a_bic",
        "_171_mf41a_identifier_code",
        "_192_of42a_identifier_code",
        "_382_of58a_bic",
        "_392_of53a_bic",
        "_422_of57a_bic"
    ];
    
    bicFields.forEach(id => {
        const field = document.getElementById(id);
        if (field) {
            field.addEventListener("input", function() {
                this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '');
            });
        }
    });
    
    // Amount field handlers
    const amountField = document.getElementById("_141_mf32b_amount");
    if (amountField) {
        amountField.addEventListener("input", function() {
            formatAmountInput(this);
        });
        amountField.addEventListener("blur", function() {
            formatAmountBlur(this);
        });
    }
    
    // Tolerance fields: restrict to 2 digits
    ["_150_of39a_tolerance_plus", "_151_of39a_tolerance_minus"].forEach(id => {
        const el = document.getElementById(id);
        if (el) {
            el.addEventListener("input", function() {
                this.value = this.value.replace(/[^\d]/g, "").slice(0, 2);
            });
        }
    });
    
    // Date fields: limit manual typing to 6 digits
    ["_060_mf31c_date_of_issue", "_080_mf31d_date_of_expiry", "_280_of44c_latest_date_of_shipment"].forEach(id => {
        const el = document.getElementById(id);
        if (el) {
            el.addEventListener("input", function() {
                this.value = this.value.replace(/[^\d]/g, "").slice(0, 6);
            });
        }
    });
    
    // Field 27: Number and Total - restrict to 1 digit
    const numberField = document.getElementById("_010_mf27_number");
    const totalField = document.getElementById("_011_mf27_total");
    if (numberField) {
        numberField.addEventListener("input", function() {
            this.value = this.value.replace(/[^\d]/g, "").slice(0, 1);
        });
    }
    if (totalField) {
        totalField.addEventListener("input", function() {
            this.value = this.value.replace(/[^\d]/g, "").slice(0, 1);
        });
    }
    
    // Field 48: Days - restrict to 3 digits
    const daysField = document.getElementById("_360_of48_days");
    if (daysField) {
        daysField.addEventListener("input", function() {
            this.value = this.value.replace(/[^\d]/g, "").slice(0, 3);
        });
    }
    
    console.log('MT710 form initialized successfully');
});

/* ========== Export functions for external use ========== */
window.validateMT710 = validateMT710;
window.validateRuleC1 = validateRuleC1;
window.validateRuleC2 = validateRuleC2;
window.validateRuleC3 = validateRuleC3;
window.validateRuleC4 = validateRuleC4;
window.numbersonly = numbersonly;
window.numbersonly2 = numbersonly2;
window.textonly = textonly;
window.avoidSplChars = avoidSplChars;
window.cek_koma = cek_koma;
window.cek_slash = cek_slash;
window.cek_slash_account = cek_slash_account;
window.getFieldValue = getFieldValue;
window.isFieldEmpty = isFieldEmpty;