<link type="text/css" href="css/log_trx.css" rel="stylesheet" />
<div class="form-row"><span class="label_sub"><b>Log MT Text</b></span></div>
<div class="form-row">
    <div class="form-cols">
        <div class="blok-1">
            <span><h3>Before</h3></span> <br/>
            <textarea name="before" id="before" class="mttext" readonly="true"><c:out value="${textById.modify_mt}" /></textarea>
        </div>
        <div class="blok-1">
            <span><h3>After</h3></span> <br/>
            <textarea name="after" id="after" class="mttext" readonly="true"><c:out value="${textById.final_mt}" /></textarea>
        </div>
        <div class="blok-1">
            <br/><span><h3>Record Before Changed</h3></span>
            <textarea cols="200" rows="6" class="mtlog" readonly="true">${keyBefore}</textarea>
        </div>
        <div class="blok-1">
            <br/><span><h3>Record After Changed</h3></span>
            <textarea cols="200" rows="6" class="mtlog" readonly="true">${keyAfter}</textarea>
        </div>
    </div>
</div>
<hr/>