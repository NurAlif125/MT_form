/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

/* ===================== Utilities ===================== */
function q(id) { return document.getElementById(id); }
function show(id, on = true) { const el = q(id); if (el) el.style.display = on ? "block" : "none"; }
function val(id) { const el = q(id); return el ? (el.value || "").trim() : ""; }
function setUpper(id) { const el = q(id); if (el) el.value = el.value.toUpperCase(); }
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

/* ===================== Datepicker helper - always write YYMMDD ===================== */
function yymmdd(id) {
  const el = q(id);
  if (!el) return;
  if (typeof jQuery === "undefined" || !jQuery.fn || !jQuery.fn.datepicker) {
    // jQuery UI not present -> skip
    return;
  }

  jQuery(function($) {
    $("#" + id).datepicker({
      changeMonth: true,
      changeYear: true,
      yearRange: "-100:+10",
      showAnim: "fadeIn",
      // IMPORTANT: onSelect we explicitly set value to YYMMDD
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

    // If input already contains YYMMDD, set datepicker selected date accordingly
    const cur = el.value && el.value.trim();
    if (cur && /^\d{6}$/.test(cur)) {
      const yy = parseInt(cur.slice(0,2), 10);
      const mm = parseInt(cur.slice(2,4), 10);
      const dd = parseInt(cur.slice(4,6), 10);
      const thisYear = new Date().getFullYear();
      const thisCentury = Math.floor(thisYear / 100) * 100;
      let fullYear = thisCentury + yy;
      if (fullYear - thisYear > 10) fullYear -= 100;
      try {
        $(el).datepicker('setDate', new Date(fullYear, mm - 1, dd));
      } catch (e) { /* ignore parse errors */ }
    }
  });
}

/* -------------------- Field Toggle Logic -------------------- */
/* 52a Issuing Bank */
function toggle52a() {
  const opt = val("_090_of52a_option");
  show("wrap_091_of52a_identifier_code", opt === "A");
  show("wrap_092_of52a_name_address", opt === "D");
}

/* 51a Applicant Bank */
function toggle51a() {
  const opt = val("_110_of51a_option");
  show("div_110_of51a_A", opt === "A");
  show("div_110_of51a_D", opt === "D");
}

/* 41a Available With...By... */
function toggle41a() {
  const opt = val("_170_mf41a_option");
  show("wrap_171_mf41a_identifier_code", opt === "A");
  show("wrap_172_mf41d_name_and_address", opt === "D");
  // the "By" select always shown in JSP; no wrapper toggle needed beyond logic above
}

/* 42a Drawee */
function toggle42a() {
  const opt = val("_190_of42a_option");
  show("wrap_191_of42a_identifier_code", opt === "A");
  show("wrap_192_of42d_name_and_address", opt === "D");
}

/* 40E Applicable Rules: OTHR -> show narrative */
function toggle40e() {
  const opt = val("_070_mf40e_applicable_rules");
  show("div_070_mf40e_narrative", opt === "OTHR");
}

/* 58a Requested Confirmation Party */
function toggle58a() {
  const opt = val("_380_of58a_option");
  show("wrap_381_of58a_bic", opt === "A");
  show("wrap_382_of58a_name_address", opt === "D");
}

/* 53a Reimbursing Bank */
function toggle53a() {
  const opt = val("_390_of53a_option");
  show("wrap_391_of53a_bic", opt === "A");
  show("wrap_392_of53a_name_address", opt === "D");
}

/* 57a Advise Through Bank */
function toggle57a() {
  const opt = val("_420_of57a_option");
  show("wrap_421_of57a_bic", opt === "A");
  show("wrap_422_of57a_location", opt === "B");
  show("wrap_383_of57a_name_address", opt === "D"); // matches JSP id used in your markup
}

/* ===================== Init ===================== */
function initMt710Form() {
  // initial toggles
  toggle52a();
  toggle51a();
  toggle41a();
  toggle42a();
  toggle40e();
  toggle58a();
  toggle53a();
  toggle57a();

  // bind change events
  const bind = (id, fn) => { const el = q(id); if (el) el.addEventListener("change", fn); };
  bind("_090_of52a_option", toggle52a);
  bind("_110_of51a_option", toggle51a);
  bind("_170_mf41a_option", toggle41a);
  bind("_190_of42a_option", toggle42a);
  bind("_070_mf40e_applicable_rules", toggle40e);
  bind("_380_of58a_option", toggle58a);
  bind("_390_of53a_option", toggle53a);
  bind("_420_of57a_option", toggle57a);

  // auto-uppercase for currency/BIC/identifier fields
  document.querySelectorAll("input[id*='currency'], input[id*='identifier_code'], input[id*='bic']").forEach(el => {
    el.addEventListener("input", () => {
      el.value = el.value.toUpperCase().replace(/[^A-Z0-9]/g, '');
    });
  });

  // amount formatters
  document.querySelectorAll("input[id*='amount']").forEach(el => {
    el.addEventListener("input", () => formatAmountInput(el));
    el.addEventListener("blur", () => formatAmountBlur(el));
  });

  // percent fields: restrict to 2 digits
  ["_150_of39a_tolerance_plus", "_151_of39a_tolerance_minus"].forEach(id => {
    const el = q(id);
    if (el) el.addEventListener("input", () => { el.value = el.value.replace(/[^\d]/g, "").slice(0,2); });
  });

  // date fields: limit manual typing to digits and attach datepicker that writes YYMMDD
  ["_060_mf31c_date_of_issue", "_080_mf31d_date_of_expiry", "_280_of44c_latest_date"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => { el.value = el.value.replace(/[^\d]/g, "").slice(0,6); });
      yymmdd(id);
    }
  });
}

/* ===================== Form Validation ===================== */
function validateMT710() {
  // mandatory IDs (based on your JSP asterisks)
  const mandatoryIds = [
    "_010_mf27_sequence_of_total",
    "_020_mf40b_form_of_credit",
    "_030_mf20_sender_reference",
    "_040_mf21_documentary_credit_number",
    "_060_mf31c_date_of_issue",
    "_080_mf31d_date_of_expiry",
    "_081_mf31d_place_of_expiry",
    "_120_mf50_applicant",
    "_131_mf59_name_address",
    "_140_mf32b_currency",
    "_141_mf32b_amount",
    "_170_mf41a_option",
    "_173_mf41a_by",
    "_370_mf49_confirmation"
  ];

  for (let id of mandatoryIds) {
    if (isEmpty(val(id))) {
      alert("Please fill all mandatory fields.");
      if (q(id)) q(id).focus();
      return false;
    }
  }

  // dates must be YYMMDD if present
  const dateIds = ["_060_mf31c_date_of_issue", "_080_mf31d_date_of_expiry", "_280_of44c_latest_date"];
  for (let id of dateIds) {
    const v = val(id);
    if (!isEmpty(v) && !isYYMMDD(v)) {
      alert("Invalid date format (YYMMDD) in: " + id);
      if (q(id)) q(id).focus();
      return false;
    }
  }

  // currency & amount 32B
  if (!isCurrency(val("_140_mf32b_currency"))) {
    alert("Invalid currency in 32B (use 3-letter ISO code).");
    q("_140_mf32b_currency").focus();
    return false;
  }
  if (!isSwiftAmount(val("_141_mf32b_amount"))) {
    alert("Invalid amount in 32B. Use n,dd (e.g. 1000,00).");
    q("_141_mf32b_amount").focus();
    return false;
  }

  // percent checks
  if (!isEmpty(val("_150_of39a_tolerance_plus")) && !isPct(val("_150_of39a_tolerance_plus"))) {
    alert("39A Plus % must be 0–99.");
    q("_150_of39a_tolerance_plus").focus(); return false;
  }
  if (!isEmpty(val("_151_of39a_tolerance_minus")) && !isPct(val("_151_of39a_tolerance_minus"))) {
    alert("39A Minus % must be 0–99.");
    q("_151_of39a_tolerance_minus").focus(); return false;
  }

  // conditional musts: if confirmation requested then 58a present
  const conf = val("_370_mf49_confirmation");
  if ((conf === "CONFIRM" || conf === "MAY ADD")) {
    const opt58 = val("_380_of58a_option");
    if (isEmpty(opt58)) { alert("Field 58a is required when Confirmation Instructions = CONFIRM or MAY ADD."); q("_380_of58a_option").focus(); return false; }
    if (opt58 === "A" && !isBIC(val("_381_of58a_bic").toUpperCase())) { alert("Field 58a (Option A): please enter a valid BIC."); q("_381_of58a_bic").focus(); return false; }
    if (opt58 === "D" && isEmpty(val("_382_of58a_name_address"))) { alert("Field 58a (Option D): Name & Address is required."); q("_382_of58a_name_address").focus(); return false; }
  }

  // All checks passed
  return true;
}

/* ===================== Boot ===================== */
window.addEventListener("DOMContentLoaded", initMt710Form);
