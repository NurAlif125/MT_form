<%-- 
    Document   : validateList_scr
    Created on : Oct 10, 2023, 1:28:32 PM
    Author     : farras
--%>

<script type="text/javascript">
    $(function () {
        $("input[name=insert_date]").datepicker({dateFormat: "yy-mm-dd"}, new Date());
        $("input[name=insert_date_end]").datepicker({dateFormat: "yy-mm-dd"}, new Date());
        
        $("input[name=value_date]").datepicker({dateFormat: "yy-mm-dd"}, new Date());
        $("input[name=value_date_end]").datepicker({dateFormat: "yy-mm-dd"}, new Date());
        
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />