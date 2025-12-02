<%-- 
    Document   : validate_rule_mt110
    Created on : Apr 10, 2025, 2:16:33 PM
    Author     : rizkiyee
--%>

<script type="text/javascript">
//console.log("validate_rule_mt110.jsp loaded");
    $(document).ready(function () {
        let validator = $("#form1").validate({
            ignore: [],  
            onkeyup: false,          // Nonaktifkan validasi saat mengetik
            onfocusout: false,       // Nonaktifkan validasi saat pindah input
//            onclick: false,          // Nonaktifkan validasi saat klik
            rules: {
                //header
                //unit: "required",
                sender_logical_terminal: "required",
                //sender_type: "required",
                //sender_type_institution: "required",

                //receiver_type: "required",
                receiver_institution: "required",

                priority: "required",
                //monitoring: "required",

                //body
                _010_mf20_senders_reference: "required",
                //mf21
                _151_mf21_cheque_number: "required",
                _461_mf21_cheque_number: "required",
                _771_mf21_cheque_number: "required",
                _1081_mf21_cheque_number: "required",
                _1391_mf21_cheque_number: "required",
                _1701_mf21_cheque_number: "required",
                _2011_mf21_cheque_number: "required",
                _2321_mf21_cheque_number: "required",
                _2631_mf21_cheque_number: "required",
                _2941_mf21_cheque_number: "required",

                //mf30a
                _161_mf30_date_of_issue: "required",
                _471_mf30_date_of_issue: "required",
                _781_mf30_date_of_issue: "required",
                _1091_mf30_date_of_issue: "required",
                _1401_mf30_date_of_issue: "required",
                _1711_mf30_date_of_issue: "required",
                _2021_mf30_date_of_issue: "required",
                _2331_mf30_date_of_issue: "required",
                _2641_mf30_date_of_issue: "required",
                _2951_mf30_date_of_issue: "required",

                //mf32a
                type_mf32_amount_collected: "required",
                type_mf32_amount_collected_2: "required",
                type_mf32_amount_collected_3: "required",
                type_mf32_amount_collected_4: "required",
                type_mf32_amount_collected_5: "required",
                type_mf32_amount_collected_6: "required",
                type_mf32_amount_collected_7: "required",
                type_mf32_amount_collected_8: "required",
                type_mf32_amount_collected_9: "required",
                type_mf32_amount_collected_10: "required",
                _170_mf32a_date: "required",
                _171_mf32a_currency: "required",
                _172_mf32a_amount: "required",

                _480_mf32_date: "required",
                _481_mf32_currency: "required",
                _482_mf32_amount: "required",
                
                /*
                _790_mf32a_date: "required",
                _791_mf32a_currency: "required",
                _792_mf32a_amount: "required",

                _1100_mf32a_date: "required",
                _1101_mf32a_currency: "required",
                _1102_mf32a_amount: "required",

                _1410_mf32a_date: "required",
                _1411_mf32a_currency: "required",
                _1412_mf32a_amount: "required",

                _1720_mf32a_date: "required",
                _1721_mf32a_currency: "required",
                _1722_mf32a_amount: "required",

                _2030_mf32a_date: "required",
                _2031_mf32a_currency: "required",
                _2032_mf32a_amount: "required",

                _2340_mf32a_date: "required",
                _2341_mf32a_currency: "required",
                _2342_mf32a_amount: "required",

                _2650_mf32a_date: "required",
                _2651_mf32a_currency: "required",
                _2652_mf32a_amount: "required",

                _2960_mf32a_date: "required",
                _2961_mf32a_currency: "required",
                _2962_mf32a_amount: "required",
                */

                //mf32b
                _173_mf32b_currency: "required",
                _174_mf32b_amount: "required",
                _483_mf32b_currency: "required",
                _484_mf32b_amount: "required",
                
                /*
                _793_mf32b_currency: "required",
                _794_mf32b_amount: "required",
                _1103_mf32b_currency: "required",
                _1104_mf32b_amount: "required",
                _1413_mf32b_currency: "required",
                _1414_mf32b_amount: "required",
                _1723_mf32b_currency: "required",
                _1724_mf32b_amount: "required",
                _2033_mf32b_currency: "required",
                _2034_mf32b_amount: "required",
                _2343_mf32b_currency: "required",
                _2344_mf32b_amount: "required",
                _2653_mf32b_currency: "required",
                _2654_mf32b_amount: "required",
                _2963_mf32b_currency: "required",
                _2964_mf32b_amount: "required",
                */
               
                //of53a
//                _121_of53a_identifier_code: "required",
//                _136_of54d_name_address: "required",
//
//                //of50a
//                _181_of50a_identifier_code: "required",
                
                /*
                _491_of50a_identifier_code: "required",
                _801_of50a_identifier_code: "required",
                _1111_of50a_identifier_code: "required",
                _1421_of50a_identifier_code: "required",
                _1731_of50a_identifier_code: "required",
                _2041_of50a_identifier_code: "required",
                _2351_of50a_identifier_code: "required",
                _2661_of50a_identifier_code: "required",
                _2971_of50a_identifier_code: "required",
                */
                
                //of50f
                /*
                _183_of50f_account: "required",
                _493_of50f_account: "required",
                _803_of50f_account: "required",
                _803_of50f_account: "required",
                _1113_of50f_account: "required",
                _1423_of50f_account: "required",
                _1733_of50f_account: "required",
                _2043_of50f_account: "required",
                _2353_of50f_account: "required",
                _2663_of50f_account: "required",
                _2973_of50f_account: "required",
                */
        
                //53d
//                _126_of53d_name_address: "required",
//
//                //54a
//                _131_of54a_identifier_code : "required",
                
                //50f
                /*
                _183_of50f_account: "required",
                _184_mf50f_number: "required",
                _185_of50f_details: "required",
                _186_of50f_number: "required",
                _187_of50f_details: "required",
                _188_of50f_number: "required",
                _189_of50f_details: "required",
                _190_of50f_number: "required",
                _191_of50f_details: "required",


                _493_of50f_account: "required",
                _494_mf50f_number: "required",
                _495_of50f_details: "required",
                _496_of50f_number: "required",
                _497_of50f_details: "required",
                _498_of50f_number: "required",
                _499_of50f_details: "required",
                _500_of50f_number: "required",
                _501_of50f_details: "required",

                _803_of50f_account: "required",
                _804_mf50f_number: "required",
                _805_of50f_details: "required",
                _806_of50f_number: "required",
                _807_of50f_details: "required",
                _808_of50f_number: "required",
                _809_of50f_details: "required",
                _810_of50f_number: "required",
                _811_of50f_details: "required",


                _1113_of50f_account: "required",
                _1114_mf50f_number: "required",
                _1115_of50f_details: "required",
                _1116_of50f_number: "required",
                _1117_of50f_details: "required",
                _1118_of50f_number: "required",
                _1119_of50f_details: "required",
                _1120_of50f_number: "required",
                _1121_of50f_details: "required",



                _1423_of50f_account: "required",
                _1424_mf50f_number: "required",
                _1425_of50f_details: "required",
                _1426_of50f_number: "required",
                _1427_of50f_details: "required",
                _1428_of50f_number: "required",
                _1429_of50f_details: "required",
                _1430_of50f_number: "required",
                _1431_of50f_details: "required",
                
                _1733_of50f_account: "required",
                _1734_mf50f_number: "required",
                _1735_of50f_details: "required",
                _1736_of50f_number: "required",
                _1737_of50f_details: "required",
                _1738_of50f_number: "required",
                _1739_of50f_details: "required",
                _1740_of50f_number: "required",
                _1741_of50f_details: "required",

                _2043_of50f_account: "required",
                _2044_mf50f_number: "required",
                _2045_of50f_details: "required",
                _2046_of50f_number: "required",
                _2047_of50f_details: "required",
                _2048_of50f_number: "required",
                _2049_of50f_details: "required",
                _2050_of50f_number: "required",
                _2051_of50f_details: "required",

                _2353_of50f_account: "required",
                _2354_mf50f_number: "required",
                _2355_of50f_details: "required",
                _2356_of50f_number: "required",
                _2357_of50f_details: "required",
                _2358_of50f_number: "required",
                _2359_of50f_details: "required",
                _2360_of50f_number: "required",
                _2361_of50f_details: "required",

                _2663_of50f_account: "required",
                _2664_mf50f_number: "required",
                _2665_of50f_details: "required",
                _2666_of50f_number: "required",
                _2667_of50f_details: "required",
                _2668_of50f_number: "required",
                _2669_of50f_details: "required",
                _2670_of50f_number: "required",
                _2671_of50f_details: "required",

                _2973_of50f_account: "required",
                _2974_mf50f_number: "required",
                _2975_of50f_details: "required",
                _2976_of50f_number: "required",
                _2977_of50f_details: "required",
                _2978_of50f_number: "required",
                _2979_of50f_details: "required",
                _2980_of50f_number: "required",
                _2981_of50f_details: "required",
                */
        
                //of50k
//                _193_of50k_name_address: "required",
                /*
                _503_of50k_name_address: "required",
                _813_of50k_name_address: "required",
                _1123_of50k_name_address: "required",
                _1433_of50k_name_address: "required",
                _1743_of50k_name_address: "required",
                _2053_of50k_name_address: "required",
                _2363_of50k_name_address: "required",
                _2673_of50k_name_address: "required",
                _2983_of50k_name_address: "required",
                */

                //of52a
                /*
                _291_of52a_Identifier_Code: "required",
                _601_of52a_Identifier_Code: "required",
                _911_of52a_Identifier_Code: "required",
                _1221_of52a_Identifier_Code: "required",
                _1531_of52a_Identifier_Code: "required",
                _1841_of52a_Identifier_Code: "required",
                _2151_of52a_Identifier_Code: "required",
                _2461_of52a_Identifier_Code: "required",
                _2771_of52a_Identifier_Code: "required",
                _3081_of52a_Identifier_Code: "required",
                */
                

                //of52d
                /*
                _295_of52d_Name_and_Address: "required",
                _605_of52d_Name_and_Address: "required",
                _915_of52d_Name_and_Address: "required",
                _1225_of52d_Name_and_Address: "required",
                _1535_of52d_Name_and_Address: "required",
                _1845_of52d_Name_and_Address: "required",
                _2155_of52d_Name_and_Address: "required",
                _2465_of52d_Name_and_Address: "required",
                _2775_of52d_Name_and_Address: "required",
                _3085_of52d_Name_and_Address: "required",
                */

                //mf59
                type_of59_59a_: "required",
                /*
                type_of59_59a__2: "required",
                type_of59_59a__3: "required",
                type_of59_59a__4: "required",
                type_of59_59a__5: "required",
                type_of59_59a__6: "required",
                type_of59_59a__7: "required",
                type_of59_59a__8: "required",
                type_of59_59a__9: "required",
                type_of59_59a__10: "required",
                type_of59_59a_name_address: "required",
                */
                _300_mf59_account: "required",
                _301_mf59_name_address: "required",
                /*
                _611_mf59_name_address: "required",
                _921_mf59_name_address: "required",
                _1231_mf59_name_address: "required",
                _1541_mf59_name_address: "required",
                _1851_mf59_name_address: "required",
                _2161_mf59_name_address: "required",
                _2471_mf59_name_address: "required",
                _2781_mf59_name_address: "required",
                _3091_mf59_name_address: "required",
                */

                //mf59f
                _302_mf59f_account: "required",
                _303_mf59f_number: "required",
                _304_mf59f_details: "required",
                _305_mf59f_number: "required",
                _306_mf59f_details: "required",
                _307_mf59f_number: "required",
                _308_mf59f_details: "required",
                _309_mf59f_number: "required",
                _310_mf59f_details: "required",

                /*
                _613_mf59f_number: "required",
                _614_mf59f_details: "required",
                _615_mf59f_number: "required",
                _616_mf59f_details: "required",
                _617_mf59f_number: "required",
                _618_mf59f_details: "required",
                _619_mf59f_number: "required",
                _620_mf59f_details: "required",


                _923_mf59f_number: "required",
                _924_mf59f_details: "required",
                _925_mf59f_number: "required",
                _926_mf59f_details: "required",
                _927_mf59f_number: "required",
                _928_mf59f_details: "required",
                _929_mf59f_number: "required",
                _930_mf59f_details: "required",

                _1233_mf59f_number: "required",
                _1234_mf59f_details: "required",
                _1235_mf59f_number: "required",
                _1236_mf59f_details: "required",
                _1237_mf59f_number: "required",
                _1238_mf59f_details: "required",
                _1239_mf59f_number: "required",
                _1240_mf59f_details: "required",

                _1543_mf59f_number: "required",
                _1544_mf59f_details: "required",
                _1545_mf59f_number: "required",
                _1546_mf59f_details: "required",
                _1547_mf59f_number: "required",
                _1548_mf59f_details: "required",
                _1549_mf59f_number: "required",
                _1550_mf59f_details: "required",

                _1853_mf59f_number: "required",
                _1854_mf59f_details: "required",
                _1855_mf59f_number: "required",
                _1856_mf59f_details: "required",
                _1857_mf59f_number: "required",
                _1858_mf59f_details: "required",
                _1859_mf59f_number: "required",
                _1860_mf59f_details: "required",

                _2163_mf59f_number: "required",
                _2164_mf59f_details: "required",
                _2165_mf59f_number: "required",
                _2166_mf59f_details: "required",
                _2167_mf59f_number: "required",
                _2168_mf59f_details: "required",
                _2169_mf59f_number: "required",
                _2170_mf59f_details: "required",

                _2473_mf59f_number: "required",
                _2474_mf59f_details: "required",
                _2475_mf59f_number: "required",
                _2476_mf59f_details: "required",
                _2477_mf59f_number: "required",
                _2478_mf59f_details: "required",
                _2479_mf59f_number: "required",
                _2480_mf59f_details: "required",

                _2783_mf59f_number: "required",
                _2784_mf59f_details: "required",
                _2785_mf59f_number: "required",
                _2786_mf59f_details: "required",
                _2787_mf59f_number: "required",
                _2788_mf59f_details: "required",
                _2789_mf59f_number: "required",
                _2790_mf59f_details: "required",

                _3093_mf59f_number: "required",
                _3094_mf59f_details: "required",
                _3095_mf59f_number: "required",
                _3096_mf59f_details: "required",
                _3097_mf59f_number: "required",
                _3098_mf59f_details: "required",
                _3099_mf59f_number: "required",
                _3100_mf59f_details: "required",
                */
            },
            messages: { 
                
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_senders_reference: {required: "senders_reference harus diisi..!!"},
                //mf21
                _151_mf21_cheque_number: {required: "cheque_number harus diisi..!!"},
                _461_mf21_cheque_number: {required: "cheque_number harus diisi..!!"},
                _771_mf21_cheque_number: {required: "cheque_number harus diisi..!!"},
                _1081_mf21_cheque_number: {required: "cheque_number harus diisi..!!"},
                _1391_mf21_cheque_number: {required: "cheque_number harus diisi..!!"},
                _1701_mf21_cheque_number: {required: "cheque_number harus diisi..!!"},
                _2011_mf21_cheque_number: {required: "cheque_number harus diisi..!!"},
                _2321_mf21_cheque_number: {required: "cheque_number harus diisi..!!"},
                _2631_mf21_cheque_number: {required: "cheque_number harus diisi..!!"},
                _2941_mf21_cheque_number: {required: "cheque_number harus diisi..!!"},

                //mf30a
                _161_mf30_date_of_issue: {required: "date_of_issue harus diisi..!!"},
                _471_mf30_date_of_issue: {required: "date_of_issue harus diisi..!!"},
                _781_mf30_date_of_issue: {required: "date_of_issue harus diisi..!!"},
                _1091_mf30_date_of_issue: {required: "date_of_issue harus diisi..!!"},
                _1401_mf30_date_of_issue: {required: "date_of_issue harus diisi..!!"},
                _1711_mf30_date_of_issue: {required: "date_of_issue harus diisi..!!"},
                _2021_mf30_date_of_issue: {required: "date_of_issue harus diisi..!!"},
                _2331_mf30_date_of_issue: {required: "date_of_issue harus diisi..!!"},
                _2641_mf30_date_of_issue: {required: "date_of_issue harus diisi..!!"},
                _2951_mf30_date_of_issue: {required: "date_of_issue harus diisi..!!"},

                //mf32a
                type_mf32_amount_collected: {required: "type_mf32_amount_collected harus diisi..!!"},
                type_mf32_amount_collected_2: {required: "type_mf32_amount_collected_2 harus diisi..!!"},
                type_mf32_amount_collected_3: {required: "type_mf32_amount_collected_3 harus diisi..!!"},
                type_mf32_amount_collected_4: {required: "type_mf32_amount_collected_4 harus diisi..!!"},
                type_mf32_amount_collected_5: {required: "type_mf32_amount_collected_5 harus diisi..!!"},
                type_mf32_amount_collected_6: {required: "type_mf32_amount_collected_6 harus diisi..!!"},
                type_mf32_amount_collected_7: {required: "type_mf32_amount_collected_7 harus diisi..!!"},
                type_mf32_amount_collected_8: {required: "type_mf32_amount_collected_8 harus diisi..!!"},
                type_mf32_amount_collected_9: {required: "type_mf32_amount_collected_9 harus diisi..!!"},
                type_mf32_amount_collected_10: {required: "type_mf32_amount_collected_10 harus diisi..!!"},
                
                _170_mf32a_date: {required: "date harus diisi..!!"},
                _171_mf32a_currency: {required: "currency harus diisi..!!"},
                _172_mf32a_amount: {required: "amount harus diisi..!!"},
                /*
                _480_mf32_date: {required: "date harus diisi..!!"},
                _481_mf32_currency: {required: "currency harus diisi..!!"},
                _482_mf32_amount: {required: "amount harus diisi..!!"},
                _790_mf32a_date: {required: "date harus diisi..!!"},
                _791_mf32a_currency: {required: "currency harus diisi..!!"},
                _792_mf32a_amount: {required: "amount harus diisi..!!"},
                _1100_mf32a_date: {required: "date harus diisi..!!"},
                _1101_mf32a_currency: {required: "currency harus diisi..!!"},
                _1102_mf32a_amount: {required: "amount harus diisi..!!"},
                _1410_mf32a_date: {required: "date harus diisi..!!"},
                _1411_mf32a_currency: {required: "currency harus diisi..!!"},
                _1412_mf32a_amount: {required: "amount harus diisi..!!"},
                _1720_mf32a_date: {required: "date harus diisi..!!"},
                _1721_mf32a_currency: {required: "currency harus diisi..!!"},
                _1722_mf32a_amount: {required: "amount harus diisi..!!"},
                _2030_mf32a_date: {required: "date harus diisi..!!"},
                _2031_mf32a_currency: {required: "currency harus diisi..!!"},
                _2032_mf32a_amount: {required: "amount harus diisi..!!"},
                _2340_mf32a_date: {required: "date harus diisi..!!"},
                _2341_mf32a_currency: {required: "currency harus diisi..!!"},
                _2342_mf32a_amount: {required: "amount harus diisi..!!"},
                _2650_mf32a_date: {required: "date harus diisi..!!"},
                _2651_mf32a_currency: {required: "currency harus diisi..!!"},
                _2652_mf32a_amount: {required: "amount harus diisi..!!"},
                _2960_mf32a_date: {required: "date harus diisi..!!"},
                _2961_mf32a_currency: {required: "currency harus diisi..!!"},
                _2962_mf32a_amount: {required: "amount harus diisi..!!"},
                */
        
                //mf32b
                _173_mf32b_currency: {required: "currency harus diisi..!!"},
                _174_mf32b_amount: {required: "amount harus diisi..!!"},
                /*
                _483_mf32b_currency: {required: "currency harus diisi..!!"},
                _484_mf32b_amount: {required: "amount harus diisi..!!"},
                _793_mf32b_currency: {required: "currency harus diisi..!!"},
                _794_mf32b_amount: {required: "amount harus diisi..!!"},
                _1103_mf32b_currency: {required: "currency harus diisi..!!"},
                _1104_mf32b_amount: {required: "amount harus diisi..!!"},
                _1413_mf32b_currency: {required: "currency harus diisi..!!"},
                _1414_mf32b_amount: {required: "amount harus diisi..!!"},
                _1723_mf32b_currency: {required: "currency harus diisi..!!"},
                _1724_mf32b_amount: {required: "amount harus diisi..!!"},
                _2033_mf32b_currency: {required: "currency harus diisi..!!"},
                _2034_mf32b_amount: {required: "amount harus diisi..!!"},
                _2343_mf32b_currency: {required: "currency harus diisi..!!"},
                _2344_mf32b_amount: {required: "amount harus diisi..!!"},
                _2653_mf32b_currency: {required: "currency harus diisi..!!"},
                _2654_mf32b_amount: {required: "amount harus diisi..!!"},
                _2963_mf32b_currency: {required: "currency harus diisi..!!"},
                _2964_mf32b_amount: {required: "amount harus diisi..!!"},
                */

                //of53a
//                _121_of53a_identifier_code: {required: "identifier_code harus diisi..!!"},
//                _136_of54d_name_address: {required: "name_address harus diisi..!!"},
//
//                //53d
//                _126_of53d_name_address: {required: "name_address harus diisi..!!"},
//
//                //54a
//                _131_of54a_identifier_code: {required: "identifier_code harus diisi..!!"},

                //of50a
//                _181_of50a_identifier_code: {required: "identifier harus diisi..!!"},
//                _491_of50a_identifier_code: {required: "identifier harus diisi..!!"},
//                _801_of50a_identifier_code: {required: "identifier harus diisi..!!"},
//                _1111_of50a_identifier_code: {required: "identifier harus diisi..!!"},
//                _1421_of50a_identifier_code: {required: "identifier harus diisi..!!"},
//                _1731_of50a_identifier_code: {required: "identifier harus diisi..!!"},
//                _2041_of50a_identifier_code: {required: "identifier harus diisi..!!"},
//                _2351_of50a_identifier_code: {required: "identifier harus diisi..!!"},
//                _2661_of50a_identifier_code: {required: "identifier harus diisi..!!"},
//                _2971_of50a_identifier_code: {required: "identifier harus diisi..!!"},

                //of50f
//                _183_of50f_account: {required: "party_identifier harus diisi..!!"},
                /*
                _493_of50f_account: {required: "party_identifier harus diisi..!!"},
                _803_of50f_account: {required: "party_identifier harus diisi..!!"},
                _1113_of50f_account: {required: "party_identifier harus diisi..!!"},
                _1423_of50f_account: {required: "party_identifier harus diisi..!!"},
                _1733_of50f_account: {required: "party_identifier harus diisi..!!"},
                _2043_of50f_account: {required: "party_identifier harus diisi..!!"},
                _2353_of50f_account: {required: "party_identifier harus diisi..!!"},
                _2663_of50f_account: {required: "party_identifier harus diisi..!!"},
                _2973_of50f_account: {required: "party_identifier harus diisi..!!"},
                */

                //of50k
//                _192_of50k_account: {required: "party_identifier harus diisi..!!"},
                
                //of50f
                /*
                _184_mf50f_number: {required: "mf50f_number harus diisi..!!"},
                _185_of50f_details: {required: "of50f_details harus diisi..!!"},
                _186_of50f_number: {required: "of50f_number harus diisi..!!"},
                _187_of50f_details: {required: "of50f_details harus diisi..!!"},
                _188_of50f_number: {required: "of50f_number harus diisi..!!"},
                _189_of50f_details: {required: "of50f_details harus diisi..!!"},
                _190_of50f_number:{required: "of50f_number harus diisi..!!"},
                _191_of50f_details: {required: "of50f_details harus diisi..!!"},
                _493_of50f_account: {required: "party_identifier harus diisi..!!"},
                _494_mf50f_number: {required: "mf50f_number harus diisi..!!"},
                _495_of50f_details: {required: "of50f_details harus diisi..!!"},
                _496_of50f_number: {required: "of50f_number harus diisi..!!"},
                _497_of50f_details: {required: "of50f_details harus diisi..!!"},
                _498_of50f_number: {required: "of50f_number harus diisi..!!"},
                _499_of50f_details: {required: "of50f_details harus diisi..!!"},
                _500_of50f_number: {required: "of50f_number harus diisi..!!"},
                _501_of50f_details: {required: "of50f_details harus diisi..!!"},
                _803_of50f_account: {required: "party_identifier harus diisi..!!"},
                _804_mf50f_number: {required: "mf50f_number harus diisi..!!"},
                _805_of50f_details: {required: "of50f_details harus diisi..!!"},
                _806_of50f_number: {required: "of50f_number harus diisi..!!"},
                _807_of50f_details: {required: "of50f_details harus diisi..!!"},
                _808_of50f_number: {required: "of50f_number harus diisi..!!"},
                _809_of50f_details: {required: "of50f_details harus diisi..!!"},
                _810_of50f_number: {required: "of50f_number harus diisi..!!"},
                _811_of50f_details: {required: "of50f_details harus diisi..!!"},
                _1113_of50f_account: {required: "party_identifier harus diisi..!!"},
                _1114_mf50f_number: {required: "mf50f_number harus diisi..!!"},
                _1115_of50f_details: {required: "of50f_details harus diisi..!!"},
                _1116_of50f_number: {required: "of50f_number harus diisi..!!"},
                _1117_of50f_details: {required: "of50f_details harus diisi..!!"},
                _1118_of50f_number: {required: "of50f_number harus diisi..!!"},
                _1119_of50f_details: {required: "of50f_details harus diisi..!!"},
                _1120_of50f_number: {required: "of50f_number harus diisi..!!"},
                _1121_of50f_details: {required: "of50f_details harus diisi..!!"},
                _1423_of50f_account: {required: "party_identifier harus diisi..!!"},
                _1424_mf50f_number: {required: "mf50f_number harus diisi..!!"},
                _1425_of50f_details: {required: "of50f_details harus diisi..!!"},
                _1426_of50f_number: {required: "of50f_number harus diisi..!!"},
                _1427_of50f_details: {required: "of50f_details harus diisi..!!"},
                _1428_of50f_number: {required: "of50f_number harus diisi..!!"},
                _1429_of50f_details: {required: "of50f_details harus diisi..!!"},
                _1430_of50f_number: {required: "of50f_number harus diisi..!!"},
                _1431_of50f_details: {required: "of50f_details harus diisi..!!"},
                _1733_of50f_account: {required: "party_identifier harus diisi..!!"},
                _1734_mf50f_number: {required: "mf50f_number harus diisi..!!"},
                _1735_of50f_details: {required: "of50f_details harus diisi..!!"},
                _1736_of50f_number: {required: "of50f_number harus diisi..!!"},
                _1737_of50f_details: {required: "of50f_details harus diisi..!!"},
                _1738_of50f_number: {required: "of50f_number harus diisi..!!"},
                _1739_of50f_details: {required: "of50f_details harus diisi..!!"},
                _1740_of50f_number: {required: "of50f_number harus diisi..!!"},
                _1741_of50f_details: {required: "of50f_details harus diisi..!!"},
                _2043_of50f_account: {required: "party_identifier harus diisi..!!"},
                _2044_mf50f_number: {required: "mf50f_number harus diisi..!!"},
                _2045_of50f_details: {required: "of50f_details harus diisi..!!"},
                _2046_of50f_number: {required: "of50f_number harus diisi..!!"},
                _2047_of50f_details: {required: "of50f_details harus diisi..!!"},
                _2048_of50f_number: {required: "of50f_number harus diisi..!!"},
                _2049_of50f_details: {required: "of50f_details harus diisi..!!"},
                _2050_of50f_number: {required: "of50f_number harus diisi..!!"},
                _2051_of50f_details: {required: "of50f_details harus diisi..!!"},
                _2353_of50f_account: {required: "party_identifier harus diisi..!!"},
                _2354_mf50f_number: {required: "mf50f_number harus diisi..!!"},
                _2355_of50f_details: {required: "of50f_details harus diisi..!!"},
                _2356_of50f_number: {required: "of50f_number harus diisi..!!"},
                _2357_of50f_details: {required: "of50f_details harus diisi..!!"},
                _2358_of50f_number: {required: "of50f_number harus diisi..!!"},
                _2359_of50f_details: {required: "of50f_details harus diisi..!!"},
                _2360_of50f_number: {required: "of50f_number harus diisi..!!"},
                _2361_of50f_details: {required: "of50f_details harus diisi..!!"},
                _2663_of50f_account: {required: "party_identifier harus diisi..!!"},
                _2664_mf50f_number: {required: "mf50f_number harus diisi..!!"},
                _2665_of50f_details: {required: "of50f_details harus diisi..!!"},
                _2666_of50f_number: {required: "of50f_number harus diisi..!!"},
                _2667_of50f_details: {required: "of50f_details harus diisi..!!"},
                _2668_of50f_number: {required: "of50f_number harus diisi..!!"},
                _2669_of50f_details: {required: "of50f_details harus diisi..!!"},
                _2670_of50f_number: {required: "of50f_number harus diisi..!!"},
                _2671_of50f_details: {required: "of50f_details harus diisi..!!"},
                _2973_of50f_account: {required: "party_identifier harus diisi..!!"},
                _2974_mf50f_number: {required: "mf50f_number harus diisi..!!"},
                _2975_of50f_details: {required: "of50f_details harus diisi..!!"},
                _2976_of50f_number: {required: "of50f_number harus diisi..!!"},
                _2977_of50f_details: {required: "of50f_details harus diisi..!!"},
                _2978_of50f_number: {required: "of50f_number harus diisi..!!"},
                _2979_of50f_details: {required: "of50f_details harus diisi..!!"},
                _2980_of50f_number: {required: "of50f_number harus diisi..!!"},
                _2981_of50f_details: {required: "of50f_details harus diisi..!!"},
                */
                
                //of50k
                
                /*
                _193_of50k_name_address: {required: "name_address harus diisi..!!"},
                _503_of50k_name_address : {required: "name_address harus diisi..!!"},
                _813_of50k_name_address : {required: "name_address harus diisi..!!"},
                _1123_of50k_name_address : {required: "name_address harus diisi..!!"},
                _1433_of50k_name_address : {required: "name_address harus diisi..!!"},
                _1743_of50k_name_address : {required: "name_address harus diisi..!!"},
                _2053_of50k_name_address : {required: "name_address harus diisi..!!"},
                _2363_of50k_name_address : {required: "name_address harus diisi..!!"},
                _2673_of50k_name_address : {required: "name_address harus diisi..!!"},
                _2983_of50k_name_address : {required: "name_address harus diisi..!!"},
                */

                //of52a
                /*
                _291_of52a_Identifier_Code: {required: "Identifier_Code harus diisi..!!"},
                _601_of52a_Identifier_Code: {required: "Identifier_Code harus diisi..!!"},
                _911_of52a_Identifier_Code: {required: "Identifier_Code harus diisi..!!"},
                _1221_of52a_Identifier_Code: {required: "Identifier_Code harus diisi..!!"},
                _1531_of52a_Identifier_Code: {required: "Identifier_Code harus diisi..!!"},
                _1841_of52a_Identifier_Code: {required: "Identifier_Code harus diisi..!!"},
                _2151_of52a_Identifier_Code: {required: "Identifier_Code harus diisi..!!"},
                _2461_of52a_Identifier_Code: {required: "Identifier_Code harus diisi..!!"},
                _2771_of52a_Identifier_Code: {required: "Identifier_Code harus diisi..!!"},
                _3081_of52a_Identifier_Code: {required: "Identifier_Code harus diisi..!!"},
                */

                //of52d
                
                /*
                _295_of52d_Name_and_Address: {required: "Name_and_Address harus diisi..!!"},
                _605_of52d_Name_and_Address: {required: "Name_and_Address harus diisi..!!"},
                _915_of52d_Name_and_Address: {required: "Name_and_Address harus diisi..!!"},
                _1225_of52d_Name_and_Address: {required: "Name_and_Address harus diisi..!!"},
                _1535_of52d_Name_and_Address: {required: "Name_and_Address harus diisi..!!"},
                _1845_of52d_Name_and_Address: {required: "Name_and_Address harus diisi..!!"},
                _2155_of52d_Name_and_Address: {required: "Name_and_Address harus diisi..!!"},
                _2465_of52d_Name_and_Address: {required: "Name_and_Address harus diisi..!!"},
                _2775_of52d_Name_and_Address: {required: "Name_and_Address harus diisi..!!"},
                _3085_of52d_Name_and_Address: {required: "Name_and_Address harus diisi..!!"},
                */
        
                //mf59
                type_of59_59a_: {required: "type_mf59 harus diisi..!!"},
                _300_mf59_account: {required: "mf59a account harus diisi..!!"},
                _301_mf59_name_address: {required: "mf59a name address harus diisi..!!"},
                _302_mf59f_account: {required: "mf59a account harus diisi..!!"},
                _303_mf59f_number: {required: "mf59a number harus diisi..!!"},
                _304_mf59f_details: {required: "mf59a details harus diisi..!!"},
                _305_mf59f_number: {required: "mf59a number harus diisi..!!"},
                _306_mf59f_details: {required: "mf59a details harus diisi..!!"},
                _307_mf59f_number: {required: "mf59a number harus diisi..!!"},
                _308_mf59f_details: {required: "mf59a details harus diisi..!!"},
                _309_mf59f_number: {required: "mf59a number harus diisi..!!"},
                _310_mf59f_details: {required: "mf59a details harus diisi..!!"},
                /*
                type_of59_59a_: {required: "type_of59 harus diisi..!!"},
                type_of59_59a__2: {required: "type_of59 harus diisi..!!"},
                type_of59_59a__3: {required: "type_of59 harus diisi..!!"},
                type_of59_59a__4: {required: "type_of59 harus diisi..!!"},
                type_of59_59a__5: {required: "type_of59 harus diisi..!!"},
                type_of59_59a__6: {required: "type_of59 harus diisi..!!"},
                type_of59_59a__7: {required: "type_of59 harus diisi..!!"},
                type_of59_59a__8: {required: "type_of59 harus diisi..!!"},
                type_of59_59a__9: {required: "type_of59 harus diisi..!!"},
                type_of59_59a__10: {required: "type_of59 harus diisi..!!"},
                _301_mf59_name_address: {required: "name_address harus diisi..!!"},
                _611_mf59_name_address: {required: "name_address harus diisi..!!"},
                _921_mf59_name_address: {required: "name_address harus diisi..!!"},
                _1231_mf59_name_address: {required: "name_address harus diisi..!!"},
                _1541_mf59_name_address: {required: "name_address harus diisi..!!"},
                _1851_mf59_name_address: {required: "name_address harus diisi..!!"},
                _2161_mf59_name_address: {required: "name_address harus diisi..!!"},
                _2471_mf59_name_address: {required: "name_address harus diisi..!!"},
                _2781_mf59_name_address: {required: "name_address harus diisi..!!"},
                _3091_mf59_name_address: {required: "name_address harus diisi..!!"},
                */
                
                //mf59f
                /*
                _303_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _304_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _305_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _306_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _307_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _308_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _613_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _614_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _615_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _616_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _617_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _618_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _619_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _620_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _923_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _924_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _925_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _926_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _927_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _928_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _929_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _930_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _1233_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _1234_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _1235_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _1236_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _1237_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _1238_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _1239_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _1240_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _1543_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _1544_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _1545_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _1546_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _1547_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _1548_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _1549_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _1550_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _1853_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _1854_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _1855_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _1856_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _1857_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _1858_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _1859_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _1860_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _2163_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _2164_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _2165_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _2166_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _2167_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _2168_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _2169_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _2170_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _2473_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _2474_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _2475_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _2476_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _2477_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _2478_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _2479_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _2480_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _2783_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _2784_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _2785_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _2786_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _2787_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _2788_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _2789_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _2790_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _3093_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _3094_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _3095_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _3096_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _3097_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _3098_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                _3099_mf59f_number: {required: "mf59f_number harus diisi..!!"},
                _3100_mf59f_details: {required: "mf59f_details harus diisi..!!"},
                */
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
                //alert(error.html());
                $("#tab-validate").removeAttr("hidden");
            },
            showErrors: function (errorMap, errorList) {
                this.defaultShowErrors();
                
                $("#tab-validate").removeAttr("hidden");
                 
                $("#view1, #view2, #view3, #view4, #view5, #view6, #view7").css("display", "none");
                $("#view8").css("display", "block");
                $('#tab-view1').removeClass("selected").removeAttr('class');
                $('#tab-view2').removeClass("selected").removeAttr('class');
                $('#tab-view3').removeClass("selected").removeAttr('class');
                $('#tab-view4').removeClass("selected").removeAttr('class');
                $('#tab-view5').removeClass("selected").removeAttr('class');
                $('#tab-view6').removeClass("selected").removeAttr('class');
                $('#tab-view7').removeClass("selected").removeAttr('class');
                $('#tab-validate').addClass("selected");

                let errorContainer = document.getElementById("error-container");
                
                if (errorList.length === 0) {
                    errorContainer.innerHTML = ""; 
//                    return;
                } 
                
                let tableHTML = `<table border="0" style="width:100% !important; caption-side: bottom; font-size:8pt !important;border-collapse: collapse; border:1px gray solid;">
                                    <tr style="background:#d6d6d6;">
                                    <th>Type</th>
                                    <th>Location</th>
                                    <th>Node</th>
                                    <th>Message</th></tr>`;

                    
                errorList.forEach(errors => {
                    let inputID = errors.element.id || "";
                    let locationTab = errors.element.getAttribute("location") || "";
                    let inputType = errors.element.getAttribute("input_type") || "";

                    tableHTML += '<tr class="error__row" data-input-id="'+inputID+'" content-body="'+locationTab+'" onmouseover="this.style.background=\'#f6f6f6\'" onmouseout="this.style.backgroundColor=\'transparent\'" style="cursor:pointer;">';
                    tableHTML += '<td style="padding: 5px;">Error</td>';
                    tableHTML += '<td style="padding: 5px;">'+locationTab+'</td>';
                    tableHTML += '<td style="padding: 5px;">'+inputType+'</td>';
                    tableHTML += '<td style="padding: 5px;">'+errors.message+'</td></tr>';
                });

                tableHTML += `</table>`;
                errorContainer.innerHTML = tableHTML; 
                
                document.querySelectorAll(".error__row").forEach(row => {
                    row.addEventListener("click", function () {
                        let targetRow = event.target.closest(".error__row"); 
                        let inputId = this.getAttribute("data-input-id");
                        let tabContentGroup = this.getAttribute("content-body");
                        
                    if (targetRow) {
                        let input = document.getElementById(inputId);
                        if (input) {
                            if(tabContentGroup == "Header") {
                                $("#view2, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                $("#view1").css("display", "block");
                                $('#tab-view1').addClass("selected");
                                $('#tab-view2').removeClass("selected").removeAttr('class');
                                $('#tab-view3').removeClass("selected").removeAttr('class');
                                $('#tab-view4').removeClass("selected").removeAttr('class');
                                $('#tab-view5').removeClass("selected").removeAttr('class');
                                $('#tab-view6').removeClass("selected").removeAttr('class');
                                $('#tab-view7').removeClass("selected").removeAttr('class');
                                $('#tab-validate').removeClass("selected").removeAttr('class');
                            } 
                            else if (tabContentGroup == "Body") {
                                 $("#view1, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                $('#tab-view1').removeClass("selected").removeAttr('class');
                                $('#tab-view2').addClass("selected");
                                $('#tab-view3').removeClass("selected").removeAttr('class');
                                $('#tab-view4').removeClass("selected").removeAttr('class');
                                $('#tab-view5').removeClass("selected").removeAttr('class');
                                $('#tab-view6').removeClass("selected").removeAttr('class');
                                $('#tab-view7').removeClass("selected").removeAttr('class');
                                $('#tab-validate').removeClass("selected").removeAttr('class');
                                $("#view2").css("display", "block");
                                
                            }
                            
                            input.focus();
                        } else {
                            console.log("nothing input element")
                        }
                    }
                    });
                });
            }
        });
        
        $("#btn-validate").click(function () {
            let isValid = $("#form1").valid(); 
            if (isValid) {
                alert("All inputs are valid!");
            } 
        });

        $("#submit_mt").click(function (e) {
            e.preventDefault();
            let isValid = $("#form1").valid(); 
            if (isValid) {  
                $("#form1").submit(); 
            } else {
                alert("There are still errors! Please fix them before saving.");
            }
        });
        
        $.validator.addMethod("regex", function(value, element, param) {
            //this.optional(element) lewati validasi jika kosong dan param.test(value) check regex
            return this.optional(element) || param.test(value); 
//            Jika tidak ada pesan khusus dalam messages tampilkan "Format tidak valid"
        }, "Format tidak valid");
        
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function () {
        console.log("MASUK RULE");
        //of53_a_b_d
        $("#div_of53a_").hide();
        $("#div_of53b_").hide();
        $("#div_of53d_").hide();
        $("#_120_of53a_party_identifier").attr("disabled", true);
        $("#_121_of53a_identifier_code").attr("disabled", true);
        $("#_123_of53b_party_identifier").attr("disabled", true);
        $("#_124_of53b_location").attr("disabled", true);
        $("#_125_of53d_party_identifier").attr("disabled", true);
        $("#_126_of53d_name_address").attr("disabled", true);
        $("#type_of53_").change(function () {
            if ($("#type_of53_").val() == "a") {
                $("#div_of53a_").show();
                $("#div_of53b_").hide();
                $("#div_of53d_").hide();
                $("#_120_of53a_party_identifier").attr("disabled", false);
                $("#_121_of53a_identifier_code").attr("disabled", false);
                $("#_123_of53b_party_identifier").attr("disabled", true);
                $("#_124_of53b_location").attr("disabled", true);
                $("#_125_of53d_party_identifier").attr("disabled", true);
                $("#_126_of53d_name_address").attr("disabled", true);
            } else if ($("#type_of53_").val() == "b") {
                $("#div_of53a_").hide();
                $("#div_of53b_").show();
                $("#div_of53d_").hide();
                $("#_120_of53a_party_identifier").attr("disabled", true);
                $("#_121_of53a_identifier_code").attr("disabled", true);
                $("#_123_of53b_party_identifier").attr("disabled", false);
                $("#_124_of53b_location").attr("disabled", false);
                $("#_125_of53d_party_identifier").attr("disabled", true);
                $("#_126_of53d_name_address").attr("disabled", true);
            } else if ($("#type_of53_").val() == "d") {
                $("#div_of53a_").hide();
                $("#div_of53b_").hide();
                $("#div_of53d_").show();
                $("#_120_of53a_party_identifier").attr("disabled", true);
                $("#_121_of53a_identifier_code").attr("disabled", true);
                $("#_123_of53b_party_identifier").attr("disabled", true);
                $("#_124_of53b_location").attr("disabled", true);
                $("#_125_of53d_party_identifier").attr("disabled", false);
                $("#_126_of53d_name_address").attr("disabled", false);
            } else {
                $("#div_of53a_").hide();
                $("#div_of53b_").hide();
                $("#div_of53d_").hide();
                $("#_120_of53a_party_identifier").attr("disabled", true);
                $("#_121_of53a_identifier_code").attr("disabled", true);
                $("#_123_of53b_party_identifier").attr("disabled", true);
                $("#_124_of53b_location").attr("disabled", true);
                $("#_125_of53d_party_identifier").attr("disabled", true);
                $("#_126_of53d_name_address").attr("disabled", true);
            }
        });

        //of54_a_b_d
        $("#div_of54a_").hide();
        $("#div_of54b_").hide();
        $("#div_of54d_").hide();
        $("#_130_of54a_party_identifier").attr("disabled", true);
        $("#_131_of54a_identifier_code").attr("disabled", true);
        $("#_133_of54b_party_identifier").attr("disabled", true);
        $("#_134_of54b_location").attr("disabled", true);
        $("#_135_of54d_party_identifier").attr("disabled", true);
        $("#_136_of54d_name_address").attr("disabled", true);
        $("#type_of54_").change(function () {
            if ($("#type_of54_").val() == "a") {
                $("#div_of54a_").show();
                $("#div_of54b_").hide();
                $("#div_of54d_").hide();
                $("#_130_of54a_party_identifier").attr("disabled", false);
                $("#_131_of54a_identifier_code").attr("disabled", false);
                $("#_133_of54b_party_identifier").attr("disabled", true);
                $("#_134_of54b_location").attr("disabled", true);
                $("#_135_of54d_party_identifier").attr("disabled", true);
                $("#_136_of54d_name_address").attr("disabled", true);
            } else if ($("#type_of54_").val() == "b") {
                $("#div_of54a_").hide();
                $("#div_of54b_").show();
                $("#div_of54d_").hide();
                $("#_130_of54a_party_identifier").attr("disabled", true);
                $("#_131_of54a_identifier_code").attr("disabled", true);
                $("#_133_of54b_party_identifier").attr("disabled", false);
                $("#_134_of54b_location").attr("disabled", false);
                $("#_135_of54d_party_identifier").attr("disabled", true);
                $("#_136_of54d_name_address").attr("disabled", true);
            } else if ($("#type_of54_").val() == "d") {
                $("#div_of54a_").hide();
                $("#div_of54b_").hide();
                $("#div_of54d_").show();
                $("#_130_of54a_party_identifier").attr("disabled", true);
                $("#_131_of54a_identifier_code").attr("disabled", true);
                $("#_133_of54b_party_identifier").attr("disabled", true);
                $("#_134_of54b_location").attr("disabled", true);
                $("#_135_of54d_party_identifier").attr("disabled", false);
                $("#_136_of54d_name_address").attr("disabled", false);
            } else {
                $("#div_of54a_").hide();
                $("#div_of54b_").hide();
                $("#div_of54d_").hide();
                $("#_130_of54a_party_identifier").attr("disabled", true);
                $("#_131_of54a_identifier_code").attr("disabled", true);
                $("#_133_of54b_party_identifier").attr("disabled", true);
                $("#_134_of54b_location").attr("disabled", true);
                $("#_135_of54d_party_identifier").attr("disabled", true);
                $("#_136_of54d_name_address").attr("disabled", true);
            }
        });
        //mf32//
        $("#div_mf32a").hide();
        $("#div_mf32b").hide();
        $("#div_mf32k").hide();
        $("#_170_mf32a_date").attr("disabled", true);
        $("#_171_mf32a_currency").attr("disabled", true);
        $("#_172_mf32a_amount").attr("disabled", true);
        $("#_173_mf32b_currency").attr("disabled", true);
        $("#_174_mf32b_amount").attr("disabled", true);
        $("#_036_mf32k_daysmonth").attr("disabled", true);
        $("#_037_mf32k_numberofdaysmonth").attr("disabled", true);
        $("#_038_mf32k_code").attr("disabled", true);
        $("#_039_mf32k_currency").attr("disabled", true);
        $("#_040_mf32k_amount").attr("disabled", true);

        $("#type_mf32_amount_collected").change(function () {
            if ($("#type_mf32_amount_collected").val() == "a") {
                $("#div_mf32a").show();
                $("#div_mf32b").hide();
                $("#_170_mf32a_date").attr("disabled", false);
                $("#_171_mf32a_currency").attr("disabled", false);
                $("#_172_mf32a_amount").attr("disabled", false);
                $("#_173_mf32b_currency").attr("disabled", true);
                $("#_174_mf32b_amount").attr("disabled", true);
            } else if ($("#type_mf32_amount_collected").val() == "b") {
                $("#div_mf32a").hide();
                $("#div_mf32b").show();
                $("#div_mf32k").hide();
                $("#_170_mf32a_date").attr("disabled", true);
                $("#_171_mf32a_currency").attr("disabled", true);
                $("#_172_mf32a_amount").attr("disabled", true);
                $("#_173_mf32b_currency").attr("disabled", false);
                $("#_174_mf32b_amount").attr("disabled", false);
            } else {
                $("#div_mf32a").hide();
                $("#div_mf32b").hide();
                $("#div_mf32k").hide();
                $("#_170_mf32a_date").attr("disabled", true);
                $("#_171_mf32a_currency").attr("disabled", true);
                $("#_172_mf32a_amount").attr("disabled", true);
                $("#_173_mf32b_currency").attr("disabled", true);
                $("#_174_mf32b_amount").attr("disabled", true);
            }
        });

        //mf50_a_f_k
        $("#div_of50a_").hide();
        $("#div_mf50f_").hide();
        $("#div_mf50f_2").hide();
        $("#div_mf50f_3").hide();
        $("#div_mf50f_4").hide();
        $("#div_mf50k_").hide();
        $("#_180_of50a_account").attr("disabled", true);
        $("#_181_of50a_identifier_code").attr("disabled", true);
        $("#_183_of50f_account").attr("disabled", true);
        $("#_184_mf50f_number").attr("disabled", true);
        $("#_185_of50f_details").attr("disabled", true);
        $("#_186_of50f_number").attr("disabled", true);
        $("#_187_of50f_details").attr("disabled", true);
        $("#_188_of50f_number").attr("disabled", true);
        $("#_189_of50f_details").attr("disabled", true);
        $("#_190_of50f_number").attr("disabled", true);
        $("#_191_of50f_details").attr("disabled", true);
        $("#check_mf50f_2").attr("disabled", true);
        $("#check_mf50f_3").attr("disabled", true);
        $("#check_mf50f_4").attr("disabled", true);
        $("#type_of50_payer").change(function () {
            if ($("#type_of50_payer").val() == "a") {
                $("#div_of50a_").show();
                $("#div_mf50f_").hide();
                $("#div_mf50f_2").hide();
                $("#div_mf50f_3").hide();
                $("#div_mf50f_4").hide();
                $("#div_mf50k_").hide();
                $("#_180_of50a_account").attr("disabled", false);
                $("#_181_of50a_identifier_code").attr("disabled", false);
                $("#_183_of50f_account").attr("disabled", true);
                $("#_184_mf50f_number").attr("disabled", true);
                $("#_185_of50f_details").attr("disabled", true);
                $("#check_mf50f_2").attr("disabled", true);
                $("#check_mf50f_3").attr("disabled", true);
                $("#check_mf50f_4").attr("disabled", true);
                $("#_192_of50k_account").attr("disabled", true);
                $("#_193_of50k_name_address").attr("disabled", true);
            } else if ($("#type_of50_payer").val() == "f") {
                $("#div_of50a_").hide();
                $("#div_mf50f_").show();
                $("#div_mf50f_2").show();
                $("#div_mf50f_3").show();
                $("#div_mf50f_4").show();
                $("#div_mf50k_").hide();
                $("#_180_of50a_account").attr("disabled", true);
                $("#_181_of50a_identifier_code").attr("disabled", true);
                $("#_183_of50f_account").attr("disabled", false);
                $("#_184_mf50f_number").attr("disabled", false);
                $("#_185_of50f_details").attr("disabled", false);
                $("#_186_of50f_number").attr("disabled", false);
                $("#_187_of50f_details").attr("disabled", false);
                $("#_188_of50f_number").attr("disabled", false);
                $("#_189_of50f_details").attr("disabled", false);
                $("#_190_of50f_number").attr("disabled", false);
                $("#_191_of50f_details").attr("disabled", false);
                $("#check_mf50f_2").attr("disabled", false);
                $("#check_mf50f_3").attr("disabled", false);
                $("#check_mf50f_4").attr("disabled", false);
                $("#_192_of50k_account").attr("disabled", true);
                $("#_193_of50k_name_address").attr("disabled", true);
            } else if ($("#type_of50_payer").val() == "k") {
                $("#div_of50a_").hide();
                $("#div_mf50f_").hide();
                $("#div_mf50f_2").hide();
                $("#div_mf50f_3").hide();
                $("#div_mf50f_4").hide();
                $("#div_mf50k_").show();
                $("#_180_of50a_account").attr("disabled", true);
                $("#_181_of50a_identifier_code").attr("disabled", true);
                $("#_183_of50f_account").attr("disabled", true);
                $("#_184_mf50f_number").attr("disabled", true);
                $("#_185_of50f_details").attr("disabled", true);
                $("#_186_of50f_number").attr("disabled", true);
                $("#_187_of50f_details").attr("disabled", true);
                $("#_188_of50f_number").attr("disabled", true);
                $("#_189_of50f_details").attr("disabled", true);
                $("#_190_of50f_number").attr("disabled", true);
                $("#_191_of50f_details").attr("disabled", true);
                $("#check_mf50f_2").attr("disabled", true);
                $("#check_mf50f_3").attr("disabled", true);
                $("#check_mf50f_4").attr("disabled", true);
                $("#_192_of50k_account").attr("disabled", false);
                $("#_193_of50k_name_address").attr("disabled", false);
            } else {
                $("#div_of50a_").hide();
                $("#div_mf50f_").hide();
                $("#div_mf50f_2").hide();
                $("#div_mf50f_3").hide();
                $("#div_mf50f_4").hide();
                $("#div_mf50k_").hide();
                $("#_180_of50a_account").attr("disabled", true);
                $("#_181_of50a_identifier_code").attr("disabled", true);
                $("#_183_of50f_account").attr("disabled", true);
                $("#_184_mf50f_number").attr("disabled", true);
                $("#_185_of50f_details").attr("disabled", true);
                $("#_186_of50f_number").attr("disabled", true);
                $("#_187_of50f_details").attr("disabled", true);
                $("#_188_of50f_number").attr("disabled", true);
                $("#_189_of50f_details").attr("disabled", true);
                $("#_190_of50f_number").attr("disabled", true);
                $("#_191_of50f_details").attr("disabled", true);
                $("#check_mf50f_2").attr("disabled", true);
                $("#check_mf50f_3").attr("disabled", true);
                $("#check_mf50f_4").attr("disabled", true);
                $("#_192_of50k_account").attr("disabled", true);
                $("#_193_of50k_name_address").attr("disabled", true);
            }
        });

        //of50f
        $("#check_mf50f_2").hide();
        $("#_186_of50f_number").prop("required", false);
        $("#_187_of50f_details").prop("required", false);
        $("#name_address_checkbox_2_50").click(function () {
            if ($("#name_address_checkbox_2_50").is(":checked")) {
                $("#check_mf50f_2").show();
                $("#_186_of50f_number").prop("required", true);
                $("#_187_of50f_details").prop("required", true);
            } else {
                $("#check_mf50f_2").hide();
                $("#_186_of50f_number").prop("required", false);
                $("#_187_of50f_details").prop("required", false);
            }
        });

        $("#check_mf50f_3").hide();
        $("#_188_of50f_number").prop("required", false);
        $("#_189_of50f_details").prop("required", false);
        $("#name_address_checkbox_3_50").click(function () {
            if ($("#name_address_checkbox_3_50").is(":checked")) {
                $("#check_mf50f_3").show();
                $("#_188_of50f_number").prop("required", true);
                $("#_189_of50f_details").prop("required", true);
            } else {
                $("#check_mf50f_3").hide();
                $("#_188_of50f_number").prop("required", false);
                $("#_189_of50f_details").prop("required", false);
            }
        });

        $("#check_mf50f_4").hide();
        $("#_190_of50f_number").prop("required", false);
        $("#_191_of50f_details").prop("required", false);
        $("#name_address_checkbox_4_50").click(function () {
            if ($("#name_address_checkbox_4_50").is(":checked")) {
                $("#check_mf50f_4").show();
                $("#_190_of50f_number").prop("required", true);
                $("#_191_of50f_details").prop("required", true);
            } else {
                $("#check_mf50f_4").hide();
                $("#_190_of50f_number").prop("required", false);
                $("#_191_of50f_details").prop("required", false);
            }
        });

        //of50f_2
        $("#div_of50a__2").hide();
        $("#div_mf50f__2").hide();
        $("#div_mf50f_2_2").hide();
        $("#div_mf50f_3_2").hide();
        $("#div_mf50f_4_2").hide();
        $("#div_mf50k__2").hide();
        $("#_490_of50a_account").attr("disabled", true);
        $("#_491_of50a_identifier_code").attr("disabled", true);
        $("#_493_of50f_account").attr("disabled", true);
        $("#_494_of50f_number").attr("disabled", true);
        $("#_495_of50f_details").attr("disabled", true);
        $("#check_mf50f_2_2").attr("disabled", true);
        $("#check_mf50f_3_2").attr("disabled", true);
        $("#check_mf50f_4_2").attr("disabled", true);
        $("#_502_of50k_account").attr("disabled", true);
        $("#_503_of50k_name_address").attr("disabled", true);
        $("#type_of50_payer_2").change(function () {
            if ($("#type_of50_payer_2").val() == "a") {
                console.log("MASUK A");
                $("#div_of50a__2").show();
                $("#div_mf50f__2").hide();
                $("#div_mf50f_2_2").hide();
                $("#div_mf50f_3_2").hide();
                $("#div_mf50f_4_2").hide();
                $("#div_mf50k__2").hide();
                $("#_490_of50a_account").attr("disabled", false);
                $("#_491_of50a_identifier_code").attr("disabled", false);
                $("#_493_of50f_account").attr("disabled", true);
                $("#_494_of50f_number").attr("disabled", true);
                $("#_495_of50f_details").attr("disabled", true);
                $("#_496_of50f_number").attr("disabled", true);
                $("#_497_of50f_details").attr("disabled", true);
                $("#_498_of50f_number").attr("disabled", true);
                $("#_499_of50f_details").attr("disabled", true);
                $("#_500_of50f_number").attr("disabled", true);
                $("#_501_of50f_details").attr("disabled", true)
                $("#check_mf50f_2_2").attr("disabled", true);
                $("#check_mf50f_3_2").attr("disabled", true);
                $("#check_mf50f_4_2").attr("disabled", true);
                $("#check_mf50f__2").attr("disabled", true);
                $("#_502_of50k_account").attr("disabled", true);
                $("#_503_of50k_name_address").attr("disabled", true);
            } else if ($("#type_of50_payer_2").val() == "f") {
                console.log("MASUK F");
                $("#div_of50a__2").hide();
                $("#div_mf50f__2").show();
                $("#div_mf50f_2_2").show();
                $("#div_mf50f_3_2").show();
                $("#div_mf50f_4_2").show();
                $("#div_mf50k__2").hide();
                $("#_490_of50a_account").attr("disabled", true);
                $("#_491_of50a_identifier_code").attr("disabled", true);
                $("#_493_of50f_account").attr("disabled", false);
                $("#_494_of50f_number").attr("disabled", false);
                $("#_495_of50f_details").attr("disabled", false);
                $("#_496_of50f_number").attr("disabled", false);
                $("#_497_of50f_details").attr("disabled", false);
                $("#_498_of50f_number").attr("disabled", false);
                $("#_499_of50f_details").attr("disabled", false);
                $("#_500_of50f_number").attr("disabled", false);
                $("#_501_of50f_details").attr("disabled", false);
                $("#check_mf50f_2_2").attr("disabled", false);
                $("#check_mf50f_3_2").attr("disabled", false);
                $("#check_mf50f_4_2").attr("disabled", false);
                $("#_502_of50k_account").attr("disabled", true);
                $("#_503_of50k_name_address").attr("disabled", true);
            } else if ($("#type_of50_payer_2").val() == "k") {
                console.log("MASUK K");
                $("#div_of50a__2").hide();
                $("#div_mf50f__2").hide();
                $("#div_mf50f_2_2").hide();
                $("#div_mf50f_3_2").hide();
                $("#div_mf50f_4_2").hide();
                $("#check_mf59f__4").hide();
                $("#div_mf50k__2").show();
                $("#_490_of50a_account").attr("disabled", true);
                $("#_491_of50a_identifier_code").attr("disabled", true);
                $("#_493_of50f_account").attr("disabled", true);
                $("#_494_of50f_number").attr("disabled", true);
                $("#_495_of50f_details").attr("disabled", true);
                $("#_496_of50f_number").attr("disabled", true);
                $("#_497_of50f_details").attr("disabled", true);
                $("#_498_of50f_number").attr("disabled", true);
                $("#_499_of50f_details").attr("disabled", true);
                $("#_500_of50f_number").attr("disabled", true);
                $("#_501_of50f_details").attr("disabled", true);
                $("#check_mf50f_2_2").attr("disabled", true);
                $("#check_mf50f_3_2").attr("disabled", true);
                $("#check_mf50f_4_2").attr("disabled", true);
                $("#_502_of50k_account").attr("disabled", false);
                $("#_503_of50k_name_address").attr("disabled", false);
            } else {
                $("#div_of50a__2").hide();
                $("#div_mf50f__2").hide();
                $("#div_mf50f_2_2").hide();
                $("#div_mf50f_3_2").hide();
                $("#div_mf50f_4_2").hide();
                $("#div_mf50k__2").hide();
                $("#_490_of50a_account").attr("disabled", true);
                $("#_491_of50a_identifier_code").attr("disabled", true);
                $("#_493_of50f_account").attr("disabled", true);
                $("#_494_of50f_number").attr("disabled", true);
                $("#_495_of50f_details").attr("disabled", true);
                $("#_496_of50f_number").attr("disabled", true);
                $("#_497_of50f_details").attr("disabled", true);
                $("#_498_of50f_number").attr("disabled", true);
                $("#_499_of50f_details").attr("disabled", true);
                $("#_500_of50f_number").attr("disabled", true);
                $("#_501_of50f_details").attr("disabled", true);
                $("#check_mf50f_2_2").attr("disabled", true);
                $("#check_mf50f_3_2").attr("disabled", true);
                $("#check_mf50f_4_2").attr("disabled", true);
                $("#_502_of50k_account").attr("disabled", true);
                $("#_503_of50k_name_address").attr("disabled", true);
            }
        });

        $("#check_mf50f_2_2").hide();
        $("#_496_of50f_number").prop("required", false);
        $("#_497_of50f_details").prop("required", false);
        $("#name_address_checkbox_2_50_2").click(function () {
            if ($("#name_address_checkbox_2_50_2").is(":checked")) {
                $("#check_mf50f__2").show();
                $("#_496_of50f_number").prop("required", true);
                $("#_497_of50f_details").prop("required", true);
            } else {
                $("#check_mf50f__2").hide();
                $("#_496_of50f_number").prop("required", false);
                $("#_497_of50f_details").prop("required", false);
            }
        });

        $("#check_mf50f_3_2").hide();
        $("#_498_of50f_number").prop("required", false);
        $("#_499_of50f_details").prop("required", false);
        $("#name_address_checkbox_3_50_2").click(function () {
            if ($("#name_address_checkbox_3_50_2").is(":checked")) {
                $("#check_mf50f_3_2").show();
                $("#_498_of50f_number").prop("required", true);
                $("#_499_of50f_details").prop("required", true);
            } else {
                $("#check_mf50f_3_2").hide();
                $("#_498_of50f_number").prop("required", false);
                $("#_499_of50f_details").prop("required", false);
            }
        });

        $("#check_mf50f_4_2").hide();
        $("#_500_of50f_number").prop("required", false);
        $("#_501_of50f_details").prop("required", false);
        $("#name_address_checkbox_4_50_2").click(function () {
            if ($("#name_address_checkbox_4_50_2").is(":checked")) {
                $("#check_mf50f_4_2").show();
                $("#_500_of50f_number").prop("required", true);
                $("#_501_of50f_details").prop("required", true);
            } else {
                $("#check_mf50f_4_2").hide();
                $("#_500_of50f_number").prop("required", false);
                $("#_501_of50f_details").prop("required", false);
            }
        });



        //OF52A
        $("#div_of52a_").hide();
        $("#div_of52b_").hide();
        $("#div_of52d_").hide();
        $("#_290_of52a_Party_Identifier").attr("disabled", true);
        $("#_291_of52a_Identifier_Code").attr("disabled", true);
        $("#_292_of52b_Party_Identifier").attr("disabled", true);
        $("#_293_of52b_Location").attr("disabled", true);
        $("#_294_of52d_Party_Identifier").attr("disabled", true);
        $("#_295_of52d_Name_and_Address").attr("disabled", true);
        $("#type_of52_Sender_of_Cash_Letter").change(function () {
            if ($("#type_of52_Sender_of_Cash_Letter").val() == "a") {
                $("#div_of52a_").show();
                $("#div_of52b_").hide();
                $("#div_of52d_").hide();
                $("#_290_of52a_Party_Identifier").attr("disabled", false);
                $("#_291_of52a_Identifier_Code").attr("disabled", false);
                $("#_292_of52b_Party_Identifier").attr("disabled", true);
                $("#_293_of52b_Location").attr("disabled", true);
                $("#_294_of52d_Party_Identifier").attr("disabled", true);
                $("#_295_of52d_Name_and_Address").attr("disabled", true);
            } else if ($("#type_of52_Sender_of_Cash_Letter").val() == "b") {
                $("#div_of52a_").hide();
                $("#div_of52b_").show();
                $("#div_of52d_").hide();
                $("#_290_of52a_Party_Identifier").attr("disabled", true);
                $("#_291_of52a_Identifier_Code").attr("disabled", true);
                $("#_292_of52b_Party_Identifier").attr("disabled", false);
                $("#_293_of52b_Location").attr("disabled", false);
                $("#_294_of52d_Party_Identifier").attr("disabled", true);
                $("#_295_of52d_Name_and_Address").attr("disabled", true);
            } else if ($("#type_of52_Sender_of_Cash_Letter").val() == "d") {
                $("#div_of52a_").hide();
                $("#div_of52b_").hide();
                $("#div_of52d_").show();
                $("#_290_of52a_Party_Identifier").attr("disabled", true);
                $("#_291_of52a_Identifier_Code").attr("disabled", true);
                $("#_292_of52b_Party_Identifier").attr("disabled", true);
                $("#_293_of52b_Location").attr("disabled", true);
                $("#_294_of52d_Party_Identifier").attr("disabled", false);
                $("#_295_of52d_Name_and_Address").attr("disabled", false);
            } else {
                $("#div_of52a_").hide();
                $("#div_of52b_").hide();
                $("#div_of52d_").hide();
                $("#_290_of52a_Party_Identifier").attr("disabled", true);
                $("#_291_of52a_Identifier_Code").attr("disabled", true);
                $("#_292_of52b_Party_Identifier").attr("disabled", true);
                $("#_293_of52b_Location").attr("disabled", true);
                $("#_294_of52d_Party_Identifier").attr("disabled", true);
                $("#_295_of52d_Name_and_Address").attr("disabled", true);
            }
        });

        //mf59
        $("#div_mf59_").hide();
        $("#div_mf59f_").hide();
        $("#div_mf59f_2").hide();
        $("#div_mf59f_3").hide();
        $("#div_mf59f_4").hide();
        $("#_300_mf59_account").attr("disabled", true);
        $("#_301_mf59_name_address").attr("disabled", true);
        $("#_302_mf59f_account").attr("disabled", true);
        $("#_303_mf59f_number").attr("disabled", true);
        $("#_304_mf59f_details").attr("disabled", true);
        $("#_305_mf59f_number").attr("disabled", true);
        $("#_306_mf59f_details").attr("disabled", true);
        $("#_307_mf59f_number").attr("disabled", true);
        $("#_308_mf59f_details").attr("disabled", true);
        $("#_309_mf59f_number").attr("disabled", true);
        $("#_310_mf59f_details").attr("disabled", true);
        $("#check_mf59f_2").attr("disabled", true);
        $("#check_mf59f_3").attr("disabled", true);
        $("#check_mf59f_4").attr("disabled", true);
        $("#type_of59_59a_").change(function () {
            if ($("#type_of59_59a_").val() == "59") {
                $("#div_mf59_").show();
                // $("#div_mf59a_").hide();
                $("#div_mf59f_").hide();
                $("#div_mf59f_2").hide();
                $("#div_mf59f_3").hide();
                $("#div_mf59f_4").hide();
                $("#_300_mf59_account").attr("disabled", false);
                $("#_301_mf59_name_address").attr("disabled", false);
                $("#_302_mf59f_account").attr("disabled", true);
                $("#_303_mf59f_number").attr("disabled", true);
                $("#_304_mf59f_details").attr("disabled", true);
                $("#_305_mf59f_number").attr("disabled", true);
                $("#_306_mf59f_details").attr("disabled", true);
                $("#_307_mf59f_number").attr("disabled", true);
                $("#_308_mf59f_details").attr("disabled", true);
                $("#_309_mf59f_number").attr("disabled", true);
                $("#_310_mf59f_details").attr("disabled", true);
                $("#check_mf59f_2").attr("disabled", true);
                $("#check_mf59f_3").attr("disabled", true);
                $("#check_mf59f_4").attr("disabled", true);
            } else if ($("#type_of59_59a_").val() == "59f") {
                $("#div_mf59_").hide();
                // $("#div_mf59a_").hide();
                $("#div_mf59f_").show();
                $("#div_mf59f_2").show();
                $("#div_mf59f_3").show();
                $("#div_mf59f_4").show();
                $("#_300_mf59_account").attr("disabled", true);
                $("#_301_mf59_name_address").attr("disabled", true);
                $("#_302_mf59f_account").attr("disabled", false);
                $("#_303_mf59f_number").attr("disabled", false);
                $("#_304_mf59f_details").attr("disabled", false);
                $("#_305_mf59f_number").attr("disabled", false);
                $("#_306_mf59f_details").attr("disabled", false);
                $("#_307_mf59f_number").attr("disabled", false);
                $("#_308_mf59f_details").attr("disabled", false);
                $("#_309_mf59f_number").attr("disabled", false);
                $("#_310_mf59f_details").attr("disabled", false);
                $("#check_mf59f_2").attr("disabled", false);
                $("#check_mf59f_3").attr("disabled", false);
                $("#check_mf59f_4").attr("disabled", false);
            } else {
                $("#div_mf59_").hide();
                //    $("#div_mf59a_").hide();
                $("#div_mf59f_").hide();
                $("#div_mf59f_2").hide();
                $("#div_mf59f_3").hide();
                $("#div_mf59f_4").hide();
                $("#check_mf59f_2").hide();
                $("#check_mf59f_3").hide();
                $("#check_mf59f_4").hide();
            }
        });


        //mf59f_2
        $("#check_mf59f_2").hide();
        $("#_305_mf59f_number").prop("required", false);
        $("#_306_mf59f_details").prop("required", false);
        $("#name_address_checkbox_2").click(function () {
            if ($("#name_address_checkbox_2").is(":checked")) {
                $("#check_mf59f_2").show();
                $("#_305_mf59f_number").prop("required", true);
                $("#_306_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f_2").hide();
                $("#_305_mf59f_number").prop("required", false);
                $("#_306_mf59f_details").prop("required", false);
            }
        });

        //mf59f_3
        $("#check_mf59f_3").hide();
        $("#_307_mf59f_number").prop("required", false);
        $("#_308_mf59f_details").prop("required", false);
        $("#name_address_checkbox_3").click(function () {
            if ($("#name_address_checkbox_3").is(":checked")) {
                $("#check_mf59f_3").show();
                $("#_307_mf59f_number").prop("required", true);
                $("#_308_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f_3").hide();
                $("#_307_mf59f_number").prop("required", false);
                $("#_308_mf59f_details").prop("required", false);
            }
        });

        //mf59f_4
        $("#check_mf59f_4").hide();
        $("#_309_mf59f_number").prop("required", false);
        $("#_310_mf59f_details").prop("required", false);
        $("#name_address_checkbox_4").click(function () {
            if ($("#name_address_checkbox_4").is(":checked")) {
                $("#check_mf59f_4").show();
                $("#_309_mf59f_number").prop("required", true);
                $("#_310_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f_4").hide();
                $("#_309_mf59f_number").prop("required", false);
                $("#_310_mf59f_details").prop("required", false);
            }
        });

        //mf59f_2
        $("#check_mf59f_2").hide();
        $("#_305_mf59f_number").prop("required", false);
        $("#_306_mf59f_details").prop("required", false);
        $("#name_address_checkbox_2").click(function () {
            if ($("#name_address_checkbox_2").is(":checked")) {
                $("#check_mf59f_2").show();
                $("#_305_mf59f_number").prop("required", true);
                $("#_306_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f_2").hide();
                $("#_305_mf59f_number").prop("required", false);
                $("#_306_mf59f_details").prop("required", false);
            }
        });

        //mf59f_3
        $("#check_mf59f_3").hide();
        $("#_307_mf59f_number").prop("required", false);
        $("#_308_mf59f_details").prop("required", false);
        $("#name_address_checkbox_3").click(function () {
            if ($("#name_address_checkbox_3").is(":checked")) {
                $("#check_mf59f_3").show();
                $("#_307_mf59f_number").prop("required", true);
                $("#_308_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f_3").hide();
                $("#_307_mf59f_number").prop("required", false);
                $("#_308_mf59f_details").prop("required", false);
            }
        });

        //mf59f_4
        $("#check_mf59f_4").hide();
        $("#_309_mf59f_number").prop("required", false);
        $("#_310_mf59f_details").prop("required", false);
        $("#name_address_checkbox_4").click(function () {
            if ($("#name_address_checkbox_4").is(":checked")) {
                $("#check_mf59f_4").show();
                $("#_309_mf59f_number").prop("required", true);
                $("#_310_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f_4").hide();
                $("#_309_mf59f_number").prop("required", false);
                $("#_310_mf59f_details").prop("required", false);
            }
        });
    });

</script>

<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        if ($("#special_rate").val() != "") {
            $("#special_rate_checkbox").prop("checked", true);
            $("#check_special_rate").show();
            $("#special_rate").prop("required", true);
        } else {
            $("#check_special_rate").hide();
            $("#special_rate").prop("required", false);
        }
        //of53_a_b_d
        console.log("MASUK VIEW RULE")
        if ($("#_120_of53a_party_identifier").val() != "" || $("#_121_of53a_identifier_code").val() != "") {
            console.log("#_121_of53a_identifier_code");
            $("#type_of53_").val("a").attr("selected", true);
            $("#div_of53a_").show();
            $("#div_of53b_").hide();
            $("#div_of53d_").hide();
            $("#_120_of53a_party_identifier").attr("disabled", false);
            $("#_121_of53a_identifier_code").attr("disabled", false);
            $("#_123_of53b_party_identifier").attr("disabled", true);
            $("#_124_of53b_location").attr("disabled", true);
            $("#_125_of53d_party_identifier").attr("disabled", true);
            $("#_126_of53d_name_address").attr("disabled", true);
        } else if ($("#_123_of53b_party_identifier").val() != "" || $("#_124_of53b_location").val() != "") {
            $("#type_of53_").val("b").attr("selected", true);
            $("#div_of53a_").hide();
            $("#div_of53b_").show();
            $("#div_of53d_").hide();
            $("#_120_of53a_party_identifier").attr("disabled", true);
            $("#_121_of53a_identifier_code").attr("disabled", true);
            $("#_123_of53b_party_identifier").attr("disabled", false);
            $("#_124_of53b_location").attr("disabled", false);
            $("#_125_of53d_party_identifier").attr("disabled", true);
            $("#_126_of53d_name_address").attr("disabled", true);
        } else if ($("#_125_of53d_party_identifier").val() != "" || $("#_126_of53d_name_address").val() != "") {
            $("#type_of53_").val("d").attr("selected", true);
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#div_of53d_").show();
            $("#_120_of53a_party_identifier").attr("disabled", true);
            $("#_121_of53a_identifier_code").attr("disabled", true);
            $("#_123_of53b_party_identifier").attr("disabled", true);
            $("#_124_of53b_location").attr("disabled", true);
            $("#_125_of53d_party_identifier").attr("disabled", false);
            $("#_126_of53d_name_address").attr("disabled", false);
        } else {
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#div_of53d_").hide();
            $("#_120_of53a_party_identifier").attr("disabled", true);
            $("#_121_of53a_identifier_code").attr("disabled", true);
            $("#_123_of53b_party_identifier").attr("disabled", true);
            $("#_124_of53b_location").attr("disabled", true);
            $("#_125_of53d_party_identifier").attr("disabled", true);
            $("#_126_of53d_name_address").attr("disabled", true);
        }


        //of54_a_b_d
        if ($("#_130_of54a_party_identifier").val() != "" || $("#_131_of54a_identifier_code").val() != "") {
            $("#type_of54_").val("a").attr("selected", true);
            $("#div_of54a_").show();
            $("#div_of54b_").hide();
            $("#div_of54d_").hide();
            $("#_130_of54a_party_identifier").attr("disabled", false);
            $("#_131_of54a_identifier_code").attr("disabled", false);
            $("#_133_of54b_party_identifier").attr("disabled", true);
            $("#_134_of54b_location").attr("disabled", true);
            $("#_135_of54d_party_identifier").attr("disabled", true);
            $("#_136_of54d_name_address").attr("disabled", true);
        } else if ($("#_133_of54b_party_identifier").val() != "" || $("#_134_of54b_location").val() != "") {
            $("#type_of54_").val("b").attr("selected", true);
            $("#div_of54a_").hide();
            $("#div_of54b_").show();
            $("#div_of54d_").hide();
            $("#_130_of54a_party_identifier").attr("disabled", true);
            $("#_131_of54a_identifier_code").attr("disabled", true);
            $("#_133_of54b_party_identifier").attr("disabled", false);
            $("#_134_of54b_location").attr("disabled", false);
            $("#_135_of54d_party_identifier").attr("disabled", true);
            $("#_136_of54d_name_address").attr("disabled", true);
        } else if ($("#_135_of54d_party_identifier").val() != "" || $("#_136_of54d_name_address").val() != "") {
            $("#type_of54_").val("d").attr("selected", true);
            $("#div_of54a_").hide();
            $("#div_of54b_").hide();
            $("#div_of54d_").show();
            $("#_130_of54a_party_identifier").attr("disabled", true);
            $("#_131_of54a_identifier_code").attr("disabled", true);
            $("#_133_of54b_party_identifier").attr("disabled", true);
            $("#_134_of54b_location").attr("disabled", true);
            $("#_135_of54d_party_identifier").attr("disabled", false);
            $("#_136_of54d_name_address").attr("disabled", false);
        } else {
            $("#div_of54a_").hide();
            $("#div_of54b_").hide();
            $("#div_of54d_").hide();
            $("#_130_of54a_party_identifier").attr("disabled", true);
            $("#_131_of54a_identifier_code").attr("disabled", true);
            $("#_133_of54b_party_identifier").attr("disabled", true);
            $("#_134_of54b_location").attr("disabled", true);
            $("#_135_of54d_party_identifier").attr("disabled", true);
            $("#_136_of54d_name_address").attr("disabled", true);
        }

        //mf32 a b 
        if ($("#_170_mf32a_date").val() != "" || $("#_171_mf32a_currency").val() != "" || $("#_172_mf32a_amount").val() != "") {
            $("#type_mf32_amount_collected").val("a").attr("selected", true);
            $("#div_mf32a").show();
            $("#div_mf32b").hide();
            $("#_170_mf32a_date").attr("disabled", false);
            $("#_171_mf32a_currency").attr("disabled", false);
            $("#_172_mf32a_amount").attr("disabled", false);
            $("#_173_mf32b_currency").attr("disabled", true);
            $("#_174_mf32b_amount").attr("disabled", true);
        } else if ($("#_173_mf32b_currency").val() != "" || $("#_174_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected").val("b").attr("selected", true);
            $("#div_mf32a").hide();
            $("#div_mf32b").show();
            $("#_170_mf32a_date").attr("disabled", true);
            $("#_171_mf32a_currency").attr("disabled", true);
            $("#_172_mf32a_amount").attr("disabled", true);
            $("#_173_mf32b_currency").attr("disabled", false);
            $("#_174_mf32b_amount").attr("disabled", false);
        } else {
            $("#div_mf32a").hide();
            $("#div_mf32b").hide();
            $("#_170_mf32a_date").attr("disabled", true);
            $("#_171_mf32a_currency").attr("disabled", true);
            $("#_172_mf32a_amount").attr("disabled", true);
            $("#_173_mf32b_currency").attr("disabled", true);
            $("#_174_mf32b_amount").attr("disabled", true);
        }

        //of52A
        if ($("#_290_of52a_Party_Identifier").val() != "" || $("#_291_of52a_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter").val("a").attr("selected", true);
            $("#div_of52a_").show();
            $("#div_of52b_").hide();
            $("#div_of52d_").hide();
            $("#_290_of52a_Party_Identifier").attr("disabled", false);
            $("#_291_of52a_Identifier_Code").attr("disabled", false);
            $("#_292_of52b_Party_Identifier").attr("disabled", true);
            $("#_293_of52b_Location").attr("disabled", true);
            $("#_294_of52d_Party_Identifier").attr("disabled", true);
            $("#_295_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_292_of52b_Party_Identifier").val() != "" || $("#_293_of52b_Location").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter").val("b").attr("selected", true);
            $("#div_of52a_").hide();
            $("#div_of52b_").show();
            $("#div_of52d_").hide();
            $("#_290_of52a_Party_Identifier").attr("disabled", true);
            $("#_291_of52a_Identifier_Code").attr("disabled", true);
            $("#_292_of52b_Party_Identifier").attr("disabled", false);
            $("#_293_of52b_Location").attr("disabled", false);
            $("#_294_of52d_Party_Identifier").attr("disabled", true);
            $("#_295_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_294_of52d_Party_Identifier").val() != "" || $("#_295_of52d_Name_and_Address").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter").val("d").attr("selected", true);
            $("#div_of52a_").hide();
            $("#div_of52b_").hide();
            $("#div_of52d_").show();
            $("#_290_of52a_Party_Identifier").attr("disabled", true);
            $("#_291_of52a_Identifier_Code").attr("disabled", true);
            $("#_292_of52b_Party_Identifier").attr("disabled", true);
            $("#_293_of52b_Location").attr("disabled", true);
            $("#_294_of52d_Party_Identifier").attr("disabled", false);
            $("#_295_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#div_of52a_").hide();
            $("#div_of52b_").hide();
            $("#div_of52d_").hide();
            $("#_290_of52a_Party_Identifier").attr("disabled", true);
            $("#_291_of52a_Identifier_Code").attr("disabled", true);
            $("#_292_of52b_Party_Identifier").attr("disabled", true);
            $("#_293_of52b_Location").attr("disabled", true);
            $("#_294_of52d_Party_Identifier").attr("disabled", true);
            $("#_295_of52d_Name_and_Address").attr("disabled", true);
        }
        //mf59
        if ($("#_300_mf59_account").val() != "" || $("#_301_mf59_name_address").val() != "") {
            $("#type_of59_59a_").val("59").attr("selected", true);
            $("#div_mf59_").show();
            //  $("#div_mf59a_").hide();
            $("#div_mf59f_").hide();
            $("#div_mf59f_2").hide();
            $("#div_mf59f_3").hide();
            $("#div_mf59f_4").hide();
            $("#_300_mf59_account").attr("disabled", false);
            $("#_301_mf59_name_address").attr("disabled", false);
            $("#_302_mf59f_account").attr("disabled", true);
            $("#_303_mf59f_number").attr("disabled", true);
            $("#_304_mf59f_details").attr("disabled", true);
            $("#check_mf59f_2").attr("disabled", true);
            $("#check_mf59f_3").attr("disabled", true);
            $("#check_mf59f_4").attr("disabled", true);
        } else if ($("#_302_mf59f_account").val() != "" || $("#_303_mf59f_number").val() != "" || $("#_304_mf59f_details").val() != "") {
            $("#type_of59_59a_").val("59f").attr("selected", true);
            $("#div_mf59_").hide();
            //$("#div_mf59a_").hide();
            $("#div_mf59f_").show();
            $("#div_mf59f_2").show();
            $("#div_mf59f_3").show();
            $("#div_mf59f_4").show();
            $("#_300_mf59_account").attr("disabled", true);
            $("#_301_mf59_name_address").attr("disabled", true);
            $("#_302_mf59f_account").attr("disabled", false);
            $("#_303_mf59f_number").attr("disabled", false);
            $("#_304_mf59f_details").attr("disabled", false);
            $("#check_mf59f_2").attr("disabled", false);
            $("#check_mf59f_3").attr("disabled", false);
            $("#check_mf59f_4").attr("disabled", false);
        } else {
            $("#div_mf59_").hide();
            // $("#div_mf59a_").hide();
            $("#div_mf59f_").hide();
            $("#div_mf59f_2").hide();
            $("#div_mf59f_3").hide();
            $("#div_mf59f_4").hide();
            $("#check_mf59f_2").hide();
            $("#check_mf59f_3").hide();
            $("#check_mf59f_4").hide();
        }

    });
    
    function validate_rule() {
        //mf32_2
        if ($("#_480_mf32a_date").val() != "" || $("#_481_mf32a_currency").val() != "" || $("#_482_mf32a_amount").val() != "") {
            $("#type_mf32_amount_collected_2").val("a").attr("selected", true);
            $("#div_mf32a_2").show();
            $("#div_mf32b_2").hide();
            $("#_480_mf32a_date").attr("disabled", false);
            $("#_481_mf32a_currency").attr("disabled", false);
            $("#_482_mf32a_amount").attr("disabled", false);
            $("#_483_mf32b_currency").attr("disabled", true);
            $("#_484_mf32b_amount").attr("disabled", true);
        } else if ($("#_483_mf32b_currency").val() != "" || $("#_484_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected_2").val("b").attr("selected", true);
            $("#div_mf32a_2").hide();
            $("#div_mf32b_2").show();
            $("#_480_mf32a_date").attr("disabled", true);
            $("#_481_mf32a_currency").attr("disabled", true);
            $("#_482_mf32a_amount").attr("disabled", true);
            $("#_483_mf32b_currency").attr("disabled", false);
            $("#_484_mf32b_amount").attr("disabled", false);
        } else {
            $("#type_mf32_amount_collected_2").val("").attr("selected", true);
            $("#div_mf32a_2").hide();
            $("#div_mf32b_2").hide();
        }

                //mf59_2
        if ($("#_305_mf59f_number").val() != "" || $("#_306_mf59f_details").val() != "") {
            $("#name_address_checkbox_2").prop("checked", true);
            $("#check_mf59f_2").show();
            $("#_305_mf59f_number").prop("required", true);
            $("#_306_mf59f_details").prop("required", true);
        } else {
            $("#check_mf59f_2").hide();
            $("#_305_mf59f_number").prop("required", false);
            $("#_306_mf59f_details").prop("required", false);
        }

        //mf59_3
        if ($("#_307_mf59f_number").val() != "" || $("#_308_mf59f_details").val() != "") {
            $("#name_address_checkbox_3").prop("checked", true);
            $("#check_mf59f_3").show();
            $("#_307_mf59f_number").prop("required", true);
            $("#_308_mf59f_details").prop("required", true);
        } else {
            $("#check_mf59f_3").hide();
            $("#_307_mf59f_number").prop("required", false);
            $("#_308_mf59f_details").prop("required", false);
        }

        //mf59_4
        if ($("#_309_mf59f_number").val() != "" || $("#_310_mf59f_details").val() != "") {
            $("#name_address_checkbox_4").prop("checked", true);
            $("#check_mf59f_4").show();
            $("#_309_mf59f_number").prop("required", true);
            $("#_310_mf59f_details").prop("required", true);
        } else {
            $("#check_mf59f_4").hide();
            $("#_309_mf59f_number").prop("required", false);
            $("#_310_mf59f_details").prop("required", false);
        }

         //MF50 script 2
        if ($("#_180_of50a_account").val() != "" || $("#_181_of50a_identifier_code").val() != "" || $("#_182_of50a_address").val() != "") {
            $("#type_of50_payer").val("a").attr("selected", true);
            $("#div_of50a_").show();
            $("#div_mf50f_").hide();
            $("#div_mf50f_2").hide();
            $("#div_mf50f_3").hide();
            $("#div_mf50f_4").hide();
            $("#div_mf50k_").hide();
            $("#_180_of50a_account").attr("disabled", false);
            $("#_181_of50a_identifier_code").attr("disabled", false);
            $("#_182_of50a_address").attr("disabled", true);
            $("#_183_of50f_account").attr("disabled", true);
            $("#_184_mf50f_number").attr("disabled", true);
            $("#_185_of50f_details").attr("disabled", true);
            $("#_186_of50f_number").attr("disabled", true);
            $("#_188_of50f_number").attr("disabled", true);
            $("#check_mf50f_2").attr("disabled", true);
            $("#check_mf50f_3").attr("disabled", true);
            $("#check_mf50f_4").attr("disabled", true);
            $("#_192_of50k_account").attr("disabled", true);
            $("#_193_of50k_name_address").attr("disabled", true);
        } else if ($("#_183_of50f_account").val() != "" || $("#_184_mf50f_number").val() != "" || $("#_185_of50f_details").val() != "") {
            $("#type_of50_payer").val("f").attr("selected", true);
            $("#div_of50a_").hide();
            $("#div_mf50f_").show();
            $("#div_mf50f_2").show();
            $("#div_mf50f_3").show();
            $("#div_mf50f_4").show();
            $("#div_mf50k_").hide();
            $("#_180_of50a_account").attr("disabled", true);
            $("#_181_of50a_identifier_code").attr("disabled", true);
            $("#_183_of50f_account").attr("disabled", false);
            $("#_184_mf50f_number").attr("disabled", false);
            $("#_185_of50f_details").attr("disabled", false);
            $("#check_mf50f_2").attr("disabled", false);
            $("#check_mf50f_3").attr("disabled", false);
            $("#check_mf50f_4").attr("disabled", false);
            $("#_192_of50k_account").attr("disabled", true);
            $("#_193_of50k_name_address").attr("disabled", true);
        } else if ($("#_192_of50k_account").val() != "" || $("#_193_of50k_name_address").val() != "") {
            $("#type_of50_payer").val("k").attr("selected", true);
            $("#div_of50a_").hide();
            $("#div_mf50f_").hide();
            $("#div_mf50f_2").hide();
            $("#div_mf50f_3").hide();
            $("#div_mf50f_4").hide();
            $("#div_mf50k_").show();
            $("#_180_of50a_account").attr("disabled", true);
            $("#_181_of50a_identifier_code").attr("disabled", true);
            $("#_183_of50f_account").attr("disabled", true);
            $("#_184_mf50f_number").attr("disabled", true);
            $("#_185_of50f_details").attr("disabled", true);
            $("#check_mf50f_2").attr("disabled", true);
            $("#check_mf50f_3").attr("disabled", true);
            $("#check_mf50f_4").attr("disabled", true);
            $("#_192_of50k_account").attr("disabled", false);
            $("#_193_of50k_name_address").attr("disabled", false);
        } else {
            $("#div_of50a_").hide();
            $("#div_mf50f_").hide();
            $("#div_mf50f_2").hide();
            $("#div_mf50f_3").hide();
            $("#div_mf50f_4").hide();
            $("#div_mf50k_").hide();
            $("#check_mf50f_2").hide();
            $("#check_mf50f_3").hide();
            $("#check_mf50f_4").hide();
        }

        //mf50f_2
        if ($("#_186_of50f_number").val() != "" || $("#_187_of50f_details").val() != "") {
            $("#name_address_checkbox_2_50").prop("checked", true);
            $("#check_mf50f_2").show();
            $("#_186_of50f_number").prop("required", true);
            $("#_187_of50f_details").prop("required", true);
        } else {
            $("#name_address_checkbox_2_50").prop("checked", false);
            $("#check_mf50f_2").hide();
            $("#_186_of50f_number").prop("required", false);
            $("#_187_of50f_details").prop("required", false);
        }

        //mf50f_3
        if ($("#_188_of50f_number").val() != "" || $("#_189_of50f_details").val() != "") {
            $("#name_address_checkbox_3_50").prop("checked", true);
            $("#check_mf50f_3").show();
            $("#_188_of50f_number").prop("required", true);
            $("#_189_of50f_details").prop("required", true);
        } else {
            $("#name_address_checkbox_3_50").prop("checked", false);
            $("#check_mf50f_3").hide();
            $("#_188_of50f_number").prop("required", false);
            $("#_189_of50f_details").prop("required", false);
        }

        //mf50f_4
        if ($("#_190_of50f_number").val() != "" || $("#_191_of50f_details").val() != "") {
            $("#name_address_checkbox_4_50").prop("checked", true);
            $("#check_mf50f_4").show();
            $("#_190_of50f_number").prop("required", true);
            $("#_191_of50f_details").prop("required", true);
        } else {
            $("#name_address_checkbox_4_50").prop("checked", false);
            $("#check_mf50f_4").hide();
            $("#_190_of50f_number").prop("required", false);
            $("#_191_of50f_details").prop("required", false);
        }


        //of50_2
        if ($("#_490_of50a_account").val() != "" || $("#_491_of50a_identifier_code").val() != "" || $("#_492_of50a_address").val() != "") {
            $("#type_of50_payer_2").val("a").attr("selected", true);
            $("#div_of50a__2").show();
            $("#div_mf50f__2").hide();
            $("#div_mf50f_2_2").hide();
            $("#div_mf50f_3_2").hide();
            $("#div_mf50f_4_2").hide();
            $("#div_mf50k__2").hide();
            $("#_490_of50a_account").attr("disabled", false);
            $("#_491_of50a_identifier_code").attr("disabled", false);
            $("#_492_of50a_address").attr("disabled", false);
            $("#_493_of50f_account").attr("disabled", true);
            $("#_494_mf50f_number").attr("disabled", true);
            $("#_495_of50f_details").attr("disabled", true);
            $("#_496_of50f_number").attr("disabled", true);
            $("#_497_of50f_details").attr("disabled", true);
            $("#_498_of50f_number").attr("disabled", true);
            $("#check_mf50f_2_2").attr("disabled", true);
            $("#check_mf50f_3_2").attr("disabled", true);
            $("#check_mf50f_4_2").attr("disabled", true);
        } else if ($("#_493_of50f_account").val() != "" || $("#_494_mf50f_number").val() != "" || $("#_495_of50f_details").val() != "") {
            $("#type_of50_payer_2").val("f").attr("selected", true);
            $("#div_of50a__2").hide();
            $("#div_mf50f__2").show();
            $("#div_mf50f_2_2").show();
            $("#div_mf50f_3_2").show();
            $("#div_mf50f_4_2").show();
            $("#div_mf50k__2").hide();
            $("#_490_of50a_account").attr("disabled", true);
            $("#_491_of50a_identifier_code").attr("disabled", true);
            $("#_492_of50a_address").attr("disabled", true);
            $("#_493_of50f_account").attr("disabled", false);
            $("#_494_mf50f_number").attr("disabled", false);
            $("#_495_of50f_details").attr("disabled", false);
        } else if ($("#_502_of50k_account").val() != "" || $("#_503_of50k_name_address").val() != "") {
            $("#type_of50_payer_2").val("k").attr("selected", true);
            $("#div_of50a__2").hide();
            $("#div_mf50f__2").hide();
            $("#div_mf50f_2_2").hide();
            $("#div_mf50f_3_2").hide();
            $("#div_mf50f_4_2").hide();
            $("#div_mf50k__2").show();
            //_502_of50k_account
            $("#_490_of50a_account").attr("disabled", true);
            $("#_491_of50a_identifier_code").attr("disabled", true);
            $("#_492_of50a_address").attr("disabled", true);
            $("#_493_of50f_account").attr("disabled", true);
            $("#_494_mf50f_number").attr("disabled", true);
            $("#_495_of50f_details").attr("disabled", true);
            $("#_502_of50k_account").attr("disabled", false);
            $("#_503_of50k_name_address").attr("disabled", false);

        } else {
            $("#div_of50a__2").hide();
            $("#div_mf50f__2").hide();
            $("#div_mf50f_2_2").hide();
            $("#div_mf50f_3_2").hide();
            $("#div_mf50f_4_2").hide();
            $("#div_mf50k__2").hide();
            $("#check_mf50f_2_2").hide();
            $("#check_mf50f_3_2").hide();
            $("#check_mf50f_4_2").hide();

        }

        //of50_2
        if ($("#_496_of50f_number").val() != "" || $("#_497_of50f_details").val() != "") {
            $("#name_address_checkbox_2_50_2").prop("checked", true);
            $("#check_mf50f_2_2").show();
            $("#_496_of50f_number").prop("required", true);
            $("#_497_of50f_details").prop("required", true);
        } else {
            $("#name_address_checkbox_2_50_2").prop("checked", false);
            $("#check_mf50f_2_2").hide();
            $("#_496_of50f_number").prop("required", false);
            $("#_497_of50f_details").prop("required", false);
        }

        //mf50_3
        if ($("#_498_of50f_number").val() != "" || $("#_499_of50f_details").val() != "") {
            $("#name_address_checkbox_3_50_2").prop("checked", true);
            $("#check_mf50f_3_2").show();
            $("#_498_of50f_number").prop("required", true);
            $("#_499_of50f_details").prop("required", true);
        } else {
            $("#name_address_checkbox_3_50_2").prop("checked", false);
            $("#check_mf50f_3_2").hide();
            $("#_498_of50f_number").prop("required", false);
            $("#_499_of50f_details").prop("required", false);
        }

        //mf50_4
        if ($("#_500_of50f_number").val() != "" || $("#_501_of50f_details").val() != "") {
            $("#name_address_checkbox_4_50_2").prop("checked", true);
            $("#check_mf50f_4_2").show();
            $("#_500_of50f_number").prop("required", true);
            $("#_501_of50f_details").prop("required", true);
        } else {
            $("#name_address_checkbox_4_50_2").prop("checked", false);
            $("#check_mf50f_4_2").hide();
            $("#_500_of50f_number").prop("required", false);
            $("#_501_of50f_details").prop("required", false);
        }

        //mf59_2
        $("#div_mf59f__2").hide();
        $("#div_mf59f_2_2").hide();
        $("#div_mf59f_3_2").hide();
        $("#div_mf59f_4_2").hide();
        $("#_610_mf59_account").attr("disabled", true);
        $("#_611_mf59_name_address").attr("disabled", true);
        $("#_612_mf59f_account").attr("disabled", true);
        $("#_613_mf59f_number").attr("disabled", true);
        $("#_614_mf59f_details").attr("disabled", true);
        $("#_615_mf59f_number").attr("disabled", true);
        $("#_616_mf59f_details").attr("disabled", true);
        $("#_617_mf59f_number").attr("disabled", true);
        $("#_618_mf59f_details").attr("disabled", true);
        $("#_619_mf59f_number").attr("disabled", true);
        $("#_620_mf59f_details").attr("disabled", true);
        $("#name_address_checkbox_2_2").attr("disabled", true);
        $("#name_address_checkbox_3_2").attr("disabled", true);
        $("#name_address_checkbox_4_2").attr("disabled", true);
        $("#type_of59_59a__2").change(function () {
            if ($("#type_of59_59a__2").val() == "59") {
                $("#div_mf59__2").show();
                $("#div_mf59f__2").hide();
                $("#div_mf59f_2_2").hide();
                $("#div_mf59f_3_2").hide();
                $("#div_mf59f_4_2").hide();
                $("#_610_mf59_account").attr("disabled", false);
                $("#_611_mf59_name_address").attr("disabled", false);
                $("#_612_mf59f_account").attr("disabled", true);
                $("#_613_mf59f_number").attr("disabled", true);
                $("#_614_mf59f_details").attr("disabled", true);
                $("#_615_mf59f_number").attr("disabled", true);
                $("#_616_mf59f_details").attr("disabled", true);
                $("#_617_mf59f_number").attr("disabled", true);
                $("#_618_mf59f_details").attr("disabled", true);
                $("#_619_mf59f_number").attr("disabled", true);
                $("#_620_mf59f_details").attr("disabled", true);
                $("#name_address_checkbox_2_2").attr("disabled", true);
                $("#name_address_checkbox_3_2").attr("disabled", true);
                $("#name_address_checkbox_4_2").attr("disabled", true);
            } else if ($("#type_of59_59a__2").val() == "59f") {
                $("#div_mf59__2").hide();
                $("#div_mf59f__2").show();
                $("#div_mf59f_2_2").show();
                $("#div_mf59f_3_2").show();
                $("#div_mf59f_4_2").show();
                $("#_610_mf59_account").attr("disabled", true);
                $("#_611_mf59_name_address").attr("disabled", true);
                $("#_610_mf59_account").prop("required", true);
                $("#_611_mf59_name_address").attr("required", false);
                $("#_612_mf59f_account").attr("disabled", false);
                $("#_613_mf59f_number").attr("disabled", false);
                $("#_614_mf59f_details").attr("disabled", false);
                $("#_615_mf59f_number").attr("disabled", false);
                $("#_616_mf59f_details").attr("disabled", false);
                $("#_617_mf59f_number").attr("disabled", false);
                $("#_618_mf59f_details").attr("disabled", false);
                $("#_619_mf59f_number").attr("disabled", false);
                $("#_620_mf59f_details").attr("disabled", false);
                $("#name_address_checkbox_2_2").attr("disabled", false);
                $("#name_address_checkbox_3_2").attr("disabled", false);
                $("#name_address_checkbox_4_2").attr("disabled", false);
                $("#_619_mf59f_number").prop("required", true);
                $("#_620_mf59f_details").prop("required", true);
            } else {
                $("#div_mf59__2").hide();
                $("#div_mf59f__2").hide();
                $("#div_mf59f_2_2").hide();
                $("#div_mf59f_3_2").hide();
                $("#div_mf59f_4_2").hide();
                $("#_610_mf59_account").attr("disabled", true);
                $("#_611_mf59_name_address").attr("disabled", true);
                $("#_612_mf59f_account").attr("disabled", true);
                $("#_613_mf59f_number").attr("disabled", true);
                $("#_614_mf59f_details").attr("disabled", true);
                $("#_615_mf59f_number").attr("disabled", true);
                $("#_616_mf59f_details").attr("disabled", true);
                $("#_617_mf59f_number").attr("disabled", true);
                $("#_618_mf59f_details").attr("disabled", true);
                $("#_619_mf59f_number").attr("disabled", true);
                $("#_620_mf59f_details").attr("disabled", true);
                $("#name_address_checkbox_2_2").attr("disabled", true);
                $("#name_address_checkbox_3_2").attr("disabled", true);
                $("#name_address_checkbox_4_2").attr("disabled", true);
            }
        });

        //mf59_2
        $("#check_mf59f__2").hide();
        $("#_615_mf59f_number").prop("required", false);
        $("#_616_mf59f_details").prop("required", false);
        $("#name_address_checkbox_2_2").click(function () {
            if ($("#name_address_checkbox_2_2").is(":checked")) {
                $("#check_mf59f__2").show();
                $("#_615_mf59f_number").prop("required", true);
                $("#_616_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f__2").hide();
                $("#_615_mf59f_number").prop("required", false);
                $("#_616_mf59f_details").prop("required", false);
            }
        });

        //mf59_3
        $("#check_mf59f_3_2").hide();
        $("#_617_mf59f_number").prop("required", false);
        $("#_618_mf59f_details").prop("required", false);
        $("#name_address_checkbox_3_2").click(function () {
            if ($("#name_address_checkbox_3_2").is(":checked")) {
                $("#check_mf59f_3_2").show();
                $("#_617_mf59f_number").prop("required", true);
                $("#_618_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f_3_2").hide();
                $("#_617_mf59f_number").prop("required", false);
                $("#_618_mf59f_details").prop("required", false);
            }
        });

        //mf59_4
        $("#check_mf59f_4_2").hide();
        $("#_619_mf59f_number").prop("required", false);
        $("#_620_mf59f_details").prop("required", false);
        $("#name_address_checkbox_4_2").click(function () {
            if ($("#name_address_checkbox_4_2").is(":checked")) {
                $("#check_mf59f_4_2").show();
                $("#_619_mf59f_number").prop("required", true);
                $("#_620_mf59f_details").prop("required", true);
            } else {
                $("#check_mf59f_4_2").hide();
                $("#_619_mf59f_number").prop("required", false);
                $("#_620_mf59f_details").prop("required", false);
            }
        });

            //of 52a/b/d
        if ($("#_600_of52a_Party_Identifier").val() != "" || $("#_601_of52a_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_2").val("a").attr("selected", true);
            $("#div_of52a__2").show();
            $("#div_of52b__2").hide();
            $("#div_of52d__2").hide();
            $("#_600_of52a_Party_Identifier").attr("disabled", false);
            $("#_601_of52a_Identifier_Code").attr("disabled", false);
            $("#_602_of52b_Party_Identifier").attr("disabled", true);
            $("#_603_of52b_Location").attr("disabled", true);
            $("#_604_of52d_Party_Identifier").attr("disabled", true);
            $("#_605_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_602_of52b_Party_Identifier").val() != "" || $("#_603_of52b_Location").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_2").val("b").attr("selected", true);
            $("#div_of52a__2").hide();
            $("#div_of52b__2").show();
            $("#div_of52d__2").hide();
            $("#_600_of52a_Party_Identifier").attr("disabled", true);
            $("#_601_of52a_Identifier_Code").attr("disabled", true);
            $("#_602_of52b_Party_Identifier").attr("disabled", false);
            $("#_603_of52b_Location").attr("disabled", false);
            $("#_604_of52d_Party_Identifier").attr("disabled", true);
            $("#_605_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_604_of52d_Party_Identifier").val() != "" || $("#_605_of52d_Name_and_Address").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_2").val("d").attr("selected", true);
            $("#div_of52a__2").hide();
            $("#div_of52b__2").hide();
            $("#div_of52d__2").show();
            $("#_600_of52a_Party_Identifier").attr("disabled", true);
            $("#_601_of52a_Identifier_Code").attr("disabled", true);
            $("#_602_of52b_Party_Identifier").attr("disabled", true);
            $("#_603_of52b_Location").attr("disabled", true);
            $("#_604_of52d_Party_Identifier").attr("disabled", false);
            $("#_605_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#type_of52_Sender_of_Cash_Letter_2").val("").attr("selected", true);
            $("#div_of52a__2").hide();
            $("#div_of52b__2").hide();
            $("#div_of52d__2").hide();
        }

        //mf59 /59f_2
        if ($("#_610_mf59_account").val() != "" || $("#_611_mf59_name_address").val() != "") {
            $("#type_of59_59a__2").val("59").attr("selected", true);
            $("#div_mf59__2").show();
            $("#div_mf59f__2").hide();
            $("#div_mf59f_2_2").hide();
            $("#div_mf59f_3_2").hide();
            $("#div_mf59f_4_2").hide();
            $("#_610_mf59_account").attr("disabled", false);
            $("#_611_mf59_name_address").attr("disabled", false);
            $("#_612_mf59f_account").attr("disabled", true);
            $("#_613_mf59f_number").attr("disabled", true);
            $("#_614_mf59f_details").attr("disabled", true);
            $("#check_mf59f_2_2").attr("disabled", true);
            $("#check_mf59f_3_2").attr("disabled", true);
            $("#check_mf59f_4_2").attr("disabled", true);
        } else if ($("#_612_mf59f_account").val() != "" || $("#_613_mf59f_number").val() != "" || $("#_614_mf59f_details").val() != "") {
            $("#type_of59_59a__2").val("59f").attr("selected", true);
            $("#div_mf59__2").hide();
            $("#div_mf59f__2").show();
            $("#div_mf59f_2_2").show();
            $("#div_mf59f_3_2").show();
            $("#div_mf59f_4_2").show();
            $("#_610_mf59_account").attr("disabled", true);
            $("#_611_mf59_name_address").attr("disabled", true);
            $("#_612_mf59f_account").attr("disabled", false);
            $("#_613_mf59f_number").attr("disabled", false);
            $("#_614_mf59f_details").attr("disabled", false);
            $("#check_mf59f_2_2").attr("disabled", false);
            $("#check_mf59f_3_2").attr("disabled", false);
            $("#check_mf59f_4_2").attr("disabled", false);
        } else {
            $("#div_mf59__2").hide();
            $("#div_mf59f__2").hide();
            $("#div_mf59f_2_2").hide();
            $("#div_mf59f_3_2").hide();
            $("#div_mf59f_4_2").hide();
            $("#_610_mf59_account").attr("disabled", true);
            $("#_611_mf59_name_address").attr("disabled", true);
            $("#_612_mf59f_account").attr("disabled", true);
            $("#_613_mf59f_number").attr("disabled", true);
            $("#_614_mf59f_details").attr("disabled", true);
            $("check_mf59f_2_2").attr("disabled", true);
            $("check_mf59f_3_2").attr("disabled", true);
            $("check_mf59f_4_2").attr("disabled", true);
        }

        //mf59f_2
        if ($("#_615_mf59f_number").val() != "" || $("#_616_mf59f_details").val() != "") {
            $("#name_address_checkbox_2_2").prop("checked", true);
            $("#check_mf59f_2_2").show();
            $("#_615_mf59f_number").attr("disabled", false);
            $("#_616_mf59f_details").attr("disabled", false);
        } else {
            $("#name_address_checkbox_2_2").prop("checked", false);
            $("#check_mf59f_2_2").hide();
            $("#_615_mf59f_number").attr("disabled", true);
            $("#_616_mf59f_details").attr("disabled", true);
        }

        //mf59f_3
        if ($("#_617_mf59f_number").val() != "" || $("#_618_mf59f_details").val() != "") {
            $("#name_address_checkbox_3_2").prop("checked", true);
            $("#check_mf59f_3_2").show();
            $("#_617_mf59f_number").attr("disabled", false);
            $("#_618_mf59f_details").attr("disabled", false);
        } else {
            $("#name_address_checkbox_3_2").prop("checked", false);
            $("#check_mf59f_3_2").hide();
            $("#_617_mf59f_number").attr("disabled", true);
            $("#_618_mf59f_details").attr("disabled", true);
        }
        //mf59f_4
        if ($("#_619_mf59f_number").val() != "" || $("#_620_mf59f_details").val() != "") {
            $("#name_address_checkbox_4_2").prop("checked", true);
            $("#check_mf59f_4_2").show();
            $("#_619_mf59f_number").attr("disabled", false);
            $("#_620_mf59f_details").attr("disabled", false);
        } else {
            $("#name_address_checkbox_4_2").prop("checked", false);
            $("#check_mf59f_4_2").hide();
            $("#_619_mf59f_number").attr("disabled", true);
            $("#_620_mf59f_details").attr("disabled", true);
        }

        //loop 3 
        if ($("#_790_mf32a_date").val() != "" || $("#_791_mf32a_currency").val() != "" || $("#_792_mf32a_amount").val() != "") {
            $("#type_mf32_amount_collected_3").val("a").attr("selected", true);
            $("#div_mf32a_3").show();
            $("#div_mf32b_3").hide();
            $("#_790_mf32a_date").attr("disabled", false);
            $("#_791_mf32a_currency").attr("disabled", false);
            $("#_792_mf32a_amount").attr("disabled", false);
            $("#_793_mf32b_currency").attr("disabled", true);
            $("#_794_mf32b_amount").attr("disabled", true);
        } else if ($("#_793_mf32b_currency").val() != "" || $("#_794_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected_3").val("b").attr("selected", true);
            $("#div_mf32a_3").hide();
            $("#div_mf32b_3").show();
            $("#_790_mf32a_date").attr("disabled", true);
            $("#_791_mf32a_currency").attr("disabled", true);
            $("#_792_mf32a_amount").attr("disabled", true);
            $("#_793_mf32b_currency").attr("disabled", false);
            $("#_794_mf32b_amount").attr("disabled", false);
        } else {
            $("#type_mf32_amount_collected_3").val("").attr("selected", true);
            $("#div_mf32a_3").hide();
            $("#div_mf32b_3").hide();
        }
        //of50_3
        if ($("#_800_of50a_account").val() != "" || $("#_801_of50a_identifier_code").val() != "" || $("#_802_of50a_address").val() != "") {
            $("#type_of50_payer_3").val("a").attr("selected", true);
            $("#div_of50a__3").show();
            $("#div_mf50f__3").hide();
            $("#div_mf50f_2_3").hide();
            $("#div_mf50f_3_3").hide();
            $("#div_mf50f_4_3").hide();
            $("#div_mf50k__3").hide();
            $("#_800_of50a_account").attr("disabled", false);
            $("#_801_of50a_identifier_code").attr("disabled", false);
            $("#_802_of50a_address").attr("disabled", false);
            $("#_803_of50f_account").attr("disabled", true);
            $("#_804_mf50f_number").attr("disabled", true);
            $("#_805_of50f_details").attr("disabled", true);
            $("#name_address_checkbox_2_50_3").attr("disabled", true);
            $("#name_address_checkbox_3_50_3").attr("disabled", true);
            $("#name_address_checkbox_4_50_3").attr("disabled", true);
        } else if ($("#_803_of50f_account").val() != "" || $("#_804_mf50f_number").val() != "" || $("#_805_of50f_details").val() != "") {
            $("#type_of50_payer_3").val("f").attr("selected", true);
            $("#div_of50a__3").hide();
            $("#div_mf50f__3").show();
            $("#div_mf50f_2_3").show();
            $("#div_mf50f_3_3").show();
            $("#div_mf50f_4_3").show();
            $("#div_mf50k__3").hide();
            $("#_800_of50a_account").attr("disabled", true);
            $("#_801_of50a_identifier_code").attr("disabled", true);
            $("#_802_of50a_address").attr("disabled", true);
            $("#_803_of50f_account").attr("disabled", false);
            $("#_804_mf50f_number").attr("disabled", false);
            $("#_805_of50f_details").attr("disabled", false);
            $("#name_address_checkbox_2_50_3").attr("disabled", false);
            $("#name_address_checkbox_3_50_3").attr("disabled", false);
            $("#name_address_checkbox_4_50_3").attr("disabled", false);
        } else if ($("#_812_of50k_account").val() != "" || $("#_813_of50k_name_address").val() != "") {
            $("#type_of50_payer_3").val("k").attr("selected", true);
            $("#div_of50a__3").hide();
            $("#div_mf50f__3").hide();
            $("#div_mf50f_2_3").hide();
            $("#div_mf50f_3_3").hide();
            $("#div_mf50f_4_3").hide();
            $("#div_mf50k__3").show();
            //_812_of50k_account
            $("#_800_of50a_account").attr("disabled", true);
            $("#_801_of50a_identifier_code").attr("disabled", true);
            $("#_802_of50a_address").attr("disabled", true);
            $("#_803_of50f_account").attr("disabled", true);
            $("#_804_mf50f_number").attr("disabled", true);
            $("#_805_of50f_details").attr("disabled", true);
            $("#_812_of50k_account").attr("disabled", false);
            $("#_813_of50k_name_address").attr("disabled", false);

        } else {
            $("#div_of50a__3").hide();
            $("#div_mf50f__3").hide();
            $("#div_mf50f_2_3").hide();
            $("#div_mf50f_3_3").hide();
            $("#div_mf50f_4_3").hide();
            $("#div_mf50k__3").hide();
            $("#name_address_checkbox_2_50_3").hide();
            $("#name_address_checkbox_3_50_3").hide();
            $("#name_address_checkbox_4_50_3").hide();

        }

        //of50_2_3
        if ($("#_806_of50f_number").val() != "" || $("#_807_of50f_details").val() != "") {
            $("#name_address_checkbox_2_50_3").prop("checked", true);
            $("#check_mf50f_2_3").show();
            $("#_806_of50f_number").prop("required", true);
            $("#_807_of50f_details").prop("required", true);
        } else {
            $("#name_address_checkbox_2_50_3").prop("checked", false);
            $("#check_mf50f_2_3").hide();
            $("#_806_of50f_number").prop("required", false);
            $("#_807_of50f_details").prop("required", false);
        }

        //mf50_3_3
        if ($("#_808_of50f_number").val() != "" || $("#_809_of50f_details").val() != "") {
            $("#name_address_checkbox_3_50_3").prop("checked", true);
            $("#check_mf50f_3_3").show();
            $("#_808_of50f_number").prop("required", true);
            $("#_809_of50f_details").prop("required", true);
        } else {
            $("#name_address_checkbox_3_50_3").prop("checked", false);
            $("#check_mf50f_3_3").hide();
            $("#_808_of50f_number").prop("required", false);
            $("#_809_of50f_details").prop("required", false);
        }

        //mf50_4_3
        if ($("#_810_of50f_number").val() != "" || $("#_811_of50f_details").val() != "") {
            $("#name_address_checkbox_4_50_3").prop("checked", true);
            $("#check_mf50f_4_3").show();
            $("#_810_of50f_number").prop("required", true);
            $("#_811_of50f_details").prop("required", true);
        } else {
            $("#name_address_checkbox_4_50_3").prop("checked", false);
            $("#check_mf50f_4_3").hide();
            $("#_810_of50f_number").prop("required", false);
            $("#_811_of50f_details").prop("required", false);
        }

        //of 52a/b/d_3
        if ($("#_910_of52a_Party_Identifier").val() != "" || $("#_911_of52a_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_3").val("a").attr("selected", true);
            $("#div_of52a__3").show();
            $("#div_of52b__3").hide();
            $("#div_of52d__3").hide();
            $("#_910_of52a_Party_Identifier").attr("disabled", false);
            $("#_911_of52a_Identifier_Code").attr("disabled", false);
            $("#_912_of52b_Party_Identifier").attr("disabled", true);
            $("#_913_of52b_Location").attr("disabled", true);
            $("#_914_of52d_Party_Identifier").attr("disabled", true);
            $("#_915_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_912_of52b_Party_Identifier").val() != "" || $("#_913_of52b_Location").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_3").val("b").attr("selected", true);
            $("#div_of52a__3").hide();
            $("#div_of52b__3").show();
            $("#div_of52d__3").hide();
            $("#_910_of52a_Party_Identifier").attr("disabled", true);
            $("#_911_of52a_Identifier_Code").attr("disabled", true);
            $("#_912_of52b_Party_Identifier").attr("disabled", false);
            $("#_913_of52b_Location").attr("disabled", false);
            $("#_914_of52d_Party_Identifier").attr("disabled", true);
            $("#_915_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_914_of52d_Party_Identifier").val() != "" || $("#_915_of52d_Name_and_Address").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_3").val("d").attr("selected", true);
            $("#div_of52a__3").hide();
            $("#div_of52b__3").hide();
            $("#div_of52d__3").show();
            $("#_910_of52a_Party_Identifier").attr("disabled", true);
            $("#_911_of52a_Identifier_Code").attr("disabled", true);
            $("#_912_of52b_Party_Identifier").attr("disabled", true);
            $("#_913_of52b_Location").attr("disabled", true);
            $("#_914_of52d_Party_Identifier").attr("disabled", false);
            $("#_915_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#div_of52a__3").hide();
            $("#div_of52b__3").hide();
            $("#div_of52d__3").hide();
        }

        //mf59 /59f_3
        if ($("#_920_mf59_account").val() != "" || $("#_921_mf59_name_address").val() != "") {
            $("#type_of59_59a__3").val("59").attr("selected", true);
            $("#div_mf59__3").show();
            $("#div_mf59f__3").hide();
            $("#div_mf59f_2_3").hide();
            $("#div_mf59f_3_3").hide();
            $("#div_mf59f_4_3").hide();
            $("#_920_mf59_account").attr("disabled", false);
            $("#_921_mf59_name_address").attr("disabled", false);
            $("#_922_mf59f_account").attr("disabled", true);
            $("#_923_mf59f_number").attr("disabled", true);
            $("#_924_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_3").attr("disabled", true);
            $("name_address_checkbox_3_3").attr("disabled", true);
            $("name_address_checkbox_4_3").attr("disabled", true);
        } else if ($("#_922_mf59f_account").val() != "" || $("#_923_mf59f_number").val() != "" || $("#_924_mf59f_details").val() != "") {
            $("#type_of59_59a__3").val("59f").attr("selected", true);
            $("#div_mf59__3").hide();
            $("#div_mf59f__3").show();
            $("#div_mf59f_2_3").show();
            $("#div_mf59f_3_3").show();
            $("#div_mf59f_4_3").show();
            $("#_920_mf59_account").attr("disabled", true);
            $("#_921_mf59_name_address").attr("disabled", true);
            $("#_922_mf59f_account").attr("disabled", false);
            $("#_923_mf59f_number").attr("disabled", false);
            $("#_924_mf59f_details").attr("disabled", false);
            $("name_address_checkbox_2_3").attr("disabled", false);
            $("name_address_checkbox_3_3").attr("disabled", false);
            $("name_address_checkbox_4_3").attr("disabled", false);
        } else {
            $("#div_mf59__3").hide();
            $("#div_mf59f__3").hide();
            $("#div_mf59f_2_3").hide();
            $("#div_mf59f_3_3").hide();
            $("#div_mf59f_4_3").hide();
            $("#_920_mf59_account").attr("disabled", true);
            $("#_921_mf59_name_address").attr("disabled", true);
            $("#_922_mf59f_account").attr("disabled", true);
            $("#_923_mf59f_number").attr("disabled", true);
            $("#_924_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_3").attr("disabled", true);
            $("name_address_checkbox_3_3").attr("disabled", true);
            $("name_address_checkbox_4_3").attr("disabled", true);
        }

        //mf59f_3_2
        if ($("#_925_mf59f_number").val() != "" || $("#_926_mf59f_details").val() != "") {
            $("#name_address_checkbox_2_3").prop("checked", true);
            $("#check_mf59f_2_3").show();
        } else {
            $("#name_address_checkbox_2_3").prop("checked", false);
            $("#check_mf59f_2_3").hide();
        }

        //mf59f_3_3
        if ($("#_927_mf59f_number").val() != "" || $("#_928_mf59f_details").val() != "") {
            $("#name_address_checkbox_3_3").prop("checked", true);
            $("#check_mf59f_3_3").show();
        } else {
            $("#name_address_checkbox_3_3").prop("checked", false);
            $("#check_mf59f_3_3").hide();
        }

        //mf59f_4_3
        if ($("#_929_mf59f_number").val() != "" || $("#_930_mf59f_details").val() != "") {
            $("#name_address_checkbox_4_3").prop("checked", true);
            $("#check_mf59f_4_3").show();
        } else {
            $("#name_address_checkbox_4_3").prop("checked", false);
            $("#check_mf59f_4_3").hide();
        }


        //mf32_4
        if ($("#_1100_mf32a_date").val() != "" || $("#_1101_mf32a_currency").val() != "" || $("#_1102_mf32a_amount").val() != "") {
            $("#type_mf32_amount_collected_4").val("a").attr("selected", true);
            $("#div_mf32a_4").show();
            $("#div_mf32b_4").hide();
            $("#_1100_mf32a_date").attr("disabled", false);
            $("#_1101_mf32a_currency").attr("disabled", false);
            $("#_1102_mf32a_amount").attr("disabled", false);
            $("#_1103_mf32b_currency").attr("disabled", true);
            $("#_1104_mf32b_amount").attr("disabled", true);
        } else if ($("#_1103_mf32b_currency").val() != "" || $("#_1104_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected_4").val("b").attr("selected", true);
            $("#div_mf32a_4").hide();
            $("#div_mf32b_4").show();
            $("#_1100_mf32a_date").attr("disabled", true);
            $("#_1101_mf32a_currency").attr("disabled", true);
            $("#_1102_mf32a_amount").attr("disabled", true);
            $("#_1103_mf32b_currency").attr("disabled", false);
            $("#_1104_mf32b_amount").attr("disabled", false);
        } else {
            $("#type_mf32_amount_collected_4").val("").attr("selected", true);
            $("#div_mf32a_4").hide();
            $("#div_mf32b_4").hide();
        }

        //of50_4
        if ($("#_1110_of50a_account").val() != "" || $("#_1111_of50a_identifier_code").val() != "" || $("#_1112_of50a_address").val() != "") {
            $("#type_of50_payer_4").val("a").attr("selected", true);
            $("#div_of50a__4").show();
            $("#div_mf50f__4").hide();
            $("#div_mf50f_2_4").hide();
            $("#div_mf50f_3_4").hide();
            $("#div_mf50f_4_4").hide();
            $("#div_mf50k__4").hide();
            $("#_1110_of50a_account").attr("disabled", false);
            $("#_1111_of50a_identifier_code").attr("disabled", false);
            $("#_1112_of50a_address").attr("disabled", false);
            $("#_1113_of50f_account").attr("disabled", true);
            $("#_1114_mf50f_number").attr("disabled", true);
            $("#_1115_of50f_details ").attr("disabled", true);
            $("#name_address_checkbox_2_50_4").attr("disabled", true);
            $("#name_address_checkbox_3_50_4").attr("disabled", true);
            $("#name_address_checkbox_4_50_4").attr("disabled", true);
        } else if ($("#_1113_of50f_account").val() != "" || $("#_1114_mf50f_number").val() != "" || $("#_1115_of50f_details").val() != "") {
            $("#type_of50_payer_4").val("f").attr("selected", true);
            $("#div_of50a__4").hide();
            $("#div_mf50f__4").show();
            $("#div_mf50f_2_4").show();
            $("#div_mf50f_3_4").show();
            $("#div_mf50f_4_4").show();
            $("#div_mf50k__4").hide();
            $("#_1110_of50a_account").attr("disabled", true);
            $("#_1111_of50a_identifier_code").attr("disabled", true);
            $("#_1112_of50a_address").attr("disabled", true);
            $("#_1113_of50f_account").attr("disabled", false);
            $("#_1114_mf50f_number").attr("disabled", false);
            $("#_1115_of50f_details ").attr("disabled", false);
            $("#name_address_checkbox_2_50_4").attr("disabled", false);
            $("#name_address_checkbox_3_50_4").attr("disabled", false);
            $("#name_address_checkbox_4_50_4").attr("disabled", false);
        } else if ($("#_1122_of50k_account").val() != "" || $("#_1123_of50k_name_address").val() != "") {
            $("#type_of50_payer_4").val("k").attr("selected", true);
            $("#div_of50a__4").hide();
            $("#div_mf50f__4").hide();
            $("#div_mf50f_2_4").hide();
            $("#div_mf50f_3_4").hide();
            $("#div_mf50f_4_4").hide();
            $("#div_mf50k__4").show();
            //_1122_of50k_account
            $("#_1110_of50a_account").attr("disabled", true);
            $("#_1111_of50a_identifier_code").attr("disabled", true);
            $("#_1112_of50a_address").attr("disabled", true);
            $("#_1113_of50f_account").attr("disabled", true);
            $("#_1114_mf50f_number").attr("disabled", true);
            $("#_1115_of50f_details ").attr("disabled", true);
            $("#_1122_of50k_account").attr("disabled", false);
            $("#_1123_of50k_name_address").attr("disabled", false);

        } else {
            $("#div_of50a__4").hide();
            $("#div_mf50f__4").hide();
            $("#div_mf50f_2_4").hide();
            $("#div_mf50f_3_4").hide();
            $("#div_mf50f_4_4").hide();
            $("#div_mf50k__4").hide();
            $("#name_address_checkbox_2_50_4").hide();
            $("#name_address_checkbox_3_50_4").hide();
            $("#name_address_checkbox_4_50_4").hide();

        }
        //of50_2_4
        if ($("#_1116_of50f_number").val() != "" || $("#_1117_of50f_details").val() != "") {
            $("#name_address_checkbox_2_50_4").prop("checked", true);
            $("#check_mf50f_2_4").show();
        } else {
            $("#name_address_checkbox_2_50_4").prop("checked", false);
            $("#check_mf50f_2_4").hide();
        }

        //mf50_3_4
        if ($("#_1118_of50f_number").val() != "" || $("#_1119_of50f_details").val() != "") {
            $("#name_address_checkbox_3_50_4").prop("checked", true);
            $("#check_mf50f_3_4").show();
        } else {
            $("#name_address_checkbox_3_50_4").prop("checked", false);
            $("#check_mf50f_3_4").hide();
        }

        //mf50_4_4
        if ($("#_1120_of50f_number").val() != "" || $("#_1121_of50f_details").val() != "") {
            $("#name_address_checkbox_4_50_4").prop("checked", true);
            $("#check_mf50f_4_4").show();
        } else {
            $("#name_address_checkbox_4_50_4").prop("checked", false);
            $("#check_mf50f_4_4").hide();
        }
        //of 52a/b/d_4
        if ($("#_1220_of52a_Party_Identifier").val() != "" || $("#_1221_of52a_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_4").val("a").attr("selected", true);
            $("#div_of52a__4").show();
            $("#div_of52b__4").hide();
            $("#div_of52d__4").hide();
            $("#_1220_of52a_Party_Identifier").attr("disabled", false);
            $("#_1221_of52a_Identifier_Code").attr("disabled", false);
            $("#_1222_of52b_Party_Identifier").attr("disabled", true);
            $("#_1223_of52b_Location").attr("disabled", true);
            $("#_1224_of52d_Party_Identifier").attr("disabled", true);
            $("#_1225_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_1222_of52b_Party_Identifier").val() != "" || $("#_1223_of52b_Location").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_4").val("b").attr("selected", true);
            $("#div_of52a__4").hide();
            $("#div_of52b__4").show();
            $("#div_of52d__4").hide();
            $("#_1220_of52a_Party_Identifier").attr("disabled", true);
            $("#_1221_of52a_Identifier_Code").attr("disabled", true);
            $("#_1222_of52b_Party_Identifier").attr("disabled", false);
            $("#_1223_of52b_Location").attr("disabled", false);
            $("#_1224_of52d_Party_Identifier").attr("disabled", true);
            $("#_1225_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_1224_of52d_Party_Identifier").val() != "" || $("#_1225_of52d_Name_and_Address").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_4").val("d").attr("selected", true);
            $("#div_of52a__4").hide();
            $("#div_of52b__4").hide();
            $("#div_of52d__4").show();
            $("#_1220_of52a_Party_Identifier").attr("disabled", true);
            $("#_1221_of52a_Identifier_Code").attr("disabled", true);
            $("#_1222_of52b_Party_Identifier").attr("disabled", true);
            $("#_1223_of52b_Location").attr("disabled", true);
            $("#_1224_of52d_Party_Identifier").attr("disabled", false);
            $("#_1225_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#type_of52_Sender_of_Cash_Letter_4").val("").attr("selected", true);
            $("#div_of52a__4").hide();
            $("#div_of52b__4").hide();
            $("#div_of52d__4").hide();
        }

        //mf59 /59f_4
        if ($("#_1230_mf59_account").val() != "" || $("#_1231_mf59_name_address").val() != "") {
            $("#type_of59_59a__4").val("59").attr("selected", true);
            $("#div_mf59__4").show();
            $("#div_mf59f__4").hide();
            $("#div_mf59f_2_4").hide();
            $("#div_mf59f_3_4").hide();
            $("#div_mf59f_4_4").hide();
            $("#_1230_mf59_account").attr("disabled", false);
            $("#_1231_mf59_name_address").attr("disabled", false);
            $("#_1232_mf59f_account").attr("disabled", true);
            $("#_1233_mf59f_number").attr("disabled", true);
            $("#_1234_mf59f_details").attr("disabled", true);
            $("#name_address_checkbox_2_4").attr("disabled", true);
            $("#name_address_checkbox_3_4").attr("disabled", true);
            $("#name_address_checkbox_4_4").attr("disabled", true);
        } else if ($("#_1232_mf59f_account").val() != "" || $("#_1233_mf59f_number").val() != "" || $("#_1234_mf59f_details").val() != "") {
            $("#type_of59_59a__4").val("59f").attr("selected", true);
            $("#div_mf59__4").hide();
            $("#div_mf59f__4").show();
            $("#div_mf59f_2_4").show();
            $("#div_mf59f_3_4").show();
            $("#div_mf59f_4_4").show();
            $("#_1230_mf59_account").attr("disabled", true);
            $("#_1231_mf59_name_address").attr("disabled", true);
            $("#_1232_mf59f_account").attr("disabled", false);
            $("#_1233_mf59f_number").attr("disabled", false);
            $("#_1234_mf59f_details").attr("disabled", false);
            $("#name_address_checkbox_2_4").attr("disabled", false);
            $("#name_address_checkbox_3_4").attr("disabled", false);
            $("#name_address_checkbox_4_4").attr("disabled", false);
        } else {
            $("#div_mf59__4").hide();
            $("#div_mf59f__4").hide();
            $("#div_mf59f_2_4").hide();
            $("#div_mf59f_3_4").hide();
            $("#div_mf59f_4_4").hide();
            $("#_1230_mf59_account").attr("disabled", true);
            $("#_1231_mf59_name_address").attr("disabled", true);
            $("#_1232_mf59f_account").attr("disabled", true);
            $("#_1233_mf59f_number").attr("disabled", true);
            $("#_1234_mf59f_details").attr("disabled", true);
            $("#name_address_checkbox_2_4").attr("disabled", true);
            $("#name_address_checkbox_3_4").attr("disabled", true);
            $("#name_address_checkbox_4_4").attr("disabled", true);
        }

        //mf59f_4_2
        if ($("#_1235_mf59f_number").val() != "" || $("#_1236_mf59f_details").val() != "") {
            $("#name_address_checkbox_2_4").prop("checked", true);
            $("#check_mf59f_2_4").show();
        } else {
            $("#name_address_checkbox_2_4").prop("checked", false);
            $("#check_mf59f_2_4").hide();
        }
        //mf59f_3_4
        if ($("#_1237_mf59f_number").val() != "" || $("#_1238_mf59f_details").val() != "") {
            $("#name_address_checkbox_3_4").prop("checked", true);
            $("#check_mf59f_3_4").show();
        } else {
            $("#name_address_checkbox_3_4").prop("checked", false);
            $("#check_mf59f_3_4").hide();
        }
        //mf59f_4_4
        if ($("#_1239_mf59f_number").val() != "" || $("#_1240_mf59f_details").val() != "") {
            $("#name_address_checkbox_4_4").prop("checked", true);
            $("#check_mf59f_4_4").show();
        } else {
            $("#name_address_checkbox_4_4").prop("checked", false);
            $("#check_mf59f_4_4").hide();
        }

        //mf32_5
        if ($("#_1410_mf32a_date").val() != "" || $("#_1411_mf32a_currency").val() != "" || $("#_1412_mf32a_amount").val() != "") {
            $("#type_mf32_amount_collected_5").val("a").attr("selected", true);
            $("#div_mf32a_5").show();
            $("#div_mf32b_5").hide();
            $("#_1410_mf32a_date").attr("disabled", false);
            $("#_1411_mf32a_currency").attr("disabled", false);
            $("#_1412_mf32a_amount").attr("disabled", false);
            $("#_1413_mf32b_currency").attr("disabled", true);
            $("#_1414_mf32b_amount").attr("disabled", true);
        } else if ($("#_1413_mf32b_currency").val() != "" || $("#_1414_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected_5").val("b").attr("selected", true);
            $("#div_mf32a_5").hide();
            $("#div_mf32b_5").show();
            $("#_1410_mf32a_date").attr("disabled", true);
            $("#_1411_mf32a_currency").attr("disabled", true);
            $("#_1412_mf32a_amount").attr("disabled", true);
            $("#_1413_mf32b_currency").attr("disabled", false);
            $("#_1414_mf32b_amount").attr("disabled", false);
        } else {
            $("#type_mf32_amount_collected_5").val("").attr("selected", true);
            $("#div_mf32a_5").hide();
            $("#div_mf32b_5").hide();
        }

        //of50_5
        if ($("#_1420_of50a_account").val() != "" || $("#_1421_of50a_identifier_code").val() != "" || $("#_1422_of50a_address").val() != "") {
            $("#type_of50_payer_5").val("a").attr("selected", true);
            $("#div_of50a__5").show();
            $("#div_mf50f__5").hide();
            $("#div_mf50f_2_5").hide();
            $("#div_mf50f_3_5").hide();
            $("#div_mf50f_4_5").hide();
            $("#div_mf50k__5").hide();
            $("#_1420_of50a_account").attr("disabled", false);
            $("#_1421_of50a_identifier_code").attr("disabled", false);
            $("#_1422_of50a_address").attr("disabled", false);
            $("#_1423_of50f_account").attr("disabled", true);
            $("#_1424_mf50f_number").attr("disabled", true);
            $("#_1425_of50f_details").attr("disabled", true);
            $("#name_address_checkbox_2_50_5").attr("disabled", true);
            $("#name_address_checkbox_3_50_5").attr("disabled", true);
            $("#name_address_checkbox_4_50_5").attr("disabled", true);
        } else if ($("#_1423_of50f_account").val() != "" || $("#_1424_mf50f_number").val() != "" || $("#_1425_of50f_details").val() != "") {
            $("#type_of50_payer_5").val("f").attr("selected", true);
            $("#div_of50a__5").hide();
            $("#div_mf50f__5").show();
            $("#div_mf50f_2_5").show();
            $("#div_mf50f_3_5").show();
            $("#div_mf50f_4_5").show();
            $("#div_mf50k__5").hide();
            $("#_1420_of50a_account").attr("disabled", true);
            $("#_1421_of50a_identifier_code").attr("disabled", true);
            $("#_1422_of50a_address").attr("disabled", true);
            $("#_1423_of50f_account").attr("disabled", false);
            $("#_1424_mf50f_number").attr("disabled", false);
            $("#_1425_of50f_details").attr("disabled", false);
            $("#name_address_checkbox_2_50_5").attr("disabled", false);
            $("#name_address_checkbox_3_50_5").attr("disabled", false);
            $("#name_address_checkbox_4_50_5").attr("disabled", false);
        } else if ($("#_1432_of50k_account").val() != "" || $("#_1433_of50k_name_address").val() != "") {
            $("#type_of50_payer_5").val("k").attr("selected", true);
            $("#div_of50a__5").hide();
            $("#div_mf50f__5").hide();
            $("#div_mf50f_2_5").hide();
            $("#div_mf50f_3_5").hide();
            $("#div_mf50f_4_5").hide();
            $("#div_mf50k__5").show();
            //_1432_of50k_account
            $("#_1420_of50a_account").attr("disabled", true);
            $("#_1421_of50a_identifier_code").attr("disabled", true);
            $("#_1422_of50a_address").attr("disabled", true);
            $("#_1423_of50f_account").attr("disabled", true);
            $("#_1424_mf50f_number").attr("disabled", true);
            $("#_1425_of50f_details").attr("disabled", true);
            $("#_1432_of50k_account").attr("disabled", false);
            $("#_1433_of50k_name_address").attr("disabled", false);

        } else {
            $("#div_of50a__5").hide();
            $("#div_mf50f__5").hide();
            $("#div_mf50f_2_5").hide();
            $("#div_mf50f_3_5").hide();
            $("#div_mf50f_4_5").hide();
            $("#div_mf50k__5").hide();
            $("#name_address_checkbox_2_50_5").hide();
            $("#name_address_checkbox_3_50_5").hide();
            $("#name_address_checkbox_4_50_5").hide();
        }
        //of50_2_5
        if ($("#_1426_of50f_number").val() != "" || $("#_1427_of50f_details").val() != "") {
            $("#name_address_checkbox_2_50_5").prop("checked", true);
            $("#check_mf50f_2_5").show();
        } else {
            $("#name_address_checkbox_2_50_5").prop("checked", false);
            $("#check_mf50f_2_5").hide();
        }
        //mf50_3_5
        if ($("#_1428_of50f_number").val() != "" || $("#_1429_of50f_details").val() != "") {
            $("#name_address_checkbox_3_50_5").prop("checked", true);
            $("#check_mf50f_3_5").show();
        } else {
            $("#name_address_checkbox_3_50_5").prop("checked", false);
            $("#check_mf50f_3_5").hide();
        }
        //mf50_4_5
        if ($("#_1430_of50f_number").val() != "" || $("#_1431_of50f_details").val() != "") {
            $("#name_address_checkbox_4_50_5").prop("checked", true);
            $("#check_mf50f_4_5").show();
        } else {
            $("#name_address_checkbox_4_50_5").prop("checked", false);
            $("#check_mf50f_4_5").hide();
        }

        //of 52a/b/d_5
        if ($("#_1530_of52a_Party_Identifier").val() != "" || $("#_1531_of52a_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_5").val("a").attr("selected", true);
            $("#div_of52a__5").show();
            $("#div_of52b__5").hide();
            $("#div_of52d__5").hide();
            $("#_1530_of52a_Party_Identifier").attr("disabled", false);
            $("#_1531_of52a_Identifier_Code").attr("disabled", false);
            $("#_1532_of52b_Party_Identifier").attr("disabled", true);
            $("#_1533_of52b_Location").attr("disabled", true);
            $("#_1534_of52d_Party_Identifier").attr("disabled", true);
            $("#_1535_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_1532_of52b_Party_Identifier").val() != "" || $("#_1533_of52b_Location").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_5").val("b").attr("selected", true);
            $("#div_of52a__5").hide();
            $("#div_of52b__5").show();
            $("#div_of52d__5").hide();
            $("#_1530_of52a_Party_Identifier").attr("disabled", true);
            $("#_1531_of52a_Identifier_Code").attr("disabled", true);
            $("#_1532_of52b_Party_Identifier").attr("disabled", false);
            $("#_1533_of52b_Location").attr("disabled", false);
            $("#_1534_of52d_Party_Identifier").attr("disabled", true);
            $("#_1535_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_1534_of52d_Party_Identifier").val() != "" || $("#_1535_of52d_Name_and_Address").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_5").val("d").attr("selected", true);
            $("#div_of52a__5").hide();
            $("#div_of52b__5").hide();
            $("#div_of52d__5").show();
            $("#_1530_of52a_Party_Identifier").attr("disabled", true);
            $("#_1531_of52a_Identifier_Code").attr("disabled", true);
            $("#_1532_of52b_Party_Identifier").attr("disabled", true);
            $("#_1533_of52b_Location").attr("disabled", true);
            $("#_1534_of52d_Party_Identifier").attr("disabled", false);
            $("#_1535_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#type_of52_Sender_of_Cash_Letter_5").val("").attr("selected", true);
            $("#div_of52a__5").hide();
            $("#div_of52b__5").hide();
            $("#div_of52d__5").hide();
        }
        //mf59 /59f_5
        if ($("#_1540_mf59_account").val() != "" || $("#_1541_mf59_name_address").val() != "") {
            $("#type_of59_59a__5").val("59").attr("selected", true);
            $("#div_mf59__5").show();
            $("#div_mf59f__5").hide();
            $("#div_mf59f_2_5").hide();
            $("#div_mf59f_3_5").hide();
            $("#div_mf59f_4_5").hide();
            $("#_1540_mf59_account").attr("disabled", false);
            $("#_1541_mf59_name_address").attr("disabled", false);
            $("#_1542_mf59f_account").attr("disabled", true);
            $("#_1543_mf59f_number").attr("disabled", true);
            $("#_1544_mf59f_details").attr("disabled", true);
            $("#name_address_checkbox_2_5").attr("disabled", true);
            $("#name_address_checkbox_3_5").attr("disabled", true);
            $("#name_address_checkbox_4_5").attr("disabled", true);
        } else if ($("#_1542_mf59f_account").val() != "" || $("#_1543_mf59f_number").val() != "" || $("#_1544_mf59f_details").val() != "") {
            $("#type_of59_59a__5").val("59f").attr("selected", true);
            $("#div_mf59__5").hide();
            $("#div_mf59f__5").show();
            $("#div_mf59f_2_5").show();
            $("#div_mf59f_3_5").show();
            $("#div_mf59f_4_5").show();
            $("#_1540_mf59_account").attr("disabled", true);
            $("#_1541_mf59_name_address").attr("disabled", true);
            $("#_1542_mf59f_account").attr("disabled", false);
            $("#_1543_mf59f_number").attr("disabled", false);
            $("#_1544_mf59f_details").attr("disabled", false);
            $("#name_address_checkbox_2_5").attr("disabled", false);
            $("#name_address_checkbox_3_5").attr("disabled", false);
            $("#name_address_checkbox_4_5").attr("disabled", false);
        } else {
            $("#div_mf59__5").hide();
            $("#div_mf59f__5").hide();
            $("#div_mf59f_2_5").hide();   
            $("#div_mf59f_3_5").hide();
            $("#div_mf59f_4_5").hide();
            $("#_1540_mf59_account").attr("disabled", true);
            $("#_1541_mf59_name_address").attr("disabled", true);
            $("#_1542_mf59f_account").attr("disabled", true);
            $("#_1543_mf59f_number").attr("disabled", true);
            $("#_1544_mf59f_details").attr("disabled", true);
            $("#name_address_checkbox_2_5").attr("disabled", true);
            $("#name_address_checkbox_3_5").attr("disabled", true);
            $("#name_address_checkbox_4_5").attr("disabled", true);
        }
        //mf59f_5_2
        if ($("#_1545_mf59f_number").val() != "" || $("#_1546_mf59f_details").val() != "") {
            $("#name_address_checkbox_2_5").prop("checked", true);
            $("#check_mf59f_2_5").show();
        } else {
            $("#name_address_checkbox_2_5").prop("checked", false);
            $("#check_mf59f_2_5").hide();
        }
        //mf59f_5_3
        if ($("#_1547_mf59f_number").val() != "" || $("#_1548_mf59f_details").val() != "") {
            $("#name_address_checkbox_3_5").prop("checked", true);
            $("#check_mf59f_3_5").show();
        } else {
            $("#name_address_checkbox_3_5").prop("checked", false);
            $("#check_mf59f_3_5").hide();
        }
        //mf59f_5_4
        if ($("#_1549_mf59f_number").val() != "" || $("#_1550_mf59f_details").val() != "") {
            $("#name_address_checkbox_4_5").prop("checked", true);
            $("#check_mf59f_4_5").show();
        } else {
            $("#name_address_checkbox_4_5").prop("checked", false);
            $("#check_mf59f_4_5").hide();
        }

        //mf32_6
        if ($("#_1720_mf32a_date").val() != "" || $("#_1721_mf32a_currency").val() != "" || $("#_1722_mf32a_amount").val() != "") {
            $("#type_mf32_amount_collected_6").val("a").attr("selected", true);
            $("#div_mf32a_6").show();
            $("#div_mf32b_6").hide();
            $("#_1720_mf32a_date").attr("disabled", false);
            $("#_1721_mf32a_currency").attr("disabled", false);
            $("#_1722_mf32a_amount").attr("disabled", false);
            $("#_1723_mf32b_currency").attr("disabled", true);
            $("#_1724_mf32b_amount").attr("disabled", true);
        } else if ($("#_1723_mf32b_currency").val() != "" || $("#_1724_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected_6").val("b").attr("selected", true);
            $("#div_mf32a_6").hide();
            $("#div_mf32b_6").show();
            $("#_1720_mf32a_date").attr("disabled", true);
            $("#_1721_mf32a_currency").attr("disabled", true);
            $("#_1722_mf32a_amount").attr("disabled", true);
            $("#_1723_mf32b_currency").attr("disabled", false);
            $("#_1724_mf32b_amount").attr("disabled", false);
        } else {
            $("#type_mf32_amount_collected_6").val("").attr("selected", true);
            $("#div_mf32a_6").hide();
            $("#div_mf32b_6").hide();
        }

        //of50_6

        if ($("#_1730_of50a_account").val() != "" || $("#_1731_of50a_identifier_code").val() != "" || $("#_1732_of50a_address").val() != "") {
            $("#type_of50_payer_6").val("a").attr("selected", true);
            $("#div_of50a__6").show();
            $("#div_mf50f__6").hide();
            $("#div_mf50f_2_6").hide();
            $("#div_mf50f_3_6").hide();
            $("#div_mf50f_4_6").hide();
            $("#div_mf50k__6").hide();
            $("#_1730_of50a_account").attr("disabled", false);
            $("#_1731_of50a_identifier_code").attr("disabled", false);
            $("#_1732_of50a_address").attr("disabled", false);
            $("#_1733_of50f_account").attr("disabled", true);
            $("#_1734_mf50f_number").attr("disabled", true);
            $("#_1735_of50f_details").attr("disabled", true);
            $("#name_address_checkbox_2_50_6").attr("disabled", true);
            $("#name_address_checkbox_3_50_6").attr("disabled", true);
            $("#name_address_checkbox_4_50_6").attr("disabled", true);
        } else if ($("#_1733_of50f_account").val() != "" || $("#_1734_mf50f_number").val() != "" || $("#_1735_of50f_details").val() != "") {
            $("#type_of50_payer_6").val("f").attr("selected", true);
            $("#div_of50a__6").hide();
            $("#div_mf50f__6").show();
            $("#div_mf50f_2_6").show();
            $("#div_mf50f_3_6").show();
            $("#div_mf50f_4_6").show();
            $("#div_mf50k__6").hide();
            $("#_1730_of50a_account").attr("disabled", true);
            $("#_1731_of50a_identifier_code").attr("disabled", true);
            $("#_1732_of50a_address").attr("disabled", true);
            $("#_1733_of50f_account").attr("disabled", false);
            $("#_1734_mf50f_numberf").attr("disabled", false);
            $("#_1735_of50f_details").attr("disabled", false);
            $("#name_address_checkbox_2_50_6").attr("disabled", false);
            $("#name_address_checkbox_3_50_6").attr("disabled", false);
            $("#name_address_checkbox_4_50_6").attr("disabled", false);
        } else if ($("#_1742_of50k_account").val() != "" || $("#_1743_of50k_name_address").val() != "") {
            $("#type_of50_payer_6").val("k").attr("selected", true);
            $("#div_of50a__6").hide();
            $("#div_mf50f__6").hide();
            $("#div_mf50f_2_6").hide();
            $("#div_mf50f_3_6").hide();
            $("#div_mf50f_4_6").hide();
            $("#div_mf50k__6").show();
            //_1742_of50k_account
            $("#_1730_of50a_account").attr("disabled", true);
            $("#_1731_of50a_identifier_code").attr("disabled", true);
            $("#_1732_of50a_address").attr("disabled", true);
            $("#_1733_of50f_account").attr("disabled", true);
            $("#_1734_mf50f_numberf").attr("disabled", true);
            $("#_1735_of50f_details").attr("disabled", true);
            $("#_1742_of50k_account").attr("disabled", false);
            $("#_1743_of50k_name_address").attr("disabled", false);

        } else {
            $("#div_of50a__6").hide();
            $("#div_mf50f__6").hide();
            $("#div_mf50f_2_6").hide();
            $("#div_mf50f_3_6").hide();
            $("#div_mf50f_4_6").hide();
            $("#div_mf50k__6").hide();
            $("#name_address_checkbox_2_50_6").hide();
            $("#name_address_checkbox_3_50_6").hide();
            $("#name_address_checkbox_4_50_6").hide();
        }

        //of50_2_6
        if ($("#_1736_of50f_number").val() != "" || $("#_1737_of50f_details").val() != "") {
            $("#name_address_checkbox_2_50_6").prop("checked", true);
            $("#check_mf50f_2_6").show();
        } else {
            $("#name_address_checkbox_2_50_6").prop("checked", false);
            $("#check_mf50f_2_6").hide();
        }
        //mf50_3_6
        if ($("#_1738_of50f_number").val() != "" || $("#_1739_of50f_details").val() != "") {
            $("#name_address_checkbox_3_50_6").prop("checked", true);
            $("#check_mf50f_3_6").show();
        } else {
            $("#name_address_checkbox_3_50_6").prop("checked", false);
            $("#check_mf50f_3_6").hide();
        }
        //mf50_4_6
        if ($("#_1740_of50f_number").val() != "" || $("#_1741_of50f_details").val() != "") {
            $("#name_address_checkbox_4_50_6").prop("checked", true);
            $("#check_mf50f_4_6").show();
        } else {
            $("#name_address_checkbox_4_50_6").prop("checked", false);
            $("#check_mf50f_4_6").hide();
        }

        //of 52a/b/d_6
        if ($("#_1840_of52a_Party_Identifier").val() != "" || $("#_1841_of52a_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_6").val("a").attr("selected", true);
            $("#div_of52a__6").show();
            $("#div_of52b__6").hide();
            $("#div_of52d__6").hide();
            $("#_1840_of52a_Party_Identifier").attr("disabled", false);
            $("#_1841_of52a_Identifier_Code").attr("disabled", false);
            $("#_1842_of52b_Party_Identifier").attr("disabled", true);
            $("#_1843_of52b_Location").attr("disabled", true);
            $("#_1844_of52d_Party_Identifier").attr("disabled", true);
            $("#_1845_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_1842_of52b_Party_Identifier").val() != "" || $("#_1843_of52b_Location").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_6").val("b").attr("selected", true);
            $("#div_of52a__6").hide();
            $("#div_of52b__6").show();
            $("#div_of52d__6").hide();
            $("#_1840_of52a_Party_Identifier").attr("disabled", true);
            $("#_1841_of52a_Identifier_Code").attr("disabled", true);
            $("#_1842_of52b_Party_Identifier").attr("disabled", false);
            $("#_1843_of52b_Location").attr("disabled", false);
            $("#_1844_of52d_Party_Identifier").attr("disabled", true);
            $("#_1845_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_1844_of52d_Party_Identifier").val() != "" || $("#_1845_of52d_Name_and_Address").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_6").val("d").attr("selected", true);
            $("#div_of52a__6").hide();
            $("#div_of52b__6").hide();
            $("#div_of52d__6").show();
            $("#_1840_of52a_Party_Identifier").attr("disabled", true);
            $("#_1841_of52a_Identifier_Code").attr("disabled", true);
            $("#_1842_of52b_Party_Identifier").attr("disabled", true);
            $("#_1843_of52b_Location").attr("disabled", true);
            $("#_1844_of52d_Party_Identifier").attr("disabled", false);
            $("#_1845_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#type_of52_Sender_of_Cash_Letter_6").val("").attr("selected", true);
            $("#div_of52a__6").hide();
            $("#div_of52b__6").hide();
            $("#div_of52d__6").hide();
        }
        //mf59 /59f_6
        if ($("#_1850_mf59_account").val() != "" || $("#_1851_mf59_name_address").val() != "") {
            $("#type_of59_59a__6").val("59").attr("selected", true);
            $("#div_mf59__6").show();
            $("#div_mf59f__6").hide();
            $("#div_mf59f_2_6").hide();
            $("#div_mf59f_3_6").hide();
            $("#div_mf59f_4_6").hide();
            $("#_1850_mf59_account").attr("disabled", false);
            $("#_1851_mf59_name_address").attr("disabled", false);
            $("#_1852_mf59f_account").attr("disabled", true);
            $("#_1853_mf59f_number").attr("disabled", true);
            $("#_1854_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_6").attr("disabled", true);
            $("name_address_checkbox_3_6").attr("disabled", true);
            $("name_address_checkbox_4_6").attr("disabled", true);
        } else if ($("#_1852_mf59f_account").val() != "" || $("#_1853_mf59f_number").val() != "" || $("#_1854_mf59f_details").val() != "") {
            $("#type_of59_59a__6").val("59f").attr("selected", true);
            $("#div_mf59__6").hide();
            $("#div_mf59f__6").show();
            $("#div_mf59f_2_6").show();
            $("#div_mf59f_3_6").show();
            $("#div_mf59f_4_6").show();
            $("#_1850_mf59_account").attr("disabled", true);
            $("#_1851_mf59_name_address").attr("disabled", true);
            $("#_1852_mf59f_account").attr("disabled", false);
            $("#_1853_mf59f_number").attr("disabled", false);
            $("#_1854_mf59f_details").attr("disabled", false);
            $("name_address_checkbox_2_6").attr("disabled", false);
            $("name_address_checkbox_3_6").attr("disabled", false);
            $("name_address_checkbox_4_6").attr("disabled", false);
        } else {
            $("#div_mf59__6").hide();
            $("#div_mf59f__6").hide();
            $("#div_mf59f_2_6").hide();
            $("#div_mf59f_3_6").hide();
            $("#div_mf59f_4_6").hide();
            $("#_1850_mf59_account").attr("disabled", true);
            $("#_1851_mf59_name_address").attr("disabled", true);
            $("#_1852_mf59f_account").attr("disabled", true);
            $("#_1853_mf59f_number").attr("disabled", true);
            $("#_1854_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_6").attr("disabled", true);
            $("name_address_checkbox_3_6").attr("disabled", true);
            $("name_address_checkbox_4_6").attr("disabled", true);
        }

        //mf59f_6_2
        if ($("#_1855_mf59f_number").val() != "" || $("#_1856_mf59f_details").val() != "") {
            $("#name_address_checkbox_2_6").prop("checked", true);
            $("#check_mf59f_2_6").show();
        } else {
            $("#name_address_checkbox_2_6").prop("checked", false);
            $("#check_mf59f_2_6").hide();
        }
        //mf59f_6_3
        if ($("#_1857_mf59f_number").val() != "" || $("#_1858_mf59f_details").val() != "") {
            $("#name_address_checkbox_3_6").prop("checked", true);
            $("#check_mf59f_3_6").show();
        } else {
            $("#name_address_checkbox_3_6").prop("checked", false);
            $("#check_mf59f_3_6").hide();
        }
        //mf59f_6_4
        if ($("#_1859_mf59f_number").val() != "" || $("#_1860_mf59f_details").val() != "") {
            $("#name_address_checkbox_4_6").prop("checked", true);
            $("#check_mf59f_4_6").show();
        } else {
            $("#name_address_checkbox_4_6").prop("checked", false);
            $("#check_mf59f_4_6").hide();
        }


        //mf32_7
        if ($("#_2030_mf32a_date").val() != "" || $("#_2031_mf32a_currency").val() != "" || $("#_2032_mf32a_amount").val() != "") {
            $("#type_mf32_amount_collected_7").val("a").attr("selected", true);
            $("#div_mf32a_7").show();
            $("#div_mf32b_7").hide();
            $("#_2030_mf32a_date").attr("disabled", false);
            $("#_2031_mf32a_currency").attr("disabled", false);
            $("#_2032_mf32a_amount").attr("disabled", false);
            $("#_2033_mf32b_currency").attr("disabled", true);
            $("#_2034_mf32b_amount").attr("disabled", true);
        } else if ($("#_2033_mf32b_currency").val() != "" || $("#_2034_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected_7").val("b").attr("selected", true);
            $("#div_mf32a_7").hide();
            $("#div_mf32b_7").show();
            $("#_2030_mf32a_date").attr("disabled", true);
            $("#_2031_mf32a_currency").attr("disabled", true);
            $("#_2032_mf32a_amount").attr("disabled", true);
            $("#_2033_mf32b_currency").attr("disabled", false);
            $("#_2034_mf32b_amount").attr("disabled", false);
        } else {
            $("#type_mf32_amount_collected_7").val("").attr("selected", true);
            $("#div_mf32a_7").hide();
            $("#div_mf32b_7").hide();
        }

        //of50_7
        if ($("#_2040_of50a_account").val() != "" || $("#_2041_of50a_identifier_code").val() != "" || $("#_2042_of50a_address").val() != "") {
            $("#type_of50_payer_7").val("a").attr("selected", true);
            $("#div_of50a__7").show();
            $("#div_mf50f__7").hide();
            $("#div_mf50f_2_7").hide();
            $("#div_mf50f_3_7").hide();
            $("#div_mf50f_4_7").hide();
            $("#div_mf50k__7").hide();
            $("#_2040_of50a_account").attr("disabled", false);
            $("#_2041_of50a_identifier_code").attr("disabled", false);
            $("#_2042_of50a_address").attr("disabled", false);
            $("#_2043_of50f_account").attr("disabled", true);
            $("#_2044_mf50f_number").attr("disabled", true);
            $("#_2045_of50f_details").attr("disabled", true);
            $("#name_address_checkbox_2_50_7").attr("disabled", true);
            $("#name_address_checkbox_3_50_7").attr("disabled", true);
            $("#name_address_checkbox_4_50_7").attr("disabled", true);
        } else if ($("#_2043_of50f_account").val() != "" || $("#_2044_mf50f_number").val() != "" || $("#_2045_of50f_details").val() != "") {
            $("#type_of50_payer_7").val("f").attr("selected", true);
            $("#div_of50a__7").hide();
            $("#div_mf50f__7").show();
            $("#div_mf50f_2_7").show();
            $("#div_mf50f_3_7").show();
            $("#div_mf50f_4_7").show();
            $("#div_mf50k__7").hide();
            $("#_2040_of50a_account").attr("disabled", true);
            $("#_2041_of50a_identifier_code").attr("disabled", true);
            $("#_2042_of50a_address").attr("disabled", true);
            $("#_2043_of50f_account").attr("disabled", false);
            $("#_2044_mf50f_number").attr("disabled", false);
            $("#_2045_of50f_details").attr("disabled", false);
            $("#name_address_checkbox_2_50_7").attr("disabled", false);
            $("#name_address_checkbox_3_50_7").attr("disabled", false);
            $("#name_address_checkbox_4_50_7").attr("disabled", false);
        } else if ($("#_2052_of50k_account").val() != "" || $("#_2053_of50k_name_address").val() != "") {
            $("#type_of50_payer_7").val("k").attr("selected", true);
            $("#div_of50a__7").hide();
            $("#div_mf50f__7").hide();
            $("#div_mf50f_2_7").hide();
            $("#div_mf50f_3_7").hide();
            $("#div_mf50f_4_7").hide();
            $("#div_mf50k__7").show();
            //_2052_of50k_account
            $("#_2040_of50a_account").attr("disabled", true);
            $("#_2041_of50a_identifier_code").attr("disabled", true);
            $("#_2042_of50a_address").attr("disabled", true);
            $("#_2043_of50f_account").attr("disabled", true);
            $("#_2044_mf50f_number").attr("disabled", true);
            $("#_2045_of50f_details").attr("disabled", true);
            $("#_2052_of50k_account").attr("disabled", false);
            $("#_2053_of50k_name_address").attr("disabled", false);

        } else {
            $("#div_of50a__7").hide();
            $("#div_mf50f__7").hide();
            $("#div_mf50f_2_7").hide();
            $("#div_mf50f_3_7").hide();
            $("#div_mf50f_4_7").hide();
            $("#div_mf50k__7").hide();
            $("#name_address_checkbox_2_50_7").hide();
            $("#name_address_checkbox_3_50_7").hide();
            $("#name_address_checkbox_4_50_7").hide();
        }

        //of50_2_7
        if ($("#_2046_of50f_number").val() != "" || $("#_2047_of50f_details").val() != "") {
            $("#name_address_checkbox_2_50_7").prop("checked", true);
            $("#check_mf50f_2_7").show();
        } else {
            $("#name_address_checkbox_2_50_7").prop("checked", false);
            $("#check_mf50f_2_7").hide();
        }
        //mf50_3_7
        if ($("#_2048_of50f_number").val() != "" || $("#_2049_of50f_details").val() != "") {
            $("#name_address_checkbox_3_50_7").prop("checked", true);
            $("#check_mf50f_3_7").show();
        } else {
            $("#name_address_checkbox_3_50_7").prop("checked", false);
            $("#check_mf50f_3_7").hide();
        }
        //mf50_4_7
        if ($("#_2050_of50f_number").val() != "" || $("#_2051_of50f_details").val() != "") {
            $("#name_address_checkbox_4_50_7").prop("checked", true);
            $("#check_mf50f_4_7").show();
        } else {
            $("#name_address_checkbox_4_50_7").prop("checked", false);
            $("#check_mf50f_4_7").hide();
        }

        if ($("#_2150_of52a_Party_Identifier").val() != "" || $("#_2151_of52a_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_7").val("a").attr("selected", true);
            $("#div_of52a__7").show();
            $("#div_of52b__7").hide();
            $("#div_of52d__7").hide();
            $("#_2150_of52a_Party_Identifier").attr("disabled", false);
            $("#_2151_of52a_Identifier_Code").attr("disabled", false);
            $("#_2152_of52b_Party_Identifier").attr("disabled", true);
            $("#_2153_of52b_Location").attr("disabled", true);
            $("#_2154_of52d_Party_Identifier").attr("disabled", true);
            $("#_2155_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_2152_of52b_Party_Identifier").val() != "" || $("#_2153_of52b_Location").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_7").val("b").attr("selected", true);
            $("#div_of52a__7").hide();
            $("#div_of52b__7").show();
            $("#div_of52d__7").hide();
            $("#_2150_of52a_Party_Identifier").attr("disabled", true);
            $("#_2151_of52a_Identifier_Code").attr("disabled", true);
            $("#_2152_of52b_Party_Identifier").attr("disabled", false);
            $("#_2153_of52b_Location").attr("disabled", false);
            $("#_2154_of52d_Party_Identifier").attr("disabled", true);
            $("#_2155_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_2154_of52d_Party_Identifier").val() != "" || $("#_2155_of52d_Name_and_Address").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_7").val("d").attr("selected", true);
            $("#div_of52a__7").hide();
            $("#div_of52b__7").hide();
            $("#div_of52d__7").show();
            $("#_2150_of52a_Party_Identifier").attr("disabled", true);
            $("#_2151_of52a_Identifier_Code").attr("disabled", true);
            $("#_2152_of52b_Party_Identifier").attr("disabled", true);
            $("#_2153_of52b_Location").attr("disabled", true);
            $("#_2154_of52d_Party_Identifier").attr("disabled", false);
            $("#_2155_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#type_of52_Sender_of_Cash_Letter_7").val("").attr("selected", true);
            $("#div_of52a__7").hide();
            $("#div_of52b__7").hide();
            $("#div_of52d__7").hide();
        }

        //mf59 /59f_7
        if ($("#_2160_mf59_account").val() != "" || $("#_2161_mf59_name_address").val() != "") {
            $("#type_of59_59a__7").val("59").attr("selected", true);
            $("#div_mf59__7").show();
            $("#div_mf59f__7").hide();
            $("#div_mf59f_2_7").hide();
            $("#div_mf59f_3_7").hide();
            $("#div_mf59f_4_7").hide();
            $("#_2160_mf59_account").attr("disabled", false);
            $("#_2161_mf59_name_address").attr("disabled", false);
            $("#_2162_mf59f_account").attr("disabled", true);
            $("#_2163_mf59f_number").attr("disabled", true);
            $("#_2164_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_7").attr("disabled", true);
            $("name_address_checkbox_3_7").attr("disabled", true);
            $("name_address_checkbox_4_7").attr("disabled", true);
        } else if ($("#_2162_mf59f_account").val() != "" || $("#_2163_mf59f_number").val() != "" || $("#_2164_mf59f_details").val() != "") {
            $("#type_of59_59a__7").val("59f").attr("selected", true);
            $("#div_mf59__7").hide();
            $("#div_mf59f__7").show();
            $("#div_mf59f_2_7").show();
            $("#div_mf59f_3_7").show();
            $("#div_mf59f_4_7").show();
            $("#_2160_mf59_account").attr("disabled", true);
            $("#_2161_mf59_name_address").attr("disabled", true);
            $("#_2162_mf59f_account").attr("disabled", false);
            $("#_2163_mf59f_number").attr("disabled", false);
            $("#_2164_mf59f_details").attr("disabled", false);
            $("name_address_checkbox_2_7").attr("disabled", false);
            $("name_address_checkbox_3_7").attr("disabled", false);
        } else {
            $("#div_mf59__7").hide();
            $("#div_mf59f__7").hide();
            $("#div_mf59f_2_7").hide();
            $("#div_mf59f_3_7").hide();
            $("#div_mf59f_4_7").hide();
            $("#_2160_mf59_account").attr("disabled", true);
            $("#_2161_mf59_name_address").attr("disabled", true);
            $("#_2162_mf59f_account").attr("disabled", true);
            $("#_2163_mf59f_number").attr("disabled", true);
            $("#_2164_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_7").attr("disabled", true);
            $("name_address_checkbox_3_7").attr("disabled", true);
            $("name_address_checkbox_4_7").attr("disabled", true);
        }
        //mf59f_7_2
        if ($("#_2165_mf59f_number").val() != "" || $("#_2166_mf59f_details").val() != "") {
            $("#name_address_checkbox_2_7").prop("checked", true);
            $("#check_mf59f_2_7").show();
        } else {
            $("#name_address_checkbox_2_7").prop("checked", false);
            $("#check_mf59f_2_7").hide();
        }
        //mf59f_7_3
        if ($("#_2167_mf59f_number").val() != "" || $("#_2168_mf59f_details").val() != "") {
            $("#name_address_checkbox_3_7").prop("checked", true);
            $("#check_mf59f_3_7").show();
        } else {
            $("#name_address_checkbox_3_7").prop("checked", false);
            $("#check_mf59f_3_7").hide();
        }
        //mf59f_7_4
        if ($("#_2169_mf59f_number").val() != "" || $("#_2170_mf59f_details").val() != "") {
            $("#name_address_checkbox_4_7").prop("checked", true);
            $("#check_mf59f_4_7").show();
        } else {
            $("#name_address_checkbox_4_7").prop("checked", false);
            $("#check_mf59f_4_7").hide();
        }

        if ($("#_2340_mf32a_date").val() != "" || $("#_2341_mf32a_currency").val() != "" || $("#_2342_mf32a_amount").val() != "") {
            $("#type_mf32_amount_collected_8").val("a").attr("selected", true);
            $("#div_mf32a_8").show();
            $("#div_mf32b_8").hide();
            $("#_2340_mf32a_date").attr("disabled", false);
            $("#_2341_mf32a_currency").attr("disabled", false);
            $("#_2342_mf32a_amount").attr("disabled", false);
            $("#_2343_mf32b_currency").attr("disabled", true);
            $("#_2344_mf32b_amount").attr("disabled", true);
        } else if ($("#_2343_mf32b_currency").val() != "" || $("#_2344_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected_8").val("b").attr("selected", true);
            $("#div_mf32a_8").hide();
            $("#div_mf32b_8").show();
            $("#_2340_mf32a_date").attr("disabled", true);
            $("#_2341_mf32a_currency").attr("disabled", true);
            $("#_2342_mf32a_amount").attr("disabled", true);
            $("#_2343_mf32b_currency").attr("disabled", false);
            $("#_2344_mf32b_amount").attr("disabled", false);
        } else {
            $("#type_mf32_amount_collected_8").val("").attr("selected", true);
            $("#div_mf32a_8").hide();
            $("#div_mf32b_8").hide();
        }

        //of50_8
        if ($("#_2350_of50a_account").val() != "" || $("#_2351_of50a_identifier_code").val() != "" || $("#_2352_of50a_address").val() != "") {
            $("#type_of50_payer_8").val("a").attr("selected", true);
            $("#div_of50a__8").show();
            $("#div_mf50f__8").hide();
            $("#div_mf50f_2_8").hide();
            $("#div_mf50f_3_8").hide();
            $("#div_mf50f_4_8").hide();
            $("#div_mf50k__8").hide();
            $("#_2350_of50a_account").attr("disabled", false);
            $("#_2351_of50a_identifier_code").attr("disabled", false);
            $("#_2352_of50a_address").attr("disabled", false);
            $("#_2353_of50f_account").attr("disabled", true);
            $("#_2354_mf50f_number").attr("disabled", true);
            $("#_2355_of50f_details").attr("disabled", true);
            $("#name_address_checkbox_2_50_8").attr("disabled", true);
            $("#name_address_checkbox_3_50_8").attr("disabled", true);
            $("#name_address_checkbox_4_50_8").attr("disabled", true);
        } else if ($("#_2353_of50f_account").val() != "" || $("#_2354_mf50f_number").val() != "" || $("#_2355_of50f_details").val() != "") {
            $("#type_of50_payer_8").val("f").attr("selected", true);
            $("#div_of50a__8").hide();
            $("#div_mf50f__8").show();
            $("#div_mf50f_2_8").show();
            $("#div_mf50f_3_8").show();
            $("#div_mf50f_4_8").show();
            $("#div_mf50k__8").hide();
            $("#_2350_of50a_account").attr("disabled", true);
            $("#_2351_of50a_identifier_code").attr("disabled", true);
            $("#_2352_of50a_address").attr("disabled", true);
            $("#_2353_of50f_account").attr("disabled", false);
            $("#_2354_mf50f_number").attr("disabled", false);
            $("#_2355_of50f_details").attr("disabled", false);
            $("#name_address_checkbox_2_50_8").attr("disabled", false);
            $("#name_address_checkbox_3_50_8").attr("disabled", false);
            $("#name_address_checkbox_4_50_8").attr("disabled", false);
        } else if ($("#_2362_of50k_account").val() != "" || $("#_2363_of50k_name_address").val() != "") {
            $("#type_of50_payer_8").val("k").attr("selected", true);
            $("#div_of50a__8").hide();
            $("#div_mf50f__8").hide();
            $("#div_mf50f_2_8").hide();
            $("#div_mf50f_3_8").hide();
            $("#div_mf50f_4_8").hide();
            $("#div_mf50k__8").show();
            //_2362_of50k_account
            $("#_2350_of50a_account").attr("disabled", true);
            $("#_2351_of50a_identifier_code").attr("disabled", true);
            $("#_2352_of50a_address").attr("disabled", true);
            $("#_2353_of50f_account").attr("disabled", true);
            $("#_2354_mf50f_number").attr("disabled", true);
            $("#_2355_of50f_details").attr("disabled", true);
            $("#_2362_of50k_account").attr("disabled", false);
            $("#_2363_of50k_name_address").attr("disabled", false);

        } else {
            $("#div_of50a__8").hide();
            $("#div_mf50f__8").hide();
            $("#div_mf50f_2_8").hide();
            $("#div_mf50f_3_8").hide();
            $("#div_mf50f_4_8").hide();
            $("#div_mf50k__8").hide();
            $("#name_address_checkbox_2_50_8").hide();
            $("#name_address_checkbox_3_50_8").hide();
            $("#name_address_checkbox_4_50_8").hide();
        }
        //of50_2_8
        if ($("#_2356_of50f_number").val() != "" || $("#_2357_of50f_details").val() != "") {
            $("#name_address_checkbox_2_50_8").prop("checked", true);
            $("#check_mf50f_2_8").show();
        } else {
            $("#name_address_checkbox_2_50_8").prop("checked", false);
            $("#check_mf50f_2_8").hide();
        }
        //mf50_3_8
        if ($("#_2358_of50f_number").val() != "" || $("#_2359_of50f_details").val() != "") {
            $("#name_address_checkbox_3_50_8").prop("checked", true);
            $("#check_mf50f_3_8").show();
        } else {
            $("#name_address_checkbox_3_50_8").prop("checked", false);
            $("#check_mf50f_3_8").hide();
        }
        //mf50_4_8
        if ($("#_2360_of50f_number").val() != "" || $("#_2361_of50f_details").val() != "") {
            $("#name_address_checkbox_4_50_8").prop("checked", true);
            $("#check_mf50f_4_8").show();
        } else {
            $("#name_address_checkbox_4_50_8").prop("checked", false);
            $("#check_mf50f_4_8").hide();
        }

        //of 52a/b/d_8
        if ($("#_2460_of52a_Party_Identifier").val() != "" || $("#_2461_of52a_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_8").val("a").attr("selected", true);
            $("#div_of52a__8").show();
            $("#div_of52b__8").hide();
            $("#div_of52d__8").hide();
            $("#_2460_of52a_Party_Identifier").attr("disabled", false);
            $("#_2461_of52a_Identifier_Code").attr("disabled", false);
            $("#_2462_of52b_Party_Identifier").attr("disabled", true);
            $("#_2463_of52b_Location").attr("disabled", true);
            $("#_2464_of52d_Party_Identifier").attr("disabled", true);
            $("#_2465_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_2462_of52b_Party_Identifier").val() != "" || $("#_2463_of52b_Location").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_8").val("b").attr("selected", true);
            $("#div_of52a__8").hide();
            $("#div_of52b__8").show();
            $("#div_of52d__8").hide();
            $("#_2460_of52a_Party_Identifier").attr("disabled", true);
            $("#_2461_of52a_Identifier_Code").attr("disabled", true);
            $("#_2462_of52b_Party_Identifier").attr("disabled", false);
            $("#_2463_of52b_Location").attr("disabled", false);
            $("#_2464_of52d_Party_Identifier").attr("disabled", true);
            $("#_2465_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_2464_of52d_Party_Identifier").val() != "" || $("#_2465_of52d_Name_and_Address").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_8").val("d").attr("selected", true);
            $("#div_of52a__8").hide();
            $("#div_of52b__8").hide();
            $("#div_of52d__8").show();
            $("#_2460_of52a_Party_Identifier").attr("disabled", true);
            $("#_2461_of52a_Identifier_Code").attr("disabled", true);
            $("#_2462_of52b_Party_Identifier").attr("disabled", true);
            $("#_2463_of52b_Location").attr("disabled", true);
            $("#_2464_of52d_Party_Identifier").attr("disabled", false);
            $("#_2465_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#type_of52_Sender_of_Cash_Letter_8").val("").attr("selected", true);
            $("#div_of52a__8").hide();
            $("#div_of52b__8").hide();
            $("#div_of52d__8").hide();
        }
        //mf59 /59f_8
        if ($("#_2470_mf59_account").val() != "" || $("#_2471_mf59_name_address").val() != "") {
            $("#type_of59_59a__8").val("59").attr("selected", true);
            $("#div_mf59__8").show();
            $("#div_mf59f__8").hide();
            $("#div_mf59f_2_8").hide();
            $("#div_mf59f_3_8").hide();
            $("#div_mf59f_4_8").hide();
            $("#_2470_mf59_account").attr("disabled", false);
            $("#_2471_mf59_name_address").attr("disabled", false);
            $("#_2472_mf59f_account").attr("disabled", true);
            $("#_2473_mf59f_number").attr("disabled", true);
            $("#_2474_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_8").attr("disabled", true);
            $("name_address_checkbox_3_8").attr("disabled", true);
            $("name_address_checkbox_4_8").attr("disabled", true);
        } else if ($("#_2472_mf59f_account").val() != "" || $("#_2473_mf59f_number").val() != "" || $("#_2474_mf59f_details").val() != "") {
            $("#type_of59_59a__8").val("59f").attr("selected", true);
            $("#div_mf59__8").hide();
            $("#div_mf59f__8").show();
            $("#div_mf59f_2_8").show();
            $("#div_mf59f_3_8").show();
            $("#div_mf59f_4_8").show();
            $("#_2470_mf59_account").attr("disabled", true);
            $("#_2471_mf59_name_address").attr("disabled", true);
            $("#_2472_mf59f_account").attr("disabled", false);
            $("#_2473_mf59f_number").attr("disabled", false);
            $("#_2474_mf59f_details").attr("disabled", false);
            $("name_address_checkbox_2_8").attr("disabled", false);
            $("name_address_checkbox_3_8").attr("disabled", false);
            $("name_address_checkbox_4_8").attr("disabled", false);
        } else {
            $("#div_mf59__8").hide();
            $("#div_mf59f__8").hide();
            $("#div_mf59f_2_8").hide();
            $("#div_mf59f_3_8").hide();
            $("#div_mf59f_4_8").hide();
            $("#_2470_mf59_account").attr("disabled", true);
            $("#_2471_mf59_name_address").attr("disabled", true);
            $("#_2472_mf59f_account").attr("disabled", true);
            $("#_2473_mf59f_number").attr("disabled", true);
            $("#_2474_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_8").attr("disabled", true);
            $("name_address_checkbox_3_8").attr("disabled", true);
            $("name_address_checkbox_4_8").attr("disabled", true);
        }
        //mf59f_8_2
        if ($("#_2475_mf59f_number").val() != "" || $("#_2476_mf59f_details").val() != "") {
            $("#name_address_checkbox_2_8").prop("checked", true);
            $("#check_mf59f_2_8").show();
        } else {
            $("#name_address_checkbox_2_8").prop("checked", false);
            $("#check_mf59f_2_8").hide();
        }
        //mf59f_8_3
        if ($("#_2477_mf59f_number").val() != "" || $("#_2478_mf59f_details").val() != "") {
            $("#name_address_checkbox_3_8").prop("checked", true);
            $("#check_mf59f_3_8").show();
        } else {
            $("#name_address_checkbox_3_8").prop("checked", false);
            $("#check_mf59f_3_8").hide();
        }
        //mf59f_8_4
        if ($("#_2479_mf59f_number").val() != "" || $("#_2480_mf59f_details").val() != "") {
            $("#name_address_checkbox_4_8").prop("checked", true);
            $("#check_mf59f_4_8").show();
        } else {
            $("#name_address_checkbox_4_8").prop("checked", false);
            $("#check_mf59f_4_8").hide();
        }

        //mf32_9
        if ($("#_2650_mf32a_date").val() != "" || $("#_2651_mf32a_currency").val() != "" || $("#_2652_mf32a_amount").val() != "") {
            $("#type_mf32_amount_collected_9").val("a").attr("selected", true);
            $("#div_mf32a_9").show();
            $("#div_mf32b_9").hide();
            $("#_2650_mf32a_date").attr("disabled", false);
            $("#_2651_mf32a_currency").attr("disabled", false);
            $("#_2652_mf32a_amount").attr("disabled", false);
            $("#_2653_mf32b_currency").attr("disabled", true);
            $("#_2654_mf32b_amount").attr("disabled", true);
        } else if ($("#_2653_mf32b_currency").val() != "" || $("#_2654_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected_9").val("b").attr("selected", true);
            $("#div_mf32a_9").hide();
            $("#div_mf32b_9").show();
            $("#_2650_mf32a_date").attr("disabled", true);
            $("#_2651_mf32a_currency").attr("disabled", true);
            $("#_2652_mf32a_amount").attr("disabled", true);
            $("#_2653_mf32b_currency").attr("disabled", false);
            $("#_2654_mf32b_amount").attr("disabled", false);
        } else {
            $("#type_mf32_amount_collected_9").val("").attr("selected", true);
            $("#div_mf32a_9").hide();
            $("#div_mf32b_9").hide();
        }

        if ($("#_2660_of50a_account").val() != "" || $("#_2661_of50a_identifier_code").val() != "" || $("#_2662_of50a_address").val() != "") {
            $("#type_of50_payer_9").val("a").attr("selected", true);
            $("#div_of50a__9").show();
            $("#div_mf50f__9").hide();
            $("#div_mf50f_2_9").hide();
            $("#div_mf50f_3_9").hide();
            $("#div_mf50f_4_9").hide();
            $("#div_mf50k__9").hide();
            $("#_2660_of50a_account").attr("disabled", false);
            $("#_2661_of50a_identifier_code").attr("disabled", false);
            $("#_2662_of50a_address").attr("disabled", false);
            $("#_2663_of50f_account").attr("disabled", true);
            $("#_2664_mf50f_number").attr("disabled", true);
            $("#_2665_of50f_details").attr("disabled", true);
            $("#name_address_checkbox_2_50_9").attr("disabled", true);
            $("#name_address_checkbox_3_50_9").attr("disabled", true);
            $("#name_address_checkbox_4_50_9").attr("disabled", true);
        } else if ($("#_2663_of50f_account").val() != "" || $("#_2664_mf50f_number").val() != "" || $("#_2665_of50f_details").val() != "") {
            $("#type_of50_payer_9").val("f").attr("selected", true);
            $("#div_of50a__9").hide();
            $("#div_mf50f__9").show();
            $("#div_mf50f_2_9").show();
            $("#div_mf50f_3_9").show();
            $("#div_mf50f_4_9").show();
            $("#div_mf50k__9").hide();
            $("#_2660_of50a_account").attr("disabled", true);
            $("#_2661_of50a_identifier_code").attr("disabled", true);
            $("#_2662_of50a_address").attr("disabled", true);
            $("#_2663_of50f_account").attr("disabled", false);
            $("#_2664_mf50f_number").attr("disabled", false);
            $("#_2665_of50f_details").attr("disabled", false);
            $("#name_address_checkbox_2_50_9").attr("disabled", false);
            $("#name_address_checkbox_3_50_9").attr("disabled", false);
            $("#name_address_checkbox_4_50_9").attr("disabled", false);
        } else if ($("#_2672_of50k_account").val() != "" || $("#_2673_of50k_name_address").val() != "") {
            $("#type_of50_payer_9").val("k").attr("selected", true);
            $("#div_of50a__9").hide();
            $("#div_mf50f__9").hide();
            $("#div_mf50f_2_9").hide();
            $("#div_mf50f_3_9").hide();
            $("#div_mf50f_4_9").hide();
            $("#div_mf50k__9").show();
            //_2672_of50k_account
            $("#_2660_of50a_account").attr("disabled", true);
            $("#_2661_of50a_identifier_code").attr("disabled", true);
            $("#_2662_of50a_address").attr("disabled", true);
            $("#_2663_of50f_account").attr("disabled", true);
            $("#_2664_mf50f_number").attr("disabled", true);
            $("#_2665_of50f_details").attr("disabled", true);
            $("#_2672_of50k_account").attr("disabled", false);
            $("#_2673_of50k_name_address").attr("disabled", false);

        } else {
            $("#div_of50a__9").hide();
            $("#div_mf50f__9").hide();
            $("#div_mf50f_2_9").hide();
            $("#div_mf50f_3_9").hide();
            $("#div_mf50f_4_9").hide();
            $("#div_mf50k__9").hide();
            $("#name_address_checkbox_2_50_9").hide();
            $("#name_address_checkbox_3_50_9").hide();
            $("#name_address_checkbox_4_50_9").hide();
        }

        //of50_2_9
        if ($("#_2666_of50f_number").val() != "" || $("#_2667_of50f_details").val() != "") {
            $("#name_address_checkbox_2_50_9").prop("checked", true);
            $("#check_mf50f_2_9").show();
        } else {
            $("#name_address_checkbox_2_50_9").prop("checked", false);
            $("#check_mf50f_2_9").hide();
        }
        //mf50_3_9
        if ($("#_2668_of50f_number").val() != "" || $("#_2669_of50f_details").val() != "") {
            $("#name_address_checkbox_3_50_9").prop("checked", true);
            $("#check_mf50f_3_9").show();
        } else {
            $("#name_address_checkbox_3_50_9").prop("checked", false);
            $("#check_mf50f_3_9").hide();
        }
        //mf50_4_9
        if ($("#_2670_of50f_number").val() != "" || $("#_2671_of50f_details").val() != "") {
            $("#name_address_checkbox_4_50_9").prop("checked", true);
            $("#check_mf50f_4_9").show();
        } else {
            $("#name_address_checkbox_4_50_9").prop("checked", false);
            $("#check_mf50f_4_9").hide();
        }

        //of 52a/b/d_9
        if ($("#_2770_of52a_Party_Identifier").val() != "" || $("#_2771_of52a_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_9").val("a").attr("selected", true);
            $("#div_of52a__9").show();
            $("#div_of52b__9").hide();
            $("#div_of52d__9").hide();
            $("#_2770_of52a_Party_Identifier").attr("disabled", false);
            $("#_2771_of52a_Identifier_Code").attr("disabled", false);
            $("#_2772_of52b_Party_Identifier").attr("disabled", true);
            $("#_2773_of52b_Location").attr("disabled", true);
            $("#_2774_of52d_Party_Identifier").attr("disabled", true);
            $("#_2775_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_2772_of52b_Party_Identifier").val() != "" || $("#_2773_of52b_Location").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_9").val("b").attr("selected", true);
            $("#div_of52a__9").hide();
            $("#div_of52b__9").show();
            $("#div_of52d__9").hide();
            $("#_2770_of52a_Party_Identifier").attr("disabled", true);
            $("#_2771_of52a_Identifier_Code").attr("disabled", true);
            $("#_2772_of52b_Party_Identifier").attr("disabled", false);
            $("#_2773_of52b_Location").attr("disabled", false);
            $("#_2774_of52d_Party_Identifier").attr("disabled", true);
            $("#_2775_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_2774_of52d_Party_Identifier").val() != "" || $("#_2775_of52d_Name_and_Address").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_9").val("d").attr("selected", true);
            $("#div_of52a__9").hide();
            $("#div_of52b__9").hide();
            $("#div_of52d__9").show();
            $("#_2770_of52a_Party_Identifier").attr("disabled", true);
            $("#_2771_of52a_Identifier_Code").attr("disabled", true);
            $("#_2772_of52b_Party_Identifier").attr("disabled", true);
            $("#_2773_of52b_Location").attr("disabled", true);
            $("#_2774_of52d_Party_Identifier").attr("disabled", false);
            $("#_2775_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#type_of52_Sender_of_Cash_Letter_9").val("").attr("selected", true);
            $("#div_of52a__9").hide();
            $("#div_of52b__9").hide();
            $("#div_of52d__9").hide();
        }
        //mf59 /59f_9
        if ($("#_2780_mf59_account").val() != "" || $("#_2781_mf59_name_address").val() != "") {
            $("#type_of59_59a__9").val("59").attr("selected", true);
            $("#div_mf59__9").show();
            $("#div_mf59f__9").hide();
            $("#div_mf59f_2_9").hide();
            $("#div_mf59f_3_9").hide();
            $("#div_mf59f_4_9").hide();
            $("#_2780_mf59_account").attr("disabled", false);
            $("#_2781_mf59_name_address").attr("disabled", false);
            $("#_2782_mf59f_account").attr("disabled", true);
            $("#_2783_mf59f_number").attr("disabled", true);
            $("#_2784_mf59f_details").attr("disabled", true);
            $("#name_address_checkbox_2_9").attr("disabled", true);
            $("#name_address_checkbox_3_9").attr("disabled", true);
            $("#name_address_checkbox_4_9").attr("disabled", true);
        } else if ($("#_2782_mf59f_account").val() != "" || $("#_2783_mf59f_number").val() != "" || $("#_2784_mf59f_details").val() != "") {
            $("#type_of59_59a__9").val("59f").attr("selected", true);
            $("#div_mf59__9").hide();
            $("#div_mf59f__9").show();
            $("#div_mf59f_2_9").show();
            $("#div_mf59f_3_9").show();
            $("#div_mf59f_4_9").show();
            $("#_2780_mf59_account").attr("disabled", true);
            $("#_2781_mf59_name_address").attr("disabled", true);
            $("#_2782_mf59f_account").attr("disabled", false);
            $("#_2783_mf59f_number").attr("disabled", false);
            $("#_2784_mf59f_details").attr("disabled", false);
            $("#name_address_checkbox_2_9").attr("disabled", false);
            $("#name_address_checkbox_3_9").attr("disabled", false);
            $("#name_address_checkbox_4_9").attr("disabled", false);
        } else {
            $("#div_mf59__9").hide();
            $("#div_mf59f__9").hide();
            $("#div_mf59f_2_9").hide();
            $("#div_mf59f_3_9").hide();
            $("#div_mf59f_4_9").hide();
            $("#_2780_mf59_account").attr("disabled", true);
            $("#_2781_mf59_name_address").attr("disabled", true);
            $("#_2782_mf59f_account").attr("disabled", true);
            $("#_2783_mf59f_number").attr("disabled", true);
            $("#_2784_mf59f_details").attr("disabled", true);
            $("#name_address_checkbox_2_9").attr("disabled", true);
            $("#name_address_checkbox_3_9").attr("disabled", true);
            $("#name_address_checkbox_4_9").attr("disabled", true);
        }
        //mf59f_9_2
        if ($("#_2785_mf59f_number").val() != "" || $("#_2786_mf59f_details").val() != "") {
            $("#name_address_checkbox_2_9").prop("checked", true);
            $("#check_mf59f_2_9").show();
        } else {
            $("#name_address_checkbox_2_9").prop("checked", false);
            $("#check_mf59f_2_9").hide();
        }
        //mf59f_9_3
        if ($("#_2787_mf59f_number").val() != "" || $("#_2788_mf59f_details").val() != "") {
            $("#name_address_checkbox_3_9").prop("checked", true);
            $("#check_mf59f_3_9").show();
        } else {
            $("#name_address_checkbox_3_9").prop("checked", false);
            $("#check_mf59f_3_9").hide();
        }
        //mf59f_9_4
        if ($("#_2789_mf59f_number").val() != "" || $("#_2790_mf59f_details").val() != "") {
            $("#name_address_checkbox_4_9").prop("checked", true);
            $("#check_mf59f_4_9").show();
        } else {
            $("#name_address_checkbox_4_9").prop("checked", false);
            $("#check_mf59f_4_9").hide();
        }

        //mf32_10
        if ($("#_2960_mf32a_date").val() != "" || $("#_2961_mf32a_currency").val() != "" || $("#_2962_mf32a_amount").val() != "") {
            $("#type_mf32_amount_collected_10").val("a").attr("selected", true);
            $("#div_mf32a_10").show();
            $("#div_mf32b_10").hide();
            $("#_2960_mf32a_date").attr("disabled", false);
            $("#_2961_mf32a_currency").attr("disabled", false);
            $("#_2962_mf32a_amount").attr("disabled", false);
            $("#_2963_mf32b_currency").attr("disabled", true);
            $("#_2964_mf32b_amount").attr("disabled", true);
        } else if ($("#_2963_mf32b_currency").val() != "" || $("#_2964_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected_10").val("b").attr("selected", true);
            $("#div_mf32a_10").hide();
            $("#div_mf32b_10").show();
            $("#_2960_mf32a_date").attr("disabled", true);
            $("#_2961_mf32a_currency").attr("disabled", true);
            $("#_2962_mf32a_amount").attr("disabled", true);
            $("#_2963_mf32b_currency").attr("disabled", false);
            $("#_2964_mf32b_amount").attr("disabled", false);
        } else {
            $("#type_mf32_amount_collected_10").val("").attr("selected", true);
            $("#div_mf32a_10").hide();
            $("#div_mf32b_10").hide();
        }

        //of50_10
        if ($("#_2970_of50a_account").val() != "" || $("#_2971_of50a_identifier_code").val() != "" || $("#_2972_of50a_address").val() != "") {
            $("#type_of50_payer_10").val("a").attr("selected", true);
            $("#div_of50a__10").show();
            $("#div_mf50f__10").hide();
            $("#div_mf50f_2_10").hide();
            $("#div_mf50f_3_10").hide();
            $("#div_mf50f_4_10").hide();
            $("#div_mf50k__10").hide();
            $("#_2970_of50a_account").attr("disabled", false);
            $("#_2971_of50a_identifier_code").attr("disabled", false);
            $("#_2972_of50a_address").attr("disabled", false);
            $("#_2973_of50f_account").attr("disabled", true);
            $("#_2974_mf50f_number").attr("disabled", true);
            $("#_2975_of50f_details").attr("disabled", true);
            $("#name_address_checkbox_2_50_10").attr("disabled", true);
            $("#name_address_checkbox_3_50_10").attr("disabled", true);
            $("#name_address_checkbox_4_50_10").attr("disabled", true);
        } else if ($("#_2973_of50f_account").val() != "" || $("#_2974_mf50f_number").val() != "" || $("#_2975_of50f_details").val() != "") {
            $("#type_of50_payer_10").val("f").attr("selected", true);
            $("#div_of50a__10").hide();
            $("#div_mf50f__10").show();
            $("#div_mf50f_2_10").show();
            $("#div_mf50f_3_10").show();
            $("#div_mf50f_4_10").show();
            $("#div_mf50k__10").hide();
            $("#_2970_of50a_account").attr("disabled", true);
            $("#_2971_of50a_identifier_code").attr("disabled", true);
            $("#_2972_of50a_address").attr("disabled", true);
            $("#_2973_of50f_account").attr("disabled", false);
            $("#_2974_mf50f_number").attr("disabled", false);
            $("#_2975_of50f_details").attr("disabled", false);
            $("#name_address_checkbox_2_50_10").attr("disabled", false);
            $("#name_address_checkbox_3_50_10").attr("disabled", false);
            $("#name_address_checkbox_4_50_10").attr("disabled", false);
        } else if ($("#_2982_of50k_account").val() != "" || $("#_2983_of50k_name_address").val() != "") {
            $("#type_of50_payer_10").val("k").attr("selected", true);
            $("#div_of50a__10").hide();
            $("#div_mf50f__10").hide();
            $("#div_mf50f_2_10").hide();
            $("#div_mf50f_3_10").hide();
            $("#div_mf50f_4_10").hide();
            $("#div_mf50k__10").show();
            //_2982_of50k_account
            $("#_2970_of50a_account").attr("disabled", true);
            $("#_2971_of50a_identifier_code").attr("disabled", true);
            $("#_2972_of50a_address").attr("disabled", true);
            $("#_2973_of50f_account").attr("disabled", true);
            $("#_2974_mf50f_number").attr("disabled", true);
            $("#_2975_of50f_details").attr("disabled", true);
            $("#_2982_of50k_account").attr("disabled", false);
            $("#_2983_of50k_name_address").attr("disabled", false);

        } else {
            $("#div_of50a__10").hide();
            $("#div_mf50f__10").hide();
            $("#div_mf50f_2_10").hide();
            $("#div_mf50f_3_10").hide();
            $("#div_mf50f_4_10").hide();
            $("#div_mf50k__10").hide();
            $("#name_address_checkbox_2_50_10").hide();
            $("#name_address_checkbox_3_50_10").hide();
            $("#name_address_checkbox_4_50_10").hide();
        }
        //of50_2_10
        if ($("#_2976_of50f_number").val() != "" || $("#_2977_of50f_details").val() != "") {
            $("#name_address_checkbox_2_50_10").prop("checked", true);
            $("#check_mf50f_2_10").show();
        } else {
            $("#name_address_checkbox_2_50_10").prop("checked", false);
            $("#check_mf50f_2_10").hide();
        }
        //mf50_3_10
        if ($("#_2978_of50f_number").val() != "" || $("#_2979_of50f_details").val() != "") {
            $("#name_address_checkbox_3_50_10").prop("checked", true);
            $("#check_mf50f_3_10").show();
        } else {
            $("#name_address_checkbox_3_50_10").prop("checked", false);
            $("#check_mf50f_3_10").hide();
        }
        //mf50_4_10
        if ($("#_2980_of50f_number").val() != "" || $("#_2981_of50f_details").val() != "") {
            $("#name_address_checkbox_4_50_10").prop("checked", true);
            $("#check_mf50f_4_10").show();
        } else {
            $("#name_address_checkbox_4_50_10").prop("checked", false);
            $("#check_mf50f_4_10").hide();
        }

        //of 52a/b/d_10
        if ($("#_3080_of52a_Party_Identifier").val() != "" || $("#_3081_of52a_Identifier_Code").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_10").val("a").attr("selected", true);
            $("#div_of52a__10").show();
            $("#div_of52b__10").hide();
            $("#div_of52d__10").hide();
            $("#_3080_of52a_Party_Identifier").attr("disabled", false);
            $("#_3081_of52a_Identifier_Code").attr("disabled", false);
            $("#_3082_of52b_Party_Identifier").attr("disabled", true);
            $("#_3083_of52b_Location").attr("disabled", true);
            $("#_3084_of52d_Party_Identifier").attr("disabled", true);
            $("#_3085_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_3082_of52b_Party_Identifier").val() != "" || $("#_3083_of52b_Location").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_10").val("b").attr("selected", true);
            $("#div_of52a__10").hide();
            $("#div_of52b__10").show();
            $("#div_of52d__10").hide();
            $("#_3080_of52a_Party_Identifier").attr("disabled", true);
            $("#_3081_of52a_Identifier_Code").attr("disabled", true);
            $("#_3082_of52b_Party_Identifier").attr("disabled", false);
            $("#_3083_of52b_Location").attr("disabled", false);
            $("#_3084_of52d_Party_Identifier").attr("disabled", true);
            $("#_3085_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_3084_of52d_Party_Identifier").val() != "" || $("#_3085_of52d_Name_and_Address").val() != "") {
            $("#type_of52_Sender_of_Cash_Letter_10").val("d").attr("selected", true);
            $("#div_of52a__10").hide();
            $("#div_of52b__10").hide();
            $("#div_of52d__10").show();
            $("#_3080_of52a_Party_Identifier").attr("disabled", true);
            $("#_3081_of52a_Identifier_Code").attr("disabled", true);
            $("#_3082_of52b_Party_Identifier").attr("disabled", true);
            $("#_3083_of52b_Location").attr("disabled", true);
            $("#_3084_of52d_Party_Identifier").attr("disabled", false);
            $("#_3085_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#type_of52_Sender_of_Cash_Letter_10").val("").attr("selected", true);
            $("#div_of52a__10").hide();
            $("#div_of52b__10").hide();
            $("#div_of52d__10").hide();
        }
        //mf59 /59f_10
        if ($("#_3090_mf59_account").val() != "" || $("#_3091_mf59_name_address").val() != "") {
            $("#type_of59_59a__10").val("59").attr("selected", true);
            $("#div_mf59__10").show();
            $("#div_mf59f__10").hide();
            $("#div_mf59f_2_10").hide();
            $("#div_mf59f_3_10").hide();
            $("#div_mf59f_4_10").hide();
            $("#_3090_mf59_account").attr("disabled", false);
            $("#_3091_mf59_name_address").attr("disabled", false);
            $("#_3092_mf59f_account").attr("disabled", true);
            $("#_3093_mf59f_number").attr("disabled", true);
            $("#_3094_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_10").attr("disabled", true);
            $("name_address_checkbox_3_10").attr("disabled", true);
            $("name_address_checkbox_4_10").attr("disabled", true);
        } else if ($("#_3092_mf59f_account").val() != "" || $("#_3093_mf59f_number").val() != "" || $("#_3094_mf59f_details").val() != "") {
            $("#type_of59_59a__10").val("59f").attr("selected", true);
            $("#div_mf59__10").hide();
            $("#div_mf59f__10").show();
            $("#div_mf59f_2_10").show();
            $("#div_mf59f_3_10").show();
            $("#div_mf59f_4_10").show();
            $("#_3090_mf59_account").attr("disabled", true);
            $("#_3091_mf59_name_address").attr("disabled", true);
            $("#_3092_mf59f_account").attr("disabled", false);
            $("#_3093_mf59f_number").attr("disabled", false);
            $("#_3094_mf59f_details").attr("disabled", false);
            $("name_address_checkbox_2_10").attr("disabled", false);
            $("name_address_checkbox_3_10").attr("disabled", false);
            $("name_address_checkbox_4_10").attr("disabled", false);
        } else {
            $("#div_mf59__10").hide();
            $("#div_mf59f__10").hide();
            $("#div_mf59f_2_10").hide();
            $("#div_mf59f_3_10").hide();
            $("#div_mf59f_4_10").hide();
            $("#_3090_mf59_account").attr("disabled", true);
            $("#_3091_mf59_name_address").attr("disabled", true);
            $("#_3092_mf59f_account").attr("disabled", true);
            $("#_3093_mf59f_number").attr("disabled", true);
            $("#_3094_mf59f_details").attr("disabled", true);
            $("name_address_checkbox_2_10").attr("disabled", true);
            $("name_address_checkbox_3_10").attr("disabled", true);
            $("name_address_checkbox_4_10").attr("disabled", true);
        }
        //mf59f_10_2
        if ($("#_3095_mf59f_number").val() != "" || $("#_3096_mf59f_details").val() != "") {
            $("#name_address_checkbox_2_10").prop("checked", true);
            $("#check_mf59f_2_10").show();
        } else {
            $("#name_address_checkbox_2_10").prop("checked", false);
            $("#check_mf59f_2_10").hide();
        }
        //mf59f_10_3
        if ($("#_3097_mf59f_number").val() != "" || $("#_3098_mf59f_details").val() != "") {
            $("#name_address_checkbox_3_10").prop("checked", true);
            $("#check_mf59f_3_10").show();
        } else {
            $("#name_address_checkbox_3_10").prop("checked", false);
            $("#check_mf59f_3_10").hide();
        }
        //mf59f_10_4
        if ($("#_3099_mf59f_number").val() != "" || $("#_3100_mf59f_details").val() != "") {
            $("#name_address_checkbox_4_10").prop("checked", true);
            $("#check_mf59f_4_10").show();
        } else {
            $("#name_address_checkbox_4_10").prop("checked", false);
            $("#check_mf59f_4_10").hide();
        }

    }
</script>
