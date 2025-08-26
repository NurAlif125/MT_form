<%-- 
    Document   : validate_rule_mt700
    Created on : Aug 26, 2025, 1:14:59?PM
    Author     : mslam
--%>

<script>
// ===== Helpers =====
const reBIC = /^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
function isYYMMDD(s){ return /^\d{6}$/.test(s); }
function isoCcy(s){ return /^[A-Z]{3}$/.test(s); } 
function amt15d(s){ return /^\d{1,12}(,\d{1,3})?$/.test(s); } 

function nonEmpty(v){ return v && v.trim().length>0; }
function pushErr(arr, msg){ arr.push(msg); }

// ===== Main Validation =====
function validateMT700(){
  const errs = [];

  // 1 F27: "1/n" where n=1..8
  const f27 = $("#f27").val().trim();
  if(!/^\d+\/\d+$/.test(f27)) pushErr(errs,"F27 must be n/n");
  else{
    const parts = f27.split('/');
    if(parts[0] !== '1') pushErr(errs,"F27 Number must be 1");
    const total = parseInt(parts[1],10);
    if(!(total>=1 && total<=8)) pushErr(errs,"F27 Total must be 1..8");
  }

  // 2 F40A
  if($("#f40a").val()==="") pushErr(errs,"F40A is mandatory");

  // 3 F20: not start/end '/', not contain '//'
  const f20 = $("#f20").val();
  if(!nonEmpty(f20)) pushErr(errs,"F20 is mandatory");
  if(/^\/|\/$|\/\//.test(f20)) pushErr(errs,"F20 must not start/end with '/' or contain '//'");

  // 4 F23: if used, must start with PREADV/
  const f23 = $("#f23").val().trim();
  if(nonEmpty(f23) && !/^PREADV\/.{1,10}$/.test(f23)) pushErr(errs,"F23 must be 'PREADV/...'");

  // 5 F31C
  const f31c = $("#f31c").val();
  if(!isYYMMDD(f31c)) pushErr(errs,"F31C must be YYMMDD");

  // 6 F40E
  const f40e = $("#f40e_code").val();
  if(f40e==="") pushErr(errs,"F40E code is mandatory");
  const f40eNarr = $("#f40e_narrative").val().trim();
  if(f40e==='OTHR' && f40eNarr==="") pushErr(errs,"F40E narrative required when OTHR");
  if(f40e!=='OTHR' && nonEmpty(f40eNarr)) pushErr(errs,"F40E narrative only allowed when code is OTHR");

  // 7 F31D
  if(!isYYMMDD($("#f31d_date").val())) pushErr(errs,"F31D Date must be YYMMDD");
  if(!nonEmpty($("#f31d_place").val())) pushErr(errs,"F31D Place is mandatory");

  // 8 F51a (optional). If chosen:
  const f51opt = $("input[name=f51_opt]:checked").val();
  if(f51opt==='A'){
    const bic=$("#f51a_bic").val().trim();
    if(!reBIC.test(bic)) pushErr(errs,"F51A Identifier Code must be valid BIC");
  } else if(f51opt==='D'){
    if(!nonEmpty($("textarea[name=f51d_name_address]").val())) pushErr(errs,"F51D Name & Address required");
  }

  // 9 F50
  if(!nonEmpty($("#f50").val())) pushErr(errs,"F50 Applicant is mandatory");

  // 10 F59
  if(!nonEmpty($("#f59_name_address").val())) pushErr(errs,"F59 Name & Address is mandatory");

  // 11 F32B: currency & amount, comma mandatory
  const ccy = $("#f32b_ccy").val().toUpperCase();
  const amt = $("#f32b_amt").val();
  if(!isoCcy(ccy)) pushErr(errs,"F32B currency must be 3-letter ISO");
  if(!amt15d(amt) || !amt.includes(',')) pushErr(errs,"F32B amount must be numeric with comma decimal (15d)");

  // 12 F39A if present must be 2n/2n
  const f39a=$("#f39a").val().trim();
  if(nonEmpty(f39a) && !/^\d{1,2}\/\d{1,2}$/.test(f39a)) pushErr(errs,"F39A must be 2n/2n");

  // 14 F41a mandatory
  const f41opt=$("input[name=f41_opt]:checked").val();
  if(!f41opt) pushErr(errs,"F41a Option (A/D) is mandatory");
  if($("#f41_code").val()==="") pushErr(errs,"F41a BY Code is mandatory");
  if(f41opt==='A' && !reBIC.test($("#f41a_bic").val().trim())) pushErr(errs,"F41A Identifier Code (BIC) required");
  if(f41opt==='D' && !nonEmpty($("textarea[name=f41d_name_address]").val())) pushErr(errs,"F41D Name & Address required");

  // 15/16/17/18 C1 + C2:
  const has42C = nonEmpty($("#f42c").val());
  const has42a = !!$("input[name=f42_opt]:checked").val();
  const has42M = nonEmpty($("#f42m").val());
  const has42P = nonEmpty($("#f42p").val());

  // C1: when 42C is used, 42a must be present (and vice versa if either used per spec text)
  if(has42C && !has42a) pushErr(errs,"C1: If 42C is used, 42a must be present");
  if(has42a && !has42C) pushErr(errs,"C1: If 42a is used, 42C must be present");

  // Validate inside 42a if chosen
  const f42opt=$("input[name=f42_opt]:checked").val();
  if(f42opt==='A' && !reBIC.test($("#f42a_bic").val().trim())) pushErr(errs,"F42A BIC required");
  if(f42opt==='D' && !nonEmpty($("textarea[name=f42d_name_address]").val())) pushErr(errs,"F42D Name & Address required");

  // C2: Either (42C+42a) OR 42M alone OR 42P alone
  const comboC = (has42C||has42a)?1:0; // treat C+ a as one bucket
  const validC = (has42M?1:0) + (has42P?1:0) + comboC;
  if(validC>1) pushErr(errs,"C2: Allowed only one of [(42C+42a) | 42M | 42P]");
  // If none provided it's allowed (because all are optional)

  // 19 F43P codes ? already constrained by select; 20 F43T same.

  // 25/26 C3: either 44C or 44D but not both
  const has44C = nonEmpty($("#f44c").val());
  const has44D = nonEmpty($("#f44d").val());
  if(has44C && has44D) pushErr(errs,"C3: Either 44C or 44D, not both");
  if(has44C && !isYYMMDD($("#f44c").val())) pushErr(errs,"F44C must be YYMMDD");

  // 33 F48: if narrative provided, days optional; format 3n[/35x]
  const f48d=$("#f48_days").val().trim(), f48n=$("#f48_narrative").val().trim();
  if(nonEmpty(f48d) && !/^\d{1,3}$/.test(f48d)) pushErr(errs,"F48 days must be 1?3 digits");

  // 34 F49 mandatory; if CONFIRM/MAY ADD then 58a required
  const f49=$("#f49").val();
  if(f49==="") pushErr(errs,"F49 Confirmation Instructions is mandatory");
  if(f49==="CONFIRM"||f49==="MAY ADD"){
    const f58opt=$("input[name=f58_opt]:checked").val();
    if(!f58opt) pushErr(errs,"F58a required when F49 is CONFIRM or MAY ADD");
    if(f58opt==='A' && !reBIC.test($("#f58a_bic").val().trim())) pushErr(errs,"F58A BIC required");
    if(f58opt==='D' && !nonEmpty($("textarea[name=f58d_name_address]").val())) pushErr(errs,"F58D Name & Address required");
  }

  // 36 F53a if chosen must be valid
  const f53opt=$("input[name=f53_opt]:checked").val();
  if(f53opt==='A' && !reBIC.test($("#f53a_bic").val().trim())) pushErr(errs,"F53A BIC required");
  if(f53opt==='D' && !nonEmpty($("textarea[name=f53d_name_address]").val())) pushErr(errs,"F53D Name & Address required");

  // 38 F57a if chosen must be valid
  const f57opt=$("input[name=f57_opt]:checked").val();
  if(f57opt==='A' && !reBIC.test($("#f57a_bic").val().trim())) pushErr(errs,"F57A BIC required");
  if(f57opt==='B' && !nonEmpty($("#f57b_location").val())) pushErr(errs,"F57B Location required");
  if(f57opt==='D' && !nonEmpty($("textarea[name=f57d_name_address]").val())) pushErr(errs,"F57D Name & Address required");

  if(errs.length){
    alert("Validation Errors:\n? " + errs.join("\n? "));
    return false;
  }
  return true;
}
</script>

