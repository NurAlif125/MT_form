<%-- 
    Document   : validate_rule_mt707
    Created on : Sep 4, 2025, 11:02:27 AM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
(function(window, document) {
    "use strict";

    // ====== REGEX & CHARSETS ======
    const X_RE = /^[A-Z0-9 \/\-\?:\(\)\.,'"+]*$/; // basic X
    const Z_RE = /^[A-Z0-9 \/\-\?:\(\)\.,'"+\r\n]*$/; // z (multiline allowed)
    const A3_RE = /^[A-Z]{3}$/;
    const BIC_RE = /^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
    const SWIFT_AMOUNT_RE = /^\d+(,\d{1,3})?$/; // n,dd
    const PCT_RE = /^\d{1,2}$/;

    // charge codes (71D)
    const CHARGE_CODES = ["AGENT","COMM","CORCOM","DISC","INSUR","POST","STAMP","TELECHAR","WAREHOUS"];
    const ALLOWED_41A_BY = ["BY ACCEPTANCE","BY DEF PAYMENT","BY MIXED PYMT","BY NEGOTIATION","BY PAYMENT"];
    const ALLOWED_43P = ["ALLOWED","CONDITIONAL","NOT ALLOWED"];
    const ALLOWED_43T = ["ALLOWED","CONDITIONAL","NOT ALLOWED"];
    const ALLOWED_22A = ["ACNF","ADVI","ISSU"];
    const ALLOWED_40E = ["EUCP LATEST VERSION","EUCPURR LATEST VERSION","OTHR","UCP LATEST VERSION","UCPURR LATEST VERSION"];
    const ALLOWED_49 = ["CONFIRM","MAY ADD","WITHOUT"];
    const ALLOWED_71N = ["APPL","BENE","OTHR"];
    const ALLOWED_REP_CODES = ["ADD","DELETE","REPALL"];
    const ALLOWED_72Z = ["PHONBEN","TELEBEN"];

    // ====== HELPERS ======
    function t(id) {
        var el = document.getElementById(id);
        return el ? (el.value || "").trim() : "";
    }
    function setFocus(id) { var el=document.getElementById(id); if(el) el.focus(); }
    function isEmptyStr(s) { return s === null || s === undefined || (""+s).trim() === ""; }

    function isYYMMDD(v) {
        if (!/^\d{6}$/.test(v)) return false;
        const yy = parseInt(v.slice(0,2),10);
        const mm = parseInt(v.slice(2,4),10);
        const dd = parseInt(v.slice(4,6),10);
        if (mm < 1 || mm > 12) return false;
        if (dd < 1 || dd > 31) return false;
        // quick month-day validity including simple leap-year for Feb from two-digit year
        const thisYear = new Date().getFullYear();
        const thisCentury = Math.floor(thisYear/100)*100;
        let fullYear = thisCentury + yy;
        if (fullYear - thisYear > 10) fullYear -= 100;
        const dim = [31, ( (fullYear%4===0 && fullYear%100!==0) || (fullYear%400===0) ) ? 29 : 28, 31,30,31,30,31,31,30,31,30,31];
        return dd <= dim[mm-1];
    }
    function isCurrency(v) { return A3_RE.test((v||"").toUpperCase()); }
    function isSwiftAmount(v) { return SWIFT_AMOUNT_RE.test((v||"").trim()); }
    function isBIC(v) { return BIC_RE.test((v||"").toUpperCase()); }
    function isPct(v) { return PCT_RE.test((v||"").trim()) && Number(v) >= 0 && Number(v) <= 99; }

    function checkT26(v) {
        if (isEmptyStr(v)) return null;
        if (v.startsWith("/") || v.endsWith("/")) return "Must not start or end with '/'.";
        if (v.indexOf("//") !== -1) return "Must not contain consecutive '//' characters.";
        return null;
    }

    // Structured text: lines starting with /CODE/...
    function validateStructuredFieldValue(value, allowedCodes, repallExclusive) {
        if (isEmptyStr(value)) return null;
        const lines = value.split(/\r?\n/);
        let repallCount = 0;
        let anyOtherCode = false;
        for (let i=0;i<lines.length;i++) {
            const ln = lines[i].trim();
            if (ln.startsWith("/")) {
                const m = ln.match(/^\/([A-Z]{3,6})\//);
                if (!m) return `Invalid code format at line ${i+1}: expected "/CODE/..."`;
                const code = m[1];
                if (!allowedCodes.includes(code)) return `Invalid code "${code}" at line ${i+1}. Allowed: ${allowedCodes.join(", ")}`;
                if (code === "REPALL") repallCount++;
                else anyOtherCode = true;
            } else {
                // ok — continuation or narrative line
            }
        }
        if (repallExclusive && repallCount > 1) return "REPALL must be used at most once.";
        if (repallExclusive && repallCount === 1 && anyOtherCode) return "When REPALL is used, no other code may be used in this field.";
        return null;
    }

    function validate71DField(value) {
        if (isEmptyStr(value)) return null;
        const lines = value.split(/\r?\n/);
        for (let i=0;i<lines.length;i++) {
            const ln = lines[i].trim();
            if (ln.startsWith("/")) {
                // /CODE/CCYAmount Details
                const m = ln.match(/^\/([A-Z]{3,8})\/([A-Z]{3})?([0-9\.,]*)?(.*)$/);
                if (!m) return `Invalid OF71D line ${i+1}. Expect /CODE/CCYAmount Details`;
                const code = m[1];
                if (CHARGE_CODES.indexOf(code) === -1) return `Invalid charge code "${code}" in OF71D line ${i+1}.`;
                const ccy = m[2] || "";
                if (ccy && !isCurrency(ccy)) return `Invalid currency "${ccy}" in OF71D line ${i+1}.`;
                const amt = (m[3] || "").replace(/\./g, "").replace(/,/g,'.'); // tolerate comma/dot
                if (amt && !/^\d+(\.\d{1,2})?$/.test(amt)) return `Invalid amount in OF71D line ${i+1}.`;
            } else {
                // narrative — ok
            }
        }
        return null;
    }

    function validate72ZField(value) {
        if (isEmptyStr(value)) return null;
        const lines = value.split(/\r?\n/);
        let narrativeStarted = false;
        for (let i=0;i<lines.length;i++) {
            const ln = lines[i];
            if (!narrativeStarted) {
                if (ln.startsWith("/")) {
                    const m = ln.match(/^\/([A-Z]{6,8})\//);
                    if (!m) return `Invalid code at line ${i+1} in OF72Z.`;
                    if (ALLOWED_72Z.indexOf(m[1]) === -1) return `Invalid code "${m[1]}" at line ${i+1} in OF72Z.`;
                } else if (ln.trim() !== "") {
                    narrativeStarted = true;
                }
            } else {
                if (ln.startsWith("/")) return `In OF72Z, narrative must be last (line ${i+1}).`;
            }
        }
        return null;
    }

    // check amount decimals for certain currencies (basic)
    const DEC0 = new Set(['JPY','KRW','VND','HUF','XOF','XAF','XPF']);
    const DEC3 = new Set(['BHD','JOD','KWD','OMR','TND','LYD','IQD']);
    function checkAmountByCcy(ccy, amt) {
        if (isEmptyStr(ccy) || isEmptyStr(amt)) return null;
        // mt707.jsp enforces formatting using our isSwiftAmount (n,dd). For safety:
        if (!isSwiftAmount(amt)) return `Amount format invalid. Use comma as decimal separator (example: 123,45).`;
        const dp = (amt.split(",")[1] || "").length;
        let allowed = 2;
        if (DEC0.has(ccy)) allowed = 0;
        if (DEC3.has(ccy)) allowed = 3;
        if (dp > allowed) return `Decimal digits for ${ccy} must be at most ${allowed}.`;
        if (allowed === 0 && dp !== 0) return `Currency ${ccy} must not have decimals.`;
        return null;
    }

    // ====== MAIN VALIDATOR ======
    window.validateMT707 = function() {
        var E = [];

        // Helper to add error and optionally focus later
        function pushErr(msg, idFocus) {
            E.push(msg);
            // store first focus id
            if (!pushErr.firstFocus && idFocus) pushErr.firstFocus = idFocus;
        }
        pushErr.firstFocus = null;

        // --- Mandatory basics (from mt707.jsp) ---
        var v27 = t("_010_mf27_sequence_of_total");
        if (isEmptyStr(v27)) {
            pushErr("MF27 Sequence of Total is mandatory.", "_010_mf27_sequence_of_total");
        } else {
            var m = v27.match(/^(\d+)\/(\d+)$/);
            if (!m) {
                pushErr("MF27 must be in format n/n (e.g. 1/1).", "_010_mf27_sequence_of_total");
            } else {
                var num = parseInt(m[1],10);
                var tot = parseInt(m[2],10);
                // network rule: Number must have fixed value 1; Total 1..8
                if (num !== 1) pushErr("MF27 Number must be 1 (message number).", "_010_mf27_sequence_of_total");
                if (tot < 1 || tot > 8) pushErr("MF27 Total must be between 1 and 8.", "_010_mf27_sequence_of_total");
            }
        }

        var v20 = t("_020_mf20_sender_reference");
        if (isEmptyStr(v20)) pushErr("MF20 Sender's Reference is mandatory.", "_020_mf20_sender_reference");
        else {
            if (v20.length > 16) pushErr("MF20 max 16 characters.", "_020_mf20_sender_reference");
            var t26 = checkT26(v20);
            if (t26) pushErr("MF20: " + t26, "_020_mf20_sender_reference");
        }

        var v21 = t("_030_mf21_receiver_reference");
        if (isEmptyStr(v21)) pushErr("MF21 Receiver's Reference is mandatory (use NONREF if unknown).", "_030_mf21_receiver_reference");
        else {
            if (v21.length > 16) pushErr("MF21 max 16 characters.", "_030_mf21_receiver_reference");
            var t26b = checkT26(v21);
            if (t26b) pushErr("MF21: " + t26b, "_030_mf21_receiver_reference");
        }

        var v23 = t("_040_mf23_issuing_bank_reference");
        if (isEmptyStr(v23)) pushErr("MF23 Issuing Bank's Reference is mandatory.", "_040_mf23_issuing_bank_reference");
        else if (v23.length > 16) pushErr("MF23 max 16 characters.", "_040_mf23_issuing_bank_reference");

        var v31c = t("_070_mf31c_date_of_issue");
        if (isEmptyStr(v31c)) pushErr("MF31C Date of Issue is mandatory (YYMMDD).", "_070_mf31c_date_of_issue");
        else if (!isYYMMDD(v31c)) pushErr("MF31C Date of Issue must be valid YYMMDD.", "_070_mf31c_date_of_issue");

        var v26e = t("_080_mf26e_number_of_amendment");
        if (isEmptyStr(v26e)) pushErr("MF26E Number of Amendment is mandatory.", "_080_mf26e_number_of_amendment");
        else if (!/^\d{1,3}$/.test(v26e)) pushErr("MF26E must be numeric up to 3 digits.", "_080_mf26e_number_of_amendment");

        var v30 = t("_090_mf30_date_of_amendment");
        if (isEmptyStr(v30)) pushErr("MF30 Date of Amendment is mandatory (YYMMDD).", "_090_mf30_date_of_amendment");
        else if (!isYYMMDD(v30)) pushErr("MF30 Date of Amendment must be valid YYMMDD.", "_090_mf30_date_of_amendment");

        var v22a = t("_100_mf22a_purpose_of_message");
        if (isEmptyStr(v22a)) pushErr("MF22A Purpose of Message is mandatory.", "_100_mf22a_purpose_of_message");
        else if (ALLOWED_22A.indexOf(v22a) === -1) pushErr("MF22A must be one of: " + ALLOWED_22A.join(", "), "_100_mf22a_purpose_of_message");

        
        var v71n = t("_400_of71n_charge_code");
        if (!isEmptyStr(v71n)) {
            if (ALLOWED_71N.indexOf(v71n) === -1) {
                pushErr("OF71N must be APPL / BENE / OTHR.", "_400_of71n_charge_code");
            }
            if (v71n === "OTHR") {
                var v71nNarr = t("_401_of71n_narrative");
                if (isEmptyStr(v71nNarr)) {
                    pushErr("OF71N Narrative is required when code = OTHR.", "_401_of71n_narrative");
                } else if (v71nNarr.length > 210) {
                    pushErr("OF71N Narrative max 210 characters.", "_401_of71n_narrative");
                }
            }
        }

        // --- Format checks for dates after 22A if present (some optional) ---
        var dateIds = ["_070_mf31c_date_of_issue","_090_mf30_date_of_amendment","_320_of44c_latest_date","_140_of31d_date_of_expiry"];
        for (var di=0; di<dateIds.length; di++){
            var did = dateIds[di];
            var dv = t(did);
            if (!isEmptyStr(dv) && !isYYMMDD(dv)) pushErr("Invalid date format (YYMMDD) in: " + did, did);
        }

        // --- 40E narrative rule ---
        var v40e = t("_130_of40e_applicable_rules");
        if (!isEmptyStr(v40e) && ALLOWED_40E.indexOf(v40e) === -1) {
            pushErr("OF40E must be one of: " + ALLOWED_40E.join(", "), "_130_of40e_applicable_rules");
        }
        if (v40e === "OTHR") {
            var v40en = t("_131_of40e_narrative");
            if (isEmptyStr(v40en)) pushErr("OF40E Narrative required when Applicable Rules = OTHR.", "_131_of40e_narrative");
            else if (v40en.length > 35) pushErr("OF40E Narrative max 35 chars.", "_131_of40e_narrative");
        } else {
            var v40enn = t("_131_of40e_narrative");
            if (!isEmptyStr(v40enn)) pushErr("OF40E Narrative only allowed when Applicable Rules = OTHR.", "_131_of40e_narrative");
        }

        // --- 32B / 33B: either one or none (C2), but not both ---
        var c32ccy = t("_170_of32b_currency"), c32amt = t("_171_of32b_amount");
        var c33ccy = t("_180_of33b_currency"), c33amt = t("_181_of33b_amount");
        var has32 = (!isEmptyStr(c32ccy) || !isEmptyStr(c32amt));
        var has33 = (!isEmptyStr(c33ccy) || !isEmptyStr(c33amt));
        if (has32 && has33) pushErr("C2: Either field 32B or field 33B may be present, but not both.");
        if (has32) {
            if (isEmptyStr(c32ccy) || !isCurrency(c32ccy)) pushErr("OF32B Currency must be 3-letter ISO.", "_170_of32b_currency");
            if (isEmptyStr(c32amt) || !isSwiftAmount(c32amt)) pushErr("OF32B Amount must be n,dd (example: 123,45).", "_171_of32b_amount");
            else {
                var chk32 = checkAmountByCcy(c32ccy.toUpperCase(), c32amt);
                if (chk32) pushErr("OF32B: " + chk32, "_171_of32b_amount");
            }
        }
        if (has33) {
            if (isEmptyStr(c33ccy) || !isCurrency(c33ccy)) pushErr("OF33B Currency must be 3-letter ISO.", "_180_of33b_currency");
            if (isEmptyStr(c33amt) || !isSwiftAmount(c33amt)) pushErr("OF33B Amount must be n,dd (example: 123,45).", "_181_of33b_amount");
            else {
                var chk33 = checkAmountByCcy(c33ccy.toUpperCase(), c33amt);
                if (chk33) pushErr("OF33B: " + chk33, "_181_of33b_amount");
            }
        }

        // --- 39A percentages ---
        var pplus = t("_190_of39a_plus"), pminus = t("_191_of39a_minus");
        if (!isEmptyStr(pplus) && !isPct(pplus)) pushErr("39A Plus % must be 0–99.", "_190_of39a_plus");
        if (!isEmptyStr(pminus) && !isPct(pminus)) pushErr("39A Minus % must be 0–99.", "_191_of39a_minus");

        // --- 41a (Available With) option logic ---
        var opt41 = t("_210_of41a_option");
        if (opt41 === "A") {
            var bic41 = t("_211_of41a_identifier_code");
            if (isEmptyStr(bic41) || !isBIC(bic41)) pushErr("41a Option A: Identifier Code (BIC) required and must be valid.", "_211_of41a_identifier_code");
        } else if (opt41 === "D") {
            var na41 = t("_212_of41a_name_address");
            if (isEmptyStr(na41)) pushErr("41a Option D: Name & Address required.", "_212_of41a_name_address");
        }
        if ((opt41 === "A" || opt41 === "D") && isEmptyStr(t("_213_of41a_code"))) pushErr("41a: Please select the availability code (BY ...).", "_213_of41a_code");
        else if (!isEmptyStr(t("_213_of41a_code")) && ALLOWED_41A_BY.indexOf(t("_213_of41a_code")) === -1) pushErr("41a Code invalid.", "_213_of41a_code");

        // --- 42a Drawee ---
        var opt42 = t("_230_of42a_option");
        if (opt42 === "A") {
            var bic42 = t("_232_of42a_identifier_code");
            if (isEmptyStr(bic42) || !isBIC(bic42)) pushErr("42a Option A: Identifier Code (BIC) required and must be valid.", "_232_of42a_identifier_code");
            var pi = t("_231_of42a_party_identifier");
            if (!isEmptyStr(pi) && pi.length > 35) pushErr("42a Party Identifier must be up to 35 characters.", "_231_of42a_party_identifier");
        } else if (opt42 === "D") {
            if (isEmptyStr(t("_233_of42a_name_address"))) pushErr("42a Option D: Name & Address required.", "_233_of42a_name_address");
            var pi2 = t("_231_of42a_party_identifier");
            if (!isEmptyStr(pi2) && pi2.length > 35) pushErr("42a Party Identifier must be up to 35 characters.", "_231_of42a_party_identifier");
        }

        // --- 52a Issuing Bank vs 50B (C3) ---
        var opt52 = t("_050_of52a_option");
        var has50b = !isEmptyStr(t("_060_of50b_non_bank_issuer"));
        var has52a = (opt52 === "A" || opt52 === "D");
        if ((has50b && has52a) || (!has50b && !has52a)) {
            pushErr("C3: Either field 50B or field 52a must be present, but not both.", "_050_of52a_option");
        }
        if (opt52 === "A") {
            var bic52 = t("_051_of52a_identifier_code");
            if (isEmptyStr(bic52) || !isBIC(bic52)) pushErr("52a Option A: Identifier Code (BIC) must be valid.", "_051_of52a_identifier_code");
        } else if (opt52 === "D") {
            if (isEmptyStr(t("_052_of52a_name_address"))) pushErr("52a Option D: Name & Address is required.", "_052_of52a_name_address");
        }

        // --- 44C vs 44D (C4) ---
        var v44c = t("_320_of44c_latest_date");
        var v44d = t("_330_of44d_shipment_period");
        if (!isEmptyStr(v44c) && !isEmptyStr(v44d)) pushErr("C4: Either field 44C or 44D may be present, but not both.");
        if (!isEmptyStr(v44c) && !isYYMMDD(v44c)) pushErr("44C must be YYMMDD.", "_320_of44c_latest_date");

        // --- Structured text fields: 45B, 46B, 47B, 49M, 49N ---
        var s45 = t("_340_of45b_description_goods");
        var s46 = t("_350_of46b_documents_required");
        var s47 = t("_360_of47b_additional_conditions");
        var s49m = t("_370_of49m_special_payment_beneficiary");
        var s49n = t("_380_of49n_special_payment_bank");
        var structErr;

        structErr = validateStructuredFieldValue(s45, ALLOWED_REP_CODES, true);
        if (structErr) pushErr("OF45B: " + structErr, "_340_of45b_description_goods");
        structErr = validateStructuredFieldValue(s46, ALLOWED_REP_CODES, true);
        if (structErr) pushErr("OF46B: " + structErr, "_350_of46b_documents_required");
        structErr = validateStructuredFieldValue(s47, ALLOWED_REP_CODES, true);
        if (structErr) pushErr("OF47B: " + structErr, "_360_of47b_additional_conditions");
        structErr = validateStructuredFieldValue(s49m, ALLOWED_REP_CODES, true);
        if (structErr) pushErr("OF49M: " + structErr, "_370_of49m_special_payment_beneficiary");
        structErr = validateStructuredFieldValue(s49n, ALLOWED_REP_CODES, true);
        if (structErr) pushErr("OF49N: " + structErr, "_380_of49n_special_payment_bank");

        // --- 71D Charges structured-light check ---
        var vv71d = t("_390_of71d_charges");
        var v71derr = validate71DField(vv71d);
        if (v71derr) pushErr("OF71D: " + v71derr, "_390_of71d_charges");

        // --- 72Z structured text rules ---
        var vv72z = t("_470_of72z_sender_to_receiver");
        var v72err = validate72ZField(vv72z);
        if (v72err) pushErr("OF72Z: " + v72err, "_470_of72z_sender_to_receiver");

        // --- 49 Confirmation -> 58a requirement ---
        var v49 = t("_420_of49_confirmation_instructions");
        if (v49 === "CONFIRM" || v49 === "MAY ADD") {
            var opt58 = t("_430_of58a_option");
            if (isEmptyStr(opt58)) pushErr("Field 58a is required when Confirmation Instructions = CONFIRM or MAY ADD.", "_430_of58a_option");
            else if (opt58 === "A") {
                var bic58 = t("_431_of58a_identifier_code");
                if (isEmptyStr(bic58) || !isBIC(bic58)) pushErr("Field 58a (Option A): Identifier Code (BIC) required and must be valid.", "_431_of58a_identifier_code");
            } else if (opt58 === "D") {
                if (isEmptyStr(t("_432_of58a_name_address"))) pushErr("Field 58a (Option D): Name & Address is required.", "_432_of58a_name_address");
            }
        }

        // --- 53a Reimbursing Bank ---
        var opt53 = t("_440_of53a_option");
        if (opt53 === "A") {
            if (!isBIC(t("_441_of53a_identifier_code"))) pushErr("53a Option A: Identifier Code must be valid BIC.", "_441_of53a_identifier_code");
        } else if (opt53 === "D") {
            if (isEmptyStr(t("_442_of53a_name_address"))) pushErr("53a Option D: Name & Address required.", "_442_of53a_name_address");
        }

        // --- 57a Advise Through Bank ---
        var opt57 = t("_460_of57a_option");
        if (opt57 === "A") {
            if (!isBIC(t("_461_of57a_identifier_code"))) pushErr("57a Option A: Identifier Code must be valid BIC.", "_461_of57a_identifier_code");
        } else if (opt57 === "B") {
            if (isEmptyStr(t("_462_of57a_location"))) pushErr("57a Option B: Location required.", "_462_of57a_location");
        } else if (opt57 === "D") {
            if (isEmptyStr(t("_463_of57a_name_address"))) pushErr("57a Option D: Name & Address required.", "_463_of57a_name_address");
        }

        // --- 48 Period for Presentation check ---
        var v48d = t("_410_of48_days");
        if (!isEmptyStr(v48d) && !/^\d{1,3}$/.test(v48d)) pushErr("OF48 Days must be numeric up to 3 digits.", "_410_of48_days");

        // --- 43P & 43T codes ---
        var v43p = t("_260_of43p_partial_shipments");
        if (!isEmptyStr(v43p) && ALLOWED_43P.indexOf(v43p) === -1) pushErr("OF43P must be one of: " + ALLOWED_43P.join(", "), "_260_of43p_partial_shipments");
        var v43t = t("_270_of43t_transhipment");
        if (!isEmptyStr(v43t) && ALLOWED_43T.indexOf(v43t) === -1) pushErr("OF43T must be one of: " + ALLOWED_43T.join(", "), "_270_of43t_transhipment");

        // --- 31D date/place length ---
        var v31d = t("_140_of31d_date_of_expiry");
        if (!isEmptyStr(v31d) && !isYYMMDD(v31d)) pushErr("OF31D date must be YYMMDD.", "_140_of31d_date_of_expiry");
        var v31dPlace = t("_141_of31d_place_of_expiry");
        if (!isEmptyStr(v31dPlace) && v31dPlace.length > 29) pushErr("OF31D Place max 29 chars.", "_141_of31d_place_of_expiry");

        // --- Basic length checks for common name/address fields (as in JSP maxlength) ---
        var max140Ids = ["_052_of52a_name_address","_150_of50_changed_applicant_details","_161_of59_name_address",
                         "_212_of41a_name_address","_233_of42a_name_address","_240_of42m_mixed_payment",
                         "_250_of42p_negotiation_details","_280_of44a_place_dispatch","_290_of44e_port_loading",
                         "_300_of44f_port_discharge","_310_of44b_final_destination","_330_of44d_shipment_period",
                         "_340_of45b_description_goods","_350_of46b_documents_required","_360_of47b_additional_conditions",
                         "_370_of49m_special_payment_beneficiary","_380_of49n_special_payment_bank","_450_of78_instructions",
                         "_463_of57a_name_address","_442_of53a_name_address","_401_of71n_narrative","_470_of72z_sender_to_receiver"];
        for (var ii=0; ii<max140Ids.length; ii++){
            var id = max140Ids[ii];
            var vv = t(id);
            if (!isEmptyStr(vv) && vv.length > 140) pushErr(id + " exceeds maxlength 140 characters.", id);
        }

        // --- Fields 32B/33B currency case-sensitivity: enforce uppercase & 3 letters ---
        if (!isEmptyStr(c32ccy) && !isCurrency(c32ccy)) pushErr("OF32B Currency invalid (3 letters).", "_170_of32b_currency");
        if (!isEmptyStr(c33ccy) && !isCurrency(c33ccy)) pushErr("OF33B Currency invalid (3 letters).", "_180_of33b_currency");

        // --- Network rule C1: at least one field after 22A must be present ---
        var fieldsAfter22A = [
            "_110_of23s_cancellation_request","_120_of40a_form_of_credit","_130_of40e_applicable_rules","_140_of31d_date_of_expiry",
            "_150_of50_changed_applicant_details","_160_of59_account","_170_of32b_currency","_171_of32b_amount",
            "_180_of33b_currency","_181_of33b_amount","_190_of39a_plus","_191_of39a_minus","_200_of39c_additional_amounts",
            "_210_of41a_option","_220_of42c_drafts","_230_of42a_option","_240_of42m_mixed_payment",
            "_250_of42p_negotiation_details","_260_of43p_partial_shipments","_270_of43t_transhipment",
            "_280_of44a_place_dispatch","_290_of44e_port_loading","_300_of44f_port_discharge","_310_of44b_final_destination",
            "_320_of44c_latest_date","_330_of44d_shipment_period","_340_of45b_description_goods","_350_of46b_documents_required",
            "_360_of47b_additional_conditions","_370_of49m_special_payment_beneficiary","_380_of49n_special_payment_bank",
            "_390_of71d_charges","_400_of71n_charge_code","_410_of48_days","_420_of49_confirmation_instructions",
            "_430_of58a_option","_440_of53a_option","_450_of78_instructions","_460_of57a_option","_470_of72z_sender_to_receiver"
        ];
        var anyAfter22A = false;
        for (var k=0;k<fieldsAfter22A.length;k++){
            if (!isEmptyStr(t(fieldsAfter22A[k]))) { anyAfter22A = true; break; }
        }
        if (!anyAfter22A) pushErr("C1: At least one field after field 22A must be present (amendment details).", "_100_mf22a_purpose_of_message");

        // --- 71D length limit (JSP maxlength 210) ---
        if (!isEmptyStr(vv71d) && vv71d.length > 210) pushErr("OF71D exceeds maxlength 210 characters.", "_390_of71d_charges");

        // --- OF72Z length limit per JSP maxlength 210 ---
        if (!isEmptyStr(vv72z) && vv72z.length > 210) pushErr("OF72Z exceeds maxlength 210 characters.", "_470_of72z_sender_to_receiver");

        // --- final: show errors if any ---
        if (E.length > 0) {
            var msg = "Please correct the following validation errors:\n\n- " + E.join("\n- ");
            alert(msg);
            if (pushErr.firstFocus) setFocus(pushErr.firstFocus);
            return false;
        }
        return true;
    };

    // Optionally attach light UI handlers (blur/change) for a few key fields to improve UX
    document.addEventListener("DOMContentLoaded", function() {
        // uppercase currency and bic fields
        var currencyIds = [
            "_170_of32b_currency","_180_of33b_currency","_171_of32b_amount","_181_of33b_amount",
            "_431_of58a_identifier_code","_051_of52a_identifier_code","_232_of42a_identifier_code",
            "_211_of41a_identifier_code","_441_of53a_identifier_code","_461_of57a_identifier_code"
        ];
        currencyIds.forEach(function(id){
            var el = document.getElementById(id);
            if (!el) return;
            el.addEventListener("blur", function(){ this.value = (this.value || "").toUpperCase().trim(); });
        });

        // date inputs: limit to digits
        ["_070_mf31c_date_of_issue","_090_mf30_date_of_amendment","_320_of44c_latest_date","_140_of31d_date_of_expiry"]
            .forEach(function(id){
                var e = document.getElementById(id);
                if (!e) return;
                e.addEventListener("input", function() {
                    this.value = (this.value || "").replace(/[^\d]/g, "").slice(0,6);
                });
                e.addEventListener("blur", function(){
                    if (this.value && !isYYMMDD(this.value)) {
                        // do not autoshow alert here to avoid annoyance, final validate will catch
                    }
                });
            });

        // bind toggles already present in mt707.js; no duplicate toggles here

    });

})(window, document);
</script>
