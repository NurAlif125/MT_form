<%@include file="header.jsp" %>
<script src="js/tabcontent.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/dropdown/themes/flickr.com/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/tabcontent.css" rel="stylesheet" type="text/css" />

<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MENU:CONTACT'}">
            <div id="judul">Contact Us</div>
            <div class="form-row">
                <h4>PT. Venturium System Indonesia</h4>
                Jl. Utan Kayu No.14 Utan Kayu Utara<br>
                Matraman, Jakarta Timur<br>
                Phone: +62 21-220 88 509/10<br>
                Fax: +62 21-220 880508<br>

                <br>Kompleks Perkantoran Taman Pulo Gebang<br>
                Blok A3 No.11 Cakung<br>
                Jakarta Timur 13910<br>
                Indonesia<br>
                Phone: +62-21 4682 5529<br>
                Fax : +62-21 4682 5530<br><br>
                <h4>Email:</h4>
                info@vensys.co.id for general inquiry<br>
                support@vensys.co.id for support inquiry<br>
                sales@vensys.co.id for sales inquiry<br>
            </div> 
        </c:if>
    </c:forEach>
</div>
