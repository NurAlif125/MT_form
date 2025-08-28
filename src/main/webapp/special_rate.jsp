<%-- 
    Document   : special_rate
    Created on : Jan 15, 2020, 10:27:23 AM
    Author     : sae
--%>

<!--rate buat incoming-->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:if test="${headerById.io_type == 'O'}">
    <c:if test="${headerById.flag == 'INC-NSTP' || headerById.flag == 'INC-SPRT'}">
        <c:choose>
            <c:when test="${headerById.messageType == '200' || headerById.messageType == '202' || headerById.messageType == '101'}">
                <c:choose>
                    <c:when test="${headerById.cust_curr != headerById.tag32Currency && headerById.cust_curr !='IDR'}">
                        <hr/>
                        <div class="template">
                            <div class="form-row"><span class="label_sub"><b>Special Rate</b></span></div>
                            <div class="form-row"><span class="label">Rate ${headerById.tag32Currency}</span><span class="label"></span>
                                <input type="text" name="special_rate_multi" id="special_rate_multi" size="10" maxlength="10" value="<c:out value="${headerById.special_rate_multi}" />" onkeypress="return numbersonly(event, '_061_mf32a_currency');" required  />
                            </div>
                            <!--<div class="form-row"><span class="label_sub">&nbsp;</span></div>-->
                            <div class="form-row"><span class="label">Rate ${headerById.cust_curr}</span><span class="label"></span>
                                <input type="hidden" id="curr1" value="${headerById.tag32Currency}">
                                <input type="hidden" id="curr2" value="${headerById.cust_curr}">
                                <input type="text" name="special_rate" id="special_rate" size="10" maxlength="10" value="<c:out value="${headerById.special_rate}" />" onkeypress="return numbersonly(event, '_061_mf32a_currency');" required  />
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${headerById.cust_curr != headerById.tag32Currency && headerById.cust_curr =='IDR'}">
                        <hr/>
                        <div class="template">
                            <div class="form-row"><span class="label_sub"><b>Special Rate</b></span></div>
                            <div class="form-row"><span class="label">Rate ${headerById.tag32Currency}</span><span class="label"></span>
                                <input type="hidden" id="special_rate_multi" value="">
                                <input type="hidden" id="curr2" value="${headerById.tag32Currency}">
                                <input type="text" name="special_rate" id="special_rate" size="10" maxlength="10" value="<c:out value="${headerById.special_rate}" />" onkeypress="return numbersonly(event, '_061_mf32a_currency');"  />
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <input type="hidden" id="special_rate" value="">
                        <input type="hidden" id="special_rate_multi" value="">
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:otherwise>
                <c:if test="${headerById.cust_curr == 'IDR'}">
                    <hr/>
                    <div class="template">
                        <div class="form-row"><span class="label_sub"><b>Special Rate</b></span></div>
                        <input type="hidden" id="special_rate_multi" value="">
                        <input type="hidden" id="curr2" value="${headerById.tag32Currency}">
                        <div class="form-row"><span class="label">Rate ${headerById.tag32Currency}</span><span class="label"></span>
                            <input type="text" name="special_rate" id="special_rate" size="10" maxlength="10" value="<c:out value="${headerById.special_rate}" />" onkeypress="return numbersonly(event, '_061_mf32a_currency');"  />
                        </div>
                    </div>
                </c:if>
            </c:otherwise>
        </c:choose>
    </c:if>
    <c:if test="${headerById.messageType == '101'}">
        <hr/>
        <div class="template">
            <div class="form-row"><span class="label_sub"><b>Branch</b></span></div>
            <div class="form-row"><span class="label">Branch</span><span class="label"></span>
                <input type="text" name="branch_101" id="branch_101" size="3" maxlength="3" value="<c:out value='${headerById.branch}' />"  />
            </div>
        </div>
    </c:if>
</c:if>

<!--multi currency outgoing-->
<!-- <c:if test="${headerById.io_type == 'I' || headerById.io_type == null}">
    <c:if test="${headerById.messageType == '103'}">
        <hr/>
        <div class="form-row"><span class="label_sub"><b>Multi Currency</b></span></div>
        <div class="form-row"><span class="label">Currency</span>
            <input type="text" name="multi_currency" id="multi_currency" maxlength="3" size="3" value="USD" readonly="true"/>
        </div>
        <div class="form-row"><span class="label">Amount</span>
            <input type="text" name="multi_amount" id="multi_amount" maxlength="17" size="17" value="<c:out value="${headerById.multi_amount}" />" onkeypress="return numbersonly(event, 'multi_currency');" />
        </div>
    </c:if>
</c:if> -->



