<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="header.jsp" %>
<%@ include file="rule/validate_cut_of.jsp" %>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<div id="isi">
    <c:forEach var="item" items="${role}">
        <c:if test="${item == 'COT:ADD'}">
            <div id="judul">Add Cut off TIme
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'COT:LIST'}">
                        <a href="SCDataCutOffList" class="srb3">Cut Off List</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="message">
                <span class="style1">
                    <div align="center">
                        <c:out value="${message}"/>
                    </div>
                </span>
            </div>
            <form id="form1" name="form1" method="post" action="SCCutOfTime">
                <div id="tabs-1" class="formBody">
                    <div>
                        <input type="hidden" name="id_sandi" id="id_sandi" maxlength="10" size="10" value="${dataCOTById.id_sandi}" />
                    </div>
                    <div class="form-row">
                        <span class="labelL">BIC<b style="color: red">*</b></span>
                        <input type="text" name="sandi" id="sandi" maxlength="12" minlength="12" autocomplete="off" placeholder="Alfabet Only" value="${dataCOTById.sandi}" required 
                               style="text-transform: uppercase;" 
                               oninput="onlyLetters(event); this.value = this.value.toUpperCase();"/>
                    </div>
                    <div class="form-row">
                        <span class="labelL">Opening Time</span>
                        <input type="text" name="waktu" id="waktu" placeholder="HH:mm:ss" pattern="([01]?[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]" value="${dataCOTById.waktu}" required />
                    </div>

                    <div class="form-row">
                        <span class="labelL">Cutoff Time</span>
                        <input type="text" name="waktu_end" id="waktu_end" placeholder="HH:mm:ss" pattern="([01]?[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]" value="${dataCOTById.waktu_end}" required />
                    </div>

                    <div class="form-row">
                        <span class="labelL">Description</span>
                        <input type="text" name="deskripsi" id="deskripsi" value="${dataCOTById.deskripsi}" />
                    </div>

                    <div class="form-row">
                        <!--<span class="labelL">Update By</span>-->
                        <input type="hidden" name="updateby" id="updateby" readonly="true" maxlength="45" value="${dataCOTById.updateBy}" />
                    </div>

                    <div class="form-row">
                        <!--<span class="labelL">Update Date</span>-->
                        <input type="hidden" name="update_date" readonly="true" maxlength="32" value="${dataCOTById.updateDate}" />
                    </div>
                </div>

                <div class="form-row-action">
                    <c:forEach var="item" items="${role}">
                        <c:if test="${item == 'COT:UPDATE'}">
                            <input type="submit" name="submit" id="submit" value="Save" />
                            <input type="reset" name="reset" id="reset" value="Reset" />
                            <input type="submit" name="delete" id="delete" value="Delete"/>
                            <input type="button" name="back" id="back" value="Back" onclick="window.history.back();" />
                        </c:if>
                    </c:forEach>
                </div>
            </form>
        </c:if>
    </c:forEach>
</div>

<script>
    $(document).ready(function () {
        $('#waktu').timepicker({
            timeFormat: 'HH:mm:ss',
            interval: 30,
            minTime: '00:00:00',
            maxTime: '23:59:00',
            startTime: '07:00',
            dynamic: true,
            dropdown: true,
            scrollbar: true,
            zindex: 9999,
            appendTo: 'body'
        });
        $('#waktu_end').timepicker({
            timeFormat: 'HH:mm:ss',
            interval: 30,
            minTime: '00:00:00',
            maxTime: '23:59:00',
            startTime: '07:00',
            dynamic: true,
            dropdown: true,
            scrollbar: true,
            zindex: 9999,
            appendTo: 'body'
        });
    });

</script>

