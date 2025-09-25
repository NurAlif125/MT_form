/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

/* 
 * MT752 Authorisation to Pay, Accept or Negotiate - UI/UX Script (Final)
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
function toggle53aOption(opt) {
  show("wrap_081_of53a_party_identifier", opt === "A" || opt === "B" || opt === "D");
  show("wrap_082_of53a_identifier_code", opt === "A");
  show("wrap_083_of53a_location", opt === "B");
  show("wrap_084_of53a_name_address", opt === "D");
}
function toggle54aOption(opt) {
  show("wrap_091_of54a_party_identifier", opt === "A" || opt === "B" || opt === "D");
  show("wrap_092_of54a_identifier_code", opt === "A");
  show("wrap_093_of54a_location", opt === "B");
  show("wrap_094_of54a_name_address", opt === "D");
}

/* ===================== Init ===================== */
function initMt752Form() {
  // Initial toggle
  toggle53aOption(val("_080_of53a_senders_correspondent"));
  toggle54aOption(val("_090_of54a_receivers_correspondent"));

  // Bind select changes
  const sel53a = q("_080_of53a_senders_correspondent");
  if (sel53a) sel53a.addEventListener("change", () => toggle53aOption(val("_080_of53a_senders_correspondent")));

  const sel54a = q("_090_of54a_receivers_correspondent");
  if (sel54a) sel54a.addEventListener("change", () => toggle54aOption(val("_090_of54a_receivers_correspondent")));

  // Currency fields → uppercase only
  ["_050_of32b_currency","_071_of33a_currency"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => { el.value = el.value.toUpperCase().replace(/[^A-Z]/g, ''); });
    }
  });

  // Amount fields formatting
  ["_051_of32b_amount","_072_of33a_amount"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => formatAmountInput(el));
      el.addEventListener("blur", () => formatAmountBlur(el));
    }
  });

  // Date fields
  ["_040_mf30_date_of_advice_of_discrepancy_or_mailing","_070_of33a_date"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => { el.value = el.value.replace(/[^\d]/g, "").slice(0,6); });
      yymmdd(id);
    }
  });

  // BIC fields → uppercase alphanumeric
  ["_082_of53a_identifier_code","_092_of54a_identifier_code"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => { el.value = el.value.toUpperCase().replace(/[^A-Z0-9]/g, ''); });
    }
  });
}

/* ===================== Boot ===================== */
window.addEventListener("DOMContentLoaded", initMt752Form);


