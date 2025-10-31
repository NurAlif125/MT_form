

<div class="form-row"><span class="label_sub"><b>Relation</b></span></div>
<div class="form-cols">
    <div class="blok-1">
        <%int rowNum = 1;%>
        <table class="fixed_header" id="mytable" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                    <th style="width:20px;font-size:12px;border-bottom:1px solid">No.</th>
                    <th style="width:100px;font-size:12px;border-bottom:1px solid">Related MT</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${relation}" var="item">
                <tr>
                    <td style="width:20px;font-size:12px;border-bottom:1px solid"><%=rowNum++%></td>
                    <td style="width:100px;font-size:12px;border-bottom:1px solid;text-align:center"><a style="text-decoration:none;color:blue" href="ViewDataTransaksiOutgoing?id=${item.id_headers}">${item.messageType}</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<hr/>