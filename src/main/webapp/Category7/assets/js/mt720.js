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
function isPct(s) { if (!/^\d{1,2}$/.test(s)) return false; const n = parseInt(s,10); return n>=0 && n<=99; }

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

    const cur = el.value && el.value.trim();
    if (cur && /^\d{6}$/.test(cur)) {
      const yy = parseInt(cur.slice(0,2), 10);
      const mm = parseInt(cur.slice(2,4), 10);
      const dd = parseInt(cur.slice(4,6), 10);
      const thisYear = new Date().getFullYear();
      const thisCentury = Math.floor(thisYear / 100) * 100;
      let fullYear = thisCentury + yy;
      if (fullYear - thisYear > 10) fullYear -= 100;
      try { $(el).datepicker('setDate', new Date(fullYear, mm - 1, dd)); } catch(e){}
    }
  });
}

/* ===================== Toggle Logic ===================== */
function toggle40e() {
  show("div_060_mf40e_narrative", val("_060_mf40e_applicable_rules") === "OTHR");
}
function toggle52a() {
  const opt = val("_080_of52a_issuing_bank_of_the_original_documentary_credit");
  show("wrap_081_of52a_identifier_code", opt === "A");
  show("wrap_082_of52a_name_address", opt === "D");
}
function toggle41a() {
  const opt = val("_150_mf41a_available_with_by");
  show("wrap_151_mf41a_identifier_code", opt === "A");
  show("wrap_152_mf41d_name_and_address", opt === "D");
}
function toggle42a() {
  const opt = val("_170_of42a_drawee");
  show("wrap_171_of42a_identifier_code", opt === "A");
  show("wrap_172_of42d_name_and_address", opt === "D");
}
function toggle58a() {
  const opt = val("_360_of58a_requested_confirmation_party");
  show("wrap_361_of58a_bic", opt === "A");
  show("wrap_362_of58a_name_address", opt === "D");
}
function toggle57a() {
  const opt = val("_390_of57a_advise_through_bank");
  show("wrap_391_of57a_bic", opt === "A");
  show("wrap_392_of57a_location", opt === "B");
  show("wrap_393_of57a_name_address", opt === "D");
}

/* ===================== Init ===================== */
function initMt720Form() {
  toggle40e(); toggle52a(); toggle41a(); toggle42a(); toggle58a(); toggle57a();

  const bind = (id, fn) => { const el = q(id); if (el) el.addEventListener("change", fn); };
  bind("_060_mf40e_applicable_rules", toggle40e);
  bind("_080_of52a_issuing_bank_of_the_original_documentary_credit", toggle52a);
  bind("_150_mf41a_available_with_by", toggle41a);
  bind("_170_of42a_drawee", toggle42a);
  bind("_360_of58a_requested_confirmation_party", toggle58a);
  bind("_390_of57a_advise_through_bank", toggle57a);

  document.querySelectorAll("input[id*='currency'], input[id*='identifier_code'], input[id*='bic']").forEach(el => {
    el.addEventListener("input", () => { el.value = el.value.toUpperCase().replace(/[^A-Z0-9]/g, ''); });
  });

  const amt = q("_121_mf32b_amount");
  if (amt) {
    amt.addEventListener("input", () => formatAmountInput(amt));
    amt.addEventListener("blur", () => formatAmountBlur(amt));
  }

  ["_130_of39a_tolerance_plus", "_131_of39a_tolerance_minus"].forEach(id => {
    const el = q(id);
    if (el) el.addEventListener("input", () => { el.value = el.value.replace(/[^\d]/g, "").slice(0,2); });
  });

  ["_050_mf31c_date_of_issue", "_070_mf31d_date_of_expiry", "_260_of44c_latest_date_of_shipment"].forEach(id => {
    const el = q(id);
    if (el) {
      el.addEventListener("input", () => { el.value = el.value.replace(/[^\d]/g, "").slice(0,6); });
      yymmdd(id);
    }
  });
}

/* ===================== Validation ===================== */
function validateMT720() {
  const mandatory = [
    "_010_mf27_sequence_of_total",
    "_020_mf40b_type",
    "_021_mf40b_code",
    "_030_mf20_transferring_bank_reference",
    "_040_mf21_documentary_credit_number",
    "_050_mf31c_date_of_issue",
    "_060_mf40e_applicable_rules",
    "_070_mf31d_date_of_expiry",
    "_071_mf31d_place_of_expiry",
    "_100_mf50_name_address",
    "_111_mf59_name_address",
    "_120_mf32b_currency",
    "_121_mf32b_amount",
    "_150_mf41a_available_with_by",
    "_153_mf41a_by",
    "_350_mf49_confirmation_instructions"
  ];
  for (let id of mandatory) {
    if (isEmpty(val(id))) { alert("Please fill all mandatory fields."); if (q(id)) q(id).focus(); return false; }
  }

  ["_050_mf31c_date_of_issue","_070_mf31d_date_of_expiry","_260_of44c_latest_date_of_shipment"].forEach(id=>{
    const v=val(id); if(!isEmpty(v)&&!isYYMMDD(v)){alert("Invalid date (YYMMDD): "+id);q(id).focus();return false;}
  });

  if (!isCurrency(val("_120_mf32b_currency"))) { alert("Invalid currency (32B)"); q("_120_mf32b_currency").focus(); return false; }
  if (!isSwiftAmount(val("_121_mf32b_amount"))) { alert("Invalid amount (32B). Use n,dd (e.g. 1000,00)"); q("_121_mf32b_amount").focus(); return false; }

  if (!isEmpty(val("_130_of39a_tolerance_plus")) && !isPct(val("_130_of39a_tolerance_plus"))) {
    alert("39A Plus % must be 0–99."); q("_130_of39a_tolerance_plus").focus(); return false;
  }
  if (!isEmpty(val("_131_of39a_tolerance_minus")) && !isPct(val("_131_of39a_tolerance_minus"))) {
    alert("39A Minus % must be 0–99."); q("_131_of39a_tolerance_minus").focus(); return false;
  }

  const conf = val("_350_mf49_confirmation_instructions");
  if (conf==="CONFIRM"||conf==="MAY ADD") {
    const opt58 = val("_360_of58a_requested_confirmation_party");
    if (isEmpty(opt58)) { alert("Field 58a required when Confirmation = CONFIRM/MAY ADD"); q("_360_of58a_requested_confirmation_party").focus(); return false; }
    if (opt58==="A" && !isBIC(val("_361_of58a_bic"))) { alert("Field 58a Option A must be a valid BIC"); q("_361_of58a_bic").focus(); return false; }
    if (opt58==="D" && isEmpty(val("_362_of58a_name_address"))) { alert("Field 58a Option D requires Name & Address"); q("_362_of58a_name_address").focus(); return false; }
  }

  return true;
}

/* ===================== Boot ===================== */
window.addEventListener("DOMContentLoaded", initMt720Form);

