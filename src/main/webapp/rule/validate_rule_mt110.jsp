<%-- 
    Document   : validate_rule_mt110
    Created on : Apr 10, 2025, 2:16:33 PM
    Author     : rizkiyee
--%>

<script type="text/javascript">
console.log("validate_rule_mt110.jsp loaded");
    $(document).ready(function () {
        $("#form1").validate({
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
                _170_mf32a_date: "required",
                _171_mf32a_currency: "required",
                _172_mf32a_amount: "required",

                _480_mf32_date: "required",
                _481_mf32_currency: "required",
                _482_mf32_amount: "required",

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


                //mf32b
                _173_mf32b_currency: "required",
                _174_mf32b_amount: "required",
                _483_mf32b_currency: "required",
                _484_mf32b_amount: "required",
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

                //of53a
                _121_of53a_identifier_code: "required",
                _136_of54d_name_address: "required",

                //of50a
                
                _181_of50a_identifier_code: "required",
                _491_of50a_identifier_code: "required",
                _801_of50a_identifier_code: "required",
                _1111_of50a_identifier_code: "required",
                _1421_of50a_identifier_code: "required",
                _1731_of50a_identifier_code: "required",
                _2041_of50a_identifier_code: "required",
                _2351_of50a_identifier_code: "required",
                _2661_of50a_identifier_code: "required",
                _2971_of50a_identifier_code: "required",
                
                
                //of50f
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

                //53d
                _126_of53d_name_address: "required",

                //54a
                _131_of54a_identifier_code : "required",
                
                //50f
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

                //of50k
                _193_of50k_name_address: "required",
                _503_of50k_name_address: "required",
                _813_of50k_name_address: "required",
                _1123_of50k_name_address: "required",
                _1433_of50k_name_address: "required",
                _1743_of50k_name_address: "required",
                _2053_of50k_name_address: "required",
                _2363_of50k_name_address: "required",
                _2673_of50k_name_address: "required",
                _2983_of50k_name_address: "required",
        

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
                _301_mf59_name_address: "required",
                _611_mf59_name_address: "required",
                _921_mf59_name_address: "required",
                _1231_mf59_name_address: "required",
                _1541_mf59_name_address: "required",
                _1851_mf59_name_address: "required",
                _2161_mf59_name_address: "required",
                _2471_mf59_name_address: "required",
                _2781_mf59_name_address: "required",
                _3091_mf59_name_address: "required",

                //mf59f
                _303_mf59f_number: "required",
                _304_mf59f_details: "required",
                _305_mf59f_number: "required",
                _306_mf59f_details: "required",
                _307_mf59f_number: "required",
                _308_mf59f_details: "required",

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
                _170_mf32a_date: {required: "date harus diisi..!!"},
                _171_mf32a_currency: {required: "currency harus diisi..!!"},
                _172_mf32a_amount: {required: "amount harus diisi..!!"},
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

                //mf32b
                _173_mf32b_currency: {required: "currency harus diisi..!!"},
                _174_mf32b_amount: {required: "amount harus diisi..!!"},
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


                //of53a
                _121_of53a_identifier_code: {required: "identifier_code harus diisi..!!"},
                _136_of54d_name_address: {required: "name_address harus diisi..!!"},

                //53d
                _126_of53d_name_address: {required: "name_address harus diisi..!!"},

                //54a
                _131_of54a_identifier_code: {required: "identifier_code harus diisi..!!"},

                //of50a
                _181_of50a_identifier_code: {required: "identifier harus diisi..!!"},
                _491_of50a_identifier_code: {required: "identifier harus diisi..!!"},
                _801_of50a_identifier_code: {required: "identifier harus diisi..!!"},
                _1111_of50a_identifier_code: {required: "identifier harus diisi..!!"},
                _1421_of50a_identifier_code: {required: "identifier harus diisi..!!"},
                _1731_of50a_identifier_code: {required: "identifier harus diisi..!!"},
                _2041_of50a_identifier_code: {required: "identifier harus diisi..!!"},
                _2351_of50a_identifier_code: {required: "identifier harus diisi..!!"},
                _2661_of50a_identifier_code: {required: "identifier harus diisi..!!"},
                _2971_of50a_identifier_code: {required: "identifier harus diisi..!!"},
                


                //of50f
                _183_of50f_account: {required: "party_identifier harus diisi..!!"},
                _493_of50f_account: {required: "party_identifier harus diisi..!!"},
                _803_of50f_account: {required: "party_identifier harus diisi..!!"},
                _1113_of50f_account: {required: "party_identifier harus diisi..!!"},
                _1423_of50f_account: {required: "party_identifier harus diisi..!!"},
                _1733_of50f_account: {required: "party_identifier harus diisi..!!"},
                _2043_of50f_account: {required: "party_identifier harus diisi..!!"},
                _2353_of50f_account: {required: "party_identifier harus diisi..!!"},
                _2663_of50f_account: {required: "party_identifier harus diisi..!!"},
                _2973_of50f_account: {required: "party_identifier harus diisi..!!"},


                //of50k
                _192_of50k_account: {required: "party_identifier harus diisi..!!"},
                
                //of50f
                _184_mf50f_number: {required: "number harus diisi..!!"},
                _185_of50f_details: {required: "details harus diisi..!!"},
                _186_of50f_number: {required: "number harus diisi..!!"},
                _187_of50f_details: {required: "details harus diisi..!!"},
                _188_of50f_number: {required: "number harus diisi..!!"},
                _189_of50f_details: {required: "details harus diisi..!!"},
                _190_of50f_number:{required: "number harus diisi..!!"},
                _191_of50f_details: {required: "details harus diisi..!!"},
                _493_of50f_account: {required: "party_identifier harus diisi..!!"},
                _494_mf50f_number: {required: "number harus diisi..!!"},
                _495_of50f_details: {required: "details harus diisi..!!"},
                _496_of50f_number: {required: "number harus diisi..!!"},
                _497_of50f_details: {required: "details harus diisi..!!"},
                _498_of50f_number: {required: "number harus diisi..!!"},
                _499_of50f_details: {required: "details harus diisi..!!"},
                _500_of50f_number: {required: "number harus diisi..!!"},
                _501_of50f_details: {required: "details harus diisi..!!"},
                _803_of50f_account: {required: "party_identifier harus diisi..!!"},
                _804_mf50f_number: {required: "number harus diisi..!!"},
                _805_of50f_details: {required: "details harus diisi..!!"},
                _806_of50f_number: {required: "number harus diisi..!!"},
                _807_of50f_details: {required: "details harus diisi..!!"},
                _808_of50f_number: {required: "number harus diisi..!!"},
                _809_of50f_details: {required: "details harus diisi..!!"},
                _810_of50f_number: {required: "number harus diisi..!!"},
                _811_of50f_details: {required: "details harus diisi..!!"},
                _1113_of50f_account: {required: "party_identifier harus diisi..!!"},
                _1114_mf50f_number: {required: "number harus diisi..!!"},
                _1115_of50f_details: {required: "details harus diisi..!!"},
                _1116_of50f_number: {required: "number harus diisi..!!"},
                _1117_of50f_details: {required: "details harus diisi..!!"},
                _1118_of50f_number: {required: "number harus diisi..!!"},
                _1119_of50f_details: {required: "details harus diisi..!!"},
                _1120_of50f_number: {required: "number harus diisi..!!"},
                _1121_of50f_details: {required: "details harus diisi..!!"},
                _1423_of50f_account: {required: "party_identifier harus diisi..!!"},
                _1424_mf50f_number: {required: "number harus diisi..!!"},
                _1425_of50f_details: {required: "details harus diisi..!!"},
                _1426_of50f_number: {required: "number harus diisi..!!"},
                _1427_of50f_details: {required: "details harus diisi..!!"},
                _1428_of50f_number: {required: "number harus diisi..!!"},
                _1429_of50f_details: {required: "details harus diisi..!!"},
                _1430_of50f_number: {required: "number harus diisi..!!"},
                _1431_of50f_details: {required: "details harus diisi..!!"},
                _1733_of50f_account: {required: "party_identifier harus diisi..!!"},
                _1734_mf50f_number: {required: "number harus diisi..!!"},
                _1735_of50f_details: {required: "details harus diisi..!!"},
                _1736_of50f_number: {required: "number harus diisi..!!"},
                _1737_of50f_details: {required: "details harus diisi..!!"},
                _1738_of50f_number: {required: "number harus diisi..!!"},
                _1739_of50f_details: {required: "details harus diisi..!!"},
                _1740_of50f_number: {required: "number harus diisi..!!"},
                _1741_of50f_details: {required: "details harus diisi..!!"},
                _2043_of50f_account: {required: "party_identifier harus diisi..!!"},
                _2044_mf50f_number: {required: "number harus diisi..!!"},
                _2045_of50f_details: {required: "details harus diisi..!!"},
                _2046_of50f_number: {required: "number harus diisi..!!"},
                _2047_of50f_details: {required: "details harus diisi..!!"},
                _2048_of50f_number: {required: "number harus diisi..!!"},
                _2049_of50f_details: {required: "details harus diisi..!!"},
                _2050_of50f_number: {required: "number harus diisi..!!"},
                _2051_of50f_details: {required: "details harus diisi..!!"},
                _2353_of50f_account: {required: "party_identifier harus diisi..!!"},
                _2354_mf50f_number: {required: "number harus diisi..!!"},
                _2355_of50f_details: {required: "details harus diisi..!!"},
                _2356_of50f_number: {required: "number harus diisi..!!"},
                _2357_of50f_details: {required: "details harus diisi..!!"},
                _2358_of50f_number: {required: "number harus diisi..!!"},
                _2359_of50f_details: {required: "details harus diisi..!!"},
                _2360_of50f_number: {required: "number harus diisi..!!"},
                _2361_of50f_details: {required: "details harus diisi..!!"},
                _2663_of50f_account: {required: "party_identifier harus diisi..!!"},
                _2664_mf50f_number: {required: "number harus diisi..!!"},
                _2665_of50f_details: {required: "details harus diisi..!!"},
                _2666_of50f_number: {required: "number harus diisi..!!"},
                _2667_of50f_details: {required: "details harus diisi..!!"},
                _2668_of50f_number: {required: "number harus diisi..!!"},
                _2669_of50f_details: {required: "details harus diisi..!!"},
                _2670_of50f_number: {required: "number harus diisi..!!"},
                _2671_of50f_details: {required: "details harus diisi..!!"},
                _2973_of50f_account: {required: "party_identifier harus diisi..!!"},
                _2974_mf50f_number: {required: "number harus diisi..!!"},
                _2975_of50f_details: {required: "details harus diisi..!!"},
                _2976_of50f_number: {required: "number harus diisi..!!"},
                _2977_of50f_details: {required: "details harus diisi..!!"},
                _2978_of50f_number: {required: "number harus diisi..!!"},
                _2979_of50f_details: {required: "details harus diisi..!!"},
                _2980_of50f_number: {required: "number harus diisi..!!"},
                _2981_of50f_details: {required: "details harus diisi..!!"},
                
                //of50k
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

                //mf59
                type_of59_59a_name_address: {required: "type_of59 harus diisi..!!"},
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

                //mf59f
                _303_mf59f_number: {required: "number harus diisi..!!"},
                _304_mf59f_details: {required: "details harus diisi..!!"},
                _305_mf59f_number: {required: "number harus diisi..!!"},
                _306_mf59f_details: {required: "details harus diisi..!!"},
                _307_mf59f_number: {required: "number harus diisi..!!"},
                _308_mf59f_details: {required: "details harus diisi..!!"},
                _613_mf59f_number: {required: "number harus diisi..!!"},
                _614_mf59f_details: {required: "details harus diisi..!!"},
                _615_mf59f_number: {required: "number harus diisi..!!"},
                _616_mf59f_details: {required: "details harus diisi..!!"},
                _617_mf59f_number: {required: "number harus diisi..!!"},
                _618_mf59f_details: {required: "details harus diisi..!!"},
                _619_mf59f_number: {required: "number harus diisi..!!"},
                _620_mf59f_details: {required: "details harus diisi..!!"},
                _923_mf59f_number: {required: "number harus diisi..!!"},
                _924_mf59f_details: {required: "details harus diisi..!!"},
                _925_mf59f_number: {required: "number harus diisi..!!"},
                _926_mf59f_details: {required: "details harus diisi..!!"},
                _927_mf59f_number: {required: "number harus diisi..!!"},
                _928_mf59f_details: {required: "details harus diisi..!!"},
                _929_mf59f_number: {required: "number harus diisi..!!"},
                _930_mf59f_details: {required: "details harus diisi..!!"},
                _1233_mf59f_number: {required: "number harus diisi..!!"},
                _1234_mf59f_details: {required: "details harus diisi..!!"},
                _1235_mf59f_number: {required: "number harus diisi..!!"},
                _1236_mf59f_details: {required: "details harus diisi..!!"},
                _1237_mf59f_number: {required: "number harus diisi..!!"},
                _1238_mf59f_details: {required: "details harus diisi..!!"},
                _1239_mf59f_number: {required: "number harus diisi..!!"},
                _1240_mf59f_details: {required: "details harus diisi..!!"},
                _1543_mf59f_number: {required: "number harus diisi..!!"},
                _1544_mf59f_details: {required: "details harus diisi..!!"},
                _1545_mf59f_number: {required: "number harus diisi..!!"},
                _1546_mf59f_details: {required: "details harus diisi..!!"},
                _1547_mf59f_number: {required: "number harus diisi..!!"},
                _1548_mf59f_details: {required: "details harus diisi..!!"},
                _1549_mf59f_number: {required: "number harus diisi..!!"},
                _1550_mf59f_details: {required: "details harus diisi..!!"},
                _1853_mf59f_number: {required: "number harus diisi..!!"},
                _1854_mf59f_details: {required: "details harus diisi..!!"},
                _1855_mf59f_number: {required: "number harus diisi..!!"},
                _1856_mf59f_details: {required: "details harus diisi..!!"},
                _1857_mf59f_number: {required: "number harus diisi..!!"},
                _1858_mf59f_details: {required: "details harus diisi..!!"},
                _1859_mf59f_number: {required: "number harus diisi..!!"},
                _1860_mf59f_details: {required: "details harus diisi..!!"},
                _2163_mf59f_number: {required: "number harus diisi..!!"},
                _2164_mf59f_details: {required: "details harus diisi..!!"},
                _2165_mf59f_number: {required: "number harus diisi..!!"},
                _2166_mf59f_details: {required: "details harus diisi..!!"},
                _2167_mf59f_number: {required: "number harus diisi..!!"},
                _2168_mf59f_details: {required: "details harus diisi..!!"},
                _2169_mf59f_number: {required: "number harus diisi..!!"},
                _2170_mf59f_details: {required: "details harus diisi..!!"},
                _2473_mf59f_number: {required: "number harus diisi..!!"},
                _2474_mf59f_details: {required: "details harus diisi..!!"},
                _2475_mf59f_number: {required: "number harus diisi..!!"},
                _2476_mf59f_details: {required: "details harus diisi..!!"},
                _2477_mf59f_number: {required: "number harus diisi..!!"},
                _2478_mf59f_details: {required: "details harus diisi..!!"},
                _2479_mf59f_number: {required: "number harus diisi..!!"},
                _2480_mf59f_details: {required: "details harus diisi..!!"},
                _2783_mf59f_number: {required: "number harus diisi..!!"},
                _2784_mf59f_details: {required: "details harus diisi..!!"},
                _2785_mf59f_number: {required: "number harus diisi..!!"},
                _2786_mf59f_details: {required: "details harus diisi..!!"},
                _2787_mf59f_number: {required: "number harus diisi..!!"},
                _2788_mf59f_details: {required: "details harus diisi..!!"},
                _2789_mf59f_number: {required: "number harus diisi..!!"},
                _2790_mf59f_details: {required: "details harus diisi..!!"},
                _3093_mf59f_number: {required: "number harus diisi..!!"},
                _3094_mf59f_details: {required: "details harus diisi..!!"},
                _3095_mf59f_number: {required: "number harus diisi..!!"},
                _3096_mf59f_details: {required: "details harus diisi..!!"},
                _3097_mf59f_number: {required: "number harus diisi..!!"},
                _3098_mf59f_details: {required: "details harus diisi..!!"},
                _3099_mf59f_number: {required: "number harus diisi..!!"},
                _3100_mf59f_details: {required: "details harus diisi..!!"},
                
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
                alert(error.html());
            },
            showErrors: function (errorMap, errorList) {
                this.defaultShowErrors();
            }
        });
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
        $("#_303_mf59f_number").prop("required", false);
        $("#_304_mf59f_details").prop("required", false);
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
                $("#_300_mf59_account").attr("disabled", true);
                $("#_301_mf59_name_address").attr("disabled", true);
                $("#_302_mf59f_account").attr("disabled", true);
                $("#_303_mf59f_number").attr("disabled", true);
                $("#_304_mf59f_details").attr("disabled", true);
                $("#check_mf59f_2").attr("disabled", true);
                $("#check_mf59f_3").attr("disabled", true);
                $("#check_mf59f_4").attr("disabled", true);
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

        //of53_a_b_d
         console.log("MASUK VIEW RULE")
        if ($("#_120_of53a_party_identifier").val() != "" || $("#_121_of53a_identifier_code").val() != ""){
            console.log("#_121_of53a_identifier_code");
            $("#type_of53_").val("a").attr("selected",true);
            $("#div_of53a_").show();
            $("#div_of53b_").hide();
            $("#div_of53d_").hide();
            $("#_120_of53a_party_identifier").attr("disabled", false);
            $("#_121_of53a_identifier_code").attr("disabled", false);
            $("#_123_of53b_party_identifier").attr("disabled", true);
            $("#_124_of53b_location").attr("disabled", true);
            $("#_125_of53d_party_identifier").attr("disabled", true);
            $("#_126_of53d_name_address").attr("disabled", true);
        } else if ($("#_123_of53b_party_identifier").val() != "" || $("#_124_of53b_location").val() != ""){
            $("#type_of53_").val("b").attr("selected",true);
            $("#div_of53a_").hide();
            $("#div_of53b_").show();
            $("#div_of53d_").hide();
            $("#_120_of53a_party_identifier").attr("disabled", true);
            $("#_121_of53a_identifier_code").attr("disabled", true);
            $("#_123_of53b_party_identifier").attr("disabled", false);
            $("#_124_of53b_location").attr("disabled", false);
            $("#_125_of53d_party_identifier").attr("disabled", true);
            $("#_126_of53d_name_address").attr("disabled", true);
        } else if ($("#_125_of53d_party_identifier").val() != "" || $("#_126_of53d_name_address").val() != ""){
            $("#type_of53_").val("d").attr("selected",true);
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#div_of53d_").show();
            $("#_120_of53a_party_identifier").attr("disabled", true);
            $("#_121_of53a_identifier_code").attr("disabled", true);
            $("#_123_of53b_party_identifier").attr("disabled", true);
            $("#_124_of53b_location").attr("disabled", true);
            $("#_125_of53d_party_identifier").attr("disabled", false);
            $("#_126_of53d_name_address").attr("disabled", false);
        } else{
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
    if ($("#_130_of54a_party_identifier").val() != "" || $("#_131_of54a_identifier_code").val() != ""){
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
    } else if ($("#_133_of54b_party_identifier").val() != "" || $("#_134_of54b_location").val() != ""){
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
    } else if ($("#_135_of54d_party_identifier").val() != "" || $("#_136_of54d_name_address").val() != ""){
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
    } else{
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


    //MF50 script 2
    if ($("#_180_of50a_account").val() != "" || $("#_181_of50a_identifier_code").val() != "" || $("#_182_of50a_address").vaL() != "") {
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
            $("#_256_mf50k_name_address").attr("disabled", true);
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
            $("#_256_mf50k_name_address").attr("disabled", true);
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
            $("#_256_mf50k_name_address").attr("disabled", false);
    }
    // If none of the conditions are met, hide all divs and disable all related fields
    else {
    $("#div_of50a_").hide();
            $("#div_mf50f_").hide();
            $("#div_mf50f_2").hide();
            $("#div_mf50f_3").hide();
            $("#div_mf50f_4").hide();
            $("#div_mf50k_").hide();
            //name_address_checkbox_2_50
            $("check_mf50f_2").attr("disabled", true);
            $("#_180_of50a_account").attr("disabled", true);
            $("#_181_of50a_identifier_code").attr("disabled", true);
            $("#_183_of50f_account").attr("disabled", true);
            $("#_184_mf50f_number").attr("disabled", true);
            $("#_185_of50f_details").attr("disabled", true);
            $("#check_mf50f_2").attr("disabled", true);
            $("#check_mf50f_3").attr("disabled", true);
            $("#check_mf50f_4").attr("disabled", true);
    }

    //mf50f_2
    if ($("#_186_of50f_number").val() != "" || $("#_187_of50f_details").val() != "") {
    $("#name_address_checkbox_2_50").prop("checked", true);
            $("#check_mf50f_2").show();
            $("#_186_of50f_number").prop("required", true);
            $("#_187_of50f_details").prop("required", true);
            
    } else {
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
    $("#check_mf50f_4").hide();
            $("#_190_of50f_number").prop("required", false);
            $("#_191_of50f_details").prop("required", false);
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
            $("#_300_mf59_account").attr("disabled", true);
            $("#_301_mf59_name_address").attr("disabled", true);
            $("#_182_mf59a_account").attr("disabled", true);
            $("#_183_mf59a_identifier_code").attr("disabled", true);
            $("#_302_mf59f_account").attr("disabled", true);
            $("#_303_mf59f_number").attr("disabled", true);
            $("#_304_mf59f_details").attr("disabled", true);
            $("#check_mf59f_2").attr("disabled", true);
            $("#check_mf59f_3").attr("disabled", true);
            $("#check_mf59f_4").attr("disabled", true);
    }

    //mf59_2
    if($("#_305_mf59f_number").val() != "" || $("#_306_mf59f_details").val() != ""){
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
    if($("#_307_mf59f_number").val() != "" || $("#_308_mf59f_details").val() != ""){
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
    if($("#_309_mf59f_number").val() != "" || $("#_310_mf59f_details").val() != ""){
        $("#name_address_checkbox_4").prop("checked", true);
        $("#check_mf59f_4").show();
        $("#_309_mf59f_number").prop("required", true);
        $("#_310_mf59f_details").prop("required", true);
    } else {
        $("#check_mf59f_4").hide();
        $("#_309_mf59f_number").prop("required", false);
        $("#_310_mf59f_details").prop("required", false);
    }
        
        
        console.log("diantara 59f dan 32_2");
        //mf32a,b_2
        if($("#_483_mf32b_currency").val() != "" || $("#_484_mf32b_amount").val() != "") {
            $("#type_mf32_amount_collected_2").val("b").attr("selected", true);
            $("#div_mf32a_2").hide();
            $("#div_mf32b_2").show();
            $("#_480_mf32a_date").attr("disabled", true);
            $("#_481_mf32a_currency").attr("disabled", true);
            $("#_482_mf32a_amount").attr("disabled", true);
            $("#_483_mf32b_currency").attr("disabled", false);
            $("#_484_mf32b_amount").attr("disabled", false);
        } 
    });
</script>
