<%-- 
    Document   : validateList_scr
    Created on : Jan 30, 2013, 1:28:32 PM
    Author     : hadi
--%>

<script type="text/javascript">
    $(function () {
        $("input[name=date_from]").datepicker({dateFormat: "yy-mm-dd"}, new Date());
        $("input[name=date_end]").datepicker({dateFormat: "yy-mm-dd"}, new Date());
        $("input[name=value_date]").datepicker({dateFormat: "yy-mm-dd"}, new Date());
        $("input[name=updateDate]").datepicker({dateFormat: "ymmdd"}, new Date());
//        $("input[name=updatedate]").datepicker({dateFormat:"ymmdd"},new Date());
        $("input[name=date_from_103]").datepicker({dateFormat:"ymmdd"},new Date());
        $("input[name=_060_mf32a_date]").datepicker({dateFormat:"ymmdd"},new Date());
        $("input[name=_060_mf30_date_of_issue]").datepicker({dateFormat:"ymmdd"},new Date());
        $("input[name=_013_mf11s_date]").datepicker({dateFormat:"ymmdd"},new Date());
        $("input[name=_060_mf30_date_of_issue]").datepicker({dateFormat:"ymmdd"},new Date());
        $("input[name=_041_mf60f_date").datepicker({dateFormat:"ymmdd"},new Date()); // added on 20250815
        $("input[name=_045_mf60m_date").datepicker({dateFormat:"ymmdd"},new Date()); // added on 20250815
        $("input[name=_062_mf62f_date").datepicker({dateFormat:"ymmdd"},new Date()); // added on 20250815
        $("input[name=_066_mf62m_date").datepicker({dateFormat:"ymmdd"},new Date()); // added on 20250815 
        $("input[name=_071_of64_date").datepicker({dateFormat:"ymmdd"},new Date()); // added on 20250815
        $("input[name=_051_mf60f_date").datepicker({dateFormat:"ymmdd"},new Date()); // added on 20250819
        $("input[name=_055_mf60m_date").datepicker({dateFormat:"ymmdd"},new Date()); // added on 20250819
        $("input[name=_081_mf62f_date").datepicker({dateFormat:"ymmdd"},new Date()); // added on 20250819
        $("input[name=_085_mf62m_date").datepicker({dateFormat:"ymmdd"},new Date()); // added on 20250819
        
        $("input[name=_050_mf31c_date_of_issue").datepicker({dateFormat:"ymmdd"},new Date()); // added on 20250909
        $("input[name=_070_mf31d_date_of_expiry").datepicker({dateFormat:"ymmdd"},new Date()); // added on 20250909
        $("input[name=_040_mf30_date_of_message_being_acknowledged").datepicker({dateFormat:"ymmdd"},new Date()); // added on 20250930
        $("input[name=_030_mf32a_date").datepicker({dateFormat:"ymmdd"},new Date()); // added on 20250930
        $("input[name=_030_mf30_date_of_the_original_authorisation_to_reimburse").datepicker({dateFormat:"ymmdd"},new Date()); // added on 20250930
        $("input[name=_040_of31e_new_date_of_expiry").datepicker({dateFormat:"ymmdd"},new Date()); // added on 20250930
        
        $("input[name=_030_of31c_date_of_issue").datepicker({dateFormat:"ymmdd"},new Date()); // added on 20251008
        $("input[name=_080_mf34a_Date").datepicker({dateFormat:"ymmdd"},new Date()); // added on 20251008
        $("input[name=_050_of33a_date").datepicker({dateFormat:"ymmdd"},new Date()); // added on 20251008
        $("input[name=_260_of44c_latest_date_of_shipment").datepicker({dateFormat:"ymmdd"},new Date()); // added on 20251008
        
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
        $("#insert_date_from").datepicker({dateFormat:"yy-mm-dd"},new Date());
        $("#insert_date_end").datepicker({dateFormat:"yy-mm-dd"},new Date());
        
//        $("input.time_from").timepicker({});
//        $("input[name=time_end]").timepicker({timeFormat: 'HH:mm:ss',interval: 30,minTime: '00',maxTime: '23:30',defaultTime: '23:59:59',startTime: '00:00',dynamic: true,dropdown: true,scrollbar: true});
        $("input[name=dateValue]").datepicker({dateFormat: "ymmdd"}, new Date());
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />