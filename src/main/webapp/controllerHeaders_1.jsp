<%--
    Document   : controllerHeaders
    Author     : M Abdul Hadi
--%>

<%@ include file="header.jsp" %>
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MENU:LIST_TRANSACTIONS'}">
            <div id="judul">List of Transactions</div>
            <div id="tabs-1">
                <br>
                <b>
                    <c:forEach var="item" items="${role}">
                        <c:if test="${item == 'TYPE:OUTGOING_INCOMING'}">
                            <a href="controllerHeaders?io_type=IO" class="srb">All</a>
                            <a href="controllerHeaders?io_type=O" class="srb">Incoming</a>
                            <a href="controllerHeaders?io_type=I" class="srb">Outgoing</a>
                        </c:if>
                        <c:if test="${item == 'TYPE:INCOMING'}">
                            <a href="controllerHeaders?io_type=O" class="srb">Incoming</a>
                        </c:if>
                        <c:if test="${item == 'TYPE:OUTGOING'}">
                            <a href="controllerHeaders?io_type=I" class="srb">Outgoing</a>
                        </c:if>
                    </c:forEach>                    
                    <c:forEach var="item" items="${role}">
                        <c:if test="${(item == 'TYPE:OUTGOING_INCOMING') || (item == 'TYPE:OUTGOING')}">
                            <c:forEach var="item" items="${role}">
                                <c:if test="${item == 'FLOW:MOD'}">
                                    <a href="controllerHeaders?io_type=I&flag=MOD" class="srb">Modification</a>
                                </c:if>
                                <c:if test="${item == 'FLOW:VER'}">
                                    <a href="controllerHeaders?io_type=I&flag=VER" class="srb">Verification</a>
                                </c:if>
                                <c:if test="${item == 'FLOW:AUTH'}">
                                    <a href="controllerHeaders?io_type=I&flag=AUTH" class="srb">Authorization</a>
                                </c:if>
                                <c:if test="${item == 'FLOW:TEXT'}">
                                    <a href="controllerHeaders?io_type=I&flag=TEXT" class="srb">Text Generation</a>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                    <a href="List_scr.jsp" class="srb">Search</a><br/>
                </b>
            </div>
            <br/>
            <%--<div id="judul">Tax Transaction</div>
            <div id="content">
                <%int rowNumPajak = 1;%>
                <display:table name="sessionScope.headersPajak" pagesize="5" export="false" sort="list" cellspacing="0" cellpadding="0">
                    <display:column value="<%=rowNumPajak++%>" title="No" sortable="true" headerClass="sortable" />
                    <display:column property="tanggal" title="CreationDate" sortable="true" headerClass="sortable" />
                    <display:column property="messageType" title="MessageType" sortable="true" headerClass="sortable" />
                    <display:column property="io_type" title="I/O" sortable="true" headerClass="sortable" />
                    <display:column property="tag53" title="Sender" sortable="true" headerClass="sortable" />
                    <display:column property="tag57" title="Receiver" sortable="true" headerClass="sortable" />
                    <display:column paramId="id" paramProperty="id_headers" property="tag20" title="Reference" sortable="true" headerClass="sortable" href="ViewDataTransaksiOutgoing" />
                    <display:column property="tag32Amount" style="text-align:right;" title="Amount" sortable="true" headerClass="sortable" />
                    <display:column property="flag" title="Status" sortable="true" headerClass="sortable" />
                </display:table>
            </div>
            <br/>--%>
            <!--<div id="judul">All Transactions</div>-->
            <div id="content">
                <%int rowNum = 1;%>
                <display:table name="sessionScope.headers" pagesize="10" export="false" sort="list" cellspacing="0" cellpadding="0">
                    <display:column value="<%=rowNum++%>" title="No" sortable="true" headerClass="sortable" />
                    <display:column property="tanggal" title="CreationDate" sortable="true" headerClass="sortable" />
                    <display:column property="messageType" title="MessageType" sortable="true" headerClass="sortable" />
                    <display:column property="io_type" title="I/O" sortable="true" headerClass="sortable" />
                    <!-- diganti menjadi sender tag 53-->
                    <%--<display:column property="logicalTerminal" title="LogicalTerminal" sortable="true" headerClass="sortable" />--%>
                    <display:column property="tag53" title="Sender" sortable="true" headerClass="sortable" />
                    <!-- diganti menjadi sender tag 57-->
                    <%--<display:column property="receiverAddress" title="ReceiverAddress" sortable="true" headerClass="sortable" />--%>
                    <display:column property="tag57" title="Receiver" sortable="true" headerClass="sortable" />                        
                    <display:column paramId="id" paramProperty="id_headers" property="tag20" title="Reference" sortable="true" headerClass="sortable" href="ViewDataTransaksiOutgoing" />
                    <display:column property="tag21" title="Rel. Reference" sortable="true" headerClass="sortable" />
                    <display:column property="tag32Amount" style="text-align:right;" title="Amount" sortable="true" headerClass="sortable" />
                    <display:column property="flag" title="Status" sortable="true" headerClass="sortable" />
                </display:table>
            </div><!--close content-->
        </c:if>
    </c:forEach>
</div>
<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>