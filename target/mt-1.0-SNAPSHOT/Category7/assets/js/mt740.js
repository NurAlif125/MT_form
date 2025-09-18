/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

/* ===================== Utilities ===================== */
function q(id) { return document.getElementById(id); }
function show(id, on = true) { const el = q(id); if (el) el.style.display = on ? "block" : "none"; }
function val(id) { const el = q(id); return el ? (el.value || "").trim() : ""; }
function isEmpty(v) { return !v || v.trim() === ""; }

/* ===================== Validators / Regex ===================== */
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
function isPct(s) { if (!/^\d{1,2}$/.test(s)) return false; const n = parseInt(s,10); return n>=0 && n<=99; }

/* ===================== Datepicker helper (YYMMDD) ===================== */
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

/* ===================== Toggle Logic ===================== */
// 58a Negotiating Bank
function toggle58a() {
  const opt = val("_050_of58a_negotiating_bank");
  show("wrap_051_of58a_party_identifier", opt === "A" || opt === "D");
  show("wrap_052_of58a_identifier_code", opt === "A");
  show("wrap_053_of58a_name_address", opt === "D");
}

// 41a Available With
function toggle41a() {
  const opt = val("_100_mf41a_available_with_by");
  show("wrap_101_mf41a_identifier_code", opt === "A");
  show("wrap_102_mf41a_name_address", opt === "D");
  show("wrap_103_mf41a_code", opt !== "");
}

// 42a Drawee
function toggle42a() {
  const opt = val("_120_of42a_drawee");
  show("wrap_121_of42a_identifier_code", opt === "A");
  show("wrap_122_of42a_name_address", opt === "D");
}

// 59 Beneficiary (checkbox)
function toggle59() {
  const checked = q("beneficiary_checkbox").checked;
  show("check_of59", checked);
}


/* ===================== Init ===================== */
function initMt740Form() {
  // initial state
  toggle58a();
  toggle41a();
  toggle42a();
  toggle59();

  // bind change events
  const bind = (id, fn, ev = "change") => {const el = q(id);if (el) el.addEventListener(ev, fn);};
  bind("_050_of58a_negotiating_bank", toggle58a);
  bind("_100_mf41a_available_with_by", toggle41a);
  bind("_120_of42a_drawee", toggle42a);
  bind("beneficiary_checkbox", toggle59, "click");

  // auto-uppercase for currency/BIC fields
  ["_070_mf32b_currency", "_052_of58a_identifier_code", "_101_mf41a_identifier_code", "_121_of42a_identifier_code"].forEach(id => {
    const el = q(id);
    if (el) el.addEventListener("input", () => {
      el.value = el.value.toUpperCase().replace(/[^A-Z0-9]/g, '');
    });
  });

  // date fields (YYMMDD)
  ["_040_of31d_date_of_expiry"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => { el.value = el.value.replace(/[^\d]/g, "").slice(0,6); });
      yymmdd(id);
    }
  });
  
  // amount formatting
    const amt = q("_071_mf32b_amount");
    if (amt) {
      amt.addEventListener("input", ()=>formatAmountInput(amt));
      amt.addEventListener("blur", ()=>formatAmountBlur(amt));
    }
}

/* ===================== Form Validation ===================== */
function validateMT740() {
  // mandatory fields
    const mandatoryIds = [
      "_010_mf20_documentary_credit_number",
      "_030_mf40f_applicable_rules",
      "_070_mf32b_currency",
      "_071_mf32b_amount"
    ];
  for (let id of mandatoryIds) {
    if (isEmpty(val(id))) {
      alert("Please fill all mandatory fields.");
      if (q(id)) q(id).focus();
      return false;
    }
  }

  // date check
  const expiry = val("_040_of31d_date_of_expiry");
  if (!isEmpty(expiry) && !isYYMMDD(expiry)) {
    alert("Invalid date format (YYMMDD) in Expiry Date.");
    q("_040_of31d_date_of_expiry").focus();
    return false;
  }

  // currency check
  if (!isCurrency(val("_070_mf32b_currency"))) {
    alert("Invalid currency (use 3-letter ISO code).");
    q("_070_mf32b_currency").focus();
    return false;
  }

  // amount check
  if (!isSwiftAmount(val("_071_mf32b_amount"))) {
    alert("Invalid amount format. Use n,dd (e.g. 1000,00).");
    q("_071_mf32b_amount").focus();
    return false;
  }

  // percentage check
  if (!isEmpty(val("_080_of39a_plus")) && !isPct(val("_080_of39a_plus"))) {
    alert("39A Plus % must be 0–99.");
    q("_080_of39a_plus").focus(); return false;
  }
  if (!isEmpty(val("_081_of39a_minus")) && !isPct(val("_081_of39a_minus"))) {
    alert("39A Minus % must be 0–99.");
    q("_081_of39a_minus").focus(); return false;
  }

  // BIC checks (58a / 41a / 42a when Option A selected)
  if (val("_050_of58a_negotiating_bank") === "A" && !isBIC(val("_052_of58a_identifier_code"))) {
    alert("Invalid BIC in 58a Negotiating Bank.");
    q("_052_of58a_identifier_code").focus(); return false;
  }
  if (val("_100_mf41a_available_with_by") === "A" && !isBIC(val("_101_mf41a_identifier_code"))) {
    alert("Invalid BIC in 41a Available With.");
    q("_101_mf41a_identifier_code").focus(); return false;
  }
  if (val("_120_of42a_drawee") === "A" && !isBIC(val("_121_of42a_identifier_code"))) {
    alert("Invalid BIC in 42a Drawee.");
    q("_121_of42a_identifier_code").focus(); return false;
  }

  return true;
}

/* ===================== Boot ===================== */
window.addEventListener("DOMContentLoaded", initMt740Form);

