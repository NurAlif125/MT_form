<%-- 
    Document   : upload
    Created on : Apr 17, 2018, 6:12:52 AM
    Author     : AplDev2
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_user.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'MENU:UPLOADCNF'}">
            <div id="judul">Upload Confirmation</div>
            <div id="tabs-1">
                <form id="form1" name="form1" method="post" action="SCUploadConfirmation" enctype="multipart/form-data">
                    <div id="tabs-1" class="formBody">
                        <div class="form-row"><span class="labelL4">Load File</span>
                            <input type="file" name="uploadTransaksiCnf" id="uploadTransaksiCnf" class="fileUpload" required>
                        </div>
                        <% if (request.getParameter("status") == null) { %>
                        <% } else if (request.getParameter("status").equalsIgnoreCase("y126")) { %>
                        <div class="dialogs">
                            Upload success
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

