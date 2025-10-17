/* 
 * mt761.js
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


// UTILITY FUNCTIONS
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

function setUpper(id) {
    const el = q(id);
    if (el) el.value = el.value.toUpperCase();
}

// INPUT VALIDATION HELPERS
function numbersonly(e) {
    const charCode = (e.which) ? e.which : e.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
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

function cek_slash(obj) {
    if (obj.value && obj.value.length > 0 && !obj.value.startsWith("/")) {
        obj.value = "/" + obj.value;
    }
}

// ERROR DISPLAY FUNCTIONS
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

function showFieldWarning(field, message) {
    if (!field) return;
    field.classList.add('warning-border');
    
    const existingWarning = field.parentElement.querySelector('.inline-warning');
    if (existingWarning) {
        existingWarning.remove();
    }
    
    const warningSpan = document.createElement('span');
    warningSpan.className = 'inline-warning';
    warningSpan.style.color = 'orange';
    warningSpan.style.fontSize = '9pt';
    warningSpan.style.marginLeft = '10px';
    warningSpan.textContent = message;
    field.parentElement.appendChild(warningSpan);
}

function clearFieldError(field) {
    if (!field) return;
    field.classList.remove('error-border');
    field.classList.remove('warning-border');
    
    const existingError = field.parentElement.querySelector('.inline-error');
    if (existingError) {
        existingError.remove();
    }
    
    const existingWarning = field.parentElement.querySelector('.inline-warning');
    if (existingWarning) {
        existingWarning.remove();
    }
}

// TAB NAVIGATION
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

// FIELD 52a ISSUER TYPE TOGGLE
function setupFieldVisibility() {
    const issuerSelect = q('_030_mf52a_issuer');
    if (!issuerSelect) return;

    issuerSelect.addEventListener('change', function() {
        handleIssuerOptionChange();
    });

    const divA = q('div_mf52a_issuer');
    const divD = q('div_mf52d_issuer');
    if (divA) divA.style.display = 'none';
    if (divD) divD.style.display = 'none';

    checkSavedIssuerType();
}

function handleIssuerOptionChange() {
    const issuerSelect = q('_030_mf52a_issuer');
    if (!issuerSelect) return;

    const selectedType = issuerSelect.value;
    const divA = q('div_mf52a_issuer');
    const divD = q('div_mf52d_issuer');

    if (selectedType === 'a') {
        if (divA) divA.style.display = 'block';
        if (divD) divD.style.display = 'none';

        const bicField = q('_032_mf52a_identifier_code');
        const nameField = q('_034_mf52d_name_address');
        if (bicField) bicField.classList.add('mandatory');
        if (nameField) nameField.classList.remove('mandatory');

        const partyIdD = q('_033_mf52d_party_identifier');
        if (partyIdD) partyIdD.value = '';
        if (nameField) nameField.value = '';

    } else if (selectedType === 'd') {
        if (divA) divA.style.display = 'none';
        if (divD) divD.style.display = 'block';

        const bicField = q('_032_mf52a_identifier_code');
        const nameField = q('_034_mf52d_name_address');
        if (bicField) bicField.classList.remove('mandatory');
        if (nameField) nameField.classList.add('mandatory');

        const partyIdA = q('_031_mf52a_party_identifier');
        if (partyIdA) partyIdA.value = '';
        if (bicField) bicField.value = '';

    } else {
        if (divA) divA.style.display = 'none';
        if (divD) divD.style.display = 'none';

        const bicField = q('_032_mf52a_identifier_code');
        const nameField = q('_034_mf52d_name_address');
        if (bicField) bicField.classList.remove('mandatory');
        if (nameField) nameField.classList.remove('mandatory');
    }
}

function checkSavedIssuerType() {
    const issuerSelect = q('_030_mf52a_issuer');
    if (!issuerSelect) return;

    const savedOption = issuerSelect.value;
    if (savedOption) {
        handleIssuerOptionChange();
        return;
    }

    const bicField = q('_032_mf52a_identifier_code');
    const nameField = q('_034_mf52d_name_address');

    if (bicField && bicField.value.trim() !== '') {
        issuerSelect.value = 'a';
        handleIssuerOptionChange();
    } else if (nameField && nameField.value.trim() !== '') {
        issuerSelect.value = 'd';
        handleIssuerOptionChange();
    }
}

// CHARACTER COUNTERS FOR FIELD 77U AND 77L
function setupCharacterCounters() {
    const textareaConfigs = [
        { id: '_040_of77u_undertaking_terms_and_conditions', max: 9750, lines: 150 },
        { id: '_050_of77l_requested_local_undertaking_terms_and_conditions', max: 9750, lines: 150 }
    ];

    textareaConfigs.forEach(config => {
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

// REAL-TIME VALIDATION FUNCTIONS
function validateField27Realtime() {
    const numberField = q('_010_mf27_number');
    const totalField = q('_011_mf27_total');

    if (!numberField || !totalField) return;

    const number = parseInt(numberField.value);
    const total = parseInt(totalField.value);

    clearFieldError(numberField);
    clearFieldError(totalField);

    let isValid = true;

    if (isNaN(number) || number < 2 || number > 8) {
        showFieldError(numberField, 'Must be between 2-8 (Error T75)');
        isValid = false;
    }

    if (isNaN(total) || total < 2 || total > 8) {
        showFieldError(totalField, 'Must be between 2-8 (Error T75)');
        isValid = false;
    }

    if (!isNaN(number) && !isNaN(total) && number > total) {
        showFieldError(numberField, 'Sequence must be ≤ Total (Error T75)');
        isValid = false;
    }

    if (isValid) {
        numberField.classList.add('valid-border');
        totalField.classList.add('valid-border');
    }

    return isValid;
}

function validateField20Realtime() {
    const field = q('_020_mf20_undertaking_number');
    if (!field) return true;

    const value = field.value.trim();
    if (!value) {
        clearFieldError(field);
        return true;
    }

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

function validateBICRealtime() {
    const field = q('_032_mf52a_identifier_code');
    if (!field) return true;

    const bicCode = field.value.trim().toUpperCase();
    if (!bicCode) {
        clearFieldError(field);
        return true;
    }

    clearFieldError(field);
    let isValid = true;

    if (bicCode.length !== 8 && bicCode.length !== 11) {
        showFieldError(field, 'BIC must be 8 or 11 characters (Error T27/T28)');
        isValid = false;
    }

    const bicPattern = /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
    if (bicCode.length > 0 && !bicPattern.test(bicCode)) {
        showFieldError(field, 'Invalid BIC format (Error T29)');
        isValid = false;
    }

    if (isValid && bicCode.length > 0) {
        field.classList.add('valid-border');
    }

    return isValid;
}

function validateNameAddressRealtime() {
    const field = q('_034_mf52d_name_address');
    if (!field) return true;

    const value = field.value.trim();
    if (!value) {
        clearFieldError(field);
        return true;
    }

    clearFieldError(field);
    const lines = value.split('\n');
    let isValid = true;

    if (lines.length > 4) {
        showFieldError(field, `Maximum 4 lines allowed (currently: ${lines.length})`);
        isValid = false;
    }

    for (let i = 0; i < lines.length; i++) {
        if (lines[i].length > 35) {
            showFieldError(field, `Line ${i + 1} exceeds 35 characters (${lines[i].length})`);
            isValid = false;
            break;
        }
    }

    if (isValid) {
        field.classList.add('valid-border');
    }

    return isValid;
}

function checkLongLines(fieldId, fieldName, maxCharsPerLine) {
    const field = q(fieldId);
    if (!field) return true;

    const content = field.value;
    if (content.trim() === '') {
        clearFieldError(field);
        return true;
    }

    const lines = content.split('\n');
    const longLines = [];

    for (let i = 0; i < lines.length; i++) {
        if (lines[i].length > maxCharsPerLine) {
            longLines.push(`Line ${i + 1}: ${lines[i].length} chars`);
        }
    }

    if (longLines.length > 0) {
        const message = `${longLines.length} line(s) exceed ${maxCharsPerLine} chars`;
        showFieldWarning(field, message);
        console.warn(`${fieldName} - ${longLines.join(', ')}`);
        return false;
    } else {
        clearFieldError(field);
        return true;
    }
}

// SETUP REAL-TIME VALIDATIONS
function setupRealtimeValidations() {
    const field27Number = q('_010_mf27_number');
    const field27Total = q('_011_mf27_total');

    if (field27Number && field27Total) {
        field27Number.addEventListener('blur', validateField27Realtime);
        field27Total.addEventListener('blur', validateField27Realtime);
        field27Number.addEventListener('keypress', numbersonly);
        field27Total.addEventListener('keypress', numbersonly);

        field27Number.addEventListener('input', function() {
            this.value = this.value.replace(/[^\d]/g, '').slice(0, 1);
        });
        field27Total.addEventListener('input', function() {
            this.value = this.value.replace(/[^\d]/g, '').slice(0, 1);
        });
    }

    const field20 = q('_020_mf20_undertaking_number');
    if (field20) {
        field20.addEventListener('blur', function() {
            validateField20Realtime();
            setUpper(this.id);
        });
        field20.addEventListener('keypress', avoidSplChars);
    }

    const bicField = q('_032_mf52a_identifier_code');
    if (bicField) {
        bicField.addEventListener('input', function() {
            this.value = this.value.toUpperCase();
        });
        bicField.addEventListener('blur', validateBICRealtime);
    }

    const nameAddressField = q('_034_mf52d_name_address');
    if (nameAddressField) {
        nameAddressField.addEventListener('blur', validateNameAddressRealtime);
    }

    const field77U = q('_040_of77u_undertaking_terms_and_conditions');
    if (field77U) {
        field77U.addEventListener('blur', function() {
            checkLongLines('_040_of77u_undertaking_terms_and_conditions', 'OF77U', 65);
        });
    }

    const field77L = q('_050_of77l_requested_local_undertaking_terms_and_conditions');
    if (field77L) {
        field77L.addEventListener('blur', function() {
            checkLongLines('_050_of77l_requested_local_undertaking_terms_and_conditions', 'OF77L', 65);
        });
    }

    const partyIdA = q('_031_mf52a_party_identifier');
    const partyIdD = q('_033_mf52d_party_identifier');
    if (partyIdA) partyIdA.addEventListener('blur', function() { cek_slash(this); });
    if (partyIdD) partyIdD.addEventListener('blur', function() { cek_slash(this); });
}

// MAIN VALIDATION FUNCTION
function validateMandatoryFields() {
    const mandatoryFields = [
        { id: '_010_mf27_number', name: 'MF27 Number' },
        { id: '_011_mf27_total', name: 'MF27 Total' },
        { id: '_020_mf20_undertaking_number', name: 'MF20 Undertaking Number' },
        { id: '_030_mf52a_issuer', name: 'MF52a Issuer Type' }
    ];

    let errors = [];

    mandatoryFields.forEach(config => {
        const field = q(config.id);
        if (field && isEmpty(field.value)) {
            errors.push(config.name);
            showFieldError(field, 'This field is required');
        }
    });

    if (errors.length > 0) {
        alert('Please fill all mandatory fields:\n\n' + errors.join('\n'));
        return false;
    }

    return true;
}

function validateField27() {
    const numberField = q('_010_mf27_number');
    const totalField = q('_011_mf27_total');

    if (!numberField || !totalField) return true;

    const number = parseInt(numberField.value);
    const total = parseInt(totalField.value);

    if (isNaN(number) || number < 2 || number > 8) {
        alert('Field 27 Number must be between 2-8 for MT761 (Error T75)');
        numberField.focus();
        return false;
    }

    if (isNaN(total) || total < 2 || total > 8) {
        alert('Field 27 Total must be between 2-8 (Error T75)');
        totalField.focus();
        return false;
    }

    if (number > total) {
        alert('Field 27 Number cannot exceed Total (Error T75)');
        numberField.focus();
        return false;
    }

    return true;
}

function validateField20() {
    const field = q('_020_mf20_undertaking_number');
    if (!field) return true;

    const value = field.value.trim();
    if (!value) {
        alert('Field 20 Undertaking Number is required');
        field.focus();
        return false;
    }

    if (value.startsWith('/') || value.endsWith('/')) {
        alert('Field 20 cannot start or end with "/" (Error T26)');
        field.focus();
        return false;
    }

    if (value.indexOf('//') !== -1) {
        alert('Field 20 cannot contain "//" (Error T26)');
        field.focus();
        return false;
    }

    return true;
}

function validateField52a() {
    const issuerSelect = q('_030_mf52a_issuer');
    if (!issuerSelect) return true;

    const issuerType = issuerSelect.value;

    if (!issuerType) {
        alert('Field 52a Issuer Type must be selected');
        issuerSelect.focus();
        return false;
    }

    if (issuerType === 'a') {
        const bicField = q('_032_mf52a_identifier_code');
        if (!bicField || !bicField.value.trim()) {
            alert('Field 52a Option A requires Identifier Code (BIC)');
            if (bicField) bicField.focus();
            return false;
        }

        const bic = bicField.value.trim().toUpperCase();
        if (bic.length !== 8 && bic.length !== 11) {
            alert('Field 52a BIC must be 8 or 11 characters (Error T27/T28)');
            bicField.focus();
            return false;
        }

        const bicPattern = /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
        if (!bicPattern.test(bic)) {
            alert('Field 52a Invalid BIC format (Error T29)');
            bicField.focus();
            return false;
        }

    } else if (issuerType === 'd') {
        const nameField = q('_034_mf52d_name_address');
        if (!nameField || !nameField.value.trim()) {
            alert('Field 52a Option D requires Name & Address');
            if (nameField) nameField.focus();
            return false;
        }

        const lines = nameField.value.split('\n');
        if (lines.length > 4) {
            alert('Field 52d Name & Address: Maximum 4 lines allowed');
            nameField.focus();
            return false;
        }

        for (let i = 0; i < lines.length; i++) {
            if (lines[i].length > 35) {
                alert(`Field 52d Name & Address: Line ${i + 1} exceeds 35 characters`);
                nameField.focus();
                return false;
            }
        }
    }

    return true;
}

function validateRuleC1() {
    const field77U = q('_040_of77u_undertaking_terms_and_conditions');
    const field77L = q('_050_of77l_requested_local_undertaking_terms_and_conditions');

    const has77U = field77U && field77U.value.trim() !== '';
    const has77L = field77L && field77L.value.trim() !== '';

    if (!has77U && !has77L) {
        alert('Error C19 (Rule C1): Either field 77U (Undertaking Terms) or field 77L (Requested Local Undertaking Terms) must be present, or both may be present.');
        if (field77U) field77U.focus();
        return false;
    }

    return true;
}

function validateField77MaxLength() {
    const field77U = q('_040_of77u_undertaking_terms_and_conditions');
    const field77L = q('_050_of77l_requested_local_undertaking_terms_and_conditions');

    if (field77U && field77U.value.trim() !== '') {
        const lines = field77U.value.split('\n');
        if (lines.length > 150) {
            alert('Field 77U: Maximum 150 lines allowed');
            field77U.focus();
            return false;
        }
        if (field77U.value.length > 9750) {
            alert('Field 77U: Maximum 9750 characters allowed');
            field77U.focus();
            return false;
        }
    }

    if (field77L && field77L.value.trim() !== '') {
        const lines = field77L.value.split('\n');
        if (lines.length > 150) {
            alert('Field 77L: Maximum 150 lines allowed');
            field77L.focus();
            return false;
        }
        if (field77L.value.length > 9750) {
            alert('Field 77L: Maximum 9750 characters allowed');
            field77L.focus();
            return false;
        }
    }

    return true;
}

function validateMT761() {
    console.log('Starting MT761 validation...');

    if (!validateMandatoryFields()) {
        console.log('Mandatory fields validation failed');
        return false;
    }

    if (!validateField27()) {
        console.log('Field 27 validation failed');
        return false;
    }

    if (!validateField20()) {
        console.log('Field 20 validation failed');
        return false;
    }

    if (!validateField52a()) {
        console.log('Field 52a validation failed');
        return false;
    }

    if (!validateRuleC1()) {
        console.log('Rule C1 validation failed');
        return false;
    }

    if (!validateField77MaxLength()) {
        console.log('Field 77U/77L max length validation failed');
        return false;
    }

    console.log('MT761 validation completed successfully');
    return true;
}

// FORM INITIALIZATION
function initializeMT761Form() {
    console.log('Initializing MT761 form...');

    const field27Number = q('_010_mf27_number');
    if (field27Number && !field27Number.value) {
        field27Number.value = '2';
    }

    const field27Total = q('_011_mf27_total');
    if (field27Total && !field27Total.value) {
        field27Total.value = '2';
    }

    console.log('MT761 form initialized successfully');
}

// DOM READY
document.addEventListener('DOMContentLoaded', function() {
    console.log('MT761 DOMContentLoaded event fired');

    initializeMT761Form();
    setupTabNavigation();
    setupFieldVisibility();
    setupRealtimeValidations();
    setupCharacterCounters();

    console.log('MT761 initialization complete');
});

// WINDOW EXPORTS
window.validateMT761 = validateMT761;
window.numbersonly = numbersonly;
window.textonly = textonly;
window.avoidSplChars = avoidSplChars;
window.cek_slash = cek_slash;