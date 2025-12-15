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
                _183_of50f_account: {
                    required: function() {
                        return $("#type_of50_payer").val() === "f";
                    }
                },
                _184_mf50f_number: {
                    required: function() {
                        return $("#type_of50_payer").val() === "f";
                    }
                },
                _185_of50f_details: {
                    required: function() {
                        return $("#type_of50_payer").val() === "f";
                    }
                },
                _186_of50f_number: {
                    required: function() {
                        return $("#type_of50_payer").val() === "f" && $("#name_address_checkbox_2_50").is(":checked");
                    }
                },
                _187_of50f_details: {
                    required: function() {
                        return $("#type_of50_payer").val() === "f" && $("#name_address_checkbox_2_50").is(":checked");
                    }
                },
                _188_of50f_number: {
                    required: function() {
                        return $("#type_of50_payer").val() === "f" && $("#name_address_checkbox_3_50").is(":checked");
                    }
                },
                _189_of50f_details: {
                    required: function() {
                        return $("#type_of50_payer").val() === "f" && $("#name_address_checkbox_3_50").is(":checked");
                    }
                },
                _190_of50f_number: {
                    required: function() {
                        return $("#type_of50_payer").val() === "f" && $("#name_address_checkbox_4_50").is(":checked");
                    }
                },
                _191_of50f_details: {
                    required: function() {
                        return $("#type_of50_payer").val() === "f" && $("#name_address_checkbox_4_50").is(":checked");
                    }
                },
                
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
                _305_mf59f_number: {
                    required: function() {
                        return $("#name_address_checkbox_2").is(":checked");
                    }
                },
                _306_mf59f_details: {
                    required: function() {
                        return $("#name_address_checkbox_2").is(":checked");
                    }
                },
                _307_mf59f_number: {
                    required: function() {
                        return $("#name_address_checkbox_3").is(":checked");
                    }
                },
                _308_mf59f_details: {
                    required: function() {
                        return $("#name_address_checkbox_3").is(":checked");
                    }
                },
                _309_mf59f_number: {
                    required: function() {
                        return $("#name_address_checkbox_4").is(":checked");
                    }
                },
                _310_mf59f_details: {
                    required: function() {
                        return $("#name_address_checkbox_4").is(":checked");
                    }
                },

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
                
                sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
                receiver_institution: {required: "receiver_institution must be filled..!!"},
                priority: {required: "priority must be filled..!!"},
                _010_mf20_senders_reference: {required: "senders_reference must be filled..!!"},
                //mf21
                _151_mf21_cheque_number: {required: "cheque_number must be filled..!!"},
                _461_mf21_cheque_number: {required: "cheque_number must be filled..!!"},
                _771_mf21_cheque_number: {required: "cheque_number must be filled..!!"},
                _1081_mf21_cheque_number: {required: "cheque_number must be filled..!!"},
                _1391_mf21_cheque_number: {required: "cheque_number must be filled..!!"},
                _1701_mf21_cheque_number: {required: "cheque_number must be filled..!!"},
                _2011_mf21_cheque_number: {required: "cheque_number must be filled..!!"},
                _2321_mf21_cheque_number: {required: "cheque_number must be filled..!!"},
                _2631_mf21_cheque_number: {required: "cheque_number must be filled..!!"},
                _2941_mf21_cheque_number: {required: "cheque_number must be filled..!!"},

                //mf30a
                _161_mf30_date_of_issue: {required: "date_of_issue must be filled..!!"},
                _471_mf30_date_of_issue: {required: "date_of_issue must be filled..!!"},
                _781_mf30_date_of_issue: {required: "date_of_issue must be filled..!!"},
                _1091_mf30_date_of_issue: {required: "date_of_issue must be filled..!!"},
                _1401_mf30_date_of_issue: {required: "date_of_issue must be filled..!!"},
                _1711_mf30_date_of_issue: {required: "date_of_issue must be filled..!!"},
                _2021_mf30_date_of_issue: {required: "date_of_issue must be filled..!!"},
                _2331_mf30_date_of_issue: {required: "date_of_issue must be filled..!!"},
                _2641_mf30_date_of_issue: {required: "date_of_issue must be filled..!!"},
                _2951_mf30_date_of_issue: {required: "date_of_issue must be filled..!!"},

                //mf32a
                type_mf32_amount_collected: {required: "type_mf32_amount_collected must be filled..!!"},
                type_mf32_amount_collected_2: {required: "type_mf32_amount_collected_2 must be filled..!!"},
                type_mf32_amount_collected_3: {required: "type_mf32_amount_collected_3 must be filled..!!"},
                type_mf32_amount_collected_4: {required: "type_mf32_amount_collected_4 must be filled..!!"},
                type_mf32_amount_collected_5: {required: "type_mf32_amount_collected_5 must be filled..!!"},
                type_mf32_amount_collected_6: {required: "type_mf32_amount_collected_6 must be filled..!!"},
                type_mf32_amount_collected_7: {required: "type_mf32_amount_collected_7 must be filled..!!"},
                type_mf32_amount_collected_8: {required: "type_mf32_amount_collected_8 must be filled..!!"},
                type_mf32_amount_collected_9: {required: "type_mf32_amount_collected_9 must be filled..!!"},
                type_mf32_amount_collected_10: {required: "type_mf32_amount_collected_10 must be filled..!!"},
                
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
                _173_mf32b_currency: {required: "currency must be filled..!!"},
                _174_mf32b_amount: {required: "amount must be filled..!!"},
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
                _183_of50f_account: {required: "of50f account must be filled..!!"},
                _184_mf50f_number: {required: "of50f number must be filled..!!"},
                _185_of50f_details: {required: "of50f details must be filled!"},
                _186_of50f_number: {required: "OF50F Number (Detail 2) must be selected!"},
                _187_of50f_details: {required: "OF50F Details (Detail 2) must be filled!"},
                _188_of50f_number: {required: "OF50F Number (Detail 3) must be selected!"},
                _189_of50f_details: {required: "OF50F Details (Detail 3) must be filled!"},
                _190_of50f_number: {required: "OF50F Number (Detail 4) must be selected!"},
                _191_of50f_details: {required: "OF50F Details (Detail 4) must be filled!"},
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
                type_of59_59a_: {required: "type_mf59 must be filled..!!"},
                _300_mf59_account: {required: "mf59a account must be filled..!!"},
                _301_mf59_name_address: {required: "mf59a name address must be filled..!!"},
                _302_mf59f_account: {required: "mf59a account must be filled..!!"},
                _303_mf59f_number: {required: "mf59a number must be filled..!!"},
                _304_mf59f_details: {required: "mf59a details must be filled..!!"},
                _305_mf59f_number: {required: "mf59a number must be filled..!!"},
                _306_mf59f_details: {required: "mf59a details must be filled..!!"},
                _307_mf59f_number: {required: "mf59a number must be filled..!!"},
                _308_mf59f_details: {required: "mf59a details must be filled..!!"},
                _309_mf59f_number: {required: "mf59a number must be filled..!!"},
                _310_mf59f_details: {required: "mf59a details must be filled..!!"},
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
    $(document).ready(function(){
        console.log("MASUK RULE");
        
        // OF53 (Sender's Correspondent) - A, B, D options
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

        // OF54 (Receiver's Correspondent) - A, B, D options
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
        $("#_170_mf32a_date").attr("disabled", true);
        $("#_171_mf32a_currency").attr("disabled", true);
        $("#_172_mf32a_amount").attr("disabled", true);
        $("#_173_mf32b_currency").attr("disabled", true);
        $("#_174_mf32b_amount").attr("disabled", true);

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
        $("#_192_of50k_account").attr("disabled", true);
        $("#_193_of50k_name_address").attr("disabled", true);
        
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

// OF52A (Drawer Bank) - A, B, D options
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

        // MF59 (Payee) - 59 or 59F option
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
                $("#div_mf59f_").hide();
                $("#div_mf59f_2").hide();
                $("#div_mf59f_3").hide();
                $("#div_mf59f_4").hide();
                $("#check_mf59f_2").hide();
                $("#check_mf59f_3").hide();
                $("#check_mf59f_4").hide();
            }
        });

        // MF59F checkbox handlers
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
        console.log("MASUK VIEW RULE");
        
        // Special Rate Check
        if ($("#special_rate").val() != "") {
            $("#special_rate_checkbox").prop("checked", true);
            $("#check_special_rate").show();
            $("#special_rate").prop("required", true);
        } else {
            $("#check_special_rate").hide();
            $("#special_rate").prop("required", false);
        }
        
        // OF53 (Sender's Correspondent) - A, B, D options
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

        // OF50 (Payer) - A, F, K options
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
            $("#_182_of50a_address").attr("disabled", false);
            $("#_183_of50f_account").attr("disabled", true);
            $("#_184_mf50f_number").attr("disabled", true);
            $("#_185_of50f_details").attr("disabled", true);
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
            $("#_182_of50a_address").attr("disabled", true);
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
            $("#_182_of50a_address").attr("disabled", true);
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
        // OF50F - Checkbox 2
        if ($("#_186_of50f_number").val() != "" || $("#_187_of50f_details").val() != "") {
            $("#name_address_checkbox_2_50").prop("checked", true);
            $("#check_mf50f_2").show();
            $("#_186_of50f_number").attr("disabled", false);
            $("#_187_of50f_details").attr("disabled", false);
        } else {
            $("#name_address_checkbox_2_50").prop("checked", false);
            $("#check_mf50f_2").hide();
            $("#_186_of50f_number").attr("disabled", true);
            $("#_187_of50f_details").attr("disabled", true);
        }

        // OF50F - Checkbox 3
        if ($("#_188_of50f_number").val() != "" || $("#_189_of50f_details").val() != "") {
            $("#name_address_checkbox_3_50").prop("checked", true);
            $("#check_mf50f_3").show();
            $("#_188_of50f_number").attr("disabled", false);
            $("#_189_of50f_details").attr("disabled", false);
        } else {
            $("#name_address_checkbox_3_50").prop("checked", false);
            $("#check_mf50f_3").hide();
            $("#_188_of50f_number").attr("disabled", true);
            $("#_189_of50f_details").attr("disabled", true);
        }

        // OF50F - Checkbox 4
        if ($("#_190_of50f_number").val() != "" || $("#_191_of50f_details").val() != "") {
            $("#name_address_checkbox_4_50").prop("checked", true);
            $("#check_mf50f_4").show();
            $("#_190_of50f_number").attr("disabled", false);
            $("#_191_of50f_details").attr("disabled", false);
        } else {
            $("#name_address_checkbox_4_50").prop("checked", false);
            $("#check_mf50f_4").hide();
            $("#_190_of50f_number").attr("disabled", true);
            $("#_191_of50f_details").attr("disabled", true);
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
            $("#div_mf59f_").hide();
            $("#div_mf59f_2").hide();
            $("#div_mf59f_3").hide();
            $("#div_mf59f_4").hide();
            $("#check_mf59f_2").hide();
            $("#check_mf59f_3").hide();
            $("#check_mf59f_4").hide();
        }
        
        // MF59F - Checkbox 2
        if ($("#_305_mf59f_number").val() != "" || $("#_306_mf59f_details").val() != "") {
            $("#name_address_checkbox_2").prop("checked", true);
            $("#check_mf59f_2").show();
            $("#_305_mf59f_number").attr("disabled", false);
            $("#_306_mf59f_details").attr("disabled", false);
        } else {
            $("#name_address_checkbox_2").prop("checked", false);
            $("#check_mf59f_2").hide();
            $("#_305_mf59f_number").attr("disabled", true);
            $("#_306_mf59f_details").attr("disabled", true);
        }

        // MF59F - Checkbox 3
        if ($("#_307_mf59f_number").val() != "" || $("#_308_mf59f_details").val() != "") {
            $("#name_address_checkbox_3").prop("checked", true);
            $("#check_mf59f_3").show();
            $("#_307_mf59f_number").attr("disabled", false);
            $("#_308_mf59f_details").attr("disabled", false);
        } else {
            $("#name_address_checkbox_3").prop("checked", false);
            $("#check_mf59f_3").hide();
            $("#_307_mf59f_number").attr("disabled", true);
            $("#_308_mf59f_details").attr("disabled", true);
        }

        // MF59F - Checkbox 4
        if ($("#_309_mf59f_number").val() != "" || $("#_310_mf59f_details").val() != "") {
            $("#name_address_checkbox_4").prop("checked", true);
            $("#check_mf59f_4").show();
            $("#_309_mf59f_number").attr("disabled", false);
            $("#_310_mf59f_details").attr("disabled", false);
        } else {
            $("#name_address_checkbox_4").prop("checked", false);
            $("#check_mf59f_4").hide();
            $("#_309_mf59f_number").attr("disabled", true);
            $("#_310_mf59f_details").attr("disabled", true);
        }
        
        // Trigger validate_rule function for loop data if exists
        if (typeof validate_rule === 'function') {
            validate_rule();
        }      

    });
    
</script>

<script>
    $(document).ready(function () {
        checkForExistingData();



        let loopCounter = 1;

        // Set maximum allowed loops to 10
        const MAX_LOOPS = 10;

        // Store the base IDs and find the highest ID number
        let baseIdMap = {};
        let highestIdNumber = 0;

        // Find the highest ID number in the original form
        $('#loop-set').find('[id^="_"]').each(function () {
            let id = $(this).attr('id');
            let baseIdMatch = id.match(/^_(\d+)_(.+)$/);
            if (baseIdMatch) {
                let numPart = parseInt(baseIdMatch[1]);
                let namePart = baseIdMatch[2];
                baseIdMap[namePart] = numPart;

                // Keep track of highest numeric ID
                if (numPart > highestIdNumber) {
                    highestIdNumber = numPart;
                }
            }
        });


        // Initialize event handlers for the first form set
        initializeDropdowns($('#loop-set'));

        // Initialize datepickers for the first form set with a small delay
        setTimeout(function () {
            initializeDatepickers($('#loop-set'));
        }, 100);

        initializeCurrencyFormatting($('#loop-set'));


        // Initialize default visibility states
        $('#type_mf32_amount_collected').trigger('change');
        $('#type_of50_payer').trigger('change');
        $('#type_of52_Sender_of_Cash_Letter').trigger('change');
        $('#type_of59_59a_').trigger('change');

        // Hide checkbox content divs initially
        $('div[id^="check_mf59f_"]').hide();
        $('div[id^="check_mf50f_"]').hide();

        // Check if we have pre-generated data
        // We'll use a function to determine if there's data beyond the first loop
        //checkForExistingData();

        // Add button click handler
        $('#renaa').click(function (e) {
            e.preventDefault();

            // Check if we've reached the maximum number of loops
            if (loopCounter >= MAX_LOOPS) {
                alert('Maximum limit of ' + MAX_LOOPS + ' entries reached.');
                return;
            }

            // Increment counter for unique IDs
            loopCounter++;

            // Clone the loop set
            let $newSet = $('#loop-set').clone(true);

            // Update the main container ID
            $newSet.attr('id', 'loop-set-' + loopCounter);

            // Update dropdown IDs
            $newSet.find('select[id^="type_"]').each(function () {
                let oldId = $(this).attr('id');
                let newId = oldId + '_' + loopCounter;
                $(this).attr('id', newId);

                // Also update any labels that point to this ID
                $newSet.find('label[for="' + oldId + '"]').attr('for', newId);
            });

            // Update div IDs
            $newSet.find('div[id^="div_"], div[id^="check_"]').each(function () {
                let oldId = $(this).attr('id');
                if (oldId && oldId !== 'loop-container') {
                    let newId = oldId + '_' + loopCounter;
                    $(this).attr('id', newId);
                }
            });

            // Calculate the offset for incrementing the numeric IDs
            // Each new form set will have IDs starting from (highestIdNumber * loopCounter)
            let idOffset = highestIdNumber * (loopCounter - 1);

            // Update field IDs with incrementing numeric part
            $newSet.find('[id^="_"]').each(function () {
                let oldId = $(this).attr('id');
                let idMatch = oldId.match(/^_(\d+)_(.+)$/);

                if (idMatch) {
                    let numPart = parseInt(idMatch[1]);
                    let namePart = idMatch[2];

                    // Create the new ID with incremented number
                    // Add the offset to ensure IDs are always higher than the highest in the original form
                    let newNum = numPart + idOffset;
                    let newId = '_' + newNum + '_' + namePart;
                    $(this).attr('id', newId);

                    // Update the name attribute too
                    if ($(this).attr('name') === oldId) {
                        $(this).attr('name', newId);
                    }
                }
            });

            // Update all remaining input, select, and textarea elements
            $newSet.find('input, select, textarea').each(function () {
                // Skip elements we've already processed
                if (!$(this).attr('id') || !$(this).attr('id').startsWith('_')) {
                    let oldName = $(this).attr('name');
                    let oldId = $(this).attr('id');

                    if (oldName && !oldName.startsWith('_')) {
                        let newName = oldName + '_' + loopCounter;
                        $(this).attr('name', newName);
                    }

                    if (oldId && !oldId.startsWith('_') && !oldId.startsWith('type_')) {
                        let newId = oldId + '_' + loopCounter;
                        $(this).attr('id', newId);

                        // Also update any labels that point to this ID
                        $newSet.find('label[for="' + oldId + '"]').attr('for', newId);
                    }
                }

                // Clear values for text inputs and textareas
                if ($(this).is('input[type="text"]') || $(this).is('textarea')) {
                    $(this).val('');
                    // Ensure the field is editable
                    $(this).prop('disabled', false);
                    $(this).prop('readonly', false);
                }

                // Uncheck checkboxes
                if ($(this).is('input[type="checkbox"]')) {
                    $(this).prop('checked', false);
                }

                // Reset dropdowns to default
                if ($(this).is('select')) {
                    $(this).val('');
                }
            });

            // Reset dropdown values more explicitly and hide all conditional divs
            $newSet.find('select').each(function () {
                // Reset to first option or empty
                $(this).val('');
            });

            // Hide all conditional divs initially
            $newSet.find('div[id*="div_mf32a"], div[id*="div_mf32b"]').hide();
            $newSet.find('div[id*="div_of50a_"], div[id*="div_mf50f_"], div[id*="div_mf50k_"]').hide();
            $newSet.find('div[id*="div_of52a_"], div[id*="div_of52b_"], div[id*="div_of52d_"]').hide();
            $newSet.find('div[id*="div_mf59_"], div[id*="div_mf59f_"]').hide();
            $newSet.find('div[id*="check_mf59f_"], div[id*="check_mf50f_"]').hide();

            // Append the cloned and modified set to the container
            $newSet.appendTo('#loop-container');

            // Remove any previous event handlers
            $newSet.find('input, select, textarea').off();

            // Reinitialize event handlers for the new set
            initializeDropdowns($newSet);

            // Initialize datepickers for the new set with a small delay
            setTimeout(function () {
                initializeDatepickers($newSet);
            }, 100);

            initializeCurrencyFormatting($newSet);


            // Make sure all form controls are enabled and focus works
            enableFormControls($newSet);

            // Add a visual separator between form sets
            $newSet.prepend('<div class="set-separator" style="border-top: 2px dashed #ccc; margin: 15px 0; padding-top: 15px;"><strong>Entry #' + loopCounter + '</strong></div>');

            // Disable the add button if we've reached the maximum
            if (loopCounter >= MAX_LOOPS) {
                $('#renaa').prop('disabled', true);
                $('#renaa').css('opacity', '0.5');
            }
        });

        // Handler to remove the last added set - Changed to an anchor tag
        $('#renaa').after('<a href="#" id="remove-last-set" style="margin-left: 10px;">Remove Last Set</a>');

        // Handler for remove link
        $('#remove-last-set').on('click', function (e) {
            e.preventDefault();
            if (loopCounter > 1) {
                $('#loop-set-' + loopCounter).remove();
                loopCounter--;

                // Re-enable the add button if we're below the maximum
                if (loopCounter < MAX_LOOPS) {
                    $('#renaa').prop('disabled', false);
                    $('#renaa').css('opacity', '1');
                }
            }
        });
        function checkForExistingData() {
            const idHeaders = $('#id').val();

            if (!idHeaders)
                return;

            $.ajax({
                url: 'SCMf21List',
                type: 'GET',
                data: {id: idHeaders},
                dataType: 'json',
                success: function (data) {
                    // Hitung berapa banyak tag _mf21_ untuk trigger klik #renaa
                    const mf21Tags = data.filter(tag => tag.tagName.includes("_mf21_"));

                    // Trigger klik #renaa sebanyak jumlah mf21 tags - 1 (karena 1 sudah ada)
                    const toTrigger = mf21Tags.length > 1 ? mf21Tags.length - 1 : 0;
                    for (let i = 0; i < toTrigger; i++) {
                        $("#renaa").trigger("click");
                    }

                    // Karena klik #renaa asyncronous, kita tunda isi data input sampai elemen muncul
                    // Bisa pakai setTimeout sederhana (tweak sesuai kebutuhan)
                    setTimeout(() => {
                        fillInputs(data);
                        validate_rule();
                    }, 500);
                },
                error: function (xhr, status, error) {
                    console.error("Gagal ambil data:", error);
                }
            });
        }

        function fillInputs(data) {
            data.forEach(tag => {
                const input = document.getElementById(tag.tagName) || document.querySelector(`[name="${tag.tagName}"]`);
                if (input) {
                    input.value = tag.detail;
                } else {
                    console.warn(`Input dengan id/name ${tag.tagName} tidak ditemukan`);
                }
            });
        }


        // Function to populate a loop with existing data
        function populateLoopData(loopIndex) {
            // The actual implementation depends on how your data is stored
            // For this example, I'll assume you're storing the data in data attributes or hidden fields

            // Get the loop container
            const $loopContainer = $('#loop-set-' + loopIndex);
            if (!$loopContainer.length)
                return;

            // Find all input, select, textarea elements in this loop
            $loopContainer.find('input, select, textarea').each(function () {
                const id = $(this).attr('id');
                if (!id)
                    return;

                // Try to find a matching data element for this field
                // The implementation depends on how your data is stored
                // Example: data might be in <input type="hidden" id="data_2_fieldname" value="value">
                const dataElementId = 'data_' + loopIndex + '_' + id.replace(/^.*_([^_]+)$/, '$1');
                const $dataElement = $('#' + dataElementId);

                if ($dataElement.length) {
                    const value = $dataElement.val();

                    // Set the value appropriately based on element type
                    if ($(this).is('input[type="checkbox"]')) {
                        $(this).prop('checked', value === 'true' || value === '1');
                    } else if ($(this).is('select')) {
                        $(this).val(value);
                        // Trigger change to show/hide conditional sections
                        $(this).trigger('change');
                    } else {
                        $(this).val(value);
                    }
                }
            });

            // Ensure dropdowns trigger their change events to show/hide conditional content
            $loopContainer.find('select[id*="type_"]').each(function () {
                $(this).trigger('change');
            });

            // If there are checkboxes that control visibility of other elements, trigger their change events
            $loopContainer.find('input[type="checkbox"][id*="name_address_checkbox"]').each(function () {
                $(this).trigger('change');
            });
        }
    });

// Function to initialize dropdown change events
    function initializeDropdowns($container) {
        // Handle MF32 dropdown
        $container.find('select[id*="type_mf32_amount_collected"]').on('change', function () {
            let selectedValue = $(this).val();
            let divA = $(this).closest('.form-row').find('div[id*="div_mf32a"]');
            let divB = $(this).closest('.form-row').find('div[id*="div_mf32b"]');

            divA.hide();
            divB.hide();

            if (selectedValue === 'a') {
                divA.show();
            } else if (selectedValue === 'b') {
                divB.show();
            }
        });

        // Handle OF50 dropdown
        $container.find('select[id*="type_of50_payer"]').on('change', function () {
            let selectedValue = $(this).val();
            let formRow = $(this).closest('.form-row');

            // Hide all OF50 related divs in this container
            formRow.find('div[id*="div_of50a_"], div[id*="div_mf50f_"], div[id*="div_mf50k_"]').hide();

            if (selectedValue === 'a') {
                formRow.find('div[id*="div_of50a_"]').show();
            } else if (selectedValue === 'f') {
                formRow.find('div[id*="div_mf50f_"]').show();
            } else if (selectedValue === 'k') {
                formRow.find('div[id*="div_mf50k_"]').show();
            }
        });

        // Handle OF52 dropdown
        $container.find('select[id*="type_of52_Sender_of_Cash_Letter"]').on('change', function () {
            let selectedValue = $(this).val();
            let formRow = $(this).closest('.form-row');

            // Hide all OF52 related divs in this container
            formRow.find('div[id*="div_of52a_"], div[id*="div_of52b_"], div[id*="div_of52d_"]').hide();

            if (selectedValue === 'a') {
                formRow.find('div[id*="div_of52a_"]').show();
            } else if (selectedValue === 'b') {
                formRow.find('div[id*="div_of52b_"]').show();
            } else if (selectedValue === 'd') {
                formRow.find('div[id*="div_of52d_"]').show();
            }
        });

        // Handle MF59 dropdown
        $container.find('select[id*="type_of59_59a_"]').on('change', function () {
            let selectedValue = $(this).val();
            let formRow = $(this).closest('.form-row');

            // Hide all MF59 related divs in this container
            formRow.find('div[id*="div_mf59_"], div[id*="div_mf59f_"]').hide();

            if (selectedValue === '59') {
                formRow.find('div[id*="div_mf59_"]').show();
            } else if (selectedValue === '59f') {
                formRow.find('div[id*="div_mf59f_"]').show();
            }
        });

        // Handle checkboxes for the address details sections
        $container.find('input[type="checkbox"][id*="name_address_checkbox_2"]').on('change', function () {
            if ($(this).is(':checked')) {
                $(this).closest('div').find('div[id*="check_mf59f_2"]').show();
            } else {
                $(this).closest('div').find('div[id*="check_mf59f_2"]').hide();
            }
        });

        $container.find('input[type="checkbox"][id*="name_address_checkbox_3"]').on('change', function () {
            if ($(this).is(':checked')) {
                $(this).closest('div').find('div[id*="check_mf59f_3"]').show();
            } else {
                $(this).closest('div').find('div[id*="check_mf59f_3"]').hide();
            }
        });

        $container.find('input[type="checkbox"][id*="name_address_checkbox_4"]').on('change', function () {
            if ($(this).is(':checked')) {
                $(this).closest('div').find('div[id*="check_mf59f_4"]').show();
            } else {
                $(this).closest('div').find('div[id*="check_mf59f_4"]').hide();
            }
        });

        // Similarly for OF50 checkboxes
        $container.find('input[type="checkbox"][id*="name_address_checkbox_2_50"]').on('change', function () {
            if ($(this).is(':checked')) {
                $(this).closest('div').find('div[id*="check_mf50f_2"]').show();
            } else {
                $(this).closest('div').find('div[id*="check_mf50f_2"]').hide();
            }
        });

        $container.find('input[type="checkbox"][id*="name_address_checkbox_3_50"]').on('change', function () {
            if ($(this).is(':checked')) {
                $(this).closest('div').find('div[id*="check_mf50f_3"]').show();
            } else {
                $(this).closest('div').find('div[id*="check_mf50f_3"]').hide();
            }
        });

        $container.find('input[type="checkbox"][id*="name_address_checkbox_4_50"]').on('change', function () {
            if ($(this).is(':checked')) {
                $(this).closest('div').find('div[id*="check_mf50f_4"]').show();
            } else {
                $(this).closest('div').find('div[id*="check_mf50f_4"]').hide();
            }
        });

        // Trigger change events for all dropdowns to set correct initial state
        $container.find('select[id*="type_mf32_amount_collected"]').trigger('change');
        $container.find('select[id*="type_of50_payer"]').trigger('change');
        $container.find('select[id*="type_of52_Sender_of_Cash_Letter"]').trigger('change');
        $container.find('select[id*="type_of59_59a_"]').trigger('change');
    }

// Function to initialize datepickers for date fields
    function initializeDatepickers($container) {
        // Remove any existing datepicker instances first
        $container.find('input').each(function () {
            if ($(this).hasClass('hasDatepicker')) {
                $(this).datepicker('destroy');
            }
        });

        // Find all input fields and check their ID/name for date patterns
        $container.find('input[type="text"]').each(function () {
            let fieldId = $(this).attr('id') || '';
            let fieldName = $(this).attr('name') || '';

            // Check if ID or name contains the date field patterns
            if (fieldId.includes('mf30_date_of_issue') || fieldName.includes('mf30_date_of_issue') ||
                    fieldId.includes('mf32a_date') || fieldName.includes('mf32a_date')) {

                console.log('Initializing datepicker for field:', fieldId || fieldName); // Debug log

                $(this).datepicker({
                    dateFormat: "ymmdd",
                });
            }
        });

        // Alternative approach using attribute selectors that handle special characters
        try {
            // Use more specific selectors for the exact patterns
            $container.find('input[id*="mf30_date_of_issue"], input[name*="mf30_date_of_issue"]').each(function () {
                if (!$(this).hasClass('hasDatepicker')) {
                    console.log('Found mf30_date_of_issue field:', $(this).attr('id') || $(this).attr('name'));
                    $(this).datepicker({
                        dateFormat: "ymmdd"
                    }, new Date());
                }
            });

            $container.find('input[id*="mf32a_date"], input[name*="mf32a_date"]').each(function () {
                if (!$(this).hasClass('hasDatepicker')) {
                    console.log('Found mf32a_date field:', $(this).attr('id') || $(this).attr('name'));
                    $(this).datepicker({
                        dateFormat: "ymmdd"
                    }, new Date());
                }
            });
        } catch (e) {
            console.error('Error in datepicker selector:', e);
        }
    }

// Function to ensure all form controls are enabled
    function enableFormControls($container) {
        $container.find('input, select, textarea').each(function () {
            $(this).prop('disabled', false);
            $(this).prop('readonly', false);

            // Re-bind focus and click events
            $(this).on('focus click', function (e) {
                e.stopPropagation();
            });
        });
    }

    function initializeCurrencyFormatting($container) {
        // Find all amount input fields in the container
        $container.find('input[id*="_amount"]').each(function () {
            const $input = $(this);
            const inputId = $input.attr('id');
            
            // Create or update the currency display element
            let $currencyDisplay = $input.siblings('.currency-display');
            if ($currencyDisplay.length === 0) {
                $currencyDisplay = $('<span class="currency-display" style="margin-left: 50px; font-size: 10px; color: red;"></span>');
                $input.after($currencyDisplay);
            }

            // Update currency display on input change
            $input.on('input blur', function () {
                updateCurrencyDisplay(this);
            });

            // Initial currency display update
            updateCurrencyDisplay(this);
        });
    }

    // Function to update currency display
    function updateCurrencyDisplay(inputElement) {
        const $input = $(inputElement);
        const value = $input.val();
        const $currencyDisplay = $input.siblings('.currency-display');
        
        if (value && value.trim() !== '') {
            try {
                const number = value.replace(',', '.');
                const numberF = parseFloat(number);
                
                if (!isNaN(numberF)) {
                    const nominal = formatUang(numberF, "");
                    //$currencyDisplay.html(nominal);
                } else {
                   // $currencyDisplay.html('');
                }
            } catch (e) {
                $currencyDisplay.html('');
            }
        } else {
            $currencyDisplay.html('');
        }
    }

    // Currency formatting function
    function formatUang(n, currency) {
        if (isNaN(n)) return '';
        return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
    }

</script>
