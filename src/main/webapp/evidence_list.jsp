<div class="form-row"><span class="label_sub"><b>Evidence List</b></span></div>
<div class="form-row">
    <table class="fit_table" id="mytable" cellspacing="0" cellpadding="0">
        <thead>
            <tr>
                <th>File Name</th>
                <th>Upload by</th>
                <th>Upload Date</th>
                <th colspan="2">Action</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${evidence_list}" var="item">
            <tr>
                <td>${item.atm_content}</td>
                <td>${item.insert_by}</td>
                <td>${item.insert_date}</td>
                <td><a href="SCDownloadEvidence?id=${item.id_headers}&fileName=${item.atm_content}">Download</a></td>
                <td><a href="SCDeleteEvidence?id=${item.id_headers}&fileName=${item.atm_content}" style="color: #900;" onclick="return confirm('Are you sure want to delete this evidence?')">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>