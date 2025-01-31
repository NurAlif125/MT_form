<%-- 
    Document   : UploadCounterrate
    Created on : Jul 31, 2023, 9:32:52 AM
    Author     : Baim
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_user.jsp" %>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'CTR:UPLOAD'}">
            <div id="judul">Upload Counter Rate</div>
            <div id="tabs-1">
                <form id="form1" name="form1" method="post" action="UploadCounterrate" enctype="multipart/form-data">
                    <div id="tabs-1" class="formBody">
                        <div class="form-row"><span class="labelL4">Load File</span>
                            <input type="file" name="uploadTransaksiCnf" id="uploadTransaksiCnf" class="fileUpload" required>
                        </div>
                        <% if (request.getParameter("status") == null) { %>
                        <% } else if (request.getParameter("status").equalsIgnoreCase("errorMsg")) { %>
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
                        <div class="form-row-action-right"> 
                            <input type="button" name="back" id="back" value="Back" />
                        </div>
                    </div>
                </form>
            </div>
        </c:if>
    </c:forEach>
</div>