/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
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

/* ===================== Datepicker (YYMMDD) ===================== */
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

/* ===================== Toggle Logic ===================== */
function toggle32aOption(opt) {
  show("wrap_031_mf32a_date", opt === "A");
  show("wrap_032_mf32a_currency", opt === "A" || opt === "B");
  show("wrap_033_mf32a_amount", opt === "A" || opt === "B");
}
function toggle34aOption(opt) {
  show("wrap_071_of34a_date", opt === "A");
  show("wrap_072_of34a_currency", opt === "A" || opt === "B");
  show("wrap_073_of34a_amount", opt === "A" || opt === "B");
}
function toggle53aOption(opt) {
  show("wrap_081_of53a_party_identifier", opt === "A" || opt === "B" || opt === "D");
  show("wrap_082_of53a_identifier_code", opt === "A");
  show("wrap_083_of53a_location", opt === "B");
  show("wrap_084_of53a_name_address", opt === "D");
}
function toggle57aOption(opt) {
  show("wrap_091_of57a_party_identifier", opt === "A" || opt === "B" || opt === "D");
  show("wrap_092_of57a_identifier_code", opt === "A");
  show("wrap_093_of57a_location", opt === "B");
  show("wrap_094_of57a_name_address", opt === "D");
}
function toggle58aOption(opt) {
  show("wrap_101_of58a_party_identifier", opt === "A" || opt === "D");
  show("wrap_102_of58a_identifier_code", opt === "A");
  show("wrap_103_of58a_name_address", opt === "D");
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

/* ===================== Validation ===================== */
function validateMT754() {
  // --- Mandatory fields ---
  if (isEmpty(val("_010_mf20_sender_reference"))) {
    alert("Field 20 (Sender's Reference) is mandatory."); return false;
  }
  if (isEmpty(val("_020_mf21_related_reference"))) {
    alert("Field 21 (Related Reference) is mandatory."); return false;
  }

  // --- 32a Mandatory ---
  const opt32a = val("_030_mf32a_principal_amount_paid_accepted_negotiated");
  if (!opt32a) { alert("Field 32a (Principal Amount) must be completed."); return false; }
  if (opt32a === "A") {
    if (val("_031_mf32a_date").length !== 6) { alert("32a Date (YYMMDD) required."); return false; }
    if (!isValidCurrency(val("_032_mf32a_currency"))) { alert("32a Currency invalid."); return false; }
    if (isEmpty(val("_033_mf32a_amount"))) { alert("32a Amount required."); return false; }
  }
  if (opt32a === "B") {
    if (!isValidCurrency(val("_032_mf32a_currency"))) { alert("32a Currency invalid."); return false; }
    if (isEmpty(val("_033_mf32a_amount"))) { alert("32a Amount required."); return false; }
  }

  // --- C1 Rule: 72Z XOR 77 ---
  if (!isEmpty(val("_110_of72z_sender_to_receiver_information")) && 
      !isEmpty(val("_120_of77_narrative"))) {
    alert("Rule C1: Either 72Z or 77 may be present, not both."); return false;
  }

  // --- C2 Rule: 53a XOR 57a ---
  if (val("_080_of53a_reimbursing_bank") && val("_090_of57a_account_with_bank")) {
    alert("Rule C2: Either 53a or 57a may be present, not both."); return false;
  }

  // --- C3 Rule: Currency consistency 32a & 34a ---
  if (!isEmpty(val("_072_of34a_currency")) && 
      val("_032_mf32a_currency") !== val("_072_of34a_currency")) {
    alert("Rule C3: Currency in 32a and 34a must be the same."); return false;
  }

  // --- BIC Validation for 53a/57a/58a ---
  const bicFields = [
    "_082_of53a_identifier_code",
    "_092_of57a_identifier_code",
    "_102_of58a_identifier_code"
  ];
  for (let id of bicFields) {
    const bic = val(id);
    if (bic && !isValidBIC(bic)) {
      alert("Invalid BIC in field " + id.replace(/_/g," ")); 
      return false;
    }
  }

  return true;
}

/* ===================== Init ===================== */
function initMt754Form() {
  // Initial toggle
  toggle32aOption(val("_030_mf32a_principal_amount_paid_accepted_negotiated"));
  toggle34aOption(val("_070_of34a_total_amount_claimed"));
  toggle53aOption(val("_080_of53a_reimbursing_bank"));
  toggle57aOption(val("_090_of57a_account_with_bank"));
  toggle58aOption(val("_100_of58a_beneficiary_bank"));

  // Bind select changes
  const sel32a = q("_030_mf32a_principal_amount_paid_accepted_negotiated");
  if (sel32a) sel32a.addEventListener("change", () => toggle32aOption(val("_030_mf32a_principal_amount_paid_accepted_negotiated")));
  const sel34a = q("_070_of34a_total_amount_claimed");
  if (sel34a) sel34a.addEventListener("change", () => toggle34aOption(val("_070_of34a_total_amount_claimed")));
  const sel53a = q("_080_of53a_reimbursing_bank");
  if (sel53a) sel53a.addEventListener("change", () => toggle53aOption(val("_080_of53a_reimbursing_bank")));
  const sel57a = q("_090_of57a_account_with_bank");
  if (sel57a) sel57a.addEventListener("change", () => toggle57aOption(val("_090_of57a_account_with_bank")));
  const sel58a = q("_100_of58a_beneficiary_bank");
  if (sel58a) sel58a.addEventListener("change", () => toggle58aOption(val("_100_of58a_beneficiary_bank")));

  // Currency fields : uppercase only
  ["_032_mf32a_currency","_040_of33b_currency","_072_of34a_currency"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => { el.value = el.value.toUpperCase().replace(/[^A-Z]/g, ''); });
    }
  });

  // Amount fields formatting
  ["_033_mf32a_amount","_041_of33b_amount","_073_of34a_amount"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => formatAmountInput(el));
      el.addEventListener("blur", () => formatAmountBlur(el));
    }
  });

  // Date fields
  ["_031_mf32a_date","_071_of34a_date"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => { el.value = el.value.replace(/[^\d]/g, "").slice(0,6); });
      yymmdd(id);
    }
  });

  // BIC fields : uppercase alphanumeric
  ["_082_of53a_identifier_code","_092_of57a_identifier_code","_102_of58a_identifier_code"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => { el.value = el.value.toUpperCase().replace(/[^A-Z0-9]/g, ''); });
    }
  });
}

/* ===================== Boot ===================== */
window.addEventListener("DOMContentLoaded", initMt754Form);
