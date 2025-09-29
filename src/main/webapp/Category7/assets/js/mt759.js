/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


/* ===================== Utilities ===================== */
function q(id) { return document.getElementById(id); }
function show(id, on = true) { const el = q(id); if (el) el.style.display = on ? "block" : "none"; }
function val(id) { const el = q(id); return el ? (el.value || "").trim() : ""; }
function isEmpty(v) { return !v || v.trim() === ""; }

/* ===================== Input Helpers ===================== */
// Field 27 (Sequence of Total: n atau n/n, range 1–8)
function restrictSequenceInput(el) {
  el.value = el.value.replace(/[^0-9/]/g, "");
}

// Reference numbers 20 & 21 → uppercase, no spaces
function formatReference(el) {
  el.value = el.value.toUpperCase().replace(/\s+/g, "");
}

// Enforce uppercase alphanumeric (22D, 23H, 23X code)
function enforceUppercase(el) {
  el.value = el.value.toUpperCase().replace(/[^A-Z0-9]/g, "");
}

// Narrative trim
function trimNarrative(el) {
  el.value = el.value.trim();
}

/* ===================== BIC Validator ===================== */
function isValidBIC(code) {
  if (!code) return false;
  const bic = code.trim().toUpperCase();
  const regex = /^[A-Z0-9]{8}([A-Z0-9]{3})?$/; // 8 atau 11 karakter
  return regex.test(bic);
}

/* ===================== Toggle Logic ===================== */
function toggle52aOption(opt) {
  show("wrap_061_of52a_party_identifier", opt === "A" || opt === "D");
  show("wrap_062_of52a_identifier_code", opt === "A");
  show("wrap_063_of52a_name_address", opt === "D");
}

/* ===================== Validation ===================== */
function validateMT759() {
  // --- Field 27 (Sequence of Total) ---
  const seq = val("_010_mf27_sequence_of_total");
  if (isEmpty(seq)) { alert("Field 27 (Sequence of Total) is mandatory."); return false; }

  if (!/^\d(\/\d)?$/.test(seq)) {
    alert("Field 27 must be in format n or n/n (e.g. 1/1)."); return false;
  }
  const parts = seq.split("/");
  const num = parseInt(parts[0], 10);
  const tot = parts[1] ? parseInt(parts[1], 10) : num;
  if (isNaN(num) || isNaN(tot) || num < 1 || num > 8 || tot < 1 || tot > 8 || num > tot) {
    alert("Field 27: Number and Total must be between 1 and 8, with Number ≤ Total."); 
    return false;
  }

  // --- Field 20 (Transaction Reference Number) ---
  const f20 = val("_020_mf20_transaction_reference_number");
  if (isEmpty(f20)) { alert("Field 20 (Transaction Reference Number) is mandatory."); return false; }
  if (/^\/|\/$|\/\//.test(f20)) {
    alert("Field 20 must not start or end with '/', and must not contain '//'"); return false;
  }

  // --- Field 21 (Related Reference) ---
  const f21 = val("_030_of21_related_reference_number");
  if (!isEmpty(f21) && (/^\/|\/$|\/\//.test(f21))) {
    alert("Field 21 must not start or end with '/', and must not contain '//'"); return false;
  }

  // --- Field 22D (Form of Undertaking) ---
  const f22d = val("_040_mf22d_form_of_undertaking");
  if (isEmpty(f22d)) { alert("Field 22D (Form of Undertaking) is mandatory."); return false; }

  // --- Field 23H (Function of Message) ---
  const f23h = val("_070_mf23h_function_of_message");
  if (isEmpty(f23h)) { alert("Field 23H (Function of Message) is mandatory."); return false; }

  // --- Rule C1: Dependency between 22D & 23H ---
  if (["ISSUANCE","REQISSUE","REQAMEND","ISSAMEND"].includes(f23h) && f22d !== "UNDK") {
    alert("Rule C1: If 23H is ISSUANCE/REQISSUE/REQAMEND/ISSAMEND, then 22D must be UNDK."); return false;
  }
  if (f23h === "TRANSFER" && !["DGAR","STBY","UNDK"].includes(f22d)) {
    alert("Rule C1: If 23H is TRANSFER, then 22D must be DGAR, STBY, or UNDK."); return false;
  }
  if (["CLSVOPEN","CLSVCLOS","FRAUDMSG","GENINFAD","OTHERFNC","REIMBURS","REQFINAN"].includes(f23h) 
      && !["DGAR","DOCR","STBY","UNDK"].includes(f22d)) {
    alert("Rule C1: For this 23H, 22D must be DGAR, DOCR, STBY, or UNDK."); return false;
  }

  // --- Field 45D (Narrative) ---
  if (isEmpty(val("_080_mf45d_narrative"))) {
    alert("Field 45D (Narrative) is mandatory."); return false;
  }

  // --- Field 52a (Issuer) BIC check ---
  if (val("_060_of52a_issuer") === "A") {
    const bic = val("_062_of52a_identifier_code");
    if (!isValidBIC(bic)) {
      alert("52a Issuer Option A requires a valid BIC (8 or 11 alphanumeric)."); return false;
    }
  }

  // --- Field 23X (File Identification) ---
  const f23xCode = val("_090_of23x_file_identification");
  const f23xName = val("_091_of23x_file_name");
  if (!isEmpty(f23xCode) && !["COUR","EMAL","FACT","FAXT","HOST","MAIL","OTHR"].includes(f23xCode)) {
    alert("Field 23X Code must be one of: COUR, EMAL, FACT, FAXT, HOST, MAIL, OTHR."); return false;
  }
  if (!isEmpty(f23xCode) && isEmpty(f23xName)) {
    alert("Field 23X: If code is provided, filename/reference must also be provided."); return false;
  }
  if (!isEmpty(f23xName) && /[\/\\]/.test(f23xName)) {
    alert("Field 23X filename must not contain path separators (‘/’ or ‘\\’)."); return false;
  }

  return true;
}

/* ===================== Init ===================== */
function initMT759Form() {
  // Sequence of Total 27
  const seq27 = q("_010_mf27_sequence_of_total");
  if (seq27) seq27.addEventListener("input", () => restrictSequenceInput(seq27));

  // References 20 & 21
  ["_020_mf20_transaction_reference_number", "_030_of21_related_reference_number"].forEach(id => {
    const el = q(id);
    if (el) el.addEventListener("input", () => formatReference(el));
  });

  // Codes (22D, 23H, 23X)
  ["_040_mf22d_form_of_undertaking", "_070_mf23h_function_of_message", "_090_of23x_file_identification"].forEach(id => {
    const el = q(id);
    if (el) el.addEventListener("input", () => enforceUppercase(el));
  });

  // Narrative 45D
  const narr = q("_080_mf45d_narrative");
  if (narr) narr.addEventListener("blur", () => trimNarrative(narr));

  // Issuer 52a toggle
  const issuer = q("_060_of52a_issuer");
  if (issuer) {
    toggle52aOption(issuer.value);
    issuer.addEventListener("change", () => toggle52aOption(issuer.value));
  }

  // BIC field (52a Option A)
  const bicField = q("_062_of52a_identifier_code");
  if (bicField) bicField.addEventListener("input", () => { 
    bicField.value = bicField.value.toUpperCase().replace(/[^A-Z0-9]/g, ""); 
  });
}

/* ===================== Boot ===================== */
window.addEventListener("DOMContentLoaded", initMT759Form);

