<%-- 
    Document   : mt103
    Created on : Sep, 2018, 1:34 AM
    Author     : Sri Puji Indrayanti
--%>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_rule_mt210.jsp" %>
<link rel="stylesheet" type="text/css" href="css/validate_case.css" />
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MT:210'}">
            <div id="judul">MT 210 Notice to Receieve</div>
            <!--js submitnya diubah menjadi di sini buak di validate_button 20180413-->
            <form id="form1" name="form1" method="post" action="ServletControllerDataTransaksiOutgoing" onsubmit="return confirm('Do you want to save this MT data?');">
                <input name="messageType" id="messageType" type="hidden" value="103" />
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
                                <input type="text" name="_010_mf20_transactions_reference_number" id="_010_mf20_transactions_reference_number" maxlength="16" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_010_mf20_transactions_reference_number'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- OF25 -->
                            <div class="form-row"><span class="label_body">OF25</span><span class="label">*Account Identifications</span>
                                <input type="text" name="_030_of25_accout_identification" id="_030_of25_accout_identification" maxlength="4" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_030_of25_accout_identification'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF30 -->
                            <div class="form-row"><span class="label_body">MF30</span><span class="label">Value Date</span>
                                <input type="text" name="_040_mf30_value_date" id="_040_mf30_value_date" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_040_mf30_value_date'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>
                            
                            <!-- MF21 -->
                            <div class="form-row"><span class="label_body">MF21</span><span class="label">Related Reference</span>
                                <input type="text" name="_050_mf21_related_references" id="_050_mf21_related_references" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_050_mf21_related_references'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>
                            <hr/>

                            <!-- MF32B -->
                            <div class="form-row"><span class="label_body">MF32B</span><span class="label">*Currency Code</span>
                                <input type="text" name="_061_mf32b_currency" id="_061_mf32b_currency" maxlength="3" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_061_mf32b_currency'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                            </div>                            
                            <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Amount</span>                             
                                <input type="text" name="_062_mf32b_amount" id="_062_mf32b_amount" maxlength="15" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_062_mf32b_amount'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                <!--//untuk menampilkan uang dalam block ditambahkan pada 20151002-->    
                                <font style="margin-left: 50px"></font>
                                <script langauge="javascript">
                                    function formatUang(n, currency) {
                                        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
                                    }
                                    var number2 = document.getElementById('_062_mf32b_amount').value;
                                    var number2r = number2.replace(',', '.');
                                    var number2F = parseFloat(number2r);
                                    var nominal = formatUang(number2F, "");
                                    var nominalStyle = nominal.fontsize(3);
                                    var nominalStylec = nominalStyle.fontcolor("red");
                                    //var nominalStylecw = nominalStylec.fontWeight("900");
                                    document.write(nominalStylec);
                                </script>
                            </div>
                            <hr/>

                            <!-- OF50 -->
                            <div class="form-row"><span class="label_body">OF50</span><span class="label">Ordering Customer</span>
                                <select id="type_of50_ordering_customer" name="type_of50_ordering_customer">
                                    <option value="">choose a type</option>
                                    <option value="a">Name and Address</option> <!-- - Ordering Customer-->
                                    <option value="c">C - Identifier Code</option>
                                    <option value="f">F - Party Identifier - Name and Address</option>
                                </select>
                                <div id="div_of50">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_080_of50_name_address" id="_080_of50_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_080_of50_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                                <div id="div_of50c">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_081_of50c_identifier_code" id="_081_of50c_identifier_code" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_081_of50c_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of50f">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Party Identifier</span>
                                        <input type="text" name="_082_of50f_party_identifier" id="_082_of50f_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_082_of50f_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Name and Address</span>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Number</span>
                                            <select id="_083_of50f_number" name="_083_of50f_number">
                                                <option value="">CHOOSE A TYPE</option>
                                                <option value="NAME OF ORDERING CUSTOMER" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_mf50f_number'}"><c:if test="${item.detail=='NAME OF ORDERING CUSTOMER'}"> selected="true" </c:if></c:if></c:forEach>>1 (NAME OF ORDERING CUSTOMER)</option>
                                                <option value="ADDRESS LINE" <c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_mf50f_number'}"><c:if test="${item.detail=='ADDRESS LINE'}"> selected="true" </c:if></c:if></c:forEach>>2(ADDRESS LINE</option>
                                                <option value="COUNTRY AND COWN"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_mf50f_number'}"><c:if test="${item.detail=='COUNTRY AND COWN'}"> selected="true" </c:if></c:if></c:forEach>>3(COUNTRY AND COWN)</option>
                                                <option value="DATE OF BIRTH"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_mf50f_number'}"><c:if test="${item.detail=='DATE OF BIRTH'}"> selected="true" </c:if></c:if></c:forEach>>4(DATE OF BIRTH)</option>
                                                <option value="PLACE OF BIRTH"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_mf50f_number'}"><c:if test="${item.detail=='PLACE OF BIRTH'}"> selected="true" </c:if></c:if></c:forEach>>5(PLACE OF BIRTH)</option>
                                                <option value="CUSTOMER IDENTIFICATION NUMBER"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_mf50f_number'}"><c:if test="${item.detail=='CUSTOMER IDENTIFICATION NUMBER'}"> selected="true" </c:if></c:if></c:forEach>>6(CUSTOMER IDENTIFICATION NUMBER)</option>
                                                <option value="NATIONAL IDENTITY NUMBER"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_mf50f_number'}"><c:if test="${item.detail=='NATIONAL IDENTITY NUMBER'}"> selected="true" </c:if></c:if></c:forEach>>7(NATIONAL IDENTITY NUMBER)</option>
                                                <option value="ADDITIONAL INFORMATION"<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_083_mf50f_number'}"><c:if test="${item.detail=='ADDITIONAL INFORMATION'}"> selected="true" </c:if></c:if></c:forEach>>8(ADDITIONAL INFORMATION)</option>
                                            </select>
                                        </div>
                                        <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Details</span>
                                            <input type="text" name="_084_of50f_details" id="_084_of50f_details" maxlength="33" minlength="1" size="33" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_084_of50f_details'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                        </div>        
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!--of52A-->
                            <div class="form-row"><span class="label_body">OF52A</span><span class="label">Ordering Institution</span>
                                <select id="type_of52" name="type_of52">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Ordering Institution - BIC</option>
                                    <option value="d">D - Ordering Institution - Name and Address</option>
                                </select>
                                <div id="div_of52a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_100_of52a_party_identifier" id="_100_of52a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_100_of52a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_101_of52a_identifier_code" id="_101_of52a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_101_of52a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of52d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_102_of52d_party_identifier" id="_102_of52d_party_identifier" maxlength="35" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_102_of52d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_103_of52d_name_address" id="_103_of52d_name_address"><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_103_of52d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <!-- OF56 -->
                            <div class="form-row"><span class="label_body">OF56A</span><span class="label">Intermediary Institution</span>
                                <select id="type_of56" name="type_of56">
                                    <option value="">choose a type</option>
                                    <option value="a">A - Party Identifier - Identifier Code</option>
                                    <option value="d">D - Party Identifier - name and address</option>
                                </select>
                                <div id="div_of56a">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_110_of56a_party_identifier" id="_110_of56a_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_110_of56a_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Identifier Code</span>
                                        <input type="text" name="_111_of56a_identifier_code" id="_111_of56a_identifier_code" maxlength="11" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_111_of56a_identifier_code'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                </div>
                                <div id="div_of56d">
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">Party Identifier</span>
                                        <input type="text" name="_112_of56d_party_identifier" id="_112_of56d_party_identifier" maxlength="37" value="<c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_112_of56d_party_identifier'}"><c:out value="${item.detail}" /></c:if></c:forEach>" />
                                    </div>
                                    <div class="form-row"><span class="label_body">&nbsp;</span><span class="label">*Name and Address</span>
                                        <textarea cols="35" rows="4" maxlength="140" wrap="hard" style="resize:none;" name="_113_of56d_name_address" id="_113_of56d_name_address" ><c:forEach var="item" items="${tags}"><c:if test="${item.tagName=='_113_of56d_name_address'}"><c:out value="${item.detail}" /></c:if></c:forEach></textarea>
                                    </div>
                                </div>
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
                        <div id="view7" class="tab-content"></div>
                            <div class="form-row">
                                <%@include file="VMtFull.jsp" %>
                            </div>
                        </div>  
                    </div>
                </div>
                <%@ include file="button_action.jsp" %>
            </form>
        </c:if>
    </c:forEach>
</div>
<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
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