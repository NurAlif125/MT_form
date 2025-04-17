<%-- 
    Document   : mt_mx
    Created on : Apr 17, 2025, 10:25:27 AM
    Author     : rafli
--%>

<div class="form-cols2">
    <div class="blok-1">
        <span><h3>MT</h3></span> <br/>
        <textarea name="before" id="before" readonly="true"><c:out value="${textById.final_mt}" /></textarea>
    </div>
    <div class="blok-1">
        <span><h3>MX</h3></span> <br/>
        <textarea name="after" id="after" readonly="true"><c:out value="${textById.final_mx}" /></textarea>
    </div>
</div>
