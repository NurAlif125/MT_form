/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

/* -------------------- Utilities -------------------- */
function q(id) { return document.getElementById(id); }
function val(id) { const el = q(id); return el ? (el.value || "").trim() : ""; }
function isEmpty(v) { return !v || v.trim() === ""; }
function setUpper(id) { const el = q(id); if (el) el.value = el.value.toUpperCase(); }

function avoidSplChars(evt) {
  const ch = String.fromCharCode(evt.which || evt.keyCode);
  if (!/[A-Za-z0-9\s.,:;+\-\/()&'"]/.test(ch)) {
    evt.preventDefault();
  }
}

/* -------------------- Format/Parsing Helpers -------------------- */
function isYYMMDD(d) {
  if (!/^\d{6}$/.test(d)) return false;
  const yy = parseInt(d.slice(0, 2), 10);
  const mm = parseInt(d.slice(2, 4), 10);
  const dd = parseInt(d.slice(4, 6), 10);
  if (mm < 1 || mm > 12) return false;
  if (dd < 1 || dd > 31) return false;
  const dim = [31, (yy % 4 === 0 ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  return dd <= dim[mm - 1];
}

/* -------------------- Date Picker (YYMMDD) -------------------- */
function attachDatePicker(id) {
  const el = q(id);
  if (!el || typeof jQuery === "undefined" || !jQuery.fn.datepicker) return;

  el.setAttribute("type", "text");
  jQuery(el).datepicker({
    dateFormat: "ymmdd", // gives YYMMDD
    changeMonth: true,
    changeYear: true,
    showAnim: "fadeIn",
    yearRange: "-100:+10",
    onSelect: function (dateText) {
      el.value = dateText;
    }
  });
}

/* -------------------- Structured Text Validation -------------------- */
function validateStructuredField708(id) {
  const text = val(id);
  if (isEmpty(text)) return true;
  const lines = text.split(/\r?\n/);

  let repallCount = 0;
  let otherCodeUsed = false;

  for (let i = 0; i < lines.length; i++) {
    const ln = lines[i].trim();
    if (ln.startsWith("/")) {
      const m = ln.match(/^\/(ADD|DELETE|REPALL)\//);
      if (!m) {
        alert(`Invalid structured code at line ${i + 1} in ${id}. Use /ADD/, /DELETE/, or /REPALL/`);
        q(id).focus();
        return false;
      }
      const code = m[1];
      if (code === "REPALL") repallCount++;
      else otherCodeUsed = true;
    }
  }
  if (repallCount > 1) {
    alert("REPALL may only appear once.");
    q(id).focus();
    return false;
  }
  if (repallCount === 1 && otherCodeUsed) {
    alert("When REPALL is used, no other code may be used.");
    q(id).focus();
    return false;
  }
  return true;
}

/* -------------------- Insert Helpers -------------------- */
function insertAdd(id)    { insertTemplate708(id, "ADD"); }
function insertDelete(id) { insertTemplate708(id, "DELETE"); }
function insertRepAll(id) { insertTemplate708(id, "REPALL"); }

function insertTemplate708(id, code) {
  const el = q(id);
  if (!el) return;
  const prefix = `/${code}/ `;
  el.value += (isEmpty(el.value) ? "" : "\n") + prefix;
  el.focus();
  el.selectionStart = el.selectionEnd = el.value.length;
}

/* -------------------- Init -------------------- */
function initMt708Form() {
  // MF27 sequence of total → digits and "/"
  const seq = q("_010_mf27_sequence_of_total");
  if (seq) {
    seq.addEventListener("input", () => {
      seq.value = seq.value.replace(/[^0-9/]/g, "").slice(0, 5);
    });
  }

  // MF30 date of amendment → YYMMDD
  const date = q("_060_mf30_date_of_amendment");
  if (date) {
    date.addEventListener("input", () => {
      date.value = date.value.replace(/[^\d]/g, "").slice(0, 6);
    });
    attachDatePicker("_060_mf30_date_of_amendment");
  }

  // Auto-uppercase for BIC/Ref fields
  ["_020_mf20_sender_reference","_030_mf21_receiver_reference","_040_mf23_issuing_bank_reference"]
    .forEach(id => {
      const el = q(id);
      if (el) el.addEventListener("blur", () => setUpper(id));
    });
}

window.addEventListener("DOMContentLoaded", initMt708Form);

/* -------------------- Validation (onsubmit) -------------------- */
function validateMT708() {
  // Mandatory
  const mandatoryIds = [
    "_010_mf27_sequence_of_total",
    "_020_mf20_sender_reference",
    "_030_mf21_receiver_reference",
    "_040_mf23_issuing_bank_reference",
    "_050_mf26e_number_of_amendment",
    "_060_mf30_date_of_amendment"
  ];
  for (let i = 0; i < mandatoryIds.length; i++) {
    if (isEmpty(val(mandatoryIds[i]))) {
      alert("Please fill all mandatory fields.");
      q(mandatoryIds[i]).focus();
      return false;
    }
  }

  // Date check
  const d = val("_060_mf30_date_of_amendment");
  if (!isEmpty(d) && !isYYMMDD(d)) {
    alert("Date of Amendment must be YYMMDD format.");
    q("_060_mf30_date_of_amendment").focus();
    return false;
  }

  // Structured text validations
  if (!validateStructuredField708("_070_of45b_description_goods")) return false;
  if (!validateStructuredField708("_080_of46b_documents_required")) return false;
  if (!validateStructuredField708("_090_of47b_additional_conditions")) return false;
  if (!validateStructuredField708("_100_of49m_special_payment_beneficiary")) return false;
  if (!validateStructuredField708("_110_of49n_special_payment_bank")) return false;

  return true;
}
