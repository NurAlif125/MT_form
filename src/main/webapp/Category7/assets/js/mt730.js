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
function toggle32aOption(opt) {
  show("wrap_051_of32a_date", opt === "D");
  show("wrap_052_of32a_currency", opt === "B" || opt === "D");
  show("wrap_053_of32a_amount", opt === "B" || opt === "D");
}
function toggle57aOption(opt) {
  show("wrap_061_of57a_party_identifier", opt === "A" || opt === "D");
  show("wrap_062_of57a_identifier_code", opt === "A");
  show("wrap_063_of57a_name_address", opt === "D");
}

/* ===================== Init ===================== */
function initMt730Form() {
  toggle32aOption(val("_050_of32a_amount_of_charges"));
  toggle57aOption(val("_060_of57a_account_with_bank"));

  const bind = (id, fn) => { const el = q(id); if (el) el.addEventListener("change", fn); };
  bind("_050_of32a_amount_of_charges", () => toggle32aOption(val("_050_of32a_amount_of_charges")));
  bind("_060_of57a_account_with_bank", () => toggle57aOption(val("_060_of57a_account_with_bank")));

  // uppercase for currency, BIC
  document.querySelectorAll("input[id*='currency'], input[id*='identifier_code']").forEach(el => {
    el.addEventListener("input", () => { el.value = el.value.toUpperCase().replace(/[^A-Z0-9]/g, ''); });
  });

  // amount format
  ["_053_of32a_amount"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => formatAmountInput(el));
      el.addEventListener("blur", () => formatAmountBlur(el));
    }
  });

  // date fields
  ["_040_mf30_date_of_message_being_acknowledged","_051_of32a_date"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => { el.value = el.value.replace(/[^\d]/g, "").slice(0,6); });
      yymmdd(id);
    }
  });
}

/* ===================== Validation ===================== */
function validateMT730() {
  const mandatory = [
    "_010_mf20_sender_reference",
    "_020_mf21_receiver_reference",
    "_040_mf30_date_of_message_being_acknowledged"
  ];
  for (let id of mandatory) {
    if (isEmpty(val(id))) { alert("Please fill all mandatory fields."); if (q(id)) q(id).focus(); return false; }
  }

  // date check
  if (!isYYMMDD(val("_040_mf30_date_of_message_being_acknowledged"))) {
    alert("Invalid Date of Message Being Acknowledged (YYMMDD).");
    q("_040_mf30_date_of_message_being_acknowledged").focus(); return false;
  }

  // 32a validation
  const opt32a = val("_050_of32a_amount_of_charges");
  if (opt32a === "B") {
    if (!isCurrency(val("_052_of32a_currency"))) { alert("Invalid currency in 32a Option B."); return false; }
    if (!isSwiftAmount(val("_053_of32a_amount"))) { alert("Invalid amount in 32a Option B. Use n,dd format."); return false; }
  }
  if (opt32a === "D") {
    if (!isYYMMDD(val("_051_of32a_date"))) { alert("Invalid date in 32a Option D."); return false; }
    if (!isCurrency(val("_052_of32a_currency"))) { alert("Invalid currency in 32a Option D."); return false; }
    if (!isSwiftAmount(val("_053_of32a_amount"))) { alert("Invalid amount in 32a Option D."); return false; }
  }

  // 57a validation
  const opt57a = val("_060_of57a_account_with_bank");
  if (opt57a === "A") {
    if (!isBIC(val("_062_of57a_identifier_code"))) { alert("57a Option A requires valid BIC."); return false; }
  }
  if (opt57a === "D") {
    if (isEmpty(val("_063_of57a_name_address"))) { alert("57a Option D requires Name & Address."); return false; }
  }

  return true;
}

/* ===================== Boot ===================== */
window.addEventListener("DOMContentLoaded", initMt730Form);

