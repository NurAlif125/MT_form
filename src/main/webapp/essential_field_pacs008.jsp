<div class="form-row"><span class="labelL">Message Identifier<a style="color:red;text-decoration:none">*</a></span>
    <input type="text" name="identifier" id="identifier" maxlength="35" size="35" value="${mxById.message_identifier}" readonly="true" />
</div>
<div class="form-row"><span class="labelL">Instruction Id<a style="color:red;text-decoration:none">*</a></span>
    <input type="text" name="instridentifier" id="instridentifier" maxlength="20" size="20" value="${mxById.instruction_id}" readonly="true" />
    <input type="hidden" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" maxlength="35" size="35" value="${mxById.instruction_id}" />
</div>
<div class="form-row"><span class="labelL">Interbank Settlement Date<a style="color:red;text-decoration:none">*</a></span>
    <input type="text" name="value_date" id="value_date" maxlength="10" size="10" value="${mxById.value_date}" readonly="true" />
</div>
<div class="form-row"><span class="labelL">Currency<a style="color:red;text-decoration:none">*</a></span>
    <input type="text" name="currency" id="currency" maxlength="3" size="3" value="${mxById.currency}" readonly="true" />
</div>
<div class="form-row"><span class="labelL">Interbank Settlement Amount<a style="color:red;text-decoration:none">*</a></span>
    <input type="text" name="amount" id="amount" maxlength="20" size="20" value="${mxById.amount}" readonly="true" />
</div>
<div class="form-row"><span class="labelL">Charges<a style="color:red;text-decoration:none">*</a></span>
    <input type="text" name="charges" id="charges" maxlength="4" size="4" value="${mxById.charges}" readonly="true" />
</div>
<div class="form-row" id="divinsccy"><span class="labelL">Instructed Currency</span>
    <input type="text" name="instr_currency" id="instr_currency" maxlength="3" size="3" value="${mxById.instr_ccy}" readonly="true" />
</div>
<div class="form-row" id="divinsamt"><span class="labelL">Instructed Amount</span>
    <input type="text" name="instr_amount" id="instr_amount" maxlength="20" size="20" value="${mxById.instr_amount}" readonly="true" />
</div>
<div class="form-row" id="divrate"><span class="labelL">Exchange Rate</span>
    <input type="text" name="rate" id="rate" maxlength="17" size="17" value="${mxById.rate}" readonly="true" />
</div>
<div class="form-row"><span class="labelL">Debtor</span></div>
<div class="form-row"><span class="labelLPad">Name<a style="color:red;text-decoration:none">*</a></span>
    <input type="text" name="debtor_name" id="debtor_name" maxlength="140" size="140" value="${mxById.debtor_name}" readonly="true" />
</div>
<div class="form-row" id="divdebtor_department"><span class="labelLPad">Department</span>
    <input type="text" name="debtor_department" id="debtor_department" maxlength="70" size="70" value="${mxById.debtor_dept}" readonly="true" />
</div>
<div class="form-row" id="divdebtor_sub_department"><span class="labelLPad">Sub Department</span>
    <input type="text" name="debtor_sub_department" id="debtor_sub_department" maxlength="70" size="70" value="${mxById.debtor_sub_dept}" readonly="true" />
</div>
<div class="form-row" id="divdebtor_street_name"><span class="labelLPad">Street Name</span>
    <input type="text" name="debtor_street_name" id="debtor_street_name" maxlength="70" size="70" value="${mxById.debtor_street}" readonly="true" />
</div>
<div class="form-row" id="divdebtor_building_number"><span class="labelLPad">Building Number</span>
    <input type="text" name="debtor_building_number" id="debtor_building_number" maxlength="16" size="16" value="${mxById.debtor_building_number}" readonly="true" />
</div>
<div class="form-row" id="divdebtor_building_name"><span class="labelLPad">Building name</span>
    <input type="text" name="debtor_building_name" id="debtor_building_name" maxlength="35" size="35" value="${mxById.debtor_building_name}" readonly="true" />
</div>
<div class="form-row" id="divdebtor_floor"><span class="labelLPad">Floor</span>
    <input type="text" name="debtor_floor" id="debtor_floor" maxlength="70" size="70" value="${mxById.debtor_floor}" readonly="true" />
</div>
<div class="form-row" id="divdebtor_post_box"><span class="labelLPad">Post Box</span>
    <input type="text" name="debtor_post_box" id="debtor_post_box" maxlength="16" size="16" value="${mxById.debtor_post_box}" readonly="true" />
</div>
<div class="form-row" id="divdebtor_room"><span class="labelLPad">Room</span>
    <input type="text" name="debtor_room" id="debtor_room" maxlength="70" size="70" value="${mxById.debtor_room}" readonly="true" />
</div>
<div class="form-row" id="divdebtor_post_code"><span class="labelLPad">Post Code</span>
    <input type="text" name="debtor_post_code" id="debtor_post_code" maxlength="16" size="16" value="${mxById.debtor_post_code}" readonly="true" />
</div>
<div class="form-row" id="divdebtor_town_name"><span class="labelLPad">Town Name</span>
    <input type="text" name="debtor_town_name" id="debtor_town_name" maxlength="35" size="35" value="${mxById.debtor_town_name}" readonly="true" />
</div>
<div class="form-row" id="divdebtor_town_loc_name"><span class="labelLPad">Town Location Name</span>
    <input type="text" name="debtor_town_loc_name" id="debtor_town_loc_name" maxlength="35" size="35" value="${mxById.debtor_town_loc_name}" readonly="true" />
</div>
<div class="form-row" id="divdebtor_district_name"><span class="labelLPad">District Name</span>
    <input type="text" name="debtor_district_name" id="debtor_district_name" maxlength="35" size="35" value="${mxById.debtor_district_name}" readonly="true" />
</div>
<div class="form-row" id="divdebtor_country"><span class="labelLPad">Country</span>
    <input type="text" name="debtor_country" id="debtor_country" maxlength="2" size="2" value="${mxById.debtor_country}" readonly="true" />
</div>
<div class="form-row" id="divdebtor_address"><span class="labelLPad">Address Line</span>
    <textarea name="debtor_address" id="debtor_address" cols="35" rows="3" value="" readonly="true">${mxById.debtor_addressline}</textarea>
</div>
<div class="form-row" id="divdebtor_identification"><span class="labelLPad">Identification</span>
    <input type="text" name="debtor_identification" id="debtor_identification" maxlength="35" size="35" value="${mxById.debtor_identification}" readonly="true" />
</div>
<div class="form-row" id="divdebtor_acc_number"><span class="labelL">Debtor Account Number</span>
    <input type="text" name="debtor_acc_number" id="debtor_acc_number" maxlength="34" size="34" value="${mxById.debtor_acc_number}" readonly="true" />
</div>
<div class="form-row" id="divinstructing_bank"><span class="labelL">Instructing Bank</span>
    <input type="text" name="instructing_bank" id="instructing_bank" maxlength="11" size="11" value="${mxById.instructing_bank}" readonly="true" />
</div>
<div class="form-row" id="divintermediary_bank"><span class="labelL">Intermediary Bank</span>
    <input type="text" name="intermediary_bank" id="intermediary_bank" maxlength="11" size="11" value="${mxById.intermediary_bank}" readonly="true" />
</div>
<div class="form-row" id="divdebtor_bank"><span class="labelL">Debtor Bank</span>
    <input type="text" name="debtor_bank" id="debtor_bank" maxlength="11" size="11" value="${mxById.debtor_bank}" readonly="true" />
</div>
<div class="form-row" id="divcreditor_bank"><span class="labelL">Creditor Bank</span>
    <input type="text" name="creditor_bank" id="creditor_bank" maxlength="11" size="11" value="${mxById.creditor_bank}" readonly="true" />
</div>
<div class="form-row"><span class="labelL">Creditor</span></div>
<div class="form-row"><span class="labelLPad">Name<a style="color:red;text-decoration:none">*</a></span>
    <input type="text" name="creditor_name" id="creditor_name" maxlength="140" size="140" value="${mxById.creditor_name}" readonly="true" />
    <input type="hidden" name="_181_mf59_name_address" id="_181_mf59_name_address" maxlength="140" size="140" value="${mxById.creditor_name}" />
    <input type="hidden" name="_187_mf59f_details" id="_187_mf59f_details" maxlength="140" size="140" value="" />
</div>
<div class="form-row" id="divcreditor_department"><span class="labelLPad">Department</span>
    <input type="text" name="creditor_department" id="creditor_department" maxlength="70" size="70" value="${mxById.creditor_dept}" readonly="true" />
</div>
<div class="form-row" id="divcreditor_sub_department"><span class="labelLPad">Sub Department</span>
    <input type="text" name="creditor_sub_department" id="creditor_sub_department" maxlength="70" size="70" value="${mxById.creditor_sub_dept}" readonly="true" />
</div>
<div class="form-row" id="divcreditor_street_name"><span class="labelLPad">Street Name</span>
    <input type="text" name="creditor_street_name" id="creditor_street_name" maxlength="70" size="70" value="${mxById.creditor_street}" readonly="true" />
</div>
<div class="form-row" id="divcreditor_building_number"><span class="labelLPad">Building Number</span>
    <input type="text" name="creditor_building_number" id="creditor_building_number" maxlength="16" size="16" value="${mxById.creditor_building_number}" readonly="true" />
</div>
<div class="form-row" id="divcreditor_building_name"><span class="labelLPad">Building name</span>
    <input type="text" name="creditor_building_name" id="creditor_building_name" maxlength="35" size="35" value="${mxById.creditor_building_name}" readonly="true" />
</div>
<div class="form-row" id="divcreditor_floor"><span class="labelLPad">Floor</span>
    <input type="text" name="creditor_floor" id="creditor_floor" maxlength="70" size="70" value="${mxById.creditor_floor}" readonly="true" />
</div>
<div class="form-row" id="divcreditor_post_box"><span class="labelLPad">Post Box</span>
    <input type="text" name="creditor_post_box" id="creditor_post_box" maxlength="16" size="16" value="${mxById.creditor_post_box}" readonly="true" />
</div>
<div class="form-row" id="divcreditor_room"><span class="labelLPad">Room</span>
    <input type="text" name="creditor_room" id="creditor_room" maxlength="70" size="70" value="${mxById.creditor_room}" readonly="true" />
</div>
<div class="form-row" id="divcreditor_post_code"><span class="labelLPad">Post Code</span>
    <input type="text" name="creditor_post_code" id="creditor_post_code" maxlength="16" size="16" value="${mxById.creditor_post_code}" readonly="true" />
</div>
<div class="form-row" id="divcreditor_town_name"><span class="labelLPad">Town Name</span>
    <input type="text" name="creditor_town_name" id="creditor_town_name" maxlength="35" size="35" value="${mxById.creditor_town_name}" readonly="true" />
</div>
<div class="form-row" id="divcreditor_town_loc_name"><span class="labelLPad">Town Location Name</span>
    <input type="text" name="creditor_town_loc_name" id="creditor_town_loc_name" maxlength="35" size="35" value="${mxById.creditor_town_loc_name}" readonly="true" />
</div>
<div class="form-row" id="divcreditor_district_name"><span class="labelLPad">District Name</span>
    <input type="text" name="creditor_district_name" id="creditor_district_name" maxlength="35" size="35" value="${mxById.creditor_district_name}" readonly="true" />
</div>
<div class="form-row" id="divcreditor_country"><span class="labelLPad">Country</span>
    <input type="text" name="creditor_country" id="creditor_country" maxlength="2" size="2" value="${mxById.creditor_country}" readonly="true" />
</div>
<div class="form-row" id="divcreditor_address"><span class="labelLPad">Address Line</span>
    <textarea name="creditor_address" id="creditor_address" cols="35" rows="3" value="" readonly="true">${mxById.creditor_addressline}</textarea>
</div>
<div class="form-row" id="divcreditor_identification"><span class="labelLPad">Identification</span>
    <input type="text" name="creditor_identification" id="creditor_identification" maxlength="35" size="35" value="${mxById.creditor_identification}" readonly="true" />
</div>
<div class="form-row" id="divcreditor_acc_number"><span class="labelL">Creditor Account Number</span>
    <input type="text" name="creditor_acc_number" id="creditor_acc_number" maxlength="34" size="34" value="${mxById.creditor_acc_number}" readonly="true" />
    <input type="hidden" name="_180_mf59_account" id="_180_mf59_account" maxlength="34" size="34" value="${mxById.creditor_acc_number}"/>
    <input type="hidden" name="_185_mf59f_account" id="_185_mf59f_account" maxlength="34" size="34" value=""/>
</div>
<div class="form-row" id="divremittance_info"><span class="labelL">Remittance Information</span>
    <input type="text" name="remittance_info" id="remittance_info" maxlength="140" size="140" value="${mxById.remittance_info}" readonly="true" />
</div>

<script>
    if( $('#rate').val().length === 0 ) {
        $('#divrate').hide();
    }
    if( $('#instr_currency').val().length === 0 ) {
        $('#divinsccy').hide();
    }
    if( $('#instr_amount').val().length === 0 ) {
        $('#divinsamt').hide();
    }
    if( $('#debtor_department').val().length === 0 ) {
        $('#divdebtor_department').hide();
    }
    if( $('#debtor_sub_department').val().length === 0 ) {
        $('#divdebtor_sub_department').hide();
    }
    if( $('#debtor_street_name').val().length === 0 ) {
        $('#divdebtor_street_name').hide();
    }
    if( $('#debtor_building_number').val().length === 0 ) {
        $('#divdebtor_building_number').hide();
    }
    if( $('#debtor_building_name').val().length === 0 ) {
        $('#divdebtor_building_name').hide();
    }
    if( $('#debtor_floor').val().length === 0 ) {
        $('#divdebtor_floor').hide();
    }
    if( $('#debtor_post_box').val().length === 0 ) {
        $('#divdebtor_post_box').hide();
    }
    if( $('#debtor_room').val().length === 0 ) {
        $('#divdebtor_room').hide();
    }
    if( $('#debtor_post_code').val().length === 0 ) {
        $('#divdebtor_post_code').hide();
    }
    if( $('#debtor_town_name').val().length === 0 ) {
        $('#divdebtor_town_name').hide();
    }
    if( $('#debtor_town_loc_name').val().length === 0 ) {
        $('#divdebtor_town_loc_name').hide();
    }
    if( $('#debtor_district_name').val().length === 0 ) {
        $('#divdebtor_district_name').hide();
    }
    if( $('#debtor_country').val().length === 0 ) {
        $('#divdebtor_country').hide();
    }
    if( $('#debtor_address').val().length === 0 ) {
        $('#divdebtor_address').hide();
    }
    if( $('#debtor_identification').val().length === 0 ) {
        $('#divdebtor_identification').hide();
    }
    if( $('#debtor_acc_number').val().length === 0 ) {
        $('#divdebtor_acc_number').hide();
    }
    if( $('#instructing_bank').val().length === 0 ) {
        $('#divinstructing_bank').hide();
    }
    if( $('#intermediary_bank').val().length === 0 ) {
        $('#divintermediary_bank').hide();
    }
    if( $('#debtor_bank').val().length === 0 ) {
        $('#divdebtor_bank').hide();
    }
    if( $('#creditor_bank').val().length === 0 ) {
        $('#divcreditor_bank').hide();
    }
    if( $('#creditor_department').val().length === 0 ) {
        $('#divcreditor_department').hide();
    }
    if( $('#creditor_sub_department').val().length === 0 ) {
        $('#divcreditor_sub_department').hide();
    }
    if( $('#creditor_street_name').val().length === 0 ) {
        $('#divcreditor_street_name').hide();
    }
    if( $('#creditor_building_number').val().length === 0 ) {
        $('#divcreditor_building_number').hide();
    }
    if( $('#creditor_building_name').val().length === 0 ) {
        $('#divcreditor_building_name').hide();
    }
    if( $('#creditor_floor').val().length === 0 ) {
        $('#divcreditor_floor').hide();
    }
    if( $('#creditor_post_box').val().length === 0 ) {
        $('#divcreditor_post_box').hide();
    }
    if( $('#creditor_room').val().length === 0 ) {
        $('#divcreditor_room').hide();
    }
    if( $('#creditor_post_code').val().length === 0 ) {
        $('#divcreditor_post_code').hide();
    }
    if( $('#creditor_town_name').val().length === 0 ) {
        $('#divcreditor_town_name').hide();
    }
    if( $('#creditor_town_loc_name').val().length === 0 ) {
        $('#divcreditor_town_loc_name').hide();
    }
    if( $('#creditor_district_name').val().length === 0 ) {
        $('#divcreditor_district_name').hide();
    }
    if( $('#creditor_country').val().length === 0 ) {
        $('#divcreditor_country').hide();
    }
    if( $('#creditor_address').val().length === 0 ) {
        $('#divcreditor_address').hide();
    }
    if( $('#creditor_identification').val().length === 0 ) {
        $('#divcreditor_identification').hide();
    }
    if( $('#creditor_acc_number').val().length === 0 ) {
        $('#divcreditor_acc_number').hide();
    }
    if( $('#remittance_info').val().length === 0 ) {
        $('#divremittance_info').hide();
    }
</script>