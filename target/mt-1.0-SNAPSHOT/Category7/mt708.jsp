<%-- 
    Document   : mt708
    Created on : Sep 10, 2025, 10:13:56 AM
    Author     : mslam
--%>

    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>MT708 Amendment to a Documentary Credit (Continuation)</title>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="assets/mt708.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
        <script src="assets/mt708.js"></script>
    </head>
    <body>

    <div id="isi">
        <div id="judul"><h2>MT 708 Amendment to a Documentary Credit (Continuation)</h2></div>
        <form id="form_mt708" method="post" 
              action="${pageContext.request.contextPath}/MT708Servlet"
              autocomplete="off"
              onsubmit="return validateMT708() && confirm('Do you want to save this MT708 data?');">

            <input type="hidden" name="messageType" value="708"/>

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

                        <!-- MF27 Sequence of Total -->
                        <div class="form-row">
                            <span class="label_body">MF27</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a> Sequence of Total </span>
                            <input type="text" name="_010_mf27_sequence_of_total" id="_010_mf27_sequence_of_total"
                                   class="mandatory" maxlength="5"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_010_mf27_sequence_of_total"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>"/>
                        </div>
                        <hr/>

                        <!-- MF20 Sender's Reference -->
                        <div class="form-row">
                            <span class="label_body">MF20</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a> Sender's Reference</span>
                            <input type="text" name="_020_mf20_sender_reference" id="_020_mf20_sender_reference"
                                   class="mandatory" maxlength="16"
                                   onkeypress="avoidSplChars(event)"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_020_mf20_sender_reference"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>"/>
                        </div>
                        <hr/>

                        <!-- MF21 Receiver's Reference -->
                        <div class="form-row">
                            <span class="label_body">MF21</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a> Receiver's Reference</span>
                            <input type="text" name="_030_mf21_receiver_reference" id="_030_mf21_receiver_reference"
                                   class="mandatory" maxlength="16"
                                   onkeypress="avoidSplChars(event)"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_030_mf21_receiver_reference"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>"/>
                        </div>
                        <hr/>

                        <!-- MF23 Issuing Bank's Reference -->
                        <div class="form-row">
                            <span class="label_body">MF23</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a> Issuing Bank's Reference</span>
                            <input type="text" name="_040_mf23_issuing_bank_reference" id="_040_mf23_issuing_bank_reference"
                                   class="mandatory" maxlength="16"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_040_mf23_issuing_bank_reference"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>"/>
                        </div>
                        <hr/>

                        <!-- MF26E Number of Amendment -->
                        <div class="form-row">
                            <span class="label_body">MF26E</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a> Number of Amendment</span>
                            <input type="text" name="_050_mf26e_number_of_amendment" id="_050_mf26e_number_of_amendment"
                                   class="mandatory" maxlength="3"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_050_mf26e_number_of_amendment"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>"/>
                        </div>
                        <hr/>

                        <!-- MF30 Date of Amendment -->
                        <div class="form-row">
                            <span class="label_body">MF30</span>
                            <span class="label"><a style="color:red;text-decoration:none">*</a> Date of Amendment (YYMMDD)</span>
                            <input type="text" name="_060_mf30_date_of_amendment" id="_060_mf30_date_of_amendment"
                                   class="mandatory" maxlength="6" placeholder="YYMMDD"
                                   value="<c:forEach var='item' items='${tags}'>
                                              <c:if test='${item.tagName eq "_060_mf30_date_of_amendment"}'>
                                                  <c:out value='${item.detail}'/>
                                              </c:if>
                                          </c:forEach>"/>
                        </div>
                        <hr/>

                        <!-- OF45B Description of Goods and/or Services -->
                        <div class="form-row">
                            <span class="label_body">OF45B</span>
                            <span class="label">Description of Goods and/or Services</span>
                            <textarea name="_070_of45b_description_goods" id="_070_of45b_description_goods"
                                      rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_070_of45b_description_goods'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF46B Documents Required -->
                        <div class="form-row">
                            <span class="label_body">OF46B</span>
                            <span class="label">Documents Required</span>
                            <textarea name="_080_of46b_documents_required" id="_080_of46b_documents_required"
                                      rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_080_of46b_documents_required'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF47B Additional Conditions -->
                        <div class="form-row">
                            <span class="label_body">OF47B</span>
                            <span class="label">Additional Conditions</span>
                            <textarea name="_090_of47b_additional_conditions" id="_090_of47b_additional_conditions"
                                      rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_090_of47b_additional_conditions'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF49M Special Payment Conditions for Beneficiary -->
                        <div class="form-row">
                            <span class="label_body">OF49M</span>
                            <span class="label">Special Payment Conditions for Beneficiary</span>
                            <textarea name="_100_of49m_special_payment_beneficiary" id="_100_of49m_special_payment_beneficiary"
                                      rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_100_of49m_special_payment_beneficiary'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                        <!-- OF49N Special Payment Conditions for Bank Only -->
                        <div class="form-row">
                            <span class="label_body">OF49N</span>
                            <span class="label">Special Payment Conditions for Bank Only</span>
                            <textarea name="_110_of49n_special_payment_bank" id="_110_of49n_special_payment_bank"
                                      rows="6" maxlength="6500"><c:forEach var="item" items="${tags}">
                                <c:if test="${item.tagName eq '_110_of49n_special_payment_bank'}">
                                    <c:out value="${item.detail}" />
                                </c:if>
                            </c:forEach></textarea>
                        </div>
                        <hr/>

                    </div>
                </div>
                <div class="footer">
                    <button type="submit">Save</button>
                    <button type="button" onclick="window.location.href='../index.jsp'">Back</button>
                </div>
            </div>
        </form>
    </div>
    <%@ include file="rule/validate_rule_mt708.jsp" %>
    </body>
    </html>

