<%-- 
    Document   : mt700
    Created on : Aug 26, 2025, 11:35:39 AM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>MT700 Issue of a Documentary Credit</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<style>
 body{font-family:Arial,sans-serif;padding:20px;background:#f9f9f9}
 .form-row{margin-bottom:10px;display:flex;align-items:center}
 .label_body{width:60px;font-weight:bold}
 .label{width:360px;text-align:right;margin-right:10px}
 .label a{color:red}
 input,textarea,select{padding:5px;border:1px solid #999;border-radius:4px;max-width:520px}
 input.mandatory,textarea.mandatory,select.mandatory{border:1px solid #666}
 .tabs{list-style:none;margin:0;padding:0;display:flex;gap:10px}
 .tabs a{text-decoration:none;padding:5px 10px;border:1px solid #ccc;border-radius:4px;background:#fff}
 .tabcontent{display:none}.tabcontent.active{display:block}
 .form-container{border:1px solid #ccc;border-radius:6px;overflow:hidden;background:#fff;margin-top:10px}
 .form-body{padding:15px;background:#fff}
 .footer{padding:12px;background:#2a7d80;display:flex;gap:10px;border-top:1px solid #ccc}
 .footer button{padding:8px 18px;border:1px solid #aaa;border-radius:4px;background:#f0f0f0;color:#000;font-weight:bold;cursor:pointer}
 .footer button:hover{background:#e0e0e0}
 .inline{display:inline-block;margin-right:6px}
 .muted{font-size:12px;color:#666}
 hr{border:0;border-top:1px dashed #ddd;margin:10px 0}
</style>
</head>
<body>
<div id="isi">
  <div id="judul"><h2>MT 700 – Issue of a Documentary Credit</h2></div>

  <form id="form_mt700" method="post" action="MT700Servlet" autocomplete="off"
        onsubmit="return validateMT700();">

    <input type="hidden" name="messageType" value="700"/>

    <ul class="tabs">
      <li><a href="#" rel="view1">Header</a></li>
      <li><a href="#" rel="view2">Body</a></li>
      <li><a href="#" rel="view3">Comment</a></li>
      <li><a href="#" rel="view4">Histories</a></li>
      <li><a href="#" rel="view5">Log MT Text</a></li>
      <li><a href="#" rel="view6">MT Relation</a></li>
      <li><a href="#" rel="view7">Translation</a></li>
    </ul>

    <div class="form-container">
      <div class="form-body tabcontents">
        <div id="view2" class="tabcontent active">

          <!-- 1 F27 -->
          <div class="form-row">
            <span class="label_body">MF27</span>
            <span class="label"><a>*</a>Sequence of Total (n/n; Number must be 1)</span>
            <input type="text" class="mandatory" name="f27" id="f27" maxlength="7" placeholder="1/1"/>
          </div><hr/>

          <!-- 2 F40A -->
          <div class="form-row">
            <span class="label_body">MF40A</span>
            <span class="label"><a>*</a>Form of Documentary Credit</span>
            <select name="f40a" id="f40a" class="mandatory">
              <option value="">-- Select --</option>
              <option>IRREVOCABLE</option>
              <option>IRREVOCABLE TRANSFERABLE</option>
            </select>
          </div><hr/>

          <!-- 3 F20 -->
          <div class="form-row">
            <span class="label_body">MF20</span>
            <span class="label"><a>*</a>Documentary Credit Number (16x)</span>
            <input type="text" class="mandatory" name="f20" id="f20" maxlength="16"/>
          </div><hr/>

          <!-- 4 F23 -->
          <div class="form-row">
            <span class="label_body">F23</span>
            <span class="label">Reference to Pre-Advice (16x, ex: PREADV/YYMMDD)</span>
            <input type="text" name="f23" id="f23" maxlength="16" placeholder="PREADV/250826"/>
          </div><hr/>

          <!-- 5 F31C -->
          <div class="form-row">
            <span class="label_body">MF31C</span>
            <span class="label"><a>*</a>Date of Issue (YYMMDD)</span>
            <input type="text" class="mandatory" name="f31c" id="f31c" maxlength="6" pattern="\d{6}" placeholder="YYMMDD"/>
          </div><hr/>

          <!-- 6 F40E -->
          <div class="form-row">
            <span class="label_body">MF40E</span>
            <span class="label"><a>*</a>Applicable Rules</span>
            <div>
              <select name="f40e_code" id="f40e_code" class="mandatory">
                <option value="">-- Select --</option>
                <option>EUCP LATEST VERSION</option>
                <option>EUCPURR LATEST VERSION</option>
                <option>UCP LATEST VERSION</option>
                <option>UCPURR LATEST VERSION</option>
                <option>OTHR</option>
              </select>
              <div id="f40e_narrative_wrap" style="display:none;margin-top:6px;">
                <textarea name="f40e_narrative" id="f40e_narrative" rows="2" maxlength="35" placeholder="Specify other rules (required if OTHR)"></textarea>
              </div>
            </div>
          </div><hr/>

          <!-- 7 F31D -->
          <div class="form-row">
            <span class="label_body">MF31D</span>
            <span class="label"><a>*</a>Date and Place of Expiry (YYMMDD + Place)</span>
            <input type="text" class="mandatory inline" name="f31d_date" id="f31d_date" maxlength="6" pattern="\d{6}" placeholder="YYMMDD"/>
            <input type="text" class="mandatory inline" name="f31d_place" id="f31d_place" maxlength="29" placeholder="Place"/>
          </div><hr/>

          <!-- 8 F51a Applicant Bank (A/D) -->
          <div class="form-row">
            <span class="label_body">F51a</span>
            <span class="label">Applicant Bank (Option A or D)</span>
            <div>
              <label class="inline"><input type="radio" name="f51_opt" value="A"> Option A</label>
              <label class="inline"><input type="radio" name="f51_opt" value="D"> Option D</label>
              <div id="f51A" style="display:none;margin-top:6px;">
                <input type="text" name="f51a_party_identifier" maxlength="37" placeholder="Party Identifier (optional)"/><br/>
                <input type="text" name="f51a_bic" maxlength="11" placeholder="Identifier Code (BIC 8/11)"/>
              </div>
              <div id="f51D" style="display:none;margin-top:6px;">
                <input type="text" name="f51d_party_identifier" maxlength="37" placeholder="Party Identifier (optional)"/><br/>
                <textarea name="f51d_name_address" rows="3" maxlength="140" placeholder="Name & Address (4*35x)"></textarea>
              </div>
            </div>
          </div><hr/>

          <!-- 9 F50 Applicant -->
          <div class="form-row">
            <span class="label_body">MF50</span>
            <span class="label"><a>*</a>Applicant (4*35x)</span>
            <textarea class="mandatory" name="f50" id="f50" rows="3" maxlength="140"></textarea>
          </div><hr/>

          <!-- 10 F59 Beneficiary -->
          <div class="form-row">
            <span class="label_body">MF59</span>
            <span class="label"><a>*</a>Beneficiary ([/34x] 4*35x)</span>
            <input type="text" name="f59_account" id="f59_account" maxlength="34" placeholder="Account (optional)"/><br/>
            <textarea class="mandatory" name="f59_name_address" id="f59_name_address" rows="3" maxlength="140" placeholder="Name & Address"></textarea>
          </div><hr/>

          <!-- 11 F32B Currency & Amount -->
          <div class="form-row">
            <span class="label_body">MF32B</span>
            <span class="label"><a>*</a>Currency Code, Amount (3!a15d)</span>
            <input type="text" class="inline mandatory" name="f32b_ccy" id="f32b_ccy" maxlength="3" style="text-transform:uppercase" placeholder="CCY"/>
            <input type="text" class="inline mandatory" name="f32b_amt" id="f32b_amt" maxlength="15" style="text-align:right" placeholder="999999,99"/>
            <span class="muted">gunakan koma untuk desimal</span>
          </div><hr/>

          <!-- 12 F39A -->
          <div class="form-row">
            <span class="label_body">F39A</span>
            <span class="label">Percentage Credit Amount Tolerance (2n/2n)</span>
            <input type="text" name="f39a" id="f39a" maxlength="5" placeholder="10/10"/>
          </div><hr/>

          <!-- 13 F39C -->
          <div class="form-row">
            <span class="label_body">F39C</span>
            <span class="label">Additional Amounts Covered (4*35x)</span>
            <textarea name="f39c" id="f39c" rows="3" maxlength="140"></textarea>
          </div><hr/>

          <!-- 14 F41a Available With... By... (A/D) -->
          <div class="form-row">
            <span class="label_body">MF41a</span>
            <span class="label"><a>*</a>Available With ... By ...</span>
            <div>
              <label class="inline"><input type="radio" name="f41_opt" value="A"> Option A</label>
              <label class="inline"><input type="radio" name="f41_opt" value="D"> Option D</label>
              <div style="margin:6px 0;">
                <select name="f41_code" id="f41_code" class="mandatory">
                  <option value="">-- BY Code --</option>
                  <option>BY ACCEPTANCE</option>
                  <option>BY DEF PAYMENT</option>
                  <option>BY MIXED PYMT</option>
                  <option>BY NEGOTIATION</option>
                  <option>BY PAYMENT</option>
                </select>
              </div>
              <div id="f41A" style="display:none;">
                <input type="text" name="f41a_bic" maxlength="11" placeholder="Identifier Code (BIC)"/>
              </div>
              <div id="f41D" style="display:none;">
                <textarea name="f41d_name_address" rows="3" maxlength="140" placeholder="Name & Address"></textarea>
              </div>
            </div>
          </div><hr/>

          <!-- 15 F42C -->
          <div class="form-row">
            <span class="label_body">F42C</span>
            <span class="label">Drafts at ... (3*35x)</span>
            <textarea name="f42c" id="f42c" rows="3" maxlength="105"></textarea>
          </div><hr/>

          <!-- 16 F42a (A/D) Drawee -->
          <div class="form-row">
            <span class="label_body">F42a</span>
            <span class="label">Drawee (A or D)</span>
            <div>
              <label class="inline"><input type="radio" name="f42_opt" value="A"> Option A</label>
              <label class="inline"><input type="radio" name="f42_opt" value="D"> Option D</label>
              <div id="f42A" style="display:none;margin-top:6px;">
                <input type="text" name="f42a_bic" maxlength="11" placeholder="Identifier Code (BIC)"/>
              </div>
              <div id="f42D" style="display:none;margin-top:6px;">
                <textarea name="f42d_name_address" rows="3" maxlength="140" placeholder="Name & Address"></textarea>
              </div>
              <div class="muted">Catatan: Party Identifier tidak boleh ada.</div>
            </div>
          </div><hr/>

          <!-- 17 F42M -->
          <div class="form-row">
            <span class="label_body">F42M</span>
            <span class="label">Mixed Payment Details (4*35x)</span>
            <textarea name="f42m" id="f42m" rows="3" maxlength="140"></textarea>
          </div><hr/>

          <!-- 18 F42P -->
          <div class="form-row">
            <span class="label_body">F42P</span>
            <span class="label">Negotiation/Deferred Payment Details (4*35x)</span>
            <textarea name="f42p" id="f42p" rows="3" maxlength="140"></textarea>
          </div><hr/>

          <!-- 19 F43P -->
          <div class="form-row">
            <span class="label_body">F43P</span>
            <span class="label">Partial Shipments (11x)</span>
            <select name="f43p" id="f43p">
              <option value="">-- Select --</option>
              <option>ALLOWED</option>
              <option>CONDITIONAL</option>
              <option>NOT ALLOWED</option>
            </select>
          </div><hr/>

          <!-- 20 F43T -->
          <div class="form-row">
            <span class="label_body">F43T</span>
            <span class="label">Transhipment (11x)</span>
            <select name="f43t" id="f43t">
              <option value="">-- Select --</option>
              <option>ALLOWED</option>
              <option>CONDITIONAL</option>
              <option>NOT ALLOWED</option>
            </select>
          </div><hr/>

          <!-- 21-24 F44A/E/F/B -->
          <div class="form-row">
            <span class="label_body">F44A</span>
            <span class="label">Place of Taking in Charge / Dispatch / Receipt (140z)</span>
            <textarea name="f44a" rows="2" maxlength="140"></textarea>
          </div>
          <div class="form-row">
            <span class="label_body">F44E</span>
            <span class="label">Port of Loading / Airport of Departure (140z)</span>
            <textarea name="f44e" rows="2" maxlength="140"></textarea>
          </div>
          <div class="form-row">
            <span class="label_body">F44F</span>
            <span class="label">Port of Discharge / Airport of Destination (140z)</span>
            <textarea name="f44f" rows="2" maxlength="140"></textarea>
          </div>
          <div class="form-row">
            <span class="label_body">F44B</span>
            <span class="label">Place of Final Destination / Delivery (140z)</span>
            <textarea name="f44b" rows="2" maxlength="140"></textarea>
          </div><hr/>

          <!-- 25 F44C -->
          <div class="form-row">
            <span class="label_body">F44C</span>
            <span class="label">Latest Date of Shipment (YYMMDD)</span>
            <input type="text" name="f44c" id="f44c" maxlength="6" pattern="\d{6}" placeholder="YYMMDD"/>
          </div><hr/>

          <!-- 26 F44D -->
          <div class="form-row">
            <span class="label_body">F44D</span>
            <span class="label">Shipment Period (6*65x)</span>
            <textarea name="f44d" id="f44d" rows="4" maxlength="390"></textarea>
          </div><hr/>

          <!-- 27-31 F45A/F46A/F47A/F49G/F49H -->
          <div class="form-row">
            <span class="label_body">F45A</span>
            <span class="label">Description of Goods and/or Services (100*65z)</span>
            <textarea name="f45a" rows="6" maxlength="6500" placeholder="+Item 1 ..."></textarea>
          </div>
          <div class="form-row">
            <span class="label_body">F46A</span>
            <span class="label">Documents Required (100*65z)</span>
            <textarea name="f46a" rows="6" maxlength="6500" placeholder="+Doc 1 ..."></textarea>
          </div>
          <div class="form-row">
            <span class="label_body">F47A</span>
            <span class="label">Additional Conditions (100*65z)</span>
            <textarea name="f47a" rows="6" maxlength="6500"></textarea>
          </div>
          <div class="form-row">
            <span class="label_body">F49G</span>
            <span class="label">Special Payment Conditions for Beneficiary (100*65z)</span>
            <textarea name="f49g" rows="4" maxlength="6500"></textarea>
          </div>
          <div class="form-row">
            <span class="label_body">F49H</span>
            <span class="label">Special Payment Conditions for Bank Only (100*65z)</span>
            <textarea name="f49h" rows="4" maxlength="6500"></textarea>
          </div><hr/>

          <!-- 32 F71D -->
          <div class="form-row">
            <span class="label_body">F71D</span>
            <span class="label">Charges (6*35z)</span>
            <textarea name="f71d" rows="4" maxlength="210" placeholder="/COMM/USD123,45 ..."></textarea>
          </div><hr/>

          <!-- 33 F48 -->
          <div class="form-row">
            <span class="label_body">F48</span>
            <span class="label">Period for Presentation in Days (3n[/35x])</span>
            <input type="text" name="f48_days" id="f48_days" maxlength="3" class="inline" placeholder="21"/>
            <input type="text" name="f48_narrative" id="f48_narrative" maxlength="35" class="inline" placeholder="(optional narrative)"/>
          </div><hr/>

          <!-- 34 F49 -->
          <div class="form-row">
            <span class="label_body">MF49</span>
            <span class="label"><a>*</a>Confirmation Instructions (7!x)</span>
            <select name="f49" id="f49" class="mandatory">
              <option value="">-- Select --</option>
              <option>CONFIRM</option>
              <option>MAY ADD</option>
              <option>WITHOUT</option>
            </select>
          </div><hr/>

          <!-- 35 F58a (A/D) -->
          <div class="form-row">
            <span class="label_body">F58a</span>
            <span class="label">Requested Confirmation Party (A or D)</span>
            <div>
              <label class="inline"><input type="radio" name="f58_opt" value="A"> Option A</label>
              <label class="inline"><input type="radio" name="f58_opt" value="D"> Option D</label>
              <div id="f58A" style="display:none;margin-top:6px;">
                <input type="text" name="f58a_bic" maxlength="11" placeholder="Identifier Code (BIC)"/>
              </div>
              <div id="f58D" style="display:none;margin-top:6px;">
                <textarea name="f58d_name_address" rows="3" maxlength="140" placeholder="Name & Address"></textarea>
              </div>
            </div>
          </div><hr/>

          <!-- 36 F53a (A/D) -->
          <div class="form-row">
            <span class="label_body">F53a</span>
            <span class="label">Reimbursing Bank (A or D)</span>
            <div>
              <label class="inline"><input type="radio" name="f53_opt" value="A"> Option A</label>
              <label class="inline"><input type="radio" name="f53_opt" value="D"> Option D</label>
              <div id="f53A" style="display:none;margin-top:6px;">
                <input type="text" name="f53a_bic" maxlength="11" placeholder="Identifier Code (BIC)"/>
              </div>
              <div id="f53D" style="display:none;margin-top:6px;">
                <textarea name="f53d_name_address" rows="3" maxlength="140" placeholder="Name & Address"></textarea>
              </div>
            </div>
          </div><hr/>

          <!-- 37 F78 -->
          <div class="form-row">
            <span class="label_body">F78</span>
            <span class="label">Instructions to Paying/Accepting/Negotiating Bank (12*65x)</span>
            <textarea name="f78" rows="6" maxlength="780"></textarea>
          </div><hr/>

          <!-- 38 F57a (A/B/D) -->
          <div class="form-row">
            <span class="label_body">F57a</span>
            <span class="label">'Advise Through' Bank (A/B/D)</span>
            <div>
              <label class="inline"><input type="radio" name="f57_opt" value="A"> A</label>
              <label class="inline"><input type="radio" name="f57_opt" value="B"> B</label>
              <label class="inline"><input type="radio" name="f57_opt" value="D"> D</label>
              <div id="f57A" style="display:none;margin-top:6px;">
                <input type="text" name="f57a_bic" maxlength="11" placeholder="Identifier Code (BIC)"/>
              </div>
              <div id="f57B" style="display:none;margin-top:6px;">
                <input type="text" name="f57b_location" maxlength="35" placeholder="Location"/>
              </div>
              <div id="f57D" style="display:none;margin-top:6px;">
                <textarea name="f57d_name_address" rows="3" maxlength="140" placeholder="Name & Address"></textarea>
              </div>
            </div>
          </div><hr/>

          <!-- 39 F72Z -->
          <div class="form-row">
            <span class="label_body">F72Z</span>
            <span class="label">Sender to Receiver Information (6*35z)</span>
            <textarea name="f72z" rows="4" maxlength="210" placeholder="/PHONBEN/ ..."></textarea>
          </div>

        </div><!-- /view2 -->
      </div>

      <div class="footer">
        <button type="submit">Save</button>
        <button type="button" onclick="window.location.href='${pageContext.request.contextPath}/index.jsp'">Back</button>
      </div>
    </div>
  </form>
</div>

<%@ include file="rule/validate_rule_mt700.jsp" %>

<script>
$(function(){
  $('.tabs a').on('click', function(e){ e.preventDefault();
     const target = $(this).attr('rel');
     $('.tabcontent').removeClass('active'); $('#'+target).addClass('active');
  });

  $("#f31c,#f31d_date,#f44c").datepicker({ dateFormat: "yymmdd" });

  $("#f40e_code").on('change', function(){
    $("#f40e_narrative_wrap").toggle($(this).val()==='OTHR');
  });

  function bindToggle(group, radios, map){
    $(radios).on('change', function(){
      const val = $(this).val();
      $.each(map, function(k, sel){ $(sel).hide(); });
      if(map[val]) $(map[val]).show();
    });
  }
  bindToggle('f51',['input[name=f51_opt]'],{A:'#f51A',D:'#f51D'});
  bindToggle('f41',['input[name=f41_opt]'],{A:'#f41A',D:'#f41D'});
  bindToggle('f42',['input[name=f42_opt]'],{A:'#f42A',D:'#f42D'});
  bindToggle('f58',['input[name=f58_opt]'],{A:'#f58A',D:'#f58D'});
  bindToggle('f53',['input[name=f53_opt]'],{A:'#f53A',D:'#f53D'});
  bindToggle('f57',['input[name=f57_opt]'],{A:'#f57A',B:'#f57B',D:'#f57D'});
});
</script>
</body>
</html>

