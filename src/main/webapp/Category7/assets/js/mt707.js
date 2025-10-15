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

// Avoid special characters for structured text - SWIFT 65z format
function avoidSplCharsNarrative(e) {
    e = e || window.event;
    // 65z format: A-Z, 0-9, space, . / , - ( ) ? : ' +
    let allowed = /^[A-Z0-9\s\.\/\,\-\(\)\?\:\'\+]$/;
    let key = String.fromCharCode(e.keyCode || e.which);
    
    // Allow control keys
    if (e.keyCode === 8 || e.keyCode === 9 || e.keyCode === 13 || 
        e.keyCode === 46 || (e.keyCode >= 37 && e.keyCode <= 40)) {
        return true;
    }
    
    if (e.which !== 0 && e.charCode !== 0 && !allowed.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) e.preventDefault();
        return false;
    }
    return true;
}

// Convert to uppercase on input
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

// Auto-add slash for party identifier fields
function cek_slash(obj) {
    if (obj.value && obj.value.length > 0 && !obj.value.startsWith("/")) {
        obj.value = "/" + obj.value;
    }
}

// Format amount on input
function formatAmountInput(el) {
    el.value = el.value.replace(/[^0-9,]/g, '');
}

// Format amount on blur
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

// Handle 52a - Issuing Bank
function handle52aOption() {
    const select = q("_050_of52a_issuing_bank");
    if (!select) return;
    
    const divA = q("div_050_of52a_A");
    const divD = q("div_050_of52a_D");
    
    if (divA) divA.style.display = (select.value === "A") ? "block" : "none";
    if (divD) divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_051_of52a_party_identifier", "_052_of52a_identifier_code"]);
    }
    if (select.value !== "D") {
        clearFieldValues(["_053_of52a_party_identifier", "_054_of52a_name_address"]);
    }
}

// Handle 40E - Applicable Rules
function handle40eOption() {
    const select = q("_130_of40e_applicable_rules");
    const narrativeDiv = q("div_130_of40e_narrative");
    
    if (!select || !narrativeDiv) return;
    
    if (select.value === "OTHR") {
        narrativeDiv.style.display = "block";
    } else {
        narrativeDiv.style.display = "none";
        const narrativeField = q("_131_of40e_narrative");
        if (narrativeField && select.value !== "") {
            narrativeField.value = "";
        }
    }
}

// Handle 41a - Available With ... By ...
function handle41aOption() {
    const select = q("_210_of41a_available_with_by");
    if (!select) return;
    
    const divA = q("div_210_of41a_A");
    const divD = q("div_210_of41a_D");
    
    if (divA) divA.style.display = (select.value === "A") ? "block" : "none";
    if (divD) divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_211_of41a_identifier_code"]);
    }
    if (select.value !== "D") {
        clearFieldValues(["_212_of41a_name_address"]);
    }
}

// Handle 42a - Drawee
function handle42aOption() {
    const select = q("_230_of42a_drawee");
    if (!select) return;
    
    const divA = q("div_230_of42a_A");
    const divD = q("div_230_of42a_D");
    
    if (divA) divA.style.display = (select.value === "A") ? "block" : "none";
    if (divD) divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_231_of42a_party_identifier", "_232_of42a_identifier_code"]);
    }
    if (select.value !== "D") {
        clearFieldValues(["_233_of42a_party_identifier", "_234_of42a_name_address"]);
    }
}

// Handle 71N - Amendment Charge Payable By
function handle71nOption() {
    const select = q("_400_of71n_charge_code");
    const narrativeDiv = q("div_400_of71n_narrative");
    
    if (!select || !narrativeDiv) return;
    
    if (select.value === "OTHR") {
        narrativeDiv.style.display = "block";
    } else {
        narrativeDiv.style.display = "none";
        const narrativeField = q("_401_of71n_narrative");
        if (narrativeField) {
            narrativeField.value = "";
        }
    }
}

// Handle 58a - Requested Confirmation Party
function handle58aOption() {
    const select = q("_430_of58a_requested_confirmation_party");
    if (!select) return;
    
    const divA = q("div_430_of58a_A");
    const divD = q("div_430_of58a_D");
    
    if (divA) divA.style.display = (select.value === "A") ? "block" : "none";
    if (divD) divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_431_of58a_party_identifier", "_432_of58a_identifier_code"]);
    }
    if (select.value !== "D") {
        clearFieldValues(["_433_of58a_party_identifier", "_434_of58a_name_address"]);
    }
}

// Handle 53a - Reimbursing Bank
function handle53aOption() {
    const select = q("_440_of53a_reimbursing_bank");
    if (!select) return;
    
    const divA = q("div_440_of53a_A");
    const divD = q("div_440_of53a_D");
    
    if (divA) divA.style.display = (select.value === "A") ? "block" : "none";
    if (divD) divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_441_of53a_party_identifier", "_442_of53a_identifier_code"]);
    }
    if (select.value !== "D") {
        clearFieldValues(["_443_of53a_party_identifier", "_444_of53a_name_address"]);
    }
}

// Handle 57a - Advise Through Bank
function handle57aOption() {
    const select = q("_460_of57a_advise_through_bank");
    if (!select) return;
    
    const divA = q("div_460_of57a_A");
    const divB = q("div_460_of57a_B");
    const divD = q("div_460_of57a_D");
    
    if (divA) divA.style.display = (select.value === "A") ? "block" : "none";
    if (divB) divB.style.display = (select.value === "B") ? "block" : "none";
    if (divD) divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_461_of57a_party_identifier", "_462_of57a_identifier_code"]);
    }
    if (select.value !== "B") {
        clearFieldValues(["_463_of57a_party_identifier", "_464_of57a_location"]);
    }
    if (select.value !== "D") {
        clearFieldValues(["_465_of57a_party_identifier", "_466_of57a_name_address"]);
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

/* ========== Character Counter ========== */
function setupCharacterCounters() {
    const largeTextAreas = [
        { id: '_340_of45b_description_of_goods_and_or_services', max: 6500, lines: 100 },
        { id: '_350_of46b_documents_required', max: 6500, lines: 100 },
        { id: '_360_of47b_additional_conditions', max: 6500, lines: 100 },
        { id: '_370_of49m_special_payment_conditions_for_beneficiary', max: 6500, lines: 100 },
        { id: '_380_of49n_special_payment_conditions_for_bank_only', max: 6500, lines: 100 }
    ];
    
    largeTextAreas.forEach(config => {
        const textarea = q(config.id);
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
        counterElement.style.fontWeight = 'bold';
    } else if (lineCount > (maxLines * 0.8) || charCount > (maxChars * 0.8)) {
        counterElement.style.color = 'orange';
        counterElement.style.fontWeight = 'normal';
    } else {
        counterElement.style.color = 'green';
        counterElement.style.fontWeight = 'normal';
    }
}

/* ========== Structured Text Helper ========== */
function setupStructuredTextAutoComplete(textareaId) {
    const textarea = q(textareaId);
    if (!textarea) return;
    
    let suggestionBox = null;
    
    function createSuggestionBox() {
        if (suggestionBox) return suggestionBox;
        
        suggestionBox = document.createElement('div');
        suggestionBox.id = 'suggestion_' + textareaId;
        suggestionBox.style.position = 'absolute';
        suggestionBox.style.backgroundColor = '#f9f9f9';
        suggestionBox.style.border = '1px solid #ccc';
        suggestionBox.style.borderRadius = '4px';
        suggestionBox.style.padding = '5px';
        suggestionBox.style.display = 'none';
        suggestionBox.style.zIndex = '1000';
        suggestionBox.style.fontSize = '11pt';
        suggestionBox.style.boxShadow = '0 2px 8px rgba(0,0,0,0.15)';
        suggestionBox.style.maxWidth = '300px';
        
        textarea.parentElement.style.position = 'relative';
        textarea.parentElement.appendChild(suggestionBox);
        
        return suggestionBox;
    }
    
    function showSuggestions(suggestions, cursorPos) {
        const box = createSuggestionBox();
        box.innerHTML = '';
        
        suggestions.forEach(item => {
            const div = document.createElement('div');
            div.style.padding = '5px 10px';
            div.style.cursor = 'pointer';
            div.style.borderRadius = '3px';
            div.innerHTML = `<strong>${item.code}</strong> - ${item.desc}`;
            
            div.onmouseover = function() {
                this.style.backgroundColor = '#e0e0e0';
            };
            div.onmouseout = function() {
                this.style.backgroundColor = 'transparent';
            };
            
            div.onclick = function() {
                insertStructuredCode(textarea, item.code, cursorPos);
                box.style.display = 'none';
            };
            
            box.appendChild(div);
        });
        
        const rect = textarea.getBoundingClientRect();
        box.style.top = (textarea.offsetTop + 25) + 'px';
        box.style.left = textarea.offsetLeft + 'px';
        box.style.display = 'block';
    }
    
    function hideSuggestions() {
        if (suggestionBox) {
            suggestionBox.style.display = 'none';
        }
    }
    
    function insertStructuredCode(field, code, slashPos) {
        const text = field.value;
        const before = text.substring(0, slashPos);
        const after = text.substring(field.selectionStart);
        
        field.value = before + '/' + code + '/ ' + after;
        
        const newPos = before.length + code.length + 3;
        field.selectionStart = field.selectionEnd = newPos;
        field.focus();
    }
    
    textarea.addEventListener('input', function(e) {
        const cursorPos = this.selectionStart;
        const text = this.value;
        
        if (cursorPos > 0 && text[cursorPos - 1] === '/') {
            const beforeCursor = text.substring(0, cursorPos);
            const lines = beforeCursor.split('\n');
            const currentLine = lines[lines.length - 1];
            
            if (currentLine.trim() === '/') {
                const suggestions = [
                    { code: 'ADD', desc: 'Add text' },
                    { code: 'DELETE', desc: 'Delete text' },
                    { code: 'REPALL', desc: 'Replace all' }
                ];
                showSuggestions(suggestions, cursorPos - 1);
                return;
            }
        }
        
        if (cursorPos > 1) {
            const beforeCursor = text.substring(0, cursorPos);
            const lines = beforeCursor.split('\n');
            const currentLine = lines[lines.length - 1];
            
            const match = currentLine.match(/\/([A-Za-z]+)$/);
            if (match) {
                const typed = match[1].toUpperCase();
                const allCodes = [
                    { code: 'ADD', desc: 'Add text' },
                    { code: 'DELETE', desc: 'Delete text' },
                    { code: 'REPALL', desc: 'Replace all' }
                ];
                
                const filtered = allCodes.filter(item => 
                    item.code.startsWith(typed)
                );
                
                if (filtered.length > 0) {
                    const slashPos = cursorPos - typed.length - 1;
                    showSuggestions(filtered, slashPos);
                    return;
                }
            }
        }
        
        hideSuggestions();
    });
    
    textarea.addEventListener('blur', function() {
        setTimeout(hideSuggestions, 200);
    });
    
    textarea.addEventListener('keydown', function(e) {
        if (e.key === 'Escape' && suggestionBox && suggestionBox.style.display === 'block') {
            hideSuggestions();
            e.preventDefault();
        }
    });
}

/* ========== Validation Helpers ========== */

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

function isValidBIC(bic) {
    if (!bic) return false;
    if (bic.length !== 8 && bic.length !== 11) return false;
    return /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/.test(bic);
}

function isValidCurrency(ccy) {
    if (!ccy) return false;
    return /^[A-Z]{3}$/.test(ccy);
}

// Currency-specific decimal validation
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

function validateStructuredText(field, errorCodeType) {
    if (!field) return true;
    
    const value = field.value.trim();
    if (!value) return true;
    
    clearFieldError(field);
    let isValid = true;
    let errorMessages = [];
    
    const lines = value.split('\n');
    let hasCode = false;
    let repallCount = 0;
    let totalCodes = 0;
    let hasOtherCode = false;
    
    for (let i = 0; i < lines.length; i++) {
        const line = lines[i].trim();
        
        const codeMatch = line.match(/^\/([A-Z]+)\//);
        if (codeMatch) {
            hasCode = true;
            totalCodes++;
            const code = codeMatch[1];
            
            if (!['ADD', 'DELETE', 'REPALL'].includes(code)) {
                errorMessages.push(`Invalid code: /${code}/ at line ${i + 1}`);
                isValid = false;
            }
            
            if (code === 'REPALL') {
                repallCount++;
            } else {
                hasOtherCode = true;
            }
        }
    }
    
    if (!hasCode && value) {
        const errorCode = errorCodeType === 'T93' ? 'T93' : 'T67';
        errorMessages.push(`At least one code (ADD/DELETE/REPALL) must be used (Error ${errorCode})`);
        isValid = false;
    }
    
    if (repallCount > 0) {
        if (repallCount > 1) {
            errorMessages.push('REPALL can only be used once (Error D06)');
            isValid = false;
        }
        if (hasOtherCode) {
            errorMessages.push('REPALL cannot be used with other codes (Error D06)');
            isValid = false;
        }
    }
    
    if (!isValid) {
        showFieldError(field, errorMessages.join('; '));
    } else {
        field.classList.add('valid-border');
    }
    
    return isValid;
}

/* ========== Validation Functions ========== */

function getFieldValue(id) {
    return val(id);
}

function isFieldEmpty(id) {
    return isEmpty(getFieldValue(id));
}

// Field 27: Sequence of Total (T75)
function validateField27() {
    const number = parseInt(val("_010_mf27_number"));
    const total = parseInt(val("_011_mf27_total"));
    
    if (isNaN(number) || number < 1 || number > 8) {
        alert("Field 27 Number must be between 1-8 (Error T75)");
        q("_010_mf27_number").focus();
        return false;
    }
    
    if (isNaN(total) || total < 1 || total > 8) {
        alert("Field 27 Total must be between 1-8 (Error T75)");
        q("_011_mf27_total").focus();
        return false;
    }
    
    if (number > total) {
        alert("Field 27 Number cannot exceed Total");
        q("_010_mf27_number").focus();
        return false;
    }
    
    return true;
}

// Field 20, 21, 23: Reference fields (T26)
function validateReferenceFields() {
    const refFields = [
        { id: "_020_mf20_sender_reference", name: "Sender's Reference" },
        { id: "_030_mf21_receiver_reference", name: "Receiver's Reference" },
        { id: "_040_mf23_issuing_bank_reference", name: "Issuing Bank's Reference" }
    ];
    
    for (let config of refFields) {
        const value = val(config.id);
        if (value) {
            if (value.startsWith('/') || value.endsWith('/')) {
                alert(`${config.name} cannot start or end with "/" (Error T26)`);
                q(config.id).focus();
                return false;
            }
            if (value.includes('//')) {
                alert(`${config.name} cannot contain "//" (Error T26)`);
                q(config.id).focus();
                return false;
            }
        }
    }
    
    return true;
}

// Rule C1: At least one field must be present after field 22A
function validateRuleC1() {
    const optionalFields = [
        "_110_of23s_cancellation_request",
        "_120_of40a_form_of_documentary_credit",
        "_130_of40e_applicable_rules",
        "_140_of31d_date_of_expiry",
        "_150_of50_changed_applicant_details",
        "_160_of59_account",
        "_161_of59_name_address",
        "_170_of32b_currency",
        "_180_of33b_currency",
        "_190_of39a_plus",
        "_200_of39c_additional_amounts_covered",
        "_210_of41a_available_with_by",
        "_220_of42c_drafts_at",
        "_230_of42a_drawee",
        "_240_of42m_mixed_payment_details",
        "_250_of42p_negotiation_deferred_payment_details",
        "_260_of43p_partial_shipments",
        "_270_of43t_transhipment",
        "_280_of44a_place_taking_in_charge_dispatch_from_place_of_receipt",
        "_290_of44e_port_of_loading_airport_of_departure",
        "_300_of44f_port_of_discharge_airport_of_destination",
        "_310_of44b_place_of_final_destination_for_transportation_to_place_of_delivery",
        "_320_of44c_latest_date_of_shipment",
        "_330_of44d_shipment_period",
        "_340_of45b_description_of_goods_and_or_services",
        "_350_of46b_documents_required",
        "_360_of47b_additional_conditions",
        "_370_of49m_special_payment_conditions_for_beneficiary",
        "_380_of49n_special_payment_conditions_for_bank_only",
        "_390_of71d_charges",
        "_400_of71n_charge_code",
        "_410_of48_days",
        "_420_of49_confirmation_instructions",
        "_430_of58a_requested_confirmation_party",
        "_440_of53a_reimbursing_bank",
        "_450_of78_instructions_to_the_paying_accepting_negotiating_bank",
        "_460_of57a_advise_through_bank",
        "_470_of72z_sender_to_receiver_information"
    ];
    
    let hasAtLeastOne = false;
    for (let fieldId of optionalFields) {
        if (!isFieldEmpty(fieldId)) {
            hasAtLeastOne = true;
            break;
        }
    }
    
    if (!hasAtLeastOne) {
        alert("Error C30 (Rule C1): At least one field must be present after field 22A (Purpose of Message)");
        return false;
    }
    
    return true;
}

// Rule C2: Either field 32B or 33B may be present, but not both
function validateRuleC2() {
    const field32B_ccy = val("_170_of32b_currency");
    const field32B_amt = val("_171_of32b_amount");
    const field33B_ccy = val("_180_of33b_currency");
    const field33B_amt = val("_181_of33b_amount");
    
    const has32B = field32B_ccy || field32B_amt;
    const has33B = field33B_ccy || field33B_amt;
    
    if (has32B && has33B) {
        alert("Error C12 (Rule C2): Either field 32B (Increase) or 33B (Decrease) may be present, but not both");
        q("_170_of32b_currency").focus();
        return false;
    }
    
    return true;
}

// Rule C3: Either field 50B or 52a, but not both, must be present
function validateRuleC3() {
    const field50B = val("_060_of50b_non_bank_issuer");
    const field52a = val("_050_of52a_issuing_bank");
    
    if (!field50B && !field52a) {
        alert("Error C06 (Rule C3): Either field 50B (Non-Bank Issuer) or field 52a (Issuing Bank) must be present");
        q("_050_of52a_issuing_bank").focus();
        return false;
    }
    
    if (field50B && field52a) {
        alert("Error C06 (Rule C3): Both field 50B and 52a cannot be present at the same time");
        q("_050_of52a_issuing_bank").focus();
        return false;
    }
    
    return true;
}

// Rule C4: Either field 44C or 44D, but not both
function validateRuleC4() {
    const field44C = val("_320_of44c_latest_date_of_shipment");
    const field44D = val("_330_of44d_shipment_period");
    
    if (field44C && field44D) {
        alert("Error D06 (Rule C4): Either field 44C (Latest Date of Shipment) or 44D (Shipment Period) may be present, but not both");
        q("_320_of44c_latest_date_of_shipment").focus();
        return false;
    }
    
    return true;
}

// Validate Date Fields (T50)
function validateDateFields() {
    const dateFields = [
        { id: "_070_mf31c_date_of_issue", name: "Date of Issue" },
        { id: "_090_mf30_date_of_amendment", name: "Date of Amendment" },
        { id: "_140_of31d_date_of_expiry", name: "Date of Expiry" },
        { id: "_320_of44c_latest_date_of_shipment", name: "Latest Date of Shipment" }
    ];
    
    for (let config of dateFields) {
        const value = val(config.id);
        if (value && !isYYMMDD(value)) {
            alert(`Invalid ${config.name}. Must be valid date in YYMMDD format (Error T50)`);
            q(config.id).focus();
            return false;
        }
    }
    
    return true;
}

// Validate BIC Fields (T27, T28, T29)
function validateBICFields() {
    const bicConfigs = [
        { optionField: "_050_of52a_issuing_bank", bicField: "_052_of52a_identifier_code", name: "Issuing Bank" },
        { optionField: "_210_of41a_available_with_by", bicField: "_211_of41a_identifier_code", name: "Available With" },
        { optionField: "_230_of42a_drawee", bicField: "_232_of42a_identifier_code", name: "Drawee" },
        { optionField: "_430_of58a_requested_confirmation_party", bicField: "_432_of58a_identifier_code", name: "Requested Confirmation Party" },
        { optionField: "_440_of53a_reimbursing_bank", bicField: "_442_of53a_identifier_code", name: "Reimbursing Bank" },
        { optionField: "_460_of57a_advise_through_bank", bicField: "_462_of57a_identifier_code", name: "Advise Through Bank" }
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
    
    return true;
}

// Validate Currency and Amount Fields (T52, T40, T43, C03)
function validateCurrencyAmount() {
    // Field 32B - Increase
    const ccy32B = val("_170_of32b_currency").toUpperCase();
    const amt32B = val("_171_of32b_amount");
    
    if (ccy32B || amt32B) {
        if (ccy32B && !isValidCurrency(ccy32B)) {
            alert("Field 32B: Invalid Currency Code. Must be 3 letters (Error T52)");
            q("_170_of32b_currency").focus();
            return false;
        }
        
        if (amt32B) {
            const result = validateAmountByCurrency(ccy32B, amt32B);
            if (!result.valid) {
                alert("Field 32B: " + result.error);
                q("_171_of32b_amount").focus();
                return false;
            }
        }
        
        if ((ccy32B && !amt32B) || (!ccy32B && amt32B)) {
            alert("Field 32B: Both Currency and Amount must be provided together");
            q("_170_of32b_currency").focus();
            return false;
        }
    }
    
    // Field 33B - Decrease
    const ccy33B = val("_180_of33b_currency").toUpperCase();
    const amt33B = val("_181_of33b_amount");
    
    if (ccy33B || amt33B) {
        if (ccy33B && !isValidCurrency(ccy33B)) {
            alert("Field 33B: Invalid Currency Code. Must be 3 letters (Error T52)");
            q("_180_of33b_currency").focus();
            return false;
        }
        
        if (amt33B) {
            const result = validateAmountByCurrency(ccy33B, amt33B);
            if (!result.valid) {
                alert("Field 33B: " + result.error);
                q("_181_of33b_amount").focus();
                return false;
            }
        }
        
        if ((ccy33B && !amt33B) || (!ccy33B && amt33B)) {
            alert("Field 33B: Both Currency and Amount must be provided together");
            q("_180_of33b_currency").focus();
            return false;
        }
    }
    
    return true;
}

// Validate Field 40E - Applicable Rules (D81)
function validateField40E() {
    const code = val("_130_of40e_applicable_rules");
    const narrative = val("_131_of40e_narrative");
    
    if (code) {
        const allowedCodes = ["UCP LATEST VERSION", "UCPURR LATEST VERSION", "EUCP LATEST VERSION", "EUCPURR LATEST VERSION", "OTHR"];
        
        if (!allowedCodes.includes(code)) {
            alert("Field 40E must be one of: " + allowedCodes.join(", ") + " (Error T59)");
            q("_130_of40e_applicable_rules").focus();
            return false;
        }
        
        if (code === "OTHR" && !narrative) {
            alert("Field 40E Narrative is required when Applicable Rules is OTHR (Error D81)");
            q("_131_of40e_narrative").focus();
            return false;
        }
        
        if (code !== "OTHR" && narrative) {
            alert("Field 40E Narrative is only allowed when Applicable Rules is OTHR (Error D81)");
            q("_131_of40e_narrative").focus();
            return false;
        }
    }
    
    return true;
}

// Validate Field 22A - Purpose of Message (T36)
function validateField22A() {
    const value = val("_100_mf22a_purpose_of_message");
    const allowed = ["ACNF", "ADVI", "ISSU"];
    
    if (!allowed.includes(value)) {
        alert("Field 22A must be ACNF, ADVI, or ISSU (Error T36)");
        q("_100_mf22a_purpose_of_message").focus();
        return false;
    }
    
    return true;
}

// Validate Field 41a - Available With ... By ... (T68)
function validateField41a() {
    const option = val("_210_of41a_available_with_by");
    const byCode = val("_213_of41a_code");
    
    if (option) {
        const allowed = ["BY ACCEPTANCE", "BY DEF PAYMENT", "BY MIXED PYMT", "BY NEGOTIATION", "BY PAYMENT"];
        
        if (!byCode) {
            alert("Field 41a 'By' code is required when Available With is specified");
            q("_213_of41a_code").focus();
            return false;
        }
        
        if (!allowed.includes(byCode)) {
            alert("Field 41a 'By' must be one of: " + allowed.join(", ") + " (Error T68)");
            q("_213_of41a_code").focus();
            return false;
        }
        
        if (option === "A") {
            const bic = val("_211_of41a_identifier_code");
            if (!bic) {
                alert("Field 41a Option A requires Identifier Code (BIC)");
                q("_211_of41a_identifier_code").focus();
                return false;
            }
        } else if (option === "D") {
            const nameAddr = val("_212_of41a_name_address");
            if (!nameAddr) {
                alert("Field 41a Option D requires Name & Address");
                q("_212_of41a_name_address").focus();
                return false;
            }
        }
    }
    
    return true;
}

// Validate Field 43P/43T - Partial Shipments/Transhipment (T64, T65)
function validateField43() {
    const field43P = val("_260_of43p_partial_shipments");
    const field43T = val("_270_of43t_transhipment");
    const allowed = ["ALLOWED", "CONDITIONAL", "NOT ALLOWED"];
    
    if (field43P && !allowed.includes(field43P)) {
        alert("Field 43P must be ALLOWED, CONDITIONAL, or NOT ALLOWED (Error T64)");
        q("_260_of43p_partial_shipments").focus();
        return false;
    }
    
    if (field43T && !allowed.includes(field43T)) {
        alert("Field 43T must be ALLOWED, CONDITIONAL, or NOT ALLOWED (Error T65)");
        q("_270_of43t_transhipment").focus();
        return false;
    }
    
    return true;
}

// Validate Field 49 - Confirmation Instructions (T67)
function validateField49() {
    const value = val("_420_of49_confirmation_instructions");
    
    if (value) {
        const allowed = ["CONFIRM", "MAY ADD", "WITHOUT"];
        
        if (!allowed.includes(value)) {
            alert("Field 49 must be CONFIRM, MAY ADD, or WITHOUT (Error T67)");
            q("_420_of49_confirmation_instructions").focus();
            return false;
        }
        
        // Field 58a required if 49 = CONFIRM or MAY ADD
        if ((value === "CONFIRM" || value === "MAY ADD")) {
            const field58aOption = val("_430_of58a_requested_confirmation_party");
            if (!field58aOption) {
                alert("Field 58a (Requested Confirmation Party) must be present when Confirmation Instructions is CONFIRM or MAY ADD");
                q("_430_of58a_requested_confirmation_party").focus();
                return false;
            }
        }
    }
    
    return true;
}

// Validate Field 71N - Amendment Charge Payable By (T67)
function validateField71N() {
    const code = val("_400_of71n_charge_code");
    const narrative = val("_401_of71n_narrative");
    
    if (code) {
        const allowed = ["APPL", "BENE", "OTHR"];
        
        if (!allowed.includes(code)) {
            alert("Field 71N must be APPL, BENE, or OTHR (Error T67)");
            q("_400_of71n_charge_code").focus();
            return false;
        }
        
        if (code === "OTHR" && !narrative) {
            alert("Field 71N Narrative is required when code is OTHR");
            q("_401_of71n_narrative").focus();
            return false;
        }
        
        if (code !== "OTHR" && narrative) {
            alert("Field 71N Narrative is only allowed when code is OTHR");
            q("_401_of71n_narrative").focus();
            return false;
        }
    }
    
    return true;
}

// Validate Structured Text Fields (T67, T93, D06)
function validateStructuredTextFields() {
    const structuredFields = [
        { id: '_340_of45b_description_of_goods_and_or_services', name: 'Description of Goods', errorType: 'T67' },
        { id: '_350_of46b_documents_required', name: 'Documents Required', errorType: 'T93' },
        { id: '_360_of47b_additional_conditions', name: 'Additional Conditions', errorType: 'T67' },
        { id: '_370_of49m_special_payment_conditions_for_beneficiary', name: 'Special Payment Conditions for Beneficiary', errorType: 'T93' },
        { id: '_380_of49n_special_payment_conditions_for_bank_only', name: 'Special Payment Conditions for Bank Only', errorType: 'T67' }
    ];
    
    for (let config of structuredFields) {
        const field = q(config.id);
        if (field && field.value.trim()) {
            if (!validateStructuredText(field, config.errorType)) {
                alert(`Invalid ${config.name}. Please check structured text format.`);
                field.focus();
                return false;
            }
        }
    }
    
    return true;
}

// Validate Percentage Fields (39A)
function validatePercentageFields() {
    const plus = val("_190_of39a_plus");
    const minus = val("_191_of39a_minus");
    
    if (plus) {
        const num = parseInt(plus);
        if (isNaN(num) || num < 0 || num > 99) {
            alert("Field 39A Plus % must be 0-99");
            q("_190_of39a_plus").focus();
            return false;
        }
    }
    
    if (minus) {
        const num = parseInt(minus);
        if (isNaN(num) || num < 0 || num > 99) {
            alert("Field 39A Minus % must be 0-99");
            q("_191_of39a_minus").focus();
            return false;
        }
    }
    
    return true;
}

/* ========== Main Validation Function ========== */
function validateMT707() {
    console.log('Starting MT707 validation...');
    
    // 1. Mandatory Fields
    const mandatoryFields = [
        { id: "_010_mf27_number", name: "MF27 Number" },
        { id: "_011_mf27_total", name: "MF27 Total" },
        { id: "_020_mf20_sender_reference", name: "MF20 Sender's Reference" },
        { id: "_030_mf21_receiver_reference", name: "MF21 Receiver's Reference" },
        { id: "_040_mf23_issuing_bank_reference", name: "MF23 Issuing Bank's Reference" },
        { id: "_070_mf31c_date_of_issue", name: "MF31C Date of Issue" },
        { id: "_080_mf26e_number_of_amendment", name: "MF26E Number of Amendment" },
        { id: "_090_mf30_date_of_amendment", name: "MF30 Date of Amendment" },
        { id: "_100_mf22a_purpose_of_message", name: "MF22A Purpose of Message" }
    ];
    
    let errors = [];
    mandatoryFields.forEach(field => {
        if (isFieldEmpty(field.id)) {
            errors.push(field.name);
        }
    });
    
    if (errors.length > 0) {
        alert("Please fill all mandatory fields:\n\n" + errors.join("\n"));
        q(errors[0]).focus();
        return false;
    }
    
    // 2. Field 27 - Sequence of Total (T75)
    if (!validateField27()) return false;
    
    // 3. Reference Fields (T26)
    if (!validateReferenceFields()) return false;
    
    // 4. Field 22A - Purpose of Message (T36)
    if (!validateField22A()) return false;
    
    // 5. Date Fields (T50)
    if (!validateDateFields()) return false;
    
    // 6. Field 40E - Applicable Rules (D81)
    if (!validateField40E()) return false;
    
    // 7. BIC Fields (T27, T28, T29)
    if (!validateBICFields()) return false;
    
    // 8. Currency and Amount (T52, T40, T43, C03)
    if (!validateCurrencyAmount()) return false;
    
    // 9. Percentage Fields (39A)
    if (!validatePercentageFields()) return false;
    
    // 10. Field 41a - Available With ... By ... (T68)
    if (!validateField41a()) return false;
    
    // 11. Field 43P/43T (T64, T65)
    if (!validateField43()) return false;
    
    // 12. Field 49 - Confirmation Instructions (T67)
    if (!validateField49()) return false;
    
    // 13. Field 71N - Amendment Charge Payable By (T67)
    if (!validateField71N()) return false;
    
    // 14. Structured Text Fields (T67, T93, D06)
    if (!validateStructuredTextFields()) return false;
    
    // 15. Network Validated Rules
    if (!validateRuleC1()) return false;
    if (!validateRuleC2()) return false;
    if (!validateRuleC3()) return false;
    if (!validateRuleC4()) return false;
    
    console.log('MT707 validation completed successfully');
    return true;
}

/* ========== Setup Real-time Validations ========== */
function setupRealtimeValidations() {
    // Field 27 - Sequence validation
    const fields27 = ["_010_mf27_number", "_011_mf27_total"];
    fields27.forEach(id => {
        const el = q(id);
        if (el) {
            el.addEventListener('keypress', numbersonly);
            el.addEventListener('input', function() {
                this.value = this.value.replace(/[^\d]/g, '').slice(0, 1);
            });
        }
    });
    
    // Reference fields - uppercase
    const refFields = ["_020_mf20_sender_reference", "_030_mf21_receiver_reference", "_040_mf23_issuing_bank_reference"];
    refFields.forEach(id => {
        const el = q(id);
        if (el) {
            el.addEventListener('blur', function() { setUpper(id); });
            el.addEventListener('keypress', avoidSplChars);
        }
    });
    
    // Date fields
    const dateFields = ["_070_mf31c_date_of_issue", "_090_mf30_date_of_amendment", "_140_of31d_date_of_expiry", "_320_of44c_latest_date_of_shipment"];
    dateFields.forEach(id => {
        const el = q(id);
        if (el) {
            el.addEventListener('keypress', numbersonly);
            el.addEventListener('input', function() {
                this.value = this.value.replace(/[^\d]/g, '').slice(0, 6);
            });
            attachDatePicker(id);
        }
    });
    
    // Currency fields - auto uppercase
    const currencyFields = ["_170_of32b_currency", "_180_of33b_currency"];
    currencyFields.forEach(id => {
        const el = q(id);
        if (el) {
            el.addEventListener('input', function() {
                this.value = this.value.toUpperCase().replace(/[^A-Z]/g, '').slice(0, 3);
            });
        }
    });
    
    // Amount fields
    const amountFields = ["_171_of32b_amount", "_181_of33b_amount"];
    amountFields.forEach(id => {
        const el = q(id);
        if (el) {
            el.addEventListener('input', function() { formatAmountInput(this); });
            el.addEventListener('blur', function() { formatAmountBlur(this); });
        }
    });
    
    // BIC fields - auto uppercase
    const bicFields = [
        "_052_of52a_identifier_code",
        "_211_of41a_identifier_code",
        "_232_of42a_identifier_code",
        "_432_of58a_identifier_code",
        "_442_of53a_identifier_code",
        "_462_of57a_identifier_code"
    ];
    bicFields.forEach(id => {
        const el = q(id);
        if (el) {
            el.addEventListener('input', function() {
                this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '');
            });
        }
    });
    
    // Percentage fields
    const pctFields = ["_190_of39a_plus", "_191_of39a_minus"];
    pctFields.forEach(id => {
        const el = q(id);
        if (el) {
            el.addEventListener('keypress', numbersonly);
            el.addEventListener('input', function() {
                this.value = this.value.replace(/[^\d]/g, '').slice(0, 2);
            });
        }
    });
    
    // Structured text fields - uppercase
    const structuredFields = [
        '_340_of45b_description_of_goods_and_or_services',
        '_350_of46b_documents_required',
        '_360_of47b_additional_conditions',
        '_370_of49m_special_payment_conditions_for_beneficiary',
        '_380_of49n_special_payment_conditions_for_bank_only'
    ];
    structuredFields.forEach(id => {
        const el = q(id);
        if (el) {
            convertToUppercase(el);
            el.addEventListener('keypress', avoidSplCharsNarrative);
        }
    });
}

/* ========== Initialize on Page Load ========== */
document.addEventListener("DOMContentLoaded", function() {
    console.log('Initializing MT707 form...');
    
    // Setup tab navigation
    setupTabNavigation();
    
    // Setup option handlers
    const optionHandlers = [
        { id: "_050_of52a_issuing_bank", handler: handle52aOption },
        { id: "_130_of40e_applicable_rules", handler: handle40eOption },
        { id: "_210_of41a_available_with_by", handler: handle41aOption },
        { id: "_230_of42a_drawee", handler: handle42aOption },
        { id: "_400_of71n_charge_code", handler: handle71nOption },
        { id: "_430_of58a_requested_confirmation_party", handler: handle58aOption },
        { id: "_440_of53a_reimbursing_bank", handler: handle53aOption },
        { id: "_460_of57a_advise_through_bank", handler: handle57aOption }
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
    
    // Setup structured text auto-complete
    const structuredFields = [
        '_340_of45b_description_of_goods_and_or_services',
        '_350_of46b_documents_required',
        '_360_of47b_additional_conditions',
        '_370_of49m_special_payment_conditions_for_beneficiary',
        '_380_of49n_special_payment_conditions_for_bank_only'
    ];
    structuredFields.forEach(id => setupStructuredTextAutoComplete(id));
    
    console.log('MT707 form initialized successfully');
});

/* ========== Export functions for external use ========== */
window.validateMT707 = validateMT707;
window.getFieldValue = getFieldValue;
window.isFieldEmpty = isFieldEmpty;
window.numbersonly = numbersonly;
window.textonly = textonly;
window.avoidSplChars = avoidSplChars;
window.cek_slash = cek_slash;
