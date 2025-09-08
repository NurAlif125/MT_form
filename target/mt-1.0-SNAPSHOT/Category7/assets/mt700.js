/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


/* ========== Utility Functions ========== */

// hanya angka
function numbersonly(e, currencyId) {
    const charCode = (e.which) ? e.which : e.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

// hanya huruf & spasi
function textonly(e) {
    let code = e.keyCode || e.which;
    let character = String.fromCharCode(code);
    let allowRegex = /^[a-zA-Z\s-]$/;
    return allowRegex.test(character);
}

// hindari karakter spesial
function avoidSplChars(e) {
    e = e || window.event;
    let bad = /[^\sa-zA-Z0-9\.\,\'\(\)\-\/\:]/i,
        key = String.fromCharCode(e.keyCode || e.which);
    if (e.which !== 0 && e.charCode !== 0 && bad.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) e.preventDefault();
    }
}

// tambahkan koma otomatis (untuk amount)
function cek_koma(obj) {
    if (obj.value && !obj.value.includes(",")) {
        obj.value = obj.value + ",";
    }
}

// tambahkan slash otomatis (untuk account)
function cekSlash(obj) {
    if (obj.value && !obj.value.startsWith("/")) {
        obj.value = "/" + obj.value;
    }
}

/* ========== Datepicker Handler ========== */
function bindDateField(id) {
    const input = document.getElementById(id);
    if (!input) return;

    input.addEventListener("focus", () => {
        input.type = "date"; 
    });
    input.addEventListener("blur", () => {
        input.type = "text"; 
        if (input.value) {
            let val = input.value.replace(/-/g, "");
            if (val.length === 8) {
                input.value = val.substring(2); 
            }
        }
    });
}

/* ========== Option Handlers ========== */

// MF40E Applicable Rules
function handle40eOption() {
    const opt = document.getElementById("_060_mf40e_applicable_rules").value;
    document.getElementById("div_060_mf40e_narrative").style.display =
        (opt === "OTHR") ? "block" : "none";
}

// OF51a Applicant Bank
function handle51aOption() {
    const opt = document.getElementById("_080_of51a_option").value;
    document.getElementById("div_080_of51a_A").style.display =
        (opt === "A") ? "block" : "none";
    document.getElementById("div_080_of51a_D").style.display =
        (opt === "D") ? "block" : "none";
}

// MF41A Available With ... By ...
function handle41aOption() {
    const opt = document.getElementById("_140_mf41a_option").value;
    document.getElementById("wrap_141_mf41a_identifier_code").style.display =
        (opt === "A") ? "block" : "none";
    document.getElementById("wrap_142_mf41d_name_and_address").style.display =
        (opt === "D") ? "block" : "none";
}

// OF42A Drawee
function handle42aOption() {
    const opt = document.getElementById("_160_of42a_option").value;
    document.getElementById("wrap_161_of42a_identifier_code").style.display =
        (opt === "A") ? "block" : "none";
    document.getElementById("wrap_162_of42d_name_and_address").style.display =
        (opt === "D") ? "block" : "none";
}

// OF58a Requested Confirmation Party
function handle58aOption() {
    const opt = document.getElementById("_350_of58a_option").value;
    document.getElementById("wrap_351_of58a_bic").style.display =
        (opt === "A") ? "block" : "none";
    document.getElementById("wrap_352_of58a_name_address").style.display =
        (opt === "D") ? "block" : "none";
}

// OF53a Reimbursing Bank
function handle53aOption() {
    const opt = document.getElementById("_360_of53a_option").value;
    document.getElementById("wrap_361_of53a_bic").style.display =
        (opt === "A") ? "block" : "none";
    document.getElementById("wrap_362_of53a_name_address").style.display =
        (opt === "D") ? "block" : "none";
}

// OF57a Advise Through Bank
function handle57aOption() {
    const opt = document.getElementById("_380_of57a_option").value;
    document.getElementById("wrap_381_of57a_bic").style.display =
        (opt === "A") ? "block" : "none";
    document.getElementById("wrap_382_of57a_location").style.display =
        (opt === "B") ? "block" : "none";
    document.getElementById("wrap_383_of57a_name_address").style.display =
        (opt === "D") ? "block" : "none";
}

/* ========== Init on Page Load ========== */
document.addEventListener("DOMContentLoaded", () => {

    // Bind date fields sesuai id di mt700.jsp
    bindDateField("_050_mf31c_date_of_issue");   
    bindDateField("_070_mf31d_date_of_expiry"); 
    bindDateField("_250_of44c_latest_date");     

    // Handler untuk Option Fields
    const el40e = document.getElementById("_060_mf40e_applicable_rules");
    if (el40e) {
        el40e.addEventListener("change", handle40eOption);
        handle40eOption();
    }

    const el51a = document.getElementById("_080_of51a_option");
    if (el51a) {
        el51a.addEventListener("change", handle51aOption);
        handle51aOption();
    }

    const el41a = document.getElementById("_140_mf41a_option");
    if (el41a) {
        el41a.addEventListener("change", handle41aOption);
        handle41aOption();
    }

    const el42a = document.getElementById("_160_of42a_option");
    if (el42a) {
        el42a.addEventListener("change", handle42aOption);
        handle42aOption();
    }

    const el58a = document.getElementById("_350_of58a_option");
    if (el58a) {
        el58a.addEventListener("change", handle58aOption);
        handle58aOption();
    }

    const el53a = document.getElementById("_360_of53a_option");
    if (el53a) {
        el53a.addEventListener("change", handle53aOption);
        handle53aOption();
    }

    const el57a = document.getElementById("_380_of57a_option");
    if (el57a) {
        el57a.addEventListener("change", handle57aOption);
        handle57aOption();
    }
});



