/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


/* ========== Utility Functions ========== */
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

// Auto-add slash for account/party identifier fields
function cek_slash(obj) {
    if (obj.value && obj.value.length > 0 && !obj.value.startsWith("/")) {
        obj.value = "/" + obj.value;
    }
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

// Format amount during input
function formatAmountInput(el) {
    el.value = el.value.replace(/[^0-9,]/g, '');
}

/* ========== Datepicker Handler (YYMMDD) ========== */
function yymmdd(id) {
    const input = document.getElementById(id);
    if (!input) return;

    if (typeof jQuery !== "undefined" && jQuery.fn && jQuery.fn.datepicker) {
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

            const cur = input.value && input.value.trim();
            if (cur && /^\d{6}$/.test(cur)) {
                const yy = parseInt(cur.slice(0, 2), 10);
                const mm = parseInt(cur.slice(2, 4), 10);
                const dd = parseInt(cur.slice(4, 6), 10);
                const thisYear = new Date().getFullYear();
                const thisCentury = Math.floor(thisYear / 100) * 100;
                let fullYear = thisCentury + yy;
                if (fullYear - thisYear > 10) fullYear -= 100;
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

function handle40eOption() {
    const select = document.getElementById("_060_mf40e_applicable_rules");
    const narrativeDiv = document.getElementById("div_060_mf40e_narrative");
    
    if (!select || !narrativeDiv) return;
    
    if (select.value === "OTHR") {
        narrativeDiv.style.display = "block";
    } else {
        narrativeDiv.style.display = "none";
        const narrativeField = document.getElementById("_061_mf40e_narrative");
        if (narrativeField && select.value !== "") {
            narrativeField.value = "";
        }
    }
}

function handle51aOption() {
    const select = document.getElementById("_080_of51a_applicant_bank");
    const divA = document.getElementById("div_080_of51a_A");
    const divD = document.getElementById("div_080_of51a_D");
    
    if (!select || !divA || !divD) return;
    
    divA.style.display = (select.value === "A") ? "block" : "none";
    divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_081_of51a_party_identifier", "_082_of51a_identifier_code"]);
    }
    if (select.value !== "D") {
        clearFieldValues(["_083_of51a_party_identifier", "_084_of51a_name_address"]);
    }
}

function handle41aOption() {
    const select = document.getElementById("_140_mf41a_available_with_by");
    const divA = document.getElementById("div_140_mf41a_A");
    const divD = document.getElementById("div_140_mf41a_D");
    
    if (!select || !divA || !divD) return;
    
    divA.style.display = (select.value === "A") ? "block" : "none";
    divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_141_mf41a_identifier_code"]);
    }
    if (select.value !== "D") {
        clearFieldValues(["_142_mf41d_name_and_address"]);
    }
}

function handle42aOption() {
    const select = document.getElementById("_160_of42a_drawee");
    const divA = document.getElementById("div_160_of42a_A");
    const divD = document.getElementById("div_160_of42a_D");
    
    if (!select || !divA || !divD) return;
    
    divA.style.display = (select.value === "A") ? "block" : "none";
    divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_161_of42a_party_identifier", "_162_of42a_identifier_code"]);
    }
    if (select.value !== "D") {
        clearFieldValues(["_163_of42a_party_identifier", "_164_of42a_name_and_address"]);
    }
}

function handle58aOption() {
    const select = document.getElementById("_350_of58a_requested_confirmation_party");
    const divA = document.getElementById("div_350_of58a_A");
    const divD = document.getElementById("div_350_of58a_D");
    
    if (!select || !divA || !divD) return;
    
    divA.style.display = (select.value === "A") ? "block" : "none";
    divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_351_of58a_party_identifier", "_352_of58a_identifier_code"]);
    }
    if (select.value !== "D") {
        clearFieldValues(["_353_of58a_party_identifier", "_354_of58a_name_address"]);
    }
}

function handle53aOption() {
    const select = document.getElementById("_360_of53a_reimbursing_bank");
    const divA = document.getElementById("div_360_of53a_A");
    const divD = document.getElementById("div_360_of53a_D");
    
    if (!select || !divA || !divD) return;
    
    divA.style.display = (select.value === "A") ? "block" : "none";
    divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_361_of53a_party_identifier", "_362_of53a_identifier_code"]);
    }
    if (select.value !== "D") {
        clearFieldValues(["_363_of53a_party_identifier", "_364_of53a_name_address"]);
    }
}

function handle57aOption() {
    const select = document.getElementById("_380_of57a_advise_through_bank");
    const divA = document.getElementById("div_380_of57a_A");
    const divB = document.getElementById("div_380_of57a_B");
    const divD = document.getElementById("div_380_of57a_D");
    
    if (!select || !divA || !divB || !divD) return;
    
    divA.style.display = (select.value === "A") ? "block" : "none";
    divB.style.display = (select.value === "B") ? "block" : "none";
    divD.style.display = (select.value === "D") ? "block" : "none";
    
    if (select.value !== "A") {
        clearFieldValues(["_381_of57a_party_identifier", "_382_of57a_identifier_code"]);
    }
    if (select.value !== "B") {
        clearFieldValues(["_383_of57a_party_identifier", "_384_of57a_location"]);
    }
    if (select.value !== "D") {
        clearFieldValues(["_385_of57a_party_identifier", "_386_of57a_name_address"]);
    }
}

function clearFieldValues(fieldIds) {
    fieldIds.forEach(id => {
        const field = document.getElementById(id);
        if (field) {
            field.value = "";
        }
    });
}

/* ========== Character Counter for Large Text Areas ========== */
function setupCharacterCounters() {
    const largeTextAreas = [
        { id: '_270_of45a_description_of_goods_and_or_services', max: 6500, lines: 100 },
        { id: '_280_of46a_documents_required', max: 6500, lines: 100 },
        { id: '_290_of47a_additional_conditions', max: 6500, lines: 100 },
        { id: '_300_of49g_special_payment_conditions_for_beneficiary', max: 6500, lines: 100 },
        { id: '_310_of49h_special_payment_conditions_for_bank_only', max: 6500, lines: 100 }
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
    const field = document.getElementById(id);
    return field ? field.value.trim() : "";
}

function isFieldEmpty(id) {
    return getFieldValue(id) === "";
}

function isValidDate(dateStr) {
    if (!/^\d{6}$/.test(dateStr)) return false;
    const yy = parseInt(dateStr.substr(0, 2), 10);
    const mm = parseInt(dateStr.substr(2, 2), 10);
    const dd = parseInt(dateStr.substr(4, 2), 10);
    
    if (mm < 1 || mm > 12) return false;
    if (dd < 1 || dd > 31) return false;
    
    const thisYear = new Date().getFullYear();
    const thisCentury = Math.floor(thisYear / 100) * 100;
    let fullYear = thisCentury + yy;
    if (fullYear - thisYear > 10) fullYear -= 100;
    
    const d = new Date(fullYear, mm - 1, dd);
    return d.getFullYear() === fullYear && d.getMonth() === mm - 1 && d.getDate() === dd;
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

/* ========== Network Validated Rules ========== */

// C1: When used, fields 42C and 42a must both be present
function validateRuleC1() {
    const field42C = getFieldValue("_150_of42c_drafts_at");
    const field42aOption = getFieldValue("_160_of42a_drawee");
    
    if (field42C && !field42aOption) {
        alert("Error C90 (Rule C1): When field 42C (Drafts at) is filled, field 42A (Drawee) must also be present.");
        document.getElementById("_160_of42a_drawee").focus();
        return false;
    }
    
    if (field42aOption && !field42C) {
        alert("Error C90 (Rule C1): When field 42A (Drawee) is selected, field 42C (Drafts at) must also be filled.");
        document.getElementById("_150_of42c_drafts_at").focus();
        return false;
    }
    
    return true;
}

// C2: Either fields 42C and 42a together, or field 42M alone, or field 42P alone
function validateRuleC2() {
    const field42C = getFieldValue("_150_of42c_drafts_at");
    const field42aOption = getFieldValue("_160_of42a_drawee");
    const field42M = getFieldValue("_170_of42m_mixed_payment_details");
    const field42P = getFieldValue("_180_of42p_negotiation_deferred_payment_details");
    
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
    const field44C = getFieldValue("_250_of44c_latest_date_of_shipment");
    const field44D = getFieldValue("_260_of44d_shipment_period");
    
    if (field44C && field44D) {
        alert("Error D06 (Rule C3): Either field 44C (Latest Date of Shipment) or field 44D (Shipment Period) may be present, but not both.");
        document.getElementById("_250_of44c_latest_date_of_shipment").focus();
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
        alert("Field 27 Number must be between 1-8 (Error T75)");
        document.getElementById("_010_mf27_number").focus();
        return false;
    }
    
    if (isNaN(total) || total < 1 || total > 8) {
        alert("Field 27 Total must be between 1-8 (Error T75)");
        document.getElementById("_011_mf27_total").focus();
        return false;
    }
    
    if (number > total) {
        alert("Field 27 Number cannot exceed Total");
        document.getElementById("_010_mf27_number").focus();
        return false;
    }
    
    return true;
}

// Field 40A: Form of Documentary Credit
function validateField40A() {
    const value = getFieldValue("_020_mf40a_form_of_credit");
    const allowed = ["IRREVOCABLE", "IRREVOCABLE TRANSFERABLE"];
    
    if (!allowed.includes(value)) {
        alert("Field 40A must be 'IRREVOCABLE' or 'IRREVOCABLE TRANSFERABLE' (Error T60)");
        document.getElementById("_020_mf40a_form_of_credit").focus();
        return false;
    }
    
    return true;
}

// Field 20: Documentary Credit Number (T26)
function validateField20() {
    const value = getFieldValue("_030_mf20_documentary_credit_number");
    
    if (value.startsWith('/') || value.endsWith('/')) {
        alert('Field 20 cannot start or end with "/" (Error T26)');
        document.getElementById("_030_mf20_documentary_credit_number").focus();
        return false;
    }
    
    if (value.includes('//')) {
        alert('Field 20 cannot contain "//" (Error T26)');
        document.getElementById("_030_mf20_documentary_credit_number").focus();
        return false;
    }
    
    return true;
}

// Field 40E: Applicable Rules (D81)
function validateField40E() {
    const code = getFieldValue("_060_mf40e_applicable_rules");
    const narrative = getFieldValue("_061_mf40e_narrative");
    
    const allowedCodes = ["UCP LATEST VERSION", "UCPURR LATEST VERSION", "EUCP LATEST VERSION", "EUCPURR LATEST VERSION", "OTHR"];
    
    if (!allowedCodes.includes(code)) {
        alert("Field 40E must be one of: " + allowedCodes.join(", ") + " (Error T59)");
        document.getElementById("_060_mf40e_applicable_rules").focus();
        return false;
    }
    
    if (code === "OTHR" && narrative === "") {
        alert("Field 40E Narrative is required when Applicable Rules is OTHR (Error D81)");
        document.getElementById("_061_mf40e_narrative").focus();
        return false;
    }
    
    if (code !== "OTHR" && narrative !== "") {
        alert("Field 40E Narrative is only allowed when Applicable Rules is OTHR (Error D81)");
        document.getElementById("_061_mf40e_narrative").focus();
        return false;
    }
    
    return true;
}

// Field 41A: Available With ... By ... (T68)
function validateField41A() {
    const byCode = getFieldValue("_143_mf41a_by");
    const allowed = ["BY ACCEPTANCE", "BY DEF PAYMENT", "BY MIXED PYMT", "BY NEGOTIATION", "BY PAYMENT"];
    
    if (byCode === "") {
        alert("Field 41A 'By' is mandatory (Error T68)");
        document.getElementById("_143_mf41a_by").focus();
        return false;
    }
    
    if (!allowed.includes(byCode)) {
        alert("Field 41A 'By' must be one of: " + allowed.join(", ") + " (Error T68)");
        document.getElementById("_143_mf41a_by").focus();
        return false;
    }
    
    return true;
}

// Field 43P/43T: Partial Shipments / Transhipment (T64, T65)
function validateField43() {
    const field43P = getFieldValue("_190_of43p_partial_shipments");
    const field43T = getFieldValue("_200_of43t_transhipment");
    const allowed = ["ALLOWED", "CONDITIONAL", "NOT ALLOWED"];
    
    if (field43P !== "" && !allowed.includes(field43P)) {
        alert("Field 43P must be ALLOWED, CONDITIONAL, or NOT ALLOWED (Error T64)");
        document.getElementById("_190_of43p_partial_shipments").focus();
        return false;
    }
    
    if (field43T !== "" && !allowed.includes(field43T)) {
        alert("Field 43T must be ALLOWED, CONDITIONAL, or NOT ALLOWED (Error T65)");
        document.getElementById("_200_of43t_transhipment").focus();
        return false;
    }
    
    return true;
}

// Field 49: Confirmation Instructions (T67)
function validateField49() {
    const value = getFieldValue("_340_mf49_confirmation_instructions");
    const allowed = ["CONFIRM", "MAY ADD", "WITHOUT"];
    
    if (!allowed.includes(value)) {
        alert("Field 49 must be CONFIRM, MAY ADD, or WITHOUT (Error T67)");
        document.getElementById("_340_mf49_confirmation_instructions").focus();
        return false;
    }
    
    return true;
}

// Field 58a: Requested Confirmation Party (conditional)
function validateField58a() {
    const field49 = getFieldValue("_340_mf49_confirmation_instructions");
    const field58aOption = getFieldValue("_350_of58a_requested_confirmation_party");
    
    if ((field49 === "CONFIRM" || field49 === "MAY ADD") && !field58aOption) {
        alert("Field 58a (Requested Confirmation Party) must be present when Confirmation Instructions is CONFIRM or MAY ADD");
        document.getElementById("_350_of58a_requested_confirmation_party").focus();
        return false;
    }
    
    return true;
}

// Validate Date Fields
function validateDateFields() {
    const dateFields = [
        { id: "_050_mf31c_date_of_issue", name: "Date of Issue (Field 31C)" },
        { id: "_070_mf31d_date_of_expiry", name: "Date of Expiry (Field 31D)" },
        { id: "_250_of44c_latest_date_of_shipment", name: "Latest Date of Shipment (Field 44C)" }
    ];
    
    for (let config of dateFields) {
        const value = getFieldValue(config.id);
        if (value !== "" && !isValidDate(value)) {
            alert(`Invalid ${config.name}. Must be valid date in YYMMDD format (Error T50)`);
            document.getElementById(config.id).focus();
            return false;
        }
    }
    
    return true;
}

// Validate BIC Fields
function validateBICFields() {
    const bicFields = [
        { id: "_082_of51a_identifier_code", name: "Applicant Bank BIC (Field 51a)" },
        { id: "_141_mf41a_identifier_code", name: "Available With BIC (Field 41a)" },
        { id: "_162_of42a_identifier_code", name: "Drawee BIC (Field 42a)" },
        { id: "_352_of58a_identifier_code", name: "Requested Confirmation Party BIC (Field 58a)" },
        { id: "_362_of53a_identifier_code", name: "Reimbursing Bank BIC (Field 53a)" },
        { id: "_382_of57a_identifier_code", name: "Advise Through Bank BIC (Field 57a)" }
    ];
    
    for (let config of bicFields) {
        const value = getFieldValue(config.id);
        if (value !== "" && !isValidBIC(value)) {
            alert(`Invalid ${config.name}. Must be 8 or 11 characters in valid BIC format (Error T27/T28/T29)`);
            document.getElementById(config.id).focus();
            return false;
        }
    }
    
    return true;
}

// Validate Currency and Amount
function validateCurrencyAmount() {
    const ccy = getFieldValue("_110_mf32b_currency");
    const amt = getFieldValue("_111_mf32b_amount");
    
    if (!isValidCurrency(ccy)) {
        alert("Invalid Currency Code. Must be 3 letters (ISO 4217) (Error T52)");
        document.getElementById("_110_mf32b_currency").focus();
        return false;
    }
    
    const result = validateAmountByCurrency(ccy, amt);
    if (!result.valid) {
        alert("Field 32B Amount: " + result.error);
        document.getElementById("_111_mf32b_amount").focus();
        return false;
    }
    
    const amountValue = parseFloat(amt.replace(',', '.'));
    if (amountValue === 0) {
        alert("Amount must not be 0 (zero)");
        document.getElementById("_111_mf32b_amount").focus();
        return false;
    }
    
    return true;
}

// Validate Line Count for Multi-line Fields
function validateLineCount() {
    const lineFields = [
        { id: "_320_of71d_charges", maxLines: 6, maxChars: 35, name: "Field 71D (Charges)" },
        { id: "_370_of78_instructions_to_the_paying_accepting_negotiating_bank", maxLines: 12, maxChars: 65, name: "Field 78 (Instructions)" },
        { id: "_390_of72z_sender_to_receiver_information", maxLines: 6, maxChars: 35, name: "Field 72Z (Sender to Receiver Information)" }
    ];
    
    for (let config of lineFields) {
        const value = getFieldValue(config.id);
        if (value !== "") {
            const lines = value.split('\n');
            
            if (lines.length > config.maxLines) {
                alert(`${config.name}: Maximum ${config.maxLines} lines allowed`);
                document.getElementById(config.id).focus();
                return false;
            }
            
            for (let i = 0; i < lines.length; i++) {
                if (lines[i].length > config.maxChars) {
                    alert(`${config.name}: Line ${i + 1} exceeds ${config.maxChars} characters`);
                    document.getElementById(config.id).focus();
                    return false;
                }
            }
        }
    }
    
    return true;
}

/* ========== Main Validation Function ========== */
function validateMT700() {
    console.log('Starting MT700 validation...');
    
    // 1. Field 27: Sequence of Total (T75)
    if (!validateField27()) {
        return false;
    }
    
    // 2. Field 40A: Form of Documentary Credit (T60)
    if (!validateField40A()) {
        return false;
    }
    
    // 3. Field 20: Documentary Credit Number (T26)
    if (!validateField20()) {
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
    
    // 8. Field 58a: Requested Confirmation Party (conditional)
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
    
    console.log('MT700 validation completed successfully');
    return true;
}

/* ========== Initialize on Page Load ========== */
document.addEventListener("DOMContentLoaded", function() {
    console.log('Initializing MT700 form...');
    
    // Setup tab navigation
    setupTabNavigation();
    
    // Bind date fields with jQuery datepicker
    yymmdd("_050_mf31c_date_of_issue");
    yymmdd("_070_mf31d_date_of_expiry");
    yymmdd("_250_of44c_latest_date_of_shipment");
    
    // Setup Option Field Handlers
    const optionHandlers = [
        { id: "_060_mf40e_applicable_rules", handler: handle40eOption },
        { id: "_080_of51a_applicant_bank", handler: handle51aOption },
        { id: "_140_mf41a_available_with_by", handler: handle41aOption },
        { id: "_160_of42a_drawee", handler: handle42aOption },
        { id: "_350_of58a_requested_confirmation_party", handler: handle58aOption },
        { id: "_360_of53a_reimbursing_bank", handler: handle53aOption },
        { id: "_380_of57a_advise_through_bank", handler: handle57aOption }
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
    
    console.log('MT700 form initialized successfully');
});

/* ========== Export functions for external use ========== */
window.validateMT700 = validateMT700;
window.validateRuleC1 = validateRuleC1;
window.validateRuleC2 = validateRuleC2;
window.validateRuleC3 = validateRuleC3;
window.numbersonly = numbersonly;
window.numbersonly2 = numbersonly2;
window.textonly = textonly;
window.avoidSplChars = avoidSplChars;
window.cek_koma = cek_koma;
window.cek_slash = cek_slash;