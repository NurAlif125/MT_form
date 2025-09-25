/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

/* 
 * MT750 Advice of Discrepancy - UI/UX Script (Final)
 */

/* ===================== Utilities ===================== */
function q(id) { return document.getElementById(id); }
function show(id, on = true) { const el = q(id); if (el) el.style.display = on ? "block" : "none"; }
function val(id) { const el = q(id); return el ? (el.value || "").trim() : ""; }
function isEmpty(v) { return !v || v.trim() === ""; }

/* ===================== Format Helpers ===================== */
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
    let intPart = String(parseInt(parts[0], 10));
    let decPart = (parts[1] || "").padEnd(2, "0").substring(0, 2);
    v = intPart + "," + decPart;
  }
  el.value = v;
}

/* ===================== ISO 4217 Currency Validator ===================== */
const ISO4217 = [
  "USD","EUR","JPY","GBP","AUD","CAD","CHF","CNY","SEK","NZD","IDR","SGD","HKD",
  "KRW","NOK","MXN","INR","RUB","ZAR","TRY","BRL","PLN","DKK","MYR","PHP","THB",
  "TWD","AED","SAR","ILS","CZK","HUF","CLP","PKR","BDT","NGN","VND"
];
function isValidCurrency(code) {
  return ISO4217.includes(code.toUpperCase());
}

/* ===================== BIC Validator ===================== */
function isValidBIC(code) {
  if (!code) return false;
  const bic = code.trim().toUpperCase();
  const regex = /^[A-Z0-9]{8}([A-Z0-9]{3})?$/; // 8 or 11 chars
  return regex.test(bic);
}

/* ===================== Toggle Logic ===================== */
function toggle57aOption(opt) {
  show("wrap_081_of57a_party_identifier", opt === "A" || opt === "B" || opt === "D");
  show("wrap_082_of57a_identifier_code", opt === "A");
  show("wrap_083_of57a_location", opt === "B");
  show("wrap_084_of57a_name_address", opt === "D");
}

/* ===================== Validation ===================== */
function validateMT750() {
  // --- Mandatory fields ---
  if (isEmpty(val("_010_mf20_sender_reference"))) {
    alert("Field 20 (Sender's Reference) is mandatory."); return false;
  }
  if (isEmpty(val("_020_mf21_related_reference"))) {
    alert("Field 21 (Related Reference) is mandatory."); return false;
  }
  if (!isValidCurrency(val("_030_mf32b_currency"))) {
    alert("Field 32B Currency invalid or missing."); return false;
  }
  if (isEmpty(val("_031_mf32b_amount"))) {
    alert("Field 32B Amount is mandatory."); return false;
  }
  if (isEmpty(val("_100_mf77j_discrepancies"))) {
    alert("Field 77J (Discrepancies) is mandatory."); return false;
  }

  // --- 57a Conditional ---
  const opt57 = val("_080_of57a_account_with_bank");
  if (opt57 === "A") {
    if (isEmpty(val("_082_of57a_identifier_code"))) {
      alert("57a Option A requires Identifier Code (BIC)."); return false;
    }
    if (!isValidBIC(val("_082_of57a_identifier_code"))) {
      alert("57a Identifier Code must be a valid BIC (8 or 11 chars)."); return false;
    }
  } else if (opt57 === "B") {
    if (isEmpty(val("_083_of57a_location"))) {
      alert("57a Option B requires Location."); return false;
    }
  } else if (opt57 === "D") {
    if (isEmpty(val("_084_of57a_name_address"))) {
      alert("57a Option D requires Name & Address."); return false;
    }
  }

  return true;
}

/* ===================== Init ===================== */
function initMt750Form() {
  // Initial toggle
  toggle57aOption(val("_080_of57a_account_with_bank"));

  // Bind select changes
  const sel57a = q("_080_of57a_account_with_bank");
  if (sel57a) sel57a.addEventListener("change", () => toggle57aOption(val("_080_of57a_account_with_bank")));

  // Currency fields → uppercase only + ISO check
  ["_030_mf32b_currency","_040_of33b_currency","_070_of34b_currency"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => { 
        el.value = el.value.toUpperCase().replace(/[^A-Z]/g, '').slice(0,3); 
      });
      el.addEventListener("blur", () => {
        if (el.value && !isValidCurrency(el.value)) {
          alert("Invalid ISO 4217 currency code: " + el.value);
          el.focus();
        }
      });
    }
  });

  // Amount fields formatting
  ["_031_mf32b_amount","_041_of33b_amount","_071_of34b_amount"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => formatAmountInput(el));
      el.addEventListener("blur", () => formatAmountBlur(el));
    }
  });

  // BIC field → uppercase alphanumeric only
  const bicEl = q("_082_of57a_identifier_code");
  if (bicEl) {
    bicEl.addEventListener("input", () => { 
      bicEl.value = bicEl.value.toUpperCase().replace(/[^A-Z0-9]/g, ''); 
    });
  }
}

/* ===================== Boot ===================== */
window.addEventListener("DOMContentLoaded", initMt750Form);



