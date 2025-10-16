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

function show(id, display = true) {
    const el = q(id);
    if (el) el.style.display = display ? "block" : "none";
}

function setUpper(id) {
    const el = q(id);
    if (el) el.value = el.value.toUpperCase();
}

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

function avoidSplCharsNarrative(e) {
    e = e || window.event;
    let allowed = /^[A-Z0-9\s\.\/\,\-\(\)\?\:\'\+]$/;
    let key = String.fromCharCode(e.keyCode || e.which);
    
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

function cek_slash(obj) {
    if (obj.value && obj.value.length > 0 && !obj.value.startsWith("/")) {
        obj.value = "/" + obj.value;
    }
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

function handle52aOption() {
    const select = q("_060_of52a_issuer");
    if (!select) return;
    
    const divA = q("div_060_of52a_A");
    const divD = q("div_060_of52a_D");
    
    if (divA) divA.style.display = (select.value === "A") ? "block" : "none";
    if (divD) divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_061_of52a_party_identifier", "_062_of52a_identifier_code"]);
    }
    if (select.value !== "D") {
        clearFieldValues(["_063_of52a_party_identifier", "_064_of52a_name_address"]);
    }
}

function clearFieldValues(fieldIds) {
    fieldIds.forEach(id => {
        const field = q(id);
        if (field) {
            field.value = "";
        }
    });
}

function setupCharacterCounter() {
    const narrative = q('_080_mf45d_narrative');
    if (narrative) {
        const counter = document.createElement('div');
        counter.id = 'counter_narrative';
        counter.style.fontSize = '10pt';
        counter.style.marginTop = '5px';
        counter.style.color = 'green';
        narrative.parentElement.appendChild(counter);
        narrative.addEventListener('input', function() {
            updateNarrativeCounter(this, counter);
        });
        
        updateNarrativeCounter(narrative, counter);
    }
}

function updateNarrativeCounter(textarea, counterElement) {
    const content = textarea.value;
    const lines = content.split('\n');
    const lineCount = lines.length;
    const charCount = content.length;
    const maxChars = 9750; 
    const maxLines = 150;
    
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
    const trimmed = bic.trim().toUpperCase();
    if (trimmed.length !== 8 && trimmed.length !== 11) return false;
    return /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/.test(trimmed);
}

function validateField27Realtime() {
    const numberField = q("_010_mf27_number");
    const totalField = q("_011_mf27_total");
    
    if (!numberField || !totalField) return;
    
    const number = parseInt(numberField.value);
    const total = parseInt(totalField.value);
    
    clearFieldError(numberField);
    clearFieldError(totalField);
    
    let isValid = true;
    
    if (isNaN(number) || number < 1 || number > 8) {
        showFieldError(numberField, "Number must be 1-8 (Error T75)");
        isValid = false;
    }
    
    if (isNaN(total) || total < 1 || total > 8) {
        showFieldError(totalField, "Total must be 1-8 (Error T75)");
        isValid = false;
    }
    
    if (!isNaN(number) && !isNaN(total) && number > total) {
        showFieldError(numberField, "Number cannot exceed Total");
        isValid = false;
    }
    
    if (isValid) {
        numberField.classList.add('valid-border');
        totalField.classList.add('valid-border');
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

function validateBICField(field) {
    if (!field) return true;
    
    const value = field.value.trim().toUpperCase();
    if (!value) return true;
    
    clearFieldError(field);
    
    if (!isValidBIC(value)) {
        showFieldError(field, 'Invalid BIC format (Error T27/T28/T29)');
        return false;
    }
    
    field.classList.add('valid-border');
    return true;
}

function setupRealtimeValidations() {
    const numberField = q("_010_mf27_number");
    const totalField = q("_011_mf27_total");
    if (numberField && totalField) {
        numberField.addEventListener('blur', validateField27Realtime);
        totalField.addEventListener('blur', validateField27Realtime);
        numberField.addEventListener('keypress', numbersonly);
        totalField.addEventListener('keypress', numbersonly);
        
        numberField.addEventListener('input', function() {
            this.value = this.value.replace(/[^\d]/g, '').slice(0, 1);
        });
        totalField.addEventListener('input', function() {
            this.value = this.value.replace(/[^\d]/g, '').slice(0, 1);
        });
    }
    
    const field20 = q("_020_mf20_transaction_reference_number");
    if (field20) {
        field20.addEventListener('blur', function() { 
            validateReferenceField(this);
            setUpper(this.id);
        });
        field20.addEventListener('keypress', avoidSplChars);
    }
    
    const field21 = q("_030_of21_related_reference_number");
    if (field21) {
        field21.addEventListener('blur', function() { 
            validateReferenceField(this);
            setUpper(this.id);
        });
        field21.addEventListener('keypress', avoidSplChars);
    }
    
    const field23 = q("_050_of23_undertaking_number");
    if (field23) {
        field23.addEventListener('keypress', avoidSplChars);
    }
    
    const field22d = q("_040_mf22d_form_of_undertaking");
    if (field22d) {
        field22d.addEventListener('change', function() {
            validateRuleC1Realtime();
        });
    }
    
    const field23h = q("_070_mf23h_function_of_message");
    if (field23h) {
        field23h.addEventListener('change', function() {
            validateRuleC1Realtime();
        });
    }
    
    const bicField = q("_062_of52a_identifier_code");
    if (bicField) {
        bicField.addEventListener('input', function() {
            this.value = this.value.toUpperCase().replace(/[^A-Z0-9]/g, '');
        });
        bicField.addEventListener('blur', function() {
            validateBICField(this);
        });
    }
    
    const narrative = q("_080_mf45d_narrative");
    if (narrative) {
        convertToUppercase(narrative);
        narrative.addEventListener('keypress', avoidSplCharsNarrative);
    }
}

function validateRuleC1Realtime() {
    const f22d = val("_040_mf22d_form_of_undertaking");
    const f23h = val("_070_mf23h_function_of_message");
    
    if (!f22d || !f23h) return; 
    
    const field22d = q("_040_mf22d_form_of_undertaking");
    const field23h = q("_070_mf23h_function_of_message");
    
    clearFieldError(field22d);
    clearFieldError(field23h);
    
    let isValid = true;
    let errorMsg = "";
    
    if (["ISSUANCE", "REQISSUE", "REQAMEND", "ISSAMEND"].includes(f23h)) {
        if (f22d !== "UNDK") {
            errorMsg = "Rule C1: 22D must be UNDK for this 23H function";
            isValid = false;
        }
    } else if (f23h === "TRANSFER") {
        if (!["DGAR", "STBY", "UNDK"].includes(f22d)) {
            errorMsg = "Rule C1: 22D must be DGAR, STBY, or UNDK for TRANSFER";
            isValid = false;
        }
    } else if (["CLSVOPEN", "CLSVCLOS", "FRAUDMSG", "GENINFAD", "OTHERFNC", "REIMBURS", "REQFINAN"].includes(f23h)) {
        if (!["DGAR", "DOCR", "STBY", "UNDK"].includes(f22d)) {
            errorMsg = "Rule C1: 22D must be DGAR, DOCR, STBY, or UNDK for this 23H function";
            isValid = false;
        }
    }
    
    if (!isValid) {
        showFieldError(field22d, errorMsg);
        showFieldError(field23h, errorMsg);
    } else {
        field22d.classList.add('valid-border');
        field23h.classList.add('valid-border');
    }
}

function validateMT759() {
    console.log('Starting MT759 validation...');
    
    // 1. Validate mandatory fields
    const mandatoryFields = [
        { id: "_010_mf27_number", name: "MF27 Number" },
        { id: "_011_mf27_total", name: "MF27 Total" },
        { id: "_020_mf20_transaction_reference_number", name: "MF20 Transaction Reference Number" },
        { id: "_040_mf22d_form_of_undertaking", name: "MF22D Form of Undertaking" },
        { id: "_070_mf23h_function_of_message", name: "MF23H Function of Message" },
        { id: "_080_mf45d_narrative", name: "MF45D Narrative" }
    ];
    
    let errors = [];
    mandatoryFields.forEach(field => {
        if (isEmpty(val(field.id))) {
            errors.push(field.name);
        }
    });
    
    if (errors.length > 0) {
        alert("Please fill all mandatory fields:\n\n" + errors.join("\n"));
        q(mandatoryFields[0].id).focus();
        return false;
    }
    
    // 2. Validate Field 27 (T75)
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
        alert("Field 27 Number cannot exceed Total (Error T75)");
        q("_010_mf27_number").focus();
        return false;
    }
    
    // 3. Validate Field 20 (T26)
    const field20 = q("_020_mf20_transaction_reference_number");
    if (!validateReferenceField(field20)) {
        alert("Invalid Transaction Reference Number (Error T26)");
        field20.focus();
        return false;
    }
    
    // 4. Validate Field 21 (T26) if present
    const field21 = q("_030_of21_related_reference_number");
    if (field21 && field21.value.trim() !== "") {
        if (!validateReferenceField(field21)) {
            alert("Invalid Related Reference Number (Error T26)");
            field21.focus();
            return false;
        }
    }
    
    // 5. Validate Field 22D (T71)
    const f22d = val("_040_mf22d_form_of_undertaking");
    const allowedF22D = ["DGAR", "DOCR", "STBY", "UNDK"];
    if (!allowedF22D.includes(f22d)) {
        alert("Field 22D must be DGAR, DOCR, STBY, or UNDK (Error T71)");
        q("_040_mf22d_form_of_undertaking").focus();
        return false;
    }
    
    // 6. Validate Field 23H (T48)
    const f23h = val("_070_mf23h_function_of_message");
    const allowedF23H = ["CLSVCLOS", "CLSVOPEN", "FRAUDMSG", "GENINFAD", "ISSAMEND", 
                         "ISSUANCE", "OTHERFNC", "PREDENOT", "REIMBURS", "REQAMEND", 
                         "REQFINAN", "REQISSUE", "REXTMATU", "TRANSFER"];
    if (!allowedF23H.includes(f23h)) {
        alert("Field 23H contains invalid function code (Error T48)");
        q("_070_mf23h_function_of_message").focus();
        return false;
    }
    
    // 7. Validate Rule C1 (D87)
    if (["ISSUANCE", "REQISSUE", "REQAMEND", "ISSAMEND"].includes(f23h) && f22d !== "UNDK") {
        alert("Rule C1: If 23H is ISSUANCE/REQISSUE/REQAMEND/ISSAMEND, then 22D must be UNDK (Error D87)");
        q("_040_mf22d_form_of_undertaking").focus();
        return false;
    }
    
    if (f23h === "TRANSFER" && !["DGAR", "STBY", "UNDK"].includes(f22d)) {
        alert("Rule C1: If 23H is TRANSFER, then 22D must be DGAR, STBY, or UNDK (Error D87)");
        q("_040_mf22d_form_of_undertaking").focus();
        return false;
    }
    
    if (["CLSVOPEN", "CLSVCLOS", "FRAUDMSG", "GENINFAD", "OTHERFNC", "REIMBURS", "REQFINAN"].includes(f23h) 
        && !["DGAR", "DOCR", "STBY", "UNDK"].includes(f22d)) {
        alert("Rule C1: For this 23H function, 22D must be DGAR, DOCR, STBY, or UNDK (Error D87)");
        q("_040_mf22d_form_of_undertaking").focus();
        return false;
    }
    
    // 8. Validate Field 52a BIC (T27, T28, T29, C05) if Option A
    const issuerOption = val("_060_of52a_issuer");
    if (issuerOption === "A") {
        const bic = val("_062_of52a_identifier_code");
        if (!bic) {
            alert("Field 52a: BIC is required for Option A");
            q("_062_of52a_identifier_code").focus();
            return false;
        }
        if (!isValidBIC(bic)) {
            alert("Field 52a: Invalid BIC format. Must be 8 or 11 alphanumeric characters (Error T27/T28/T29)");
            q("_062_of52a_identifier_code").focus();
            return false;
        }
    } else if (issuerOption === "D") {
        const nameAddr = val("_064_of52a_name_address");
        if (!nameAddr) {
            alert("Field 52a: Name & Address is required for Option D");
            q("_064_of52a_name_address").focus();
            return false;
        }
    }
    
    // 9. Validate Field 23X (T93) if present
    const f23xCode = val("_090_of23x_file_identification");
    const f23xName = val("_091_of23x_file_name");
    
    if (f23xCode) {
        const allowedF23X = ["COUR", "EMAL", "FACT", "FAXT", "HOST", "MAIL", "OTHR"];
        if (!allowedF23X.includes(f23xCode)) {
            alert("Field 23X Code must be COUR, EMAL, FACT, FAXT, HOST, MAIL, or OTHR (Error T93)");
            q("_090_of23x_file_identification").focus();
            return false;
        }
        
        if (!f23xName) {
            alert("Field 23X: File name/reference is required when code is provided");
            q("_091_of23x_file_name").focus();
            return false;
        }
        
        // File name must not contain path separators
        if (/[\/\\]/.test(f23xName)) {
            alert("Field 23X: File name must not contain path separators ('/' or '\\')");
            q("_091_of23x_file_name").focus();
            return false;
        }
    }
    
    // 10. Validate Narrative (mandatory and format)
    const narrative = val("_080_mf45d_narrative");
    if (!narrative) {
        alert("Field 45D Narrative is mandatory");
        q("_080_mf45d_narrative").focus();
        return false;
    }
    
    // Check line count
    const lines = narrative.split('\n');
    if (lines.length > 150) {
        alert("Field 45D: Maximum 150 lines allowed");
        q("_080_mf45d_narrative").focus();
        return false;
    }
    
    // Check character count
    if (narrative.length > 9750) {
        alert("Field 45D: Maximum 9750 characters allowed (150 lines × 65 chars)");
        q("_080_mf45d_narrative").focus();
        return false;
    }
    
    console.log('MT759 validation completed successfully');
    return true;
}

function getFieldValue(id) {
    return val(id);
}

function isFieldEmpty(id) {
    return isEmpty(getFieldValue(id));
}

document.addEventListener("DOMContentLoaded", function() {
    console.log('Initializing MT759 form...');
    
    setupTabNavigation();
    
    const issuerSelect = q("_060_of52a_issuer");
    if (issuerSelect) {
        issuerSelect.addEventListener("change", handle52aOption);
        handle52aOption(); 
    }
    
    setupRealtimeValidations();
    setupCharacterCounter();
    
    console.log('MT759 form initialized successfully');
});

window.validateMT759 = validateMT759;
window.getFieldValue = getFieldValue;
window.isFieldEmpty = isFieldEmpty;
window.numbersonly = numbersonly;
window.textonly = textonly;
window.avoidSplChars = avoidSplChars;
window.avoidSplCharsNarrative = avoidSplCharsNarrative;
window.cek_slash = cek_slash;
