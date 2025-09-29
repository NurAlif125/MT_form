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
function toggle52aOption(opt) {
  show("wrap_041_mf52a_party_identifier", opt === "A" || opt === "D");
  show("wrap_042_mf52a_identifier_code", opt === "A");
  show("wrap_043_mf52a_name_address", opt === "D");
}
function toggle34aOption(opt) {
  show("wrap_081_mf34a_date", opt === "A");
  show("wrap_082_mf34a_currency", opt === "A" || opt === "B");
  show("wrap_083_mf34a_amount", opt === "A" || opt === "B");
}
function toggle57aOption(opt) {
  show("wrap_091_of57a_party_identifier", opt === "A" || opt === "D" || opt === "B");
  show("wrap_092_of57a_identifier_code", opt === "A");
  show("wrap_093_of57a_name_address", opt === "D");
}
function toggle58aOption(opt) {
  show("wrap_101_of58a_party_identifier", opt === "A" || opt === "D");
  show("wrap_102_of58a_identifier_code", opt === "A");
  show("wrap_103_of58a_name_address", opt === "D");
}

/* ===================== Auto Calculation ===================== */
function parseAmount(v) {
  if (!v) return 0;
  v = v.replace(/\./g, "").replace(",", ".");
  return parseFloat(v) || 0;
}
function formatAmount(n) {
  return n.toFixed(2).replace(".", ",");
}
function updateTotal34a() {
  const amt32 = parseAmount(val("_051_mf32b_amount"));
  const amt33 = parseAmount(val("_061_of33b_amount"));
  const total = amt32 + amt33;

  const opt34a = val("_080_mf34a_total_amount_claimed");
  if (!opt34a) return; // user belum pilih opsi

  if (opt34a === "A" || opt34a === "B") {
    if (isEmpty(val("_082_mf34a_currency"))) {
      q("_082_mf34a_currency").value = val("_050_mf32b_currency");
    }
    if (total > 0) {
      q("_083_mf34a_amount").value = formatAmount(total);
    }
  }
}

/* ===================== Init ===================== */
function initMt742Form() {
  toggle52aOption(val("_040_mf52a_issuing_bank"));
  toggle34aOption(val("_080_mf34a_total_amount_claimed"));
  toggle57aOption(val("_090_of57a_account_with_bank"));
  toggle58aOption(val("_100_of58a_beneficiary_bank"));

  const bind = (id, fn) => { const el = q(id); if (el) el.addEventListener("change", fn); };
  bind("_040_mf52a_issuing_bank", () => toggle52aOption(val("_040_mf52a_issuing_bank")));
  bind("_080_mf34a_total_amount_claimed", () => toggle34aOption(val("_080_mf34a_total_amount_claimed")));
  bind("_090_of57a_account_with_bank", () => toggle57aOption(val("_090_of57a_account_with_bank")));
  bind("_100_of58a_beneficiary_bank", () => toggle58aOption(val("_100_of58a_beneficiary_bank")));

  // auto calc trigger
  ["_051_mf32b_amount","_061_of33b_amount","_080_mf34a_total_amount_claimed"].forEach(id => {
    const el = q(id);
    if (el) el.addEventListener("input", updateTotal34a);
    if (el) el.addEventListener("change", updateTotal34a);
  });

  // uppercase for currency, BIC
  document.querySelectorAll("input[id*='currency'], input[id*='identifier_code']").forEach(el => {
    el.addEventListener("input", () => { el.value = el.value.toUpperCase().replace(/[^A-Z0-9]/g, ''); });
  });

  // amount format
  ["_051_mf32b_amount","_061_of33b_amount","_083_mf34a_amount"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => formatAmountInput(el));
      el.addEventListener("blur", () => { formatAmountBlur(el); updateTotal34a(); });
    }
  });

  // date fields
  ["_030_of31c_date_of_issue","_081_mf34a_date"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => { el.value = el.value.replace(/[^\d]/g, "").slice(0,6); });
      yymmdd(id);
    }
  });
}

/* ===================== Validation ===================== */
function validateMT742() {
  const mandatory = [
    "_010_mf20_claiming_bank_reference",
    "_020_mf21_documentary_credit_number",
    "_040_mf52a_issuing_bank",
    "_050_mf32b_currency",
    "_051_mf32b_amount",
    "_080_mf34a_total_amount_claimed"
  ];
  for (let id of mandatory) {
    if (isEmpty(val(id))) { alert("Please fill all mandatory fields."); if (q(id)) q(id).focus(); return false; }
  }

  // 31C (optional date)
  if (!isEmpty(val("_030_of31c_date_of_issue")) && !isYYMMDD(val("_030_of31c_date_of_issue"))) {
    alert("Invalid Date of Issue (YYMMDD).");
    q("_030_of31c_date_of_issue").focus(); return false;
  }

  // 32B validation
  if (!isCurrency(val("_050_mf32b_currency"))) { alert("Invalid currency in 32B."); return false; }
  if (!isSwiftAmount(val("_051_mf32b_amount"))) { alert("Invalid amount in 32B. Use n,dd format."); return false; }

  // 33B (optional)
  if (!isEmpty(val("_060_of33b_currency")) && !isCurrency(val("_060_of33b_currency"))) {
    alert("Invalid currency in 33B."); return false;
  }
  if (!isEmpty(val("_061_of33b_amount")) && !isSwiftAmount(val("_061_of33b_amount"))) {
    alert("Invalid amount in 33B."); return false;
  }

  // 34a validation
  const opt34a = val("_080_mf34a_total_amount_claimed");
  if (opt34a === "A") {
    if (!isYYMMDD(val("_081_mf34a_date"))) { alert("Invalid date in 34a Option A."); return false; }
    if (!isCurrency(val("_082_mf34a_currency"))) { alert("Invalid currency in 34a Option A."); return false; }
    if (!isSwiftAmount(val("_083_mf34a_amount"))) { alert("Invalid amount in 34a Option A."); return false; }
  }
  if (opt34a === "B") {
    if (!isCurrency(val("_082_mf34a_currency"))) { alert("Invalid currency in 34a Option B."); return false; }
    if (!isSwiftAmount(val("_083_mf34a_amount"))) { alert("Invalid amount in 34a Option B."); return false; }
  }

  // 52a validation
  const opt52a = val("_040_mf52a_issuing_bank");
  if (opt52a === "A") {
    if (!isBIC(val("_042_mf52a_identifier_code"))) { alert("52a Option A requires valid BIC."); return false; }
  }
  if (opt52a === "D") {
    if (isEmpty(val("_043_mf52a_name_address"))) { alert("52a Option D requires Name & Address."); return false; }
  }

  // 57a validation
  const opt57a = val("_090_of57a_account_with_bank");
  if (opt57a === "A") {
    if (!isBIC(val("_092_of57a_identifier_code"))) { alert("57a Option A requires valid BIC."); return false; }
  }
  if (opt57a === "D") {
    if (isEmpty(val("_093_of57a_name_address"))) { alert("57a Option D requires Name & Address."); return false; }
  }

  // 58a validation
  const opt58a = val("_100_of58a_beneficiary_bank");
  if (opt58a === "A") {
    if (!isBIC(val("_102_of58a_identifier_code"))) { alert("58a Option A requires valid BIC."); return false; }
  }
  if (opt58a === "D") {
    if (isEmpty(val("_103_of58a_name_address"))) { alert("58a Option D requires Name & Address."); return false; }
  }

  return true;
}

/* ===================== Boot ===================== */
window.addEventListener("DOMContentLoaded", initMt742Form);
