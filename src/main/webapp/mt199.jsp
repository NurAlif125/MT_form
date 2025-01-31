<%-- 
    Document   : mt199
    Created on : Aug 14, 2012, 6:55:17 AM
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mtn99.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:199'}">
            <div id="judul">MT 199 Free Format Message</div>
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing">
                <input name="messageType" id="messageType" type="hidden" value="199" />
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
                            <%@ include file="header_mt_input.jsp" %>
                        </div>
                        <div id="view2" class="tabcontent">
                            <!-- MF20 -->
                            <div class="form-row"><span class="label_body">MF20</span><span class="label"><a style="color:red;text-decoration:none">*</a>Transaction Reference Number</span>
                                <input type="text" name="_010_mf20_sender_reference" id="_010_mf20_sender_reference" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_sender_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>

                                    <!-- OF21 -->
                                    <div class="form-row"><span class="label_body">OF21</span><span class="label">Related Reference</span>
                                        <input type="text" name="_011_of21_related_reference" id="_011_of21_related_reference" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_011_of21_related_reference'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <hr/>

                                    <!-- MF79 -->
                                    <div class="form-row"><span class="label_body">MF79</span><span class="label"><a style="color:red;text-decoration:none">*</a>Narrative</span>
                                        <textarea cols="50" rows="50" maxlength="2500" wrap="hard" style="resize:none;" name="_012_mf79_narrative" id="_012_mf79_narrative"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_012_mf79_narrative'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
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



