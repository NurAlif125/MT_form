<%-- 
    Document   : header_mx
    Created on : Jul 13, 2023, 2:32:25 PM
    Author     : Baim
--%>



<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">  
<!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">-->
<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>-->
<!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />-->
<!--<script src="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest"></script>-->
<!-- <link rel="stylesheet" href="data-tree.css" /> -->
<script src="json-xml-data-tree/json-xml-data-tree/data-tree.js"></script>
<link rel="stylesheet" href="json-xml-data-tree/json-xml-data-tree/data-tree.css" />
<style>
    .scrl {
        position: relative;
        height: 600px;
        overflow: auto;
    }

    .codex-editor__redactor { padding-bottom: 30px !important; } 
</style>


<!--<div class="container mt-5">-->
    <div class="form-cols">

        <div class="blok-1">
            <span><h3>Before</h3></span> <br/>
            <textarea name="before" id="before"><c:out value="${mx_modify}" /></textarea>
        </div>
        <div class="blok-1">
            <span><h3>After</h3></span> <br/>
            <textarea name="after" id="after"><c:out value="${final_mx}" /></textarea>
        </div>
        <div class="blok-1">
            <br/><span><h3>Record Before Changed</h3></span>
            <pre style="color:red;white-space: normal;">${keyBefore}</pre>
        </div>
        <div class="blok-1">
            <br/><span><h3>Record After Changed</h3></span>
            <pre style="color:red;white-space: normal;">${keyAfter}</pre>
        </div>
    </div>
    <!--
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <!--    <script>
           var xmldata3 = document.getElementById("tree1").value;
        new DataTree({
            xml: xmldata3,
            container: '#mxfinal',
            attrs:'show',
            startExpanded:true
     ???});
        </script>
        <script>
           var xmldata30 = document.getElementById("tree0").value;
        new DataTree({
            xml: xmldata30,
            container: '#mxmodify',
            attrs:'show',
            startExpanded:true
     ???});
        </script>-->
