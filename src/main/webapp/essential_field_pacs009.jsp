<%-- 
    Document   : essential_field_pacs009
    Created on : Sep 25, 2024, 4:20:51 PM
    Author     : Vega
--%>
<input type="hidden" name="id" id="id" value="<%=request.getParameter("id")%>" />
<!--<div class="form-row-border"><span class="label_title">Header</span></div>-->
<div class="form-row"><span class="labelL">Identifier<a style="color:red;text-decoration:none">*</a></span>
    <input type="text" name="identifier" id="identifier" maxlength="15" size="15" value="${mxById.instructionId}" readonly="true" />
</div>

<div class="form-row"><span class="labelL">End to End Id<a style="color:red;text-decoration:none">*</a></span>
    <input type="text" name="end_to_end_id" id="end_to_end_id" maxlength="15" size="15" value="${mxById.endToEndId}" readonly="true" />
</div>

<div class="form-row"><span class="labelL">UETR<a style="color:red;text-decoration:none">*</a></span>
    <input type="text" name="uetr" id="uetr" maxlength="15" size="50" value="${mxById.uetr}" readonly="true" />
</div>

<!--interbank settlement date-->
<div class="form-row"><span class="labelL">Interbank Settlement Date<a style="color:red;text-decoration:none">*</a></span>
    <input type="text" name="value_date" id="value_date" maxlength="10" size="10" value="${mxById.interbankSettlementDate}" 
            <% if (session.getAttribute("flagStatus").equals("OUT-RTR")){ %>
               required="true" pattern="\d{4}-\d{2}-\d{2}"
           <% } else { %>
               readonly="true"
           <% } %> />
</div>

<!--interbank settlement currency-->
<div class="form-row"><span class="labelL">Interbank Settlement Currency<a style="color:red;text-decoration:none">*</a></span>
    <input type="text" name="intrbk_currency" id="intrbk_currency" maxlength="3" size="3" value="${mxById.interbankSettlementCurrency}" required="true" readonly="true"/>
</div>

<!--interbank settlement amount-->
<div class="form-row"><span class="labelL">Interbank Settlement Amount<a style="color:red;text-decoration:none">*</a></span>
    <%--<input type="text" name="amount" id="amount" maxlength="20" size="20" value="<fmt:formatNumber type = 'number' minFractionDigits='0' maxFractionDigits='2' value = '${mxById.amount}' />" required="true" />--%>
    <input type="text" name="amount" id="amount" maxlength="20" size="20" value="${mxById.interbankSettlementAmount}" required="true"  
          <% if (session.getAttribute("flagStatus").equals("OUT-RTR")) { %>
               required="true" 
           <% } else { %>
               readonly="true"
           <% } %>  />
</div>

<!--Previous agent 1-->
<div class="form-row" id="divchg_bank"><span class="labelL">Previous agent 1</span>
    <input type="text" name="pre_agent_1" id="pre_agent_1" maxlength="11" size="11" value="${mxById.previousInstructingAgent1}" required="true" readonly="true"/>
</div>

<!--previous agent 2-->
<div class="form-row" id="divchg_bank"><span class="labelL">Previous agent 2</span>
    <input type="text" name="pre_agent_2" id="pre_agent_2" maxlength="11" size="11" value="${mxById.previousInstructingAgent2}" required="true" readonly="true"/>
</div>

<!--previous agent 3-->
<div class="form-row" id="divchg_bank"><span class="labelL">Previous agent 3</span>
    <input type="text" name="pre_agent_3" id="pre_agent_3" maxlength="11" size="11" value="${mxById.previousInstructingAgent3}" required="true" readonly="true"/>
</div>

<!--Instructing Agent-->
<div class="form-row" id="divchg_bank"><span class="labelL">Instructing Agent</span>
    <input type="text" name="instrd_agt" id="instrd_agt" maxlength="11" size="11" value="${mxById.instructingAgent}" required="true" readonly="true"/>
</div>

<!--Instructed Agent-->
<div class="form-row" id="divchg_bank"><span class="labelL">Instructed Agent</span>
    <input type="text" name="instructed_agt" id="instructed_agt" maxlength="11" size="11" value="${mxById.instructedAgent}" required="true" 
           <% if (session.getAttribute("flagStatus").equals("OUT-RTR")) { %>
               required="true" 
           <% } else { %>
               readonly="true"
           <% } %> />
</div>

<!--Debtor Institution ID-->
<div class="form-row" id="divchg_bank"><span class="labelL">Debtor Institution ID</span>
    <input type="text" name="dbtr_inst_id" id="dbtr_inst_id" maxlength="11" size="11" value="${mxById.debtorInstitutionId}" required="true" readonly="true"/>
</div>

<!--Debtor Agent-->
<div class="form-row" id="divchg_bank"><span class="labelL">Debtor Agent</span>
    <input type="text" name="dbtr_agt" id="dbtr_agt" maxlength="11" size="11" value="${mxById.debtorAgent}" required="true" readonly="true"/>
</div>

<!--Creditor Institution ID-->
<div class="form-row" id="divchg_bank"><span class="labelL">Creditor Institution ID</span>
    <input type="text" name="cdtr_inst_id" id="cdtr_inst_id" maxlength="11" size="11" value="${mxById.creditorInstitutionId}" required="true" readonly="true"/>
</div>

<!--Creditor Agent-->
<div class="form-row" id="divchg_bank"><span class="labelL">Creditor Agent</span>
    <input type="text" name="creditor_bank" id="creditor_bank" maxlength="11" size="11" value="${mxById.creditorAgent}" required="true" 
           <% if (session.getAttribute("flagStatus").equals("OUT-RTR")) { %>
               required="true" 
           <% } else { %>
               readonly="true"
           <% } %> />
</div>

<div class="form-row" id="divcreditor_acc_number"><span class="labelL">Creditor Account Number</span>
    <input type="text" name="creditor_acc_number" id="creditor_acc_number" maxlength="34" size="34" value="${mxById.creditorAcc}" required="true" 
            <% if (session.getAttribute("flagStatus").equals("OUT-RTR")) { %>
               required="true" 
           <% } else { %>
               readonly="true"
           <% } %> />
</div>

<div class="form-row"><span class="labelL">Creditor</span></div>
<div class="form-row"><span class="labelLPad">Name<a style="color:red;text-decoration:none">*</a></span>
    <input type="text" name="creditor_name" id="creditor_name" maxlength="140" size="140" value="${mxById.creditorNm}" required="true" 
           <% if (session.getAttribute("flagStatus").equals("OUT-RTR")) { %>
               required="true" 
           <% } else { %>
               readonly="true"
           <% } %> />
</div>






<script>
    if( $('#instr_currency').val().length === 0 ) {
        $('#divinsccy').hide();
    }
    if( $('#instr_amount').val().length === 0 ) {
        $('#divinsamt').hide();
    }
    if( $('#debtor_street_name').val().length === 0 ) {
        $('#divdebtor_street_name').hide();
    }
    if( $('#debtor_town_name').val().length === 0 ) {
        $('#divdebtor_town_name').hide();
        $('#debtor_town_name').removeAttr('required');
    }
    if( $('#debtor_country').val().length === 0 ) {
        $('#divdebtor_country').hide();
    }
    if( $('#debtor_address').val().length === 0 ) {
        $('#divdebtor_address').hide();
    }
    if( $('#debtor_acc_number').val().length === 0 ) {
        $('#divdebtor_acc_number').hide();
    }
    if( $('#creditor_street_name').val().length === 0 ) {
        $('#divcreditor_street_name').hide();
    }
    if( $('#creditor_town_name').val().length === 0 ) {
        $('#divcreditor_town_name').hide();
        $('#creditor_town_name').removeAttr('required');
    }
    if( $('#creditor_country').val().length === 0 ) {
        $('#divcreditor_country').hide();
    }
    if( $('#creditor_address').val().length === 0 ) {
        $('#divcreditor_address').hide();
    }
    if( $('#creditor_acc_number').val().length === 0 ) {
        $('#divcreditor_acc_number').hide();
    }
    if( $('#reason_code').val().length === 0 ) {
        $('#divreason_code').hide();
    }
    if( $('#addtl_info').val().length === 0 ) {
        $('#divaddtl_info').hide();
    }
</script>
