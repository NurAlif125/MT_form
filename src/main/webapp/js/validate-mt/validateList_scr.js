
    $(function () {
        $("input[name=date_from]").datepicker({dateFormat: "yy-mm-dd"}, new Date());
        $("input[name=date_end]").datepicker({dateFormat: "yy-mm-dd"}, new Date());
        $("input[name=value_date]").datepicker({dateFormat: "yy-mm-dd"}, new Date());
        $("input[name=updateDate]").datepicker({dateFormat: "ymmdd"}, new Date());
//        $("input[name=updatedate]").datepicker({dateFormat:"ymmdd"},new Date());
        $("input[name=date_from_103]").datepicker({dateFormat: "ymmdd"}, new Date());
        $("input[name=_060_mf32a_date]").datepicker({dateFormat: "ymmdd"}, new Date());
        // MT300
        $("input[name=_098_of77h_date]").datepicker({dateFormat: "yymmdd"}, new Date());
        $("input[name=_105_of30u_valuation_date]").datepicker({dateFormat: "yymmdd"}, new Date());
        $("input[name=_120_mf30t_trade_date]").datepicker({dateFormat: "yymmdd"}, new Date());
        $("input[name=_130_mf30v_value_date]").datepicker({dateFormat: "yymmdd"}, new Date());
        // MT320
        $("input[name=_140_mf30p_maturity_date]").datepicker({dateFormat: "yymmdd"}, new Date());
        $("input[name=_170_of30x_next_interest_due_date]").datepicker({dateFormat: "yymmdd"}, new Date());
        $("input[name=_210_of30f_last_day_of_the_first_interest_period]").datepicker({dateFormat: "yymmdd"}, new Date());
        // MT400
        $("input[name=_031_mf32a_date]").datepicker({dateFormat: "ymmdd"}, new Date());
        $("input[name=_041_mf33a_a_date]").datepicker({dateFormat: "ymmdd"}, new Date());
        // MT412
        $("input[name=_030_mf32a_maturity_date]").datepicker({dateFormat: "ymmdd"}, new Date());

        $("input[name=_060_mf30_date_of_issue]").datepicker({dateFormat: "ymmdd"}, new Date());
        $("input[name=value_date_end]").datepicker({dateFormat: "yy-mm-dd"}, new Date());
        $("input[name=balance_date]").datepicker({dateFormat: "yy-mm-dd"}, new Date());
        $("#value_date").datepicker({dateFormat: "ymmdd"}, new Date());
        $("#value_date_2").datepicker({dateFormat: "ymmdd"}, new Date());
        $("#value_date_3").datepicker({dateFormat: "ymmdd"}, new Date());
        $("#value_date_4").datepicker({dateFormat: "ymmdd"}, new Date());
        $("#value_date_5").datepicker({dateFormat: "yymmdd"}, new Date());
        $("#value_date_6").datepicker({dateFormat: "yymmdd"}, new Date());
        $("#value_date_7").datepicker({dateFormat: "yymmdd"}, new Date());
        $("#value_date_8").datepicker({dateFormat: "yymmdd"}, new Date());
        $("#value_date_9").datepicker({dateFormat: "ymmdd"}, new Date());
        $("#value_date_10").datepicker({dateFormat: "ymmdd"}, new Date());
        $("#value_date_11").datepicker({dateFormat: "ymmdd"}, new Date());
        $("#value_date_12").datepicker({dateFormat: "ymmdd"}, new Date());
        $("#value_date_13").datepicker({dateFormat: "ymmdd"}, new Date());
        $("#insert_date_from").datepicker({dateFormat: "yy-mm-dd"}, new Date());
        $("#insert_date_end").datepicker({dateFormat: "yy-mm-dd"}, new Date());
//        $("input.time_from").timepicker({});
//        $("input[name=time_end]").timepicker({timeFormat: 'HH:mm:ss',interval: 30,minTime: '00',maxTime: '23:30',defaultTime: '23:59:59',startTime: '00:00',dynamic: true,dropdown: true,scrollbar: true});
        $("input[name=dateValue]").datepicker({dateFormat: "ymmdd"}, new Date());
    });