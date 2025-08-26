<%-- 
    Document   : mt110
    Created on : Aug 21, 2025, 9:32:48 AM
    Author     : mslam
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT110 Advice of Cheque(s)</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <style>
        body{font-family:Arial,sans-serif;background:#f7fbfc;padding:16px;}
        h2{margin:0 0 10px 0}
        .form-container{border:1px solid #cdd3d5;border-radius:6px;overflow:hidden;background:#fff}
        .form-body{padding:14px}
        .form-row{display:flex;align-items:center;gap:12px;margin:8px 0}
        .label_body{width:60px;font-weight:bold;color:#57656b}
        .label{width:220px;text-align:right;color:#33434a}
        .label a{color:#d33}
        input,select,textarea{padding:6px;border:1px solid #98a6ad;border-radius:4px;background:#eef7fb}
        textarea{resize:vertical}
        hr{border:none;border-top:1px solid #e4ecef;margin:10px 0}
        .section-title{margin:14px 0 8px 0;font-size:15px;color:#1b3942}
        .loop-header{font-weight:bold;margin:8px 0 6px 0;color:#1f4c56}
        .set-box{border:1px dashed #bdd3d9;padding:10px;border-radius:6px;background:#fbfeff;margin-bottom:10px}
        .small-note{font-size:12px;color:#6a7a80}
        .footer{padding:12px;background:#2a7d80;border-top:1px solid #cdd3d5;display:flex;gap:10px}
        .footer button{padding:8px 18px;border:1px solid #aaa;border-radius:6px;background:#eef0f1;color:#000;font-weight:bold;cursor:pointer}
        .footer button:hover{background:#e0e0e0}
        .action-link{color:#307aa6;cursor:pointer;text-decoration:underline;font-size:12px;margin-right:8px}
        .hidden{display:none}
    </style>
</head>
<body>

<div class="form-container">
<form id="mt110Form" method="post" action="MT110Servlet" autocomplete="off"
      onsubmit="return confirm('Save this MT110?');">
<div class="form-body">

    <h2>MT 110 Advice of Cheque(s)</h2>
    <div class="section-title">Header</div>

    <!-- :20: -->
    <div class="form-row">
        <span class="label_body">MF20</span>
        <span class="label"><a>*</a>Sender's Reference</span>
        <input type="text" name="_020_sender_ref" id="_020_sender_ref" maxlength="16" required>
    </div>
    <hr>

    <!-- :53a: Sender's Correspondent -->
    <div class="form-row">
        <span class="label_body">OF53a</span>
        <span class="label">Sender's Correspondent</span>
        <select name="_053_type" id="_053_type">
            <option value="">choose a type</option>
            <option value="A">F53A - Identifier Code</option>
            <option value="B">F53B - Location</option>
            <option value="D">F53D - Name & Address</option>
        </select>
    </div>
    <div id="53A_box" class="hidden">
        <div class="form-row">
            <span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
            <input type="text" name="_053A_party" maxlength="37">
        </div>
        <div class="form-row">
            <span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
            <input type="text" name="_053A_bic" maxlength="11">
        </div>
    </div>
    <div id="53B_box" class="hidden">
        <div class="form-row">
            <span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
            <input type="text" name="_053B_party" maxlength="37">
        </div>
        <div class="form-row">
            <span class="label_body">&nbsp;</span><span class="label">Location</span>
            <input type="text" name="_053B_location" maxlength="35">
        </div>
    </div>
    <div id="53D_box" class="hidden">
        <div class="form-row">
            <span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
            <input type="text" name="_053D_party" maxlength="37">
        </div>
        <div class="form-row">
            <span class="label_body">&nbsp;</span><span class="label">Name & Address</span>
            <textarea name="_053D_nameaddr" rows="2" maxlength="140"></textarea>
        </div>
    </div>
    <hr>

    <!-- :54a: Receiver's Correspondent -->
    <div class="form-row">
        <span class="label_body">OF54a</span>
        <span class="label">Receiver's Correspondent</span>
        <select name="_054_type" id="_054_type">
            <option value="">choose a type</option>
            <option value="A">F54A - Identifier Code</option>
            <option value="B">F54B - Location</option>
            <option value="D">F54D - Name & Address</option>
        </select>
    </div>
    <div id="54A_box" class="hidden">
        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
            <input type="text" name="_054A_party" maxlength="37"></div>
        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
            <input type="text" name="_054A_bic" maxlength="11"></div>
    </div>
    <div id="54B_box" class="hidden">
        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
            <input type="text" name="_054B_party" maxlength="37"></div>
        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
            <input type="text" name="_054B_location" maxlength="35"></div>
    </div>
    <div id="54D_box" class="hidden">
        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
            <input type="text" name="_054D_party" maxlength="37"></div>
        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name & Address</span>
            <textarea name="_054D_nameaddr" rows="2" maxlength="140"></textarea></div>
    </div>
    <hr>

    <!-- :72: -->
    <div class="form-row">
        <span class="label_body">OF72</span>
        <span class="label">Sender to Receiver Information</span>
        <textarea name="_072_text" rows="3" maxlength="210"></textarea>
    </div>

    <!-- Loop -->
    <input type="hidden" id="setCount" name="setCount" value="1"/>
    <div id="setsContainer">
        <div class="set-box" data-index="0" id="set_0">
            <div class="loop-header">Set #1</div>

            <!-- :21: -->
            <div class="form-row">
                <span class="label_body">MF21</span>
                <span class="label"><a>*</a>Cheque Number</span>
                <input type="text" name="s0_021_cheque" maxlength="16" required>
            </div>

            <!-- :30: -->
            <div class="form-row">
                <span class="label_body">MF30</span>
                <span class="label"><a>*</a>Date of Issue</span>
                <input type="text" class="dt6" name="s0_030_date" maxlength="10" placeholder="yyyy-mm-dd" required>
            </div>

            <!-- :32a: -->
            <div class="form-row">
                <span class="label_body">MF32a</span>
                <span class="label"><a>*</a>Amount</span>
                <select name="s0_032_type" class="sel32" required>
                    <option value="">choose a type</option>
                    <option value="A">F32A - Date - Currency - Amount</option>
                    <option value="B">F32B - Currency - Amount</option>
                </select>
            </div>
            <!-- 32A sub -->
            <div class="hidden grp32A">
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                    <input type="text" class="dt6" name="s0_032A_date" maxlength="10" placeholder="yyyy-mm-dd"></div>
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                    <input type="text" name="s0_032A_ccy" maxlength="3" style="text-transform:uppercase;"></div>
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                    <input type="text" class="amt" name="s0_032A_amt" maxlength="20" placeholder="e.g. 1000,00"></div>
            </div>
            <!-- 32B sub -->
            <div class="hidden grp32B">
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                    <input type="text" name="s0_032B_ccy" maxlength="3" style="text-transform:uppercase;"></div>
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                    <input type="text" class="amt" name="s0_032B_amt" maxlength="20" placeholder="e.g. 1000,00"></div>
            </div>

            <!-- :50a: Payer -->
            <div class="form-row">
                <span class="label_body">OF50a</span>
                <span class="label">Payer</span>
                <select name="s0_050_type" class="sel50">
                    <option value="">choose a type</option>
                    <option value="A">F50A - Account + BIC</option>
                    <option value="F">F50F - Structured Name/Address</option>
                    <option value="K">F50K - Account + Name & Address</option>
                </select>
            </div>
            <!-- 50A -->
            <div class="hidden grp50A">
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                    <input type="text" name="s0_050A_acct" maxlength="34"></div>
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                    <input type="text" name="s0_050A_bic" maxlength="11"></div>
            </div>
            <!-- 50F (minimal 1/.., 2/.., 3/..) -->
            <div class="hidden grp50F">
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                    <input type="text" name="s0_050F_party" maxlength="35" placeholder="optional"></div>
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Line 1 (1/..)</span>
                    <input type="text" name="s0_050F_l1" maxlength="35" placeholder="1/NAME"></div>
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Line 2 (2/..)</span>
                    <input type="text" name="s0_050F_l2" maxlength="35" placeholder="2/ADDRESS"></div>
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Line 3 (3/..)</span>
                    <input type="text" name="s0_050F_l3" maxlength="35" placeholder="3/CC/TOWN[/DETAIL]"></div>
            </div>
            <!-- 50K -->
            <div class="hidden grp50K">
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Account</span>
                    <input type="text" name="s0_050K_acct" maxlength="34"></div>
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name & Address</span>
                    <textarea name="s0_050K_nameaddr" rows="2" maxlength="140"></textarea></div>
            </div>

            <!-- :52a: Drawer Bank -->
            <div class="form-row">
                <span class="label_body">OF52a</span>
                <span class="label">Drawer Bank</span>
                <select name="s0_052_type" class="sel52">
                    <option value="">choose a type</option>
                    <option value="A">F52A - Identifier Code</option>
                    <option value="B">F52B - Location</option>
                    <option value="D">F52D - Name & Address</option>
                </select>
            </div>
            <div class="hidden grp52A">
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                    <input type="text" name="s0_052A_party" maxlength="37"></div>
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Identifier Code (BIC)</span>
                    <input type="text" name="s0_052A_bic" maxlength="11"></div>
            </div>
            <div class="hidden grp52B">
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                    <input type="text" name="s0_052B_party" maxlength="37"></div>
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Location</span>
                    <input type="text" name="s0_052B_location" maxlength="35"></div>
            </div>
            <div class="hidden grp52D">
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                    <input type="text" name="s0_052D_party" maxlength="37"></div>
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name & Address</span>
                    <textarea name="s0_052D_nameaddr" rows="2" maxlength="140"></textarea></div>
            </div>

            <!-- :59a: Payee (No letter or F) -->
            <div class="form-row">
                <span class="label_body">MF59a</span>
                <span class="label"><a>*</a>Payee</span>
                <select name="s0_059_type" class="sel59" required>
                    <option value="">choose a type</option>
                    <option value="N">No letter option - Name & Address</option>
                    <option value="F">F59F - Structured Name/Address</option>
                </select>
            </div>
            <!-- 59 (no letter) - per usage Account must not be used -->
            <div class="hidden grp59N">
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                    <textarea name="s0_059N_nameaddr" rows="2" maxlength="140"></textarea></div>
            </div>
            <!-- 59F -->
            <div class="hidden grp59F">
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Line 1 (1/..)</span>
                    <input type="text" name="s0_059F_l1" maxlength="35" placeholder="1/NAME"></div>
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Line 2 (2/..)</span>
                    <input type="text" name="s0_059F_l2" maxlength="35" placeholder="2/ADDRESS"></div>
                <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Line 3 (3/..)</span>
                    <input type="text" name="s0_059F_l3" maxlength="35" placeholder="3/CC/TOWN[/DETAIL]"></div>
            </div>
        </div>
    </div>

    <div>
        <span id="addSet" class="action-link">Add Loop</span>
        <span id="removeSet" class="action-link">Remove Last Set</span>
    </div>

</div>
<div class="footer">
    <button type="submit">Save</button>
    <button type="button" onclick="window.location.href='../index.jsp'">Back</button>
</div>
</form>
</div>

<script>
(function(){
    function applyDatepicker(ctx){
        $(ctx).find(".dt6").datepicker({ dateFormat:"yy-mm-dd" });
    }
    function formatAmount(v){
        if(!v) return "0,00";
        v = (v+"").trim().replace(/\s+/g,'');
        v = v.replace(/\./g,'');       
        v = v.replace(',', '.');       
        let n = parseFloat(v);
        if(isNaN(n)) n = 0;
        let s = n.toFixed(2).replace('.', ',');
        return s;
    }
    function wireSetBehavior($set){
        $set.on('blur','input.amt',function(){ this.value = formatAmount(this.value); });

        // 32a
        $set.find('select.sel32').on('change', function(){
            const val = $(this).val();
            const box = $(this).closest('.set-box');
            box.find('.grp32A,.grp32B').addClass('hidden');
            if(val==='A') box.find('.grp32A').removeClass('hidden');
            if(val==='B') box.find('.grp32B').removeClass('hidden');
        });

        // 50a
        $set.find('select.sel50').on('change', function(){
            const box = $(this).closest('.set-box');
            box.find('.grp50A,.grp50F,.grp50K').addClass('hidden');
            if(this.value==='A') box.find('.grp50A').removeClass('hidden');
            if(this.value==='F') box.find('.grp50F').removeClass('hidden');
            if(this.value==='K') box.find('.grp50K').removeClass('hidden');
        });

        // 52a
        $set.find('select.sel52').on('change', function(){
            const box = $(this).closest('.set-box');
            box.find('.grp52A,.grp52B,.grp52D').addClass('hidden');
            if(this.value==='A') box.find('.grp52A').removeClass('hidden');
            if(this.value==='B') box.find('.grp52B').removeClass('hidden');
            if(this.value==='D') box.find('.grp52D').removeClass('hidden');
        });

        // 59a
        $set.find('select.sel59').on('change', function(){
            const box = $(this).closest('.set-box');
            box.find('.grp59N,.grp59F').addClass('hidden');
            if(this.value==='N') box.find('.grp59N').removeClass('hidden');
            if(this.value==='F') box.find('.grp59F').removeClass('hidden');
        });

        applyDatepicker($set);
    }

    wireSetBehavior($('#set_0'));
    applyDatepicker(document);

    // 53/54 header toggles
    $('#_053_type').on('change',function(){
        $('#53A_box,#53B_box,#53D_box').addClass('hidden');
        if(this.value==='A') $('#53A_box').removeClass('hidden');
        if(this.value==='B') $('#53B_box').removeClass('hidden');
        if(this.value==='D') $('#53D_box').removeClass('hidden');
    });
    $('#_054_type').on('change',function(){
        $('#54A_box,#54B_box,#54D_box').addClass('hidden');
        if(this.value==='A') $('#54A_box').removeClass('hidden');
        if(this.value==='B') $('#54B_box').removeClass('hidden');
        if(this.value==='D') $('#54D_box').removeClass('hidden');
    });

    function addSet(){
        let count = parseInt($('#setCount').val(),10);
        if(count>=10){ alert('Maximum 10 sets (C1)'); return; }
        const idx = count;
        const $template = $('#set_0').clone();
        $template.attr('id','set_'+idx).attr('data-index',idx);
        $template.find('.loop-header').text('Set #'+(idx+1));
        $template.find('[name]').each(function(){
            const nm = $(this).attr('name');
            $(this).attr('name', nm.replace(/^s0_/,'s'+idx+'_')).val('');
        });
        $template.find('.grp32A,.grp32B,.grp50A,.grp50F,.grp50K,.grp52A,.grp52B,.grp52D,.grp59N,.grp59F').addClass('hidden');
        $('#setsContainer').append($template);
        wireSetBehavior($template);
        $('#setCount').val(count+1);
    }
    function removeSet(){
        let count = parseInt($('#setCount').val(),10);
        if(count<=1){ alert('At least 1 set is required'); return; }
        $('#setsContainer').children().last().remove();
        $('#setCount').val(count-1);
    }
    $('#addSet').on('click', addSet);
    $('#removeSet').on('click', removeSet);

})();
</script>

</body>
</html>



