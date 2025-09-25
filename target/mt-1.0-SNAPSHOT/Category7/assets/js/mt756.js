/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

/* 
 * MT756 Advice of Reimbursement or Payment - UI/UX Script (Final)
 */

/* ===================== Utilities ===================== */
function q(id) { return document.getElementById(id); }
function show(id, on = true) { const el = q(id); if (el) el.style.display = on ? "block" : "none"; }
function val(id) { const el = q(id); return el ? (el.value || "").trim() : ""; }
function isEmpty(v) { return !v || v.trim() === ""; }

/* ===================== Format Helpers ===================== */
function formatAmountInput(el) {
  if (!el) return;
  el.value = el.value.replace(/[^0-9,]/g, '');
}
function formatAmountBlur(el) {
  if (!el) return;
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
function toggle53aOption(opt) {
  show("wrap_051_of53a_party_identifier", opt === "A" || opt === "B" || opt === "D");
  show("wrap_052_of53a_identifier_code", opt === "A");
  show("wrap_053_of53a_location", opt === "B");
  show("wrap_054_of53a_name_address", opt === "D");
}
function toggle54aOption(opt) {
  show("wrap_061_of54a_party_identifier", opt === "A" || opt === "B" || opt === "D");
  show("wrap_062_of54a_identifier_code", opt === "A");
  show("wrap_063_of54a_location", opt === "B");
  show("wrap_064_of54a_name_address", opt === "D");
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
function validateMT756() {
  // --- Mandatory Fields ---
  if (isEmpty(val("_010_mf20_sender_reference"))) {
    alert("Field 20 (Sender's Reference) wajib."); return false;
  }
  if (isEmpty(val("_020_mf21_presenting_banks_reference"))) {
    alert("Field 21 (Presenting Bank's Reference) wajib."); return false;
  }

  // --- Field 32B: Currency & Amount ---
  if (!isValidCurrency(val("_030_mf32b_currency"))) {
    alert("Field 32B Currency harus kode ISO 4217."); return false;
  }
  if (isEmpty(val("_031_mf32b_amount"))) {
    alert("Field 32B Amount wajib."); return false;
  }

  // --- Field 33A: Date, Currency, Amount ---
  if (val("_040_mf33a_date").length !== 6) {
    alert("Field 33A Date harus 6 digit (YYMMDD)."); return false;
  }
  if (!isValidCurrency(val("_041_mf33a_currency"))) {
    alert("Field 33A Currency harus kode ISO 4217."); return false;
  }
  if (isEmpty(val("_042_mf33a_amount"))) {
    alert("Field 33A Amount wajib."); return false;
  }

  // --- C02: Currency 32B vs 33A must match ---
  if (val("_030_mf32b_currency") !== val("_041_mf33a_currency")) {
    alert("Rule C02: Currency di 32B dan 33A harus sama."); return false;
  }

  // --- If 72Z contains RCB/, then 53a & 54a required ---
  const senderToReceiver = val("_080_of72z_sender_to_receiver_information");
  if (senderToReceiver.includes("RCB/")) {
    if (isEmpty(val("_050_of53a_senders_correspondent"))) {
      alert("Jika ada RCB/ di 72Z, field 53a wajib."); return false;
    }
    if (isEmpty(val("_060_of54a_receivers_correspondent"))) {
      alert("Jika ada RCB/ di 72Z, field 54a wajib."); return false;
    }
  }

  // --- BIC Validation for 53a/54a ---
  const bicFields = ["_052_of53a_identifier_code","_062_of54a_identifier_code"];
  for (let id of bicFields) {
    const bic = val(id);
    if (bic && !isValidBIC(bic)) {
      alert("BIC tidak valid di field " + id.replace(/_/g," ")); 
      return false;
    }
  }

  return true;
}

/* ===================== Init ===================== */
function initMt756Form() {
  // Initial toggle
  toggle53aOption(val("_050_of53a_senders_correspondent"));
  toggle54aOption(val("_060_of54a_receivers_correspondent"));

  // Bind select changes
  const sel53a = q("_050_of53a_senders_correspondent");
  if (sel53a) sel53a.addEventListener("change", () => toggle53aOption(val("_050_of53a_senders_correspondent")));
  const sel54a = q("_060_of54a_receivers_correspondent");
  if (sel54a) sel54a.addEventListener("change", () => toggle54aOption(val("_060_of54a_receivers_correspondent")));

  // Currency fields → uppercase only
  ["_030_mf32b_currency","_041_mf33a_currency"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => { el.value = el.value.toUpperCase().replace(/[^A-Z]/g, ''); });
    }
  });

  // Amount fields formatting
  ["_031_mf32b_amount","_042_mf33a_amount"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => formatAmountInput(el));
      el.addEventListener("blur", () => formatAmountBlur(el));
    }
  });

  // Date field
  const dateEl = q("_040_mf33a_date");
  if (dateEl) {
    dateEl.addEventListener("input", () => { dateEl.value = dateEl.value.replace(/[^\d]/g, "").slice(0,6); });
    yymmdd("_040_mf33a_date");
  }

  // BIC fields → uppercase alphanumeric
  ["_052_of53a_identifier_code","_062_of54a_identifier_code"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => { el.value = el.value.toUpperCase().replace(/[^A-Z0-9]/g, ''); });
    }
  });
}

/* ===================== Boot ===================== */
window.addEventListener("DOMContentLoaded", initMt756Form);


