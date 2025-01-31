<%-- 
    Document   : validateList_scr
    Created on : Jan 30, 2013, 1:28:32 PM
    Author     : hadi
--%>

<script type="text/javascript">
    $(function() {
        $("input[name=date_from]").datepicker({dateFormat:"yy-mm-dd"},new Date());
        $("input[name=date_end]").datepicker({dateFormat:"yy-mm-dd"},new Date());
        $("input[name=value_date]").datepicker({dateFormat:"yy-mm-dd"},new Date());
        $("input[name=updateDate]").datepicker({dateFormat:"ymmdd"},new Date());
//        $("input[name=updatedate]").datepicker({dateFormat:"ymmdd"},new Date());
        $("input[name=date_from_103]").datepicker({dateFormat:"ymmdd"},new Date());
        $("input[name=_060_mf32a_date]").datepicker({dateFormat:"ymmdd"},new Date());
        $("input[name=_060_mf30_date_of_issue]").datepicker({dateFormat:"ymmdd"},new Date());
        $("input[name=value_date_end]").datepicker({dateFormat:"yy-mm-dd"},new Date());
        $("input[name=balance_date]").datepicker({dateFormat:"yy-mm-dd"},new Date());
        $("#value_date").datepicker({dateFormat:"ymmdd"},new Date());
        $("#value_date_2").datepicker({dateFormat:"ymmdd"},new Date());
        $("#value_date_3").datepicker({dateFormat:"ymmdd"},new Date());
        $("#value_date_4").datepicker({dateFormat:"ymmdd"},new Date());
        $("#value_date_5").datepicker({dateFormat:"yymmdd"},new Date());
        $("#value_date_6").datepicker({dateFormat:"yymmdd"},new Date());
        $("#value_date_7").datepicker({dateFormat:"yymmdd"},new Date());
        $("#value_date_8").datepicker({dateFormat:"yymmdd"},new Date());
        $("#value_date_9").datepicker({dateFormat:"ymmdd"},new Date());
        $("#value_date_10").datepicker({dateFormat:"ymmdd"},new Date());
        $("#value_date_11").datepicker({dateFormat:"ymmdd"},new Date());
        $("#value_date_12").datepicker({dateFormat:"ymmdd"},new Date());
        $("#value_date_13").datepicker({dateFormat:"ymmdd"},new Date());
        
        
        $("input[name=dateValue]").datepicker({dateFormat:"ymmdd"},new Date());
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />