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
// Allowed: UPPERCASE letters, digits, space, and ./,-()?:'+
function avoidSplCharsNarrative(e) {
    e = e || window.event;
    // 65z format: A-Z, 0-9, space, . / , - ( ) ? : ' +
    let allowed = /^[A-Z0-9\s\.\/\,\-\(\)\?\:\'\+]$/;
    let key = String.fromCharCode(e.keyCode || e.which);
    
    // Allow control keys (backspace, delete, arrows, etc.)
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

// Convert to uppercase on input for narrative fields
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

/* ========== Structured Text Auto-Complete ========== */

// Auto-complete for structured text codes
function setupStructuredTextAutoComplete(textareaId) {
    const textarea = q(textareaId);
    if (!textarea) return;
    
    let suggestionBox = null;
    
    // Create suggestion box
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
    
    // Show suggestions
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
        
        // Position suggestion box
        const rect = textarea.getBoundingClientRect();
        box.style.top = (textarea.offsetTop + 25) + 'px';
        box.style.left = textarea.offsetLeft + 'px';
        box.style.display = 'block';
    }
    
    // Hide suggestions
    function hideSuggestions() {
        if (suggestionBox) {
            suggestionBox.style.display = 'none';
        }
    }
    
    // Insert structured code
    function insertStructuredCode(field, code, slashPos) {
        const text = field.value;
        const before = text.substring(0, slashPos);
        const after = text.substring(field.selectionStart);
        
        field.value = before + '/' + code + '/ ' + after;
        
        // Move cursor after the inserted code
        const newPos = before.length + code.length + 3;
        field.selectionStart = field.selectionEnd = newPos;
        field.focus();
    }
    
    // Handle input for auto-complete
    textarea.addEventListener('input', function(e) {
        const cursorPos = this.selectionStart;
        const text = this.value;
        
        // Check if user just typed "/" at beginning of line or after newline
        if (cursorPos > 0 && text[cursorPos - 1] === '/') {
            const beforeCursor = text.substring(0, cursorPos);
            const lines = beforeCursor.split('\n');
            const currentLine = lines[lines.length - 1];
            
            // Only show if "/" is at start of line
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
        
        // Check if user is typing after "/"
        if (cursorPos > 1) {
            const beforeCursor = text.substring(0, cursorPos);
            const lines = beforeCursor.split('\n');
            const currentLine = lines[lines.length - 1];
            
            // Match pattern: / followed by letters
            const match = currentLine.match(/\/([A-Za-z]+)$/);
            if (match) {
                const typed = match[1].toUpperCase();
                const allCodes = [
                    { code: 'ADD', desc: 'Add text' },
                    { code: 'DELETE', desc: 'Delete text' },
                    { code: 'REPALL', desc: 'Replace all' }
                ];
                
                // Filter suggestions based on what user typed
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
    
    // Hide suggestions on blur
    textarea.addEventListener('blur', function() {
        setTimeout(hideSuggestions, 200); 
    });
    
    // Hide suggestions on Escape key
    textarea.addEventListener('keydown', function(e) {
        if (e.key === 'Escape' && suggestionBox && suggestionBox.style.display === 'block') {
            hideSuggestions();
            e.preventDefault();
        }
    });
}

/* ========== Character Counter for Large Text Areas ========== */
function setupCharacterCounters() {
    const largeTextAreas = [
        { id: '_070_of45b_description_of_goods_and_or_services', max: 6500, lines: 100 },
        { id: '_080_of46b_documents_required', max: 6500, lines: 100 },
        { id: '_090_of47b_additional_conditions', max: 6500, lines: 100 },
        { id: '_100_of49m_special_payment_conditions_for_beneficiary', max: 6500, lines: 100 },
        { id: '_110_of49n_special_payment_conditions_for_bank_only', max: 6500, lines: 100 }
    ];
    
    largeTextAreas.forEach(config => {
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
                updateCharCounter(this, counter, config.max, config.lines);
            });
            
            // Initialize counter
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
    
    // Color coding
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

/* ========== Structured Text Validation Functions ========== */

// Validate structured text format (T67, T93, D06)
function validateStructuredText(field, errorCodeType) {
    if (!field) return true;
    
    const value = field.value.trim();
    if (!value) return true; // Optional field
    
    clearFieldError(field);
    let isValid = true;
    let errorMessages = [];
    
    // Split into lines
    const lines = value.split('\n');
    let hasCode = false;
    let repallCount = 0;
    let totalCodes = 0;
    let hasOtherCode = false;
    
    // Check each line for codes
    for (let i = 0; i < lines.length; i++) {
        const line = lines[i].trim();
        
        // Check if line starts with a code
        const codeMatch = line.match(/^\/([A-Z]+)\//);
        if (codeMatch) {
            hasCode = true;
            totalCodes++;
            const code = codeMatch[1];
            
            // Valid codes: ADD, DELETE, REPALL
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
    
    // T67 or T93: At least one code must be used
    if (!hasCode) {
        const errorCode = errorCodeType === 'T93' ? 'T93' : 'T67';
        errorMessages.push(`At least one code (ADD/DELETE/REPALL) must be used (Error ${errorCode})`);
        isValid = false;
    }
    
    // D06: If REPALL is used, it must be used only once and no other code
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

/* ========== Real-time Field Validations ========== */

// Validate Field 27 - Sequence of Total (T75)
function validateField27Realtime() {
    const numberField = q("_010_mf27_number");
    const totalField = q("_011_mf27_total");
    
    if (!numberField || !totalField) return;
    
    const number = parseInt(numberField.value);
    const total = parseInt(totalField.value);
    
    // Clear previous errors
    clearFieldError(numberField);
    clearFieldError(totalField);
    
    let isValid = true;
    
    // T75: Number must be in range 2-8 (MT708 starts from 2)
    if (number < 2 || number > 8) {
        showFieldError(numberField, "Number must be 2-8 for MT708 (Error T75)");
        isValid = false;
    }
    
    // T75: Total must be in range 2-8
    if (total < 2 || total > 8) {
        showFieldError(totalField, "Total must be 2-8 (Error T75)");
        isValid = false;
    }
    
    // Number must not exceed Total
    if (number > total) {
        showFieldError(numberField, "Number cannot exceed Total");
        isValid = false;
    }
    
    if (isValid) {
        numberField.classList.add('valid-border');
        totalField.classList.add('valid-border');
    }
}

// Validate Field 20, 21, 23 - Reference fields (T26)
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

// Show field error
function showFieldError(field, message) {
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
    field.classList.remove('error-border');
    
    const existingError = field.parentElement.querySelector('.inline-error');
    if (existingError) {
        existingError.remove();
    }
}

/* ========== Setup Real-time Validations ========== */
function setupRealtimeValidations() {
    // Field 27 - Sequence of Total
    const numberField = q("_010_mf27_number");
    const totalField = q("_011_mf27_total");
    if (numberField && totalField) {
        numberField.addEventListener('blur', validateField27Realtime);
        totalField.addEventListener('blur', validateField27Realtime);
        numberField.addEventListener('keypress', numbersonly);
        totalField.addEventListener('keypress', numbersonly);
        
        // Restrict input to 1 digit only
        numberField.addEventListener('input', function() {
            this.value = this.value.replace(/[^\d]/g, '').slice(0, 1);
        });
        totalField.addEventListener('input', function() {
            this.value = this.value.replace(/[^\d]/g, '').slice(0, 1);
        });
    }
    
    // Field 20 - Sender's Reference
    const field20 = q("_020_mf20_sender_reference");
    if (field20) {
        field20.addEventListener('blur', function() { 
            validateReferenceField(this);
            setUpper(this.id);
        });
        field20.addEventListener('keypress', avoidSplChars);
    }
    
    // Field 21 - Receiver's Reference
    const field21 = q("_030_mf21_receiver_reference");
    if (field21) {
        field21.addEventListener('blur', function() { 
            validateReferenceField(this);
            setUpper(this.id);
        });
        field21.addEventListener('keypress', avoidSplChars);
    }
    
    // Field 23 - Issuing Bank's Reference
    const field23 = q("_040_mf23_issuing_bank_reference");
    if (field23) {
        field23.addEventListener('blur', function() { 
            validateReferenceField(this);
        });
        field23.addEventListener('keypress', avoidSplChars);
    }
    
    // Field 26E - Number of Amendment (3 digits only)
    const field26e = q("_050_mf26e_number_of_amendment");
    if (field26e) {
        field26e.addEventListener('keypress', numbersonly);
        field26e.addEventListener('input', function() {
            this.value = this.value.replace(/[^\d]/g, '').slice(0, 3);
        });
    }
    
    // Field 30 - Date of Amendment
    const field30 = q("_060_mf30_date_of_amendment");
    if (field30) {
        field30.addEventListener('blur', function() { validateDateFormat(this); });
        field30.addEventListener('keypress', numbersonly);
        field30.addEventListener('input', function() {
            this.value = this.value.replace(/[^\d]/g, '').slice(0, 6);
        });
    }
    
    // Structured Text Fields - Add validation on blur
    const structuredFields = [
        { id: '_070_of45b_description_of_goods_and_or_services', errorType: 'T67' },
        { id: '_080_of46b_documents_required', errorType: 'T93' },
        { id: '_090_of47b_additional_conditions', errorType: 'T67' },
        { id: '_100_of49m_special_payment_conditions_for_beneficiary', errorType: 'T93' },
        { id: '_110_of49n_special_payment_conditions_for_bank_only', errorType: 'T67' }
    ];
    
    structuredFields.forEach(config => {
        const field = q(config.id);
        if (field) {
            field.addEventListener('blur', function() {
                // Only validate if field has content
                if (this.value.trim()) {
                    validateStructuredText(this, config.errorType);
                }
            });
            // Convert to uppercase
            convertToUppercase(field);
        }
    });
}

/* ========== Initialize Structured Text Fields ========== */
function setupStructuredTextFields() {
    const structuredFields = [
        '_070_of45b_description_of_goods_and_or_services',
        '_080_of46b_documents_required',
        '_090_of47b_additional_conditions',
        '_100_of49m_special_payment_conditions_for_beneficiary',
        '_110_of49n_special_payment_conditions_for_bank_only'
    ];
    
    structuredFields.forEach(id => {
        setupStructuredTextAutoComplete(id);
        
        // Add keypress handler for narrative fields
        const field = q(id);
        if (field) {
            field.addEventListener('keypress', avoidSplCharsNarrative);
        }
    });
}

/* ========== Initialize on Page Load ========== */
document.addEventListener("DOMContentLoaded", function() {
    console.log('Initializing MT708 form...');
    
    // Setup tab navigation
    setupTabNavigation();
    
    // Attach jQuery datepicker to date field
    attachDatePicker("_060_mf30_date_of_amendment");
    
    // Setup Real-time Validations
    setupRealtimeValidations();
    
    // Setup Character Counters
    setupCharacterCounters();
    
    // Setup Structured Text Fields with helper buttons
    setupStructuredTextFields();
    
    console.log('MT708 form initialized successfully');
});

/* ========== Validation Helper Functions (for validate_rule_mt708.jsp) ========== */

// Get field value
function getFieldValue(id) {
    return val(id);
}

// Check if field is empty
function isFieldEmpty(id) {
    return isEmpty(getFieldValue(id));
}

// Validate mandatory fields
function validateMandatoryFields() {
    const mandatoryFields = [
        { id: "_010_mf27_number", name: "MF27 Number" },
        { id: "_011_mf27_total", name: "MF27 Total" },
        { id: "_020_mf20_sender_reference", name: "MF20 Sender's Reference" },
        { id: "_030_mf21_receiver_reference", name: "MF21 Receiver's Reference" },
        { id: "_040_mf23_issuing_bank_reference", name: "MF23 Issuing Bank's Reference" },
        { id: "_050_mf26e_number_of_amendment", name: "MF26E Number of Amendment" },
        { id: "_060_mf30_date_of_amendment", name: "MF30 Date of Amendment" }
    ];
    
    let errors = [];
    
    mandatoryFields.forEach(field => {
        if (isFieldEmpty(field.id)) {
            errors.push(field.name + " is required");
            const element = q(field.id);
            if (element) {
                showFieldError(element, "This field is required");
            }
        }
    });
    
    if (errors.length > 0) {
        alert("Please fill all mandatory fields:\n\n" + errors.join("\n"));
        return false;
    }
    
    return true;
}

/* ========== Main Validation Function (called from form onsubmit) ========== */
function validateMT708() {
    console.log('Starting MT708 validation...');
    
    // 1. Validate mandatory fields
    if (!validateMandatoryFields()) {
        console.log('Mandatory fields validation failed');
        return false;
    }
    
    // 2. Validate Field 27 (T75)
    const numberField = q("_010_mf27_number");
    const totalField = q("_011_mf27_total");
    if (numberField && totalField) {
        const number = parseInt(numberField.value);
        const total = parseInt(totalField.value);
        
        if (number < 2 || number > 8) {
            alert("Field 27 Number must be between 2-8 for MT708 (Error T75)");
            numberField.focus();
            return false;
        }
        
        if (total < 2 || total > 8) {
            alert("Field 27 Total must be between 2-8 (Error T75)");
            totalField.focus();
            return false;
        }
        
        if (number > total) {
            alert("Field 27 Number cannot exceed Total");
            numberField.focus();
            return false;
        }
    }
    
    // 3. Validate Reference Fields (T26)
    const referenceFields = [
        { id: "_020_mf20_sender_reference", name: "Sender's Reference" },
        { id: "_030_mf21_receiver_reference", name: "Receiver's Reference" },
        { id: "_040_mf23_issuing_bank_reference", name: "Issuing Bank's Reference" }
    ];
    
    for (let config of referenceFields) {
        const field = q(config.id);
        if (field && field.value.trim() !== "") {
            if (!validateReferenceField(field)) {
                alert(`Invalid ${config.name} (Error T26)`);
                field.focus();
                return false;
            }
        }
    }
    
    // 4. Validate Date Format (T50)
    const dateField = q("_060_mf30_date_of_amendment");
    if (dateField && dateField.value.trim() !== "") {
        if (!validateDateFormat(dateField)) {
            alert("Invalid Date of Amendment format. Must be YYMMDD.");
            dateField.focus();
            return false;
        }
    }
    
    // 5. Validate Number of Amendment (must be numeric)
    const field26e = q("_050_mf26e_number_of_amendment");
    if (field26e && field26e.value.trim() !== "") {
        if (!/^\d{1,3}$/.test(field26e.value.trim())) {
            alert("Number of Amendment must be numeric (max 3 digits)");
            field26e.focus();
            return false;
        }
    }
    
    // 6. Validate Structured Text Fields (T67, T93, D06)
    const structuredValidations = [
        { id: '_070_of45b_description_of_goods_and_or_services', name: 'Description of Goods', errorType: 'T67' },
        { id: '_080_of46b_documents_required', name: 'Documents Required', errorType: 'T93' },
        { id: '_090_of47b_additional_conditions', name: 'Additional Conditions', errorType: 'T67' },
        { id: '_100_of49m_special_payment_conditions_for_beneficiary', name: 'Special Payment Conditions for Beneficiary', errorType: 'T93' },
        { id: '_110_of49n_special_payment_conditions_for_bank_only', name: 'Special Payment Conditions for Bank Only', errorType: 'T67' }
    ];
    
    for (let config of structuredValidations) {
        const field = q(config.id);
        if (field && field.value.trim() !== "") {
            if (!validateStructuredText(field, config.errorType)) {
                alert(`Invalid ${config.name}. Please check structured text format.`);
                field.focus();
                return false;
            }
        }
    }
    
    console.log('MT708 validation completed successfully');
    return true;
}

/* ========== Export functions for external use ========== */
window.validateMT708 = validateMT708;
window.getFieldValue = getFieldValue;
window.isFieldEmpty = isFieldEmpty;
window.validateMandatoryFields = validateMandatoryFields;

