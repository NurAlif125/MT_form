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
function formatAmountInput(el) { el.value = el.value.replace(/[^0-9,]/g, ''); }
function formatAmountBlur(el) {
  let v = el.value;
  if (!v) return;
  if (v.indexOf(",") === -1) { v = v + ",00"; }
  else {
    let parts = v.split(",");
    let intPart = String(parseInt(parts[0], 10));
    let decPart = (parts[1] || "").padEnd(2, "0").substring(0, 2);
    v = intPart + "," + decPart;
  }
  el.value = v;
}

/* ===================== Validators ===================== */
function isYYMMDD(d) {
  if (!/^\d{6}$/.test(d)) return false;
  const yy = parseInt(d.slice(0,2),10);
  const mm = parseInt(d.slice(2,4),10);
  const dd = parseInt(d.slice(4,6),10);
  if (mm < 1 || mm > 12) return false;
  if (dd < 1 || dd > 31) return false;
  const dim = [31, (yy % 4 === 0 ? 29 : 28),31,30,31,30,31,31,30,31,30,31];
  return dd <= dim[mm-1];
}
function isCurrency(c) { return /^[A-Z]{3}$/.test(c); }
function isSwiftAmount(s) { return /^\d+,\d{2}$/.test(s); }
function isBIC(bic) { return /^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$/.test(bic); }

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
function toggle33aOption(opt) {
  show("wrap_051_of33a_date", opt === "A");
  show("wrap_052_of33a_currency", opt === "A" || opt === "B");
  show("wrap_053_of33a_amount", opt === "A" || opt === "B");
}
function toggle57aOption(opt) {
  show("wrap_061_of57a_party_identifier", opt === "A" || opt === "D" || opt === "B");
  show("wrap_062_of57a_identifier_code", opt === "A");
  show("wrap_063_of57a_location", opt === "B");
  show("wrap_064_of57a_name_address", opt === "D");
}

/* ===================== Init ===================== */
function initMt734Form() {
  toggle33aOption(val("_050_of33a_total_amount_claimed"));
  toggle57aOption(val("_060_of57a_account_with_bank"));

  const bind = (id, fn) => { const el = q(id); if (el) el.addEventListener("change", fn); };
  bind("_050_of33a_total_amount_claimed", () => toggle33aOption(val("_050_of33a_total_amount_claimed")));
  bind("_060_of57a_account_with_bank", () => toggle57aOption(val("_060_of57a_account_with_bank")));

  // uppercase for currency, BIC
  document.querySelectorAll("input[id*='currency'], input[id*='identifier_code']").forEach(el => {
    el.addEventListener("input", () => { el.value = el.value.toUpperCase().replace(/[^A-Z0-9]/g, ''); });
  });

  // amount format
  ["_032_mf32a_amount","_053_of33a_amount"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => formatAmountInput(el));
      el.addEventListener("blur", () => formatAmountBlur(el));
    }
  });

  // date fields
  ["_030_mf32a_date","_051_of33a_date"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => { el.value = el.value.replace(/[^\d]/g, "").slice(0,6); });
      yymmdd(id);
    }
  });
}

/* ===================== Validation ===================== */
function validateMT734() {
  const mandatory = [
    "_010_mf20_sender_trn",
    "_020_mf21_presenting_bank_reference",
    "_030_mf32a_date",
    "_031_mf32a_currency",
    "_032_mf32a_amount",
    "_080_mf77j_discrepancies",
    "_090_mf77b_disposal_of_documents"
  ];
  for (let id of mandatory) {
    if (isEmpty(val(id))) { alert("Please fill all mandatory fields."); if (q(id)) q(id).focus(); return false; }
  }

  // check date
  if (!isYYMMDD(val("_030_mf32a_date"))) {
    alert("Invalid Date in 32A (YYMMDD).");
    q("_030_mf32a_date").focus(); return false;
  }

  // check currency
  if (!isCurrency(val("_031_mf32a_currency"))) {
    alert("Invalid Currency in 32A.");
    q("_031_mf32a_currency").focus(); return false;
  }

  // check amount
  if (!isSwiftAmount(val("_032_mf32a_amount"))) {
    alert("Invalid Amount in 32A. Use n,dd format.");
    q("_032_mf32a_amount").focus(); return false;
  }

  // 33a validation
  const opt33a = val("_050_of33a_total_amount_claimed");
  if (opt33a === "A") {
    if (!isYYMMDD(val("_051_of33a_date"))) { alert("Invalid date in 33a Option A."); return false; }
    if (!isCurrency(val("_052_of33a_currency"))) { alert("Invalid currency in 33a Option A."); return false; }
    if (!isSwiftAmount(val("_053_of33a_amount"))) { alert("Invalid amount in 33a Option A."); return false; }
  }
  if (opt33a === "B") {
    if (!isCurrency(val("_052_of33a_currency"))) { alert("Invalid currency in 33a Option B."); return false; }
    if (!isSwiftAmount(val("_053_of33a_amount"))) { alert("Invalid amount in 33a Option B."); return false; }
  }

  // 57a validation
  const opt57a = val("_060_of57a_account_with_bank");
  if (opt57a === "A") {
    if (!isBIC(val("_062_of57a_identifier_code"))) { alert("57a Option A requires valid BIC."); return false; }
  }
  if (opt57a === "B") {
    if (isEmpty(val("_063_of57a_location"))) { alert("57a Option B requires Location."); return false; }
  }
  if (opt57a === "D") {
    if (isEmpty(val("_064_of57a_name_address"))) { alert("57a Option D requires Name & Address."); return false; }
  }

  return true;
}

/* ===================== Boot ===================== */
window.addEventListener("DOMContentLoaded", initMt734Form);

