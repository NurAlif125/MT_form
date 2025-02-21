<%-- 
    Document   : upload_stmt
    Created on : Feb 17, 2025, 3:13:21 PM
    Author     : rahma
--%>

<%@ include file="header.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MENU:UPLOADSTMT'}">
            <div id="judul">Upload MT950 Outgoing</div>
            <div id="tabs-1">
                <form id="form1" name="form1" method="post" action="SCUploadStmt" enctype="multipart/form-data">
                    <div id="tabs-1" class="formBody">
                        <div class="form-row"><span class="labelL4">Load File</span>
                            <input type="file" name="uploadStmt" id="uploadStmt" class="fileUpload" required>
                        </div>
                        <% if (request.getParameter("status") == null) { %>
                        <% } else if (request.getParameter("status").equalsIgnoreCase("y126")) { %>
                        <div class="dialogs">
                            Upload success, file will be process by reader soon.
                        </div>
                        <% } else { %>
                        <div class="dialogf">
                            Upload failed <% out.println((String) session.getAttribute("err"));%>
                        </div>
                        <% }%>

                    </div>
                    <div class="form-row-action">
                        <input type="submit" name="upload" id="upload" value="Upload" />
                    </div>
                </form>
            </div>
        </c:if>
    </c:forEach>
</div>