<%--
    Document   : mt950
    Created on : Mei 21, 2019
    Author     : Andhita Deara
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt950.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:950'}">
            <div id="judul">MT 950 Statement Message</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing">
                <input name="messageType" id="messageType" type="hidden" value="950" />
                <div style="width: 100%; margin: 0 auto; font: 0.85em arial;">
                    <ul class="tabs">
                        <li><a href="#" rel="view1">Header</a></li>
                        <li><a href="#" rel="view2">Body</a></li>
                        <li><a href="#" rel="view3">Comment</a></li>
                        <li><a href="#" rel="view4">Histories</a></li>
                        <li><a href="#" rel="view5">Log MT Text</a></li>
                        <li><a href="#" rel="view6">MT Relation</a></li>
                        <li><a href="#" rel="view7" id="tabView7">Translation</a></li>
                    </ul>
                    <div class="tabcontents">
                        <div id="view1" class="tabcontent">
                            <%@ include file="header_mt.jsp" %>
                        </div>
                        <div id="view2" class="tabcontent">
                            <!-- MF20 -->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label">*Transaction Reference Number</span>
                                <input type="text" name="_010_mf20_transaction_reference_number" id="_010_mf20_transaction_reference_number" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_transaction_reference_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <hr/>

                                    <!-- MF25 -->
                                    <div class="form-row"><span class="label_body">MF25</span><span class="label">*Account Identification</span>
                                        <input type="text" name="_020_mf25_account_identification" id="_020_mf25_account_identification" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_020_mf25_account_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <hr/>

                                    <!-- MF28C --> <!-- blm bener -->
                                    <div class="form-row"><span class="label_body">MF28C</span><span class="label">*Statement Number/Sequence Number</span>
                                        <input type="text" name="_030_mf28c_statement_sequence_number" id="_030_mf28c_statement_sequence_number" maxlength="10" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_mf28c_statement_sequence_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <hr/>

                                    <!-- MF60 -->
                                    <div class="form-row"><span class="label_body">MF60</span><span class="label">*Opening Balance</span>
                                        <select id="type_mf60_opening_balance" name="type_mf60_opening_balance">
                                            <option value="">choose a type</option>
                                            <option value="f">F - First Opening Balance</option>
                                            <option value="m">M - Intermediate Opening Balance</option>
                                        </select>
                                        <div id="div_mf60f_first_opening_balance">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*D/C Mark</span>
                                                <input type="text" name="_040_mf60f_dc_mark" id="_040_mf60f_dc_mark" maxlength="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf60f_dc_mark'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Date</span>
                                                <input type="text" name="_041_mf60f_date" id="_041_mf60f_date" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_041_mf60f_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                                <input type="text" name="_042_mf60f_currency" id="_042_mf60f_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_042_mf60f_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                                <input type="text" name="_043_mf60f_amount" id="_043_mf60f_amount" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_043_mf60f_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                        </div>
                                        <div id="div_mf60m_intermediate_opening_balance">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*D/C Mark</span>
                                                <input type="text" name="_044_mf60m_dc_mark" id="_044_mf60m_dc_mark" maxlength="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_044_mf60m_dc_mark'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Date</span>
                                                <input type="text" name="_045_mf60m_date" id="_045_mf60m_date" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_045_mf60m_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                                <input type="text" name="_046_mf60m_currency" id="_046_mf60m_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_046_mf60m_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                                <input type="text" name="_047_mf60m_amount" id="_047_mf60m_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_047_mf60m_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF61 -->
                                    <div class="form-row"><span class="label_body">OF61</span><span class="label">Statement Line</span>
                                        <input type="button" name="_050_of61_add" id="_050_of61_add" value="Add" />
                                        <input type="button" name="_051_of61_remove" id="_051_of61_remove" value="Remove" />
                                    </div>
                                    <div id="div_of61_statement_line">
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">&nbsp;</span>
                                            <textarea cols="60" rows="5" name="_052_of61_statement_line" id="_052_of61_statement_line"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_052_of61_statement_line'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- MF62 -->
                                    <div class="form-row"><span class="label_body">MF62</span><span class="label">*Closing Balance (Booked Funds)</span>
                                        <select id="type_mf62_closing_balance" name="type_mf62_closing_balance">
                                            <option value="">choose a type</option>
                                            <option value="f">F - Closing Balance (Booked Funds)</option>
                                            <option value="m">M - Closing Balance (Booked Funds)</option>
                                        </select>
                                        <div id="div_mf62f_closing_balance">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*D/C Mark</span>
                                                <input type="text" name="_061_mf62f_dc_mark" id="_061_mf62f_dc_mark" maxlength="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_mf62f_dc_mark'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Date</span>
                                                <input type="text" name="_062_mf62f_date" id="_062_mf62f_date" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_mf62f_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                                <input type="text" name="_063_mf62f_currency" id="_063_mf62f_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_063_mf62f_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                                <input type="text" name="_064_mf62f_amount" id="_064_mf62f_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_064_mf62f_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                        </div>
                                        <div id="div_mf62m_closing_balance">
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*D/C Mark</span>
                                                <input type="text" name="_065_mf62m_dc_mark" id="_065_mf62m_dc_mark" maxlength="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_065_mf62m_dc_mark'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Date</span>
                                                <input type="text" name="_066_mf62m_date" id="_066_mf62m_date" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_066_mf62m_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Currency</span>
                                                <input type="text" name="_067_mf62m_currency" id="_067_mf62m_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_067_mf62m_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>
                                                <input type="text" name="_068_mf62m_amount" id="_068_mf62m_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_068_mf62m_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>

                                    <!-- OF64 -->
                                    <div class="form-row"><span class="label_body">OF64</span><span class="label">Closing Available Balanca (Available Funds) - D/C Mark</span>
                                        <input type="text" name="_070_of64_dc_mark" id="_070_of64_dc_mark" maxlength="1" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_070_of64_dc_mark'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Date</span>
                                        <input type="text" name="_071_of64_date" id="_071_of64_date" maxlength="6" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_071_of64_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Currency</span>
                                        <input type="text" name="_072_of64_currency" id="_072_of64_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_072_of64_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Amount</span>
                                        <input type="text" name="_073_of64_amount" id="_073_of64_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_073_of64_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>"/>
                                    </div>
                                    <hr/>

                                </div>
                                <div id="view3" class="tabcontent">
                            <%@ include file="comment_mt.jsp" %>
                        </div>
                        <div id="view4" class="tabcontent">
                            <%@ include file="history_mt.jsp" %>
                        </div>
                        <div id="view5" class="tabcontent">
                            <%@ include file="logTrx_mt.jsp" %>
                        </div>
                        <div id="view6" class="tabcontent">
                            <%@ include file="relation_mt.jsp" %>
                        </div>

                        <div id="view7" class="tab-content">
                            <div class="form-row">
                                <%@include file="VMtFull.jsp" %>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
        <%@ include file="button_action.jsp" %>
    </form>
</c:if>
</c:forEach>
</div>
<script>
    // Fungsi untuk mengambil parameter dari URL
    function getQueryParameter(name) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(name);
    }

    // Mengecek apakah ada parameter hideView1 di URL
    if (getQueryParameter('create') === 'true') {
        // Menyembunyikan tab view1 dan seluruh kontennya
        const tabView7 = document.getElementById('tabView7');
        const view1Content = document.getElementById('view7');

        if (tabView7)
            tabView7.style.display = 'none'; // Sembunyikan tab link
        if (view7Content)
            view7Content.style.display = 'none'; // Sembunyikan konten view1
    } else {
        // Tampilkan view1 jika tidak ada parameter untuk menyembunyikan
        document.getElementById('view7').classList.add('active');
    }
</script>

<script type="text/javascript" src="js/json-xml-data-tree/data-tree.js"></script>
<script>
    var xmldat = document.getElementById("mxview3").value;
    new DataTree({
        xml: xmldat,
        container: '#mxfull',
        attrs: 'show',
        startExpanded: true
    });
</script>
