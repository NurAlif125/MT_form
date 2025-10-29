<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/editorjs@latest.js"></script>

<!-- <link rel="stylesheet" href="data-tree.css" /> -->
<script src="js/json-xml-data-tree/data-tree.js"></script>
<link rel="stylesheet" href="js/json-xml-data-tree/data-tree.css" />
<style>
    .scrl {
        position: relative;
        height: 600px;
        overflow: auto;
    }
    .codex-editor__redactor { padding-bottom: 30px !important; } 

</style>
<div class="row">
    <div class="col">
        <h1>MT</h1>
        <div class=" shadow-sm p-3 bg-body rounded">
              <input type="hidden" name="mxview2" id="mxview2" value="<c:out value="${final_mt}" />"/>
            <div style="font-size: 12px;" class="scrl" id="editor">
            </div>
        </div> 
    </div>
<!--        <div class="col">
        <h1>MX</h1>
        <div class=" shadow-sm p-3 bg-body rounded">
            <div class="scrl" id="tree" >
                <input type="hidden" name="mxview" id="mxview" value="<c:out value="${final_mx}" />"/>
            </div>
        </div>
    </div>-->
    <div class="col" id="mx-container" style="visibility: hidden;">
        <h1>MX</h1>
        <div class="shadow-sm p-3 bg-body rounded">
            <div class="scrl" id="tree">
                <input type="hidden" name="mxview" id="mxview" value="<c:out value='${final_mx}' />" />
            </div>
        </div>
    </div>
</div>
<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>-->
<script>
var mxviewValue = document.getElementById("mxview2").value;
var parts = mxviewValue.split("\n");
const editor = new EditorJS({
    holderId : 'editor',
    data: {
        blocks: parts.map(part => ({
            type: 'paragraph',
            data: {
                text: part
            }
        }))
    }
});
</script>
<!--    <script>
var xmldata = document.getElementById("mxview").value;
new DataTree({
    xml: xmldata,
    container: '#tree',
    attrs: 'show',
    startExpanded: true
});
</script>-->
<script>
var xmldata = document.getElementById("mxview").value;

if (xmldata.trim() !== "") {
    document.getElementById("mx-container").style.visibility = "visible";
    new DataTree({
        xml: xmldata,
        container: '#tree',
        attrs: 'show',
        startExpanded: true
    });
} else {
    document.getElementById("mx-container").style.visibility = "hidden";
}
</script>