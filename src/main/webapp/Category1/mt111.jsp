<%-- 
    Document   : mt111
    Created on : Aug 21, 2025, 9:32:54 AM
    Author     : mslam
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MT111 Request for Stop Payment of a Cheque</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; background:#f9f9f9; }
        .form-row { margin-bottom: 10px; display:flex; align-items:center; }
        .label_body { width: 60px; font-weight: bold; }
        .label { width: 200px; text-align:right; margin-right:10px; }
        .label a { color:red; }
        input, textarea, select { padding:5px; border:1px solid #999; border-radius:4px; }
        input.mandatory, textarea.mandatory, select.mandatory { border: 1px solid #666; }
        .tabs { list-style: none; margin: 0; padding: 0; display: flex; }
        .tabs li { margin-right: 10px; }
        .tabs a { text-decoration: none; padding: 5px 10px; border: 1px solid #ccc; border-radius: 4px; }
        .tabcontent { display: none; }
        .tabcontent.active { display: block; }

        .form-container {
            border:1px solid #ccc;
            border-radius:6px;
            overflow:hidden;  
            background:#fff;
            margin-top:10px;
        }

        .form-body { 
            padding:15px; 
            background:#fff; 
        }

        .footer {
            padding:12px;
            background:#2a7d80; 
            display:flex;
            justify-content:flex-start;
            gap:10px;
            border-top:1px solid #ccc;
        }

        .footer button {
            padding:8px 18px; 
            border:1px solid #aaa; 
            border-radius:4px;
            background:#f0f0f0; 
            color:#000; 
            font-weight:bold; 
            cursor:pointer;
        }
        .footer button:hover { background:#e0e0e0; }
    </style>
</head>
<body>

<div id="isi">

    <div id="judul"><h2>MT 111 Request for Stop Payment of a Cheque</h2></div>

    <form id="form1" method="post" 
          action="MT111Servlet"
          autocomplete="off"
          onsubmit="return confirm('Do you want to save this MT data?');">

        <input type="hidden" name="messageType" value="111"/>

        <ul class="tabs">
            <li><a href="#" rel="view1">Header</a></li>
            <li><a href="#" rel="view2">Body</a></li>
            <li><a href="#" rel="view3">Comment</a></li>
            <li><a href="#" rel="view4">Histories</a></li>
            <li><a href="#" rel="view5">Log MT Text</a></li>
            <li><a href="#" rel="view6">MT Relation</a></li>
            <li><a href="#" rel="view7">Translation</a></li>
        </ul>

        <div class="form-container">
            <div class="form-body tabcontents">
                <div id="view2" class="tabcontent active">

                    <!-- MF20 -->
                    <div class="form-row">
                        <span class="label_body">MF20</span>
                        <span class="label"><a>*</a>Sender's Reference</span>
                        <input type="text" name="_010_mf20_sender_reference"
                               id="_010_mf20_sender_reference"
                               class="mandatory" maxlength="16"/>
                    </div>
                    <hr/>

                    <!-- MF21 -->
                    <div class="form-row">
                        <span class="label_body">MF21</span>
                        <span class="label"><a>*</a>Cheque Number</span>
                        <input type="text" name="_020_mf21_chequenumber"
                               id="_020_mf21_chequenumber"
                               class="mandatory" maxlength="16"/>
                    </div>
                    <hr/>

                    <!-- MF30 Datepicker -->
                    <div class="form-row">
                        <span class="label_body">MF30</span>
                        <span class="label"><a>*</a>Date of Issue</span>
                        <input type="text" name="_030_mf30_date" id="_030_mf30_date"
                               class="mandatory" maxlength="6"/>
                    </div>
                    <hr/>

                    <!-- MF32a/b Amount -->
                    <div class="form-row">
                        <span class="label_body">MF32a</span>
                        <span class="label"><a>*</a>Amount</span>
                        <select id="type_mf32_" name="type_mf32_" class="mandatory">
                            <option value="" selected>Choose Type</option>
                            <option value="32a">F32A - Date - Currency - Amount</option>
                            <option value="32b">F32B - Currency - Amount</option>
                        </select>
                    </div>

                    <!-- MF32A Group -->
                    <div id="mf32a_group" style="display:none;">
                        <div class="form-row"><span class="label_body">MF32A</span>
                            <span class="label">Date</span>
                            <input type="text" name="_040_mf32a_date" id="_040_mf32a_date" maxlength="6"/>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span>
                            <span class="label">Currency</span>
                            <input type="text" name="_041_mf32a_currency" id="_041_mf32a_currency"
                                   maxlength="3" style="text-transform:uppercase;"/>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span>
                            <span class="label">Amount</span>
                            <input type="text" name="_042_mf32a_amount" id="_042_mf32a_amount" maxlength="15"/>
                        </div>
                    </div>

                    <!-- MF32B Group -->
                    <div id="mf32b_group" style="display:none;">
                        <div class="form-row"><span class="label_body">MF32B</span>
                            <span class="label">Currency</span>
                            <input type="text" name="_043_mf32b_currency" id="_043_mf32b_currency"
                                   maxlength="3" style="text-transform:uppercase;"/>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span>
                            <span class="label">Amount</span>
                            <input type="text" name="_044_mf32b_amount" id="_044_mf32b_amount" maxlength="15"/>
                        </div>
                    </div>
                    <hr/>

                    <!-- OF52 Drawer Bank -->
                    <div class="form-row">
                        <span class="label_body">OF52a</span>
                        <span class="label">Drawer Bank</span>
                        <select id="type_of52_52a_" name="type_of52_52a_">
                            <option value="">Choose Type</option>
                            <option value="52a">F52A - Identifier Code</option>
                            <option value="52b">F52B - Location</option>
                            <option value="52d">F52D - Name & Address</option>
                        </select>
                    </div>
                    <div id="div_of52a_seq_b" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span>
                            <span class="label">Party Identifier</span>
                            <input type="text" name="_050_of52a_party_identifier" maxlength="37"/>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span>
                            <span class="label">Identifier Code</span>
                            <input type="text" name="_051_of52a_identifier_code" maxlength="11"/>
                        </div>
                    </div>
                    <div id="div_of52b_seq_b" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span>
                            <span class="label">Party Identifier</span>
                            <input type="text" name="_052_of52b_party_identifier" maxlength="37"/>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span>
                            <span class="label">Location</span>
                            <input type="text" name="_053_of52b_location" maxlength="35"/>
                        </div>
                    </div>
                    <div id="div_of52d_seq_b" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span>
                            <span class="label">Party Identifier</span>
                            <input type="text" name="_054_of52d_party_identifier" maxlength="37"/>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span>
                            <span class="label">Address</span>
                            <textarea name="_055_of52d_address" rows="3"></textarea>
                        </div>
                    </div>
                    <hr/>

                    <!-- OF59 Beneficiary -->
                    <div class="form-row">
                        <span class="label_body">OF59</span>
                        <span class="label">Beneficiary</span>
                        <input type="checkbox" id="beneficiary_checkbox" autocomplete="off"/>
                    </div>
                    <div id="check_of59" style="display:none;">
                        <div class="form-row"><span class="label_body">&nbsp;</span>
                            <span class="label">Account</span>
                            <input type="text" name="_060_of59_account" maxlength="34"/>
                        </div>
                        <div class="form-row"><span class="label_body">&nbsp;</span>
                            <span class="label">Name and Address</span>
                            <textarea name="_061_of59_name_address" rows="3" maxlength="140"></textarea>
                        </div>
                    </div>
                    <hr/>

                    <!-- OF75 Queries -->
                    <div class="form-row">
                        <span class="label_body">OF75</span>
                        <span class="label">Queries</span>
                        <textarea name="_070_of75_queries" rows="4" maxlength="210"></textarea>
                    </div>

                </div>
            </div>
            <div class="footer">
                <button type="submit">Save</button>
                <button type="button" onclick="window.location.href='../index.jsp'">Back</button>
            </div>
        </div>
    </form>
</div>

<%@ include file="rule/validate_rule_mt111.jsp" %>

<script>
    $(function(){
        $("#_030_mf30_date, #_040_mf32a_date").datepicker({ dateFormat: "yymmdd" });
        $("#beneficiary_checkbox").prop("checked", false);
        $("#check_of59").hide();
        $("#beneficiary_checkbox").change(function(){
            if ($(this).is(":checked")) {
                $("#check_of59").show();
            } else {
                $("#check_of59").hide();
            }
        });

        $("#type_of52_52a_").val("").trigger("change");
    });
</script>
</body>
</html>






