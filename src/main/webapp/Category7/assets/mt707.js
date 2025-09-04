/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

/* =========================================================
 * MT707 — UX & lightweight client validation
 * Compatible with mt707.jsp structure & field IDs
 * ========================================================= */

/* -------------------- Utilities -------------------- */
function q(id) { return document.getElementById(id); }
function show(id, on = true) { const el = q(id); if (el) el.style.display = on ? "block" : "none"; }
function val(id) { const el = q(id); return el ? (el.value || "").trim() : ""; }
function setUpper(id) { const el = q(id); if (el) el.value = el.value.toUpperCase(); }
function isEmpty(v) { return !v || v.trim() === ""; }

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


/* Block some special chars (used by onkeypress in JSP) */
function avoidSplChars(evt) {
  const ch = String.fromCharCode(evt.which || evt.keyCode);
  // Allow ASCII letters/digits/space and basic punctuation used by SWIFT fields
  if (!/[A-Za-z0-9\s.,:;+\-\/()&'"]/ .test(ch)) {
    evt.preventDefault();
  }
}

/* -------------------- Format/Parsing Helpers -------------------- */
// YYMMDD len=6 numeric + basic calendar check (not full leap-year)
function isYYMMDD(d) {
  if (!/^\d{6}$/.test(d)) return false;
  const yy = parseInt(d.slice(0, 2), 10);
  const mm = parseInt(d.slice(2, 4), 10);
  const dd = parseInt(d.slice(4, 6), 10);
  if (mm < 1 || mm > 12) return false;
  if (dd < 1 || dd > 31) return false;
  // simple day cap per month
  const dim = [31, (yy % 4 === 0 ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  return dd <= dim[mm - 1];
}

function isCurrency(c) { return /^[A-Z]{3}$/.test(c); }

function isSwiftAmount(s) {
  if (isEmpty(s)) return false;
  return /^\d+,\d{2}$/.test(s); // only digits + comma + exactly 2 decimals
}

/* Validate BIC: 8 or 11 chars, pattern: 4!a2!a2!c[3!c] (we’ll do a pragmatic check) */
function isBIC(bic) {
  return /^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$/.test(bic);
}

/* Party Identifier: allow leading '/', length up to 35; we accept plain 1..35 */
function isPartyIdentifier(s) {
  return s.length > 0 && s.length <= 35;
}

/* Simple percent 0–99 */
function isPct(s) {
  if (!/^\d{1,2}$/.test(s)) return false;
  const n = parseInt(s, 10);
  return n >= 0 && n <= 99;
}

/* -------------------- Date Picker Helper (jQuery UI) -------------------- */
// Uses jQuery UI datepicker to put YYMMDD (2-digit year) into a text input
function attachDatePicker(id) {
  const el = q(id);
  if (!el || typeof jQuery === "undefined" || !jQuery.fn.datepicker) return;

  // ensure input stays type="text" (JSP fields already text)
  el.setAttribute("type", "text");

  // dateFormat: 'y' = 2-digit year in jQuery UI; 'mm' = 2-digit month; 'dd' = 2-digit day
  // so 'ymmdd' -> "250904"
  jQuery(el).datepicker({
    dateFormat: "ymmdd",
    changeMonth: true,
    changeYear: true,
    showAnim: "fadeIn",
    yearRange: "-100:+10",
    onSelect: function (dateText) {
      // dateText already formatted as "YYMMDD" because of dateFormat
      el.value = dateText;
    }
  });

  // If the input already contains a YYMMDD value, try to set datepicker's selected date
  const cur = el.value && el.value.trim();
  if (cur && /^\d{6}$/.test(cur)) {
    try {
      // parse based on our format: yy mm dd -> build yyyy-mm-dd for setDate
      const yy = parseInt(cur.slice(0, 2), 10);
      const mm = parseInt(cur.slice(2, 4), 10);
      const dd = parseInt(cur.slice(4, 6), 10);
      // guess century: use current century if reasonable (e.g. 25 -> 2025, 99 -> 1999)
      const thisYear = new Date().getFullYear();
      const thisCentury = Math.floor(thisYear / 100) * 100;
      let fullYear = thisCentury + yy;
      // if resulting year more than +10 ahead, subtract 100 (handle 1999 etc)
      if (fullYear - thisYear > 10) fullYear -= 100;
      jQuery(el).datepicker("setDate", new Date(fullYear, mm - 1, dd));
    } catch (e) {
      // ignore parse errors
    }
  }
}



/* -------------------- Field Toggle Logic -------------------- */
/* 52a Issuing Bank */
function toggle52a() {
  const opt = val("_050_of52a_option");
  show("wrap_051_of52a_identifier_code", opt === "A");
  show("wrap_052_of52a_name_address", opt === "D");
}

/* 41a Available With...By... */
function toggle41a() {
  const opt = val("_210_of41a_option");
  show("wrap_211_of41a_identifier_code", opt === "A");
  show("wrap_212_of41a_name_address", opt === "D");
  // code (BY PAYMENT, etc.) appears if any option chosen
  show("wrap_213_of41a_code", opt === "A" || opt === "D");
}

/* 42a Drawee */
function toggle42a() {
  const opt = val("_230_of42a_option");
  // Party Identifier appears for both A and D (optional in SWIFT, but JSP provides field)
  show("wrap_231_of42a_party_identifier", opt === "A" || opt === "D");
  show("wrap_232_of42a_identifier_code", opt === "A");
  show("wrap_233_of42a_name_address", opt === "D");
}

/* 40E Applicable Rules: OTHR -> show narrative */
function toggle40e() {
  const opt = val("_130_of40e_applicable_rules");
  show("wrap_131_of40e_narrative", opt === "OTHR");
}

/* 71N Amendment charge narrative only if OTHR */
function toggle71n() {
  const code = val("_400_of71n_charge_code");
  show("wrap_401_of71n_narrative", code === "OTHR");
}

/* 58a Requested Confirmation Party */
function toggle58a() {
  const opt = val("_430_of58a_option");
  show("wrap_431_of58a_identifier_code", opt === "A");
  show("wrap_432_of58a_name_address", opt === "D");
}

/* 53a Reimbursing Bank */
function toggle53a() {
  const opt = val("_440_of53a_option");
  show("wrap_441_of53a_identifier_code", opt === "A");
  show("wrap_442_of53a_name_address", opt === "D");
}

/* 57a Advise Through Bank */
function toggle57a() {
  const opt = val("_460_of57a_option");
  show("wrap_461_of57a_identifier_code", opt === "A");
  show("wrap_462_of57a_location", opt === "B");
  show("wrap_463_of57a_name_address", opt === "D");
}

/* -------------------- Structured Text Validators & Helpers -------------------- */
/**
 * Validate structured fields with codes at line start: /CODE/...
 * - allowedCodes: array of allowed codes (e.g., ["ADD","DELETE","REPALL"])
 * - repallExclusive: if true, REPALL can appear only once and no other code can appear
 * Behavior:
 * - Lines starting with "/" must have allowed code
 * - Continuation lines (not starting with "/") are accepted as narrative continuation
 */
function validateStructuredField(id, allowedCodes, repallExclusive) {
  const text = val(id);
  if (isEmpty(text)) return true; // nothing to validate
  const lines = text.split(/\r?\n/);

  let repallCount = 0;
  let anyCodeOtherThanRepall = false;

  for (let i = 0; i < lines.length; i++) {
    const ln = lines[i].trim();
    if (ln.startsWith("/")) {
      // format "/CODE/" or "/CODE/ rest"
      const m = ln.match(/^\/([A-Z]{3,6})\//);
      if (!m) {
        alert(`Invalid code format at line ${i + 1} in ${id}. Expected "/CODE/..."`);
        q(id).focus();
        return false;
      }
      const code = m[1];
      if (!allowedCodes.includes(code)) {
        alert(`Invalid code "${code}" at line ${i + 1} in ${id}. Allowed: ${allowedCodes.join(", ")}`);
        q(id).focus();
        return false;
      }
      if (code === "REPALL") repallCount++;
      else anyCodeOtherThanRepall = true;
    } else {
      // continuation line — ok
    }
  }

  if (repallExclusive && repallCount > 1) {
    alert(`Code REPALL must be used only once in ${id}.`);
    q(id).focus();
    return false;
  }
  if (repallExclusive && repallCount === 1 && anyCodeOtherThanRepall) {
    alert(`When REPALL is used in ${id}, no other code may be used.`);
    q(id).focus();
    return false;
  }
  return true;
}

/* 72Z: Allow codes PHONBEN, TELEBEN; narrative must be last and must NOT start with "/" */
function validate72Z(id) {
  const text = val(id);
  if (isEmpty(text)) return true;
  const lines = text.split(/\r?\n/);

  const allowed = ["PHONBEN", "TELEBEN"];
  let narrativeStarted = false;

  for (let i = 0; i < lines.length; i++) {
    const ln = lines[i];
    if (!narrativeStarted) {
      if (ln.startsWith("/")) {
        const m = ln.match(/^\/([A-Z]{6,8})\//);
        if (!m || !allowed.includes(m[1])) {
          alert(`Invalid code at line ${i + 1} in OF72Z. Allowed codes: ${allowed.join(", ")}`);
          q(id).focus();
          return false;
        }
      } else if (ln.trim() !== "") {
        // narrative begins; must be last block
        narrativeStarted = true;
      }
    } else {
      // after narrative started, no line may start with "/"
      if (ln.startsWith("/")) {
        alert("In OF72Z, narrative must be last. No codes allowed after narrative begins.");
        q(id).focus();
        return false;
      }
    }
  }
  return true;
}

/* 71D charges: codes list; we do light validation for lines that start with "/" */
const CHARGE_CODES = ["AGENT","COMM","CORCOM","DISC","INSUR","POST","STAMP","TELECHAR","WAREHOUS"];
function validate71D(id) {
  const text = val(id);
  if (isEmpty(text)) return true;
  const lines = text.split(/\r?\n/);
  for (let i = 0; i < lines.length; i++) {
    const ln = lines[i].trim();
    if (ln.startsWith("/")) {
      const m = ln.match(/^\/([A-Z]{3,8})\/([A-Z]{3})?([0-9.,]*)?(.*)$/);
      if (!m) {
        alert(`Invalid line format at line ${i + 1} in OF71D. Use /CODE/CCYAmount Details`);
        q(id).focus();
        return false;
      }
      const code = m[1];
      if (!CHARGE_CODES.includes(code)) {
        alert(`Invalid charge code "${code}" at line ${i + 1} in OF71D.`);
        q(id).focus();
        return false;
      }
      // If currency present, must be ISO
      const ccy = m[2] || "";
      if (ccy && !isCurrency(ccy)) {
        alert(`Invalid currency at line ${i + 1} in OF71D.`);
        q(id).focus();
        return false;
      }
      const amt = (m[3] || "").replace(/,/g, "."); // optional amount
      if (amt && !/^(\d+(\.\d{1,2})?)$/.test(amt)) {
        alert(`Invalid amount at line ${i + 1} in OF71D.`);
        q(id).focus();
        return false;
      }
    }
  }
  return true;
}

/* -------------------- Cross-field (C1/C4-style) Light Checks -------------------- */
function checkConfirmationDependency() {
  const conf = val("_420_of49_confirmation_instructions");
  if (conf === "CONFIRM" || conf === "MAY ADD") {
    const opt = val("_430_of58a_option");
    if (opt === "") {
      alert("Field 58a is required when Confirmation Instructions = CONFIRM or MAY ADD.");
      q("_430_of58a_option").focus();
      return false;
    }
    if (opt === "A" && !isBIC(val("_431_of58a_identifier_code").toUpperCase())) {
      alert("Field 58a (Option A): please enter a valid BIC.");
      q("_431_of58a_identifier_code").focus();
      return false;
    }
    if (opt === "D" && isEmpty(val("_432_of58a_name_address"))) {
      alert("Field 58a (Option D): Name & Address is required.");
      q("_432_of58a_name_address").focus();
      return false;
    }
  }
  return true;
}

/* -------------------- Onload Setup -------------------- */
function initMt707Form() {
  // Initial toggles
  toggle52a();
  toggle41a();
  toggle42a();
  toggle40e();
  toggle71n();
  toggle58a();
  toggle53a();
  toggle57a();

  // Bind changes
  const bind = (id, fn) => { const el = q(id); if (el) el.addEventListener("change", fn); };

  bind("_050_of52a_option", toggle52a);
  bind("_210_of41a_option", toggle41a);
  bind("_230_of42a_option", toggle42a);
  bind("_130_of40e_applicable_rules", toggle40e);
  bind("_400_of71n_charge_code", toggle71n);
  bind("_430_of58a_option", toggle58a);
  bind("_440_of53a_option", toggle53a);
  bind("_460_of57a_option", toggle57a);

  // Auto-uppercase for codes/currency/BICs
  const toUpperIds = [
    "_170_of32b_currency","_180_of33b_currency",
    "_211_of41a_identifier_code","_232_of42a_identifier_code",
    "_051_of52a_identifier_code","_431_of58a_identifier_code",
    "_441_of53a_identifier_code"
  ];
  toUpperIds.forEach(id => {
    const el = q(id);
    if (el) el.addEventListener("blur", () => setUpper(id));
  });

// Dates: allow manual YYMMDD typing + attach calendar picker (jQuery UI)
["_070_mf31c_date_of_issue","_090_mf30_date_of_amendment","_320_of44c_latest_date","_140_of31d_date_of_expiry"]
  .forEach(id => {
    const el = q(id);
    if (el) {
      // jika user ketik manual, tetap dibatasi hanya 6 digit angka
      el.addEventListener("input", () => {
        el.value = el.value.replace(/[^\d]/g, "").slice(0, 6);
      });
      // attach jQuery UI datepicker which will set value to YYMMDD when a date is picked
      attachDatePicker(id);
    }
  });

  // Percent fields (39A)
  ["_190_of39a_plus","_191_of39a_minus"].forEach(id => {
    const el = q(id);
    if (el) el.addEventListener("input", () => { el.value = el.value.replace(/[^\d]/g, "").slice(0, 2); });
  });
  
  // Currency realtime uppercase
    document.querySelectorAll("input[id*='currency']").forEach(el => {
      el.addEventListener("input", () => {
        el.value = el.value.toUpperCase().replace(/[^A-Z]/g, '');
      });
    });

    // BIC realtime uppercase
    document.querySelectorAll("input[id*='identifier_code']").forEach(el => {
      el.addEventListener("input", () => {
        el.value = el.value.toUpperCase().replace(/[^A-Z0-9]/g, '');
      });
    });

    // Amount formatters
    document.querySelectorAll("input[id*='amount']").forEach(el => {
      el.addEventListener("input", () => formatAmountInput(el));
      el.addEventListener("blur", () => formatAmountBlur(el));
    });
}

/* -------------------- Public: validateMT707 (onsubmit in JSP) -------------------- */
function validateMT707() {
  // Mandatory basics (asterisked in JSP)
  const mandatoryIds = [
    "_010_mf27_sequence_of_total",
    "_020_mf20_sender_reference",
    "_030_mf21_receiver_reference",
    "_040_mf23_issuing_bank_reference",
    "_070_mf31c_date_of_issue",
    "_080_mf26e_number_of_amendment",
    "_090_mf30_date_of_amendment",
    "_100_mf22a_purpose_of_message",
    "_400_of71n_charge_code" // class=mandatory di JSP
  ];

  for (let i = 0; i < mandatoryIds.length; i++) {
    const id = mandatoryIds[i];
    if (isEmpty(val(id))) {
      alert("Please fill all mandatory fields.");
      q(id).focus();
      return false;
    }
  }

  // Date checks (YYMMDD)
  const dateIds = ["_070_mf31c_date_of_issue","_090_mf30_date_of_amendment","_320_of44c_latest_date","_140_of31d_date_of_expiry"];
  for (let i = 0; i < dateIds.length; i++) {
    const v = val(dateIds[i]);
    if (!isEmpty(v) && !isYYMMDD(v)) {
      alert("Invalid date format (YYMMDD) in: " + dateIds[i]);
      q(dateIds[i]).focus();
      return false;
    }
  }

  // 40E narrative required if OTHR
  if (val("_130_of40e_applicable_rules") === "OTHR" && isEmpty(val("_131_of40e_narrative"))) {
    alert("For Applicable Rules = OTHR, Narrative is required (max 35 chars).");
    q("_131_of40e_narrative").focus();
    return false;
  }

  // 71N narrative required if OTHR
  if (val("_400_of71n_charge_code") === "OTHR" && isEmpty(val("_401_of71n_narrative"))) {
    alert("Narrative is required when Amendment Charge Payable By = OTHR.");
    q("_401_of71n_narrative").focus();
    return false;
  }

  // 32B/33B currency+amount pairs (if either present, both must be valid)
  function checkCurrAmt(ccyId, amtId, label) {
    const ccy = val(ccyId).toUpperCase();
    const amt = val(amtId);
    if (isEmpty(ccy) && isEmpty(amt)) return true; // pair unused
    if (!isCurrency(ccy)) {
      alert(label + ": invalid currency (3-letter ISO).");
      q(ccyId).focus();
      return false;
    }
    if (!isSwiftAmount(amt)) {
      alert(label + ": invalid amount format. Use n,dd (example: 123,45)");
      q(amtId).focus();
      return false;
    }
    return true;
  }
  if (!checkCurrAmt("_170_of32b_currency","_171_of32b_amount","Increase of Credit Amount (32B)")) return false;
  if (!checkCurrAmt("_180_of33b_currency","_181_of33b_amount","Decrease of Credit Amount (33B)")) return false;

  // 39A percentages 0–99 (optional)
  const p = val("_190_of39a_plus"), m = val("_191_of39a_minus");
  if (!isEmpty(p) && !isPct(p)) { alert("39A Plus % must be 0–99."); q("_190_of39a_plus").focus(); return false; }
  if (!isEmpty(m) && !isPct(m)) { alert("39A Minus % must be 0–99."); q("_191_of39a_minus").focus(); return false; }

  // 41a validation if option chosen
  (function validate41a() {
    const opt = val("_210_of41a_option");
    if (opt === "A") {
      if (!isBIC(val("_211_of41a_identifier_code").toUpperCase())) {
        throw { id: "_211_of41a_identifier_code", msg: "41a Option A: Identifier Code (BIC) is required and must be valid." };
      }
    } else if (opt === "D") {
      if (isEmpty(val("_212_of41a_name_address"))) {
        throw { id: "_212_of41a_name_address", msg: "41a Option D: Name & Address is required." };
      }
    } else if (opt !== "") {
      // other options not provided in JSP; ignore
    }
    // Code (BY PAYMENT, etc.) required if 41a is used
    if ((opt === "A" || opt === "D") && isEmpty(val("_213_of41a_code"))) {
      throw { id: "_213_of41a_code", msg: "41a: Please select the availability code (BY PAYMENT/NEGOTIATION/etc.)." };
    }
  })();

  // 42a Drawee if option chosen
  (function validate42a() {
    const opt = val("_230_of42a_option");
    if (opt === "A") {
      if (!isBIC(val("_232_of42a_identifier_code").toUpperCase())) {
        throw { id: "_232_of42a_identifier_code", msg: "42a Option A: Identifier Code (BIC) is required and must be valid." };
      }
      const pi = val("_231_of42a_party_identifier");
      if (!isEmpty(pi) && !isPartyIdentifier(pi)) {
        throw { id: "_231_of42a_party_identifier", msg: "42a Party Identifier must be up to 35 characters." };
      }
    } else if (opt === "D") {
      if (isEmpty(val("_233_of42a_name_address"))) {
        throw { id: "_233_of42a_name_address", msg: "42a Option D: Name & Address is required." };
      }
      const pi = val("_231_of42a_party_identifier");
      if (!isEmpty(pi) && !isPartyIdentifier(pi)) {
        throw { id: "_231_of42a_party_identifier", msg: "42a Party Identifier must be up to 35 characters." };
      }
    }
  })();

  // 52a Issuing Bank if option chosen
  (function validate52a() {
    const opt = val("_050_of52a_option");
    if (opt === "A" && !isBIC(val("_051_of52a_identifier_code").toUpperCase())) {
      throw { id: "_051_of52a_identifier_code", msg: "52a Option A: Identifier Code (BIC) is required and must be valid." };
    }
    if (opt === "D" && isEmpty(val("_052_of52a_name_address"))) {
      throw { id: "_052_of52a_name_address", msg: "52a Option D: Name & Address is required." };
    }
  })();

  // 58a required if 49 = CONFIRM / MAY ADD
  if (!checkConfirmationDependency()) return false;

  // Structured text fields
  const CODE_ADDS = ["ADD","DELETE","REPALL"];
  if (!validateStructuredField("_340_of45b_description_goods", CODE_ADDS, true)) return false;
  if (!validateStructuredField("_350_of46b_documents_required", CODE_ADDS, true)) return false;
  if (!validateStructuredField("_360_of47b_additional_conditions", CODE_ADDS, true)) return false;
  if (!validateStructuredField("_370_of49m_special_payment_beneficiary", ["ADD","DELETE","REPALL"], true)) return false;
  if (!validateStructuredField("_380_of49n_special_payment_bank", ["ADD","DELETE","REPALL"], true)) return false;

  // 71D Charges structured-light check
  if (!validate71D("_390_of71d_charges")) return false;

  // 72Z structured text rules
  if (!validate72Z("_470_of72z_sender_to_receiver")) return false;

  // All good
  return true;

  // Error catcher (use throw in scoped validators)
  function errorOut(e) {
    alert(e.msg || "Validation error.");
    if (e.id) q(e.id).focus();
    return false;
  }
}

/* -------------------- Structured Text Quick Inserts (optional UI hooks) -------------------- */
// Call e.g. insertAdd('_340_of45b_description_goods')
function insertAdd(id)     { insertTemplate(id, "ADD"); }
function insertDelete(id)  { insertTemplate(id, "DELETE"); }
function insertRepAll(id)  { insertTemplate(id, "REPALL"); }

function insertTemplate(id, code) {
  const el = q(id);
  if (!el) return;
  const prefix = `/${code}/ `;
  el.value += (isEmpty(el.value) ? "" : "\n") + prefix;
  el.focus();
  // Put cursor at end
  el.selectionStart = el.selectionEnd = el.value.length;
}

/* -------------------- Boot -------------------- */
window.addEventListener("DOMContentLoaded", initMt707Form);

