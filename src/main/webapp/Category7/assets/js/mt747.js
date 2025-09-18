/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

/* 
 * MT747 Amendment to an Authorisation to Reimburse - UI/UX Script
 */

/* ===================== Utilities ===================== */
function q(id) { return document.getElementById(id); }
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

/* ===================== Init ===================== */
function initMt747Form() {
  // Uppercase currency
  document.querySelectorAll("input[id*='currency']").forEach(el => {
    el.addEventListener("input", () => { el.value = el.value.toUpperCase().replace(/[^A-Z]/g, ''); });
  });

  // Amount format
  ["_051_of32b_amount","_061_of33b_amount","_071_of34b_amount"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => formatAmountInput(el));
      el.addEventListener("blur", () => formatAmountBlur(el));
    }
  });

  // Date fields
  ["_030_mf30_date_of_the_original_authorisation_to_reimburse","_040_of31e_new_date_of_expiry"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => { el.value = el.value.replace(/[^\d]/g, "").slice(0,6); });
      yymmdd(id);
    }
  });
}

/* ===================== Validation ===================== */
function validateMT747() {
  // Mandatory
  const mandatory = [
    "_010_mf20_documentary_credit_number",
    "_030_mf30_date_of_the_original_authorisation_to_reimburse"
  ];
  for (let id of mandatory) {
    if (isEmpty(val(id))) { alert("Please fill all mandatory fields."); if (q(id)) q(id).focus(); return false; }
  }

  // Date fields
  if (!isYYMMDD(val("_030_mf30_date_of_the_original_authorisation_to_reimburse"))) {
    alert("Invalid Date of Original Authorisation (YYMMDD).");
    q("_030_mf30_date_of_the_original_authorisation_to_reimburse").focus(); return false;
  }
  if (!isEmpty(val("_040_of31e_new_date_of_expiry")) && !isYYMMDD(val("_040_of31e_new_date_of_expiry"))) {
    alert("Invalid New Date of Expiry (YYMMDD).");
    q("_040_of31e_new_date_of_expiry").focus(); return false;
  }

  // 32B
  if (!isEmpty(val("_050_of32b_currency")) && !isCurrency(val("_050_of32b_currency"))) { alert("Invalid currency in 32B."); return false; }
  if (!isEmpty(val("_051_of32b_amount")) && !isSwiftAmount(val("_051_of32b_amount"))) { alert("Invalid amount in 32B. Use n,dd format."); return false; }

  // 33B
  if (!isEmpty(val("_060_of33b_currency")) && !isCurrency(val("_060_of33b_currency"))) { alert("Invalid currency in 33B."); return false; }
  if (!isEmpty(val("_061_of33b_amount")) && !isSwiftAmount(val("_061_of33b_amount"))) { alert("Invalid amount in 33B. Use n,dd format."); return false; }

  // 34B
  if (!isEmpty(val("_070_of34b_currency")) && !isCurrency(val("_070_of34b_currency"))) { alert("Invalid currency in 34B."); return false; }
  if (!isEmpty(val("_071_of34b_amount")) && !isSwiftAmount(val("_071_of34b_amount"))) { alert("Invalid amount in 34B. Use n,dd format."); return false; }

  // 39A
  if (!isEmpty(val("_080_of39a_plus")) && (val("_080_of39a_plus") < 0 || val("_080_of39a_plus") > 99)) { alert("Invalid Plus % in 39A."); return false; }
  if (!isEmpty(val("_081_of39a_minus")) && (val("_081_of39a_minus") < 0 || val("_081_of39a_minus") > 99)) { alert("Invalid Minus % in 39A."); return false; }

  // Network Validations
  const hasOneC1 = !isEmpty(val("_040_of31e_new_date_of_expiry")) ||
                   !isEmpty(val("_050_of32b_currency")) || !isEmpty(val("_060_of33b_currency")) ||
                   !isEmpty(val("_070_of34b_currency")) || !isEmpty(val("_080_of39a_plus")) ||
                   !isEmpty(val("_090_of39c_additional_amounts_covered")) ||
                   !isEmpty(val("_100_of72z_sender_to_receiver_information")) ||
                   !isEmpty(val("_110_of77_narrative"));
  if (!hasOneC1) { alert("At least one of 31E, 32B, 33B, 34B, 39A, 39C, 72Z, or 77 must be present (C1 rule)."); return false; }

  const has32 = !isEmpty(val("_050_of32b_currency")) || !isEmpty(val("_051_of32b_amount"));
  const has33 = !isEmpty(val("_060_of33b_currency")) || !isEmpty(val("_061_of33b_amount"));
  const has34 = !isEmpty(val("_070_of34b_currency")) || !isEmpty(val("_071_of34b_amount"));

  if ((has32 || has33) && !has34) { alert("If 32B or 33B is present, 34B must also be present (C2/C3 rule)."); return false; }
  if (has34 && !(has32 || has33)) { alert("If 34B is present, 32B or 33B must also be present (C3 rule)."); return false; }

  if (has32 && has33 && has34) {
    if (val("_050_of32b_currency") !== val("_060_of33b_currency") || val("_050_of32b_currency") !== val("_070_of34b_currency")) {
      alert("Currencies of 32B, 33B, and 34B must be the same (C4 rule)."); return false;
    }
  }

  return true;
}

/* ===================== Boot ===================== */
window.addEventListener("DOMContentLoaded", initMt747Form);

