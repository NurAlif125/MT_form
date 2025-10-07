    /* 
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
     */

/* 
 * mt210.js
 */

/* ===================== UTILITIES ===================== */
function q(id) { 
    return document.getElementById(id); 
}

function show(id, on = true) { 
    const el = q(id); 
    if (el) el.style.display = on ? "block" : "none"; 
}

function val(id) { 
    const el = q(id); 
    return el ? (el.value || "").trim() : ""; 
}

function isEmpty(v) { 
    return !v || v.trim() === ""; 
}

/* ===================== ISO 4217 CURRENCY LIST ===================== */
const ISO4217 = [
    "AED","AFN","ALL","AMD","ANG","AOA","ARS","AUD","AWG","AZN","BAM","BBD","BDT","BGN","BHD",
    "BIF","BMD","BND","BOB","BRL","BSD","BTN","BWP","BYN","BZD","CAD","CDF","CHF","CLP","CNY",
    "COP","CRC","CUP","CVE","CZK","DJF","DKK","DOP","DZD","EGP","ERN","ETB","EUR","FJD","FKP",
    "GBP","GEL","GGP","GHS","GIP","GMD","GNF","GTQ","GYD","HKD","HNL","HRK","HTG","HUF","IDR",
    "ILS","IMP","INR","IQD","IRR","ISK","JEP","JMD","JOD","JPY","KES","KGS","KHR","KMF","KPW",
    "KRW","KWD","KYD","KZT","LAK","LBP","LKR","LRD","LSL","LYD","MAD","MDL","MGA","MKD","MMK",
    "MNT","MOP","MRU","MUR","MVR","MWK","MXN","MYR","MZN","NAD","NGN","NIO","NOK","NPR","NZD",
    "OMR","PAB","PEN","PGK","PHP","PKR","PLN","PYG","QAR","RON","RSD","RUB","RWF","SAR","SBD",
    "SCR","SDG","SEK","SGD","SHP","SLE","SLL","SOS","SPL","SRD","STN","SYP","SZL","THB","TJS",
    "TMT","TND","TOP","TRY","TTD","TVD","TWD","TZS","UAH","UGX","USD","UYU","UZS","VES","VND",
    "VUV","WST","XAF","XCD","XDR","XOF","XPF","YER","ZAR","ZMW","ZWD"
];

function isValidCurrency(code) {
    return ISO4217.includes(code.toUpperCase());
}

/* ===================== BIC VALIDATOR ===================== */
function isValidBIC(code) {
    if (!code) return false;
    const bic = code.trim().toUpperCase();
    const regex = /^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
    return regex.test(bic);
}

/* ===================== TEXT & NUMBER INPUT VALIDATORS ===================== */
function textonly(e) {
    var code = e.keyCode || e.which;
    var character = String.fromCharCode(code);
    var AllowRegex = /^[\ba-zA-Z\s-]$/;
    return AllowRegex.test(character);
}

function numbersonly(e, obj) {
    var charCode = (e.which) ? e.which : event.keyCode;
    if (document.getElementById(obj)) {
        if (document.getElementById(obj).value.toUpperCase() == "JPY") {
            if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
        } else {
            if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 44) return false;
        }
    } else {
        if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
    }
    return true;
}

function numbersonly2(e) {
    var charCode = (e.which) ? e.which : event.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
    return true;
}

function avoidSplChars(e) {
    e = e || window.event;
    var bad = /[^\sa-z\d\.\,\'\(\)\-\/\:]/i,
        key = String.fromCharCode(e.keyCode || e.which);
    if (e.which !== 0 && e.charCode !== 0 && bad.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) e.preventDefault();
    }
}

/* ===================== FORMAT HELPERS ===================== */
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
        let intPart = String(parseInt(parts[0], 10) || 0);
        let decPart = (parts[1] || "").padEnd(2, "0").substring(0, 2);
        v = intPart + "," + decPart;
    }
    el.value = v;
}

function cek_koma(obj) {
    if (obj.value.length > 0 && obj.value.indexOf(",") === -1) {
        obj.value = obj.value + ",";
    }
}

function cek_koma2(obj) {
    if (obj.value.length > 1 && obj.value.indexOf(",") === -1) {
        obj.value = obj.value + ",";
    }
}

function cek_slash(obj) {
    if (obj.value.length > 1 && obj.value.indexOf("/") === -1) {
        obj.value = "/" + obj.value;
    }
}

/* ===================== SPECIAL HELPERS ===================== */
function cek_sender(obj) {
    if (obj.value.startsWith("MEGAIDJA")) {
        obj.value = "MEGAIDJAXXXX";
    } else if (obj.value.startsWith("MEGAIDJ0")) {
        obj.value = "MEGAIDJ0AXXX";
    }
}

var hasShownAlert = false;
function checkZeroAmount(amountElement) {
    if (!amountElement) return;
    const value = amountElement.value.trim().replace(',', '.'); 
    if (value !== "" && parseFloat(value) === 0) {
        if (!hasShownAlert) {
            hasShownAlert = true;
            alert("Amount must not be 0 (zero)");
            setTimeout(() => {
                amountElement.focus();
                hasShownAlert = false;
            }, 100);
        }
    }
}

/* ===================== DATEPICKER (YYMMDD) ===================== */
function yymmdd(id) {
    const el = q(id);
    if (!el) return;
    if (typeof jQuery === "undefined" || !jQuery.fn || !jQuery.fn.datepicker) return;

    jQuery(function($) {
        $("#" + id).datepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: "-100:+10",
            showAnim: "fadeIn",
            dateFormat: "yymmdd",
            onSelect: function(dateText, inst) {
                const d = $(this).datepicker('getDate');
                if (d) {
                    const yy = String(d.getFullYear()).slice(-2);
                    const mm = String(d.getMonth() + 1).padStart(2, '0');
                    const dd = String(d.getDate()).padStart(2, '0');
                    this.value = yy + mm + dd;
                }
            }
        });
    });
}

/* ===================== TOGGLE LOGIC - SET SPECIFIC ===================== */
function toggleSetOption(setIdx, fieldType, opt) {
    const set = document.getElementById("set_" + setIdx);
    if (!set) return;

    if (fieldType === "50a") {
        const divA = set.querySelector('[id^="div_of50_ordering_customer"]');
        const divC = set.querySelector('[id^="div_of50c_ordering_customer"]');
        const divF = set.querySelector('[id^="div_of50f_ordering_customer"]');
        
        if (divA) divA.style.display = (opt === "a") ? "block" : "none";
        if (divC) divC.style.display = (opt === "c") ? "block" : "none";
        if (divF) divF.style.display = (opt === "f") ? "block" : "none";
    }
    
    if (fieldType === "52a") {
        const divA = set.querySelector('[id^="div_of52a_ordering_institution"]');
        const divD = set.querySelector('[id^="div_of52d_ordering_institution"]');
        
        if (divA) divA.style.display = (opt === "a") ? "block" : "none";
        if (divD) divD.style.display = (opt === "d") ? "block" : "none";
    }
    
    if (fieldType === "56a") {
        const divA = set.querySelector('[id^="div_of56a_intermediary"]');
        const divD = set.querySelector('[id^="div_of56d_intermediary"]');
        
        if (divA) divA.style.display = (opt === "a") ? "block" : "none";
        if (divD) divD.style.display = (opt === "d") ? "block" : "none";
    }
}

/* ===================== BIND EVENTS PER SET ===================== */
function bindSetEvents(idx) {
    const set = document.getElementById("set_" + idx);
    if (!set) return;

    // ===== FIELD 21 - Related Reference (SEKARANG DI DALAM LOOP) =====
    const ref21 = set.querySelector('input[name*="_040_mf21_related_references"]');
    if (ref21) {
        ref21.addEventListener("blur", function() {
            let val = ref21.value.trim();
            if (val && (val.startsWith("/") || val.endsWith("/") || val.includes("//"))) {
                alert("Set #" + (idx + 1) + " - Warning: Field 21 must not start/end with '/' or contain '//'");
                ref21.focus();
            }
        });
        ref21.addEventListener("keypress", function(e) {
            return avoidSplChars(e);
        });
    }

    // ===== CURRENCY FIELD =====
    const cur = set.querySelector('input[name*="_050_mf32b_currency"]');
    if (cur) {
        cur.addEventListener("input", function() {
            cur.value = cur.value.toUpperCase().replace(/[^A-Z]/g, '');
        });
        cur.addEventListener("blur", function() {
            const currValue = cur.value.trim();
            if (currValue && !isValidCurrency(currValue)) {
                alert("Set #" + (idx + 1) + " - Warning: '" + currValue + "' is not a valid ISO 4217 currency code!");
                cur.focus();
            }
        });
    }

    // ===== AMOUNT FIELD =====
    const amt = set.querySelector('input[name*="_051_mf32b_amount"]');
    if (amt) {
        amt.addEventListener("input", function() {
            formatAmountInput(amt);
        });
        amt.addEventListener("blur", function() {
            formatAmountBlur(amt);
            checkZeroAmount(amt);
        });
        amt.addEventListener("keypress", function(e) {
            return numbersonly(e, cur ? cur.id : "");
        });
    }

    // ===== DROPDOWN 50a - Ordering Customer =====
    const sel50a = set.querySelector('select[name*="_060_of50a_ordering_customer"]');
    if (sel50a) {
        sel50a.addEventListener("change", function() {
            toggleSetOption(idx, "50a", sel50a.value);
        });
    }
    
    // ===== DROPDOWN 52a - Ordering Institution =====
    const sel52a = set.querySelector('select[name*="_070_of52A_ordering_institution"]');
    if (sel52a) {
        sel52a.addEventListener("change", function() {
            toggleSetOption(idx, "52a", sel52a.value);
        });
    }
    
    // ===== DROPDOWN 56a - Intermediary =====
    const sel56a = set.querySelector('select[name*="_080_of56a_intermediary"]');
    if (sel56a) {
        sel56a.addEventListener("change", function() {
            toggleSetOption(idx, "56a", sel56a.value);
        });
    }

    // ===== BIC VALIDATION =====
    const bicSelectors = [
        'input[name*="_062_of50c_identifier_code"]',
        'input[name*="_072_of52a_identifier_code"]',
        'input[name*="_082_of56a_identifier_code"]'
    ];

    bicSelectors.forEach(function(selector) {
        const field = set.querySelector(selector);
        if (field) {
            field.addEventListener("input", function() {
                field.value = field.value.toUpperCase();
            });
            field.addEventListener("blur", function() {
                const bicValue = field.value.trim();
                if (bicValue && !isValidBIC(bicValue)) {
                    alert("Set #" + (idx + 1) + " - Invalid BIC format!\nBIC must be 8 or 11 characters (4 letters + 2 letters + 2 alphanumeric + optional 3 alphanumeric)");
                    field.focus();
                }
            });
        }
    });
}

/* ===================== BIND COMMON FIELDS (Outside Loop) ===================== */
function bindCommonFields() {
    // ===== VALUE DATE FIELD - YYMMDD format =====
    const date30 = q("_030_mf30_value_date");
    if (date30) {
        date30.addEventListener("input", function() {
            date30.value = date30.value.replace(/[^\d]/g, "").slice(0, 6);
        });
        date30.addEventListener("keypress", function(e) {
            return numbersonly2(e);
        });
        // Initialize datepicker
        yymmdd("_030_mf30_value_date");
    }

    // ===== TRANSACTION REFERENCE NUMBER (Field 20) =====
    const ref20 = q("_010_mf20_transactions_reference_number");
    if (ref20) {
        ref20.addEventListener("blur", function() {
            let val = ref20.value.trim();
            if (val && (val.startsWith("/") || val.endsWith("/") || val.includes("//"))) {
                alert("Warning: Field 20 must not start/end with '/' or contain '//'");
                ref20.focus();
            }
        });
        ref20.addEventListener("keypress", function(e) {
            return avoidSplChars(e);
        });
    }

    // ===== FIELD 21 TIDAK LAGI DI SINI =====
    // Field 21 sekarang ada di dalam loop (handled by bindSetEvents)
}

/* ===================== INITIALIZE DROPDOWNS FROM EXISTING DATA ===================== */
function initializeDropdownsFromData(setIdx) {
    const set = document.getElementById("set_" + setIdx);
    if (!set) return;

    // ===== OF50a - Ordering Customer =====
    const nameAddr = set.querySelector('textarea[name*="_061_of50a_name_address"]');
    const identCode = set.querySelector('input[name*="_062_of50c_identifier_code"]');
    const partyId = set.querySelector('input[name*="_063_of50f_party_identifier"]');
    const details = set.querySelector('input[name*="_065_of50f_details"]');
    const sel50a = set.querySelector('select[name*="_060_of50a_ordering_customer"]');

    if (sel50a) {
        if (nameAddr && nameAddr.value.trim()) {
            sel50a.value = "a";
            toggleSetOption(setIdx, "50a", "a");
        } else if (identCode && identCode.value.trim()) {
            sel50a.value = "c";
            toggleSetOption(setIdx, "50a", "c");
        } else if ((partyId && partyId.value.trim()) || (details && details.value.trim())) {
            sel50a.value = "f";
            toggleSetOption(setIdx, "50a", "f");
        }
    }

    // ===== OF52a - Ordering Institution =====
    const party52a = set.querySelector('input[name*="_071_of52a_party_identifier"]');
    const ident52a = set.querySelector('input[name*="_072_of52a_identifier_code"]');
    const party52d = set.querySelector('input[name*="_073_of52d_party_identifier"]');
    const name52d = set.querySelector('textarea[name*="_074_of52d_name_address"]');
    const sel52a = set.querySelector('select[name*="_070_of52A_ordering_institution"]');

    if (sel52a) {
        if ((party52a && party52a.value.trim()) || (ident52a && ident52a.value.trim())) {
            sel52a.value = "a";
            toggleSetOption(setIdx, "52a", "a");
        } else if ((party52d && party52d.value.trim()) || (name52d && name52d.value.trim())) {
            sel52a.value = "d";
            toggleSetOption(setIdx, "52a", "d");
        }
    }

    // ===== OF56a - Intermediary =====
    const party56a = set.querySelector('input[name*="_081_of56a_party_identifier"]');
    const ident56a = set.querySelector('input[name*="_082_of56a_identifier_code"]');
    const party56d = set.querySelector('input[name*="_083_of56d_party_identifier"]');
    const name56d = set.querySelector('textarea[name*="_084_of56d_name_address"]');
    const sel56a = set.querySelector('select[name*="_080_of56a_intermediary"]');

    if (sel56a) {
        if ((party56a && party56a.value.trim()) || (ident56a && ident56a.value.trim())) {
            sel56a.value = "a";
            toggleSetOption(setIdx, "56a", "a");
        } else if ((party56d && party56d.value.trim()) || (name56d && name56d.value.trim())) {
            sel56a.value = "d";
            toggleSetOption(setIdx, "56a", "d");
        }
    }
}

/* ===================== VALIDATION - ENHANCED ===================== */
function validateMT210Enhanced() {
    const errors = [];
    const countInput = q("setCount");
    const setCount = parseInt(countInput.value || "1");

    // ===== VALIDATE FIELD 21 (Related Reference) in ALL SETS =====
    for (let i = 0; i < setCount; i++) {
        const set = document.getElementById("set_" + i);
        if (!set) continue;
        
        const ref21 = set.querySelector('input[name*="_040_mf21_related_references"]');
        if (ref21) {
            const val = ref21.value.trim();
            if (!val) {
                errors.push("Set #" + (i + 1) + " - Field 21 (Related Reference) is mandatory");
            } else if (val.startsWith("/") || val.endsWith("/") || val.includes("//")) {
                errors.push("Set #" + (i + 1) + " - Field 21: Must not start/end with '/' or contain '//'");
            }
        }
    }

    // ===== COLLECT ALL CURRENCY CODES =====
    const currencies = [];
    for (let i = 0; i < setCount; i++) {
        const set = document.getElementById("set_" + i);
        if (!set) continue;
        
        const curInput = set.querySelector('input[name*="_050_mf32b_currency"]');
        if (curInput && curInput.value.trim()) {
            currencies.push(curInput.value.trim().toUpperCase());
        }
    }

    // ===== RULE C3: All currency codes must be the same =====
    if (currencies.length > 0) {
        const firstCur = currencies[0];
        const allSame = currencies.every(c => c === firstCur);
        if (!allSame) {
            errors.push("Rule C3 Violation: All Currency Codes (Field 32B) must be the same across all sets.\nFound: " + currencies.join(", "));
        }

        // ===== CHECK FORBIDDEN COMMODITIES =====
        const forbidden = ["XAU", "XAG", "XPD", "XPT"];
        if (forbidden.includes(firstCur)) {
            errors.push("Rule C08 Error: Currency " + firstCur + " is not allowed. Use category 6 messages for commodities.");
        }
    }

    // ===== RULE C2: Either Field 50a OR Field 52a must be present (not both) =====
    for (let i = 0; i < setCount; i++) {
        const set = document.getElementById("set_" + i);
        if (!set) continue;

        const sel50a = set.querySelector('select[name*="_060_of50a_ordering_customer"]');
        const sel52a = set.querySelector('select[name*="_070_of52A_ordering_institution"]');

        const has50a = sel50a && sel50a.value !== "";
        const has52a = sel52a && sel52a.value !== "";

        if (has50a && has52a) {
            errors.push("Set #" + (i + 1) + " - Rule C2 Violation: Either Field 50a OR Field 52a must be present, not both.");
        }

        if (!has50a && !has52a) {
            errors.push("Set #" + (i + 1) + " - Rule C2 Violation: Either Field 50a OR Field 52a must be present.");
        }
    }

    // ===== VALIDATE AMOUNTS =====
    for (let i = 0; i < setCount; i++) {
        const set = document.getElementById("set_" + i);
        if (!set) continue;
        
        const amtInput = set.querySelector('input[name*="_051_mf32b_amount"]');
        if (amtInput) {
            const val = amtInput.value.trim();
            if (!val) {
                errors.push("Set #" + (i + 1) + " - Field 32B Amount is mandatory");
            } else {
                const numVal = parseFloat(val.replace(",", "."));
                if (isNaN(numVal) || numVal <= 0) {
                    errors.push("Set #" + (i + 1) + " - Field 32B Amount must be greater than 0");
                }
            }
        }
    }

    // ===== SHOW ERRORS IF ANY =====
    if (errors.length > 0) {
        alert("Validation Errors:\n\n" + errors.map((e, i) => (i + 1) + ". " + e).join("\n\n"));
        return false;
    }

    return true;
}

/* ===================== VALIDATE MT210 (Called by onsubmit) ===================== */
function validateMT210() {
    // jQuery validation first
    if (typeof jQuery !== "undefined" && jQuery.fn && jQuery.fn.validate) {
        var validator = jQuery("#form_mt210").validate();
        if (validator && !jQuery("#form_mt210").valid()) {
            return false;
        }
    }
    
    // Enhanced validation (Rules C1, C2, C3)
    return validateMT210Enhanced();
}

/* ===================== ADD / REMOVE LOOP ===================== */
function addSet() {
    const container = document.getElementById("setsContainer");
    const countInput = document.getElementById("setCount");
    let currentCount = parseInt(countInput.value || "1");

    // Rule C1: Maximum 10 sets
    if (currentCount >= 10) {
        alert("Maximum 10 sets (Rule C1) allowed.");
        return;
    }

    const newIndex = currentCount;
    const baseSet = document.getElementById("set_0");
    const newSet = baseSet.cloneNode(true);

    // Update set attributes
    newSet.id = "set_" + newIndex;
    newSet.dataset.index = newIndex;

    // Update header
    const header = newSet.querySelector(".loop-header");
    if (header) header.textContent = "Set #" + (newIndex + 1);

    // Update all name attributes and IDs
    const allInputs = newSet.querySelectorAll("input, textarea, select");
    allInputs.forEach(el => {
        // Update name untuk array handling
        if (el.name) {
            if (el.name.includes("_loop")) {
                el.name = el.name.replace(/_loop\d+/, "_loop" + newIndex);
            } else {
                el.name = el.name + "_loop" + newIndex;
            }
        }
        
        // Update ID
        if (el.id) {
            if (el.id.includes("_loop")) {
                el.id = el.id.replace(/_loop\d+/, "_loop" + newIndex);
            } else {
                el.id = el.id + "_loop" + newIndex;
            }
        }
        
        // Clear values (except hidden inputs)
        if (el.type !== "hidden") {
            if (el.tagName.toLowerCase() === "select") {
                el.selectedIndex = 0;
            } else {
                el.value = "";
            }
        }
    });

    // Update div IDs
    const allDivs = newSet.querySelectorAll('[id^="div_of50"], [id^="div_of52"], [id^="div_of56"]');
    allDivs.forEach(div => {
        if (div.id) {
            if (div.id.includes("_loop")) {
                div.id = div.id.replace(/_loop\d+/, "_loop" + newIndex);
            } else {
                div.id = div.id + "_loop" + newIndex;
            }
        }
    });

    // Append to container
    container.appendChild(newSet);
    currentCount++;
    countInput.value = currentCount;

    // Hide all option divs initially
    toggleSetOption(newIndex, "50a", "");
    toggleSetOption(newIndex, "52a", "");
    toggleSetOption(newIndex, "56a", "");
    
    // Bind events for the new set
    bindSetEvents(newIndex);
}

function removeSet() {
    const container = document.getElementById("setsContainer");
    const countInput = document.getElementById("setCount");
    let currentCount = parseInt(countInput.value || "1");

    // Rule C1: At least 1 set must remain
    if (currentCount <= 1) {
        alert("At least one set must remain.");
        return;
    }

    const lastIndex = currentCount - 1;
    const lastSet = document.getElementById("set_" + lastIndex);
    if (lastSet) container.removeChild(lastSet);

    currentCount--;
    countInput.value = currentCount;
}

/* ===================== BIND BUTTON EVENTS ===================== */
function bindAddRemoveButtons() {
    const addBtn = document.getElementById("addSet");
    const removeBtn = document.getElementById("removeSet");

    if (addBtn) {
        addBtn.addEventListener("click", addSet);
    }

    if (removeBtn) {
        removeBtn.addEventListener("click", removeSet);
    }
}

/* ===================== INITIALIZATION ===================== */
function initMt210Form() {
    // Get total sets that exist on page load
    const countInput = q("setCount");
    const setCount = parseInt(countInput.value || "1");

    // Bind events for all existing sets
    for (let i = 0; i < setCount; i++) {
        bindSetEvents(i);
        initializeDropdownsFromData(i);
    }

    // Bind common fields (outside loop)
    bindCommonFields();
    
    // Bind add/remove buttons
    bindAddRemoveButtons();
}

/* ===================== BOOT ===================== */
if (typeof window !== "undefined") {
    if (window.addEventListener) {
        window.addEventListener("DOMContentLoaded", initMt210Form);
    } else if (window.attachEvent) {
        window.attachEvent("onload", initMt210Form);
    }
}

/* ===================== EXPORT FUNCTIONS ===================== */
// Make functions available globally for inline event handlers
window.validateMT210 = validateMT210;
window.addSet = addSet;
window.removeSet = removeSet;